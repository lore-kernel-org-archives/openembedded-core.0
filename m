Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022E1C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 10:03:30 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.129])
 by mx.groups.io with SMTP id smtpd.web11.12360.1716545002741011012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 03:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=NbxhN5SN;
 spf=pass (domain: topic.nl, ip: 40.107.20.129, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/MZU2QZWd/6NFAW/FKJyzgWOWNNJ0tltGWBzfBomhnM1/iSjhiMxvjfiz1ErYm2SB1ElocZcZ02RrXJsdTMYsO4byQbthZfjKJxeXM94zlTH433PsXfK3k5lJroob7a4qNrMSeu1tqjPIxEedGD4jDkcs8wNNzfHUM3oVh2LHVB8npIvyHMhil7rXb7kAhwWG65wgBnd+pfUM9K+ywot3AxnDs0DF9ClKg8KBctMEEE3C98qSU0EzNOnuG6iq4kQDUlUM67iMdIUCtKYiWLnY7cLJ8qSCPWjj4OmrUvsFA0ORGqP1ukxrPvVxXz6Cb845xGcc80ZHSRj+xr09Zn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYti5OVUT8GPvF6CbmehoagfNlOwULv5L4/gH+8yuik=;
 b=SnDYZ5XqVXMF+zcNB0N8rkTb3GlqkSCHdvZToJA4RtfzXMP+HfSZ7nc6O45cRb5wifotdwCw6whogPk2V9VRlsef6pDtQL8e0+Ljk5FY/ficpwh7g108Wi9UbijfUTb8WXWV01aNY8WBlai9Y1YIJDW5OU++jDPkQHV+Jn657DlzBWHXsuTvEDUe0Yhq/ZVw9+ipt6iWWLq/wpRzjnp53fkMK6iuTEeIeFbrhIkHySlOBGUejA/O2+lRAjpRAHWd1iveRVzOdUTcJDwXsUtxJ1Upj4/npWPLAoIxOpnsnl4IvKQBzfvS+1X4dszGTKvp4f9aIN1u++rEVOEv2cgnlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=cherry.de smtp.mailfrom=topic.nl; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=topic.nl; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYti5OVUT8GPvF6CbmehoagfNlOwULv5L4/gH+8yuik=;
 b=NbxhN5SNIhsbPGnQvcA06d2LSZvIaGLTWzeHf8lq7VUb4RFWuY5JcuqV3n2UbZxLagxmguBND0aM1g8RTMjfF4SVWgoQdI9SwJ2DEnOlMtPBDyR+husHHNN+2QV6Am5NAulDYKhOOlobcPbliT07HFb0r2e3vxNXeWymy9zyftBWhE4eADJ85+rJdaGBhg4vuMbniismAD2G3eIG9eShJSamPdX7XO9iLI6LCCucE1ti4mqyE6OKhiMSbB7ht62cqhIOE781kM449C0ECt5mwVnlQMivnq1RDwuP0fOx4xnm03GrVsJHd+oy9p509V1CNZF5ajvv6J26Gvi69Af7Jg==
Received: from DU2PR04CA0307.eurprd04.prod.outlook.com (2603:10a6:10:2b5::12)
 by AS8PR04MB8996.eurprd04.prod.outlook.com (2603:10a6:20b:42f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 10:03:18 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::93) by DU2PR04CA0307.outlook.office365.com
 (2603:10a6:10:2b5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Fri, 24 May 2024 10:03:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 10:03:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.168) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 24 May 2024 10:03:16 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AM8PR04MB7410.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 24 May
 2024 10:03:12 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%6]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 10:03:11 +0000
