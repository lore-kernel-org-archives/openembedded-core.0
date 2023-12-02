Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF95C4167B
	for <webhook@archiver.kernel.org>; Sat,  2 Dec 2023 15:10:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.19594.1701529806590180728
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Dec 2023 07:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nAbhYWNt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5DC61C0006;
	Sat,  2 Dec 2023 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701529804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PDgfV62ZkcZxJrdeM2VDT40SvCNgXOj215dzhKHkObU=;
	b=nAbhYWNtVi9LsUvqLvxWYqLHTjZxTG/u3VKxQWjrj4A0YawwkK3GAwWsSTLDJAGONMmf/W
	nfIVuziQVX4YO6wTFwfXUjlwUG1t4GRZ7FUodY1n4ARyUQdmJotbA3Rda0UZ+w4nWyC9F/
	khS7UDJo/0n3jHdc3nIFE1aAWEELITFQR/U5sg1T87OLrhxW/brylVx+JEKR7t4efISQvh
	ndL5m5iPVCpciigdrWHSljSZ8lyt9MetdXrxM9Zvc4G+/HjeO4W7I6CAXtGq8BTxPvMGOG
	YJxm8e+CwqA34vT9Nm0WYVpkhgTlwh3/SAbFNGBzUpd82xNfvhhz1nSM0Inj7Q==
Date: Sat, 2 Dec 2023 16:10:03 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: johannes.pointner@br-automation.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] ldconfig-native: Add usrmerge support
Message-ID: <202312021510037e9eb087@mail.local>
References: <20231201105359.409068-1-johannes.pointner@br-automation.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201105359.409068-1-johannes.pointner@br-automation.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Dec 2023 15:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191701

Hello,

Please follow https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity

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

