Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85676EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 12:51:22 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.77])
 by mx.groups.io with SMTP id smtpd.web11.6498.1689166271982969598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 05:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fPTYlzdo;
 spf=pass (domain: arm.com, ip: 40.107.22.77, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQapuMV7H7A7g+X0mxTQVMCLposwA4Yobq/+O3ksT7I=;
 b=fPTYlzdoG258slqpH8NtpIAH4ue3rXa89M4EnOslYXF1ZpX/IlkTqhaGL5YfR4JBnns0MFQWOqO606Jn+tybNF4/irdD5UxYJSgZeiY9OrClNjRMgFzutrhGjIkKLIuYcjThChJ1QzDvygs05KAkrvbjZAP2QAqDzqaCKvcjeF0=
Received: from AS8P189CA0034.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::15)
 by PAVPR08MB9038.eurprd08.prod.outlook.com (2603:10a6:102:32d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 12:51:03 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:458:cafe::e3) by AS8P189CA0034.outlook.office365.com
 (2603:10a6:20b:458::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 12:51:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.22 via Frontend Transport; Wed, 12 Jul 2023 12:51:03 +0000
Received: ("Tessian outbound d7adc65d10b4:v145"); Wed, 12 Jul 2023 12:51:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e334560d7ecb5599
X-CR-MTA-TID: 64aa7808
Received: from 15c9cb295d73.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D1C0E2E8-4D07-4661-BD05-F9ADC2022593.1;
	Wed, 12 Jul 2023 12:50:56 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15c9cb295d73.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Jul 2023 12:50:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gb+jxX68wwS/PlP22gsq4iLd1C17nvJbDIF0Yzy7ZI/BWcUIumepcYt1AiVUXShhnss2Z4zB6NcUQatBLnl9x/z1JJS5+qxu/9yfLnzbfPbpQrX8WHt43078KGm32u64+2m857IJ+eoxrLjGti3aErkxT5/FJFX0j6j5D2HsC7Cedbuf057EKPaLsTdz2ammRRveQDjRG4McIezBvdOcLw/izJlLc5tO58yZExgQQFSZqOfbH8QnCSV2EqD0R/5DWf+NNUmUatEAU7uA3pdMRMW4+jweRmxj1HFKMpSKr9weCxMsw+ZEoYsJOOjOd6X9OdFTv1LsyAZ1sscM1tYB3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQapuMV7H7A7g+X0mxTQVMCLposwA4Yobq/+O3ksT7I=;
 b=NSinotBRJ1LOgrSeu560uWykLpArHv818m1wyc8sfdn6PcB54lRuYYI0OUP8uNIhC1gB0fmztY99eQCsOhYZIWP/C2P2ZBS0R/VD1vINMA11ID2SHbg2DuzZfYXfQDVG9AEmXuVSBqzM3ECEKtLvlNoqbDiNSig6KUwQNQJU1G5FR1N3JaXeQ54xoN5Gy0GlnmsHqGvuLGxfxSH3/l+B/x+qS4Md0X9KJ1Jc93jL49fkkjxETi9bT8RvlZtsfkYN54yqmCj3RvRKaBwD6RX9OuTWeOX6vawp35dN/NfEAbTeQcftPxiyTySBdbTy6FDVHXmaknfTvj1/qNUje1prww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQapuMV7H7A7g+X0mxTQVMCLposwA4Yobq/+O3ksT7I=;
 b=fPTYlzdoG258slqpH8NtpIAH4ue3rXa89M4EnOslYXF1ZpX/IlkTqhaGL5YfR4JBnns0MFQWOqO606Jn+tybNF4/irdD5UxYJSgZeiY9OrClNjRMgFzutrhGjIkKLIuYcjThChJ1QzDvygs05KAkrvbjZAP2QAqDzqaCKvcjeF0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB7957.eurprd08.prod.outlook.com (2603:10a6:10:37a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 12:50:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 12:50:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "p.lobacz@welotec.com" <p.lobacz@welotec.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZtL9+dDP+cdQTOkCIvCvgp4LVJg==
Date: Wed, 12 Jul 2023 12:50:54 +0000
Message-ID: <E786EFAE-239B-424A-A0A7-67385E4A076F@arm.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
 <956c0e383088df5f8568961f57741452a2cb1920.camel@linuxfoundation.org>
 <VI1PR04MB53739BCEE43D11E08D0202E79136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <25f435cb5536206f10a339ed0a20cd9c990a1a9e.camel@linuxfoundation.org>
 <VI1PR04MB5373801F47C0AB61E6DC0EFB9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <57f1d335c7b34bfae272ce2bdd0d141c7e7d72b6.camel@linuxfoundation.org>
 <VI1PR04MB5373A55313F357CB40C72B0A9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
In-Reply-To: 
 <VI1PR04MB5373A55313F357CB40C72B0A9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB7957:EE_|AM7EUR03FT028:EE_|PAVPR08MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ee1b9f-e6e1-4ab4-f02d-08db82d6a681
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7fvu/bcUYuuXcNtR73KFB8JMQtMR1sKJaXVriv29FvnR1BzTaCmISytx3MS53rkX3Svb7Q/B7LG+HI2rLvVShtkHaKIDgZmLt6VpheUGITCuQ/2ySMZwuIXTiMB/zyC5nYt45VWy8OABfYZIGEFesZmxqiVYPZC1B48lsZCPzsPAFB8cFpfkL1+PpvGKnJwTNQBleyjpNmSBG1WEOGJfm0eHEzyxtGcZSW8WZWPxQiLdYNl1ja0w9+c5/KxfEV/JQOUkH7wPja6tskN6SJusdjUsTwuU7oHqAjsQkvkLuyhNy+IIzkfjP5fh6YUeMpWyVpuIOvbNIfYAAt4VQHVoUJG7V6Z4Ppjov2FCzkYm6RpNT0eaKo6e3jIQRS5OAo6XeYqUe/pDUyGp9HKokr3RTf1M6z+Qe/fFbQwCm1RmQeYpWjsAZj1CYy3DMUr65yW859zjV5MklSlSBmQshK8BdgZE2Nv0OwCRbJNNkVsV1rybybqyHi9ETiYUSMCvSzrZqPP2IancQMRZPJVTlJVpwZkLSsikjbh5hE06tlrjFfSZOStRCf8LHI/D+uxmUc656EwrNDRe92saicT+e3j8fqCVbbSRnu6T7jHz/eInQ8Ye55Yqik+P2phbpfbiCoijfJ1Hhx9mTm4Bv10rHxO7sQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199021)(2616005)(66574015)(71200400001)(53546011)(26005)(186003)(6506007)(66946007)(64756008)(66446008)(66476007)(66556008)(316002)(76116006)(6916009)(4326008)(91956017)(8936002)(41300700001)(8676002)(6486002)(5660300002)(6512007)(2906002)(54906003)(478600001)(4744005)(38100700002)(122000001)(33656002)(36756003)(86362001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <60EE16F09135C54E844BAFCBF0F1218C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7957
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	591020a2-3cd5-4c43-ab03-08db82d6a15f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lDuMaYrpJ+tIDXdaXXdSSd5iuIRRFOnN1LlcWEsJ7MApLBcy+8o0tcFzYUe1vfJop0DyaWS+68sskS5d5c/MzJdrISKwFTGDtYL3AvR7TwdNaHWvuNY1NORTrwGXPr8a+C8W/385pe5/cHHEK9uxYtt0X+W/gPLJIuYNaPgVBKQxrMwTu6WO0NiHLA+DFo6QVR3v7XSdlq93hTFtVPg+D12UhOWZAQjRanhR6FpvS9LwaiGiKWa2zMvosURCEGpglv1TNUH+NAM/yiy6zfeglfAJgwOErN5YnV4nCfnZb+6RU8vC+BjnAosoqgLMJtn6rD1skZWwy54FIkSxZLFDSfs3y0cv1plDP3S7AcLp8s6UE8GzXbKrPzVYPDUz0jU3S/qF34o0xdXGXxjArzVyQDriePMWMsRW7h0VOeurXksy8ll+uW63yWZotmJtQq7L9Lji1BO2Kkf0SPzj6Vaq3WBU2bhbLroc8AmLx4rIL6uC77qQ9hEr8DW5FXJNZ5b2mpZjUyqrOq3tA8rnb2bTDkvzwuameN8Ud5m2f+v58nguD3203P6UdoiipkdF5ghb6+kpv4LyiunBm9fcYqvAyZVC04zhMjia7b5lpxdfQyI+2AEDXHrrxlAYJPq9EkF/xHj1+1oeAJhst8a5zM+adJfCMH4uZtD8EcGTjlbCZGT3thowZbpEvAjspo87931fwXbeWQp4jsArSP3vIX54v0YnfWya2zQU0nM6r0cdu73bSvN3F/d4y2Q9hxvVXuhq
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(40470700004)(46966006)(36840700001)(70206006)(70586007)(4326008)(36860700001)(40460700003)(478600001)(36756003)(54906003)(40480700001)(336012)(86362001)(26005)(6506007)(186003)(53546011)(33656002)(6512007)(6486002)(47076005)(82310400005)(82740400003)(66574015)(81166007)(356005)(2616005)(4744005)(41300700001)(8936002)(8676002)(6862004)(5660300002)(316002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 12:51:03.0734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ee1b9f-e6e1-4ab4-f02d-08db82d6a681
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184198

T24gMTIgSnVsIDIwMjMsIGF0IDEzOjM4LCBQaW90ciDFgW9iYWN6IHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxwLmxvYmFjej13ZWxvdGVjLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gDQo+IEd1eXMsIHRoZSBkZWNpc2lvbiBpcyB1cCB0byB5b3UuIE15IGZpcnN0IGRl
Y2lzaW9uIHdhcyB0byB1c2UgaXQgZGlyZWN0bHkgaW4gRElTVFJPX0ZFQVRVUkVTX0ZJTFRFUiB3
aXRoIHRoaXMsIGJ1dCBhbHNvIGNvbmRpdGlvbmFsbHkuDQo+IA0KPiBQcm9iYWJseSB0aGlzIGlz
IHdoeSBBbGV4IGhhcyB3cml0dGVuIHRvIG1vdmUgaXQgdG8gRElTVFJPX0ZFQVRVUkVTX0ZJTFRF
Ul9OQVRJVkUgaW5zdGVhZCBvZiB1c2luZyBpdCB3aXRoIHRoaXMgYmIudXRpbHMuY29udGFpbnMN
Cg0KRldJVywgSeKAmW0gd2l0aCBSUDoganVzdCBlbmFibGUgZm9yIG5hdGl2ZS4gIFRoZSBidWls
ZCBkZXBlbmRlbmNpZXMgYXJlIHRyaXZpYWwgYW5kIGl04oCZcyBvbmUgbGVzcyB3YXkgdGhpbmdz
IGNhbiBjaGFuZ2UgYW5kIGNhdXNlIHByb2JsZW1zLg0KDQpSb3Nz

