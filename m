Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BF9C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 16:13:18 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web10.32003.1655741593140083720
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 09:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: unclosed angle-addr;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.21,
 mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id F3CD932009AE;
	Mon, 20 Jun 2022 12:13:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 20 Jun 2022 12:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1655741591; x=1655827991; bh=UtMQf6z8Zbgwm4W06ebg7Uhtn
	87CmrUD7dJ02K7BQ/o=; b=Blss0aP5aTMlfb4ZJg09n9ph0rB4RyiOzpWmlJvfF
	geYPGdK8j9v9CR9xXrj+iH0c/2d0bW6/A3TXATDBZP/ClM4VV02PE4WpSSSxjizq
	QpsEqr5FCtyMDCdjd5/x6FGvqF1NtwcXVOyHTccsBxBrr4+gwBgaylidg5yHeSBV
	DXs5x1PgO/KHlqkGzYwcU5p/u/T2APXGp5QPzb7dpIcrBbCgFyLAWvNNxxHZ/KOC
	Pckw+7ur0Uc8ech3dt3E5fp3g2gNFq71q0vjgrTIUz9iwv9sy9ur0QFvomUimoED
	+MwLD5JyQBmF822J320A5jfsg8ExBCAqoRmRUOs4jIoXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1655741591; x=1655827991; bh=UtMQf6z8Zbgwm4W06ebg7Uhtn87CmrUD7dJ
	02K7BQ/o=; b=op61STAsV554OWozLOavhEXaKoETw6RtdAyoiHg8hncCj6M/NY2
	JGhMlpTNHKcrmiVbIrHmLa8snGZ40WLLhGvw2B3OIVhLoAT2yhjIeggPZuy6UCn2
	BDNGBFIgAp7dvlEWULWnR/4uCiXi99IsDIrl199HKYkQIT3XAon4OYzjYUWNwtFh
	6ofUdSmFrihNzSmalX7Rs2U2y9rQcvRNNnTotMmqNn4jnvvpquDOzhdmkybmb3iz
	tZCJFUABBl8/aTbFpglhgJhmYe84BlWqKICZvdKEjuy/xay/YGln8Eu3BAETVgVr
	hodvvtm2DpeqGFqWvExWbDxOzVXmzd4ZPiw==
X-ME-Sender: <xms:lpywYgx5FNReN_5LBerIIm_j0VolPstEOS2-wbHFfQSp7G0eqyI-Jw>
    <xme:lpywYkRufviVv4FBexLGj4xlCO743GkZRMSztlVci9ZogunZDXanh4L31laNJ3VeI
    sP8zsXkyJIKKvMej9c>
X-ME-Received: 
 <xmr:lpywYiVj9vqjgcscprSYLC7pwAxq3qCn5jAi1hg2f7ncQBOrOFnE-MnWiR5__VTE193HyHEZ0LCeTLUtGa9fvpQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudefuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gouegrugdqhfhrohhmucdlkedtmdenucfjughrpefhvfevufffkffoggfgsedtkeertder
    tddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhhofh
    hfrdhnvghtnecuggftrfgrthhtvghrnhepieelheejveegteejueeigeehvdejtdetveet
    heeivdeifeetheffgffgtdetfffgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:lpywYujg-vgFdfOq0U0aFDXo178BoM4l1yBiK_mHjdrtFpv2FaZ6Rg>
    <xmx:lpywYiD3BSttQ9zQ3ysAW3B7aBN_0aSfZga9kd-f6HiKkMjbN-J-gA>
    <xmx:lpywYvKU978VOt1vb9xxF2x1vI0okf84X40EFb69SZQ7uZSU_MSwJg>
    <xmx:l5ywYj4h5p7PJgnrU5OLUt-_PI2Maoi6G2TWgbcPxaCtqeyqNrLXPA>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 12:13:09 -0400 (EDT)
