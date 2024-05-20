Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9113FC25B7A
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:34:06 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.60348.1716212039102432283
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mekCIq3q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f2ecea41deso66248335ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212038; x=1716816838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4+bi9Np6KOgwEwbkTuBHdqoIlxj+6S/e6P1SVF46hU=;
        b=mekCIq3qA+jbunnyG+yJZeu2ZVgdjxMd8A4RFHB2URh72qEQTzM8LoCIa8V8Lim/qj
         3ufIvNThtWmhRJmX1g7RtPoqGZCKsmmz9X72VPQd+n3YZW1uOBK1/l8k9suqQ0z+gH6u
         nwLPaOmRMHISLTknWhj2kAxnycS9/mpkxfv0VaDJYFGO3tiKcvJdyN5JqX0663YF5pi0
         uUWX/zWUy7zDawLYPaAFkvXc6FUJZEaLaBI7e32aurYWanli1U0PMR0YPq9DeO1brgmE
         /ZuBOqNNbqsi4QuIOn7Qxsj/26aIKB2Qa6hcxOWwGVU5sJMvLKzWsm+2mNz4u7Auzbi4
         0x9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212038; x=1716816838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4+bi9Np6KOgwEwbkTuBHdqoIlxj+6S/e6P1SVF46hU=;
        b=GpuRk1PyTjw9bDkiNNpVqB/hyrdpUAZ+zgot15A3QXxfJME/KNdJO9bgXFiT6Hs3sd
         MAg62HE+R8Ln3W7/3aDawfD82pWA43mUd8qgl3w6h8nrnUKNqgGf2c+r+n2jT1VBjovg
         jzRmqDg6DvB6QSDOfXLi92IyJsqkiopXg85nzeCJduQ/HyyjvzhjxnqiAehUp6gn1DMb
         I8A3HAJFtoqpjKT58t1UuIaa1QIALlsv2fltY0j+Sh6ISXCnj8lAkOEfaSRx8UZyDLcM
         3fUaSkgIKNlvanJHdi2SGJ+o9W2D8gjrmEGfq5gi91QLZIq6ZHwsEx+BgHiha9iH2r1i
         jkgQ==
X-Gm-Message-State: AOJu0Yx+1BZnCziMnXMiZa1NB0N5CeAUipE2KTPNDsXoyQOqK7R61enr
	4/Cy5l2yI/wf2DDXohUpTm9pl4s2EESYiOv+qzqToJOpAt/vszTZBnNztdrwnzh2q+WRX3UYDlC
	e
X-Google-Smtp-Source: AGHT+IFOn1/GTpv6OnAkLiIY5a5FLj/jLK9QrltwapzcrEv7dnn8JIKPKl6B7ceAdbbI+kV0DmN5pg==
X-Received: by 2002:a05:6a20:7350:b0:1af:a72e:8b7e with SMTP id adf61e73a8af0-1afde1b6f32mr34067669637.50.1716212038383;
        Mon, 20 May 2024 06:33:58 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/21] libcgroup_3.1.0: fix build on non-systemd systems
Date: Mon, 20 May 2024 06:33:25 -0700
Message-Id: <c0708adce620bcce5e503851fa6598bd941276eb.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199585

From: Adriaan Schmidt <adriaan.schmidt@siemens.com>

backport upstream commit 592dcdcf243576bd2517d3da9bc18990de08e37e
to fix packaging when building with --enable-systemd=no

Signed-off-by: Adriaan Schmidt <adriaan.schmidt@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...akefile-install-systemd.h-by-default.patch | 37 +++++++++++++++++++
 .../recipes-core/libcgroup/libcgroup_3.1.0.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch

diff --git a/meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch b/meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch
new file mode 100644
index 0000000000..4b743f9b33
--- /dev/null
+++ b/meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch
@@ -0,0 +1,37 @@
+From 592dcdcf243576bd2517d3da9bc18990de08e37e Mon Sep 17 00:00:00 2001
+From: Kamalesh Babulal <kamalesh.babulal@oracle.com>
+Date: Mon, 27 Nov 2023 20:07:33 +0530
+Subject: [PATCH 1/1] include/Makefile: install systemd.h by default
+
+Install systemd.h header file by default, as we have stub and defined
+versions of the systemd functions for both non-systemd and systemd
+enabled configurations.  This will help packagers to ship package
+without systemd support (--enable-systemd=no).
+
+Signed-off-by: Kamalesh Babulal <kamalesh.babulal@oracle.com>
+Signed-off-by: Tom Hromatka <tom.hromatka@oracle.com>
+
+Upstream-Status: Backport [https://github.com/libcgroup/libcgroup/commit/592dcdcf243576bd2517d3da9bc18990de08e37e]
+
+Signed-off-by: Adriaan Schmidt <adriaan.schmidt@siemens.com>
+---
+ include/Makefile.am | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/include/Makefile.am b/include/Makefile.am
+index 23cebaac..4cb05529 100644
+--- a/include/Makefile.am
++++ b/include/Makefile.am
+@@ -2,8 +2,4 @@
+ nobase_include_HEADERS = libcgroup.h libcgroup/error.h libcgroup/init.h \
+ 			 libcgroup/groups.h libcgroup/tasks.h \
+ 			 libcgroup/iterators.h libcgroup/config.h \
+-			 libcgroup/log.h libcgroup/tools.h
+-
+-if WITH_SYSTEMD
+-nobase_include_HEADERS += libcgroup/systemd.h
+-endif
++			 libcgroup/log.h libcgroup/tools.h libcgroup/systemd.h
+-- 
+2.39.2
+
diff --git a/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb b/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb
index 4b4f19e36f..a1d27c7e7f 100644
--- a/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb
@@ -13,6 +13,7 @@ DEPENDS = "bison-native flex-native"
 DEPENDS:append:libc-musl = " fts"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
+           file://0001-include-Makefile-install-systemd.h-by-default.patch \
 "
 UPSTREAM_CHECK_URI = "https://github.com/libcgroup/libcgroup/tags"
 
-- 
2.34.1


