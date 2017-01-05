Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id F0D4071C00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:48 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 3so51662634oih.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tUpmokNVrsqV+WaFKFI83titX4XEV4TnxFslGRw9l/M=;
	b=lcw6tB2B1GYBEAbbY3uMRX/AYHeZRA64Iqxm5qRhGKkQhFdDPF5uzYpxCUvHpcypCc
	GlQz3qtxc2Nc+1Jxewl81rJNy5QjqdYZ4SlZ0ahXzeGHUcWPfJKbGG+LzKVIkj4FIV54
	OdKBM+kT3yw06LIPILSaAQlVkrAT0kf1Yr/XGWQ6BoEod9PvdicKgvMJfWVMleTiKFst
	uqXGo5O6wAZIIssmwe2E0n412rFbuVo8yp0a/+x+qi+tQAJNVcEAZ6rL8ub+bpLi4DC0
	o/c56RNVxNg6WJ6gF/utsxyilEIbRsMtxJ7QTthamHmOAgKWvf5WAX77iRvGuGJdkgNH
	yVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tUpmokNVrsqV+WaFKFI83titX4XEV4TnxFslGRw9l/M=;
	b=OOhWs24z1b40cF5UvWPv05r1ujXJ5kqk5zNLSyu2aR0sSEmKLw0ZfwRnfAb2bmKYOX
	LddTCEuoVZNISqCqEHtuzvenaX/P8DuTzC5GEfFp7DC+2mH0eXEBrCev1KcsBUGdk6rA
	3ILJ0/qhLemkII9v0bIlJEbIDtX4tGGtcKJ+wuMCLgmi7v+8Uh1kB3Ce0gg+xEZpuHUo
	1Zmj457DMA3Ux+jboiRTmCM1o/d17KPczlyonerEhiGMFeM1SVfHqBnF6u0QhWrWMPNv
	S1h5gjZT5CcBTMT1Od9DSd2mEJ4FBl+rsve9TuuLkfU48TErp9HtCqoVj/urL2m1bOAk
	KluQ==
X-Gm-Message-State: AIkVDXLOOeHwqFrqvRqUG68INP3f8fc22FV/ZshwOsMM39WTc1j8+Qvs4z7U+Ud16+I4Zg==
X-Received: by 10.202.102.227 with SMTP id m96mr29447366oik.5.1483645609033;
	Thu, 05 Jan 2017 11:46:49 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:47 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:24 -0700
Message-Id: <836cf586634175ef4e02e6aecad69de2a0a251dc.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 12/16] x264: for x32, disable asm and pass -mx32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:49 -0000

From: Christopher Larson <chris_larson@mentor.com>

We should probably patch it to stop adding the -m argument to CFLAGS/LDFLAGS
in the first place, since we pass it in via CC, but this will do for now.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../x264/x264/Fix-X32-build-by-disabling-asm.patch | 53 ++++++++++++++++++++++
 meta/recipes-multimedia/x264/x264_git.bb           |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch

diff --git a/meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch b/meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch
new file mode 100644
index 0000000..087a448
--- /dev/null
+++ b/meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch
@@ -0,0 +1,53 @@
+From 66b120079fb21ed38cab0900c63360b0a7853eaa Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Tue, 13 Dec 2016 14:22:32 -0700
+Subject: [PATCH] Fix X32 build by disabling asm
+
+This applies gentoo's x32 patch, adjusted slightly, which disables asm support
+for x32 as well as correcting -m.
+
+Debian has a different patch which does the same, and there's a superior yet
+out of date patch series on the x264 list which keeps asm support enabled, but
+doesn't successfully build at this time, and my assembly is very rusty.
+
+Upstream-Status: Pending
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ configure | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 3109ec4..844aeae 100755
+--- a/configure
++++ b/configure
+@@ -703,7 +703,13 @@ case $host_cpu in
+         AS_EXT=".asm"
+         ASFLAGS="$ASFLAGS -DARCH_X86_64=1 -I\$(SRCPATH)/common/x86/"
+         stack_alignment=16
+-        [ $compiler = GNU ] && CFLAGS="-m64 $CFLAGS" && LDFLAGS="-m64 $LDFLAGS"
++        if [ $compiler = GNU ]; then
++            if cpp_check "" "" "__ILP32__" ; then
++                CFLAGS="-mx32 $CFLAGS" && LDFLAGS="-mx32 $LDFLAGS"
++            else
++                CFLAGS="-m64 $CFLAGS" && LDFLAGS="-m64 $LDFLAGS"
++            fi
++        fi
+         if [ "$SYS" = MACOSX ]; then
+             ASFLAGS="$ASFLAGS -f macho64 -DPIC -DPREFIX"
+             if cc_check '' "-arch x86_64"; then
+@@ -722,7 +728,11 @@ case $host_cpu in
+                 RCFLAGS="--target=pe-x86-64 $RCFLAGS"
+             fi
+         else
+-            ASFLAGS="$ASFLAGS -f elf64"
++            if cpp_check "" "" "__ILP32__" ; then
++                asm=no
++            else
++                ASFLAGS="$ASFLAGS -f elf64"
++            fi
+         fi
+         ;;
+     powerpc*)
+-- 
+2.8.0
+
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 1dafdd5..64193dc 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -10,6 +10,7 @@ DEPENDS = "yasm-native"
 
 SRC_URI = "git://github.com/mirror/x264;branch=stable \
            file://don-t-default-to-cortex-a9-with-neon.patch \
+           file://Fix-X32-build-by-disabling-asm.patch \
            "
 
 SRCREV = "86b71982e131eaa70125f8d0e725fcade9c4c677"
-- 
2.8.0


