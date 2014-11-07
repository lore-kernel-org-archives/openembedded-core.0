Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8FE7067B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989744"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:48 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:26 -0800
Message-Id: <396e8364e74651b671573fee746b73a110420f23.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 01/19] libcap: Upgrade to 2.24
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:55 -0000

Tarballs moved to kernel.org
Deleted upstream'ed patch
merged minimal .bb with .inc

Check for security dir before moving it when pam is enabled.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libcap/libcap/fix-CAP_LAST_CAP.patch           | 39 ----------------------
 meta/recipes-support/libcap/libcap_2.22.bb         |  6 ----
 .../libcap/{libcap.inc => libcap_2.24.bb}          | 12 ++++---
 3 files changed, 7 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-support/libcap/libcap/fix-CAP_LAST_CAP.patch
 delete mode 100644 meta/recipes-support/libcap/libcap_2.22.bb
 rename meta/recipes-support/libcap/{libcap.inc => libcap_2.24.bb} (80%)

diff --git a/meta/recipes-support/libcap/libcap/fix-CAP_LAST_CAP.patch b/meta/recipes-support/libcap/libcap/fix-CAP_LAST_CAP.patch
deleted file mode 100644
index a557188..0000000
--- a/meta/recipes-support/libcap/libcap/fix-CAP_LAST_CAP.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-fix CAP_LAST_CAP
-
-Upstream-Status: pending
-
-Two new capability CAP_BLOCK_SUSPEND and CAP_WAKE_ALARM have been added into
-kernel, but libcap did not update them.
-Once libcap uses its capability.h (the default value of KERNEL_HEADERS), and
-application always use capability.h from kernel, that will make cap_get_flag
-return wrong value.
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- libcap/include/linux/capability.h |   10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/libcap/include/linux/capability.h b/libcap/include/linux/capability.h
-index 4924f2a..57026be 100644
---- a/libcap/include/linux/capability.h
-+++ b/libcap/include/linux/capability.h
-@@ -360,7 +360,15 @@ struct cpu_vfs_cap_data {
-    CAP_SYS_ADMIN is not acceptable anymore. */
- #define CAP_SYSLOG           34
- 
--#define CAP_LAST_CAP         CAP_SYSLOG
-+/* Allow triggering something that will wake the system */
-+
-+#define CAP_WAKE_ALARM            35
-+
-+/* Allow preventing system suspends */
-+
-+#define CAP_BLOCK_SUSPEND    36
-+
-+#define CAP_LAST_CAP         CAP_BLOCK_SUSPEND
- 
- #define cap_valid(x) ((x) >= 0 && (x) <= CAP_LAST_CAP)
- 
--- 
-1.7.10.4
-
diff --git a/meta/recipes-support/libcap/libcap_2.22.bb b/meta/recipes-support/libcap/libcap_2.22.bb
deleted file mode 100644
index a989bb6..0000000
--- a/meta/recipes-support/libcap/libcap_2.22.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libcap.inc
-
-PR = "r6"
-
-SRC_URI[md5sum] = "b4896816b626bea445f0b3849bdd4077"
-SRC_URI[sha256sum] = "e1cae65d8febf2579be37c255d2e058715785ead481a4e6a4357a06aff84721f"
diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap_2.24.bb
similarity index 80%
rename from meta/recipes-support/libcap/libcap.inc
rename to meta/recipes-support/libcap/libcap_2.24.bb
index 0e28ea0..75cf5d4 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap_2.24.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
 
 DEPENDS = "perl-native-runtime"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/libc/libcap2/${BPN}2_${PV}.orig.tar.gz \
-           file://fix-CAP_LAST_CAP.patch"
+SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz"
 
-PR = "r1"
+SRC_URI[md5sum] = "d43ab9f680435a7fff35b4ace8d45b80"
+SRC_URI[sha256sum] = "cee4568f78dc851d726fc93f25f4ed91cc223b1fe8259daa4a77158d174e6c65"
 
 inherit lib_package
 
@@ -56,8 +56,10 @@ do_install_append() {
 	# Move the library to base_libdir
 	install -d ${D}${base_libdir}
 	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
-		mv ${D}${libdir}/* ${D}${base_libdir}
-		rmdir ${D}${libdir}
+		mv ${D}${libdir}/libcap* ${D}${base_libdir}
+                if [ -d ${D}${libdir}/security ]; then
+			mv ${D}${libdir}/security ${D}${base_libdir}
+		fi
 	fi
 }
 
-- 
1.8.3.1


