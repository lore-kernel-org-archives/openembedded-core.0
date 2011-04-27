Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzED-0005Kp-ML
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2011 00:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="684550326"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 00:29:35 -0700
Message-Id: <a121b9715e7b16118830ce9c44d776bb4b628eb5.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Tue, 26 Apr 2011 10:26:40 +0800
Date: Wed, 27 Apr 2011  0:29:35 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 15/52] libfm: Remove the flag of G_DISABLE_DEPRECATED
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:05 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Latest glib-2.0 changes some macros and function definitions to be
deprecated. However libfm still uses them. Therefore the flag
G_DISABLE_DEPRECATED should be removed in libfm's Makefile.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../libfm/libfm-0.1.14/use_deprecate_func.patch    |   11 +++++++++++
 meta/recipes-support/libfm/libfm_0.1.14.bb         |    5 +++--
 2 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch

diff --git a/meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch b/meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch
new file mode 100644
index 0000000..fade195
--- /dev/null
+++ b/meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch
@@ -0,0 +1,11 @@
+diff -ruN libfm-0.1.14-orig//src/Makefile.am libfm-0.1.14/src/Makefile.am
+--- libfm-0.1.14-orig//src/Makefile.am	2011-04-26 10:01:44.297664993 +0800
++++ libfm-0.1.14/src/Makefile.am	2011-04-26 10:02:10.637665004 +0800
+@@ -285,7 +285,6 @@
+ 	$(GIO_CFLAGS) \
+ 	-DGIO_MODULE_DIR=\"$(giomodulesdir)\"	\
+ 	-DGVFS_LOCALEDIR=\""$(localedir)"\"	\
+-	-DG_DISABLE_DEPRECATED \
+ 	$(NULL)
+ 
+ libgiofm_la_LDFLAGS = 	\
diff --git a/meta/recipes-support/libfm/libfm_0.1.14.bb b/meta/recipes-support/libfm/libfm_0.1.14.bb
index c56ad33..5c7e95c 100644
--- a/meta/recipes-support/libfm/libfm_0.1.14.bb
+++ b/meta/recipes-support/libfm/libfm_0.1.14.bb
@@ -10,9 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 SECTION = "x11/libs"
 DEPENDS = "gtk+ menu-cache intltool"
 
-PR = "r2"
+PR = "r3"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz \
+           file://use_deprecate_func.patch"
 
 SRC_URI[md5sum] = "d55e51dced6bb9ef46665243b079761f"
 SRC_URI[sha256sum] = "e97bf3f9ed4f33b9f0be73e67d360b89337cccf816361faacd8422722269806b"
-- 
1.7.1.1



