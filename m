Return-Path: <Ahmed.Hossam@opensynergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E3AC43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 15:29:23 +0000 (UTC)
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu
 [18.185.115.15])
 by mx.groups.io with SMTP id smtpd.web09.8886.1655911757877713269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@opensynergy.com header.s=tm-dkim-20210503141657
 header.b=dCH2HYWF;
 spf=pass (domain: opensynergy.com, ip: 18.185.115.15,
 mailfrom: ahmed.hossam@opensynergy.com)
Received: from 104.47.51.177_.trendmicro.com (unknown [172.21.186.124])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id D881C100014E3
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 15:29:15 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1655911755.058000
X-TM-MAIL-UUID: fa26c1ef-ac5d-489c-bdd9-dac8a07a7699
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown
 [104.47.51.177])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id
 0E3DC10000E26
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 15:29:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7XLvH7UDRPAhqiUV+Xl/sqWG+TyQ47jIcHttGJuT43iM5w2ujOjoBC++U6yKQpaETn1i24Crj9arYP/O/KzeS33Kbnkv0R74Fw7B1dPN4Rho3NUTWwq0HoXEypjOffESXuRrQldCOFoqJeQp+BdkarzDV6jLEtRDi1ASFMNx10Wy3h5yhFFVp1+Y14gWPgQsTc/dhz2WWiBVp+2foGBBbhXnhg+/WCaJc8SsIZg6vkEa+J5So62SnARkX/3YO6HCOW7Krw3Vu0C2D8maQbpmgFq2N0meJyZfSmcADbN0N5CZ4mjkUdWiG2lttbZikZfxQ5Hl1P3ABkWBvt2AhqG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyAi16lVohzygmMmnDuM5MHLJz4p2kHDB2lc3DhRuCo=;
 b=INeWeQV5lYsg1HVVg5+gthZSJpilsHUpMgSHdDuzngO/JgiAWwZSygtK3USwyakCH3DtzXqT2/7cHd/shE6ZmNFlH031eApBtxHWeP5wphyDYKjWZpi2M1/Qu64hvX/vFspIQtJ3/DJNob3G8kB2xWjf4GtPuAIO2h63Nu0gCOEsaqxLWqwqRJtEcmEqW47WxtzS3CPg8tBruu6bvh4SDKeAO7mjx+w6YbWkax3xGFcfoxDSV0tTM/FQNhGLrbmWM0VHWU/CziJlPRqtiBesHRzEFz8jacZmXmodj4Ell8d/nMKe/g5WtqlNTBBRhCwXxa+wz8d/vV2rNfdMab0GXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.66.60.4) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=opensynergy.com; dmarc=pass (p=none sp=none pct=100)
 action=none header.from=opensynergy.com; dkim=none (message not signed);
 arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.66.60.4)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=opensynergy.com;
