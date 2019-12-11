Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8D96D7CE79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 23:12:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2019 15:12:34 -0800
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; d="scan'208";a="203740767"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.168.110])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2019 15:12:32 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 07:10:42 +0800
Message-Id: <20191211231042.25153-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] sysstat: fix CVE-2019-19725
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
X-List-Received-Date: Wed, 11 Dec 2019 23:12:33 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sysstat/sysstat/CVE-2019-19725.patch      | 28 +++++++++++++++++++
 .../sysstat/sysstat_12.2.0.bb                 |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch
new file mode 100644
index 0000000000..2aa12724f8
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch
@@ -0,0 +1,28 @@
+From a5c8abd4a481ee6e27a3acf00e6d9b0f023e20ed Mon Sep 17 00:00:00 2001
+From: Sebastien GODARD <sysstat@users.noreply.github.com>
+Date: Mon, 9 Dec 2019 17:54:07 +0100
+Subject: [PATCH] Fix #242: Double free in check_file_actlst()
+
+Avoid freeing buffer() twice.
+
+Signed-off-by: Sebastien GODARD <sysstat@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/a5c8abd4a481ee6e27a3acf00e6d9b0f023e20ed]
+CVE: CVE-2019-19725
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ sa_common.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sa_common.c b/sa_common.c
+index cf52aefe..856a3715 100644
+--- a/sa_common.c
++++ b/sa_common.c
+@@ -2153,6 +2153,7 @@ void check_file_actlst(int *ifd, char *dfile, struct activity *act[], uint64_t f
+ 	}
+ 
+ 	free(buffer);
++	buffer = NULL;
+ 
+ 	/* Check that at least one activity selected by the user is available in file */
+ 	for (i = 0; i < NR_ACT; i++) {
diff --git a/meta/recipes-extended/sysstat/sysstat_12.2.0.bb b/meta/recipes-extended/sysstat/sysstat_12.2.0.bb
index e3ae3dd51c..f7a1a35975 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.2.0.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.2.0.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch \
             file://0001-configure.in-remove-check-for-chkconfig.patch \
+            file://CVE-2019-19725.patch \
 "
 
 SRC_URI[md5sum] = "7deffb18e7f32a0b74ab81f1f75de9ee"
-- 
2.21.0


