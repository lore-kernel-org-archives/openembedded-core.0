Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3FB7F697
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 18:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5C81F40BF3;
	Thu, 17 Oct 2019 18:42:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jPIUpf8IbBLF; Thu, 17 Oct 2019 18:42:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3D94D40BE4;
	Thu, 17 Oct 2019 18:42:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 77E4E17429F; Thu, 17 Oct 2019 14:42:22 -0400 (EDT)
Date: Thu, 17 Oct 2019 14:42:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20191017184222.GN17412@denix.org>
References: <1571325700-5138-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1571325700-5138-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH] Revert "OpkgPM: use --add-ignore-recommends to process BAD_RECOMMENDATIONS"
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
X-List-Received-Date: Thu, 17 Oct 2019 18:42:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thank you for this revert! I've been pulling my hair out past couple days 
figuring out why BAD_RECOMMENDATIONS stopped working for us. This fixed it.

-- 
Denys


On Thu, Oct 17, 2019 at 08:21:40AM -0700, Armin Kuster wrote:
> This reverts commit e8cd30ba6cec854d85c7ad47edc208107858a5d7.
> 
> This backport introduced an issue not seen the AB QA.
> 
> Issue can be seen if
> BAD_RECOMMENDATIONS_append = " udev-hwdb" is used
> ---
>  meta/lib/oe/package_manager.py | 41 +++++++++++++++++++++++++++++++++++++++--
>  meta/lib/oe/rootfs.py          |  2 ++
>  2 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 7d88048..882e7c4 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -1329,8 +1329,6 @@ class OpkgPM(OpkgDpkgPM):
>          cmd = "%s %s" % (self.opkg_cmd, self.opkg_args)
>          for exclude in (self.d.getVar("PACKAGE_EXCLUDE") or "").split():
>              cmd += " --add-exclude %s" % exclude
> -        for bad_recommendation in (self.d.getVar("BAD_RECOMMENDATIONS") or "").split():
> -            cmd += " --add-ignore-recommends %s" % bad_recommendation
>          cmd += " install "
>          cmd += " ".join(pkgs)
>  
> @@ -1399,6 +1397,45 @@ class OpkgPM(OpkgDpkgPM):
>      def list_installed(self):
>          return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
>  
> +    def handle_bad_recommendations(self):
> +        bad_recommendations = self.d.getVar("BAD_RECOMMENDATIONS") or ""
> +        if bad_recommendations.strip() == "":
> +            return
> +
> +        status_file = os.path.join(self.opkg_dir, "status")
> +
> +        # If status file existed, it means the bad recommendations has already
> +        # been handled
> +        if os.path.exists(status_file):
> +            return
> +
> +        cmd = "%s %s info " % (self.opkg_cmd, self.opkg_args)
> +
> +        with open(status_file, "w+") as status:
> +            for pkg in bad_recommendations.split():
> +                pkg_info = cmd + pkg
> +
> +                try:
> +                    output = subprocess.check_output(pkg_info.split(), stderr=subprocess.STDOUT).strip().decode("utf-8")
> +                except subprocess.CalledProcessError as e:
> +                    bb.fatal("Cannot get package info. Command '%s' "
> +                             "returned %d:\n%s" % (pkg_info, e.returncode, e.output.decode("utf-8")))
> +
> +                if output == "":
> +                    bb.note("Ignored bad recommendation: '%s' is "
> +                            "not a package" % pkg)
> +                    continue
> +
> +                for line in output.split('\n'):
> +                    if line.startswith("Status:"):
> +                        status.write("Status: deinstall hold not-installed\n")
> +                    else:
> +                        status.write(line + "\n")
> +
> +                # Append a blank line after each package entry to ensure that it
> +                # is separated from the following entry
> +                status.write("\n")
> +
>      def dummy_install(self, pkgs):
>          """
>          The following function dummy installs pkgs and returns the log of output.
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index aa9fb2e..e5512d0 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -879,6 +879,8 @@ class OpkgRootfs(DpkgOpkgRootfs):
>  
>          self.pm.update()
>  
> +        self.pm.handle_bad_recommendations()
> +
>          if self.progress_reporter:
>              self.progress_reporter.next_stage()
>  
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

