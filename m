Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532BDC04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 11:30:02 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.126])
 by mx.groups.io with SMTP id smtpd.web10.9809.1715167794845579720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 04:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=TsMgm/f2;
 dkim=fail reason="dkim: body hash did not verify" header.i=@topic.nl header.s=selector2 header.b=zUnQYrfm;
 spf=pass (domain: topic.nl, ip: 40.107.21.126, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=nq2NXvWAYr58B5rKWO2r08aZBk7A0h4imWr/E01lUrD7f/SgA5ItTCA6VEtvorOMXoQ3yUTrJv6FS2doXprFZ1But3FjGlSY59iXZD67rF/ARvkTd30auXW4ZLn8yUhzlEwKG7o7O1EtfSkpEO0Xj1oFM0uFKicYFtXA2e6ZpmISes7MQOUdHsxWphFY1PtcgpWHR133t6dHau7lF6MxtMOoKd2dlPG99xorr428bnXkvHVBYMPN3O9ddUv8uhElbtQMrdAW08xTA9gnCVqKJo8+RARKi7YD8N+MNqf9tVmrB4isQ78WYfGa0wOQ6aGqGY7328yGkW3P1Qz5vjgPow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mhu8L+b9DU69uq8zdZShuu/Iq7qDyQTzZdguX6jKH6U=;
 b=lld06Aeyg3F89K58MGig0QFTA/fb2rhW8tloJtNkXTPcb9A+ZUd2125F/vV/SdfOGosgXndwFoQQCzJHndnz2yw7wvp/3uezPs8y7E9ID+Bn9XPMJHQPC2czgLcPdn/yVXGxJAC3HTSRMUKS1LcIhwiuI9k9z8QReXZhLckYieiEvz960C+vepENdm+FuP0RE8EbesXe2XkGrOrYwPtwryiDSk9osc7Z9wHFPLw2iXH5tKbvnYhpczQhnbM6EnvGol3zLNV8PetBPXKJUbBu0U3/pXwxgVyrGn/MBQo6v45+0pBKYrYdt72nL38AkkkPvlQxtuq2BsOSNutpuHjTGQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.69.19.60) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=fail (signature did not verify) header.d=topic.nl; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mhu8L+b9DU69uq8zdZShuu/Iq7qDyQTzZdguX6jKH6U=;
 b=TsMgm/f2QKu6ZmHCH8RHPDz065asvz3nBCFce+G6HWEp0/UsLKioxj9TVa0C9UUvK5qbpmZr+zmtbRhFXI1YK22WECDVJCb9OngMc5z5xQ/iNuF16A7oj/ivUv3EU+/j6rP9QthSasuZ8hJdTyOBwL6ou378SaED+EFJFAWc2fC0I847ZreSo+R5CPdfML0H8h5KCEGRbvn2QAGkYBlOvdNqntI6iCTN0osz0qFLrZpLEMJlnBKWPXVUMjrK3gR2XI8pRW7+uGTT0bNAaizlK4LTCyGxHugwqOG5sMgwOs6THT1ZwrmC4G78Rb3tNJTrTDNPAtr9zW7zBhp3pNjtsg==
