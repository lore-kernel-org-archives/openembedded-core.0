Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TgqbY-0001Lq-SN
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 06:36:09 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id F068A303FC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2012 00:02:39 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 21:02:05 -0800
Message-Id: <dd1b77c473ee92608ad0a5bdbea0880d2f613c2c.1354855433.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: F068A303FC.534CB
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 12/16] libxml2: fix build with automake 1.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2012 05:36:09 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libxml2/libxml2_fix_for_automake_1.12.patch    |   23 ++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    5 +++--
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch b/meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch
new file mode 100644
index 0000000..5c25882
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Pending
+
+automake 1.12 has decpricated automatic de-ANSI-fication support
+
+this patch fixes this build issue:
+
+| configure.in:67: error: automatic de-ANSI-fication support has been removed
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+
+Index: libxml2-2.7.8/configure.in
+===================================================================
+--- libxml2-2.7.8.orig/configure.in
++++ libxml2-2.7.8/configure.in
+@@ -63,8 +63,6 @@ AC_PATH_PROG(WGET, wget, /usr/bin/wget)
+ AC_PATH_PROG(XMLLINT, xmllint, /usr/bin/xmllint)
+ AC_PATH_PROG(XSLTPROC, xsltproc, /usr/bin/xsltproc)
+ 
+-dnl Make sure we have an ANSI compiler
+-AM_C_PROTOTYPES
+ test "x$U" != "x" && AC_MSG_ERROR(Compiler not ANSI compliant)
+ 
+ AC_LIBTOOL_WIN32_DLL
diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
index 1de73da..9111120 100644
--- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
@@ -1,8 +1,9 @@
 require libxml2.inc
 
-PR = "r7"
+PR = "r8"
 
-SRC_URI += "file://fix_version_info.patch"
+SRC_URI += "file://fix_version_info.patch \
+            file://libxml2_fix_for_automake_1.12.patch"
 
 SRC_URI[md5sum] = "8127a65e8c3b08856093099b52599c86"
 SRC_URI[sha256sum] = "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690d822e009fdc3c417ec"
-- 
1.7.9.5



