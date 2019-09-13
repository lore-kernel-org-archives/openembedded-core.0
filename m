Return-Path: <>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by mail.openembedded.org (Postfix) with ESMTP id 5EFC47ED81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 19:36:28 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DJaT1i002936
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 14:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568403389;
	bh=fA1Mih34tpjAZ0ityWDCh4OAPrueurC0dBvavW3jnOo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YtFaZIXRUue6BLph/TqmJHDPLhVdm5LDF6OdDMaHuE+GiFArgU3uAKxprzsCQAZAQ
	CMfhg9KAAEgu5srklNdZk+PSw/cNnY33BwfahfwVajVEODSelmsemLERuGQQXsYDV8
	+hsn7QM9YpRyB8QPv03URZ/lvkuAyTAUdDSfvf3s=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DJaTKW065936
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 14:36:29 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 14:36:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 14:36:28 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DJaSxM089681;
	Fri, 13 Sep 2019 14:36:28 -0500
Received: from localhost ([10.250.95.88])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8DJaRZ27586; Fri, 13 Sep 2019 14:36:28 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Gowtham Tammana <g-tammana@ti.com>, Eric
	Ruei <e-ruei1@ti.com>
Date: Fri, 13 Sep 2019 15:36:12 -0400
Message-ID: <20190913193614.4882-2-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913193614.4882-1-afd@ti.com>
References: <20190913193614.4882-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] cogl: Set depends to the virtual needed not explicitly on Mesa
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
X-List-Received-Date: Fri, 13 Sep 2019 19:36:28 -0000
Content-Type: text/plain

The dependency is for EGL and GLES2 libraries. On some systems these
are not provided by Mesa, list what is actually needed so the system
can choose the correct provider.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 3e392fa5ec..b8c64c029a 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -18,7 +18,7 @@ EDEPENDS_GLES2 = "virtual/libgles2"
 EDEPENDS_KMS = "libdrm virtual/egl"
 EDEPENDS_EGL = "virtual/egl"
 EDEPENDS_X11 = "virtual/libx11 libxcomposite libxfixes libxi libxrandr"
-EDEPENDS_WAYLAND = "virtual/mesa wayland"
+EDEPENDS_WAYLAND = "virtual/egl virtual/libgles2 wayland"
 
 # Extra RDEPENDS for PACKAGECONFIG
 # This has to be explictly listed, because cogl dlopens the backends
-- 
2.17.1


