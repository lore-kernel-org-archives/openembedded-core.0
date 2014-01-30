Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id EF02E6E9AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 14:12:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0UEC10d006653; Thu, 30 Jan 2014 14:12:01 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vouSBLJukSye; Thu, 30 Jan 2014 14:12:01 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0UEBvNa006629
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 30 Jan 2014 14:11:58 GMT
Message-ID: <1391091111.24655.196.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Thu, 30 Jan 2014 14:11:51 +0000
In-Reply-To: <1390940874-11839-1-git-send-email-obi@opendreambox.org>
References: <20140128192141.GA3640@mail.itconsulting-heinold.de>
	<1390940874-11839-1-git-send-email-obi@opendreambox.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] cogl: kms: include necessary header for size_t
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
X-List-Received-Date: Thu, 30 Jan 2014 14:12:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-28 at 21:27 +0100, Andreas Oberritter wrote:
> Fixes compilation in cases where stddef.h is not already
> included by EGL headers.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> :-P

The sad thing is it appears this wasn't tested. We added it, it causes
warnings during parsing and build failures.

I've pushed a fix but its frustrating.

Cheers,

Richard


>  meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb      |  2 ++
>  .../kms-include-stddef.h-before-drm.h.patch        | 33 ++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-graphics/cogl/cogl-1.16.0/kms-include-stddef.h-before-drm.h.patch
> 
> diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb
> index 5e5c82b..0ef9726 100644
> --- a/meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb
> +++ b/meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb
> @@ -2,5 +2,7 @@ require cogl-1.0.inc
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  
> +SRC_URI += "file://kms-include-stddef.h-before-drm.h.patch"
> +
>  SRC_URI[archive.md5sum] = "611a61bed04354cbfffa3dc27feb6d4f"
>  SRC_URI[archive.sha256sum] = "75c2c4636a050fda7ee8722ce3d9c618b08799ed92bbb72b4fdff3e73b096094"
> diff --git a/meta/recipes-graphics/cogl/cogl-1.16.0/kms-include-stddef.h-before-drm.h.patch b/meta/recipes-graphics/cogl/cogl-1.16.0/kms-include-stddef.h-before-drm.h.patch
> new file mode 100644
> index 0000000..7cce279
> --- /dev/null
> +++ b/meta/recipes-graphics/cogl/cogl-1.16.0/kms-include-stddef.h-before-drm.h.patch
> @@ -0,0 +1,33 @@
> +Upstream-Status: Submitted [cogl@lists.freedesktop.org]
> +
> +From 5e4f4689308732a0570a1631169247157c59f064 Mon Sep 17 00:00:00 2001
> +From: Andreas Oberritter <obi@saftware.de>
> +Date: Tue, 28 Jan 2014 18:36:04 +0100
> +Subject: [PATCH] kms: include stddef.h before drm.h
> +
> +Not doing so leads to the following error, if stddef.h is not included
> +indirectly through EGL headers:
> +
> +| libdrm/drm.h:132:2: error: unknown type name 'size_t'
> +|   size_t name_len;   /**< Length of name buffer */
> +
> +Signed-off-by: Andreas Oberritter <obi@saftware.de>
> +---
> + cogl/winsys/cogl-winsys-egl-kms.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/cogl/winsys/cogl-winsys-egl-kms.c b/cogl/winsys/cogl-winsys-egl-kms.c
> +index f7c9cfb..144ad9b 100644
> +--- a/cogl/winsys/cogl-winsys-egl-kms.c
> ++++ b/cogl/winsys/cogl-winsys-egl-kms.c
> +@@ -40,6 +40,7 @@
> + 
> + #include <EGL/egl.h>
> + #include <EGL/eglext.h>
> ++#include <stddef.h>
> + #include <drm.h>
> + #include <xf86drm.h>
> + #include <xf86drmMode.h>
> +-- 
> +1.8.3.2
> +



