Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EABEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 11:57:50 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.72])
 by mx.groups.io with SMTP id smtpd.web11.20354.1688644666474621893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 04:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Sw1knGuT;
 spf=pass (domain: arm.com, ip: 40.107.105.72, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oW0gGRK29IQnSjpz6kpjxdOl+KweSoEaIj9pJ4cyKBI=;
 b=Sw1knGuTkp5Xn2BxKK5dGwkeTpPiqQ1hmcPs8zf3/TnsChJS/cYjvzFPUYKWER3Ah2otNlzOWl2ihzQ7arO7tsLGm53/WtTKRSxSMZ7/O4T/XO5VjIWWe2jd1I7fCtmKe6wrQoV/fjpqKFDZiaF2VIadqb1JmJBoj4Hvmrpvuzo=
Received: from DB8PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:10:110::35)
 by AS2PR08MB10126.eurprd08.prod.outlook.com (2603:10a6:20b:645::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 11:57:42 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::80) by DB8PR04CA0025.outlook.office365.com
 (2603:10a6:10:110::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 11:57:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 11:57:42 +0000
Received: ("Tessian outbound c63645f235c1:v142"); Thu, 06 Jul 2023 11:57:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91851329346d4d66
X-CR-MTA-TID: 64aa7808
Received: from 2b1716a56d5b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DDAAE9DA-8470-48E4-BFEE-ACD0C904CADC.1;
	Thu, 06 Jul 2023 11:57:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b1716a56d5b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Jul 2023 11:57:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czRYt2q6NOZmAZCrPHPM7h4x1YDiD8CIbePjcC6lWvXdTBJ1nA/1rKiyA00asp0xYjldFP+gb7PBAtDHhJXLL4OV8FlfK+AgXhKSGxd+PNA86RoezUPzXF1AEIeWIZ5E0FbtSx+mEsLScT6vGGaQxNpcg4jY1eXJGFtGu34/+H6q+1z02HZCarii0NAtbEhyvDe998XPzC31rxsa+3KDmRbucfvjbk4urZVX+mLqgmEsTClfAF9a2x1VlBitfOxCwvzzh2N2F4ASkcYWzEVFJU2S6TZx1SHJDvHYJryUyUk6oOzYgVs5k+Op0RrS2Ia6aHrKMlOkQoZRIf7KGV7O0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oW0gGRK29IQnSjpz6kpjxdOl+KweSoEaIj9pJ4cyKBI=;
 b=kRJ4xwTbJ2ZuRe5sgIzu/Maj8YMfwOvfwXrc+gS9/GHX2Kr1cKArgVeWkf3UKFJhAZIhqS0TiSNxvd5ZqitcUzHKT/ZkgDHxEE3kxL0o8ELtHhiTXVrhvJlfZhKw/ctsZ7UjdDBynbEXgWBo/+5IBzYoK8/lc1js3cTHIqL8wkwpoUHDeSOfhR66blGBU+lP3GQEb1z10mwWbtsYtjSQTwKGwvhBUpSfHmC/7eY3UILcO9OsO5KzBkFKbIAmDJEll+Ud88Dn4ObYvShzXm1jxQXincN2fenGw9pbWpv6BBQOwWGCLI6IL7YUAZk2fIxrg9HJnMYlLR6lVN4XeahnDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oW0gGRK29IQnSjpz6kpjxdOl+KweSoEaIj9pJ4cyKBI=;
 b=Sw1knGuTkp5Xn2BxKK5dGwkeTpPiqQ1hmcPs8zf3/TnsChJS/cYjvzFPUYKWER3Ah2otNlzOWl2ihzQ7arO7tsLGm53/WtTKRSxSMZ7/O4T/XO5VjIWWe2jd1I7fCtmKe6wrQoV/fjpqKFDZiaF2VIadqb1JmJBoj4Hvmrpvuzo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7783.eurprd08.prod.outlook.com (2603:10a6:20b:517::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 11:57:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 11:57:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "charles-antoine.couret@mind.be" <charles-antoine.couret@mind.be>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/3] image_types: use IMAGE_FILE_MAXSIZE
 variable to create fixed partition size
Thread-Topic: [OE-core] [PATCH 0/3] image_types: use IMAGE_FILE_MAXSIZE
 variable to create fixed partition size
Thread-Index: AQHZluFw2uJs02Qy2UiPy/1jibhrGq+s1EmA
Date: Thu, 6 Jul 2023 11:57:34 +0000
Message-ID: <C8E96A26-4B9A-443B-A535-E163D2B837F8@arm.com>
References: <20230604123755.2541295-1-charles-antoine.couret@mind.be>
In-Reply-To: <20230604123755.2541295-1-charles-antoine.couret@mind.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7783:EE_|DBAEUR03FT027:EE_|AS2PR08MB10126:EE_
X-MS-Office365-Filtering-Correlation-Id: b426ddb1-917b-411d-e9b4-08db7e183427
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 K9pvTybtxR9W0B0Gm8nA57c4yUdrA41NKKd6kWe7rRRWY9+YtFLveNU5FmxrQSj4o2GpHMxSpY3J2iaAVJu6O3VVWmKJOur7YkZ9oxak9Rabi3GnS2TKbNUaGaDndJ0OuJqOVWJqly50Mu8s6iXF6NY2QHdyPo83ZQWxPphbJwabLetZuxlF+1qgh7kT13x5vq4pteYnz3bXk7f0ACE9CJogNqxFZQijmSV/oCLimTSmvlo2dGeOXq+iO6UG0/S9zCETyTYIXG2eedA34EpCAcxzoac8jbf+galCJGb+jolEJpN3SXx6jp4MBZXiqbAQWB1/dBqo11k5v+0Ut5+KXacQ1MEccUDcKt3mDlNrFJCzTv58DR5rlzEynpC/dww2Goq/H5ig35rP/vfE+9iEwSi0wO1TisR9MonB7/yJm4NayBmcAHnV7fSpbQrl2yQcvsTTYWApxZD2H2L757GMHfoC23587esbQFfwDBGmBXxqNAlQ31u7t0jqBsqgzeO6UiO6BNPBCUDqz1CSB3sP8NW2z5cvE7rS0yIdRvJiLgpjVsHXF6qQ4B1vqJ/0qdcd855rHDM+siBrEukzFlFh3IAJpB/4gj6YQuDpBaFw8QFzRC8YFvw4hKD+Tzyq+E2QrwsazSIN+1LT2pR/IdynRw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(64756008)(8936002)(66556008)(5660300002)(6486002)(8676002)(86362001)(2616005)(122000001)(6506007)(38100700002)(38070700005)(41300700001)(6916009)(316002)(4326008)(66946007)(66476007)(76116006)(36756003)(66446008)(91956017)(33656002)(6512007)(186003)(478600001)(26005)(53546011)(71200400001)(4744005)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAA9399427848548B7204B45154D3461@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7783
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	47da54d0-2b02-4597-13ce-08db7e182f46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a6VN8NSpfJPIP+2c6gF+6Q9LeutElGmgMV00wl5scrz/3/ayBNz0UnSczQO6eyNbM9wVx8gP0jiRceIYV29w6wr/PDox82xyq5UnLW39t4o1J4A/CEQSn/yDkxr1jaGkRjSQhqBAGJr4dl/hVw/DfsTIx4gI9BfYB8Rt+R4Kq5/JwVDwgQO3yNaPbEWt0gM1ICHCds8L+vIJ7tW1gwyj426DvjT4Rc+rmqq8YodLc7VVQi4M6H3t0oUulGQ9ugTCCXuOhhDXZVFih7Ns/RJE84LLq/9vUi1I7B1WghweaCfIsw6hpHPs4vSDG6dTNRMuO4MoTWEDsD4Pd2wEAb4nCTlswLBYbrAX8CJymbX55wI6hwESLQSJF+3UY3/wRYqH67Iu1eRf3HPmAajlNkuMH7hAwWm89hsknr7JLARhRobbjtby2X1xD3dI2iivd/C/LyfWHE8Y0mOtAHSj/Jkk/3cJR7VFOgzxGWm9M6KREVfuoavf7OepPAamNYvU7uTnsyNzDPbtv8QUf3gUKlChQxbxsaqxLPX1O0ZcCTZ8GxQBMBJvnAkwoS0MbPxjLTBm83Os2mc90M6rRUeYG0yoHm4nqPpVkmfZd9WwnIVhZ62ZND+UCdS95q/DGJZp5uVVfMi5f+c1RdSF/oEkz6Z+nYjUNer6peb8hHXXdUMeiOm821hpbYMnI5EjuqDuzu2CEpe9XqxxoFkf8j8D2yTuhXa5b4F6q/R6v0icrqfxdsLdcKihQ4dWE7HOXPui+Bla
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(82740400003)(81166007)(40460700003)(82310400005)(40480700001)(356005)(70586007)(33656002)(41300700001)(8676002)(4744005)(336012)(6862004)(8936002)(36860700001)(47076005)(316002)(4326008)(2906002)(5660300002)(86362001)(70206006)(2616005)(6506007)(478600001)(186003)(6486002)(36756003)(26005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 11:57:42.2402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b426ddb1-917b-411d-e9b4-08db7e183427
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 11:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183930

T24gNCBKdW4gMjAyMywgYXQgMTM6MzcsIENoYXJsZXMtQW50b2luZSBDb3VyZXQgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPGNoYXJsZXMtYW50b2luZS5jb3VyZXQ9bWluZC5iZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gVGhlIHNvbHV0aW9uIGlzIHRvIGZvbGxvdyBob3cg
aXQncyBpbXBsZW1lbnRlZCBpbiBidWlsZHJvb3QgYnkgaGF2aW5nIGENCj4gc3BlY2lmaWMgdmFy
aWFibGUsIGhlcmUgSU1BR0VfRklMRV9NQVhTSVpFLCB0byBjcmVhdGUgdGhlIGZpbmFsIHNwYXJz
ZSBmaWxlDQo+IGFuZCB0cnlpbmcgdG8gZmlsbCBpdCB3aXRoIHRoZSBjb250ZW50IG9mIHJvb3Rm
cy4gSWYgdGhlcmUgaXMgZW5vdWdoIHNwYWNlLA0KPiBtYXJnaW5zIGFyZSB3ZWxsIGNvbXByZXNz
ZWQgYW5kIGRvZXMgbm90IGNvbnN1bWUgc3BhY2UgaW4gdGhlIGZpbGVzeXN0ZW0uDQo+IElmIHRo
ZXJlIGlzIG5vIGVub3VnaCBzcGFjZSwgYW4gZXJyb3IgaXMgdHJpZ2dlcmVkIHRvIHdhcm0gdGhl
IGRldmVsb3BlciBiZWZvcmUNCj4gdHJ5aW5nIHRvIHVzZSBpdCBpbiB0aGUgZGV2aWNlLg0KDQpU
aGlzIHNlZW1zIGxpa2UgYSB1c2VmdWwgZmVhdHVyZSBidXQgdGhlIGF1dG9idWlsZGVyIGZhaWxl
ZCBhbmQgbm93IHRoZSBwYXRjaGVzIGRvbuKAmXQgYXBwbHkgdG8gbWFzdGVyLiAgV2lsbCB5b3Ug
YmUgZml4aW5nIHRoZSBpc3N1ZXMgdGhlIEFCIGV4cG9zZWQgYW5kIHJlYmFzaW5nPw0KDQpSb3Nz

