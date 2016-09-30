Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 51D08605C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 20:00:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 30 Sep 2016 13:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,274,1473145200"; d="scan'208";a="885563876"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.141])
	([10.219.5.141])
	by orsmga003.jf.intel.com with ESMTP; 30 Sep 2016 13:00:02 -0700
To: David Vincent <freesilicon@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <CAKRNOGzXLf_kfousHniKin-qqs2TURwOQQptDJTMHA9Gqe5now@mail.gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <977b751d-274a-43f4-516b-3827e7f71d37@linux.intel.com>
Date: Fri, 30 Sep 2016 15:03:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAKRNOGzXLf_kfousHniKin-qqs2TURwOQQptDJTMHA9Gqe5now@mail.gmail.com>
Cc: "Plascencia, Daniela" <daniela.plascencia@intel.com>
Subject: Re: [PATCH][jethro] rootfs: Modify RPM installation
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
X-List-Received-Date: Fri, 30 Sep 2016 20:00:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 07/08/2016 02:57 AM, David Vincent wrote:
> When using a custom RPM data directory instead of the default dir
> '/var/lib/rpm', the final image did not contain any of the database
> files in the expected location. This commit takes into account the
> 'rpmlibdir' variable set into 'rootfs_rpm.bbclass'.
>
> Signed-off-by: David Vincent <freesilicon@gmail.com>
> ---
>   meta/lib/oe/package_manager.py | 26 +++++++++++++++-----------
>   meta/lib/oe/rootfs.py          |  3 ++-
>   2 files changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index b9fa6d8..83c9858 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -302,7 +302,8 @@ class RpmPkgsList(PkgsList):
>           super(RpmPkgsList, self).__init__(d, rootfs_dir)
>
>           self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
> -        self.image_rpmlib = os.path.join(self.rootfs_dir, 'var/lib/rpm')
> +        self.rpm_libdir = self.d.getVar('rpmlibdir', True)
> +        self.image_rpmlib = os.path.join(self.rootfs_dir, self.rpm_libdir[1:])
>
>           self.ml_prefix_list, self.ml_os_list = \
>               RpmIndexer(d,
> rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
> @@ -369,7 +370,7 @@ class RpmPkgsList(PkgsList):
>               return self._list_pkg_deps()
>
>           cmd = self.rpm_cmd + ' --root ' + self.rootfs_dir
> -        cmd += ' -D "_dbpath /var/lib/rpm" -qa'
> +        cmd += ' -D "_dbpath %s" -qa' % self.rpm_libdir
>           if self.rpm_version == 4:
>               cmd += " --qf '[%{NAME} %{ARCH} %{VERSION}\n]'"
>           else:
> @@ -670,7 +671,8 @@ class RpmPM(PackageManager):
>           self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
>                                                  self.task_name)
>           self.saved_rpmlib = self.d.expand('${T}/saved/%s' % self.task_name)
> -        self.image_rpmlib = os.path.join(self.target_rootfs, 'var/lib/rpm')
> +        self.rpm_libdir = self.d.getVar('rpmlibdir', True)
> +        self.image_rpmlib = os.path.join(self.target_rootfs,
> self.rpm_libdir[1:])
the above line is not valid for a patcher like git-apply. Did you send 
the patch with git-send-email? It may be the case that the email client 
you are using it truncate this line.
>
>           if not os.path.exists(self.d.expand('${T}/saved')):
>               bb.utils.mkdirhier(self.d.expand('${T}/saved'))
> @@ -924,8 +926,8 @@ class RpmPM(PackageManager):
>           opt = "-qa"
>           if self.rpm_version == 4:
>               opt = "--initdb"
> -        cmd = "%s --root %s --dbpath /var/lib/rpm %s > /dev/null" % (
> -              self.rpm_cmd, self.target_rootfs, opt)
> +        cmd = "%s --root %s --dbpath %s %s > /dev/null" % (
> +              self.rpm_cmd, self.target_rootfs, self.rpm_libdir, opt)
>           try:
>               subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
>           except subprocess.CalledProcessError as e:
> @@ -934,8 +936,8 @@ class RpmPM(PackageManager):
>           # Import GPG key to RPM database of the target system
>           if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
>               pubkey_path = self.d.getVar('RPM_GPG_PUBKEY', True)
> -            cmd = "%s --root %s --dbpath /var/lib/rpm --import %s >
> /dev/null" % (
> -                  self.rpm_cmd, self.target_rootfs, pubkey_path)
> +            cmd = "%s --root %s --dbpath %s --import %s > /dev/null" % (
> +                  self.rpm_cmd, self.target_rootfs, self.rpm_libdir,
> pubkey_path)
>               subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
>
>           # Configure smart
> @@ -943,7 +945,7 @@ class RpmPM(PackageManager):
>           bb.utils.remove(os.path.join(self.target_rootfs, 'var/lib/smart'),
>                           True)
>           self._invoke_smart('config --set rpm-root=%s' % self.target_rootfs)
> -        self._invoke_smart('config --set rpm-dbpath=/var/lib/rpm')
> +        self._invoke_smart('config --set rpm-dbpath=%s' % self.rpm_libdir)
>           self._invoke_smart('config --set rpm-extra-macros._var=%s' %
>                              self.d.getVar('localstatedir', True))
>           cmd = "config --set rpm-extra-macros._tmppath=/%s/tmp" %
> (self.install_dir_name)
> @@ -1179,7 +1181,7 @@ class RpmPM(PackageManager):
>           if not with_dependencies:
>               cmd = "%s -e --nodeps " % self.rpm_cmd
>               cmd += "--root=%s " % self.target_rootfs
> -            cmd += "--dbpath=/var/lib/rpm "
> +            cmd += "--dbpath=%s " % self.rpm_libdir
>               cmd += "--define='_cross_scriptlet_wrapper %s' " % \
>                      self.scriptlet_wrapper
>               cmd += "--define='_tmppath /%s/tmp' %s" %
> (self.install_dir_name, ' '.join(pkgs))
> @@ -1333,7 +1335,8 @@ class RpmPM(PackageManager):
>           saved_dir = self.target_rootfs +
> self.d.expand('${sysconfdir}/rpm-postinsts/') + new_pkg
>
>           cmd = self.rpm_cmd + ' -q --scripts --root ' + self.target_rootfs
> -        cmd += ' --dbpath=/var/lib/rpm ' + new_pkg
> +        cmd += ' --dbpath=%s ' %  self.rpm_libdir
> +        cmd += new_pkg
>           cmd += ' | sed -n -e "/^postinstall scriptlet (using
> .*):$/,/^.* scriptlet (using .*):$/ {/.*/p}"'
>           cmd += ' | sed -e "/postinstall scriptlet (using \(.*\)):$/d"'
>           cmd += ' -e "/^.* scriptlet (using .*):$/d" > %s' % saved_dir
> @@ -1365,7 +1368,8 @@ class RpmPM(PackageManager):
>       '''
>       def unlock_rpm_db(self):
>           # Remove rpm db lock files
> -        rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.target_rootfs)
> +        rpm_db_locks = glob.glob('%s%s/__db.*' % (self.target_rootfs,
> +            self.rpm_libdir))
>           for f in rpm_db_locks:
>               bb.utils.remove(f, True)
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 18df22d..a4ee433 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -420,6 +420,7 @@ class RpmRootfs(Rootfs):
>
>       def _create(self):
>           pkgs_to_install = self.manifest.parse_initial_manifest()
> +        rpm_libdir = self.d.getVar('rpmlibdir', True)
>           rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS', True)
>           rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS', True)
>
> @@ -449,7 +450,7 @@ class RpmRootfs(Rootfs):
>
>           self.pm.install_complementary()
>
> -        self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm', '/var/lib/smart'])
> +        self._setup_dbg_rootfs(['/etc/rpm', rpm_libdir, '/var/lib/smart'])
>
>           execute_pre_post_process(self.d, rpm_post_process_cmds)
>


