Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id A224E73E11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 15:58:37 +0000 (UTC)
Received: by iodv127 with SMTP id v127so110061891iod.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gjfQ44AaoMQ/X4IWHpnYRGmpPFBFRVYAkzN17rloW90=;
	b=Qw6WUq4afmNNs1bjxh8rPV68CZeCiIIRysfIysv1L7zRk11GXLz3DmVeKPrXoiW2/B
	t5HiMSafNQso7wTa/SSKU/gmzIAoUaRHdMoSrsoyHeN7oq0vzRo6SkjfuESPbmGshgoY
	YtEDYLYrhd2XdLdSk/WtCo3JLwDtXL7hTpcAkkAY713oKlDKGVpl8OYG48e/xDwYOw+b
	GF0l2vXnNWXC4V6Ov4mGJF+lxEVeY8tFK8Yk4yGhOu5cESlL7KbXyVwux04zz88Q4apP
	zLB1Y5YYU4sdU2Ai20akYh7OPUy1ZLeEXiZp95fm2byLLOpJVnkxABNSG29FMqGZdYLl
	/InQ==
X-Received: by 10.107.10.144 with SMTP id 16mr11691653iok.72.1440259117761;
	Sat, 22 Aug 2015 08:58:37 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id r8sm8726088ioi.10.2015.08.22.08.58.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Aug 2015 08:58:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Aug 2015 08:58:10 -0700
Message-Id: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/6] sysvinit: Fix makefile bug found with clang
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

This is due to specifying .h files on linker cmdline
clang driver is picky about it, and its not entirely correct
either

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...an-issue-that-clang-reports-about-mutlipl.patch | 52 ++++++++++++++++++++++
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch

diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch b/meta/recipes-core/sysvinit/sysvinit/0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch
new file mode 100644
index 0000000..f35c15c
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit/0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch
@@ -0,0 +1,52 @@
+From 36ac97bfe51797458442a6035219a504a42e703a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Aug 2015 10:56:40 -0700
+Subject: [PATCH] This fixes an issue that clang reports about mutliple output
+ files
+
+Issue is that we are passing .h file to link step as seen below.
+
+| arm-oe-linux-gnueabi-clang  -march=armv7-a -mthumb  -mfloat-abi=hard
+-mfpu=neon-vfpv4 -mtune=cortex-a7 -D__extern_always_inline=inline
+-no-integrated-as
+--sysroot=/mnt/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-glibc/sysroots/raspberrypi2
+-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  halt.o ifdown.o hddown.o
+utmp.o reboot.h   -o halt
+| clang-3.7: error: cannot specify -o when generating multiple output
+files
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index e77ed5f..a6f9f40 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -103,9 +103,9 @@ all:		$(BIN) $(SBIN) $(USRBIN)
+ init:		LDLIBS += $(INITLIBS) $(STATIC)
+ init:		init.o init_utmp.o
+ 
+-halt:		halt.o ifdown.o hddown.o utmp.o reboot.h
++halt:		halt.o ifdown.o hddown.o utmp.o
+ 
+-last:		last.o oldutmp.h
++last:		last.o
+ 
+ mesg:		mesg.o
+ 
+@@ -120,7 +120,7 @@ sulogin:	sulogin.o
+ 
+ wall:		dowall.o wall.o
+ 
+-shutdown:	dowall.o shutdown.o utmp.o reboot.h
++shutdown:	dowall.o shutdown.o utmp.o
+ 
+ bootlogd:	LDLIBS += -lutil
+ bootlogd:	bootlogd.o
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 6709a9b..5dfe39e 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.bz2 \
            file://install.patch \
            file://crypt-lib.patch \
            file://pidof-add-m-option.patch \
+           file://0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch \
            file://rcS-default \
            file://rc \
            file://rcS \
-- 
2.1.4


