Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TohvI-0007My-LZ
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 22:57:00 +0100
Received: from localhost (c-50-137-42-92.hsd1.or.comcast.net [50.137.42.92])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 7C9A62FEF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 16:42:00 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 13:41:35 -0800
Message-Id: <b6bcd4e26e94364939c8874db90e64fbb242e841.1356730817.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 7C9A62FEF3.13F2C
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 02/15] diffutils: Fix build with eglibc 2.16
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
X-List-Received-Date: Fri, 28 Dec 2012 21:57:00 -0000

From: Khem Raj <raj.khem@gmail.com>

eglibc 2.16 has removed gets so we account for that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffutils/diffutils-3.2/remove-gets.patch      |   22 ++++++++++++++++++++
 meta/recipes-extended/diffutils/diffutils_3.2.bb   |    6 ++++--
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch

diff --git a/meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch b/meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch
new file mode 100644
index 0000000..58ed62d
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch
@@ -0,0 +1,22 @@
+check for gets before using it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: diffutils-3.2/lib/stdio.in.h
+===================================================================
+--- diffutils-3.2.orig/lib/stdio.in.h	2011-08-28 04:57:28.000000000 -0700
++++ diffutils-3.2/lib/stdio.in.h	2012-07-03 10:45:07.518322117 -0700
+@@ -693,11 +693,13 @@
+ _GL_CXXALIAS_SYS (gets, char *, (char *s));
+ #  undef gets
+ # endif
++# if defined gets
+ _GL_CXXALIASWARN (gets);
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++# endif
+ #endif
+ 
+ 
diff --git a/meta/recipes-extended/diffutils/diffutils_3.2.bb b/meta/recipes-extended/diffutils/diffutils_3.2.bb
index 174866c..c46863d 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.2.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.2.bb
@@ -5,9 +5,11 @@ SECTION = "base"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.gz \
+           file://remove-gets.patch \
+          "
 
 inherit autotools update-alternatives gettext
 
-- 
1.7.9.5



