Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F9DC4321E
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:01 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.26743.1646662439326190152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=VhQZ2ZhJ;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662439; x=1678198439;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=8S6/ZYVLk5M1tfjL19QRZet7JcIMKK8orO0Fizz8WSg=;
  b=VhQZ2ZhJlLU9ktNVjhZCsm72U7XCaHIKHwrlrzMiidBx/qhBLEkiKBln
   pvlAysPKFKW/nGNhcD8mH7DrlbFQaTJyJdzlUQq/yDhGsuGVmSKEEtyhR
   EwPb3fSjfaa9Y9jgQOXvaqi13sBvL1lSiPeiTp95gmRmQJauz034QOLUD
   UWdH/CjZkmBQ+mVHumf4Ql0nXxgmNfT7V+JHNLJroyA9QLlSYQLAnj1iz
   DcI1QTf8CAKK2LwmWWMZcZVksl3Wl7THqtDLW/PLGsSIEXbvo3mqNsIXE
   sD8T9IMCwPjIcxeUhOTT/3XOUQqKkLq5trUHbPKAaT0L7PlHVs7aMJK7D
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112545"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112545"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:29 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070849"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:28 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 14/25] Revert "cve-check: add lockfile to task"
Date: Mon,  7 Mar 2022 22:09:50 +0800
Message-Id: 
 <ecec5339a35f0578669642fc72cbaad2f83bb272.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162834

From: Ross Burton <ross@burtonini.com>

Now that all of the functions in cve-check open the database read-only,
we can remove this lockfile.

This means cve-check can run in parallal again, improving runtimes
massively.

This reverts commit d55fbf4779483d2cfd71df78d0f733b599fef739.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d3d3e7b324698ec3e6fce1951aba389805f3edd3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 646929d2ed..60e2618bb7 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -111,7 +111,6 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build after do_fetch
-do_cve_check[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
 do_cve_check[depends] = "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] = "1"
 
-- 
2.35.1


