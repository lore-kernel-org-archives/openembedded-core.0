Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 98C26713F2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 20:06:30 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 05 Sep 2014 13:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="382099473"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.5])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2014 13:01:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Sep 2014 13:06:27 -0700
Message-Id: <2164a52936a6fc4b51ed8b8253c851c02a0f75c7.1409947480.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1409947480.git.sgw@linux.intel.com>
References: <cover.1409947480.git.sgw@linux.intel.com>
In-Reply-To: <cover.1409947480.git.sgw@linux.intel.com>
References: <cover.1409947480.git.sgw@linux.intel.com>
Subject: [PATCH 3/4] libcap: Upgrade to 2.24
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
X-List-Received-Date: Fri, 05 Sep 2014 20:06:31 -0000

${S} added because top dir renamed
libcap now provides pkgconfig files do don't move everything and delete libdir

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libcap/libcap.inc             | 10 +++---
 .../libcap/libcap/fix-CAP_LAST_CAP.patch           | 39 ----------------------
 meta/recipes-support/libcap/libcap_2.22.bb         |  6 ----
 meta/recipes-support/libcap/libcap_2.24.bb         |  4 +++
 4 files changed, 8 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-support/libcap/libcap/fix-CAP_LAST_CAP.patch
 delete mode 100644 meta/recipes-support/libcap/libcap_2.22.bb
 create mode 100644 meta/recipes-support/libcap/libcap_2.24.bb

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 0e28ea0..660394e 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -7,11 +7,9 @@ LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
 
 DEPENDS = "perl-native-runtime"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/libc/libcap2/${BPN}2_${PV}.orig.tar.gz \
-           file://fix-CAP_LAST_CAP.patch"
-
-PR = "r1"
+SRC_URI = "${DEBIAN_MIRROR}/main/libc/libcap2/${BPN}2_${PV}.orig.tar.xz"
 
+S = "${WORKDIR}/${BPN}2-${PV}"
 inherit lib_package
 
 # do NOT pass target cflags to host compilations
@@ -56,8 +54,8 @@ do_install_append() {
 	# Move the library to base_libdir
 	install -d ${D}${base_libdir}
 	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
-		mv ${D}${libdir}/* ${D}${base_libdir}
-		rmdir ${D}${libdir}
+		mv ${D}${libdir}/libcap* ${D}${base_libdir}
+		mv ${D}${libdir}/security ${D}${base_libdir}
 	fi
 }
 
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
diff --git a/meta/recipes-support/libcap/libcap_2.24.bb b/meta/recipes-support/libcap/libcap_2.24.bb
new file mode 100644
index 0000000..4d0df37
--- /dev/null
+++ b/meta/recipes-support/libcap/libcap_2.24.bb
@@ -0,0 +1,4 @@
+require libcap.inc
+
+SRC_URI[md5sum] = "1f8934af240ff1e9fb2ef1a2a75d308e"
+SRC_URI[sha256sum] = "51cd1c568a2baf1e687573bd6117a94b07f33b46a05acaa50ee208792a830b79"
-- 
1.8.3.1


