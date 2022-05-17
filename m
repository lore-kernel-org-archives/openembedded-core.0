Return-Path: <tobiasschmidl@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CACC433FE
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:48:37 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.86])
 by mx.groups.io with SMTP id smtpd.web09.1452.1652813311498647382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=UpfkGibI;
 spf=pass (domain: siemens.com, ip: 40.107.104.86,
 mailfrom: tobiasschmidl@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYSS93hjcCTGjR1/lhNvDSNZ+IgkoT/xnt+1j2h9ItAKsQzU7c0H7fqQ5Fffdin6BIlZ6KbZMwYtHYKleDSsVoYHi8Ys1efx7PDlr6OKsoA4Cwzw+3W/UGhNLQwdqtyuVEsJlXW+erOibJNQza4iyzd7cG3Ct43jQRl5rmXBtei7kpX+yN05ti9iO7BsRBV9OmcTkxKeiZBt8wCLLK+ToF00n4vTcATkveECFfRrI3eP5yMypZd8qCjRGEloU4ixqGMMMs/z4zo8i6NWV931dWky+RWkzo9X0zMGUVcHTTSM8DPVOy9IsC/5vGr/G7qGRL22AWt71q5IKgWp1zZONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYzWEe8rnGBoGGCfrpjWx18XCaqTeagpvIqt51kvJBc=;
 b=c+Fn+a44cjJcjkxQh40FkoFhNU2fw0cr7RQ5n7VXnTlffoJOcdwCH/TEMkImXyQ5DY2rcKgIe6tpxRqOKjjLiYn64isoTYUbGaNCbvgJ2qIiBWJSQWqVRIxBaNTHjNFHT04TjwUDL4y2xVeiWkIY20MM8EgHcG405DIyhE9aZs4YJPzWR7YiOzZznnW4g8Tu9juawyorz56G/9nGtdPWCu1JgI0aC8y1v1wChqLQ1OM5azieZ/Lt9nzzlaMuJQkjWFcgWPAZbrPFlobZZWKPLpIpQjM2YngHqunAyRNdzeh0zwr/vxWAFCAVnFXAhcTTaPvA429djgxlV3HxU4Jwkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYzWEe8rnGBoGGCfrpjWx18XCaqTeagpvIqt51kvJBc=;
 b=UpfkGibIJdicThwZyO6y9GCoFx7S/K4rpsa7SNUmu1BBLKjBdxKRcY1TXsRvFqFdWgfHbWUsw8aqc2rSchSoE1TeG6b/Ku5iH55V/6Vh9nAw9/+000iSaLuTsSzzye5poPE3UMwDhKnt5alLXuqx8lZEDItdHQiXBgMXQtAMkYO9S1fd0ODOMBVp4W+QQ2aNLR8dNduTDNuSejWLQJG0zOLkancEU0GqvrkjwqOMVcHyjccIm/6f7cFZsRqxJdYql2XPKUDm0ksK1fd6bjzW0Uq5U1uVWXUBvpK0UgbRpn8XAq+3hL2cIu2mm8xf4PXDzlu4CBNnlpWACR5Of0pPtA==
Received: from AM4PR0101CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::17) by AM6PR10MB2536.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:51::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Tue, 17 May
 2022 18:48:28 +0000
