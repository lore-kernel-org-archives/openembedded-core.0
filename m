Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B166C4167B
	for <webhook@archiver.kernel.org>; Sat,  2 Dec 2023 15:13:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.19483.1701529993431026406
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Dec 2023 07:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NfS6bHoB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BA311C0003;
	Sat,  2 Dec 2023 15:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701529991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vF38Gei1lnU+TeXxFfprMzYlXdtJnqASPR+p9p/1IkU=;
	b=NfS6bHoBkr03Ci+w/K4i3E+NmCcMbJZsREnMGl7few2JOnxxPG42H/f75+qyUgGnJjjPa9
	BrdRziT8wURXMs52cjrCh+LHmBgkz0wQcLsgm8b8pM5Fwy5jS2GsEVO5hgKoJDQKoN+K0k
	hxfvTRrDoQcNbZKEESsuqS2MD1GspGueuRqdKzc0iIWgttEGMkhbHOX0JE0Wyh6CI8lmIO
	Ul5pPW7U5kVQpe+Qp+tLlRP3GuFRH/XzsEypFHc5VkOQEa9HYUx3BOM89iC7qLIXhIk1DL
	kEhXbsamH3hp27tElH8XOcO4uwevuOuHxDoijF2o63Y6kYQIuPDaUlJH0OoyPA==
Date: Sat, 2 Dec 2023 16:13:11 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: johannes.pointner@br-automation.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] ldconfig-native: Add usrmerge support
Message-ID: <20231202151311e74fca40@mail.local>
References: <20231201105359.409068-1-johannes.pointner@br-automation.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201105359.409068-1-johannes.pointner@br-automation.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Dec 2023 15:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191702

On 01/12/2023 11:53:59+0100, Johannes Pointner via lists.openembedded.org wrote:
> If DISTRO_FEATURE usrmerge is enabled, SLIBDIR is just a symlink to LIBDIR,
> therefore don't add SLIBDIR for parsing in this case.
> 
> Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
> ---
>  .../ldconfig-add-usrmerge-support.patch       | 37 +++++++++++++++++++
>  .../glibc/ldconfig-native_2.12.1.bb           |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-add-usrmerge-support.patch
> 
> diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-add-usrmerge-support.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-add-usrmerge-support.patch
> new file mode 100644
> index 0000000000..3041d433fd
> --- /dev/null
> +++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-add-usrmerge-support.patch
> @@ -0,0 +1,37 @@
> +From 6e543f39f6bec6eb2e02eea02029c7f4ec533b66 Mon Sep 17 00:00:00 2001
> +From: Johannes Pointner <johannes.pointner@br-automation.com>
> +Date: Fri, 1 Dec 2023 11:02:39 +0100
> +Subject: [PATCH] ldconfig: add usrmerge support
> +
> +Check whether SLIBDIR is a symlink, which is the case if usrmerge
> +is enabled, and if so, ignore it.
> +
> +Upstream-Status: Inappropriate [embedded specific]

I'm not sure how this is embedded specific, why doesn't it affect desktop
distribution that have usrmerge (e.g. Fedora) ?

> +
> +Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
> +---
> + ldconfig.c | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/ldconfig.c b/ldconfig.c
> +index e826410..72ac67b 100644
> +--- a/ldconfig.c
> ++++ b/ldconfig.c
> +@@ -1371,10 +1371,16 @@ main (int argc, char **argv)
> + 
> +   if (!opt_only_cline)
> +     {
> ++      struct stat buf;
> ++      int ret;
> +       parse_conf (config_file, true);
> + 
> +       /* Always add the standard search paths.  */
> +-      add_system_dir (SLIBDIR);
> ++      /* Check whether SLIBDIR is a symlink, which is the case if usrmerge
> ++       is enabled, and if so, ignore it. */
> ++      ret = lstat(SLIBDIR ,&buf);
> ++      if(ret == -1 || !S_ISLNK(buf.st_mode))
> ++        add_system_dir (SLIBDIR);
> +       if (strcmp (SLIBDIR, LIBDIR))
> + 	add_system_dir (LIBDIR);
> +       add_system_dir (SLIBDIR32);
> diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> index 4db67c3ad4..85fc87257d 100644
> --- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> +++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> @@ -16,6 +16,7 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
>             file://add-64-bit-flag-for-ELF64-entries.patch \
>             file://no-aux-cache.patch \
>             file://add-riscv-support.patch \
> +           file://ldconfig-add-usrmerge-support.patch \
>  "
>  
>  
> -- 
> 2.43.0
> 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191566): https://lists.openembedded.org/g/openembedded-core/message/191566
> Mute This Topic: https://lists.openembedded.org/mt/102912756/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

