Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Se9Ge-0001k1-S2
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 20:23:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5BICYSC019810
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 11:12:34 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 11 Jun 2012 11:12:33 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jun 2012 13:19:00 -0500
Message-ID: <06262b0aa233ae73c04adca1fd2a78d8d247f8aa.1339438568.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1339438568.git.mark.hatle@windriver.com>
References: <cover.1339438568.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 9/9] rpm: Ensure pkgconfig deps don't stray from the package being built
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
X-List-Received-Date: Mon, 11 Jun 2012 18:23:09 -0000
Content-Type: text/plain

Force pkg-config to only look in the install directory, and not be
able to fall back to system pkg-config directories for resolution.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/rpm-pkgconfigdeps.patch                |   34 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 +-
 2 files changed, 36 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.patch b/meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.patch
new file mode 100644
index 0000000..4aba400
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.patch
@@ -0,0 +1,34 @@
+pkgconfigdeps.sh: Change to restricting pkgconfig to the local directory
+
+Using PKG_CONFIG_PATH will allow pkg-config to fall back to the system paths,
+we don't want this as it may lead to inaccurate results in some corner cases.
+
+PKG_CONFIG_LIBDIR will ensure pkg-config stays within the install directory.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur rpm-5.4.9.orig/scripts/pkgconfigdeps.sh rpm-5.4.9/scripts/pkgconfigdeps.sh
+--- rpm-5.4.9.orig/scripts/pkgconfigdeps.sh	2009-02-13 08:13:37.000000000 -0600
++++ rpm-5.4.9/scripts/pkgconfigdeps.sh	2012-06-07 17:35:42.730003847 -0500
+@@ -18,8 +18,8 @@
+     *.pc)
+ 	# Query the dependencies of the package.
+ 	DIR=`dirname ${filename}`
+-	PKG_CONFIG_PATH="$DIR:$DIR/../../share/pkgconfig"
+-	export PKG_CONFIG_PATH
++	PKG_CONFIG_LIBDIR="$DIR:$DIR/../../share/pkgconfig"
++	export PKG_CONFIG_LIBDIR
+ 	$pkgconfig --print-provides "$filename" 2> /dev/null | while read n r v ; do
+ 	    [ -n "$n" ] || continue
+ 	    # We have a dependency.  Make a note that we need the pkgconfig
+@@ -42,8 +42,8 @@
+ 	[ -n "$oneshot" ] && echo "$oneshot"; oneshot=""
+ 	# Query the dependencies of the package.
+ 	DIR=`dirname ${filename}`
+-	PKG_CONFIG_PATH="$DIR:$DIR/../../share/pkgconfig"
+-	export PKG_CONFIG_PATH
++	PKG_CONFIG_LIBDIR="$DIR:$DIR/../../share/pkgconfig"
++	export PKG_CONFIG_LIBDIR
+ 	$pkgconfig --print-requires "$filename" 2> /dev/null | while read n r v ; do
+ 	    [ -n "$n" ] || continue
+ 	    if  [ -n "$r" ] && [ -n "$v" ]; then
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index a38a684..51cf93b 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file"
-PR = "r42"
+PR = "r43"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -71,6 +71,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-lua.patch \
 	   file://rpm-ossp-uuid.patch \
 	   file://rpm-packageorigin.patch \
+	   file://rpm-pkgconfigdeps.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.3.4



