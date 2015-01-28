Return-Path: <Pengyu.Ma@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 720E57147D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 07:15:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0S7FIlg001188
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 23:15:18 -0800 (PST)
Received: from android-OptiPlex-980.corp.ad.wrs.com (128.224.163.162) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 27 Jan 2015 23:15:18 -0800
From: Pengyu Ma <pengyu.ma@windriver.com>
To: <pengyu.ma@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Jan 2015 15:15:17 +0800
Message-ID: <1422429317-19707-1-git-send-email-pengyu.ma@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] mesa: Upgrade to 10.4.0
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
X-List-Received-Date: Wed, 28 Jan 2015 07:15:22 -0000
Content-Type: text/plain

Signed-off-by: Pengyu Ma <pengyu.ma@windriver.com>
---
 meta/recipes-graphics/mesa/mesa_10.4.0.bb |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa_10.4.0.bb

diff --git a/meta/recipes-graphics/mesa/mesa_10.4.0.bb b/meta/recipes-graphics/mesa/mesa_10.4.0.bb
new file mode 100644
index 0000000..7d3723e
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa_10.4.0.bb
@@ -0,0 +1,16 @@
+require ${BPN}.inc
+
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "b7b37117eecbdfaaf3075acfb063d5a3"
+SRC_URI[sha256sum] = "98a7dff3a1a6708c79789de8b9a05d8042e867067f70e8f30387c15026233219"
+
+S = "${WORKDIR}/Mesa-${PV}"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install_append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+    fi
+}
-- 
1.7.9.5


