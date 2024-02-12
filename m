Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AD9C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 14:37:49 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.53])
 by mx.groups.io with SMTP id smtpd.web11.7828.1707748667229439091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 06:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=20kEDGjH;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=20kEDGjH;
 spf=pass (domain: arm.com, ip: 40.107.247.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TrfxnLVZIjHZWUqA623blDNot4TELi0bw6mLTQYfneqWsIqAD7jfAMKZSIMkSQWtjIyokCOludRR8xGgNulsCRnOHwKnHJ736FdYseSDsTwYgWsrFLDL2jXgtNzkTsdi0JFYgd7TwVCTDHod/KfYCOtzasktqyZNa37lLqvSnOZ5YxXhbgv68I06B382zbVDyWJaYOudc4l1bMVXrDUjhV2THcroGdS/3zuOFYDIRgs3H50Hsx13UHcwuAZqYbuhuoYuNGloCXGc5eUnHKHHywBqj5q7YMG7yxU28r2QbYA3E3r7O/QIAjT73okLUkaUgwBy0av+BGcTTSKcyqjC6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpj4JB9l4FQToD1KBIKNmXAqiA4FU55iy7lggQGZ3DY=;
 b=bMzhXI3WTyi7kvnwVktRUNVpkqgiZkLi/0lDBveoobIOlyzbRMjcEjGHcZrPyhUEGB/d4xxNiAG1JsL9Q3NLyDM6j6PxsMnmgat391yiNDCTBuasFmlx8SdFNCI3xMd6zznaqDzxcH+hVZAe3absXZzWiWAYoXpBpl+Ltzrn/9WMGM4MGgssoS6JgwLBE+i7VnLXKoYiMop2N7al0BbEEIEvLoW10kSmV6YJEMmRg0vTarlYDxP8GuiyaM0H6Q9njNa5KT/FJoumNdnbnFtaMbSrUV9aLqGy5AWgjknnOqkUYxm61XZf5in00chFeUos8NrjraCHkngZU9U3tRFMQQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpj4JB9l4FQToD1KBIKNmXAqiA4FU55iy7lggQGZ3DY=;
 b=20kEDGjHrEZ739vHulPALCsiLXTftA0fymN50tpPOKyH82u7SVH6sBacQwQBmvPEspi0IbEbtnPvVbU58qPllIueJujhVnZi+zRDyvhW2WZw9VEFauhH5MPle+0V7fctfOZZTpRcS7oWQAspwQfcyarCVaut8btqT8gfEmDfIu8=
Received: from AM6P194CA0036.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::49)
 by VI1PR08MB5406.eurprd08.prod.outlook.com (2603:10a6:803:133::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Mon, 12 Feb
 2024 14:37:42 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:209:90:cafe::20) by AM6P194CA0036.outlook.office365.com
 (2603:10a6:209:90::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Mon, 12 Feb 2024 14:37:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 14:37:41 +0000
Received: ("Tessian outbound 94d82ba85b1d:v228"); Mon, 12 Feb 2024 14:37:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c58f7e494f573fa
X-CR-MTA-TID: 64aa7808
Received: from 85d5b7160bf6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6F879A56-B300-4016-B485-516D53AF2F2F.1;
	Mon, 12 Feb 2024 14:37:34 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 85d5b7160bf6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 12 Feb 2024 14:37:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6EiXuKUXm1gohpZsSoS5te0S1QFaVewo+zjhonWkpyvceLSIcGnjFxrcoYj1Wqvn4mFTHfd8DukOH5sDID/NQOpcaH88KrLUF4xcjkPC9C6S+cXZ/bN11h0Lff8TdDkYS1GkocJYDmGehHs97Jk+7gIRTpSMyx6N9EPbViKPRoxQ00hsPVzNDu3f1IVFWEGa688Vwu3BN1vjY8f+tp/S0xwZ5BqU7PJexcx01qn9au2XB6KLmn7yOyM3GcXb9GxCVAob7yjAP2GEmdHEt3tlOUrsb59e7PR9DTE3e9tyLeouLAiiehh6QCy9CaiAWhHbEq8s0FHwZfUqDYgpFwHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpj4JB9l4FQToD1KBIKNmXAqiA4FU55iy7lggQGZ3DY=;
 b=aqg5D0R8dUcXn3BWOw/Sv3DS9FzoAjMq2kj/CTLcx0TwfoT22TBmcyvjU+5kI4DUjYJ/xhcXPfmYgVj5ihJ512VNTkh7ttR4iTm9RAH76Zxs3XoGJk/vbxo/WHnkDRvrRjb1R98odTAFcRq9eyKbioLtngco83G2HInPQZ8ZTVn5Wr0EhaDrPM61063uJOFpbj4qHgXBKahJJHOZ9w4Epw3wnaoYOuZoGqjKgucwtXiOuM/0JTCq8Jw686aBuzM00Q8Qwgeiq0A3k9lH3CtGVNqmHLY4mkHkXGJGFzr5etGgdmFH+gVh/YZ/qDZ5hAKsP0Oevhf41vClwIs9QQMwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpj4JB9l4FQToD1KBIKNmXAqiA4FU55iy7lggQGZ3DY=;
 b=20kEDGjHrEZ739vHulPALCsiLXTftA0fymN50tpPOKyH82u7SVH6sBacQwQBmvPEspi0IbEbtnPvVbU58qPllIueJujhVnZi+zRDyvhW2WZw9VEFauhH5MPle+0V7fctfOZZTpRcS7oWQAspwQfcyarCVaut8btqT8gfEmDfIu8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5832.eurprd08.prod.outlook.com (2603:10a6:10:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38; Mon, 12 Feb
 2024 14:37:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.024; Mon, 12 Feb 2024
 14:37:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mail2szahir@gmail.com" <mail2szahir@gmail.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	"ranjitsinh.rathod@kpit.com" <ranjitsinh.rathod@kpit.com>
Subject: Re: [OE-core][master][PATCH] alsa-lib: Enabling ptest for alsa-lib
 component
Thread-Topic: [OE-core][master][PATCH] alsa-lib: Enabling ptest for alsa-lib
 component
Thread-Index: AQHaXboSi3Q8iCU2hUq6dnrZnX9OhLEGxoUA
Date: Mon, 12 Feb 2024 14:37:33 +0000
Message-ID: <FB2092F0-0CA3-4AEE-836F-BA4BCDE9AAC6@arm.com>
References: <20240212134645.7972-1-mail2szahir@gmail.com>
In-Reply-To: <20240212134645.7972-1-mail2szahir@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5832:EE_|AM2PEPF0001C711:EE_|VI1PR08MB5406:EE_
X-MS-Office365-Filtering-Correlation-Id: f502e1fb-0ac6-4480-d9dd-08dc2bd82b55
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 DJG1V5/c7yRK6aw71jKy3KljadPCB+s6Gb/5R5/n1M1FPw4xzyhG12Zpo47aRxliyUfJTqwgiQXTN2gm3NYK6ZQvhlTJO7NztWnClGmFg+2ZY/9wQ7sSWrc/bGQwhpRr1R+4r8WTMdVHVyalyfp2dYRmw2SgFnIw7ejo93zZtq8aQbEuRcj+O7AobIImSMJ7GMkIio589Vz3Hc0/uePYC2PzInnYDJZVAGjLkenDSuAnMTTcMEJOm1fM42QCdYwuUAPYtpzDQBDvtKgT/KHP0XksRtbFDv7bDD2BRisAwkcuU/Tb+0oADV5dO1dCDHZ2VtN6siC2SWhlbF3JIz5Apc9ZpwEbxk/xWjRFk0t1QXOGSmI8DDUF25KfbWeoQaW+ZyDMOjrOe2PULO0UfXVvIXUrIRzIDuRclJmosnck9nb5MeK7chgmXqXPOM48jhEuuYcx8K+WkgtzVClp+DqulA9hdsYlIsEPZuZHZMItGCRB/Ke0U83p6m7XJfMQKjk6KhQWM342+zK4e4sdQZUBSkZCHEt69clgTh2sg0MBZ/e5m7zKHRmNkAYviHo3JMiBS7GMmobjyPiF9C2gEkk/U5zBJD6+Eu8BwN+QpeNF33tolV8yryLg1VdDi0WUiHre
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(5660300002)(4744005)(54906003)(316002)(41300700001)(2906002)(38070700009)(2616005)(86362001)(26005)(33656002)(122000001)(38100700002)(36756003)(71200400001)(76116006)(6916009)(8676002)(66946007)(4326008)(8936002)(66556008)(66476007)(66446008)(64756008)(478600001)(53546011)(6486002)(6506007)(6512007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBFF3827B13070468D45736E68D2B166@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5832
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	59d17ed8-f52f-4dc7-62a5-08dc2bd82654
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sytmumqiFR4IlAowO/tY9oGTiu6pQyxGig4LUR7WDuvfGLBqhT+UkJI8Fk8UezFwwXQYUNbaTtcnwmTM37qC1DkjJGBvI0OIUv1/v4l3mLv+OBAHXXOuB60ezDNEjAOnOCFwPcH4dOnNCzIwT8r31Ub9W3w3DIKD886j2EuBBYHM6BkDMB3KIe4r7Tp+eAAJspJF3wBVUcWQ2mDSBbCQk9ai7tp/wOCQLljaucSYkXCQduxgLI8AixTI4uoY7FdQcAQ5SWqCGRiIvI2X82gr6Srtl7Hu8UlI+UrCk2Kqbc+qnr81iIaDit7GrMKAOoZbUKazNE9Cg2WSW9s1YbRrO4Jr3FBHfjMEvgCGa2IZqw27Prg5f3HTPGSJqXDgj6K25UbKr3ivZ+gZ50x0P2V57U9urjoyWYbixOH1Cql97THKcm2G2MGLzJi1dC+FHw79X1cccJ+RqwRVn2QXZQlrBUvMaIxhmEXN/F+xzszUUXixYPe2nafimOtWFHiubvDWF9T8+Dax5IZc3Dt4uL3M9Z/SlvEmAOHxqy/LPubZgU9MBhhyV+4HYtGu+Qkmxs/LEQkgIrtE35t2hwX8SFYNjiF+q4cNnV0Fx1JwVN0xJTg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39850400004)(396003)(136003)(346002)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(36840700001)(46966006)(8936002)(4326008)(4744005)(8676002)(5660300002)(2906002)(6862004)(336012)(2616005)(107886003)(33656002)(82740400003)(36756003)(81166007)(86362001)(356005)(26005)(70206006)(70586007)(316002)(6506007)(54906003)(53546011)(6486002)(478600001)(6512007)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 14:37:41.9275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f502e1fb-0ac6-4480-d9dd-08dc2bd82b55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5406
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195336

T24gMTIgRmViIDIwMjQsIGF0IDEzOjQ2LCBhc3poMDcgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPG1haWwyc3phaGlyPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gLi4uL2Rpc3Ryby9pbmNsdWRlL3B0ZXN0LXBhY2thZ2VsaXN0cy5pbmMgICAgIHwgIDEgKw0K
PiAuLi4vYWxzYS9hbHNhLWxpYl8xLjIuMTAuYmIgICAgICAgICAgICAgICAgICAgfCAxOSArKysr
KysrKysrKysrKysrKysrDQo+IDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQ0KDQpJ
IGRvbuKAmXQgc2VlIGEgcnVuLXB0ZXN0IHNjcmlwdCwgd2hpY2ggaXMgcHJldHR5IGltcG9ydGFu
dCBmb3IgYSBwdGVzdC1lbmFibGVkIHBhY2thZ2UuDQoNCj4gK2RvX2NvbXBpbGU6YXBwZW5kKCkg
ew0KPiArICAgICAgICBzZWQgLWkgJ3MvXi4qJChNQUtFKSAkKEFNX01BS0VGTEFHUykgY2hlY2st
VEVTVFMuKiQvIC8nICR7U30vdGVzdC9sc2IvTWFrZWZpbGUuaW4NCj4gKyAgICAgICAgb2VfcnVu
bWFrZSBjaGVjaw0KPiArfQ0KDQpXZSBwYXRjaCBhdXRvbWFrZSwgc28geW91IGNhbiBqdXN0IGRv
IOKAnG9lX3J1bm1ha2UgYnVpbGR0ZXN0LVRFU1RT4oCdIGhlcmUuDQoNClJvc3M=

