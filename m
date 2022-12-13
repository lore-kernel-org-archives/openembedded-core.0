Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05224C2D0CD
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:47 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.70922.1670929891962143381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c3YvVSNj;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id h12so15198441wrv.10
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5Ln/1SedIvJtsKSoF7xBebOZamcYaA3vGJ1MWDAaRU=;
        b=c3YvVSNjZ5ZMQaaD7U5gZHEHhXHE3UAKXB62blCPU2qCUBW/xXYPdZgbOdPjhTs4JI
         A2aSeVL0WhJFCDHwYpaxxKUIvpQcga1gknl5otAnJTdRFeaWETJjz1PoNPn8Lf0vfJxK
         SjIzxNg7rMXeJ73gVYtRLGZPPIjHTjsIBCSkeNz9n/TbpDN8lUMTtxlNd5pgrTcDpAeN
         EyYThJ/Q6aZ1bB9UprxrlSrCFV0hYrNunec/bdmiGzJR6xbxCtDZHfcqz1vx1PzJmkCG
         ks1FLFfCTpUFA43pawpNULNNp6UGZur4/PYkwyhEpXMsVmomeuFMJDohwrEyVFSadAMy
         b3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5Ln/1SedIvJtsKSoF7xBebOZamcYaA3vGJ1MWDAaRU=;
        b=EZ2Fk5D1NxndOYf50YI4ktjNWqL+HPQ7nIfBu62rTJ4ySnTYHkUVacgTcXsQb2GhFh
         vLjIDdPhP+mop+bMsCnQ4Cld3A5SpKE2ySgjZM2DQGqERLoMiRDwiAxmpzK0W9Z60SNn
         064HGjquKQ6Svl/UW4gn3LVgE3O8q1oJPYTh6sKusp+ZAhO8FW+UL0mM1GX+1AxEYvJF
         b4EU+dEIQi1694NjnxCbcldDhqUYdbAXSEA2woXzwzTTvbn3SsGuljrrJPEOQA1/g62W
         1qIA/pg+tKDhBN5l1XUAj1xbNL3W/OKO89aBukme3sTHZkA3ArcOgtV0iivvUbAKlKpz
         DPLQ==
X-Gm-Message-State: ANoB5pl8/XTWQEXlNPnJqBj7+E4CJb9sKuTa0kIUbObd/GYU8gAUAu6S
	H5cjS1875Qy97517Prm9XsO0kghqXmc=
X-Google-Smtp-Source: AA0mqf5hVFOH8LzGSU7bEYK8CmOiR3dMPkbdZOXDDosXj3zkNCKvl+mYU5OrlRzogTJCH8lh1D0TJg==
X-Received: by 2002:a5d:6acb:0:b0:242:48ff:4003 with SMTP id u11-20020a5d6acb000000b0024248ff4003mr10479518wrw.11.1670929898120;
        Tue, 13 Dec 2022 03:11:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/24] ruby: update 3.1.2 -> 3.1.3
Date: Tue, 13 Dec 2022 12:11:14 +0100
Message-Id: <20221213111118.149697-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174530

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-Remove-dependency-on-libcapstone.patch | 36 -------------------
 .../ruby/{ruby_3.1.2.bb => ruby_3.1.3.bb}     |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
 rename meta/recipes-devtools/ruby/{ruby_3.1.2.bb => ruby_3.1.3.bb} (97%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch b/meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
deleted file mode 100644
index 5d0f8fcc09..0000000000
--- a/meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 222203297966f312109e8eaa2520f2cf2f59c09d Mon Sep 17 00:00:00 2001
-From: Alan Wu <XrXr@users.noreply.github.com>
-Date: Thu, 31 Mar 2022 17:26:28 -0400
-Subject: [PATCH] Remove dependency on libcapstone
-
-We have received reports of build failures due to this configuration
-check modifying compile flags. Since only YJIT devs use this library
-we can remove it to make Ruby easier to build for users.
-
-See: https://github.com/rbenv/ruby-build/discussions/1933
-
-Upstream-Status: Backport
----
- configure.ac | 9 ---------
- 1 file changed, 9 deletions(-)
-
-Index: ruby-3.1.2/configure.ac
-===================================================================
---- ruby-3.1.2.orig/configure.ac
-+++ ruby-3.1.2/configure.ac
-@@ -1244,15 +1244,6 @@ AC_CHECK_LIB(dl, dlopen)	# Dynamic linki
- AC_CHECK_LIB(dld, shl_load)	# Dynamic linking for HP-UX
- AC_CHECK_LIB(socket, shutdown)  # SunOS/Solaris
- 
--if pkg-config --exists capstone; then
--   CAPSTONE_CFLAGS=`pkg-config --cflags capstone`
--   CAPSTONE_LIB_L=`pkg-config --libs-only-L capstone`
--   LDFLAGS="$LDFLAGS $CAPSTONE_LIB_L"
--   CFLAGS="$CFLAGS $CAPSTONE_CFLAGS"
--fi
--
--AC_CHECK_LIB(capstone, cs_open) # Capstone disassembler for debugging YJIT
--
- dnl Checks for header files.
- AC_HEADER_DIRENT
- dnl AC_HEADER_STDC has been checked in AC_USE_SYSTEM_EXTENSIONS
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.2.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
similarity index 97%
rename from meta/recipes-devtools/ruby/ruby_3.1.2.bb
rename to meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 0115daf22a..c8454da3a9 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -29,7 +29,6 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
-           file://0001-Remove-dependency-on-libcapstone.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
@@ -50,7 +49,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "61843112389f02b735428b53bb64cf988ad9fb81858b8248e22e57336f24a83e"
+SRC_URI[sha256sum] = "5ea498a35f4cd15875200a52dde42b6eb179e1264e17d78732c3a57cd1c6ab9e"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.30.2


