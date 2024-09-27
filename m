Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81392CDD1CB
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 16:04:45 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.61])
 by mx.groups.io with SMTP id smtpd.web11.72957.1727453075213308732
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 09:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B3BhsLsX;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B3BhsLsX;
 spf=pass (domain: arm.com, ip: 40.107.247.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a+Ea25lIEbdMqSiBpJXK2DCpYZJMwBP0zGQjrlZYEttAeBn29XtIMH1k+7bUGPi71utyGTfDG4U+uV837LDBHNfbzec7jUAdBGoWIgdabW75nRSqECmu5mSX1/RywpNtceO1Nm+ddyeMkKYIEJ9QDgWd2tGK+nia/gbAElI2q64wlfJJznfZc797LGtwluYVwOy0ZxflKWrEe6qDVWrwQ3jEQtrZNQzAw3R2if0D5xnL0aHquPNQF6gvsLljhFK/UmkUN39kIhV+1yvJUF+c6cu6wkv05UUo3VPCBDb1he/rjpH4/2cSA7RuN8OZc18xg3QqZNE0aDJN97qFHZ6spA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbcwo2k7ppYqWshEqBmq2pr0w6MLLyHZKlUJKiNpqFc=;
 b=JpQpq3PjiUj9nE/wCwTybygLocj5PtxkzX5He1sjXQZ5cbcMecHoQy7XUGnJFkF4mCB8aFzrfvGRXaaG6/wss39HdV/pgBvIkfWGKJrgal9Xip74E+45TDPrzIE+ocZYmZa8FRer6Txg6XTgial/oqbxtyiNSz3rACZlHPjBgKosiSXOYpNA/mEsFK/5a6ip8HgvaMnbg8k9dba+IP9uDqhQ+dSBdB5YlNnvBtkYY0Qow6Rvmt/o1a31xGiXMl5U93e9w0ekkV0+27NP9Os/2kvaHi0DKUWsbF++AoowZmqPfY5L1GCTCl/uLRkTyDlkONbX2x3YEYQefGhyEcvmTQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbcwo2k7ppYqWshEqBmq2pr0w6MLLyHZKlUJKiNpqFc=;
 b=B3BhsLsXElpFVV8lV4orMjKxg9lelWoL4i+WfeUxG75x02QmKSmStwTZ++WlgjnOAT4kyIfTgFwuZTcXJ2tGFK2wNs2pKhfnc6d8/4s4a2DwiNg1sgXlTOFCWUTnxB74mCIxsq2Wp+Bfds5ZkUX9vUUEqNun2rxInGOUieE0PnI=
Received: from AM6P191CA0070.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::47)
 by AS8PR08MB8037.eurprd08.prod.outlook.com (2603:10a6:20b:573::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Fri, 27 Sep
 2024 16:04:30 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:209:7f:cafe::43) by AM6P191CA0070.outlook.office365.com
 (2603:10a6:209:7f::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22 via Frontend
 Transport; Fri, 27 Sep 2024 16:04:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Fri, 27 Sep 2024 16:04:29 +0000
Received: ("Tessian outbound e9f81699740c:v465"); Fri, 27 Sep 2024 16:04:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 02139412041c0d72
X-TessianGatewayMetadata: kmou4aaJDp6BY5FRFRCSdp9nrenZaBuM+7+AYtKZzh8+uObtLXQpt++nR5HYYgC/Z2IuXOoSRslT/siRHk0w7czgFgfOUP+D2OzqAj11FQZzeBMwijKAhNSMCflO3ci9SwGypHNWSIgRqnJaczxEaDXv5xwnxlN95KULkP2nO08=
X-CR-MTA-TID: 64aa7808
Received: from Lf85faec1032a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F5A4DF8C-84EB-49B8-969D-0862D4B3843D.1;
	Fri, 27 Sep 2024 16:04:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf85faec1032a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Sep 2024 16:04:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEnQxgh4LyYQ0uyZ6di57uNNIAsUyyhE+X0xdshmkfcUOkHDMPaX1h0h4i/w9K1YHFz29fdYyqzKUMwlQ3qyUOPVcIaPYIl23OvIEmr4MIKKkAO8yQo3fkcAB3e0tA0+sLitiwuE/HfhXjlmWH3vKYwHMREJamCGtbRWc7Icv8QxAc+cC/X4lRTN/XMXL80yNkjEqRCwcvSLiWm44Bmi7Hu7EVZpEsrlw0Zy/q1svuPhE/Me1a7loZxsJTKGjAc2RnYMoYtq9fttXzBpzh0RvCQEQ3TgBKufHnZGVJkOBtuwYSZu5VJMaonZ5nzPm+NRbZuDhsUlRwfRdvETkgb9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbcwo2k7ppYqWshEqBmq2pr0w6MLLyHZKlUJKiNpqFc=;
 b=HL2AfChLtg3ZO7swNp/oXJgT2D+ELKIyComrAdVOQvxsVNUhQZj+hrLo+wW2LrKE4JWwoxAwCsQXaNtNGPEv2wWeJgFJTb+0tmvBHuHzt4xsphRJcs5l6Be/IvyS43VCOpINpDeZ8stHQBayHRrS2REcO40BIn5onxpQMvpEICLJ9tpbIKIKyFBuBVyLqn3qeNuddXPDLijG5fDhBTq67AETZUWq8y3h4JHOZUbDnGNu9eFgamQJv20FENTGr/4RGm7wkGkYzvODJszZMQfk8ztQ2q/RX0934AjsdLPMSuOJRNU2hQtOVULsbrIiPvnnmRx8/+tRn5H41CLf78WOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbcwo2k7ppYqWshEqBmq2pr0w6MLLyHZKlUJKiNpqFc=;
 b=B3BhsLsXElpFVV8lV4orMjKxg9lelWoL4i+WfeUxG75x02QmKSmStwTZ++WlgjnOAT4kyIfTgFwuZTcXJ2tGFK2wNs2pKhfnc6d8/4s4a2DwiNg1sgXlTOFCWUTnxB74mCIxsq2Wp+Bfds5ZkUX9vUUEqNun2rxInGOUieE0PnI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10512.eurprd08.prod.outlook.com (2603:10a6:800:203::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Fri, 27 Sep
 2024 16:04:21 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8026.005; Fri, 27 Sep 2024
 16:04:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	"jing.hui.tham@intel.com" <jing.hui.tham@intel.com>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.1.rc1)
Thread-Topic: [yocto] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.1.rc1)
Thread-Index: AQHbDi0zn8pKbf8w90KpgLkU3d1k4LJr0WwA
Date: Fri, 27 Sep 2024 16:04:21 +0000
Message-ID: <9A2A483B-F51A-4561-B6F4-14B7EFCDFBDF@arm.com>
References: 
 <0101019203947c20-b2528d50-bc02-4975-b808-0f39e1b8d01e-000000@us-west-2.amazonses.com>
 <DM4PR11MB77600F00575B0E88E22704A7A1682@DM4PR11MB7760.namprd11.prod.outlook.com>
