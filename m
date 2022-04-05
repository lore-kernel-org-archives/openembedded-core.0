Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95280C47081
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nULRudSV;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169714; x=1680705714;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=PrugpBVW3dB5b3fzVYenc90N3Va0TnnhKMiHGAslmTk=;
  b=nULRudSV78qwcyr4oPGW4WdUKad3vjEZD4xXlrB5mDbYLJsK/qcp+tsK
   LA6KlmJQkR2/MNttyYfr95f4+AvJ8ZEotIXjJeZxHC2m6GN8MeK8sV/eL
   fyqGuT7y+WW9+o5foxBSF1TPyC/R4Tibw0WoX1nhw+tFoEKJ/XybyrAeF
   IwnQucxNSB+qbYNMi8T7CHwzzn8zqN2HdlFI65TEMBQAR8I/0WCXabbDZ
   CtTyUJRlPnYvM1RKf9LHW7yZUumA9sB3MO/56n6d4oNFOdkLGuKFUIcL8
   Q6OTwfuADJZ1PKsQQ3ljXGilfZurug4Cy6cr7LmRLtzHA/YSO7f+eCIt1
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348685"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348685"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953538"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:53 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/22] toaster: Fix broken overrides usage
Date: Tue,  5 Apr 2022 22:41:24 +0800
Message-Id: 
 <20118ffdb2b3b2d03c8099b378622b94d1fef66b.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164023

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This fixes data corruption issues with toaster where image data wasn't
being processed correct.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 95cc2d041ad651cfb81b2e55251acf1b86f9ddfc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/toaster.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index dd5c7f224b..f365c09142 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -101,11 +101,11 @@ def _toaster_load_pkgdatafile(dirpath, filepath):
         for line in fin:
             try:
                 kn, kv = line.strip().split(": ", 1)
-                m = re.match(r"^PKG_([^A-Z:]*)", kn)
+                m = re.match(r"^PKG:([^A-Z:]*)", kn)
                 if m:
                     pkgdata['OPKGN'] = m.group(1)
-                kn = "_".join([x for x in kn.split("_") if x.isupper()])
-                pkgdata[kn] = kv.strip()
+                kn = kn.split(":")[0]
+                pkgdata[kn] = kv
                 if kn.startswith('FILES_INFO'):
                     pkgdata[kn] = json.loads(kv)
 
-- 
2.35.1


