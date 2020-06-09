Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.7726.1591710792720393049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 06:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 059DqYYm026843
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 9 Jun 2020 06:52:44 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 9 Jun 2020
 06:52:12 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH V2] glib-networking/btrfs-tools/dosfstools/parted/bmap-tools/libsoup-2.4: add nativesdk support
Date: Tue, 9 Jun 2020 21:52:10 +0800
Message-ID: <20200609135210.11110-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

In order to make wic tool work in sdk which is out of an
existed Yocto build, it needs to port wic tool as a nativesdk
recipe.

First, make these runtime depends recipes to support nativesdk

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.64.3.bb | 2 +-
 meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb      | 2 +-
 meta/recipes-devtools/dosfstools/dosfstools_4.1.bb          | 2 +-
 meta/recipes-extended/parted/parted_3.3.bb                  | 2 +-
 meta/recipes-support/bmap-tools/bmap-tools_3.5.bb           | 2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.70.0.bb          | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb b/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
index a79e0e4988..c34ae508f6 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.64.3.bb
@@ -31,4 +31,4 @@ FILES_${PN} += "\
 FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
 FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb
index 885d79dcdc..29f14d9077 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb
@@ -49,4 +49,4 @@ do_install_append() {
     fi
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
index 23b8836670..97ce449954 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
@@ -22,7 +22,7 @@ EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
 
 CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 # Add codepage437 to avoid error from `dosfsck -l`
 RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconv-ibm437"
diff --git a/meta/recipes-extended/parted/parted_3.3.bb b/meta/recipes-extended/parted/parted_3.3.bb
index 1cfd9ec264..aa4d8042cf 100644
--- a/meta/recipes-extended/parted/parted_3.3.bb
+++ b/meta/recipes-extended/parted/parted_3.3.bb
@@ -22,7 +22,7 @@ EXTRA_OECONF = "--disable-device-mapper"
 
 inherit autotools pkgconfig gettext texinfo ptest
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 do_compile_ptest() {
 	oe_runmake -C tests print-align print-max dup-clobber duplicate fs-resize print-flags
diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
index 694c5f09be..fd57f8f7f0 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
@@ -22,4 +22,4 @@ RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptoo
 inherit python3native
 inherit setuptools3
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.70.0.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.70.0.bb
index d10db7940a..d6425bd941 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.70.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.70.0.bb
@@ -40,4 +40,4 @@ DEBIAN_NOAUTONAME_${PN} = "1"
 # glib-networking is needed for SSL, proxies, etc.
 RRECOMMENDS_${PN} = "glib-networking"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.18.2

