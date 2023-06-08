Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAEFC7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 12:00:39 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.55])
 by mx.groups.io with SMTP id smtpd.web11.7028.1686225632422851877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 05:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=iQijPLV8;
 spf=pass (domain: arm.com, ip: 40.107.104.55, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=868Xctvxgtl1KJF0MYPmk6bwAGS3mWWEIRTVIIsoP8s=;
 b=iQijPLV87XFfmxeTyJBrM48Sx8oDaUocea1cPTboTcdvoYgnnA0sCWC6VByxzzNsKV0iETjwkXZneWPmNTXmCjwTKQP3dgP5jaLt6jglocYRkXLZMIKjP7+J7wKIdHYwnqJFN0cm7RCFLzoyC1R1HxDFFDKc9uIf2f0PEm7LKbA=
Received: from AS9PR05CA0255.eurprd05.prod.outlook.com (2603:10a6:20b:493::17)
 by PA4PR08MB6127.eurprd08.prod.outlook.com (2603:10a6:102:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Thu, 8 Jun
 2023 12:00:29 +0000
Received: from AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:493:cafe::39) by AS9PR05CA0255.outlook.office365.com
 (2603:10a6:20b:493::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Thu, 8 Jun 2023 12:00:30 +0000
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
 15.20.6477.25 via Frontend Transport; Thu, 8 Jun 2023 12:00:29 +0000
Received: ("Tessian outbound e13c2446394c:v136"); Thu, 08 Jun 2023 12:00:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e1462d0e0beacf9a
X-CR-MTA-TID: 64aa7808
Received: from a7d67771f170.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 73158CE4-4A9C-46E2-B94E-F7C6E61F1381.1;
	Thu, 08 Jun 2023 11:59:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7d67771f170.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 08 Jun 2023 11:59:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuB8/GmrcqynmSRmx28lDTnUUs8tFrlzoS3JZD+w+8N5QUgKo6fhjSQpYSfRIla3dELvEWZQblxxSEdOfXtyWvGxYLNTrAfwVNt3RYLenNfR6WjHecxlnKRHYoL1UN3Xk3Y8iDnpXr7KVKv5DbnP8HKHdbDRjVS6bWuDCAXeVffveC5RUVFE/1T+IoyKwP4QxQ/sI4RMxpiaDMC+EmAP5qnhpK6TDf8LepxMQwkJtQNjhmgOMyhTkpPgfEDjxcQlvPLf2NkMGElPUlfMhgnkbYvBFTlBDqxlUs4Nh1LKvpn8CP8qxwm89uvKx/FLCPYWjI2hkfcd6l6PWaQXle7rIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=868Xctvxgtl1KJF0MYPmk6bwAGS3mWWEIRTVIIsoP8s=;
 b=Ty8wU0M2l/HPJ3hzNIZ61ufeIHmdOCav57O1PJBb9M4VKzcx4VhjC1idR9/XV9wjr96F8gjW1iPGquIZuSFmS7zpdyREj9LQtDDNx0pPfYLSvss1yuRoxVRcHewS0BuH6O9jMpFRoqxTVU2kZomJFuGEH5DLWe2OovfnAJEPK5AgMmp4TJKJbLif2m7lMyg3Dx5CP7g78oOHeVNplFHewAJqy4W4dboVx0sFt4zsvtqa+3roiHna751kXMFdlMTWY0PwnquZQH6lDfBdGPOo4jF8NuXSJx38iogldBpzTRk+cUVpSH+98lJmmmO1kAHdCe3dP5Eh9sOnEok3xAwTUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=868Xctvxgtl1KJF0MYPmk6bwAGS3mWWEIRTVIIsoP8s=;
 b=iQijPLV87XFfmxeTyJBrM48Sx8oDaUocea1cPTboTcdvoYgnnA0sCWC6VByxzzNsKV0iETjwkXZneWPmNTXmCjwTKQP3dgP5jaLt6jglocYRkXLZMIKjP7+J7wKIdHYwnqJFN0cm7RCFLzoyC1R1HxDFFDKc9uIf2f0PEm7LKbA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9090.eurprd08.prod.outlook.com (2603:10a6:102:327::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 11:59:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 11:59:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] nettle: inherit lib_package
Thread-Topic: [OE-core] [PATCH] nettle: inherit lib_package
Thread-Index: AQHZmHQOPXQaObflTESbwvykJv8RTK+Ao6KAgAAs2QA=
Date: Thu, 8 Jun 2023 11:59:47 +0000
Message-ID: <8003C686-0D2A-4FB6-A7B2-8B371D9A1504@arm.com>
References: <20230606123732.3924953-1-ross.burton@arm.com>
 <20230608091905237b3e22@mail.local>
In-Reply-To: <20230608091905237b3e22@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9090:EE_|AM7EUR03FT026:EE_|PA4PR08MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: fec5c7c9-802b-48ca-c809-08db6817f40b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 axaZfP5yjCKiFcSJe4UzhziVJtpXHGNCKKS/f1HN9i5tv2Us33J3l54Ai8r+JmFkldAjH0zlEoXFn9YhLDd5NpY12Qif+VQa3GJoajEu9aH7lyNnIqOGNQoDGtkRYWtk6k+hMf4erGwpcSiSViY4ZXCb/G6wceHjAaElfxTc6mzNM4nKjIqJlg8ZbbHDOXf9UDT8RHgVf/sGmABT3dW/cFErq7nFDNKTrDfL6TGzCnaNGvQQvuc+zf6qOasTp2uz5p1SzUZX0y1CdSwdxCIauiakp0Aq9giGo1YhpBzz7sevrmRcfvRNucAqMAfQZw0YrVLiGpN/hzzkxPwISxVgNoWpN1ZYOItZ8QV9rp+M6mWGKgSRw3XMtRuJ5584womu7Cvxs69u6PqXW7asEAONsroJa3q3Vgw2ZJeJFabQ6g0OvzQS9KKBtEiIRWh9fkm/lod/1HYhQNDLLck5cLkxbGX5Gyku9xyuCV8/U7VEaZcW2BRqjtkleaH/VFC7KSuKDbGFozguV88yHiKK0apvkA+SOQJOxSXk1C9vb0+IMcW2Z8LU//ii12JuMCTLVwUURVw5JYD9sQSZSiTWcuuveXnNIuJ0+2nHhtAdtGmXBMTlzISF+QSOhmHITWM19JLTg5x7YuppAiaWTSpBPIo/eQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199021)(6916009)(83380400001)(316002)(66556008)(76116006)(478600001)(91956017)(122000001)(4326008)(8936002)(8676002)(66446008)(66946007)(41300700001)(64756008)(38100700002)(2616005)(66476007)(186003)(966005)(6486002)(53546011)(26005)(71200400001)(6512007)(6506007)(33656002)(5660300002)(38070700005)(2906002)(86362001)(36756003)(66899021)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <588C48436344F847BC8759FA1F8CA0D6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9090
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8b6171ef-d146-4d0b-6428-08db6817db0a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c7nHQGm3SBUtyjTITFeFsUsslGNb2C/TPeT88RdOKQ1vW/myEcDzZN0jw8Ip+eM5pfYFCtByxYJKSatqoihppWqbaEyHS+U3ytY0Ue7XpgyBLpm0ttNU0MxdVNsKtQ81ZLEh1WejYhCB8JT/6AEBemZi2lmla5kG9DdxVQ79NcO8qlCX3SXp21IPUWO4kZ/Gd4FyyU3upfplzfnwfmt/wY1QI6UpA82MsuZkYmNhz1v93exOQRYklmEMz0DLPm/13eVvkxM0b689Do16dnYPNqJlLHPnicEgXo5bqW0jYKSltEMD1QjDgaCHndXlQXVPNKi8ogwVWgObjKZg0TwnZMqhOe0U2OL0k9ZPRU9RPDSM4fApZokXqQOVQ4LhP76ituu2PEXCmaC4r90NhZWfmGxdDj/MRscJ/Hdy3oBaXfW4Npzcdc39uSqOZdMzH/n7989wjrKGfICstLLo2ylQZMvUlVu0DOhevRkX7jtyhkiUDWo438ZyDwc0LNPp4FE9ZnzLT+81fQTclv8oyy5RamOAq81wTzeSJzPTbMZ5SifNDG6KVBwaQiIftC/9kc6MTvGmJnMqV7tbVxxaQij4IBmoT3w0bvyy77rjFjci2gVaq/1W9K1aUTG8EQSdvMlgmBbNRi2sPbX4GItidKU7L4miuvKzzs7P7kVU7t6tVjO5/P3IGe45F9o5rbrf6XaHt7mb1Y+u5zSQcnbSCXkiYti18vfqXMpQWxKjoetzIQs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199021)(40470700004)(46966006)(36840700001)(478600001)(81166007)(82740400003)(70586007)(4326008)(356005)(70206006)(36756003)(8676002)(8936002)(6862004)(86362001)(33656002)(5660300002)(40480700001)(2906002)(41300700001)(316002)(40460700003)(83380400001)(2616005)(336012)(966005)(47076005)(26005)(53546011)(6512007)(6506007)(186003)(6486002)(66899021)(36860700001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 12:00:29.0537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fec5c7c9-802b-48ca-c809-08db6817f40b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 12:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182508

WW914oCZcmUgcmlnaHQsIGFwb2xvZ2llcy4gIHYyIHNlbnQuDQoNClJvc3MNCg0KPiBPbiA4IEp1
biAyMDIzLCBhdCAxMDoxOSwgQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJv
b3RsaW4uY29tPiB3cm90ZToNCj4gDQo+IEhlbGxvIFJvc3MsDQo+IA0KPiBJdCBzZWVtZWQgdG8g
aGF2ZSBjYXVzZWQgbmV3IHB0ZXN0IGZhaWx1cmVzOg0KPiANCj4geyduZXR0bGUnOiBbJ25ldHRs
ZS1wYmtkZjItdGVzdCcsICdzZXhwLWNvbnYtdGVzdCddfQ0KPiANCj4gT24gMDYvMDYvMjAyMyAx
MzozNzozMiswMTAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4+IEZyb206IFJvc3MgQnVydG9uIDxy
b3NzLmJ1cnRvbkBhcm0uY29tPg0KPj4gDQo+PiBOZXR0bGUgaXMgcHJpbWFyaWx5IGEgbGlicmFy
eSB0aGF0IHNoaXBzIHNvbWUgdG9vbHMsIHNvIGluaGVyaXQgdGhlDQo+PiBsaWJfcGFja2FnZSBj
bGFzcyB0byBwYWNrYWdlIHRoZSB0b29scyBpbiBuZXR0bGUtYmluLg0KPj4gDQo+PiBTaWduZWQt
b2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4+IC0tLQ0KPj4gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbmV0dGxlL25ldHRsZV8zLjguMS5iYiB8IDIgKy0NCj4+IDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmV0dGxlL25ldHRsZV8zLjguMS5iYiBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L25ldHRsZS9uZXR0bGVfMy44LjEuYmINCj4+IGluZGV4IGJmNDkxMzIy
MzU0Li41ZTYwOTQ4YzhmNiAxMDA2NDQNCj4+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L25l
dHRsZS9uZXR0bGVfMy44LjEuYmINCj4+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25ldHRs
ZS9uZXR0bGVfMy44LjEuYmINCj4+IEBAIC0yOCw3ICsyOCw3IEBAIFNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIzNjRmM2UyYjc3Y2Q3ZGNkZTgzZmQ3YzQ1MjE5YzgzNGU1NGIwYzc1ZTQyOGI2Zjg5NGEy
M2QxMmRkDQo+PiANCj4+IFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIm5ldHRsZS0oP1A8cHZlcj5c
ZCsoXC5cZCspKylcLnRhciINCj4+IA0KPj4gLWluaGVyaXQgYXV0b3Rvb2xzIHB0ZXN0IG11bHRp
bGliX2hlYWRlcg0KPj4gK2luaGVyaXQgYXV0b3Rvb2xzIHB0ZXN0IG11bHRpbGliX2hlYWRlciBs
aWJfcGFja2FnZQ0KPj4gDQo+PiBFWFRSQV9BVVRPUkVDT05GICs9ICItLWV4Y2x1ZGU9YWNsb2Nh
bCINCj4+IA0KPj4gLS0gDQo+PiAyLjM0LjENCj4+IA0KPiANCj4+IA0KPj4gLT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj4+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0
aGlzIGdyb3VwLg0KPj4gVmlldy9SZXBseSBPbmxpbmUgKCMxODI0MzUpOiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE4MjQzNQ0KPj4g
TXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTkzNjIx
NjkvMzYxNzE3OQ0KPj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbYWxleGFuZHJlLmJlbGxvbmlAYm9v
dGxpbi5jb21dDQo+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPj4gDQo+IA0KPiANCj4gLS0g
DQo+IEFsZXhhbmRyZSBCZWxsb25pLCBjby1vd25lciBhbmQgQ09PLCBCb290bGluDQo+IEVtYmVk
ZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0K
DQoNCg==

