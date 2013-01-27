Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Tzc4E-00027R-Bl
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 00:55:18 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 3B59A2FD93
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2013 18:39:34 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Jan 2013 15:39:11 -0800
Message-Id: <01082ed892251fc375d8cf23a8cf114423fe864f.1359329823.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359329823.git.scott.a.garman@intel.com>
References: <cover.1359329823.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1359329823.git.scott.a.garman@intel.com>
References: <cover.1359329823.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 3B59A2FD93.AFF31
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 3/4] libtasn1: fix build with automake 1.12
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
X-List-Received-Date: Sun, 27 Jan 2013 23:55:18 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libtasn1/libtasn1_fix_for_automake_1.12.patch  |   28 ++++++++++++++++++++
 meta/recipes-support/gnutls/libtasn1_2.12.bb       |    6 +++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch

diff --git a/meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch b/meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
new file mode 100644
index 0000000..5540bef
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+This patch avoids following issues with automake 1.12:
+
+| automake: warnings are treated as errors
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libtasn1.la': linking libtool libraries using a non-POSIX
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+
+
+Index: libtasn1-2.11/configure.ac
+===================================================================
+--- libtasn1-2.11.orig/configure.ac
++++ libtasn1-2.11/configure.ac
+@@ -38,6 +38,11 @@ lgl_EARLY
+ AC_PROG_YACC
+ AC_PROG_LN_S
+ 
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
++
++
+ dnl Checks for programs.
+ AC_PROG_INSTALL
+ AM_MISSING_PROG(HELP2MAN, help2man, $missing_dir)
diff --git a/meta/recipes-support/gnutls/libtasn1_2.12.bb b/meta/recipes-support/gnutls/libtasn1_2.12.bb
index aae409e..d0b4191 100644
--- a/meta/recipes-support/gnutls/libtasn1_2.12.bb
+++ b/meta/recipes-support/gnutls/libtasn1_2.12.bb
@@ -8,9 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
+           file://libtasn1_fix_for_automake_1.12.patch \
+           "
 
 SRC_URI[md5sum] = "4eba39fb962d6cf5a370267eae8ff52b"
 SRC_URI[sha256sum] = "0e257a8a01c80e464f73262e13c226e04a15165c2ad087a340f53902281a1c5d"
-- 
1.7.9.5



