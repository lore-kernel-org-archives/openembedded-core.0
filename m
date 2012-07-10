Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SoYsV-0000MP-3I
	for Openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 13:45:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jul 2012 04:34:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175472105"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2012 04:34:03 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 04:32:51 -0700
Message-Id: <40f5caaf69cf97faf10f1b7b798646ba737ea6de.1341917396.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <c20b9f6a19c4968bcda90dc23b6abf9f5f0051c3.1341917396.git.nitin.a.kamble@intel.com>
References: <c20b9f6a19c4968bcda90dc23b6abf9f5f0051c3.1341917396.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341917396.git.nitin.a.kamble@intel.com>
References: <cover.1341917396.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/4] libidn: fix build with automake 1.12
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
X-List-Received-Date: Tue, 10 Jul 2012 11:45:15 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Added a new patch
    avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch

More details in the patch headers.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   25 ++++++++++++++++++++
 meta/recipes-extended/libidn/libidn_1.24.bb        |    5 ++-
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
diff --git a/meta/recipes-extended/libidn/libidn_1.24.bb b/meta/recipes-extended/libidn/libidn_1.24.bb
index c6ecea7..000fff5 100644
--- a/meta/recipes-extended/libidn/libidn_1.24.bb
+++ b/meta/recipes-extended/libidn/libidn_1.24.bb
@@ -10,12 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c9d9d207a3468a696a03368913d360b \
                     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://lib/idna.h;endline=21;md5=7364f6a250728ffe16170f5e3ab37512 \
                     file://src/idn.c;endline=20;md5=7d7235e7951ac87d9dfac42e1b69d9cb"
-PR = "r1"
+PR = "r2"
 
 inherit pkgconfig autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
-           file://libidn_fix_for_automake-1.12.patch "
+           file://libidn_fix_for_automake-1.12.patch \
+           file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch "
 
 SRC_URI[md5sum] = "764d7258eeb273941680499fab2c7367"
 SRC_URI[sha256sum] = "da1708c6063ecb7951a0908e67df3eacdfe128b18edaa6cf6867d7b73b5f35ff"
-- 
1.7.3.4



