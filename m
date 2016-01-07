Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E8F64600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 07:45:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u077jP82013464
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 23:45:25 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jan 2016 23:45:24 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jan 2016 23:45:22 -0800
Message-ID: <044da63f26c57c465d15be232b60ac8f0e8bde17.1452152689.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452152689.git.liezhi.yang@windriver.com>
References: <cover.1452152689.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] cogl-1.0: fix may be used uninitialized error
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
X-List-Received-Date: Thu, 07 Jan 2016 07:45:25 -0000
Content-Type: text/plain

Fixed when DEBUG_BUILD = "1":
test-backface-culling.c:206:7: error: 'cull_front' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|        validate_part (framebuffer,
|        ^
| cc1: some warnings being treated as errors

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ce-culling.c-fix-may-be-used-uninitialize.patch |   35 ++++++++++++++++++++
 meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb      |    2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0/test-backface-culling.c-fix-may-be-used-uninitialize.patch

diff --git a/meta/recipes-graphics/cogl/cogl-1.0/test-backface-culling.c-fix-may-be-used-uninitialize.patch b/meta/recipes-graphics/cogl/cogl-1.0/test-backface-culling.c-fix-may-be-used-uninitialize.patch
new file mode 100644
index 0000000..479a0ff
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0/test-backface-culling.c-fix-may-be-used-uninitialize.patch
@@ -0,0 +1,35 @@
+From a51f61d675a0e7d6649182c6a1325ceab8342df2 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 4 Jan 2016 22:47:29 -0800
+Subject: [PATCH] test-backface-culling.c: fix may be used uninitialized error
+
+Fixed when gcc -O:
+test-backface-culling.c:206:7: error: 'cull_front' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|        validate_part (framebuffer,
+|        ^
+| cc1: some warnings being treated as errors
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ tests/conform/test-backface-culling.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tests/conform/test-backface-culling.c b/tests/conform/test-backface-culling.c
+index e90c2f5..7c45592 100644
+--- a/tests/conform/test-backface-culling.c
++++ b/tests/conform/test-backface-culling.c
+@@ -164,7 +164,8 @@ validate_result (CoglFramebuffer *framebuffer, int y_offset)
+ 
+   for (draw_num = 0; draw_num < 16; draw_num++)
+     {
+-      CoglBool cull_front, cull_back;
++      CoglBool cull_front = FALSE;
++      CoglBool cull_back = FALSE;
+       CoglPipelineCullFaceMode cull_mode;
+ 
+       if (USE_LEGACY_STATE (draw_num))
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb
index 3b1e199..ed10c7a 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb
@@ -1,5 +1,7 @@
 require cogl-1.0.inc
 
+SRC_URI += "file://test-backface-culling.c-fix-may-be-used-uninitialize.patch"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
 SRC_URI[archive.md5sum] = "ab684ec96848d79d22757fb3064820c8"
 SRC_URI[archive.sha256sum] = "689dfb5d14fc1106e9d2ded0f7930dcf7265d0bc84fa846b4f03941633eeaa91"
-- 
1.7.9.5


