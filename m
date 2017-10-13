Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EE9076025E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 19:24:04 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Oct 2017 12:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,372,1503385200"; d="scan'208";a="160266886"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga005.jf.intel.com with ESMTP; 13 Oct 2017 12:24:05 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Oct 2017 12:24:03 -0700
Message-Id: <1507922643-81187-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] nettle-ptest: fix a failing test
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
X-List-Received-Date: Fri, 13 Oct 2017 19:24:05 -0000

This patch changes the result of the nettle dlopen-test
from FAIL to PASS. The test used to fail because the test could not
find and load libnettle.so.
This patch fixes this by using absolute path instead of relative.

This was the only test out of 88 that used to fail.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../nettle/nettle-3.3/dlopen-test.patch              | 20 ++++++++++++++++++++
 meta/recipes-support/nettle/nettle_3.3.bb            |  4 ++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-support/nettle/nettle-3.3/dlopen-test.patch

diff --git a/meta/recipes-support/nettle/nettle-3.3/dlopen-test.patch b/meta/recipes-support/nettle/nettle-3.3/dlopen-test.patch
new file mode 100644
index 0000000..c4f0b7e
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.3/dlopen-test.patch
@@ -0,0 +1,20 @@
+Replace relative path of libnettle.so with absolute path so the test
+program can find it.
+Relative paths are not suitable, as the folder strucure for ptest
+is different from the one expected by the nettle testsuite.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+--- a/testsuite/dlopen-test.c	2016-10-01 00:28:38.000000000 -0700
++++ b/testsuite/dlopen-test.c	2017-10-13 11:08:57.227572860 -0700
+@@ -9,7 +9,7 @@
+ main (int argc UNUSED, char **argv UNUSED)
+ {
+ #if HAVE_LIBDL
+-  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
++  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
+   int (*get_version)(void);
+   if (!handle)
+     {
diff --git a/meta/recipes-support/nettle/nettle_3.3.bb b/meta/recipes-support/nettle/nettle_3.3.bb
index b76babf..3951678 100644
--- a/meta/recipes-support/nettle/nettle_3.3.bb
+++ b/meta/recipes-support/nettle/nettle_3.3.bb
@@ -11,5 +11,9 @@ SRC_URI += "\
             file://check-header-files-of-openssl-only-if-enable_.patch \
             "
 
+SRC_URI_append_class-target = "\
+            file://dlopen-test.patch \
+            "
+
 SRC_URI[md5sum] = "10f969f78a463704ae73529978148dbe"
 SRC_URI[sha256sum] = "46942627d5d0ca11720fec18d81fc38f7ef837ea4197c1f630e71ce0d470b11e"
-- 
2.7.4


