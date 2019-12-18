Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BCAEE7FFD0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 03:21:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:07 -0800
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="205701734"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.193])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:06 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 11:20:51 +0800
Message-Id: <aa5c8914979957da953c12eb14d41b46140fb2c0.1576638856.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576638856.git.anuj.mittal@intel.com>
References: <cover.1576638856.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 3/9] sysstat: fix CVE-2019-19725
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
X-List-Received-Date: Wed, 18 Dec 2019 03:21:05 -0000
Content-Transfer-Encoding: 8bit

(From OE-Core rev: 2bf6fdc460526feb0955b3b789e7be78f6e8ec4a)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sysstat/sysstat/CVE-2019-19725.patch      | 28 +++++++++++++++++++
 .../sysstat/sysstat_12.1.6.bb                 |  1 +
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
diff --git a/meta/recipes-extended/sysstat/sysstat_12.1.6.bb b/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
index 362888d506..674addb4df 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch \
 	    file://0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch \
+            file://CVE-2019-19725.patch \
 "
 
 SRC_URI[md5sum] = "d8e3bbb9c873dd370f6d33664e326570"
-- 
2.21.0


