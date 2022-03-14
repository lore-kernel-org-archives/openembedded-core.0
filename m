Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B6AC433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 02:03:00 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.22151.1647223378479367004
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 19:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=GVXA9P0r;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647223379; x=1678759379;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2a1+z0zFNzuKVGozlqMB0R5Kl0MoyA9l8wdzo4gamiQ=;
  b=GVXA9P0rO4s1WxxOvsfskLRUmYAwAaagEzUh6in25NFLN9NLwqDZnCHR
   gRJ1pNhKyFZ2URcquDxkPqjShEbHaerIeO1QYelDR4NWmgS3Jr1YdxbW7
   Gjmgk4CLVnGJAo0yqc8vxqBNAjay+D/a3aYktakvfxlcPobt8+8AdiXD4
   U2bMpT10qNyINk0D9HNG6G8ritx+GQTUoufc+qY2IKZO08rOdA29rH5Cw
   MYOIbGfxMKEP/Hg+RU4piz9rD/0WdQkMVPu99gJUqKbE27WzAmbNF6F1U
   OiK0BeVQfBNQPHVGfjsfCvYPShhs5yoTa3aFkM5BpEwebuaoDUn+Wz0G9
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="316641482"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="316641482"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="515229464"
Received: from lsim7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.229.232])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 1/6] sstate: inside the threadedpool don't write to
 the shared localdata
Date: Mon, 14 Mar 2022 10:02:00 +0800
Message-Id: 
 <b6893ed80df90b0e9468f291205f38cc76960e08.1647222224.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647222224.git.anuj.mittal@intel.com>
References: <cover.1647222224.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 02:03:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163116

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
index 103de01264..d3816ec7b0 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -977,7 +977,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
             localdata2 = bb.data.createCopy(localdata)
             srcuri = "file://" + sstatefile
-            localdata.setVar('SRC_URI', srcuri)
+            localdata2.setVar('SRC_URI', srcuri)
             bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
 
             try:
-- 
2.35.1


