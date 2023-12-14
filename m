Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48653C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 10:43:47 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web11.19223.1702550617501937197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 02:43:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6OS+iBWz;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6OS+iBWz;
 spf=pass (domain: arm.com, ip: 40.107.20.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=e9+/urNCX7VWqSrPoLvgk7ZDqco509RJ+OGxwG4oujmMLqmhFWT1p5dqtbWHj5k3/q+01sDqmndNjvDUQK09kwWt3gwiBnDyPYaY5UL45jaBiaGDSjhoEOgIFVjdQ4npCr6lMnixJjwM329eSCg+RjulCYGZB5U+LkvhM6Mqh7nUBA1szVnu8hk54rYvLEC4RFQsNr9FIRRnV8meLSXpt4tE3ZyC1W8MPZar4NCYbg3OEo0Bx53PQmBUcRsgGj2QwLozIBxJ7RMcc0I8CsgUppV015HZYHwV4RUjDfSHbAZFjjfyXOeibBKd177ghVOC038UeQUImsj7Iql9bwcnng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JNYdMhjUAkKcK5FRpnKgnEbLg9wbpfb/YxK3Ew8R+k=;
 b=hpKrJU+pspqUGYlbXMIDGBeq5Jb7bUx4IbWnuiO4i7iXBGkzSYxzNWFvRmWzAiUVgFdacbhRYROAF/ysieVlVI+9GOPGT/IfIkD9y0L/ZqfZRjZW9Xe+gTJD7k/UNnSxXeeW94eo6u1iLbs08n73tktRWJzOGJya5dQTfvL6xP175iSLcbW5mj6BryPoXUsA1g7t+1k0i2lLNT3UG72BsaLzYhzeVHgKL86Sv1Fgnvnik52Gy/BGVpO+eW2aVjb7IL61TQBavxXZ6p2HRoc1cGLIYLgHIRX+glt0qaWqxuNAR63oWHkiPiJhfZbdEI23TFVm9KtdTTnJt7+dSdfukg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JNYdMhjUAkKcK5FRpnKgnEbLg9wbpfb/YxK3Ew8R+k=;
 b=6OS+iBWzCTU6oA80TWaY7fWW0eIZ9QoPW3TC5JfXx+EXI4bBF0CiJ5QQTKw2DSqcrtGn2o70N076Vf6iI5ES0k7aOQBw2UjSEdkv7/QoHWxSrqBDGBb6s5nOGk2IfeDwgJeA9NRgIOPTndwUQuAgVzs+dRU+njocZvu27S8xHaQ=
Received: from AM0PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:208:122::14)
 by PR3PR08MB5770.eurprd08.prod.outlook.com (2603:10a6:102:87::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 10:43:33 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:208:122:cafe::f9) by AM0PR04CA0001.outlook.office365.com
 (2603:10a6:208:122::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Thu, 14 Dec 2023 10:43:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Thu, 14 Dec 2023 10:43:33 +0000
Received: ("Tessian outbound e243565b0037:v228"); Thu, 14 Dec 2023 10:43:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e38892689b8704da
X-CR-MTA-TID: 64aa7808
Received: from 74b8490f365c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BDEF386E-03D9-4239-BE01-773F4A63F413.1;
	Thu, 14 Dec 2023 10:43:26 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74b8490f365c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Dec 2023 10:43:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihO1cOBRmD5Ds7RX+9qOQlE7IV+yXpf+9O8vtVIUjIDQRs+EnvE0DXk/HaAC46+lUoL6A7afr95lq9hq9AwkgrNS2LJIwGwMx4uh1CdpaxW+QpYArHAW9l4kgsrlPwwaHp+nA18V+kXgalYg8qQNVtxL7WPwFrcEO8+s4NubrcpVJEYQ5cpbTsF8aT3We6394Z+zlDN+hQonl0ZpY0tyQ3deUlJSGhFP45zlTaRNZj4EmwwAgEFEfHQ+CfORo3nyX+h1+NxmvBBI5pyMfIfBxC02cVavq117RHujHcZ1ge6kgYaC0Bapgzsm5j0DUAhBT5M9f5zJo+xMcRySUbo4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JNYdMhjUAkKcK5FRpnKgnEbLg9wbpfb/YxK3Ew8R+k=;
 b=c9fA9XZVJfLmW9VXTmRIXAhjcv7OZMbu1JpL/Za9NrIfqP1Omf3wQdVoum3QihOJUEtATAFbM5NkChh+97Ig+p49n+CZJ1UHlXZCLn7kBG2kxi56LPWHS9Gu5A4WW5hIexkhBU6LydmrK/u1Qr1o+6Z+h8VLCVg2veed/BXVcrYbvCFF58VXtxIScQckniQ+twenwdOaQpgP5wmn6ACWxuSvoSPXIEDBe36nGP0Dh4lmoINjMoJPdSCB/0/dUocJIiMsU0gyHUqlzWUx5cwMeL3uJTPBvhlI1JMMfJ9SlJCxjhum6avTRA+0MFaFVgQ0+Eph81/nO38olNT9McWItA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JNYdMhjUAkKcK5FRpnKgnEbLg9wbpfb/YxK3Ew8R+k=;
 b=6OS+iBWzCTU6oA80TWaY7fWW0eIZ9QoPW3TC5JfXx+EXI4bBF0CiJ5QQTKw2DSqcrtGn2o70N076Vf6iI5ES0k7aOQBw2UjSEdkv7/QoHWxSrqBDGBb6s5nOGk2IfeDwgJeA9NRgIOPTndwUQuAgVzs+dRU+njocZvu27S8xHaQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6429.eurprd08.prod.outlook.com (2603:10a6:102:dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 10:43:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 10:43:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] lttng-tools: add a flag to test the userspace
 only
Thread-Topic: [OE-core][PATCH] lttng-tools: add a flag to test the userspace
 only
Thread-Index: AQHaJFyP7T4EPP2jaEyebCMW8ePRPLCnHUQAgAD4AgCAAJauAA==
Date: Thu, 14 Dec 2023 10:43:24 +0000
Message-ID: <207B71EC-824B-4072-9BA6-F3F29AE143E3@arm.com>
References: <20231201140430.792362-1-xiangyu.chen@eng.windriver.com>
 <DE373712-4DD5-41A8-AB9C-5D4B0BC083F8@arm.com>
 <3b1244d5-9d4a-4dd1-8113-cfb071ffe993@eng.windriver.com>
In-Reply-To: <3b1244d5-9d4a-4dd1-8113-cfb071ffe993@eng.windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6429:EE_|AM4PEPF00027A5F:EE_|PR3PR08MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 23038ef7-73e8-4fae-410a-08dbfc9184c8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6oMQxMo9bPpxRiVGe5JT8D2ieE/v8e7SMMpRKhtYxXduzxQhmhm1wmS8zqAwILgqEzo12Muni0/EA6YO+96bx4XcFx5HE7ZJFE61Q/yEsedkFXtR0+mjEdr02A7vVJw64wFzd8OZD/WlOzVoE1/lzJdSuPwHGNXL7kTemiS9faOUo7iQiCX+xcM1HmX37mPXcqF+6jAXgSUUc3IPsyA/nPU7jfmouusEB7SbFaO6QQhY/6358Kwu5i72MHoi8i6AH4EL119Th5rPU9SeDi3ohKxZEjAX+jOV89p8eJNZbBWVQNqH8kR/x9QFex4mF27x4Iu8MQTfIv2qRNORFRd73eY8UFh8a/wcLfWL/iUyuurg2PcAaQOabKU2e3vKFEyW+L4XEzbt7jY6r6N0bBKmASkB6Tk+ZOdsk4ZSEv0og8uzrsaxlnQotansEi8ZnKZZ6quBWSShY+RyCEV9VXW884APpHXa/syaExKfMS0AeDtmwTP0KOhqNHZULLTIhYGIO1QSsVUU6zCNfJXv/VeKiqTa5Nm5j0/6MkYe7KqoGdUpw9cLKobSteEUkXwj0CANtthHjrr1uNJZqXIK/AGGqhR3WuRs0EPYQl1ZHA6R7En++7iTdWiIwQlsjOn7Et9yv7Bs/uUTjFcYyxEskNN80sTknCdEOlpZCdbFenPs6w2prMDJ9gs7ZgtcKm9bgJ9n
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39860400002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(451199024)(1800799012)(186009)(66899024)(2906002)(33656002)(8936002)(86362001)(4326008)(8676002)(316002)(5660300002)(38070700009)(41300700001)(36756003)(6486002)(478600001)(6512007)(26005)(2616005)(71200400001)(6506007)(53546011)(83380400001)(38100700002)(122000001)(76116006)(66446008)(66476007)(66946007)(66556008)(6916009)(64756008)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4AF93FC27A2FA14E900199B5204C71E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6429
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fb5ce029-c388-4801-681d-08dbfc917fac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wFYcPmeP1eO3zgr2OYBl35VyJLS8B5MWwtIjnflveM8Ezi+tjNfmLKk6w9gb8WoxoddmsDwUq8ECyY77I5iCMMeVLcymC2ffcbZBLU1HuHD1coCJJ9vy7dc57QGj+FLLD3WzSzV4YIUkF+7oSMVQdQfLNJKdctA4MTUtoEzw4yeWNB1SADSLYelIv8lWWJtvq0guFQbBGgg4YJyocjVJ9bj0knGqdkH7/RGb+YAbiG9JPm9bWRVddjy2E82SPb1FkPMS4bffZfGnBd0qM/xC008gLY7it/RQQz2pdeCEwS5oAq9+RtH1as/slom9vLN2F0+HJbv53gtxB4mdA+Xxgvrkk3CSeTZS++9s1YG3FSrRNe9Mi6omPW8km6uZXUntgkbTtZRnxhtuSefQ2TJ/fLU5KPezSoe8DignuPwYeP8WTPUgwrXCMKQ7nc5Tw/a2m9+wGqqJ+k2FJrNePVpH+9rX3n8trLcx8aYp6osdBPwS2oQFZ0eD1cbxC5wPiBl2Cl6JAUWmj0TBQ/ZF10xk2LyuGwt0gpH3ybhVy+uIuDELpOmR55lFIvK9My404fX0LHGNiOETtSnzYveKbNtvzZzG9juVBSvqXze/QutZJmkgmyW8Y5wHy8tJxZtWUIK7aYpseW+S5H/PBbRthVZCFV/wOdidEC6oM6nFgjlVKeevJEIEMUesetkc/2GJrC0KE03E/zx2bfuptXoqfPGSj/YfrRXRmBkmn7+OF3tRfzbiV5+6WadtYxd3SnHM+9EPBQKeTTcLRT+IZuMYVEMuRg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230173577357003)(230922051799003)(230273577357003)(1800799012)(82310400011)(64100799003)(451199024)(186009)(46966006)(40470700004)(36840700001)(5660300002)(33656002)(2616005)(336012)(26005)(66899024)(36860700001)(47076005)(83380400001)(2906002)(6486002)(478600001)(316002)(36756003)(41300700001)(70206006)(70586007)(6862004)(4326008)(8676002)(53546011)(8936002)(6506007)(6512007)(40460700003)(82740400003)(86362001)(40480700001)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 10:43:33.0762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23038ef7-73e8-4fae-410a-08dbfc9184c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5770
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192352

