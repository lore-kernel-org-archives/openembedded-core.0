Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1858C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.420.1637080369344062201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:32:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="233669501"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="233669501"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="535956786"
Received: from mmohdso1-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.237.91])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:22 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 12/17] scripts/oe-package-browser: Handle no
 packages being built
Date: Wed, 17 Nov 2021 00:31:53 +0800
Message-Id: 
 <879a176f7159d1b3f5a9dc2116017b4a08172468.1637080067.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637080067.git.anuj.mittal@intel.com>
References: <cover.1637080067.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:32:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158361

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Give the user a proper error message if there aren't packages built,
rather than a less friendly traceback.

[YOCTO #14619]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b14c176b7dd74b7d63ca0f72e6e00fbf209f5a0b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/oe-pkgdata-browser | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index e07005b807..a3a381923b 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -236,6 +236,8 @@ class PkgUi():
         update_deps("RPROVIDES", "Provides: ", self.provides_label, clickable=False)
 
     def load_recipes(self):
+        if not os.path.exists(pkgdata):
+            sys.exit("Error: Please ensure %s exists by generating packages before using this tool." % pkgdata)
         for recipe in sorted(os.listdir(pkgdata)):
             if os.path.isfile(os.path.join(pkgdata, recipe)):
                 self.recipe_iters[recipe] = self.recipe_store.append([recipe])
-- 
2.33.1


