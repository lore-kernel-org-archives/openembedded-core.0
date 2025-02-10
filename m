Return-Path: <cmoore@hanoverdisplays.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8573AC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 08:33:56 +0000 (UTC)
Received: from LO3P265CU004.outbound.protection.outlook.com (LO3P265CU004.outbound.protection.outlook.com [52.101.196.143])
 by mx.groups.io with SMTP id smtpd.web11.46186.1739176429945530661
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 00:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hanoverdisplays.com header.s=selector2 header.b=CbDRHA2T;
 spf=pass (domain: hanoverdisplays.com, ip: 52.101.196.143, mailfrom: cmoore@hanoverdisplays.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBbrUDBFiYECj8GAR8cKsCl64uovrvMJXjd0uMkndWOhlZabZYaBmL93lHrR9zP7thtBD95z7+1Om9oWx8UNfD+Y5GgVwd26q2LR/nXw1oXKLlSD/4zPrNCEXjI0hYZ2QV1uC652wNJfuq8Yy0w/G3srRG5GdPML11IyAUEvHmiBci22jcCJhU8Hkrf1rzJxX9fDs2POWt/00JMJHsGZnIRAtbaXk58nDPjnacTGJlXef4yI477aM/easuYLbzqNMj3lITI9ee7FjBPQOYNOO1GyZYMjQaPleioYRl0wcFs/ymYztYyNeIB3iwGmp0MJs1IBsRaa8L3cdnsrNXyqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYDMV+xYAj+vt81mgulndHRZ7IRpzAPGGWJkm8eu53U=;
 b=Yd2C9ZG4Nzet55icmJHz2wVhpCVBbr/fnDLIgH1Iyr+MPR1Ln+X+WW2+DhsN+jym4BU2ztGT6yoEwHRUEV73TjgYpr6CAp9iPE/0eXonGgkL611gOh0B1ydtLwHBQuC3JT7WQBt0Z71StO7f/cfw6U2GjHxVweQiyaRrXcr+cL98YKG3YDO/3FaRGnIHevIgRGn6Au2hrnNTAwUrbrDbS+eLGrN3ZcThk492NWD4MNzWoO2K0pQpDSZB5SnRQ2AZnbMxi0C8E3/uJUT5oOAealVYad22DTYZnRhFv2oAX2QQNnrR8EEidaN3oFZ/4XqVemn+A9op3wtedpGajlNhkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 51.104.147.18) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=hanoverdisplays.com; dmarc=pass (p=reject sp=none pct=100)
 action=none header.from=hanoverdisplays.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hanoverdisplays.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYDMV+xYAj+vt81mgulndHRZ7IRpzAPGGWJkm8eu53U=;
 b=CbDRHA2TCoXHLkkCEwjngSEsdjmldFd3f+O7LjRWZ6iq9Zm4nobXzU8qEMefEXZfeo4678V5NqAwI8b29ZSKYTs6kpn8BrZpmKvqyUOyiOYa8IQj+/xjfohTeThqk/dzbofjTbi+SLSv6aIvX4Q7YHrRvqQRPCiCKZbPfLODA68oH2de+6J7EtCxpjidvQ/s9R94lHOLZ8Sx8FT314bwJfJ6NEeWlADDOTl68S8HRwE3fBQ2p+lWIPbjakoJMFX+JqJNKc8lqhe4af6x/LPRAGNsn7mgdhLZtcT+CpJbaQBlL9hilb2DhXmAcQVs3aKfW3ZYdqO1OBRw7KL1rr4wWg==
Received: from PR3P189CA0012.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::17)
 by LO0P265MB6726.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 08:33:44 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:102:52:cafe::49) by PR3P189CA0012.outlook.office365.com
 (2603:10a6:102:52::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Mon,
 10 Feb 2025 08:33:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 51.104.147.18)
 smtp.mailfrom=hanoverdisplays.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=hanoverdisplays.com;
Received-SPF: Pass (protection.outlook.com: domain of hanoverdisplays.com
 designates 51.104.147.18 as permitted sender)
 receiver=protection.outlook.com; client-ip=51.104.147.18;
 helo=xwaresmtpservice-d98dcc5ff-b6d5k.xware-eu-north-k1.o365.crossware.co.nz;
 pr=C
