Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 08AB27054E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Oct 2014 23:12:42 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id ft15so2329504pdb.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Oct 2014 16:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Y8RMTHH75O9BlNf1e6Bu7Xq2bMvRVQlNq+EzwsatE1s=;
	b=0q1Dn3IgdzHSR6prNQ5pTPjDa/8fBTbx098W2VYWMudj8/yIBi59OeBzSQZ7sAEmrZ
	Mp8gbjW6iePrvkXDKW14TYVsykj8U6Pe07Dl8SXnC0YF1A4nVB6hHwFqVyr9SNsOI75b
	vcWme92EIm9BVgoIv/w77rGKGRFceDU0bjl3MhvqsFnq27Sqf1AKTf8XcOqZaz7l8i/s
	l0QYD8Xe6ildNZwU25VIH+XxD6MeASjrWHULNfzC16Z7TBtksCnTFayLeJvMEhchirxG
	9tzdTvlI4sSJCPI+xRtCG7z4RhPIpaMwVY6M2gTsFCh7+Bau5Wa4i2wWzPuAogLpChdU
	5jsA==
X-Received: by 10.70.90.171 with SMTP id bx11mr14445065pdb.27.1412550764014;
	Sun, 05 Oct 2014 16:12:44 -0700 (PDT)
Received: from haswell.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225])
	by mx.google.com with ESMTPSA id fv6sm9390221pdb.83.2014.10.05.16.12.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Oct 2014 16:12:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Oct 2014 16:16:19 -0700
Message-Id: <1412550979-15317-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.2
Subject: [daisy][PATCH] gnome-desktop-testing: Fix build on uclibc
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
X-List-Received-Date: Sun, 05 Oct 2014 23:12:43 -0000

[YOCTO #6577]

Change-Id: Ia29fb963a7df4e77504993172f85851e0b540c7e
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...process.c-Enable-GNU-extensions-in-system.patch | 35 ++++++++++++++++++++++
 .../gnome-desktop-testing_2014.1.bb                |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/0001-gsystem-subprocess.c-Enable-GNU-extensions-in-system.patch

diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/0001-gsystem-subprocess.c-Enable-GNU-extensions-in-system.patch b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/0001-gsystem-subprocess.c-Enable-GNU-extensions-in-system.patch
new file mode 100644
index 0000000..840666f
--- /dev/null
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/0001-gsystem-subprocess.c-Enable-GNU-extensions-in-system.patch
@@ -0,0 +1,35 @@
+From b1de2c6290bc0651fe87a8c4fb52e7a0a5fe6322 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 5 Oct 2014 16:01:49 -0700
+Subject: [PATCH] gsystem-subprocess.c: Enable GNU extensions in system  C
+ library
+
+This should export O_CLOEXEC where it is only
+available when _GNU_SOURCE is defined .e.g. uclibc based systems
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+---
+ src/libgsystem/gsystem-subprocess.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/libgsystem/gsystem-subprocess.c b/src/libgsystem/gsystem-subprocess.c
+index a967896..a52a362 100644
+--- a/src/libgsystem/gsystem-subprocess.c
++++ b/src/libgsystem/gsystem-subprocess.c
+@@ -18,6 +18,10 @@
+ 
+ #include "config.h"
+ 
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE
++#endif
++
+ #define _GSYSTEM_NO_LOCAL_ALLOC
+ #include "libgsystem.h"
+ 
+-- 
+2.1.1
+
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
index 146a02a..c688e9d 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
@@ -2,7 +2,9 @@ SUMMARY = "Test runner for GNOME-style installed tests"
 HOMEPAGE = "https://wiki.gnome.org/GnomeGoals/InstalledTests"
 LICENSE = "LGPLv2+"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
+           file://0001-gsystem-subprocess.c-Enable-GNU-extensions-in-system.patch \
+          "
 SRC_URI[md5sum] = "a608ad72a77e23a1aecdfd8d07a94baf"
 SRC_URI[sha256sum] = "1a3eed73678dd22d09d6a7ec4f899557df3e8b4a802affa76d0f163b31286539"
 
-- 
2.1.1


