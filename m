Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDDFC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 11:01:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.82])
 by mx.groups.io with SMTP id smtpd.web11.33208.1702465276538914319
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 03:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cPUf82CE;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cPUf82CE;
 spf=pass (domain: arm.com, ip: 40.107.21.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Hx2qj5s9okoz86h6gSQADqRwgqmj7LlJ5l0EqaBHKuTg96tKdymvW6dVL8hyxFk7jJ3KMvqs5gpVGFv01J5XgL0xovFZhUfkDZcf+RbnOyJzjRNy2NGIqW0PpH7F/3KIbac9n8vFCgvYEsq3+OTkD+UhufHu5fgTu/usn3AgHdDxHaluIJhjbAcq6iVQdxnJnfpeE11bhIqAFweEOFUlXKQwJXhLXPtJRqT2LSluqzC3UCaTMxLTbuYMLdL+NOYDMM30gjl8ryTimhQoT7WclJNeJrn84uxlK2OznG1/ym3t34vtEoMoeLe4z5JUKGOtfmqA52s5xGdIEofegsDBRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhrKarPNhVozdhdq+lYCznDXEKAUJ+2yNcPaoi4yxIs=;
 b=LTnkhTcuvOs3faqHNvniWT9dW9U+nJgQEmR9po5ZDXb5QKVYRRMEj3gMPdm6mQnGdIa/VlTpTHwKXDkfoW4YV6PPaaOqxTLzVRUBPnpPsEAxjH83H1/3LcMY0P6s4jKCyyaBN7t3bwiWGWVcKFfZR+8cVpEIWTHtpwuUnd9RmBattAl2yjA6gMzcGutZCduf+/3DVSYuwYk28DPSdt0vBDBavKBNaLF/TAaBraN6bkNnHjoK5DOrz95yTWGoUoQA8CmZh72eQfYww+BUnPBjGxazi45izPTHgjk53qlO/yNPsKwk6LQqQTPT4bb17tzjfCM2yCFyvw3yV4OSwRVfmQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhrKarPNhVozdhdq+lYCznDXEKAUJ+2yNcPaoi4yxIs=;
 b=cPUf82CEcjK/fKmBkfn1Aktb/Z2QgsvmdnQOaX21M96nZ7jcoX1sifrj3DNtOKM8/Fduha5IeGvTOdCzno7YQApUQhIzqGnEwIYIp+xItWPS/5m0YJn4ePJGg23vazSJkZp7aLubf8eASuK14uy+tcjb7DHIMzn6CueuE/z/GAk=
Received: from AS9PR06CA0030.eurprd06.prod.outlook.com (2603:10a6:20b:462::35)
 by DBBPR08MB6313.eurprd08.prod.outlook.com (2603:10a6:10:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 11:01:10 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:462:cafe::ea) by AS9PR06CA0030.outlook.office365.com
 (2603:10a6:20b:462::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Wed, 13 Dec 2023 11:01:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 11:01:10 +0000
Received: ("Tessian outbound 20615a7e7970:v228"); Wed, 13 Dec 2023 11:01:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 99b4661d3ec55194
X-CR-MTA-TID: 64aa7808
Received: from fc3d6079d703.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1CF2E024-BE5E-422B-8BCA-9424418A1A1E.1;
	Wed, 13 Dec 2023 11:01:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc3d6079d703.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 Dec 2023 11:01:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4sL5EfZlYTsdI6bcR1QB8FcxV9xxzBTTX6wL1IHzp+R3bl7moZsEFP8x+2B4fNvVApejda+HIqlfmOG8ppYOTcxpZTDTYmHNpI6TfePehF7Y9+UUPbRbYIo6Ypir/8T+1vCRRaa0cig4A6T+RQXtU3oHKEX0HBqTcXgZgdKkOyMerIY4QUejD5xyAnJYglOaBqFKVjVX3sdAFrw3mph1FnXesa/3sdP8NwZSFTHZb2mcDlTFQzIgxWTVkxMsuM63oAebDbIrv/j2bqpM40tAz0vQuKsdW5n0HMmPFAofYFZZwM8u4nW5AqFCEJDOxvdswl7INh2l9ZhNP2RSp4RWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhrKarPNhVozdhdq+lYCznDXEKAUJ+2yNcPaoi4yxIs=;
 b=DqDYiVBnV8u5BDxI1dC7lmyjwjSIFmuBMIsJ5xADRCx9nnts9i1vO1QpIb8dtINg9nuWDS4pa5XtYAfhBikt01XKbyuOC2QUblD2J2sTxEBhXTtL+39Y6PQ1OHwOTLJNpR5vLO657yWlHor3v6FBq34Qigo1/2+MUfizPaG8g0Um7J/yhUosYTQmq4nXzJ6i2itwiWONxioyeIyu1EMkhH7VDLIjKnpUTh4mcTNWpKX8l9/UFFR+6tfvx5QH05AhT1reA97JT67flWYhzrJTD6yW/plGwCTj75f7pQwjI8DA8Geh7HR/OjrYdxERWdAfXuf4LEZMhumDkfuSy5icQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhrKarPNhVozdhdq+lYCznDXEKAUJ+2yNcPaoi4yxIs=;
 b=cPUf82CEcjK/fKmBkfn1Aktb/Z2QgsvmdnQOaX21M96nZ7jcoX1sifrj3DNtOKM8/Fduha5IeGvTOdCzno7YQApUQhIzqGnEwIYIp+xItWPS/5m0YJn4ePJGg23vazSJkZp7aLubf8eASuK14uy+tcjb7DHIMzn6CueuE/z/GAk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7915.eurprd08.prod.outlook.com (2603:10a6:150:8d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 11:01:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 11:01:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "johannes.pointner@br-automation.com"
	<johannes.pointner@br-automation.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] ldconfig-native: Add usrmerge support
Thread-Topic: [OE-core] [PATCH v2] ldconfig-native: Add usrmerge support
Thread-Index: AQHaKBgJ0dudqC3Atk++VpHJNXP1UrCnFxMA
Date: Wed, 13 Dec 2023 11:01:00 +0000
Message-ID: <654B156F-66BF-4AE7-A9C8-12FAD78EDEA2@arm.com>
References: <20231206074307.21110-1-johannes.pointner@br-automation.com>
In-Reply-To: <20231206074307.21110-1-johannes.pointner@br-automation.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7915:EE_|AM2PEPF0001C714:EE_|DBBPR08MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d18c63d-6ca2-426d-9fc9-08dbfbcad078
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 orU63YuND77Dqhb+E3k5yDr6bPlQvXULP00O3vCmhvZx0UybFBxIZAjsQvhWzmdTeO4lp5aBU+uUw/YVxcQ/4XF81HxI3cf77eNAmo/LSr54QzKaPua0G87gnHeOYK1tH7emRo7qHKBtB/YQ8LZk6NTYGDDb/J7nzXw6cISIEKK6fFdk7Dv/BCrg/4uR41B6gK7cLallfBvGSvftLBbnut+9Bb4YBEEXt7MFpwOMhXAQXc7DM+sbXel16sAhiarnU0ZFOzv+xlr6IK+n/552GW6gGmZd21NSu0wBc+MMeVordEuyoFOayy90CvN+RRz82W+fZHBQy/B/7cAzrIW5vM00MB2dePv/dggwP05aFmifzurU+No3o/eAlrC1u536vkuPpR2f/n+MTJugw239jFwpXMzVlEoGsaIcI4HOF+mubSphCgmgag1IC6FSKKRuoxnIUI1GLdV/dUteAxs85L6P2d6t8lHFYUiErwYa8kR+HqV7BCBjjenJBSLRsUHoKrwggfEMWu5ZzF3o7455Svxp+yTi8ND8YwQv+391VU3/csn+hYvl7+c845DP4w/T+pjISV34RqAzFNky3MY/8HwKMVTYqGanGOA5g5kqlYItUchklpS8L/LhsEiVrnOO8vNtaNStrRkAh1n3Hbif+lz3oDA7C5Z/74w2V3V4fH+DCywil9XJ9XRp57zJgqx/qgTOaF+fEpgL0vUzahw0KQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(122000001)(38100700002)(71200400001)(26005)(2616005)(36756003)(86362001)(41300700001)(33656002)(38070700009)(6506007)(6512007)(478600001)(316002)(6916009)(76116006)(66446008)(91956017)(66946007)(64756008)(66556008)(66476007)(8936002)(8676002)(4326008)(5660300002)(2906002)(53546011)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <861034400C86BA48AC3952FCB85C4662@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7915
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ed93f5cc-1ae7-4d52-3db0-08dbfbcaca9d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tpcoiJ4CJdwoOe/hgW2vW50JuQel6ehX5xQEPgRMVygcFU84c6+VmUz/RWEbqR91Ys46okvIXMzEfTZQLDLL5CkaU9Hzd7ehUN6ODCnjRcgghVwnQ4mskG+chBWvRZh5m5kIP07y51SvYcYl9Kpa+VMWsNYTdkX3Rp+k5cH3czWnhxRdjwwUTtG212I7qDnG4nBWNOqzmF/is1RIHx2lnDXPmsIe+mVonmFihr2mfO2y2S5Ve1PKWIJc+6Gl42HMukv8mJ+ibSZYNCxlYqt1DmH301BpYP2z9ZFuB5/Zu5LTFAtD3lrJzj0d1XUTMCTGHKRhHH69nGbSD0f+EvANUbooO4Nbn2s/PwRhTNi46ty2fghBNl+mvuHjVZGgnMnYOgjV3xtmpyqhqzHFinwrxK0Eyp0SQCDDGRGZ7+sOcjSzFoRgUwVqyPVl6Gau1/wRPNOj5V2ILZ7NX5QR6KvcYGZ9ja6ErSSl84lw5MgTXtbw2KTgtLGyeSOLhrYlVfmGYDTbLrhxzOU5OAuSHBhpAXGD4TltwuAWgknS+BGx2V159ABOvAcLajAABvkM+aGUWoIydXSLETIi5QYJzcXpjyxEwnH/5+tQlCnhvM2N35FJeQubDyhuNz0BhOYOd+r4qVYF3cLqA06DaqsybeDZr7VHhobnoNG8xKzKvh7w9dGfOdkLVm7y2xAwWrSphs//cwLl67+E9ohPpIjM1Gp1dRbZAPPX8FnrDFWJM0FqjwXxDGE4CDZS4IkI24q6ZtNh
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(451199024)(82310400011)(64100799003)(1800799012)(186009)(40470700004)(46966006)(36840700001)(40480700001)(2616005)(336012)(26005)(6512007)(6506007)(40460700003)(86362001)(33656002)(82740400003)(81166007)(356005)(36756003)(5660300002)(8676002)(8936002)(6862004)(4326008)(36860700001)(47076005)(70206006)(70586007)(41300700001)(2906002)(316002)(6486002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 11:01:10.2120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d18c63d-6ca2-426d-9fc9-08dbfbcad078
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6313
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 11:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192282

T24gNiBEZWMgMjAyMywgYXQgMDc6NDAsIEpvaGFubmVzIFBvaW50bmVyIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxqb2hhbm5lcy5wb2ludG5lcj1ici1hdXRvbWF0aW9uLmNvbUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEpvaGFubmVzIFBvaW50bmVyIDxq
b2hhbm5lcy5wb2ludG5lckBici1hdXRvbWF0aW9uLmNvbT4NCj4gDQo+IElmIERJU1RST19GRUFU
VVJFIHVzcm1lcmdlIGlzIGVuYWJsZWQsIFNMSUJESVIgaXMganVzdCBhIHN5bWxpbmsgdG8gTElC
RElSLg0KPiBsZGNvbmZpZy1uYXRpdmUgdXNlcyBoYXJkY29kZWQgcGF0aHMgZm9yIFNMSUJESVIg
YW5kIExJQkRJUiB0aGF0IGFyZSBmaW5lIGZvcg0KPiB0aGUgbm90IHVzcm1lcmdlIGNhc2UuIEJ1
dCBpZiB1c3JtZXJnZSBpcyBlbmFibGVkIGxkY29uZmlnLW5hdGl2ZSBnZW5lcmF0ZXMgYQ0KPiBs
ZC5zby5jYWNoZSwgd2hpY2ggaXMgZG9uZSBpbiByb290ZnMucHksIHRoYXQgbG9va3MgbGlrZSB0
aGlzOg0KPiAyMzYgbGlicyBmb3VuZCBpbiBjYWNoZSBgL2V0Yy9sZC5zby5jYWNoZScNCj4gICAg
ICAgbGlienN0ZC5zby4xIChsaWJjNikgPT4gL2xpYi9saWJ6c3RkLnNvLjENCj4gICAgICAgbGli
ei5zby4xIChsaWJjNikgPT4gL2xpYi9saWJ6LnNvLjENCj4gICAgICAgbGlieHRhYmxlcy5zby4x
MiAobGliYzYpID0+IC9saWIvbGlieHRhYmxlcy5zby4xMg0KPiAgICAgICBsaWJ4c2x0LnNvLjEg
KGxpYmM2KSA9PiAvbGliL2xpYnhzbHQuc28uMQ0KPiAgICAgICBsaWJ4bWwyLnNvLjIgKGxpYmM2
KSA9PiAvbGliL2xpYnhtbDIuc28uMg0KPiANCj4gVGhpcyBicmVha3MgZm9yIGV4YW1wbGUgdGhl
IFF0IFFMaWJyYXJ5SW5mbyBwYXRocyBpZiBRdCBpcyBjb25maWd1cmVkDQo+ICdyZWxvY2F0YWJs
ZScgYW5kIGxlYWRzIHRvIHRoZSBpc3N1ZSB0aGF0IHRoZSBRdFdlYkVuZ2luZSBjYW4gZmluZCB0
aGUNCj4gUXRXZWJFbmdpbmVQcm9jZXNzLCBRdCBXZWJFbmdpbmUgcmVzb3VyY2VzLC4uLg0KPiAN
Cj4gVGhlcmVmb3JlIGRvbid0IGxldCBsZGNvbmZpZy1uYXRpdmUgcGFyc2UgU0xJQkRJUiBpZiBp
dCBpcyBhIHN5bWxpbmsuDQoNClRoaXMgc3RpbGwgZG9lc27igJl0IGV4cGxhaW4gKndoeSogbGRj
b25maWcgaXMgYnJva2VuLCB3aHkgdGhlIHdvcmthcm91bmQgaXMgYSB5b2N0by1zcGVjaWZpYyBm
aXggaW4gbGRjb25maWcgYW5kIG5vdCBhIGdlbmVyYWwgZml4IHRoYXQgb3RoZXIgZGlzdHJvcyBo
YXZlLCBhbmQgd2h5IHRoaXMgaXNu4oCZdCBhIHByb2JsZW0gd2l0aCBRdC4NCg0KUm9zcw==

