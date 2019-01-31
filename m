Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF177C3E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 13:32:29 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id x30so2606866edx.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 05:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cURnDlutROXiYLmqrZOVMt5nAdSgNTufkAXANqthCyo=;
	b=sunRq6aT+xSVBlw/8LxRQF3GqnDBT8AUGJXAKGQ8cbStYeu9UR1/WGlyFLUKaFfDtL
	2qShiDjFZBfZsn0cm7/1D+InNikg96iAbqUbuoIoQT1Uyhbt+NqP/RnTkEuMiGfrBcE7
	9A9EMHu6LgSjzTVyZUAfMrOczbUYIya6YRTSVUBaabYUaUhpqhkxXggDT1hJwYYpgaxW
	o2Qd+AtXyXitnuIHTmyTnWsHyEWttz2ptZq/4ZPWavpwXNZ6CdR8K+mBxejjV5bStseS
	SIvb9ioFlDk7X442ODYqeTdRwUI2oVR+jPrqmMR79zgviM6jW98AXRciFuf2zpmtCupP
	5YMQ==
X-Gm-Message-State: AJcUukcKCdbmu5Wf7PwX5ry55izaEIq2FzJ8r7YlR1BrQ91aybV58Y8p
	5Qv9DCcGo7HoV9J2fP1nHNzmqnLp
X-Google-Smtp-Source: ALg8bN51Jf9TKXhZyHs7YDVPNdP5rxvTbszkZauzqmt+UxcCGaYMAPqPqyGSNCQEvZVKsM+qGCUFCg==
X-Received: by 2002:a17:906:5989:: with SMTP id
	j9mr23054872ejq.97.1548941549751; 
	Thu, 31 Jan 2019 05:32:29 -0800 (PST)
Received: from tfsielt31850 (31-187-2-174.dynamic.upc.ie. [31.187.2.174])
	by smtp.gmail.com with ESMTPSA id
	j31sm1292017eda.46.2019.01.31.05.32.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 31 Jan 2019 05:32:28 -0800 (PST)
Message-ID: <3f11c471900fc79e79f49c9b6150ad0280c955fa.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2019 13:32:25 +0000
In-Reply-To: <20190130093406.10391-2-bunk@stusta.de>
References: <20190130093406.10391-2-bunk@stusta.de>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] Drop util-linux-native-qsort.patch
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
X-List-Received-Date: Thu, 31 Jan 2019 13:32:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is already part of my util-linux cleanup:
http://lists.openembedded.org/pipermail/openembedded-core/2019-January/278074.html

The issue is more grave than just compatibility, it would appear that it
introduces random memory access.


Cheers,
Andre'


On Wed, 2019-01-30 at 11:34 +0200, Adrian Bunk wrote:
> CentOS 5.x is no longer supported for 2 years,
> and uninative being default since Yocto 2.1 should
> in any case already cover this issue better.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../util-linux/util-linux-native-qsort.patch       | 33 ---------------
> -------
>  meta/recipes-core/util-linux/util-linux_2.32.1.bb  |  6 ----
>  2 files changed, 39 deletions(-)
>  delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-
> native-qsort.patch
> 
> diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-native-
> qsort.patch b/meta/recipes-core/util-linux/util-linux/util-linux-native-
> qsort.patch
> deleted file mode 100644
> index 68bf22de8c..0000000000
> --- a/meta/recipes-core/util-linux/util-linux/util-linux-native-
> qsort.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From f220d809be1baa654503bf6ff52f3630b0d7015c Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Wed, 26 Mar 2014 01:30:29 +0000
> -Subject: [PATCH] sun.c: use qsort() to instead of qsort_r()
> -
> -qsort_r() was added to glibc in version 2.8, so there is no qsort_r() on
> -the host like CentOS 5.x.
> -
> -Upstream-Status: Inappropriate [Other]
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - libfdisk/src/sun.c | 5 ++---
> - 1 file changed, 2 insertions(+), 3 deletions(-)
> -
> -Index: util-linux-2.24.2/libfdisk/src/sun.c
> -===================================================================
> ---- util-linux-2.24.2.orig/libfdisk/src/sun.c
> -+++ util-linux-2.24.2/libfdisk/src/sun.c
> -@@ -431,10 +431,9 @@ static int sun_verify_disklabel(struct f
> -     }
> -     verify_sun_starts = starts;
> - 
> --    qsort_r(array,ARRAY_SIZE(array),sizeof(array[0]),
> --	  (int (*)(const void *,const void *,void *)) verify_sun_cmp,
> --	  verify_sun_starts);
> --
> -+    qsort(array,ARRAY_SIZE(array),sizeof(array[0]),
> -+         (int (*)(const void *,const void *)) verify_sun_cmp);
> -+ 
> -     if (array[0] == -1) {
> - 	fdisk_info(cxt, _("No partitions defined."));
> - 	return 0;
> diff --git a/meta/recipes-core/util-linux/util-linux_2.32.1.bb
> b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
> index c909836cbb..0ba218b8f2 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.32.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
> @@ -1,15 +1,9 @@
>  MAJOR_VERSION = "2.32"
>  require util-linux.inc
>  
> -# To support older hosts, we need to patch and/or revert
> -# some upstream changes.  Only do this for native packages.
> -OLDHOST = ""
> -OLDHOST_class-native = "file://util-linux-native-qsort.patch"
> -
>  SRC_URI += "file://configure-sbindir.patch \
>              file://runuser.pamd \
>              file://runuser-l.pamd \
> -            ${OLDHOST} \
>              file://ptest.patch \
>              file://run-ptest \
>              file://display_testname_for_subtest.patch \
> -- 
> 2.11.0
> 


