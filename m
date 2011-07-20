Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDW-0001aO-31
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753338"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:29 -0700
Message-Id: <040fa1a6589b8fd2c189cc1434b675649791bc05.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 42/50] pimlico/dates: Fix build on uclibc
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:19 -0000

From: Khem Raj <raj.khem@gmail.com>

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
1.7.3.4



