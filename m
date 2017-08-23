Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40ECC78285
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 15:51:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7NFpn0r006179
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 08:51:49 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 08:51:48 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Aug 2017 10:50:16 -0500
Message-ID: <1503503416-47233-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1503503416-47233-1-git-send-email-mark.hatle@windriver.com>
References: <1503503416-47233-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] vulkan: Only build when 'vulkan' distro flag is set
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
X-List-Received-Date: Wed, 23 Aug 2017 15:51:48 -0000
Content-Type: text/plain

Only build with the vulkan distro flag is set.  (References to this flag
were found in the mesa recipe.)

In addition, only set the RRECOMEMND to mesa, if 'opengl' flag is set.  Mesa
required opengl distro flag to build.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb | 2 ++
 meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb  | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
index 828ef50..0b89435 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
@@ -15,6 +15,8 @@ SRCREV = "18df00c7b4677b0889486e16977857aa987947e2"
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
 
+REQUIRED_DISTRO_FEATURES = 'vulkan'
+
 inherit cmake distro_features_check
 DEPENDS = "vulkan assimp"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb b/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
index 555d741..1893269 100644
--- a/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
@@ -18,6 +18,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
+REQUIRED_DISTRO_FEATURES = "vulkan"
 
 inherit cmake python3native lib_package distro_features_check
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
@@ -32,4 +33,5 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '' ,d)}
 PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -DDEMOS_WSI_SELECTION=XCB, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF -DDEMOS_WSI_SELECTION=WAYLAND, libxcb libx11 libxrandr"
 PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
 
-RRECOMMENDS_${PN} = "mesa-vulkan-drivers"
+# mesa requires opengl
+RRECOMMENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-vulkan-drivers', '', d)}"
-- 
1.8.3.1


