Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A96C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:06:49 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.69])
 by mx.groups.io with SMTP id smtpd.web10.31717.1723032400398996553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Orlj5ZF8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Orlj5ZF8;
 spf=pass (domain: arm.com, ip: 40.107.249.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qIFvSG6xbxIEJuy6h2mrGSwC0Mt3t+tWOg4ibmFjuCfTWhk2DHoSVlKrBAvFPXWTAdCnf4aEoJcuC2+4xlNPCN3wscsF8U2KTfQJW2LEXvcR5cqs16cswY11WCU5nJFSlc6FTTVPRisDzeuFAJA8bMhh22uxQy+KLgrU2JIUlrrDpyMdOmg1hCGbYquFl0PJiu64Gkk6+WZ64J10FOaPQ3MUfHWPHYOlOwwndT8P0Rh14zmV5QKflE9ZIHfdcnTQF6OL9B02KyYMxtFUk7Us6Frfaxmix1hdZ18hPERVMzMTdCoSZRJek+dvzraCVZA8kJ0UQJqK17FkYErC/Z7XqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTNpKr48S/IaOZO5qQfRcPVzgvGL2WxoUG0yHdObegc=;
 b=VDBvqxXQgw6bHJ6m9BDApdoKRy7Il2vsgBLXOtWgEY6cE3tpLXGOh/m3Jf0DIZPKtA535LZaNNdUHrH03af6TSkTup7DJxwCRAnlTEej2Ds3TiFjazRqFAiS251+zoIxgEWoQvrA5YC0U07dGkF6aUQDDByxGwHxYwhHmB14Pa1f2TkaTjPXbyqB2OIjtiXR1vZt8+eoIyqen6UnxjluxgJgVq03PX3C6/PuWV/Pp/Y7Lkkp7eiFJ9TvopiWevXMjjJNNErdizU+mRD7m+2SUf60E1dy1z4NgnW4UimHU8a959cXSUh7MkAfOJwjA3DY/GFtciP/0dRrjQWqCrIChA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTNpKr48S/IaOZO5qQfRcPVzgvGL2WxoUG0yHdObegc=;
 b=Orlj5ZF8vMrwu/p373iff+2Z/vJ1bKHqu7jd6OcIEd1mupIysP8ygLsvzQKzhXNW9ftXNB33H3qFzsMMkqqfkxuFgg7MAe4kyxQtRWmYV3l5rT2zb86qKYRdle4/nEnYD/5tOaJRMfBIFHzEpEKS+SQcnia+JkwZUI1f+i+IwTg=
Received: from AS8PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:20b:310::32)
 by AS4PR08MB7829.eurprd08.prod.outlook.com (2603:10a6:20b:519::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 12:06:36 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:310:cafe::c1) by AS8PR04CA0027.outlook.office365.com
 (2603:10a6:20b:310::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27 via Frontend
 Transport; Wed, 7 Aug 2024 12:06:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7849.8
 via Frontend Transport; Wed, 7 Aug 2024 12:06:36 +0000
Received: ("Tessian outbound edeef5361dc2:v365"); Wed, 07 Aug 2024 12:06:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c80add5cbd2d6bcd
X-CR-MTA-TID: 64aa7808
Received: from L440388ec92d5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EAD2A629-E6EB-4BC6-9912-7C7EF9854135.1;
	Wed, 07 Aug 2024 12:06:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L440388ec92d5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Aug 2024 12:06:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxZoAfbE9UTSd97xraQvtBVdSnhqMVu3O82aEzcP0gGP9+/0LpzFqrK6QIfKeHtb8LGAOu4Nq4Fi8C9jzfVE3WL2KIqVPWQYFfr2hih/UTJ7GCoctncsqfN0uof1no7Xme+o7PEuhIHpSoPYwpWVB1L/a+XF3yb9YDNT1d7vUIQnVw4+nt0ar5TNlSsqDL1Y4b30eAFt3CUbUvmAnphi4Ew/gCqVndNGkqaZlwouWQrHrzZpAhpN9iInseOtcgDMFP1drOUvxQ8s46CzrYDjlxxhdrlDjnIXqePmJEnv/BiDqxi5X9xNtRHo7NsciXKknyLmaplz5GJWll6lU1wLMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTNpKr48S/IaOZO5qQfRcPVzgvGL2WxoUG0yHdObegc=;
 b=Br73Bq6ooUkU069/k7K08DwOvbIaCieC6/k+X8/FSUDk19dxPsUe3M0vauXrzI7/BXVq/ZYi4nQIVPsTYJctrVLVuVM7zt2RgYOG3kK8kHtxmA1FTJFIftluX0JRDfDjeMx8fiAZvWXWPAc1DOZa2q4TrCFCvHMvG4UtwZVuA92kApeswRHKHf6SM79ca7a8/4GOD/owU/3Z045weNO3cU5Dze29FOFh5/3bNri2rGygO3ktOsKOCImZxGdF80zgMNe4NPZv2A/yU8kVJTMnwDonk8SlYzDI5hIqMypMoyNK8exus4FaF22DhEDYn8oIkDLVS/afYauCnLYG2/VcPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTNpKr48S/IaOZO5qQfRcPVzgvGL2WxoUG0yHdObegc=;
 b=Orlj5ZF8vMrwu/p373iff+2Z/vJ1bKHqu7jd6OcIEd1mupIysP8ygLsvzQKzhXNW9ftXNB33H3qFzsMMkqqfkxuFgg7MAe4kyxQtRWmYV3l5rT2zb86qKYRdle4/nEnYD/5tOaJRMfBIFHzEpEKS+SQcnia+JkwZUI1f+i+IwTg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB10067.eurprd08.prod.outlook.com (2603:10a6:10:493::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 12:06:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 12:06:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] kea: upgrade 2.4.1 -> 2.6.1
Thread-Topic: [OE-core][PATCH v2] kea: upgrade 2.4.1 -> 2.6.1
Thread-Index: AQHa6DSabGWQxbMokEWsfuiFs0CXQ7Ibs/8A
Date: Wed, 7 Aug 2024 12:06:27 +0000
Message-ID: <BC38EC4B-C25C-44B5-9C72-48095ACCB740@arm.com>
References: <20240806191220.323104-1-tgamblin@baylibre.com>
In-Reply-To: <20240806191220.323104-1-tgamblin@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB10067:EE_|AM3PEPF00009B9D:EE_|AS4PR08MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb1d252-3f44-4233-4476-08dcb6d962ef
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?U8Rss1E59jIcJxLE3w9UvZ2RKmZAvX/KIaQxhGNFJhzS5Uh/gMtuZQ8ekNAm?=
 =?us-ascii?Q?rZBbdLKoz9qK9FPD+TFxKZLwkPArOAbhA8IeyaHomm4r48v60Ch4K5HZ7LVR?=
 =?us-ascii?Q?8DaLUaEnlAHzimLjoNjhlHPoFuJV8JuV/X7vtEt/MpIvFg5k/SFi6KWXWB9M?=
 =?us-ascii?Q?ED8ADgciYDO11CcAKAGLvxm8+9g2427ZfMd1DL3UeKQhUmzZ23haapTEGXGl?=
 =?us-ascii?Q?Yz9CfYARbobLXTbMLLgG4OEky3RMV84Q3M3Tkhh7TSaC07TE1DcQrq9aMqlk?=
 =?us-ascii?Q?u8QTfs7Ue/0Tod3ZwBNi2F7LwajClOekhwmwrikr1bEuBeg33DqlTYgdZLGO?=
 =?us-ascii?Q?yHo3+OMzr0te2ix0XzHameS8JvbfUKvd2aHSUPyW66HLdlags52EwpuK8rmS?=
 =?us-ascii?Q?qzCOMne5YKSgFnq/9YDqwaso086V7MxmzVJt4N8e7MhMnfsj3fv5NEVneQ4i?=
 =?us-ascii?Q?f+uaxiwerdC2PqUQUzPkEkHsxig87nYrUW1NbjqXC8yYbTXlHEIMT0PBmgWw?=
 =?us-ascii?Q?JVpYZRRIYvfuvV7KoYVT883rKxPCo+FUIiC5QupV/Kh0wcnq38REfurc3c67?=
 =?us-ascii?Q?B1/Ww1Gdcv2tkS8zTHiqYfJSfg/ZROywl+LoOWmWLeImgaQHBLVdH5yC3u+C?=
 =?us-ascii?Q?RJ7TFtpYxGhZ+of5BgIgFbZEyUQs8+wJPF96hhczYw/TGNKtn06NtPKdikl0?=
 =?us-ascii?Q?f1un7jqC43GwZs7aZqNwUT+flxOUimL2MHxlTV9lS1dkHyl3RRa6Ph+0BXpA?=
 =?us-ascii?Q?TQLUc8vqazhfplYxPtkOFG3fDXkdjKcrnLhQ90/NQNodxsc/SLCwyjUvmwAT?=
 =?us-ascii?Q?tpVCoNlDYuEu1Pq7MI5WU5vYxcVraHzrnoP+6VkfeXiH1OiuiVHo80sU2mws?=
 =?us-ascii?Q?JaKySJ4VirsofKr1uJsPMMEr3Pb9tR/aYuNwbtGNlmFg5ErfWWSShNYOc6qC?=
 =?us-ascii?Q?m49h/hStim4II3uoi1OdWIEfO6Yy7xfYm0wl0IYpzDPZUPwMjs9a/DIBQnZi?=
 =?us-ascii?Q?dRm/oWCoR62N+4rWRM0N5VN4b5dqtUvXe9sst9WPIE+RB4J54lxC8/nwottQ?=
 =?us-ascii?Q?akfeDXbB7dHomYYZ8x/zIABwbeqyE1i/qtTMoDy/otN7JlET9ag7aAUnj2XT?=
 =?us-ascii?Q?hTsf6GBDnGcH+ojeRVCjrVctUW/cmdxuM+9fWMxUGYTsSX6WUTJbscOL3i+7?=
 =?us-ascii?Q?KRZnQ5qT6NEzfHu1znZGcPbQ/TuyEujlJlZJZKWc+xHAHN4wZGUGKnb6b0AN?=
 =?us-ascii?Q?K6G42WPMyaqew0HdVvFR72NtgB3tmWGBVlb/mh7aFCIUP8ZKmNSLJb0H0+38?=
 =?us-ascii?Q?SysVB0n5T/SF7bFmu66qBhZxvrLNshpUKmXx7MVWnq1T0S1m9btyQONp1LAR?=
 =?us-ascii?Q?YA/Up1Sxdbuw7UdEu259cp0lWXU6NrfzNM2CtWlH98BfDvOI0A=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8188B2C19DB8F24EA875C3C2B8D7511D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10067
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c4763198-117a-4e12-2cdc-08dcb6d95d72
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NfcsmDbCcUlVmLdV/68NA0kIQFg+UxRemp84WIfLfiCXvP0iBzyuUsBh3Ywh?=
 =?us-ascii?Q?0tTT/eAzjXt5Jd6BAogRraCTvu+AgX1yOLAi94u5V3gR0qJrTWbzo240bVNH?=
 =?us-ascii?Q?DpbPkXU8FVgpLr2hOOzRDXKHNpUg2YKJZpJ7qY9NY0JIK2ESTxca63y51odX?=
 =?us-ascii?Q?HyqQcD1xcVnK0+OtpdHE5MiIW7RXMr8x6+QzyMMsjL8HcHg+/fkJsDh6PCQ8?=
 =?us-ascii?Q?dKPEl8eN0u/x/0E16YmQuFtOMr/1uBLLU1f3+zBVKqO6OUHal6iXjETNZ6DX?=
 =?us-ascii?Q?CcJrDyP3SbD71OzfjPwBaY8MGTaaUv+l+lsIzNfszMSmIiqtauiV9dcO1Adu?=
 =?us-ascii?Q?NhNkY6bIjEHmbhByw7x2NrDG75nec2EI9g5IV4PBVBcJ4eJtTsAUFrxPx5HT?=
 =?us-ascii?Q?G7vG5+DTcU630tOyhPHgXugLGCd0MAbnSJm+1DPL5OS7xy35Qz+sOv8QWYzF?=
 =?us-ascii?Q?63zPKZIRLqRcuvZPIcW3puUihSLr99J2HtjRjzrZOICB22oM5EYC2/gD5A4W?=
 =?us-ascii?Q?3CG0qQnaw4LwSQI+4g/zbV2Za2Fo2lpjYJucJcw/p8YwXl1/Bjbacnt9Jn21?=
 =?us-ascii?Q?lw4myctl86/7IOF+ffahueaqEvFdcgFDUM4Hy0Ra5J6h2q8/xyFu7oCHeTwB?=
 =?us-ascii?Q?dTCk+gs9EVoTTrkxJulACUfrZ8qmyQlGLojgWxN2zoDudtd4h+Ig2Bd/1UH2?=
 =?us-ascii?Q?i7/LmzqXD0uv7/9meyp3EL5ICFFqlwMZBLNGk2vnn6khPcS1vTXhui9vK83e?=
 =?us-ascii?Q?2yquiLl4zs+f6WOf8wLzITzyfyeHWs1wuUEOFVrNUwSr5ZZuAk3xgVwWrfkr?=
 =?us-ascii?Q?KdKDKZUAqjZ3f1T4NMvdBXIAyoPvI2EinsJ4Zm8G29mVRpV10pkbsUPslVWd?=
 =?us-ascii?Q?fozhCMvNERLs4EobMtYyzg/MzgVHo9MlM1NmySSCu7MBTXMZzNOOV667KYvq?=
 =?us-ascii?Q?YOnht8lDQu4WaeIXyhghSR53y2vAHnB249bh5R8xfl+wk21Dt3IuEZ1zFhZF?=
 =?us-ascii?Q?nOOgpJbXFL6XyuCGldOOopGelrvuTBSDsFN+QJFY/pxbklNKarGhH2PyIgsf?=
 =?us-ascii?Q?z8YFFd4V0YdXy71pMoPr+0wWWXrRg1PCFNkBygsZXQx4IhzW/QNip5Z0qlTm?=
 =?us-ascii?Q?LrmK5cN9gXj7HLLTv9IemdTXtwSJ3HiOWO/Yjl0Fq/6N5x7E6ZIp/iJOgcvc?=
 =?us-ascii?Q?cjctlytzBWLcjNjSBGwIKSbPpie5svEY5yeZqlCEhezWOOlOChbhD/iDj/sp?=
 =?us-ascii?Q?pdIgbzGW4Ic5voOZF0S0kblVJFZsai0P60I7lg8nvnuFkttORGjCaiQyo7fc?=
 =?us-ascii?Q?XQWbIErn29hVF2fzWVMRmzKahpIKmFufNZCIirmYTHEyId0af+/T2LW4Dtk2?=
 =?us-ascii?Q?NUZnkXsMn+pn8YxZWCareiLCJiDIw51EUAngTinrCcHDc9JCYeZ++mv5CcBo?=
 =?us-ascii?Q?Lpc6IHMt7bT5qncP6cPDXdPY2NEBhMw7?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 12:06:36.2367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb1d252-3f44-4233-4476-08dcb6d962ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7829
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 12:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203066



> On 6 Aug 2024, at 20:12, Trevor Gamblin via lists.openembedded.org <tgamb=
lin=3Dbaylibre.com@lists.openembedded.org> wrote:
> +    sed -i "s:${B}/../${BPN}-${PV}:@abs_top_builddir_placeholder@:g" ${D=
}/usr/sbin/kea-admin

Is /usr/sbin hardcoded into the makefiles, or should that be ${D}${sbindir}=
?

Ross


