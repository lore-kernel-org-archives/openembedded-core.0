Return-Path: <noor_ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A0C4A609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 13:52:18 +0000 (UTC)
Received: from em-wv03.wv.mentorg.com ([147.34.98.30]
	helo=em-wv-03.wv.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Y8r22-0004AX-LG from noor_ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Jan 2015 05:52:18 -0800
Received: from gemini.alm.mentorg.com ([134.86.102.153]) by
	em-wv-03.wv.mentorg.com (8.8.8/CF5.40R)
Received: from pkl-ahsann-ubuntu.pkl.mentorg.com
	(pkl-ahsann-ubuntu.pkl.mentorg.com [137.202.157.70])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id t07DqFGV031603; 
	Wed, 7 Jan 2015 07:52:16 -0600
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jan 2015 18:51:18 +0500
Message-Id: <1420638678-22481-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] bind: Update libxml2 check to make it deterministic.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Jan 2015 13:52:25 -0000

From: Noor <noor_ahsan@mentor.com>

* Firstly configure scritp was testing files from bin folder.
  In our case we don't copy bin folder to sysroot for target
  recipes. So added extra check to validate .pc file from lib
  folder via a patch to configure.in file.
* Secondly linxml2 dependency was missing. So added PACKAGECONFIG
  for libxml2.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 ...d-crosscripts-search-path-for-xml2-config.patch |   35 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |    9 +++--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind/bind-add-crosscripts-search-path-for-xml2-config.patch b/meta/recipes-connectivity/bind/bind/bind-add-crosscripts-search-path-for-xml2-config.patch
new file mode 100644
index 0000000..4f1a3f8
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/bind-add-crosscripts-search-path-for-xml2-config.patch
@@ -0,0 +1,35 @@
+From 8fa549fe5390875d56f75e20d364394cd5ccf388 Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe_macdonald@mentor.com>
+Date: Mon, 3 Nov 2014 21:52:02 -0500
+Subject: [PATCH] bind: add crosscripts search path for xml2-config
+
+The configure script was testing xml2-config from bin but in openembedded
+bin folder is not copied to sysroot so the test was failing. Added another 
+condition to test libxml-2.0.pc which is present in lib folder. Used pkg-config
+to get libs and cflags information.
+
+Upstream-Status: Inappropriate [ openembedded specific ]
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
+---
+ configure.in | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.in b/configure.in
+index 3d04f4c..6032f67 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1433,6 +1433,9 @@ case "$use_libxml2" in
+ 		if test -f "$use_libxml2/bin/xml2-config" ; then
+ 			libxml2_libs=`$use_libxml2/bin/xml2-config --libs`
+ 			libxml2_cflags=`$use_libxml2/bin/xml2-config --cflags`
++		elif test -f "$use_libxml2/lib/pkgconfig/libxml-2.0.pc" ; then
++			libxml2_libs=`pkg-config libxml-2.0 --libs`
++			libxml2_cflags=`pkg-config libxml-2.0 --cflags`
+ 		fi
+ 		;;
+ esac
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index 8e04f8a..eacb23f 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -18,6 +18,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://bind9 \
            file://init.d-add-support-for-read-only-rootfs.patch \
            file://bind9_9_5-CVE-2014-8500.patch \
+           file://bind-add-crosscripts-search-path-for-xml2-config.patch \
 	   "
 
 SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"
@@ -29,10 +30,14 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
                  --disable-devpoll --disable-epoll --with-gost=no \
                  --with-gssapi=no --with-ecdsa=yes \
                  --sysconfdir=${sysconfdir}/bind \
-                 --with-openssl=${STAGING_LIBDIR}/.. --with-libxml2=${STAGING_LIBDIR}/.. \
+                 --with-openssl=${STAGING_LIBDIR}/.. \
                  --enable-exportlib --with-export-includedir=${includedir} --with-export-libdir=${libdir} \
                "
-inherit autotools-brokensep update-rc.d systemd useradd
+inherit autotools-brokensep update-rc.d systemd useradd pkgconfig
+
+PACKAGECONFIG ?= "libxml2"
+
+PACKAGECONFIG[libxml2] = "--with-libxml2=${STAGING_LIBDIR}/..,--with-libxml2=no,libxml2"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home /var/cache/bind --no-create-home \
-- 
1.7.9.5