Received: from
 xwaresmtpservice-d98dcc5ff-b6d5k.xware-eu-north-k1.o365.crossware.co.nz
 (51.104.147.18) by AM2PEPF0001C712.mail.protection.outlook.com
 (10.167.16.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.10 via Frontend
 Transport; Mon, 10 Feb 2025 08:33:44 +0000
Received: from CWXP265CU009.outbound.protection.outlook.com (40.93.68.29)
 by xwaresmtpservice-d98dcc5ff-b6d5k.xware-eu-north-k1.o365.crossware.co.nz
  with Crossware for Office365 id 01302bdd-92b3-4a22-8d7f-e1fddeb7fc64;
 Mon, 10 Feb 2025 08:33:43 +0000
Received: from LO0P265MB6550.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d1::10)
 by CWXP265MB2693.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ad::13)
 with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
 id 15.20.8422.19; Mon, 10 Feb 2025 08:33:42 +0000
Received: from LO0P265MB6550.GBRP265.PROD.OUTLOOK.COM ([fe80::ec79:86af:7924:68d3])
 by LO0P265MB6550.GBRP265.PROD.OUTLOOK.COM ([fe80::ec79:86af:7924:68d3%5])
 with mapi id 15.20.8422.015; Mon, 10 Feb 2025 08:33:42 +0000
X-MAIL_SIG_CONFIGNAME: Hanover Ext (All)
X-MAIL_SIG_CONFIGNAMEPLIED: Hanover Ext (All)
From: Chris Moore <cmoore@hanoverdisplays.com>
To: "openembedded-core@lists.openembedded.org"	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] psplash.c: fix crash from length becoming negative
Thread-Topic: [PATCH] psplash.c: fix crash from length becoming negative
Thread-Index: AQHbe5Z90qkkEXAegEW39YTtaMLtug==
Date: Mon, 10 Feb 2025 08:33:42 +0000
Message-ID: <036b2d9feb26fd94e2f80d6fc46ede8c2775e6d8.camel@hanoverdisplays.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-MAIL_SIG_CACHEID: 9838
x-ms-traffictypediagnostic: 
	LO0P265MB6550:EE_|CWXP265MB2693:EE_|AM2PEPF0001C712:EE_|LO0P265MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5f4f3d-a848-424c-114a-08dd49ada151
