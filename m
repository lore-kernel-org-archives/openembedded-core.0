Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0B1CCA473
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 11:04:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.53])
 by mx.groups.io with SMTP id smtpd.web10.3250.1655291085062280659
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 04:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=V7YhpcOb;
 spf=pass (domain: arm.com, ip: 40.107.8.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=n4zL4xbDlGIUmjQxIsqqcu02wQDKbWamHmsdsIOWUVMsaeLTNXuE/5KGXLuwgwX4H1hV7MGMpUoObcw2vwsbWSDIjUrrsk8gsR6qLYZKW55hCS231Z9cHs/j3eiaGRQXD2xJYtHVkYV1lkw8hKAPnUv81NNV7prFQhIB5gAosKzCS/c2Kx9uzcx0Fd8i1ZG7cfLDTnu1RuioVHlhA83D03vwdfmkByPE3+P7Y8/NeeGjBSpDye5RHW64WFuBjEmpZ68JNqhKzXAE0QQFBD3zczd/o6zGYtdFLFJsf0JSvZzCueNeBBjjoV4zw67hv/ORlFv1mpPuI+4eTThtnDU+pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EHDv1UBWD3Pc1irZwLryMuRXLFQP4yGTkjvSBLo1XM=;
 b=np41fc3szUoByJjQFh/nlgbn9pdNFqHCmOWYazA3sCnyLjEdgDv3gaqSIFYsz1wtXpoaJ4GUeg2vxQ1OvzSHZyZfZjT52r7Li6xRIIe8q5T0qZHy16oLbE49+KN3rAoq34WEdj0ZDS7iw+GRYBHuTGdf3GGgpkzEDZA5iqjOgPdLIl0HroJJDi+FzxrAvaMnJ0aHEFSTD3+jIPcXGMxbpbDrCE+DDQSw19aRtlrJFV9WiLqzCiWjDMvrKq2wijQ+Vy3APFfxruSNyaf7YUzypqhsRmAuPwNBVq4l6gFmXhoqiHlodtsVd5I6A2gdnVrVBs9Fh1ExrN9uMouuRXO+nw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EHDv1UBWD3Pc1irZwLryMuRXLFQP4yGTkjvSBLo1XM=;
 b=V7YhpcOb81NHI7l8oSI+ofntcEG/9P2rY4nN2NBYBm+ZI0Bjmn+n6soEcVtbjN/eZs1b0ZF5V0y0PFDfelb+5IKri8JI88oMDr1+jmRK3ntOZj+2Yrb5nzteOGaY0WKoR4R8axIrNf8qklWe2SaMtbDPnENbHUy/ah603rzjgY4=
Received: from AM7PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:20b:130::14)
 by DBAPR08MB5702.eurprd08.prod.outlook.com (2603:10a6:10:1a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 11:04:41 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::e9) by AM7PR03CA0004.outlook.office365.com
 (2603:10a6:20b:130::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22 via Frontend
 Transport; Wed, 15 Jun 2022 11:04:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Wed, 15 Jun 2022 11:04:40 +0000
Received: ("Tessian outbound 5b5a41c043d3:v120");
 Wed, 15 Jun 2022 11:04:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a47a2dcc73e0deca
X-CR-MTA-TID: 64aa7808
Received: from 794c0aa5a009.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8A4EA338-AAF1-46E0-9555-10D1EA5B45B5.1;
	Wed, 15 Jun 2022 11:04:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 794c0aa5a009.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 15 Jun 2022 11:04:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqTnm1Dyqnan+Qal0EvScTFk+odTMKtYACcbnE8jdoXafh0VeiUoDu5B1E6/fN8xleTEs/AdpuR/oR2pTxI6035tzgk4sjcPJRHA4iwkO3AAHeiTjWGOl3z8MQC7NX4usapd/kBgawkbL7pRk4HKJIcTRbYUy0vvPzUXB4RP6ipI8ChAxZYKZgZmhUvZ86FpXEHuq07GFJaVXmqOiBltHXOnYI7W6n28RaoGNrY0IdtvpJmXNighKtDHHcNwct1sHh8NUSinX9KIC5pYHu13vp2H7DB1/QYOj204WMBhdDlCb48U3xoFdtPoqARSaQE3w9ZBBz5dJaTF9y+s2mhg2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EHDv1UBWD3Pc1irZwLryMuRXLFQP4yGTkjvSBLo1XM=;
 b=Gllo2sVRFPy+wKgq1d0SGZzM5B1U0xBQhDG7gNHKv/PTNssxRnfvrmGSU3VI75BF6f5lVTQy/lTuxXVII+S6kio7msb4j+bfR7dnobrrT00Rs8LpNaGOJD4gbRkbYBf8OCfJoqw9SpqM3E7gNsJ/oeoOknSX4u7lVAqK4M+XtyAexfxEGwGMQsAyKp3PCx9EJs+T4C2f9iR93rb2epsJTz6NcSvTBlcXJDfOH49KsmNQQHVpcsybrOAik8q6bk+A67JgtM3hNQPWJZQ6WYrb4bqSxWjecBzd1FZ0MAZJcdqt5CQh9PpGeSh7KcnCp7kWGX0vYmucwdjWper/OxjQag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EHDv1UBWD3Pc1irZwLryMuRXLFQP4yGTkjvSBLo1XM=;
 b=V7YhpcOb81NHI7l8oSI+ofntcEG/9P2rY4nN2NBYBm+ZI0Bjmn+n6soEcVtbjN/eZs1b0ZF5V0y0PFDfelb+5IKri8JI88oMDr1+jmRK3ntOZj+2Yrb5nzteOGaY0WKoR4R8axIrNf8qklWe2SaMtbDPnENbHUy/ah603rzjgY4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB4840.eurprd08.prod.outlook.com (2603:10a6:10:dd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17; Wed, 15 Jun
 2022 11:04:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405%3]) with mapi id 15.20.5353.014; Wed, 15 Jun 2022
 11:04:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ptsneves@gmail.com" <ptsneves@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 4/5] oeqa/selftest: Add test for shebang
 overflow
