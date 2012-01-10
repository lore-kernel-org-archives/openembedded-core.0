Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkUmY-00042N-W0
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:02:03 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 21:54:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110535258"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.28])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2012 21:54:21 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 21:54:06 -0800
Message-Id: <d1f1fec5c6fe980aaf2c1f1dc2a0e737f4adf2dd.1326174744.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/22] libxml2: add shared library version info to libxml shared libraries
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
X-List-Received-Date: Tue, 10 Jan 2012 06:02:05 -0000

From: Matthew McClintock <msm@freescale.com>

This fixes an issue with RPM where it checks version imformation for
binaries linked against libxml and fails because it's missing info

| error: Failed dependencies:
|              libxml2.so.2(LIBXML2_2.6.0) is needed by fmc-0.9.7+2-r2.1.ppce500mc
|              libxml2.so.2(LIBXML2_2.4.30) is needed by fmc-0.9.7+2-r2.1.ppce500mc
| ERROR: Function 'do_rootfs' failed (see

Note: fmc is just an example recipe/name

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../libxml/libxml2/fix_version_info.patch          |   23 ++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    4 ++-
 2 files changed, 26 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/fix_version_info.patch

diff --git a/meta/recipes-core/libxml/libxml2/fix_version_info.patch b/meta/recipes-core/libxml/libxml2/fix_version_info.patch
new file mode 100644
index 0000000..77113ef
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/fix_version_info.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Already upstream
+
+From 00819877651b87842ed878898ba17dba489820f0 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Thu, 04 Nov 2010 20:53:14 +0000
+Subject: Reactivate the shared library versionning script
+
+---
+diff --git a/configure.in b/configure.in
+index 59d0629..a1d2c89 100644
+--- a/configure.in
++++ b/configure.in
+@@ -84,7 +84,7 @@ else
+   esac
+ fi
+ AC_SUBST(VERSION_SCRIPT_FLAGS)
+-AM_CONDITIONAL([USE_VERSION_SCRIPT], [test -z "$VERSION_SCRIPT_FLAGS"])
++AM_CONDITIONAL([USE_VERSION_SCRIPT], [test -n "$VERSION_SCRIPT_FLAGS"])
+ 
+ dnl
+ dnl We process the AC_ARG_WITH first so that later we can modify
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
index 2fa246e..0b6ce02 100644
--- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
@@ -1,6 +1,8 @@
 require libxml2.inc
 
-PR = "r4"
+PR = "r5"
+
+SRC_URI += "file://fix_version_info.patch"
 
 SRC_URI[md5sum] = "8127a65e8c3b08856093099b52599c86"
 SRC_URI[sha256sum] = "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690d822e009fdc3c417ec"
-- 
1.7.6.5