Received-SPF: Pass (protection.outlook.com: domain of opensynergy.com
 designates 217.66.60.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.66.60.4; helo=SR-MAIL-03.open-synergy.com; pr=C
From: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>
To: openembedded-core@lists.openembedded.org
Cc: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>
Subject: [PATCH] insane.bbclass: host-user-contaminated: Correct per package
 home path
Date: Wed, 22 Jun 2022 17:28:59 +0200
Message-Id: <20220622152859.2626917-1-Ahmed.Hossam@opensynergy.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6f75efa8-a753-475b-8446-08da5463f632
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2818:EE_
X-Microsoft-Antispam-PRVS: 
	<AM5PR0402MB2818BB65BE7629141AA94B998CB29@AM5PR0402MB2818.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sJwJDCF9QcJDCR0Qhb+84FuHXUh04s6qmD4zYGCRYE5R/7g4voarAML7Qgko2tqen5rhwCi8m3/SWbA64PTThW70maXyt2r9L6VLhxrVtso4Gh1UXSqMT+Dl/GFu7Q8LWXNV+vELXpMpf7ThymP8SKTEun0I/UWVy5+jck6CdY17S3X5FIKKlWKkubpFEiya+Rei/MOIPJPLNHaimvc0C8+9Pwd0n2nXRQlrtjQK38789UGc7INy5wpBMahd8HMzqJ3kXg1A4hWnrHAM0lDJvvP4soUUbuZi5SNV9Byva3iS74nzGPdozUETtFqiH6w31OFWAbMll1VcVgMVELJ2ouQ1a8YXwN/yu4w6Z/9WQ/UCQ7K4eirGuFmxBfjmPA5AiGuYOPAtmg+ZnnRgb9/wv7/MOX7xWmRN/U05yhRAJFKihm7Xh4aRNjTo/dpAKBPeDngdz7PpxdmFlrqu3s5R3ofpA3eM+y98JOtxcKiQAKNHEz5NRA/HIqTWAcqd+6vAxKg/+9P4eA9hmN9tnwEbN9eyll/3KvHcc+FfDyktdWSPQslQwZi3GGWtB1e7Ds2gFX3oRmcYnr7CyjKfWyBV//Czm8s418b+++EPMVvhDcbufCrWfLKCRAUBgOaBtm2YvCmX/FYnrAVmc3kA2bHL3ejXdXv7D24C4aQwdMfcLPuaI1Aza/Mt4rXhphzmjexiKPbMTB2S+DYq6VHgSGNCpwZBzZ02U/VNAT14lpPV/UA=
X-Forefront-Antispam-Report: 
	CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:mx1.opensynergy.com;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(376002)(39840400004)(36840700001)(46966006)(4326008)(8676002)(8936002)(2906002)(5660300002)(82310400005)(316002)(40480700001)(36860700001)(83380400001)(86362001)(81166007)(36756003)(478600001)(6916009)(107886003)(70586007)(42186006)(186003)(70206006)(1076003)(2616005)(47076005)(41300700001)(336012)(26005);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 15:29:13.4097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f75efa8-a753-475b-8446-08da5463f632
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR05FT062.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2818
X-TM-AS-ERS: 104.47.51.177-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.0.1004-26970.005
X-TMASE-Result: 10-1.547900-4.000000
X-TMASE-MatchedRID: 6HOhZj1R77jAoh0zbRRsiVlGa4Om1d9nN5dqZcIK7VjAuQ0xDMaXkH4q
	tYI9sRE/X5ZfmW1Ym4U6gbIYokhQqaXgCCul34T6EclbAMYYY6wpNEQSwoloyblzNLZBPCkWhEz
	I3+mkzidhlYxs1qc2qtCAc7MI41jMTBj1nd2x734oz3wQy8LZbjEDdblTPSP4s5ZVnw3FCatqhv
	+N/pNSfegc6mX1lwNHkRoxEQkO3VF1H8bw68oiDwtuKBGekqUpnH7sbImOEBTMbBjwv0XbB2izL
	dBGVzzsbRy2pA0LiUgO8jeSn+3kbnzRWQ/2Ms9FVlxr1FJij9s=
X-TMASE-XGENCLOUD: 0997da79-88cd-4745-b5c0-9787d16dcd1e-0-0-200-0
X-TM-Deliver-Signature: 97C29291003891F40B1EE97B191BC587
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1655911755;
	bh=N+PqfccIKnX8OsxZAhB7sSbJw5dkCboZKRgkOjJj49U=; l=1226;
	h=From:To:Date;
	b=dCH2HYWFq7tQcB7DLrCuDrK3vmKYtuU4wIqIm9HDNkSmWWjha2B8M54/I1f6F8ObZ
	 S9D5m7V+FAbWe8iMrbVAMNSt59GpC9kqRZfajW1Q3s4GQnCrYPMxtBaM970ElBfcFo
	 6Qz6QOvQjtpoDDKsNCsEgDF0IKhwJe8RMI+tl2VnMH67/Ynk7WBhCVOaUZCD39Ph01
	 Hk2IvUfMLbf0xYn7QcIv03ON8vze7A3RzQHx6W0ez6wZojRuCF9j9H9IclpsOZZY59
	 0elEo/gSOQ0kcCDvECfmtDa/CXJAkCA5d5W+8uoM4AiHBBRrELzfXjXzB0dBiVM+u0
	 hEKf/8+nqqhSw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 15:29:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167243

The current home path that is compared against is incorrect as it is missin=
g the
package name, this patch adds it.

[YOCTO #14553]

Signed-off-by: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9ca84bace9..6f6dcb3dd5 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -970,7 +970,7 @@ def package_qa_check_host_user(path, name, d, elf, mess=
ages):

     dest =3D d.getVar('PKGDEST')
     pn =3D d.getVar('PN')
-    home =3D os.path.join(dest, 'home')
+    home =3D os.path.join(dest, name, 'home')
     if path =3D=3D home or path.startswith(home + os.sep):
         return

--
2.36.1


Please mind our privacy notice<https://www.opensynergy.com/datenschutzerkla=
erung/privacy-notice-for-business-partners-pursuant-to-article-13-of-the-ge=
neral-data-protection-regulation-gdpr/> pursuant to Art. 13 GDPR. // Unsere=
 Hinweise zum Datenschutz gem. Art. 13 DSGVO finden Sie hier.<https://www.o=
pensynergy.com/de/datenschutzerklaerung/datenschutzhinweise-fuer-geschaefts=
partner-gem-art-13-dsgvo/>

