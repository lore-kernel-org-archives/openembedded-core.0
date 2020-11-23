Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web08.40314.1606158039820562027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 11:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.valek@siemens.com)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0ANJ0bPa009299
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2020 20:00:37 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.76.33])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 0ANJ0anR012966;
	Mon, 23 Nov 2020 20:00:37 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 75F609508F2;
	Mon, 23 Nov 2020 20:00:36 +0100 (CET)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>,
        Pascal Bach <pascal.bach@siemens.com>,
        Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v2 1/2] bitbake.conf: Split optimization into common part
Date: Mon, 23 Nov 2020 20:00:28 +0100
Message-Id: <20201123190029.13811-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201122124853.30262-1-andrej.valek@siemens.com>
References: <20201122124853.30262-1-andrej.valek@siemens.com>

This option allows correctly handle the release/debug flags separation in
upper recipe like cmake. Adopt SELECTED_OPTIMIZATION usage in other
recipes.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/conf/bitbake.conf                            | 7 ++++---
 meta/conf/distro/include/security_flags.inc       | 8 ++++----
 meta/conf/local.conf.sample.extended              | 1 +
 meta/recipes-devtools/valgrind/valgrind_3.16.1.bb | 1 +
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0d38eac094..5555093e24 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -569,7 +569,7 @@ TARGET_CPPFLAGS = ""
 export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
 BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION} ${DEBUG_PREFIX_MAP}"
 export CFLAGS = "${TARGET_CFLAGS}"
-TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
+TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION} ${COMMON_OPTIMIZATION}"
 
 export BUILD_CXXFLAGS = "${BUILD_CFLAGS}"
 BUILDSDK_CXXFLAGS = "${BUILDSDK_CFLAGS}"
@@ -616,8 +616,9 @@ DEBUG_PREFIX_MAP ?= "-fmacro-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTEND
 DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 
 # Disabled until the option works properly -feliminate-dwarf2-dups
-FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
-DEBUG_OPTIMIZATION = "-Og ${DEBUG_FLAGS} -pipe"
+COMMON_OPTIMIZATION = "${DEBUG_FLAGS} -pipe"
+FULL_OPTIMIZATION = "-O2"
+DEBUG_OPTIMIZATION = "-Og"
 SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
 BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g -feliminate-unused-debug-types', '-O2', d)} -pipe"
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 4e64eb99f9..60370eeb17 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -63,7 +63,7 @@ SECURITY_STACK_PROTECTOR_pn-glibc-testsuite = ""
 # handled in recipes-graphics/xorg-driver/xorg-driver-common.inc
 SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
 
-TARGET_CC_ARCH_append_pn-binutils = " ${SELECTED_OPTIMIZATION}"
-TARGET_CC_ARCH_append_pn-gcc = " ${SELECTED_OPTIMIZATION}"
-TARGET_CC_ARCH_append_pn-gdb = " ${SELECTED_OPTIMIZATION}"
-TARGET_CC_ARCH_append_pn-perf = " ${SELECTED_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-binutils = " ${SELECTED_OPTIMIZATION} ${COMMON_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-gcc = " ${SELECTED_OPTIMIZATION} ${COMMON_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-gdb = " ${SELECTED_OPTIMIZATION} ${COMMON_OPTIMIZATION}"
+TARGET_CC_ARCH_append_pn-perf = " ${SELECTED_OPTIMIZATION} ${COMMON_OPTIMIZATION}"
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 5ece522fa8..51cea43b9e 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -99,6 +99,7 @@
 #
 # PROFILE_OPTIMIZATION = "-pg"
 # SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
+# COMMON_OPTIMIZATION = ""
 # LDFLAGS =+ "-pg"
 
 # TCMODE controls the characteristics of the generated packages/images by
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
index bcba55f327..395d603cec 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -97,6 +97,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 # (via CFLAGS) means we interfere with that. Only pass DEBUG_FLAGS to it
 # which fixes build path issue in DWARF.
 SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
+COMMON_OPTIMIZATION = ""
 
 do_configure_prepend () {
     rm -rf ${S}/config.h
-- 
2.11.0

