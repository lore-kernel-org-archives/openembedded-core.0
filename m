Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0EAC4332F
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:47:13 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.531.1635871631913336930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218509694"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="218509694"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:29 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575114"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:27 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/24] staging: Fix autoconf-native rebuild failure
Date: Wed,  3 Nov 2021 00:43:53 +0800
Message-Id: 
 <f79fa476c0d0d57ab5ce59728fdb9fff4cd54df1.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157791

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When rebuilds are triggered, autoconf-native can fail with:

| DEBUG: Executing shell function update_gnu_config
| install: cannot stat '[BUILDPATH]tmp/work/x86_64-linux/autoconf-native/2.71-r0/recipe-sysroot-native/usr/share/gnu-config/config.guess': No such file or directory

which is due to update_gnu_config running before extend_recipe_sysroot.
This only happens rarely since usually the prepare_recipe_sysroot
function would already have set things up and only in the invalidated
task hash cases does this rebuild in this way from configure only.

Fix the code to prepend this function instead of appending which
resolves the ordering issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b9535f513366536b13d0522058f517d2e04451b5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 65a6cd5120..25f77c7735 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -620,7 +620,7 @@ python staging_taskhandler() {
     for task in bbtasks:
         deps = d.getVarFlag(task, "depends")
         if task == "do_configure" or (deps and "populate_sysroot" in deps):
-            d.appendVarFlag(task, "prefuncs", " extend_recipe_sysroot")
+            d.prependVarFlag(task, "prefuncs", "extend_recipe_sysroot ")
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
 addhandler staging_taskhandler
-- 
2.31.1


