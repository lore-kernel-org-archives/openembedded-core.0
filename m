Return-Path: <yamane07ynct@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4DCC83F05
	for <webhook@archiver.kernel.org>; Sun,  6 Jul 2025 09:02:00 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.33375.1751792518104892684
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jul 2025 02:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EKhfnU4i;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: yamane07ynct@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748e63d4b05so1100448b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jul 2025 02:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751792517; x=1752397317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xrxua81YJdsTOKFg3/eUkJjeZEImK9LLdJtEJdl0Hb4=;
        b=EKhfnU4iwUT+hDkuQK7RGWXSODGETHFOaboYThu778V6VgnZEKqqVwSw5i/lklNEZR
         r3u0YbPV07ejUM2iSWapzHQ07C96occLmM4Pau2Mb5lCmZwvUWtpKpRoFDrOi4znjTfm
         KPWq8kWKQPBMShZRE5I4sJ+y9Jo0994yCd/cn/2RV5gcqlzUWXFrngfMTnHr4pB6RbsS
         qIsHfhpeH4hqgxF2pwSoO/U7rxPXOPF1zv9D2FCzBAHsJ96Ob7+e+DyYqF1vMFlWah1Q
         4PnJbhLWWlD2bBK7uuk21IbiMzUzJWbYaUulCyImBCnXDGY87DjEGsifPlUIHsAG7ELH
         3nmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751792517; x=1752397317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xrxua81YJdsTOKFg3/eUkJjeZEImK9LLdJtEJdl0Hb4=;
        b=kl83cKD6oQ00yAVTQVsKGGik20Zb1gI0JwgiAJVoAJqsuN73EyqV1Yx8RVg8QTrpac
         rEuk/7kET/X7c6QEfePCC7JLEwMqRG1MBagDVfOGI3zRhP5VDpLuIwZxXv4BMPEwlsaM
         MfxwBFHtaYmTlllPWFqLrEMIHCgYooquuB0D1FMVCh0vKmVV/YmNWv+Ir29K1rditDbI
         OAGtby1KXoqR5hbHCKwqpcEwjR5qDZRJ1eLCAXO56YNuVcxb381HEP/4fauz5++7x96h
         4EkO4CIbMa+9n/9yLwwpnpf91ssuftQY+bk9s7UGeeFLApPfjjW+Wne09ReW1FknKAAz
         3mzw==
X-Gm-Message-State: AOJu0Yx2eZKCMZJonLP4tiDZvSWTAaFW68b8+s3CwUYJ71tDDlLNk/s5
	3NZttcZ3Ab5pe/fghPl6YW1MyeCrxRJc2sEMP4eVTj67k1meu+R+vzj38fLZHQ==
X-Gm-Gg: ASbGncube9rahTHakNWIv8C0yuKQdi16cacd2o/7GPxfgs/oCpzlKWuJTcrBYecBoS0
	85nAKNFxm+H/U2IG64DuPcxkkwr20+i7mZFmr9ti3Y27ewyolTT1qHm70m3kE9QUaynY5BFm8Di
	Gd0BBPDue+8hxMqHUnHUoWSPx9HzCiWjWm3mdoZJC8sLUDiiNMU9VG03SB73rA5PaAG8crrV0oH
	H5qwxdU3VSKPXT1kC+Okm88tSVS/CjaWFaf9d2e+pya1WBWpeCPTBty8tJrihGEVt5xHqAbUKRs
	tPqwmWw9j51DSU5UdIVNE6aV2ELoa7b0q3/F8CNncQIWndT8bwK3JwHLYgEh6e4zhsLkl85sTMy
	hmHYLtk2/zPsY6A==
X-Google-Smtp-Source: AGHT+IGCPY1BVICHhIbyyrV7tc6zWKE7TQSSsoMCgdsqdy+Y7izYDwi6u0KlMLTSYDEZQdwTukQs2g==
X-Received: by 2002:a05:6a00:194a:b0:742:3cc1:9485 with SMTP id d2e1a72fcca58-74ce8a8ddb0mr10147730b3a.12.1751792517162;
        Sun, 06 Jul 2025 02:01:57 -0700 (PDT)
