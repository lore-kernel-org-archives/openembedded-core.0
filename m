Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2D3C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 12:40:35 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web11.43061.1702903228575929154
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 04:40:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ALBJqW7A;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ALBJqW7A;
 spf=pass (domain: arm.com, ip: 40.107.21.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PxgQbG37gLcIYbBBl4gkwHpaVxBo6zNZxy4amPXxzlz/nfKrwFUQReECyKrZXsG1FQKvE4/NF1zXLV1xVOtFu+uZ4RR4iZ2khT//b6vVgtuFVWeoerq/N4BnGGbHnuoLwEheG06ESP+F/2ecRePpn1bfeZSGlA4fc1VJbcI3RaXoEcpkcKIKVY1O+mFl5znLplxkdXBY3UE913b5ne+UMRRe3XGtpcEYGythXB+efWFS+K/PvOF6biQ+1ZtUIo5OAl2JrFzjnOzSGtu/02BKGdADTO6EjVIgGdhw7iywG2eF0DIa/q6FSDvuGD2bHiQGRHTszAbz8uKgcIZqnR5Wpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VT17UNXksKizmz2nUU5h3pGdwFGRVsmnXrVCx5gIN+w=;
 b=BRtDxriyv5/RtnjoIlJ/GBC2hul2M+ncfYrcR9HL/517pCn1iZS4cf8ODLVaPp10HdDTd3W9L8ybMseXFWzGxita/QMW5k3qInBmswPlKn6oMNcV5vNrJp9Bj/vM8kBi3zXt9TriOlwJ6doleeSVsRm6P/e5/b/SC2jqWv50FfCdmWmIzrmwxlir8pJ4Gkf5dH/nmM2atsf2ASMSxGtZuvb68IoXmGqW0l0DbCettaKt+2ZyunE+QlWZPgkr0TESe8zh+l5GpPcz6pEcZsE+OQ+nWbl3Rn+apOxy+vHE0YTf2A9nrzQSaWBYT23zMMVtFOl6lq3UBPGuma1wyVXZpg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT17UNXksKizmz2nUU5h3pGdwFGRVsmnXrVCx5gIN+w=;
 b=ALBJqW7Ak/EiyN2FGSYVnGG6VoURBRCaAO5KOUkDgS/PXXSIDCOXR5V87A+R7RHkdo+MCa/z875hSbX37ekCKR/Qb/OHBi4hkPZRSXSPRAiDPS76NRrfRvf4GEeqidgmZg9fhWxpa2QnwI0kNU3b8gCQ2hV/CvMz/RHmoHRQbhA=
Received: from DB9PR06CA0001.eurprd06.prod.outlook.com (2603:10a6:10:1db::6)
 by PAVPR08MB9724.eurprd08.prod.outlook.com (2603:10a6:102:31f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 12:40:25 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::d0) by DB9PR06CA0001.outlook.office365.com
 (2603:10a6:10:1db::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37 via Frontend
 Transport; Mon, 18 Dec 2023 12:40:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.14 via Frontend Transport; Mon, 18 Dec 2023 12:40:24 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228"); Mon, 18 Dec 2023 12:40:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75a7da5b4a19c02f
X-CR-MTA-TID: 64aa7808
Received: from fc7f5037d1c0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FCF12D8B-7B2E-43B0-BAA2-A9E14F6D2869.1;
	Mon, 18 Dec 2023 12:40:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc7f5037d1c0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 18 Dec 2023 12:40:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UX1nyTXGMlTFBUWq2YR47HBovRCY3DlLQ89vddR0IyAp2h0DBfBQ/3tiM+IJCqRWI86hwGx88Zi8VOEZ9bCwPhZwgw7u4wMjUxH4N83KsiIMDEm5p2XN5G+Um4tDSlukW9hbCv5D+AWxKPLM8TZ2iTQuwTxfQVMl3tdFmAT+3PRAcm87M+StyqvP7w88ARAH/tfOri7VG7nlafVxfdCvVy9jhOXWO87cKYOqp2H30VYS0EPZUtAshPa0+ZLEWRBo5kh/M+T+hkbgyAMcYMKGQjJ1wLDWtyeIfMlbYUcOt/IF5Uqj6Md9wvCgNGVfK6nZkglUA9Ifog+qxyj80Pkg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VT17UNXksKizmz2nUU5h3pGdwFGRVsmnXrVCx5gIN+w=;
 b=NXB2DTEjtWMZ4fDSNNF5sNVwCEBMVvGJCAT7HXCSK8ZRvuNzI+x0kxSL+xf+Uz0iwUVu81SQUdTpEMZx/iibwykiH/mvOhSszR9inOtesgCzKxeAZ7d/BU3yRQghn7Qo1mugS0nDez2CU3IC60Q0S9bspgeTfVozs/2O8EpMd9MlUylApJn04aA+yvetn3lBgWweFV1dL1DQ0g6DHe4PY0qR7SE9hxQBKAIfU1o3twfMR0kDilsGzZ7q/j6s7WPbd5Cg7gdt4KrQWquHZ+Jb7b7/EZP2mnlZQGYxJbS6PC3NEbdZyYXFL2xqAHmRpVqhXpsLt9dNrlzEtZjyvc4Rng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT17UNXksKizmz2nUU5h3pGdwFGRVsmnXrVCx5gIN+w=;
 b=ALBJqW7Ak/EiyN2FGSYVnGG6VoURBRCaAO5KOUkDgS/PXXSIDCOXR5V87A+R7RHkdo+MCa/z875hSbX37ekCKR/Qb/OHBi4hkPZRSXSPRAiDPS76NRrfRvf4GEeqidgmZg9fhWxpa2QnwI0kNU3b8gCQ2hV/CvMz/RHmoHRQbhA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6428.eurprd08.prod.outlook.com (2603:10a6:10:263::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 12:40:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 12:40:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mattwood2000@gmail.com" <mattwood2000@gmail.com>
CC: Tim Orling <ticotimo@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] mdns on musl
Thread-Topic: [OE-core] mdns on musl
Thread-Index: AQHaMELapAoV3MvYqEum2LE0EtX1CbCsWM8AgAAHTQCAABD1gIACjQwA
Date: Mon, 18 Dec 2023 12:40:12 +0000
Message-ID: <03E28F39-0599-4CBC-ABB8-BAF5732E8A53@arm.com>
References: 
 <CADjezmaJ2RDnRc0S34iMMrY+-Ey2zqZ59s_qLXGYBCJu5art5Q@mail.gmail.com>
 <CAMKF1souVOjHqkd15+FX3NMGvggFFrhhR9nGs-BN53Y=yzYbSw@mail.gmail.com>
 <CANx9H-Cts0d7vRqaKSW4rPk__4=iEOG7pffaoUQBFn6mWDfWwQ@mail.gmail.com>
 <81df8e01-1431-4a9d-b478-4256f70fd555@gmail.com>
In-Reply-To: <81df8e01-1431-4a9d-b478-4256f70fd555@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6428:EE_|DU6PEPF00009527:EE_|PAVPR08MB9724:EE_
X-MS-Office365-Filtering-Correlation-Id: 411a8219-2b64-4683-e0f2-08dbffc6819e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0eQLe0vLhMg9ENrc+MqTktXkXgqzGz1pt2rePRFppKDwg1/26TZstFP84viIbTEc6Lmz/a9TMRo42aLM5r4yJtNftavoV8HK/pS0/TV3pFIL2vlAgye2zHfzoKNx0bvHQcbKi0/Ul5M+4UBfyCSz8ECpdPa+wXBnG1GClA9X+yVRcmASRCkzGWfOA+az6n4GaZYTuR8NlHIv5GpJTe0ZaDq/JtSaP1OpeEYN9sxPvHQ6MLkJvWqqk73+uLcTVEZRJ0VDo2Mopahb9rd8oWpWapbvvhyYkx1Ot2K1o/TusdSRN11cA8qif2f7xUKT4Ov/XB6KjD56lXjNLVw0BnA2zflpYXp2uz57USJCJKVHB1Bt5rma9HepzHZ/CtoUh0Ta3nDVUaz9VsH/LCEw8zjVA0Sx5lzgov71lmCEWH/c1jf2iyySidoFFBr37cHE2r+5aVOr4sX2/bGBVKDDmdqLMqjzHKFqPSnC6uMDHWxA9HnJK422lW1VwwCtkzpR7RMj2nRADGtokfVl7ZHv3gxVMXnC/VtK5Qx5NLA7zl9KvooiBrjua+vK6yOEYmIqz0lpXSXn/3aA6mPqz6IwbQTuLlWghZ7+S0QanjW6b1A/r34ye5onTLEkPOf4tD+NXxH0oTAzB1kEVFWTOlA+I4Jnmw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(396003)(376002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(38070700009)(122000001)(38100700002)(2906002)(4744005)(86362001)(66556008)(33656002)(2616005)(26005)(71200400001)(53546011)(6506007)(6512007)(5660300002)(966005)(91956017)(6486002)(41300700001)(36756003)(316002)(6916009)(478600001)(66446008)(66476007)(64756008)(54906003)(76116006)(8936002)(8676002)(66946007)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3555E016DA24DC409CCE5B73A48B1872@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6428
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	784f6429-7e36-42bb-7a5a-08dbffc67a7c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cTaFStX54r02ng1MV2+4WXG8yx7U8XNOcpccUvCGWyb4wxj/L3rC6V34RzZUnii5gzK5HBlrUbo4an4db5dfHE5ANicpgCqlFmSdUw0SUrgjXcWg5SCGvWhJXiuTNF1R+Z5c3dwhC5ylcf4y/4A0PBmSHBCocDjQQgZIeFGNGGDU44NrDaH0p30DhJe0Kp6NElvGE9G2z07YGqG34hTaXI2auuvlgsGaW69SIgGkRQ0+cJNA45YO7Mxe0miRAoMmMiidaN20BN3xvFQx0R5/rBQqmmtu9gIWADA5JmfBSAtx/WN7UV+4eH6QiKr750uTCdB0kpD3mYRV1FyKlnf5y/IVxa1AvdQPjbzGIH7SbT+iirDOZj1BsBQaEKpxBI2pcPPk2pWNr9H/hcB8qulWlnEqmehwjEaq0KkguBK4qg4QOdV8BUWNGL3gKRSW+iUKMWS9Nm+j13QXvRbOu3w3RpCkpVNeUNdkf1iFnf/T2qeig/NAaRp/iDJ3s0INyUpVpmDVdWP0yqFTvcwtbh5pRAq42h4eEVNe3/brJtSY7GKGlnodwOCIdNgG99FpUpyp4HmYqxwSEMi4ckOnffh+XNTuWQgDXmWPhnmTaJ3BWANUq4WEHUcoKWV6SAVqIad7rVyNeloR2BF9jVvm40eZ++UgoocxFLB61aVbjkPAmSCu1PZdBktMmYkCDjDIZSqVvcWUwnHLrJ+oBkAv6gIXGysRUTWWdLtaXCtAB/Z+YCI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799012)(40470700004)(46966006)(36840700001)(70206006)(4744005)(2906002)(36860700001)(5660300002)(41300700001)(36756003)(86362001)(33656002)(82740400003)(356005)(81166007)(70586007)(336012)(26005)(40480700001)(6486002)(966005)(2616005)(316002)(54906003)(478600001)(53546011)(6506007)(6512007)(40460700003)(4326008)(8936002)(8676002)(6862004)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 12:40:24.6337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 411a8219-2b64-4683-e0f2-08dbffc6819e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9724
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 12:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192639

T24gMTYgRGVjIDIwMjMsIGF0IDIxOjQyLCBNYXR0IFdvb2QgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPG1hdHR3b29kMjAwMD1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IA0KPiBUaGlzIGlzIGEgZnVuZGFtZW50YWwgaXNzdWUgd2l0aCBtdXNsOg0KPiBodHRw
czovL3dpa2kubXVzbC1saWJjLm9yZy9mdXR1cmUtaWRlYXMNCj4gDQo+IEkgdGhvdWdodCB0aGVy
ZSB3YXMgYSBzb2x1dGlvbiB1c2luZyB0aGUgbWRucyBwYWNrYWdlIChtRE5TUmVzcG9uZGVyIGZy
b20gQXBwbGUpLCBidXQgSSBjb3VsZCBiZSBtaXNpbnRlcnByZXRpbmcgd2hhdCBJIGhhdmUgcmVh
ZC4NCg0KVGhhdCBkb2VzbuKAmXQgc29sdmUgdGhlIOKAnGhvdyBkb2VzIHRoZSBsaWJjIGxvb2sg
dXAgbUROUyBuYW1lc+KAnSBwcm9ibGVtLg0KDQo+IEkgc2F3IGEgZ28gaW1wbGVtZW50YXRpb24g
b2YgYXZhaGkyZG5zLCBidXQgdGhpcyBpcyBmb3IgYW4gaW5pdHJhbWZzIHNvIHRyeWluZyB0byBr
ZWVwIHRoaW5ncyBzbWFsbC4NCj4gSSdsbCBrZWVwIGxvb2tpbmcgYXJvdW5kIGJ1dCBpZiBhbnlv
bmUgZWxzZSBoYXMgYW55IHN1Z2dlc3Rpb25zIEknZCBhcHByZWNpYXRlIGl0Lg0KDQpJZiB5b3Ug
d2FudCB0byBzdGljayB3aXRoIG11c2wgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHlvdSBuZWVk
IGEgRE5TIHRvIG1ETlMgYnJpZGdlLCBzbyB0aGF0IGF2YWhpMmRucyBicmlkZ2UgaXMgbGlrZWx5
IHRoZSBiZXN0IHNvbHV0aW9uLg0KDQpDYW4geW91IGdldCBhd2F5IHdpdGggbm90IGhhdmluZyBt
RE5TIGluc2lkZSB0aGUgaW5pdHJhbWZzPw0KDQpSb3Nz

