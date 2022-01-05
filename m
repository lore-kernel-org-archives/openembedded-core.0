Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB068C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:33 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.1733.1641395973368105348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=AFYF6dKU;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395973; x=1672931973;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5xuVkf1Gj9XqL0pFRKmdzV20VR4MVtq4D60bsKPTd4Q=;
  b=AFYF6dKUHWqGe5xabcMK4QqfHhJhMJOFMF5ivZmagcCcFLoAsYwI4zeU
   bqfky3/w/4vhFDO8OtVdeJpSvcckLWXsaZ0tWxdZg7dxgxaxJcVcmNKXt
   KfBquFX3RrEKS21RTlQnp/YB+QTNzgRPnfMp5IO3CAgKSq3pMSgVjcou/
   aBx/FuOIxrs2qIS6+CGn5McEbrsUWq1mi7w6YlLnflewWe+5nHoLJwSsO
   MlRaQMX80SJlyDVevlntGH/zF+ivQiYpsxGZwMnKG/YMG7yyYF/BaM52b
   6pRSnnjOLp4UMuWbcfaxbqhHezHIMzTFPdgeaViTctyDEH3apZfaugoPx
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="223147025"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="223147025"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128708"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 21/24] selftest: skip virgl test on fedora 34
 entirely
Date: Wed,  5 Jan 2022 23:18:41 +0800
Message-Id: 
 <a469e03ed175b8fb846d449dd8858bc874981ed9.1641395036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641395036.git.anuj.mittal@intel.com>
References: <cover.1641395036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 15:19:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160204

From: Steve Sakoman <steve@sakoman.com>

Fedora 34 recently updated libdrm to 2.4.109 and this test will fail any
time the host has libdrm > 2.4.107

Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 1ab7aee542589f6b6c76f8515b4230ce870a8678)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 668e978f17..2148e84ff3 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -187,6 +187,8 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Centos 7')
         if distro and distro == 'centos-8':
             self.skipTest('virgl isn\'t working with Centos 8')
+        if distro and distro == 'fedora-34':
+            self.skipTest('virgl isn\'t working with Fedora 34')
         if distro and distro == 'opensuseleap-15.0':
             self.skipTest('virgl isn\'t working with Opensuse 15.0')
 
-- 
2.33.1


