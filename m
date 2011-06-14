Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QWXKs-0004xz-1a
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 19:23:30 +0200
Received: from localhost.localdomain (c-76-115-40-57.hsd1.or.comcast.net
	[76.115.40.57])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id DF2AA304FE;
	Tue, 14 Jun 2011 13:20:01 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 10:19:46 -0700
Message-Id: <2f43aeab4bfdf4615a9dc1c48f3cd6d6a047a0c9.1308071077.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308071077.git.scott.a.garman@intel.com>
References: <cover.1308071077.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1308071077.git.scott.a.garman@intel.com>
References: <cover.1308071077.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: DF2AA304FE.BFC0E
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 1/2] sudo: upgrade to v1.8.1p2
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
X-List-Received-Date: Tue, 14 Jun 2011 17:23:30 -0000

Upgrading to the latest stable release of sudo.

This version of sudo has reorganized its source code layout, hence
the LIC_FILES_CHKSUM related changes. Also, some of the individual
.c files we checksummed (nonunix.h, vasgroups.c) are no longer
shipped with the sources. Finally, an embedded copy of zlib is now
included in these sources, so Zlib is included as one of the
licenses. I could not find any evidence of MIT-licensed sources,
so that license has been removed.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc                |   27 ++++++++-----------
 .../sudo/{sudo_1.7.4p6.bb => sudo_1.8.1p2.bb}      |    4 +-
 2 files changed, 13 insertions(+), 18 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.7.4p6.bb => sudo_1.8.1p2.bb} (52%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index fd68057..0d9f35e 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,14 +4,12 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 PRIORITY = "optional"
 SECTION = "admin"
-LICENSE = "ISC & UCB & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0b07397b2fca3fb8b71f08cd85c6eb3f \
-                    file://nonunix.h;beginline=4;endline=28;md5=af7d361f47ae60769cac77e4fca0dbb0 \
-                    file://vasgroups.c;beginline=4;endline=28;md5=af7d361f47ae60769cac77e4fca0dbb0 \
-                    file://fnmatch.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
-                    file://getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
-                    file://glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
-                    file://snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea"
+LICENSE = "ISC & UCB & Zlib"
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=54f1b46c2459ecec3d892618eab44302 \
+                    file://compat/fnmatch.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
+                    file://compat/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
+                    file://compat/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
+                    file://compat/snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea"
 
 inherit autotools
 
@@ -23,17 +21,14 @@ do_configure_prepend () {
 	fi
 }
 
-# The script "mkinstalldirs" from package "sudo" will create directory 
-# "/var/lib/sudo" by recursion with mode "0700" during installing files.
-# That is to say, "var", "var/lib" and "var/lib/sudo" will possess access authority 
-# with mode "0700". It cause that directory "var" and "var/lib" 
-# can't be accessed by common user. Creating directory "/var/lib" before 
-# installing files can resolve this problem.
-
+# Explicitly create ${localstatedir}/lib before do_install to ensure
+# the directory is accessible by all users. Otherwise the mkinstalldirs
+# script (from sudo) will recursively create ${localstatedir}/lib/sudo
+# and then chmod each directory with 0700 permissions, which isn't what
+# we want (i.e, users would not be able to access /var/lib).
 do_install_prepend (){
 	mkdir -p ${D}/${localstatedir}/lib
 }
- 
 
 pkg_postinst_${PN} () {
 	if [ "x$D" != "x" ]; then
diff --git a/meta/recipes-extended/sudo/sudo_1.7.4p6.bb b/meta/recipes-extended/sudo/sudo_1.8.1p2.bb
similarity index 52%
rename from meta/recipes-extended/sudo/sudo_1.7.4p6.bb
rename to meta/recipes-extended/sudo/sudo_1.8.1p2.bb
index edc9a0e..7eba307 100644
--- a/meta/recipes-extended/sudo/sudo_1.7.4p6.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.1p2.bb
@@ -5,7 +5,7 @@ PR = "r0"
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            file://libtool.patch"
 
-SRC_URI[md5sum] = "1ae12d3d22e7ffedbf2db26f957676f0"
-SRC_URI[sha256sum] = "20091ef71018698c674c779f4b57178b2ecb4275fa34909b06219d2688ad14d5"
+SRC_URI[md5sum] = "e8330f0e63b0ecb2e12b5c76922818cc"
+SRC_URI[sha256sum] = "281f90c80547cf22132e351e7f61c25ba4ba9cf393438468f318f9a7884026fb"
 
 EXTRA_OECONF += " --with-pam=no"
-- 
1.7.1



