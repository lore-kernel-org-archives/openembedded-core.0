Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AC8C27C78
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 23:19:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.87447.1719011937434639131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 16:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ka6KYLwJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FFB6C0003;
	Fri, 21 Jun 2024 23:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719011935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tv0m6Vhs4YoLgW62pX20u1j0BEBN64BZq00ZYEvKCU8=;
	b=ka6KYLwJG3Dz6tyWdmud+zW4Nv+rx97wEAxZKMOVBGnIf7ixy9eLisNMqmKG0Iswo90Pd5
	sCjTj+DAaJGIJ73FB5qxyhAJtYlu0aheTz504OhdK7wZ1AkJWL/9iNdM2gGMzh0UDNMGOT
	cB7v+KHLbrRJKPhPpXfdGFOrjNlBkbpdd3Ux8LBzZteVKVCfwDMefUIbkm2I4XpqOtjIrT
	Q0AubsY8ho5Q4ITLhMaU9fEGQW/8mRPG0Y4Ij1Yo/0FOMWvouoe2wBOnd5B1+1HjWyBkQH
	6zOnnq/VdcqwdKWOg4D4jVhVjYr2/ycSeU5aNWiBJ04E+1+OvI6/wA3sYu19QQ==
Date: Sat, 22 Jun 2024 01:18:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 07/22] e2fsprogs: upgrade 1.47.0 -> 1.47.1
Message-ID: <20240621231854f7c4ddd3@mail.local>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
 <1718936206-8080-7-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1718936206-8080-7-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 23:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201035

Hello,

This breaks btrfs-tools and syslinux:
https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/9488/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6737/steps/12/logs/stdio

On 21/06/2024 10:16:31+0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> mkdir_p.patch
> ptest.patch
> quiet-debugfs.patch
> refreshed for 1.47.1
> 
> Changelog:
>  https://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.47.1
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch   | 7 +++----
>  meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch     | 8 ++++----
>  .../e2fsprogs/e2fsprogs/quiet-debugfs.patch               | 7 +++----
>  .../{e2fsprogs_1.47.0.bb => e2fsprogs_1.47.1.bb}          | 2 +-
>  4 files changed, 11 insertions(+), 13 deletions(-)
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.0.bb => e2fsprogs_1.47.1.bb} (99%)
> 
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
> index f6916a1112..27aca1e112 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
> @@ -1,4 +1,4 @@
> -From e3a30baa5c1e2f0ac7e246539db1c7db5a2fe302 Mon Sep 17 00:00:00 2001
> +From cd693e0d943053ff41677be44ec9f6b002eb3600 Mon Sep 17 00:00:00 2001
>  From: Joe Slater <jslater@windriver.com>
>  Date: Tue, 7 Mar 2017 14:53:19 -0800
>  Subject: [PATCH] e2fsprogs: expand @mkdir_p@
> @@ -9,16 +9,15 @@ not expanded so no locale data is written into usr/share/locale.
>  Upstream-Status: Pending
>  
>  Signed-off-by: Joe Slater <jslater@windriver.com>
> -
>  ---
>   configure.ac | 2 ++
>   1 file changed, 2 insertions(+)
>  
>  diff --git a/configure.ac b/configure.ac
> -index 4c4b5523..3475c707 100644
> +index 131caef3..ca448d97 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -919,6 +919,8 @@ AC_SUBST(PACKAGE)
> +@@ -938,6 +938,8 @@ AC_SUBST(PACKAGE)
>   AC_SUBST(VERSION)
>   
>   AM_GNU_GETTEXT([external])
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
> index 20839b7286..3fb88bbc89 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
> @@ -1,4 +1,4 @@
> -From b8842065ad621a03a971dfd50db862c5bffdeb49 Mon Sep 17 00:00:00 2001
> +From 45bf94b3986ec87130eb51579909b9b6cbe21ebe Mon Sep 17 00:00:00 2001
>  From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
>  Date: Sat, 18 Apr 2015 17:58:17 +0300
>  Subject: [PATCH] e2fsprogs: add ptest
> @@ -14,10 +14,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>   2 files changed, 18 insertions(+), 18 deletions(-)
>  
>  diff --git a/tests/Makefile.in b/tests/Makefile.in
> -index 8c4d2048..e021af32 100644
> +index ba06b3b6..5a3e48f4 100644
>  --- a/tests/Makefile.in
>  +++ b/tests/Makefile.in
> -@@ -19,7 +19,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf
> +@@ -20,7 +20,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf test_data.tmp
>   	@echo "#!/bin/sh" > test_one
>   	@echo "HTREE=y" >> test_one
>   	@echo "QUOTA=y" >> test_one
> @@ -26,7 +26,7 @@ index 8c4d2048..e021af32 100644
>   	@echo "DIFF_OPTS=@UNI_DIFF_OPTS@" >> test_one
>   	@echo "SIZEOF_TIME_T=@SIZEOF_TIME_T@" >> test_one
>   	@echo "DD=@DD@" >>test_one
> -@@ -30,7 +30,7 @@ test_script: test_one test_script.in Makefile mke2fs.conf
> +@@ -31,7 +31,7 @@ test_script: test_one test_script.in Makefile mke2fs.conf test_data.tmp
>   	@echo "Creating test_script..."
>   	@[ -f test_script ] && chmod u+w test_script || true
>   	@echo "#!/bin/sh" > test_script
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
> index 0a6904208d..3648c26f71 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
> @@ -1,4 +1,4 @@
> -From 580ef6cae2d353f3aa5d5c52d6614bdc1df50f08 Mon Sep 17 00:00:00 2001
> +From c9bc5795a4a9821e727131923f07876fe3aa82d3 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Mon, 23 Dec 2013 13:38:34 +0000
>  Subject: [PATCH] e2fsprogs: silence debugfs
> @@ -8,16 +8,15 @@ filesystems at rootfs time.
>  
>  Upstream-Status: Inappropriate
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
>  ---
>   debugfs/debugfs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
> -index 9b6321dc..8ebf3ddb 100644
> +index 909c1df3..0842369e 100644
>  --- a/debugfs/debugfs.c
>  +++ b/debugfs/debugfs.c
> -@@ -2516,7 +2516,7 @@ static int source_file(const char *cmd_file, int ss_idx)
> +@@ -2529,7 +2529,7 @@ static int source_file(const char *cmd_file, int ss_idx)
>   		cp = strchr(buf, '\r');
>   		if (cp)
>   			*cp = 0;
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
> similarity index 99%
> rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
> index 940b47c155..bd6ac92cb1 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
> @@ -10,7 +10,7 @@ SRC_URI:append:class-native = " \
>             file://quiet-debugfs.patch \
>             "
>  
> -SRCREV = "f4c9cc4bedacde8408edda3520a32d3842290112"
> +SRCREV = "b571b9b4240739a982e8bca62cfc914a3b50190a"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
>  
>  EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200973): https://lists.openembedded.org/g/openembedded-core/message/200973
> Mute This Topic: https://lists.openembedded.org/mt/106792570/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