Thread-Topic: [OE-core] [PATCH v2 4/5] oeqa/selftest: Add test for shebang
 overflow
Thread-Index: AQHYeoD+O8EFiLMtakGJXf/kMLTRWK1QWl6A
Date: Wed, 15 Jun 2022 11:04:32 +0000
Message-ID: <6907B2BD-E149-44F0-B5CC-02EBB3882D5B@arm.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220607151123.3588947-1-ptsneves@gmail.com>
 <20220607151123.3588947-4-ptsneves@gmail.com>
In-Reply-To: <20220607151123.3588947-4-ptsneves@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8aa8da49-4488-4098-569f-08da4ebed868
x-ms-traffictypediagnostic: 
	DBBPR08MB4840:EE_|VE1EUR03FT017:EE_|DBAPR08MB5702:EE_
X-Microsoft-Antispam-PRVS: 
	<DBAPR08MB57023D86676FF076658DA49CE8AD9@DBAPR08MB5702.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 A7PhoVJKS9yiU6QjWYnMUHFvRvJxHVJPUukKqam8VDbLqBTm1UPFIjxJFD4F2DmCjWayCKmllmrWMWki0OeUZE18RNBl4vHePP+fkyipTCfG0WXiRPIyzK+ZN5UGzqocLLCrrd0iySYxP38ap0fz6F7wpFtvYlRg4BRWQxnwaOUrrRP8qqQdXsGFkWpPAFq7coVAXpyr20mC32P2Begi7oancqbBBF7kX0mYXlZXPRacMddZ6oImR/Mfde1Mo82u+q9SuBXixyDQM9v0ak+dy1JRSuNUWQdPyxXmthigbt+xhCyZ1bmD05+Mp0QKXNm8brmFJXtrEk2cScrjdG2S8geM1GG2uJksRYrpRYth9QROicAyOAY/reUQLBez4ICz40F/O51WaDedAQJNsv2ePFcirB+TBxum9RxFRiSy26AENNrkCN8EjcVkS4AKwR5DLlfKSUs7BL41PoeP6IIWblml1og3DRf0O1SVCM1LJF6BBY1wEa5dRdp+16etIBr/EGinrRLHXDxWMCiYcrxUXhgJEUBqxiEPdXXlTzYY6pWldt0ytD5xHF/mvDXx9jWJdb+logEbbt51Aa1Hezowcwl15gLS+tSMZ1QQeqhoVCgJIAwOkZdc+PwLzuyoAuuCHIOiSB9NZQ2JwH7o6O9RrXAJ1GXIEaIGh5RqlB5ddYGvuBUD8SLYf0Zbf48aHPguREQyPLt//25w9c0CLnYlj7p4INH4FilqfFeX/4PNPMPFLKnvkdKJ/uhOJRU94Xm7
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66476007)(38100700002)(6916009)(186003)(91956017)(6512007)(38070700005)(76116006)(2616005)(508600001)(83380400001)(122000001)(4744005)(6506007)(4326008)(86362001)(36756003)(66446008)(8676002)(26005)(64756008)(71200400001)(8936002)(2906002)(66556008)(316002)(6486002)(33656002)(5660300002)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <890565865CAD4C4689EFB38B02578E48@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4840
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	118fce56-b2b6-432f-3921-08da4ebed34c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5Vjtd51O7Y/IHYmDw9I66Mu+irKk/5HtwD9+pqAw29pI9VUaR53x5P13t3ri49Cdiq8FXD5LAdFhaid7pJ7e3Dnvhc3VT7CIAOA85PfE3YkpPvV2P8G23YebvNOgmYPB+f+cM3PfcGrmpVO/Dj7miHq+doRAVsVurBfDUyJzhFZFDSFzkrbZgC5xw/hKBF2GNjyWa7QQ77aUpFEf7AwdysVjLipmD1dow6sgPNLBIPRCHHTA/WIcspN61kLqgtK7inWWYr2QH1ML6PGMxl6uZDA+4URwZt1+719Gjc7VMJvmP2+5AhLKrN92605HGwgBSqgroXyXLCW1CagJag2LG+aie6tACa6fuwhQOECSz2Pano3mTD51AE3Ur8cg2RMp2yIvgeab8wfJP05bsZ8hRMqYAhuMHVaQT+QPrXkARLUA1C+JK6wCBQ5jGGr+oqT7JQo6gm/bz5hjm+YbvmRjh+LE5gr2HrLs89rbkBbyHni8VeqPnXCJIqA6NyAoaKf7EwSLt0vaJongtFEa6szmbWmw5NUM52F/If+EyJWihSoi7xmZ1GoDvhX4P+2R1M2tAxQYB1c4GHKtHbOPJ7cG9eHyztneoLeVJ540/Muq9QDKD82qLsdUscuDKP6q/l/RHpJwi+W8zJIj1UCjIs6bbll8DY57zusTsWhh69yGZvpZ2/ODb4UZLl5W5WU7Eizp
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(46966006)(40470700004)(356005)(6506007)(81166007)(86362001)(82310400005)(6512007)(316002)(36756003)(47076005)(336012)(36860700001)(4744005)(2616005)(508600001)(26005)(8936002)(186003)(5660300002)(83380400001)(4326008)(70206006)(70586007)(8676002)(2906002)(33656002)(6862004)(40460700003)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 11:04:40.6722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8aa8da49-4488-4098-569f-08da4ebed868
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 11:04:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166930

> +        expected =3D "maximum shebang size exceeded, the maximum size is=
 128. [shebang-size]"
> +        res =3D bitbake("sysroot-shebang-test-native -c populate_sysroot=
", ignore_status=3DTrue)
> +        self.assertTrue(expected in res.output, msg=3Dres.output)

I err towards paranoia and would also check that res.status !=3D 0.

Ross

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

