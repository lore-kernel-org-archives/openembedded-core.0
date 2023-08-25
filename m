Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95E3C3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 15:17:04 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web10.322.1692976619143198483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 08:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xomAvQj4;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xomAvQj4;
 spf=pass (domain: arm.com, ip: 40.107.21.48, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpHVYS5Zhz0hNh1wFjhNCh6qvIDtLA0O2vLoeULxxUs=;
 b=xomAvQj4F35YHhB6zzVDzydLmGeUa36TL1eIacqdAT77YrCuLi1F8qmlcImgfj4r+5eXeXFTY4QZxwlRfwT172aHWOeli4vqqUeX+95HR8YNo8AO+H7X5ya1kN5fVoJu/tpY9hWSyL2c6tx6EysQMqu3AkLAB1Dzpfgb6ViPVZQ=
Received: from AM6P192CA0009.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::22)
 by VE1PR08MB5597.eurprd08.prod.outlook.com (2603:10a6:800:1b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 15:16:50 +0000
Received: from AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::67) by AM6P192CA0009.outlook.office365.com
 (2603:10a6:209:83::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Fri, 25 Aug 2023 15:16:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT026.mail.protection.outlook.com (100.127.140.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.17 via Frontend Transport; Fri, 25 Aug 2023 15:16:49 +0000
Received: ("Tessian outbound 1eb4e931b055:v175"); Fri, 25 Aug 2023 15:16:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 76f9da7e4597ede8
X-CR-MTA-TID: 64aa7808
Received: from 72768ab6fa55.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BBBD9D1A-7263-426D-9ED8-5F5DC6579A0A.1;
	Fri, 25 Aug 2023 15:16:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 72768ab6fa55.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 25 Aug 2023 15:16:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACn2kBeFmLUDKNkoAxmXqpkxoIFNp+kCWeoyyUfPuTB2WypiCwtEk2MbS3+hZbdOEvJ5f5Xp7nWiFGsAIz/ZAYedPf4GwZZ4otjZ050OE8P28hq5ceNTECd/9hXOxjJYt56/7LVeYZOlAa3Wf9OojEKXLOQxyuNDn5AFlJ1K7M3PPhBoj7OihEwf+r3n5sQEOvyc3fajZc3pkdXhvDm1KDESqFOjfUgH5UZluIy7tZuh794W9/pB4nO3kkTIwiBPYwYQZoTXBi/bSJ5P8Run4Z/u5gOazq33PFAIKJ8KTTCxQYgNtC/50Dw2DFFSOGn78vHDJdp18H650xOO++ZECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpHVYS5Zhz0hNh1wFjhNCh6qvIDtLA0O2vLoeULxxUs=;
 b=XPySQp5pzyu2mWKLXHf3aI2jz0zwoaGeIa0l7CKdoZ6akQLDFgqrqAHUt5zJXn0Xdwyg9nIUrVHKlyjGTekM1VZlrWvXzHeUjjOJGr9yRyx845VVjyV94bPruk3HDAHQh6O6sTOGiNo5SeGrS92j8UxAeRYM+HyWdjwZ2VWK3dL2leOsAIAIdGMsKgVW9p7RY6M1CTwtlRmrMlSxSgB+LRgiV04NNQhpqMQ/qhhneAtmRDIsZLc08YVNej+P9TIuPC7QKBfvRm2W/4SDlwqvbvZu82rs5ch1jcimzPQTRtvdpHNbZIaGcI2VfrdxDOhWsxjMWwPy1givZM01RkPcGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpHVYS5Zhz0hNh1wFjhNCh6qvIDtLA0O2vLoeULxxUs=;
 b=xomAvQj4F35YHhB6zzVDzydLmGeUa36TL1eIacqdAT77YrCuLi1F8qmlcImgfj4r+5eXeXFTY4QZxwlRfwT172aHWOeli4vqqUeX+95HR8YNo8AO+H7X5ya1kN5fVoJu/tpY9hWSyL2c6tx6EysQMqu3AkLAB1Dzpfgb6ViPVZQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6293.eurprd08.prod.outlook.com (2603:10a6:20b:23e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 15:16:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 15:16:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "emkan@prevas.dk" <emkan@prevas.dk>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Index: AQHZ1pC+o0PoQVk8qkmhOrshDsnwIq/7IRsA
Date: Fri, 25 Aug 2023 15:16:39 +0000
Message-ID: <7263B0AD-E44B-4E8E-A7E5-567E67DEEC10@arm.com>
References: <20230824134101.41906-1-emkan@prevas.dk>
 <20230824134101.41906-4-emkan@prevas.dk>
In-Reply-To: <20230824134101.41906-4-emkan@prevas.dk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6293:EE_|AM7EUR03FT026:EE_|VE1PR08MB5597:EE_
X-MS-Office365-Filtering-Correlation-Id: a81472dc-7491-4cf1-dd26-08dba57e4e0c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lIBOZq6TwPd7CxGsQCt0ddI9jGiBwGW07Q9l1mspac5bNO9Zmj5dkmAOt1pJA5cI0rT7nTT4u6QJVujLv4h0Br5eqgX8LXAhgl6CYTHDtAxOaJICuCX9sMvtR+D10e61ZUjDVGFY9EMRUPMN2QlNuEmA3XNEjzeHEP0JY2VlwPJQOs7kXUl2ewERylr2EtoUNlPxLVbnaqslOK60TEKXspph35YvKYDe9txkEcbsS0MNMuYgCorbPxLoPm/MdjS3odjhxMRmQaIR1eA+7fOt0W5fJrNsQTxV9U6QD+DUTv4urckkQUZNvgANG6GD9HXpjHWEHs31lr//J5IxgS1CxHBs7vPUErVtqDV8lLKm+uRBCAaGrNXMXiPoZ35IaIMfUk6ii+ywJoeg6Y/swfa6ZWkryqJDbj4W3LRBRRT7/kPxsXoUkXt2DR/4Nm87TvCa65953jhUmNDt8Zd90689cqMS/KfEEEX5H/8vDBD+b5izWrZUKvOkkp3iL3dtHHxeey3WuN1MnNyAR8PHxYoZ83vf0Ams5ysmSuDYs1XDtSXl9NPU7S75O4UZN9KyGaYnt320VkISLzb4QXiqBaJgKpQXuToT29O8j0UgVJliRBZNgSiZR/LudD84lpmTmMONLf8hR2NtSrgj7+iwo4AYLw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(366004)(39860400002)(376002)(1800799009)(451199024)(186009)(6512007)(478600001)(26005)(2616005)(5660300002)(2906002)(4744005)(8676002)(8936002)(4326008)(38070700005)(38100700002)(122000001)(66556008)(66946007)(76116006)(66476007)(6916009)(86362001)(71200400001)(41300700001)(64756008)(53546011)(6486002)(33656002)(91956017)(36756003)(66446008)(316002)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5528B8AA1CEC714F902487D25C993BE1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6293
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6952937b-5028-46cb-fd90-08dba57e47fc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rmVm8rbiqM3AomciD1+HkpZEF6Y8yW6pI3oZDcQbY+PE3NfbYjKLiLQHa6kdj3lYxwhUrvwaaf69wgS0Kj9xGK87HCunuqH1obNFA3qNhzQvs19ZTnKa+qnF9Ra/yT+5Bd67cSv21vVxZa7zVO3wv6N65GKJuZX81kbPRa+gL1irSrk6m4LrXQ2uDBWJx2ZJGKyedJt92GYxiMyp1/jF7UGMPf+wnM28jsDk9YYcfNRy9A0UZhI0E0FngT9Wts7+t9CfhC5yn8oFBLXqhEnDzoXwN44J3K5IaKiiI+AQ8y3KBfYseeMkLKh8s4ZrWXgYNYARwdrnd1Sc+OFm818qC0cj53B1Ahao8m19SKV2RDuIiFtdsXXqJdJNOX/xEoQ94AUcIK7x+EG8V5mxMNAby4WDDlL3U+YFhInM67wIIcMrYJ5Um2dU8E3+LBTsN9PVD/YTxJiSZfbVotRHQpj9LGqJEvIrhQRyRwWYxbFlrQ3a9xVF6sS3nWrqoM2JaS+TcvY2+uqsbZUnajIidHji1cJrBEmCNYs6hkaQqCO4N3sfBbg3lwTwime0eB8DcOfFp/hScF/9bOV0monFUDSAeVz7QRZQh96Lu0yizpncHjmT66nF0gxCcpADcn/UdolNxPMHt0D///ikAIaDDEorAPTAX3WvHVr63n1Xr1DssMYL91air1ODpeTWYrpYFHmAGKXx7nhoV006+NDhQlkixQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39850400004)(376002)(451199024)(186009)(1800799009)(82310400011)(36840700001)(46966006)(70586007)(316002)(81166007)(70206006)(478600001)(26005)(36860700001)(356005)(40480700001)(82740400003)(41300700001)(53546011)(86362001)(6486002)(6512007)(6506007)(2906002)(8676002)(4326008)(8936002)(6862004)(2616005)(5660300002)(33656002)(36756003)(4744005)(336012)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 15:16:49.6360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a81472dc-7491-4cf1-dd26-08dba57e4e0c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5597
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 15:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186710

T24gMjQgQXVnIDIwMjMsIGF0IDE0OjQxLCBFbWlsIEtyb25ib3JnIEFuZGVyc2VuIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxlbWthbj1wcmV2YXMuZGtAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIEtyb25ib3JnIEFuZGVyc2VuIDxl
bWthbkBwcmV2YXMuZGs+DQo+IC0tLQ0KPiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIv
bGlieDExLWNvbXBvc2UtZGF0YV8xLjguNC5iYiB8IDIgKysNCj4gMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWxpYi9saWJ4MTEtY29tcG9zZS1kYXRhXzEuOC40LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctbGliL2xpYngxMS1jb21wb3NlLWRhdGFfMS44LjQuYmINCj4gaW5kZXggMjEzMWY0
NjIxMy4uNWQ1NzYyNDU2YyAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctbGliL2xpYngxMS1jb21wb3NlLWRhdGFfMS44LjQuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctbGliL2xpYngxMS1jb21wb3NlLWRhdGFfMS44LjQuYmINCj4gQEAgLTMz
LDMgKzMzLDUgQEAgZG9faW5zdGFsbCgpIHsNCj4gUEFDS0FHRVMgPSAiJHtQTn0iDQo+IA0KPiBG
SUxFUzoke1BOfSA9ICIke2RhdGFkaXJ9L1gxMS9sb2NhbGUgJHtsaWJkaXJ9L1gxMS9sb2NhbGUi
DQo+ICsNCj4gK0NWRV9QUk9EVUNUICs9ICJ4Lm9yZzpsaWJ4MTHigJ0NCg0KVGhpcyBpcyBfanVz
dF8gdGhlIGNvbXBvc2UgZGF0YSwgaXMgaXQgZmVhc2libGUgZm9yIHRoaXMgdG8gaGF2ZSBhIENW
RT8NCg0KUm9zcw0KDQo=

