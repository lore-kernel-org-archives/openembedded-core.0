Return-Path: <>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA987F290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 13:11:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8HDB1LO033592;
	Tue, 17 Sep 2019 08:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568725861;
	bh=vcK+zeMo1qoICa6LkRQyrsTZUBa9WhXUgKARmyw05MM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=V4accCbrl4/OND1qoLDFD94LMawJU2PtudMA1vXqGZe77VOAAh32ZLQ8pRpM5KQiP
	NY+pwUA7bE+gXYrwtPNi173NiNJQWfuzD/QRAfZzUTR1a8kiE6Rl4BUoPBoqdCXAZH
	He8HcodPHCO5Lv+vTogocd+p8UfmkdRTm2kIZ/ws=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8HDB1cr121357
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Sep 2019 08:11:01 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 17 Sep 2019 08:10:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 17 Sep 2019 08:11:01 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8HDB0K5098236;
	Tue, 17 Sep 2019 08:11:00 -0500
Received: from localhost ([10.250.95.88])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8HDAwZ16073; Tue, 17 Sep 2019 08:10:58 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	Gowtham Tammana <g-tammana@ti.com>, Eric Ruei <e-ruei1@ti.com>
Date: Tue, 17 Sep 2019 09:10:51 -0400
Message-ID: <20190917131053.32411-2-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917131053.32411-1-afd@ti.com>
References: <20190917131053.32411-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/4] cogl: Set depends to the virtual needed not explicitly on Mesa
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
X-List-Received-Date: Tue, 17 Sep 2019 13:11:00 -0000
Content-Type: text/plain

The dependency is for EGL and GLES2 libraries. On some systems these
are not provided by Mesa, list what is actually needed so the system
can choose the correct provider.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 4038afbc11..4436163168 100644
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


