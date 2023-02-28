Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5444C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 16:15:09 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.78])
 by mx.groups.io with SMTP id smtpd.web10.27803.1677600901936341429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 08:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mdgzh+VU;
 spf=pass (domain: arm.com, ip: 40.107.15.78, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIuFMtczW2di/8UAzxLJGYQED6ctf/VbfwjlGI3xJrQ=;
 b=mdgzh+VUXQ//otV7anLss0JVn5MoEdRT3Wk8+j87czHdtQj56e70taeKd3Auxn0LvBr0lkfOPARg0Un73KqfRJ627IZv6LZKMB1xAPSM+Nv1N+ycRtkfl0Guuyl05u7Itoc95SlBDWulZIRyGHGxKmIkQaofnbh4AX/QbhZUYUw=
Received: from DB6P193CA0020.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::30) by
 GV1PR08MB7682.eurprd08.prod.outlook.com (2603:10a6:150:61::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.27; Tue, 28 Feb 2023 16:14:58 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::ae) by DB6P193CA0020.outlook.office365.com
 (2603:10a6:6:29::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29 via Frontend
 Transport; Tue, 28 Feb 2023 16:14:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.12 via Frontend Transport; Tue, 28 Feb 2023 16:14:57 +0000
Received: ("Tessian outbound fcd8b5fba459:v135"); Tue, 28 Feb 2023 16:14:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5832e8ff0a7397be
X-CR-MTA-TID: 64aa7808
Received: from 944050f776e5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A9164961-A82B-4A10-A242-5A2D9A2F4F94.1;
	Tue, 28 Feb 2023 16:14:51 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 944050f776e5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 28 Feb 2023 16:14:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kClSqK8I5DCo0AZPKM2MjH+/GoWpicSHl8z1mysYB3VcOQ1PqKpmDFY2E+UvDwdO4UlE6+FYJgiZFP3HrPKyu0V6LQNUwT3Y3+yfQA+gFrW+le1yz95aCH/b9D25oKyGR7HrkNZxZz0eLucHu9L947DeMaXU+sduB9fe1JiHjwusZC+PrklvCz9tchEPAOJikX8KQ62KB2yuQRWWqOITkK3Q+PacwtAtXv067yMBjpcsjOUPlv0xYggi84SOaOfxyxK37sTDm+3zxP7bfpszFDcYLIH0hAcugcC0qod5EGEMTNeohCNJiOhlbx1uI6f9BSLHlXYfqYf05P7yodCk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIuFMtczW2di/8UAzxLJGYQED6ctf/VbfwjlGI3xJrQ=;
 b=M9NCR0luKQ2sE8/NOgBs4/HjJZNBWNROhVcn8QRp5ltWmSWFLIxSF1WMEdhELwPEdF0Ld+Gdvu4+7JSc7ymkangxKySdV2K0Ewnzc7ItUF4cJ0rwiR2ydS3YmyZNC9Gf+Jzx+75CkmohlkHgpkN+rYxsiLRwnaTNR1KDalYP6Lp/UFjoQywW9OFvWZDMDn41n1B/aqwvCE/lTtV2VNXn0ylmU2aHFW7wRWcOt8CP8bQNwLeQgR5423RCTJVbtmWBm3hsAOrm/i1WzEUqB0CTD+Qp785pMae1GrD+SPjtLJWWQ38/U1QQfGyO35/5+TAjJkovcMQTmubgSs0Ixy9NJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIuFMtczW2di/8UAzxLJGYQED6ctf/VbfwjlGI3xJrQ=;
 b=mdgzh+VUXQ//otV7anLss0JVn5MoEdRT3Wk8+j87czHdtQj56e70taeKd3Auxn0LvBr0lkfOPARg0Un73KqfRJ627IZv6LZKMB1xAPSM+Nv1N+ycRtkfl0Guuyl05u7Itoc95SlBDWulZIRyGHGxKmIkQaofnbh4AX/QbhZUYUw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8652.eurprd08.prod.outlook.com (2603:10a6:10:3d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.26; Tue, 28 Feb
 2023 16:14:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 16:14:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ernstp@gmail.com" <ernstp@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] PEP 517 and PEP 621 support on Dunfell?
Thread-Topic: [OE-core] PEP 517 and PEP 621 support on Dunfell?
Thread-Index: AQHZS4WDIPqQPYQz/E6ZMGN3G1up8a7kiHGA
Date: Tue, 28 Feb 2023 16:14:44 +0000
Message-ID: <DDD6EA4D-08CA-473B-B291-ECBB71686B92@arm.com>
References: 
 <CAD=4a=Xi3cEf9KM-iB3nsLPEEJGupxVJZrMQ7qP9c7aSb3bJQQ@mail.gmail.com>
In-Reply-To: 
 <CAD=4a=Xi3cEf9KM-iB3nsLPEEJGupxVJZrMQ7qP9c7aSb3bJQQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8652:EE_|DBAEUR03FT014:EE_|GV1PR08MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: 0829acdc-c4af-451d-f1a5-08db19a6ef78
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Jm+GL39knwqf6/EVppHEvpLO4YCI+tath/VETDo0BHIciXKMwVYZxuyiP7znKlY+G4EH1rg0xnbEo9W5q4a508R44k2z/T3nDeGRJBJeLmajnJCwpsdIk365TlyXUnrMPS6UChkIgtJD1hY0JiOMzTc+2tsFsgmny9aCSCgYQryp6ffC0hn9cZdZQ9J30d9nW9LUnwzyPJln3Ct5skrHcKJ6kTS0dxMf01knrHJdhc5tiHXKsBUBUd3lrhjaltaxOxNpCgTq7YNMvXPsGFhSxDC1GAdhTfhEOJb5NQkRx/1rngtUsVR0OT0uHnmIaDA/FdKn/jnCEz4BybzPHbf0IlJrWA/TIbYArT5WNdM0J+x+pJAymfAGc9KHj1398aM5sG3KIZYtXhVsELHLLnUlerl0neQUqfm/r4xLKCdFGq1+ecZg74Kud+0EudM8UCkMxQmzAU0f4naLoyKQTECmxZgx7yPV0uyalODbrwrysNhw7hh4LLI1J/6aa1FF5UriD9Fopzsv6TwQPxL0d4X08+9cVGFeVghaCc0+F0VvR7CYwLp7HKi3QbgX/ypkk1Q55WuGvzt0m9nm4ZUanPT0KO2kRlyWPctxvy0PlAA+WARVk4DdANcy5oY/c8zRFd9KCbIb1a+xkSGCCLbgS4jL3dxhCzwTo+KqGqSBqU9dfCfWbf8NW3qeYu+AdcuAKOziJE+z+qKPz3Kkp8xQqUuw9E5w9tJx3jkzDyuk4qKVlYs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199018)(8676002)(6506007)(36756003)(38100700002)(478600001)(38070700005)(86362001)(4744005)(8936002)(122000001)(5660300002)(33656002)(66446008)(53546011)(186003)(6512007)(6486002)(6916009)(66476007)(2616005)(76116006)(4326008)(2906002)(71200400001)(66946007)(91956017)(64756008)(41300700001)(26005)(316002)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DAE749C296D8741A9103D261FFFE44B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8652
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	123edcd5-4991-41f8-c536-08db19a6e796
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PWwopd0V0eGX8zOd8LacGzs5FTINi1u7sKcsiPFhictJTR+t0iEOEozVEQgP0O7G/WZFC+80+cARlgrx9euEwKWKWk/NPJql9MQuCtAbYGueDdwKpoC3NWwSor6wxfA3pazU6XXEEILWlJAM8F9sqv/NxnbwrWeozzovB61DuEUxOE45yid+pwdZNv7TnDPpT2lw5MFN7vofy+1RKhZrOIvjU2eXXg2kopsa/bAUKd2GLzJdvycOG8fLeBTFP/UcFjACGAqY+aQcbpBo0uIQZFnK6vA31dXq2PVTZlkm2IteAs+NnfXt7ni0i8RbLUqi7cW98kYa/K/RA1GS1JIcNg9s2QN+kx8icqoBQp6x2G3495K8I4wg8eAs6G9XCQDy194vEFng47SqT5RQOHP2QEx0jAaBgqQzj0bHCKdA2HbK4vSM2ZBEq0E0v6CQdvPoiGpHk6lcw/8oT3uNDVOizLHsUbSrfbw8twxGa5jE+xp3b/CFqAnW0cMqln/9eIWBP/l+UpJAGsbIMXeeAf8FZQcAA53oET8RYmvGcF0+nEAxjxENdqFYgxpfwnTNG2WFonGfjn3uDLPRgIOLOu/YZJ9VKQPXv8POtt+J9QcEZxoxUIYKtpsOL4sDTTAuTXw2pXFUEmfWuiQwvnh91ainGJhS6ESdl9bL24/yxFXXZ05LoILRQd5zF1YAGoxSbWUggfwkReiCisGHR7oyBymKQw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199018)(46966006)(40470700004)(36840700001)(82310400005)(36860700001)(8936002)(2616005)(336012)(47076005)(4744005)(6862004)(81166007)(2906002)(5660300002)(82740400003)(6512007)(41300700001)(478600001)(6506007)(356005)(70206006)(8676002)(53546011)(70586007)(4326008)(186003)(26005)(33656002)(316002)(6486002)(36756003)(40460700003)(40480700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 16:14:57.6003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0829acdc-c4af-451d-f1a5-08db19a6ef78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7682
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 16:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177843

T24gMjggRmViIDIwMjMsIGF0IDE1OjAwLCBFcm5zdCBTasO2c3RyYW5kIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxlcm5zdHA9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiBtb3JlIGFuZCBtb3JlIFB5dGhvbiBwcm9qZWN0cyBhcmUgcmVtb3ZpbmcgdGhlaXIg
c2V0dXAucHkgYW5kIHNldHVwLmNmZyBhbmQgc3dpdGNoaW5nIHRvIHB5cHJvamVjdC50b21sLiBU
aGF0IHVuZm9ydHVuYXRlbHkgbWVhbnMgeW91IGNhbid0IGluc3RhbGwgdGhvc2UgcGFja2FnZXMg
b24gWW9jdG8gRHVuZmVsbC4NCj4gDQo+IFdvdWxkIGl0IGJlIHJlYXNvbmFibGUgdG8gYmFja3Bv
cnQgc3VwcG9ydCBmb3IgdGhpcyB0byBEdW5mZWxsPyBJIHNlZSB0aGF0IHRoZSBjaGFuZ2VzIGRv
bmUgZm9yIHRoaXMgc3VwcG9ydCB3YXMgYWN0dWFsbHkga2luZG9mIGJpZywgYW5kIGFzIHVzdWFs
IHVwZGF0aW5nIHNldHVwdG9vbHMgd2lsbCBwcm9iYWJseSBjYXVzZSBzb21lIG9sZCBwYWNrYWdl
IHZlcnNpb24gdG8gZmFpbCB0byBpbnN0YWxsIGluc3RlYWQuDQoNClRoZSBjaGFuZ2VzIHdlcmUg
a2luZCBvZiBiaWcsIGFuZCBJIGRvIHdvcnJ5IHRoYXQgdGhleeKAmWQgYnJlYWsgc3R1ZmYgdGhh
dCBpcyBleHBlY3RlZCB0byB3b3JrLg0KDQpBIOKAnG1peGlu4oCdIGxheWVyIHdoaWNoIGp1c3Qg
Y29udGFpbnMgdGhlIG5ldyBjbGFzc2VzIGFuZCByZWNpcGVzIHdvdWxkIGJlIGEgbXVjaCBiZXR0
ZXIgYXBwcm9hY2ggZm9yIER1bmZlbGwuDQoNClJvc3M=

