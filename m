Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE5CCEB2CC
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 22:29:25 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.68083.1727735356832879762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 15:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BVOEyHf/;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71c5df16b10so2869354b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 15:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727735356; x=1728340156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zvJuAqUk+m6+QA7Cdc6hOXxznpXDhgVlA8i08cd+eKU=;
        b=BVOEyHf/m70qiOcanvOSODHqPw9bLucBZ9uo1THiBndUTHzYESazu3b5ByIImoFWfQ
         aGeviPdVQPJorVDslxL/g9l0rkerNe0xJVh91wjLZW6ZSfxTrRbm6CYlsrkpRK3/KBPk
         OgYqRrD/jZgFDLRYmM2fqjKsgsvg/YBmJopt4ILhhGOJo3wSbXdXyXC6hJpnSR8jLdDW
         0rMDZ07m7mgIWwW9JFcTXkXbxY9QsdeD+mU1Uo7xHD1+vN2FRnpMgF5KX5/74usXeQZQ
         bPlzarv/M9l0mOOY5Xk+JNiwQfd3ckRwDUjPGFXIL07jSmFSNyc0+F8YP22exPU6Ry39
         74MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727735356; x=1728340156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvJuAqUk+m6+QA7Cdc6hOXxznpXDhgVlA8i08cd+eKU=;
        b=ZjHF1/2zsTecaU/M3+iHts6lKN1PMYFtHWf0Q1WWLGHe0Vybo0tWSqkAdMbfKM0vgJ
         fObJQo4E/Vtne28YqH38M56SOnr+L9J3JlW8bNB6eVWPSmU9qDSL+Z3j12S/OBQA2VMo
         xJISKIA9xXyTlHw2EsO7jk+pFdGoVuURM4ocDCy10V+f+bMB29pNYYgAuHGWzKN94GK3
         bigZvCWW24aUNcWwV3M04RA44asrnhnogcfR0SU2MnRuQJvYolpvI5bfmp/y3IbvkKYk
         x8HuS5zQm7IPmhMOxEsjVRcRBZQ4vN1RUYQ6xC8VvSq3EDC48lYmYV3B2O6mi/s6hlLh
         1GTw==
X-Gm-Message-State: AOJu0YxvuP1gm2PgVuj8VSBebOAAq29PgvxknkoU6ljh5VBl+W6wnlvw
	mMEtUGRug16B27usjv5UEamcNwejDS3cwX76LupscPkJzcbMxhyrkd3SgQ==
X-Google-Smtp-Source: AGHT+IFMUoTf/J/GAKiRmGwyRYVjxDGDceF9XWSeJVGtF+FGhO7temu8gfqUYp4yybCFb6ljrTFI0A==
X-Received: by 2002:a05:6a00:9a1:b0:70d:2a88:a483 with SMTP id d2e1a72fcca58-71b25daa507mr22768981b3a.0.1727735355993;
        Mon, 30 Sep 2024 15:29:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ae14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b7dd6sm6774526b3a.46.2024.09.30.15.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 15:29:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] strace: Define sched_attr conditionally
Date: Mon, 30 Sep 2024 15:29:12 -0700
Message-ID: <20240930222913.3981407-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 22:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205126

So that it does not conflict with glibc 2.41+ newly added definitions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-conditionally-on-SCHED_ATTR_SIZE_V.patch | 49 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_6.11.bb   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-sched_attr-Define-conditionally-on-SCHED_ATTR_SIZE_V.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-sched_attr-Define-conditionally-on-SCHED_ATTR_SIZE_V.patch b/meta/recipes-devtools/strace/strace/0001-sched_attr-Define-conditionally-on-SCHED_ATTR_SIZE_V.patch
new file mode 100644
index 00000000000..b8d57797dfe
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-sched_attr-Define-conditionally-on-SCHED_ATTR_SIZE_V.patch
@@ -0,0 +1,49 @@
+From d162a1d6b18348955f9989f150c86a68af096362 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 30 Sep 2024 15:17:16 -0700
+Subject: [PATCH] sched_attr: Define conditionally on SCHED_ATTR_SIZE_VER0
+
+glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
+and struct sched_attr. Therefore, it needs to be checked for here as well before
+defining sched_attr
+
+Fixes builds with glibc/trunk
+
+In file included from ../../strace-6.11/src/sched.c:14:
+../../strace-6.11/src/sched_attr.h:16:8: error: redefinition of 'sched_attr'
+   16 | struct sched_attr {
+      |        ^
+/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/strace/6.11/recipe-sysroot/usr/include/linux/sched/types.h:98:8: note: previous definition is here
+   98 | struct sched_attr {
+      |        ^
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=21571ca0d70302909cf72707b2a7736cf12190a0;hp=298bc488fdc047da37482f4003023cb9adef78f8
+
+Upstream-Status: Submitted [https://github.com/strace/strace/pull/318]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/sched_attr.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/sched_attr.h b/src/sched_attr.h
+index 26c53172f..a5b5d94ce 100644
+--- a/src/sched_attr.h
++++ b/src/sched_attr.h
+@@ -11,6 +11,8 @@
+ 
+ # include <stdint.h>
+ 
++# ifndef SCHED_ATTR_SIZE_VER0
++
+ struct sched_attr {
+ 	uint32_t size;
+ 	uint32_t sched_policy;
+@@ -25,6 +27,8 @@ struct sched_attr {
+ 	uint32_t sched_util_max;
+ };
+ 
++# endif /* SCHED_ATTR_SIZE_VER0 */
++
+ # define SCHED_ATTR_MIN_SIZE	48
+ # ifndef SCHED_ATTR_SIZE_VER1
+ #  define SCHED_ATTR_SIZE_VER1  56
diff --git a/meta/recipes-devtools/strace/strace_6.11.bb b/meta/recipes-devtools/strace/strace_6.11.bb
index d98b5fdec9a..45e1c26627f 100644
--- a/meta/recipes-devtools/strace/strace_6.11.bb
+++ b/meta/recipes-devtools/strace/strace_6.11.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
+           file://0001-sched_attr-Define-conditionally-on-SCHED_ATTR_SIZE_V.patch \
            "
 SRC_URI[sha256sum] = "83262583a3529f02c3501aa8b8ac772b4cbc03dc934e98bab6e4883626e283a5"
 