Received: from VE1EUR01FT024.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:200:41:cafe::4f) by AM4PR0101CA0049.outlook.office365.com
 (2603:10a6:200:41::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Tue, 17 May 2022 18:48:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 VE1EUR01FT024.mail.protection.outlook.com (10.152.2.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 18:48:28 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Tue, 17 May 2022 20:48:28 +0200
Received: from wonse.fritz.box (167.87.0.197) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.24; Tue, 17 May
 2022 20:48:27 +0200
From: Tobias Schmidl <tobiasschmidl@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Tobias Schmidl <tobiasschmidl@siemens.com>
Subject: [PATCH 1/1] wic/plugins/images/direct: Allow changes in fstab on
 rootfs
Date: Tue, 17 May 2022 20:48:16 +0200
Message-ID: <20220517184816.1348026-2-tobiasschmidl@siemens.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220517184816.1348026-1-tobiasschmidl@siemens.com>
References: <20220517184816.1348026-1-tobiasschmidl@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.0.197]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--11.231300-8.000000
X-TMASE-MatchedRID: 5vV0XjnGfUmzqzU5o1VJijWdfsELVrJoJxdeG1t7y2YK4MBRf7I7pnFd
	5+Cf9M1Dlzy6qhJBbZZTHuQZZKa8u63aC25avUuaSwG3KDMI8e8/N5lw9tNRRGWnA2xO92UpCmr
	2qv+PWzqXBXaJoB9JZxRFJJyf5BJe3QfwsVk0UbvdirxFVpmK9Ue82lvB0PKH1dqgCr+smag4GK
	26m6D4spb5laUgKXVnIlkpsT7CeUE=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.231300-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 FA1BBBC1BF3F5970991E2E0129CCF664A76CBACCD988F1EA0CAAC30FC115728F2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7cb3450-6961-43b8-e94c-08da3835d51e
X-MS-TrafficTypeDiagnostic: AM6PR10MB2536:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR10MB25367916CC15804F53B83718A9CE9@AM6PR10MB2536.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dJ4JrquUukOVJqP9qi/q+bu85VvliJ/bCbpblqfg1thxhIdtsRf8ycyI1bG/yLnY9AnuLOLUZ9/uA/OlS3tIyLKaovG7Hf95s12xQAGq2yNaKniK10AKV34Wsp24hkbf710MTqdwGxJsCiIhfYYaE/nux85fIP5GG5nyEAZUetTbxUap2er+jwu6k8iElBToCSD71ci8nkvFcAS9qRvc0wTlJakjG0N5JSA/nbhY9eccbw7sZf4zuKI2vqJYGx0rEMKAsL1PlmRyTcCyFnS9MicWBWlwGsuQHX4c98Db6pbh8dZa4aJn+iYAd/S8GM8zo3yqxv5D6gsgYXsvlXxnlD2T5qB7TPgOwkrsdg6aeihEc9WUSglW/SkRWv+BPBn7EaQqy+5O5o57zQvjzMc6bjl8wxZPUSv2NAukuBWL/zv8rPwT9lzCuspzooAAd+LsASLbtsigFGFURQfDM5g7uy/14AshABgnqfTYIZKS9IY9BVBKUlzViKrcONsMRmJ2hXyoLkJZD0bd6u4DTVYUPVG+5AnHzT9WQE6PCP23BOBaQPMC49iPsSrmvdx7NVVWs1nyAssyYYyoRQUkVB5sjnZ2f6KpON8x5MxPVYPwMJA+UXfvxnahTcna3JjK02/7cmym7W2lGi4QJrdtFoK3eCW7z+Vbz37tabI63yn7xGzkdmgg04WtCYtaRTrVTX+W8utI+PDCGXpFteKCQB+70g==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(4744005)(70206006)(70586007)(8936002)(5660300002)(508600001)(36756003)(2616005)(107886003)(8676002)(4326008)(40460700003)(26005)(83380400001)(82960400001)(356005)(336012)(47076005)(956004)(6666004)(81166007)(2906002)(86362001)(36860700001)(82310400005)(16526019)(186003)(1076003)(6916009)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 18:48:28.5817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d7cb3450-6961-43b8-e94c-08da3835d51e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT024.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2536
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:48:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165778

Allow wic to also manipulate the rootfs entry in fstab, which it
currently refuses to write. Reasons one might want to do that include
using systemd-growfs via --fsoptions on /
With this change / is now handled exactly the same as other
mountpoints, the former exception seemingly was not even documented.

Signed-off-by: Tobias Schmidl <tobiasschmidl@siemens.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plu=
gins/imager/direct.py
index da483daed5..c44159b235 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
         updated =3D False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint =3D=3D "/" or not part.mountpoint.starts=
with('/'):
+               or not part.mountpoint.startswith('/'):
                 continue
=20
             if part.use_uuid:
--=20
2.36.1


