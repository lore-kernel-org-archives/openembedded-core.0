Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA3EC43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 11:08:54 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.59])
 by mx.groups.io with SMTP id smtpd.web10.3287.1655291331582527694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 04:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=+Erf1VqJ;
 spf=pass (domain: arm.com, ip: 40.107.5.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RHl89uYy/xwQLBN1lA9q5ADaj3UhF4uBrZz1laHPW675UZ4R5TP0khU6+Ew993u6FNv+gDesHCZqYdQaD23GRYLDA/ertQLHfSdYsa+xYX8y0Lo7rAVxKNhL5fR8xoHUpfzmsDALuO0z6w1CglvWO7jpjJxgtMTOYphV0iEy0dTYGdeSFW7k7qfHEFnm9wzISQJhm5rH7Gjc2BQqNLSJav3m024WU5iDVujR21BSUFLdgq73OQSmHomVnu0saoYgtXKR5/XkSnwRFiA381Z/ocM3U09ybXbc1p2q3HzlsF7eA/1f//ldznYVaGmlfHzhzsAtsKaUKfngz17wH6u1Ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WKGuc4u6DSNQDP81RXMgvsjPSOov2ZDos2KUou8UlA=;
 b=ACq0qmH8Zu4n6//adct9XpEvJOM/fjoxWhhE7rC57Q/8VPt9sJkJO88ONeJd3oZybkbQ7Ex5cvrtcyuW9hWBdYZNTWgUJO4Zy3a8AvLWgtUzVDGl33jgfj9oLzZmgkNHDH+fS9mP3aWnNrlq6lmfkqmq3dyObkqKxHif+c2YP8Wzuy8Lay8SviIMHSio9GV+dbxyRbLjiHQ8bj8cSA1RAcw1e0g1n7CKbzCufYtqYdCneP0jXL2Njf064FD6OWjOX7eA/bzyT/qU2K1iGmLemE2lCeRcge53XYqbl0uLP8O3BgPSipNCjQk4Y1WWw7NJEcvzS7CwQWfxrB2xfzJeQw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WKGuc4u6DSNQDP81RXMgvsjPSOov2ZDos2KUou8UlA=;
 b=+Erf1VqJI0CDzFVkYzWThXvpiD2O0gEtjEWgrOuCyXP45qupiXefZoy0JZKwkZ8KsPnhOXXl8NEBlYtFq/D3pgcNmdRXFJEEew/3k6nvhd16u0aiAoxipOVDiG7DteYYqb3Z1ow7FIzEIr7GryHuhPM4rGdG51rrE+AEXrHTBcM=
Received: from AM6PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:20b:2e::38)
 by PR2PR08MB4859.eurprd08.prod.outlook.com (2603:10a6:101:28::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 11:08:41 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::cb) by AM6PR05CA0025.outlook.office365.com
 (2603:10a6:20b:2e::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22 via Frontend
 Transport; Wed, 15 Jun 2022 11:08:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Wed, 15 Jun 2022 11:08:41 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Wed, 15 Jun 2022 11:08:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e83bb98aabc0cb9d
X-CR-MTA-TID: 64aa7808
Received: from 50a54dada21e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B76D9AB2-394C-4A8B-8C41-74FE557BF4C9.1;
	Wed, 15 Jun 2022 11:08:34 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 50a54dada21e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 15 Jun 2022 11:08:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ermcn4TyPhgfUs8rdUBdDR1e2xoiyxW0t7KV8EFGSkHPWzpVWHgCMd5GbubjzVHwQ7zoFthMnZuwtUOQerm1falbkaW0KicvrWyC1ikHcTAvjotuUGoENJ7oMfX3vO4jRfHc9yJHGXjznp2qG4Bk+a5egB0/lWl/9M3oktyuFugSDwD9OeOm9ircUkkd3qqEtuV2KkUa2RrgenPx7S70w8ubWeKn5GYaRBnUqtiHXFdyt9O56VHA8VC+Z49OUKUQjl7jYg4VpAeLi7o4PiYx25DIA+uGjElUJ7AwsTHwV+4B04EOltKR8ugEOGfK2Fk7/MmmAGEHFmHGLewwTkikxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WKGuc4u6DSNQDP81RXMgvsjPSOov2ZDos2KUou8UlA=;
 b=U/4avCEJXFYYhao9v4iI3wi4UlvyTX+bkwtSiLVloYmNaSkf1DlU/Pu2IXGGk3ztuU9et12AeFY3Dbw1NRgCwyh1gPIKLBIG5V2ODzfslkIqAMtfz8VLMFpcMbdO/sF/OY0AB7UEKJ57dp9AHK3Mta3wxTYrHrwyFs1dYu5ku2vidz5I3CGWUuXBtH5WDdhmYazVEqkpXERPgMcSxbwlTo445KHAPfjwR7l5bv0WTvkb38eAduKAWdYKgvhey61jwowS2clJgXhnzaUJNYWQ1oUH0QmylXFyxxxI9+kE6YXTaJv+gR4tIDgdsWvYkXV0DLZfX22KEDwAoyIefpOVYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WKGuc4u6DSNQDP81RXMgvsjPSOov2ZDos2KUou8UlA=;
 b=+Erf1VqJI0CDzFVkYzWThXvpiD2O0gEtjEWgrOuCyXP45qupiXefZoy0JZKwkZ8KsPnhOXXl8NEBlYtFq/D3pgcNmdRXFJEEew/3k6nvhd16u0aiAoxipOVDiG7DteYYqb3Z1ow7FIzEIr7GryHuhPM4rGdG51rrE+AEXrHTBcM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6669.eurprd08.prod.outlook.com (2603:10a6:102:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 15 Jun
 2022 11:08:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::5099:2a51:e4ef:7405%3]) with mapi id 15.20.5353.014; Wed, 15 Jun 2022
 11:08:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ptsneves@gmail.com" <ptsneves@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] insane.bbclass: Make do_qa_staging check
 shebangs
