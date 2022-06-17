Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AE4C43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 14:08:31 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.63])
 by mx.groups.io with SMTP id smtpd.web09.31018.1655474909131761640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 07:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=8kFbtctH;
 spf=pass (domain: arm.com, ip: 40.107.0.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hPTO+PTcd6tNv198Koq/IxkZTak+KwROC6rnqWe7lYxK7kmHAcXYZvkiOEf6jm1hzZqarHynNMR14+NnPi/RE1BelnrZV6cqDLqf5mdgulozXFTcZWEIHNf2HzC18ayI5ER/6L1BjTD4koQOs2oCOGGyhjpJHf/BHqSCHyhVFnixtX17/zy8FJTEz7duIhetEPY61900v28r1353ldhaYe8x8ltIefT6DcVB7SR76Yd6EVW1B4SBKwOx+eaZtfzoqGV6D5ciUPyAzKNGAPF6BwxO6mqhowtLaaHC2Ws2NHdSNTjZXpv/DUqVeRkWlOOkC3KFO/nmVYmfTm9yBRNudw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K20Qx4skqa8xwkO7KpyllWaydZqJmcPTjACcZ58p84=;
 b=VYFfO6LwLayVT418LbXO/bbM85XpY743TUI2JycQyYY1fKFjtIDy82OwpKvclTj/3+eeirtOt3tEoB3C5BG+tpaAgrzSg10lTdLEcxlLHPiVIEiWvELrKtoh7mjIySagikeX1scC+KDftryMdgTCbBYI1mlrrAEd/aeko3LeAQnQtbl3hV+YA2e+F/atJq7z+DqMlSAzJmAoh1R16ZX/fuMP711Bpi6kHyE7D46yA95N0bXZT77zgD+3SrACS5K3/lMMwo212YGdBfr4yW0pjXKra/1OnyMxljPLrAxJePQeXtcHSED1ZQXLxI0Y4Bxbu40El/VLIoQaZM6QBUVurg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K20Qx4skqa8xwkO7KpyllWaydZqJmcPTjACcZ58p84=;
 b=8kFbtctHqPV6I34D74fBINdKKbPHCIR4PcT81WCNGZvQQFRTVZDZSveZS7fQ5uThtNGRhq05mfqqZV2hcOUFeP6sKDlMSXqXqVT/2q3GSl+SLcSlWUU6AkBLIVmXA37s0raQzqezP+QAaW+ytSPOwJiAYUV1YAWFdPOB+kZ0hW0=
Received: from DU2PR04CA0224.eurprd04.prod.outlook.com (2603:10a6:10:2b1::19)
 by VE1PR08MB5680.eurprd08.prod.outlook.com (2603:10a6:800:1a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 14:08:25 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::d5) by DU2PR04CA0224.outlook.office365.com
 (2603:10a6:10:2b1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Fri, 17 Jun 2022 14:08:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 14:08:24 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Fri, 17 Jun 2022 14:08:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef73057030a51222
X-CR-MTA-TID: 64aa7808
Received: from cf611ba5772f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 05ADA61E-674D-4078-9BF5-63B3E7D980F6.1;
	Fri, 17 Jun 2022 14:08:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 cf611ba5772f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 17 Jun 2022 14:08:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bm4ck7Jw0EylWU6zavICqgL8uiq7rMhbQWcAvtMCw3QLsUvoQN0za/PtX+eMoPpAaEyFKKnRxZkX9deNONbo5YY9C5+2uv1ztzwWqtbZYWOmJ1DMA+ZMwcdze8M7/3L4mn9aDdnYLxcPCA1bmUVdOPy8BC64SgaGEIbS5Gqk0pDrH97Vw2iUXR5W3SHyGT2n6Mxm9bYgEJwAJKIN8MYNt4ZOCXILxjgPAqt9lJJNBjJwPcG9sFhCT2rc6Egr9ptnOR5yLuT2Zna0qAGs0bwxJFtflesrr+hMBgplYTTAm3gK6z6/pTHxCeQB/8SVz8IIk3xag2CRHuh4jCP8EpLMZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K20Qx4skqa8xwkO7KpyllWaydZqJmcPTjACcZ58p84=;
 b=e6W2ITIRP6p5ZIDwX9TWEuvtxU8g+2ez9qG7cSre8POZk83CY0P9ddsYD2hT4Gw/gsWp7TLodXroYcv8qM4NQswPyFBezjwzZtiaRvbtANHDySbejaZ9crh0TU8Vxpi58xoSC4H69kFhWsizLEyBNtKiuqrg98yYxXDPU0fwh7ldquMYzigKK0cBTZ+a0S8HPIxAMLmhuKz3dLubMKmj3Qc68RTaRjVOTmqMoTikLxuqBuzJB4sEQ3E4ZaMwrPSZ7Fg06B7Q89bliimWwAVaecve5lu7JY6ve63Z+caEfaNPBQdJRdxmKJS9iIbOBoPAPvEg7lQtpT4vW4P+4NphLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K20Qx4skqa8xwkO7KpyllWaydZqJmcPTjACcZ58p84=;
 b=8kFbtctHqPV6I34D74fBINdKKbPHCIR4PcT81WCNGZvQQFRTVZDZSveZS7fQ5uThtNGRhq05mfqqZV2hcOUFeP6sKDlMSXqXqVT/2q3GSl+SLcSlWUU6AkBLIVmXA37s0raQzqezP+QAaW+ytSPOwJiAYUV1YAWFdPOB+kZ0hW0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8226.eurprd08.prod.outlook.com (2603:10a6:10:39e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 17 Jun
 2022 14:08:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405%3]) with mapi id 15.20.5353.014; Fri, 17 Jun 2022
 14:08:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-exceptiongroup : add recipe
Thread-Topic: [OE-core] [PATCH] python3-exceptiongroup : add recipe
Thread-Index: AQHYghMg08BgYn0ItUqdFkb/PcMWXa1TozoA
Date: Fri, 17 Jun 2022 14:08:16 +0000
Message-ID: <CFF4FA2F-95E9-4B9F-8305-C4AF78F5CD13@arm.com>
References: <1655447108-20329-1-git-send-email-wangmy@fujitsu.com>
 <1655447108-20329-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1655447108-20329-2-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 489c226b-e1cd-4548-15b9-08da506ad804
x-ms-traffictypediagnostic: 
	DB9PR08MB8226:EE_|DBAEUR03FT049:EE_|VE1PR08MB5680:EE_
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB5680E7F24A0D8AAC9F9DE526E8AF9@VE1PR08MB5680.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hu7jLYc+f9DbSK2O8MBY0r4iP/W4Sk40f6ZX52ExJh7eGjDG25oJJUkgEc4l5xZrMSkSV9mnCfjCZwUt8uZKVxvVqt9j0xke1RUDj5pvVxRyc9BxKaglAoKMeDhhKo1Ug0y/88cWYd83TGTJtSitgpPZ1SZ9vHQOMKIOknIYqFu9UnhspraoSKyz48TQQXXsW/dSm5E/18n1+0UpNsT6RKivwAj5uEFMAyJ68868Gl3uzTpgXuttXjIebinq52GVBfy8HYWk4OClb73y7k8hTtPl+YSOImWYWrYKumdI0/B900N+sIlP8kvTNs2nEzEyCLfFkYAO5PFfVYQdLOpM4AmQTq114kEXFeedjbq/kgAvLbcLcgAzCLEUd0s5bT21UmfExa7FrufBpSHaKx/Mfk9lIci7jyQrj/IIIyklm0l6n/MtYSGpr5CfqiZ6pznHdqDrHWLIcmqNavaudB40pmqGrqT//F1WURywmRCrrXnesIvi6sYkUnqgauuJ37DtwsU//CDvQiOrBP6oKreLyuslvPVsPaqctu39Iq2KFPoAufaNNnqnmmv3cYPrtr9upR/nEreRNr1yhIk2ZMqxQ1njWlxVUPfAfhBRVmYWVOD3VDnX/Ie5+m5fQ0onMl8oA+yuNf+C5IfeXysyZ3de2f2Ram5EcERgG87h0ludSXgs7Sm37xVphFmY9Uh2Zpc0sLdNMs77b/NHhD0d7nAKzAiMlKkYsrc2m/KYE2T0pac=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(5660300002)(4744005)(36756003)(2906002)(33656002)(6512007)(86362001)(122000001)(38070700005)(26005)(38100700002)(6506007)(66446008)(8676002)(66476007)(71200400001)(6486002)(2616005)(6916009)(498600001)(316002)(91956017)(4326008)(186003)(66556008)(64756008)(66946007)(76116006)(8936002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFB3CE5AC1D06F419545A2018A3FFC2C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8226
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4f393abb-cda6-43b8-c02a-08da506ad337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bcX8nqxJMgB5zHBBNLrkZs4OIN8dDsFIgGDP/3fp3DhjslDsuNFRphd/QabXrSYQn9hrm6I2P/HCF2nRSpdb3bVgqef8VO9IMHn2ERG/RO2QZWLfn+YZUBPZd9tWdkrVLx+Ym5/dncDBsqr/Y0ZRqeA7MnGB3HZQ6uD/3ZDFvdYXVsMscLG9Vz/D3RhhRvTGW3rCsBesPkRUdm4Y1XGaw1E2LQS9xnmM5UQ4Rvd9EWkxNae3MRsaFSx4nMzFKf6izMeCZ2gIoSjfyH8p9k1drOLDiNmvzioPNOWIlWCkjA5AP33PkGoloscgGYscbpFz1jwBcdl63ilS1pwhCINjLgIDWOcBmIh0hIO+MwIl0ojanlkVe6yQhkAc1TKq6N0Uz42h2biJ19N3zrsFniyIWIbqiVGun+reHe4or1gomENNviQHPkHQcvpxIZokWR3JgDM97aH4GdgVOhCufBohLQcqJKcCqM8BLueScd/A1TQKs1Hvt9UXbjQ42MYV238ZLcEDz9zt6AWdhpFNuI8DN9LPLihqG6Y0a+/CtfEIhQsg6Abz5SsJeltvJfcS7Ot9YM0b5jlMc+0ZeOCk8FSvJU+GGTP4bg3fEvcPeCf299XwqBnkfoEO8Wnf/rwGaTzKsNF4xvnmLK/JvS/eZD0VRGMRGgwO6j3cfJBa17dZeI/E0ueqc4mnSCHuGwET3DAR
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(40470700004)(46966006)(81166007)(6512007)(83380400001)(26005)(40460700003)(186003)(2616005)(36860700001)(336012)(356005)(86362001)(8936002)(5660300002)(316002)(8676002)(4326008)(47076005)(6862004)(33656002)(498600001)(36756003)(70586007)(70206006)(82310400005)(4744005)(6506007)(2906002)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 14:08:24.7248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 489c226b-e1cd-4548-15b9-08da506ad804
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5680
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 14:08:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167025

DQo+ICsjUkRFUEVORFM6JHtQTn0gKz0gInB5dGhvbjMtcHJvZmlsZSBweXRob24zLWxvZ2dpbmfi
gJ0NCg0KUmVtb3ZlIHRoZSBsaW5lIGVudGlyZWx5IG9yIHJlbW92ZSB0aGUgY29tbWVudCwgYnV0
IGRvbuKAmXQgaGF2ZSBjb21tZW50ZWQtb3V0IGxpbmVzIGluIHJlY2lwZXMuDQoNClJvc3MNCg0K
SU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRh
Y2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5
b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5k
ZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90
aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUg
aW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K

