Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9268760962
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 19:28:55 +0000 (UTC)
Received: by qkfe185 with SMTP id e185so18780826qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=MhBfg2n3UxwHAtaQaVFbJNE54nUNW8TAitPdtX5uqi0=;
	b=tQj8T9M+qtHcmYvPCsesUqmpL2bHZ//tbPmHrbTGbSFEQPmd2+XwwRqxZiWTVTbWGe
	haaVkCqNbBd1dbr7RClO4cNtF2lz1y2stYIBO38Wp1BQmHaq609orDL8nzp29CgxGUP8
	jdy6k55Bb/8u7pL5MwvV6p//D31fnuOQUkzBa4vLthUi/xcuymISQTutCUFkxulO5uro
	edm7Sq00tIEgiIQj94of78J1eVzuUPGssdC9rIBiw+4/MSJnyuveUNCRBnKMsTPDDwsz
	u1A9tEPi0GYILNNp6goSEMHGNcSMYi+dhJmLYvbM1ot1jB56htD2kzptAWUsO/gNQToj
	AEGA==
X-Received: by 10.55.17.26 with SMTP id b26mr17076218qkh.93.1434396536980;
	Mon, 15 Jun 2015 12:28:56 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.226.57])
	by mx.google.com with ESMTPSA id u15sm6729900qhd.3.2015.06.15.12.28.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Jun 2015 12:28:55 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jun 2015 16:31:28 -0300
Message-Id: <1434396688-11363-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] piglit: Add missing inclusion of Xutil.h
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
X-List-Received-Date: Mon, 15 Jun 2015 19:28:57 -0000

The EGL tests rely on Xutil.h being included. Some EGL implementation
does not explitly include it by default and than the build fail.

This fixes the build in imx53qsb board, of meta-fsl-arm, but is a
generic fix.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...0001-tests-Fix-missing-include-of-Xutil.h.patch | 28 ++++++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         |  5 ++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/piglit/files/0001-tests-Fix-missing-include-of-Xutil.h.patch

diff --git a/meta/recipes-graphics/piglit/files/0001-tests-Fix-missing-include-of-Xutil.h.patch b/meta/recipes-graphics/piglit/files/0001-tests-Fix-missing-include-of-Xutil.h.patch
new file mode 100644
index 0000000..bbae001
--- /dev/null
+++ b/meta/recipes-graphics/piglit/files/0001-tests-Fix-missing-include-of-Xutil.h.patch
@@ -0,0 +1,28 @@
+From 824b20391c05e4b1689288eee829563d7bb4d338 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Mon, 15 Jun 2015 16:25:30 -0300
+Subject: [PATCH] tests: Fix missing include of Xutil.h
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ tests/egl/egl-configless-context.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/egl/egl-configless-context.c b/tests/egl/egl-configless-context.c
+index 0504a26..154b55c 100644
+--- a/tests/egl/egl-configless-context.c
++++ b/tests/egl/egl-configless-context.c
+@@ -32,6 +32,7 @@
+ /* Chunks of code in this file are taken from egl-util.c */
+ 
+ #include <X11/Xlib.h>
++#include <X11/Xutil.h>
+ 
+ #include "piglit-util-gl.h"
+ #include "piglit-util-egl.h"
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 75e41fe..9e6dc2c 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -2,7 +2,8 @@ SUMMARY = "OpenGL driver testing framework"
 LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
-SRC_URI = "git://anongit.freedesktop.org/piglit"
+SRC_URI = "git://anongit.freedesktop.org/piglit \
+           file://0001-tests-Fix-missing-include-of-Xutil.h.patch"
 
 # From 2014/12/04
 SRCREV = "126c7d049b8f32e541625d5a35fbc5f5e4e7fbf8"
@@ -28,4 +29,4 @@ RDEPENDS_${PN} = "waffle python python-mako python-json python-subprocess \
 	mesa-demos bash \
 	"
 
-INSANE_SKIP_${PN} += "dev-so"
\ No newline at end of file
+INSANE_SKIP_${PN} += "dev-so"
-- 
2.1.4


