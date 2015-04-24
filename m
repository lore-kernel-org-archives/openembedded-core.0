Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABA973D8D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 03:35:50 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so14159686pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Q/Q4GBbqnH2sVxOk9jSODgY+FOAJxIJZRlcDmOAScyc=;
	b=UBcu7gZuX+L/QUg0rNu4KZIGwN7DWShMHi2USsFPPnj4kAk9IH8le5b8vXflQvlFWf
	Yk81xqKc+C7QA/XvvujbCclQ1Ym0PTqEdCkCxFjvo3Z/NQpMlrsgcmjZ34VC0zoWlTRQ
	0Lq8s4Kab5coporCTaX74gXrajji96156OiXvWwPJlQP2Z+caXZWNVudW/hV17TQezXL
	V9za7tmb7h6vmiNnaZfI1w8Su3RnCnIFmPz797PxEeegEA1vvadZgef+y1ch2kD9j4XM
	v31Oo9L+ahMlJy6cJZpOtQOMTJJC0/fEfAkMkhnVUmQFZw/BThKjy0USAnbmi0D4Rd2n
	dnig==
X-Received: by 10.70.35.171 with SMTP id i11mr2203271pdj.103.1429846552239;
	Thu, 23 Apr 2015 20:35:52 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id qv9sm9575507pab.27.2015.04.23.20.35.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 20:35:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 20:35:32 -0700
Message-Id: <eadf6bf1d902389e1c8fc47712fc03aab6956f5e.1429846256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
References: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
Subject: [PATCH 14/14] fontconfig: Fix pkgconfig file generation to not have absolute paths
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
X-List-Received-Date: Fri, 24 Apr 2015 03:35:51 -0000

Fixes cross building dependent packages with gcc-5
e.g. matchbox-panel-2

Change-Id: I6290cfa4aac5d03a7200472d0c713b7ea84b99ac
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fontconfig/revert-static-pkgconfig.patch         | 20 ++++++++++++++++++++
 .../fontconfig/fontconfig_2.11.93.bb                 |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
new file mode 100644
index 0000000..a2f3409
--- /dev/null
+++ b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
@@ -0,0 +1,20 @@
+Revert part of http://cgit.freedesktop.org/fontconfig/commit/fontconfig.pc.in?id=338ffe6b886ad4ba86ff471cb59c4a5e5ffbe408
+We really dont do static linking so its not going to cause issues for us but as such this is harming us by adding absolute
+paths into -I options into fontconfig.pc which is them prepended with sysroot when read back by cross pkg-config and
+we end up with -I <sysroot>/<sysroot>/usr/include/fontconfig in CFLAGS of clients which depend on it. one such example
+is matchbox-panel-2 and it was working fine with gcc < 5 because it tolerated non-existing paths in -I flags but gcc-5
+gently refuses and rightly so.
+
+Upstream-Status: Not-Submitted [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: fontconfig-2.11.93/fontconfig.pc.in
+===================================================================
+--- fontconfig-2.11.93.orig/fontconfig.pc.in
++++ fontconfig-2.11.93/fontconfig.pc.in
+@@ -15,4 +15,4 @@ Requires: @PKGCONFIG_REQUIRES@
+ Requires.private: @PKGCONFIG_REQUIRES_PRIVATELY@
+ Libs: -L${libdir} -lfontconfig
+ Libs.private: @EXPAT_LIBS@ @FREETYPE_LIBS@ @ICONV_LIBS@ @LIBXML2_LIBS@
+-Cflags: -I${includedir} @EXPAT_CFLAGS@ @FREETYPE_CFLAGS@ @ICONV_CFLAGS@ @LIBXML2_CFLAGS@
++Cflags: -I${includedir}
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
index 44cfe2b..e024adb 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
@@ -21,6 +21,7 @@ SECTION = "libs"
 DEPENDS = "expat freetype zlib"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
+           file://revert-static-pkgconfig.patch \
            "
 SRC_URI[md5sum] = "622f94f0f74e40775ea72d7d5f17a36d"
 SRC_URI[sha256sum] = "296b5e83189589e537992d65ff01e0cd74eba9a91eb16a6890ce942e3695c526"
-- 
2.1.4


