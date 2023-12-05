Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F707C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 13:38:20 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.99413.1701783490587726703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 05:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=ek9LO+ll;
 spf=pass (domain: snapchat.com, ip: 209.85.208.49, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-54bf9a54fe3so7252001a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 05:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1701783488; x=1702388288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FdwVWykwwAxrwIXzSirtFZNk45p1tcYujHdwSNYf3cY=;
        b=ek9LO+llMpfxJS79qxIZtnwXOsqLmEC5/WtcYO3qxAe0m0yXeQ0B2bEBOU/o0d4H4y
         PyWpco2E+FU4DSvAJwy8D5y9cekqAu3nG2cG4rPfJa1udgzxptXFwpWTErANONFiCwWP
         dSXdF04RVreS5mclBvCBUQxGxSpgtYLEdSavg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701783488; x=1702388288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdwVWykwwAxrwIXzSirtFZNk45p1tcYujHdwSNYf3cY=;
        b=V9CT7ecVcvt7736jNzYr3COZ8cyOEhrLqEkntzhuyj3jsDbChdNJF86iqFIwkZIhRR
         rus7tYFfk0piGVRky4n87v/Lw9JT4eJqphNY7inuZqK58ovkg2/jPPV9SuqmB1rA8509
         4sYVspwZAmo626qqS7NBaX0ky2UZsXuA5pqbz7hyeASGVLRcOVnACSd3ENpIw+fNb/gO
         LRkJAOSrvSRnvInnlQL7X1pTjLPHSuJhpQsRTvy6U5ipKY3V0fD8GRWEq/ZWbzDdv6jS
         QY80Cjd6nVUguDmQxDVJ3aACZDpw4dM9LHlovuyHy/sme79du7eSVVdrD83xDhv3GxQ/
         PaMA==
X-Gm-Message-State: AOJu0Yw9REoLMtqVGPWEWIun71lRZBdi+u/f5ixja+F+i3DCs6lLQUea
	XvkqoyHAX3RVQhNPvZcK8BxvTy1yvTasC8DKJtC+qQ==
X-Google-Smtp-Source: AGHT+IEQquhKXhy8mjJIfI0cJOFJdxj5CCXEYT8UYnFJOTegsNnBsts46rsy7eJZqhrP4ZAsmcvdyw==
X-Received: by 2002:a17:906:b816:b0:a19:a1ba:8cec with SMTP id dv22-20020a170906b81600b00a19a1ba8cecmr4372402ejb.138.1701783488272;
        Tue, 05 Dec 2023 05:38:08 -0800 (PST)
Received: from LC49NTQ3.sc-core.net (62-178-121-202.cable.dynamic.surfer.at. [62.178.121.202])
        by smtp.gmail.com with ESMTPSA id d15-20020a170906344f00b009eff65e6942sm6690508ejb.197.2023.12.05.05.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 05:38:08 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v2] gdb/systemd: enable minidebuginfo support conditionally
Date: Tue,  5 Dec 2023 14:37:54 +0100
Message-Id: <20231205133754.906479-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 13:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191820

From: Etienne Cordonnier <ecordonnier@snap.com>

Enabling minidebuginfo is not useful if gdb and systemd-coredump
are unable to parse it.

