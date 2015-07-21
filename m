Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3238773694
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 12:19:09 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1ZHWVp-0002kU-Sy from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jul 2015 05:19:09 -0700
Received: from sb-ubuntu-1404-64bit.alm.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 21 Jul 2015 05:19:09 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jul 2015 08:19:08 -0400
Message-ID: <1437481148-31961-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v3] mesa-demos: Fix building demos which require GLU.
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
X-List-Received-Date: Tue, 21 Jul 2015 12:19:10 -0000
Content-Type: text/plain

Set glu_enabled when pkg-config detects GLU.  This is needed so
that HAVE_GLU is properly set to enable the GLU based demos.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 .../0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
index 4b07193..6b58c2b 100644
--- a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
+++ b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
@@ -66,7 +66,7 @@ index 9445424..bc4c8d1 100644
 -DEMO_CFLAGS="$DEMO_CFLAGS $GLU_CFLAGS"
 -DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
 +if test "x$enable_glu" = xyes; then
-+    PKG_CHECK_MODULES(GLU, [glu], [],
++    PKG_CHECK_MODULES(GLU, [glu], [glu_enabled=yes],
 +                     [AC_CHECK_HEADER([GL/glu.h],
 +                                      [],
 +                                      AC_MSG_ERROR([GLU not found]))
-- 
1.9.1


