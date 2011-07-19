Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy4X-000266-VG
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:22:02 +0200
Received: by mail-iy0-f175.google.com with SMTP id 12so2181793iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xpHlowrKXAu6zNfCFZRzED+9CZIaIQK09gBETEFIuTc=;
	b=dUKkAS158qunvUqaOZvhUEwSdG1BNiESht/bWDPEwhz2giL2zsRlYImL6belC48GD4
	DOqGagA/ECFZ0uHleyydqQ60twjgMimLK55fgMtBXigdewLyUSqKNnWbH0cf4DjuDLH9
	o8JTEW7mkaFwvG4bvO1+x7B+tVs0drZLrmAqM=
Received: by 10.42.175.65 with SMTP id az1mr1190079icb.405.1311034677957;
	Mon, 18 Jul 2011 17:17:57 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm3248255ibg.14.2011.07.18.17.17.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:17:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:31 -0700
Message-Id: <dff1f78fb1ae4c5dde5e953c8eaad91856d6b661.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
Subject: [PATCH 12/16] pimlico/dates: Fix build on uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2011 00:22:02 -0000

uclibc does not have NL_TIME_FIRST_WEEKDAY

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/pimlico/dates.inc                |    2 +-
 .../uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch      |   37 ++++++++++++++++++++
 meta/recipes-sato/pimlico/dates_git.bb             |    6 ++-
 3 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-sato/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch

diff --git a/meta/recipes-sato/pimlico/dates.inc b/meta/recipes-sato/pimlico/dates.inc
index 01ab409..b3be6b6 100644
--- a/meta/recipes-sato/pimlico/dates.inc
+++ b/meta/recipes-sato/pimlico/dates.inc
@@ -8,7 +8,7 @@ SECTION = "x11"
 DEPENDS = "glib-2.0 gtk+ libglade eds-dbus"
 RDEPENDS_${PN} = "libedata-cal"
 
-inherit autotools pkgconfig gtk-icon-cache
+inherit autotools gettext pkgconfig gtk-icon-cache
 
 # Poky/Sato specific enhancements
 OWL = "--disable-owl"
diff --git a/meta/recipes-sato/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch b/meta/recipes-sato/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
new file mode 100644
index 0000000..6ade470
--- /dev/null
+++ b/meta/recipes-sato/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
@@ -0,0 +1,37 @@
+uclibc has langinfo.h but it does not define _NL_TIME_FIRST_WEEKDAY
+therefore we introduce a check in configure for the this define
+and then we make sure that we use it when it really exists
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac	2011-07-18 10:34:15.000000000 -0700
++++ git/configure.ac	2011-07-18 10:54:26.403798188 -0700
+@@ -98,6 +98,8 @@
+ 		src/libgtkdatesview.pc
+ ])
+ 
++AC_CHECK_DECLS([_NL_TIME_FIRST_WEEKDAY],[],[],[[#include <langinfo.h>]])
++
+ AC_OUTPUT
+ 
+ echo " "
+Index: git/src/dates_view.c
+===================================================================
+--- git.orig/src/dates_view.c	2011-07-18 10:34:15.000000000 -0700
++++ git/src/dates_view.c	2011-07-18 10:58:46.093798136 -0700
+@@ -1505,7 +1505,11 @@
+ 	priv->days = 1;
+ 	priv->months = 0;
+ 	priv->months_in_row = 4;
++#if HAVE_DECL__NL_TIME_FIRST_WEEKDAY
+ 	priv->week_start = *nl_langinfo (_NL_TIME_FIRST_WEEKDAY) - 1;
++#else
++	priv->week_start = 0;
++#endif
+ 	priv->dragbox = TRUE;
+ 	priv->single_click = TRUE;
+ 	priv->double_click = FALSE;
diff --git a/meta/recipes-sato/pimlico/dates_git.bb b/meta/recipes-sato/pimlico/dates_git.bb
index 4b6a3e9..094ef30 100644
--- a/meta/recipes-sato/pimlico/dates_git.bb
+++ b/meta/recipes-sato/pimlico/dates_git.bb
@@ -7,10 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 
 SRCREV = "514185dc1f6588085fda41eb59898b93d0487dd4"
 PV = "0.4.11+git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://git.gnome.org/${BPN};protocol=git \
 	   file://make-382.patch \
-	   file://dso_linking_change_build_fix.patch"
+	   file://dso_linking_change_build_fix.patch \
+	   file://uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch \
+          "
-- 
1.7.4.1



