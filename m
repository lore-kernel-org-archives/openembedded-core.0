Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB4171A7B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 18:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 9468D31C21BC;
	Tue,  6 Dec 2016 19:20:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 40PuV8R1rEy2; Tue,  6 Dec 2016 19:20:56 +0100 (CET)
Received: from [172.22.22.61] (55d40c51.access.ecotel.net [85.212.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 9996431C21CC;
	Tue,  6 Dec 2016 19:20:55 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-21-git-send-email-obi@opendreambox.org>
	<CAJTo0Lbx_TKJgWRnYGHHAja2uT8CNG+d=wyFJ-aBiZJ3zmWyFg@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <e18eec82-26dc-3e09-74ea-82e1dcae8fea@opendreambox.org>
Date: Tue, 6 Dec 2016 19:20:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbx_TKJgWRnYGHHAja2uT8CNG+d=wyFJ-aBiZJ3zmWyFg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/33] package_manager/deb: let apt-get handle postinst scripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2016 18:20:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06.12.2016 18:26, Burton, Ross wrote:
> Can you elaborate on why the old code can be deleted?

With all required environment variables and configuration options in
apt.conf in place, apt-get is able to install packages offline, i.e.
when creating the rootfs, including the execution of postinst scripts
and updating the package database. This is new behaviour.

At the time the deleted code would have executed, its work was already
done by apt-get.

> 
> Ross
> 
> On 6 December 2016 at 11:49, Andreas Oberritter <obi@opendreambox.org
> <mailto:obi@opendreambox.org>> wrote:
> 
>     Signed-off-by: Andreas Oberritter <obi@opendreambox.org
>     <mailto:obi@opendreambox.org>>
>     ---
>      meta/lib/oe/package_manager.py | 86
>     ++++--------------------------------------
>      meta/lib/oe/rootfs.py          |  6 +--
>      2 files changed, 9 insertions(+), 83 deletions(-)
> 
>     diff --git a/meta/lib/oe/package_manager.py
>     b/meta/lib/oe/package_manager.py
>     index 4ef4f6d..12dff20 100644
>     --- a/meta/lib/oe/package_manager.py
>     +++ b/meta/lib/oe/package_manager.py
>     @@ -1959,84 +1959,6 @@ class DpkgPM(OpkgDpkgPM):
> 
>              self.indexer = DpkgIndexer(self.d, self.deploy_dir)
> 
>     -    """
>     -    This function will change a package's status in
>     /var/lib/dpkg/status file.
>     -    If 'packages' is None then the new_status will be applied to all
>     -    packages
>     -    """
>     -    def mark_packages(self, status_tag, packages=None):
>     -        status_file = self.target_rootfs + "/var/lib/dpkg/status"
>     -
>     -        with open(status_file, "r") as sf:
>     -            with open(status_file + ".tmp", "w+") as tmp_sf:
>     -                if packages is None:
>     -                    tmp_sf.write(re.sub(r"Package:
>     (.*?)\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)",
>     -                                        r"Package: \1\n\2Status:
>     \3%s" % status_tag,
>     -                                        sf.read()))
>     -                else:
>     -                    if type(packages).__name__ != "list":
>     -                        raise TypeError("'packages' should be a
>     list object")
>     -
>     -                    status = sf.read()
>     -                    for pkg in packages:
>     -                        status = re.sub(r"Package:
>     %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
>     -                                        r"Package: %s\n\1Status:
>     \2%s" % (pkg, status_tag),
>     -                                        status)
>     -
>     -                    tmp_sf.write(status)
>     -
>     -        os.rename(status_file + ".tmp", status_file)
>     -
>     -    """
>     -    Run the pre/post installs for package "package_name". If
>     package_name is
>     -    None, then run all pre/post install scriptlets.
>     -    """
>     -    def run_pre_post_installs(self, package_name=None):
>     -        info_dir = self.target_rootfs + "/var/lib/dpkg/info"
>     -        ControlScript = collections.namedtuple("ControlScript",
>     ["suffix", "name", "argument"])
>     -        control_scripts = [
>     -                ControlScript(".preinst", "Preinstall", "install"),
>     -                ControlScript(".postinst", "Postinstall", "configure")]
>     -        status_file = self.target_rootfs + "/var/lib/dpkg/status"
>     -        installed_pkgs = []
>     -
>     -        with open(status_file, "r") as status:
>     -            for line in status.read().split('\n'):
>     -                m = re.match("^Package: (.*)", line)
>     -                if m is not None:
>     -                    installed_pkgs.append(m.group(1))
>     -
>     -        if package_name is not None and not package_name in
>     installed_pkgs:
>     -            return
>     -
>     -        os.environ['D'] = self.target_rootfs
>     -        os.environ['OFFLINE_ROOT'] = self.target_rootfs
>     -        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
>     -        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
>     -        os.environ['INTERCEPT_DIR'] =
>     os.path.join(self.d.getVar('WORKDIR', True),
>     -                                                   "intercept_scripts")
>     -        os.environ['NATIVE_ROOT'] =
>     self.d.getVar('STAGING_DIR_NATIVE', True)
>     -
>     -        failed_pkgs = []
>     -        for pkg_name in installed_pkgs:
>     -            for control_script in control_scripts:
>     -                p_full = os.path.join(info_dir, pkg_name +
>     control_script.suffix)
>     -                if os.path.exists(p_full):
>     -                    try:
>     -                        bb.note("Executing %s for package: %s ..." %
>     -                                 (control_script.name.lower(),
>     pkg_name))
>     -                        subprocess.check_output([p_full,
>     control_script.argument],
>     -                                stderr=subprocess.STDOUT)
>     -                    except subprocess.CalledProcessError as e:
>     -                        bb.note("%s for package %s failed with
>     %d:\n%s" %
>     -                                (control_script.name
>     <http://control_script.name>, pkg_name, e.returncode,
>     -                                    e.output.decode("utf-8")))
>     -                        failed_pkgs.append(pkg_name)
>     -                        break
>     -
>     -        if len(failed_pkgs):
>     -            self.mark_packages("unpacked", failed_pkgs)
>     -
>          def update(self):
>              os.environ['APT_CONFIG'] = self.apt_conf_file
> 
>     @@ -2058,6 +1980,14 @@ class DpkgPM(OpkgDpkgPM):
> 
>              os.environ['APT_CONFIG'] = self.apt_conf_file
> 
>     +        os.environ['D'] = self.target_rootfs
>     +        os.environ['OFFLINE_ROOT'] = self.target_rootfs
>     +        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
>     +        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
>     +        os.environ['INTERCEPT_DIR'] =
>     os.path.join(self.d.getVar('WORKDIR', True),
>     +                                                   "intercept_scripts")
>     +        os.environ['NATIVE_ROOT'] =
>     self.d.getVar('STAGING_DIR_NATIVE', True)
>     +
>              cmd = "%s %s install --force-yes --allow-unauthenticated
>     %s" % \
>                    (self.apt_get_cmd, self.apt_args, ' '.join(pkgs))
> 
>     diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
>     index a348b97..4c82456 100644
>     --- a/meta/lib/oe/rootfs.py
>     +++ b/meta/lib/oe/rootfs.py
>     @@ -685,10 +685,6 @@ class DpkgRootfs(DpkgOpkgRootfs):
> 
>              self.pm.fix_broken_dependencies()
> 
>     -        self.pm.mark_packages("installed")
>     -
>     -        self.pm.run_pre_post_installs()
>     -
>              execute_pre_post_process(self.d, deb_post_process_cmds)
> 
>              if self.progress_reporter:
>     @@ -708,7 +704,7 @@ class DpkgRootfs(DpkgOpkgRootfs):
>              return self._save_postinsts_common(dst_postinst_dir,
>     src_postinst_dir)
> 
>          def _handle_intercept_failure(self, registered_pkgs):
>     -        self.pm.mark_packages("unpacked", registered_pkgs.split())
>     +        pass
> 
>          def _log_check(self):
>              self._log_check_warn()
>     --
>     2.7.4
> 
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 


