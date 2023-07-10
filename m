Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85153C001B0
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 10:10:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.49])
 by mx.groups.io with SMTP id smtpd.web11.36018.1688983845396168083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 03:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=csDR5Ho8;
 spf=pass (domain: arm.com, ip: 40.107.20.49, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWgUXYRH7QtbYnbjD+1clD//NNy8n8tnSQzGs/48ZNg=;
 b=csDR5Ho8TByZNrpvtO28wT6ON4RamHQ50FFeXb9HtVAz14ZEWM1ZIDmu7odV8VdfmUeKh8RVdOmIBBKuKvuIA+LRGmQimxPaZOBcE25JUxWS4jVKFWALeu/Ia4JcRkuBaBZNBvmiGjkC40gj3NIXdKV0vLO2BsUI0bDvF9VgTH4=
Received: from DUZPR01CA0225.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::22) by DU0PR08MB9677.eurprd08.prod.outlook.com
 (2603:10a6:10:447::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 10:10:40 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b4:cafe::37) by DUZPR01CA0225.outlook.office365.com
 (2603:10a6:10:4b4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30 via Frontend
 Transport; Mon, 10 Jul 2023 10:10:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.14 via Frontend Transport; Mon, 10 Jul 2023 10:10:40 +0000
Received: ("Tessian outbound d7adc65d10b4:v145"); Mon, 10 Jul 2023 10:10:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63901b301604b847
X-CR-MTA-TID: 64aa7808
Received: from e2bbe0d966c2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 30903F0A-1DD4-4E3C-BB9E-47D9ABC758BC.1;
	Mon, 10 Jul 2023 10:10:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e2bbe0d966c2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Jul 2023 10:10:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjFpLzjZ5kauyaO22tm8F8rpEYwuxSPnTIbpOk1KYzzFbCp/RHhA4bATSCub5wdR8g9i8qBMGA7Wj914aVD6eJTTzhJ/nqf964z2Q6aUVhxH5x33XY36m0kllXS4+7sSKkFkMxpz2eJTLT75ltDW27JHVADjZ9Gr5+ejod5LUlE1JSBD9cj+SeQuI9tqHXGpzwCN1CpNzHVg/lw5sjNjri9kZrjVwG538/M9uJXQI8ZTt8NKRr1MkSWQQvScro8UkYG6MwVInSOjvqG/WGVhGYqesOped+XQNftbxANm788pGl7wfUY0SGBSqYJBmFtGY2fA2f7p2RZ5uVmjM05u4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWgUXYRH7QtbYnbjD+1clD//NNy8n8tnSQzGs/48ZNg=;
 b=YxieJI2LpYIBIG2eEoHr8NTgS16/XPpAOfoWqh1dLbCbHf8hYcosUKmzI2Fj6NaW36HZC0/t0arfj1R/VChTZqOm6L6PW4YuCacmqH7Cw2yC4PvJrAGTUHMB+Dt2ngMN1bqWPPUJZnvzNevBgn9KAWQRlVRdpEbgWQPoGXj5mSQ0fG5RuJAt2zapIl00FH+t0IZYNbQzvzuBzb1PrAMAJfXomWJuzq+smE5DrW9G6FGaT7cYaGVqzI/25rHOI7cMqRXpOYzVdfSj0KNAsus7y+DDcQHygB4WyjYrYQnmeFuFGG4dCf9p6qD3zsig7I0DxFBOAYz62QKKeYEYQyRb7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWgUXYRH7QtbYnbjD+1clD//NNy8n8tnSQzGs/48ZNg=;
 b=csDR5Ho8TByZNrpvtO28wT6ON4RamHQ50FFeXb9HtVAz14ZEWM1ZIDmu7odV8VdfmUeKh8RVdOmIBBKuKvuIA+LRGmQimxPaZOBcE25JUxWS4jVKFWALeu/Ia4JcRkuBaBZNBvmiGjkC40gj3NIXdKV0vLO2BsUI0bDvF9VgTH4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5687.eurprd08.prod.outlook.com (2603:10a6:10:1b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 10:10:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 10:10:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Trevor Gamblin <tgamblin@baylibre.com>, OE-core
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH] python3: rework ptest handling
Thread-Topic: [OE-core] [PATCH] python3: rework ptest handling
Thread-Index: AQHZsNbExyW9UZMoOEaiE3raAAmA4K+uZV4AgAAJhueAAEbN9YAAMWcAgAPksoA=
Date: Mon, 10 Jul 2023 10:10:31 +0000
Message-ID: <4EC549E3-DBE5-4FD7-84F0-82E789959A7B@arm.com>
References: <20230707132649.3841870-1-alex@linutronix.de>
 <386DC5D1-AEB1-4799-94F5-C999E1DD8C10@arm.com>
 <176F9F2A43D46D21.7961@lists.openembedded.org>
 <CANNYZj9vYiAWsfmj9Q3_-25jUjiq0iPpVtQvuOJ2AM4p+gp+3g@mail.gmail.com>
 <176FAB1AAF8FB18E.3387@lists.openembedded.org>
 <ac5d0d60-6a48-8aa9-05d9-888763ffefb0@baylibre.com>
 <CANNYZj__syMeHd81Jic06529GxEVzBdm_JbfL1h40NHO7-kZ1A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj__syMeHd81Jic06529GxEVzBdm_JbfL1h40NHO7-kZ1A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5687:EE_|DBAEUR03FT059:EE_|DU0PR08MB9677:EE_
X-MS-Office365-Filtering-Correlation-Id: 09f095a4-423b-4821-46f1-08db812dea40
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lkcobNH/V9j1yh3KvrKYBFCDBYB9nU+j0SP75pVLk8ro7Fknu+iCvAU5wNo+JjQ3gAsfV/Z/waidK498tDoZASiE9OfFnsFdwqmhk9npWVLmktlPc5VxTnxoEDIceaB/is5OwIpjIeLyBylF4Di+xx01ZtFDV0gZ9M5ZG5NoKJ74lzNiDX4/EGEBtIt0w5srpCd0z1QG0MkUeInpZrnKapwtvpb0cv7YIJ6EymlOPYQA8osQyX3e2w7BhFsILMkdNx/V8ixpbecb4zFY/jL4huSrclzv/PLaiuPnUvXNDs9fyhdMzXszTudlATLad055J812zls4UeKArImQEHJ0e3cOA4O9DWdN9E5AsT//ILC5Azr+Y1yGdDGYrm7zO49sYm6JPQyUUoOJ9be141mjgjdv37Ur4lKr055fwsJWk8WMdcv4N0TRdXoFe70ChYFGJzO/aFaUeBuBVf4Bumz3lJONg2XO61pb6JTZlu4IV5IcGEVxVl/YUDCpXKAtKouycPozTUvPPgOJKJOO+2N6O18lT+M8/GtQuPijJmur1PLVBU7s1fJNtyypsr8LuRX8Pb/IKx/T5Hk3heq51K5GSh7ao/PvYmlVp2AHkgiItX693id2LfXcOrDS6fRcxya2CDGk/FWpQj3VPKxS6P1tAHq59MWqA0EGDZ0hqNoRrro=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39850400004)(366004)(136003)(451199021)(38100700002)(38070700005)(86362001)(66899021)(36756003)(33656002)(71200400001)(6486002)(54906003)(76116006)(91956017)(122000001)(53546011)(186003)(6506007)(966005)(6512007)(2616005)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(4326008)(6916009)(64756008)(66446008)(4744005)(41300700001)(69594002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6128503F57C0AB44B0F78F889257E680@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5687
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9cd30b61-a225-45ed-8ebe-08db812de4df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WHpj1SIMKq3F8hZrOpkUwttIC8BDqBtQTjIW2oAIOZGlWRet4fgu58g7z3ZDI2JGOP8EsxtoKz49bcE1jyqYm4CyFOjH6+9Ur1c/6bsJPnUjqoI7JQLl8KuZcvAKJmR6XNVDZC90ewzhSVFIRXI2J4EZrr1kOc+okKcCzAK/lJPCrfSlKm4m2sLXrofQh7qOtBoBVotIRJM1/WgEkSVhZB4SGb50mvnTdomBdaZ5QyvboJLSwOeaFsBqyLeP/lmfQZom6LUk1VTvYE1cac0g3sTC6owtsRrtPtTgqldnX4XYF9fRW4n7e4z6EGc8uYV3QYAA9Uns1a5Q5HJP1yh89mZ1abRW4Ck8cjXEml22DiftDrWmlABsYSp7Dn5X9EObd5ZVakjenYyDvxsVqsrsqUy/F8OGktBu58aGPhvXqM+uh0wd9VHKBB8S7qmpgehZmymsBhIJiJt1GC+l92WPTMfQID2QVMHitI9JS0XeA0all2oi1146NypTH8syXTHtdVjp6Amb6DAgAy6nPXOeQiQZJK+0i02sXUxO2mpAkqjsvuJMtQChZHbvk7oj0sKrY/SgtCuiLqTfWIUeYuNmmtCOexGADMrQUGX83TIDKvYTyYyCd+bEvKDORWMu82r0wK7GUqPPvm6oV356zYFypDnXWAssaPzzNHEBXj5BrsXyh08wW3xjcr+YrrXVZBVMcTbGIIdQr1Si+1L2/qwm99CGf292VGAUaN7MGI+TFM2ELu50etlSkzoF0v8f40RV
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199021)(46966006)(36840700001)(40470700004)(66899021)(6486002)(478600001)(54906003)(36860700001)(47076005)(36756003)(33656002)(86362001)(40460700003)(40480700001)(2616005)(2906002)(4744005)(70206006)(82310400005)(336012)(70586007)(26005)(53546011)(6506007)(107886003)(186003)(6512007)(966005)(81166007)(82740400003)(356005)(8676002)(4326008)(5660300002)(316002)(41300700001)(6862004)(8936002)(69594002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 10:10:40.6649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f095a4-423b-4821-46f1-08db812dea40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9677
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 10:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184066

T24gNyBKdWwgMjAyMywgYXQgMjM6NDMsIEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgNyBKdWwgMjAyMyBhdCAyMTo0NiwgVHJl
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4gd3JvdGU6DQo+PiBGWUkgSSBkaWRu
J3Qgc2VlIHRoZSBqdW5pdCBvdXRwdXQgb3B0aW9uIGFueXdoZXJlLiBBcmUgeW91IHJlZmVycmlu
ZyB0bw0KPj4gYW4gZXh0cmEgbW9kdWxlPw0KPiANCj4gSWYgeW91IHJ1biAncHl0aG9uMyAtbSB0
ZXN0IC0taGVscCcgeW91IHNob3VsZCBzZWUgaXQ6DQo+IA0KPiAgLS1qdW5pdC14bWwgRklMRU5B
TUUgIHdyaXRlcyBKVW5pdC1zdHlsZSBYTUwgcmVzdWx0cyB0byB0aGUgc3BlY2lmaWVkIGZpbGUN
Cg0KSSBsaWtlIHRoaXMuICBKVW5pdCBYTUwgaXMgZmFpcmx5IGNvbW1vbiBhbmQgYSB3ZWxsLXdy
aXR0ZW4gY29udmVyc2lvbiB0b29sIGNhbiBiZSB1c2VkIGJ5IG11bHRpcGxlIHJlY2lwZXMuDQoN
Ckkgb2ZmZXIgaHR0cHM6Ly9naXRsYWIuY29tL3Jvc3NidXJ0b24vcHl0aG9uLXVuaXR0ZXN0LWF1
dG9tYWtlLW91dHB1dCBhcyBhIGhvbGRpbmcgbG9jYXRpb24gb25jZSBpdOKAmXMgYmVlbiBwcm92
ZW4gdG8gd29yay4NCg0KUm9zcw==

