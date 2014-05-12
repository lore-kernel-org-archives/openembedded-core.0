Return-Path: <drew@moseleynet.net>
Received: from relay1.mentorg.com (unknown [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 298B860167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 20:10:25 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1WjwYM-0000X5-CN from drew@moseleynet.net 
	for openembedded-core@lists.openembedded.org;
	Mon, 12 May 2014 13:10:26 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 12 May 2014 13:10:26 -0700
Received: from sb-ubuntu-1204-64bit.alm.mentorg.com ([134.86.97.83]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 12 May 2014 13:10:25 -0700
From: "\\Drew Moseley" <drew@moseleynet.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 16:10:46 -0400
Message-Id: <1399925446-28631-1-git-send-email-drew@moseleynet.net>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <537110BF.3000109@linux.intel.com>
References: <537110BF.3000109@linux.intel.com>
X-OriginalArrivalTime: 12 May 2014 20:10:25.0890 (UTC)
	FILETIME=[36775C20:01CF6E1E]
Subject: [PATCH] mesa-demos: Specify the lib dir properly.
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
X-List-Received-Date: Mon, 12 May 2014 20:10:28 -0000

From: Drew Moseley <drew_moseley@mentor.com>

Use STAGING_EXECPREFIXDIR to specify the location of glut
header files and libs rather than STAGING_LIBDIR.

Also revert the previous unneeded change to glut.patch.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-graphics/mesa/mesa-demos/glut.patch |    2 +-
 meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos/glut.patch b/meta/recipes-graphics/mesa/mesa-demos/glut.patch
index 2ca5a93..84b6d4f 100644
--- a/meta/recipes-graphics/mesa/mesa-demos/glut.patch
+++ b/meta/recipes-graphics/mesa/mesa-demos/glut.patch
@@ -27,7 +27,7 @@ Index: mesa-demos-8.0.1/configure.ac
 -		[glutInit],
 -		[],
 -		[glut_enabled=no])
-+	 GLUT_LIBS="-L$withval -lglut"],
++	 GLUT_LIBS="-L$withval/lib -lglut"],
 +	[GLUT_CFLAGS=""
 +	 GLUT_LIBS="-lglut"]
 +        )
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
index 211df3b..7cda19e 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
@@ -33,7 +33,7 @@ PACKAGECONFIG[freetype2] = "--enable-freetype2,--disable-freetype2,freetype"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgl"
 PACKAGECONFIG[gles1] = "--enable-gles1,--disable-gles1,virtual/libgles1"
 PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,virtual/libgles2"
-PACKAGECONFIG[glut] = "--with-glut=${STAGING_LIBDIR},--without-glut,"
+PACKAGECONFIG[glut] = "--with-glut=${STAGING_EXECPREFIXDIR},--without-glut,"
 PACKAGECONFIG[osmesa] = "--enable-osmesa,--disable-osmesa,"
 PACKAGECONFIG[vg] = "--enable-vg,--disable-vg,virtual/libvg"
 PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,virtual/libgl wayland"
-- 
1.7.9.5