Thread-Topic: [OE-core] [PATCH 1/3] insane.bbclass: Make do_qa_staging check
 shebangs
Thread-Index: AQHYeb6lBtpJ2TtDnE+mtpxXTcqSiq1QXMqAgAAAN4A=
Date: Wed, 15 Jun 2022 11:08:32 +0000
Message-ID: <13D51D5A-188C-45B9-94E6-32B0F1BECC8E@arm.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <66A02BB7-DFB2-4BB0-819C-E0F18BA82628@arm.com>
In-Reply-To: <66A02BB7-DFB2-4BB0-819C-E0F18BA82628@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ff1f1bdc-2fdb-443f-6a72-08da4ebf67cb
x-ms-traffictypediagnostic: 
	PAXPR08MB6669:EE_|VE1EUR03FT044:EE_|PR2PR08MB4859:EE_
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4859DF5F9B8A84D141EB7192E8AD9@PR2PR08MB4859.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 My3ZLw6u4RebPtzqTm0jw8ptUYHTEqOCwetEfIgLKxVFqyf0BRzhV4XktvXKHL4M/nVHVlIAqpwxgyPfdfGX7brt5RChfeH1JH7NlymKeZGNODnNtCOqKHxMMpPqkFXRlG+6nZeut5ZEKmTcIv6KPi3kd+pwN2FM+aQBQs036RV2+MDRQdhePSvxRFuMveBXAhHRPGz1E3Qyakaef1AD7LUd1+/vNW2rGEa69z73U/XC4AQfyULSsJSbEzHGiIcHsAK2iIqqNuvXzJPxm/jMarzPE8PT7FuJ3uNHLJsGVR+OnEDwon9G6yyzUHZgc/2QxU912LqMzFPm3JeWV/XtTAx0G5a+BQBwjZ/+iO/Ray0yXpKpKR3DpefJspM8BfBQOcaTAnaWPgyuF5p6sgvX1hCRZsM2hmxUF00+syUN8r4IHudPXrhmnx4O/kUhPOVTuu+90uOW/mxpVcdZ1eUrXVR0VE6Y4Ag2oNkgdRImqdcJhuP0+s+ZjVhLBBhIxzLu1DHNMC02zZFqx79U7bUd7Oz+n0hpZXAjgBIp3WZxDt5DmC8LM2id1HdOlU87u2SV5oRu0klvpr+j486X4lWO/yPB3EocF09OYh8h3/gfrxiXcgC38twlYvyhSkAMchnTE9vHgJrR2kPOR8MRoWNlSos1Dxp+8ukrY3WkQqyWUSX7YVOrJIlr6hse1790TFKH1tgpmInC3K3VMQcB4FBRxtjnPbrJCmAUzQgyPEiDp5+APLwqA6UGbLdmW178T2qS
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66446008)(2906002)(66556008)(6512007)(66476007)(64756008)(86362001)(122000001)(91956017)(4326008)(6506007)(71200400001)(76116006)(83380400001)(6916009)(8676002)(66946007)(38100700002)(26005)(53546011)(5660300002)(186003)(8936002)(38070700005)(316002)(6486002)(36756003)(508600001)(4744005)(33656002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3547020A2298794B995C190E7BD4E02D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6669
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	10377efb-ad19-4522-07b4-08da4ebf6250
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UIawaGDgLGhNP1Ll19XP3P0FYYgH3YawG6lfcZ42qlrknW4QRmg3oeImDeKXFy7BbLMT3AKbluxXbtUyPZO5q6EGz9awGRvbRHxGkcWbO0iL6nXG74g5c+QAuQvUHR4HJFDXxYFl1SNkBMfT4lShGnx7ZsTlEYpBQJfZWAbCzimKzfQUbb98f5kj/frghgUpx6CTIZtKIPrFOneK+xme/bhaJ6NpCat7fEJFrDdeh5pv0wQ+q7283RqH6A3VkUpD7MH1V1lFYKW2bTKElphVI1eES4OG96MpafUg9fVeSK/cyDd27UbJ0hLiwk6iJJK88hZUTFDNVaexpdtpNgpDXkgB2OxWzAJ0IWBGw2uAbWurnMruGJkWevttMePQKpa7unBg+J7qk1VbX0zKAqLWrX+xlQ2SirFeqaYoeGFKry9uvmlc88bV7qcxp9MjxGm40E+gho3BA0aDCXWymmYhXi0YWoXGaCKIvNBReLSnu55XvrJ9CyUEG+tGckoAB6aA+a0zDEpiYNJ9X6Sr+mCj7NERkq2ur1MNeEX6T5VjmxWPVPUV+Ns31LjivELMnouNyJxyPUNX0Lf5FyxMTucFPowmlLygBKecK15w4XelcheKgZp6tuDhp42z3QkLSHW61zzY0DwEMNXFFNBSDQt/oVdDB3oK5Zo4IhhL9+JmFYlDCeUQnJ1V1vtTH3wnaicH
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(40470700004)(46966006)(356005)(81166007)(4744005)(82310400005)(6512007)(5660300002)(6862004)(70206006)(8936002)(8676002)(33656002)(70586007)(4326008)(2906002)(36860700001)(86362001)(316002)(40460700003)(26005)(83380400001)(53546011)(2616005)(47076005)(186003)(508600001)(6506007)(336012)(36756003)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 11:08:41.2357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ff1f1bdc-2fdb-443f-6a72-08da4ebf67cb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4859
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 11:08:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166933

TmV2ZXIgbWluZCwgY2Fu4oCZdCByZWFkIDopDQoNCj4gT24gMTUgSnVuIDIwMjIsIGF0IDEyOjA3
LCBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+DQo+PiArICAgICAg
ICAgICAgaWYgbm90IHNraXBfc2hlYmFuZ19zaXplOg0KPj4gKyAgICAgICAgICAgICAgICBlcnJv
cnMgPSB7fQ0KPj4gKyAgICAgICAgICAgICAgICBwYWNrYWdlX3FhX2NoZWNrX3NoZWJhbmdfc2l6
ZShwYXRoLCAiIiwgZCwgTm9uZSwgZXJyb3JzKQ0KPj4gKyAgICAgICAgICAgICAgICBmb3IgZSBp
biBlcnJvcnM6DQo+PiArICAgICAgICAgICAgICAgICAgICBvZS5xYS5oYW5kbGVfZXJyb3IoZSwg
ZXJyb3JzW2VdLCBkKQ0KPg0KPiBXaGVyZSBpcyBwYWNrYWdlX3FhX2NoZWNrX3NoZWJhbmdfc2l6
ZSgpIGRlZmluZWQ/DQo+DQo+IFJvc3MNCg0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRz
IG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBt
YXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBp
ZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNj
bG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVy
cG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhh
bmsgeW91Lg0K

