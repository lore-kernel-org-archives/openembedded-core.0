Return-Path: <tobiasschmidl@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D67EC433FE
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 12:25:56 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.62])
 by mx.groups.io with SMTP id smtpd.web12.6000.1653481546262166544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 05:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=sOrgr1bs;
 spf=pass (domain: siemens.com, ip: 40.107.6.62,
 mailfrom: tobiasschmidl@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2ycoJOi/SQKbTCI6pVaUQ2vX1ByIbf9Qd51ytYVIxfYZCaapHveHxsxP/Ee9wqfKUh9WEqNAuXdEwCBZdaQtZfsqDQQFywLsAK+uHytvJ0+cZVBOb601wSpYQ0oxAeQdSwTxz0RuWqRdH7m6coEOmhJqM3d2qJPG8nRGsJyLAtYGvXdBuo0xT/Z+cKI+oHj5Ocr5xRmrKznVWPfP1uKw3YX0TAcOIDKJ25dx4rvt9LOjolqIWTFhueatpExX5guOs4JPrsELHHVdpM8e7HhACedfUNP+jLUDVw96KLxgac3giBISFLwGladtn6fZFDTlEz1xYdZx7YFjUXPBQIKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbjzsUvf97I/fMZQJcBEMUeSztf2L0tiAGapgKQT7Lc=;
 b=e9y/DMu+hAvRCsauTm0HdzWLzYb0zm4A4H0A1IgLQ4aOndt5j+ix7FLbSltSv7nvwjbZfDEh2WNSXPGZKuwQpGD759N0e2sJv12CgRWtEAsBt1/9fThJGSSEj/HlRVVWJr5dONHzzmX3pvMY2WfUUdXtR4cQhd0HezQYIaHHA2mN+CzKXn/FgZ3JwsQl1R0IpK36HzgS721SD+tKvXCMem61HFkVeKGJtHP3g/LHFCogwpiFrChs9KaRNf5pMx0/UZDhiOgjnqGzm5aZ35kIIEeHo8Hd2ZllD/TF/xk+mSaqW5t4OZ4tLLystiul+20QRZhaF4HymK7wfq0Vc7FV6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbjzsUvf97I/fMZQJcBEMUeSztf2L0tiAGapgKQT7Lc=;
 b=sOrgr1bszH36It/dC6LyvIatnMbw98D6xtlr+TQqUEn534yUHkwPbEcBAGRlTDW4nMpkisfHG4b4hLkNAK/kch6xwkUaksLrvA6Mi2s+R1v4g+RD/C5VxlD8FAPz0xLxpPHKHYvZrfsHE+tGeqvoLcgiRV6rnI7kZYcb4wTPUEBaAFVz4HYSoqzz5HvHI2gr/mt5rDL0dB4yeXtnF25xgM3IFYc+tStrdcHeYfLLhU6unPuO04U1KJJ0wTqbU8GE2VqhaBF5pGMW6lY2GFSmPCd7OFnjYUhdtz4B8ZBCy1cj6/+OTfkTFXDeKYrXGtpxsN1756FZkEI0WjJ93NBGAg==
Received: from AS9PR04CA0107.eurprd04.prod.outlook.com (2603:10a6:20b:50e::19)
 by VI1PR10MB3981.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 25 May
 2022 12:25:43 +0000
Received: from VE1EUR01FT005.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::9e) by AS9PR04CA0107.outlook.office365.com
 (2603:10a6:20b:50e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Wed, 25 May 2022 12:25:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.72) by
 VE1EUR01FT005.mail.protection.outlook.com (10.152.2.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 12:25:43 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Wed, 25 May 2022 14:25:42 +0200
Received: from wonse.private.schmidl.cc (167.87.1.124) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.24; Wed, 25 May 2022 14:25:42 +0200
From: Tobias Schmidl <tobiasschmidl@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Tobias Schmidl <tobiasschmidl@siemens.com>
Subject: [PATCH v2 2/2] oeqa/selftest/wic.py: Repaired test_qemu()
Date: Wed, 25 May 2022 14:25:27 +0200
Message-ID: <20220525122527.765791-3-tobiasschmidl@siemens.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525122527.765791-1-tobiasschmidl@siemens.com>
References: <20220525122527.765791-1-tobiasschmidl@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.1.124]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--12.337500-8.000000
X-TMASE-MatchedRID: pY+4bFISsw8dvR67fpQM++IiIPDSTJiqQv1bdJD/Uhp8nLwuiNHSSEtc
	8DbogbSEoxCLfriDzzg+LZbuPikwc3X7kdNKWjC8m0YLz09sbbBJI5ZUl647UBRFJJyf5BJe3Qf
	wsVk0UbtuRXh7bFKB7hncDXI+Dm2gv20gDYo399fTjK+GKhPJFOx87p07zpqllExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.337500-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 73A9C362CDA17F069DA29F372F5AA8CEA77362A281503C2FA17B436CFEF896792000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d785c111-9657-4d1a-1ecc-08da3e49aff1
