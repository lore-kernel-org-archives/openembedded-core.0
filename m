Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Sod5V-0006rk-RG
	for Openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 18:14:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Jul 2012 09:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120803500"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jul 2012 09:03:41 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 09:02:17 -0700
Message-Id: <50eaf322417c4fbccb4032fc948e12af0a0be939.1341935782.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <b4314c7a2f9fb120c2c4affd52567fe60a96bb5a.1341935782.git.nitin.a.kamble@intel.com>
References: <b4314c7a2f9fb120c2c4affd52567fe60a96bb5a.1341935782.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341935782.git.nitin.a.kamble@intel.com>
References: <cover.1341935782.git.nitin.a.kamble@intel.com>
Subject: [PATCH 17/19] libidn: fix build with automake 1.12
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
X-List-Received-Date: Tue, 10 Jul 2012 16:15:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Added a new patch
    avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch

More details in the patch headers.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   25 ++++++++++++++++++++
 meta/recipes-extended/libidn/libidn_1.25.bb        |    5 ++-
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch

diff --git a/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch b/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
new file mode 100644
index 0000000..d3a9211
--- /dev/null
+++ b/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
@@ -0,0 +1,25 @@
+Upsteam-Status: Inappropriate 
+
+automake 1.12.x has depricated AM_PROG_MKDIR_P , and throws a warning for that,
+and the warnings are treated as errors becuase of the -Werror parameter.
+
+These AM_PROG_MKDIR_P are coming from gettext, and the latest gettext code has not 
+eliminated these depricated macros yet. So disable the treatment of warnings
+as errors until gettext is updeated to remove the depricated macros.
+
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/07/10
+
+Index: libidn-1.24/configure.ac
+===================================================================
+--- libidn-1.24.orig/configure.ac
++++ libidn-1.24/configure.ac
+@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 2002-2011 Si
+ AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_MACRO_DIR([m4])
+ AC_CONFIG_HEADERS(config.h)
+-AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-override])
++AM_INIT_AUTOMAKE([1.10 -Wall -Wno-override])
+ AM_SILENT_RULES([yes])
+ 
+ # Library code modified:                              REVISION++
diff --git a/meta/recipes-extended/libidn/libidn_1.25.bb b/meta/recipes-extended/libidn/libidn_1.25.bb
index 755a818..6584edd 100644
--- a/meta/recipes-extended/libidn/libidn_1.25.bb
+++ b/meta/recipes-extended/libidn/libidn_1.25.bb
@@ -10,12 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c9d9d207a3468a696a03368913d360b \
                     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://lib/idna.h;endline=21;md5=7364f6a250728ffe16170f5e3ab37512 \
                     file://src/idn.c;endline=20;md5=7d7235e7951ac87d9dfac42e1b69d9cb"
-PR = "r0"
+PR = "r1"
 
 inherit pkgconfig autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
-           file://libidn_fix_for_automake-1.12.patch "
+           file://libidn_fix_for_automake-1.12.patch \
+           file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch "
 
 SRC_URI[md5sum] = "45ffabce4b8ca87fe98fe4542668d33d"
 SRC_URI[sha256sum] = "7fe625328a6a5d837d723c462c1788affb84d9c9fc0ae5cd0ce9ac7724c34716"
-- 
1.7.3.4



