Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777EEC433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:52 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.13304.1635347862317087601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456933"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456933"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:51 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617281"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:50 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 36/36] reproducible_build: Work around caching
 issues
Date: Wed, 27 Oct 2021 23:16:44 +0800
Message-Id: 
 <7e3752dcce2236a4d1ad046b1df2edf8ee5619b4.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157551

From: Richard Purdie <richard.purdie@linuxfoundation.org>

SOURCE_DATE_EPOCH can be expanded early in the parsing process before
the class extensions are applied. This can mean the directory pointed
to for the SDE can be incorrect until later in parsing. Cache the file
name in the cached value and allow it to dynamically update.

This isn't ideal but avoding expansion of the variable likely isn't
possible and I'm not sure how else to handle this. This works around
the issue until a better solution can be found.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 44dc97cd1223e4d2b635669627ec5f796838d42d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/reproducible_build.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 1277764fab..62655c2a5b 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -90,11 +90,14 @@ python create_source_date_epoch_stamp() {
 }
 
 def get_source_date_epoch_value(d):
-    cached = d.getVar('__CACHED_SOURCE_DATE_EPOCH')
-    if cached:
+    epochfile = d.getVar('SDE_FILE')
+    cached, efile = d.getVar('__CACHED_SOURCE_DATE_EPOCH') or (None, None)
+    if cached and efile == epochfile:
         return cached
 
-    epochfile = d.getVar('SDE_FILE')
+    if cached and epochfile != efile:
+        bb.debug(1, "Epoch file changed from %s to %s" % (efile, epochfile))
+
     source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
     try:
         with open(epochfile, 'r') as f:
@@ -112,7 +115,7 @@ def get_source_date_epoch_value(d):
     except FileNotFoundError:
         bb.debug(1, "Cannot find %s. SOURCE_DATE_EPOCH will default to %d" % (epochfile, source_date_epoch))
 
-    d.setVar('__CACHED_SOURCE_DATE_EPOCH', str(source_date_epoch))
+    d.setVar('__CACHED_SOURCE_DATE_EPOCH', (str(source_date_epoch), epochfile))
     return str(source_date_epoch)
 
 export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
-- 
2.31.1


