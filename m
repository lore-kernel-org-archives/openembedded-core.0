Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B91EB1069
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 15:03:00 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42174.1773154978599131479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 08:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ouvnXgZ+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ouvnXgZ+;
 spf=pass (domain: arm.com, ip: 52.101.83.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BZG/SfL/N/UpiDu29Lrk/iZv4r2825GmdEWG50kXyxFvOCgXCLL58siKBQlqdclAXgXtSlNExUMkyjuAERZ1+MG32WQYYmslQCQthNx99roK+J8GWWClL2UP0MSXfKDoeNp2pDwBzb5/hTY5u3Xpj50Km9p8mo93mP/LR3sYiI4rRzXLGdYhePNb1JRGUAK5mA28X0tca4hmV5uOPc/SgRi9ZuWiEzSN4bmVuJ3imYdky5n3YFwbpGcKJhl9k7JVq3VQKfDdvKXYMlzw6zZQFbvf2V+7ALpzJGa3IoAvymkt9kl6NslOBhjqjqc3m8UArnrskDGuqQe98sgOW1MOJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8fVhDWA/OFctMlaskMMkz74dM18FWaoZ1EgFFYHwzo=;
 b=rL/biUl4FsBlLkbYjsFhwgOpGllrxnL2+2dvmx89+joW/EY8FoGI1HLmIGS5obdygLC5ajQjm0N9VJtgahvzyLf+Yb7jzZwj191EzMxhDPtfHekeQ6gxHoV6P//bUM1ganYmdl8p2SgzyLrWsi1EaGn6cGyyZLAbsex5KCbKmnmvyHHPVoNgF2jtUOVvaRZX0rD706w7Z4ZKbjFsF2IWMjGXc0CrIhmey5ds2bVjcPnxhe9ME4OuHxS6UeHKDlrR7R/c4Z9W/85qDtWoxeGNAzHM/EmWHKndXai30Y+rmdioFCBaZ2ijoW4GFhKrURNzov/zghDQhphdRmeKpIK0Qw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8fVhDWA/OFctMlaskMMkz74dM18FWaoZ1EgFFYHwzo=;
 b=ouvnXgZ+vVf0+ZMG30AUESeBhc33FzT4fdkjft935pLDFJH2A8wKIK3b3AF2hL1QHYEzJ1qXUuOwoWe3zEijDndCcl7FtUQbzKVr8zjBzcaix43OGcmMMkGts68VgPh0WHzttrdWNXWsuJd5432WpadO5VnoJH3aKdnosqMRqOk=
Received: from AS4P189CA0040.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::9)
 by AS8PR08MB6549.eurprd08.prod.outlook.com (2603:10a6:20b:33d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 15:02:54 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::f2) by AS4P189CA0040.outlook.office365.com
 (2603:10a6:20b:5dd::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 15:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Tue, 10 Mar 2026 15:02:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mw2ioh75M+7oDQCS39JwSEVnCVuUW6lGJgtj+uHxGzErrwg0j8F9YGNGB4YkE1zjGW6oI8VTFv4PmzsVucHaq8LclxEz4vMv+HNaf4GvWgGmOj+XMes/xtdgZ7PDuI6FccjwGh4CPLnp8XFxJjO3kD38t3kYUJ7yZXJ0iIqWPTFUYNnGU9ngsejq5UIK6+1oRvPBQy7LDMcDZ6lLV9PkddMcDmdXD+4muYR+z4T+o9T01dqXMeFfQdUEuS1+BqBhTGhFU7tlm5tNew7SSofl4SxL2sJ42p85VrTHzxrvCe/4tAAMY/DCjMC2BFTSCDncjt/MxaPVemT65+h5XEYx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8fVhDWA/OFctMlaskMMkz74dM18FWaoZ1EgFFYHwzo=;
 b=SjynCAzq/FfrFcPWeb+Zg63d22BoK9gSG562LoLrkFpqwlEsoNJszOCiUtEfKRGPqHzv9Jjuuguws3XNZkg8lGt8gUjWor4hK53RKJS0hW+xkXa4gIMhuNPxOuwNggwKYBg50jGBc0gKCYFQs2msaXkOFu7bB4bviIWTaFhRO8Yzc4HT/WCjyiKkvqIQLT+IeLgQ5ioc78t2PAXkOZcpPuePxXEwVS1eojao9czV9PTvSROWq9SfLcldDQbxwhMJj+xIjbmGZ/ooPZiqTu20UwNipa9Uxik4jjW+i3jRp1TA+hBVI3/klar46THptH1g6G5VL0HAzTvwjSB+JE9zQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8fVhDWA/OFctMlaskMMkz74dM18FWaoZ1EgFFYHwzo=;
 b=ouvnXgZ+vVf0+ZMG30AUESeBhc33FzT4fdkjft935pLDFJH2A8wKIK3b3AF2hL1QHYEzJ1qXUuOwoWe3zEijDndCcl7FtUQbzKVr8zjBzcaix43OGcmMMkGts68VgPh0WHzttrdWNXWsuJd5432WpadO5VnoJH3aKdnosqMRqOk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5570.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 15:01:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 15:01:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: "wangmy@fujitsu.com" <wangmy@fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-vaapi: remove recipe
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-vaapi: remove recipe
Thread-Index: AQHcrREQHRSSV+9tFE6YBT3AF0Gm5rWkzL4AgAMWuQA=
Date: Tue, 10 Mar 2026 15:01:50 +0000
Message-ID: <F5FA45CA-4025-43CB-B78D-30F549FD1325@arm.com>
References: <20260306022904.1781-1-wangmy@fujitsu.com>
 <DGXIRFZ2TN10.3UAUZL2T4N0K4@bootlin.com>
In-Reply-To: <DGXIRFZ2TN10.3UAUZL2T4N0K4@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5570:EE_|AM2PEPF0001C714:EE_|AS8PR08MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da6d4fd-7f71-471d-56ca-08de7eb61ae9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 
 gm7Hp2N71qYvpck0Jy9eMNRYQMA7AAwPa5ZohljwUp95v/F1Gzes0mbOFAFHgO7B9cCh6r8DahXzF2svpqnH53w/LZWEoPCmAyL2iwpU/VNRl6140PhG8ArzdrjvrjzlMAp3/3WKm4SK93eIttIBzWlZNese8/r42VfTcj958/5oyYjPXDDNmspj9CZp5mF4FiD0OqeRNH4flQO+1sTW4sjptcQ6GWojqUDFLN9wXq3aHqMTSCt5xK9sDZkLWjv8hqvAMmmlLYvDf+T2r13q++5sjOObZf+XJ2nzQKD6QwWIlpvQv2VknRqn0PZrIWP2rc9MoFvOMSX2LQCOO0kqHdBzYMNs/8OHYqG7Y1F90LB+qIBTI7LKiAayseEIXTJm/EUPuGEQVCJCSa0zfTGk9V+MSfy/KtfO7DEx5rtwgsRYiS+s330Yf9lhHr+W0BTTsDGsjSuKNCNeBqqWEzJVoM6bEn3Gc97ydcuDkOsHmiiqDO1iM12l9Kkp6GbQkQf6dY5aLvhXkJ4iyQh7WFrYA6CXWS0CHgpE4pGbHNluGuG7ZXQ0zKJcK+4abunZ52ClXB0ndlX52youyj5Cg3kXS023r0ov61Kg6HAVMfMkqOo+6xEvStl41leOqzRw4b1HAMz0Nn9rzJarlSxkv3smnlR/HAZoZ7dW678Qp4MK34+sSAa6q6AS+m2vVaLcvM26xt9K9wWFGZe4tVyBGyB65Nzf2tK+07abjOwd3EFqxCo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <550E7AD397CC604D8FA68E41CE0C2BC4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 C8MDuzuKaA13p1Q4YDUbiX0V1OPStnJPEFoxhF73V+SAwckgfnA080Xw+d9Oca2Yc3quWRNE0as1aWbR6N9HCCp2rojtwW40xCAQFWt5YpEFRbaldv7Sjnpuo1kAjs0VajWZ4iDJ3Tar+xPcWmm3VCj0EfortEYvg50oTie8S+806nWU++uVv0YygRjFzD77GKu32F5nBmkvTdZb8dpMc+kJXPl5L6h5DvUUxBAJqvrZbA2WW05NpwWwW4zUf2CbYEu8KGxNjvrdJHKpM5wfCjHmz47LX5sl3iBgUSNy2OyZGPlK2mGEbM1X8fummYBjY2HBu76EB0CeXut89VpV9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5570
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	29b0bdf4-d75a-490f-9724-08de7eb5f5ab
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|35042699022|4022899009|14060799003|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Pu5KbaGgvbSDmKYuI711Y8+u3CHUN1IY0FreH1Kxow16U/CR7XSRSRgvPB+JH74tusB0nh6qnYwdNeyNlz4KSW9BUZkFxkxFtF2j545AykkyBgm2z2GyXPEJ9UKX2o/vvbG30cF69ArVLg8OVN5ikz7yf0rHd+xiiMW9xA4p7sKrQNrr8MR20FMk9l7JytpROhDa0FsYCjiuDA3IUptRZMcROOtmJAUNuq2mrHFYO1B8oP9RrMXzdwD251d3a0AGgOkIrWoWw7jJc2pHzMYb2zQB4qtRr2hHmaW42mon2mWnLhwQz46HpTLc/2vN0S7krSsgpLoM+591/wwiYaRaNaWPlFbn7GWnmBytFmBkGq5UvYsIItQaO69GLX/AgOiayr1aeER7CIisyjxvqadyoVmsWq+toW/9HYGRloWeuGxfBVrxbkswwlTJoiKKoSY+vgg53cZGnhSl90Ym9FpgVIY4W84FVVnMR3w7p/yKZi0XB06irrXULy9Fl4/WQbxShqKrHWCuOJx5UEoaNte+a6Ge6g9v3JGHyTZhrcdngqAQrx5MTWw3yK6Ju5kHR1BL7iEH6M5eLBVW4xzrFjk4wosQSLvQo+9RCDt7hEJWE5m57LLsrFDsay0easTzC3bBM6wU2gX50TvpTNFdwUtUsBny6itdPzPJ9T2q3NzJRqrZFX09mle0l7uoF6AtqL5NXK5+APASHdhF5ut3BfVdBA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(35042699022)(4022899009)(14060799003)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	S7dF5ck6JLyxLefsxLtJIKvYIC8H4OC2ojHzq7CBgCIJYClM8p4Klw3BE46Cm10vIY7P+tws6qPrr3JURakKFTXcDTzLrj4P8ZG2B1qlYyMp1/JBRzZtNxKY0RqQ6Dc2dPpVDnjiZ2byk/pDrjsOBEboWezJEzxQBGcdohLbFz0P08WR51eVFB3T0PMKawURS6LdyAcDN+ccdKLGAumbWbynFQE6MdCQKdM4XExxqSQF+s/q0/9NWXopQn3N9sNAJQTMYr3NREg0wzlGnsLQHK0E6UKxrz68iObnFm0Ac8OO4UdIU/TJKUu/9oZXpxrfiLezB2e6SoYLaalRr2RO75rpvZsUWz92b/lsWp1M/yXSQsgfXhxk3RHu/0gqi1rOHd2NPLNbMr8rFZGTthiKGB9eQTLdcmQdUhk2IUzWuaI7+/99Fjhh4wDBXsXCMnJs
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 15:02:53.2843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da6d4fd-7f71-471d-56ca-08de7eb61ae9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6549
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 15:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232795

QmVjYXVzZSBJIHJlYWxseSB3YW50IHRvIHNlZSB0aGlzIGxhbmQsIEnigJltIHNlbmRpbmcgYSB2
MiBub3cgb24gYmVoYWxmIG9mIFdhbmcgTWluZ3l1LiBJIGhvcGUgdGhpcyBpcyBva2F5Lg0KDQpS
b3NzDQoNCj4gT24gOCBNYXIgMjAyNiwgYXQgMTU6NTEsIE1hdGhpZXUgRHVib2lzLUJyaWFuZCB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8bWF0aGlldS5kdWJvaXMtYnJpYW5kPWJvb3RsaW4u
Y29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gT24gRnJpIE1hciA2LCAy
MDI2IGF0IDM6MjkgQU0gQ0VULCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3Jv
dGU6DQo+PiBGcm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPj4gDQo+PiBn
c3RyZWFtZXItdmFwcGkgaGFzIGJlZW4gcmVtb3ZlZCBpbiBmYXZvdXIgb2YgdGhlIHZhIHBsdWdp
biBhbmQgaXMgbm8gbG9uZ2VyDQo+PiB1cGRhdGVkIGdvaW5nIGZvcndhcmQuDQo+PiANCj4+IFNp
Z25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+PiAtLS0NCj4g
DQo+IEhpIFdhbmcsDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guIEkgbm90ZSB5b3Ugd2ls
bCBhbHNvIG5lZWQgdG8gcmVtb3ZlIHRoZQ0KPiBtYWludGFpbmVycy5pbmMgZW50cnkuDQo+IA0K
PiBUaGFua3MsDQo+IE1hdGhpZXUNCj4gDQo+IC0tIA0KPiBNYXRoaWV1IER1Ym9pcy1CcmlhbmQs
IEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBodHRw
czovL2Jvb3RsaW4uY29tDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlu
a3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcv
UmVwbHkgT25saW5lICgjMjMyNjYxKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMzI2NjENCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE4MTY0NjM4LzY4NzU4ODgNCj4gR3JvdXAg
T3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
VW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1jb3JlL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPiANCg0K