Message-ID: <b9f98c63-e363-4f67-a7a0-448342a23466@topic.nl>
Date: Fri, 24 May 2024 12:03:09 +0200
User-Agent: Mozilla Thunderbird
From: <mike.looijmans@topic.nl>
Subject: Re: [OE-core] [PATCH] meta: uboot-config: Fix broken menuconfig for
 "fitImage" kernel
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.cc544a93-e646-4932-8496-82717a21cde8@emailsignatures365.codetwo.com>
 <20240521135705.444470-1-mike.looijmans@topic.nl>
 <5340825db3c98197e448c58b88381562edbed66f.camel@linuxfoundation.org>
 <023cbca2-b5e4-420c-b109-445d7d8480a4@topic.nl>
 <5354eeca5b37a4fd3de0f9afec23ccc834f993a8.camel@linuxfoundation.org>
 <802ee008-2325-42a0-be6d-a2d0ebbea050@topic.nl>
 <da23b251-8a2e-4bf1-8c96-812593f52d96@cherry.de>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <da23b251-8a2e-4bf1-8c96-812593f52d96@cherry.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::6) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|AM8PR04MB7410:EE_|DU2PEPF00028D01:EE_|AS8PR04MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: 915218b6-6279-41c5-4dbf-08dc7bd8bba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Y0tEalFBTEdQKzc2WExsVERhNFNPdjVZQldEYVowQ3BjbVpoSXBFY0Y3bHJp?=
 =?utf-8?B?aENkcStmRTM0YXVKblRiQnJWc3pYR3JTSHVqZkRxMDF6QlV2R3JPNktxUHRM?=
 =?utf-8?B?ekdxZTYyVTJwNHJCcEhZV01YWFZ4b3J0WmxiSUVRd2hJZ0dCQXM3UmphZDJ4?=
 =?utf-8?B?VGtYZWxoUjhjK0NRdWRSUW12Y2tIb2M4M01pRWh3Q2hWUjlnZFA4MWpkaTN6?=
 =?utf-8?B?dExhaElNS0FLQ3J1ZitQQmRvWkRQNkFNWEpzUnZOOUUwT09qa3dibng4T1VU?=
 =?utf-8?B?N3FSUm4xT2RQcGIyMUM4c3dycFVVQ1dFREYxM3FibjV2K2hWaXFZL1R3em9Y?=
 =?utf-8?B?Um9uaHBraTFYdFMxdlNjSHpsTVJDQkpTaUl6K09FUkJoS2JzY0lmSTRUaXVF?=
 =?utf-8?B?bVRxM3dZclZPZTE0QWozRzQ3QTVyQUJZc1puS0hWRTNkR0hYMGs4Tmlvb3hH?=
 =?utf-8?B?WnM2SEdVRjE4aEJoN2pNOG14VGhDMzdIQzNESlpSSmF6ODRlb0lwQzlQd0ZC?=
 =?utf-8?B?S25XeERObmd5alRFWDVwTW04SUZ2OTAxcCtESVBFVURERHNPckU4RUpCWWll?=
 =?utf-8?B?M1FNRkhTVjlaU1RzR1p3S0wrMGJkWm00ZDRkcGE4a0sxRFdKdTRrVks4OTlh?=
 =?utf-8?B?NGd6VDVCeklQdkI4NHZnZFEwMWZWbGxZemY2aHk1MndMZGx3YzJUZVp0cXQ1?=
 =?utf-8?B?OTliWkdnSnNMbFJ2bHFjUEZ1QzMxOEJ3dUswN0haZ0ZScFFnOTNPK3hMZUR1?=
 =?utf-8?B?WlFoNHNDNHI2S0dua1Q2eXpsNEFETnQzZzNOa1FUbkI3L3UrWjNGQVR6QVNY?=
 =?utf-8?B?VkhrcmNXUzNkVGdUcFRDWUxxZFcrR3FTM1lMYjcxY2RpSGlqemxBWlgzUHhx?=
 =?utf-8?B?bTBNWGZTTTVJNjBpU3pZUytzUmxZTVpSbkc3VjdrbVdrVGx3R2VmbmwvUlFq?=
 =?utf-8?B?bzJwcy9aZGRySkx6eTRwa3VVS3pienV5RnFkc0dKbE54eG1uTGp4OFVtNTIx?=
 =?utf-8?B?YjFDeHRnajRaZGRIYkovQlljSFNJZTRvcm1Pd1JOWERFU0JtV2x6cHhTYU9J?=
 =?utf-8?B?OFQvMkJxTmRydW80ODE0ZVlNK013TVVOZ2U5WGJCUHJEMk1aS1ExZkxHK1J4?=
 =?utf-8?B?WkdnaFgrNFNDUTJVSWdqZmpBd3NRSkY3UkhoMU5DcHFxMmd0ZzlickRrYkpR?=
 =?utf-8?B?MVlUN2JsYm9IN3M4N1lEV3lNcFJjQ3RseEoxa2FIanByZTIzNDczaUR0WFZV?=
 =?utf-8?B?TVJzVWVPTW1wcWlvcnNZQllIWE9hNjhzMXBQN3ZsamhLcGRDYU1ibEtpaGs0?=
 =?utf-8?B?d2JPU2VveXczN2FhRTdJbzNNc0VKY2drMmxIWFNjOXVYUTkyK2ZJOGxwUzB1?=
 =?utf-8?B?WTZCaUZiN3lpWlRKVi9MK0tjcGFYVTN2Um5ONDg2d1NUU01mVG1OSWVsK3Q0?=
 =?utf-8?B?UUlXeE5tNTZudlgvSUNGS0dPTWhySjNGWkorSzd5TE1DWG1kd3JHc1A5QUgz?=
 =?utf-8?B?N1RBSE1zdXhaZG1Bdk4zUXZ0SzhxOWFUZzJaR1h1NUtIeEp6Y3g3TUUxVjNK?=
 =?utf-8?B?UGRFUk5jTUVjSTEwblZ6bkNDeWdQRFBOR1NiR2ZVRVJRTjc5Vm96ZmFEYm1n?=
 =?utf-8?B?MzYyOWhvLzVHV0Y0UDhORFR2a0xwbnhLZWNrVlRTT1BQVXdKeE9uVmhrbFZl?=
 =?utf-8?B?dUI1emNNU0JFK3hQV2FlckRicEpKaW5iT0l2UER0NW1XLzRRalJlTC9nPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7410
