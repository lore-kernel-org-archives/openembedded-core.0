Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QqzKu-0004dQ-7D
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 05:20:04 +0200
Received: by iyf13 with SMTP id 13so319246iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 20:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4nM89iGQRyS1xXW+YTy+ZDUdsmuzK4MxkHJOx0mC64s=;
	b=ZBmMPU44Z00RKGnQ5x7z+fMyTe7PUJYhHtV9xziTUVxajJpn5kKq+8uWBTXGmhcpdR
	zsNeHp30JFFSLwnblwR+rQZTF/iuJi/4sPPTc73qjw6AVsGXVXoeb59tCbBBkP/wAeOo
	vVCBqzsXqfUcxKQO7mrUTYeAE65XzKRnzu5+w=
Received: by 10.42.146.2 with SMTP id h2mr7604693icv.458.1312946132019;
	Tue, 09 Aug 2011 20:15:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id ut6sm771918icb.19.2011.08.09.20.15.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Aug 2011 20:15:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 20:15:23 -0700
Message-Id: <1312946123-2982-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] intltool: Use nativeperl binary for PERL instead of 'perl'
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
X-List-Received-Date: Wed, 10 Aug 2011 03:20:04 -0000

License is GPLv2 change it.
Defining PERL for native intltool is not needed anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../intltool/intltool-0.40.6/use-nativeperl.patch  |   20 ++++++++++++++++++++
 meta/recipes-devtools/intltool/intltool.inc        |    3 +--
 meta/recipes-devtools/intltool/intltool_0.40.6.bb  |    6 ++++--
 3 files changed, 25 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch

diff --git a/meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch b/meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch
new file mode 100644
index 0000000..5f5fed3
--- /dev/null
+++ b/meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch
@@ -0,0 +1,20 @@
+OE has perl binary as 'nativeperl' in native sysroot so we look for it
+in order to avoid intltool searching and finding perl from /usr/bin
+on build system which may not have all the modules that it needs.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [OE specific]
+Index: intltool-0.40.6/intltool.m4
+===================================================================
+--- intltool-0.40.6.orig/intltool.m4	2009-02-14 14:12:28.000000000 -0800
++++ intltool-0.40.6/intltool.m4	2011-08-09 08:07:16.427347846 -0700
+@@ -110,7 +110,7 @@
+     AC_MSG_ERROR([GNU gettext tools not found; required for intltool])
+ fi
+ 
+-AC_PATH_PROG(INTLTOOL_PERL, perl)
++AC_PATH_PROG(INTLTOOL_PERL, nativeperl)
+ if test -z "$INTLTOOL_PERL"; then
+    AC_MSG_ERROR([perl not found])
+ fi
diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
index 1e778b6..7e11fc9 100644
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ b/meta/recipes-devtools/intltool/intltool.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Utility scripts for internationalizing XML"
 SECTION = "devel"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 
 URLV="${@'.'.join(bb.data.getVar('PV',d,1).split('.')[0:2])}"
 SRC_URI = "${GNOME_MIRROR}/intltool/${URLV}/intltool-${PV}.tar.bz2"
@@ -13,5 +13,4 @@ RRECOMMENDS_${PN}_virtclass-native = ""
 
 inherit autotools pkgconfig perlnative
 
-export PERL_virtclass-native = "/usr/bin/env perl"
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
index c7938e5..40672a9 100644
--- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
@@ -1,9 +1,11 @@
 require intltool.inc
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r3"
+PR = "r4"
 
-SRC_URI_append = " file://intltool-nowarn-0.40.0.patch"
+SRC_URI_append = " file://intltool-nowarn-0.40.0.patch \
+                   file://use-nativeperl.patch \
+                 "
 
 SRC_URI[md5sum] = "69bc0353323112f42ad4f9cf351bc3e5"
 SRC_URI[sha256sum] = "4d1e5f8561f09c958e303d4faa885079a5e173a61d28437d0013ff5efc9e3b64"
-- 
1.7.5.4



