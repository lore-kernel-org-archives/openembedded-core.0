Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 84A1160657
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 15:58:37 +0000 (UTC)
Received: by iodb91 with SMTP id b91so109849547iod.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AGoJq8WQGPu89iLcs8BMcLE0XG2vXl/i+FeTfOa4QfU=;
	b=TEQYcnA0X0YYzkd9xV8Jm4J9tk7uJGsMwUodJ8dQxUSbEghBLyKfNODx83iXwuhGKU
	pq15nFbaWDwko5HDvvTJKk4q2WCmN27Ov2e3YcKUIIiBlPr2Zbz6l/YyNr/9LDNaHAy/
	tbtgowwsbWd9Vogj7udlB+JjqkjlLMW7eToxoyA74q6Yk1/sVkAln/gcFbYSdsu00zoh
	lxfBUY3G74aiBEjW38K+KCk1eyPvMZfdULjC38U96sIiQ9lAV/Ff3AT2F+8cCvqW9A8f
	MwqXWysCLouNHCXTgk/PnfRW0ZVJ6C+2UNkms4V4PL3h9IENuF71t/lbS+3mMrypCquL
	L9+g==
X-Received: by 10.107.132.146 with SMTP id o18mr12077567ioi.134.1440259118330; 
	Sat, 22 Aug 2015 08:58:38 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id r8sm8726088ioi.10.2015.08.22.08.58.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Aug 2015 08:58:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Aug 2015 08:58:11 -0700
Message-Id: <1440259095-24566-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
References: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/6] alsa-lib: Lift the limitation to use gcc only cross compiler
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
X-List-Received-Date: Sat, 22 Aug 2015 15:58:39 -0000

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


