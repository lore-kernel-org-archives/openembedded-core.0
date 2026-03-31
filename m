Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84012109B48D
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 15:20:43 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22802.1774970440120644976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 08:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pO720SHv;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pO720SHv;
 spf=pass (domain: arm.com, ip: 52.101.65.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tFu2TpPLOT4Z7su6nU3wo/duLgni6yFu3Pg9Yv+hZGsTHYBwAng94vdM74t6Bs8l6tIw5IXdUhaMT1QEyV1sEkzLL/lS4g7OYj7HnrUshpq491WGhXD6Wyx3f1W0/JxpcqE0uymvr9esTo9Y6pYEjQicqPH3lyEDCkC4Pz8HOFtZz+uYPNmod/8cQuRNIpTK0dJRZDA4G6YC9ZG78eySP2SUmN/c0cjhAl/zDVRiCZnzJh9f9I9sAUPYdzjWUG5zGuMwj3mShwU/bLh08YSMIz4ofl8eD3j7LD2D3lE4f4+oeeCmZtWH2in/dlrYSnw7zEz4FcRVAZUB6grnPkqTmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLDoteXBYii1swG0Lh0hsscwAWF9VRlotkVSHJBPje0=;
 b=I3X5nNDXh4jsEBXlPcGARIUahRg8cmuDSEAlsWRaohYzU3xVdU7H0+9tuIteny1shi2NcmoiXMiZmIqwnsQQg+Jh2cbu5TNIkCOKPTNyPPQ5KkAqphlFjAuLJUPvXfUM04lx2xUhOFhl14E80VLGKSFCohH+cCV9iZWK/zhm/gdPCrHvzNCMcVuz/hzElbpaQWo3WD3w7jWAS/nk6gxSxHYtM7FmSdTXaao7786tMobhP/ZKBkMOI2l95OQZdN3SnFr3F3yzQYUvlF2oG3XDEzpQRUWo04RlDKa1fhQyWVKVwPzwQjRr5c1JMNa8U/Ie8ZzZJTPRlXSIRarSfAZUkw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLDoteXBYii1swG0Lh0hsscwAWF9VRlotkVSHJBPje0=;
 b=pO720SHvJK4fkDQZOgEChAPe0yTpZnaFOh0UqlESM79WhSqIiRONatQ9F9RJWq1fiv9JMFL8ENzvmEpQWPjnGXB7wzwkDCNlsxc0rBQhFaJXbKFmKTlcBhyS7R3brSaol4vhS5rlqsy8JFC9PvUOCmp5tksubQq+6yU8/IE3NGE=
Received: from AS9PR0301CA0022.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::18) by DBAPR08MB5607.eurprd08.prod.outlook.com
 (2603:10a6:10:1ae::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 15:20:36 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:468:cafe::b2) by AS9PR0301CA0022.outlook.office365.com
 (2603:10a6:20b:468::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.27 via Frontend Transport; Tue,
 31 Mar 2026 15:20:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Tue, 31 Mar 2026 15:20:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2+0dZbV7m8ZhZzaqcqKssbLTcEc/IJy0gnmJUJyKL2dOTWu0zIATfn7DuxrwVQOuAXsrBwuz29HttOk1iFitwEhJSYCVOcp7fwycEDYKlF7RodZBsUFm+KOaRz/qb3AFNw0/9j/LW/tEo94fqoJVGWt1YrM2FHvDTvt9PjjBqP/PRkx1fH3M7mHbNWAP5fIzR48IY9xoIGgsBJ3gqMMwJQK0HuAlAbJBh9GDXzuy0hAKXLHJoqcpeh7h8jmWFfTpH869mG1Rf4xoNSAY+YD72rIfUJLdRbhqHuQoc6HMNG/BybPnFn0mJIbriIT+Uj5R9XWCo1leAixH2/tzMySIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLDoteXBYii1swG0Lh0hsscwAWF9VRlotkVSHJBPje0=;
 b=eO/417qEfhC/P24AlYPIF0KvITS8UO6E/Rn2VhJEhVb/KLr39marz5pZ42wfNuCIpG05G9lPqcZixaHq/BbCec20dVW+5PfXmlkAhMo7r8FtISdCeG1XafKf79Y4SCCQruL+FjpZK4Htx8+wLaF5vSEKFSsQ6eFlwtz9e5a7Pmm4vNqhW83kf05XflRn7ZqYorP1MfGZzSnV/p4Tck/o8t8S1LnMGwHfrtFaJOjeBsvxK08psVsjtgeM3t7mWsqBxnC5SxPIB7e2NCHhDY/zxZxI8vugG+27JaBJnXYDGkVGiCISfz662eiQdlaCv79Y3MvIIWQz9Gqi+Ko7htk5rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLDoteXBYii1swG0Lh0hsscwAWF9VRlotkVSHJBPje0=;
 b=pO720SHvJK4fkDQZOgEChAPe0yTpZnaFOh0UqlESM79WhSqIiRONatQ9F9RJWq1fiv9JMFL8ENzvmEpQWPjnGXB7wzwkDCNlsxc0rBQhFaJXbKFmKTlcBhyS7R3brSaol4vhS5rlqsy8JFC9PvUOCmp5tksubQq+6yU8/IE3NGE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9288.eurprd08.prod.outlook.com (2603:10a6:10:3f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 15:19:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 15:19:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] classes/vex: remove
Thread-Topic: [OE-core] [PATCH 1/3] classes/vex: remove
Thread-Index: AQHcwRHDMM2buOT4+UKIWvUT2idtcbXItzgAgAAF+oCAAAKUgIAAAZcA
Date: Tue, 31 Mar 2026 15:19:32 +0000
Message-ID: <9563B43A-F1E4-4023-A84E-F6C16B6D1733@arm.com>
References: <20260331132430.781647-1-ross.burton@arm.com>
 <CAApg2=Rnrr_ZijiZ4cxKvkwmeCOssHXVfNHi2hZAywuhNe+F-Q@mail.gmail.com>
 <38C0C321-1456-4C35-9AA1-8B4CB8BEF6B1@arm.com>
 <CAApg2=TtBWXYMy=2Lh8UYia_Td+ibPBCwh57By5STzPhdfbH-Q@mail.gmail.com>
In-Reply-To: 
 <CAApg2=TtBWXYMy=2Lh8UYia_Td+ibPBCwh57By5STzPhdfbH-Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9288:EE_|AMS0EPF000001AC:EE_|DBAPR08MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 34657dcc-acd1-4f62-e863-08de8f390eeb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 du/boyqNDt7GeV8zZlmb6C0yNkjM+sZVABN5VZcFS7pQFyWjLmPYpbciGYbGHzdxb2rBeEugMX7zV5bj6YKGDRRR8r7HhLEKXWCJkWW4muBsJ6hLr1dKEPWV5KcGciJ/5agxjDeFa8GywUl+dwvN4iiyN8JYO0zQJd0zHagYjq3RhoFbT3+ZDDx28Ec/Y8fYFhHYgaGM8QuZA/Hvbz1XkhBaCUX741X6fSvdYdRYCmXUwgZoAgMjud+JV+KZlynHQ35MSQxvh/BFWdGoYiFMUaGRLv9ZmQv+/aP2ceamf816oq9jdGdeiw76PEuuSnecA8W3jyPulbQm6X3lVKmOOHONta3k2nkp1jmRkn3Wx8fTtHyEDDPcIed3nLHSu6elBDdYwh3ZE/cllJ69iFPBZALU18dywvqqXn+5IpBX/PGAcbS7IU53BYZ45jE8iFyDTl4gv8iG3TZV1bwGRrRCbLgQC9OXiV5NCytDi8VaoVgb246VMrz13DvNzFli4J40gxszFyyK4LANCp5bJs4zuspgGEPfO2IzM6wact3M8oWCeH7BcJIBRQcM93ZIea+zE+/HNIyx4WU3xGggWcbD0HTg466/rFcGywS9q1mc8A+Equjv0rc17HXZxGr3CGVu30Hys0lJfEOJ92I91rgzvZzou0jqrVbi0s4Se5Z4OC1pf91BAf8iJ/NZattwM1+wdYgzHEUh99/UyM0sk6I3NpP8Rhj0TO2cCWaHkbG4i4RwRQC9SM3O3XZQ1Zba+1AZe6Jr+PquEXG4xdh5RKQG0ytNKRwyjqRJ4/9MrRFbjUM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAC90992725F0D4EA3B0731F390A071B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 tyF4qftHSdUEz4l7phRBL+6MyUwQDH4bA6e/2FdjOEvNKX+NUfDEIn8Ac+aAXhdR9xj1x6djgB/3QObvq11e0WC2RpBOcoekGZWYCk0PeO+Z5t6/bP9oOBjuEMsaVOdqv1y5/1HhcTlW7M2AcvzbaX9PKWQ0LLEL+SDisVm5ENo54+AnyPIvtO2+N3cyL7PAwd+UITgRH4bAgXdIt/WO4nlxk+Ra3SDB/F61cT6hqWMDkLuQpo4D9eRBaBUgjsjNHN4/Z4ZBaCSYittN+j57RGvREwwKXemO6gzdKYmh6g8VDZtAUzLMORO+zjXIdNjQ62CRfSX1i3h0X3Pqd2m1/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9288
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d86553d0-a15b-4fb4-0764-08de8f38e94e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|14060799003|35042699022|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	z+XSubQYzT9o/1AUUvhNKu/xR8Y6E3ndDSZ/i2RH99jmtOnZHdSQOpXvqh1fimQqdVelAIz6N3rb4rEyBJAUY7sLzl1HgSjo5839BozdqJ+/5B5HUpYvQNaubuiamywDTV95PsLLzE0YQ0D4eYWMNjm27mJrIpJv8fdbGHmOSCFJzNaqh7wT/bQLO8YpwQ2egS7fTPlhirbFmKNQubcSrlKQgNh7umSt8ps2rPHG1BEhrmeLK5mz3xF36ueSgMfQEtbZl6+KoAnCQZxBpiSJsVPDRIbLZDeAOUHWDPE5JUVVwGaXrN4eYYfiLHbAk1OMeLMg86lZhOHpUdfM/FBZ3c5Ood7Emgpw3p597iCxPcYQSI45CZoB2hYYqZxK2XheM+9dIvflKr0DOeODb3Fa2yAhNiiUOeCy0rDU+wlBCLmwCwF7hnJZj3r37QhDGQ8ARrrvzvbhBkyFmS2hlftJxGRK+BeouV7Nf4EVtwO+n3SQ2Ze4a/qWD+gToZZVxbeyCszR154vlkQjRehqG3D12XddbI4HFrQ1nc5Zx4K4372bmWaTo1LHbsfPXTZLQxlYqm2o9+juOom1PonMrmn7zShrGXKQgLAnp7xaKZwArFTKa/npKZWgHyhkzUl/+opqApmu7GswAtazGBwpfvWV2cz7RIxHShXtHXjSXeez34jBjq+2PNkONK9l2iH4h3f/j85vgI9Yp/YHutkWVoHva7uY7TAdjedrFHmDyA1m3HvXImuCm7jdTY+edksQK+V9iRDXkvsZXTDl6Tdl3mVHlw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(14060799003)(35042699022)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yoH/AtL7YFn4Mh9DnSL7pQtoy3h0DhoF36qlo9+S1ezLY1bGGIGXFjO2bsVsY0wUTer0ofJIvLQuQ2v3OvGtaDipfc6uOncALC+MTW/Q8R6RWk5xTCyo8nKwXlWGZGLksMWo1bfwPqWBXQ5Qc5VrMCpu6Slgkxok/v6emn/WkwHXQF0C+8bfwP/y8VgGHFDn5vfNBjaSiCnf1QCk6Fp5A6BKsv4snd1eI9UW9N1qUbRYT8x4gZEsY1f/fJ5vFFjAaSHa8gmCoQMbR2W/J5ECgWN59Fs22BJ/931jT1r0hEGQvCrwJ57uMJKv/Sj9XJgsnmJtUtXBfPWKX1XuJcSpXI3YH9R5BZQVytfihMWHoy5LZT/0noJhdqkrSIu14Nfz8tAd9GbNBRY/hGP1FckQEKDKh8fi7I50mS//RrYRN5wu3Cq9myVSOpd9eLPo7Jm9
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 15:20:35.8985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34657dcc-acd1-4f62-e863-08de8f390eeb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5607
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 15:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234301

T24gMzEgTWFyIDIwMjYsIGF0IDE2OjEzLCBNYXJ0YSBSeWJjenluc2thIDxyeWJjenluc2thQGdt
YWlsLmNvbT4gd3JvdGU6DQo+IE9uIFR1ZSwgTWFyIDMxLCAyMDI2IGF0IDU6MDXigK9QTSBSb3Nz
IEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+IE9uIDMxIE1hciAyMDI2LCBh
dCAxNTo0MywgTWFydGEgUnliY3p5bnNrYSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cnli
Y3p5bnNrYT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gRm9y
IHRoZSByZWNvcmQsIEkgZG8gbm90IGFncmVlIHdpdGggdGhpcyByZW1vdmFsLiBTUERYMyBoYXMg
c3RpbGwgbm90IHJlYWNoZWQgbWF0dXJlIHVzYWdlIG91dHNpZGUgb2YgdGhlIExGIGVjb3N5c3Rl
bS4NCj4gDQo+IElzIHRoZXJlIGFuIGVjb3N5c3RlbSBvZiB0b29saW5nIHRoYXQgdXNlcyB0aGUg
WW9jdG8tc3BlY2lmaWMgSlNPTiBmb3JtYXQgdGhhdCB2ZXguYmJjbGFzcyBnZW5lcmF0ZXM/DQo+
IA0KPiBZZXMgdGhlcmUgYXJlIHRvb2xzIHRoYXQgc3VwcG9ydCBZUCBjdmUtY2hlY2sgSlNPTiBm
b3JtYXQgYXMgaW5wdXQgYW5kLCBieSBleHRlbnNpb24sIHRoZXkgY2FuIHVzZSB0aGUgdmV4LmJi
Y2xhc3MgdG9vLg0KPiANCj4gTm90IHN1cmUgaG93IG1hbnkgb2YgdGhlbSB3YW50IHRvIG1hbmlm
ZXN0LCB0aGlzIGlzIHVzdWFsbHkgaW50ZXJuYWwgdG9vbGluZy4NCg0KSU1ITywgaWYgdGhlc2Ug
dXNlcnMgZG9u4oCZdCB3YW50IHRvIG1vdmUgdG8gU1BEWCwgdGhlbiB0aGV5IGNhbiBjb3B5IHRo
ZSB2ZXguYmJjbGFzcyBmcm9tIGN1cnJlbnQgbWFzdGVyIGludG8gdGhlaXIgZGlzdHJvLg0KDQpS
b3Nz

