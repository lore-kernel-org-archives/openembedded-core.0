Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3306CF11C3
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 09:55:28 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.47])
 by mx.groups.io with SMTP id smtpd.web10.39677.1728554122923405449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 02:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cS6Kj51t;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cS6Kj51t;
 spf=pass (domain: arm.com, ip: 40.107.104.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=U23y9McWhFpAFf383OwcvqTY4jooKmQf62CDqm+SN+ikbZlPKJrflWCTkHZp6fe86oV/rtY3Ixi8BNj4D9S9xIMSX70w7AX6XxXk+NN00KZlkf1EQWnvzp1GeRM5lGo9XA5QUXnQ8X5PPQDMGvHMXprIazrg6tPQ1f55k7oBDizhcKtWMc89O8RhMQ/Fl9eq7YtCNTYA9FsIH/AxEcEQ5j41bLmaOFgr+ZEU7ajurXTdf7Gv/how5B9CcfHZsu5W7SrWeX9K3LfXf/66GYynL5+GP6QGc8kojp5XoVVl+X7ziHxMdekaNoOc5saaQDq+vw6+3cGd/f6PzQ65rDqFvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTN5xdvH5vuSElvTNGnS9PkDlqBkXZdp91OHvZ70yqI=;
 b=S0Qts2DujeE2d2atzEIjNr+A1Ld48o1C8cRUSw0nqcQrUB4yjdriOvUMSS4ADir3Jcw11c8NrWPK7eQ16HiU2yYTA/qAaH5zyWLQfjJNTHu9IgUbkSN+SioomdibYRd0s9s6DcoKLonvDGtidxhUhmxgndY8ypWs/7wWXojdR7VajndvzMJifjJHsS6hh8sQztlTWec2kp+pBRRBtNZHed+h8UbQWRV7jXFJDXT4sqhcYFwP8Ax2rKScK5xzPAJq5IPoehelPWO+jsn3OGQLD4Otelye6lRBZFlx0WJysQz+9fW0qJqDGC6IvscWMGkzhbxx4/rHlt15tX6vdS8HrA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTN5xdvH5vuSElvTNGnS9PkDlqBkXZdp91OHvZ70yqI=;
 b=cS6Kj51tSBbCNlCZd0Ob+cAuVYBStqr7grKJv/7+8RDsz+ZGq2zlQY18yP70ZtRN6MaDzqvWGFWHEyL0h5n5PMzVu8jRUzcG77noLQDJAMTiK5HTOwpoOW+cf64HJPThH9TA/gUa0LwQCa4+DflLeqIPOldp7p05ynEPwZS6Wug=
Received: from AS9PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:20b:488::6)
 by AM8PR08MB6579.eurprd08.prod.outlook.com (2603:10a6:20b:356::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Thu, 10 Oct
 2024 09:55:18 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:488:cafe::1) by AS9PR05CA0013.outlook.office365.com
 (2603:10a6:20b:488::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Thu, 10 Oct 2024 09:55:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8048.13
 via Frontend Transport; Thu, 10 Oct 2024 09:55:15 +0000
Received: ("Tessian outbound 1cf41b4bd505:v473"); Thu, 10 Oct 2024 09:55:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 05e8ca96635c048b
X-TessianGatewayMetadata: IRyggiFARV/ZiukYfL6oxVzCl6iKCkneiPpnTZaLqLJXGWyQccFWmj9CZPgUjX7ys3l/9dmlj1znGcGiWLSOguZp0FWW6Z41RuYuSljNkovon0IeThUAFBzXTxBr1wfKYMWDq7Gu+E1V0x1JDpY4O/l28ua/rzT6eOeeGaQ5ufM=
X-CR-MTA-TID: 64aa7808
Received: from L901441a306d5.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BF90AD46-E4D7-4B4D-AB0D-2A989ACE7095.1;
	Thu, 10 Oct 2024 09:55:09 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L901441a306d5.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 10 Oct 2024 09:55:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pu+GJh5UEoXazjd/w5nApnDz6Mkko/+8iW2e+QBJTnjH7nBDaVoqO0Sn6HrvYBXkpNT0opcG0SU1N2nPGGnUUq1uI/eKRP+XnSdH29WZZNU7pMxuvjI4HLu8auA5L7mNYbatEwkKzmXbGDnAQceS2+z8TrrbNP1f1ZHiNw9CtQ5u+fFikobudOJAB19XLDioFGCSE74decy0Q7qsa2hz6ccY5QBbZtihEYHjN9te9J3rWwXCVQNdCZ43ZoaMJmKh/mXHRpuMC7FVEmRjhNout8PQgiRyZva6IBPfs655gbgzj4Y26HkgK/fkIne2Gw764V73PLQ8BKyMMMoYLAL5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTN5xdvH5vuSElvTNGnS9PkDlqBkXZdp91OHvZ70yqI=;
 b=ie8QPXr7JrX5+MXun3FgK2W3DDNOgNDKe3aX3WRq6iV60H/W9J4oOXpFMkf7L3YzBq29hps2zkwYYp0Maq15TymBNemmN4Rcp4RKH0XikM5c8jkw6YaKrWMyMH4xnNzY5BG2LsnaormBh5lw/obUQKcehHlSYns07vLCsSswzMF0bPBUi595+PUaKc9PUZMQW1LEUg3ad/G+elKYnACwlp5x/zpxXodtFOxcL2J2Uf3XhsUcDRGsm2yXSnz/wnlT1xIW+UjOaX+4v3vU4fexYn2EE0WZzM/0qXSG3uIJVoUyQFrFHON9gfC/U6XqQX4Fw6Wr9DQI05/UazZ+zTOyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTN5xdvH5vuSElvTNGnS9PkDlqBkXZdp91OHvZ70yqI=;
 b=cS6Kj51tSBbCNlCZd0Ob+cAuVYBStqr7grKJv/7+8RDsz+ZGq2zlQY18yP70ZtRN6MaDzqvWGFWHEyL0h5n5PMzVu8jRUzcG77noLQDJAMTiK5HTOwpoOW+cf64HJPThH9TA/gUa0LwQCa4+DflLeqIPOldp7p05ynEPwZS6Wug=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5510.eurprd08.prod.outlook.com (2603:10a6:20b:109::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 09:55:05 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 09:55:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf: don't force musl on mips to
 use classic sysv hashing
Thread-Topic: [OE-core] [PATCH 1/2] bitbake.conf: don't force musl on mips to
 use classic sysv hashing
Thread-Index: AQHbGjin2/bJ+syy3Um3Ui+lS9Y0MrJ/wHgA
Date: Thu, 10 Oct 2024 09:55:05 +0000
Message-ID: <773CD368-47BC-4D84-8F86-DE789AD15739@arm.com>
References: <20241009104716.711424-1-ross.burton@arm.com>
In-Reply-To: <20241009104716.711424-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5510:EE_|AMS1EPF00000041:EE_|AM8PR08MB6579:EE_
X-MS-Office365-Filtering-Correlation-Id: b58bb5cb-551c-470c-e100-08dce911a443
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZWwydjgwVWgvQ2lVaUZ3NjJZM1Bwb0tZeXhvcGF5MU1FcHVqeGI2OGNIL0Yy?=
 =?utf-8?B?QmprelpzbUlxN3VEMnY3ODFuQ1FzZ05BZVJYZGx1MExHa1ZnRWxua2J3Yld1?=
 =?utf-8?B?YUFIMGsxRlVhSmZmaXZ4ejFsVm52akVqU0s4RE9UZmRNVEFVNmdlVXVhMGkr?=
 =?utf-8?B?ME5Lc1U2NXFrYmUxSDFEbjlzV2ZyUkFyT0ZNMTVZWXBFNDBkb0k2cURXREJz?=
 =?utf-8?B?NkFZK2Z1ZWJZZlZuT0xsQ2ZzRXZSUHhkSWZQTFpyM3RaK0ZvbTdSV21sTDhl?=
 =?utf-8?B?RzIwSnd0YlhRUElFS2xOT1FTeHdyRGJreFNQMVlkYWh5Vk1MMmZSUVpYWXgx?=
 =?utf-8?B?cEdKQkpGTDNjSzVXYlNONVFqU1JMN2dYT2x0YTU1SnhhRUpyZHlwMUNVelpz?=
 =?utf-8?B?dWtkU2RHZTNnN2NXWmZBUVczSmswYUxqRFRIa0NFTXh6bnMvcnYxMUFJY0Nl?=
 =?utf-8?B?RFFtQWRBNzNha1pUWUkrRG9NbkNnSTJKTUc1WmxPYnpHdWhJalFvZExNcVNh?=
 =?utf-8?B?QTAvVzR0L08rdlZFRUo5MHV1M1lrN1hsekxQS0NsZzlOaTdZTlY3S2xVc3hG?=
 =?utf-8?B?V2VScWZzWjBVV1g1Y2ROQXIxVTNXQnBucEVJakNKNWM3M1VVb3RqVWJ2Rmpp?=
 =?utf-8?B?bHN5WUd5MUFOTzNjcnZmMG52d3VuaU5kdnZaN1RORndIUloxcUc2REoraUhu?=
 =?utf-8?B?WjBOVllxUVJkNVBKTms2c1JzSStPMzE3dFplMjRGcnR0QVROckVCbU1qVndS?=
 =?utf-8?B?UlRSQ0t2Mm5DNHRJSGJJU0ZSMnUwTUdubUNwcmpNSFVDdnpWb1ByeDNLREg2?=
 =?utf-8?B?anlRYldNWFhXU21mMk95L2RCZnJHRDlYL3dlOC9MRnJDbVZwZUpEY2ZwR1Vp?=
 =?utf-8?B?N1NhMng5bE1CN3lXcUtETVJSRGVQMGdnTklmcTZhdTYwQ1BIVWkrV21jVkV4?=
 =?utf-8?B?N1U0S1gzTXdjcHFscDlRMFBHZSs1Z2ttZzFjRGhjQUM1eXR3UEJqaTR4RHN0?=
 =?utf-8?B?bFF1YTlnUVNYSm9MQW1xaEVjYXdTSlcrVDVlTU45VERIdnh3ekx1TlBFUUN6?=
 =?utf-8?B?SGhzKzNrTlhlTWNNY3Y1RlVBcHBSYkVlK2h3MmxMNVBqcm5xbFcxTWRpNmNK?=
 =?utf-8?B?aTE3dWduaVUvb1RZa2hXT1pWRVdTZTJrQ3B0bSttZDdWMGFQOFprRUJPYUpH?=
 =?utf-8?B?b3luZmV0NDZYdkFKVG5CUWpiL0phOU1lWXU2OHpIbW1SNXMxTFhOQzBXUU5P?=
 =?utf-8?B?MHZRS2pTeTNrT2MrTGFmT1lxdTZBSmNCVU5sWEFhTE00QnExdUJOS1pnL2Ra?=
 =?utf-8?B?blY4OSt2ckE4dmcrOWgveThYMC9WWmFJTWZTTjRzRkFyRDE4VUFRUi9YdmZY?=
 =?utf-8?B?MTR3MG16OTJpdTdvYXAyb3o4RC9JZ0lrWmZqdnkweTJiWVhuVkhiY2tqL2VG?=
 =?utf-8?B?WjNFbi9seGg5YUY0djB4cFZOYm1COGtsWDhpYkNPQUFZc3VmOWZka2lJczh0?=
 =?utf-8?B?UXZnYW0vM0Z1Rmp5SVJYWnNJVG4wVCs2TjROU0RvZXV3N3JRcXdpYlljdHFv?=
 =?utf-8?B?L3hVWmJTa2I3Q2c5dlNVZFo1alJwTWtJQ01UdUtlcEx3cDRsdS9jSUZxUVBB?=
 =?utf-8?B?V0lvNjV1ZEQ3SXQ5dnFkQlRpbUQ3WVJQQy9scmZVbFpFcGFEVHhrT3EvWEho?=
 =?utf-8?B?Z1NWVEN0VE5vVUNDaUszd013RUIwalZSaWF0QkQ2MkJLODVaTEFycEpPb08v?=
 =?utf-8?B?YjNBaWtiN2kxc2RoVEFqZXJuY0VYVU1rNEllM1AzOWtwcFlCdkJEaDlQa1V3?=
 =?utf-8?B?d3FUZHV2eXIyQTljNkFRdz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2A623488C9B4E49BC1796BE96916C28@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5510
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	667eaae2-68a4-4f32-d0ba-08dce9119dd0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|35042699022|4022899009|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MkJDZzBsWlg0b3J5QWhSMFg0Wks5VC9hb2p1NmI4M2s4RWQ2ZkRRYXQxZ0R4?=
 =?utf-8?B?ZkhSbHhYVThYSmVoMUsvcDgvWU9Wckh2WWFxUzBDK1hmS0tlVTgrdnJqWnFK?=
 =?utf-8?B?U0Y2M2svZC9NQnFmaTduR0x1UTZXdDdocnZsV0VVaDZQQVA4MGNheng4OXpm?=
 =?utf-8?B?WUdRVk91aXFzYlpDS1dmN0xkekZjUlRGVjRhNFhwZjFjeDhyaDhUaHpkOCsw?=
 =?utf-8?B?dVZaQzM0Z0IwMHE4UElKVExkUEwwOHRPblpWSDRQc291WjZTYjU4ZHBadXM1?=
 =?utf-8?B?c3p1TnczUWR0aGJQNHlNRXp4MXNZbWlqYzFMR1F3S0NSOFJHb1lsS0I4SzdQ?=
 =?utf-8?B?UUM3Lzhlb2FkeUg4bk96anNVQ2R3QkJWQ1B0VWQ5SWV6L2t1S0o2WmIvNmRa?=
 =?utf-8?B?V09NcjQ4aUN0NW1QblNCdUxLK3QzZ052dWFOeUEzaVNpWHAvU05tc0lYVVpz?=
 =?utf-8?B?TUxKQmtFK3ZsYnU4MHJVRThKN01HbXo1YUMxTlRMK2VIcDRkWTM4Wkk3c2hQ?=
 =?utf-8?B?dWpjdUx3Vmp5azJKejM2c2x3ZzVxWEdVRnpFSnBpSW9udGFJeWZwNUpEYURZ?=
 =?utf-8?B?Y3JIT0ZCMmNYcEhlY3phdGs0L0tkME0rRlhXM0Q3dnduOUgyb3ZxSUNJTXIr?=
 =?utf-8?B?dnhVRFQ5ZkExUEFCTStlY0NEREVXWDJwcE1NdlY2ajRiZGdtclNydVJWdU9E?=
 =?utf-8?B?Y2dNajkyMklmenQ4aWFVVkk3THB6R2tjR1Awb3hmMnI5eU91bDg2WVA1ZHZs?=
 =?utf-8?B?cWozRU83cDFTZk14ZWZKalB6UG1hUDlZVzBPb3g5NWJYVlpBc1NRenZFNjN6?=
 =?utf-8?B?Ums0SmlXWEE1WGI3ZEg3eVpGRWFkN0d5b1hPVGU2VWtFUmZtWjBrdFVnMVcz?=
 =?utf-8?B?YUJ6WURtT0E5NUIvZEtMaVNHYWNzdzBJT0V1K2FLZTk4c1lQbkY5S056M3Js?=
 =?utf-8?B?ajZMaHIvSnBQbzFDbW5BZHd6RlJ1TVJzTmJtdUQ4amkyaG9LckttOUEyVHlR?=
 =?utf-8?B?a3FONWpNWTJyWDNIWkJsUUlSMDVXQ2FMdE5nNnNsakkzeHhIcGdNWUZaZkJF?=
 =?utf-8?B?eENkUmMvMUFRaGVjRHovcHkxMjJVLzhnMzk4dUhDaU1uMHNGQjN0emhSYkV3?=
 =?utf-8?B?YWVvTXBtWFlLeXRnV0dOK1k1ckRjY21xL3U0MkI5L2NhUFJ5SGhhTXJUcjg4?=
 =?utf-8?B?cHQrcmE3bFlzUUF1b3BPNzY2cVE5MUNSUEFGWkZWM0RRVUljQWUxc2tjNDZO?=
 =?utf-8?B?K0c5UWJyVzlmZWxNNWtIRHBndzRBdzRQOC92Q21iemFYNTQwcDVlelo5Uy9z?=
 =?utf-8?B?QTNVTDZXUVRtZUgyWXdZWWJabGxzaDBiOEJMaWVVZlJOdC9TUDh4V2V4Q0dF?=
 =?utf-8?B?WkkyMkJ0eENzMlpiS3o0UktuS1pWY0Iya2pMWVdhWVF6WFVncWtISHFjMmRs?=
 =?utf-8?B?VUZHOU9RYzIxQXEwRGVnTElGaTc2bWlSQU9JbTJubDA5SFZQajhUdUZMSktw?=
 =?utf-8?B?Y0FzSi9tdXQ0T2lCNjhmLzRyUi9EUUdVaFVyOFVPcFVtSThQd3lnN0JMVjhj?=
 =?utf-8?B?c1VxbVZ6QU53Z3VJc3dTUkFNcVA3bmpadUovbzhnem9mb1ZpVy82NTNpVUVN?=
 =?utf-8?B?WmN0Mkg4elZETWhhNTBtU1phSUZUSzNHQUFVbEZWMGVzSjFicGhWVDVScEk2?=
 =?utf-8?B?NkIyaWNyc1U5ODhsZzJBY2R3S3B3Q0RTTFkrV09udEgzZTYrSVpaZlBhdHYz?=
 =?utf-8?B?K01lNEFGU2c3ZU44bVZkcUh2QlhNTWVTazNKZTNnR1RqWXdZVFVLMGMxME1P?=
 =?utf-8?B?Wk9pSGxwd0tDaG5Uc0RudDJGUlJFdSs4Ymw2OTlzQUFJcTdZRGZHUDAwVjhr?=
 =?utf-8?Q?lJstow899gqJ3?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(4022899009)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 09:55:15.8926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b58bb5cb-551c-470c-e100-08dce911a443
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6579
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205404

S2hlbSBoYXMgcG9pbnRlZCBvdXQgdG8gbWUgdGhhdCB3aGlsc3QgdGhlIGJpbmFyaWVzIGJ1aWxk
IHN1Y2Nlc3NmdWxseSwgbXVzbCBkb2VzbuKAmXQgc3VwcG9ydCBNSVBTX1hIQVNIIHNvIGl0IHdv
buKAmXQgX2FjdHVhbGx5XyBydW4uDQoNCklnbm9yZSB0aGVzZSwgc29ycnkgZm9yIHRoZSBub2lz
ZS4NCg0KUm9zcw0KDQo+IE9uIDkgT2N0IDIwMjQsIGF0IDExOjQ3LCBSb3NzIEJ1cnRvbiB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IFRoaXMgaXMgbm8gbG9uZ2VyIG5lZWRlZCwgcWVtdW1p
cHMgd2l0aCBtdXNsIGdlbmVyYXRlcyB0aGUgZXhwZWN0ZWQNCj4gRFRfTUlQU19YSEFTSCB0YWJs
ZSBhcyBpdCBhbHJlYWR5IGRvZXMgd2l0aCBnbGliYzoNCj4gDQo+IER5bmFtaWMgU2VjdGlvbjoN
Cj4gIE5FRURFRCAgICAgICAgICAgICAgIGxpYmMuc28NCj4gIFNPTkFNRSAgICAgICAgICAgICAg
IGxpYnouc28uMQ0KPiAgRFRfTUlQU19YSEFTSCAgICAgICAgMHgwMDAwMDFhOA0KPiANCj4gU2ln
bmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+IC0tLQ0KPiBt
ZXRhL2NvbmYvYml0YmFrZS5jb25mIHwgMiAtLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL2NvbmYvYml0YmFrZS5jb25mIGIvbWV0YS9j
b25mL2JpdGJha2UuY29uZg0KPiBpbmRleCAzZjU4MzY2OGY2Ni4uODAwMGJhYmEzODkgMTAwNjQ0
DQo+IC0tLSBhL21ldGEvY29uZi9iaXRiYWtlLmNvbmYNCj4gKysrIGIvbWV0YS9jb25mL2JpdGJh
a2UuY29uZg0KPiBAQCAtNjM2LDggKzYzNiw2IEBAIEFTTkVFREVEID89ICItV2wsLS1hcy1uZWVk
ZWQiDQo+IA0KPiBleHBvcnQgTERGTEFHUyA9ICIke1RBUkdFVF9MREZMQUdTfSINCj4gVEFSR0VU
X0xERkxBR1MgPSAiLVdsLC1PMSAke1RBUkdFVF9MSU5LX0hBU0hfU1RZTEV9ICR7QVNORUVERUR9
ICR7REVCVUdfUFJFRklYX01BUH0iDQo+IC0jIG1pcHMgZG9lcyBub3Qgc3VwcG9ydCBHTlUgaGFz
aCBzdHlsZSB0aGVyZWZvcmUgd2Ugb3ZlcnJpZGUNCj4gLUxJTktFUl9IQVNIX1NUWUxFOm1pcHNh
cmNoOmxpYmMtbXVzbCA9ICJzeXN2Ig0KPiANCj4gIyBQYXNzIHBhcmFsbGVsIG1ha2Ugb3B0aW9u
cyB0byB0aGUgY29tcGlsZSB0YXNrDQo+IEVYVFJBX09FTUFLRTpwcmVwZW5kOnRhc2stY29tcGls
ZSA9ICIke1BBUkFMTEVMX01BS0V9ICINCj4gLS0gDQo+IDIuMzQuMQ0KPiANCj4gDQo+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzIwNTM0Nik6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjA1MzQ2
DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEw
ODkwNjUwMS82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNv
bV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

