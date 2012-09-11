Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBc-0001nL-4G
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:52 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:19 -0700
Received: by mail-we0-f175.google.com with SMTP id r6so507617wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=6dvJyAp6WgHZbKuwTgiA02xnoUj135v0CO6RVUOFhVY=;
	b=YbDjC7tT3W94ky+P1pb26zV7o5yt3M1b5k1Sjmg9qAjDuPnnZ1NwenmUFz9AX0xLiw
	axJsekfVM3YihPOZk/cEwtpnzlj11x/XObMgOXeqW2qH+MwydedlHs0bK4bdixy5L6Jd
	H0DRWGrC3hbxGHYDKiQLwE0aXXD73o1SdYzc/JbOqHDWGcUG3MCinMzjgMYhoiLVBOcG
	VqEATLYv05HozOuhyMHzToeuxq+I/GhJ2mT34FL1ipn6A3oGMIy3x65XmuId9LAfFl8v
	JGle+WJC+OUb7NtJrf3SOzNifcG36VIsD3NSDAeDUDYxACWTWa50vwBfpztwC0vteCru
	SLqg==
Received: by 10.216.95.10 with SMTP id o10mr10852855wef.213.1347391159591;
	Tue, 11 Sep 2012 12:19:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:18:05 +0100
Message-Id: <1347391088-30390-15-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmod3+rfhJwn4CVYjRME31V9vtBmU1JlPWthcx0AHbXrntGuVTtNPAdIcEjcvcahz9BYB/3
Subject: [RFC 15/18] libx11: drop makekeys_crosscompile.patch, effectively merged upstream
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
X-List-Received-Date: Tue, 11 Sep 2012 19:31:52 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/libx11/makekeys_crosscompile.patch    |   76 --------------------
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     |    3 +-
 2 files changed, 1 insertion(+), 78 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/makekeys_crosscompile.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/makekeys_crosscompile.patch b/meta/recipes-graphics/xorg-lib/libx11/makekeys_crosscompile.patch
deleted file mode 100644
index daf3696..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11/makekeys_crosscompile.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Because the size of "unsigned long" is different between 32-bit
-and 64-bit, judge whether target is 32-bit or 64-bit and tell
-"makekey".
-
-The error information from LSB Test suite is as follow:
-VSW5TESTSUITE PURPOSE 7
-Assertion XStringToKeysym-7.(A)
-When the string argument is the name of a KeySym in the 
-table with the prefix XK_ removed, then a call to
-XStringToKeysym returns that KeySym.
-METH: For each KeySym name in table with code G:
-METH: Call XStringToKeysym to obtain the KeySym defined for that string.
-METH: Verify that XStringToKeysym did not return NoSymbol.
-METH: Verify that the returned string is correct.
-CHECK: XStringToKeysym-7 1, line 130 
-CHECK: XStringToKeysym-7 2, line 140 
-CHECK: XStringToKeysym-7 3, line 150 
-CHECK: XStringToKeysym-7 4, line 160 
-CHECK: XStringToKeysym-7 5, line 170 
-CHECK: XStringToKeysym-7 6, line 180 
-CHECK: XStringToKeysym-7 7, line 190 
-CHECK: XStringToKeysym-7 8, line 200 
-CHECK: XStringToKeysym-7 9, line 210 
-CHECK: XStringToKeysym-7 10, line 220 
-CHECK: XStringToKeysym-7 11, line 230 
-CHECK: XStringToKeysym-7 12, line 240 
-CHECK: XStringToKeysym-7 13, line 250 
-CHECK: XStringToKeysym-7 14, line 260 
-CHECK: XStringToKeysym-7 15, line 270 
-CHECK: XStringToKeysym-7 16, line 280 
-CHECK: XStringToKeysym-7 17, line 290 
-CHECK: XStringToKeysym-7 18, line 300 
-CHECK: XStringToKeysym-7 19, line 310 
-CHECK: XStringToKeysym-7 20, line 320
-
-Upstream-Status: Pending
-
-Signed-off-by: dbuitenh@windriver.com
-
---- libX11-1.3.4.orig/src/util/makekeys.c	2010-01-15 09:11:36.000000000 +0800
-+++ libX11-1.3.4/src/util/makekeys.c	2011-05-24 19:04:25.454774908 +0800
-@@ -33,6 +33,7 @@
- #include <X11/keysymdef.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <stdint.h>
- 
- typedef unsigned long Signature;
- 
-@@ -124,7 +125,12 @@
- 	    name = info[i].name;
- 	    sig = 0;
- 	    while ((c = *name++))
--		sig = (sig << 1) + c;
-+#ifdef USE32
-+		sig = (uint32_t)(sig << 1) + c;
-+#else
-+		sig = (uint64_t)(sig << 1) + c;
-+#endif
-+		
- 	    first = j = sig % z;
- 	    for (k = 0; tab[j]; k++) {
- 		j += first + 1;
-@@ -163,7 +169,11 @@
- 	name = info[i].name;
- 	sig = 0;
- 	while ((c = *name++))
--	    sig = (sig << 1) + c;
-+#ifdef USE32
-+	    sig = (uint32_t)(sig << 1) + c;
-+#else
-+	    sig = (uint64_t)(sig << 1) + c;
-+#endif
- 	first = j = sig % z;
- 	while (offsets[j]) {
- 	    j += first + 1;
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
index c138785..5a66eb5 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
@@ -1,13 +1,12 @@
 require libx11.inc
 inherit gettext
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += " file://keysymdef_include.patch \
              file://x11_disable_makekeys.patch \
-             file://makekeys_crosscompile.patch \
              "
 
 SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
-- 
1.7.10