Received: from AS9PR05CA0259.eurprd05.prod.outlook.com (2603:10a6:20b:493::20)
 by AS8PR04MB8515.eurprd04.prod.outlook.com (2603:10a6:20b:342::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 11:29:51 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:493:cafe::bc) by AS9PR05CA0259.outlook.office365.com
 (2603:10a6:20b:493::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45 via Frontend
 Transport; Wed, 8 May 2024 11:29:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.69.19.60)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 40.69.19.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.69.19.60; helo=westeu100-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu100-emailsignatures-cloud.codetwo.com (40.69.19.60) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Wed, 8 May 2024 11:29:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.50) by westeu100-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 08 May 2024 11:29:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8Mp48H7ba14dji1iZQsG3LyuxGWXUc0JSkEj7G5xwOsisMJc3nkuH6uuztKP9D3E0My6pNqCZonlUBQWu2b3/lrcJbMnHrNfk9ES3bgdqwqZJ4rIWpHDIhKex2tVZDKc9lff8AcpHIp+qNHXQ1FGUlJvIKOftFuriJ/tc2xJ6hjtWzWT+ZoZzlsX3C9x2Ys5w173fsW7JWV4MzfIZQbVZuJorkesPmH68A3jjhy0GU2Oal1Gu4rcVlYC/GfbeeN23Pg7bRuzMXK9E6vGSb7FDHRFGhhzymB/M4meqNzLE6ymDKTrcr15zmIQcx/F5uTxvffkt3nfL2K6vNeUIWXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1M9vXlWhgmR6zkRnX/P9f8olrgwyrttQTQ9hZGdAy0=;
 b=U79y1938kRrzOAZFeFhrBETBegRBZpZUca7YmMkTEDaxjw45FEGRisHcebs7jduJFiqjOEyEPTkeuhtljUCMaNWduGcYaNXLbjLXfCk+9/VhRJKqLomNcnJNwtRCEertQzAMmXrUOmb08S7+lrG0OkEO5J4YSvjZukecPZP+7zxv8blH+8LyOdyKBwMYT9TnuPjHZX50y/NM+jKPniIA41WbkAAdbGYcNEOxpLWAsI5mdBxeH1e5cCbQ9OfW8B0fgKTFD0hOlEM+2Bez1rVNxcF0af7Ikc4ur8Qaca4C/kevqflwYVWpD6zEEWZ/y4rL9C0mpTvLOtf4dxdIWVLguA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1M9vXlWhgmR6zkRnX/P9f8olrgwyrttQTQ9hZGdAy0=;
 b=zUnQYrfmmO/dOtJlHpDsymBY2M3nl/bz8Hw8QWFkNNNICfUA/8c+ZMn40sDje4gT4GO3AV3dgyYFaR7j9T66rn8ysmrIjiKYnwzg3CBr6/cJiDRjffaW9zda2RIwN/lOt1L93j9iDJlDmOmqNwFDOQoaxRST4XaIX7veQtc0SqyXuPJsTU1ml9SzzBG1q/0ksdPRCgXIHtX1sn9iNU5MhgV2Z0RjmLjdUW3POdfj8jNPKBiEaKYI8yLN68+a+T6E/0T9TbOt4EBltHcWYaf7UOfas8uJv2oKNluEVa45qW+Ub7urYUZA/2rJ0Vfl+4x4mRpHQX6dTxoB170BMyqvkg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AS8PR04MB8689.eurprd04.prod.outlook.com (2603:10a6:20b:428::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 11:29:46 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%4]) with mapi id 15.20.7519.031; Wed, 8 May 2024
 11:29:46 +0000
