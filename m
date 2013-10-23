Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B0C86D032
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 09:05:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9N95gta001464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 02:05:42 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 23 Oct 2013 02:05:42 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Oct 2013 17:05:41 +0800
Message-ID: <1382519141-24627-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] libcap: fix CAP_LAST_CAP
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
X-List-Received-Date: Wed, 23 Oct 2013 09:05:42 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-support/libcap/libcap.inc             |    3 +-
 .../libcap/libcap/fix-CAP_LAST_CAP.patch           |   39 ++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcap/libcap/fix-CAP_LAST_CAP.patch

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 772057f..1b11b85 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -10,7 +10,8 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 # attr and pam are disabled by EXTRA_OEMAKE_class-native
 DEPENDS_class-native = "perl-native-runtime"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/libc/libcap2/${BPN}2_${PV}.orig.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/libc/libcap2/${BPN}2_${PV}.orig.tar.gz \
+           file://fix-CAP_LAST_CAP.patch"
 
 PR = "r1"
 
diff --git a/meta/recipes-support/libcap/libcap/fix-CAP_LAST_CAP.patch b/meta/recipes-support/libcap/libcap/fix-CAP_LAST_CAP.patch
new file mode 100644
index 0000000..a557188
--- /dev/null
+++ b/meta/recipes-support/libcap/libcap/fix-CAP_LAST_CAP.patch
@@ -0,0 +1,39 @@
+fix CAP_LAST_CAP
+
+Upstream-Status: pending
+
+Two new capability CAP_BLOCK_SUSPEND and CAP_WAKE_ALARM have been added into
+kernel, but libcap did not update them.
+Once libcap uses its capability.h (the default value of KERNEL_HEADERS), and
+application always use capability.h from kernel, that will make cap_get_flag
+return wrong value.
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ libcap/include/linux/capability.h |   10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/libcap/include/linux/capability.h b/libcap/include/linux/capability.h
+index 4924f2a..57026be 100644
+--- a/libcap/include/linux/capability.h
++++ b/libcap/include/linux/capability.h
+@@ -360,7 +360,15 @@ struct cpu_vfs_cap_data {
+    CAP_SYS_ADMIN is not acceptable anymore. */
+ #define CAP_SYSLOG           34
+ 
+-#define CAP_LAST_CAP         CAP_SYSLOG
++/* Allow triggering something that will wake the system */
++
++#define CAP_WAKE_ALARM            35
++
++/* Allow preventing system suspends */
++
++#define CAP_BLOCK_SUSPEND    36
++
++#define CAP_LAST_CAP         CAP_BLOCK_SUSPEND
+ 
+ #define cap_valid(x) ((x) >= 0 && (x) <= CAP_LAST_CAP)
+ 
+-- 
+1.7.10.4
+
-- 
1.7.10.4