In-Reply-To: 
 <DM4PR11MB77600F00575B0E88E22704A7A1682@DM4PR11MB7760.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10512:EE_|AM2PEPF0001C70F:EE_|AS8PR08MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: cead8e47-f959-4cb6-c3d4-08dcdf0e1176
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bVRjdWx2aXcrU1VXSHRtVnppMXFJWEt3dFhWbGY4UGZKQ00wWW9EbnhOVldJ?=
 =?utf-8?B?YVNSdHU3eXd1Q1hIRk5abzgrRWYrTitNbm01VzZaelNYVTE1U2tJZW5TWHJa?=
 =?utf-8?B?R3M2QmFCMHBSZXZxNkhYWUdGNGdCNXFmc215QWFhajBSQmF2QU9MY29mVWpi?=
 =?utf-8?B?WlZtRXhpVDBpbG1XWWNuQVdCOFJ4RXV6SGlvM3ptbGkxMW5rTE9KR01LZC9j?=
 =?utf-8?B?WnFveVFJNjFENGxLNDZVVThTcS9IVDNLckpuRmVsMTlpUnQ1MmVKcDdhckUz?=
 =?utf-8?B?NWlITCs4aE1TSFNnTTVvQVF5Y28wQXgyWVhCL1FHcXV2MUxhSDNBQUsyLzY2?=
 =?utf-8?B?T2U4bktFN3JqWnBXSXBRSTMvaW1SNHhueXZ5QkcyMEU5c3lNOGU3Mi9kUko3?=
 =?utf-8?B?ZHR4ZkpYYXV2L2E3TzJoTkVuWk44L1lQZTA3SUJhNXBsVFNJYXJUWWxZS20z?=
 =?utf-8?B?WmNnN01BbjNJTHFDNUtMb3NxOUcvaXBOQzdFUCsveE5sTkVwWlhaL2pMS0R2?=
 =?utf-8?B?SGNsYytjZHpaeWJHUUI4ejZNNTlCaU9lTm10T0k2cDBjMUw0cXNxQTBLeWs5?=
 =?utf-8?B?Y1QzaHlIWm0yVVhMWllrTGNoMWwxZmFMY0dYMlBzZGlIdldnREFZbFVNSUxX?=
 =?utf-8?B?UXFSRHRmcGNqYUgrRzQycGFPUjhseFlkSHJkY3IrUlBFOW1LMkVqcUcxUkxs?=
 =?utf-8?B?d2JqUGhtREhqL3plcTc2MWEwNFVwbjdGS3RHc0laa1lBN2VjTTZSVmNRek9C?=
 =?utf-8?B?Q1dScXVnS2g3STZremZaWENJeXBBVzZoQjVLTTJ4b0VodzI4ZEFCOFRJWnZq?=
 =?utf-8?B?ZFN1cFoxOXpxekZ5dVhuNnN6dkk3bGV3Y1dmOXJUdksyQUcvdmNtTVoxQnRx?=
 =?utf-8?B?Wmk5ZFh2V2hLWG8rSWUveGZkK2hWNEtJZXJtOVJ2b2R4QWJoN2wreHRyeU9n?=
 =?utf-8?B?VWVrLzZNang3ODhIZjZYUDdzOEg4ZGZtTXpFWVJOaVZRTW43eFBlYVI1RzlS?=
 =?utf-8?B?cjg4eTBqM2VpNXNWOWtvT2Rmc1preGpGKzh6KzJOUndxNTJ0SmVoMEpDUzIz?=
 =?utf-8?B?NmNSQ0ZnODNBRmIyZVFRZUZCbnZnNXFyV3I2ZEdmR29Lb3pqamltYXppSFd2?=
 =?utf-8?B?Q1ZHeEsyZ3RLaVlqeW44MkNDdk9vTjM3NlVTcnRtU2JjbUpLZkhnSVRUUC9V?=
 =?utf-8?B?RlNhMWVDV2lYcTFtdnB2Ky9pQkFvc1B5bmp2eHVoK282dkxWRSt0SXVlcDZB?=
 =?utf-8?B?SmdQMm83Sk0rTlVIMG5JZXZ1UWJvendCUUZ1aDRzTTNhYzlqQXhwMzk4SlZz?=
 =?utf-8?B?REdIdEZMQ01lZ2RqZGRMWFczcWR1NnROaHRzNjkrbmlpckNjV09XdUduSmRt?=
 =?utf-8?B?TTNXVldFRGtLL3A2NkhEOTdBVnNKS2JYdXduNmd5VDgrWXpoMkpCOHhSRGxt?=
 =?utf-8?B?bVd0VU5rd0RodFp2MW80MkluQUw3SmRQaHRNa0NMOGhsek9oRnZpUHgxT0ZU?=
 =?utf-8?B?Tk5GZTdwT1ZvemFueCtuOFZZNGRCNlFWdVZpUFZwSEhyV2NVR3RYVTVRdTc1?=
 =?utf-8?B?RmJkOWRRWndrNHJLSlMydFBES0NWMjdFUUZUbUNlR213R1htZ25INTZETnpL?=
 =?utf-8?B?SmdHOWV3aTZBY1hUZHNhc2lrckZtRktyTldrWVE4dW0xMFU3OURkTEhCU1V4?=
 =?utf-8?B?QStTUEZONFRyNUJDeUJxc0F2RDFNeTFZQ2tpeVlZYWZwd2dEeDFRMjFnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B46DE5CB96390419C2DE29C9F61E936@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10512
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2bed8806-b65c-4c4a-4e32-08dcdf0e0c7a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eUZPQ2RvR1dGMTFKdkF6MEZURVExZ3dJSG42ZnBNY1Z5VXlRSUo0cUlHWVZ4?=
 =?utf-8?B?THkvODBnUEFSOFEraU5kRVllNi92V2RIM1RMNWZyYS9ZUklFUnhXb014SkJv?=
 =?utf-8?B?dUR5OWNBS2x2MHp2Qkdma1VrN2JGSHp1ZGZtcjVKRi9Ib1RGVkpKeHZFcVBt?=
 =?utf-8?B?QWM0azk4NnhHbmJBb3B0QU1HeGNVUTEzVWpDZXVLbkJRSmh0aDJ1QVF3VTln?=
 =?utf-8?B?b1Y5dE1tb2xRSVBCWFl4NENQeSt4Q1BqYVh4WkI3UmFKK0xuVDloeERBNUcy?=
 =?utf-8?B?KzdQYU9pMjUrZ2d1K3djSklCbzdYTnpya3VYMTl1bm1QYnFXR0YzWHhJL1hn?=
 =?utf-8?B?WU9YU1hGNHBvMk02TEtoMVJ2UVVHRGdvZjVHb0EzT1VzVFFLUzgwMkVvaUxU?=
 =?utf-8?B?TUNTbmFoa0Y0QW1PNkpsM05YV3NxTVZJQittQXZITDhwWGZlbG04K0FtcmZN?=
 =?utf-8?B?QVRESlMxeW1aRFI5ZGlQL0tOdzJQT0FHY3B0aUJMTFFLL050blVQNEZ4M2FF?=
 =?utf-8?B?T0tFY3U3MFJLaUlBVnVkSzFtNEtjODNJVk5OcjdPVnhlWWhWdldpbFM2QjVC?=
 =?utf-8?B?RVBybHdjVkVaMVhWTFQ1R0lMLytlQk5DcVQ1NStaZ1RUQnlDSTBtdFRobVcr?=
 =?utf-8?B?c1NNTEtFL2FReWs2RHpNMlRuTmc4SU9TY1V2T0EzZFRMSndlTnZQQ2dKYWdD?=
 =?utf-8?B?a2FnMEdtUmlHNjJLWEp1d3ZCekpTYmVEMFlqWVp1T3k3L3UyWVFKRW4wakJx?=
 =?utf-8?B?VEVGTDZRT2UvbWQzUmxPa2J2U2YvRkwwRWs3SGs0V29UMksvelFxbzl6VXJn?=
 =?utf-8?B?VmQ0TlE3c3RuY1ZvNDFzcyswYjA5aHlocnFUMlBza20zUXRkVzdLTVBCc3lP?=
 =?utf-8?B?Ylh6SVZ4NHkxM0lWb212OVR0UTIrRFlmUy9YL2kzUXVmdzBPRXJ2TXVlNGNM?=
 =?utf-8?B?MFFCRitqbnlWNGJBU1ptY3lkY01VMDZlZm5sUk40RXpHajlHQldvS2RRenhS?=
 =?utf-8?B?YTJBdzVnYXhQeVZRa2kwc1JoQ2lIeUVHYW1LOWVKd01YbWdxbnViem83Qjc0?=
 =?utf-8?B?RFNmekx5eklIZ2lVYzdxTDk3bnRmZk9LS25GazdSNXAvOHR4NUgyanNFNTNT?=
 =?utf-8?B?QnhDNVJoZW03UGFvQnJVcm16YVlwYzBNR0dOVWtzSG5DUkZ0VkloaVNZSE9K?=
 =?utf-8?B?LzRFaHdPN01pcGEwK1hlY2VteEU5K0JRZTZzamFIaUZYTGt5RnQ0SlZBajJG?=
 =?utf-8?B?UVRrdWpCV0psTTdTbVk1Um5QRkY3SGF6SzVpcFFIQTdkWEE4N3Nob1hOYWcz?=
 =?utf-8?B?RkNmSzZnYm14Umk2YmVQYXFmOWVVMGdDVForejJWV3NPQ2RIK3ZqZFhrZWx6?=
 =?utf-8?B?b1JMUUZHTmJ5ZGVRaG00Q2kzajIvRy9COEFqdkhyYUEza25pNkszODUwa09R?=
 =?utf-8?B?b0xsYnBGQUdIUW9KcVc2VkJybGFaNGdwdlFGSk5VQUNvMzlNTXBPNVdqWnAx?=
 =?utf-8?B?T3NPTnZ0eitqa2htNWxydEpWeFJWMFZoZitqSENHMERtdkZTb3JmWXZCRHdh?=
 =?utf-8?B?bkVobStLbDNwbFpBREd3dVkzdU1Oby9QamZGcVhYcjJLQ3BSNHQ5bzM2ajZr?=
 =?utf-8?B?UWEyU0dQS2xFZmdiK3BCdUV3cnJCR05HSWxHL3RteEdwcytUdHRlWXhLSGZ6?=
 =?utf-8?B?LzJEeWlVRVJWQlN6Y2wzNDF6KzJUcFBuaXQwdmhHTzZBamN0QlpSUGp3Y0dS?=
 =?utf-8?B?TVpDYjNuOUJ5djJBK1U0NiszY2hlcmJDSUdPSExiWlUraWhjaGZDNlFaUERh?=
 =?utf-8?B?azI0L29UcTVPMWlodXpaUkNhUnJUdW9XK2NLZlBNM2t1L005YkMya2RiUlh4?=
 =?utf-8?Q?hS2Zk1waHTNVU?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 16:04:29.4675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cead8e47-f959-4cb6-c3d4-08dcdf0e1176
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 16:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205036

