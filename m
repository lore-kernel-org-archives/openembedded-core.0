Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DDCC433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:57:57 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6480.1652237869110482622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZXfEpHXV;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237870; x=1683773870;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oJXMvpzwWyH5K1al2+JDqWCD9W5J7OqGjq9pA6741NA=;
  b=ZXfEpHXVudqBGsu2iEAGmLu1DVJ7Th5H3QeUp/xajJPtCPcbqbCeR6Dm
   iAzmUQTPTaU8ElVtSVCKRvQKu8pRPPVwMx8MWDAbvXIHZey1qc/uYv6HY
   5jJIxvE+9R9Z1Xhrs7yangAM3usw34sNjkXL6KjeNPtB8uFobc01zI9KC
   4ghqsoQ6rjQyODwqR8mUKB6nGAPJwimgeJRxzxwUpTld8jBBFQpQ+NYjA
   wWVCbJAHCbp3JyWk0f1GtzjGV0Dmsav4g62g2c68t4g+IakSizjp8eAC3
   eAb1xW5krDilx1+us0fKZCqGvUjfyGpxzqddsMDW7BMrxzLnyq8J3umDI
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257106027"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257106027"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754744"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:49 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/17] base: Avoid circular references to our own
 scripts
Date: Wed, 11 May 2022 10:57:22 +0800
Message-Id: 
 <e032a725944aaa60be9dc2bdedf43ffa5fce6b4d.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:57:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165475

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We'd like to intercept git calls but we don't want circular references
and HOSTTOOLS currently sets them up. Tweak to avoid them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 52c37e133fa55846aca2248ffcf3a10648dbb8d7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 340ebe7d78..070341d1aa 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -122,6 +122,10 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
     tools = d.getVar(toolsvar).split()
     origbbenv = d.getVar("BB_ORIGENV", False)
     path = origbbenv.getVar("PATH")
+    # Need to ignore our own scripts directories to avoid circular links
+    for p in path.split(":"):
+        if p.endswith("/scripts"):
+            path = path.replace(p, "/ignoreme")
     bb.utils.mkdirhier(dest)
     notfound = []
     for tool in tools:
-- 
2.35.3


