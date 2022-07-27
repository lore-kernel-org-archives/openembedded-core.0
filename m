Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46D4C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 13:57:20 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.65])
 by mx.groups.io with SMTP id smtpd.web10.20143.1658930237207995205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 06:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=TuUDp31q;
 spf=pass (domain: arm.com, ip: 40.107.3.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LXM4kofW+JYfUD7Mg2DcwUWYWQ6NdjKTay9Rh/u8MgZUAxAZd/ACThxdhWgR5ZkNIQFxdCPVnd2gv2KEuYK4QA46OC12rPk9Oys1Nae+b6SGnbmnqG+n8AR//380VwCHe7ENVPBYza8M2aa25MoW9I/0iuC/+R1ZPvKnn3pY8Y+1s85nyi+xNfwXmvDdrRYGVATfYQpVDhhFoZgx2i/hXVmkIQcQcZxyv1EcKAzeHOk0ryohCm3nz0Vl4DXyESxyf2V3PEPiDRcb1AI2ogmr244QcffhXXahWIjCCqwQstHdktdP4oflEo6MXxx679k3YKpcTPg4lTmzsehNeCXmGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4szX9R4lhBe5LoN+yW5a9Gw5X2ftWzBA6/HGMWwNP4=;
 b=DdABZ2EE2RgByLvoz5Fv0HZsUXAC/Jxp7vtJStqcMWP7OtmX9T7cu21b+Pm0NsU6JoMS7Et41QoGK4lU+8tZE2wy2lcOzh+4d5MILmuboDRdVJ+EndYJkrZzFUZ6ZHpBg3tBBpjZdrQ5st41bHOpx9H0tZwZZlTiiEbjzhv7kuwSAtI5yfv3qmtQch+Dw4DRGdrP9tYkwCluWKsEgwav79mUHpezSCd/LZqGiSrx8a9EyJkQWleQIkirgzehQrdMz44wjSE/fltSR/+aQ1d5fLdIn9hs/v4kP/c69theI2iVztlNLr2rTq/bY7hydHeRJXkJaAxO67aau77pOXqY3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4szX9R4lhBe5LoN+yW5a9Gw5X2ftWzBA6/HGMWwNP4=;
 b=TuUDp31qbvhUzIgumfq2xax5rgQrOJlLx5Qvw2trtFQK/V68pibDaqgZnW+HurOJkemJbW2bzhOYzqgyjX4gRgYF79NtTVV3qMlJa2wKWUqVmVFgNaLDh189Ptk3qaqhqgUmux8KcR2Jkfv7HOEIyR0p+YrJOPqSXlMVyZtjSFw=
Received: from FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::16)
 by AS8PR08MB8248.eurprd08.prod.outlook.com (2603:10a6:20b:522::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 13:57:13 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::9) by FR0P281CA0011.outlook.office365.com
 (2603:10a6:d10:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.4 via Frontend
 Transport; Wed, 27 Jul 2022 13:57:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 27 Jul 2022 13:57:13 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Wed, 27 Jul 2022 13:57:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3cc8e2846ba9785b
X-CR-MTA-TID: 64aa7808
Received: from 8a32a21d194d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 66D20C51-DFD9-48A9-B204-1A50D5DFB852.1;
	Wed, 27 Jul 2022 13:57:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 8a32a21d194d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Jul 2022 13:57:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4EiazGKc16xo2mxrustqPOrDG5YstuhMJP3lsoGSW7u4n7C9I5OF1S7rMfSXiuyLYpdP9sb96z4oOCPgrphEIGDgiXl1RtSDIqT5hYoRYUsioQ+p7KpViFUF9EWTImaQFmGrO89qQGWsvFuoDMFloe0mVFPtRZcyMN95j9BoOaUYRR/CsCO6WEtKJaoZ8FYYVMwoQ4S86LzgKswu+LdkRdluQ8oX0m96rCleaBk4XXCMAJhg3LQRRqXUPk19zn5KE5yA9gep+Yn/94v5eGMz2H+Bu56VVKhIU5h95C2tCWujFSqyQ7WwLuP/zIkDvlkznsGNqC7dV7AjuXnYKN/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4szX9R4lhBe5LoN+yW5a9Gw5X2ftWzBA6/HGMWwNP4=;
 b=CHtUyWXg5oN+48DAWtZuZDHy8Mtr0ROj8fmUDE3QZWHyYX5JCmeINvD/EJEklAUSTa+HAaGKG5UcG8Ksau6x+qKRUJxHL7MxoN+wyjFlvRba9hD7jzW4asapZCoeGcTDUl5k7hiCTO19fJUkTnGBZN9mGXDSrt6hI5b6r+CwRlXXrJO1xJ7mOhcNekCUQXteccKq67eKFdqQzq4rx0kZN7coyb3hw4K+KIv8d6wRG/HQbmbzasxhA5HKortU+F59kzzjOgeG3Znn5SpgTF5nwlYdWL4DLTD2kW2W8NYmPIDrO3XQCzgjXxpWqmpA3VfRJS7bC7aYpBWzQazmOLb+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4szX9R4lhBe5LoN+yW5a9Gw5X2ftWzBA6/HGMWwNP4=;
 b=TuUDp31qbvhUzIgumfq2xax5rgQrOJlLx5Qvw2trtFQK/V68pibDaqgZnW+HurOJkemJbW2bzhOYzqgyjX4gRgYF79NtTVV3qMlJa2wKWUqVmVFgNaLDh189Ptk3qaqhqgUmux8KcR2Jkfv7HOEIyR0p+YrJOPqSXlMVyZtjSFw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB4976.eurprd08.prod.outlook.com (2603:10a6:803:105::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 13:56:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110%7]) with mapi id 15.20.5482.006; Wed, 27 Jul 2022
 13:56:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Rusty Howell <rustyhowell@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] debian packaging: set md5sums for conffiles