X-MAIL_SIG_ADMINUNIT: none
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ak9uQVk1UTVsWUxQVVJPcDV3Y2hzbHNNcTNvNDQ4UlN4ZE4xeFRBZzFNYkdT?=
 =?utf-8?B?WVRGNzE2UWpSUy9NaW1QUDJ5K0JRRlVvQ2RmVmlCbWkyMUFGb2FUcWpwV2t4?=
 =?utf-8?B?RzVLWSthOFprcmlBM1pqY29rMG80MzBVTUFYaW04RlZuWFJDdG95MERUbEQ1?=
 =?utf-8?B?dmtaZi8zZTJ1eGYzRENkUENyZ2d3Y1d0MHI5ZDEvM0duMmlBS1RPeFg1RXNh?=
 =?utf-8?B?cEd1QWFad3BMc2tlZGJMc0hHRGZ4NUpWenVFb0ZuaWRMRHZoYTdLd2VvWXU2?=
 =?utf-8?B?VVl0a293M1VjcjlsbDNnT0VxVmFxWXREaEtacjdpNWd1TkNNVjJTSTdneVhq?=
 =?utf-8?B?T0hCdjNKYVhKVmEzM2hTbWNidDc5R3lTaTc0K3AzRnVUUXJlYXlRSGVoN2Ru?=
 =?utf-8?B?Q0xRcmI2bHl4ZUNxMXVNSXNWejZwVVJxbVlZT08rMFo2YW5zNTEvSkZ4WTUw?=
 =?utf-8?B?M2JuNDhNdDRDc0hOUVdJem5QVEJnNFhxQWNMNnUrMEwxb29lUnBFUjNaT0dB?=
 =?utf-8?B?VWNwRXhhZnFhMEZWUzREVVluTnF1K1lJOGM5SkNpT2h2T21mRXZxV3ZEZENp?=
 =?utf-8?B?YU9JMkhQSjIyLzN6NUxGQTJoM2tTd1NwREFIclFpZDYzQUtiYmZRWVg5UWV1?=
 =?utf-8?B?Z1lYSTR3ZHhwVVJTZDRwSmxJR2YzM1huam9LcjhJaVNSYkhzTGc5UUNnUTFG?=
 =?utf-8?B?Z0o1Q1hidG82NEJDRno2UGVxK1hRdUpXRm84ejZnaTNFZXJnQS9LOHFzUVpO?=
 =?utf-8?B?OElJVUNSLzRrQkYxa0lZR25YTFdLd1ZTNGFsWW9XeHdFV25Rc0NlalBramxh?=
 =?utf-8?B?MUZBa3ZsaStodDVpT1plcnJzQmRSSnoxcC9WSWgzQ1VLdC9MazJQdUpNdkFl?=
 =?utf-8?B?VHdHZldKY2s1THRSSGJKQ2hkYjM4NnNLemlTZC9YaVZ5SDMwSkxjMVF2eU5h?=
 =?utf-8?B?dzM3bGVIRGlXakQvQmFNSDRmUVZhM0FzcmhHNkp2bUw4c1h4ZjZEblBhZ3hW?=
 =?utf-8?B?eVNpayt2akViT0ZHTkx4aVZvaXlDcmpESG4ySjV4ZkNjVHRjekNXbTF4TTcw?=
 =?utf-8?B?UzFpRDM0dDdwdzdnZkVnaVJDQ1krZXNqdndua3RWRUtqQmpsR1RvSWtnaUh4?=
 =?utf-8?B?Z2NZV1E5RWJBMTBqd2NVZnNReXhNTW9OellGOFlBUVJOZTcxeXhORVJoUWR2?=
 =?utf-8?B?Vm9CZkJXcm40b2g0STF5dTdFdUZKa05iQm1kUEJ2ZDhydy9KeWdxSCtPaDlB?=
 =?utf-8?B?VlNQNENsVFVGdXZZcGNxc0RLdmhJNzk5cDYwQTFNNTBPZUJHMGpiNEk1Z0tp?=
 =?utf-8?B?c21udVYwOEtyV0RmUk1YK2VmbWhnYWp2dEg1R0pHTW5JSTg0MVdIYUpDWUJq?=
 =?utf-8?B?TkV4YkJPZzVLcUhxMkVReUJYM2lGWjhzS0REV3FNOWdxSnlhWFNiNk9CS3ZB?=
 =?utf-8?B?UjhHZjVSYjFyZ2JsbnYzRUlRWnd1N1lvZlRDMTFpWXJUdC91MHRpSXNNdGVi?=
 =?utf-8?B?Y2crZjlnMUllRktENGJiMUtMaVQ4QXZjSVdVUWZ1VjdpcEZQaWFmRENna1ZC?=
 =?utf-8?B?MWVaVThzMWNWdG9hUDdjMzBKQVl6V0VhWnBsdGt6QTB6NHl5cEtVSnU1YU9k?=
 =?utf-8?B?TWI1SE5qb2VMYnROK1pXVnpmdzF6RVJBNDdhRS9KcXYrM0t5ckZja3I2bTFt?=
 =?utf-8?B?WExScysvNzVWdEZpNzZHU29ZNjBGTWhNUC9IUlppYVlVMkFFQVorTHVVZklj?=
 =?utf-8?B?cFIybDRlanFIVCs5TGhkMVV6Wm5FQjk1cldsaFJoQzZhcTJaT3pwaW11NUs5?=
 =?utf-8?B?MXF4aUxHbGd6cTRSL2dkWGFsckV1Tm4zYlZwakVVWldUNGNaS2VzMFZGeFQ1?=
 =?utf-8?B?a1hNcEZmK284TGhpaEtJWms2Ylh0SU1WOUtMaWswR2ZCVCtjNTZxbm10cnJ5?=
 =?utf-8?Q?Xwb1ZMYxM63mzdMwNNOqwq7JEhrF6OR4?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P265MB6550.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
