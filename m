Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A9AC001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:52:07 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.88])
 by mx.groups.io with SMTP id smtpd.web10.22806.1691686324628532472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=m5HiGGJf;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=m5HiGGJf;
 spf=pass (domain: arm.com, ip: 40.107.8.88, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/u5rOtCVllEj2yXRE2b4V5NkR5ko+oFHUvrKA54AN4=;
 b=m5HiGGJfc8ljy7FMxcVJiCJjtQh0QP9pRo3hR5Z9W1afPOdm9zIS3cn5/+69WNSmn12y8fSdjNiQOoQXI99NlsRg9OeZDT4+yQLXwumhTcZOO4meRGaR3Ofgkr/xtR01SjVRf0uWDTiRVkhQSi2dWra0GLezVr065CX6OKE5f3E=
Received: from AM6P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::37)
 by AS8PR08MB6023.eurprd08.prod.outlook.com (2603:10a6:20b:291::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 16:51:59 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::de) by AM6P195CA0024.outlook.office365.com
 (2603:10a6:209:81::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 16:51:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Thu, 10 Aug 2023 16:51:59 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175"); Thu, 10 Aug 2023 16:51:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 992abdfcc812d34e
X-CR-MTA-TID: 64aa7808
Received: from 766b32e67db2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B7F30A84-10AA-4164-B39B-2371ADAF9EB0.1;
	Thu, 10 Aug 2023 16:51:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 766b32e67db2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 10 Aug 2023 16:51:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGWimmS2mzKgTt96cl9nQ/gv1FMzl6NRSeL19Vq4+8YhCC1o297FrshiCgg+kYLnCLla5ZD9dbDwdX5I2g3PRVyR+HSW8jQ6xEKLpLP0aDTI9Cua7zPRB7fYMsQ5KTXV0deb+uywQYBG9A4kRQ+O0fvy79CPgZx05rqsav7wy3/jSk+w3XTv8r7jmejSFyJlEsWODON9ErGss/7WXdiCXtQkDaSZia1z3VZQ17IkmTUu6L3JdY2poi+RFuB8oEsDSMZLNNNuzDRK9o0bNhpGUQwVQEPp+mtYqDlMkVAFmB+Ld1VlHqwaUimkXzy9ShLHexObtlv1uFNHJLFLLsNiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/u5rOtCVllEj2yXRE2b4V5NkR5ko+oFHUvrKA54AN4=;
 b=jp4x8TDLd3rqhe3GXFpQI6utOB6gg2JcaNrifW+I7Uawa6X50Cvl2FLPERA768CTuccbeB+6gkcSfMoz8E3SHwCSpM6wJRQZ3ZA+NCzgTDGXQmcS7AOeQpclQL4pVkd5JQWyyTaQw+a5/hwDVYKQHpQ4uicBLEMmQeKIMUJPZBOImxEbtE0dMoK7srF7wW8pobsJMcsNrWZwUv1dGif2GMUxAEtk80HooTVwolrKJp+4FoIYy8zLKE/zG7R8nyTRBhyiDWTXjdFqZQJAv6PaV+LR4P5/xlujuxCPhEshesG7lRa00+Pc0tiZY2ywk1VtZivxaUQF7pp8F0pRbPCmBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/u5rOtCVllEj2yXRE2b4V5NkR5ko+oFHUvrKA54AN4=;
 b=m5HiGGJfc8ljy7FMxcVJiCJjtQh0QP9pRo3hR5Z9W1afPOdm9zIS3cn5/+69WNSmn12y8fSdjNiQOoQXI99NlsRg9OeZDT4+yQLXwumhTcZOO4meRGaR3Ofgkr/xtR01SjVRf0uWDTiRVkhQSi2dWra0GLezVr065CX6OKE5f3E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9330.eurprd08.prod.outlook.com (2603:10a6:102:304::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 16:51:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 16:51:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH 8/9] python3-pygobject: add explicit check for
 qemu-usermode MACHINE_FEATURE
Thread-Topic: [OE-core] [PATCH 8/9] python3-pygobject: add explicit check for
 qemu-usermode MACHINE_FEATURE
Thread-Index: AQHZy6ddL/E6+2zP60m7GmFRmpk+46/ju5QAgAAC+oA=
Date: Thu, 10 Aug 2023 16:51:49 +0000
Message-ID: <7B489F3B-7DBD-4F4D-B215-DCF6F94AEAD9@arm.com>
References: <20230810162451.1766532-1-ross.burton@arm.com>
 <20230810162451.1766532-8-ross.burton@arm.com>
 <CANNYZj9j1-s4=xN3jB+-J75+s3nGB7uCOVxm=EgzH-676TJcpA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9j1-s4=xN3jB+-J75+s3nGB7uCOVxm=EgzH-676TJcpA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9330:EE_|AM7EUR03FT004:EE_|AS8PR08MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: f7cacdeb-65f9-428a-1ca3-08db99c21cfd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 nFZG2rBc0iD2pL7WkUYY1x5ni7Jrd+Rz90lz99U4a4+d7RFEvrfe2WztBFptuTQ0vVliQlWh2I6mCsxNYnc06UVEmry49JWWNPEoMxBcMcosLiIWzxIQtYUui0X5pOnOwu/RqIg5ZKCCdiUjvWf6LknWxtNZaVOm31Ahd2t1OxIQICMW4umev8taAByI4/Krs9VxfalEeXGRZ0vTdYPbY342AZsrNAKDRwIT3NvMJ89ZfkWdR+1YKAjW0P8i714ZgV3GJQIBdIu/fW97wBNFHH34zT7bFoYNYg/6wcTSCy98Epp4PcS4L6B6h06iKcV0HZkQdB11YJjPuzwVAYVpxckvslmOD3KrQCb5UDzUfVLlNlJuCP7qDQr8uiRxLGgZTaEosSDLanWX47lLdTe6zmlO0SO7XpaIOqeH8dBBY0isF2RIdHh5hgjBG4K2IBN08hBmX9AK9moJbx+mzX9X/l9Ho+HSpvAnBWhktbg8zLSgBeQIgjMr47erKhGoJgKIY1+RzNNgvPFQEUfPJyttY1nrX+grqn+4xu7Ok/zclBqPkVXZGvBK8uZMwn6EF0nIdk/f1irSRddeJOmyCVoGNP0VP6RyaHO/GgOA+93lqJzYtf2rcYmc6dkWdTN5QoImZB021GBiwpiL6AzWy2C4Wg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(1800799006)(186006)(451199021)(33656002)(54906003)(36756003)(478600001)(71200400001)(91956017)(66946007)(6916009)(76116006)(26005)(66476007)(66446008)(64756008)(6506007)(66556008)(53546011)(6512007)(6486002)(4326008)(4744005)(2906002)(41300700001)(316002)(5660300002)(122000001)(8936002)(8676002)(38100700002)(38070700005)(86362001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DDFB62EC565F34AAC603E85F193F291@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9330
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5b6b8586-ec01-4b0e-ff24-08db99c21778
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7S6IpeU6e6xpHlqE9TK0YXw3gi5C/pwbZfpF4BwovGgyALtt/5MSt9NFSlp0HxCnT5CivPLtN01RgSf+cPOw9Iajvo3fiNhgmRwzGCfqJ97tJOCwOQHfb1v5SGsX5CQCR388Ow3mR9EZq272ux6w5svYRfja3CsWadpVkqcMajXJfAmXglD3ypEci9jzl079nJ1LunGVPlTYkMzmwZQNd1j6gAs0xq47HfRHkumsvx7/qDE2pKlEZLrC2VRrYdXSzcK/Ow80vKxmCQdUYZ8O4cDzHg5OcBchLJCbRE20vn1HUf3DU6cwDdCsXER2r6v6i6zjUp+GvBSpBTfDXy6lZihMvbqh1W+96GNGWTNS7fzHBLMcCaMvGS4t3I8zATZIQ8/OewpuFp53HzQW0FJafsUh2Hd/t6xyDnKg7qkK7xefisZB2/5tND25TN6Zi3aYpPfKjW4rR4DmAqLxXg/Lz19m8IZCFdyATEPs9IsD9oX+aAqwnbUqZKdxStI4+oIbJhuJxah5PoPsEOeXNevko7jDUqui2KN0Tqt/5GjCzIHPGBLgPjlf/k1GgqBVj5TGXf0zlU4NYAWz0W/B9Hov+Jf6dIolTwrH+sv1zSdcgb0mSlqTGkJF9nTGy7h3gVzNOn52iF+PRFdCGXcya+2GGOysxNvSSlEI/3LONJA+hT5ymkPUtPhjsxchyOHKC3909qUnP74TvCx034aRpj7+HFxqE2fys0JsGt0bhezvZfC2ZePhsGKsi9s9yRd3EHdY
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(186006)(1800799006)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(70206006)(70586007)(41300700001)(6512007)(6486002)(36756003)(6862004)(4326008)(5660300002)(8676002)(8936002)(316002)(54906003)(4744005)(40460700003)(478600001)(40480700001)(2906002)(36860700001)(356005)(82740400003)(81166007)(47076005)(33656002)(26005)(2616005)(336012)(86362001)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 16:51:59.1643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7cacdeb-65f9-428a-1ca3-08db99c21cfd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185820

T24gMTAgQXVnIDIwMjMsIGF0IDE3OjQxLCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBBZGRpbmcgYW5vbnltb3VzIHB5dGhvbiBpcyBub3Qg
Z29vZC4gQ2FuIHRoaXMgYmUgc29sdmVkIHZpYSBDT01CSU5FRF9GRUFUVVJFUz8NCg0KTm8sIGJl
Y2F1c2UgdGhlcmXigJlzIG5vIG92ZXJsYXAgaW4gdGhlIG5hbWVzLg0KDQpBbmQgdGhlIGZlYXR1
cmVzX2NoZWNrIGlzIGFub255bW91cyBQeXRob24gc28gd2XigJlyZSBqdXN0IHN3YXBwaW5nIGEg
YmlnIHBpZWNlIG9mIGdlbmVyYWwgbG9naWMgd2hpY2ggaXNu4oCZdCBjb3JyZWN0IHdpdGggYSBt
b3JlIGFjY3VyYXRlIHBpZWNlIG9mIGxvZ2ljLg0KDQpSb3Nz

