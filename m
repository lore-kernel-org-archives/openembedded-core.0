Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E5BC433FE
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 08:34:18 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.3862.1637570053453876204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 00:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="232231994"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800";
   d="scan'208";a="232231994"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:34:17 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800";
   d="scan'208";a="508448612"
Received: from amohdwah-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.239.176])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:34:16 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 3/5] create_spdx: ensure is_work_shared() is unique
Date: Mon, 22 Nov 2021 16:34:04 +0800
Message-Id: 
 <1d350fd2a0db57617fbc62eb1d65f3ffa2667551.1637569916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637569916.git.anuj.mittal@intel.com>
References: <cover.1637569916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 08:34:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158557

From: Saul Wold <Saul.Wold@windriver.com>

There is a function with the same name is_work_shared() in the archiver class
this causes a conflict when both classes are included. Use work-shared as the
check in WORKDIR to allow for other packages beyond the kernel and gcc that
use a common shared-work source directory.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18eab77ee65c73b17225e69c7ba446ab1c69fa92)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/create-spdx.bbclass | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index eb1d446f3f..1d5c8b3bc1 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -53,10 +53,8 @@ def recipe_spdx_is_native(d, recipe):
       a.annotator == "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION")) and
       a.comment == "isNative" for a in recipe.annotations)
 
-def is_work_shared(d):
-    pn = d.getVar('PN')
-    return bb.data.inherits_class('kernel', d) or pn.startswith('gcc-source')
-
+def is_work_shared_spdx(d):
+    return bb.data.inherits_class('kernel', d) or ('work-shared' in d.getVar('WORKDIR'))
 
 python() {
     import json
@@ -747,7 +745,7 @@ def spdx_get_src(d):
 
     try:
         # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
-        if not is_work_shared(d):
+        if not is_work_shared_spdx(d):
             # Change the WORKDIR to make do_unpack do_patch run in another dir.
             d.setVar('WORKDIR', spdx_workdir)
             # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
@@ -760,7 +758,7 @@ def spdx_get_src(d):
 
             bb.build.exec_func('do_unpack', d)
         # Copy source of kernel to spdx_workdir
-        if is_work_shared(d):
+        if is_work_shared_spdx(d):
             d.setVar('WORKDIR', spdx_workdir)
             d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
             src_dir = spdx_workdir + "/" + d.getVar('PN')+ "-" + d.getVar('PV') + "-" + d.getVar('PR')
@@ -776,7 +774,7 @@ def spdx_get_src(d):
                 shutils.rmtree(git_path)
 
         # Make sure gcc and kernel sources are patched only once
-        if not (d.getVar('SRC_URI') == "" or is_work_shared(d)):
+        if not (d.getVar('SRC_URI') == "" or is_work_shared_spdx(d)):
             bb.build.exec_func('do_patch', d)
 
         # Some userland has no source.
-- 
2.33.1


