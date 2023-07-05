Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A57FEB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 15:52:17 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.59])
 by mx.groups.io with SMTP id smtpd.web10.21148.1688572334376581566
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 08:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NxbNioWN;
 spf=pass (domain: arm.com, ip: 40.107.7.59, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4slLGeiX1xdCnSaclpqa1OkQsyDS9yJQZpqrf/9gbs=;
 b=NxbNioWNOgMq7vRTzwB9ms5P80dso3dfvpZXt3BODZ2FO3yGol1m7EiAp5yBxnUd5jw8+WrTmUmhrUhG9W5lMgc8TPG4RWkNzqtUR3G0woYgtu7HPF+jma5XpW8+sv9LXpGaC9YuQscSfATGz0nm0TJ0n0cc+2rPpEPe+V6i0As=
Received: from AS9PR06CA0172.eurprd06.prod.outlook.com (2603:10a6:20b:45c::35)
 by DB9PR08MB9945.eurprd08.prod.outlook.com (2603:10a6:10:3d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 15:52:10 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::46) by AS9PR06CA0172.outlook.office365.com
 (2603:10a6:20b:45c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 15:52:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Wed, 5 Jul 2023 15:52:09 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142"); Wed, 05 Jul 2023 15:52:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9fb981c7cb2eb6dd
X-CR-MTA-TID: 64aa7808
Received: from 9374186b5f03.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C4891968-B2E3-4E57-9ADA-8EFE8E1ACD6F.1;
	Wed, 05 Jul 2023 15:52:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9374186b5f03.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Jul 2023 15:52:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sq0r9nU7zrNmORwOwKtD7qS/rOx0o3qCeiGrU+2OwB+Jj8zD4AmF5+o1P2UUIQnNlJddfFLMan3OVM5bg05R2phC9XHSzZah7tQJulgldn2V+Rc0lIsHaMW5qcHp9XvAt5rsqdytCefmT/ZJqUE2KrgdXV1f/BddyiX5OWp9Cnb3eKJJttoEdtwzRvRzc3/ee0trrdrkf2pEKcvOlKPISbaRfRbuv1JXODdK2dFNRr8Thsk9QEHXPq1u2iv8DIwm3drYmj/eY+pQMpsx3cPQHxsA06mTIH42Cc900QXmykaGhvBufoSPwDmaSL12c9PP87ExGrRrBJhRrGhxn6sjxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4slLGeiX1xdCnSaclpqa1OkQsyDS9yJQZpqrf/9gbs=;
 b=k/1ShGit74GxCgs1AS+V9rF7MgRk1xkSC+hzEOXHCP2DiKrsBl+XSPwZWUCkblNDamsmKfLm70oaJV9NFn7Ku+eyJgDRmLUBSqmu90paiz3QUMTw99J8MN/+I0kv10vAvd5k0sdRYiuDYGhqZxP7RFGkYZDka5YD0H/DDDE5NWWKF4wvdHd5lw7q+/Lc5P2qxibNn8tRQZtkMjgX2w+GYVFkVbxRZqDUh7LJmIPCPSOWkXWKv7FCQTWwzcVCgQQMnCk74OB2adCQTjuDCKTYn4DXPPmKQIQdRn5nI2qzw61JkGKo51+mbZrsMklLx5OxokvvEX2FHMOc5gZHrAkJLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4slLGeiX1xdCnSaclpqa1OkQsyDS9yJQZpqrf/9gbs=;
 b=NxbNioWNOgMq7vRTzwB9ms5P80dso3dfvpZXt3BODZ2FO3yGol1m7EiAp5yBxnUd5jw8+WrTmUmhrUhG9W5lMgc8TPG4RWkNzqtUR3G0woYgtu7HPF+jma5XpW8+sv9LXpGaC9YuQscSfATGz0nm0TJ0n0cc+2rPpEPe+V6i0As=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB10370.eurprd08.prod.outlook.com (2603:10a6:150:a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 15:52:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 15:52:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jstephan@baylibre.com" <jstephan@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/1] Add ptest for less
Thread-Topic: [OE-core] [PATCH 0/1] Add ptest for less
Thread-Index: AQHZr1XZxtbReWKBj0CeUOeV9qPSr6+rUo0A
Date: Wed, 5 Jul 2023 15:52:00 +0000
Message-ID: <18349E7E-44AF-4A6A-AB7F-6670A43078BF@arm.com>
References: <20230705153137.389584-1-jstephan@baylibre.com>
In-Reply-To: <20230705153137.389584-1-jstephan@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB10370:EE_|AM7EUR03FT016:EE_|DB9PR08MB9945:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c839c45-76e7-4a77-b1d9-08db7d6fcac9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7laBBvBgMDwUInD4YMSks5N1elXrBch6T58DTbOBzHi5kCdSvDyA/X1onHffq06s5E70Fu4AYhnaDu+fRWEP64pshXetW6zQ/RR/jDpFfI0uO7np4MKPP7RSZXtOKXjcfnhQDskghXgKgZs0guXg6RE8MK8EexkbuJzKFyjoG/1upQsddU/w19QYXxeNvV0rhqkuSkkXpxrvbsux/V1bClKUT79WmX1JVJx1BFvkf2LyQOrlDtcNzEFpmdvsIEf7iBoOr+D4h43fr43SyTUOZn8gmLdFRgszqJTA/Gg8JUwLsq4boYaIjfpHsVhrpFj13VeP4Ms4952omjf013VEDHzZ7zdQFqRlocB5na62P+eqk2koZxydAMT5YCHL8ecGI8JiBsMpH8BpzmPmaX3bpRxPZfFiIxFQbwF/xabCfyzHufOGRKsPj4amKj8WVFDTxxPOgddkcfbsx+PcKMnZ9ne+Ot9oRLpedAi6A5Df8nVagSGEb1AQ096p72TrjTQdyilKhidNW4zGroN/Bg/3tKVR5JYTjRAz3uN9NuFiZnp5kHXQy6gbYyBCcUoGrs9+a0Hnb3NKPdNILuZQzV9Zvtd6Awbn+4GElUbQ0rxwl0WXByJbbvyrwVAiGcPsWCMhezHH4bT94d5U4i1LUaU2plhaMuSrwUNWeu7U/XH6yW8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199021)(41300700001)(4744005)(38100700002)(2616005)(71200400001)(6506007)(122000001)(186003)(53546011)(6512007)(86362001)(6486002)(38070700005)(316002)(478600001)(66446008)(66946007)(36756003)(76116006)(66476007)(4326008)(64756008)(8936002)(33656002)(8676002)(6916009)(91956017)(66556008)(26005)(5660300002)(2906002)(10773002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA59E8FCBCEDED43A4ABB049F4F7E029@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10370
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ac7d62ce-9a4c-422c-2094-08db7d6fc55e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	23FqilvnOwDe4pIJf44FX1+Qtq9FPqRMtQoVkE6FNmAEsuteIJCE7kvyu0otky0yAzWXIN76RA6OFhQmb7jMSXmMBXU5mwY/KIfix8Al57u/SlPaPfHRGHuBRgtOHIZX1BklXG/XclaCoz6kEYL01rLSGhrlOsSgNqkYarbZu/byTGoBky2jS56wC/D1shYUj00TON5DoDIqYXqarDZc6kodpsxu0KRifZ6t4lJINdU+TeWNxJ58lFTtTYYGgOuc8g63USdWrr2FsbjFBf90myHYMYbc8xH5r/0JfToZzZwKrL9aQ4BMUsLOvAsJgrm+XhVMqKk1iuEneQv6YAnhvmBMx88LH/bL1c0gbTKmyZS0/VuI2w1+DkRPjg+ZrrF4gOVJSPQ7J4msFEF8sA9GQgv7Y0qK/cL3i9ut2vL1p/4MUbQXvnkCqYxw673jnRHfYKuBwhcxBZuYLEZGOWQFZ3HHtpYvkP7ozj/N4pjy6+8JuUOizCENnxL0FVgfRKlScSxS7Pdw3Sr0GX5kKp4qNENJdZ0HaRZOWKwM+nwa68gKl/CmG3Nb1F1BMlozyFqwBlryHazP0CemvAqgEyOqZ1c/e12rOr2sydF9lhzXew9Tl7QnmppGFHHdqCwFsxEpFnqkyeNVoq8l5G+irevw3MWNpROlv1oWN3wxMwtqhI9x/RAsx1wN/i/GtSK5wjTX8es7NqT3qU3FCn0hexzJ1gfFSuDdtJEJoYd9Sv9OE2uphVWcQtVbI9jopfW634c+U1tBMunqlV/tbP6DdoKoKw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(41300700001)(336012)(4744005)(6486002)(82310400005)(2616005)(47076005)(82740400003)(81166007)(356005)(186003)(6506007)(53546011)(26005)(6512007)(36860700001)(40480700001)(86362001)(478600001)(36756003)(316002)(2906002)(4326008)(70586007)(8676002)(8936002)(70206006)(33656002)(5660300002)(6862004)(10773002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 15:52:09.9489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c839c45-76e7-4a77-b1d9-08db7d6fcac9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9945
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 15:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183896

SGkgSnVsaWVuLA0KDQo+IE9uIDUgSnVsIDIwMjMsIGF0IDE2OjMxLCBKdWxpZW4gU3RlcGhhbiB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8anN0ZXBoYW49YmF5bGlicmUuY29tQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiBTbyBiZWZvcmUgdGVzdCBjb2RlIGdldHMgYnVuZGxl
ZCBpbnRvIHRoZSByZWxlYXNlIHRhcmJhbGxzLCBzd2l0Y2ggdG8NCj4gZ2l0aHViIFVSSS4NCj4g
DQoNClBsZWFzZSBzcGxpdCB0aGlzIGludG8gYSBzZXBhcmF0ZSBjb21taXQsIHNvIHdlIGNhbiBy
ZXZpZXcgdGhlIGNoYW5nZSB0byBnaXQgc2VwYXJhdGVseSBmcm9tIHRoZSBhZGRpdGlvbiBvZiBw
dGVzdC4NCg0KPiBGQUlMOiBjaGluZXNlMS5sdA0KPiBGQUlMOiB1dGY4LTIudHh0Lmx0DQoNCklm
IHRoZXJl4oCZcyBhIHdheSB0byBtYWtlIHRoZSB0ZXN0cyBtb3JlIHZlcmJvc2Ugd2hlbiB0aGV5
IGZhaWwgdGhlbiB0aGF04oCZcyByZWFsbHkgdXNlZnVsLCBiZWluZyBhYmxlIHRvIHNlZSB3aGF0
IHRoZSBlcnJvciBhY3R1YWxseSBpcyBoZWxwcyBhIGxvdC4NCg0KQXMgeW91IHNheSwgdGhlc2Ug
YXJlIGxvY2FsZSBpc3N1ZXMsIHNvIHlvdSBfcHJvYmFibHlfIG5lZWQgdG8gUkRFUEVORCBvbiB0
aGUgcmlnaHQgcGFja2FnZXMuICBGb3IgZXhhbXBsZSwgZ2xpYi0yLjAtcHRlc3QgUkRFUEVORFMg
b24gZ2xpYmMtZ2NvbnYtdXRmLTMyIGFuZCBsb2NhbGUtYmFzZS1mci1mciB0byBwdWxsIGluIFVU
Ri0zMiBlbmNvZGluZyBhbmQgZnJfRlIgbG9jYWxlIHN1cHBvcnQuDQoNClJvc3M=

