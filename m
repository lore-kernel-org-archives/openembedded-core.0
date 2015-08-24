Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id C962976C00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:43 +0000 (UTC)
Received: by igui7 with SMTP id i7so64562886igu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=AGoJq8WQGPu89iLcs8BMcLE0XG2vXl/i+FeTfOa4QfU=;
	b=YQTsr/Yqhh3vhQLMuVr2g4e8ROhm9yqXHPG9YUtj6u3adIzSRdXUNelOIfYiASjLvs
	7WBrf5bmPfveV9iDXEgUl4T2QEtKRODbp72JwRbD5jF0EQb9bJ56p6VGrxIDbWfjTsA8
	eja+Ai72HmpGdrBF0BVFu7MVGsJOzIypdcWrITOPkStyIJWLof3bWfySxwaD3HBzWRPY
	p85VSRKCqcbCiBKfg8xsK7WlnsDpgsnnHTAI6W+RPHViRlQlHKNUBvEUpKfQxFI7+krd
	5/sUMrLovHlWr4KiF/FmBoC/v/uCME8exxBdu/wKjN6fIj9NxxfoMZoZoBBeZvpz6qI9
	ewkQ==
X-Received: by 10.50.32.34 with SMTP id f2mr5868978igi.44.1440446623753;
	Mon, 24 Aug 2015 13:03:43 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	hh9sm9538417igb.18.2015.08.24.13.03.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:24 -0700
Message-Id: <9502ff1ae15b66e43a58cf34b7fd0e1ecc71e18d.1440446289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1440446289.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
Subject: [PATCH 06/17] alsa-lib: Lift the limitation to use gcc only cross compiler
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:45 -0000

alsa-lib configure tries to see that if CC variabled doesnt contain
'gcc' then it tries to guess and redefine CC to be something gcc, which
doesnt work with OE since we define CC to have sysroot and options
attached to it. So all tests fail when configure constructs the CC for
cross compiler like this. This portion is not needed at all

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...build-Do-not-try-to-detect-cross-compiler.patch | 45 ++++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-build-Do-not-try-to-detect-cross-compiler.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-build-Do-not-try-to-detect-cross-compiler.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-build-Do-not-try-to-detect-cross-compiler.patch
new file mode 100644
index 0000000..583bc3d
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-build-Do-not-try-to-detect-cross-compiler.patch
@@ -0,0 +1,45 @@
+From 17aeb3565f411e7796cabe403f92d15948a8ca95 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Aug 2015 14:42:45 -0700
+Subject: [PATCH] build: Do not try to detect cross-compiler
+
+cross compilers are passed via path may not be a gcc based cross
+compiler in such cases this check fails and try's to force gcc based
+cross compiler detection, This code is a convenience that limits the
+build system
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac | 14 --------------
+ 1 file changed, 14 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3022cf8..9d77440 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,20 +27,6 @@ AC_PREFIX_DEFAULT(/usr)
+ 
+ dnl Checks for programs.
+ 
+-dnl try to gues cross-compiler if not set
+-if test "x$host" != "x$build" -a -z "`echo $CC | grep -e '-gcc'`";
+-then
+-  AC_MSG_CHECKING(for cross-compiler)
+-
+-  which ${program_prefix}gcc >/dev/null 2>&1 && CC=${program_prefix}gcc
+-  which ${host_cpu}-${host_os}-gcc >/dev/null 2>&1 \
+-  && CC=${host_cpu}-${host_os}-gcc
+-  which ${host_cpu}-${host_vendor}-${host_os}-gcc >/dev/null 2>&1 \
+-  && CC=${host_cpu}-${host_vendor}-${host_os}-gcc
+-
+-  AC_MSG_RESULT($CC)
+-fi
+-	    
+ CFLAGS="$CFLAGS -D_GNU_SOURCE"
+ 
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb
index fc6ba69..730f427 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb
@@ -16,6 +16,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
+           file://0001-build-Do-not-try-to-detect-cross-compiler.patch \
 "
 SRC_URI[md5sum] = "de67e0eca72474d6b1121037dafe1024"
 SRC_URI[sha256sum] = "73043c35eb9636be0f4af6a240235c213f12a25feb1f04aeeac8cb7e30fcbdd0"
-- 
2.1.4


