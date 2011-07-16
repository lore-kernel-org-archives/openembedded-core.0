Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QhxiZ-0000Qt-Lu
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 07:47:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jul 2011 22:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,212,1309762800"; d="scan'208";a="28686242"
Received: from unknown (HELO localhost) ([10.255.14.16])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2011 22:43:08 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, sgw@linux.intel.com,
	scott.a.garman@intel.com, richard.purdie@linuxfoundation.org
Date: Fri, 15 Jul 2011 22:42:48 -0700
Message-Id: <6d623c5f469a873ee9264983da3e85e9eb560233.1310794521.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1310794521.git.dvhart@linux.intel.com>
References: <cover.1310794521.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1310794521.git.dvhart@linux.intel.com>
References: <cover.1310794521.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/1] Revert "sudo: upgrade to v1.8.1p2"
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
X-List-Received-Date: Sat, 16 Jul 2011 05:47:11 -0000

Fixes [YOCTO 1211]

This reverts commit 7c6f47b13c55e5c1d15d9ab9c2cee3da065fb592.

The upgrade caused rootless X to fail on at least the n450 BSP. X would fail to
start with:

xf86OpenConsole: Cannot open /dev/tty0 (No such file or directory)

The file does indeed exist. If the permissions were changed to a+rw, X would get
further, and then abort with permissions issues with /dev/dri/card0. Setting
those permissions to a+rw would allow it to start on boot without issue.
However, if the init script was run after logging in as root, X would start
fine (no changes necessary to the files it complained about on boot).

Reverting this patch restores the rootless X functionality.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-extended/sudo/sudo.inc                |   27 +++++++++++--------
 .../sudo/{sudo_1.8.1p2.bb => sudo_1.7.4p6.bb}      |    4 +-
 2 files changed, 18 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.1p2.bb => sudo_1.7.4p6.bb} (52%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 72a7c16..0f41e02 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -3,12 +3,14 @@ DESCRIPTION = "Sudo (superuser do) allows a system administrator to give certain
 HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
-LICENSE = "ISC & UCB & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=54f1b46c2459ecec3d892618eab44302 \
-                    file://compat/fnmatch.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
-                    file://compat/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
-                    file://compat/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
-                    file://compat/snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea"
+LICENSE = "ISC & UCB & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0b07397b2fca3fb8b71f08cd85c6eb3f \
+                    file://nonunix.h;beginline=4;endline=28;md5=af7d361f47ae60769cac77e4fca0dbb0 \
+                    file://vasgroups.c;beginline=4;endline=28;md5=af7d361f47ae60769cac77e4fca0dbb0 \
+                    file://fnmatch.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
+                    file://getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
+                    file://glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
+                    file://snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea"
 
 inherit autotools
 
@@ -20,14 +22,17 @@ do_configure_prepend () {
 	fi
 }
 
-# Explicitly create ${localstatedir}/lib before do_install to ensure
-# the directory is accessible by all users. Otherwise the mkinstalldirs
-# script (from sudo) will recursively create ${localstatedir}/lib/sudo
-# and then chmod each directory with 0700 permissions, which isn't what
-# we want (i.e, users would not be able to access /var/lib).
+# The script "mkinstalldirs" from package "sudo" will create directory 
+# "/var/lib/sudo" by recursion with mode "0700" during installing files.
+# That is to say, "var", "var/lib" and "var/lib/sudo" will possess access authority 
+# with mode "0700". It cause that directory "var" and "var/lib" 
+# can't be accessed by common user. Creating directory "/var/lib" before 
+# installing files can resolve this problem.
+
 do_install_prepend (){
 	mkdir -p ${D}/${localstatedir}/lib
 }
+ 
 
 pkg_postinst_${PN} () {
 	if [ "x$D" != "x" ]; then
diff --git a/meta/recipes-extended/sudo/sudo_1.8.1p2.bb b/meta/recipes-extended/sudo/sudo_1.7.4p6.bb
similarity index 52%
rename from meta/recipes-extended/sudo/sudo_1.8.1p2.bb
rename to meta/recipes-extended/sudo/sudo_1.7.4p6.bb
index 7eba307..edc9a0e 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.1p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.7.4p6.bb
@@ -5,7 +5,7 @@ PR = "r0"
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            file://libtool.patch"
 
-SRC_URI[md5sum] = "e8330f0e63b0ecb2e12b5c76922818cc"
-SRC_URI[sha256sum] = "281f90c80547cf22132e351e7f61c25ba4ba9cf393438468f318f9a7884026fb"
+SRC_URI[md5sum] = "1ae12d3d22e7ffedbf2db26f957676f0"
+SRC_URI[sha256sum] = "20091ef71018698c674c779f4b57178b2ecb4275fa34909b06219d2688ad14d5"
 
 EXTRA_OECONF += " --with-pam=no"
-- 
1.7.1



