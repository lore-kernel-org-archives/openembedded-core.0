Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 63DBF70178
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 09:47:15 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2016 02:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,572,1455004800"; d="scan'208";a="96181575"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 03 May 2016 02:47:16 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E35D56A4006;
	Tue,  3 May 2016 03:34:49 -0700 (PDT)
Date: Tue, 3 May 2016 10:27:24 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20160503072724.GA6303@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1462233963-14800-1-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1462233963-14800-1-git-send-email-kergoth@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types.bbclass: add WIC_CREATE_EXTRA_ARGS
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
X-List-Received-Date: Tue, 03 May 2016 09:47:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christopher,

Thank you for the patch! I like the idea.

Would you mind adding or modifying wic oe-selftest to cover this?

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

PS: You've mentioned --bmap as a possible use case scenario for this. I
don't think this is the case as it's simpler to use wic.bmap image
type to achieve this. It's implemented by this patchset:
http://lists.openembedded.org/pipermail/openembedded-core/2016-April/120644.html

On Mon, May 02, 2016 at 05:06:03PM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> This'll be of use to pass things like --bmap.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/classes/image_types.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 19f89f3..385d47e 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -193,6 +193,8 @@ def wks_search(files, search_path):
>              if searched:
>                  return searched
>  
> +WIC_CREATE_EXTRA_ARGS ?= ""
> +
>  IMAGE_CMD_wic () {
>  	out="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}"
>  	wks="${WKS_FULL_PATH}"
> @@ -200,7 +202,7 @@ IMAGE_CMD_wic () {
>  		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
>  	fi
>  
> -	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR_TARGET}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
> +	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR_TARGET}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/" ${WIC_CREATE_EXTRA_ARGS}
>  	mv "$out/build/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
>  	rm -rf "$out/"
>  }
> -- 
> 2.8.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

