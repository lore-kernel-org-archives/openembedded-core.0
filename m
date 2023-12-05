Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F487C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 13:24:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.73])
 by mx.groups.io with SMTP id smtpd.web10.100242.1701782666807638445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 05:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ee6W4pvo;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ee6W4pvo;
 spf=pass (domain: arm.com, ip: 40.107.22.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZcCdGhg1AOqa58aMcvEV6UvDvZr7C7CxN1YXofAmGMUxCkNPONokyGb09kHLgvIJ0j6m8+cUBO8VcPJmEeHo4GOd4EcXPPrtfIE+PUW+NMv42gfKsKtxEqa7rYjt3yH0H7Qk5P2hNbQK9KLIpGSmvVdPoWmvoq8Lpal6Uanu9onKjdmLzhHSpoofPoidJG0/b8ZbqANXRiVdiVa/I4wqx4kwGI+WC7i5qkrMD2VnzBpbm5Q4UYgt1bYIvj4Q7+ppjUTjxFd1RXbb3myZDvrR4kzfQpZvDqt0/dgMD7UU7+F51tFjF4Qshkq8Xx2vWC42ICxwEzYQrxXSk9Fp1IJgAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p20TEuOMMFXCxxR48fJJuOdMgfU4NXLsL0REBl1iaFU=;
 b=DQbQG99JoJq3CF2BmZeZJPLuTtpRou+58xvG7IiEclSujXO8oabTjkrcQB4k3IhTeLaIbBsZvxVzJG0e/te1d+xNxuHA3HqGeNBcSlHZL7pCl6hDBZ19OQbdJwwqN07MmoOGa0f4PK2MeILrMKg0HW3a/DbAwQS0SB8HKLQHhrV5Tza1dA8SpiERFiyzqeNWlj+LDdkGuEbs8PDAnFxqvhipYTifTc88cXhFtg8SKuILc4SqGTTOOgGisYcHsusS3nkY/94lGsffe2dx8AFgXn6QwzOP6Jc3n5uG2xQMb9Q5FKc55RE4rzEa3kykryuLPZxx5/RxDzfEtMb1rq2Dcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p20TEuOMMFXCxxR48fJJuOdMgfU4NXLsL0REBl1iaFU=;
 b=ee6W4pvo4YfICCFLN3U3aJbaFv2uoEvZOe9bf7+Qcmf+6nCzLSUs4UgzA/Ys2DpeuOMN1Z5CT6jbyiYZJj3hOmuo+G1JkRbhhlsPPBSTNJaIM7wk4ddIS2PSr+LlCp49L8m/A5E8grNR5wlrQAM+tgwkLRk8zfiKqEnnMQCfwwI=
Received: from DUZP191CA0070.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::20)
 by AM8PR08MB5796.eurprd08.prod.outlook.com (2603:10a6:20b:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 13:24:23 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::6b) by DUZP191CA0070.outlook.office365.com
 (2603:10a6:10:4fa::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Tue, 5 Dec 2023 13:24:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 13:24:22 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Tue, 05 Dec 2023 13:24:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b7607761569d9b8f
X-CR-MTA-TID: 64aa7808
Received: from 8e20574b1dd5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FF25E6C3-194B-4388-A17A-A073A876CE96.1;
	Tue, 05 Dec 2023 13:24:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e20574b1dd5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 05 Dec 2023 13:24:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lC6C1v3uJb3GAt8tb3Kv3EFkASme5jE9YFOSir4A9p4HOIXbneE7TK/y5v5aiHSFhMoins8kEplibF0gtE5LrbR7zNUGuBCSp1r31C6CvluEp9GtgQYWzKPneMneJzCM4TTTkUdjocZ53H2Ajw0JdcaKcXH2PdUaMvV8kZ1gMfrK3aFXTswv5Rlzls8wd5TfbvF83OlABwFtJqzvbidm6YyNsmgpEhwvEJSJ/5j4wfnizdQ6uan3TtZ09GKCi1T3SEpumQAAPOsYP9YE1Uy68+oLU52YSIeYHLNG1u5sTF8kA1voBF5YZelD6Zk/fN1KUXQ0dP2hTDly+VS8/rGdHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p20TEuOMMFXCxxR48fJJuOdMgfU4NXLsL0REBl1iaFU=;
 b=PQxosaaWL6FUx/D7mH7WBdSaNsAle1hkSkm52rCubGoo7m0iNjRQJztZsqkughfSORuxI1mziPFBCzZKwOFqAtD7mBprWTi53+ASS+DwDW8WSp6JsO/p9wGqOcEAvXwxcrLpz0oXWtuGEUX1ScNmjl4cv5KyrgStfyxf2I644LK0kAYM1MoI6tQSbneptz+ZMFsZtFEgByCRS3MJj6yRdocf16Y90e2WXjp8d81oZY4OldGnz2n9cvs0GvPYZC8oqbLH1otbb0wqoGzXeaxuG6IWMDe7hgYDy34ub6bvuXBjg7jpujVkQUvxTPCXILOvMVQ2hLDuDJPNttiyvrLc6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p20TEuOMMFXCxxR48fJJuOdMgfU4NXLsL0REBl1iaFU=;
 b=ee6W4pvo4YfICCFLN3U3aJbaFv2uoEvZOe9bf7+Qcmf+6nCzLSUs4UgzA/Ys2DpeuOMN1Z5CT6jbyiYZJj3hOmuo+G1JkRbhhlsPPBSTNJaIM7wk4ddIS2PSr+LlCp49L8m/A5E8grNR5wlrQAM+tgwkLRk8zfiKqEnnMQCfwwI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5675.eurprd08.prod.outlook.com (2603:10a6:102:8a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 13:24:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 13:24:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] linux-yocto: update CVE exclusions
Thread-Topic: [OE-core] [PATCH] linux-yocto: update CVE exclusions
Thread-Index: AQHaJ349epU7pDmrgUiYBPmN5BnQz7CaraSA
Date: Tue, 5 Dec 2023 13:24:13 +0000
Message-ID: <16A4803B-3DE4-4FE7-B899-510953C3E0AA@arm.com>
References: <20231205132311.2485515-1-ross.burton@arm.com>
In-Reply-To: <20231205132311.2485515-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5675:EE_|DB5PEPF00014B8D:EE_|AM8PR08MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 08cf0136-1d45-40a8-c4d5-08dbf5957e9b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SqkgNJQaZMucAzQ3R4oJsjbPfWGnqnvF6hvpL4R+YQa2YsY/clX7q5ZGrVv1BXnPiJoQjETUjCDuL5eKik/wpV07mUX/ZBMeBB+1N0J9K0k+0zgRXsVeCo1onimAIw02RJ/oYQs+lRiHAo6Aah5ipS8ehWiy9qSg9MP83g2nG4DX329AddHWB/2cAQcdRvJY4haQWx6PAs9rLPudIJ+VMSGO1plRC6XaV1PR/NisNTB5CGTWgH7NrLSXqz0A0I0LWOh7LLPtYv6KhqM1XV3BO++RMEvj7C8nfarsuW+QHFebzVas7wbPVNjKm96ll5nT1AHM+U0I4eXbuaq/zSeW29q6aVHtNiP97poXs5yerkhKs3/aL37Maew8QxG71SYznxjyY9zo+R+IiUHrlkiqXmoqUzMUMtWG8D6RCJ916IC0sDbbioXFNfbUUXILOl78Gl/s45+7E5e91MtbaWPNo/g1cGsQU25E7J9Z5ids3a9tO7Blocbl43XxKmXiGFlWd2qm+c4g2Fu2t7YKZYjLGD9TX2W5ic6kbr4nOfJjoGJuSj07KfFXy5aVrrP4HsJlJSw/wQbC0+4kguCF4as6w29pgYxcKG6u81QANYX9yHTkQRj0P47a6oLvb1qEBkNkTnlziNwwc49o7mfeXcsNIfaMH3u8gbssxvUwlZcLeHQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(109986022)(186009)(122000001)(38100700002)(33656002)(15650500001)(26005)(38070700009)(2906002)(5660300002)(83380400001)(6512007)(53546011)(71200400001)(6506007)(2616005)(66946007)(478600001)(76116006)(91956017)(966005)(6486002)(36756003)(41300700001)(66446008)(66899024)(4326008)(8676002)(64756008)(66556008)(66476007)(316002)(86362001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B777C956FF81644FBB9CA430CEC09664@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5675
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b96bb9b9-101c-4977-af14-08dbf5957935
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0l+BfD+Ew54ebotGPlslpvveUROUAhZpkscc+Wnq1hI+O4FZbeFYOTqrQJqxBe9BNdDQqEJrTJ/xfV3OXerhZPbiQWSAfV4iv550IatsiicYlLe5wbiRxT7yGIislu7RQYYIAGTuAdLNEmu2+4M5tzvPPYzRWazbPuUDRtbhZ8QVLoRnOV/0Y5sQBmMqbGFRJoM5URMmGubg5bjYE1f817ORlV7pHToySu53A3BSYWlAigLfObhbR/WCBSlSB4t44b20m2ZECQ+MTrA78fK2s/407wCW7EtYTBqt5LyDwpqMl28VpeefMx1uqy9jAOgtEw1R/q6A5lSubOE5VGch0G0s+6MeU00Csd5cqSY/CUdUTUU3q/5hYe+coq3f4c023Ezn4Dd2694WW61KtfBGXFzKEQuPgARMKUFAd6EO4HMoIPNm+sH94q7YjHACxwD8EX3gUqkYCQV//o1hQSSnLFpYhUHjr+7Rs6IkRxV+LlL6SnbanPC+gluJVrZpOiV7jQ1dcu0aSEwn7mYieivKz2IF9KrFQvwOPjOqTwO4mfQmcjgJ1YVTaIyTQ8KxkYfx4lVbJ9XAzS7+TK3ra1SO3qTIk39ydgGYUWB8JRlCx8fX5OAHBsmPfQwquR0gfehW5ceQkrFAzBqERPKe8mSRSpkXkLO9MFymW+MLIaCs/6uwJPd7ZXCxclSdMm+7mo9FnkmUTMH3DwMgQToYUcoylLAMKYmeBvELtpTJhjk9R6cl8fscbzDUHP+4d23kBZZsL6rtDkkZn924cpY5ai9Ghg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(82310400011)(451199024)(64100799003)(1800799012)(186009)(109986022)(40470700004)(46966006)(36840700001)(40480700001)(6512007)(26005)(336012)(83380400001)(81166007)(356005)(6506007)(36860700001)(47076005)(82740400003)(2616005)(53546011)(966005)(478600001)(6486002)(40460700003)(66899024)(70586007)(70206006)(316002)(8936002)(4326008)(8676002)(33656002)(2906002)(36756003)(41300700001)(86362001)(15650500001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 13:24:22.6127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cf0136-1d45-40a8-c4d5-08dbf5957e9b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5796
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 13:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191819

Tm90ZSB0aGF0IHRoaXMgZGVwZW5kcyBvbiBCcnVjZeKAmXMgbGF0ZXN0IGtlcm5lbCBwYXRjaGVz
Lg0KDQpSb3NzDQoNCj4gT24gNSBEZWMgMjAyMywgYXQgMTM6MjMsIFJvc3MgQnVydG9uIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxyb3NzLmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFy
bS5jb20+DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJt
LmNvbT4NCj4gLS0tDQo+IC4uLi9saW51eC9jdmUtZXhjbHVzaW9uXzYuMS5pbmMgICAgICAgICAg
ICAgICB8IDI2ICsrKysrKysrKysrKysrKy0tLS0NCj4gLi4uL2xpbnV4L2N2ZS1leGNsdXNpb25f
Ni41LmluYyAgICAgICAgICAgICAgIHwgMjIgKysrKysrKysrKysrKy0tLQ0KPiAyIGZpbGVzIGNo
YW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9jdmUtZXhjbHVzaW9uXzYuMS5pbmMgYi9tZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4L2N2ZS1leGNsdXNpb25fNi4xLmluYw0KPiBpbmRleCAxMjE2
ZTBjMmRkZC4uMWUzNjY0ODFmZjYgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwv
bGludXgvY3ZlLWV4Y2x1c2lvbl82LjEuaW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwv
bGludXgvY3ZlLWV4Y2x1c2lvbl82LjEuaW5jDQo+IEBAIC0xLDkgKzEsOSBAQA0KPiANCj4gIyBB
dXRvLWdlbmVyYXRlZCBDVkUgbWV0YWRhdGEsIERPIE5PVCBFRElUIEJZIEhBTkQuDQo+IC0jIEdl
bmVyYXRlZCBhdCAyMDIzLTExLTA5IDE3OjEyOjI3LjM2NTk2MiswMDowMCBmb3IgdmVyc2lvbiA2
LjEuNjENCj4gKyMgR2VuZXJhdGVkIGF0IDIwMjMtMTItMDUgMTM6MjI6MzQuOTYxNjkyKzAwOjAw
IGZvciB2ZXJzaW9uIDYuMS42NQ0KPiANCj4gcHl0aG9uIGNoZWNrX2tlcm5lbF9jdmVfc3RhdHVz
X3ZlcnNpb24oKSB7DQo+IC0gICAgdGhpc192ZXJzaW9uID0gIjYuMS42MSINCj4gKyAgICB0aGlz
X3ZlcnNpb24gPSAiNi4xLjY1Ig0KPiAgICAga2VybmVsX3ZlcnNpb24gPSBkLmdldFZhcigiTElO
VVhfVkVSU0lPTiIpDQo+ICAgICBpZiBrZXJuZWxfdmVyc2lvbiAhPSB0aGlzX3ZlcnNpb246DQo+
ICAgICAgICAgYmIud2FybigiS2VybmVsIENWRSBzdGF0dXMgbmVlZHMgdXBkYXRpbmc6IGdlbmVy
YXRlZCBmb3IgJXMgYnV0IGtlcm5lbCBpcyAlcyIgJSAodGhpc192ZXJzaW9uLCBrZXJuZWxfdmVy
c2lvbikpDQo+IEBAIC00NTI0LDcgKzQ1MjQsNyBAQCBDVkVfU1RBVFVTW0NWRS0yMDIyLTQzOTQ1
XSA9ICJmaXhlZC12ZXJzaW9uOiBGaXhlZCBmcm9tIHZlcnNpb24gNi4xcmMxIg0KPiANCj4gIyBD
VkUtMjAyMi00NDAzMyBuZWVkcyBiYWNrcG9ydGluZyAoZml4ZWQgZnJvbSA2LjRyYzEpDQo+IA0K
PiAtIyBDVkUtMjAyMi00NDAzNCBoYXMgbm8ga25vd24gcmVzb2x1dGlvbg0KPiArIyBDVkUtMjAy
Mi00NDAzNCBuZWVkcyBiYWNrcG9ydGluZyAoZml4ZWQgZnJvbSA2LjRyYzEpDQo+IA0KPiAjIENW
RS0yMDIyLTQ1NDMgaGFzIG5vIGtub3duIHJlc29sdXRpb24NCj4gDQo+IEBAIC01MDE2LDYgKzUw
MTYsMTAgQEAgQ1ZFX1NUQVRVU1tDVkUtMjAyMy0zOTE5M10gPSAiY3BlLXN0YWJsZS1iYWNrcG9y
dDogQmFja3BvcnRlZCBpbiA2LjEuNTMiDQo+IA0KPiBDVkVfU1RBVFVTW0NWRS0yMDIzLTM5MTk0
XSA9ICJjcGUtc3RhYmxlLWJhY2twb3J0OiBCYWNrcG9ydGVkIGluIDYuMS40NyINCj4gDQo+ICtD
VkVfU1RBVFVTW0NWRS0yMDIzLTM5MTk3XSA9ICJjcGUtc3RhYmxlLWJhY2twb3J0OiBCYWNrcG9y
dGVkIGluIDYuMS4zOSINCj4gKw0KPiArQ1ZFX1NUQVRVU1tDVkUtMjAyMy0zOTE5OF0gPSAiY3Bl
LXN0YWJsZS1iYWNrcG9ydDogQmFja3BvcnRlZCBpbiA2LjEuNDciDQo+ICsNCj4gQ1ZFX1NUQVRV
U1tDVkUtMjAyMy00MDA0XSA9ICJjcGUtc3RhYmxlLWJhY2twb3J0OiBCYWNrcG9ydGVkIGluIDYu
MS40MiINCj4gDQo+ICMgQ1ZFLTIwMjMtNDAxMCBoYXMgbm8ga25vd24gcmVzb2x1dGlvbg0KPiBA
QCAtNTEwNCw3ICs1MTA4LDcgQEAgQ1ZFX1NUQVRVU1tDVkUtMjAyMy00ODgxXSA9ICJjcGUtc3Rh
YmxlLWJhY2twb3J0OiBCYWNrcG9ydGVkIGluIDYuMS41NCINCj4gDQo+IENWRV9TVEFUVVNbQ1ZF
LTIwMjMtNDkyMV0gPSAiY3BlLXN0YWJsZS1iYWNrcG9ydDogQmFja3BvcnRlZCBpbiA2LjEuNTQi
DQo+IA0KPiAtIyBDVkUtMjAyMy01MDkwIG5lZWRzIGJhY2twb3J0aW5nIChmaXhlZCBmcm9tIDYu
NnJjNykNCj4gK0NWRV9TVEFUVVNbQ1ZFLTIwMjMtNTA5MF0gPSAiY3BlLXN0YWJsZS1iYWNrcG9y
dDogQmFja3BvcnRlZCBpbiA2LjEuNjIiDQo+IA0KPiBDVkVfU1RBVFVTW0NWRS0yMDIzLTUxNThd
ID0gImNwZS1zdGFibGUtYmFja3BvcnQ6IEJhY2twb3J0ZWQgaW4gNi4xLjU3Ig0KPiANCj4gQEAg
LTUxMTQsNyArNTExOCwxOSBAQCBDVkVfU1RBVFVTW0NWRS0yMDIzLTUxOTddID0gImNwZS1zdGFi
bGUtYmFja3BvcnQ6IEJhY2twb3J0ZWQgaW4gNi4xLjU2Ig0KPiANCj4gQ1ZFX1NUQVRVU1tDVkUt
MjAyMy01MzQ1XSA9ICJjcGUtc3RhYmxlLWJhY2twb3J0OiBCYWNrcG9ydGVkIGluIDYuMS41NiIN
Cj4gDQo+IC0jIENWRS0yMDIzLTU2MzMgbmVlZHMgYmFja3BvcnRpbmcgKGZpeGVkIGZyb20gNi42
cmM2KQ0KPiArQ1ZFX1NUQVRVU1tDVkUtMjAyMy01NjMzXSA9ICJmaXhlZC12ZXJzaW9uOiBvbmx5
IGFmZmVjdHMgNi4yIG9ud2FyZHMiDQo+IA0KPiBDVkVfU1RBVFVTW0NWRS0yMDIzLTU3MTddID0g
ImNwZS1zdGFibGUtYmFja3BvcnQ6IEJhY2twb3J0ZWQgaW4gNi4xLjYwIg0KPiANCj4gKyMgQ1ZF
LTIwMjMtNTk3MiBuZWVkcyBiYWNrcG9ydGluZyAoZml4ZWQgZnJvbSA2LjZyYzcpDQo+ICsNCj4g
KyMgQ1ZFLTIwMjMtNjAzOSBuZWVkcyBiYWNrcG9ydGluZyAoZml4ZWQgZnJvbSA2LjVyYzUpDQo+
ICsNCj4gK0NWRV9TVEFUVVNbQ1ZFLTIwMjMtNjExMV0gPSAiZml4ZWQtdmVyc2lvbjogb25seSBh
ZmZlY3RzIDYuNnJjMyBvbndhcmRzIg0KPiArDQo+ICsjIENWRS0yMDIzLTYxMjEgbmVlZHMgYmFj
a3BvcnRpbmcgKGZpeGVkIGZyb20gNi43cmMzKQ0KPiArDQo+ICtDVkVfU1RBVFVTW0NWRS0yMDIz
LTYxNzZdID0gImNwZS1zdGFibGUtYmFja3BvcnQ6IEJhY2twb3J0ZWQgaW4gNi4xLjU0Ig0KPiAr
DQo+ICsjIENWRS0yMDIzLTYyMzggaGFzIG5vIGtub3duIHJlc29sdXRpb24NCj4gKw0KPiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9jdmUtZXhjbHVzaW9uXzYuNS5pbmMg
Yi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2N2ZS1leGNsdXNpb25fNi41LmluYw0KPiBpbmRl
eCBiNDA4NmQ0MzZjNC4uNjMwNGQ4MDg0NGMgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1r
ZXJuZWwvbGludXgvY3ZlLWV4Y2x1c2lvbl82LjUuaW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1r
ZXJuZWwvbGludXgvY3ZlLWV4Y2x1c2lvbl82LjUuaW5jDQo+IEBAIC0xLDkgKzEsOSBAQA0KPiAN
Cj4gIyBBdXRvLWdlbmVyYXRlZCBDVkUgbWV0YWRhdGEsIERPIE5PVCBFRElUIEJZIEhBTkQuDQo+
IC0jIEdlbmVyYXRlZCBhdCAyMDIzLTExLTA5IDE3OjEzOjAxLjI2Nzk2NSswMDowMCBmb3IgdmVy
c2lvbiA2LjUuMTANCj4gKyMgR2VuZXJhdGVkIGF0IDIwMjMtMTItMDUgMTM6MjI6NDMuMzM5MTE0
KzAwOjAwIGZvciB2ZXJzaW9uIDYuNS4xMw0KPiANCj4gcHl0aG9uIGNoZWNrX2tlcm5lbF9jdmVf
c3RhdHVzX3ZlcnNpb24oKSB7DQo+IC0gICAgdGhpc192ZXJzaW9uID0gIjYuNS4xMCINCj4gKyAg
ICB0aGlzX3ZlcnNpb24gPSAiNi41LjEzIg0KPiAgICAga2VybmVsX3ZlcnNpb24gPSBkLmdldFZh
cigiTElOVVhfVkVSU0lPTiIpDQo+ICAgICBpZiBrZXJuZWxfdmVyc2lvbiAhPSB0aGlzX3ZlcnNp
b246DQo+ICAgICAgICAgYmIud2FybigiS2VybmVsIENWRSBzdGF0dXMgbmVlZHMgdXBkYXRpbmc6
IGdlbmVyYXRlZCBmb3IgJXMgYnV0IGtlcm5lbCBpcyAlcyIgJSAodGhpc192ZXJzaW9uLCBrZXJu
ZWxfdmVyc2lvbikpDQo+IEBAIC00NTI0LDcgKzQ1MjQsNyBAQCBDVkVfU1RBVFVTW0NWRS0yMDIy
LTQ0MDMyXSA9ICJmaXhlZC12ZXJzaW9uOiBGaXhlZCBmcm9tIHZlcnNpb24gNi40cmMxIg0KPiAN
Cj4gQ1ZFX1NUQVRVU1tDVkUtMjAyMi00NDAzM10gPSAiZml4ZWQtdmVyc2lvbjogRml4ZWQgZnJv
bSB2ZXJzaW9uIDYuNHJjMSINCj4gDQo+IC0jIENWRS0yMDIyLTQ0MDM0IGhhcyBubyBrbm93biBy
ZXNvbHV0aW9uDQo+ICtDVkVfU1RBVFVTW0NWRS0yMDIyLTQ0MDM0XSA9ICJmaXhlZC12ZXJzaW9u
OiBGaXhlZCBmcm9tIHZlcnNpb24gNi40cmMxIg0KPiANCj4gIyBDVkUtMjAyMi00NTQzIGhhcyBu
byBrbm93biByZXNvbHV0aW9uDQo+IA0KPiBAQCAtNTAxNiw2ICs1MDE2LDEwIEBAIENWRV9TVEFU
VVNbQ1ZFLTIwMjMtMzkxOTNdID0gImNwZS1zdGFibGUtYmFja3BvcnQ6IEJhY2twb3J0ZWQgaW4g
Ni41LjMiDQo+IA0KPiBDVkVfU1RBVFVTW0NWRS0yMDIzLTM5MTk0XSA9ICJmaXhlZC12ZXJzaW9u
OiBGaXhlZCBmcm9tIHZlcnNpb24gNi41cmM3Ig0KPiANCj4gK0NWRV9TVEFUVVNbQ1ZFLTIwMjMt
MzkxOTddID0gImZpeGVkLXZlcnNpb246IEZpeGVkIGZyb20gdmVyc2lvbiA2LjVyYzEiDQo+ICsN
Cj4gK0NWRV9TVEFUVVNbQ1ZFLTIwMjMtMzkxOThdID0gImZpeGVkLXZlcnNpb246IEZpeGVkIGZy
b20gdmVyc2lvbiA2LjVyYzciDQo+ICsNCj4gQ1ZFX1NUQVRVU1tDVkUtMjAyMy00MDA0XSA9ICJm
aXhlZC12ZXJzaW9uOiBGaXhlZCBmcm9tIHZlcnNpb24gNi41cmMzIg0KPiANCj4gIyBDVkUtMjAy
My00MDEwIGhhcyBubyBrbm93biByZXNvbHV0aW9uDQo+IEBAIC01MTE4LDMgKzUxMjIsMTUgQEAg
Q1ZFX1NUQVRVU1tDVkUtMjAyMy01NjMzXSA9ICJjcGUtc3RhYmxlLWJhY2twb3J0OiBCYWNrcG9y
dGVkIGluIDYuNS44Ig0KPiANCj4gQ1ZFX1NUQVRVU1tDVkUtMjAyMy01NzE3XSA9ICJjcGUtc3Rh
YmxlLWJhY2twb3J0OiBCYWNrcG9ydGVkIGluIDYuNS45Ig0KPiANCj4gK0NWRV9TVEFUVVNbQ1ZF
LTIwMjMtNTk3Ml0gPSAiY3BlLXN0YWJsZS1iYWNrcG9ydDogQmFja3BvcnRlZCBpbiA2LjUuOSIN
Cj4gKw0KPiArQ1ZFX1NUQVRVU1tDVkUtMjAyMy02MDM5XSA9ICJmaXhlZC12ZXJzaW9uOiBGaXhl
ZCBmcm9tIHZlcnNpb24gNi41cmM1Ig0KPiArDQo+ICtDVkVfU1RBVFVTW0NWRS0yMDIzLTYxMTFd
ID0gImZpeGVkLXZlcnNpb246IG9ubHkgYWZmZWN0cyA2LjZyYzMgb253YXJkcyINCj4gKw0KPiAr
IyBDVkUtMjAyMy02MTIxIG5lZWRzIGJhY2twb3J0aW5nIChmaXhlZCBmcm9tIDYuN3JjMykNCj4g
Kw0KPiArQ1ZFX1NUQVRVU1tDVkUtMjAyMy02MTc2XSA9ICJjcGUtc3RhYmxlLWJhY2twb3J0OiBC
YWNrcG9ydGVkIGluIDYuNS40Ig0KPiArDQo+ICsjIENWRS0yMDIzLTYyMzggaGFzIG5vIGtub3du
IHJlc29sdXRpb24NCj4gKw0KPiAtLSANCj4gMi4zNC4xDQo+IA0KPiANCj4gLT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRo
aXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTkxODE4KTogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xOTE4MTgNCj4gTXV0
ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTAyOTkxMDc5
LzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

