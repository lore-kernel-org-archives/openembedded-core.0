Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE44C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 05:39:49 +0000 (UTC)
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
 by mx.groups.io with SMTP id smtpd.web09.13316.1660541987683647365
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 22:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=HKfVort0;
 spf=pass (domain: mediatek.com, ip: 210.61.82.184,
 mailfrom: yang.xu@mediatek.com)
X-UUID: f850c13ea2ea418898ac3196593b7dee-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=JyOp+zwsRJd8QYBzDMYH1g/elymLTY+oa/aYbgNAyYQ=;
	b=HKfVort0TvFMA5SMl9ckN5hzhD6Jca2v+WFX8xdwlVVen4yUueNfh8FXXlI9PKTlTJCKmLwLTbRY0ZWpH32YOWlg1AmZrU9mOdTeu0/22atQn+qVo6MQcYZRk/cae0gndVosSMr09dPtFv+C4FD8BJCRBNisCXnwC9tEjlLyVCY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:53516fcd-f866-4f4e-945a-5f115698df3c,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:87b24ffd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f850c13ea2ea418898ac3196593b7dee-20220815
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 891481675; Mon, 15 Aug 2022 13:39:41 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 15 Aug 2022 13:39:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 15 Aug 2022 13:39:39 +0800
From: Yang Xu <yang.xu@mediatek.com>
To: <openembedded-core@lists.openembedded.org>
CC: Yang Xu <yang.xu@mediatek.com>
Subject: [PATCH v2] insane.bbclass: Skip patches not in oe-core by full path
Date: Mon, 15 Aug 2022 05:39:35 +0000
Message-ID: <20220815053935.15950-1-yang.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 05:39:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169350

The full path of patch may contain '/meta/' but not in oe-core, skip
patches by checking it starts with oe-core full path or not.

Signed-off-by: Yang Xu <yang.xu@mediatek.com>
---
 meta/classes-global/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 46ea41e271..42daf4388e 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1214,11 +1214,12 @@ python do_qa_patch() {
     import re
     from oe import patch
 
+    coremeta_path = os.path.join(d.getVar('COREBASE'), 'meta/')
     for url in patch.src_patches(d):
        (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 
        # skip patches not in oe-core
-       if '/meta/' not in fullpath:
+       if not os.path.abspath(fullpath).startswith(os.path.abspath(coremeta_path)):
            continue
 
        kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
-- 
2.25.1


