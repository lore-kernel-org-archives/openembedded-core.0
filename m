Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8350E6E759
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 09:26:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1O9Qx32008115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 01:27:00 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 24 Feb 2014 01:26:59 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Feb 2014 04:26:56 -0500
Message-ID: <641185084afb8d76865faa13879547f8e546e553.1393233958.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1393233958.git.liezhi.yang@windriver.com>
References: <cover.1393233958.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] weston: disable-egl when no wayland
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
X-List-Received-Date: Mon, 24 Feb 2014 09:27:00 -0000
Content-Type: text/plain

There was a configure error when build weston without wayland:

configure: error: Package requirements (egl >= 7.10 glesv2 wayland-client wayland-egl) were not met:

No package 'wayland-egl' found

[YOCTO #5867]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/wayland/weston_1.4.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb b/meta/recipes-graphics/wayland/weston_1.4.0.bb
index 5c389a0..e0c354d 100644
--- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
@@ -39,7 +39,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev way
 # Weston on KMS
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa mtdev"
 # Weston on Wayland (nested Weston)
-PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-egl --disable-wayland-compositor,virtual/mesa"
 # Weston on X11
 PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
 # Headless Weston
-- 
1.7.10.4