Received: from yocto.. (softbank060117076056.bbtec.net. [60.117.76.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a4146sm6160625b3a.141.2025.07.06.02.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 02:01:56 -0700 (PDT)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daisuke Yamane <yamane07ynct@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2] icu: Add ptest support
Date: Sun,  6 Jul 2025 18:01:52 +0900
Message-ID: <20250706090152.1225921-1-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Jul 2025 09:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219962

Add following patches.
  - 0001-test-Add-support-ptest.patch
    - Some default paths in test code are invalid at runtime and cause
    - test failures. So add a patch to adjust path to test data for ptest
    - environment.
  - 0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
    - Since ICU-77.1, a test case (TestLargeMemory) that fails to build
    - in a 32-bit environment. So add a patch to skip this test case.
    - This bug has been reported to upstream. See https://unicode-org.atlassian.net/browse/ICU-23120.
Install icu test-suite to run it as a ptest.
Add icu to PTESTS_FAST because it takes 27sec (less than 30sec) to complete on
qemux86-64 with kvm enabled.

root@qemux86-64:~# ptest-runner icu
START: ptest-runner
2025-07-06T00:46
BEGIN: /usr/lib/icu/ptest
___(snip)___
--------------------------------------
Elapsed Time: 00:00:23.070
PASS: ./intltest
DURATION: 27
END: /usr/lib/icu/ptest
2025-07-06T00:47
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>
---
changes in v2:
- Modify do_install_ptest() to detect executable binaries in the test directory and install them.
- Simplified the processing of the run-ptest script.
- Move icu from PTESTS_SLOW to PTESTS_FAST according to the test results of qemux86_64 with kvm.
- Update the commit message to reflect the above changes.
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...nicodeStringTest-TestLargeMemory-on-.patch | 28 +++++++
 .../icu/icu/0001-test-Add-support-ptest.patch | 84 +++++++++++++++++++
 meta/recipes-support/icu/icu/run-ptest        | 13 +++
 meta/recipes-support/icu/icu_77-1.bb          | 23 +++++
 5 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
 create mode 100644 meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
 create mode 100755 meta/recipes-support/icu/icu/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 4253c7b062..4451e00b48 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -25,6 +25,7 @@ PTESTS_FAST = "\
     gdk-pixbuf \
     glib-networking \
     gzip \
+    icu \
     json-c \
     json-glib \
     libconvert-asn1-perl \
diff --git a/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch b/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
new file mode 100644
index 0000000000..e2e9546679
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
@@ -0,0 +1,28 @@
+From 4b3e6888c2aaba6465f1bc96f61b17a2513050f3 Mon Sep 17 00:00:00 2001
+From: David Seifert <soap@gentoo.org>
+Date: Sat, 21 Jun 2025 12:28:15 +0200
+Subject: [PATCH] ICU-23120 Mask UnicodeStringTest::TestLargeMemory on 32-bit
+ platforms
+
+Upstream-Status: Submitted [https://github.com/unicode-org/icu/pull/3496]
+Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
+---
+ test/intltest/ustrtest.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/intltest/ustrtest.cpp b/test/intltest/ustrtest.cpp
+index 56976b3e3d2..26225f5b5b5 100644
+--- a/test/intltest/ustrtest.cpp
++++ b/test/intltest/ustrtest.cpp
+@@ -2353,7 +2353,7 @@ void UnicodeStringTest::TestUnicodeStringInsertAppendToSelf() {
+ }
+ 
+ void UnicodeStringTest::TestLargeMemory() {
+-#if U_PLATFORM_IS_LINUX_BASED || U_PLATFORM_IS_DARWIN_BASED
++#if (U_PLATFORM_IS_LINUX_BASED || U_PLATFORM_IS_DARWIN_BASED) && (UINTPTR_MAX == 0xFFFFFFFFFFFFFFFF)
+     if(quick) { return; }
+     IcuTestErrorCode status(*this, "TestLargeMemory");
+     constexpr uint32_t len = 2147483643;
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch b/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
new file mode 100644
index 0000000000..88350c0db5
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
@@ -0,0 +1,84 @@
+From 783d9e0d3d7824fbca53c2c3a80e8e5e23eacc82 Mon Sep 17 00:00:00 2001
+From: Daisuke Yamane <yamane07ynct@gmail.com>
+Date: Tue, 1 Jul 2025 18:35:25 +0900
+Subject: [PATCH] test: Add support ptest
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
+---
+ test/cintltst/Makefile.in  | 2 +-
+ test/intltest/Makefile.in  | 2 +-
+ test/intltest/intltest.cpp | 2 +-
+ test/iotest/Makefile.in    | 2 +-
+ test/letest/Makefile.in    | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/test/cintltst/Makefile.in b/test/cintltst/Makefile.in
+index 552a105..9cf3071 100644
+--- a/test/cintltst/Makefile.in
++++ b/test/cintltst/Makefile.in
+@@ -39,7 +39,7 @@ CPPFLAGS += -I$(top_srcdir)/common -I$(top_srcdir)/i18n -I$(top_srcdir)/tools/ct
+ ifdef QNX_TARGET
+ DEFS += -D'ICU_UNICODE_VERSION="$(UNICODE_VERSION)"' -D'ICU_VERSION="@VERSION@"' -D'ICUDATA_NAME="$(ICUDATA_PLATFORM_NAME)"' -D'U_TOPSRCDIR="/var/icu_tests"' -D'U_TOPBUILDDIR="/var/icu_tests/"'
+ else
+-DEFS += -D'ICU_UNICODE_VERSION="$(UNICODE_VERSION)"' -D'ICU_VERSION="@VERSION@"' -D'ICUDATA_NAME="$(ICUDATA_PLATFORM_NAME)"' -D'U_TOPSRCDIR="$(top_srcdir)/"' -D'U_TOPBUILDDIR="$(BUILDDIR)"'
++DEFS += -D'ICU_UNICODE_VERSION="$(UNICODE_VERSION)"' -D'ICU_VERSION="@VERSION@"' -D'ICUDATA_NAME="$(ICUDATA_PLATFORM_NAME)"' -D'U_TOPSRCDIR="$(PTEST_PATH)/"' -D'U_TOPBUILDDIR="$(PTEST_PATH)/"'
+ endif
+ LIBS = $(LIBCTESTFW) $(LIBICUI18N) $(LIBICUTOOLUTIL) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)
+ 
+diff --git a/test/intltest/Makefile.in b/test/intltest/Makefile.in
+index 5d4a03b..ca4e4cd 100644
+--- a/test/intltest/Makefile.in
++++ b/test/intltest/Makefile.in
+@@ -39,7 +39,7 @@ CPPFLAGS += -DUNISTR_FROM_CHAR_EXPLICIT= -DUNISTR_FROM_STRING_EXPLICIT=
+ ifdef QNX_TARGET
+ DEFS += -D'U_TOPSRCDIR="/var/icu_tests"' -D'U_TOPBUILDDIR="/var/icu_tests/"'
+ else
+-DEFS += -D'U_TOPSRCDIR="$(top_srcdir)/"' -D'U_TOPBUILDDIR="$(BUILDDIR)"'
++DEFS += -D'U_TOPSRCDIR="$(PTEST_PATH)/"' -D'U_TOPBUILDDIR="$(PTEST_PATH)/"'
+ endif
+ LIBS = $(LIBCTESTFW) $(LIBICUI18N) $(LIBICUUC) $(LIBICUTOOLUTIL) $(DEFAULT_LIBS) $(LIB_M) $(LIB_THREAD)
+ 
+diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
+index 3806d0f..33829b0 100644
+--- a/test/intltest/intltest.cpp
++++ b/test/intltest/intltest.cpp
+@@ -1713,7 +1713,7 @@ static bool fileExists(const char* fileName) {
+  * Returns the path to icu/testdata/
+  */
+ const char *IntlTest::getSharedTestData(UErrorCode& err) {
+-#define SOURCE_TARBALL_TOP U_TOPSRCDIR U_FILE_SEP_STRING ".." U_FILE_SEP_STRING
++#define SOURCE_TARBALL_TOP U_TOPSRCDIR U_FILE_SEP_STRING
+ #define REPO_TOP SOURCE_TARBALL_TOP ".." U_FILE_SEP_STRING
+ #define FILE_NAME U_FILE_SEP_STRING "message2" U_FILE_SEP_STRING "valid-tests.json"
+     const char *srcDataDir = nullptr;
+diff --git a/test/iotest/Makefile.in b/test/iotest/Makefile.in
+index 16c510f..9eeff4b 100644
+--- a/test/iotest/Makefile.in
++++ b/test/iotest/Makefile.in
+@@ -39,7 +39,7 @@ CPPFLAGS += -DUNISTR_FROM_CHAR_EXPLICIT= -DUNISTR_FROM_STRING_EXPLICIT=
+ ifdef QNX_TARGET
+ DEFS += -D'U_TOPSRCDIR="/var/icu_tests"' -D'U_TOPBUILDDIR="/var/icu_tests/"'
+ else
+-DEFS += -D'U_TOPSRCDIR="$(top_srcdir)/"' -D'U_TOPBUILDDIR="$(BUILDDIR)"'
++DEFS += -D'U_TOPSRCDIR="$(PTEST_PATH)/"' -D'U_TOPBUILDDIR="$(PTEST_PATH)/"'
+ endif
+ LIBS = $(LIBCTESTFW) $(LIBICUTOOLUTIL) $(LIBICUIO) $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)
+ 
+diff --git a/test/letest/Makefile.in b/test/letest/Makefile.in
+index 156c86f..555a820 100644
+--- a/test/letest/Makefile.in
++++ b/test/letest/Makefile.in
+@@ -30,7 +30,7 @@ BUILDDIR := $(BUILDDIR:test\\cintltst/../../=)
+ BUILDDIR := $(BUILDDIR:TEST\\CINTLTST/../../=)
+ 
+ CPPFLAGS += -I$(top_srcdir)/common -I$(top_srcdir)/i18n -I$(top_srcdir)/tools/ctestfw -I$(top_srcdir)/tools/toolutil -I$(top_srcdir)/layoutex $(ICULE_CFLAGS) $(ICULEHB_CFLAGS)
+-DEFS += -D'U_TOPSRCDIR="$(top_srcdir)/"' -D'U_TOPBUILDDIR="$(BUILDDIR)"'
++DEFS += -D'U_TOPSRCDIR="$(PTEST_PATH)/"' -D'U_TOPBUILDDIR="$(PTEST_PATH)/"'
+ LIBS = $(LIBICULX) $(LIBICUUC) $(LIBICUI18N) $(LIBCTESTFW) $(LIBICUTOOLUTIL) $(DEFAULT_LIBS) $(LIB_M) $(ICULEHB_LIBS)
+ 
+ COMMONOBJECTS = SimpleFontInstance.o
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/icu/icu/run-ptest b/meta/recipes-support/icu/icu/run-ptest
new file mode 100755
index 0000000000..e5bf27a822
--- /dev/null
+++ b/meta/recipes-support/icu/icu/run-ptest
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+TOPDIR=$(dirname "$(realpath $0)")
+cd ${TOPDIR}/test/tests
+TESTS=$(find . -executable -type f)
+for t in ${TESTS}; do
+	./$t
+	if [ "$?" = "0" ]; then
+		echo "PASS: $t"
+	else
+		echo "FAIL: $t"
+	fi
+done
diff --git a/meta/recipes-support/icu/icu_77-1.bb b/meta/recipes-support/icu/icu_77-1.bb
index e655b18ad2..cd81a6c729 100644
--- a/meta/recipes-support/icu/icu_77-1.bb
+++ b/meta/recipes-support/icu/icu_77-1.bb
@@ -119,6 +119,9 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            ${DATA_SRC_URI};name=data \
            file://filter.json \
            file://0001-icu-Added-armeb-support.patch \
+           file://0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch \
+           file://0001-test-Add-support-ptest.patch \
+           file://run-ptest \
            "
 
 SRC_URI:append:class-target = "\
@@ -160,3 +163,23 @@ do_make_icudata() {
 }
 
 addtask make_icudata before do_configure after do_patch do_prepare_recipe_sysroot
+
+inherit ptest
+RDEPENDS:${PN}-ptest += "bash"
+
+do_compile_ptest() {
+    oe_runmake -C test everything PTEST_PATH=${PTEST_PATH}
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    install -d ${D}${PTEST_PATH}/data
+    cp -r ${S}/test/testdata ${D}/${PTEST_PATH}/test
+    cp -r ${S}/data/unidata ${D}/${PTEST_PATH}/data/
+    cp -r ${S}/data/sprep ${D}/${PTEST_PATH}/data/
+    cp -r ${S}/../testdata ${D}/${PTEST_PATH}/
+    cp -r ${B}/test/testdata/out ${D}/${PTEST_PATH}/test/testdata
+
+    install -d ${D}${PTEST_PATH}/test/tests
+    find ${B}/test/ -type f -executable -exec cp {} ${D}${PTEST_PATH}/test/tests \;
+}

