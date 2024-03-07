Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E89CC54E5C
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 23:37:53 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.8653.1709854665458462427
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 15:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yuNk4tgJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dca3951ad9so11933595ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709854665; x=1710459465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyOwqaLRSuoQ5CSMlxyHzkhR/zqj26Ke9wY1a7WHgE8=;
        b=yuNk4tgJUfqKQBCxcNq2wNKDSctW70dfZguh1j4s3KBSOykwxJKA5YtTsu3xgEH6Jw
         hwn+9nMK9N3x5rMxAYehuJlIeODNbegq0EQWj5n6Jc5bDuaePzCxwvTkibQS3SxRya4a
         Ia7ZBgawUJJS/JDulfhox2T5CHqJ+xFM+U6fSKEHo7+LnvnImtRuQi55h+6KKBFKcJQH
         0cqzM2qASTstc/ZKa6jm43ixRwpWH5w5+uYLbfWug0JORzrKKaaxxjXRY4uqnyViO1jv
         hF+/3rPmWYU9V4vpS4DHzEIxZGw+qyQEVz5NRlcJ/PUBQXoagmhxIMiIDd3dKD1vLwVl
         uFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709854665; x=1710459465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyOwqaLRSuoQ5CSMlxyHzkhR/zqj26Ke9wY1a7WHgE8=;
        b=ikP4TqhnvdIp+oufpAJGLNvZnsoXiKLJJhos2umgqF8/6YeEgvrCzOKSaBuPAE8EKb
         1ndbz4QSXQVNWKhW6BwJIZcGiPpzP2pKfLqEoJMdRYQymjlGgViEMq+jV3h+hl+w4blg
         oOF/9EjVDFvn+ZGfSrJmgJraLVvneLOzu15rSnIMQCqD+R74RNzvHGa2QgnMcWZQXg+D
         DmlvbkQ0ZAh05fAH0gk5tqKJI6zSc1aPszkipy3d5BZQprURk2DtA900Fx93p+xNhdco
         uo4Hb2VXF05Bgy9dq9Q0tEZCSQCG+n1bCkO1Ie4aLFocvAF6AxoVSP2VcabCuvD8ZYhH
         Y6cQ==
X-Gm-Message-State: AOJu0Yyv+PKWRYlcChoMNOHydZYz74lJD1x/oIBZpHOTGbyxSG7yOO4h
	6WE/qx8sk3mKO7cvWFIs3l27BPIzsOhKtQVSS/g3Uf7/uECc6xnx6gZTmZUAShOHdHHn5NKDfeG
	0kOY=
X-Google-Smtp-Source: AGHT+IFGzq1uyCRmDuH9AJKcjhWi+CeIBZ9Mot/vKm/W+hyuuM8ZEgYBWoSwPgmM4iW8az7cfauTjQ==
X-Received: by 2002:a17:902:e88d:b0:1db:35b5:7e37 with SMTP id w13-20020a170902e88d00b001db35b57e37mr11083399plg.50.1709854664749;
        Thu, 07 Mar 2024 15:37:44 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001dd526ff7d2sm1933243plw.308.2024.03.07.15.37.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:37:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/9] Revert "linux-yocto/5.15: update to v5.15.142"
Date: Thu,  7 Mar 2024 13:37:20 -1000
Message-Id: <bd05710f8f279d7e51e3a0f96ca3d7c1442e7a42.1709853987.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709853987.git.steve@sakoman.com>
References: <cover.1709853987.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 23:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196835

This series is causing issues with adding and resizing partitions.

This reverts commit 4deed206f92fc207d18cdb4c8bc35ce1bf0fb0f6.
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 37fb729e0d..f7286759a9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "205938506aafa86698f2753a59d2c9f13d080fbb"
-SRCREV_meta ?= "9a1e0301f56cda16a9fabd03745dba445f068349"
+SRCREV_machine ?= "423b5d5cb3f45a272285fa4157d1964086fabc2e"
+SRCREV_meta ?= "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.142"
+LINUX_VERSION ?= "5.15.141"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index f502030c9d..7461087299 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.142"
+LINUX_VERSION ?= "5.15.141"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "53b8058476d634a0103dff993e24d15b1fd087c7"
-SRCREV_meta ?= "9a1e0301f56cda16a9fabd03745dba445f068349"
+SRCREV_machine ?= "ddf2eeeb31d1edaa5a80e9aabc8b2674ae95f865"
+SRCREV_meta ?= "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 1021065bf7..c7b07dee62 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "325679bc1a595ca81783f7652e13ce7f2be58620"
-SRCREV_machine:qemuarm64 ?= "338f086bcd841a5b0239ddb66c34ca23ff5af2f5"
-SRCREV_machine:qemumips ?= "af26192f4dd0fc7396faedd4653034ae02d5ed6d"
-SRCREV_machine:qemuppc ?= "be567407d4d9009407c4e7a511e7227fcb36b0b7"
-SRCREV_machine:qemuriscv64 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
-SRCREV_machine:qemuriscv32 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
-SRCREV_machine:qemux86 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
-SRCREV_machine:qemux86-64 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
-SRCREV_machine:qemumips64 ?= "3a2ff5c2f2e6e0c0653da1192081681e2a50b592"
-SRCREV_machine ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
-SRCREV_meta ?= "9a1e0301f56cda16a9fabd03745dba445f068349"
+SRCREV_machine:qemuarm ?= "0bd882ff2a47566033965928ab468491f7e1ffd6"
+SRCREV_machine:qemuarm64 ?= "d353330a9ba30300be32f1d732723ae3678da684"
+SRCREV_machine:qemumips ?= "7f8fbffda634dc22a70f69ff2b762a1f3ff9c842"
+SRCREV_machine:qemuppc ?= "fb2191ca96824c7451fbca4eef129660d25711af"
+SRCREV_machine:qemuriscv64 ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
+SRCREV_machine:qemuriscv32 ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
+SRCREV_machine:qemux86 ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
+SRCREV_machine:qemux86-64 ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
+SRCREV_machine:qemumips64 ?= "35895af6b529915f9c09a720592554feaca9a2c7"
+SRCREV_machine ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
+SRCREV_meta ?= "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8a1d809b05454b2e08fb3d801787917975fdb037"
+SRCREV_machine:class-devupstream ?= "9b91d36ba301db86bbf9e783169f7f6abf2585d8"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.142"
+LINUX_VERSION ?= "5.15.141"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


