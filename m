Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 28FB66E9D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 21:17:34 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so7663214pdi.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 14:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PghI2iUKf+QZ5Ij4MXJ+mYN6eM0K5f6aOdcmw5s4m84=;
	b=E2G5X76acfxIoUhNBOe5AJ0t9xPGvi5AIXxq5Xf/r6ee2BuAeS8cTIeAe4RXU1SORw
	WwQLmi7yA+9nmAZfAp6gBmgGnmUKnvQ48A+HR3SBmp+MPnf9ZMlSiJOJ0gxfjO+7J2RQ
	qzX3qTiQ0NixWGfElfD0+MpciqNKo19M4qyYcwuNUyVzHHFgQ7hfO0cnC8+znn5GXfJf
	OK2F7FsE3tiJEY/aGXo9YGPiAuUEoLiGJ9Hdij9HVLGpV7Xu77DCnnZQv5CQXfWePZIb
	z9d+6XLaXrNjPRc6n1s996QsdfD3K3REqDMmdxx7OJdutcfOvbfuUNXq+g/yUD132+Yp
	WMZw==
X-Received: by 10.68.170.36 with SMTP id aj4mr36648661pbc.54.1395177455486;
	Tue, 18 Mar 2014 14:17:35 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ei4sm55637580pbb.42.2014.03.18.14.17.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Mar 2014 14:17:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Mar 2014 14:18:56 -0700
Message-Id: <1395177536-1245-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH V2] pulseaudio: Make it compatible with systemd-209
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
X-List-Received-Date: Tue, 18 Mar 2014 21:17:39 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...c-Check-only-for-libsystemd-not-libsystem.patch | 30 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_5.0.bb                   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
new file mode 100644
index 0000000..467cd2c
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
@@ -0,0 +1,30 @@
+From 002b16f0f2176b4c685e210e335bf69c02563ede Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 22 Feb 2014 18:03:10 +0100
+Subject: [PATCH] configure.ac: Check only for libsystemd not libsystemd-login
+
+* they were merged into libsystemd in systemd-209
+
+Upstream-Status: Pending (it would need to be conditional on systemd version for upstream to accept this)
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 388fae2..fff7a83 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1160,7 +1160,7 @@ AC_ARG_ENABLE([systemd],
+     AS_HELP_STRING([--disable-systemd],[Disable optional systemd support]))
+ 
+ AS_IF([test "x$enable_systemd" != "xno"],
+-    [PKG_CHECK_MODULES(SYSTEMD, [ libsystemd-login ], HAVE_SYSTEMD=1, HAVE_SYSTEMD=0)],
++    [PKG_CHECK_MODULES(SYSTEMD, [ libsystemd ], HAVE_SYSTEMD=1, HAVE_SYSTEMD=0)],
+     HAVE_SYSTEMD=0)
+ 
+ AS_IF([test "x$enable_systemd" = "xyes" && test "x$HAVE_SYSTEMD" = "x0"],
+-- 
+1.8.5.3
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
index f02359a..8d8c421 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
@@ -1,6 +1,7 @@
 require pulseaudio.inc
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
+           file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
            file://volatiles.04_pulse"
 SRC_URI[md5sum] = "c43749838612f4860465e83ed62ca38e"
 SRC_URI[sha256sum] = "99c13a8b1249ddbd724f195579df79484e9af6418cecf6a15f003a7f36caf939"
-- 
1.9.0


