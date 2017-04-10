Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DF0EE73219
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 03:16:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3A3GE4J000744
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Apr 2017 20:16:15 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 9 Apr 2017 20:16:14 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Apr 2017 11:14:40 +0800
Message-ID: <20170410031440.32220-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH] libsdl2: disable check gcc -Wdeclaration-after-statement for ppc
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
X-List-Received-Date: Mon, 10 Apr 2017 03:16:15 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Disable check gcc option -Wdeclaration-after-statement for powerpc and
powerpc64 which causes compile failures:

|   CC     build/SDL_blit_N.lo
| .../tmp/work/ppc7400-wrs-linux/libsdl2/2.0.5-r0/SDL2-2.0.5/src/video/SDL_blit_N.c: In function 'calc_swizzle32':
| .../tmp/work/ppc7400-wrs-linux/libsdl2/2.0.5-r0/SDL2-2.0.5/src/video/SDL_blit_N.c:127:5: error: ISO C90 forbids
| mixed declarations and code [-Werror=declaration-after-statement]
|      const vector unsigned char plus = VECUINT8_LITERAL(0x00, 0x00, 0x00, 0x00,
|      ^~~~~

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...able-check-gcc-Wdeclaration-after-statement.patch | 20 ++++++++++++++++++++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb       |  2 ++
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/disable-check-gcc-Wdeclaration-after-statement.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/disable-check-gcc-Wdeclaration-after-statement.patch b/meta/recipes-graphics/libsdl2/libsdl2/disable-check-gcc-Wdeclaration-after-statement.patch
new file mode 100644
index 0000000..ad48af7
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/disable-check-gcc-Wdeclaration-after-statement.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Inappropriate [disable feature]
+
+Disable check gcc option -Wdeclaration-after-statement for powerpc and
+powerpc64 which causes compile failures.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/configure.in b/configure.in
+index e2ddc9c..73b10f5 100644
+--- a/configure.in
++++ b/configure.in
+@@ -2950,7 +2950,7 @@ case "$host" in
+             *-*-minix*)         ARCH=minix ;;
+         esac
+         CheckVisibilityHidden
+-        CheckDeclarationAfterStatement
++#        CheckDeclarationAfterStatement
+         CheckDummyVideo
+         CheckDiskAudio
+         CheckDummyAudio
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
index d747cf1..33963c1 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
@@ -20,6 +20,8 @@ SRC_URI = " \
     file://0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch \
     file://0002-Avoid-finding-build-host-s-wayland-scanner.patch \
 "
+SRC_URI_append_powerpc = " file://disable-check-gcc-Wdeclaration-after-statement.patch"
+SRC_URI_append_powerpc64 = " file://disable-check-gcc-Wdeclaration-after-statement.patch"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-- 
2.10.1


