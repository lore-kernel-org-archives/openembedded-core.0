Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A96EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 03:58:36 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web10.51346.1688443107086289028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jul 2023 20:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=aI8U9rbx;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: yang.xu@mediatek.com)
X-UUID: 023809201a1f11ee9cb5633481061a41-20230704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=V76PgFCSrJNGLw0K10N8rI092HHCiu8JGLduHYKm/f8=;
	b=aI8U9rbxrnU+eV5kkBh9NJFoSDXweh1ajkL98/rmIEQ1O54Zj10F1cTOXbKJpR4u7oDSnYRKgnRCwb6gei4Jr2G6mNFjtPFakrLCBwBSbD8kAqrz0ofE8l58/Eoo97O1CQ2sXCT50qvQNI2SdEUToC/M40zVPeHL6KpsBimeUA4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:8793d8bd-4e59-41a4-98ed-db830dc50add,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:01c9525,CLOUDID:1fa4aa82-5a99-42ae-a2dd-e4afb731b474,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 023809201a1f11ee9cb5633481061a41-20230704
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 35851478; Tue, 04 Jul 2023 11:58:17 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 4 Jul 2023 11:58:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 4 Jul 2023 11:58:15 +0800
From: <yang.xu@mediatek.com>
To: <openembedded-core@lists.openembedded.org>
CC: Yang Xu <yang.xu@mediatek.com>
Subject: [PATCH v2] sstatesig: Fix pn and taskname derivation in find_siginfo
Date: Tue, 4 Jul 2023 03:58:06 +0000
Message-ID: <20230704035806.2937-1-yang.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 03:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183810

From: Yang Xu <yang.xu@mediatek.com>

The `bb.siggen.compare_sigfiles` method transforms the key format from
`[mc:<mc_name>:][virtual:][native:]<recipe path>:<taskname>` to
`<recipe dir>/<recipe name>:<taskname>[:virtual][:native][:mc:<mc_name>]`
by `clean_basepaths`. However, `find_siginfo` uses the original format
to get the package name (pn) and task name.

This commit corrects the method for deriving the pn and task name in
`find_siginfo` and adds handling for multilib name.

Signed-off-by: Yang Xu <yang.xu@mediatek.com>
---
 meta/lib/oe/sstatesig.py | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index f943df181e..f041a0c430 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -321,11 +321,18 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     if not taskname:
         # We have to derive pn and taskname
         key = pn
-        splitit = key.split('.bb:')
-        taskname = splitit[1]
-        pn = os.path.basename(splitit[0]).split('_')[0]
-        if key.startswith('virtual:native:'):
-            pn = pn + '-native'
+        if key.count(':') >= 2:
+            splitit, taskname, affix = key.split(':', 2)
+        else:
+            splitit, taskname = key.split(':', 1)
+            affix = ''
+        pn = os.path.splitext(os.path.basename(splitit))[0].split('_')[0]
+        affixitems = affix.split(':')
+        if affixitems[0] == 'virtual':
+            if affixitems[1] == 'native':
+                pn = pn + '-native'
+            if affixitems[1] == 'multilib':
+                pn = affixitems[2] + '-' + pn
 
     hashfiles = {}
     filedates = {}
-- 
2.25.1


