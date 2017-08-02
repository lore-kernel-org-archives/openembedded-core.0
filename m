Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2CF78094
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 08:58:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Aug 2017 01:58:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,310,1498546800"; d="scan'208";a="1178695466"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2017 01:58:32 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 555AA5809E8;
	Wed,  2 Aug 2017 01:58:31 -0700 (PDT)
Date: Wed, 2 Aug 2017 11:35:31 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: liu.ming50@gmail.com
Message-ID: <20170802083531.GB2944@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
	<1501607630-30241-4-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1501607630-30241-4-git-send-email-liu.ming50@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] qemux86.conf: drop do_image_wic task dependencies
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
X-List-Received-Date: Wed, 02 Aug 2017 08:58:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 01, 2017 at 07:13:49PM +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> They are being controlled by WKS_FILE_DEPENDS_DEFAULT, the code here
> is redundant and incomplete as well.
> 
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/conf/machine/qemux86.conf | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
> index c26dda2..f0bebbf 100644
> --- a/meta/conf/machine/qemux86.conf
> +++ b/meta/conf/machine/qemux86.conf
> @@ -29,4 +29,3 @@ MACHINE_FEATURES += "x86"
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
>  
>  WKS_FILE ?= "directdisk.wks"
> -do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"

-1

WKS_FILE_DEPENDS_DEFAULT is a termporary setting aimed to easy
transition from using wic-tools to using WKS_FILE_DEPENDS. It contains
the whole set of packages that is not usually needed.

Please, consider setting WKS_FILE_DEPENDS with the minimum set of packages
required by directdisk.wks. This will faster the build as unneeded
packages will not be built.

You may want to look at "image_types_wic: set default WKS_FILE_DEPENDS"
commit for further details.

--
Regards,
Ed

