Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2B20976BE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:42 +0000 (UTC)
Received: by igfj19 with SMTP id j19so64829202igf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=gjfQ44AaoMQ/X4IWHpnYRGmpPFBFRVYAkzN17rloW90=;
	b=k45hpMklByjYtHy5/T7FbB3EfYP0ZL869rrpb+Ocvi8zCGbLdUsLG5ao9xdXBNogKl
	nu4lWAg1qQVPMeCR3pEUPBN5lYb+Cv+fhTY3SXhJKylat5Cs6sdA04/xc7BEL/Ec3X0C
	fYhgTriYF+CxfoVKvfoqGmIVvZTVUl3JQXzjp+c13CuR9OWY1fB1e7eTDyv80zWCtThz
	cekdPq4XrDWiQcnF8kVaz53bOjBjKy5NEAWXUkn/UK+rJdvib/vq/cB8Jp46evlIpymG
	lxx13flDgrNYrVX4gKGSBz6LUFUUCdgNWYeVIqGh1zTRiBzzGOpBOVScD3iRDRLxK3P8
	Loyw==
X-Received: by 10.50.143.2 with SMTP id sa2mr15541617igb.72.1440446623181;
	Mon, 24 Aug 2015 13:03:43 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	hh9sm9538417igb.18.2015.08.24.13.03.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:23 -0700
Message-Id: <007dd46299588552850d49e277fe21d2393bd872.1440446289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1440446289.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
Subject: [PATCH 05/17] sysvinit: Fix makefile bug found with clang
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:43 -0000

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


