Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA5C87C1B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 03:04:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0G34Vnx019034
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 19:04:41 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 15 Jan 2019 19:04:20 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jan 2019 11:04:16 +0800
Message-ID: <1547607856-350971-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547607856-350971-1-git-send-email-changqing.li@windriver.com>
References: <CAJTo0La-p53Onb4bNXJ50XJi4XXyJe+b1p6RtfCEHo-B_7R8EA@mail.gmail.com>
	<1547607856-350971-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] piglit: support build piglit without x11
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
X-List-Received-Date: Wed, 16 Jan 2019 03:04:51 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

*  test PIGLIT_BUILD_GL_TESTS depend on glx library, so depend
   on x11, so respect the DISTRO_FEATURES, only enable it when
   x11 is enabled.
*  mesa-demos depend on libGL.so which is provide by recipe
   mesa, but when x11 is disabled, libGL.so is not generated.
   so we can only rdepend on this when x11 is enabled
*  add x11 PACKAGECONFIG to add correct config/depend/rdepend

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 622e046..0737d02 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -17,11 +17,12 @@ PV = "1.0+gitr${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libpng virtual/libx11 libxkbcommon libxrender waffle virtual/libgl libglu python3-mako-native python3-numpy-native python3-six-native virtual/egl"
+X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
+X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
+
+DEPENDS = "libpng waffle libxkbcommon virtual/libgl python3-mako-native python3-numpy-native python3-six-native virtual/egl"
 
 inherit cmake pkgconfig python3native distro_features_check bash-completion
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
 
 # depends on virtual/libgl
 REQUIRED_DISTRO_FEATURES += "opengl"
@@ -32,8 +33,10 @@ REQUIRED_DISTRO_FEATURES += "opengl"
 export TEMP = "${B}/temp/"
 do_compile[dirs] =+ "${B}/temp/"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
+PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
+
 
 do_configure_prepend() {
    if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', d)}" = "no" ]; then
@@ -48,7 +51,7 @@ RDEPENDS_${PN} = "waffle waffle-bin python3 python3-mako python3-json \
 	python3-misc \
 	python3-unixadmin python3-xml python3-multiprocessing \
 	python3-six python3-shell python3-io \
-	python3-netserver mesa-demos bash \
+	python3-netserver bash \
 	"
 
 INSANE_SKIP_${PN} += "dev-so already-stripped"
-- 
2.7.4


