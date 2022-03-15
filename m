Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465D4C4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 15:07:07 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.12123.1647356821113804643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Y3dT8cXb;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647356826; x=1678892826;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Uc7+n8JS4RqJpEteHhu6LrvIK7Hp3hhvkfbSqSxu1yE=;
  b=Y3dT8cXbOFP5L88XSmKAgrJYOz14naB9Dq1DsnD/fnQH04NkqaxiMfgG
   AQWEnci/az3jH7feayX91ziNPqYSSNkbw6wkNVK9YjpH/OD+2MHUdP5yq
   7Gv9FB84QY4p0iLwhVLv/am8/k+3CF+GIAUQnTc3gqmBFoGjAzrbfH9z7
   rDySUTFHDlfYlkyuZtrjxLsJlFWi1zTwQF32UcRSGJaKTBjo8O3MYjQlg
   ulvQOMhUNgXccqsPcwCui7qMuFjJdDj9dQdDuqnKyOz5xiaOM7n10rlkr
   5s4ulYiD3uNg+v1BehNZmVZzHVP1ZOF8Z/riyEC7Cuv4cZwaSTRdXpqS8
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="281098935"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400";
   d="scan'208";a="281098935"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:05:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400";
   d="scan'208";a="634616158"
Received: from ezulkifl-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.233.253])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:05:34 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 4/6] sstate: inside the threadedpool don't write to
 the shared localdata
Date: Tue, 15 Mar 2022 23:05:19 +0800
Message-Id: 
 <3d05b9b419b629001933fad7ee53b9f3bb366305.1647356478.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647356478.git.anuj.mittal@intel.com>
References: <cover.1647356478.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 15:07:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163300

From: Jose Quaresma <quaresma.jose@gmail.com>

When inside the threadedpool we make a copy of the localdata
to avoid some race condition, so we need to use this new
localdata2 and stop write the shared localdata.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1fa763b2022822a76fde541724e83e1977833d03)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index caa25815e0..de6e7fa960 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -950,7 +950,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
             localdata2 = bb.data.createCopy(localdata)
             srcuri = "file://" + sstatefile
-            localdata.setVar('SRC_URI', srcuri)
+            localdata2.setVar('SRC_URI', srcuri)
             bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
 
             try:
-- 
2.35.1


