Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2533CC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 06:59:46 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web10.161014.1673852377098698385
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 22:59:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm3 header.b=TsECjthm;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.25, mailfrom: pavel@zhukoff.net)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 135733200201;
	Mon, 16 Jan 2023 01:59:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 16 Jan 2023 01:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1673852373; x=1673938773; bh=FfReHRWqQ1a2Vvw0/m9bnzp1C
	gWZbsezbeesqnLBJIw=; b=TsECjthmVMkH6KyvViVDww094XZbe+uC3jtGbbQNb
	fsD4SBjSGt7xA1mhQWxCEcL8pdyg0hRnNiD+N00or5FaIEoziXN22M+hD8j8FOLW
	ikLu8HkHwM23bUKPjkrKLJTpbXP70jsvekK7i7oZA12Bs017+TWxwLH0lAJoiVrz
	SyCGPfFKMlV3A1FuC9r9IEJEIuOGOr9D8HdbRZYsyWYmSdUqLtcij5UffNKZHY3t
	L90/05D6gZjcplPFQBIgl5YajsGXh/qW2lBZfZ2JyatQL91TVIPu+hzx4BT7h2wQ
	dNo7IcVTr5I7h5geWtmECZkLazTa2OiahVdV3iBTAD56Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1673852373; x=1673938773; bh=FfReHRWqQ1a2Vvw0/m9bnzp1CgWZbsezbee
	sqnLBJIw=; b=VM9BX06vG9/ah+NEneWaq0MyMFVEvRXTqaufkGUk+rIQe7FERpB
	HTg2C1ldLo2AOh7hLNBH0XBxAJhhxDD/NWswUbjYYkmaVkv/UTF8SwdUldY9LzXC
	wV4l+mq+7j5Uck/aGfPmm+IFlamSi9l8LgzSYuW9RzjjATs5duJtVo0eGCeS+3v6
	8bnHIicPhHPmHNioMchq3KlxNxw8a6p72bM4wFF0dOQqAywoGX79XOgauETvz/AA
	1Uwig1H7w460lIi2maBp6x8k4VLJiuDQ+m+DEmOhm2MKKkEktPBRcmA/dIH3Kxwx
	xHsiO2TVVUHJ85bV561kwTvWWfhcglI+2/A==
X-ME-Sender: <xms:1fXEY67kfg48hTiqXIhy2dsJCXfgxo-w2TuOIdavKnMud1SZWbUyCQ>
    <xme:1fXEYz7O2Sm0o4MZ-9bcSJJczMVMJAtGDwlkbo-D9evNwkjPjfnPMZXBQjBxKlBUQ
    yJXKGGIFy9fluwAfkM>
X-ME-Received: <xmr:1fXEY5fckF2enknOmbWlv8wXrtwceIIzqcg2KGHR0go7e1h0HVUiH86mOOVxCZctJTxUowSXZ9yqTxgFrilFp-wN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtfedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepveefjeekjedugeeltdekjefhtedtfe
    ejueffheeikedvudfgtdffffelvddvfefhnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:1fXEY3IC9Y6PyG5JeJnqN5J4EbIPW4EER_gbQOzUisihElKVBN8asw>
    <xmx:1fXEY-I64FfLBD-_RVAxorM5VegbiaLFcB7jzjQ9tcSOuOeVoMgNvw>
    <xmx:1fXEY4y6nqRuwpFL0DROG20-Pqq3rD8GxN8C5wfLsA_qIMGjCrji8A>
    <xmx:1fXEY1UC7zUji42skORGo5urdiTswRRMwAaolyXV6e56lSUatJ8PHg>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 01:59:32 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	raj.khem@gmail.com,
	Pavel Zhukov <pavel@zhukoff.net>
Subject: [kirkstone][PATCH] gcc: Fix build with musl and usrmerge on arm
Date: Mon, 16 Jan 2023 07:58:44 +0100
Message-Id: <20230116065843.19446-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 06:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175959

Backport fix from master to allow gcc to use proper linker path for
musl [Yocto #14977]

Fixes:
| qemu-arm: Could not open '/lib/ld-musl-armhf.so.1': No such file or directory

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/recipes-devtools/gcc/gcc-11.3.inc         |  1 +
 .../gcc/0031-fix-musl-arm-with-usrmerge.patch  | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-11.3.inc
index 27074a06ae..2adb21ed84 100644
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
@@ -60,6 +60,7 @@ SRC_URI = "\
            file://0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch \
            file://0029-Fix-install-path-of-linux64.h.patch \
            file://0030-rust-recursion-limit.patch \
+           file://0031-fix-musl-arm-with-usrmerge.patch \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
            file://0003-CVE-2021-42574.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch b/meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch
new file mode 100644
index 0000000000..1408b65c64
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Inappropriate [bugfix]
+
+The fix has been picked from OE-core ustream:
+ 0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+
+Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h
++++ gcc-11.3.0/gcc/config/arm/linux-eabi.h
+@@ -89,7 +89,7 @@
+ #define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
+ #endif
+ #define MUSL_DYNAMIC_LINKER \
+-  "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
+
+ /* For armv4 we pass --fix-v4bx to linker to support EABI */
+ #undef TARGET_FIX_V4BX_SPEC
-- 
2.39.0


