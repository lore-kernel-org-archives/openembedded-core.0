Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6751EC636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 13:59:42 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.88])
 by mx.groups.io with SMTP id smtpd.web11.23952.1675259972853939271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 05:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=H8J2GgDX;
 spf=pass (domain: arm.com, ip: 40.107.15.88, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rh86G3/taMcFXSeGcv1WZbJgjog8tuTdQU8rC4r8bEI=;
 b=H8J2GgDXrR0wZoaSQJvSwDMZB7vmSFe7alSlvoSKiXHrpROEs4xesYG/CIvC+hG9uwO6L9gKaq99TWmv/cn0Sz3EB047bF5x5NFVU4Tb/FEo8WxeO0Z2cSpWJ03HRiA43RTyKx2ZRwWezIEFO0mSQu4E+ns3qy85oRAtiuZ6p1c=
Received: from AM6P194CA0072.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::49)
 by AS8PR08MB8109.eurprd08.prod.outlook.com (2603:10a6:20b:54b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Wed, 1 Feb
 2023 13:59:25 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::9b) by AM6P194CA0072.outlook.office365.com
 (2603:10a6:209:84::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24 via Frontend
 Transport; Wed, 1 Feb 2023 13:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.17 via Frontend Transport; Wed, 1 Feb 2023 13:59:25 +0000
Received: ("Tessian outbound baf1b7a96f25:v132"); Wed, 01 Feb 2023 13:59:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f3519f6e00eeb242
X-CR-MTA-TID: 64aa7808
Received: from 7c4a14c3e56c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D6714487-C07E-4368-9552-6520F25F6DB2.1;
	Wed, 01 Feb 2023 13:59:18 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c4a14c3e56c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Feb 2023 13:59:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cO90X5wX0LIJKf+W5Nm42f3BpEp3BAJhp2asyGm8hGCsqMjv8/CHG3atKtbQTDBoxEVIQKFzdsOT77x3RQDNOdshOVqUOMvTEm3f0232Xg9Nsh530A7vcfxsHf2ZBMhnUMw+TcPZW7J8VScYfz8H9G/EBIeMD2lBXKDA7K0BiLmslKEmtW/9muNWGdbmD4lJm079yBUuXOgWRw4rz52EzFMjb/+mkB0eObWAsU9arLRLZPuBsHr4ynuW14B30p1osLC4CM1tdeRoRGOPKzRqRNtzH12X1+BggX8hdnaDRIBXZevQf0CSrIUXWn3+AgUT20yzfV86RWL9VtaDfwO1TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh86G3/taMcFXSeGcv1WZbJgjog8tuTdQU8rC4r8bEI=;
 b=N2C+buugHlmcuQxC//1yqzZ3f850RsqdNcgTl6BHhbg2YqNYYX1iHTkR0dXNDeDZRWysSmfdn1rk9UtlidrZ9sWX41BPUewNPkZTA2yZIWb/Nv4/eE1m7czLi52IgHY+3IRE2BL+9+7KUUXnddqDtRkrR+Qi7XTtF04Ub6awF7LYlqIrOdRYmUDC3ag6SHvj0eVBvrLKN9f67tdcLcF5K4IeZB3ilPqts3VnZSUwXObrM/4fqIuVPVZIvpBzATYSr139TR1lR3lBMfpBTrawkqLBql9YZNQcEEAy70nv3xJ2KlrLuQuMtGDrK+bxoBv3I99esbZ2ubjYLskh3Mc1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rh86G3/taMcFXSeGcv1WZbJgjog8tuTdQU8rC4r8bEI=;
 b=H8J2GgDXrR0wZoaSQJvSwDMZB7vmSFe7alSlvoSKiXHrpROEs4xesYG/CIvC+hG9uwO6L9gKaq99TWmv/cn0Sz3EB047bF5x5NFVU4Tb/FEo8WxeO0Z2cSpWJ03HRiA43RTyKx2ZRwWezIEFO0mSQu4E+ns3qy85oRAtiuZ6p1c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8836.eurprd08.prod.outlook.com (2603:10a6:10:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 13:59:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%5]) with mapi id 15.20.6064.022; Wed, 1 Feb 2023
 13:59:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>, Richard
 Purdie <richard.purdie@linuxfoundation.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] Current QA failure challenges (perf, QA http-server,
 asyncio prserv, bitbake runCommand timeout, unfsd test issue)
