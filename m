Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BADDC433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 02:20:34 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.1399.1637547629207164788
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 18:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="298122197"
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="298122197"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:33 -0800
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="739428793"
Received: from kkleong1-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.239.135])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/16] scripts/oe-package-browser: Handle no
 packages being built
Date: Mon, 22 Nov 2021 10:20:09 +0800
Message-Id: 
 <75449f8690bd6d1b40776a208b667cc9691bcb6e.1637546583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637546583.git.anuj.mittal@intel.com>
References: <cover.1637546583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 02:20:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158541

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
index 8d223185a4..65a6ee956e 100755
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


