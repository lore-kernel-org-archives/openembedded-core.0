Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA046B206
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 15:23:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 20 Feb 2014 07:23:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,512,1389772800"; d="scan'208";a="478515721"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2014 07:22:52 -0800
Date: Thu, 20 Feb 2014 17:22:51 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20140220152251.GD30981@lpalcu-linux>
References: <cover.1392877826.git.hongxu.jia@windriver.com>
	<462aa5e46663d9a7a47f69649e716dbecedb20f7.1392877826.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <462aa5e46663d9a7a47f69649e716dbecedb20f7.1392877826.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] rootfs.py: support BAD_RECOMMENDATIONS for ipk incremental image generation
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
X-List-Received-Date: Thu, 20 Feb 2014 15:23:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2014 at 03:06:55PM +0800, Hongxu Jia wrote:
> While incremental image generation enabled and the previous image is
> existed, if BAD_RECOMMENDATIONS is changed, the operation on the
> existing image is complicated, so remove the existing image in this
> situation.
> 
> The same with PACKAGE_EXCLUDE and NO_RECOMMENDATIONS.
> 
> [YOCTO #1894]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/rootfs.py | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 6120bce..80be490 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -445,7 +445,7 @@ class OpkgRootfs(Rootfs):
>          self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True)
>  
>          self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN', True) or ""
> -        if self.inc_opkg_image_gen != '1':
> +        if self._remove_existing_image():
>              bb.utils.remove(self.image_rootfs, True)
>              self.pm = OpkgPM(d,
>                               self.image_rootfs,
> @@ -595,6 +595,33 @@ class OpkgRootfs(Rootfs):
>                  bb.note('decremental removed: %s' % ' '.join(pkg_to_remove))
>                  self.pm.remove(pkg_to_remove)
>  
> +    '''
> +    Compare with previous existing image creation, if some conditions
> +    triggered, the previous existing image should be removed.
> +    The conditions include any of 'PACKAGE_EXCLUDE, NO_RECOMMENDATIONS
> +    and BAD_RECOMMENDATIONS' has been changed.
> +    '''
> +    def _remove_existing_image(self):
Since we're not removing the image, but the old rootfs, a better name
for this would be: _remove_old_rootfs().

> +        if self.inc_opkg_image_gen != "1":
> +            return True
> +
> +        vars_list_file = self.d.expand('${T}/vars_list')
> +
> +        old_vars_list = ""
> +        if os.path.exists(vars_list_file):
> +            old_vars_list = open(vars_list_file, 'r+').read()
> +
> +        new_vars_list = '%s:%s:%s\n' % \
> +                ((self.d.getVar('BAD_RECOMMENDATIONS', True) or '').strip(),
> +                 (self.d.getVar('NO_RECOMMENDATIONS', True) or '').strip(),
> +                 (self.d.getVar('PACKAGE_EXCLUDE', True) or '').strip())
> +        open(vars_list_file, 'w+').write(new_vars_list)
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

