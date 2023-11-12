Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C709CC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 19:21:43 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.21393.1699816898464224523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Nov 2023 11:21:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mcAozxaw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C19A7FF805;
	Sun, 12 Nov 2023 19:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699816896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oD/QNrsd9dIsSFLhe3x1YaIEdIMTe3RTC/L4krNi5U4=;
	b=mcAozxaw6CyXL70UEFcwdjnL6rckY/LZ0FZMlMF/awXDjXMkzRI1EXu7UyYafOgEL1YyWf
	P8aBlHQ3Y3hI+9uHqv3TL8wi5/2GRFGFjOAmmMQZtXSRyMAzojscD31EyHvG9PAGKhgiJG
	iMcdvhSW1jxaZVHcOIcMDT3X6HbkKYNISnlt8pWTyu4+ZbP/F/MS0e5PeC2IwzG9tlj5dY
	vtpl6z7laU6tF57gEFTS13hqczPgRb1eyhEU4pF5k2SpGkJjRNhMJ0kTdVQu4h9Ilff5ke
	bwa1DIoaU195SohamzHaql8iRVKZ10Fjt2fiC8PAUNTGRHImC8zUsfV3Pg7ITg==
Date: Sun, 12 Nov 2023 20:21:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] cups: Upgrade 2.4.6 -> 2.4.7
Message-ID: <202311121921352d929cc9@mail.local>
References: <20231112013617.24303-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112013617.24303-1-f_l_k@t-online.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 19:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190453

Hello,

This fails:

reproducible:
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3912/steps/12/logs/errors

lib32:
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/7998/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5334/steps/11/logs/stdio


musl:
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/8115/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/8143/steps/11/logs/stdio


no-x11:
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8123/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8123/steps/15/logs/stdio

On 12/11/2023 02:36:17+0100, Markus Volk wrote:
> Changes in CUPS v2.4.7 (2023-09-20)
> -----------------------------------
> 
> - CVE-2023-4504 - Fixed Heap-based buffer overflow when reading Postscript
>   in PPD files
> - Added OpenSSL support for cupsHashData (Issue #762)
> - Fixed delays in lpd backend (Issue #741)
> - Fixed extensive logging in scheduler (Issue #604)
> - Fixed hanging of `lpstat` on IBM AIX (Issue #773)
> - Fixed hanging of `lpstat` on Solaris (Issue #156)
> - Fixed printing to stderr if we can't open cups-files.conf (Issue #777)
> - Fixed purging job files via `cancel -x` (Issue #742)
> - Fixed RFC 1179 port reserving behavior in LPD backend (Issue #743)
> - Fixed a bug in the PPD command interpretation code (Issue #768)
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-extended/cups/cups.inc           |  1 -
>  .../cups/cups/CVE-2023-4504.patch             | 42 -------------------
>  .../cups/{cups_2.4.6.bb => cups_2.4.7.bb}     |  2 +-
>  3 files changed, 1 insertion(+), 44 deletions(-)
>  delete mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch
>  rename meta/recipes-extended/cups/{cups_2.4.6.bb => cups_2.4.7.bb} (51%)
> 
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
> index fa32c38549..36feaddcf8 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -15,7 +15,6 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
>             file://0004-cups-fix-multilib-install-file-conflicts.patch \
>             file://volatiles.99_cups \
>             file://cups-volatiles.conf \
> -           file://CVE-2023-4504.patch \
>             "
>  
>  GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
> diff --git a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch b/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
> deleted file mode 100644
> index e52e43a209..0000000000
> --- a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -CVE: CVE-2023-4504
> -Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31 ]
> -Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> -
> -From 2431caddb7e6a87f04ac90b5c6366ad268b6ff31 Mon Sep 17 00:00:00 2001
> -From: Zdenek Dohnal <zdohnal@redhat.com>
> -Date: Wed, 20 Sep 2023 14:45:17 +0200
> -Subject: [PATCH] raster-interpret.c: Fix CVE-2023-4504
> -
> -We didn't check for end of buffer if it looks there is an escaped
> -character - check for NULL terminator there and if found, return NULL
> -as return value and in `ptr`, because a lone backslash is not
> -a valid PostScript character.
> ----
> - cups/raster-interpret.c | 14 +++++++++++++-
> - 1 files changed, 13 insertions(+), 1 deletion(-)
> -
> -diff --git a/cups/raster-interpret.c b/cups/raster-interpret.c
> -index 6fcf731b5..b8655c8c6 100644
> ---- a/cups/raster-interpret.c
> -+++ b/cups/raster-interpret.c
> -@@ -1116,7 +1116,19 @@ scan_ps(_cups_ps_stack_t *st,		/* I  - Stack */
> - 
> - 	    cur ++;
> - 
> --            if (*cur == 'b')
> -+	   /*
> -+	    * Return NULL if we reached NULL terminator, a lone backslash
> -+	    * is not a valid character in PostScript.
> -+	    */
> -+
> -+	    if (!*cur)
> -+	    {
> -+	      *ptr = NULL;
> -+
> -+	      return (NULL);
> -+	    }
> -+
> -+	    if (*cur == 'b')
> - 	      *valptr++ = '\b';
> - 	    else if (*cur == 'f')
> - 	      *valptr++ = '\f';
> diff --git a/meta/recipes-extended/cups/cups_2.4.6.bb b/meta/recipes-extended/cups/cups_2.4.7.bb
> similarity index 51%
> rename from meta/recipes-extended/cups/cups_2.4.6.bb
> rename to meta/recipes-extended/cups/cups_2.4.7.bb
> index 58029fdbd4..f4b0282e4c 100644
> --- a/meta/recipes-extended/cups/cups_2.4.6.bb
> +++ b/meta/recipes-extended/cups/cups_2.4.7.bb
> @@ -2,4 +2,4 @@ require cups.inc
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  
> -SRC_URI[sha256sum] = "58e970cf1955e1cc87d0847c32526d9c2ccee335e5f0e3882b283138ba0e7262"
> +SRC_URI[sha256sum] = "dd54228dd903526428ce7e37961afaed230ad310788141da75cebaa08362cf6c"
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190442): https://lists.openembedded.org/g/openembedded-core/message/190442
> Mute This Topic: https://lists.openembedded.org/mt/102536625/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