From: Pavel@codeaurora.org, "Zhukov <pavel"@zhukoff.net
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH 1/2] systemd: Add missed sys/file.h includes for musl
Date: Mon, 20 Jun 2022 18:12:28 +0200
Message-Id: <20220620161228.5267-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 16:13:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167121

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../0001-Add-sys-file.h-for-LOCK_.patch       | 80 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_251.2.bb    |  2 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch b/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
new file mode 100644
index 0000000000..25a1042a9d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Add-sys-file.h-for-LOCK_.patch
@@ -0,0 +1,80 @@
+From 7ae39374fda539aa613caeeee09be8d050a9bb79 Mon Sep 17 00:00:00 2001
+From: Pavel Zhukov <pavel.zhukov@huawei.com>
+Date: Mon, 20 Jun 2022 11:24:52 +0200
+Subject: [PATCH] Add sys/file.h for LOCK_
+Cc: pavel@zhukoff.net
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
+---
+ src/core/namespace.c       | 1 +
+ src/dissect/dissect.c      | 1 +
+ src/shared/dissect-image.c | 2 ++
+ src/sysext/sysext.c        | 1 +
+ src/test/test-loop-block.c | 1 +
+ 5 files changed, 6 insertions(+)
+
+diff --git a/src/core/namespace.c b/src/core/namespace.c
+index 926aa96174..39f9e21c93 100644
+--- a/src/core/namespace.c
++++ b/src/core/namespace.c
+@@ -7,6 +7,7 @@
+ #include <sys/mount.h>
+ #include <unistd.h>
+ #include <linux/fs.h>
++#include <sys/file.h> // For LOCK_ musl-specific
+
+ #include "alloc-util.h"
+ #include "base-filesystem.h"
+diff --git a/src/dissect/dissect.c b/src/dissect/dissect.c
+index bd94a755db..a0d2a6f287 100644
+--- a/src/dissect/dissect.c
++++ b/src/dissect/dissect.c
+@@ -6,6 +6,7 @@
+ #include <stdio.h>
+ #include <sys/ioctl.h>
+ #include <sys/mount.h>
++#include <sys/file.h> // musl specific for LOCK_
+
+ #include "architecture.h"
+ #include "chase-symlinks.h"
+diff --git a/src/shared/dissect-image.c b/src/shared/dissect-image.c
+index 1ab88839aa..a9e3fe4b44 100644
+--- a/src/shared/dissect-image.c
++++ b/src/shared/dissect-image.c
+@@ -4,6 +4,8 @@
+ #include <valgrind/memcheck.h>
+ #endif
+
++#include <sys/file.h> // For LOCK (musl specific)
++
+ #include <linux/blkpg.h>
+ #include <linux/dm-ioctl.h>
+ #include <linux/loop.h>
+diff --git a/src/sysext/sysext.c b/src/sysext/sysext.c
+index 364af195e0..85686c0fab 100644
+--- a/src/sysext/sysext.c
++++ b/src/sysext/sysext.c
+@@ -5,6 +5,7 @@
+ #include <linux/loop.h>
+ #include <sys/mount.h>
+ #include <unistd.h>
++#include <sys/file.h> // LOCK_ (musl-specific)
+
+ #include "capability-util.h"
+ #include "chase-symlinks.h"
+diff --git a/src/test/test-loop-block.c b/src/test/test-loop-block.c
+index d1793222f0..6886c4cd31 100644
+--- a/src/test/test-loop-block.c
++++ b/src/test/test-loop-block.c
+@@ -3,6 +3,7 @@
+ #include <fcntl.h>
+ #include <linux/loop.h>
+ #include <pthread.h>
++#include <sys/file.h> // LOCK_ (Musl specific)
+
+ #include "alloc-util.h"
+ #include "dissect-image.h"
+--
+2.35.1
diff --git a/meta/recipes-core/systemd/systemd_251.2.bb b/meta/recipes-core/systemd/systemd_251.2.bb
index 8370bec0ca..88216ccf6e 100644
--- a/meta/recipes-core/systemd/systemd_251.2.bb
+++ b/meta/recipes-core/systemd/systemd_251.2.bb
@@ -35,7 +35,6 @@ SRC_URI_MUSL = "\
                file://0005-src-basic-missing.h-check-for-missing-strndupa.patch \
                file://0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
                file://0008-add-missing-FTW_-macros-for-musl.patch \
-               file://0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
                file://0010-Use-uintmax_t-for-handling-rlim_t.patch \
                file://0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
                file://0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
@@ -51,6 +50,7 @@ SRC_URI_MUSL = "\
                file://0001-pass-correct-parameters-to-getdents64.patch \
                file://0002-Add-sys-stat.h-for-S_IFDIR.patch \
                file://0001-Adjust-for-musl-headers.patch \
+               file://0001-Add-sys-file.h-for-LOCK_.patch \
                "
 
 PAM_PLUGINS = " \
-- 
2.35.1


