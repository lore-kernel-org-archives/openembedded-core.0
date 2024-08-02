Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96865C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 12:40:13 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.74])
 by mx.groups.io with SMTP id smtpd.web11.91618.1722602406853653547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 05:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=krr64buh;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=krr64buh;
 spf=pass (domain: arm.com, ip: 40.107.104.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hZP5KpWgZEZaJVm+yR006ar4Va8dOMyROg+3bBNGrRnXPjx1xC+DwGcPY5M77tNOpwDiqrhra2df2OXq9CD87xj0NCuOYocaYL/nJI50lKQw1K+NSrKMchZkOpB6tQlOPXZm1YM8kwvkbUvfThYtf1LsANxDiQ8X1eoBJoDcuMImbqOeTxcsi6VOQRqtACZt/+gd3BgIMhfPU7e1I7WB3cQelryYVB/gBLCehQzv41giaXEQ1lplha9D0cF+pxR5cYDKW5xnvYaZjhNU7c18kfnHAKKMwwB53zjvT/7FptIZTqtOB3mY/84VS400l9ICYKc1gHEEyQmejlB0c4UADQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1CJqnWQvNInIJdHXZxMW8X788z0QvNzYvVxHORn3Ds=;
 b=MUT3ifxK3A/AffxlAlyNh4jwRsYLABmYJy6gID2pYrvSdEmGhuhIvIuX3MFbsQ4Tz2OcROppJFM4YAzq9f0CbuRs9xQXcIW8u9f0dZWdbLS5gi2vGkuQNnk/RjaDbIDcvpqe4NysmnXKlKfjYMgeuENDSx4zdtabiBOwXQOV69KLTRe33UoxofrKvbXrVAEIvMX7QIJSnkuAVdJLqrEfmlamAeitZBRYAfaKlQdrV8SkAfGeMNHy3iaBeRWaHDQDES4dR+/ZbwVlXYIoE31pPL0cO7Tct1RL9JAcLPQ7pkh08tEn462bnDL4Y/scl2fjFdvprg/EMv0h8rZMnOUonA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1CJqnWQvNInIJdHXZxMW8X788z0QvNzYvVxHORn3Ds=;
 b=krr64buhNjkCW5zyr3KlWXy0kr0J8hGB0cMIH+Vqep9uEnE07GpIzbbQfVuGxaBjCemLs5/RyBDpIhjXBM0IsgWde3Lb/Mgb2EYRVbquTO9IoOUJiU3zMQEEDQpQDRtFzuSwW+DbSDgEdzVsXJmsi72qAr4J3AlxCwRpKYGIOJg=
Received: from AS9PR05CA0120.eurprd05.prod.outlook.com (2603:10a6:20b:498::26)
 by AS8PR08MB9766.eurprd08.prod.outlook.com (2603:10a6:20b:615::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 2 Aug
 2024 12:40:03 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:498:cafe::5b) by AS9PR05CA0120.outlook.office365.com
 (2603:10a6:20b:498::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Fri, 2 Aug 2024 12:40:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7828.19
 via Frontend Transport; Fri, 2 Aug 2024 12:40:03 +0000
Received: ("Tessian outbound 08e724e9fb70:v365"); Fri, 02 Aug 2024 12:40:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75129a4565414f91
X-CR-MTA-TID: 64aa7808
Received: from Lade64cd2e459.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2FF5417C-3189-4146-8A04-54B0E123DD38.1;
	Fri, 02 Aug 2024 12:39:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lade64cd2e459.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Aug 2024 12:39:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPJPOXD4V2aXT/h1MHHPVHCHohfUJEYv2aY9AOxLPb9JEP5opvH5/swI2SAbTs3v0nVz6l9tR2KHCBPUX1jF/o3l2od0lyC6VLWZJtR7wQC1U9ZR97qN9+n98TZXKt5fNdEQG0YnJ1AUhFraGEf75vUNlzKPrc+R+SZxV1gwkwBLch721xFYQuV3woE9kX+RsaaedXEAJ7jc5cutpqJSSbBf9Mc+gf40euTYKoeH0SZcezat2dv6bzukSbtHfRXLvsl1aSDXHGtrd4STYpF1/5L5AP9jfZlVIB78dGLHA29bOQHQHLVenmx8MuNrMiEd7fCQaM2TLNwx7Ujf2K5nSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1CJqnWQvNInIJdHXZxMW8X788z0QvNzYvVxHORn3Ds=;
 b=U5d33v7l1N9sLo42DYMb7PmWqRK+34xMQecMuANmdVYqNYGQTMS0MW0s5i6/W7CTzE1RfUeWiSXkF/jcTYOo+JV5teI1KcBPAFCM1RByB9ear6QXyky/eOURaPrYR2uiHMKJDYbJCpzfwHf7qfkxUYrYoskHGp25s6QxNN/FzEZxekTHUZkjJ2lsvrOKpxd23gdXZb6x/kG6SEb3OrbaTHyHLeEKQPIbnUOHRw/zsA9eiffy46deGK6Dv8IGuoPTMVwUXxi1wbF05d9EahAEDB3zFOjQnzg/+bu73G9o3dpGT589hhDNoVnE4/CwkPlXEvDkAxDrTa4NzUh3EvGGMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1CJqnWQvNInIJdHXZxMW8X788z0QvNzYvVxHORn3Ds=;
 b=krr64buhNjkCW5zyr3KlWXy0kr0J8hGB0cMIH+Vqep9uEnE07GpIzbbQfVuGxaBjCemLs5/RyBDpIhjXBM0IsgWde3Lb/Mgb2EYRVbquTO9IoOUJiU3zMQEEDQpQDRtFzuSwW+DbSDgEdzVsXJmsi72qAr4J3AlxCwRpKYGIOJg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10822.eurprd08.prod.outlook.com (2603:10a6:10:529::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 12:39:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 12:39:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "martin@geanix.com" <martin@geanix.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 2/2] ofono: add ptests
Thread-Topic: [OE-core] [PATCH v3 2/2] ofono: add ptests
Thread-Index: AQHa4+wYsuPO2EksKkqPQcam1ZRvk7IT6kIA
Date: Fri, 2 Aug 2024 12:39:54 +0000
Message-ID: <C14117D5-68D5-4261-9A1A-E2A3D6E1F850@arm.com>
References: <20240801082253.974486-1-martin@geanix.com>
 <20240801082253.974486-2-martin@geanix.com>
In-Reply-To: <20240801082253.974486-2-martin@geanix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10822:EE_|AMS1EPF0000004C:EE_|AS8PR08MB9766:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0d8430-e05b-475b-4f11-08dcb2f03b5b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZGUyZ2tHcFRvR0x4QklYNDdtbmFFZTZtZXA4dWplODEwWnRkbUpTZDVUcEwr?=
 =?utf-8?B?NWVUUWlXVTJWVkpiNmZQMXhTU3c1VGpLNkFJcFV6NzFQSW1uUDFEUUJFV0xv?=
 =?utf-8?B?YzRPbkpDZ09zeU1KRHgrUjNqTlcxdlFLQVdoaHpIRW5DM09mNVYzUng3QnpV?=
 =?utf-8?B?bTRpRjRmT2dpUWhrekZkL2ttNkFEZzJNTlJveHJDNlkwaGdHa3JCVnYzRk55?=
 =?utf-8?B?ckpXTlkxd3lBZjdQbnhBeGJLd0NKekNLQWJHaVZMNUtKTnVpQjVrUzZ0L1NR?=
 =?utf-8?B?UVpOK2o4ZFE0L0daeHRWdy91bjN0OXZZT0xacC9MczNpQk80TnNCWjkvVWtx?=
 =?utf-8?B?TjJpTTJXdTdGMTdaQ3NYRWJDVzdUbEFtYzNrKzQyY2hVSHVLalhuY0pQTkFP?=
 =?utf-8?B?ZDRuakZaYTdsM1U3enlXQXdZMFd3MUNTTWk1TEhDbStrNTNHelpKeDhOTWF3?=
 =?utf-8?B?SURnMkFxS2F0eUVySTdWbVZYcm0vN2F5UUYrc001RGxydExsWEdNRkxldVBM?=
 =?utf-8?B?Q3lsK1BOMHAxd1pSMVNBZGtUK2FYV1ZLR1NxMUZQVlZqTG5TZGtZRGs0OTNl?=
 =?utf-8?B?bWhmWUl2L1JRZ1o3MHZiOXRPM0VZQlZKVkNXRlhNTURhR0dQRWRoc1VlTkNH?=
 =?utf-8?B?b2dTaTRudFZVbjNFMDdBb29JWE11bXArdS92YXhUT2pJcXZBd1VuQ3p6MUZR?=
 =?utf-8?B?bVVRNTcxWEhpdjNQclh4NWlNSUw5Z1VIMnE0bkNWVDd4cVhpTE9PZTc4UVBi?=
 =?utf-8?B?TGlXTTBmMUVic0ZEMFEybkJFYis0OHdxcEpsS2pnVjhUcWkzMUVpTWdnQjRn?=
 =?utf-8?B?VnlORGVidnZsV1RRbjg3YkdwZERkR1JNazFvR1lsRjdiV3NRaENrVnJlbjNw?=
 =?utf-8?B?c0VpQi8xUUNKSE5JUUxCdkI0NFk0UEJJSEgwZ3FObjFvZkF6YnBqL1hKTGUr?=
 =?utf-8?B?L005Q3NQM29tZ2poOERGa1gvN3hIekFTS1NZOEhGWkcyYjU3cFZBcUlWYS9u?=
 =?utf-8?B?cHZEeWIzaEl0YUFYZ2t1WVh6Rmg4SWUwWnBaZ1J4dTdKVUwyNkI1K0gyb3JZ?=
 =?utf-8?B?cSt3L0p6bTNEK1NPRUJZejdrRGtuMHJveXZXR3k0dW8wb2QwU09UdERpT1ZY?=
 =?utf-8?B?T3EvbjhxM1NjU1kzUUZ1N2dVQ2ZZYmJTaS9JMEsycnh6RkFzOXczN0hJYU5s?=
 =?utf-8?B?eFhGalk4NWFGSUlxOVhsMlFISnJMM2YrZGJNTXVxQWRpaUNENkhINEZSKzhD?=
 =?utf-8?B?b3lhVzI1R3U3S0pRc1F4bnZsSkQ0bUxSeWd3RXNsR3grazZ0cGRqRWVnU2s2?=
 =?utf-8?B?V2dlL0EzKzE1V0JoUUFXeXhIRWtMVjM3cmIybEd2YVFKcExqc3ZyWEw5Z3ZV?=
 =?utf-8?B?QzhUUi9TZkxNbkNHOVV2Uk1VZlFKck43djczVUFjMUJXNG1mYkJXUmJrVyti?=
 =?utf-8?B?cVBiTDh0eWRDV2RZd1pHZWlBMGZocVgzRktVMDRDWEtSWHQ2WlladUg2UHBi?=
 =?utf-8?B?M1poT2tmZjcrWHpPZkQ2aE1vZ0F3ck1FSkJUdnJIdWtkOUdmUEkxeHV6aFB4?=
 =?utf-8?B?OTk1cXp5TzFvRHljbEd5N2FsRGtQeWhJQW1SUmliSHhTNnVFejU1dmJjbG41?=
 =?utf-8?B?cWZXbXZQSi9VRW5KNDlzQVo3R3BqbW9HM1E3UExuellxWWtKY29SZEpRa3po?=
 =?utf-8?B?Yi9sYzVFYzJaK1E3Uk55TFdweEJBSytUdXc2MFd0aHQyaUdiQ1UySlgwUWEy?=
 =?utf-8?B?b1dTdVFOSUpUNUk4bHgxbmRmS1V0VjAyd1NndThoQktYM1BRZHRKK0pWRjVX?=
 =?utf-8?B?N3hvNDQrQ2RiLzUrVjJVc2gxODMzZzQrUXZSVmNXZURQUzQrdU1ZbjhoKzM2?=
 =?utf-8?B?TkNIMldSNXBHSjQzSkk4ZVd0bWMyVW5LeEJCekFFbjd2R0E9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F97EC69765FB004F9467E8E0A7C465F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10822
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1348e71e-7fd2-450b-2faf-08dcb2f035e4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cFpoVzhSUzd0MXZyM043Um1ScU1CU09ZU1RDbHJlYmY4d20zRjB3ekF5YURE?=
 =?utf-8?B?VWFPN25wTzRORmZFdlUyQWM0WStaRnVhUU1yVzVTQnZoRGN6OFJWSE83VUZx?=
 =?utf-8?B?YjJsa1hlem1RTGd1TmJEK3NqemtpTkFzNHFFb2UybDQ1NFQ3MHlZQ0NBZ0RP?=
 =?utf-8?B?WGxuTzZlU2p2THMzakRUSU1IcXA0YWxMM1R3UG04aFRINWEwcHE0Z3p3akNk?=
 =?utf-8?B?dVFiUDdMT2ViUG1FYjhvbEhsTVFLcXFLaEd5QTNWU29EQTYvdy9yck1XNG9V?=
 =?utf-8?B?NzBTbm0yQTdoTit1TDVYZG1IQ21SWG91ekZSaGRzMEdiQ1NtenB3aW5wWXVv?=
 =?utf-8?B?Y2dlTDRvODkyWHB1ZWRhL1Y2dG5aZE1MUEdKVjBPbk5wbEhjekNBeDM5TERS?=
 =?utf-8?B?eXh4TGR5ODljVzV4MGwwOVc1QzcrUXBrR2hqcE9obmFIVGNab1VKZkswU3E2?=
 =?utf-8?B?RWVjeERRbzBtbUtrTUZ2amFnNnU5NVNWd0d4cUt4U3R4eU1vSWh0YTF1NU5a?=
 =?utf-8?B?ZS9sVS9nWFlLVFBUakh5ckx2UVkxS0VIV0xvSCtUd3NrZXhESG5SQUhIcVVI?=
 =?utf-8?B?N0RnN04zaytXUkhPTEkyQXdsYm40WmwwK1lma2RDaFF5N2tReEQ3b1BxaVhN?=
 =?utf-8?B?NXV3OWlvK1dJWVZtMVR0OE9lVENOS3VaOWRxODBkR3IwMDgrUjFaK1ZnUC9a?=
 =?utf-8?B?cU1rckYxNEN4ZGVOTUYveHh6QWZqOUJNYU83Z1dwWS9LNkIxdWRjbGM4WTRy?=
 =?utf-8?B?MVBxZ3N1NGYvL09RSnBTbGtPaDB1QkFFTTNwbkEvT0FveG9idlVEcmcvTTln?=
 =?utf-8?B?SU9JNStKc0pNdWxRR3Z1VnNhNk5CdXh5YzJiZUlaUWJNWHpYRjgrTkxYbXJZ?=
 =?utf-8?B?TnB0bzh5UDZxUzZDbDlFU2gvVStWQ0hacGpiMWM2bHFZS2hIQ0p6REI0QW1p?=
 =?utf-8?B?V2h3WWRib2pSNGJJdHhlazVxMDJ2clBmTHluWUYyRDIvNlFUUFFJbnBFQnFw?=
 =?utf-8?B?N0M3RnV0TWxaQ1VHNTVTeFNYY256SWtSRXJSYy9SbStGS3hnN0JYT1JMMEhq?=
 =?utf-8?B?OHNmV3MwYmgrQk9ta1lMYVJCUWFLOXdoMGpzVGZrNEsvU0N1K1BheC9wdmZN?=
 =?utf-8?B?aDBkcWkydkp4NmhLN2plOUdBL0hFT1pKOHlFbk9meEIzSys5NW5PT2g5ZUxn?=
 =?utf-8?B?RlRTcy9KZHVXdXU0RFVXenY2U0lMY1hnRG96eUt5cWdUYTBuSHBRWnZKajFp?=
 =?utf-8?B?WndiTDJ4N3R1MmZTczM1VGhtQUY3bnBBckhQZGdJZmEybkFFUmNBVHI4RmNO?=
 =?utf-8?B?NlNXdXR1R244dGxrcU9mOTAweSt2YjZiUmo2YklGNVp5bnhDMURvS2E0WTg2?=
 =?utf-8?B?dklGd0psM3d0MkNIZUkwNXQ3NVgyZ1hGNGNHa3RwQUFteGR3RjVtQlA5SE0z?=
 =?utf-8?B?eWJHbTNBRWFoQWNZQWl2dG51VWhjbDJ3L1dqK1FuclMzbzQzZjhWMkdwU0Vv?=
 =?utf-8?B?R211SjJ5Y0doVzhibnBuZThpOUdlZ01EN0NMTG5ueGhLVmNLenhTaW9hRTBZ?=
 =?utf-8?B?Zkg4bU9keVlvZmQvbEhRdDNSeFoxeVdVVWlhOFZ0M2hWZzQzUTh6aVp4QXAz?=
 =?utf-8?B?d0JrUGoxWmtPQXV4UjNkeFhGemliSkg0T01IVzZTYk9HNFEyWFVrUXFJT3pt?=
 =?utf-8?B?Rk5LTVVjYkMyd2kyek9SN0o2SG9RS2lKaVlZS1N4K3VOMHFYalhTd01ISHc3?=
 =?utf-8?B?SXdNUkxoRENuYUxBNCtVYm4zekcydHNtR3E2aTZDN3AxUnZWZlIrZXVPV1o3?=
 =?utf-8?B?UTE5M2tCMnNXNGd6OXIrLzE2RmtucU1TSkZHVCs0V0Z3S0w3bHVhRjZLZTBX?=
 =?utf-8?B?RGxsbjVsMDU0RlE3cGlSRTdjM3V0eHZxcTJUa2ExV2g4YTlIdmFUSW4zbjVm?=
 =?utf-8?Q?Du9ltSCnfhQDT4WXli/P6fkqr0iVLUTW?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 12:40:03.7033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0d8430-e05b-475b-4f11-08dcb2f03b5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9766
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 12:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202905

DQoNCj4gT24gMSBBdWcgMjAyNCwgYXQgMDk6MjIsIE1hcnRpbiBIdW5kZWI/bGwgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPG1hcnRpbj1nZWFuaXguY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiArZG9faW5zdGFsbF9wdGVzdCgpIHsNCj4gKyAgICBpbnN0YWxsIC1tNzU1
IC1EdCAke0R9JHtQVEVTVF9QQVRIfSAkKGZpbmQgJHtCfS91bml0IC1leGVjdXRhYmxlIC10eXBl
IGYpDQo+ICsgICAgaW5zdGFsbCAtbTY0NCAtRHQgJHtEfSR7UFRFU1RfUEFUSH0vdW5pdCAke0J9
L3VuaXQvdGVzdC1wcm92aXNpb24uZGINCj4gK30NCg0KQXMgYXMgZWxsOiB0aGUgYmluYXJpZXMg
YXJlIGJ1aWx0IHdpdGggbGlidG9vbCwgc28gdXNlIGxpYnRvb2wg4oCUbW9kZT1pbnN0YWxsIHRv
IGluc3RhbGwgdGhlbS4NCg0KUm9zcw0KDQo=