X-CWesigProcessed: Y
X-MAIL_SIG_VERSION: 0.2.733
X-MAIL_SIG_SERVER: xwaresmtpservice-d98dcc5ff-b6d5k.xware-eu-north-k1.o365.crossware.co.nz
Content-Type: text/plain; charset="utf-8"
Content-ID: <133A8D218571B44294A4847A577A5B67@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2693
X-EOPAttributedMessage: 0
X-CrossPremisesHeadersPromoted: AM2PEPF0001C712.eurprd05.prod.outlook.com
X-CrossPremisesHeadersFiltered: AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3bd292dd-1556-45d0-7826-08dd49ada02a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|36860700013|82310400026|1800799024|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NEtRa0o2SnhUL3VxZmZOWkJCSTBWRDdYWThHSlZtbUQydEFoNDFicXNOQlBv?=
 =?utf-8?B?K1ZQVmc1eGRXSkhBeHBxZmlYZllQZzNaTUM4YUwybHB1bFZxSS8yQ2tXT0F0?=
 =?utf-8?B?VTArZDdpbU9sNGtVdmxDNG50NHdTN2V3VUI0TEkvSWFwNFRuTlljQWNXZDVN?=
 =?utf-8?B?cThiY09ia0RGclhzR2FacUcxWS9vZG0wbHJ6YUZGZnhWVVYvNjd3TGQyTkRo?=
 =?utf-8?B?NHZ6V1R1K3ZSMW42MmNiLzJ4cG1BMTNQaVJBODE4cWd0WWRySU5EZURtZitH?=
 =?utf-8?B?VC9rdHo5VnhMVllLbjRRME9Ta0FjT3lUL2szVHptZGEzTUdJZHJ6eGZZd3Uw?=
 =?utf-8?B?RzNRTXJWSENldnZ6MDhQQTFCUTNpQXcxY2ZPekZhZnZxME9mSmt0YkRqRWs1?=
 =?utf-8?B?WWFDcmY1UjNtenM2WGhWdHR2YSttaHlVa3NPSkFVK1dXaWVMMnY0dy93N2RD?=
 =?utf-8?B?TGxWTm1KWSt1WFYyZ0k2ZUROS21Zb09UTXpYZU5GWlp4TXkzVXRHaFYzeVV2?=
 =?utf-8?B?ak11bjRHYThVTDNKd0pLSkZ0Y2NiM1ZFb25lbUdmS1lLZlkyb3dZaS9CaGxm?=
 =?utf-8?B?Q2FOMHZ6cCtTaXN5MWxYcGhEVWFMZDdEZnhDY2RIemZ3T0tERURGbitObUlC?=
 =?utf-8?B?Vjg5eGo3Y0hRYkJFa2ozVTdGNXpIcklyNnNoQUw5Q01oT3UzaVBGc2FndVp0?=
 =?utf-8?B?MDdWV0Q0ekZyd1o3RVhlWE84Q1dTUTlpRzJpdWlqR09lNVFFVjJrZFpzQUFZ?=
 =?utf-8?B?S0pid3Nwc29ZTis4TktoSEJnaGpsSG54ZUl1UmRrK3NiQ0lQYTRzcTN5YnRy?=
 =?utf-8?B?RlRoNytiZHZ6bmpTSFBoWDVjbWZsZHpSMG9CMTBzMVpvZ0JIV25tK1l3K0oz?=
 =?utf-8?B?d3o2V2cvYzhWY2dTMW9vZ1FxeVlmS21yWjlRZnc4VmRBMGY3ZnFRaHJ1czlL?=
 =?utf-8?B?UnVEa3JHK09Xd3h5WTY2SEJYeUd3V2RlYXR6WVdNUGVXeTN4aDBHbnA5V0Jz?=
 =?utf-8?B?WGJsR2xLRXVSVTJ3blFJL0JXWjRsMWtUcWtzV0kzcHk0RUZNOU9hWUpFNmF6?=
 =?utf-8?B?eUFWZVBuL21BOTczMGxpSm5tRm8vT3VUbUkydzBWRVNSTzBEYms1YUFCcGdh?=
 =?utf-8?B?Mmg3ZU5VTjdqZ3hXWWdXblZWYldqRzZEY0dHWHI4amVyRmFnL3NaZi9OSzVz?=
 =?utf-8?B?ODdleEZWUTBSMlBPOTVneENUaS9iZWZHYWRMdXlSdDNoVHhXZU9za29sNXVv?=
 =?utf-8?B?Vys1MnA2YTY3dlpIbmVDam5kR213cEFkY2VZeDRZK3ZDQ2d6ZjR2OHVISFZP?=
 =?utf-8?B?ejBJYlRBaXZNVzZxaFozM0toclk4K3JPT05iSkFCZWtmdlhuYVF4Q2ltN3lx?=
 =?utf-8?B?c0FVb1ovNzdYakpXQkhxMnJ2RGZjdXcyTEVlVEoxY01UbU5XYnlpN25Dblg4?=
 =?utf-8?B?Wk5JWmplZnBzVERsT1RKSmlseGdnU1RON0l6MjdRVlpOb3VJVDhKYWFURzcw?=
 =?utf-8?B?c0VTUE4reVpHQjNZQTJBZnpPbHk5VVlYcnhiYm91c1g3MlRMT1JPVGlscmJY?=
 =?utf-8?B?LzI5bDV2TDgzdXVUSFNrVmZ1VVo2dHpmU1BNUDA2NGpBY0MrNlZPeWg1V3c3?=
 =?utf-8?B?YzJOTlNNV1JmQjFlNFdrUU9STXBBZnRSOWZSMzNSZTViL0dCMDYxemJCTDB3?=
 =?utf-8?B?WFJpQnltenpGUTlrU3c3S3B0eE1obm1nSFVmaWJyTm5JdlBiQVcyUjF1MUNo?=
 =?utf-8?B?ZlF6ekRaSHhSdkEvWUNmbTZEc2JXTG41QzN4RU5TMFBnc1pzMXcwYXk1bnZZ?=
 =?utf-8?B?M3hmZDAzNmliR2pWN2lIUFpWYU5lZDg4R2JBUEtrL0VSeEVRbEZaVE5uSlEy?=
 =?utf-8?B?MWNFY1cxN2d1SG5pejNGYWpWTSt4c3E3Qm5ZYkM4b1lUeFhaamY3RGdya2NK?=
 =?utf-8?Q?daeu+F0jpLg=3D?=
