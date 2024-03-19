Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7678EC54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 11:14:09 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.12691.1710846848928270668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 04:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nrVPEsoQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-414676fe047so1883735e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 04:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710846847; x=1711451647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3/A9tcichSRwVI2q61xlkbcSo8dEOmjBuRvQjamrjk=;
        b=nrVPEsoQacA84teH+NLzQ4EQzinNn+oCbfvQIzk733fbiSnaecPBh/PwZtdsV6Uf0S
         qDiEkupZeLhJgtlDMgNnPZEdEEkD2sBWEf+lb/uKcPbwCuAxk2VfWbU+l4/OCcQsqiOg
         jhE+sqm4IkTJxly89yi97IJMCUUV7WX1WbI05WzySEegriRo9UD++UpreCxdW2dAf0FA
         I8l83FJeMDuK35foFdJt6fB6y+E6CvbHi+54cGdiN2VxTbbG7vapgjoWguAaqjYoT5ri
         3s7skyNsr/ex/oF+u5lUtaECy9TfJQdjn2ie7IhMEbetetbf3kcWaSBeqMeMtnB7KZ2I
         Y95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710846847; x=1711451647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3/A9tcichSRwVI2q61xlkbcSo8dEOmjBuRvQjamrjk=;
        b=w1jXwH3d5kpfW9X33ZDYCPbTl9mp0L2GMWlMvJ8reZz4txEJ9sLebGlmBREFK7gT47
         oanDCktQsjlxe3gDXbVkdKluNb0Hk1RKP7He22vobJ0VRWi8kRvIO1ds1TvQmrdQi+78
         S2Dss49wzlQXXlQ+ebHChgomBlvsbE6r2l6qBMNnQBS/5ZKRVKQrNtO+MjdSRnRhdFNP
         69x0TCYSnZ3kBAZ0/mYzHXtQJmZf89BxD9v0jvcgRTiIek+50pvs7dvSZDa301Cmhs8L
         efab3DvQUYdD4fLWRb9l9o2wkiR3yJkZdiJ1ZD92M62hN3rwpLCcdwfhMABCGuc/D1Jl
         C/HA==
X-Gm-Message-State: AOJu0YwmMK8WnNEOxF8lceInCJt76G5Yxob/SYT6JKmGxRtei2VqLy1C
	5aQBIPcjBcxvimny8UedG9NmUhdMOeCuM5FdR9ZfR4HMDU93RMdx7nSemRYR
X-Google-Smtp-Source: AGHT+IFxYueL+MrOk2PETsJea0bFyf4Y6xVvBNJrKdbdfHe3IKmumWZA6gPCK6jyfBE0Bg3WFjUwmQ==
X-Received: by 2002:a05:600c:4f08:b0:414:67ca:6aca with SMTP id l8-20020a05600c4f0800b0041467ca6acamr412595wmq.18.1710846846863;
        Tue, 19 Mar 2024 04:14:06 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c471100b004140e9211e7sm7412778wmo.35.2024.03.19.04.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 04:14:06 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v1] elfutils: fix unused variable BUFFER_SIZE
Date: Tue, 19 Mar 2024 11:12:59 +0000
Message-ID: <20240319111258.4155037-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 11:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197319

Fix build break with clang

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v1: change patch status to backport

 .../elfutils/elfutils_0.191.bb                |  1 +
 ...iles-fix-unused-variable-BUFFER_SIZE.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index c5c1542b05..c4d872430b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-debuginfod-Remove-unused-variable.patch \
+           file://0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch b/meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch
new file mode 100644
index 0000000000..b3032327a2
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch
@@ -0,0 +1,36 @@
+From db51a55a8e3811d19265bf12d2ff715c6cf558b4 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <jose.quaresma@foundries.io>
+Date: Tue, 19 Mar 2024 10:17:59 +0000
+Subject: [PATCH] srcfiles: fix unused variable BUFFER_SIZE
+
+The const variable BUFFER_SIZE is used only on the zip_files
+function witch is only available with LIBARCHIVE.
+
+| ../../elfutils-0.191/src/srcfiles.cxx:81:18: error: unused variable 'BUFFER_SIZE' [-Werror,-Wunused-const-variable]
+|    81 | constexpr size_t BUFFER_SIZE = 8192;
+|       |                  ^~~~~~~~~~~
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=ef8a4b841aaf26326b8961a651dbe915d54d23e7]
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ src/srcfiles.cxx | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/srcfiles.cxx b/src/srcfiles.cxx
+index 892737cc..09d50f8d 100644
+--- a/src/srcfiles.cxx
++++ b/src/srcfiles.cxx
+@@ -78,7 +78,9 @@ ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
+ /* Bug report address.  */
+ ARGP_PROGRAM_BUG_ADDRESS_DEF = PACKAGE_BUGREPORT;
+ 
++#ifdef HAVE_LIBARCHIVE
+ constexpr size_t BUFFER_SIZE = 8192;
++#endif
+ 
+ /* Definitions of arguments for argp functions.  */
+ static const struct argp_option options[] =
+-- 
+2.44.0
+
-- 
2.44.0


