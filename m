Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A04C433FE
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 15:34:32 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.45535.1635780864510944525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 08:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="218228538"
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800";
   d="scan'208";a="218228538"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:34:30 -0700
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800";
   d="scan'208";a="488694200"
Received: from aaronhpe-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.232.69])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:34:28 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/18] testimage: fix unclosed testdata file
Date: Mon,  1 Nov 2021 23:33:59 +0800
Message-Id: 
 <0392005d2ed9648ed6eedd3dd3541249bf4fc404.1635780638.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635780638.git.anuj.mittal@intel.com>
References: <cover.1635780638.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 15:34:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157711

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c192a97e3e1c015a48667d6903cc07a8b2620e4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/testimage.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index e613759503..538ec4fc8a 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -230,9 +230,10 @@ def testimage_main(d):
 
     tdname = "%s.testdata.json" % image_name
     try:
-        td = json.load(open(tdname, "r"))
-    except (FileNotFoundError) as err:
-         bb.fatal('File %s Not Found. Have you built the image with INHERIT+="testimage" in the conf/local.conf?' % tdname)
+        with open(tdname, "r") as f:
+            td = json.load(f)
+    except FileNotFoundError as err:
+        bb.fatal('File %s not found (%s).\nHave you built the image with INHERIT += "testimage" in the conf/local.conf?' % (tdname, err))
 
     # Some variables need to be updates (mostly paths) with the
     # ones of the current environment because some tests require them.
-- 
2.31.1


