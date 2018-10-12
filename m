Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6D13C79B42
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 10:43:03 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9CAh007031994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Oct 2018 11:43:02 +0100
Message-ID: <0c0def66080f069806c2197263eed086a36c008b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 11:43:00 +0100
In-Reply-To: <0c4bf43c1f51e38b1845b1b86b4513e95828d729.1539334497.git.kai.kang@windriver.com>
References: <cover.1539334497.git.kai.kang@windriver.com>
	<0c4bf43c1f51e38b1845b1b86b4513e95828d729.1539334497.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] image_types_wic: set consistent staging dirs
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
X-List-Received-Date: Fri, 12 Oct 2018 10:43:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-10-12 at 16:57 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> When build wic image with multilib enabled by following config:
> 
>   MACHINE = "qemux86-64"
>   require conf/multilib.conf
>   MULTILIBS = "multilib:lib32"
>   DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> 
>   IMAGE_FSTYPES = "wic"
> 
> it fails to build lib32 image such as lib32-core-image-minimal:
> 
> > DEBUG: Executing shell function do_image_wic
> > INFO: Creating image(s)...
> > 
> > ERROR: Couldn't find correct bootimg_dir, exiting
> 
> Dependency syslinux is not expand to lib32-syslinux when multilib is
> enabled. It is populated to ${WORKDIR}/recipe-sysroot, but script wic
> searches syslinux in ${WORKDIR}/lib32-recipe-sysroot and causes
> error.
> 
> Set consistent staging dirs for wic to fix the issue.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/classes/image_types_wic.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/image_types_wic.bbclass
> b/meta/classes/image_types_wic.bbclass
> index 5b40a9e919..402920805d 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -54,6 +54,11 @@ WKS_FILE_DEPENDS ??= "${WKS_FILE_DEPENDS_DEFAULT}
> ${WKS_FILE_DEPENDS_BOOTLOADERS
>  
>  DEPENDS += "${@ '${WKS_FILE_DEPENDS}' if d.getVar('USING_WIC') else
> '' }"
>  
> +# Dependency syslinux is not expanded when multilib is enabled,
> consistent staging dirs are needed
> +RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
> +STAGING_DIR_HOST = "${WORKDIR}/recipe-sysroot"
> +STAGING_DIR_TARGET = "${WORKDIR}/recipe-sysroot"
> +

Doesn't that change this for *all* image types? Not sure that is a good
idea...

Cheers,

Richard



