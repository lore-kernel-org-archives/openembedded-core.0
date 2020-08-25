Received: from p3plsmtpa06-02.prod.phx3.secureserver.net (p3plsmtpa06-02.prod.phx3.secureserver.net [173.201.192.103])
 by mx.groups.io with SMTP id smtpd.web11.16305.1598369739683993272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 08:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pabigot.com, ip: 173.201.192.103, mailfrom: pab@pabigot.com)
Received: from tirzah.pab ([73.65.46.39])
	by :SMTPAUTH: with ESMTPSA
	id Aaz4kJzZzuXtSAaz4kWyCP; Tue, 25 Aug 2020 08:35:39 -0700
X-CMAE-Analysis: v=2.3 cv=Yv9xuLQX c=1 sm=1 tr=0
 a=G5fDw918NYv3KufUwDvNPg==:117 a=G5fDw918NYv3KufUwDvNPg==:17 a=tR03Z30jAAAA:8
 a=bvhZLmXwNWAoyZYRj84A:9 a=KfdqL2KK0gLj6ZZCE6RX:22
X-SECURESERVER-ACCT: pab@pabigot.com
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Cc: "Peter A. Bigot" <pab@pabigot.com>
Subject: [PATCH v3] bluez5: fix builds that require ell support
Date: Tue, 25 Aug 2020 10:34:01 -0500
Message-Id: <20200825153401.1283593-1-pab@pabigot.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfI/M08Jvj9d6FxzgX5euX3j+SRC/D5IZaVrZFCANJSL6rXsfFCUmGwy4K/ySEUy4eceyx/GYP5T1OuG24BtuYJKr3eFSWY2K0xzjEmgFFVvA27VqJMEp
 MYGjpLRosVlpcPXZr67EEJtf+hejuxoLd7Iygwzr1H879HcJOCy7FPGjequZRRCrNVUfw7r9nwMgLGcmnR9hI2ANb+4R5aIEHNA=
Content-Transfer-Encoding: 8bit

Shortly after the recipe was updated to add ell as a mesh dependency
the way ell was integrated into bluez5 was changed.  BlueZ requires
ell only for mesh and for btpclient (external test programs).  It will
be ignored unless either mesh or btpclient are selected.

ell can be supplied externally, or it can be copied into the bluez
build directory from an existing sibling source directory.  Since
bitbake builds do not provide a sibling source directory tell bluez to
look for it as an external library in the conditions where it's
required.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---

v3: Follow request to not make dependency unconditional, but also not
    introduce conflict when only one package variant requires it

v2: Follow request to make dependency unconditional with DEPENDS

 meta/recipes-connectivity/bluez5/bluez5.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index eee7a53cd61..367c85ea120 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -42,8 +42,8 @@ PACKAGECONFIG[sixaxis] = "--enable-sixaxis,--disable-sixaxis"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
 PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
 PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
-PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
-PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
+PACKAGECONFIG[mesh] = "--enable-mesh --enable-external-ell,--disable-mesh, json-c ell"
+PACKAGECONFIG[btpclient] = "--enable-btpclient --enable-external-ell,--disable-btpclient, ell"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
-- 
2.25.1

