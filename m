Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29148C46CA2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 06:08:23 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.37564.1702879698953256669
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 22:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kl+/rpqn;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5cd68a0de49so1991288a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 22:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702879698; x=1703484498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6XTO5CCeVBAT0yOYTNMzfmkUurQKCr6yiPBHdW3iNo=;
        b=kl+/rpqnxiR+kbtoGd2lLhUmM7rbg6utTf3wHGfa580CbXJByXOGbrVgCFAjljVO4L
         txqIMZghrf3q+VzQ2q2wWCvUMKIkCgJHr26nuuOe4AGCw5y30YO/wCK31W7RjsN/iHbZ
         RpRYWVfivOVXTCwJofTZ/IOAiCuwilobeJ55eWI2OX9cIrTUTI7zAiqEVagnH2SBEb4b
         iWjHvUKUfDBXdFUZxBEfLudTcX0WWg98f7yAyWiInIXn8b729hPee9Z3iUuqbVji7IvB
         MNy1NntAin4pmr6f5CgT5VgK7HvfQ/EBqiBmPUv4dIrxqixzkhJHsDxE2k1V+VauoKYk
         ckBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702879698; x=1703484498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6XTO5CCeVBAT0yOYTNMzfmkUurQKCr6yiPBHdW3iNo=;
        b=wCyM4IP+RNJ29XC+auhny5ueNALfip8PV3UUHwDt8TOO0K3pisXuKfbGZa60GaMr/H
         465UL7iiYfCDIxXEK0dB+k7LEbEFcgTBlsOYgknLujpsBxoEKdrz3g5MkfTDvL44PXhk
         LAwA8wsfuq1RfTAXh5t0eS6mve1gm96fq6P0j6Zys4fiSXU67NPoFutgNTUW+XdWWerp
         THVjbh5u+qCIMhyTrLTYYf09sxs/7qERPTnjYa+mMJ0PzitK7P+ojj1yNbMP6wrWy3+F
         /D2HRXzT7yBUciERSqGZLYnkN5yjMcXMM44GypNtXgjv/QCHAqS8jSZO6rUKcm+Ur46b
         zXPQ==
X-Gm-Message-State: AOJu0Ywkvvfg4eZjXGZ59DBHoUkfn9E2NkIs55F8NfpyiMFoTBYWd9Sz
	z7psok4ljVGdrdqEWZKcS1oXCgDCBcg=
X-Google-Smtp-Source: AGHT+IGaTLvaZo35AY6krx/kA2smjriU1eZZAqwmqP/hc/RfVcE+1MUZL4DVWgQMqaO8A609iPSgdw==
X-Received: by 2002:a17:902:868f:b0:1d3:b308:adb8 with SMTP id g15-20020a170902868f00b001d3b308adb8mr1381992plo.17.1702879698104;
        Sun, 17 Dec 2023 22:08:18 -0800 (PST)
Received: from kamensky-p15s.cisco.com ([2601:641:8080:1a70::73a5])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902e85200b001d0675e59f9sm18128716plg.200.2023.12.17.22.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 22:08:17 -0800 (PST)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH 2/2] systemtap: fix libdebuginfod auto detection logic
Date: Sun, 17 Dec 2023 22:07:57 -0800
Message-Id: <20231218060757.14170-2-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231218060757.14170-1-victor.kamensky7@gmail.com>
References: <20231218060757.14170-1-victor.kamensky7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 06:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192601

Addresses an issue when systemtap is built in situation where debuginfod
is not part of DISTRO_FEATURES and latest SystemTap has problem of
auto detecting libdebuginfod library as it was reported by Martin
Jansa in [1].

[1] https://lists.openembedded.org/g/openembedded-core/message/192109?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Csystemtap%2C20%2C2%2C0%2C102987514

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 ...-broken-libdebuginfod-library-auto-d.patch | 51 +++++++++++++++++++
 .../systemtap/systemtap_git.inc               |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch b/meta/recipes-kernel/systemtap/systemtap/0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch
new file mode 100644
index 0000000000..98641826f6
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch
@@ -0,0 +1,51 @@
+From 3913ad3e28a19811e1b52338112344a487057e4f Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <victor.kamensky7@gmail.com>
+Date: Mon, 18 Dec 2023 03:13:38 +0000
+Subject: [PATCH 1/2] configure.ac: fix broken libdebuginfod library auto
+ detection
+
+After 2e67b053e3796ee7cf29a39f9698729b52078406 "configury: rework debuginfod searches"
+commit, libdebuginfod.so library auto detection is broken. It was reported by Martin Jansa
+on openembedded-core mailing list [1].
+
+Currently configure.ac does "AC_DEFINE([HAVE_LIBDEBUGINFOD], [1] ..." as long as
+no --without-debuginfod option is passed, regardless PKG_CHECK_MODULES check result.
+It seems to be bad copy/paste. Address the issue by moving the AC_DEFINE back to
+PKG_CHECK_MODULES action-if-found block.
+
+To reproduce the issue on FC system, one can do the following
+"sudo dnf remove elfutils-debuginfod-client-devel" and then try to build SystemTap
+util.cxx will fail to compile because of missing elfutils/debuginfod.h because
+config.h will have "#define HAVE_LIBDEBUGINFOD 1", while config.log and configure
+output indicates that check for libdebuginfod library failed.
+
+[1] https://lists.openembedded.org/g/openembedded-core/message/192109?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Csystemtap%2C20%2C2%2C0%2C102987514
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/systemtap/2023q4/027914.html]
+Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
+---
+ configure.ac | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d9559c5c3..18cd7f84a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -219,12 +219,11 @@ dnl take the user at his or her word
+ elif test "x$with_debuginfod" != xno; then
+ dnl check in the system pkgconfig
+   PKG_CHECK_MODULES([debuginfod], [libdebuginfod >= 0.179],
+-    [have_debuginfod=1],
++    [have_debuginfod=1
++     AC_DEFINE([HAVE_LIBDEBUGINFOD], [1], [Define to 1 if debuginfod is enabled.])],
+     [if test "x$with_debuginfod" = xyes; then
+        AC_MSG_ERROR(["--with-debuginfod was given, but libdebuginfod is missing or unusable."])
+      fi])
+-  AC_DEFINE([HAVE_LIBDEBUGINFOD], [1], [Define to 1 if debuginfod is enabled.])
+-  AC_MSG_RESULT([yes])  
+ else
+   AC_MSG_RESULT([no])
+ fi
+-- 
+2.31.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 9fe85676fc..bebfa7f777 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -9,6 +9,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
            file://0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch \
            file://0001-prerelease-datestamp-fixes.patch \
+           file://0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
-- 
2.31.1


