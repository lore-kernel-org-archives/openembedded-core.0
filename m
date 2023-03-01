Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2EBC64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 08:54:06 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.17585.1677660839966361275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 00:54:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XT9MsBSE;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A1AB6240003;
	Wed,  1 Mar 2023 08:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677660838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M86FIHH7dLgEWRAaN64H1omnDApHaUJGHXILRB78GzM=;
	b=XT9MsBSEKsda2eBmihO4YGh+Xo3EBEmllcSk9yOgfpGEGfCjKSDAmy1JZAeEus65lwSE39
	ppdROv4uiDljOC6Op+IKJvxoi7nD1eGbG/NTqB74Y8tGp+zfN3J/4rPybE/4ZHEJ+DsRaz
	0O2IEpzwtsm45xT44qehbxnkyCNyBaeaqnLgmM6ALHp8/hZ0HXpCk7xkaY4b9iWmPFyHXd
	eMrvLWjUqhCRZSlOOkM1dodtHEOVZBjBPWQ9t8/fcxxg7PUW4+pwz+U6+mQBxdPEzeaBnN
	JFFojm2KRx430zfk+lr6FOUlBMuCNi5iWQyHVfGASaEloILKcAl3cmVZmyTn3Q==
Date: Wed, 1 Mar 2023 09:53:57 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libnotify: upgrade 0.8.1 -> 0.8.2
Message-ID: <Y/8SpU34SCyVrBgE@mail.local>
References: <1677577759-20868-1-git-send-email-wangmy@fujitsu.com>
 <1677577759-20868-3-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1677577759-20868-3-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 08:54:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177876


Hello,

This causes:

| Looking for a fallback subproject for the dependency gi-docgen
| 
| ../libnotify-0.8.2/docs/reference/meson.build:13:0: ERROR: Subproject exists but has no meson.build file
| 
| A full log can be found at /home/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-libnotify/0.8.2-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-libnotify/0.8.2-r0/temp/run.do_configure.2726713:181 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-libnotify/0.8.2-r0/temp/run.do_configure.2726713, line 181
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-libnotify/0.8.2-r0/temp/run.do_configure.2726713, line 170
| 	#3: do_configure, /home/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-libnotify/0.8.2-r0/temp/run.do_configure.2726713, line 156
| 	#4: main, /home/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-libnotify/0.8.2-r0/temp/run.do_configure.2726713, line 194
NOTE: recipe lib32-libnotify-0.8.2-r0: task do_configure: Failed

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/4211/steps/11/logs/stdio

On 28/02/2023 17:49:17+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ===========
> * Set new summary for library
> * docs: port to gi-docgen
> * docs: Fix URL to Desktop Notification Spec
> * meson: replace deprecated meson.source_root() calls
> * meson: bump minimum meson version to 0.58
> * Introspection docs fixes
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libnotify/{libnotify_0.8.1.bb => libnotify_0.8.2.bb}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-gnome/libnotify/{libnotify_0.8.1.bb => libnotify_0.8.2.bb} (93%)
> 
> diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
> similarity index 93%
> rename from meta/recipes-gnome/libnotify/libnotify_0.8.1.bb
> rename to meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
> index 3bdc70d224..e86aabce26 100644
> --- a/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb
> +++ b/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
> @@ -22,7 +22,7 @@ inherit gnomebase gtk-doc features_check gobject-introspection
>  # depends on gtk+3 if tests are enabled
>  ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
>  
> -SRC_URI[archive.sha256sum] = "d033e6d4d6ccbf46a436c31628a4b661b36dca1f5d4174fe0173e274f4e62557"
> +SRC_URI[archive.sha256sum] = "c5f4ed3d1f86e5b118c76415aacb861873ed3e6f0c6b3181b828cf584fc5c616"
>  
>  EXTRA_OEMESON = "-Dman=false"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177828): https://lists.openembedded.org/g/openembedded-core/message/177828
> Mute This Topic: https://lists.openembedded.org/mt/97287063/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

