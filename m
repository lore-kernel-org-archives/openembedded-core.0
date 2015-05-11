Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E42E973CF8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 06:08:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4B68lan008554
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 23:08:48 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 10 May 2015 23:08:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 May 2015 23:08:36 -0700
Message-ID: <0a72c613793cdbf17ca8d0ae8b663179fa54b42a.1431324180.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431324180.git.liezhi.yang@windriver.com>
References: <cover.1431324180.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/12] mesa-demos: only enable glu when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 11 May 2015 06:08:47 -0000
Content-Type: text/plain

Fixed when no x11 in DISTRO_FEATURES:
checking for GL/glu.h... no
configure: error: GLU not found

The GL/glu.h is provided by libglu, and libglu requires libGL.so which
is provided by mesa, but mesa doesn't build out libGL.so without x11 in
DISTRO_FEATURES, so only enable glu when x11 in DISTRO_FEATURES.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
index 1caa50b..e565442 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
@@ -25,8 +25,8 @@ SRC_URI[sha256sum] = "e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221a9774d0952f
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ?= "drm osmesa freetype2 gbm egl gles1 gles2 glu \
-                  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glew', '', d)}"
+PACKAGECONFIG ?= "drm osmesa freetype2 gbm egl gles1 gles2 \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glew glu', '', d)}"
 
 # The Wayland code doesn't work with Wayland 1.0, so disable it for now
 #${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
-- 
1.7.9.5


