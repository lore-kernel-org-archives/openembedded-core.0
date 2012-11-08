Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TWQZL-0008Ge-8J
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Nov 2012 12:46:47 +0100
Received: from mail-la0-f69.google.com ([209.85.215.69])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 08 Nov 2012 03:32:53 -0800
Received: by mail-la0-f69.google.com with SMTP id l5so1881478lah.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2012 03:32:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=p7AiJ0U9X55WEHT+GvsKcBj6m+iddYa13+OMKRt0Qd0=;
	b=OAvT65kcpfkD3x++4PLB9BXOUlWvLBjqqZyXSvS6OYUcJhWqqTLyinqv5NbtMHHMnx
	e3MO+qDyLU0W36KtGAht8iVpkkAPBFap+xTVRECBqgp+DBzILCWNeTeE20pctJwyU2po
	vQQ9ud5KNFegjGlezT9efbAiQnGAOTRIm07key91jsocb9QlzUtr3NXyMJW7LWf+C9cY
	lpV48rWRCfRHnOxQDpROStcpOqQnK+Z7dYTKIAvvUSid2hl2+M6AZHiSN9wJwMAiPQUQ
	cwD05WF/xuMoYwA8rySUbQXBTWG7RcRPRvlnB3O43S9lGhziOfvQRDB8z3j/YFz6poyV
	xAmQ==
Received: by 10.180.7.194 with SMTP id l2mr30094123wia.0.1352374371673;
	Thu, 08 Nov 2012 03:32:51 -0800 (PST)
Received: by 10.180.7.194 with SMTP id l2mr30094078wia.0.1352374371213;
	Thu, 08 Nov 2012 03:32:51 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm7886394wib.3.2012.11.08.03.32.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Nov 2012 03:32:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Nov 2012 11:31:31 +0000
Message-Id: <1352374291-29789-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnwQVfl9aHJLJnc1cDP7o5C65Qx6U+kXqu51iRSy8IWMyWn5vd5ioN9b3XLyEpcgfbKQjqOaqFAhPTCG3C54wpEssgNC/hKIXMG2gI4lKh+pPEsBqI+rS5DKU5yhPRbSGXMJL8zFwu1Mtrb2CTt2YzIfjm07G52rllaIJOjhaY3BYxnsSIVmu2/ZUAMYaIFtghbw/Mq
Subject: [PATCH] mesa: remove python2 detection hack
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Nov 2012 11:46:49 -0000

Our python-native is 2.7.3 which ships python2, and we've been patching it in to
earlier versions since September 2011.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-8.0.4.inc    |    2 --
 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb |    2 +-
 meta/recipes-graphics/mesa/mesa-dri_git.bb   |    3 +--
 meta/recipes-graphics/mesa/mesa-git.inc      |    2 --
 4 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-8.0.4.inc b/meta/recipes-graphics/mesa/mesa-8.0.4.inc
index 9afb35d..c6307dc 100644
--- a/meta/recipes-graphics/mesa/mesa-8.0.4.inc
+++ b/meta/recipes-graphics/mesa/mesa-8.0.4.inc
@@ -13,8 +13,6 @@ SRC_URI[md5sum] = "d546f988adfdf986cff45b1efa2d8a46"
 SRC_URI[sha256sum] = "02ed19f4f5f6535dda03a9932a81438aa78ea723ebba1f39a3d49a70a4e1d07e"
 
 do_configure_prepend() {
-  #check for python not python2, because python-native does not stage python2 binary/link
-  sed -i 's/AC_CHECK_PROGS(\[PYTHON2\], \[python2 python\])/AC_CHECK_PROGS(\[PYTHON2\], \[python python\])/g' ${S}/configure.ac
   # We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
   sed -i "s#\./builtin_compiler#${STAGING_BINDIR_NATIVE}/glsl/builtin_compiler#g" ${S}/src/glsl/Makefile
 }
diff --git a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
index bd62c98..fb35676 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
@@ -1,4 +1,4 @@
 require mesa-common.inc
 require mesa-${PV}.inc
 require mesa-dri.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index 4b36f20..de1aa14 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -5,5 +5,4 @@ require mesa-dri.inc
 # this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
 DEFAULT_PREFERENCE = "-2"
 
-PR = "${INC_PR}.0"
-
+PR = "${INC_PR}.1"
diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index 7910eb6..b907931 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -16,8 +16,6 @@ SRC_URI += "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://0004-gross-ha
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
-  #check for python not python2, because python-native does not stage python2 binary/link
-  sed -i 's/AC_CHECK_PROGS(\[PYTHON2\], \[python2 python\])/AC_CHECK_PROGS(\[PYTHON2\], \[python python\])/g' ${S}/configure.ac
   # We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
   sed -i "s#\./builtin_compiler#${STAGING_BINDIR_NATIVE}/glsl/builtin_compiler#g" ${S}/src/glsl/Makefile
 }
-- 
1.7.10



