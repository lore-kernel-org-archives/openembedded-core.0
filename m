Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325ADCA0EDC
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 13:29:34 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.74116.1755005365293613206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 06:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uCXS++Q/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76b8d289f73so5083632b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755005364; x=1755610164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlzwLM6hRfPjqE4oQmCtut717HsFmmt3hthuL5ePWeo=;
        b=uCXS++Q/PJLUhSbgFecGPEeRjh0SVQ79bfKGodC3PpWYlidaYN+YCgzHJu38LCdbXy
         j3o8RxzackwNlIO87K3dZ7aRAavKhddgT90agW349buTWyHebJ66FWo1QhI/tWuJRclG
         AJAqD2Pj5mOak8QtxSCQ01FY4j5Ji34VKqGbZVI1VZFNrtaPzzj8QQiAma4iPpyQT/uL
         KYU1kBCucIyNpeIaRYWxmv62xdHAryCb6YKWiWaTLWovpGXP1Sb/lRHAnggW8Ut9NbQe
         +Zl9PoZU+Ch+g2tHoGEwL7VeZffrbnIEMUnUyg84IJZpYuuuIEO4enveiajc7FKlag+u
         MnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755005364; x=1755610164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlzwLM6hRfPjqE4oQmCtut717HsFmmt3hthuL5ePWeo=;
        b=jb0jekigGBosFuh/iCOP+vlLa5PMkPpIPYia2k4kVuFdf3iCjbRpzquceO7gNhEx1w
         SvpfqTZvHZBGtS+pS0vUHf1LcRqVfPIBZ/tigW2kyYs8x0NNpkA3uxtf15mzwggeNc3d
         D2K8sAGjKDlRl82zxoVJ03p7dWAUGVZHr1arlOnPzI5jtPCKASevENa9c4H+4wDJmUpB
         NENQ+dq/oy43z/tC+LaC0PAvM4/A2cKu9SuN/HgB3XPLbRiN5m3zyA9/QiHEgom/vRpU
         jEds+5CPUljCEqMMIdpWJMB90hj3WDauOCEF42WmjYRE0YsQ2wIzWj2vCsOHnBjzSgJj
         /FRg==
X-Gm-Message-State: AOJu0Yzf77kOwSga8owID2W4+8hUB6QEB7Oo/AUW5urDj/OiyjAYB7nq
	BxQwyGF/BOBczcUEtColZiZRggdbpmivAfBTWK52VV9w8WjONFWIbH01DMS+Inn9IgyAVXMty8q
	wHAs9
X-Gm-Gg: ASbGncu3Pdr4EuYUXfG0ZLVxGCf6Ja4O+Oj7FxsLzUj4xwvxP8mw3oMgp7yNYBswQA7
	+Xz3z9K71QzJIoMEiazOjRfbHD66cjf38pb1tC7sAv33SoRfFBWWodxUoAqkNbXKZMpUls+GI2Z
	k9m67nCqbRV1AoOgZxIBC/4i8HSBgq/0LCQNz2JahXSAJmH2IovYuqaogRJFEQ1WHaTzSx1UbYZ
	1XWXW6DuCUBIV3TXWa59gIqpQOALMGykNdIyVa8Ibt94E/wX1/7ym3udrUUEdZJ+tHTVM+6zfo8
	duEx3Op+wZ9uwsp8exyqfsGvxmLLmxFTfSEEhl5OD2DG3MYW8GE2iG9aGE4s6hsnKBUD4Mf+3Nk
	8R+XoljDQEgzSFw==
X-Google-Smtp-Source: AGHT+IHaayE/e53QfQvYEeJto1LC1K15v3SDDfIlDSN9lPA8c9r6SHMBr7hHS0b8wEfWHscuXZaC/g==
X-Received: by 2002:a05:6a00:1ad4:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-76e0de1023cmr4693225b3a.7.1755005364511;
        Tue, 12 Aug 2025 06:29:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:43a9:39c9:3131:3b8a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bf067e310sm24664635b3a.25.2025.08.12.06.29.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:29:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 2/3] glibc: Forward -ffile-prefix-map option to assembler flags
Date: Tue, 12 Aug 2025 06:29:14 -0700
Message-ID: <35a25a6c4818eea40507581a9b600cbb388103d5.1755005205.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755005205.git.steve@sakoman.com>
References: <cover.1755005205.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 13:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221771

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: a85cccc80aa7e6d6a5850c2d730cba5e1cb60cb3)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...le-prefix-map-from-CFLAGS-to-ASFLAGS.patch | 24 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.41.bb         |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch b/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
new file mode 100644
index 0000000000..96140c625b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
@@ -0,0 +1,24 @@
+From 603e50d6b8ccadb32d59b0497f76629665c1794b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 16 Apr 2025 19:51:01 -0700
+Subject: [PATCH] Propagate -ffile-prefix-map from CFLAGS to ASFLAGS.
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/libc-alpha/2025-April/165969.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ Makeconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makeconfig b/Makeconfig
+index e35c5cfe4e..7a19c731c6 100644
+--- a/Makeconfig
++++ b/Makeconfig
+@@ -1176,7 +1176,7 @@ endif
+ 
+ # The assembler can generate debug information too.
+ ifndef ASFLAGS
+-ASFLAGS := $(filter -g% -fdebug-prefix-map=%,$(CFLAGS))
++ASFLAGS := $(filter -g% -fdebug-prefix-map=% -ffile-prefix-map=%,$(CFLAGS))
+ endif
+ override ASFLAGS += -Werror=undef $(ASFLAGS-config) $(asflags-cpu)
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index 8a65e8ce9f..e770c3e275 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -54,6 +54,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
+           file://0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.43.0


