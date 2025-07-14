Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6F4C83F21
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:43 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.82448.1752510222628554522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BCovqVDG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c3d06de3so4911959b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510222; x=1753115022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxfqMHjES7Xzm3ye8cVgSpM/lhpHuEBquWTwJrDmJRw=;
        b=BCovqVDG2kQAmJPLR4fVOBS11kEE/cfYrCVbD5+JWIcHVzakbiDiUH/H9VefWjeNuO
         RbnlwWglhYwjxUfhZVVZ0AnTw5TW9AyA6S8XT2ktvEy5XaldjuTJH7RHQ/ymrnmGs6UA
         dvRwi1OYEmjQauP9ywvFsLIJ77+hZ+Z0KpUkUz2ib6esluIpSJyIxUYys5esRrwp9cvO
         5WdilTREosYdC/kmKDl4f/PM5WD3oxkRZe7UW9/RpndfRnrI1yPbMZboOwRrNWk2/55H
         +4fJFO6KEAtPD2sreGNl6Ixw/wXiDXD2kucm7gxe8UbLvjFFb+w/VF+S7YyRjbE0JdQ9
         1e9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510222; x=1753115022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxfqMHjES7Xzm3ye8cVgSpM/lhpHuEBquWTwJrDmJRw=;
        b=H1ErcF8hiJbWMnBa2/59HiWW/bNaVmYY8iI5Jv3dxAPCWPxGTPsW589T/lzF/xyvSL
         HwyEuO1ohI/GOvIwZLyKuEVKgw/rNhGGNbbXtknSDrGoWKEb1ORaVt/oyor44yeOxccj
         ajh34Fc0zOSJZTUlJla/tuNNAq1fBKmDJsvcKe5EPUD5InwqndCDY1UO0sEzFQnNhZsj
         CjJWVT/z5EwVa3y5nXZ1LetdbIvx6KdyKl3RzX5ABt4gCqIZ3oe/BgWJKXM+VmFO8PNv
         PhGfVEBcD9BVkoBkuJsVW+8/MYkVQrcCfQ96NYNMQXMSFl+3a3meViLJWUgrhkaJoMYj
         NJiw==
X-Gm-Message-State: AOJu0Yz/3G5LgO2rlCQ2Zi0lKqSvF9mEEFm/bmmyyW0XlvGGHvhvc4dQ
	UbwGjq52DxPIhjzUZ66vVwFoYgcj2ruv6pyz29t7JAOTAsaXNtCTau827t9fieBA8czFhH9XiAD
	pyF8w
X-Gm-Gg: ASbGncuoCYp97EVpYf/VFapjFp+BXa4t6BIWugoBmw9Dlc/YjS6QVVXb5XNu1vNKPvY
	dizWyDbb8drQf1NfUd2AF7OMeG3tf4+K2OrYiY5J6B/zNs9wEVHzUwR91t/B5fiUgtZHHGRHmEj
	BZtGiTxlwg0C9dJYUdWutdx9ldgIwEkhIk4TPkN739zSec67pEkZdROQnFnlzw3SPDjKPtYmbWm
	DlB3G8gYNF4hgq8/yzmlHBj2SH8Byk2HfP+g7dzWa88btTW//pwMmizdW6L2KZ22sfuDOKMOtb2
	uHoYBq7ZgnSLNacLIzi4ZF4vIpdcPQpt7/4y9PKlNGqxG4GX+/lsUO9EB3S3To//dKjv6ndIQGH
	TRE1U6FsjrIhhu+HAG44KVco=
X-Google-Smtp-Source: AGHT+IH4ppqbUnoTTXUIx1RQgPydaka3yW2txb0onCLqwLan4yrsx4i/OEMfIEvr9ypXTbr3t6mYQw==
X-Received: by 2002:a05:6a21:33a8:b0:236:355d:5f23 with SMTP id adf61e73a8af0-236355d6353mr1630121637.39.1752510221634;
        Mon, 14 Jul 2025 09:23:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 15/15] ltp: backport patch to fix compilation error for Skylake -march=x86-64-v3
Date: Mon, 14 Jul 2025 09:23:09 -0700
Message-ID: <4225c9abbc68e1a29a54927a9c8e1fe12208e5b4.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220253

From: Yogesh Tyagi <yogesh.tyagi@intel.com>

When the input compiler enables AVX, stack realignment requirements
causes gcc to fail to omit %rbp use, due to which the test fails to
clobber %rbp in inline asm.  Disable AVX to build the test on x86_64 so
that the test continues working.

(From OE-Core rev: bbd3e7886e2ec5ab3578d618b28d007a80d917aa)

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...cve-2015-3290-Disable-AVX-for-x86_64.patch | 42 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20250130.bb     |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch b/meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch
new file mode 100644
index 0000000000..c6fae88eb9
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch
@@ -0,0 +1,42 @@
+From 28d823a63ee29f5d72c2aba781a06a7e2651cadc Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddhesh@gotplt.org>
+Date: Mon, 7 Apr 2025 06:24:47 -0400
+Subject: [PATCH] cve-2015-3290: Disable AVX for x86_64
+
+When the input compiler enables AVX, stack realignment requirements
+causes gcc to fail to omit %rbp use, due to which the test fails to
+clobber %rbp in inline asm.  Disable AVX to build the test on x86_64 so
+that the test continues working.
+
+Link: https://lore.kernel.org/ltp/20250407102448.2605506-2-siddhesh@gotplt.org/
+
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/28d823a63ee29f5d72c2aba781a06a7e2651cadc]
+
+Reviewed-by: Martin Doucha <mdoucha@suse.cz>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
+
+---
+ testcases/cve/Makefile | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
+index 01b9b9ccb..98c38e908 100644
+--- a/testcases/cve/Makefile
++++ b/testcases/cve/Makefile
+@@ -22,6 +22,12 @@ ifneq (,$(filter $(HOST_CPU),x86 x86_64))
+ meltdown: CFLAGS += -msse2
+ endif
+ 
++# The test needs to clobber %rbp, which requires frame pointer omission.  Also
++# for x86_64, disable AVX since that could sometimes require a stack
++# realignment, which gets in the way of frame pointer omission.
+ cve-2015-3290:	CFLAGS += -pthread -fomit-frame-pointer
++ifeq ($(HOST_CPU),x86_64)
++cve-2015-3290: CFLAGS += -mno-avx
++endif
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+-- 
+2.37.3
+
diff --git a/meta/recipes-extended/ltp/ltp_20250130.bb b/meta/recipes-extended/ltp/ltp_20250130.bb
index 690224e6d7..f9521acbc6 100644
--- a/meta/recipes-extended/ltp/ltp_20250130.bb
+++ b/meta/recipes-extended/ltp/ltp_20250130.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-kernel-kvm-don-t-hardcode-objcopy.patch \
+           file://0001-cve-2015-3290-Disable-AVX-for-x86_64.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


