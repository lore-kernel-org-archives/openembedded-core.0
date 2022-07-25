Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A32DC43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 08:49:26 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.43])
 by mx.groups.io with SMTP id smtpd.web11.25845.1658738957357571671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 01:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=0EAmEvpj;
 spf=pass (domain: arm.com, ip: 40.107.3.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AoyuVKVzTWX19yD/E+R93oxoj97X2cQthNKbu8+ZhyntewIc2F0ULO4gz3cnEem9mdopLHhhWVQRywzCt1ADtUuksMYE9D6iuXCCjrjDpWmMXSJ04P4Lcekg3qajsFKLj5SAcKixbr3AD8g8jXZwvOhqtds7mHbaC5ZRg/sT/GQy9FuuA670B3SsJmgv8Kn/Mu+yXSPVuzzk8GcyDW1lJZPPWTXFj1h9skEDtaTwtZmJ/0vTM8vURDNuGM39H7e9+wm5myCGghaTOgiJZ+PBBJqSaEvJW9Xa7wll2JOU++JSZEi349TUakyVb/G/O7tcGL/o6cJTDykfln23UyVOfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pldSQFERLKElIScQnE0NFjOVVgxscTWruKwplEo3tXM=;
 b=ksf9s5fgPQ20chNMet/IAvYBuEVn0OdlOqVwLv5G4+nAS5Pzk/g4gflv3wkyyx1Der+DFXiwln+p/huqSDJsnx66duM4NlOosdUwg9WaWC8YK/WPgHTdRCjTE+qOcCiYD/n1K8cyQ5wqz6gApGbECgMPHkJk1ECPR/tw9wRGj9wGXQ0Qy/H1nAzhGeVPHlYhTERDLYiQDqIlS+EuboGAAXAUJt7PMK8zNLiZ6e9KdaK6W57OQbC6Y6UUZkZcpb/LqgzBfCBMGHY88+KR5tfrrWZZUNEUcB/owoyBM/aLM22O1kZf0wqD82k2e2qXllFaCRkGc9AbS5yujdHuYiSC+w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pldSQFERLKElIScQnE0NFjOVVgxscTWruKwplEo3tXM=;
 b=0EAmEvpjDsM4Jcekra3QMT/KKOk/dFCRi/Ck64ckOJQrTlXmk+ib3IPBGucEarPkRaDahv4k42tW4Qi3ihp2O66/ZGX8BVaJc/a/rF4CBiO2ivUlVymzu/6bDPaJkjLtdGCrJ7Q8QyAa4LCuszA702rEuMxrxw0JnUgd65K7KPU=
Received: from DB6PR07CA0051.eurprd07.prod.outlook.com (2603:10a6:6:2a::13) by
 AM7PR08MB5445.eurprd08.prod.outlook.com (2603:10a6:20b:10d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.18; Mon, 25 Jul 2022 08:49:11 +0000
Received: from DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::46) by DB6PR07CA0051.outlook.office365.com
 (2603:10a6:6:2a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Mon, 25 Jul 2022 08:49:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT016.mail.protection.outlook.com (100.127.142.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Mon, 25 Jul 2022 08:49:11 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 25 Jul 2022 08:49:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c256d9325e94734f
X-CR-MTA-TID: 64aa7808
Received: from eef4ed96fd6e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9A96C49-08BE-454C-8D44-0D3E94844FE1.1;
	Mon, 25 Jul 2022 08:49:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 eef4ed96fd6e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 25 Jul 2022 08:49:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJqPvYp2MQnv420KNHzhAiU7pMK4sH40UbOWp+q9AlAjWjEtRxaf27Gxn2bqMRdl+KmkP/iGRdRaYFAUlzTHbsh0V4qmDnbtYluPu7KrLJQyC2QjmU6RM1tWt29EGwOMTJhJ66g0wUQSI94sC53DNz3WDw0cb80182uiIKLvqf5rygGKLjJ/jYMeYKUZ/ZtM3te7LEpQxR0jEXL16XuUpdPzTAn817N+eYTCOLcV7dTZ6CBOkYc3JlrkiIkVPFPt19FMUAPQ5jAeXa/MyCM86SkyfZz2VowTCiiWTOPo5zswjtJT6YtUli5yVqX9zSbhZbhMHX2ODYKRYP7fh46M5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pldSQFERLKElIScQnE0NFjOVVgxscTWruKwplEo3tXM=;
 b=Wux7qNcdl8TZa86yke/LRYbW3vnYa5s7Blqjz/VucTmSOOb0fS1fflRW8+EmN7Ot6ZPrOOsUtCXTTaRMdaZOBQitdKcIU2uEGSARa9tWHPDRbMqPFiJTACVqSXzuJXJ/mWh/QEatltBti5U/2Gljfar5WFkWqbXnzJKpeqfCH4b3ti/EpxKkmRYWLEsA5AcQRK4e9uSS64yjOaQuVozjrIPVMjIzHu2PqPlE3YSW+o5tvhVNnPMRczR9J/AlFJFRNDnnjfmsKiURS4xFB+xWEpgJHVWhMHikDA7ZoollMPoVRLcCMmN/vsjrEQtOEvAV5i1K7SFGRUtZ3JCXvhS8LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pldSQFERLKElIScQnE0NFjOVVgxscTWruKwplEo3tXM=;
 b=0EAmEvpjDsM4Jcekra3QMT/KKOk/dFCRi/Ck64ckOJQrTlXmk+ib3IPBGucEarPkRaDahv4k42tW4Qi3ihp2O66/ZGX8BVaJc/a/rF4CBiO2ivUlVymzu/6bDPaJkjLtdGCrJ7Q8QyAa4LCuszA702rEuMxrxw0JnUgd65K7KPU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR0802MB2368.eurprd08.prod.outlook.com (2603:10a6:800:9d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 08:49:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%8]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 08:49:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Matt Johnston <matt@codeconstruct.com.au>
CC: "daniel@qtec.com" <daniel@qtec.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "dagmcr@gmail.com"
	<dagmcr@gmail.com>, "yi.zhao@windriver.com" <yi.zhao@windriver.com>
Subject: Re: [OE-core][PATCH] dropbear: Enable x11 forwarding
Thread-Topic: [OE-core][PATCH] dropbear: Enable x11 forwarding
Thread-Index: AQHYnHEvvNNAK+Eu1kaZyL2k1c9JAq2IizcAgAXkQ4CAAF5nAA==
Date: Mon, 25 Jul 2022 08:49:01 +0000
Message-ID: <258A1233-0D8F-4A61-B976-AE5D4A1516C5@arm.com>
References: <20220720194416.89631-1-daniel@qtec.com>
 <8B7B30C0-321F-4AB4-9105-894148FC9D9C@arm.com>
 <f8a73d8f5126aab9d1b9b2c145ac6be0edbf0967.camel@codeconstruct.com.au>
In-Reply-To: 
 <f8a73d8f5126aab9d1b9b2c145ac6be0edbf0967.camel@codeconstruct.com.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5fe788a2-60ad-4601-edbe-08da6e1a8b72
x-ms-traffictypediagnostic: 
	VI1PR0802MB2368:EE_|DBAEUR03FT016:EE_|AM7PR08MB5445:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 9YQmslqMM2+ZjS93DhGco6deZ/IwmVHkJFyTxRCFRC9GIgGpaqHO4y2TzXACQEBCWDAM0n0uJMBiHohH6fd5VN61mFti4FMvQEBuP0UjyDr69wCz30dZeqlecQrN6ejm+POb4Wn4Fepuvg4ElOCkUP1DFQu1iTi3emaR4420J9+r01WSC+ZBU4UnpuAmQmytfDvvjFVk2YM5uc1gZwi951FX0/6QQAmrA0wXv37mgmzIoxHkRYh9GMdoSUfNM+rK81NOND94ayt3wgmHOJb2Blt/b1w/nNpvv5YIfjkLKEK65CySlb/BA3D9V6DtFGFfsOCjiwf9I8mi9PNwZjlIHfFqm+k1KUemDogFR+euv9z7yuO0gMXlM2K7WVtyAGStDkF7aLz0dWP1aIbQRIzCmxxd7Oi6NbEdXV6mIiab7d9CRAI+lMDnK1WPdkKK0vzfE9aG+7Q7IQxgFVaBTU0jUmvNyr8iHGv96Eh+vjuseWY3Npowj4J9qJR+8wNCY5yNQ26S3pfAvUGQHVmr4qh0H54UPtyLKnXBO9TSSs3DUMp6XI2RI5f3gjCf+NSEmj8xkhv4kbU8n8qjjnAULjNDfBaFaey+g+TqmcTs9yhp9hkFpaQU4aSikcahq+v6zG69AZVgqHM/ZadZPDcxZo2rpahGCNFYHXhIgGTfYd+HnL8iYOIf8DOkl8EVYDBbu9pifHHThLTzZpN58uBRniy2lOimDJFRqyOkiL/lICTpEKlztX2p69MYsfrLGPH/CCJURvMtPjiSd7wA9v4XYK6kjA8aB0+zlKRrnEt3i/OH6ibvnqiT0mHcOeDkh6mIgT8UmAIttb9V33e95uY/wnCTAg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(122000001)(38070700005)(33656002)(86362001)(38100700002)(8936002)(478600001)(6486002)(5660300002)(4744005)(316002)(66556008)(64756008)(66446008)(54906003)(76116006)(66946007)(71200400001)(6916009)(91956017)(4326008)(2616005)(186003)(41300700001)(2906002)(26005)(53546011)(6512007)(6506007)(36756003)(8676002)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAD4C939A33EE24C8E6C0538B2BF6992@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2368
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	acaaa9e9-e27e-4ae3-bbc2-08da6e1a85a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sgKqvV8ffW1C9i0CQZccnGeQGLFP3A+Gpf84Sgn8b2TYyiiSc5OfUNJTamY0mk47SeTR0GskEuvbW/Acg++Jsi/NMKeTrG7LnZtaRuz22Iw6Y0JXRzO9MRCWNsv+z/njBhMhGnk31F615EBI7Th6TIgQuwY/3e7mwrGSccFOjuA9cvkBJw5fGiYdanotPdOUIRNDXIelQkJydBy7N7HAEJqdR1Vfr3N+drHx79Tt5ba5VSC3XxuSX8OpzzIOMWQb9ls5DsctfRNSFywSR5ss0ogJEITVNum4JCrlJXKuMnZHMZxrH9nGb5XpPVubHmyw8b38dQRUxGgQF5ONuus12jF+2RgaaiDHCybb00qPvgTxF8U3siBfJ1L+i+OcHxLD9+gfPYQhGdT86nHrQJwAYnZ285IJvtW22WhHnqMaGKifK/IPhwtgedhE9jxkaM7MZBNWki6kXNWhF0lH7DzEvjgiU9d0Z8yX8bvd3ERLQehnusF9crezgQQ0p4sC96tSCIxOwOu1CYiAFmQ6ykrDtgTgY95N3b4VviBj6r9qMy9tpnAxrNzHrxgyF3IkfUpmLXGPMXVQ/RGqsvCRg4iENLPQmuVhwegCxOtBw89KqjNq4oVAn/bbYyBCxrE91g3cdUmM7iWRpwtXMbvUITDW2TQk6eoZ94VciVgHb08QPwqjLQag3NKgFN46350rNjNUYcfTXM8+GX0cZeBCcodXbM+pazj6P6d8MWkrF7i+dn91EplgLwcBFBuSFON/BMEXY5Mtfz2VktUA1OrQA5Qbxg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(346002)(46966006)(36840700001)(8936002)(70586007)(8676002)(6862004)(54906003)(82310400005)(70206006)(40480700001)(4326008)(5660300002)(6506007)(86362001)(36860700001)(6512007)(4744005)(2906002)(26005)(82740400003)(33656002)(81166007)(478600001)(6486002)(36756003)(336012)(2616005)(316002)(186003)(41300700001)(47076005)(356005)(107886003)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 08:49:11.3960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5fe788a2-60ad-4601-edbe-08da6e1a8b72
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5445
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 08:49:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168473

T24gMjUgSnVsIDIwMjIsIGF0IDA0OjExLCBNYXR0IEpvaG5zdG9uIDxtYXR0QGNvZGVjb25zdHJ1
Y3QuY29tLmF1PiB3cm90ZToNCj4gVGhlIHVwc3RyZWFtIG1ldGhvZCBmb3IgRHJvcGJlYXIgY29u
ZmlndXJhdGlvbiBpcyAjZGVmaW5lIGVudHJpZXMgaW4gYQ0KPiBsb2NhbG9wdGlvbnMuaCBmaWxl
LiAgZGVmYXVsdF9vcHRpb25zLmggc2hvdWxkIGJlIGxlZnQgdW50b3VjaGVkLiAgQWRkaW5nIGl0
DQo+IHRvIENGTEFHUyBmb3IgY29uZmlndXJlIHdvdWxkIGFsc28gd29yaywgYXMgDQo+IA0KPiAu
L2NvbmZpZ3VyZSBDRkxBR1M9Ii1PcyAtV2FsbCAtRERST1BCRUFSX1gxMUZXRD0x4oCdDQoNClBl
cmZlY3QsIHRoYW5rcyBNYXR0IQ0KDQpSb3NzDQoNCg==

