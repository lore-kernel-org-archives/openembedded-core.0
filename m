Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4216CEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 12:45:20 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.45])
 by mx.groups.io with SMTP id smtpd.web11.21265.1688647513624426101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 05:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=l4xQdqEa;
 spf=pass (domain: arm.com, ip: 40.107.105.45, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FI+s9Nq2IYywScA5f9gTHNE9DkbO6Mvd0HkPTQMn0eI=;
 b=l4xQdqEaBZgbPeM23HnuyRDGGpLotrEwtpccS1jsxrnny76DGo4nZrfnzfPR7skEWgB4VGwu2tLuU/LtHKrl+5Hyzjv2awEN6yMghwqaYKn+wVoD72qwW/mO9xEyRj/HHO4dEM3QC+RUcHHuxkc3RLVwSVeUa9A40jSaT8pMohs=
Received: from DU2PR04CA0271.eurprd04.prod.outlook.com (2603:10a6:10:28c::6)
 by AS2PR08MB9198.eurprd08.prod.outlook.com (2603:10a6:20b:579::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 12:45:10 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::d0) by DU2PR04CA0271.outlook.office365.com
 (2603:10a6:10:28c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 12:45:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.25 via Frontend Transport; Thu, 6 Jul 2023 12:45:10 +0000
Received: ("Tessian outbound 546d04a74417:v142"); Thu, 06 Jul 2023 12:45:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 711d911043c73919
X-CR-MTA-TID: 64aa7808
Received: from 4ac05ef73156.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3DEB984F-5FD8-4139-8FC1-225DEB250F82.1;
	Thu, 06 Jul 2023 12:45:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ac05ef73156.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Jul 2023 12:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSHbXXeoK8aD6iIlxNNQvYmFg87rzYWqUeM5me6NCFmAhqpBK9eMKjs7X5OJRKdeeRx4TSDTbWd4E4h0Ab4L6T7hHK2C0Q9TP0FGLus64rFqN/vqccmhknS9Wq6lNPT4lopWfRhDUCTnEEnDMWwsRVQgi5sFYoCCWdNA2am1JoYesx61+X9lS4DtoRB0IVjEQfivODPAY3Q/PCgiaW1QIR/QvfWFEbMHy9j7zilTFxwFRRur4TTNpOX6JLa9qughuS/5cGf+plpHLKLXjv5Hn5Uzqafxul0VRtjeGaWwfYxT1aOuxMk6YaffRDWq8zbcMS/aFp2BhtMhOfg00TNCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FI+s9Nq2IYywScA5f9gTHNE9DkbO6Mvd0HkPTQMn0eI=;
 b=JTZ95lERxALgYvdoTaA1G4n1jb59xhISLKDAYQk9VFQGrMebjHBbR62fWgX+60hD25Wz6enqwhj0Zj9YEwrH596gd94wCNc90N79KoOBrMTSgq7Rvy0jpLT0XUkviMnvjV/USy6vCBkXcKHXMszD18jfQ1OiDcn5JPt6zXgIZ150An6wSP37CTDckiOw6jExzYp4eiOlZQFT/3LTlb7pbpF9yfChv2QFoezG8/GT30zxtKByOfZYm2YlVu6IkGRntd8yFFc71MSveRf/0kUXOzbX8YJ3aYpIHWsYwb1Xg38t5GxaJt3no8P8WF9iugrM8YVLxK6G+0MrkXXrnzFl/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FI+s9Nq2IYywScA5f9gTHNE9DkbO6Mvd0HkPTQMn0eI=;
 b=l4xQdqEaBZgbPeM23HnuyRDGGpLotrEwtpccS1jsxrnny76DGo4nZrfnzfPR7skEWgB4VGwu2tLuU/LtHKrl+5Hyzjv2awEN6yMghwqaYKn+wVoD72qwW/mO9xEyRj/HHO4dEM3QC+RUcHHuxkc3RLVwSVeUa9A40jSaT8pMohs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7550.eurprd08.prod.outlook.com (2603:10a6:102:24d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 12:45:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 12:45:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Focus of ptest packages
Thread-Topic: Focus of ptest packages
Thread-Index: AQHZsAetkM5BSZD0N06XYoUGDyHz3g==
Date: Thu, 6 Jul 2023 12:44:59 +0000
Message-ID: <13E2578B-1FDA-49F4-B4CA-6C7379D5D712@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB7550:EE_|DBAEUR03FT047:EE_|AS2PR08MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c5eee7-b05f-4b5b-3be8-08db7e1ed5be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tQh+bz7RKfyKaDdjpZF7/U6TYebmG3UN4OOzFMXfR8FUJs74R0cGUgaIQohzW4GmdVsVIvAvu6wlcX5yeX/GEosZ5As09TcBE5X8DVb4rjdUqSEljkoNjXfJPZAqErGaApfh6k88PXQ2iYZiWx1hRMH5xzrL9U/LX5laoY3X27VDIVPGUxpsnLj38a2EMHaxl9WSgQfV4Z8P648360vWbWPK2uEluGdkvDxiFSc8kM4SdFbLzfDD95yBFjBZuscU6v8iDDkfoIduhRdv9BnwEXdoiJ61NrvDEDBN3r8dfFXW4r6CjMxXWhtZ5UXhQbs/8bdNNCp86Bknk5mlH3XcI21Y5zRBJl785ZoGfea3Il1pTNFCg+iz2UdB2aVWCVh25tZIW5DKIofJYmCU7rSB+K+lsU4pHX5FXz8PBuFMIGoW+8oJZgoAZ3m4xCq673bLJDF1uIfDoIM8+gkCpMsR3sll+7OIz6vtamV86A8kEmvWGKuf6XYI6e1it1nZVK/rHxKv1n/Cn1n8SSLSp7YQ55NjJX4x23z53mQR78zomDQynV6EGUaCi0EYNiQHYfN2/BpKVk2/cgnWVVvTutigT6JBCWCgjQCsRgnrNa2nBYMdAxGY21ItoRGwN7xN6KawLahBp09rX7uKBrB0l8USbw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(38100700002)(71200400001)(33656002)(2906002)(6486002)(8936002)(38070700005)(8676002)(41300700001)(36756003)(5660300002)(478600001)(76116006)(64756008)(86362001)(91956017)(186003)(66556008)(66946007)(26005)(6916009)(6506007)(66476007)(66446008)(6512007)(3480700007)(316002)(122000001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8AEA4813803704E823F0927EF390BBA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7550
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a8ab48f5-89ed-42e3-2431-08db7e1ecf98
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bYFrUX85Kvv7jkxB1CsLIj6o3klOZHg0Cm2AtDSVcCe/9Dz1CZbRzxqzYA23abbI11CNUN8umjGxR4gcfkx/5nVc1hZIsEHYnFixvcMUyDq2jq9LCUQhKKXnIOv5tb/sKx81kMiwngC6MV4J7tdEj8k/x/+67w2CuD9U18dDy9jvz40yuxiGaCWG2w4l6OtdTc8fKAysOvFl57SFeFVivO2MmUUI9HhAIfTvRPUV6F33Jbqb0KfFhVArZCs6d5HU8ueuC4kzHYbsAHaTiAhyB2Zzo/JXMZk+2bzLfZ2bkf/i0jZjca/QTL2yehqHosz35N4hK5KbTLKMD8Gctk+pwjriiMX64fT24QFRnCjmsUe5/Ixsjve024GCRd/3stZIs8ONX3sMO5I8M7ezOu9xTvNzN1oKdSzFsgewFCI7TlrPmAdOYZM2lwZhsOgFtfM4PlH7kj0B5I9XR6NKqSYP5S3zsT6SMlplqWUBZ7rxk3fGH+WHqQijryBQpK1MClxeEpinBAEW8oe6SlK2EcPcaGvcsITgA++EOj0J0dTOcHkZNSAS8P3Sk7eYCHGpKZOVnkMfmEmfAd1ZIs/pwqsLxju9+4VvoFmpOpVwlmde/c4O/CaZkagnZ/W3aWgzv+4alBrc2ACiI7Fi+B7PCuTP0CcaAiYWqJBonEvEf09rluvBtvAb5vu3dwGKNV00KuzIFbaW7fLjiFs6iABsrHaCxXbD0ZbitoKTOWNPYUa5AS+oB0hiC+OyfjP53t+d2Bg+
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(5660300002)(3480700007)(41300700001)(8936002)(36860700001)(8676002)(2906002)(316002)(47076005)(336012)(2616005)(82740400003)(40480700001)(81166007)(70206006)(6916009)(6506007)(356005)(70586007)(40460700003)(82310400005)(86362001)(186003)(478600001)(26005)(6486002)(33656002)(6512007)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 12:45:10.3033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c5eee7-b05f-4b5b-3be8-08db7e1ed5be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 12:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183936

SGksDQoNCkxhdGVseSB3ZeKAmXZlIHNlZW4gYW4gaW5jcmVhc2UgaW4gcGF0Y2hlcyBmb3IgcmVj
aXBlcyBhZGRpbmcgcHRlc3Qgc3VwcG9ydCwgd2hpY2ggaXMgZ3JlYXQgYW5kIHRoYW5rcyB0byBl
dmVyeW9uZSBoZWxwaW5nIHRvIGltcHJvdmUgb3VyIFFBLiAgSG93ZXZlciBjb25zaWRlcmluZyBt
YW55IG9mIHRoZXNlIHByb2plY3RzIGRvbuKAmXQgaGF2ZSBpbnN0YWxsYWJsZSB0ZXN0IHN1aXRl
cyB3ZSBlbmQgdXAgaGF2aW5nIGxhcmdlIHVuLXVwc3RyZWFtYWJsZSBwYXRjaGVzIGFuZCBjb21w
bGljYXRlZCByZWNpcGVzIHdoaWNoIG5lZWQgdG8gYmUgbWFpbnRhaW5lZCBieSB1cyBnb2luZyBm
b3J3YXJkcywgZm9yIG9mdGVuIG1hcmdpbmFsIGdhaW5zIGluIHRlc3RpbmcuDQoNClNvbWUgcHJv
cG9zYWxzOg0KDQotIHB0ZXN0cyBhcmUgcHJpbWFyaWx5IGZvciBpbnRlZ3JhdGlvbiB0ZXN0aW5n
LiAgSWYgdGhlcmXigJlzIG5vIGludGVncmF0aW9uIHRoZW4gdGhlcmXigJlzIG1pbmltYWwgZ2Fp
biBpbiBoYXZpbmcgYSBwdGVzdC4gIEltcG9ydGFudCBsaWJyYXJpZXMgd2hpY2ggaGF2ZSBzeXN0
ZW0gZGVwZW5kZW5jaWVzIChzdWNoIGFzIG9wZW5zc2wpIG9yIGludGVyZmFjZSB3aXRoIG90aGVy
cyBwYXJ0cyBvZiB0aGUgc3RhY2sgKGdsaWItbmV0d29ya2luZykgZGVmaW5pdGVseSBzaG91bGQg
aGF2ZSBwdGVzdHMuDQoNCi0gVXBzdHJlYW0gYXMgbXVjaCBhcyBwb3NzaWJsZS4gIFdlIGRvbuKA
mXQgd2FudCB0byBtYWludGFpbiBodWdlIHBhdGNoZXMgYW5kIG1hbnVhbGx5IGNvbnN0cnVjdGVk
IGluc3RhbGwgdGFza3MuICAgV2UgX2RvXyBzdGlsbCBuZWVkIHRvIGZpZ3VyZSBvdXQgaG93IGJl
c3QgdG8gaGFuZGxlIGluc3RhbGxhYmxlIHRlc3RzIHdpdGggYXV0b21ha2UsIHNvIHNvbWVvbmUg
c3BlbmRpbmcgdGltZSBvbiB0aGlzIHdvdWxkIGJlIG11Y2ggYXBwcmVjaWF0ZWQuIE1heWJlIGV4
dHJhY3RpbmcgdGhlIHRlc3QgcnVubmVyIHNvIHRoYXQgd2UganVzdCBuZWVkIHRvIGluc3RhbGwg
dGhlIGJpbmFyaWVzIGFuZCBsZXQgdGhlIHJ1bm5lciBoYW5kbGUgdGhlIHJlc3Q/DQoNCi0gSWYg
dGhlIHRlc3Qgc3VpdGUgaXMgZW50aXJlbHkgdGVzdGluZyB0aGUgaW50ZXJuYWxzIG9mIHRoZSBw
YWNrYWdlIHdpdGhvdXQgaW50ZXJhY3Rpb24gZnJvbSBvdGhlciBsaWJyYXJpZXMgb3IgdGhlIHN5
c3RlbSwgYW5kIGl0IGNhbiBiZSBhc3N1bWVkIHRoYXQgdGhlIG1haW50YWluZXIgcmFuIGl0IGJl
Zm9yZSB0aGV5IHJlbGVhc2VkLCB0aGVuIGNvbnNpZGVyIGlmIHRoZXJl4oCZcyBhbnkgcG9pbnQg
aW4gYWRkaW5nIHB0ZXN0cy4NCg0KQ2hlZXJzLA0KUm9zcw==

