Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6ACDC54E94
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 13:30:09 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.82])
 by mx.groups.io with SMTP id smtpd.web11.42277.1674480602088316615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 05:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xhiZ+mBd;
 spf=pass (domain: arm.com, ip: 40.107.13.82, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux1Sxh63hfZoBnLYk/Xz3M0MepRWwPUdMhOwZp1AFyo=;
 b=xhiZ+mBdJmYH04S1Y7g4BqkxuA0il9ov8e7axCRRf8u1n4FgR07L77D8U6nnABRqAwSDLDtR3nRFYqZUlb3GR7VJWFBDBfKHerJmLV2z6qfOC+epz4aP3QA6S1UQ58PiFf4ajuWEBxZXvn3IaUT967mCbIhJ73k2TPSfsiLQstE=
Received: from AS9P251CA0020.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::25)
 by AS8PR08MB6469.eurprd08.prod.outlook.com (2603:10a6:20b:33c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 13:29:52 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::6c) by AS9P251CA0020.outlook.office365.com
 (2603:10a6:20b:50f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 13:29:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6023.16 via Frontend Transport; Mon, 23 Jan 2023 13:29:52 +0000
Received: ("Tessian outbound 43b0faad5a68:v132"); Mon, 23 Jan 2023 13:29:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 40cd07e7fdbab43d
X-CR-MTA-TID: 64aa7808
Received: from ee21585c8679.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 16F54962-B79B-4804-9207-28F57FC5819E.1;
	Mon, 23 Jan 2023 13:29:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee21585c8679.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Jan 2023 13:29:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGmQG5+2qcgJCi9xlZxZJZ678jR3VvVlHStpaVhaUHaiDjyqIgvUimO8JZb700HSR5qCEMcu7Ti/uA3+LCy+iadpNbyDH0KG2TTixO378MLXMT6wRhn/h35cp08ptWcKnbVIWC2lX+a30NOAXTvIoRiIUJ4l4QaBqIg0g3iKprrRMkd0r1/Hf8LEwKM/4MIPD7E/lNw8NFGGzWBMfck21lSIgDN5yefl6SXcr/5pA4kFlMkVGP0cLpLgF0UApTpv1O+vM8rQgt4oP2Xm428/kGB+6ENqv1tRtYnD9oai3MXIub1rY8cv8DJntiflk6iE/o0KQKpd8KOcnv12bxvN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ux1Sxh63hfZoBnLYk/Xz3M0MepRWwPUdMhOwZp1AFyo=;
 b=f1nn58c3qWF3oHJ/g1mNEKY12NVLNftkU8COP3wls4tk4VtzD6U7bSucoSw+ceCht1QJ4YGp04a/jgqDFRHh7i/8VPYhtdcwQEzSupQ7H0EfEzO8PFrQhPeEwh/tm92T2Vi7QfMM+IHNm1pMgMZ7E1jeWjeKA//h7zm+nNv4IjDyvRItthT1PMb+25izFeUGTxPFEFw240Hjr/x/jXACHuMuafynZzWGsUSBI0uNDGTrBZePcz6K5CuoU9jFp0KWYKm4bweYCKBv9CndvAVZ72+p1VjGNXCl//HPOQrpWHLfdzHp8fzYAD3BYggAcg4QAOIyYsf/iQWjZdMWApkNsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux1Sxh63hfZoBnLYk/Xz3M0MepRWwPUdMhOwZp1AFyo=;
 b=xhiZ+mBdJmYH04S1Y7g4BqkxuA0il9ov8e7axCRRf8u1n4FgR07L77D8U6nnABRqAwSDLDtR3nRFYqZUlb3GR7VJWFBDBfKHerJmLV2z6qfOC+epz4aP3QA6S1UQ58PiFf4ajuWEBxZXvn3IaUT967mCbIhJ73k2TPSfsiLQstE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB6221.eurprd08.prod.outlook.com (2603:10a6:102:ed::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 13:29:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 13:29:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "steve@sakoman.com" <steve@sakoman.com>, OE-core
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 22 Jan 2023 02:00:01 AM HST
Thread-Topic: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 22 Jan 2023 02:00:01 AM HST
Thread-Index: AQHZLlm7q63XVIZ6802lIPUPSnx4ra6r8uQAgAAAvoCAAA0agA==
Date: Mon, 23 Jan 2023 13:29:41 +0000
Message-ID: <37CCF635-CA4E-4300-A49C-0F31D9472B6A@arm.com>
References: <20230122120427.D9CF696035B@nuc.router0800d9.com>
 <D5C2125C-6245-4E41-9029-6EF99E4AE623@arm.com>
 <CANNYZj-mtOntD4NcfMKd4j5jqzCN6sP_OFrGdVWWBv8ug93=Yw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-mtOntD4NcfMKd4j5jqzCN6sP_OFrGdVWWBv8ug93=Yw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB6221:EE_|AM7EUR03FT036:EE_|AS8PR08MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 12dbd7e1-4fd3-4374-bff1-08dafd45e8b1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 XDtwNpeKHeTxIW6T64vzUyezfkLB0HEAqrZdplr9DYvsg17yvLFphtmboc6YDwD2OrsGXeOtFZC31ArzcWuvC8Et83YOgG89A8lIOsEt8PrhRohFmYcCXrzvOCrljNqhxh6SfVNBBXZ8J3FS3/Rq1vU2cGD6TeLc4SGkyFf0cZ3I3vVr7KTyhA1/uNYc4YIWzhtBYU6hvbeQrGE+pzXxGHuojcqu9gPZTyB7b3CbMvG1eFKGjy3Mvy6ObLz606W6un0jukqVhr/+eGM/9yBWTNktVB2Xg9vBmi4FQ0Q4suxE4UwlrzFZwUqkU15ubG1hrZ+jdURYiSAa802seLqZi1y5HUob7NI0lAeW7KJnmaveG4tO2GUauSjwLHaKbYQcNYAp31hzLSMeRG+HVpTI3lX7EnqnLtof16EYhq0I688waB8LWCEDaX57p6widBh5N2lkvNMUj0edFgIYaMLdQvUy5QXhCLP8HufNH2FvlcagabxYXGrbak02SKleWLh1O74UYPOkDFtNGJGebhjs7p8EjEGF0WYUx5D55anRIYVUZKZ9Xe3UAKFUT5Ni7/jFQ2CbVb78BYCxT/GbtNUgos5ZBsrz1AT9IFmnzep+oLMITz1SBRdJgf31wProhRKhRc/GyY/H8WpLrjjz03OR/21xRXPgl4PEbQrZH9kuLsKE8BV9MJJPfxVaJ1sM8X/ytK4+HT9Kg7vAq/coYhvHIazxL3pVzjUTSRpdfClv7l1CeC8ZY4EhhSKWSolN8S0U
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199015)(122000001)(38100700002)(33656002)(36756003)(478600001)(38070700005)(86362001)(316002)(54906003)(6486002)(66476007)(66446008)(64756008)(66556008)(8676002)(66946007)(76116006)(6916009)(966005)(4326008)(91956017)(2616005)(71200400001)(53546011)(15650500001)(2906002)(6506007)(6512007)(26005)(186003)(83380400001)(41300700001)(4744005)(5660300002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8B57A03D47C4849ABADC4407BDBA8A8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6221
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3fc2c710-9708-4f30-4700-08dafd45e25f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cgRMqYAS2FC9f+v7yDss8B05qjg8Kms1h6U0VnNkImgpAeI2fg6W3BKtrpXTh3B/JPeADHyZZigDV7/l0IosmTB8zngnvstG64Qwx/RcfanUSNqCkXoZKQwTEZi405ZMzgiKysFUKDya+nURiVqlnSSmoPvgJn9xNHX3IEtxorZyNTppm/H9RIGlwkskBOFJ7mlUhcW41StTnNjDYNTzqoJGQhhK7G3D6GAjld9Qv27WbIBbWh5m7dCL1jj+TzuPRViWqPh4vVofOTtuc4ZfujvHWRfX7cqXqBuk0fReEwyMeSciODxROw/nfa4cEk5qygJNYTFJ2g8HUVXoU9L+lGPlQBBOLPmIw0+7+k6LPznsTSIDY9BguRExKE8lB99/ZxVE9Symuw9tiGZVcnAOxIPEy2y9GBeayTOM6qUs7jeB1yHVbhk1KsZDfbfqm5WOFICLEk+uivFRrqJlTV9NtlO9b9jvY/UlbLPUuIiRkv4MerCZ08W0oGYuZtevb8LRacmCokbWkbSiMJ1uglj5i3GJPacUjDjj0rBJiJQSoHeK/n9F00jS6LudBnnAQ3En8lSILfEvvdQpknlHrOSRHRX0Xt3UsY/zqNXH7DYYcW3Df8LP2QXbOY2Ztja9IzOc+VS7kT15s0ZTC1PKnrecnz6QEnwv6buDswb8R36hRt1XcnNTsEh0Vog/DwswUdeb
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(46966006)(36840700001)(83380400001)(47076005)(36860700001)(8676002)(186003)(107886003)(478600001)(53546011)(26005)(6506007)(6512007)(2616005)(336012)(82740400003)(81166007)(356005)(86362001)(40480700001)(8936002)(6862004)(5660300002)(15650500001)(2906002)(4744005)(82310400005)(70586007)(41300700001)(70206006)(4326008)(316002)(966005)(6486002)(54906003)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 13:29:52.4255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12dbd7e1-4fd3-4374-bff1-08dafd45e8b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6469
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 13:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176306

T24gMjMgSmFuIDIwMjMsIGF0IDEyOjQyLCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIDIzIEphbiAyMDIzIGF0IDEzOjQwLCBS
b3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+Pj4gQ1ZFLTIwMjItMzU1
MCAoQ1ZTUzM6IDguOCBISUdIKTogeHNlcnZlci14b3JnIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdv
di92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMi0zNTUwICoNCj4+PiBDVkUtMjAyMi0z
NTUxIChDVlNTMzogNi41IE1FRElVTSk6IHhzZXJ2ZXIteG9yZyBodHRwczovL3dlYi5udmQubmlz
dC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjItMzU1MSAqDQo+PiANCj4+IFRo
ZXNlIGFyZSBmaXhlZCBpbiB4c2VydmVyLW9yZyAyMS4xLjYsIEnigJl2ZSBtYWlsZWQgdG8gZ2V0
IHRoZSBDUEUgdXBkYXRlZC4NCj4gDQo+IFRoaXMgaXMgcXVpdGUgb2Z0ZW4gdGhlIGNhc2UsIHBl
cmhhcHMgdGhvc2Ugd2Vla2x5IHJlcG9ydHMgY291bGQNCj4gaW5jbHVkZSBhIHBvaW50ZXIgb24g
aG93IHRvIGRvIHRoYXQ/DQoNCkkgZ3Vlc3Mgd2hpbHN0IHRoZSBDVkUgdHJpYWdlIHByb2Nlc3Mg
aXMgYWN0dWFsbHkgcXVpdGUgc2ltcGxlLCB0aGVyZeKAmXMgYSBmZXcgbm9uLW9idmlvdXMgc3Rl
cHMuDQoNCknigJl2ZSBzdGFydGVkIGJyYWluZHVtcGluZyBpbnRvIGh0dHBzOi8vd2lraS55b2N0
b3Byb2plY3Qub3JnL3dpa2kvQ1ZFX1RyaWFnZSwgd2hlbiBpdOKAmXMgZXhwYW5kZWQgYW5kIGNv
bXBsZXRlIHdlIGNhbiBsaW5rIHRvIGl0LiBPciBtYXliZSB3ZSBzaG91bGQganVzdCBzdGFydCBh
IE1haW50YWluZXJzIGJvb2sgaW4gdGhlIGRvY3VtZW50YXRpb24/DQoNClJvc3M=

