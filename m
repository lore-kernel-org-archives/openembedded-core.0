Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BEC0E773BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 23:31:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2016 15:31:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,495,1449561600"; d="scan'208";a="894058255"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 15:31:28 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 15:27:07 +0000
Message-Id: <ae976c56455701eb7b7f0d9a95f80baaa388b705.1456327117.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1456327117.git.mariano.lopez@linux.intel.com>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1456327117.git.mariano.lopez@linux.intel.com>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/3] cve-check-tool patch to allow select dir for the db
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
X-List-Received-Date: Wed, 24 Feb 2016 23:31:28 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This patch allows to select the directory for the
database used by cve-check-tool.

[YOCTO #7515]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 .../change_logic_cve_get_file_parent.patch         | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool/change_logic_cve_get_file_parent.patch

diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool/change_logic_cve_get_file_parent.patch b/meta/recipes-devtools/cve-check-tool/cve-check-tool/change_logic_cve_get_file_parent.patch
new file mode 100644
index 0000000..077de88
--- /dev/null
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool/change_logic_cve_get_file_parent.patch
@@ -0,0 +1,45 @@
+From 22cc9186909f98f024d78a08504d0bf532806de0 Mon Sep 17 00:00:00 2001
+From: Mariano Lopez <mariano.lopez@linux.intel.com>
+Date: Thu, 18 Feb 2016 14:26:02 +0000
+Subject: [PATCH] util.c: Change logic in cve_get_file_parent()
+
+Function cve_get_file_parent() will try to get the
+realpath and the get the dirname. If the file used
+to get parent doesn't exist the call will fail.
+
+This problem is present when using another directory
+for the database, realpath() won't find the nvd.db
+file and the program will exit quitely.
+
+This patch will first get the dirname and the get
+the realpath to avoid failing when the doesn't exist.
+
+Upstream-Status: Accepted [Release v5.6.3]
+
+Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
+---
+ src/library/util.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/src/library/util.c b/src/library/util.c
+index 8a20728..4d4a576 100644
+--- a/src/library/util.c
++++ b/src/library/util.c
+@@ -184,11 +184,9 @@ bool cve_is_dir(const char *p)
+ 
+ char *cve_get_file_parent(const char *p)
+ {
+-        char *r = realpath(p, NULL);
+-        if (!r) {
+-                return NULL;
+-        }
+-        return dirname(r);
++        autofree(char) *d = strdup(p);
++        char *r = realpath(dirname(d), NULL);
++        return r;
+ }
+ 
+ bool cve_file_set_text(const char *path, char *text)
+-- 
+2.6.2
+
-- 
2.6.2


