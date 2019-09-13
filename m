Return-Path: <>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.openembedded.org (Postfix) with ESMTP id 50BC77ED59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 19:36:31 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DJaWaA031680
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 14:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568403392;
	bh=azlM6Wd4HQIeuvogaGVzo9t05QFieaCyxGoPsFIVaig=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WPGFDkon6UaLrUEGkRWkoFJcI/T4IV866USo40RfNREKSuFwH+56zOJnkF3nM25NC
	oYt/atfdpRGasl8yAuPM/PTEhEG7Q5usv9xPqXIWsSujokHtgjgS8N6rT/VHZRGaXC
	7o5oZV3DHyFjUFR4TU2PuRATsP+J2v0SJpOYDfxc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DJaWKA070705
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 14:36:32 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 14:36:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 14:36:32 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DJaWxW035728;
	Fri, 13 Sep 2019 14:36:32 -0500
Received: from localhost ([10.250.95.88])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8DJaVZ27626; Fri, 13 Sep 2019 14:36:31 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Gowtham Tammana <g-tammana@ti.com>, Eric
	Ruei <e-ruei1@ti.com>
Date: Fri, 13 Sep 2019 15:36:14 -0400
Message-ID: <20190913193614.4882-4-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913193614.4882-1-afd@ti.com>
References: <20190913193614.4882-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] weston: Set depends to the virtual needed not explicitly on Mesa
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
X-List-Received-Date: Fri, 13 Sep 2019 19:36:31 -0000
Content-Type: text/plain

The dependency is for EGL and GLES2 libraries. On some systems these
are not provided by Mesa, list what is actually needed so the system
can choose the correct provider.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 meta/recipes-graphics/wayland/weston_7.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_7.0.0.bb b/meta/recipes-graphics/wayland/weston_7.0.0.bb
index 5d2a9336f3..d17b8391a4 100644
--- a/meta/recipes-graphics/wayland/weston_7.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_7.0.0.bb
@@ -36,9 +36,9 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev
 # Compositor choices
 #
 # Weston on KMS
-PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/mesa virtual/libgbm mtdev"
+PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/egl virtual/gles2 virtual/libgbm mtdev"
 # Weston on Wayland (nested Weston)
-PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/mesa"
+PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/egl virtual/gles2"
 # Weston on X11
 PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libxcb libxcb libxcursor cairo"
 # Headless Weston
-- 
2.17.1


