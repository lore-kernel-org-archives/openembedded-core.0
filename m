Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCC8C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 07:41:33 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.110])
 by mx.groups.io with SMTP id smtpd.web11.7978.1747381293000646287
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 00:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=P+chUvGn;
 spf=pass (domain: topic.nl, ip: 40.107.247.110, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy6eJGU+QfPT6DjLj01Zem+sI+YRlP5Of5svuCbPE83HoQs8lZ5FdLAfai398eYJVQBY2frqjWt4oRMnkjwZoijzNss8WilcYJgzhYRuapVcPtMfB6ORLdx4Ayr16dzO3j/ieWNiZAjQB+1MZrePT+tpwYOHN91f9W8xWNQ/JsbNKUuUGM2nLF8bTMTG8ah632m0hX/CZhdAzL78DIFOV6d3b4VBXFkREYLhQnXnl+htovnZxGRF3TNxJRKLzDOYPawTyAd30XOJ9xYtKG/GxZgFot1z12aSWiwmdYebzdJNREPfQa2olmGo6jOE2HSSjNegMGRF6CDPLBjvXnTqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlLUjoPZg6s3aaTKT5lmSloVfGxNDT2K1SHZuVo/UUs=;
 b=Ua4gk8uzh1MLLQsNpkDAsxiAMx+xtbkqbf3tMFZcEfM39cGtSTb2U06WwqwtLMigOjY+4DWXJ4IGHDaENj3qQ2Ebb+BmBu3cHaD450jcBGjvlP76t6mz3agWVjERHusErd5sw2Hn1dMpRNUGWZMB0ss5IG4fDC8tVY80TN9Oa8wq8SJMtDI1Oltmy3uD/yrIvlqbtM9kPQ66e4T9yBIFJa++gdnjaKyDgf4phq+blHyuKnEJlZo2nYvcTwwzdWsoLG1MokFIRIGGtPWKqWC4Z/Bc+MrvIR1KhSXM5XZqwLd+kmMxc7hU5NDxfrQ3ClU59MA4PHdN3/2QaN8Vq1tpBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=agilent.com smtp.mailfrom=topic.nl; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlLUjoPZg6s3aaTKT5lmSloVfGxNDT2K1SHZuVo/UUs=;
 b=P+chUvGnqVzChv0pg5qNLgxrgcbi3JMrJOSLS+6mpTZDYUHyVOFhq5RW7RZRzDNFOS98u9HI5m/M4NvB/6oSOI3CUZAE1xnoqhJacpw2edI4WGZnvBQh+R3a/tsOzZAUn8Eidc1GgMYbwG3J8+7oPAP2KJg9EMGT7CtNwj+iG5Fg7jp74ojjV7JVTuYd8xV8d4EpqV3yWAUu+mfCIXqhQekYQ8QTt2FMeBUlGxmXx9UAKSTcjXzXVxkxEZYNknXbXu4pRGkDh1x4Xcx58JaniQljhFW11rSZXvFlgNZwYque1ATyi5KWCkbCE53ZbpkF/aRpTMat60Rxa7FdzqXElw==
Received: from DUZPR01CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::9) by AM0PR04MB7089.eurprd04.prod.outlook.com
 (2603:10a6:208:1a1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 07:41:09 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::ac) by DUZPR01CA0049.outlook.office365.com
 (2603:10a6:10:469::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.24 via Frontend Transport; Fri,
 16 May 2025 07:41:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Fri, 16 May 2025 07:41:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.170) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 16 May 2025 07:41:08 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from DU2PR04MB8645.eurprd04.prod.outlook.com (2603:10a6:10:2dc::21)
 by PA4PR04MB7535.eurprd04.prod.outlook.com (2603:10a6:102:e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 07:41:00 +0000
Received: from DU2PR04MB8645.eurprd04.prod.outlook.com
 ([fe80::4789:86b:b7cd:c965]) by DU2PR04MB8645.eurprd04.prod.outlook.com
 ([fe80::4789:86b:b7cd:c965%3]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 07:41:00 +0000
Message-ID: <26448d04-7b7b-41b4-9998-b54094921975@topic.nl>
Date: Fri, 16 May 2025 09:40:59 +0200
User-Agent: Mozilla Thunderbird
From: "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>
Subject: Re: [OE-core] kernel-module dependency mystery
To: chris.laplante@agilent.com, Max <max.oss.09@gmail.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <5a9b30f0-c189-4841-9821-6dc26de4de84@topic.nl>
 <bde7ccac49b5417cda5c964055f72e28a3bc84be.camel@gmail.com>
 <b88d7c9d-5f69-4104-864d-b66f2d20a1fa@topic.nl>
 <DM8PR12MB543067EC42BD9FAC5101B6DA8B95A@DM8PR12MB5430.namprd12.prod.outlook.com>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <DM8PR12MB543067EC42BD9FAC5101B6DA8B95A@DM8PR12MB5430.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR03CA0083.eurprd03.prod.outlook.com
 (2603:10a6:208:69::24) To DU2PR04MB8645.eurprd04.prod.outlook.com
 (2603:10a6:10:2dc::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	DU2PR04MB8645:EE_|PA4PR04MB7535:EE_|DU6PEPF0000A7DE:EE_|AM0PR04MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a11ec4d-3e73-480e-5652-08dd944d0617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ckdEak85R3hQZjdQT0JFMXAwNmYxOEdFRVRmS2liWFNtUnY0SHhLeEZNWDVN?=
 =?utf-8?B?czhYTk50WGVjY3hqamdIbU1xQkQzN0lMdkNyQ1VSZ0h5MXdkYkNoSm1mLzA2?=
 =?utf-8?B?K3plS3ltd3lWVnAzQ0paZ2xDd3pTSG9IZjZmWndobTNqUHpmNXJyemVLTEow?=
 =?utf-8?B?eWx6RVVVN1JlaEVXNmhrSS9wbktpZWV4YllNRDRXRU1scWlTR05QTkhDMmVT?=
 =?utf-8?B?dkJud1FqTHpTSmV2UmlYdnZEcTlpNXp1RFdBdHl3djRHZjlsNjRZS3V3RFAw?=
 =?utf-8?B?OXp6SzVsUjluZHI5ZU1SS0xKQU5seXV2eTBkanNBUlI0NVhEOG85RENvM0oz?=
 =?utf-8?B?UVB3Tit2QStLYnpVL3o0NDZBTDc3cm5oNDA2cnR2R2x5bGxvemZOQVZlNkJP?=
 =?utf-8?B?ZWI4VStINytaMXREb3lTNWJ5S0hvblpzZThCQURFNzdMT281Zk5kV2pPV09G?=
 =?utf-8?B?WXhSSnNEQzlhRENnSTEzUENLN0p2cnZOYW1YVDdkWU05dTJxS2Y4d0U5b2dC?=
 =?utf-8?B?OVlNRllkYS9iTGlUcm14Vmh4R1g1Wk9vVnJYNkgveWx4T2JwTk81QSttMCtW?=
 =?utf-8?B?ZTdUOEk2Wis2UG1KREpMSDBScjdLdWFNUTRleHpaQlQzOTZ1T0E3cnV0TWly?=
 =?utf-8?B?dktGTDVZTHYxOFlXa0tqNHhxcWhtbEJ5SGZSN1U3L0hkK29mM3dINjNZVDh6?=
 =?utf-8?B?ck9qRmIyUm5VL1V4Q1liSkZXaytidFNOVERSYlRVRU56WXdrZlBsd29mcDQ2?=
 =?utf-8?B?Wk5land6SmtoQTBNcFA3WlErODFRSk00bit2cWdOMWNMY1FuVmo0Z0EyZ0lj?=
 =?utf-8?B?RERVeUUreEJ2YTZidHR3R290cGhzYlBVU3JXTnZCeThSK1pYa212a3gwK1lz?=
 =?utf-8?B?eTBsU0N5eG04ZVVCVE94dG9DOFltWjFtMU9JVnNWVVVnTnZHTWZROTV3MFFU?=
 =?utf-8?B?OWhRL1ZndWFoek5jUTZJNjUrbHo4NlFHOHFQblJQOTdIeE9sdzkxSU41Tldz?=
 =?utf-8?B?ZDltczNIRWxsRkpuWnpKVVJDWmQ1aGNJd3hqNTRqcHFpUHl0b0k4TzNwVVFJ?=
 =?utf-8?B?elRTQzVULzhpZlBNc25qWVFqL3JBdU92VVJBMzIrR0x5aHhJWEtndTBzd1ln?=
 =?utf-8?B?ek9vNU9HZmxPVG9OUjgyREN1aGd2ODJvU050LzZ3SUpkamluMjh6ckx3V3lG?=
 =?utf-8?B?VXJVUUQ5TjBjeTI3R3hmM0RnVW5wZGc4MGt5WmcybEdFOXJrRTYwcjdBRE9p?=
 =?utf-8?B?a2NOSGt6ZWZjSTRuc29PSjNQWUtheEFLMWpIWlJBaG82WU9IbXN0TjVUTkRP?=
 =?utf-8?B?VFVUaWszY2FRRUhlOFZnU2tDb0xPajVHQ1MybWlIdTd4VGZCZTh6UlUzWkdK?=
 =?utf-8?B?cW1kdXZGSjB1eFArblFjbUlSVzZub0RxYWVIUTJnOTdCWjVHRlZiMmdSYk1K?=
 =?utf-8?B?WTI3ZVhNblBQR013L2w0c1BTQjV3cml5Qk5kL29yc2NFbTBlWFRGMnpvTTEw?=
 =?utf-8?B?V0g5MjJIWUxRbjZFNDN6dFk3ZjloaW9iU3JsVXJiRENpVEZzVnMyamk1WjlJ?=
 =?utf-8?B?ZEpNUkordnllT3EyZHZiVlU2SnZvYmRySDdFN0dpemZhbThIYTNSWUE0RDR1?=
 =?utf-8?B?UGZRdlhzM0lkZ1VSTXMyT3VCZE9JUkprSVhyRTE5QWV3T296ZmVib3ROTW95?=
 =?utf-8?B?NnBtQTRhcGQxVVJDNEJUT2FwNnhqdnlQL05LZnJucHRSRG9lYjFRaFBTd0Vm?=
 =?utf-8?B?b2xiRDd0MmZtKzh1L2g0dndWbmk3QVpzK1RySUF5Tm9VeCtXWDg0YUtSUDdr?=
 =?utf-8?Q?Zv9pIF089Ai+qYFfIoNHAULEeg8PK1CG3wXwE=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8645.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7535
X-CodeTwo-MessageID: 577b1347-b03f-4a4b-bd64-82545849bc79.20250516074108@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8769f133-8c99-4328-4c27-08dd944d0092
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|376014|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d0ZDWFNoTGJqSmN5OXl4czBmRVhaTDB5S0VNTW5vWGFCbzFtM0ZFa1F5c1VL?=
 =?utf-8?B?QXExTmZWNjQ2UHExODZSekNlZzBEM0ZDeTUrYmZaMFJrMHpKcGtyclhMMlhI?=
 =?utf-8?B?NDBPSVRRNmg3T2tHVVNxcUcyUFdTdEw0aUUxL2xjMmtxb25TWFltQVNnTXdX?=
 =?utf-8?B?MldQRVpKTVRxVnJod1hHa2ZRZG1za3E2UE9FcGVodVRUcWJIaEFIL3BtYm00?=
 =?utf-8?B?Q09qeWswRi9ZQy9qMlRSYnF4YTJkU0VOSHBlWmpvR2RrUkp4VEpGTVZxV0lp?=
 =?utf-8?B?VEhGQ1BDMStSVVF2Z0VRZjRaazREek5uMW9tUnFDbG5PVjVwVXdPL2RiNlFJ?=
 =?utf-8?B?cnRnaUQ1QlBRdWI2ejJQbTlleUw1Q25yaE5aWWdzUGsxYlpCdFdRdkxXTVNy?=
 =?utf-8?B?eWVsTkZwWkp1eG5sa0U1ZTdOSFNqb01GcTc1bVdJVmZhRjZ1OG9uaFFwYXI5?=
 =?utf-8?B?T1NRYkNZUHdKaUpwTy8vUHZZcTQxYnFzWVV0cU5VVVZ2SDA3eGJEN1creXJB?=
 =?utf-8?B?akJxQ0JnMFNDa3R2WUY1MVhPUXBGTkVVVzVlZ2c0NDZWNzBWTmUyVWVnUGsx?=
 =?utf-8?B?NCtmWWxqSnJ3aDV3bWFNWVNrMXpwL0gxaDRJUW14Qlp0WHo4YkltUXRiMnlU?=
 =?utf-8?B?cFlDWmVzUmJQMkc4b1VCSVFjNllIQmVzMmVTUWljK1Z0dk8rd1p5VFFZcUlk?=
 =?utf-8?B?cExjM2VRcmM1N1NrSktsYmhNSlZaWjFUcG82QlFMMjhMdjNSK3pjOWJDMnlG?=
 =?utf-8?B?VGZUVkJMRGM3S0pFaWFoWlFDWjdTL3NxWGcvbklYaXhtSVZiY3dYaFc5NjBt?=
 =?utf-8?B?TTVxTnEzSUJhd3dTWEExWjZEcVR6STJUcERJenRJeE5uc05DcnBVQ2lnWG1G?=
 =?utf-8?B?b3g1MmlXOE8zOEFBc1d4UkVyNThkSW1kVTR1dnIxM2Z2bDZQdkF1VDMvSzhG?=
 =?utf-8?B?M0Q2Rk83SHpETkZBUmdYNUUzSEtNSnFOZGtncVJ6VXcySFNTbGU0dEp6MUhO?=
 =?utf-8?B?M1JSSHRXZm44a0orcTMrNE1KcEkvY2hYS1RPK3hiSEZ1eVVrcmNIUFQvU0Rj?=
 =?utf-8?B?Z3hLT29PblZQWlZHdkV3c1dSRTAxaUR2LzRpamVyRmNTdm5RWkhMZVdOTTlv?=
 =?utf-8?B?Y05keTViU2Y4b2dOMTZ3TDE2Y1VpY3hzVjQzb0VyNnpnSWZvUXpWTUJPdEp1?=
 =?utf-8?B?UjJXNmwwSmJ4eENWTDJabyszWjNQSGVUcUwzZmU5cStxV1BESEJjY0dXYW82?=
 =?utf-8?B?aFJlanVQVTRMV0xCYVdqV0hkOVlQeUxwRWZqU1RwTGV6ZFF5bVlteEE5ZzRp?=
 =?utf-8?B?SGR2MWo3b3hEbmU0VE82TkJtUjRUL09ONHEvdlRkYTdaSHlGcVlpalNqZ3V6?=
 =?utf-8?B?dU9wMUUwS3o4TnQ0bTRBOXZXTnZYeU0wUUxFYU1wY2JlbmZlK1VqcTdxTmI2?=
 =?utf-8?B?K0VQS0xjSUlkRUhDOUVWN3QyUW54WlpUSkN1TzNCNFNwaHhiVGNDZXFoQ0dm?=
 =?utf-8?B?eEFtLy8xYVBQcTUrSUlrRzU1NmVObHB0WnN4VW9BMS93TG1zMy9pOWNrV3Jv?=
 =?utf-8?B?bHExUGhHaE1PdTJmYm5hdTFzdFg0Y1R6Vmt6aEpydENUQUlRbjVrdzFKaGNP?=
 =?utf-8?B?VDFTb3FLcWZ6Rk1rKzEwZHduclcrM1BMZ29HUTlwcjFacWppNHRrUXVIMXcr?=
 =?utf-8?B?akxZQk5rWWgyUHFHU09UT1NQQkkrYUUyQ2xFcDNTZVZId0ZScXNCQXRoMTdE?=
 =?utf-8?B?c1hPc0R0M29FMzJrdGNpWEtST002MkhRMnAweExobW1qdnZIUWNMVFJzNjdK?=
 =?utf-8?B?V2pLTG1LaytJMzh1M2xvd1U0MkRXdzZ6QUFsSTFYTWRuV0w2YXA3YmJvVVly?=
 =?utf-8?B?YzFJeWRNRkU5cFhsVmVwY2xvOGMydWRnb2E0dTBmQjJiTTFEMEhMaGlieGx4?=
 =?utf-8?B?Y0hHeldjT2FCaSsxTGhNcGN6S25rLzhwVVlPS0Z2Zm5OMW5GZlhUdFF3Z2hZ?=
 =?utf-8?B?ejNjZXNKNXR3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(376014)(36860700013)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 07:41:09.0442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a11ec4d-3e73-480e-5652-08dd944d0617
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 07:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216722

On 10-05-2025 04:54, Chris Laplante via lists.openembedded.org wrote:
> Hi all,
>
>> That sounds plausible, and explains why only one failed (kernel happened=
 to be
>> in sstate-cache). I'll check the LOCALVERSION_AUTO value...
>>
>>
>>>> I'm on "scarthgap" branch.
>>>>
>>>> The "kernel-module-dyplo" recipe can be found here:
>>>>
>>>> https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t
>>>> hub.com%2Ftopic-embedded-products%2Fmeta-
>> dyplo%2Fblob%2Fmaster%2Freci
>>>> pes-dyplo%2Fdyplo-core%2Fkernel-module-
>> dyplo.bb&data=3D05%7C02%7Cchris.
>> laplante%40agilent.com%7Cbf3eb36f3f9a44d9396508dd84003587%7Ca9c0bc0
>> 98
>> b46420693512ba12fb4a5c0%7C0%7C0%7C638811858640678798%7CUnknown
>> %7CTWFp
>> bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMi
>> IsI
>> kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DhrrWwDxGA0CV
>> IlUcjc
>>>> JZmfoxWy7KNScoECmYpJbP7ck%3D&reserved=3D0
>>>>
>>>> The isue at first glance appears to be that
>>>> "kernel-6.6.40-xilinx-g6a2cb0f14db5" mixes the git version hash from
>>>> the module itself and the git hash of the kernel. There's no such
>>>> package, it should have been "kernel-6.6.40-xilinx-gd7b52381656b"
> Just wanted to drop a link to this Bugzilla because it seems relevant: ht=
tps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14885

Does seem relevant indeed.

I tried adding DEPENDS +=3D "virtual/kernel" in the kernel module recipe, b=
ut=20
still got the same error.

Disabling LOCALVERSION_AUTO in the kernel config made the problem go away.


After changing the kernel, the (external) modules should (also) be rebuilt,=
=20
that makes sense to me. Even regardless of this dependency issue...

M.





