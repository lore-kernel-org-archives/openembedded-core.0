Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7922EB8FB6
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 11:04:01 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web10.5886.1693998234558238536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 04:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=fLZ/L4f2;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: yang.xu@mediatek.com)
X-UUID: 0ee01eca4ca511eea33bb35ae8d461a2-20230906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=d710T6xrG3YO3iqyd/DOqe2MN0jKvo+BMO9gxDdTNEA=;
	b=fLZ/L4f2mXtbgI2PMWen6N+n0wmQJHWVPrEYgRX2VakDqpD7p/PMCS4LeX/asGbpjZ0sbrfLrPCMoxn9zNyU0s3FV2Y2HFl2Y4rQUn2zX+dfdlb+bCvcr/pyzGOiqOOe5O5wQ2duqAQL+L8OY7FceTwM5Z/Tt4WN+21Wuv7vvNs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:eea71a64-4087-4314-8965-5d2799332dc5,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:0ad78a4,CLOUDID:7b0f3020-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0ee01eca4ca511eea33bb35ae8d461a2-20230906
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 938344088; Wed, 06 Sep 2023 19:03:49 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Sep 2023 19:03:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Sep 2023 19:03:48 +0800
From: <yang.xu@mediatek.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, Yang Xu <yang.xu@mediatek.com>
Subject: [PATCH] meson: don't fail if no .pyc exists
Date: Wed, 6 Sep 2023 11:03:34 +0000
Message-ID: <20230906110334.12263-1-yang.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 11:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187291

From: Yang Xu <yang.xu@mediatek.com>

If PYTHONDONTWRITEBYTECODE set to 1, do_install:append will fail because
no .pyc is removed.

Add -f flag to prevent command fail.

Signed-off-by: Yang Xu <yang.xu@mediatek.com>
---
 meta/recipes-devtools/meson/meson_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson_1.1.1.bb b/meta/recipes-devtools/meson/meson_1.1.1.bb
index 500e13775f..dd97f93aef 100644
--- a/meta/recipes-devtools/meson/meson_1.1.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.1.1.bb
@@ -30,7 +30,7 @@ do_install:append () {
 	# Upstream is discussing ways to solve the issue properly, until then let's
 	# just not install the problematic files.
 	# More info: http://benno.id.au/blog/2013/01/15/python-determinism
-	rm ${D}${libdir}/python*/site-packages/mesonbuild/dependencies/__pycache__/mpi.cpython*
+	rm -f ${D}${libdir}/python*/site-packages/mesonbuild/dependencies/__pycache__/mpi.cpython*
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