X-Forefront-Antispam-Report: 
	CIP:51.104.147.18;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xwaresmtpservice-d98dcc5ff-b6d5k.xware-eu-north-k1.o365.crossware.co.nz;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(36860700013)(82310400026)(1800799024)(14060799003)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: hanoverdisplays.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 08:33:44.0780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5f4f3d-a848-424c-114a-08dd49ada151
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Id: a8520dec-67a9-412e-9a33-fcd2b3b5963b
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a8520dec-67a9-412e-9a33-fcd2b3b5963b;Ip=[51.104.147.18];Helo=[xwaresmtpservice-d98dcc5ff-b6d5k.xware-eu-north-k1.o365.crossware.co.nz]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6726
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 08:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211080

Rml4ZXMgW1lvY3RvICMxNDgwNl0NCg0KSWYgdGhlcmUgaXMgYW4gZXJyb3IgaW4gcmVhZCgpLCBp
dCByZXR1cm5zIC0xIGJ1dCB0aGlzIGlzIGp1c3QgYWRkZWQgdG8NCmxlbmd0aCB3aXRob3V0IGNo
ZWNraW5nIGZpcnN0LiBUaGlzIGNhbiBsZWFkIHRvIGEgcnVuYXdheSBuZWdhdGl2ZQ0KdmFsdWUN
CmZvciBsZW5ndGggd2hpY2ggZXZlbnR1YWxseSBjcmFzaGVzIHdoZW4gbWVtY2hyKCkgaXMgY2Fs
bGVkIHdpdGggdGhlDQpuZWdhdGl2ZSB2YWx1ZS4NCg0KVGhlIGZpeCBpcyB0byBjaGVjayB0aGUg
cmV0dXJuIGZyb20gcmVhZCgpIGZpcnN0IGFuZCBoYW5kbGUgdGhlIGVycm9yDQpzdGF0ZS4NCg0K
U2lnbmVkLW9mZi1ieTogQ2hyaXMgTW9vcmUgPGNtb29yZUBoYW5vdmVyZGlzcGxheXMuY29tPg0K
LS0tDQogcHNwbGFzaC5jIHwgNiArKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvcHNwbGFzaC5jIGIvcHNwbGFzaC5j
DQppbmRleCBlZTFhZjZiLi4wZGIwYWE0IDEwMDY0NA0KLS0tIGEvcHNwbGFzaC5jDQorKysgYi9w
c3BsYXNoLmMNCkBAIC0xNDAsNiArMTQwLDcgQEAgcHNwbGFzaF9tYWluIChQU3BsYXNoRkIgKmZi
LCBpbnQgcGlwZV9mZCwgaW50DQp0aW1lb3V0KQ0KIHsNCiAgIGludCAgICAgICAgICAgIGVycjsN
CiAgIHNzaXplX3QgICAgICAgIGxlbmd0aCA9IDA7DQorICBzc2l6ZV90ICAgICAgICByZXQgPSAw
Ow0KICAgZmRfc2V0ICAgICAgICAgZGVzY3JpcHRvcnM7DQogICBzdHJ1Y3QgdGltZXZhbCB0djsN
CiAgIGNoYXIgICAgICAgICAgKmVuZDsNCkBAIC0xNzAsMTUgKzE3MSwxNiBAQCBwc3BsYXNoX21h
aW4gKFBTcGxhc2hGQiAqZmIsIGludCBwaXBlX2ZkLCBpbnQNCnRpbWVvdXQpDQogCSAgcmV0dXJu
Ow0KIAl9DQogICAgICAgDQotICAgICAgbGVuZ3RoICs9IHJlYWQgKHBpcGVfZmQsIGVuZCwgc2l6
ZW9mKGNvbW1hbmQpIC0gKGVuZCAtDQpjb21tYW5kKSk7DQorICAgICAgcmV0ID0gcmVhZCAocGlw
ZV9mZCwgZW5kLCBzaXplb2YoY29tbWFuZCkgLSAoZW5kIC0gY29tbWFuZCkpOw0KIA0KLSAgICAg
IGlmIChsZW5ndGggPT0gMCkgDQorICAgICAgaWYgKHJldCA8PSAwKSANCiAJew0KIAkgIC8qIFJl
b3BlbiB0byBzZWUgaWYgdGhlcmUncyBhbnl0aGluZyBtb3JlIGZvciB1cyAqLw0KIAkgIGNsb3Nl
KHBpcGVfZmQpOw0KIAkgIHBpcGVfZmQgPSBvcGVuKFBTUExBU0hfRklGTyxPX1JET05MWXxPX05P
TkJMT0NLKTsNCiAJICBnb3RvIG91dDsNCiAJfQ0KKyAgICAgIGxlbmd0aCArPSByZXQ7DQogDQog
ICAgICAgY21kID0gY29tbWFuZDsNCiAgICAgICBkbyB7DQotLSANCjIuNDUuMg0KDQoNCkNocmlz
IE1vb3JlIA0KDQoNCkVtYmVkZGVkIFNvZnR3YXJlIEVuZ2luZWVyDQoNCg0KIA0KDQoNCkAgY21v
b3JlQGhhbm92ZXJkaXNwbGF5cy5jb20gDQpUICAgKzQ0IDEyNzMgNDc3NTI4IA0KDQoNCnd3dy5o
YW5vdmVyZGlzcGxheXMuY29tSGFub3ZlciBEaXNwbGF5cyBMdGQuIFNvdXRoZXJoYW0gSG91c2Us
IFNvdXRoZXJoYW0gTGFuZSwgTGV3ZXMsIEVhc3QgU3Vzc2V4IEJOOCA2Sk4sIFVLDQoNCg0KUmVn
aXN0ZXJlZCBpbiBFbmdsYW5kIE5vOiAxODc2Njg0


