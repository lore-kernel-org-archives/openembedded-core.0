Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910A3C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 10:16:06 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.18891.1705659356302862470
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 02:15:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Cpn0m+Td;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E3D340002;
	Fri, 19 Jan 2024 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705659354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZR3WcWlydW07/eYqRqdhPZKfJQm2utorCuVZNITIDLw=;
	b=Cpn0m+Td2H4aaZyALcQ4pRDozVQQFPGNvPY+YcBldfJuC11fprz4HyEDYYMkF074cN4vjt
	8aOyuP+DrzHirP3XVW+v7q5ADAS00pMmEPJXGMlfN0xEZZs4zX1ceLmdk/f1kGrhErWEL5
	WJN1egfmNwIPI5tnVz5OjqeZ1Bf9dt10DWr/fAg3L1AH8Fv8OZOoF58PSSreyurAhDBAuG
	q2TgOBm5FKNjS0jpgvKMs7nHGDBRLAWzsstvFPagNbXifuia7W0Nl6SJhd4bdIAhW3Rz6c
	cmnGaOlq+Q24njU+Beb/y9wgULdDs9BMmC/m+JV9ft5VgL0GOZW5C40/mZLhXg==
Date: Fri, 19 Jan 2024 11:15:53 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org,
	Jiang Kai <jiangkai@fujitsu.com>
Subject: Re: [OE-core] [PATCH] btrfs-tools: upgrade 6.5.3 -> 6.6.3
Message-ID: <20240119101553e081b9f1@mail.local>
References: <1705370800-31004-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1705370800-31004-1-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 10:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194026

This causes oe-selftest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6326/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6317/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6328/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6266/steps/14/logs/stdio

On 16/01/2024 10:06:36+0800, wangmy wrote:
> From: Jiang Kai <jiangkai@fujitsu.com>
> 
> 0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
> refreshed for 6.6.3
> 
> Changelog:
> ==========
> * subvol create: accept multiple arguments
> * subvol delete: print the subvolume id in the output
> * subvol sync: check if the filesystems is still writeable so it does not
>   wait indefinitely
> * device delete: add a timeout and warning when deleting multiple devices
> * scrub status: report limit if set in sysfs/../scrub_speed_max
> * scrub limit: new command to show or set the per-device scrub limits
> * scrub start: report the limit if set
> * build:
>    * fix CPU feature detection on aarch64
>    * support Botan and OpenSSL (3.2+) as crypto backends
> * other:
>    * documentation updates, RTD config update
>    * new and updated tests
>    * CI updates
> 
> Signed-off-by: Jiang Kai <jiangkai@fujitsu.com>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...-a-possibility-to-specify-where-python-modules-ar.patch | 7 ++++---
>  .../{btrfs-tools_6.5.3.bb => btrfs-tools_6.6.3.bb}         | 2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)
>  rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.5.3.bb => btrfs-tools_6.6.3.bb} (98%)
> 
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
> index 5846f04d1a..ed2c64eb4c 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
> @@ -1,4 +1,4 @@
> -From d3adfc21c9cc264bd191722f102963cbc4794259 Mon Sep 17 00:00:00 2001
> +From ddfdc0102c22e8dc782c34b8a03777fb73dfddf6 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 23 May 2018 21:20:35 +0300
>  Subject: [PATCH] Add a possibility to specify where python modules are
> @@ -6,15 +6,16 @@ Subject: [PATCH] Add a possibility to specify where python modules are
>  
>  Upstream-Status: Inappropriate [oe-core specific to solve multilib use case]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/Makefile b/Makefile
> -index 1697794c..8ab38818 100644
> +index 374f59b9..ed083f6b 100644
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -651,7 +651,7 @@ endif
> +@@ -959,7 +959,7 @@ endif
>   ifeq ($(PYTHON_BINDINGS),1)
>   install_python: libbtrfsutil_python
>   	$(Q)cd libbtrfsutil/python; \
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.3.bb
> similarity index 98%
> rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
> rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.3.bb
> index 873d5e7a14..ef40f553fb 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.3.bb
> @@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
>             file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
>             "
> -SRCREV = "a45c360b64660477c726e192d9e92ceb73a50f80"
> +SRCREV = "92e18dbce521789e02057d406769b073d474fa72"
>  S = "${WORKDIR}/git"
>  
>  PACKAGECONFIG ??= " \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193809): https://lists.openembedded.org/g/openembedded-core/message/193809
> Mute This Topic: https://lists.openembedded.org/mt/103754480/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

