Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B379C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 08:48:23 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.40609.1655801297775718419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 01:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JTWYOV60;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1461E10001A;
	Tue, 21 Jun 2022 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655801295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RKR1MytF7wAwdt0TWU3mNV5HrwfeOxl0poEGnqSAOEs=;
	b=JTWYOV604jeXkHNDAOrCIRCoMF6pVBbEKq0SeVO6HR1Zp6HzowAL14WyKFH4v/n75+FhPG
	DAg7P+/RCQgu/OYIrXJJdml1kRRasKG0clKFQZQfduw8XLkbH0+WTBry2tJMUe7bCORSsh
	9zyJQtN2EtN8/MD3jgfFGTaXg8EfX1OLDKz9iJEb9yZiJ1sehYMsiajEWOKcA6l+r2EpVK
	zqO2cAm3xHRModUoJpP6945wqwyJrmXXbGMBbcJbBdMif/dRTb+k4LXCiMKUi1S9PrdsNB
	vMYiiVZsSLwmftfq6qCPJHJ/NWgRxCWfH5tt4fDb4EJsK9SETNATXawb012F/Q==
Date: Tue, 21 Jun 2022 10:48:13 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Pavel Zhukov" <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org, Pavel Zhukov
 <pavel.zhukov@huawei.com>
Subject: Re: [OE-core] [PATCH 1/2] systemd: Add missed sys/file.h includes
 for musl
Message-ID: <20220621104813.06a4fcd4@booty>
In-Reply-To: <20220620161228.5267-1-pavel@zhukoff.net>
References: <20220620161228.5267-1-pavel@zhukoff.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 08:48:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167137

Hi Pavel,

On Mon, 20 Jun 2022 18:12:28 +0200
"Pavel Zhukov" <pavel@zhukoff.net> wrote:

> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>  .../0001-Add-sys-file.h-for-LOCK_.patch       | 80 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_251.2.bb    |  2 +-
>  2 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
> 
> diff --git a/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch b/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
> new file mode 100644
> index 0000000000..25a1042a9d
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
> @@ -0,0 +1,80 @@
> +From 7ae39374fda539aa613caeeee09be8d050a9bb79 Mon Sep 17 00:00:00 2001
> +From: Pavel Zhukov <pavel.zhukov@huawei.com>
> +Date: Mon, 20 Jun 2022 11:24:52 +0200
> +Subject: [PATCH] Add sys/file.h for LOCK_
> +Cc: pavel@zhukoff.net
> +
> +Upstream-Status: Inappropriate [musl specific]
> +
> +Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> +---
> + src/core/namespace.c       | 1 +
> + src/dissect/dissect.c      | 1 +
> + src/shared/dissect-image.c | 2 ++
> + src/sysext/sysext.c        | 1 +
> + src/test/test-loop-block.c | 1 +
> + 5 files changed, 6 insertions(+)
> +
> +diff --git a/src/core/namespace.c b/src/core/namespace.c
> +index 926aa96174..39f9e21c93 100644
> +--- a/src/core/namespace.c
> ++++ b/src/core/namespace.c
> +@@ -7,6 +7,7 @@
> + #include <sys/mount.h>
> + #include <unistd.h>
> + #include <linux/fs.h>
> ++#include <sys/file.h> // For LOCK_ musl-specific
> +
> + #include "alloc-util.h"
> + #include "base-filesystem.h"
> +diff --git a/src/dissect/dissect.c b/src/dissect/dissect.c
> +index bd94a755db..a0d2a6f287 100644
> +--- a/src/dissect/dissect.c
> ++++ b/src/dissect/dissect.c
> +@@ -6,6 +6,7 @@
> + #include <stdio.h>
> + #include <sys/ioctl.h>
> + #include <sys/mount.h>
> ++#include <sys/file.h> // musl specific for LOCK_
> +
> + #include "architecture.h"
> + #include "chase-symlinks.h"
> +diff --git a/src/shared/dissect-image.c b/src/shared/dissect-image.c
> +index 1ab88839aa..a9e3fe4b44 100644
> +--- a/src/shared/dissect-image.c
> ++++ b/src/shared/dissect-image.c
> +@@ -4,6 +4,8 @@
> + #include <valgrind/memcheck.h>
> + #endif
> +
> ++#include <sys/file.h> // For LOCK (musl specific)
> ++
> + #include <linux/blkpg.h>
> + #include <linux/dm-ioctl.h>
> + #include <linux/loop.h>
> +diff --git a/src/sysext/sysext.c b/src/sysext/sysext.c
> +index 364af195e0..85686c0fab 100644
> +--- a/src/sysext/sysext.c
> ++++ b/src/sysext/sysext.c
> +@@ -5,6 +5,7 @@
> + #include <linux/loop.h>
> + #include <sys/mount.h>
> + #include <unistd.h>
> ++#include <sys/file.h> // LOCK_ (musl-specific)
> +
> + #include "capability-util.h"
> + #include "chase-symlinks.h"
> +diff --git a/src/test/test-loop-block.c b/src/test/test-loop-block.c
> +index d1793222f0..6886c4cd31 100644
> +--- a/src/test/test-loop-block.c
> ++++ b/src/test/test-loop-block.c
> +@@ -3,6 +3,7 @@
> + #include <fcntl.h>
> + #include <linux/loop.h>
> + #include <pthread.h>
> ++#include <sys/file.h> 

Minor nit: better using always the same string. Now there 4 different
comments saying the same thing.

> diff --git a/meta/recipes-core/systemd/systemd_251.2.bb b/meta/recipes-core/systemd/systemd_251.2.bb
> index 8370bec0ca..88216ccf6e 100644
> --- a/meta/recipes-core/systemd/systemd_251.2.bb
> +++ b/meta/recipes-core/systemd/systemd_251.2.bb
> @@ -35,7 +35,6 @@ SRC_URI_MUSL = "\
>                 file://0005-src-basic-missing.h-check-for-missing-strndupa.patch \
>                 file://0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
>                 file://0008-add-missing-FTW_-macros-for-musl.patch \
> -               file://0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch \

This line should be in patch 2/2.


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

