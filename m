Return-Path: <anders.roxell@linaro.org>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 28C647844B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 17:35:11 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id q194so7501336lfe.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Feb 2018 09:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=pIFyF1id9Zs30nkB9wSkfK62p+nmpX8mOjbFN1IkHJo=;
	b=ewT5mc2F2k9hsP7OCXKoZu7NNusNl8uhRAMcTPpG3eE2zXB1qD7H7PLkfKA5Zu9xDh
	8bZh4q+X2ezFJUma2yIeLCwPblvPfhZDzUoGWspds+iXmUoUcGGggcoYm3naAPov7pHO
	Vm74UyzyQdahAOGDBKpeZlOQvIx/FqadVu6kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pIFyF1id9Zs30nkB9wSkfK62p+nmpX8mOjbFN1IkHJo=;
	b=CRyoJ8895jOX/afeS7t41dEE2HxAXmnO5e2w8om+A2eHAlib2nGSVBQlgg7vkociUJ
	r2ufZce6qtuCjJg9fEDhb5e96b/KrOfYh2e4FaNapXW8jEyMMqIC71IdZl1c8mvFKcz+
	iWtau1LxHkDmdhmkfhX84H6zq9sS92cni9l4is7TdyDVNnpjbdsyRK8gyoszt+xTDA0Y
	TOB3XLakZEDB+Q4eyA+zPX85uSb+z/DypiNAL/M4sWiRDE5nxJjw2tu8C2HYqeNJkxAV
	AiW2DUxw7lK1eFMTp+MZBIKEEdW2SN+92Rb/yzzGtB2NEuoSrYqnyWaguSfNijWmK0ez
	m5uA==
X-Gm-Message-State: APf1xPCT+XqvKGLT/JH42WfjYKUmwtwAvCrgScP4nbqanQZElpNKNF8D
	2fTnl/vg08QZAXtFuxU1pxM7J8xZICY=
X-Google-Smtp-Source: AH8x224EAWw9VtzIlujq52r8LKFCt6UxuL5fIZ/BhvPIy26Yt6zHL/5sPzw2BijZnPThtthYUv5t8g==
X-Received: by 10.25.27.71 with SMTP id b68mr1029785lfb.64.1518111309589;
	Thu, 08 Feb 2018 09:35:09 -0800 (PST)
Received: from localhost (c-073070d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.112.48.7])
	by smtp.gmail.com with ESMTPSA id r13sm95377lfr.19.2018.02.08.09.35.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 09:35:08 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Feb 2018 18:34:59 +0100
Message-Id: <1518111299-21765-1-git-send-email-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ltp: fix knob to control numa support
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
X-List-Received-Date: Thu, 08 Feb 2018 17:35:12 -0000

Reported-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 ...ix-default-value-of-without-numa-switch-i.patch | 31 ++++++++++++++
 ...onfigure-add-knob-to-control-numa-support.patch | 50 ++++++++++++++++++++++
 ...-control-whether-numa-support-should-be-c.patch | 45 -------------------
 meta/recipes-extended/ltp/ltp_20180118.bb          |  3 +-
 4 files changed, 83 insertions(+), 46 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-value-of-without-numa-switch-i.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-numa-support.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-value-of-without-numa-switch-i.patch b/meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-value-of-without-numa-switch-i.patch
