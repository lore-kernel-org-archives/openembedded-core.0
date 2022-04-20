Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689C5C35296
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.3158.1650419978333112004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=HQgxWTjw;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650419980; x=1681955980;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=3lmlYtUKsFNCibVCGcZNBO1+9mJcF+qGyw/+ivYoMMM=;
  b=HQgxWTjw+sWOdWva6X4RAMkdOjQ1i4nm1izlHBjk/+4aoKkg26snlkNt
   ebETTruyd+fO2L91PO5N3MZ0Z4ToVlCmlEg0k+G9m10ZIuhCDKNJYKGDG
   nOCIU1quNXR/ruFbyVPB6MqbiQT9Dhs/kXeIdmwnyjPxe5QWrIXCKtQlb
   q5nsyJebWKwloeFSPKpsw95J/Y5AUSIKEF4/Tdr1rPIvygJUwAk7jeqzx
   gsXM/eJpjyXH28zKyVereev8vA2smPji/JkyJ9TZNq1pJb/Em+1D2WiLG
   GgROYXyCanxgqmfpgYM4yG7/8tSsFerxdYQZqDAT6TaNKI6oMyakbVMGk
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="263379411"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="263379411"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:40 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="531071606"
Received: from kchew4-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.150.151])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:39 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 09/11] externalsrc/devtool: Fix to work with fixed
 export funcition flags handling
Date: Wed, 20 Apr 2022 09:59:14 +0800
Message-Id: 
 <a41229effb807c97ebfe45fea61c3418de1255a7.1650378286.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650378286.git.anuj.mittal@intel.com>
References: <cover.1650378286.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164648

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If we fix bitbake to correctly handle the cleandirs and fakeroot flags
for tasks handled by EXPORT_FUNCTIONS, we break devtool since it only
considers these for top level functions. Add in extra code to intercept
the cleandirs flags for commonly used sub functions too.

[YOCTO #8621]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 67fad829f37ed0a8e20c599d2b65635158591d06)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/externalsrc.bbclass | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index ad93b2d2ab..435635f42b 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -90,15 +90,16 @@ python () {
                 # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")
 
-            # We do not want our source to be wiped out, ever (kernel.bbclass does this for do_clean)
-            cleandirs = oe.recipeutils.split_var_value(d.getVarFlag(task, 'cleandirs', False) or '')
-            setvalue = False
-            for cleandir in cleandirs[:]:
-                if oe.path.is_path_parent(externalsrc, d.expand(cleandir)):
-                    cleandirs.remove(cleandir)
-                    setvalue = True
-            if setvalue:
-                d.setVarFlag(task, 'cleandirs', ' '.join(cleandirs))
+            for funcname in [task, "base_" + task, "kernel_" + task]:
+                # We do not want our source to be wiped out, ever (kernel.bbclass does this for do_clean)
+                cleandirs = oe.recipeutils.split_var_value(d.getVarFlag(funcname, 'cleandirs', False) or '')
+                setvalue = False
+                for cleandir in cleandirs[:]:
+                    if oe.path.is_path_parent(externalsrc, d.expand(cleandir)):
+                        cleandirs.remove(cleandir)
+                        setvalue = True
+                if setvalue:
+                    d.setVarFlag(funcname, 'cleandirs', ' '.join(cleandirs))
 
         fetch_tasks = ['do_fetch', 'do_unpack']
         # If we deltask do_patch, there's no dependency to ensure do_unpack gets run, so add one
-- 
2.35.1


