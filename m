Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C731C00140
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 01:22:04 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web11.6740.1660008120521139555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 18:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=KTK00nFF;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138,
 mailfrom: yang.xu@mediatek.com)
X-UUID: a2d09eab3d8f4042beff310f2679f664-20220809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nxJurJmo2gmQ6LaCp7nVkVXOePDCordMYAMGJFnNMwE=;
	b=KTK00nFFIHFDViKV9kbw9VR6qjRma/c6a7zQXjH5BzEa5prI3nMq6wx0KyH+qOUA+sJpV3WMRASYVTyqvEsENjjzrce02r1/DyzoO4pcO4nP9NBIV6qk5iHnXBA0woztdrLZ8LvF6i2m14NmSSZhEpsX3zLiO1JDjrIVG4OiLWU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:76cac9b8-01b2-4601-8a50-9c86add183f4,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:eed3c1fc-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a2d09eab3d8f4042beff310f2679f664-20220809
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 936478430; Tue, 09 Aug 2022 09:21:54 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 9 Aug 2022 09:21:53 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 9 Aug 2022 09:21:53 +0800
From: Yang Xu <yang.xu@mediatek.com>
To: <openembedded-core@lists.openembedded.org>
CC: Yang Xu <yang.xu@mediatek.com>
Subject: [PATCH] insane.bbclass: Skip patches not in oe-core by full path in
 do_qa_patch
Date: Tue, 9 Aug 2022 01:21:40 +0000
Message-ID: <20220809012140.26859-1-yang.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 01:22:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169121

The full path of patch may contain '/meta/' but not in oe-core, skip
patches by checking it starts with oe-core full path or not.

Signed-off-by: Yang Xu <yang.xu@mediatek.com>
---
 meta/classes/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c8b434bb54..5b2b91f6ff 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1208,11 +1208,12 @@ python do_qa_patch() {
     import re
     from oe import patch
 
+    oecore_path = os.path.join(d.getVar('COREBASE'), 'meta/')
     for url in patch.src_patches(d):
        (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 
        # skip patches not in oe-core
-       if '/meta/' not in fullpath:
+       if not os.path.abspath(fullpath).startswith(oecore_path):
            continue
 
        kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
-- 
2.25.1


