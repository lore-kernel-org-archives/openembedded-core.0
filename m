Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856D8C4707B
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 14:05:06 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.49])
 by mx.groups.io with SMTP id smtpd.web10.80923.1705327495716153205
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 06:04:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DU7yDV7e;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DU7yDV7e;
 spf=pass (domain: arm.com, ip: 40.107.20.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=StiFaXxoknMuAZZhrAUOodRJ6vlaGjJE0CwXSgpcYRD9Czh1rlwv9fuTiSDRWieHIOb4sOQwMkII46R7DGSOAO1nqrCYsZPikOQcmob5qT3ipm1xaWbFYq9Bk/fq0XIPqdujdD5LL4yZO05XOOTKEV89pdaBhrGzHtjwVneV0wRyDQTNHhKz03wtNyrFsLGu+XtI6M1unhsolavf6mTL7VQjHv7spRsvV7MUcSUbGdUSmyiN/qhQuGRSVsHT3+LUosJ8PPcvjx7wAx9uUJ74Ub8EFiG1CB10LOueiB3Dc21vyHJiLuhNd9wpEdO/oRFxSBJkcCM2Fufat2WMpT+Pfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DTzIDKn4bvHlM5iGJ6yW/mI+UBpqxjWDtHUJqQpL/4=;
 b=I2N6ga0UAj6ngWcAciIu//EO9OMdb8YHNKuWc8ATag2lNbLX4U4ZDIneHsq31+WtB7mQTQGqPz7QHKsVhR5x0iSVONPVF5ZcAoDqzs8dVRYwSaRzTG4WSEKkoXyHyvDwULEHNRJ/B73x0gfOlg8Bf/WvKeP8NhJizeLhWQoW+BMO4faIj+AReXiSFONVrQ80YUb54AFIsUCLVbaJ746Q4oOmpHX4vIQMqDh5hgAcU6cThi4eDjxehK/NQwlq/68Sh2fGMWN59NTzrCTrU6a8UZ7MmZ7oaZ3IYxrp6TwRKpPQLAnouQ5thOwioVB1YUU5maHi2d/kM4u8xcC1PQgVzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DTzIDKn4bvHlM5iGJ6yW/mI+UBpqxjWDtHUJqQpL/4=;
 b=DU7yDV7eB02C3Tn26jc6ijK93/PmWiUdGdK6uHkUw43Zr/mRszPrwlvmyIf9Ustu74qwrsg1EYDqahq7/Yrt+a3n6WsLvP6jpPXQCAWc67azTRhAub2jLH8BL+ec0AFIr7mMgOO06gxFSSbnjJk61jI9PoF0aEvYO/2PxbfLp3o=
Received: from AS9PR06CA0180.eurprd06.prod.outlook.com (2603:10a6:20b:45c::27)
 by AM7PR08MB5351.eurprd08.prod.outlook.com (2603:10a6:20b:dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 14:04:51 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:45c:cafe::7d) by AS9PR06CA0180.outlook.office365.com
 (2603:10a6:20b:45c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23 via Frontend
 Transport; Mon, 15 Jan 2024 14:04:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 14:04:51 +0000
Received: ("Tessian outbound c87008563c51:v228"); Mon, 15 Jan 2024 14:04:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6983416df358749a
X-CR-MTA-TID: 64aa7808
Received: from 8a8761071df7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0CCCF4FC-9C61-4116-BEAE-CC46AD41E785.1;
	Mon, 15 Jan 2024 14:04:44 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8a8761071df7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 Jan 2024 14:04:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsJTHNp6TVT/rqcf7+4exBsLRppfPRPoGRFZ08XcKQn6PuF+rBjtD0M15CE6Hib+62staJg6jRzqJ99AUevJ7GddmqKvsy829IHaFP1lRjkAxxqM/plP0zQpeMRGO/45g/dmIYVDAgVDKCab987iUkNRndy3sAxLWy3ERPJK1mw83cz//7R8wjggVJY2Emi9eJmFOUl8NA6kyN63cg6fGLoevUCvrQC57Ib8Ebu6J7+rUuigUROhvjzkkqA6MOc1306No4TOSW03MCKL27A77dMUYQyChePZ0J4lZfJ1XxZkenPJgkFHC3QrHg4hN7pVU7VLAGcuudIdG+S2tmlE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DTzIDKn4bvHlM5iGJ6yW/mI+UBpqxjWDtHUJqQpL/4=;
 b=TlEbyvi696il07t0cCb4aTdeti++cwYVvNHuqiJXzPDLCGZNPhaV5zB5hGjR26jd0Z4ULMXcvX+Vm4fJa3znV2sHqr8J94Z+lGL1CiqmfBdKUrbv6GdCorEPdQpHTHeHKA3y8jyQqOPg/x5Ok308R7chIDa7vYF5Z1Wq9kqnejk68Yt1Q1x5qFs4vTKz1IAMVyP448gfNIOL+N0MMAbIQfn6tmzy+tfpaPly8XCfO3DzYrtzvyscck9R4T2F/vPKTH4V4Ku2b+rF9v8Xx238RVisTV5nhUKRKMgbgAM75Ixx2nFl45ClbabYPhk7vgoLfqmY5glwqjEo07OzuNFzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DTzIDKn4bvHlM5iGJ6yW/mI+UBpqxjWDtHUJqQpL/4=;
 b=DU7yDV7eB02C3Tn26jc6ijK93/PmWiUdGdK6uHkUw43Zr/mRszPrwlvmyIf9Ustu74qwrsg1EYDqahq7/Yrt+a3n6WsLvP6jpPXQCAWc67azTRhAub2jLH8BL+ec0AFIr7mMgOO06gxFSSbnjJk61jI9PoF0aEvYO/2PxbfLp3o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB5989.eurprd08.prod.outlook.com (2603:10a6:20b:297::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Mon, 15 Jan
 2024 14:04:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7181.019; Mon, 15 Jan 2024
 14:04:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] glib-networking: Fix ptest failures with
 openssl backend
Thread-Topic: [OE-core] [PATCH v3] glib-networking: Fix ptest failures with
 openssl backend
Thread-Index: AQHaQzI0h77wMUU1uUmWICLlsBmLvrDa6nYAgAACm4CAAAQPgA==
Date: Mon, 15 Jan 2024 14:04:42 +0000
Message-ID: <3642B18A-B5F2-40EF-B1A9-303923477117@arm.com>
References: <20240109192923.3183219-1-raj.khem@gmail.com>
 <3B3DBDDB-9E17-431A-B3E8-DC8E072066FC@arm.com>
 <CANNYZj_oydN+0ODz_kCjus74uzF-wUhcZ1nfmYqrRo+BoupB4A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_oydN+0ODz_kCjus74uzF-wUhcZ1nfmYqrRo+BoupB4A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB5989:EE_|AMS0EPF00000192:EE_|AM7PR08MB5351:EE_
X-MS-Office365-Filtering-Correlation-Id: c69324f2-189b-4698-a08b-08dc15d2f139
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 t/lvwlkNJZUgtZL2pZvs3EQTSVDrlxV1t20To5anRZV8EDgOrX6Wf/SD610+gM61G/lmJ3yyaVxciUSDcC8RrwoznO6WToW7RQKcfH6SRKtXJ/GuKS3aHiSdvNcuua49TyI8mcCGiWppWMudjByrO9l4x6ndYBkbJ4UxoQlbmmK3mQGXd1mzUqNXqv7nalARQq0dMDXTE8zBO9y56OSMt8+fW6rsKKwnj00IHhcY8J4AUVeCyzHb4Q+S69C33AW3UUg118TssZ6/XZtvW7qPkDu6ConfOWYqb1SyeKR5jcrhoRmwOceeHNu7kXfsaxhDMBy6DeAVCEyL1bSSvqkuwS0WaN0OSD04L6bf2O01nBal8ypcfdNL+oNcay3dlIK0VLbjglgDyhqt4QlWV6VecMTh+toZr1mYDDFrLsv7Hnb9dqmcjNSpB5U2VmjlmpEW+lZCGiePyabd50VRmJnijUy82iTEhxv8i3RZ3ftZLkHpuf29bYg5MmGMATrzX0wSSZYYwiZPhpCZ16F0jOMy8LJJ+2P+GiO8Avt46HZOr4N5KwduYSdntJ+Yv2gvcHIgV7UIte/2FJXEvn6MeP47EqSJklztxZTXmZtE2GCWk3fv/qGjYExEJrkI3sneODMyhUrZ1hhJyJthcyNz+Zu79Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(53546011)(122000001)(66946007)(38100700002)(8676002)(71200400001)(26005)(2616005)(4326008)(54906003)(5660300002)(8936002)(41300700001)(478600001)(6512007)(2906002)(6506007)(66446008)(316002)(66476007)(64756008)(66556008)(6916009)(6486002)(91956017)(38070700009)(76116006)(33656002)(86362001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <67FD9AB1366DE64DB02FB009405CD5B0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5989
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dcf07030-4889-4f15-a7c9-08dc15d2ebf6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2OAcfeUMOIW4JRrUzJCxg0u4H9dHXRD/nq9WZEe9D8c6hi0cdjBVzFd66XUYdOlgrQkMMRo2EZPzrse+lMfa7+5NxOUsy5a1P2/mkM9naUEd4TI6Gzcyr30w80cyFq7kMQhIlHdKbdTe+o73Uppe2DHJy4ZKKlZ3gDb5IUo6EQ/rVcdZfDkUEdMbmfB1DTbw6t15inucxFqjZxECZ+n37EAkqaxRaez7akcC6SeXHvqf8XL95YLryfkdcxNnwajJOKHCFN9RuZ/zC3ulkxgI6jUOZ/dJCMFVBYtTjpYG+2Sx8h4aFXyuA0Uo75ICx6P0jmTLh4L4DvjdDHfVyhwf6fH+SRpxbXct2VP8glXE5CjZML3nX/Fn6TconM6AsOo+UtZEO4WYXQXCabAvOAlfcGlpVpwYQ5tqfogbL+VIILrCwfIKEamy2ofzcTE9mR2vRke7Kieci81JazGJhE/S8QIu5mNxPq2OoAN/F6P2SWz+6Oy+V8/Gb+S0GxhTmUhMXPR32+MuzwlRMOOWUdEnp4+Henx6SZRhGtOt+RcsoDCE1ToY8sfyFZ4QA1OmGNK5JsSrkUx7KciCL7qRjVCqf3oj8ri4mRLPVfnj34nyR5hkegg9Tim2G0saoDcQRExAOYQIjl/FHtshRUig+RZbZQmp9qpaCkktkJWKKBpgEFxLdtoAaQFlUBVZWt9iKZ9Pt7tfOJbF/6kd8jNq+R2BkA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(46966006)(36840700001)(70206006)(83380400001)(6512007)(2616005)(26005)(336012)(82740400003)(47076005)(36860700001)(5660300002)(6862004)(8676002)(4326008)(8936002)(2906002)(6486002)(478600001)(316002)(6506007)(53546011)(54906003)(41300700001)(33656002)(356005)(70586007)(81166007)(36756003)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 14:04:51.3700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c69324f2-189b-4698-a08b-08dc15d2f139
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5351
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 14:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193679

T24gMTUgSmFuIDIwMjQsIGF0IDEzOjQ5LCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+PiBXZSBjb3VsZCAjaWYgMCBvdXQgZXZlcnkgdGVzdCB0aGF0
IGZhaWxlZCBhbmQgcmVqb2ljZSBpbiBvdXIgMTAwJSBwYXNzIHRlc3QgY2FzZXMgYnV0IHRoYXQg
d291bGQgYmUgYSB0ZXJyaWJsZSBpZGVhLCBzbyB3aHkgaXMgdGhpcyBkaWZmZXJlbnQ/DQo+IA0K
PiBUaGlzIGlzIHdoYXQgd2UgYWxyZWFkeSBkbyBmb3IgaW50ZXJtaXR0ZW50bHkgZmFpbGluZyBw
dGVzdHMgYWxsIG92ZXINCj4gdGhlIHN0YWNrLiBSZWpvaWNlIQ0KDQpIb3BlZnVsbHkgd2UgYXNz
ZXNzIHRoZSB0ZXN0IGFuZCBkZXRlcm1pbmUgaWYgdGhlIG9kZHMgYXJlIGdvb2QgdGhhdCBpdCBp
cyBpbiBmYWN0IHRpbWluZyByZWxhdGVkIGJlZm9yZSBkb2luZyB0aGlzIQ0KDQo+IFRoaXMgaXNz
dWUgaXMgcmVwb3J0ZWQgdXBzdHJlYW0sIGFuZCB0aGUgbGluayBpcyBpbiB0aGUgcGF0Y2guIFll
cywNCj4gZ2l2ZW4gc3VmZmljaWVudCB0aW1lIG9uZSBjYW4gYmVjb21lIGFuIGV4cGVydCBpbiBp
bnRyaWNhY2llcyBvZiBnbGliLA0KPiBvcGVuc3NsLCBhbmQgdGhlaXIgaW50ZXJhY3Rpb24sIGFu
ZCB0aGVuIGRldmVsb3AgYSByZWFsIGZpeCBhbGwgYnkNCj4gdGhlbXNlbHZlcywgYnV0IEkgdGhp
bmsgYSBtb3JlIGZhaXIgZXhwZWN0YXRpb24gaXMgZXhhY3RseSB3aGF0IEtoZW0NCj4gaXMgZG9p
bmc6IHJlcG9ydCB1cHN0cmVhbSwgYWRkIGEgcmVhc29uYWJsZSB3b3JrYXJvdW5kLCBmb2xsb3cg
dXANCj4gdXBzdHJlYW0gcmVxdWVzdHMgaW4gdGhlIHJlcG9ydGVkIHRpY2tldC4NCg0KVGhpcyBp
cyBhIGNvbmZpZ3VyYXRpb24gdGhhdCB1cHN0cmVhbSBkb2VzbuKAmXQgc3VwcG9ydCBhbmQgd2Ug
ZG9u4oCZdCBlbmFibGUgYnkgZGVmYXVsdCwgc28gSeKAmW0gbGVhbmluZyB0b3dhcmRzIEtoZW0g
Y2FycmllcyB0aGUgcGF0Y2ggYWxvbmdzaWRlIHRoZSBiYmFwcGVuZCB0byB0dXJuIG9uIHRoZSBv
cGVuc3NsIGJhY2tlbmQgaW4gdGhlIGZpcnN0IHBsYWNlLg0KDQpSb3Nz

