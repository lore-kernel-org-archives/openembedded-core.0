Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF27C77B7D
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 10:36:53 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.74])
 by mx.groups.io with SMTP id smtpd.web11.23728.1683283007514787031
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 03:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8u2dF0Zn;
 spf=pass (domain: arm.com, ip: 40.107.241.74, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zES7sBz7M7DgbTSIQZLE8aiI0/G8vJq6oCMnK+2FHXs=;
 b=8u2dF0Znoo1V3RIep/O2zE+lPEYeWmWb41OJu9kEYgbrj/+Q0qjdTIg+/PITsm67OfHcakJ4XrU9j/6sR3C1YO2I0e/AmXlzpt0iejnMFe8Gi2uhDJll38tS8HBl7N5Up3SINPND8Kth/B28ChR+wi6+iIW3742I/OEMSlU9/fg=
Received: from DUZPR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::12) by AS8PR08MB10362.eurprd08.prod.outlook.com
 (2603:10a6:20b:56c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Fri, 5 May
 2023 10:36:42 +0000
Received: from DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c3:cafe::c3) by DUZPR01CA0010.outlook.office365.com
 (2603:10a6:10:3c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27 via Frontend
 Transport; Fri, 5 May 2023 10:36:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT029.mail.protection.outlook.com (100.127.142.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.27 via Frontend Transport; Fri, 5 May 2023 10:36:40 +0000
Received: ("Tessian outbound 3570909035da:v136"); Fri, 05 May 2023 10:36:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 877b5d81a0e2d259
X-CR-MTA-TID: 64aa7808
Received: from ba4a8299d6a0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FD836F9C-4DC2-4E79-B2C2-A054D5342FFC.1;
	Fri, 05 May 2023 10:36:34 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba4a8299d6a0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 05 May 2023 10:36:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhpOr1sbbiOJ2O17BDSfgKQtay13dXplVMVRHbYYTm/kA3nFbHeaXQ8QG5pVE5AIMdizGZGGEeCJ3Ca4C67rW8tjmq3+gow5PUCWNdABB1hx9axGe8FIfmBLPtmtW9/Xe2belHjz1mEGW+3RG7rdghiloFw+7IjNcEk5d5eget1UdCi+XzCLq12VhHxur1zgk/ZCddGuFD1gqRIk6eQ5GETGV7TizXm6+PvwHSzjxSV9LgMj1dideNsoNXXm7jDFRCAbv3pVmW3Vl5ODIQBHf/gfvSLMWNTfXOE055BpDAsT9Z9HkY6WHRQutdlkbCHaWQjny+dyPUtjX7yUVJDEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zES7sBz7M7DgbTSIQZLE8aiI0/G8vJq6oCMnK+2FHXs=;
 b=DDICN0SWuziqEwAjfXcgP/eZC8L84MHRW6qPOtp+pwqyMwmKErUL5m9WaBez9ZERXtAQTTZCmedVIIraeqOjgRr5PjGTHby8+OJqDPeI66CvQkhydER285QMhA5toosK/+gc71qEBDxG2+LSCKg3b3C8RMMheOvL4h/lzeNfWl40tVj9FCjfeRU46a8vrJc2XNGye6/jyaQnuZOAAceh4m4jw7mjLqWV5zqwYZqUzexziuvP9OQcjR4aUvUq9Ym3Gdn2ZI3v5lZdVOyNCFxdtvU47q+dp0gRZPcdW73sBAGXbDcTvhjwgfxb9LKXzSWkm8oIa/nwIkwdDICAgpUtnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zES7sBz7M7DgbTSIQZLE8aiI0/G8vJq6oCMnK+2FHXs=;
 b=8u2dF0Znoo1V3RIep/O2zE+lPEYeWmWb41OJu9kEYgbrj/+Q0qjdTIg+/PITsm67OfHcakJ4XrU9j/6sR3C1YO2I0e/AmXlzpt0iejnMFe8Gi2uhDJll38tS8HBl7N5Up3SINPND8Kth/B28ChR+wi6+iIW3742I/OEMSlU9/fg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7406.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 10:36:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6363.022; Fri, 5 May 2023
 10:36:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "lrannou@baylibre.com" <lrannou@baylibre.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, "khilman@baylibre.com"
	<khilman@baylibre.com>
Subject: Re: [OE-core] [PATCH v4 1/2] oeqa/utils/qemurunner: change the serial
 runner
Thread-Topic: [OE-core] [PATCH v4 1/2] oeqa/utils/qemurunner: change the
 serial runner
Thread-Index: AQHZbIcdmx3nfo5Pv0uytonxczvPpa9LoIqAgAABRYA=
Date: Fri, 5 May 2023 10:36:31 +0000
Message-ID: <530A9A08-28FE-42B8-92E6-87B45B582870@arm.com>
References: <20230411150503.2105880-1-lrannou@baylibre.com>
 <20230411150503.2105880-2-lrannou@baylibre.com>
 <F625F79E-BD48-4A70-BA5F-D5BC13ED39D3@arm.com>
In-Reply-To: <F625F79E-BD48-4A70-BA5F-D5BC13ED39D3@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7406:EE_|DBAEUR03FT029:EE_|AS8PR08MB10362:EE_
X-MS-Office365-Filtering-Correlation-Id: 2583e01e-8cb8-4c3f-704e-08db4d549cd8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 iJLMj0Fwzlt6aVJNtux6LnvOdqotlbg8V2EWPhDapmv+BtXhallRruYMFX9ufNAjJlhZ6+TjjpuYlNH1NTC+Iz9DtWbtfhrY5/hScNapmtm9jhrTIxf7guP5Jg2mJgNX+9d57xV0Ab2retHIUjzddE8whfN/E0NBtyvkX6UennUU/VQTihW6NQTbYenn5XQ2zX5gjH8hjvMHdMXsiON29ELVYDa3VhJxneSmRY4Pn6bsIEp/sPfkBu96YxfJgtFxCTQnzfZiMZFs7IhAoMEdfxhFYiZHeCE0dUNXUaSHE6WHXPfW7/sJK1cy70k60wiKlKt3RBDxnIipUjuEdlw9W/HcqdkPjse+XDy0ZlVw92gDI8Ris3Y7Sr7XaDGk958fMwPFsbxqBBLaU6n++bXkGuhJNKqXDE4wvt2HPjsRFti+m17EXt68DDSYgvKx8bonOk4kByR7mXXbxRFrYh//TyqGWsBToYrucRReEHFJcxiRsi8s63PKWK5ifewTjW7P57GpuUHvlxps6bDVoi4mSMyxywuXu7ah6dretT5VW0wi3NiunhkXG+NW9lchhe2S8MyhiOZZdpDpEBUQlxsn7IKmUuNKThNnYPGxSFV9OaR/+Tw7m3BR9SRGWPexGT3Up+ha1+pz/7IBfJ762QHzgw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(33656002)(83380400001)(76116006)(91956017)(6486002)(186003)(478600001)(54906003)(2616005)(71200400001)(6506007)(53546011)(6512007)(26005)(4744005)(2906002)(36756003)(5660300002)(38100700002)(122000001)(66556008)(64756008)(4326008)(41300700001)(8936002)(66446008)(66946007)(6916009)(66476007)(8676002)(38070700005)(316002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D04F37BBAEB7D54C9A55357B86DC3F00@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7406
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6d4a758a-4a46-461d-90d7-08db4d549779
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Nw/nAUXtzEW4ZQNlVrOxRb3WZAOOXNQ/d/j4voHIyX6ZsDiI+yjrVhYSnvt+/K7B4cuoztpkpt/Jn8zcs1TUGshve/HkQeh8Gt8JN2LbhGcf4zr3KgHN2py5ZWnTub7dS31AE+cpNxD5zpU3gWoHBg+XeNpE7GJnp6+tPfMQMkwumbrk1GBHw9XefOtkI2hvUe+c9ovJzz0LazNh68RKDP8Lw8G8PII74f+GP+4lxvN2BrAWB1iSwc6KAoPZZ8axGnSxoDRqrP7igDwONxGNOptvSSytVQS7qWda1u0xr1XlFxBxe0MVs7Uii9SM1Ysrr6iwXmcLR03z9bVuis8IAeysBaXteBxk1BHQ2IfVgqim4rBRTIH5cKR0fziOohunRoUGmHTI+siGDmnCdcHnz3a4M4G5edXc6dJiWZfon6HbyTyUFZ1aSR8nWYDWP9wmX7rn9gLucJlrXR5Bk8hQAWV/NYl0CHqsUAgJZeYngSP9kQyZvSzhTaolGcQtZVW7jSz4g4iTcSdTypAjQgkJY99xZUtapoDBQoXx9NBrYaM0ydymj4w0DkNG1Kpp2bU8Yh0xptvNaHjxZ+4K75FNwXL8MxZVb3SSyO8INQNeGIkwfGzhMAJb36eD6qyIBgq47XQhBzOZ4kraEEzUGBq7DASP+WmcU9dyFB85MYS0w5meLl5t4lMBAB/W0AVj6s8gm0MAkvBxFiscUB9e3WPUB0ykUYMAblx0VWmVaJQ50/c=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199021)(40470700004)(46966006)(36840700001)(54906003)(26005)(478600001)(186003)(53546011)(2616005)(6512007)(6506007)(336012)(36860700001)(6486002)(47076005)(4326008)(70206006)(41300700001)(70586007)(34020700004)(316002)(107886003)(83380400001)(8936002)(5660300002)(8676002)(6862004)(82740400003)(356005)(2906002)(4744005)(81166007)(40460700003)(40480700001)(36756003)(86362001)(82310400005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 10:36:40.7078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2583e01e-8cb8-4c3f-704e-08db4d549cd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10362
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 10:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180906

DQoNCj4gT24gNSBNYXkgMjAyMywgYXQgMTE6MzEsIFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBh
cm0uY29tPiB3cm90ZToNCj4gDQo+IE9uIDExIEFwciAyMDIzLCBhdCAxNjowNSwgTG91aXMgUmFu
bm91IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxscmFubm91PWJheWxpYnJlLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+IENyZWF0ZSBhIG5ldyBydW5uZXIgcnVuX3Nl
cmlhbF9zb2NrZXQgd2hpY2ggdXNhZ2UgbWF0Y2hlcyB0aGUgdHJhZGl0aW9uYWwgc3NoDQo+PiBy
dW5uZXIuIEl0cyByZXR1cm4gc3RhdHVzIGlzIDAgd2hlbiB0aGUgY29tbWFuZCBzdWNjZWVkZWQg
b3IgMCB3aGVuIGl0DQo+PiBmYWlsZWQuIElmIGFuIGVycm9yIGlzIGVuY291bnRlcmVkLCBpdCBy
YWlzZXMgYW4gRXhjZXB0aW9uLg0KPj4gDQo+PiBUaGUgcHJldmlvdXMgc2VyaWFsIHJ1bm5lciBp
cyBtYWludGFpbmVkIGFuZCBtYXJrZWQgYXMgZGVwcmVjYXRlZC4NCj4gDQo+IEkgYWJzb2x1dGVs
eSBsb3ZlIHRoaXMgYmVjYXVzZSB0aGUgZXhpc3RpbmcgcnVuX3NlcmlhbCBoYXMgdGhlIG1vc3Qg
Y29uZnVzaW5nIGJlaGF2aW91ci4gSG93ZXZlciwgd2XigJlyZSBub3cgZHVwbGljYXRpbmcgYSBs
YXJnZSBjaHVuayBvZiBjb2RlOiBjYW4gdGhlIG9sZCBmdW5jdGlvbiBiZSBpbXBsZW1lbnRlZCBz
dWNoIHRoYXQgaXQgY2FsbHMgdGhlIG5ldyBmdW5jdGlvbiBhbmQgYWRhcHRzIHRoZSByZXR1cm4g
dmFsdWVzPw0KDQpBbHNvLCBmb3IgYm9udXMgcG9pbnRzLCBtYWtlIHRoZSBvbGQgZnVuY3Rpb24g
YWN0dWFsIHNwaXQgb3V0IGEgRGVwcmVjYXRpb25XYXJuaW5nIHdpdGggd2FybmluZ3Mud2Fybi4N
Cg0KUm9zcw==

