Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A81777C0D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 05:28:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0F5SjXN015598
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 21:28:45 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 14 Jan 2019 21:28:44 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jan 2019 13:28:13 +0800
Message-ID: <1547530093-50658-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547530093-50658-1-git-send-email-changqing.li@windriver.com>
References: <1547530093-50658-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] piglit: support build piglit without x11
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
X-List-Received-Date: Tue, 15 Jan 2019 05:28:44 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. Only depend on X11_DEPS when DISTRO_FEATURES enabled x11
2. test PIGLIT_BUILD_GL_TESTS depend on glx library, so depend
   on x11, so disable it when x11 is not enabled.
3. mesa-demos depend on libGL.so which is provide by recipe
   mesa, but when x11 is disabled, libGL.so is not generated.
   so we can only depend on this when x11 is enabled

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 622e046..fbeca0e 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -17,11 +17,10 @@ PV = "1.0+gitr${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libpng virtual/libx11 libxkbcommon libxrender waffle virtual/libgl libglu python3-mako-native python3-numpy-native python3-six-native virtual/egl"
+X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
+DEPENDS = "libpng waffle libxkbcommon virtual/libgl python3-mako-native python3-numpy-native python3-six-native virtual/egl ${X11_DEPS}"
 
 inherit cmake pkgconfig python3native distro_features_check bash-completion
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
 
 # depends on virtual/libgl
 REQUIRED_DISTRO_FEATURES += "opengl"
@@ -32,8 +31,10 @@ REQUIRED_DISTRO_FEATURES += "opengl"
 export TEMP = "${B}/temp/"
 do_compile[dirs] =+ "${B}/temp/"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
+PACKAGECONFIG[opengl] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,,"
+
 
 do_configure_prepend() {
    if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', d)}" = "no" ]; then
@@ -48,7 +49,8 @@ RDEPENDS_${PN} = "waffle waffle-bin python3 python3-mako python3-json \
 	python3-misc \
 	python3-unixadmin python3-xml python3-multiprocessing \
 	python3-six python3-shell python3-io \
-	python3-netserver mesa-demos bash \
+	python3-netserver bash \
+	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)} \
 	"
 
 INSANE_SKIP_${PN} += "dev-so already-stripped"
-- 
2.7.4


