Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F715CD3431
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 10:29:57 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.46930.1725445794516226477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 03:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GC2TQIan;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8679f534c3so692105066b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 03:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725445793; x=1726050593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QWQiV9plDEDCEUd313tTDITwWb+IYwB8FYmi0zwoNjk=;
        b=GC2TQIanMiY5C4S5I7cZ4qjkS4t1hEeA0dgMilsBb/VeUuuhZ2HsoNQKQtep5CgUsk
         Y3Iuzoa5TN6WH6fzlic4Ik1o57xWQO91+4Vmb7tHf41B+/wD2M+E4pFW2aYT4OEUxqiP
         ZKDJzw31/GrGE8PAq/DOLRwHiCs+SaHgpVSns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725445793; x=1726050593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWQiV9plDEDCEUd313tTDITwWb+IYwB8FYmi0zwoNjk=;
        b=t2n1kBSA40xZo6VGHnXWtzdND7emEjvOQTd2Hxcz9NR2vaA42u7L668UYJeZe4UI0u
         544DucNJOmnyVX6WZRlXNHZXaUINUIcFX+4Fb3r28mcugqfLJ2o6eFMt0lCNyi/4QKd4
         Cs+isGmELKX3jOzBSJn9Zs5UD6zC+zoE4CkwKxCIkoPsah7abFABFG0KNxMItc7KF6lh
         XlgRW2xoUtTigue/CWbEFYgb4H9bkofBhftSofdO6rO66DU5IGYAa9/590xjWc8zhSn8
         0aNoOgW1GJ2GUpsYcUIuaAoD43GNCiVBzP+I1hnbWUHn2jzlKydawGiOk1NyI8qnofvY
         DNTA==
X-Gm-Message-State: AOJu0YwqBEe+NisHcCI9JoUEby9MpLsoCB5ir4nL5a4j8u8Lbrx66ZKo
	+r+BiNPfVikigbVhT9oYi2ZPYLbex0sCcs/2cHNVsaLe0koZWNRVNyeZ3HSBesei5JiWcxXhxfu
	2
X-Google-Smtp-Source: AGHT+IEeP1cMP3NbL/8vX6d4eHHEMA4EDD1mKsbWVb6/ozBiHk93O6LG5psdoiWUXqTdCzp/J+Qemw==
X-Received: by 2002:a17:907:36c5:b0:a86:6968:3b93 with SMTP id a640c23a62f3a-a89d879c32dmr902797866b.33.1725445792443;
        Wed, 04 Sep 2024 03:29:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:99f4:e9dc:3777:c785])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d7834sm804626566b.177.2024.09.04.03.29.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 03:29:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] conf/defaultsetup.conf: Drop TCLIBCAPPEND
Date: Wed,  4 Sep 2024 11:29:51 +0100
Message-ID: <20240904102951.850301-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 10:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204199

We've been able to run musl and glibc builds in the same TMPDIR for
many years and a separate directory is not required. Most distros disable
this value for that reason.

Drop support for the variable to make it clear and easy for distros
to be able to set multiconfigs which behave consistently for distros
which do and don't clear it by dropping it entirely.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/populate_sdk_ext.bbclass |  2 --
 meta/conf/distro/defaultsetup.conf           |  4 ----
 meta/lib/oeqa/selftest/cases/sstatetests.py  | 15 ---------------
 3 files changed, 21 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index b02295384bb..8cb27ad9958 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -153,7 +153,6 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
             f.write('SSTATE_MIRRORS:forcevariable = "file://universal/(.*) file://universal-4.9/\\1 file://universal-4.9/(.*) file://universal-4.8/\\1"\n')
             # Ensure TMPDIR is the default so that clean_esdk_builddir() can delete it
             f.write('TMPDIR:forcevariable = "${TOPDIR}/tmp"\n')
