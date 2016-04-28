Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AD03E6FF9D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 13:27:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 28 Apr 2016 06:27:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="942100577"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.13.137])
	by orsmga001.jf.intel.com with ESMTP; 28 Apr 2016 06:27:48 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 14:27:44 +0100
Message-Id: <1461850065-8839-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 1/2] security_flags: turn potential string format security issues into an error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Apr 2016 13:27:47 -0000

Add "-Wformat -Wformat-security -Werror=format-security" to the default
SECURITY_CFLAGS to catch potential security vulnerabilities due to the
misuse of various string formatting functions.

These flags are widely used in distributions such as Fedora and Ubuntu,
however we have 15 recipes in OE-Core which fail to build with these
flags included and thus the flags are removed for:
- busybox
- console-tools
- cmake
- expect
- gcc
- gettext
- kexec-tools
- leafpad
- libuser
- ltp
- makedevs
- oh-puzzles
- stat
- unzip
- zip

[YOCTO #9488]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/conf/distro/include/security_flags.inc | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index ff5f34e..5755d28 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -9,8 +9,11 @@
 # -O0 which then results in a compiler warning.
 lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=2',d)}"
 
-SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie ${lcl_maybe_fortify}"
-SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify}"
+# Error on use of format strings that represent possible security problems
+SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
+
+SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
+SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 
 SECURITY_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro,-z,now"
 SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
@@ -92,6 +95,23 @@ SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
 
+# Recipes which fail to compile when elevating -Wformat-security to an error
+SECURITY_STRINGFORMAT_pn-busybox = ""
+SECURITY_STRINGFORMAT_pn-console-tools = ""
+SECURITY_STRINGFORMAT_pn-cmake = ""
+SECURITY_STRINGFORMAT_pn-expect = ""
+SECURITY_STRINGFORMAT_pn-gcc = ""
+SECURITY_STRINGFORMAT_pn-gettext = ""
+SECURITY_STRINGFORMAT_pn-kexec-tools = ""
+SECURITY_STRINGFORMAT_pn-leafpad = ""
+SECURITY_STRINGFORMAT_pn-libuser = ""
+SECURITY_STRINGFORMAT_pn-ltp = ""
+SECURITY_STRINGFORMAT_pn-makedevs = ""
+SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
+SECURITY_STRINGFORMAT_pn-stat = ""
+SECURITY_STRINGFORMAT_pn-unzip = ""
+SECURITY_STRINGFORMAT_pn-zip = ""
+
 TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
 
-- 
2.5.5


