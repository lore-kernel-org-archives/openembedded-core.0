Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id B55F46D756
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 15:35:50 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u57so9396919wes.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 07:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Au+GTdLG5jcZMOWuz0PC+u0KJt1iY7JgrGpwBfn1Pc0=;
	b=PrihZrxrKhRpvKZcvmvexxSNfYWBPPwv3ZExmGz/7/n2G6VhBEgUXBFul4MG3A7LXH
	MKJUGYj8Lb1aPFeXNtj5d+BuT2jjBX39UR8OYozNCsIuFponCRBMnxLofYx3AeAzAc4f
	GcpIp785AiGTU6d4W6+1zWWNuaRA0w+qXd4Px4TvJJxu1wAHwbeMFaV3Ux/LinC4qVhw
	lZLueB3zGZhPbNhlmxxrT2S2BqldtUsDXAqq8N7AsJ++lssDyZ6iV+jlPYWu9ufvNBMK
	JVEv4w2Uf3QW/TTOTG0K+3UByGkEq5NS9OfSk/8XeCTHmTUZ02h8ccUeorcd/q1ei0+o
	aO8A==
X-Gm-Message-State: ALoCoQlW0NNZK2INBFRV1ZnakwrupzkC+Xbj5eTk5RI1hSsrS5yozuDE9w0y/6ak3FrZRm41GS5p
X-Received: by 10.194.189.132 with SMTP id gi4mr11812005wjc.5.1386171350044;
	Wed, 04 Dec 2013 07:35:50 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id f11sm7982684wic.4.2013.12.04.07.35.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 07:35:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 15:35:39 +0000
Message-Id: <1386171342-7213-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386171342-7213-1-git-send-email-ross.burton@intel.com>
References: <1386171342-7213-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/5] libxft: fix Freetype header inclusion
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
X-List-Received-Date: Wed, 04 Dec 2013 15:35:51 -0000

Freetype 2.5.1 changes the location of the header files but as directly
including the files isn't recommended they don't see this as a problem.  Change
libxft to use the recommended macros instead of direct inclusion, to fix the
compilation.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/libxft/freetype.patch                 |   39 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb     |    8 ++--
 2 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxft/freetype.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxft/freetype.patch b/meta/recipes-graphics/xorg-lib/libxft/freetype.patch
new file mode 100644
index 0000000..9f1aa21
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxft/freetype.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From f568fa5a8220fd06659c0f26a93adcc81a42917c Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 2 Dec 2013 13:48:40 +0000
+Subject: [PATCH] xftglyphs: use recommend freetype inclusion
+
+FreeType recommends to use their special macros to include the headers, because
+it gives them the ability to move headers around.  They did this in 2.5.1 (yes,
+a point release) and this direct inclusion doesn't work anymore.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ src/xftglyphs.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/xftglyphs.c b/src/xftglyphs.c
+index 2f3dc5a..53302f0 100644
+--- a/src/xftglyphs.c
++++ b/src/xftglyphs.c
+@@ -21,10 +21,10 @@
+  */
+ 
+ #include "xftint.h"
+-#include <freetype/ftoutln.h>
+-#include <freetype/ftlcdfil.h>
+-
+-#include <freetype/ftsynth.h>
++#include <ft2build.h>
++#include FT_FREETYPE_H
++#include FT_LCD_FILTER_H
++#include FT_SYNTHESIS_H
+ 
+ /*
+  * Validate the memory info for a font
+-- 
+1.8.5
+
diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb
index 627a6d3..16838f0 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb
@@ -20,6 +20,11 @@ PROVIDES = "xft"
 
 PE = "1"
 
+SRC_URI += "file://freetype.patch"
+
+SRC_URI[md5sum] = "78d64dece560c9e8699199f3faa521c0"
+SRC_URI[sha256sum] = "7fce32b92dcb7b2869bed567af2abc7bbad0d5d6fcf471b8a3e137964a31bbbd"
+
 XORG_PN = "libXft"
 
 BBCLASSEXTEND = "native"
@@ -28,6 +33,3 @@ python () {
         if d.getVar('DEBIAN_NAMES', True):
             d.setVar('PKG_${PN}', '${MLPREFIX}libxft2')
 }
-
-SRC_URI[md5sum] = "78d64dece560c9e8699199f3faa521c0"
-SRC_URI[sha256sum] = "7fce32b92dcb7b2869bed567af2abc7bbad0d5d6fcf471b8a3e137964a31bbbd"
-- 
1.7.10.4


