Return-Path: <andre.draszik@linaro.org>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 070666B262
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 08:39:13 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h10so2291607eaj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 01:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=f816WRCeot4rW5GSkwIWKlr8qaMtxd02V0d1VARjYlw=;
	b=eoQaFz2SEUuU0slUNc4oJczg5fq/6MxE2xOdoYOCkowvTZ+d+zb6jaBemxVkC44TiL
	NX6G9TF+z3i87fNbxT6Wg5oRH3I++/smSH4TzXds4IJmuKu+zsoxCH+7Cqf8jV0GpmYz
	tUcacjDz8dEa7AnehFLylQd2djiUkieHJ/8aQRztxHDtmLSn3m4SuYJ2idEnyRy6xiey
	/M+QZncVB8+G9469Nr8mghU0txS63Z9K2mLaLIiAu2unV9Q+9qpNToUudCiYU9rAHl7+
	jUkJ3LNevuk/053xGXU50XAfKXnCio5JdqocHoW3zfUZcFPekAEG9ww4qxRtwZJirHJo
	pwkw==
X-Received: by 10.14.47.73 with SMTP id s49mr15068504eeb.71.1374223153732;
	Fri, 19 Jul 2013 01:39:13 -0700 (PDT)
Received: from bril0118.bri.st.com (sushi.andred.org. [85.214.105.253])
	by mx.google.com with ESMTPSA id
	bj46sm25556840eeb.13.2013.07.19.01.39.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Jul 2013 01:39:13 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2013 09:39:10 +0100
Message-Id: <1374223150-16033-1-git-send-email-andre.draszik@linaro.org>
X-Mailer: git-send-email 1.8.2
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQlEOM26QwY/tn2OAn5bbeyiXO4FVfTv4nMhWRPXWdGs0MNoErDhTzQ0kh2ghrLZbah89HYv
Subject: [PATCH] directfb: don't patch pkg-config files
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
X-List-Received-Date: Fri, 19 Jul 2013 08:39:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are currently getting build failures of projects that rely on
being able to access DirectFB's internal include directories, as
returned via pkg-config, since the include paths returned by
pkg-config are incomplete.

The reason for that is the patch that is being removed with this
change. It modified the cflags returned by pkg-config in an
incorrect way, causing us to miss important include paths:

For reference, pkg-config output with incorrect patch applied:
  ad@bril0118 #513 ~> pkg-config --cflags directfb-internal
-D_GNU_SOURCE -D_REENTRANT -I<builddir>/tmp/sysroots/<machine>/usr/include/directfb -I<builddir>/tmp/sysroots/<machine>/usr/include

Now, with the incorrect patch removed, the output is as expected:
  ad@bril0118 #514 ~> pkg-config --cflags directfb-internal
-D_GNU_SOURCE -D_REENTRANT -I<builddir>/tmp/sysroots/<machine>/usr/include/directfb-internal -I<builddir>/tmp/sysroots/<machine>/usr/include/directfb

Overall, the removed patch is not needed - pkg-config does the right
thing these days and we can simply use the correctly working upstream
versions of all DirectFB .pc files.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 meta/recipes-graphics/directfb/directfb.inc        |  1 -
 .../directfb-1.2.x-fix-pkgconfig-cflags.patch      | 48 ----------------------
 2 files changed, 49 deletions(-)
 delete mode 100644 meta/recipes-graphics/directfb/directfb/directfb-1.2.x-fix-pkgconfig-cflags.patch

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index cff8a7f..97a4c55 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -14,7 +14,6 @@ DEPENDS = "jpeg libpng freetype zlib tslib"
 INC_PR = "r0"
 
 SRC_URI = "http://directfb.org/downloads/Core/DirectFB-1.6/DirectFB-${PV}.tar.gz \
-           file://directfb-1.2.x-fix-pkgconfig-cflags.patch \
            file://configurefix.patch \
            file://mesa9.patch"
 
diff --git a/meta/recipes-graphics/directfb/directfb/directfb-1.2.x-fix-pkgconfig-cflags.patch b/meta/recipes-graphics/directfb/directfb/directfb-1.2.x-fix-pkgconfig-cflags.patch
deleted file mode 100644
index ee60718..0000000
--- a/meta/recipes-graphics/directfb/directfb/directfb-1.2.x-fix-pkgconfig-cflags.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-directfb: Get this patch from Openembedded
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
-
-diff -Nur DirectFB-1.4.15/directfb-internal.pc.in DirectFB-1.4.15.new//directfb-internal.pc.in
---- DirectFB-1.4.15/directfb-internal.pc.in	2011-09-29 17:51:21.000000000 +0800
-+++ DirectFB-1.4.15.new//directfb-internal.pc.in	2011-11-03 15:14:37.000000000 +0800
-@@ -2,10 +2,10 @@
- exec_prefix=@exec_prefix@
- moduledir=@MODULEDIR@
- moduledirname=@MODULEDIRNAME@
--includedir=@INTERNALINCLUDEDIR@
-+includedir=@includedir@
- 
- Name: DirectFB-Internal
- Description: Third party module support package for DirectFB.
- Version: @VERSION@
- Requires: directfb = @VERSION@
--Cflags: @DFB_INTERNAL_CFLAGS@ -I@INTERNALINCLUDEDIR@
-+Cflags: @DFB_INTERNAL_CFLAGS@ -I${includedir}/directfb -I${includedir}
-diff -Nur DirectFB-1.4.15/directfb.pc.in DirectFB-1.4.15.new//directfb.pc.in
---- DirectFB-1.4.15/directfb.pc.in	2011-09-29 17:51:21.000000000 +0800
-+++ DirectFB-1.4.15.new//directfb.pc.in	2011-11-03 15:15:55.000000000 +0800
-@@ -9,4 +9,4 @@
- Requires: @DEP_VOODOO@ fusion direct
- Libs: -L${libdir} -ldirectfb @THREADLIB@ @OSX_LIBS@
- Libs.private: -L${libdir} @LIBM@ @DYNLIB@ @ZLIB_LIBS@
--Cflags: @THREADFLAGS@ -I@INCLUDEDIR@
-+Cflags: @THREADFLAGS@ -I${includedir}/directfb
-diff -Nur DirectFB-1.4.15/lib/fusion/fusion.pc.in DirectFB-1.4.15.new//lib/fusion/fusion.pc.in
---- DirectFB-1.4.15/lib/fusion/fusion.pc.in	2011-09-29 17:51:21.000000000 +0800
-+++ DirectFB-1.4.15.new//lib/fusion/fusion.pc.in	2011-11-03 15:16:46.000000000 +0800
-@@ -8,4 +8,4 @@
- Version: @VERSION@
- Requires: direct
- Libs: -L${libdir} -lfusion
--Cflags: -I@INCLUDEDIR@
-+Cflags: -I${includedir}/directfb -I${includedir}
-diff -Nur DirectFB-1.4.15/lib/voodoo/voodoo.pc.in DirectFB-1.4.15.new//lib/voodoo/voodoo.pc.in
---- DirectFB-1.4.15/lib/voodoo/voodoo.pc.in	2011-09-29 17:51:21.000000000 +0800
-+++ DirectFB-1.4.15.new//lib/voodoo/voodoo.pc.in	2011-11-03 15:17:34.000000000 +0800
-@@ -8,4 +8,4 @@
- Version: @VERSION@
- Requires: direct
- Libs: -L${libdir} -lvoodoo
--Cflags: -I@INCLUDEDIR@
-+Cflags: -I${includedir}/directfb -I${includedir}
-- 
1.8.2