-            f.write('TCLIBCAPPEND:forcevariable = ""\n')
             # Drop uninative if the build isn't using it (or else NATIVELSBSTRING will
             # be different and we won't be able to find our native sstate)
             if not bb.data.inherits_class('uninative', d):
@@ -340,7 +339,6 @@ def write_local_conf(d, baseoutpath, derivative, core_meta_subdir, uninative_che
             f.write('\n')
 
             f.write('TMPDIR = "${TOPDIR}/tmp"\n')
-            f.write('TCLIBCAPPEND = ""\n')
             f.write('DL_DIR = "${TOPDIR}/downloads"\n')
 
             if bb.data.inherits_class('uninative', d):
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 90b68057ad4..e6369dcec4b 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -8,10 +8,6 @@ require conf/distro/include/tclibc-${TCLIBC}.inc
 
 require conf/distro/include/uninative-flags.inc
 
-# Allow single libc distros to disable this code
-TCLIBCAPPEND ?= "-${TCLIBC}"
-TMPDIR .= "${TCLIBCAPPEND}"
-
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
 INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx"
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 49d650bac7a..ae295bef5f7 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -378,7 +378,6 @@ class SStateHashSameSigs(SStateBase):
         self.write_config("""
 MACHINE = "qemux86"
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
-TCLIBCAPPEND = ""
 BUILD_ARCH = "x86_64"
 BUILD_OS = "linux"
 SDKMACHINE = "x86_64"
@@ -390,7 +389,6 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         self.write_config("""
 MACHINE = "qemux86"
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
-TCLIBCAPPEND = ""
 BUILD_ARCH = "i686"
 BUILD_OS = "linux"
 SDKMACHINE = "i686"
@@ -426,7 +424,6 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
 
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
-TCLIBCAPPEND = \"\"
 NATIVELSBSTRING = \"DistroA\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
@@ -434,7 +431,6 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         bitbake("core-image-weston -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
-TCLIBCAPPEND = \"\"
 NATIVELSBSTRING = \"DistroB\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
@@ -463,14 +459,12 @@ class SStateHashSameSigs2(SStateBase):
 
         configA = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
-TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86-64\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         #OLDEST_KERNEL is arch specific so set to a different value here for testing
         configB = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
-TCLIBCAPPEND = \"\"
 MACHINE = \"qemuarm\"
 OLDEST_KERNEL = \"3.3.0\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
@@ -486,7 +480,6 @@ WARN_QA:append = " someotheroption"
 
         configA = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
-TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86-64\"
 require conf/multilib.conf
 MULTILIBS = \"multilib:lib32\"
@@ -495,7 +488,6 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         configB = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
-TCLIBCAPPEND = \"\"
 MACHINE = \"qemuarm\"
 require conf/multilib.conf
 MULTILIBS = \"\"
@@ -513,7 +505,6 @@ class SStateHashSameSigs3(SStateBase):
 
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
-TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
@@ -524,7 +515,6 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         bitbake("world meta-toolchain -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
-TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86copy\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
@@ -561,7 +551,6 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
 
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
-TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
@@ -572,7 +561,6 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         bitbake("binutils-native  -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
-TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86copy\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
@@ -600,7 +588,6 @@ class SStateHashSameSigs4(SStateBase):
 
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
-TCLIBCAPPEND = ""
 BB_NUMBER_THREADS = "${@oe.utils.cpu_count()}"
 PARALLEL_MAKE = "-j 1"
 DL_DIR = "${TOPDIR}/download1"
@@ -615,7 +602,6 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         bitbake("world meta-toolchain -S none")
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
-TCLIBCAPPEND = ""
 BB_NUMBER_THREADS = "${@oe.utils.cpu_count()+1}"
 PARALLEL_MAKE = "-j 2"
 DL_DIR = "${TOPDIR}/download2"
@@ -726,7 +712,6 @@ class SStateFindSiginfo(SStateBase):
         """
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstates-findsiginfo\"
-TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86-64\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"