Thread-Topic: [OE-core] Current QA failure challenges (perf, QA http-server,
 asyncio prserv, bitbake runCommand timeout, unfsd test issue)
Thread-Index: AQHZM/glshGSS2XSrUOuwDo8kO2Qiq64pWgAgAAN0YCAAW+HgA==
Date: Wed, 1 Feb 2023 13:59:15 +0000
Message-ID: <54E8766D-E877-4780-9B4D-3F5797E0AAD1@arm.com>
References: 
 <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
 <CANNYZj-o537KRKz8J9zn5EspbakeK-SxbCEPpKKad1xkCgRVCQ@mail.gmail.com>
 <00d550d449b589937bcfb07b6c23941b5ead27e8.camel@linuxfoundation.org>
In-Reply-To: 
 <00d550d449b589937bcfb07b6c23941b5ead27e8.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8836:EE_|AM7EUR03FT063:EE_|AS8PR08MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c838c6-cc75-4173-907a-08db045c8703
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gYPrfN950l03DyA2v7FPdI5ngmU4PAObjQjXbcHpgUIxNu1kmkXLI4GI0oCgfg6ya9bgIxfu3r9h95b7+3rdjzFHKXEJGbDzyOj6gRcwBFmODDRGgT6e6NIdBKgCHPKOxG6OsYwzjbIjfNC1BrMOVQco4gQ3+ibivaOv+iWugmNzRqmVyKolIFh79tVATZRv1eh/UsifgRaqGUVZ0zYy+NAzg0YO/HkMfttnOftQUPim3ppFAt76zfwbzZmA+IvfKh0IiGLLS4RWdKE1mhBVL8/nKqixECDeD0zPHgvTXJVhNeIVbjmoaPR/oJdGKrKyckMXaHmVfPOkXei3LajEHTZ08jmYU2sO/AZb2yo/1OgIfqipJyL6+ca2HZWkEOCtjp/h0Pk5Vi/bqhnuZ+jw5o6ZUB+MQUuHTf1W4az8o0b3NXnb+8aRZmUGjKbWgy+W+8O1zCTrf1otjJeIcgzSzzUAuDkZxBHsFyHIKjduagAgicIrVMO201VmDxekTuwnklFucAI40uCegv8O7zzAJ/MDqlO014NtS8100R35fc/BHinQhxyaHTmTu/z+4Dlrozy9xmSqzfBUh5uc0TdMFm430u3lworAll74FWj+5R+fP4qKs4Cb9GY4BUSCjAvDhfJp7hc5ee0SRmONkh9KiCXMuJv2WIjJ8EXBvmoo1ajEt7rJjAEEG8AwjdYBhyfk6EKXZW44Vg2je/3P6zj2hHsA6UQhSgvYB3FoGFj6tgs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(451199018)(5660300002)(478600001)(2906002)(4744005)(41300700001)(6916009)(64756008)(66556008)(4326008)(8676002)(66446008)(316002)(91956017)(54906003)(76116006)(66946007)(6486002)(71200400001)(66476007)(6512007)(6506007)(26005)(186003)(53546011)(8936002)(33656002)(122000001)(38100700002)(38070700005)(2616005)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EAD799F74A7D1545A0C02FCA97E2FDE3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8836
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1752f4f6-cc20-4f14-88e6-08db045c8182
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sAAqirrnV2e6wixQv0qNDv4YffbBr430dzKKAl+MmpJcVKzMR8yv16OWq/kIO+8OTsnyERy21IrRNCejRg+bgPOhTPK1ixyOErG583BkW7S2TcwQm8YzvYhI/tT3bKdYf9kidR37eCicUPCY1cEtbFfSRn8SzpW0K8ywK5xWUDwsEOebd3ym0eMayR4I/3in++IKXC1GVBebC+xvlY/xZlO93aJ4IaqWBG7VGkLtsBGAxylPsvUX8P9TEnXwoKpU6FgUzSZmgX1IIT3uEazCt/EMU0h6xg13yEiHozDfI1nTuz+0eWhwsKKKNG1Q/5umlc5BYfFs3idP3b8LJTLYaXwPSHVI0W8yKODuSxVeyHVldcaLwpN1LJmEqwg0oVD11JSgLgoA42+w3zuiicDx2WRyeJMdnUy2dMYs70Cj6YJtW5k7VXloFrwfcwdYqlSKekVoq3Tec67rimeob4nwAjPAWzk0gJi3goKbHDOrEklLPyoAjdKpzOUIlF1a5VcTVoG9I45fthlk2pNU5AkNSo+UHdSKW8+Gckar0J1pjc5Umze0Emk4uoDhM8aEZEQKX8yU/lmEgWbbdB/pTbHa+fA/ieqnxKuByPzfheBIlE0Jd0NAPx/J2pVEf/TMvU7ZnOapKDPWHExkEqRHHp86wZ+jF8Vj1+qHgW9snRJtKaVnbA5L1Sg7H8LJGXDfZv/KzlKJS92EPZeXeHooGCRG2A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199018)(36840700001)(46966006)(40470700004)(82310400005)(36756003)(316002)(54906003)(6862004)(8676002)(41300700001)(4326008)(70586007)(8936002)(5660300002)(70206006)(36860700001)(82740400003)(86362001)(356005)(33656002)(81166007)(2906002)(6512007)(186003)(26005)(6506007)(107886003)(336012)(40480700001)(4744005)(47076005)(40460700003)(6486002)(478600001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 13:59:25.1248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c838c6-cc75-4173-907a-08db045c8703
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 13:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176532

T24gMzEgSmFuIDIwMjMsIGF0IDE2OjAzLCBSaWNoYXJkIFB1cmRpZSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cmljaGFyZC5wdXJkaWU9bGludXhmb3VuZGF0aW9uLm9yZ0BsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+IEkgcmFuIHRoaXMgbG9jYWxseSB0aHJlZSB0aW1lcyB3
aXRoIG1hc3RlciBhbmQgaXQgd291bGRuJ3QgcmVwcm9kdWNlLg0KPj4gUHJvYmFibHkgYnVpbGQg
aG9zdCBoYXMgc29tZXRoaW5nIHRvIGRvIHdpdGggaXQgdG9vPw0KPiANCj4gSSB0aGluayB5b3Ug
bmVlZCB0d28gZGlmZmVyZW50IGhvc3QgT1Nlcy4gV2hpY2ggdHdvIHRyaWdnZXIgaXQgYW5kIHdo
eQ0KPiBJIGRvbid0IGtub3cuDQo+IA0KPiBUaGUgbGFzdCBydW4gb24gdGhlIGF1dG9idWlsZGVy
IHdhcyBmZWRvcmEzNyBhbmQgdGhlbiBhbG1hOCBGV0lXLg0KDQpJ4oCZZCBwdXQgbW9uZXkgb24g
aXQgYmVpbmcgc3BlY2lmaWNhbGx5IGRpZmZlcmVudCBob3N0IEdDQ3MsIHNvIHlvdSBtaWdodCBi
ZSBhYmxlIHRvIHJlcHJvZHVjZSBieSBpbnN0YWxsaW5nIG11bHRpcGxlIEdDQ3MgYW5kIGNoYW5n
aW5nIHdoYXQgdGhlIGdjYyBsaW5rIHBvaW50cyBhdC4NCg0KUm9zcw==

