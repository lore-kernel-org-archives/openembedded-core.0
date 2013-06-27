Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6D587619DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 15:38:50 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id uo1so1075669pbc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=P+vs96ef4YT42naZqj555dLrv2dL1sO7ROzW3Qqfs60=;
	b=IAu50YAXJcKDJ5f33SBGmeilkWaQxT9USZMIAadAPngqWj3bDKkxbv9ciw2LIhi7zL
	zQRXZbuWIusfPBv7J6ymd79wvgwjcoiRyj3QridAv+IJaO+x73nmbkR0iTCBz9BZRewM
	WlMdEEoaV2Sg4T9MxdLdDcXOy5tdsHjQwGH6oxNDYjLSMXOeWlIskf7ogx0HpI2whnT6
	foUaorcOZCmQMO2wMXboN0BG4Ca5A1VD61LDTuqfqdwEZMK2poCyZTN5Z6gofbH4/UJq
	JypkGPGmTjttlV502HM2UzyUcvQAUMs/emsIKwvxQk3qJEqvzMM2Kg0R8rl8tLLvclK6
	KBkQ==
X-Received: by 10.68.114.36 with SMTP id jd4mr6720035pbb.12.1372347531708;
	Thu, 27 Jun 2013 08:38:51 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id br1sm3686049pbb.4.2013.06.27.08.38.50
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Jun 2013 08:38:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2013 08:38:37 -0700
Message-Id: <1372347517-26868-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gcc-4.8: Fix ICE on ppc/spe targets
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
X-List-Received-Date: Thu, 27 Jun 2013 15:38:50 -0000

Rename patches to make them easly to apply with git

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |    5 +++--
 ....8-PR56797.patch => 0037-gcc-4.8-PR56797.patch} |    0
 ...ld-args.patch => 0038-gcc-4.8-build-args.patch} |    0
 .../gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch         |   23 ++++++++++++++++++++
 4 files changed, 26 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/gcc/gcc-4.8/{gcc-4.8-PR56797.patch => 0037-gcc-4.8-PR56797.patch} (100%)
 rename meta/recipes-devtools/gcc/gcc-4.8/{gcc-4.8-build-args.patch => 0038-gcc-4.8-build-args.patch} (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index bfdb766..3219e0c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -66,8 +66,9 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
 	   file://0035-wcast-qual-PR-55383.patch \
 	   file://0036-PR-target-56102.patch \
-	   file://gcc-4.8-PR56797.patch \
-	   file://gcc-4.8-build-args.patch \
+	   file://0037-gcc-4.8-PR56797.patch \
+	   file://0038-gcc-4.8-build-args.patch \
+	   file://0039-gcc-4.8-PR57717.patch \
 	  "
 SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
 SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.8-PR56797.patch b/meta/recipes-devtools/gcc/gcc-4.8/0037-gcc-4.8-PR56797.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-4.8/gcc-4.8-PR56797.patch
rename to meta/recipes-devtools/gcc/gcc-4.8/0037-gcc-4.8-PR56797.patch
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.8-build-args.patch b/meta/recipes-devtools/gcc/gcc-4.8/0038-gcc-4.8-build-args.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-4.8/gcc-4.8-build-args.patch
rename to meta/recipes-devtools/gcc/gcc-4.8/0038-gcc-4.8-build-args.patch
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch b/meta/recipes-devtools/gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch
new file mode 100644
index 0000000..f983f70
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch
@@ -0,0 +1,23 @@
+This backports fix from http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57717
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4.8.1/gcc/config/rs6000/rs6000.c
+===================================================================
+--- gcc-4.8.1.orig/gcc/config/rs6000/rs6000.c	2013-05-09 18:54:06.000000000 -0700
++++ gcc-4.8.1/gcc/config/rs6000/rs6000.c	2013-06-27 08:22:40.459021366 -0700
+@@ -5431,11 +5431,12 @@
+ 
+     case TFmode:
+     case TDmode:
+-    case TImode:
+       if (TARGET_E500_DOUBLE)
+ 	return (SPE_CONST_OFFSET_OK (offset)
+ 		&& SPE_CONST_OFFSET_OK (offset + 8));
++        /* Fall through.  */
+ 
++    case TImode:
+       extra = 8;
+       if (!worst_case)
+ 	break;
-- 
1.7.9.5


