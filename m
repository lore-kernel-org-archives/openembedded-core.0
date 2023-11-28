Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9667C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 17:55:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.59])
 by mx.groups.io with SMTP id smtpd.web10.40511.1701194145669537580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 09:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aPiLADit;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aPiLADit;
 spf=pass (domain: arm.com, ip: 40.107.22.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fyPZLBqafkQ39j+jCYSZjQ8ne1n8IN0cqEq+nq7cbJ/S9VVVVHuF+nczZIncu2zTGGKRHHCdX76TxGRUpoFJFMJIN6qBS8PaEnpnHyz/5mLnHrw6/8H+ZuL8wp8+s6NJ18WhDYhFJBv9ogBVEahPcJfl5j9MzE6kylQe6kTFNqvxIKsfOTeVxT2Gbgx2dGf74uVdFn1a3NbNRlVnGtcL4vhT/RkuTIGYBhs5Wp6loBC56iw/afoJCUeb4lS51U3fHvIS8mamlH89gX8Gb0bfJj5S+V1Wm8YWeyJyY75h2vkPqkBArxxcZ3Jwo/N6L4uGknIQUQ/++54ipD84zBqNzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VijBWLp6SIFoR72qiaQB7UiSS7cjVZgF5zPDKCJu5Lw=;
 b=Ms826kThBT8dhbxEnLlegYNwAGa54nCbRMRNE94KMWnbxIFHNAqB6huBEAeJC2Ua55T2kUrinbM55kFZ16u/P/TaEwhMtYm+7HV4Te1+ywEVAGJEatMkOZHfrnxV8iLxg5fvbpwQgb5HCw5ND0xzcC5dFFe1U6sLVLAu6Mj11zafv745O6Arsk/7RHh38WvT+ak2sGPOTFEiv7hBbHE3lKK/e4nlv7H9gTFxY5SRou8jixPqFu2Z9W9dF5IW5nv/PzRS3FwMnO0RL5m3SEeu3CbutLPuUPTJYAA1vPGDnmcPMYfbOPHlvYewwGRe5U+2t7EzSIibCBLrxJD4HcOLDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VijBWLp6SIFoR72qiaQB7UiSS7cjVZgF5zPDKCJu5Lw=;
 b=aPiLADit2Qv26CGgZjCxn/Fmmr/CgmAObTAFsizBxsHIfaJfMD6Zzy3LXmv96lG1ZESHslNNrH2KhAgavNhTgYW85m8LoqlmF9ZDyZp6sbn3vkY5oMWw1+MVWJVVo9sT52cx1jdWGW8aDK1MTZhNTzHgBJJB633CMgRmd9rRrYc=
Received: from DB3PR06CA0035.eurprd06.prod.outlook.com (2603:10a6:8:1::48) by
 PA6PR08MB10566.eurprd08.prod.outlook.com (2603:10a6:102:3c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 17:55:38 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::ad) by DB3PR06CA0035.outlook.office365.com
 (2603:10a6:8:1::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Tue, 28 Nov 2023 17:55:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 17:55:38 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Tue, 28 Nov 2023 17:55:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: afa4eb64498cc9f9
X-CR-MTA-TID: 64aa7808
Received: from 58b9575a7c46.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D57FFDF0-8D94-4179-9243-809BAF11285C.1;
	Tue, 28 Nov 2023 17:55:31 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 58b9575a7c46.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 28 Nov 2023 17:55:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCsbZGwz74iJFCMSHX+wBQsOPB61kd6CgEJtViv996AcLJYdZVEqaw8gYFcQ59I8MCaCGXeuFzGpwf6Xeg/uVI5sSONy/cgSNoCYU5tYgCf+h6cgXydk5vL4lcxoDshNsoJoTbW37tm4sIsWqrETjaTqLcHQPihPJK5HcNcQFHAse3EZpZdlybVM7nJU2SlYyIZDwLEMHJYqQXXwVM2ORQdkvlVLTdfvxw3J6KfrOBHbUB82mIqv3FTjO1h0XK51/f0eIjBsktjahwz2+8q9k5iHILrXgJrcmvRhuKBP0nMCS2YCmprYBRyVzWrars0JZLDjuO2PYFsK1TetBgoSlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VijBWLp6SIFoR72qiaQB7UiSS7cjVZgF5zPDKCJu5Lw=;
 b=ASoWZtrH2odkJz+H87EFDmE4sPv23DNRmBneqq8N5j8dXlwFi5E0Z1F8+CJ6Dd+gdN5qaL2+pJpf+AkeyB8Y7ipvffwgPLT2N4BGPSPvpm8akgMstN3D8vGd4ZY14SaP4KNIuO23/ZvWCK48S6j2+FvdIX/ghQkW8MQo6jvLh6WtRIBJoWsSBokYLd0MzCIWAly9m2VLAHThIbImzOnG8CdnmEUvY1JTz9LwcNhgVcDbnqDjUwh3w73Y0zdOZu3jedb0j7YXiYlcw3TflLCJ+zMMgXneJgf+3lUiSxLEW8QewMR9NL/znK/KFmgoC3KBse/ln4aT4BOpV1u7a3GIUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VijBWLp6SIFoR72qiaQB7UiSS7cjVZgF5zPDKCJu5Lw=;
 b=aPiLADit2Qv26CGgZjCxn/Fmmr/CgmAObTAFsizBxsHIfaJfMD6Zzy3LXmv96lG1ZESHslNNrH2KhAgavNhTgYW85m8LoqlmF9ZDyZp6sbn3vkY5oMWw1+MVWJVVo9sT52cx1jdWGW8aDK1MTZhNTzHgBJJB633CMgRmd9rRrYc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8509.eurprd08.prod.outlook.com (2603:10a6:150:b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 28 Nov
 2023 17:55:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 17:55:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "andrey.popov@yadro.com" <andrey.popov@yadro.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
Thread-Topic: [OE-core] [PATCH v2] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
Thread-Index: AQHaEYzy5bSjqgeOX0K1TXdExQQEv7CQJP2A
Date: Tue, 28 Nov 2023 17:55:28 +0000
Message-ID: <53356C03-3699-43FC-B8A5-70609982F612@arm.com>
References: <20231107151243.10853-1-andrey.popov@yadro.com>
In-Reply-To: <20231107151243.10853-1-andrey.popov@yadro.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8509:EE_|DB5PEPF00014B96:EE_|PA6PR08MB10566:EE_
X-MS-Office365-Filtering-Correlation-Id: 9392cc20-4704-4cb8-be49-08dbf03b3aa7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 et0ynhwpwLjWMgpJpOCJoTEsh4/7zJSc8PnyWRP9Z5PlnYXXPKOJ8OdO+i7MMSSn91gilpQp45bkXpkLWyGtKgQ+Yn3DiYV9cRT7A871YCmUs0zXHe5BMQKvSVaRLnzk1jXpCUG2J0R8G4R1BBWnpEB95zft1HOmHdZet5jLjXYU6xSUSdHTcDEVp00NdQ4CRIkK0noO5v24SQwVo8gs273TTEm8CMwL1Ywp0+D+JM5BKDWnscuZ6d/xuZt3VCyQBSZ48PN0IpLw+sX5ic+ufFFLHA/zP6MZs11g91f2sgDCbShkG/dMUHKtSiPqPu8iT93743qhrBybqBxM8W/2M6DbADYU62917GMU93zIsUyylPOPoknR/w/IVYHtzZwH21FtLRPVIUrvYrFlvT097ldD8T2xQFr2fKqd00f001pqsMm2jt9grsnhc7XxF73NBxIrdAFKJ8QRnxiwhliaVYKswM3xC+E7j6YVPw2z3cXD/Bgcb0WRHCAE34QxCXmbkZdtrLfVmADKvxgsD2uN7ewPY0y8eJ5twVDJWc7yfODm68jh0hwCzewV1MOzv+Xx5UERR/eDnWb7UV1k72eO1uifghIkdxN8DTaayXKC4ahnqyJqmU281Zv64ZxfhVIg+Q5TRm58imM2eXUAjndj5w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(366004)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6512007)(2616005)(26005)(71200400001)(478600001)(53546011)(6506007)(5660300002)(2906002)(4744005)(41300700001)(91956017)(76116006)(6486002)(66946007)(8936002)(8676002)(6916009)(4326008)(64756008)(66446008)(66476007)(66556008)(316002)(122000001)(38100700002)(38070700009)(33656002)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <86F4991CE658824BB9E545CE1EAC9987@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8509
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7248e5b4-6c8a-4f39-9463-08dbf03b3526
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GQOKSQWzg2/zFu/GIuCDRdvMk6WMV2L5MmueV/O++bzaOBskwaWNc0yFUxsLsqFpZCQ5k/dVj9LMd/F2rhZU/c0gxA0bUwZS89owJyWZBoNI40/XEfkB6zwhMMBKF1Y9wY1DWqq58Km7WGS2OLYqivsyYjimMDd87ytAP0CU7OGfQ3F6P8LavPr8dHxQcpT+tQdJWZg0ASyqRnXZzK/vBFRPJf1wPLQvamWNtRGpgSX4UKpGhJiKk8wBwfmJqYaOVrT6RLdzjSmMa1rxqe4JaTqKWNFXHwoAz9QWhuGxzOOTR2FQYjQWm3hb0ykYMRRKn3XtgLMM0/omABoYCgoUxHYHd3LYFckwomY+am/YybrndRsQY/OIHuAn050feBUso8qDerK5WX1Sc06G6coYZ3IkU2M4yPpbLK0KtG5L35aGWK67VxhL9NWB4K+taR1z2o9nzRFu7/wkEZ4jjvltjnJs3oSnWwG0g8TRE20AusuLr6ytXwUZq6WjfljCDWrS3bm84s81n+c2aL6iHXlVjGE8oSV/gUS6oHuYzVydnG/CuONwznCk+TVnthYB+d1tKDKeBtL6SsGPwlxvxjOUwLqWvu3Kv/Xvzm7CgSvjXC9ngpgqWoYX+85gft1sAbkRREjixZicDCuTIM3zshXQ2F5ylzkwypb6X4we+G9efa9lGuoOBH9tuX6uG2FGL8eiQ6yDTkMQF+RA5OfAt0ViMh0NuJXdw3/gYs+tkkuNTG6VPJZqwqVuTCr6oRkfslOK
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(82310400011)(1800799012)(64100799003)(451199024)(186009)(36840700001)(46966006)(40470700004)(36860700001)(33656002)(36756003)(82740400003)(81166007)(356005)(40460700003)(86362001)(8676002)(316002)(8936002)(70586007)(41300700001)(70206006)(6512007)(53546011)(4326008)(6506007)(6862004)(6486002)(5660300002)(478600001)(2906002)(4744005)(47076005)(40480700001)(336012)(26005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 17:55:38.0865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9392cc20-4704-4cb8-be49-08dbf03b3aa7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10566
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 17:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191383

T24gNyBOb3YgMjAyMywgYXQgMTU6MTIsIEFuZHJleSBQb3BvdiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8YW5kcmV5LnBvcG92PXlhZHJvLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gDQo+IFNpbmNlIHN5c2xpbnV4IGlzIG9ubHkgY29tcGF0aWJsZSB3aXRoIHBsYXRm
b3JtcyB0aGF0IHVzZSB4ODYtYmFzZWQNCj4gQ1BVcywgdGhpcyBjaGFuZ2UgYWxsb3dzIGNyZWF0
aW9uIG9mIGJvb3RhYmxlIElTTyBpbWFnZXMgZm9yIG90aGVyDQo+IEVGSS1jb21wYXRpYmxlIHBs
YXRmb3JtcyBieSByZXBsYWNpbmcgaW52b2NhdGlvbiBvZiB0aGUgaXNvaHlicmlkDQo+IHRvb2wg
Zm9yIHRob3NlIHBsYXRmb3JtcyB3aXRoIGEgcHl0aG9uIHNjcmlwdCB0aGF0IGNyZWF0ZXMgTUJS
DQo+IHBhcnRpdGlvbiB0YWJsZSB3aXRoIGEgc2luZ2xlIGVudHJ5IHRoYXQgcG9pbnRzIHRvIGEg
Ym9vdGFibGUNCj4gRUZJIGltYWdlIHBsYWNlZCBpbnNpZGUgdGhlIElTTyBpbWFnZS4NCg0KSeKA
mWxsIHJlcGx5IHdpdGggY29tbWVudHMgb24gdGhlIGNvZGUgc2hvcnRseSwgYnV0IG15IGluaXRp
YWwgdGhvdWdodHMgYXJlIG1haW5seSBkb2VzIGFueW9uZSBhY3R1YWxseSB1c2UgSVNPIGltYWdl
cyBzdGlsbCwgZXNwZWNpYWxseSBvbiBub24teDg2IHN5c3RlbXM/ICBJ4oCZbSBjdXJpb3VzIHdo
YXQgcHJvYmxlbSB5b3XigJlyZSB0cnlpbmcgdG8gc29sdmUgaGVyZS4NCg0KUm9zcw==

