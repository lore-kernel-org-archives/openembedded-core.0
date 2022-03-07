Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13037C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:00 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.26743.1646662439326190152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=GJGCxZTN;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662439; x=1678198439;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QVivHs7XSt/7uvxQHtgBLR+bIeYXzsUTjTV8rki4YW4=;
  b=GJGCxZTNEYyvkFH9AJvH2jiLDT8G+2bD2jjz3GMrLLLBSLLNfvmnqBgc
   xDnjoBZoGqTE4ctZS0aY4udzdJ3S9iGS+EXCSwFnWAS9Z8iWb8qdRKu0Y
   W7qRuC+IO9+zjT4Nj+cuFkl9XJ/VfQTOe20lxWe/YxaxYFjj7KfsCCtIn
   +cKc3uuGmBBPwZC7sJL13wLl++/FlwE+GRbLzMxlOZqQI0clxL1qGUopW
   1FFTv4MEHKBeGyCfTuMU6HBsqIJeL5OFX9+oaMLKMqBUkXshYxfpkuCdN
   SqAw4WYjRQ//FsVUzy4+4tcMd5B9qapIt3HxtiZIf5iLAOFItMfN9O64d
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112530"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112530"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:26 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070827"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:25 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 12/25] cve-check: get_cve_info should open the
 database read-only
Date: Mon,  7 Mar 2022 22:09:48 +0800
Message-Id: 
 <3c79237085169b96cc56910b08263437cad09e4d.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162833

From: Ross Burton <ross@burtonini.com>

All of the function in cve-check should open the database read-only, as
the only writer is the fetch task in cve-update-db.  However,
get_cve_info() was failing to do this, which might be causing locking
issues with sqlite.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8de517238f1f418d9af1ce312d99de04ce2e26fc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 21d3da7974..646929d2ed 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -265,7 +265,8 @@ def get_cve_info(d, cves):
     import sqlite3
 
     cve_data = {}
-    conn = sqlite3.connect(d.getVar("CVE_CHECK_DB_FILE"))
+    db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
+    conn = sqlite3.connect(db_file, uri=True)
 
     for cve in cves:
         for row in conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,)):
-- 
2.35.1


