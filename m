Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A379CC4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 20:35:56 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.48])
 by mx.groups.io with SMTP id smtpd.web11.2145.1702326946746959751
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 12:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ABa4jAgF;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ABa4jAgF;
 spf=pass (domain: arm.com, ip: 40.107.13.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gZiMOb05K01APtIqgGtYpsBJxh6L5JE11Ug5HjXyhpbNLwkAQmhMmrjkCn+6m4Hf3IFPZ5k2YDr9jdH6ULNheHNg8RyMwKXuZ/bs6BzZNMwHp2fLgON3y+hl2Qg38FbWu/7as0ifHET1fAqfv8j/VkymhGs9ycAiiG0EWZyFsROlDUEXAtuOlBA/A4dx+ePdifNsn8yBLEaJiAllLRn6gRx8277ILujfnYzKoW6m9zW7VY6+hqTWzQO9whhjOU4E1IEq3VQju2fN9RxzhFEBx6PWluuuhFM8lEhPuXV+z552sQ9vokkHnE96oxJOjHCIK4Q2WxB/m4vYWcaM+WXyFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auy+iq5pe0OK2VlVqdRbUavCSlE/cesA+H8w9ZwoXYs=;
 b=TIEbXtmGgyryAJFrMDBrv/ziaJHlH9oJYEj1B3KJxevIQYfFAhYzvzhh8A0GE4tBaUldB1BTDmI9U35aHjYonMXKHxTN1zxgMVUIKoX2CqzNY7KRxRhllLGVzL6WAuRQ7Ql7/xtALOrKjVGzn285laqQwKiBy/mrI0Mg7XY9aCfJSsml5B8IAuvI6wa8joQN8PUO6fPCYMn1ajaVp9i5CLNsj+bHmsjyvGdlr1vtK/FcBZkWmTCt1AiBQWsSyte3ng8XTV0mp5L636+YRIpETaWKnCvGG3SOHbzyn2kY4ikNaJ/HISIaitgfOxX+NIzUOUVqdP6fW1IvuZxu+lyfwQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auy+iq5pe0OK2VlVqdRbUavCSlE/cesA+H8w9ZwoXYs=;
 b=ABa4jAgFsNd49c6C667/lA+kwDVXYPYO7DTL30IZ0JC1g6hrXN3dR22Y90IoYy6Hd+j8433ekDYWe9r0ByjbbGyQX980STebSvOTdBjxYTJAjIRp0vczw5FmFTzjPuvB+LBRUTfw4S7RyLikE9TkjGQZPOJifBUGz1yKtfh43R8=
Received: from AM8P251CA0029.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::34)
 by DU2PR08MB10280.eurprd08.prod.outlook.com (2603:10a6:10:491::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 20:35:39 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::33) by AM8P251CA0029.outlook.office365.com
 (2603:10a6:20b:21b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 20:35:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 20:35:38 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Mon, 11 Dec 2023 20:35:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 12544a3f551a40c6
X-CR-MTA-TID: 64aa7808
Received: from 479e97fa1ed9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FFB8FA35-3257-4A27-988A-2DAA96AAC301.1;
	Mon, 11 Dec 2023 20:35:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 479e97fa1ed9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 Dec 2023 20:35:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQgIorgaNbHzqwHzMxd0LuKPyt9+tEIN3SgbuEa41WCNDN0doNStSOx6ck/iFUYGb5Vjga5LxT7Ih1Oem8XvDETPEvErj8c4+kLQ8eb8oxztbfrLCSZZZu8spB57jn9JXAyN7qLWmYxeXVg5wS7Pgu7zklqbs3Y9RfYuDdf8Cq6yLiybzAlpTFJ+Lo55jz2sZjPXavbEOQKn2Y8U1FHtfLn2CrzZSUSBVnqnsKfV0uVj4oaf6G3y2VOb9rmuoomcg1/54X8QpL2AC1zZniJe9j61CbqsitEI5HkjC9nJrNaOwyrCqdOEVhc/nzTkbt+/Zs/oiMG4H7Tfvu8Zdg2Vig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auy+iq5pe0OK2VlVqdRbUavCSlE/cesA+H8w9ZwoXYs=;
 b=Poq2KTKEGm/gVS0tc4p8A+RwbXWjZO6JJsVROnl3caF/nGFgpJozYBlpyrnQbdq9n+b3Up5C2bcUdb1JvXMLY5VEbvzHKhEVZdGdWmnhzraIhGV+aU/7unaseHI2yhIEQ+Mcb5Tld7KcJ3NYmEIJMRVJTvtpRRVaXOeIfSl+zWSYFNPKNKP1+Y45I1ZwdYzpJ724YfQ0AX4Ys4dkYh+Sf5wkFcaz7uBnY7d824DMAfwQl1J+6k/GR5Eg5KTpc18MM0GPfyMTU5rO64aaFPWXJnnCNhNsUd9PVcHG52yFPoNC5N6sZfhUjSknI51n74Cf3QX4Mpy1TdZxjRzmvq59gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auy+iq5pe0OK2VlVqdRbUavCSlE/cesA+H8w9ZwoXYs=;
 b=ABa4jAgFsNd49c6C667/lA+kwDVXYPYO7DTL30IZ0JC1g6hrXN3dR22Y90IoYy6Hd+j8433ekDYWe9r0ByjbbGyQX980STebSvOTdBjxYTJAjIRp0vczw5FmFTzjPuvB+LBRUTfw4S7RyLikE9TkjGQZPOJifBUGz1yKtfh43R8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7870.eurprd08.prod.outlook.com (2603:10a6:150::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 20:35:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 20:35:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH RFC] bitbake.conf/pseudo: Switch from exclusion
 list to inclusion list
Thread-Topic: [OE-core] [PATCH RFC] bitbake.conf/pseudo: Switch from exclusion
 list to inclusion list
Thread-Index: AQHaLFiWb5LON9Rz5ki7EfTJOrJXQ7CkimuA
Date: Mon, 11 Dec 2023 20:35:29 +0000
Message-ID: <EB76304D-B0BE-46D9-83D7-A627844088DC@arm.com>
References: <20231211173553.2421931-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20231211173553.2421931-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7870:EE_|AM4PEPF00027A5E:EE_|DU2PR08MB10280:EE_
X-MS-Office365-Filtering-Correlation-Id: 710a034d-83ab-4a0c-7b21-08dbfa88bc87
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bV4O2NZOsZKwNpa2C3wbomGf9L4tQEeLz+Q6PvjVZxtXHD3HRD/FQNZo1c9kPCDHc3EdKb58v/W1eQJLExZaSijP8e16Ep/7tjhHXOgQJQt/7fPI6O4W3tTR5lugVa2zl87KtV5J4A8P7vjtaFbTNyqA4YZmit+u4KCSexYmG9BQtfvqN+a9lvMJ5G8HzOEb0Zfp0FtbudAm9ktmvBc5OkUByDtm90UtcGXE+j0HzitVQJqZUwkkv8e5Mdewx7gWyAVqmy2cHKME6ijGGBNahmONcDsp7VyC4aZ7xspfQu1WX8a8MB/7mt8W9zwuM5IxyZ6/GbL+qjKprKb9voVRqDZibkBJVUZ+7R8MNCb5tInzqTuM7b0I1ahFHUvfBHJrzoGYm0xHnS04VQt8cQe5eS093O1CUtwrlZMow8J6bKsBga6vdtMVUTEkYtByhSjnH6kB3FdPsRJraRFM2PgqWYjNsxbxeTlIpgjc9c/dAC/T7fXjbopGz7OTl5prhQ2lSRWkxi81xn5DUTRKS+CxCCjonuM8+US2l01Jmm5IsQ5hO6zYNbckOGxODDUGxXCF64aiBT5tqRtAmiGUZl3w3vgArzEOqb4IMoFK2EZgaNPsPd2l5xVyvi5d2E7gv2LO
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39860400002)(376002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(53546011)(6486002)(26005)(2616005)(6506007)(478600001)(71200400001)(6512007)(38070700009)(38100700002)(86362001)(33656002)(36756003)(2906002)(91956017)(4744005)(5660300002)(64756008)(66946007)(66556008)(66476007)(66446008)(6916009)(41300700001)(76116006)(122000001)(316002)(4326008)(8936002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2D6DE0E0818994BB2E4024A09906552@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7870
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	04427865-af5e-4544-00f0-08dbfa88b720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KAC58MhaJKztOEPOzgmsqcqEjR0VOna0pN3h52YPgHQAiGHs9dtyC/bURFt0lOItBL4yE7HSagxh4sGBpWJ+TIjkgkWY6/VjxPf6fgRYwx8O8+SbOVQ+yjUj8/Pb2N5zi899o0xrU3j5ZeyzD5vX27qN1WVsyNKJQYXiggx1i7h0KnUpmmFezZnULvfZOKMp843r6gOCqxhxsWSnLq5KDSCDRAHMBQm03nZAMy2mWQ24BxX3ti8lP6N6MyZPl8fcYCVeg5AhPhHvshcjCimNxc+BHwCsVvCyvXtApP13YLRUuZUWcUqJq9xb7fQTwS2ZE7b4VExhnGu/SQNddhtjt8NwekAIhOzmg/XNbdMOdq4Kwn1MpMbOhpg5GhIi8hQc9SUxcIOy490OudfHYv7ifvoisELNvP4/ErNWItR/MAHgFb795TiCvVaiqcispjZ+tMzD0On6bj2ySpg2/SnxFuieOiEU0FJ3yxnyEGRhMbUus6XMHyAjtYhICxKpG5uw4/2YOTtuwAlxO19Yw1tDgj2qQx9NC/J/3YVYKynRhPwlFLoXsoNUwRKvW+G595VOtmNCO+741Ap5Ov26kAdpb2vfdRs+WkWoKJFX29r3keTrWM14BMmMjXBuDDuL8vBkh4lRg8jnNOSFcou8mjkj0mjHjK+KT/A9nCL09eoypmDnxGIqRjVedhwPQ+8d/kZe1p8HpU/ZmbgVO6laevcHDlvqqkKkHcIb78Fcm6ar37U=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(376002)(396003)(136003)(346002)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(81166007)(6512007)(336012)(2616005)(26005)(6486002)(478600001)(47076005)(6506007)(41300700001)(36860700001)(4744005)(5660300002)(2906002)(70206006)(316002)(4326008)(8676002)(8936002)(6862004)(70586007)(356005)(82740400003)(86362001)(33656002)(36756003)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 20:35:38.8080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 710a034d-83ab-4a0c-7b21-08dbfa88bc87
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 20:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192185

T24gMTEgRGVjIDIwMjMsIGF0IDE3OjM1LCBSaWNoYXJkIFB1cmRpZSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cmljaGFyZC5wdXJkaWU9bGludXhmb3VuZGF0aW9uLm9yZ0BsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEN1cnJlbnRseSwgcHNldWRvIHRyYWNrcyBhbGwg
ZmlsZXMgcmVmZXJlbmNlZCB3aXRoaW4gaXQncyBwcmVzZW5jZSB1bmxlc3MNCj4gdGhleSdyZSBs
aXN0ZWQgaW4gYW4gZXhjbHVzaW9uIGxpc3QuIFRoZSBleGNsdXNpb24gbGlzdCBoYXMgZ3Jvd24g
dG8gYmUNCj4gZmFpcmx5IHVud2llbGR5Lg0KPiANCj4gVGhpcyBwYXRjaCBzd2FwcyBQU0VVRE9f
SUdOT1JFX1BBVEhTIGZvciBQU0VVRE9fSU5DTFVERV9QQVRIUyB3aGljaCBpbg0KPiB0aGVvcnkg
c2hvdWxkIGJlIGVhc2llciBhbmQgbW9yZSBleHBsaWNpdCB0byBtYWludGFpbi4NCg0KSeKAmXZl
IG5ldmVyIHVuZGVyc3Rvb2QgdGhlIHJhdGlvbmFsZSBiZWhpbmQgZXhjbHVkZSBvdmVyIGluY2x1
ZGUgKHRoZW4gYWdhaW4gdGhlcmXigJlzIGxvdHMgSSBkb27igJl0IHVuZGVyc3RhbmQpLCBzbyBJ
4oCZbSB2ZXJ5IG11Y2ggZm9yIHRoaXMgaW4gcHJpbmNpcGxlLg0KDQpSb3NzDQoNCg==

