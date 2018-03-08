Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C36BB789B4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053937"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:17 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:45 +0200
Message-Id: <20180308181804.31261-23-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 23/42] ghostscript: drop incorrectly applied patch
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:17 -0000

The patch was adding a change to the source file that was already there,
so the lines of code were repeated twice. This didn't create a bug or a
security issue, but it may well have.

Long story:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../ghostscript/ghostscript/CVE-2016-7977.patch    | 33 ----------------------
 .../ghostscript/ghostscript_9.21.bb                |  1 -
 2 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7977.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7977.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7977.patch
deleted file mode 100644
index b7eed1241e7..00000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7977.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 8abd22010eb4db0fb1b10e430d5f5d83e015ef70 Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Mon, 3 Oct 2016 01:46:28 +0100
-Subject: [PATCH] Bug 697169: Be rigorous with SAFER permissions
-
-Once we've opened our input file from the command line, enforce the SAFER
-rules.
-
-Upstream-Status: Backport
-CVE: CVE-2016-7977
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- psi/zfile.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/psi/zfile.c b/psi/zfile.c
-index b6caea2..2c6c958 100644
---- a/psi/zfile.c
-+++ b/psi/zfile.c
-@@ -1081,6 +1081,9 @@ lib_file_open(gs_file_path_ptr  lib_path, const gs_memory_t *mem, i_ctx_t *i_ctx
-     gs_main_instance *minst = get_minst_from_memory(mem);
-     int code;
- 
-+    if (i_ctx_p && starting_arg_file)
-+        i_ctx_p->starting_arg_file = false;
-+
-     /* when starting arg files (@ files) iodev_default is not yet set */
-     if (iodev == 0)
-         iodev = (gx_io_device *)gx_io_device_table[0];
--- 
-2.10.2
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
index bf985c44a3e..50ec7e20c5a 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
@@ -32,7 +32,6 @@ SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
            file://cups-no-gcrypt.patch \
-           file://CVE-2016-7977.patch \
            file://CVE-2017-7207.patch \
            file://CVE-2017-5951.patch \
            file://CVE-2017-7975.patch \
-- 
2.16.1


