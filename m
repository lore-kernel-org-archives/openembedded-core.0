Received: from p3plsmtpa06-03.prod.phx3.secureserver.net (p3plsmtpa06-03.prod.phx3.secureserver.net [173.201.192.104])
 by mx.groups.io with SMTP id smtpd.web12.13738.1598362995833084860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 06:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pabigot.com, ip: 173.201.192.104, mailfrom: pab@pabigot.com)
Received: from tirzah.pab ([73.65.46.39])
	by :SMTPAUTH: with ESMTPSA
	id AZEIkROJ1Ntu3AZEJknX0x; Tue, 25 Aug 2020 06:43:15 -0700
X-CMAE-Analysis: v=2.3 cv=I6Mbu+og c=1 sm=1 tr=0
 a=G5fDw918NYv3KufUwDvNPg==:117 a=G5fDw918NYv3KufUwDvNPg==:17
 a=w7N3wJ57tmbK7B5i_r4A:9
X-SECURESERVER-ACCT: pab@pabigot.com
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Cc: "Peter A. Bigot" <pab@pabigot.com>
Subject: [PATCH v2] bluez5: fix builds that require ell support
Date: Tue, 25 Aug 2020 08:43:00 -0500
Message-Id: <20200825134300.887457-1-pab@pabigot.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfM7yPLtiNlPJ+z7nOlz7T1og8TjjUnSTOdYbiS+G/5/13pFD3CuP0n3mbVlcOW7DCljyaqUtboWPLTiqn5Av5oVnrcsZnR+t5xj3kYU0egwuVMnHy4gM
 m/yc+/TjQU3iYQ4GTKn+p/uuCeFO4pvtFzywjrB/aEl4cmrjF0Qw/m67QVD6/GT+Ow4Werd6E1raRqSQKD93lKh4H/g2kHApkcY=
Content-Transfer-Encoding: 8bit

Shortly after the recipe was updated to add ell as a mesh dependency
the way ell was integrated into bluez5 was changed.  Use the external
ell dependency rather than the default to build one internal to
bluez5.
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index eee7a53cd61..9b38bda5a79 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
-DEPENDS = "dbus glib-2.0"
+DEPENDS = "dbus ell glib-2.0"
 PROVIDES += "bluez-hcidump"
 RPROVIDES_${PN} += "bluez-hcidump"
 
@@ -42,8 +42,8 @@ PACKAGECONFIG[sixaxis] = "--enable-sixaxis,--disable-sixaxis"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
 PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
 PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
-PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
-PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
+PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c"
+PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
@@ -63,6 +63,7 @@ EXTRA_OECONF = "\
   --enable-test \
   --enable-datafiles \
   --enable-library \
+  --enable-external-ell \
   --without-zsh-completion-dir \
 "
 
-- 
2.25.1

