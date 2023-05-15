Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E03C77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 16:43:53 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web11.93849.1684169027782922973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 09:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EINLWxL1;
 spf=pass (domain: arm.com, ip: 40.107.20.50, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5HIdj8HzoofQCk3y0AEwKodCikQ/MfJtFsA1EjeOhw=;
 b=EINLWxL1zacpwD68CZ/NwvexORsNTYxJHZYTcuGSemhAqJy+aL7JNaRsWEY/wr2v+fYPXuGnKHvGhW/pRzzig9sVSGnvk5x59XIEqm27zAyP8uLJTfJyA0nxXS32gwVIUU161L6TyrKOXuPEVXLjuqXSfar+9rjlM3CJI8JJxXI=
Received: from DU2PR04CA0090.eurprd04.prod.outlook.com (2603:10a6:10:232::35)
 by AS8PR08MB6086.eurprd08.prod.outlook.com (2603:10a6:20b:29d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 16:43:44 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::9) by DU2PR04CA0090.outlook.office365.com
 (2603:10a6:10:232::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Mon, 15 May 2023 16:43:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 16:43:44 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Mon, 15 May 2023 16:43:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ea37ff6585254d9
X-CR-MTA-TID: 64aa7808
Received: from 9b408195f24b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3A9D4A87-A904-4164-8A44-B66E191B10FF.1;
	Mon, 15 May 2023 16:43:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b408195f24b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 May 2023 16:43:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIksORYLY5CL516GazrdxB2qg/6LUBsbhNIM/xncvhW0+cX5X6p2cIKm07Bx43CxGvWtXuFyLEyCegMTPLWJXQYSvzU8AEmiFTf6Az6tmbPYMBgBdmkLNclE/T7VUxO741fNuD7yjrClDGkaQDBe9qA6TDG9zoBI2AvEOwR6BIiVml9XrHfsEzc1lMkmssn5UeZpIFnv5G++HrargUSgK4xUqz6r1YcdB53fqhCHdqejCQqEmbj5KwVUZfixz0uh5U+GWL4jrWuAjdwxSnrp8zofe0FKG22BDqb9leK0dMa93MMqSntq7/BQeIjatpUHhda9q0NdSUqVUPuJbD+GHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5HIdj8HzoofQCk3y0AEwKodCikQ/MfJtFsA1EjeOhw=;
 b=kqYD7wXP7Q4wzIfjQvr8WkO620n108sfxpiSZ2FWO2wEa42Jn2v/o2Nb9bdwD0SIIhW66kA8Z8bCzhyixFNnioSS3hgXDgFVfnPQ/Fncsqjk+0S6ZRMedbFdo/HsMMWlOY6VzK9lA+x8gaOYoT6Ko0EPmyz53mYIgvmEr/0iOnwrGiNV3x9uiYDx/dQkemlmQkrPDEd4iyaDXY71lotAmqWMdG9tgGpBLljPOB/V0YMIHNepSZv4/c5Gy81buBvC6ExNYdWf3fi6X80/hvlJb6yn+y8vSz7Wml0dITKIVJC3kPG3eOVdCTCTxSlYv0FbYKvIqOhLM6DUIe6jeqLiHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5HIdj8HzoofQCk3y0AEwKodCikQ/MfJtFsA1EjeOhw=;
 b=EINLWxL1zacpwD68CZ/NwvexORsNTYxJHZYTcuGSemhAqJy+aL7JNaRsWEY/wr2v+fYPXuGnKHvGhW/pRzzig9sVSGnvk5x59XIEqm27zAyP8uLJTfJyA0nxXS32gwVIUU161L6TyrKOXuPEVXLjuqXSfar+9rjlM3CJI8JJxXI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB3PR08MB8843.eurprd08.prod.outlook.com (2603:10a6:10:438::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 16:43:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 16:43:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?UGV0ciBLdWJpesWIw6FrIC0gMk4=?= <kubiznak@2n.com>
CC: "Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core][PATCH v5 1/6] gobject-introspection: reduce
 dependencies
Thread-Topic: [OE-core][PATCH v5 1/6] gobject-introspection: reduce
 dependencies
Thread-Index: AQHZZhyefQw3lqmni0emnNBPqDOpWa9bd9qAgAAmeACAAA5PgIAAH9+A
Date: Mon, 15 May 2023 16:43:33 +0000
Message-ID: <CB960AF5-CAA9-402B-81EB-01C55B1C0BD0@arm.com>
References: <20230403110646.2555294-1-kubiznak@2n.com>
 <CA+chaQf7GPW=GZ4yYG+BjbBOYST2O7R7xwQSstRdC=chzaWU0A@mail.gmail.com>
 <5A51BE7C-AB58-448D-93F2-0AE5EE4C9AA1@arm.com>
 <DB4PR02MB100309C46E213B4BD625C20C2E2789@DB4PR02MB10030.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB4PR02MB100309C46E213B4BD625C20C2E2789@DB4PR02MB10030.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB3PR08MB8843:EE_|DBAEUR03FT034:EE_|AS8PR08MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: d565dde6-2d16-44c4-085e-08db55638c1e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HNuoS3Z4teB+RzZWpe3FyauiaXacBTS+3XW0vFjnBlONjN8YcpTSSWoxnMoBkReBTAbyUv8bsLCRu9MI/02xkHd4O18jDcozxrdMEBYPasWcaL8js97xAaTnuqIwQP7bzlfLYu/WN9W51JHczlC5tYUHiKGk/qQHE25eSXOuW5/pfdYdFJMhiEHJrqz78oHv2cYfzveVrMV5RM0jB9oP3QdL2ADUsJhrrbIqUHbGShOA0g+iEB4j3+eK4pmGJpaBYapvaZBq01yzQ2pq3ZWOwlBDmiUQmJNqIcUO10AVgqbWiCvACwCHGVvN4QUO88WiR1VARiejRRCJOoHeAZM+Aeqrgecw9ChC0Vrlmiftdb8l1Fw6Y9HJ2S5J0FlHQNvTnkYDxD+uMqnMkb38v0lgURR9mP5CQEQ8BYps+gMt0X9VB799qEJhqF71RJ5UDehyu+GCVa32HQdMOaxdN5F2GWCaoacnSN7+9fR032LlP3fSFxI+iiUHFeGutQRCpmDeF9RqXtFLFKYwwTaYNco9jVVesxs4Arr166/O8FwJBWBYD0hmTFRGVkYx94BRVRYBX0gmoOMnEBM/je7fxewG7Ks94kzm0TonqlWq0n2YKHCUuE1wRqiwQV1x9J8wN43HDowWDDcmFvueuK9tvsZUMA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199021)(54906003)(478600001)(5660300002)(8936002)(8676002)(4744005)(2906002)(33656002)(86362001)(38070700005)(36756003)(66446008)(6916009)(66476007)(4326008)(64756008)(66946007)(91956017)(66556008)(76116006)(316002)(122000001)(2616005)(38100700002)(41300700001)(26005)(6506007)(6512007)(53546011)(186003)(71200400001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <990ED6490B83844FA632A799D467BC9D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8843
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bd8c4046-53ff-4000-8815-08db556385d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BcvGOdxIhWNFkJU3AYuDMDdcsyy9KTfxTrwrljToyjCJQSqcStg4y7BlYKOBfii9FZfmGTsoGMXRXJzGaLW8zcSxDsVo9El2JwJ0/KWA9phSPA91vwNMAWnV/3BpEeTg/RAjxm9G3d7BDu2vvouXM+iTaz9S+aYx68zUPpEO9lmsQN0N2V6ZW5rMvSQ+jKZ8wu1VjxEvttQdAnaKOm31vzd++ZevHMIIYK4d6vAd+iCdWbT0mBLU1rBPuSOGJPLqfnm2p3TakLeRvy7AU6e9nYHxCIzbsenTm7dchUgm8PA+LA6vzcEjj8x7JGLAIIQ5tLGsEtkG4MOkQuoLNFpDDyJpIX4cjznnkbU/E4lurMhPMY36g/XB3kBqcxCZWVUnKJC7i2VkyYmyQZIKJFRDXBRkMKNOCEYt1urvtNBYiip83+3ZSWGEx5XwCjAhiCZXb/qUh9EvYA4h1X3l6pySbXFOMSROoatzeAmszrfPmdxqIzyMLhdxjL3hfUMvnWhp1vI2KbayL9RNDLRIg3d9mOF5lubqxWehY5Ujz1WBfTkBzUF55naAcYfKYRqgj8e8/5Q/6d4MCsjglAT2T93KywWKBAc9NxiXf0QtCtmqKcbli9znXRUrp/iNCWfBIWmltLaujtRNJ6/3kftUH9cCExKXhRaJgToTkbclV51V0vnjG5Qn5BuVgMDamYFTOBT5zhvIfoS644e30fLcZNPhXUCMBA/9Zqo3Zb5ScK2HTfI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(36756003)(33656002)(86362001)(54906003)(316002)(4326008)(70206006)(70586007)(478600001)(6486002)(4744005)(81166007)(82310400005)(40480700001)(5660300002)(8676002)(8936002)(6862004)(2906002)(356005)(82740400003)(41300700001)(6512007)(2616005)(186003)(53546011)(107886003)(26005)(6506007)(336012)(36860700001)(47076005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 16:43:44.3802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d565dde6-2d16-44c4-085e-08db55638c1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 16:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181265

DQoNCj4gT24gMTUgTWF5IDIwMjMsIGF0IDE1OjQ5LCBQZXRyIEt1Yml6xYjDoWsgLSAyTiA8a3Vi
aXpuYWtAMm4uY29tPiB3cm90ZToNCj4gVGhlIGtleSBxdWVzdGlvbiBpcyB3aGV0aGVyIHRoZSBw
cm9ibGVtYXRpYyBwYWNrYWdlcyBoYXZlIGludHJpbnNpYyBkZXBlbmRlbmN5IG9uIGctaS1uYXRp
dmUsIHdoaWNoIGNhbiAoYW5kIHNob3VsZCkgYmUgZml4ZWQgYnkgYWRkaW5nIHRoZSBwYWNrYWdl
IGluIERFUEVORFMgZGlyZWN0bHksIG9yIGctaS1uYXRpdmUgaXMgYWx3YXlzIG5lZWRlZCBhcyBS
b3NzIHNheXMsIHdoaWNoIHdvdWxkIGltcGx5IGctaS1uYXRpdmUgc2hvdWxkIG5vdCBiZSBjb25k
aXRpb25lZCBieSBHSV9EQVRBX0VOQUJMRUQgaW4gdGhlIGNsYXNzLg0KPiANCj4gSSdtIG5vdCBh
biBleHBlcnQgb24gZy1pIHNvIEkgZGlkbid0IGhhdmUgc3Ryb25nIGFyZ3VtZW50cyBidXQgZmVl
bCBmcmVlIHRvIGNvbnZpbmNlIEFsZXggdGhhdCBnLWktbmF0aXZlIHNob3VsZCBiZSBhbHdheXMg
aW4gREVQRU5EUy4NCg0KSWYgd2UgZ3JhYiBhIHBhY2thZ2UgZnJvbSBnaXQgdGhhdCBoYXMgYSBl
bXB0eSBtNC8gYW5kIGl0IGhhcyBvcHRpb25hbCBzdXBwb3J0IGZvciBHLUkgdGhlbiBpdCBuZWVk
cyBhIGRlcGVuZGVuY3kgb24gZ29iamVjdC1pbnRyb3NwZWN0aW9uLW5hdGl2ZSBzbyB0aGF0IGl0
IGhhcyBpbnRyb3NwZWN0aW9uLm00IGF2YWlsYWJsZS4NCg0KV2UgYWxyZWFkeSBpbmhlcml0IGdv
YmplY3QtaW50cm9zcGVjdGlvbi5iYmNsYXNzLCBzbyB0aGUgZGVwZW5kZW5jeSBjYW4gYmUgdGhl
cmUuICBJIGRvbuKAmXQgc2VlIHdoeSBnLWkuYmJjbGFzcyB3b3VsZCBvbmx5IHB1bGwgaW4gZnVu
ZGFtZW50YWwgYnVpbGQgZGVwZW5kZW5jaWVzIHdoZW4gaXTigJlzIGVuYWJsZWQuDQoNClJvc3M=

