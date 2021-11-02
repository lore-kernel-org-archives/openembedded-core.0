Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9ECAC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:45:13 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web08.458.1635871511923037907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="294769975"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="294769975"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:53 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575253"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:52 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 21/24] create-spdx: cross recipes are native also
Date: Wed,  3 Nov 2021 00:44:09 +0800
Message-Id: 
 <9edd5e3eeec447a1d90ebbfc681c84d7047933ec.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:45:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157782

From: Saul Wold <Saul.Wold@windriver.com>

Recipes that inherit cross should also be categorized as isNative

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ee113e3894deb1cfb18622085a3fe0600e1ef01d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/create-spdx.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index aa9514121d..c35dbe1184 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -422,7 +422,7 @@ python do_create_spdx() {
     recipe.name = d.getVar("PN")
     recipe.versionInfo = d.getVar("PV")
     recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
-    if bb.data.inherits_class("native", d):
+    if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
         recipe.annotations.append(create_annotation(d, "isNative"))
 
     for s in d.getVar('SRC_URI').split():
@@ -614,7 +614,7 @@ python do_create_runtime_spdx() {
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_deploy = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
-    is_native = bb.data.inherits_class("native", d)
+    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d)
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
-- 
2.31.1


