Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14428C3F6B0
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 06:15:30 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web12.38861.1660803326495407161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 23:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=cRzDLnpj;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138,
 mailfrom: yang.xu@mediatek.com)
X-UUID: 1987b60743bd4e728a153b3772293bcf-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=3fh2DTXVyvSm3QVMwjZmh4ijHAtirbR/ef9X3NzvoIU=;
	b=cRzDLnpjUddKty+VZCraOJmTtG/GflLKT4ulqh4PZTNPjvW1sgjb4OfKqYRznDB85bUYqpQc1T2tcbtljCJojKSWEXrV+HAbzTt4uVMeG3YuqY+nkNE0JL6cFXSl1JSe7gW+G4LvL9IBhdi+Wi1WgiPyYsJXhQOxqhpZsO+n5CY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:6a9510b8-2db0-4c3e-af13-10ada29b3fd4,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:bf70039d-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1987b60743bd4e728a153b3772293bcf-20220818
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 500607783; Thu, 18 Aug 2022 14:15:21 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 18 Aug 2022 14:15:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 18 Aug 2022 14:15:20 +0800
From: Yang Xu <yang.xu@mediatek.com>
To: <openembedded-core@lists.openembedded.org>
CC: Yang Xu <yang.xu@mediatek.com>
Subject: [PATCH v3] insane.bbclass: Skip patches not in oe-core by full path
Date: Thu, 18 Aug 2022 06:15:18 +0000
Message-ID: <20220818061518.19596-1-yang.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 06:15:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169513

The full path of patch may contain '/meta/' but not in oe-core, skip
patches by checking it starts with oe-core full path or not.

Signed-off-by: Yang Xu <yang.xu@mediatek.com>
---
 meta/classes-global/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 46ea41e271..db34b4bdb5 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1214,11 +1214,12 @@ python do_qa_patch() {
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


