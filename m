Received: from p3plsmtpa08-06.prod.phx3.secureserver.net (p3plsmtpa08-06.prod.phx3.secureserver.net [173.201.193.107])
 by mx.groups.io with SMTP id smtpd.web12.2913.1598298343493433700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 12:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pabigot.com, ip: 173.201.193.107, mailfrom: pab@pabigot.com)
Received: from tirzah.pab ([73.65.46.39])
	by :SMTPAUTH: with ESMTPSA
	id AIPWkCQFh5bPVAIPWkXfpE; Mon, 24 Aug 2020 12:45:42 -0700
X-CMAE-Analysis: v=2.3 cv=B9fHL9lM c=1 sm=1 tr=0
 a=G5fDw918NYv3KufUwDvNPg==:117 a=G5fDw918NYv3KufUwDvNPg==:17 a=tR03Z30jAAAA:8
 a=LWBComziL9R4uTEQ984A:9 a=KfdqL2KK0gLj6ZZCE6RX:22
X-SECURESERVER-ACCT: pab@pabigot.com
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Cc: "Peter A. Bigot" <pab@pabigot.com>
Subject: [PATCH] bluez5: fix builds that require ell support
Date: Mon, 24 Aug 2020 14:44:51 -0500
Message-Id: <20200824194451.279731-1-pab@pabigot.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDw+25YUBWIqm6zPBZV4bZmnigvwFAT/jhX8UfTBoPow87t8SmIPX6iN8cxhC0ihYCc26n8+l4SwZry2ANN7d7AlklJrVToMth1dcyriv3TjHCen6vNC
 oJQho2ROWyALIVIB1nUS4yGjgMDnGFxrDDMReCrQGPUwXMORRLwaLG0rbBk+wIDkEnjx2x42bM3fFOd+C/UwGRlreYW7DorjSDk=
Content-Transfer-Encoding: 8bit

Shortly after the recipe was updated to add ell as a mesh dependency
the way ell was integrated into bluez5 was changed.  Add the new
configuration options required for an external ell.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index eee7a53cd61..73e98f2b6d4 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -42,8 +42,8 @@ PACKAGECONFIG[sixaxis] = "--enable-sixaxis,--disable-sixaxis"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
 PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
 PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
-PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
-PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
+PACKAGECONFIG[mesh] = "--enable-mesh --enable-external-ell,--disable-mesh --disable-external-ell, json-c ell"
+PACKAGECONFIG[btpclient] = "--enable-btpclient --enable-external-ell,--disable-btpclient --disable-external-ell, ell"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
-- 
2.25.1