Thread-Topic: [OE-core] [PATCH] debian packaging: set md5sums for conffiles
Thread-Index: AQHYoTSanZkPBABEwE69UtQ4pRZAgq2SC9iAgAAPMYCAAAqVAIAAGXIA
Date: Wed, 27 Jul 2022 13:56:59 +0000
Message-ID: <22FA8BA8-2F9D-4914-9C05-5385EBA4D90A@arm.com>
References: <20220726211328.2122681-1-rustyhowell@gmail.com>
 <20220727125339.70e1886c@booty>
 <CANNYZj-FJHUQgVb3GXWjEd6mkQE2-wkX2vUky3pJXQLdq6LPVQ@mail.gmail.com>
 <9DF62C6C-0996-4520-B4AD-F8E579C8931A@arm.com>
In-Reply-To: <9DF62C6C-0996-4520-B4AD-F8E579C8931A@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8f20917e-5dc3-4e50-bbf4-08da6fd7e860
x-ms-traffictypediagnostic: 
	VE1PR08MB4976:EE_|VE1EUR03FT064:EE_|AS8PR08MB8248:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QRKPhECuXiOK0ai3oOyOgsjuDqsYyVe6AzGvawrKBcoiSfa4+ymNe1aEGhl4eLzptvEbw5BkbLUuyfBpYaKKEC1c/J61Ea1RQYWOhSFIji4f5IxG0zn33jMPIjjxoPqUgdU+GlSM239TcK2UZbhPVDgHq2wZyi+1zNU97euDDdzJ5hLj/kSf+/H4tTuyZoFwz/tR3cN9NLQl7aumakpBPB2IGflu5RMWdE2lMeK51XGy+tLaAfO710PE9q4ElN0x3CccQN4mN0gba9Qa8dF/ANhc6B/o6QfTFuBGoSwagh0v4xAQWuL5aS4WM3B+6CPRww7BzS4Ast3tbcuTysQqeiv02PD4hUsCCTe2PyJ9HxISKaURYgHPW5oZEsFhG6V3ef46+9vwrw6OUcNIEDEjwFiENakp9ledSln+t7YusTDyDdOUwXZ4dY0lzspcTdjDw5BvpYBKDYY/M9ENuzr12uAKMPeGL81S2kRO7u+UQ6e4u/uyYVeTD+I9L5+wc2/KBkj4Ff6UdZvG/ZLgdEPPeDusRP5QmgyYerY1B1woK6kcEmvay1SxAtfnpo5a9CqpROEnCuMtTjWW1FCpBXTzOOALN4aCM/QfDCYGtAsN3/8c1c/MmtKqGGTBBc4EbKbQjyc7s2muskNQIJz1pvCsh/sD3BQQl0QCYRWwQwCPvNVSogLdByxL0hJBcjie2q317hmmggc3uiAF/e6wC37utXbCH3mUKIlOD3v1ATkV/8go8HrPwwWDX9L6M8zmQmeXrPylhmEilv1S8RS5djBhPnWsFql88fg8vgrIf292hYD8c6R0E7+m4Iga28qKU96MhY5LL3uUYIPLpvmcGSU5VGOqrwm4Oc/7evcE9plaQrAsIXc/JLUGjsTXKXzM+B2mDy2lmbKLVgELd6tgIHRX4g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(6506007)(478600001)(71200400001)(6512007)(26005)(38100700002)(6486002)(41300700001)(2616005)(122000001)(186003)(6862004)(5660300002)(33656002)(4326008)(8936002)(8676002)(36756003)(38070700005)(6200100001)(86362001)(316002)(76116006)(66476007)(66446008)(558084003)(2906002)(37006003)(64756008)(66946007)(54906003)(66556008)(91956017)(42413004)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <00B89BDCFAD0E54D85A0B5C5D43FE81B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4976
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	439c8aad-f354-49bb-662e-08da6fd7e024
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FalI2dBBsWl//KIHtUk5MWGtY0tW6Tzb4eVwOwDPx4blrENjqDUSkEAG61aHFM17qZRjwBdvdCD1FSalGuzkxWzXsWcv4Nai4Ed90Ul7cdfk2W6dStzifL9EuW4rj3GwYJwcgDlp4WxlYXoC5Q1DI0cKrBdS0FdxO1YFNgOAmqUQGJlA1x7BSUHkJw0MY+z0KLiea6E6mX6MDJsOmi9DzO6jQRhr3eM6XHJV9gYdiJBCGQ1rVlf/IsLmc5nbWb3jFCgqCsoZimt0/BOwZNMJ2vbw7/TRxxhehv/lRbkfyIXorvVceUXiOLSid5Z57vjqxQ4JognqUfwK4MeQR/NDR/qLhktzuQ5nBDU7QW+ODSLyxgH2VK9anx67gPpe+oDbxhUwrzCo4xMF8NU005E1muNNabqvniF7sOkWk7IKlToOT59tbd/tgtX0lfHgMx1biDlr+YvtO2lkZEUUU/kswyeqG6jfYsOQ09niTNjmE8erNsYKE78CZewJNg+QzAOH34fTgMUh6XuroLoNEfB0T7izsD0XaHtaK1fB38PW7etIKA7OXVHkOa40/fEY7IFYZ/QzZFWTlBhoyLedfeihh3AWh9NTPPv5TwhJBjAUhY6NEbwvtPWjQuocjVAVfM3xxZWofFk0qVyadQ8BWw43/6ijrudCrDIiSIphNPvE/iZ3OfvPmscaZHsidNxrE+Ck6jxu91D3r8Hy9J9fccoV7XYsRiNkYr2ko1FdIb3iF0arRNiRKIXYhhj2XBIa45FocjgTho/ZdxgQ946i1mT6wppomypO6oPUm1atcSgwEv0Qq0/Axldub/PrdWN1L/voVZTz4uFZ55RVnqw4bgDvI5zCIUZfnD/CqLhSsF/sIq8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(376002)(36840700001)(40470700004)(46966006)(316002)(336012)(36756003)(47076005)(6200100001)(40460700003)(186003)(82310400005)(54906003)(37006003)(6506007)(4326008)(70206006)(2906002)(8676002)(70586007)(36860700001)(82740400003)(41300700001)(6486002)(33656002)(558084003)(8936002)(478600001)(6862004)(26005)(2616005)(81166007)(356005)(6512007)(5660300002)(86362001)(40480700001)(42413004)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 13:57:13.2479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8f20917e-5dc3-4e50-bbf4-08da6fd7e860
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8248
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 13:57:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168562

U28gd2XigJlyZSBkZWZpbml0ZWx5IG5vdCBnZW5lcmF0aW5nIHRoZSBERUJJQU4vbWQ1c3VtcyBm
aWxlcyB0aGF0IGRwa2ctZGViIGxpa2VzIHRvIGhhdmUuIEhvd2V2ZXIsIHRoaXMgZmlsZSBpbiBw
cm9wZXIgRGViaWFuIHBhY2thZ2VzIGRvZXNu4oCZdCBjb250YWluIGhhc2hlcyBmb3IgdGhlIGNv
bmZmaWxlcywgc28gSSBjYW4gb25seSBpbWFnaW5lIHRoYXQgZHBrZyBnZW5lcmF0ZXMgdGhlbSBv
biBpbnN0YWxsLCB3aGljaCBsZWFkcyB0byB0aGUgcXVlc3Rpb24gb2Ygd2hlcmUgdGhhdCBpcyBt
ZWFudCB0byBoYXBwZW4uDQoNClJvc3M=

