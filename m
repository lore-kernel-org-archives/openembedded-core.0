Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A4E906EE10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 15:03:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Feb 2014 06:59:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,502,1389772800"; d="scan'208";a="457436287"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 18 Feb 2014 07:03:01 -0800
Date: Tue, 18 Feb 2014 17:03:01 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20140218150300.GB22316@lpalcu-linux>
References: <cover.1392716065.git.hongxu.jia@windriver.com>
	<228a24a4f36d6f6dc16858ad7233fef292c73985.1392716065.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <228a24a4f36d6f6dc16858ad7233fef292c73985.1392716065.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] rootfs.py: fix BAD_RECOMMENDATIONS for ipk incremental image generation
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
X-List-Received-Date: Tue, 18 Feb 2014 15:04:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2014 at 05:42:27PM +0800, Hongxu Jia wrote:
> While incremental image generation enabled and the previous image existed,
> if BAD_RECOMMENDATIONS is changed, the operation on the existed image is
> complicated, so remove the existed image in this situation.
> 
> The same with PACKAGE_EXCLUDE and NO_RECOMMENDATIONS.
> 
> [YOCTO #1894]
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/rootfs.py | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 5561bb9..3d7adf9 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -443,7 +443,7 @@ class OpkgRootfs(Rootfs):
>          self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True)
>  
>          self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN', True)
> -        if self.inc_opkg_image_gen != "1":
> +        if self._remove_existed_image():
>              bb.utils.remove(self.image_rootfs, True)
>              self.pm = OpkgPM(d,
>                               self.image_rootfs,
> @@ -546,6 +546,34 @@ class OpkgRootfs(Rootfs):
>                  bb.note('incremental removed: %s' % ' '.join(pkg_to_remove))
>                  self.pm.remove(pkg_to_remove)
>  
> +    '''
> +    Compare with previous (existed) image creation, if some conditions
> +    triggered, the previous (existed) image should be removed.
> +    The conditions included any of 'PACKAGE_EXCLUDE, NO_RECOMMENDATIONS
> +    and BAD_RECOMMENDATIONS' has been changed.
> +    '''
> +    def _remove_existed_image(self):
s/existed/existing/

Also in the comment above.

> +        # Incremental image creation is not enable
> +        if self.inc_opkg_image_gen != "1":
> +            return True
> +
> +        vars_list_dir = self.d.expand('${T}/vars_list')
s/vars_list_dir/vars_list_file/ in the line above and the code below.
Leaving this variable with a 'dir' suffix while we're opening a file for
reading/writing, is a little misleading.

> +
> +        old_vars_list = ""
> +        if os.path.exists(vars_list_dir):
> +            old_vars_list = open(vars_list_dir, 'r+').read()
> +
> +        new_vars_list = '%s:%s:%s\n' % \
> +                ((self.d.getVar('BAD_RECOMMENDATIONS', True) or '').strip(),
> +                 (self.d.getVar('NO_RECOMMENDATIONS', True) or '').strip(),
> +                 (self.d.getVar('PACKAGE_EXCLUDE', True) or '').strip())
> +        open(vars_list_dir, 'w+').write(new_vars_list)
> +
> +        if old_vars_list != new_vars_list:
> +            return True
> +
> +        return False
> +
>      def _create(self):
>          pkgs_to_install = self.manifest.parse_initial_manifest()
>          opkg_pre_process_cmds = self.d.getVar('OPKG_PREPROCESS_COMMANDS', True)
> -- 
> 1.8.1.2
> 

