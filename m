Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C479C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 12:39:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.89])
 by mx.groups.io with SMTP id smtpd.web10.10323.1707482341812558089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 04:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Q7FpAnql;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Q7FpAnql;
 spf=pass (domain: arm.com, ip: 40.107.21.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=n6nEfTkYMXvVa0DdclsLR3XxZ+kXPGutZeqHKPodyft1Ov0QZo0Rt6jhPkbyF1Nu89g4sRmjpPDFZyAavtNV34q6N3YX1M6xRH3F1DMAf/XzsjyHn1h18h4d+Zw4UI4XQI7F1DcS7XeRym9d1vCfuCH1lO7WStuTzBryftY7osWI5xfAy1dDcgIoIceWuNDJ2893ZvsI1B1+5KIHEzOl8q0uJGWRgiKWGIkUkbpTyTiXCFbRlws34YYo9RLwPPsEQQFUIlwBrs4z2Tfk60dUej5UZK/1xRYhJWRtSMiYxLnR6ou+wI0W0A0xvalARsCSIgJDsFIgZx8dF8wVrMdyeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAgUvYM5hGt6SAQEofBvuh/pV8YXDx6YHOXgyW6XqwE=;
 b=KfNHBV8Df0mUwVKOzIgLXEgPlyycpxxf2cH5Q7ZC+yMugsTm2DQOfkPSGx8vJz8RZ+ytl1M/kh90/wAoCipfXhvX4RvzyaScVO3j6F9uWy86PiE6CoUKlhTRnN8LZjxdwNZYoSsXXSLsuavI1QTeB5PPgNYLVc3U+8jKoiCLgK1hSmAomu1xlAq9uRx2gqBy2wOjDp6C6CdE4ThAac+0jfYeda3FRXpEFjapA5tgnpIifYAz/xyfGqXU56XHMoMFMvKLzKd9ApjrTsU0JRVsVYoQ9s3+AxkTu86UP9IAxo9DEGZs7ABDcV1D5+yxDkwtC9GZE0uYq6ZoJQureJ2ojw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAgUvYM5hGt6SAQEofBvuh/pV8YXDx6YHOXgyW6XqwE=;
 b=Q7FpAnqlfaKTBqQBBw4/EXPvEK4gSsfmfvhJT9qUVRR1WP+jnMZ67boza2gvXAevuYjHAAGEeIclBoiU2SAuZDuy0wZwz22utcEw12UspDbK0zGU0F0caYfQm9IYPOA4ZTKhWOYKo/K5VgacyCXSoJGcHw/vURpFL/uAQJVwguc=
Received: from AS9PR06CA0718.eurprd06.prod.outlook.com (2603:10a6:20b:49f::33)
 by DU0PR08MB7592.eurprd08.prod.outlook.com (2603:10a6:10:311::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Fri, 9 Feb
 2024 12:38:56 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::23) by AS9PR06CA0718.outlook.office365.com
 (2603:10a6:20b:49f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37 via Frontend
 Transport; Fri, 9 Feb 2024 12:38:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Fri, 9 Feb 2024 12:38:55 +0000
Received: ("Tessian outbound a064b9944658:v228"); Fri, 09 Feb 2024 12:38:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f89db88140cb5101
X-CR-MTA-TID: 64aa7808
Received: from 9f5dcaa515d0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4FBE6FFD-5DC8-4061-9E58-11FF8B48672F.1;
	Fri, 09 Feb 2024 12:38:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f5dcaa515d0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 09 Feb 2024 12:38:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmoCh9lOkgQwFKMTv4sKUR1CeLe6MZ97ah8iqajUO47ZR9y8DQbCQAbqO28o0/qNgMilQmUbbi1FiXQ0c56JEjubQ0Rm4P9alPUGHrs/3/9wV4E2+/DFrnBksk+EpWjYCg3xDUtSWJkbf/jK5Hhad1MX5hxpgHrvsy/gH0HkbFYvVCW2pOA5vG96v3cHDt7xHPBsSS9yXAMUMb0MCCACluVdkry742JHjPvdKxD1dtEAJKYYm9kt64I2xIyLbI6O/CQ9ZG1DqdFTmweXQFZh/U4kIy+46oORuOHPb7OAKAtpEXi0IH9nItqZM1rSR33DQdOwSQVxC8z3QXJRogENoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAgUvYM5hGt6SAQEofBvuh/pV8YXDx6YHOXgyW6XqwE=;
 b=mgWCm5w7G/uhAq4SQqOF2UKBdXkeczmLyMPV9VKjn5z9E60Mxfivb79F0jrGJc0D8t77WDqv/oBi/l8/Fa3n3MGtDzVRqnZDDUoojyEu/sp50G8xSd15wqCp3aMv4Hr8F11KV4UxYHZLH7MzxcUQE1yTmN0IYttviLtQsAQmpyTT/GIc9SrozbtywrPHRScoxKaWb2l/5ZZa+e+Y3bXy+4KrKXc3BNFGuxxQ9wA6DapreqYBjpQdyusTX+6k9s79ZVD0CmMUTRn9SPr43/kK03ESbRr9G9dhX+5hhWVeV3pw7vMoNXkkZKURs6BidMm2CdWv0kuMYCeGh62cxdJvBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAgUvYM5hGt6SAQEofBvuh/pV8YXDx6YHOXgyW6XqwE=;
 b=Q7FpAnqlfaKTBqQBBw4/EXPvEK4gSsfmfvhJT9qUVRR1WP+jnMZ67boza2gvXAevuYjHAAGEeIclBoiU2SAuZDuy0wZwz22utcEw12UspDbK0zGU0F0caYfQm9IYPOA4ZTKhWOYKo/K5VgacyCXSoJGcHw/vURpFL/uAQJVwguc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7346.eurprd08.prod.outlook.com (2603:10a6:150:21::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.39; Fri, 9 Feb
 2024 12:38:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.024; Fri, 9 Feb 2024
 12:38:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "chen_heyun@163.com" <chen_heyun@163.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] Add user space utility:dropwatch
Thread-Topic: [OE-core] [PATCH] Add user space utility:dropwatch
Thread-Index: AQHaW0qY/d61Nx6gtEulyNnfysvDcbEB8zIA
Date: Fri, 9 Feb 2024 12:38:43 +0000
Message-ID: <3FFE1ED7-FBA7-413D-A87C-FB16ABB82ABB@arm.com>
References: <20240209112421.45771-1-chen_heyun@163.com>
In-Reply-To: <20240209112421.45771-1-chen_heyun@163.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7346:EE_|AM4PEPF00027A62:EE_|DU0PR08MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 008681ea-fb22-4ffe-fc92-08dc296c148c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EkZjgyIMan1+fmkrrS0NqX9KGfvZT0P2iKQzbk0IFOnT89QKgHDAdAnnCjsjU8x1yjdwOb9GDZZo5N/YQg1CFr7czLXtfOPkb6yvBFcyx1YBQFJRYMHhszOcL5FFIL5LAvor+dnth05z3DLn8OIalQoB4qTb3hRHPUwJRTpKhXsQk3YRwvKS+PqS42Qa/D0xNcigNhy5sayA8oETU3TplpBbiOTSr3rq+lU6qR4bKRihs8huuROfLuwCTCHvkr0ZtJ2nDIHN2BWA8iNyUcHbOPuFjJji8/IjXHJTkjSyv6VnZruu21AcGodzbGIePBbwdnF0pWEytRLxZTex4Zy5Ry747uwDjtlc4T+3QONpGaAYTHZ5mTwbPixqgEh0joEpdsB6p94RLgCFa1gwViF2RDt/6D714SKxI49BN/HV1kxjwdLs20OcgaDO7o2UcJ1UOWdks5TLEN665NlDdNE11sEKsJ+GOZfgCB3lsaJYe17Irv2fL+D8ZqzIjs1vfBkV0UaB4A7YaG/hFsM1iK9iVjVGiwi8j6XUmOwbnQ63EOzvhhVUrqEmQftuzCpKTUtrG5JkH7AKHjc3mhqOCPCJAE3/Sil/Ji7Zo317t0oRdS5e8fKOIL4cOn6jZvRQYc+8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(4744005)(2906002)(41300700001)(64756008)(316002)(86362001)(66556008)(4326008)(6512007)(6506007)(8936002)(5660300002)(66446008)(6916009)(6486002)(66476007)(8676002)(76116006)(53546011)(478600001)(71200400001)(26005)(2616005)(66946007)(38070700009)(33656002)(36756003)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <714253F09DCEA24E938956218023AB2A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7346
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6068da26-df63-46ae-9c5e-08dc296c0d03
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pI7k9iSeYD2PNgfb+6JfdhYlik57d8plL1qPKVYZ0oZI7Bwwz36MJN5AkdJ+aiJW2EgVtcaXgAbtfc/208nRmZnGpw2m4bUaJNpfMFca7mVNID5UP5xCXEAXeTcWhVb2IZeld6YbSWo2nhvzXif3DhrVqocALonOZOaD7RZezsdX8+TLKEWAKXOlvjJ7CtpyC1LKIWNy82N45E0eJo2f6shcEvYyLrGG7dXiJ1w3HLoljKOsndDDnu1MT2tF65gwcKwcJecslt7GdC1T6+S/oqznbVSPsHZb1XWu3hd2H6IxSddrtqWTmdjTtQKR3muIsRvLseLj1TS8urXf6RwkGDTeSqF1NTGMBaLnFr6K9R93eYUl2MkxQEvjlz2XqmO8FklEj7VyeMapFS9PAexC0Z8jOJ0+nb6ZVmn46iVyC2eq7gymw6P2L3iw+fNXRG0dbGZ6d4sQtDI/9quaoyOChoUNgW8u4Pj/+/1KiwkYKw4JRCzVEpBDf1pF7sHX1w+2mlmZ+0fuAGg0tuGOywXzkxhsGKIAx66z3HL2oM6F0U5xipnYPsxROmR7kSz8IRtNEq1M6ciby1Zk1RsnwneySpWx9+/GeNIcwMUqMBcLuP8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(46966006)(36840700001)(40470700004)(336012)(2616005)(86362001)(26005)(41300700001)(6512007)(5660300002)(6486002)(2906002)(478600001)(316002)(70206006)(4744005)(70586007)(8676002)(4326008)(6862004)(36756003)(8936002)(53546011)(33656002)(6506007)(81166007)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 12:38:55.7289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 008681ea-fb22-4ffe-fc92-08dc296c148c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7592
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 12:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195207

T24gOSBGZWIgMjAyNCwgYXQgMTE6MjQsIGNoZW5oZXl1biB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8Y2hlbl9oZXl1bj0xNjMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiArU1VNTUFSWSAgPSAiVXNlciBzcGFjZSB1dGlsaXR5IHRvIGRpYWdub3NlIHRvIE5ldFdvcmtp
bmcgcGFja2V0cyBhcmUgZ2V0dGluZyBkcm9wcGVkIg0KPiArREVTQ1JJUFRJT04gPSAiRHJvcHdh
dGNoIGlzIGFuIHV0aWxpdHkgdG8gaW50ZXJmYWNlIHRvIHRoZSBrZXJuZWwgdG8gbW9uaXRvciBm
b3IgZHJvcHBlZCBcDQo+ICsgICAgICAgICAgICAgICBuZXR3b3JrIHBhY2tldHMiDQoNCkEgdXNl
ZnVsIHRvb2wsIGZvciBzdXJlLCBidXQgSSBkb27igJl0IHNlZSB3aHkgdGhpcyBzaG91bGQgYmUg
aW4gb2UtY29yZS4gIEkgc3VnZ2VzdCBhZGRpbmcgaXQgdG8gbWV0YS1vZSBpbnN0ZWFkLg0KDQo+
ICtTUkNSRVYgPSAiODUzNDU3Yjc3ZGJjM2Q2NjY1YTM3OWYzZmUzMWVjNTNmMTFiNmY2MSINCj4g
K1BWID0gIjEuMC4wIg0KDQpUaGVzZSBhcmUgY29udHJhZGljdG9yeS4gIDg1MzQ1N2I3IGlzIHRo
ZSBjdXJyZW50IEhFQUQsIGJ1dCB0aGUgbGF0ZXN0IHJlbGVhc2UgaXMgMS41LjQuDQoNCklmIHlv
dSBuZWVkIHRvIHBhY2thZ2UgYSBwb3N0LXJlbGVhc2Ugc25hcHNob3QsIHRoZW4gc2V0IFBWIHRv
ICIxLjUuNCtnaXTigJ0uDQoNClJvc3M=

