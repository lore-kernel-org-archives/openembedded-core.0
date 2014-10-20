Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 35237607A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 08:05:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Oct 2014 01:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,754,1406617200"; d="scan'208";a="607973761"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.104.113])
	by fmsmga001.fm.intel.com with ESMTP; 20 Oct 2014 01:05:15 -0700
Date: Mon, 20 Oct 2014 11:05:15 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20141020080515.GA7633@lpalcu-linux>
References: <cover.1410257258.git.liezhi.yang@windriver.com>
	<4e8cdaffb79ea56a3644ede8af0cacbefd167197.1410257258.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4e8cdaffb79ea56a3644ede8af0cacbefd167197.1410257258.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rootfs.py: fix PRE/POSTPROCESS_COMMANDS for rpm and deb
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
X-List-Received-Date: Mon, 20 Oct 2014 08:05:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 09, 2014 at 03:16:08AM -0700, Robert Yang wrote:
> The rpm didn't run RPM_PREPROCESS_COMMANDS or RPM_POSTPROCESS_COMMANDS,
> the similar to deb, this patch fix the problem.
I'm not sure I understand this... The pre/post process commands are run
in the abstract class Rootfs create() method, which is inherited by all
backends. The create_rootfs() function calls the create() method for
each backend. So, these have to execute. Unless, there is something else
going on, which has to be properly fixed.

> 
> And fix a typo:
> DEB_POSTPROCESS_COMMAND -> DEB_POSTPROCESS_COMMANDS
this change is ok.

> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/lib/oe/rootfs.py |   14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 0424a01..ed2af80 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -295,10 +295,14 @@ class RpmRootfs(Rootfs):
>  
>      def _create(self):
>          pkgs_to_install = self.manifest.parse_initial_manifest()
> +        rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS', True)
> +        rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS', True)
>  
>          # update PM index files
>          self.pm.write_index()
>  
> +        execute_pre_post_process(self.d, rpm_pre_process_cmds)
> +
>          self.pm.dump_all_available_pkgs()
>  
>          if self.inc_rpm_image_gen == "1":
> @@ -320,6 +324,8 @@ class RpmRootfs(Rootfs):
>  
>          self.pm.install_complementary()
>  
> +        execute_pre_post_process(self.d, rpm_post_process_cmds)
> +
>          self._log_check()
>  
>          if self.inc_rpm_image_gen == "1":
> @@ -401,6 +407,8 @@ class DpkgRootfs(Rootfs):
>  
>      def _create(self):
>          pkgs_to_install = self.manifest.parse_initial_manifest()
> +        deb_pre_process_cmds = self.d.getVar('DEB_PREPROCESS_COMMANDS', True)
> +        deb_post_process_cmds = self.d.getVar('DEB_POSTPROCESS_COMMANDS', True)
>  
>          alt_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/alternatives")
>          bb.utils.mkdirhier(alt_dir)
> @@ -408,6 +416,8 @@ class DpkgRootfs(Rootfs):
>          # update PM index files
>          self.pm.write_index()
>  
> +        execute_pre_post_process(self.d, deb_pre_process_cmds)
> +
>          self.pm.update()
>  
>          for pkg_type in self.install_order:
> @@ -423,9 +433,11 @@ class DpkgRootfs(Rootfs):
>  
>          self.pm.run_pre_post_installs()
>  
> +        execute_pre_post_process(self.d, deb_post_process_cmds)
> +
>      @staticmethod
>      def _depends_list():
> -        return ['DEPLOY_DIR_DEB', 'DEB_SDK_ARCH', 'APTCONF_TARGET', 'APT_ARGS', 'DPKG_ARCH', 'DEB_PREPROCESS_COMMANDS', 'DEB_POSTPROCESS_COMMAND']
> +        return ['DEPLOY_DIR_DEB', 'DEB_SDK_ARCH', 'APTCONF_TARGET', 'APT_ARGS', 'DPKG_ARCH', 'DEB_PREPROCESS_COMMANDS', 'DEB_POSTPROCESS_COMMANDS']
>  
>      def _get_delayed_postinsts(self):
>          pkg_list = []
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

