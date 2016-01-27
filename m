Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 23DBF77187
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 23:28:49 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id yy13so1029800pab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hMY2FCPbo7AuqFCVrbKGMmuQS1AzzIOKBb9f24YESkw=;
	b=sb/K2FrhjebRANJ1/cf3A062yajl8hMOyOnrsU0lmyk7sRd9n6YWa5I40Vc45ZLv1o
	y0DET+34wGGCT6jvKswedHK34hp2PWXTx0zIa+uwc/Grr+EZR8PeU0UuO7OJKT4KvTAo
	gvRMFM6BXbEJzYWOKQ2U45a3LUCp/VouWsH9QknbZ7/PzAJivxf0NkJcZpVEuMY7LE3h
	oS4gNyjdC1Wmnxrf8b9IOFpPBjKCW9g/Ll0k4hzRorQmyi3fV/8Zts2vJPBFlvVJivNH
	Ekz/z7bGlWpTL3ryW8E6H1hzGhcw7JTspX0TdxWz0gGSzLokH7mEsxOMvtoXxOq4xPJC
	X5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hMY2FCPbo7AuqFCVrbKGMmuQS1AzzIOKBb9f24YESkw=;
	b=Td12xkNiPntOae4H2+NYYjcZaapU/zYIYersgoqmnegva9wj2FX/+FQZnSygIDymk7
	Z1JrpvhtgsCZ1ApntUPQ+y/ELkzxADaLSScu8syZRGxcuRye+AmTNJzrtXTe3ke9zKF0
	irA14fRcJ5DDhJaIdNsViBWkimNk3mS6KyNwXHP3idRmZqNIsmFKZ6TJLAIjUIkDwOT5
	jU7S0/PQPwpgSIBE2FF6xZFPrdCFP9I5v/lzoOQdDTx9ArbttaAFGMRo8kMF6QGiDCzv
	QEQ+CQI7m1rT/0QgymigmVbr25ilLhfBNi9eC2g7clUKKJ2Q51mYzZCBdN4wXRriGYvF
	dnUw==
X-Gm-Message-State: AG10YOTXr/wtTaP+dPDvs/p3D4mLYfw4mD8aUTeS1sWSqEc0ig/eqXzSZT9JXIOoYQC1nQ==
X-Received: by 10.66.161.227 with SMTP id xv3mr46618659pab.117.1453937330011; 
	Wed, 27 Jan 2016 15:28:50 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	h66sm11422372pfj.52.2016.01.27.15.28.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 15:28:48 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 15:28:35 -0800
Message-Id: <1453937316-1311-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
References: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] glib-2.0: drop add-march-i486-into-CFLAGS-automatically.patch
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
X-List-Received-Date: Wed, 27 Jan 2016 23:28:52 -0000

The reasoning behind this patch isn't clear. ${CC} should always
contain appropriate -march flags. If the build is misconfigured
somehow (or someone is trying to build for i386) then we want the
configure scipt to generate an error, not to try to quietly try to
fix it (adding -march=i486 to CFLAGS is potentially going to cause
more problems than it solves).

Since this patch is unlikely to ever be merged upstream and it's not
helpful in any typical OE build, drop it rather than maintaining it.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../add-march-i486-into-CFLAGS-automatically.patch | 39 ----------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb      |  1 -
 2 files changed, 40 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/add-march-i486-into-CFLAGS-automatically.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/add-march-i486-into-CFLAGS-automatically.patch b/meta/recipes-core/glib-2.0/glib-2.0/add-march-i486-into-CFLAGS-automatically.patch
deleted file mode 100644
index 3aac35a..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/add-march-i486-into-CFLAGS-automatically.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 55253b55b9c65f3e0efbbe03cbab2a4c4014a16b Mon Sep 17 00:00:00 2001
-From: Song.Li <Song.Li@windriver.com>
-Date: Thu, 5 Jul 2012 15:09:41 +0800
-Subject: [PATCH] add -march=i486 into CFLAGS automatically
-
-Upstream-Status: Inappropriate [configuration]
-
-glib configure will check if current gcc need -march=i486,
-when gcc need -march=i486 but CFLAGS don't have,
-glib configure will abort and advise the user to add -march=i486 or later.
-This will break the build process,it's not good for automatic build system.
-so change this to adding -march=i485 automatically when it is needed.
----
- configure.ac |    6 ++++--
- 1 files changed, 4 insertions(+), 2 deletions(-)
-
-Index: glib-2.36.0/configure.ac
-===================================================================
---- glib-2.36.0.orig/configure.ac
-+++ glib-2.36.0/configure.ac
-@@ -2378,7 +2378,7 @@ dnl
- dnl Note that the atomic ops are only available with GCC on x86 when
- dnl using -march=i486 or higher.  If we detect that the atomic ops are
- dnl not available but would be available given the right flags, we want
--dnl to abort and advise the user to fix their CFLAGS.  It's better to do
-+dnl to add -march=i486 automatically to fix their CFLAGS.  It's better to do
- dnl that then to silently fall back on emulated atomic ops just because
- dnl the user had the wrong build environment.
-
-@@ -2401,7 +2401,8 @@ AC_CACHE_CHECK([for lock-free atomic int
-         AC_TRY_COMPILE([],
-                        [volatile int atomic = 2;\
-                         __sync_bool_compare_and_swap (&atomic, 2, 3);],
--                       [AC_MSG_ERROR([GLib must be build with -march=i486 or later.])],
-+                       [AC_MSG_WARN([GLib must be build with -march=i486 or later.])
-+                       SAVE_CFLAGS="${SAVE_CFLAGS} -march=i486"],
-                        [])
-         CFLAGS="${SAVE_CFLAGS}"
-       fi
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
index 79643c7..5abb861 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
@@ -7,7 +7,6 @@ SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
            file://fix-conflicting-rand.patch \
-           file://add-march-i486-into-CFLAGS-automatically.patch \
            file://glib-2.0-configure-readlink.patch \
            file://run-ptest \
            file://ptest-paths.patch \
-- 
1.9.1