X-CodeTwo-MessageID: 030137d4-9f43-40d3-9bdb-5e0edacb4d00.20240524100316@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	914c9035-bed5-4896-f802-08dc7bd8b7d8
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|1800799015|376005|35042699013|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Vmpod2pDd1B0ZmlzNmJGMFBVN3hjYTc3cWowdE96MlhKR29Qb0thNUswOFI5?=
 =?utf-8?B?am13OWZiZ3lHdWZLUlptSVkrcnRvTlZ5Qys1dEk2MU1mSVpMaVpqRHBaQmQ4?=
 =?utf-8?B?ZzU0M2l1K0ZZd1RLbTVrZ1Z0cm9aaythZThkWHNabXA2eCtFSFpBM1NlM0VN?=
 =?utf-8?B?YldFZWQvYUttSUhhREg2TzFuT00vd3IxV2Vjbzg1WE9icHErR0ZSYUpLNEd3?=
 =?utf-8?B?K2JkRE5qMGlMNkgreHVrNUk2VllOQWRERzFnaG5qN1hEZFh6VlFrRml0bGt3?=
 =?utf-8?B?dHQ4anVMWmU2NSthRERqNDJHR0dxbzlzK2RFdEVnSU1vODJnUXJrZmc2U1c3?=
 =?utf-8?B?aWt6ekRXbUtsbVdDMXNnUzZGZThEeEhyRm5vMTNxanFHWnFELzZuWXF4b0wv?=
 =?utf-8?B?QzdEZkgzM2ZXODFOREVENTR0QitEMy9MSXZ4TTRjRVp0OHVwaFoydVlwbFls?=
 =?utf-8?B?RkNPZWNBODlWTHh4dFBhbGFFSlZZRDVGQldYMUJ2OXl3SjgyUGRHSmZzVHg4?=
 =?utf-8?B?SjU1cVZhL2k4bkxYYVdIL3FTVlR0M2VOSXZ4RCs3NDRuQjFjYlEzS2pmTXFQ?=
 =?utf-8?B?RXVFMXRVNlJUSExpcUltNk5sZHRrYm9sdEhicld4ejVxVGhHbkRpbGw1ditq?=
 =?utf-8?B?VUEvekk0YlFnMjlId0RGSXFuYlBMTGFiK2ZacWZWTTFLTUE0aTU1RG9QV2F2?=
 =?utf-8?B?Q0ozUDFGUVNMTGZOQ2RuT1lQZnM1S0l1dWhlS0pEU2lxMHA1TEc1SDNpZEhJ?=
 =?utf-8?B?NlQrdmo5YVVjS29RWnE5Z1ZWaWZtSFpMeHVzRzNFOVgzSHZNQXRyRWlpdXh5?=
 =?utf-8?B?RFg5YXZiSWkrdkswS1NxUGVHblZrdCtoUFpOWjl1NjE4dmphazJOK0pFSGI1?=
 =?utf-8?B?dmpNM2ptR2pZSTZlMjN3Q2wwS3gwSVgzT0YycUIvL2x4QktwdHhwaGtIcWo0?=
 =?utf-8?B?cnZHckxsQStiUThybk84VGxTRkRRYnA1UU9OSnIxVGpCenBBTXhLRm9vR3RG?=
 =?utf-8?B?RHFDTStqWkJxcFVjYVdST1BJU0dxbXdsQll2MjdiTVptN0FPS3dYSDlvejJi?=
 =?utf-8?B?NEhSaGxYUXQ5YjdjTHJzeG5scHkzb0gzRzdrMG4xc1ZGTHpya1p6eE9YZmk0?=
 =?utf-8?B?aGpVaFJvZmVEMkVxWEZMVE01NDE5Z3BtaURTcXlPK0p4dHpDUXpMWHZOVmx5?=
 =?utf-8?B?aEhQM1BjT09kRkk2dVY5TWJXWEdLTGFvNk1icXc0NGc4dUE5T2RSTHFKRTdE?=
 =?utf-8?B?ZGJnZzV0Nmt2R2pBZkp0bW9hSnduNUdud05wcmJSVmNBZ2I2Y2ZvWS84NTZC?=
 =?utf-8?B?R1dMVTdEbXc2bFE4bzY3YUNReU1ObnVJbU5XcTlEdC9jZTU5VWxsZmxQSUYw?=
 =?utf-8?B?WCthVW9BbHphQlBFaTRkQTg2NTJLNkdlMHg0Vy9KYU50bjhjME5TdjdBay9T?=
 =?utf-8?B?b0RZeG5nWCtyYVpHY0I4SSsxN1JpWVhNeEwrYkE1K3JiUWV6VHZ0anV6dW1r?=
 =?utf-8?B?bnoyVlo5QW5CVXJHQW1YRHdtbGZGYmVPbVZra204aTdZMElBZmg5cXpQTXk4?=
 =?utf-8?B?bUp0b293Yndab1hPK1k1dytyaWZlREFvWjZmQ2JVN1Vyc210aG5WTit3RC9a?=
 =?utf-8?B?ZUxnTUl3c1VzR01QUzVjQkhCWUwzZ0FtM1dUTjdqSFMyNXZqTW01YUp2cyto?=
 =?utf-8?B?akhFcU1zaVQ2VDZVVi9zSGFBcTl0TUJUcDNrMVZIeXd6R0c3RnBYUTBnbnV1?=
 =?utf-8?Q?Q2+jcUqEhtKJ1O2WYGF/dFfaGRvMBhZm8gz28SY?=
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(35042699013)(82310400017);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 10:03:16.9827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 915218b6-6279-41c5-4dbf-08dc7bd8bba0
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8996
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 10:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199835


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 23-05-2024 15:43, Quentin Schulz wrote:
> Hi Mike,
>=20
> On 5/22/24 8:43 AM, Mike Looijmans via lists.openembedded.org wrote:
>> On 22-05-2024 07:39, Richard Purdie wrote:
>>> On Wed, 2024-05-22 at 07:28 +0200, mike.looijmans@topic.nl wrote:
>>>> On 21-05-2024 16:51, Richard Purdie wrote:
>>>>> On Tue, 2024-05-21 at 15:57 +0200, Mike Looijmans via
>>>>> lists.openembedded.org wrote:
>>>>>> kernel-fitimage inherited uboot-config, which resulted in failure
>>>>>> to
>>>>>> run "menuconfig" on a system that has both multiple u-boot
>>>>>> configs and
>>>>>> wants a fitImage kernel.
>>>>>>
>>>>>> Fix the issue by splitting up uboot-config into uboot-config-vars
>>>>>> that
>>>>>> only contains the "harmless" variable settings, and inherit that
>>>>>> in a
>>>>>> new uboot-config class which contains the Python code to do the
>>>>>> U-boot
>>>>>> specific settings. Inherit only uboot-config-vars in kernel-
>>>>>> fitimage
>>>>>> so that it has what it needs but doesn't break.
>>>>>>
>>>>>> Fixes: f9e834e31788 "meta: introduce
>>>>>> KCONFIG_CONFIG_ENABLE_MENUCONFIG"
>>>>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>>>>> ---
>>>>>> =C2=A0=C2=A0=C2=A0meta/classes-recipe/kernel-fitimage.bbclass=C2=A0=
=C2=A0 |=C2=A0 2 +-
>>>>>> =C2=A0=C2=A0=C2=A0meta/classes-recipe/uboot-config-vars.bbclass | 95
>>>>>> +++++++++++++++++++
>>>>>> =C2=A0=C2=A0=C2=A0meta/classes-recipe/uboot-config.bbclass=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 80 +-----------
>>>>>> ----
>>>>>> =C2=A0=C2=A0=C2=A03 files changed, 97 insertions(+), 80 deletions(-)
>>>>>> =C2=A0=C2=A0=C2=A0create mode 100644 meta/classes-recipe/uboot-confi=
g-
>>>>>> vars.bbclass
>>>>>
>>>>> This looks like it might be a good candidate to move to a file in
>>>>> meta/conf rather than a new class file?
>>>>
>>>> What does "this" refer to exactly?
>>>
>>> The variable definitions you're placing into a separate class file. I'm
>>> saying they look more suited to a shared conf file, which is a
>>> direction I think the project needs to move in generally.
>>
>> a "uboot.conf" then, okay.
>>
>=20
> I was about to comment on the v2 that this should rather be a class :) Do=
 we=20
