Return-Path: <>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by mail.openembedded.org (Postfix) with ESMTP id 8113A7F72D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 13:11:28 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8HDBT16096971;
	Tue, 17 Sep 2019 08:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568725889;
	bh=kRZz92m2tUlsQfyKuyyH6wv7jeez9ZixvbtsceWZoBw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=l5lqsKU6vyN4M3DLaoAJGMi5f9Q0VjnQeNa9EZ5Ks7Lo/pVjYeCsZh2a7aAGyQIQt
	OaRj+2LPkZEY8qJOnGxDpTEl+YeH4YxZUDgZE6gpr3Pwk1qoXahL6flbJ4385ScqIC
	Qu4IW0yjUeMKjC4OFuRtNA6SfpEkj57tyTu7ecWI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8HDBTtt009543
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Sep 2019 08:11:29 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 17 Sep 2019 08:11:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 17 Sep 2019 08:11:26 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8HDBTtU082949;
	Tue, 17 Sep 2019 08:11:29 -0500
Received: from localhost ([10.250.95.88])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8HDBPZ16587; Tue, 17 Sep 2019 08:11:26 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	Gowtham Tammana <g-tammana@ti.com>, Eric Ruei <e-ruei1@ti.com>
Date: Tue, 17 Sep 2019 09:10:53 -0400
Message-ID: <20190917131053.32411-4-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917131053.32411-1-afd@ti.com>
References: <20190917131053.32411-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/4] weston: Set depends to the virtual needed not explicitly on Mesa
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
X-List-Received-Date: Tue, 17 Sep 2019 13:11:29 -0000
Content-Type: text/plain

The dependency is for EGL and GLES2 libraries. On some systems these
are not provided by Mesa, list what is actually needed so the system
can choose the correct provider.

Signed-off-by: Andrew F. Davis <afd@ti.com>
Acked-by: Denys Dmytriyenko <denys@ti.com>
---

Changes from v1:
 - s/gles2/libgles2

 meta/recipes-graphics/wayland/weston_7.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_7.0.0.bb b/meta/recipes-graphics/wayland/weston_7.0.0.bb
index 5d2a9336f3..f9efdbd20a 100644
--- a/meta/recipes-graphics/wayland/weston_7.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_7.0.0.bb
@@ -36,9 +36,9 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev
 # Compositor choices
 #
 # Weston on KMS
-PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/mesa virtual/libgbm mtdev"
+PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/egl virtual/libgles2 virtual/libgbm mtdev"
 # Weston on Wayland (nested Weston)
-PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/mesa"
+PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/egl virtual/libgles2"
 # Weston on X11
 PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libxcb libxcb libxcursor cairo"
 # Headless Weston
-- 
2.17.1


