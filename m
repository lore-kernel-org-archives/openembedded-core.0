Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3FC79BAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 14:55:50 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id n26-v6so11898939lfl.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ooHABTqOwHOPp6O2AA+Zw0gozGfAep+HsNfPoD1/hug=;
	b=W04WwbiWWhMSaLt/baBAzG2cctYpwloK+rHyEe2dKrwVkc13CtrHBH/86y4dCQ3GF/
	besymhFSnFhMZqTGLRmrutQ7gqSvz/+sMoKb16nypSUIsQdikYQbGIiJM1JsNvIpUpww
	pGWJjU3lG1I6mFh/LxnJxGrAyMvEXLXGN7XWFjbbw67jpUayvIKWBEbjXMH3UFC9WTOy
	pRwJTNUR9QcYovsbNzP7ZTVhDvBXW/s4ZZqfp0XMnX3Hn1q59Gbx+wxtmXXyuHn7s18N
	wl9JOuUKI6NmzaHfqBz6bL5zfw7aVG1j3dwsQSJrna09SmRWhFfbcR1JvSmKTCs+f3Mo
	qjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ooHABTqOwHOPp6O2AA+Zw0gozGfAep+HsNfPoD1/hug=;
	b=Yi7UnG+bt7beYeEctVHbHO6TUBRuBO1GDp8TuVdHEBMeyT/hh8ejpsbaDUQVWWmkeN
	N0cS/0p4somlxI4WUuyeWFSSonEU1otk3ntxhIL2VTRmDptxopUCEXC0SQmIzWh36YMI
	86GwUeGRlJEgajxEXxMEsz5JfC7N+LCL096IEhUDnBSNaFtxaS2DRgmhdDy/y3haN77a
	pZAoymN2TwZ4tNDGyEQeEnZXfoHc7u5LELsE0DLTLPDJMS9KuyaDqrVLvUO7lUTe/Cs3
	1KnvDbpuPc/JiAlTXh9TUMMGLa1dujIOH7n6zmseYekovZLnBB+wVdq1Rfk0IBXD3V85
	rGXA==
X-Gm-Message-State: AGRZ1gISkOhczkzu6pUjD9ymjTq9h93WU9J3hEErCeO5OpXSGdOfOP5J
	HX1oHdZTQ4vAnPymScjiLTyd/j5m
X-Google-Smtp-Source: AJdET5d+C0SESzvZgSz2aoKWmNATkpNZJr2b/ucRM/r4W7vcvJ3u1MZed0k50NC4G2sTbjlEPZNFow==
X-Received: by 2002:a19:9dd1:: with SMTP id g200mr1986403lfe.127.1540997750771;
	Wed, 31 Oct 2018 07:55:50 -0700 (PDT)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	h143-v6sm4534316lfe.9.2018.10.31.07.55.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 31 Oct 2018 07:55:49 -0700 (PDT)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Oct 2018 16:55:47 +0200
Message-Id: <1540997747-6079-1-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] v86d: Make cross compilation working on more architectures
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
X-List-Received-Date: Wed, 31 Oct 2018 14:55:51 -0000

Since commit 709c603dec19 ("v86d: Accept aarch64 as build host") we
support cross compilation on aarch64 host in addition to x86 host.
However building on hosts different than two above will fail.

Make cross compilation support more generic by checking for TARGET_ARCH
in v86d configure script with fallback to `uname -m` when not present in
environment and pass TARGET_ARCH explicitly in do_configure().

Cross build for x86 tested on IBM Power 8 machine with RHEL7. Should
work on aarch64 and rest too.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 .../v86d/v86d/Support-for-cross-compilation.patch  | 34 ++++++++++++++++++++++
 meta/recipes-bsp/v86d/v86d/aarch64-host.patch      | 18 ------------
 meta/recipes-bsp/v86d/v86d_0.1.10.bb               |  4 +--
 3 files changed, 36 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-bsp/v86d/v86d/Support-for-cross-compilation.patch
 delete mode 100644 meta/recipes-bsp/v86d/v86d/aarch64-host.patch

diff --git a/meta/recipes-bsp/v86d/v86d/Support-for-cross-compilation.patch b/meta/recipes-bsp/v86d/v86d/Support-for-cross-compilation.patch
new file mode 100644
index 0000000..15f70a5
--- /dev/null
+++ b/meta/recipes-bsp/v86d/v86d/Support-for-cross-compilation.patch
@@ -0,0 +1,34 @@
+From 8eda59654fd31416164c78f6068715b01767ed4e Mon Sep 17 00:00:00 2001
+From: Serhey Popovych <serhe.popovych@gmail.com>
+Date: Wed, 31 Oct 2018 07:31:47 -0400
+Subject: v86d: Support for cross compilation
+
+It is common to build on one system for another (e.g. on IBM Power
+machine for Intel x86) where HOST_ARCH (uname -m) != TARGET_ARCH.
+
+Take TARGET_ARCH from environment if it is given, otherwise fall back
+to `uname -m`.
+
+Upstream-Status: Pending
+Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
+---
+ configure | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index cbbd6b3..046aa99 100755
+--- a/configure
++++ b/configure
+@@ -23,7 +23,8 @@ copt_x86emu_type="bool"
+ copt_x86emu_def=auto
+ copt_x86emu_test()
+ {
+-	local m=`uname -m`
++	local m="${TARGET_ARCH:-$(uname -m)}"
++
+ 	if [ "$m" = "i686" -o "$m" = "i586" -o "$m" = "i486" -o "$m" = "i386" ]; then
+ 		echo "n";
+ 	elif [ "$m" = "x86_64" ]; then
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-bsp/v86d/v86d/aarch64-host.patch b/meta/recipes-bsp/v86d/v86d/aarch64-host.patch
deleted file mode 100644
index 701fed7..0000000
--- a/meta/recipes-bsp/v86d/v86d/aarch64-host.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Accept aarch64 as valid build host
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: v86d-0.1.10/configure
-===================================================================
---- v86d-0.1.10.orig/configure
-+++ v86d-0.1.10/configure
-@@ -26,7 +26,7 @@ copt_x86emu_test()
- 	local m=`uname -m`
- 	if [ "$m" = "i686" -o "$m" = "i586" -o "$m" = "i486" -o "$m" = "i386" ]; then
- 		echo "n";
--	elif [ "$m" = "x86_64" ]; then
-+	elif [ "$m" = "x86_64" -o "$m" = "aarch64" ]; then
- 		echo "y";
- 	else
- 		echo "It looks like your architecture '$m' isn't supported by this version of v86d." >&2
diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index f97b80d..84e27d2 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -12,7 +12,7 @@ PR = "r2"
 SRC_URI = "http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/v/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://Update-x86emu-from-X.org.patch \
            file://ar-from-env.patch \
-           file://aarch64-host.patch \
+           file://Support-for-cross-compilation.patch \
 "
 
 SRC_URI[md5sum] = "889686ec8424468fe0d205742e77a4c2"
@@ -22,7 +22,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 do_configure () {
-	./configure --with-x86emu
+	TARGET_ARCH="${TARGET_ARCH}" ./configure --with-x86emu
 }
 
 do_compile () {
-- 
2.7.4