new file mode 100644
index 0000000..da62687
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-configure-Fix-default-value-of-without-numa-switch-i.patch
@@ -0,0 +1,31 @@
+From 4ace68a6ba501907a0741dba5f5f155e06a74c35 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Wed, 7 Feb 2018 11:09:49 +0100
+Subject: [PATCH] configure: Fix default value of --without-numa switch in help
+
+The default value is no.
+
+Fixes: 39a85a1f1 ("configure: add knob to control numa support")
+
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Upstream-Status: Accepted
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b39a31d..d66ea00 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -86,7 +86,7 @@ fi
+ # Numa
+ AC_ARG_WITH([numa],
+   AC_HELP_STRING([--without-numa],
+-    [without numa support (default=yes)]),
++    [without numa support (default=no)]),
+   [with_numa=no],
+   [with_numa=yes]
+ )
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-numa-support.patch b/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-numa-support.patch
new file mode 100644
index 0000000..8aaa287
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-configure-add-knob-to-control-numa-support.patch
@@ -0,0 +1,50 @@
+From 39a85a1f1e6624f554215ba4b6843d3689a8415e Mon Sep 17 00:00:00 2001
+From: Anders Roxell <anders.roxell@linaro.org>
+Date: Mon, 5 Feb 2018 11:56:04 +0100
+Subject: [PATCH] configure: add knob to control numa support
+
+Allow to disable numa from the top level.
+
+Based on patch:
+http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-extended/ltp?id=4c7873552e13dfdba96afca7562c398d2966ca71
+
+Reported-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Upstream-Status: Accepted
+---
+ configure.ac | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 5c8d4ea..b39a31d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -83,6 +83,14 @@ else
+     AC_SUBST([WITH_EXPECT],["no"])
+ fi
+ 
++# Numa
++AC_ARG_WITH([numa],
++  AC_HELP_STRING([--without-numa],
++    [without numa support (default=yes)]),
++  [with_numa=no],
++  [with_numa=yes]
++)
++
+ # Perl
+ AC_ARG_WITH([perl],
+   [AC_HELP_STRING([--with-perl],
+@@ -157,7 +165,9 @@ LTP_CHECK_SELINUX
+ LTP_CHECK_SIGNAL
+ LTP_CHECK_SYSCALL_EVENTFD
+ LTP_CHECK_SYSCALL_MODIFY_LDT
++if test "x$with_numa" = xyes; then
+ LTP_CHECK_SYSCALL_NUMA
++fi
+ LTP_CHECK_SYSCALL_QUOTACTL
+ LTP_CHECK_SYSCALL_SIGNALFD
+ LTP_CHECK_SYSCALL_UNSHARE
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch b/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
deleted file mode 100644
index 31460b9..0000000
--- a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 867ad5d5d64b9b27ee32148027532db0a00f6433 Mon Sep 17 00:00:00 2001
-From: "Roy.Li" <rongqing.li@windriver.com>
-Date: Thu, 7 Jan 2016 17:33:26 +0000
-Subject: [PATCH 02/32] Add knob to control whether numa support should be
- checked
-
-otherwise undeterministic dependency will be generated
-during build depending upong numa being staged or not
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
-Upstream-Status: Pending
----
- m4/ltp-numa.m4 | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/m4/ltp-numa.m4 b/m4/ltp-numa.m4
-index fc3383e..44cb559 100644
---- a/m4/ltp-numa.m4
-+++ b/m4/ltp-numa.m4
-@@ -24,7 +24,13 @@ dnl LTP_CHECK_SYSCALL_NUMA
- dnl ----------------------------
- dnl
- AC_DEFUN([LTP_CHECK_SYSCALL_NUMA], [
--	AC_CHECK_LIB(numa, numa_available, [have_libnuma=yes])
-+	AC_MSG_CHECKING([for numa])
-+	AC_ARG_WITH(
-+		[numa],
-+		AC_HELP_STRING([--without-numa],
-+		[without numa support]),
-+		[],
-+	[AC_CHECK_LIB(numa, numa_available, [have_libnuma=yes])
- 	AC_CHECK_HEADERS([numa.h numaif.h], [], [have_numa_headers=no])
- 
- 	if test "x$have_numa_headers" != "xno"; then
-@@ -42,3 +48,5 @@ exit(1);
- 		AC_DEFINE(HAVE_NUMA_V2, 1, [Define to 1 if you have libnuma and it's headers version >= 2 installed.])
- 	fi
- ])
-+AC_MSG_RESULT([$with_numa])
-+])
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb b/meta/recipes-extended/ltp/ltp_20180118.bb
index 369b98d..a0dd9aa 100644
--- a/meta/recipes-extended/ltp/ltp_20180118.bb
+++ b/meta/recipes-extended/ltp/ltp_20180118.bb
@@ -24,7 +24,8 @@ CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 SRCREV = "731cd34e682d297b207668be8b1d15320a9ac1b1"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
-           file://0002-Add-knob-to-control-whether-numa-support-should-be-c.patch \
+           file://0001-configure-add-knob-to-control-numa-support.patch \
+           file://0001-configure-Fix-default-value-of-without-numa-switch-i.patch \
            file://0003-Add-knob-to-control-tirpc-support.patch \
            file://0004-build-Add-option-to-select-libc-implementation.patch \
            file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
-- 
2.7.4


