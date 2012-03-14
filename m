Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7rJk-00009C-RO
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 17:44:52 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 2ADF92FF3A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 12:36:03 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 09:36:08 -0700
Message-Id: <db023a254e70a7cb819a6cab3008a666305ceafd.1331742556.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331742556.git.scott.a.garman@intel.com>
References: <cover.1331742556.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331742556.git.scott.a.garman@intel.com>
References: <cover.1331742556.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 2ADF92FF3A.00F8C
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] ncurses: fix packaging of moved libraries
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
X-List-Received-Date: Wed, 14 Mar 2012 16:44:53 -0000

The recent move of some of the ncurses libraries to base_libdir
does not work with our automatic library packaging, so this
explicity creates packages for libncurses, libncursesw, and
libtinfo.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc |   18 ++++++++++++++++--
 1 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index fe2c3e4..b73005d 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r6"
+INC_PR = "r7"
 
 inherit autotools binconfig multilib_header
 
@@ -221,6 +221,9 @@ pkg_prerm_ncurses-tools () {
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES += " \
+  ${PN}-libncurses \
+  ${PN}-libncursesw \
+  ${PN}-libtinfo \
   ${PN}-tools \
   ${PN}-terminfo \
   ${PN}-terminfo-base \
@@ -232,7 +235,18 @@ FILES_${PN} = "\
   ${bindir}/ncurses5-config \
   ${bindir}/ncursesw5-config \
   ${datadir}/tabset \
-  ${base_libdir}/* \
+"
+
+FILES_${PN}-libncurses = "\
+  ${base_libdir}/libncurses.so.* \
+"
+
+FILES_${PN}-libncursesw = "\
+  ${base_libdir}/libncursesw.so.* \
+"
+
+FILES_${PN}-libtinfo = "\
+  ${base_libdir}/libtinfo.so.* \
 "
 
 # This keeps only tput/tset in ncurses
-- 
1.7.5.4