> have some information on how/why this is the direction the project should=
 move=20
> towards? What are the pitfalls we're trying to avoid, or benefits we want=
 to=20
> gain? Or is this just some better/best practice we want to go for?

I'm neutral in this - all I really care about is solving the underlying iss=
ue=20
of not being able to run menuconfig for my board.

>=20
> On a slightly different topic, I've been bothered by KERNEL_DEVICETREE be=
ing=20
> defined both in machine conf files and kernel recipes (in my own BSP laye=
r,=20
> I'm not saying I'm doing things right :) ). I did this because I wanted t=
o=20
> make a switch between kernel recipes as easy as possible while having som=
e=20
> kind of common DTB in the machine conf file (e.g. upstream doesn't have a=
ll=20
> our Device Trees/Device Tree Overlays yet, sometimes the names slightly c=
hange=20
> between recipes...). If everything was in machine conf file,=20
> PREFERRED_PROVIDER_virtual/kernel/PREFERRED_VERSION_virtual/kernel would =
be=20
> only a part of the switch). Also, I use KERNEL_DEVICETREE in the machine =
conf=20
> file because I need to extract the default device tree to do some logic o=
n it=20
> (namely, modify U-Boot at build time so those half broken ancient vendor=
=20
> U-Boot could boot my image). Not sure this is relevant, but had it in my =
mind=20
> so just putting it out there.

Rather unrelated yeah. To me "KERNEL_DEVICETREE" has always meant "please a=
lso=20
compile this dts from the kernel sources" and nothing more than that.

The devicetree that ends up on my boards is often something else entirely, =
and=20
often u-boot and kernel don't get the same devicetree anyway.


>=20
>>>
>>>> Note that this patch just moves code, it doesn't introduce anything
>>>> new.
>>>>
>>>>> We could add any functions needed to lib/oe/ if they can be made
>>>>> suitably generic.
>>>>
>>>> What "functions" would that be?
>>>
>>> removesuffix is the one I saw that was needed in the new class file and
>>> wouldn't work in a conf file.
>>
>> Interestingly, "removesuffix" is a built-in Python function since 3.8:
>>
>> =C2=A0>>> 'hello.all'.removesuffix('.all')
>> 'hello'
>>
>> And 3.8 is the minimum required version for Yocto anyway.
>>
>=20
> If we need to backport this to earlier releases, 3.8 might not be the min=
imum=20
> supported version of Python anymore, making this harder to backport.

It won't be backported far as the commit that broke it is also pretty recen=
t,=20
it think it's in nanbield.