SGkgSmluZyBIdWksDQoNCj4gT24gMjQgU2VwIDIwMjQsIGF0IDAzOjU1LCBKaW5nIEh1aSBUaGFt
IHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxqaW5nLmh1aS50aGFtPWludGVsLmNvbUBsaXN0
cy55b2N0b3Byb2plY3Qub3JnPiB3cm90ZToNCj4gDQo+IEhpIEFsbCwNCj4gDQo+IFFBIGZvciB5
b2N0by01LjEucmMxIGlzIGNvbXBsZXRlZC4gVGhpcyBpcyB0aGUgZnVsbCByZXBvcnQgZm9yIHRo
aXMgcmVsZWFzZTogIA0KPiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5j
Z2kveW9jdG8tdGVzdHJlc3VsdHMtY29udHJpYi90cmVlLz9oPWludGVsLXlvY3RvLXRlc3RyZXN1
bHRzDQoNClRoZSAiZnVsbCByZXBvcnTigJ0gYXBwZWFycyB0byBvbmx5IGluY2x1ZGUgdGhlIHJl
YWwgbWFjaGluZXMgdGVzdGVkIGJ5IHlvdTogbm8gcWVtdSBtYWNoaW5lcywgZm9yIGV4YW1wbGUu
DQoNCklzIHRoZXJlIHN0aWxsIHRlc3Rpbmcgb25nb2luZywgb3IgZG8gdGhlIG5ldyByZXBvcnRz
IGp1c3QgbmVlZCB0byBiZSBnZW5lcmF0ZWQ/DQoNClRoYW5rcywNClJvc3M=

