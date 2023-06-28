Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED68EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 16:02:28 +0000 (UTC)
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
 by mx.groups.io with SMTP id smtpd.web11.20818.1687968141913767001
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 09:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=IQ0qkE8j;
 spf=pass (domain: mediatek.com, ip: 210.61.82.184, mailfrom: yang.xu@mediatek.com)
X-UUID: 2688435415cd11eeb20a276fd37b9834-20230629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DRKlOnDh0TG/HF8B5D7t5Pro/PIcdHTC++9BkUNKOWs=;
	b=IQ0qkE8j1gfBvhRFRAYFQhZsk9zuWRC5zyoRuIt91cH60hYhpqMLovL8/Yj3OhAudWR06D31RPvRfR3L9dnIKGFw4Z1YhlOtD6ERbbdZB2NIpsmoVYFosJ+YAZLWsKXwbbL8mkga07VX1HcBWBNb3lYdsefJ8zWi4nWIhaOHgjE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:6a2401bf-a412-4b05-ae7e-f92ec2fec13e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:01c9525,CLOUDID:4d0f67da-b4fa-43c8-9c3e-0d3fabd03ec0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 2688435415cd11eeb20a276fd37b9834-20230629
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 885238164; Thu, 29 Jun 2023 00:02:15 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 29 Jun 2023 00:02:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 29 Jun 2023 00:02:14 +0800
From: <yang.xu@mediatek.com>
To: <openembedded-core@lists.openembedded.org>
CC: Yang Xu <yang.xu@mediatek.com>
Subject: [PATCH] sstatesig: Fix pn and taskname derivation in find_siginfo
Date: Wed, 28 Jun 2023 16:01:46 +0000
Message-ID: <20230628160146.11055-1-yang.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 16:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183595

From: Yang Xu <yang.xu@mediatek.com>

The `bb.siggen.compare_sigfiles` method transforms the key format from
`[mc:mc_name:][virtual:][native:]<recipe path>:<taskname>` to
`<recipe dir>/<recipe name>:<taskname>[:virtual][:native][:mc:mc_name]`
in `clean_basepaths`. However, `find_siginfo` uses the original format
to get the package name (pn) and task name. This commit corrects the
method for deriving the pn and task name in `find_siginfo`.

Signed-off-by: Yang Xu <yang.xu@mediatek.com>
---
 meta/lib/oe/sstatesig.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index f943df181e..a52dacd1a0 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -321,10 +321,13 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     if not taskname:
         # We have to derive pn and taskname
         key = pn
-        splitit = key.split('.bb:')
-        taskname = splitit[1]
-        pn = os.path.basename(splitit[0]).split('_')[0]
-        if key.startswith('virtual:native:'):
+        if key.count(":") >= 2:
+            splitit,taskname,affix = key.split(":", 2)
+        else:
+            splitit,taskname = key.split(":", 1)
+            affix = ""
+        pn = os.path.splitext(os.path.basename(splitit))[0].split('_')[0]
+        if affix.startswith('virtual:native'):
             pn = pn + '-native'
 
     hashfiles = {}
-- 
2.25.1


