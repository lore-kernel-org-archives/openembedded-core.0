Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749BBC4332F
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:24:35 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.5107.1637033071172269122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="220822421"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="220822421"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:34 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="567023943"
Received: from jli90-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.214.145.204])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/14] sstate: Account for reserved characters when
 shortening sstate filenames
Date: Tue, 16 Nov 2021 11:24:10 +0800
Message-Id: 
 <186062278e2d1e129815c4f8cf3d9003f3ac2809.1637032974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637032974.git.anuj.mittal@intel.com>
References: <cover.1637032974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 03:24:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158327

From: Manuel Leonhardt <mleonhardt@arri.de>

Previously, when shortening sstate filenames, the reserved
characters for .siginfo were not considered, when siginfo=False,
resulting in differently shortend filenames for the sstate and siginfo
files. With this change, the filenames of the truncated sstate and
siginfo files have the same basename, just as is already the case for
untruncated filenames.

Making sure that the .siginfo files always have the filename of the
corresponding sstate file plus its .siginfo suffix, also when being
truncated, makes it easier to manage the sstate cache and an sstate
mirror outside of Bitbake/Yocto.

Signed-off-by: Manuel Leonhardt <mleonhardt@arri.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2e0e43b7123cf5149833e0072c8edaea3629112)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 4bc80b6078..957762db5c 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -20,7 +20,7 @@ def generate_sstatefn(spec, hash, taskname, siginfo, d):
         components = spec.split(":")
         # Fields 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for information
         # 7 is for the separators
-        avail = (254 - len(hash + "_" + taskname + extension) - len(components[0]) - len(components[1]) - len(components[5]) - len(components[6]) - 7) // 3
+        avail = (limit - len(hash + "_" + taskname + extension) - len(components[0]) - len(components[1]) - len(components[5]) - len(components[6]) - 7) // 3
         components[2] = components[2][:avail]
         components[3] = components[3][:avail]
         components[4] = components[4][:avail]
-- 
2.33.1


