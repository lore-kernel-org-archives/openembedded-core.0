Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F039BEB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 10:31:21 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.54])
 by mx.groups.io with SMTP id smtpd.web11.4233.1689157873345244657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 03:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ycvuNzN6;
 spf=pass (domain: arm.com, ip: 40.107.105.54, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1UvIyeQ/h3cuGyOcYYVWm0o2gNzw38EQg/GzRfDlks=;
 b=ycvuNzN6+2zMAo2eXlh7eSI9pJiuqDCz88S0eRQo8SiVWZQgfNH02xiTAGwcrMs/RSwwdsRN4XkeicV0/1D8Zd3BCdTBtFgmFXg8I/h2JPIiewZbS+5ydEkg63syypzjadekyplN6aoPgHP8VNc86Gt3Caspn8QBqOmq+w0d110=
Received: from AM6P191CA0057.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::34)
 by AS8PR08MB9193.eurprd08.prod.outlook.com (2603:10a6:20b:57d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 10:31:09 +0000
Received: from AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::3c) by AM6P191CA0057.outlook.office365.com
 (2603:10a6:209:7f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Wed, 12 Jul 2023 10:31:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT024.mail.protection.outlook.com (100.127.140.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20 via Frontend Transport; Wed, 12 Jul 2023 10:31:09 +0000
Received: ("Tessian outbound ba2f3d95109c:v145"); Wed, 12 Jul 2023 10:31:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d13743e262f00e17
X-CR-MTA-TID: 64aa7808
Received: from db3fceae1f6b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3B1F8492-BF80-4620-BC6A-48461297A92E.1;
	Wed, 12 Jul 2023 10:31:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db3fceae1f6b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Jul 2023 10:31:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YS0FPguDfrrq3Sr/dXzxUefG7oF4hF4UYULZCrhZYCqAKSMw5JqwkaF/rxzElhrwGbNVWfEM3Z6oKELfSrPe5B6v7BkhA3hfFs6hsNlt/Xram1JIbgBpGt2lXHsBsKKc7ySafuImijs4U1k0B2p0SOrSD2PwnDGw5coZm++0T1hsqEOqdpOGmDfrCvt2RlDKAaT4R+H1uTX4ov9X4TIqBCNA4noVb2Kg3eZcu9rqs+g4bzK9px0V8wMep5NMftwLgb0hXlpvUQk+EO4IoUpI+0z3DfosVJxG8M9U+5mG2IvTpzMezPmu59eKgtghjGZO4phT0DgZtX9S9Nr5JltDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1UvIyeQ/h3cuGyOcYYVWm0o2gNzw38EQg/GzRfDlks=;
 b=FyqPagt9wS3d+6QpwW27Ct9R0Vg5ZibSEnlzdCYOlauSXj4cZJCzAtTdk/2WRBJZ2aFYSdfWgwWOTwYO0MS6vf7NrYZIv9Y8MyVWp+NbQ8SiqRhle1ekjUsC1eRA08qydkQzXG/Wj9e6LreO/e1rCaUhqnJfHoq68ZyZIbyjNOPnFW9JSmK5WSWylC5fjzqt9MVHPCvlu+31gjBuNR80aHcN/3d5wan0phJts/2oOXDiwGOpHX7haxeoe3X9JqJl5T3653V6JU/6IyWaVK8ubojYBAER47A1kilDeBkOEXB6S76h38RpGzAAWepT0bkrXU+lyCleCaK4U9dpWAv7HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1UvIyeQ/h3cuGyOcYYVWm0o2gNzw38EQg/GzRfDlks=;
 b=ycvuNzN6+2zMAo2eXlh7eSI9pJiuqDCz88S0eRQo8SiVWZQgfNH02xiTAGwcrMs/RSwwdsRN4XkeicV0/1D8Zd3BCdTBtFgmFXg8I/h2JPIiewZbS+5ydEkg63syypzjadekyplN6aoPgHP8VNc86Gt3Caspn8QBqOmq+w0d110=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9607.eurprd08.prod.outlook.com (2603:10a6:10:449::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 10:31:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 10:31:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "p.lobacz@welotec.com" <p.lobacz@welotec.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH 1/2] opkg-utils: add acl and xattr support
Thread-Topic: [OE-Core][PATCH 1/2] opkg-utils: add acl and xattr support
Thread-Index: AQHZtE5FXTtP9I9Dlku+DoptQ0D3Vq+17z+A
Date: Wed, 12 Jul 2023 10:31:02 +0000
Message-ID: <384B4554-E449-490C-888D-FDC111366FF3@arm.com>
References: <20230711231847.2211186-1-p.lobacz@welotec.com>
In-Reply-To: <20230711231847.2211186-1-p.lobacz@welotec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9607:EE_|AM7EUR03FT024:EE_|AS8PR08MB9193:EE_
X-MS-Office365-Filtering-Correlation-Id: 07615b70-d6ed-439d-b9b1-08db82c31b9d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RvbBXLVLRYe3na2nGEdTaV2pVCxYK3KGvlCvQJuvmQQanOkjdiivbHJ66uyOXxpBLhfLJBa4X1eaSodWrzo5rXATiNu/tkZ/3qLcNlXHc3Ac95UCZY5DvIAaLfr/mumieQGfpRsltFUAafVFBDWMaeumdWbjK0YFCCQZG/X6bc17NxGgulWbZ/z/JINaapuVcBdKAgPNbAmCFJ/u4bHECbTMHhrGx8sNy2pyzcr4PpJPNSdWQapXp1SubJsmM9acDIEVH4KJJ5wcZLCQ941yRw42QcLPoWA+4Q8tQJ10x2zyj5wxfTPO+VdC1bsd5//Kmu2Ji385bnZjSEgljlWMGltD2KepaRovh7yZHx00K7cb41oX+UKo9beF/01MNvpsBC+XKxXjspUJKDGInoPjRbv7PQPWBu4j5RJ+8LPUrDcw+xuFsF1xMzA1LLQIS/o5we1l77/owLRv0Sg85ONlzi6meT9bJdHtyW+BDmRur5sPAhcXH74eAfXqLE4yPOtLFTS3uVMrWp45xbCd7DITNflP6gp+/ZNAcADPP3WHgD0jZXYJP+rtsX0DuhtIDQZlM/0p9fDYfodeVF6HDKk4EY6yzxHd5xbj6Yu5KqV/nxuHSF21sTqkrwP7x6mKz46ssYdey7dN7eIi10vNtgc7Zw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199021)(6486002)(71200400001)(478600001)(122000001)(5660300002)(8676002)(8936002)(2906002)(36756003)(86362001)(4744005)(33656002)(38070700005)(6916009)(4326008)(316002)(76116006)(66476007)(66946007)(66446008)(64756008)(38100700002)(91956017)(66556008)(41300700001)(26005)(53546011)(66574015)(6506007)(83380400001)(2616005)(186003)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D7F8040441EA045AD0154537AFC6DF5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9607
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	13f128f6-23e5-4f68-527d-08db82c3173f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xxXHY/juxbpt4WKuZqFPXZqGaYIraRN4ncjhg8KHbrLTDoWhtAircOOqd/wlI9c7YyDttH4mkAfcK2D2StytJq5bs15LI/cEcq/nV6eHluidfZV1gM7RBrSrnKANCkKl/UC8XS69X4MSFLARzQfLZ779e5YUx6NaEej4lb375Y5ldBpl8H0Ua2xH2wl9MMoYOeqSZUy420uLMzVBSa51WWCaMwUkkwLJfiFH1mHNkhqYC/H7JxRNjQUC821KiT9Xdda84mPb0yNzMqKzlqxzOrD1Gj8qXwU0iri+OfyMtcgK7PM3UQzBPlR/Wm6i8+5MKz0jhF/7ejyl3axHgSbT0UBYpUfvl51qK5DLqft0s8WPhrFUOsk8nsxVCM37mr3AgYQyR6GcCYgYu9saLixmi5xSstZtd+N/+AzASAz4Q1/ITT4SxVpyKK2s/dInkFIKMVROshwjV/ZtvMKD/MFv5AuqmxAINEEtw6Ifx9k4N5RbXdj232QhBVKZXdWa0hkq11XXtUJoHpJnqc+3WCpNCvujoxlvf20PJYpsrs1J/Kon6/bS2QCbCg2Z8X/KaXaMDjeI+KNlh7i74XgT3ZZF6R+skI3OmIB5xxAHX5FRyAG2A33RrbB+1iveX+hhRRphG8Gw6/zg14gXewUST15EBMIycuaosJY9DhFCg5Q+2Gw7byoswqmmkw0Ade4YNuRwO2Atpp2OofxpQr53DbrKgLyltJcSf/OykV5J+pmoXdGgKJbD4xegYagPKkovxdCT
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(36840700001)(40470700004)(46966006)(6862004)(8936002)(36860700001)(8676002)(5660300002)(186003)(47076005)(66574015)(83380400001)(2616005)(26005)(33656002)(53546011)(6506007)(86362001)(41300700001)(6486002)(82310400005)(336012)(316002)(6512007)(356005)(36756003)(40460700003)(2906002)(70586007)(70206006)(82740400003)(40480700001)(4326008)(4744005)(81166007)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:31:09.5987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07615b70-d6ed-439d-b9b1-08db82c31b9d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 10:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184173

T24gMTIgSnVsIDIwMjMsIGF0IDAwOjE4LCBQaW90ciDFgW9iYWN6IHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxwLmxvYmFjej13ZWxvdGVjLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2ctdXRpbHMvb3BrZy11dGls
cy8wMDAyLW9wa2ctYnVpbGQtQWRkLWFjbHMtYW5kLXhhdHRycy1zdXBwb3J0LnBhdGNoDQo+IEBA
IC0wLDAgKzEsNzAgQEANCj4gK0Zyb20gZjE3N2FiY2JhN2Q3MmZhMWFmZDBiYzIzZjM4YmViNGZl
ODhmYzA0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gK0Zyb206ID0/VVRGLTg/cT9QaW90
cj0yMD1DNT04MW9iYWN6Pz0gPHAubG9iYWN6QHdlbG90ZWMuY29tPg0KPiArRGF0ZTogV2VkLCA1
IEp1bCAyMDIzIDEwOjMxOjEzICswMjAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIG9wa2ctYnVpbGQ6
IGFkZCBhY2wgYW5kIHhhdHRyIHN1cHBvcnQNCj4gKw0KPiArQWRkIHN1cHBvcnQgZm9yIHRhciBh
cmNoaXZlcyBjcmVhdGVkIHdpdGggLS1hY2xzIGFuZC9vciAtLXhhdHRycyBvcHRpb25zLA0KPiAr
UEFYIGhlYWRlciBmb3JtYXQuDQo+ICsNCj4gK0dOVSB0YXIgYW5kIGxpYmFyY2hpdmUgYWxyZWFk
eSBzdXBwb3J0cyBBQ0xzIGFuZCBleHRlbmRlZCBhdHRyaWJ1dGVzLg0KPiArV2UgY2FuIG5vdyBh
ZGQgdGhpcyBzdXBwb3J0IGFzIHdlbGwgdG8gb3BrZy1idWlsZCBzY3JpcHQgaW4gb3JkZXIgdG8g
dXNlDQo+ICtmc2V0YXR0ciBvciBzZXRjYXAgaW5zaWRlIGRvX2luc3RhbGwgY29tbWFuZCBhbmQg
ZW5kIHVwIHdpdGggYSBmaWxlIGluDQo+ICthbiBpbWFnZSB3aXRoIHRoZSByZWxldmFudCBBQ0xz
IGFuZCB4YXR0cnMuDQoNCg0KVGhpcyBwYXRjaCBuZWVkcyB0byBoYXZlIHlvdXIgUy1vLWIgYW5k
IGFuIFVwc3RyZWFtLVN0YXR1cyAoU3VibWl0dGVkLCB1bmxlc3MgaXTigJlzIGFscmVhZHkgYmVl
biBhcHBsaWVkIGluIHdoaWNoIGNhc2UgQmFja3BvcnQpLg0KDQpUaGFua3MsDQpSb3NzDQoNCg==