Message-ID: <e6de9373-3fbc-4504-a9f8-a6482120f70d@topic.nl>
Date: Wed, 8 May 2024 13:29:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap] psplash no longer working
To: openembedded-core@lists.openembedded.org
References: <17CD7B85B9F9F17A.8817@lists.openembedded.org>
Content-Language: en-US, nl
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
In-Reply-To: <17CD7B85B9F9F17A.8817@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0211.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::18) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|AS8PR04MB8689:EE_|AMS1EPF00000041:EE_|AS8PR04MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c655cb7-d45d-4827-34f3-08dc6f522c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|52116005|376005|1800799015|366007|38350700005;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZG9WL3QwSHo3U2tBRk02SEpVUU1jN2dpWkhZUjhsalBHMGt3QTA1TlVyaEov?=
 =?utf-8?B?MHhlcW5kbktqa0xETzkyNlFyT3FjbHhJZmI4bGtmSTNFdzJuVkJzMzFwVTY4?=
 =?utf-8?B?MWl0K2xweER3RGZuMGdJcGppVmtRekEvZUhUTS8ra2M5eGExNGJaUGZ0TmIv?=
 =?utf-8?B?NXZXU0hxajJLWVVja2JnWUV1bEtOK2gyOEt5OEV4TUFyMDc2RTRNcDVSdW01?=
 =?utf-8?B?a0hVcXF1b2FWVzF5alZrT3FCSmRrVktZVmpCbU8vR1F1Vlp1a0pML2hmZU9v?=
 =?utf-8?B?YWlzdG4raUV5R3BqcEFhK0xjbm01ZU1lcjd6RVZTR3o1dE5VSTFyQ0krTnc3?=
 =?utf-8?B?R3ZxUzVnM3hyVVN3eGljRG9VQlE5OEYzdkdqRTg0RXpOVGVsRlNTNGtPaURM?=
 =?utf-8?B?bElMaDhJdmV0YTF1Z0NvTGF1VytwcGtJMXVxMVFwOU5XZkxZUUExMVdBdi9I?=
 =?utf-8?B?aFFiTnNJTnE0djJHNDdKMFBqdHdSRCtVNzY3Q0VISXJnWVhUVkJtY2ZlbGpC?=
 =?utf-8?B?UWtFbHVockdVMHlHWnBxRlI3SUs1MEFNNFBnckJ0M0JtQzMrbStTVU96cVI1?=
 =?utf-8?B?Z0J2QW52L0gvVGFXNzdRWnlCK0dEUXJlanc4blFuMVJVamZpS2owN2I3ZEgz?=
 =?utf-8?B?VDFjc0s5VFUwZEFiL1d4R1I0N3EvS3Q2WmZWSDBXMXorQnNSUHdBMEo0SDRz?=
 =?utf-8?B?TnpvYXIxVVJiek50c0VBOHlZZkkzcytnMDZZTEpuSXR2d1MzbDJIT3pZVWRl?=
 =?utf-8?B?eDNOeFhLeEczYVdldmNWMTMrNStXd2NWc2dmOWhtNVhZNGVMNzhVL2QwYUdx?=
 =?utf-8?B?cUxmd2g3bGFRRjBmWjJTSThkcStiTXVpQkRqYWFYd25LaGtKL1ZqMndzZTc4?=
 =?utf-8?B?WGdUdDFJV2FmREVHc1RBc1lnZXNjWHN5ZkhOOXIxWkhyT0VWN3RNcC8vb2NQ?=
 =?utf-8?B?ekovVXdkcGlmWkRmcWNjR2ErQVh5Wjl6ZEhrSkpGOE1UZWVVR24ycnlMRW4y?=
 =?utf-8?B?V1I0NDc3b1RjN1lQUlpGNzFra3luNXdRNWs0d3VwS0k1Y2ZxSGk1QVk3RlMy?=
 =?utf-8?B?V3hOcUFGWEE3em9pTFhvN25ia2V2VjJ1RTM3dzRCdmdUWmhoOUVzblFQNkRn?=
 =?utf-8?B?Z1EwY3JnWVp3OTlrVGVUNUdvZW5aYVI0KzJSemEvWE04cTVYNnlvVDhhRkRW?=
 =?utf-8?B?eHJ6QTdBcFdkNUg3NlZqY1dhZXN3cWNkN1pyMEJpeEJUcDg2Ry9pcHRxdmpi?=
 =?utf-8?B?V0I0aTk3SzRtbkhvdG43M0tkOS84Mi9SV2k0OGUwNDFSd0NzZGhmNWZOa0lU?=
 =?utf-8?B?WHk4MDZHRC83SklPZGZmWndYdXdFSy9kQmlRZXVpUXl4Smo2a09aeit3Zlht?=
 =?utf-8?B?WkNMd1AvdzNxRlQ3MURlQjkvUndOUkdnQzFFMk1DeUF4S2xHZVBJa0x5d0Fy?=
 =?utf-8?B?amRVMXlsWm11OFpmMnhqZWdDZS9nUnlhNnBZand5R1lRUlQyekNLZ2tkZHZj?=
 =?utf-8?B?bXIzSlNDaTZyRWt0NmhZQkUxYlNOWVhDa285WVUxeURhckluT2ZjMzdDeERU?=
 =?utf-8?B?VGZNS3l3dkxwUjR0Qm9XYjRLdjRZMXkrdS9xTWJCdXcwbjd1ZWtORG5NQ1JY?=
 =?utf-8?B?ay9rZGxsTkRQQytNaTRHVDJOM1NWNWlTZm16ZHlHL293bUQ1ck9HZ20xcXgz?=
 =?utf-8?B?TG5Ed0hnMmVmNzdjb0w1MDZ1SGM5WmRSOVBIT0I2S01Nc2NHMkVNN0VRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(376005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8689
X-CodeTwo-MessageID: ceb5a728-75c3-4874-8642-370c86e4d4b2.20240508112949@westeu100-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	94dfec01-5d9f-413a-3a48-08dc6f522946
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015|35042699013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NXpzQ2NBY3R5VTdHQzZqWU82L1JyQmErbVdBSHFqRHRkZjcrNnJtdjF0Z214?=
 =?utf-8?B?NXJuTkJUYlhwZlBkbldJNzhMN0xOUjJkSjZydXVybHJlWXN3bHBkYlZJTG92?=
 =?utf-8?B?bWhOSUUzSWhYMzYvaUpkQkFybkhHR3BTTUlIb2ZqZDdCdHUreEI1RmFYQXRR?=
 =?utf-8?B?LzRvR2RrRUp6UTdVYkdUVkZ6ZnI0OUFkUEdaRFFwQ0VNMjdmYi9WeEpaem9M?=
 =?utf-8?B?WkRSYTEyRHcvaDNLSkRmeHQ0Qm1seFhTMVJmV2ZqTE1kTmhrc2RUM3JWOENV?=
 =?utf-8?B?ejVNT0ZZTXJ3YjdiSitMaUFsdnJkYWpqWlFReTBzdjlFMVZML25VVUNKYWRu?=
 =?utf-8?B?M1ZJVWxReGpFYjBtMDhNNmxCeUNZUWNPL2luS1JWODcvbzBBUGcwMGdUR3Zu?=
 =?utf-8?B?U3NSWStLMGtMdmpublVaekxVd244TUF6R1RsQ0hQMzFYOHNPcTl6Z0NZSlI3?=
 =?utf-8?B?dmNvZ05Bb2VZQ0w0ZWRTdDNNZVZMVlhVa2ZrcktGakxCckNEWWpoQTB4TnY4?=
 =?utf-8?B?dVcwTDJxSTNyeGVIcUhuYzRZQjJib21EK2RYM2xYOG5FT2JyMkdIeEFyTXJT?=
 =?utf-8?B?YURoemZvOEFPZFdqbDNadVhHV0ZFTXpEMk5kQnJsZ0tsMnBUOVd0Zk8wRE9T?=
 =?utf-8?B?Rk9heXk2RkJxUlhINHZEZmtwaWV3UDdaazZKbHdpWWV1RGFwbHFPVjFFNUU0?=
 =?utf-8?B?Y3JlaUVUODBOYisyNWZ0UnVFam81bjVYZHNPWmwxdit0ekpnay80TGZIUENz?=
 =?utf-8?B?V1hWZkFLQVU1VjBUa2VQWHhRNkc4M0JoVTVGbHpvam85dThvd0h2V0Vaa2xO?=
 =?utf-8?B?QU5BdlBqeGc1Sit3N2djNmxnNXRmKzNHUzZLbm10Zm1wRUpMd2xabWZPL3FO?=
 =?utf-8?B?WHBNd2ViWU0vV2RqQXg0Zm10Tm9WSUVHenlISlQrTUJoMkkwV1cyVitGZW1O?=
 =?utf-8?B?L0hWeWdUN0h5NVlBQlptdzFkUTNlOWk4NGdvTFVOU2xRdG9iVkwvSG90U214?=
 =?utf-8?B?M0Z0RUpzVTVxRkJxblNCTVMyV0g0S2Q5cDZMUUJnb0pkZThWTTBYZndJYWxD?=
 =?utf-8?B?ZkQxTUhySy9lWVM3eUNyRWhmQlc0Q3FvZDcyd2IwdnNYTDNxSjhSK2d0VFpS?=
 =?utf-8?B?ODluNEI2VzhnditqMEV0OFYybEZUUlZCVTVuOCtnMld0QVNUVkgrditXMEFv?=
 =?utf-8?B?cTd1S3RwMndQeUdyVlFBM2IzRXV4dHNMWTZqNXRpdk5uV0hubXpYYTdXbjNh?=
 =?utf-8?B?VDc4NHBLQ3pTa3pqbExNNldHa01KZWdqZWhLdGlYeGdIcmh0K1lwTStwVEJt?=
 =?utf-8?B?TlRQeWFKSDZRYzJTNmhERGRyOENCcTRmOVdKMGJhVlIyVkF4M0xhQnRobW91?=
 =?utf-8?B?aFJFNk1Ob0dMbE9Yc0RMaXAyd3l5bHlIb0JjYytuR1NIbmd2S1lJem8xajlF?=
 =?utf-8?B?eWRYanAwdlJoaTNYNlB1R2RpS2pVbHpHSi9BVVNYeWVrMGt2SzR2ZWlPT1VT?=
 =?utf-8?B?bm9LeDRMeDdneGdZZDJ3a3FkZUZOYXMyNng2U1U5bWRlcEpNeUkrZE16Wlcx?=
 =?utf-8?B?NThNQTdFWW5GVXFZM2R4eWErZXlKWGdWazI1Z1JuaVhpMjJrTDRoSCt0K0t2?=
 =?utf-8?B?UmNRS1ZKWDBNY0tLcXlFbkZmVW16Vk9xMUZQVzdKeEw0cHZ3UVRZUm1QMENR?=
 =?utf-8?B?M1RYYldBeFdGMWZubWRuejVONEowUmdPbEx5ZXNzcWhLZGpzeGhVWGI5M3VM?=
 =?utf-8?Q?ZiWzWylnDq1SV5eW+ceVsmkSit+/8dB0wxYUbl9?=
X-Forefront-Antispam-Report: 
	CIP:40.69.19.60;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu100-emailsignatures-cloud.codetwo.com;PTR:westeu100-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015)(35042699013);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 11:29:50.4555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c655cb7-d45d-4827-34f3-08dc6f522c8a
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.69.19.60];Helo=[westeu100-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8515
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 11:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199115

Ah found it, something symlinks it later on.
Setting "outsuffix=3Ddefault" in the URI fixed it. For some reason the old=
=20
outsuffix didn't get installed.


On 08-05-2024 12:07, Mike Looijmans via lists.openembedded.org wrote:
> I'm puzzled.
>
> Migrating from kirkstone to scarthgap, and psplash somehow broke.
>
> Systemd doesn't start is because "/usr/bin/psplash" is missing.
>
> Interestingly, the line that appears to be responsible for that is in=20
> the do_install:append
>
> =C2=A0 rm -f ${D}${bindir}/psplash
>
> If I copy that file from ${B} to the board, psplash works again.
>
> But what really baffles me is that kirkstone already had that line in=20
> do_install:append but somehow /usr/bin/psplash still got created. And=20
> I cannot find the magic that puts it there...


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




