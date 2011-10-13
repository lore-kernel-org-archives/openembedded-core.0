Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJbn-00043l-9d
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:37:55 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Kuzy4njO8m24VYVymn7GZDZIF2xthBJtFRWzCMtSSe0=;
	b=DkP5I/QYsjFVrLf0vabtILDBJUarOqxrfQTx+YfLFWghUCvLw3PpjbRJ2nI+XHfRKp
	ZADZI1kwqwB5n/D1Qw1MKNELtMiEKl8HGMXQeDPrIHg2AwlLBqN4kUYoIu0+rIh78Id+
	9mqW0lYNOMcRbGsXuviy9idZhWkGo9xgFeifM=
Received: by 10.204.10.67 with SMTP id o3mr2464409bko.3.1318505530257;
	Thu, 13 Oct 2011 04:32:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d17sm3245698bkq.11.2011.10.13.04.32.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:32:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:29 +0200
Message-Id: <7278a507dcecff4a27ceeb81a2d2de5b9cb84c87.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 11/20] mesa: package gl/egl/osmesa to separate packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2011 11:42:19 -0000

* also install internal GL headers to libgl-dev

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |   18 ++++++++++++++++--
 1 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 89ef0cf..62d9b24 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -40,7 +40,21 @@ require glx-use-tls.inc
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
-PACKAGES =+ "libglu libglu-dev"
-
+PACKAGES =+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
+FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
+FILES_libgl = "${libdir}/libGL.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
+FILES_libosmesa = "${libdir}/libOSMesa.so.*"
+
+FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
+FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL"
 FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
+FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
+
+FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
+FILES_libegl-dbg += "${libdir}/egl/.debug/*"
+
+do_install_append () {
+    install -d ${D}/${includedir}/GL
+    cp -pPr ${S}/include/GL/internal* ${D}/${includedir}/GL
+}
-- 
1.7.7



