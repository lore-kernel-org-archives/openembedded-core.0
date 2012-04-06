Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SG3CQ-00064X-UP
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 09:03:11 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 7C5F130480
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2012 02:53:52 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 23:53:48 -0700
Message-Id: <d1c781794e8836462993d6a8e3d27b38602beafc.1333695164.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333695164.git.scott.a.garman@intel.com>
References: <cover.1333695164.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1333695164.git.scott.a.garman@intel.com>
References: <cover.1333695164.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 7C5F130480.657E4
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] shadow-native: disable logging to syslog
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Apr 2012 07:03:11 -0000

Disable use of syslog to prevent sysroot user and group additions
from writing entries to the host's syslog.

This fixes [YOCTO #2012]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../shadow/files/disable-syslog.patch              |   34 ++++++++++++++++++++
 .../shadow/shadow-native_4.1.4.3.bb                |    5 ++-
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/disable-syslog.patch

diff --git a/meta/recipes-extended/shadow/files/disable-syslog.patch b/meta/recipes-extended/shadow/files/disable-syslog.patch
new file mode 100644
index 0000000..1943fd6
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/disable-syslog.patch
@@ -0,0 +1,34 @@
+Disable use of syslog to prevent sysroot user and group additions from
+writing entries to the host's syslog. This patch should only be used
+with the shadow-native recipe.
+
+Upstream-Status: Inappropriate [disable feature]
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+diff -urN shadow-4.1.4.3.orig//src/groupadd.c shadow-4.1.4.3/src/groupadd.c
+--- shadow-4.1.4.3.orig//src/groupadd.c	2011-02-13 09:58:16.000000000 -0800
++++ shadow-4.1.4.3/src/groupadd.c	2012-04-05 10:05:59.440001758 -0700
+@@ -34,6 +34,9 @@
+ 
+ #ident "$Id: groupadd.c 3015 2009-06-05 22:16:56Z nekral-guest $"
+ 
++/* Disable use of syslog since we're running this command against a sysroot */
++#undef USE_SYSLOG
++
+ #include <ctype.h>
+ #include <fcntl.h>
+ #include <getopt.h>
+diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3/src/useradd.c
+--- shadow-4.1.4.3.orig//src/useradd.c	2011-02-13 09:58:16.000000000 -0800
++++ shadow-4.1.4.3/src/useradd.c	2012-04-05 10:06:25.076001315 -0700
+@@ -34,6 +34,9 @@
+ 
+ #ident "$Id: useradd.c 3015 2009-06-05 22:16:56Z nekral-guest $"
+ 
++/* Disable use of syslog since we're running this command against a sysroot */
++#undef USE_SYSLOG
++
+ #include <assert.h>
+ #include <ctype.h>
+ #include <errno.h>
diff --git a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
index 42ecc6a..38bb922 100644
--- a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
@@ -7,14 +7,15 @@ LICENSE = "BSD | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
                     file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow.automake-1.11.patch \
            file://shadow-4.1.3-dots-in-usernames.patch \
            file://shadow-4.1.4.2-env-reset-keep-locale.patch \
            file://add_root_cmd_options.patch \
-	   file://useradd.patch"
+           file://disable-syslog.patch \
+           file://useradd.patch"
 
 SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
 SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778" 
-- 
1.7.5.4



