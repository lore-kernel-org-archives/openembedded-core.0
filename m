Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A81ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 01:06:36 +0000 (UTC)
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
 by mx.groups.io with SMTP id smtpd.web12.1393.1662080787756444613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 18:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=GO2Qc6d0;
 spf=pass (domain: mediatek.com, ip: 210.61.82.184,
 mailfrom: yang.xu@mediatek.com)
X-UUID: df72fcb569e44111a57e151f7440b0e3-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=eTkikVF6bWrMQwxiNkYS2VcKN2+Crf1btSQBg9phWJ8=;
	b=GO2Qc6d0zVgINbMLCva7O2/QUbdLrWoezgTHNtOTnsKe7NO/3a3oO2h2z2KO3JJqv0nZ/TGZlM3Ari8L8ezXew9p3fiFPnx27a3CRm/VBZqjD4ouvlO5dBbJd5giTWm+0zz2YRycsCoN7dB5bJno9A2RPnMsGtvyRBO8LnULxmc=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:b80c4fe7-b8c9-4853-b5b1-9e9f4d04e43f,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:59,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:59
X-CID-INFO: VERSION:1.1.10,REQID:b80c4fe7-b8c9-4853-b5b1-9e9f4d04e43f,OB:0,LOB
	:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:59,FILE:0,BULK:0,RULE:Release_H
	amU,ACTION:release,TS:59
X-CID-META: VersionHash:84eae18,CLOUDID:1c95df20-1c20-48a5-82a0-25f9c331906d,C
	OID:4c3bbd7aa3a6,Recheck:0,SF:28|100|16|19|48|101,TC:nil,Content:0,EDM:-3,
	IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: df72fcb569e44111a57e151f7440b0e3-20220902
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by
 mailgw02.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1996388440; Fri, 02 Sep 2022 09:06:18 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 2 Sep 2022 09:06:13 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Sep 2022 09:06:13 +0800
From: Yang Xu <yang.xu@mediatek.com>
To: <openembedded-core@lists.openembedded.org>
CC: Yang Xu <yang.xu@mediatek.com>
Subject: [kirkstone][PATCH] insane.bbclass: Skip patches not in oe-core by
 full path
Date: Fri, 2 Sep 2022 01:06:11 +0000
Message-ID: <20220902010611.12479-1-yang.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 01:06:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170233

The full path of patch may contain '/meta/' but not in oe-core, skip
patches by checking it starts with oe-core full path or not.

Signed-off-by: Yang Xu <yang.xu@mediatek.com>
---
 meta/classes/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f3f80334f6..0d93d50e58 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1196,11 +1196,12 @@ python do_qa_patch() {
     import re
     from oe import patch
 
+    coremeta_path = os.path.join(d.getVar('COREBASE'), 'meta', '')
     for url in patch.src_patches(d):
        (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 
        # skip patches not in oe-core
-       if '/meta/' not in fullpath:
+       if not os.path.abspath(fullpath).startswith(coremeta_path):
            continue
 
        kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
-- 
2.25.1


