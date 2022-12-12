Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF96C4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 21:03:12 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.55975.1670878987593925394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 13:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nCFJQwgN;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d15so3785529pls.6
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 13:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxIK7cgEuXqIfvFV3PZN20efhWUb6Ymg6b+8ku6TDkw=;
        b=nCFJQwgNooGf0XmE7Hmj1eX1q0/f/LXk8iSwL7w9TtF4umKb2VJz1KC8cZqygXdc9u
         BBzecNDfUhnEnlQVWek8shWkaba23ZfI3bbn2XgxrMtZpDWYtda80edMhCnoskmd5+Z4
         k5pAadCSi81V88kJ/pfIsAo0v5acspjD/QEv0TJGiez7XKWECI/xQpydwhh/kYMblI2L
         8qx18T6cU+pfEy8bH9ptxQwPe5XR93+NABKmI7jPHbu0gcLIObflBc379Ei/EQNu1Ik2
         ub/1GjbwXd0TdvvmZ+T5fOozt4IpSacNgC/1Gvmd33Rp821cJMUMLZRBM5yD20bid67W
         T8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxIK7cgEuXqIfvFV3PZN20efhWUb6Ymg6b+8ku6TDkw=;
        b=tDIPcOKCAcmG4QlXuAN9Tp2CNMumPdyaicEObG+DE2Y51lv36cC1+fAk5R7Fqn04l2
         8eQCaZUeRG/hXcxv2sh7+kd4kMxspWiN1AVE1sianIEipHUzbibNPR4vs+dCjI9IIo06
         cUB8cLPp95U8jgGoEQjUFOe3bd7J8vrtQxmYYbupiaPmjbPdxpBnBwXkG+HHUpNvbdLG
         jqs+fPlOCJiwIgaeu/OGZqKGGgb1R8PqFV7764QDkrgETknKaEWSwZDnnhtjLUBVF8lc
         V/WeLzocR8f0ZytrnJreYr0b08BZqKkjRA586SCzuc0DOGze1aFhNdkTVbVBmbe4vTfg
         i7Cw==
X-Gm-Message-State: ANoB5pkVwOxtW58J1Qbi/Ar0d+J+C2PTpL74+iMkMiCwbOnHCwXPdssz
	B0UWfl2zJRAAy2BLZOolahWVv1jkQPc=
X-Google-Smtp-Source: AA0mqf5MbrfhZQMDbIHnm3plmDjMtxF68AdyyF0svrPnTt67R4Grrj7LxgcD8uD3EDoBg6iU2bWeGA==
X-Received: by 2002:a17:902:6b05:b0:185:441f:7087 with SMTP id o5-20020a1709026b0500b00185441f7087mr17624492plk.12.1670878986782;
        Mon, 12 Dec 2022 13:03:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id i13-20020a170902c94d00b00186c54188b4sm6842987pla.240.2022.12.12.13.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 13:03:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gptfdisk: Enable largefile support functions
Date: Mon, 12 Dec 2022 13:03:03 -0800
Message-Id: <20221212210303.3756051-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221212210303.3756051-1-raj.khem@gmail.com>
References: <20221212210303.3756051-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 21:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174503

Ensures it builds/works fine when _LARGEFILE64_SUPPORT is disabled.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Use-64bit-time_t-on-linux-as-well.patch | 32 +++++++++++++++++++
 meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/fdisk/gptfdisk/0001-Use-64bit-time_t-on-linux-as-well.patch

diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-Use-64bit-time_t-on-linux-as-well.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-Use-64bit-time_t-on-linux-as-well.patch
new file mode 100644
index 0000000000..80e6f1bc9c
--- /dev/null
+++ b/meta/recipes-devtools/fdisk/gptfdisk/0001-Use-64bit-time_t-on-linux-as-well.patch
@@ -0,0 +1,32 @@
+From cbdbabcc14e4ae4debcc64e41c0bb97d47b4eeef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 12 Dec 2022 12:50:07 -0800
+Subject: [PATCH] Use 64bit time_t on linux as well
+
+Alias 64bit version of stat functions to original functions
+we are already passing -D_FILE_OFFSET_BITS=64 in linux Makefile
+
+Upstream-Status: Submitted [https://sourceforge.net/p/gptfdisk/code/merge-requests/29/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ diskio-unix.cc | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/diskio-unix.cc b/diskio-unix.cc
+index 7780aeb..0897c56 100644
+--- a/diskio-unix.cc
++++ b/diskio-unix.cc
+@@ -37,8 +37,12 @@
+ 
+ using namespace std;
+ 
+-#ifdef __APPLE__
++#if defined(__APPLE__) || defined(__linux__)
+ #define off64_t off_t
++#define stat64 stat
++#define fstat64 fstat
++#define lstat64 lstat
++#define lseek64 lseek
+ #endif
+ 
+ // Returns the official "real" name for a shortened version of same.
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
index 4a25945363..66935b7fbb 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-gptcurses-correctly-include-curses.h.patch \
            file://0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch \
            file://0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch \
+           file://0001-Use-64bit-time_t-on-linux-as-well.patch \
            "
 SRC_URI[sha256sum] = "dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f482dd855774e2d50c2"
 
-- 
2.39.0


