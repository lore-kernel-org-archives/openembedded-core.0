Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79F9C38162
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=GlOMa2WQ;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169729; x=1680705729;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/DjH0IlfMnbwSv2u+XBWAEvDFRwkYYjF1LL2MiJEIFQ=;
  b=GlOMa2WQ2doprXKiRgdbBRqTKS/QzX2MkujaYaaq2RnFcj8K8+ijT/Nn
   iV7LGKm9sZz8b21/O9gVQITD09iuXzI3MEczpCxT01Zk+o0/fniIXuGAQ
   JKaWM/hdlRqCoe2v/WGQ0AAiASWhSaHfyko9JPxwnvckJk35KzgyCYP5z
   O7WbjafBmSOKi8JP/Wqo4yEMoKSIlxNXN/DW9+Oeq/J83bJG1yECI7Q+z
   yy2WNBH6ftEhE3+yyhk1WcSziPvuTut5g2Hr2AmUCLpFSAEgPLuQsjLx2
   +6o6n5GNcCPchuri8K3dRwD8I6SDk+SiPVFUzOERTHKYwx3ch029saovZ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348861"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348861"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953628"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:08 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 15/22] sanity: Add warning for local hasheqiv server
 with remote sstate mirrors
Date: Tue,  5 Apr 2022 22:41:34 +0800
Message-Id: 
 <bee06e146a9af09d2cb1dcb8f83b85112b8e0d9e.1649169646.git.anuj.mittal@intel.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164033

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing a lot of users configuring an sstate mirror but not realising that
the default hash equivalenve setting will make this ineffective. Add a warning
to highlight this to the user for the common case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ae4eb33b5a6a037348e8f66e3d4f19b58dba8fa2)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 49eef2f418..a175a1104f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -941,6 +941,11 @@ def check_sanity_everybuild(status, d):
                     mirror_base = urllib.parse.urlparse(mirror[:-1*len('/PATH')]).path
                     check_symlink(mirror_base, d)
 
+    # Check sstate mirrors aren't being used with a local hash server and no remote
+    hashserv = d.getVar("BB_HASHSERVE")
+    if d.getVar("SSTATE_MIRRORS") and hashserv and hashserv.startswith("unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
+        bb.warn("You are using a local hash equivalence server but have configured an sstate mirror. This will likely mean no sstate will match from the mirror. You may wish to disable the hash equivalence use (BB_HASHSERVE), or use a hash equivalence server alongside the sstate mirror.")
+
     # Check that TMPDIR hasn't changed location since the last time we were run
     tmpdir = d.getVar('TMPDIR')
     checkfile = os.path.join(tmpdir, "saved_tmpdir")
-- 
2.35.1


