Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCFEC433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 14:51:37 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12868.1642776670242435373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 06:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=meNy93Vk;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642776696; x=1674312696;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ccI8l1qVTI2iHbLImV+Ck6cTi0c2/V8g1acgKuP6CaA=;
  b=meNy93Vkdjx2pKviUDsbL0rKKKoW7kP8eYr4D2/PE+IM6X3R1s7qF7zL
   Tz1xFPNbdqxhtTnhLVUt1k3BuVJtpYeTZ3IEURQMW8nrLOpTrRkR5MxyS
   B/Sv4kmz3aMdnJc0rhhrLa8HNwe5rTXy2YWWTj/VUF7GQYiKnt3KSvgAH
   IiF1WzrjmtAlSo42nYhlLNtF7VwUs635NUwzzn9bgDg65Pw+GbP7kWTka
   wsNmo4u9b3K6d9DHiYPyQpFnasRB/OTKZPYkou6ADX43obq5dgxsGYhKh
   p2enan+Tx7YRub2+M2za4EuSkTbE++OCpVUZz+eL2fTJD/SH3paRrTtym
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245886125"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="245886125"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="623336923"
Received: from gordonyx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.131.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:35 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/15] cve-check: add lockfile to task
Date: Fri, 21 Jan 2022 22:51:03 +0800
Message-Id: 
 <155c238d340fdc82420ba9f367cb23014c78b705.1642736951.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642736950.git.anuj.mittal@intel.com>
References: <cover.1642736950.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 14:51:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160846

From: Konrad Weihmann <kweihmann@outlook.com>

this should prevent running into the very rare error
sqlite3.OperationalError: attempt to write a readonly database

As highlighted by https://www.sqlite.org/faq.html#q5
it is likely that the adapter won't allow use multiple exec calls
at the same time.

So it's best to prevent multiple accesses at a time, by reusing
the already in place CVE_CHECK_DB_FILE_LOCK

YOCTO #14110

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 677f5741bd265be49d4a5bb933b3e8d8c4eec653)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 4fa1a64f85..3add826fca 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -110,6 +110,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build after do_fetch
+do_cve_check[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
 do_cve_check[depends] = "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] = "1"
 
-- 
2.34.1


