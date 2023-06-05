Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E12EC77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 16:31:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web11.13566.1685982694775216901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 09:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EE1TlK1j;
 spf=pass (domain: arm.com, ip: 40.107.21.59, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUcbEbz9S8VtjOsgyM/a5aln/kRjbRYGgcrX3LujyQ4=;
 b=EE1TlK1j5UA+SJ56mHiwpkPMb+b9wzu5w3wgFx3l3vOTvrDuzSrcVE/+F+mrgb2TDUsv6CFXWXUHV53i8e+p7uv212aRGtHyzWst3MbZYYFHIn4K2TJ+xVGSRBABPQV62qlfo43vJBsCjivDvCAhCrBYPR6mZ0EyWUttxmoHhMs=
Received: from DUZPR01CA0324.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::29) by DB4PR08MB9141.eurprd08.prod.outlook.com
 (2603:10a6:10:3ff::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 16:31:31 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4ba:cafe::d) by DUZPR01CA0324.outlook.office365.com
 (2603:10a6:10:4ba::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Mon, 5 Jun 2023 16:31:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19 via Frontend Transport; Mon, 5 Jun 2023 16:31:31 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Mon, 05 Jun 2023 16:31:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8836c247be0d0afe
X-CR-MTA-TID: 64aa7808
Received: from 8c87e23cec9a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E5F550E5-8135-4D06-A0C3-C61E721CA7F7.1;
	Mon, 05 Jun 2023 16:31:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8c87e23cec9a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 05 Jun 2023 16:31:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6viKtGKU7fMRGFSt0ri11ec9UKzxKOkregGo783196K1D/BMQ8HKI7zKln7kn8VU03AgJtB97EXSZ+3ywFSYKCekijnnkZPZ8TkWIQLhofaX4X4m0ZZg4z1kGfQ0bvffBI0Qp9cx327g56OeLAbnWzk6lwu+WUBAMjmja2LHXGpp+DR46scqJuiXp+rJRCAKaPL6Fz4yg8pHDb5hgnPZm4b4dWIJwySHFv4C6y4rSSNa0lZlD8qLImkO/zv7fPpy1NgJSUpxQ6glFM27kiKSZFySW0x560zQC55DNJgLz4XUoBhqAYdiK6u4uMxTQLYzxIMtXy65U6Kmcro2aPL0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUcbEbz9S8VtjOsgyM/a5aln/kRjbRYGgcrX3LujyQ4=;
 b=WLFOW5ThF0ffZ+LGgpoHiAdlqbWxxiLEeE+DHvfeXDSVZOXKN1fFkXntu62ySian86l6Yo+dwswv5wVRxFuUo35YWwxLDbLVYM87v7rcmQTmDKwfPk64IgIK4cWZ/uyoDGLPF/00sW6ekurjIICQpN9B20b2sWJpuZaG6kVbJ6kJm+gZU0/TfiI7KErsUast6ZiiyDcDcC8PmlxucT2emhh6mUunJrh0Fg4wLODJYmX0LPfRMJZRrHwBI2VOqLajeMbbWgT0UY5fwoMMABHRfNuCS9X+boCrzWv3fsP0f9S83TpNF4LNh6qpcAYei+U63ZF5l+ACXzs95tLpdrt0mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUcbEbz9S8VtjOsgyM/a5aln/kRjbRYGgcrX3LujyQ4=;
 b=EE1TlK1j5UA+SJ56mHiwpkPMb+b9wzu5w3wgFx3l3vOTvrDuzSrcVE/+F+mrgb2TDUsv6CFXWXUHV53i8e+p7uv212aRGtHyzWst3MbZYYFHIn4K2TJ+xVGSRBABPQV62qlfo43vJBsCjivDvCAhCrBYPR6mZ0EyWUttxmoHhMs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6632.eurprd08.prod.outlook.com (2603:10a6:20b:31c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 16:31:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 16:31:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH] cve-extra-exclusions: add more linux-yocto
 CVE ignores
Thread-Topic: [OE-core] [RFC PATCH] cve-extra-exclusions: add more linux-yocto
 CVE ignores
Thread-Index: AQHZl8pswGSN4IhrrEqlt2TkmL7tS698ZqiA
Date: Mon, 5 Jun 2023 16:31:14 +0000
Message-ID: <06AF5F15-5FB7-45E9-A1AD-8544D7EE7092@arm.com>
References: <20230605162546.3012555-1-ross.burton@arm.com>
In-Reply-To: <20230605162546.3012555-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6632:EE_|DBAEUR03FT009:EE_|DB4PR08MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: 9885ff8f-de34-4745-74f6-08db65e251b3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 t+BLC91ANFKYBL3HC+asj1JsTWbOQv8zyKahK/YYY3MIQPC7X0zenswNbWLoIPQgTt4XrhkpnRjvbwob7KjxgBEZIX3ien/Mg6terKmcM8cmi32hNxNeX2d3SLKPDRqARVaKb+Emaj8xi9w/9D8nbikrzavQkyBbI7IPinyXdvTqInindrsc6ZQaX6nXfjMAJxkxN5viZmIo/XkM1pjx4kHPimtUjMobA/o+zXAPKkYtt2zR9w5B4xkqZAfVH0OkefQ5+jVh9BU3xxDZ97HcvcQBstOK2JcInjiAK5Hv6IlF09B/L/ZSt3wlg/KnONpeDSZHpR7t0spQoVOI6gI4Ec8JqRu4YT0s8VH9jGkYmO8tjwAl1tqwCr1BNpLj5NgQdTMtqPb9Y9E5NM6Fv9078Ei8HWzIXzHj9LUjEiTAFvLAFQPslrZNnNU3uU72hvrKSXmG0G5OwvV1i6qmNkibtHAldEHEcVX70IYNEhwgd/ch2E3Tyi2dIaa8bA8cU0ODkV4lE5wUX9bNVEY4Aoewq2bmEbYooGb2G4b7Y9zTwMJ5Kka5GrNL9hMQTaE6oQxJzZnRIT5kBNPqngCOi3/9SMWUsv8gqw2S7zUpqad5kxpUxnGq+3MMYRX4l2wRLf4YJE0ILWbhTuKBJIwT4dXU+g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(2616005)(26005)(6512007)(6506007)(38100700002)(41300700001)(6486002)(186003)(71200400001)(478600001)(37006003)(4326008)(122000001)(66446008)(66556008)(64756008)(66476007)(91956017)(76116006)(316002)(66946007)(8936002)(8676002)(5660300002)(6862004)(2906002)(4744005)(86362001)(33656002)(38070700005)(36756003)(6200100001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <538E9142E0803B49BE2B7AB71EC01BC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6632
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f4be8ed8-68de-40fb-8c95-08db65e247b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8CtnN5Jd6TEF9QrQ3RTwuULpPTHt0krFj6kCu395SViHEcO+OH6Uj9Kt69iCZSE5BTCDAjLhB0gL0IJ94H+650pG142BbmBbXI+je8Ees9fK4SvkUizrr2loRnreilYlBLjBa3uT4zb3Psa9WKg1YKo12uViwR0jxHrWP4AoFgD8Cu/b2YE1Dy0eUbk2E1wjVyDLoVQWvXlyg7PMqb3R3+UjVVwBmkJwkRSaa1qEwl9hXJb5WnDti0GdlUoWJYIUp+X+D9xuzSm2jQd3iKAarxWmc6J32tvlUabTPWxg2Jt+FDnSlXH3pEkYr+jfNxC8emCxdAos53oVqWzIevKbJsj4dtzPaNdQT6AlSY6hbmVti5hKnDceu1a7Soga7KHNs3e/1dAeaZijlZ0/IeX97j5WM8iiWO4WYSeMe9Hzbj6HpfuqfwUAQKymRdGr72A8QHjzPNR1tdKy6HVQxgbwOQgwepMl/HGdH88f3XiZkwrbsce344BuIJe1//jd0W7alahfeSEokJ7uf0LmIm6uwWFEDem09Yt6ZhNIo47uv997QuykFtKs+JkxTpcK6hGdEdkD1HnVegE9j90/zEWi0MUzON2Fjff6K8QRz+9jLKIcFiql/4FpDbN8eXP2sFNb8PLXp+urmMZosoZwf5rttZ5rzhF/kGhHUBuy4lXpAPvs97r2ElfUtny08NLurwsqWVKqtmp/Ha4YIGSOGMOL2BfIVlb8yH5biNlDgby2EaM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(376002)(136003)(396003)(346002)(451199021)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(37006003)(478600001)(81166007)(82740400003)(356005)(6862004)(8936002)(8676002)(4326008)(70586007)(70206006)(316002)(41300700001)(2616005)(336012)(186003)(36860700001)(47076005)(6486002)(6512007)(26005)(6506007)(6200100001)(33656002)(82310400005)(86362001)(5660300002)(2906002)(4744005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 16:31:31.0630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9885ff8f-de34-4745-74f6-08db65e251b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 16:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182397

SSBkaWQgc29tZSB0cmlhZ2Ugb2YgdGhlIENWRXMgaW4gdGhpcyBsaXN0IGJ1dCByZWFsaXNlZCB0
aGF0IHRoaXMgZmlsZSBpcyBhIGJhZCBsb2NhdGlvbiBmb3IgdGhlbTogd2hpbHN0IHdlIGRvbuKA
mXQgZXhwZWN0IHBlb3BsZSB0byBzd2l0Y2ggb3V0IG1vc3QgcmVjaXBlcywgd2UgZG8gaGF2ZSB0
byBleHBlY3QgQlNQcyB0byBzd2l0Y2ggdGhlIGtlcm5lbCwgc28gYnkgYWNjdW11bGF0aW5nIGEg
bGlzdCBvZiBleGNsdXNpb25zIGluIHRoaXMgcmVjaXBlIHRoYXQgYXJlIGJhc2VkIG9uIHRoZSBj
dXJyZW50IHZlcnNpb24gb2YgbGludXgteW9jdG8gd2UgbWF5IG5lZ2F0aXZlbHkgaW1wYWN0IG9u
IHBlb3BsZSB1c2luZyBhIEJTUCB3aGljaCwgZm9yIGV4YW1wbGUsIHVzZXMgYSA1LjEwIGtlcm5l
bC4NCg0KU2hvdWxkIHdlIG1vdmUgdGhlIGtlcm5lbC1zcGVjaWZpYyBleGNsdXNpb25zLCB3aGVy
ZSB0aGV54oCZcmUgYmVpbmcgZG9uZSBiZWNhdXNlIHRoZXnigJlyZSBmaXhlZCBpbiBhIHJlbGVh
c2Ugd2Ugc2hpcCwgdG8gdGhlIGxpbnV4LXlvY3RvIHJlY2lwZT8NCg0KUm9zcw==