In order to parse it, gdb needs xz support. Systemd needs coredump enabled, as
well as elfutil enabled as well (systemd-coredump loads libdw which is part of elfutils using dlopen).

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-global/package.bbclass           |  2 +-
 meta/lib/oe/package.py                        |  2 +-
 meta/lib/oeqa/runtime/cases/systemd.py        | 21 +++++++++++++++++++
 meta/lib/oeqa/selftest/cases/minidebuginfo.py |  2 +-
 meta/recipes-core/systemd/systemd_254.4.bb    |  1 +
 .../elfutils/elfutils_0.189.bb                |  4 +++-
 meta/recipes-devtools/gdb/gdb-common.inc      |  4 +++-
 7 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 2ad820a81f..f56bca3542 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -234,7 +234,7 @@ python () {
         deps = ""
         for dep in (d.getVar('PACKAGE_DEPENDS') or "").split():
             deps += " %s:do_populate_sysroot" % dep
-        if d.getVar('PACKAGE_MINIDEBUGINFO') == '1':
+        if bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', True, False, d):
             deps += ' xz-native:do_populate_sysroot'
         d.appendVarFlag('do_package', 'depends', deps)
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index f69bf9c353..9a465eaa09 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1239,7 +1239,7 @@ def process_split_and_strip_files(d):
         oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
 
     # Build "minidebuginfo" and reinject it back into the stripped binaries
-    if d.getVar('PACKAGE_MINIDEBUGINFO') == '1':
+    if bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', True, False, d):
         oe.utils.multiprocess_launch(inject_minidebuginfo, list(elffiles), d,
                                      extraargs=(dvar, dv, d))
 
diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 37f295492d..4c581ba396 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -5,6 +5,7 @@
 #
 
 import re
+import threading
 import time
 
 from oeqa.runtime.case import OERuntimeTestCase
@@ -136,6 +137,26 @@ class SystemdServiceTests(SystemdTest):
             status = self.target.run('mount -oro,remount /')[0]
             self.assertTrue(status == 0, msg='Remounting / as r/o failed')
 
+    @skipIfNotFeature('minidebuginfo', 'Test requires minidebuginfo to be in DISTRO_FEATURES')
+    @OEHasPackage(['busybox'])
+    def test_systemd_coredump_minidebuginfo(self):
+        """
+        Verify that call-stacks generated by systemd-coredump contain symbolicated call-stacks,
+        extracted from the minidebuginfo metadata (.gnu_debugdata elf section).
+        """
+        t_thread = threading.Thread(target=self.target.run, args=("ulimit -c unlimited && sleep 1000",))
+        t_thread.start()
+        time.sleep(1)
+
+        status, output = self.target.run('pidof sleep')
+        # cause segfault on purpose
+        self.target.run('kill -SEGV %s' % output)
+        self.assertEqual(status, 0, msg = 'Not able to find process that runs sleep, output : %s' % output)
+
+        (status, output) = self.target.run('coredumpctl info')
+        self.assertEqual(status, 0, msg='MiniDebugInfo Test failed: %s' % output)
+        self.assertEqual('sleep_for_duration (busybox.nosuid' in output, True, msg='Call stack is missing minidebuginfo symbols (functions shown as "n/a"): %s' % output)
+
 class SystemdJournalTests(SystemdTest):
 
     @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
index aa1f9fa1f7..2919f07939 100644
--- a/meta/lib/oeqa/selftest/cases/minidebuginfo.py
+++ b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
@@ -21,7 +21,7 @@ class Minidebuginfo(OESelftestTestCase):
         bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME', 'READELF'], image)
 
         self.write_config("""
-PACKAGE_MINIDEBUGINFO = "1"
+DISTRO_FEATURES:append = " minidebuginfo"
 IMAGE_FSTYPES = "tar.bz2"
 """)
         bitbake("{} {}:do_addto_recipe_sysroot".format(image, binutils))
diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 4d68a3266a..0c12926bef 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -67,6 +67,7 @@ PAM_PLUGINS = " \
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam selinux smack usrmerge polkit seccomp', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-shared', d)} \
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
index d8bf82b022..d69828131e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
@@ -39,7 +39,9 @@ BUILD_CFLAGS += "-Wno-error=stringop-overflow"
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2:class-target = "bzip2"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'debuginfod', 'debuginfod libdebuginfod', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'debuginfod', 'debuginfod libdebuginfod', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'xz', '', d)} \
+                  "
 PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
 PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 3349719a6b..48dbb91463 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -30,7 +30,9 @@ EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
                 --with-libgmp-prefix=${STAGING_EXECPREFIXDIR} \
 "
 
-PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)} python"
+PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)} python \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'xz', '', d)} \
+                  "
 # Use --without-system-readline to compile with readline 5.
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3-codecs"
-- 
2.34.1


