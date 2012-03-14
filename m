Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7uju-00051K-Ei
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 21:24:06 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 7B2AB2FF3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 16:15:17 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 13:15:20 -0700
Message-Id: <758e3bcd293ff4d4ed4b729f732beca4eeb6d5c1.1331756004.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331756004.git.scott.a.garman@intel.com>
References: <cover.1331756004.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331756004.git.scott.a.garman@intel.com>
References: <cover.1331756004.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 7B2AB2FF3C.C6FB9
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/2] ncurses: fix packaging of moved libraries
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
X-List-Received-Date: Wed, 14 Mar 2012 20:24:06 -0000

This ensures packaging of the ncurses libraries moved to
base_libdir is done correctly.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index fe2c3e4..3319949 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r6"
+INC_PR = "r7"
 
 inherit autotools binconfig multilib_header
 
@@ -199,8 +199,11 @@ shell_do_install() {
 
 python populate_packages_prepend () {
         libdir = d.expand("${libdir}")
+        base_libdir = d.expand("${base_libdir}")
         pnbase = d.expand("${PN}-lib%s")
         do_split_packages(d, libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
+        if libdir is not base_libdir:
+            do_split_packages(d, base_libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
 }
 
 
@@ -232,7 +235,6 @@ FILES_${PN} = "\
   ${bindir}/ncurses5-config \
   ${bindir}/ncursesw5-config \
   ${datadir}/tabset \
-  ${base_libdir}/* \
 "
 
 # This keeps only tput/tset in ncurses
-- 
1.7.5.4