T24gMTQgRGVjIDIwMjMsIGF0IDAxOjQzLCBYaWFuZ3l1IENoZW4gPHhpYW5neXUuY2hlbkBlbmcu
d2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBSb3NzLA0KPiANCj4gDQo+IE9uIDEyLzEz
LzIzIDE4OjU2LCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4+IENBVVRJT046IFRoaXMgZW1haWwgY29t
ZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFjY291bnQhDQo+PiBEbyBub3QgY2xpY2sg
bGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVy
IGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+PiANCj4+IE9uIDEgRGVjIDIwMjMsIGF0
IDE0OjA0LCBYaWFuZ3l1IENoZW4gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHhpYW5neXUu
Y2hlbj1lbmcud2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+
PiBJZiBydW5uaW5nIHRoZSB1c2Vyc3BhY2UgdGVzdCwganVzdCByYWlzZSBhbiBlbnZpcm9ubWVu
dCB2YXJpYW50DQo+Pj4gImV4cG9ydCBTS0lQX0tFUk5FTF9URVNUPTEiIGJlZm9yZSBydW5uaW5n
IHRoZSBwdGVzdCwgaXQgd291bGQgc2tpcA0KPj4+IGx0dG5nIG1vZHVsZXMgcmVsYXRlZCB0ZXN0
LiBXaXRob3V0IFNLSVBfS0VSTkVMX1RFU1Q9MSwgdGhlIHB0ZXN0DQo+Pj4gd291bGQgcnVuIGFs
bCB0ZXN0IGNhc2VzLg0KPj4gSXMgdGhpcyBzb21ldGhpbmcgd2Ugd2FudCB0byBhdXRvbWF0aWNh
bGx5IGRvPyAgQ2hlY2tpbmcgaWYgdGhlIG1vZHVsZSBjYW4gYmUgbG9hZGVkIGJlZm9yZSBydW5u
aW5nIHRoZSBwdGVzdCwgb3Igc29tZXRoaW5nLg0KPiANCj4gSG93IGFib3V0IG1ha2UgdGhlIGtl
cm5lbCBtb2R1bGUgZGV0ZWN0aW9uIGFzIGFuIGZ1bmN0aW9uIGVuY2Fwc3VsYXRpb24gaW4gdGVz
dGluZyBzY3JpcHQgaW5zdGVhZCBvZg0KPiANCj4gZXhwb3J0IGVudmlyb25tZW50IHZhcmlhbnQg
YnkgbWFudWFsPyBDYWxsaW5nIHRoZSBrZXJuZWwgbW9kdWxlIGRldGVjdG9yIGZ1bmN0aW9uIGJl
Zm9yZQ0KPiANCj4gdGVzdGluZyBrZXJuZWwgcmVsYXRlZCBmZWF0dXJlcyBpbiB0ZXN0IHNjcmlw
dHMsIGlmIGtlcm5lbCBtb2R1bGUgaXMgbm9ybWFsIHJ1biB0aGUgdGVzdCwgb3RoZXJ3aXNlLCBz
a2lwIGl0Lg0KPiANCj4gVGhhdCBjYW4ga2VlcCBwdGVzdCBhdXRvbWF0aWNhbGx5IHRvIHRlc3Qg
Ym90aCBhbGwgY2FzZXMgYW5kIHVzZXJzcGFjZSBjYXNlcyBvbmx5Lg0KDQpZZWFoLCB0aGF0IHdv
dWxkIGFsc28gd29yay4gIElkZWFsbHkgd29yayB3aXRoIHVwc3RyZWFtIHRvIHNvbHZlIHRoZSBh
cyBtdWNoIG9mIHRoZSBwcm9ibGVtIHRoZXJlIHNvIHdl4oCZcmUgaGF2aW5nIHRvIGNhcnJ5IHRo
ZSBzbWFsbGVzdCBhbW91bnQgb2YgZXh0cmEgbG9naWMgb3IgcGF0Y2hlcy4NCg0KUm9zcw==