X-MS-TrafficTypeDiagnostic: VI1PR10MB3981:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB3981C44FB4358D434712BBFDA9D69@VI1PR10MB3981.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IDof7Sl3b/Mz0rQxFkj2o085KcnYmmlsn+eOtpcsBCuJMF4zofGXU9nTL5Kh8uV+goT8Whqe6y/jHkWN8FT+e1Xhcdh+2Ywd1uGLV04i+EoY2uqhBG6ZgMg/e/+2eljQoRk4KQ/exLCGilrsPHaJsJ9PZnemNqCnYdA0vXztjsfP8ZSQmXh/2bGg4RVTLH7aGQqySW/zPSz4x27hAUXkCNJbH6RUyD510o6BmEXsr0DF7a5rYA/dmQGMsGodyr7qXFjnYUi8pdCbxWZVzLZIFXsYnNwhyP4/JaG9i92OPWOFt5j4j3g6BZAfs9lUdoHJOasekCNZeTYmtW9ndLXKbS3ApAAFgTh0SPVY7uI6nnFnMSWrMZ9qw4kdRcXbjxjpl5VxbBL/39mfKdySj3QN0BEKO++SViisvHpBs2WlaFDaq3yFAIMKN+hKlpmCzZtuOcS4U4BdnAIvYDo1UWkyZ7TkYbp69PdLgbaOBx3NOViZxGmAmXWNCkmNfrDEbIMWoHTtbExruSkMceP12KydF+jHtOwaCJ2Jcl3esssBshMSY5Mj43S2V++uwuRJDoG8vQAbHqqQUqi+FCf+q6fhNZzLdyiNLYIDhf/X4Gyr0cE3yMDuxPPouPgHByrEjdvx8MXRkMCJcf54TrZtozqcKJPdcHlXl01w4uacFnv84JtNRudqOJM2iocS15k/LYm5jSh8xf6ZfUuAXYvEi3OFMg==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6916009)(4326008)(70206006)(356005)(86362001)(6666004)(82960400001)(8676002)(83380400001)(70586007)(508600001)(316002)(47076005)(336012)(36860700001)(186003)(16526019)(26005)(81166007)(2616005)(956004)(107886003)(1076003)(5660300002)(8936002)(82310400005)(4744005)(2906002)(36756003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 12:25:43.1071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d785c111-9657-4d1a-1ecc-08da3e49aff1
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT005.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3981
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 12:25:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166119

The grep is too wide, so it falsely fits additional lines that have
a UUID (i.e, `/`).
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py
index de74c07a03..53058df226 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -853,7 +853,7 @@ class Wic2(WicTestCase):
             status, output =3D qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' %=
 (cmd, output))
             self.assertEqual(output, '4')
-            cmd =3D "grep UUID=3D /etc/fstab"
+            cmd =3D "grep UUID=3D2c71ef06-a81d-4735-9d3a-379b69c6bdba /etc=
/fstab"
             status, output =3D qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' %=
 (cmd, output))
             self.assertEqual(output, 'UUID=3D2c71ef06-a81d-4735-9d3a-379b6=
9c6bdba\t/media\text4\tdefaults\t0\t0')
--=20
2.36.1


