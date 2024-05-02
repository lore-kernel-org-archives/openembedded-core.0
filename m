Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71479C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 12:55:36 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.50])
 by mx.groups.io with SMTP id smtpd.web10.4500.1714654526543070935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 05:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rGK7YimZ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rGK7YimZ;
 spf=pass (domain: arm.com, ip: 40.107.247.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PZaGoujgO1HZqVMJhXoNx5nXZYU0CNz6673Ks1R0LdxS460vYHVzb47JGuBW2cwjkqSH3/5SMeRa9BJxBAxL7qty0+A+N07mfLxQtbfYUmdWw4sVvlCilNDaVszyS4P5zACHV9DmdWmNBnU5O6fpRfZD/7Yxp4joJT3s7W/8ODNxBdk3rzwkREVcwPZdq+kElyT31tjBmZmtmvtyFRfPvdCdxCSZf5jIEXGwvWlnT1ip+zuSyMUovswAVMAi1hTFCl9csNw2mur8gH4JWi8nCiU8PPKUNQukC/s3POYv5CS+gwzCqyCRkxFao+rbvV111RRKelDhrk083UEp7qWFwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VQKQMLI220CIHoMOLsxJorl/yGzCCKceQPk3BQtDzw=;
 b=NwegR7V66MGrpV2kretlFe804F1XNylHZY+aoq69YzOU06w3EgiKE3EdIeOtzCphFR7onFciNFP7TCVGpTJ2FPDZXN+eoEkx64ECQlI6RmF3RNJGQiW/NeeH6Gxs5a6gWSKCx+S/nIMGlgPH2IijQzpfBiBKizut/zSdqz1PB4ZOhscNUn2lwO7jBiEl4tBPRgXyx561TtzGJ9K0sOV2HRLmu9SHEU9QMxhDMAdbKIkOuBgDMrpUmL35DfSLDaHu2oLcjyJq/2mKU4lO9k1Ke0G4BupWq08NzUN0A+ZR/JlpcOy0pFWYormfJgw4MQxObXSpoZQ6rQUBtGa1cSUoxA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VQKQMLI220CIHoMOLsxJorl/yGzCCKceQPk3BQtDzw=;
 b=rGK7YimZKI9XWWj944mRXSpimCJzyOiTqbOrDnh9pjUUp76hP9DuO2dV6fzyDoQ8MEM+ehvunG6bdkJMY3vr/2rRhh61dkkfz90uOQit/sLXOD72JHkJRexztKvcrTGmDo4MtlFLUV1/MiNVGRQHVm4Aj9dYXht5im+55UJV26k=
Received: from AS8P189CA0039.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::11)
 by GV1PR08MB10503.eurprd08.prod.outlook.com (2603:10a6:150:16a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Thu, 2 May
 2024 12:55:22 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:20b:458:cafe::de) by AS8P189CA0039.outlook.office365.com
 (2603:10a6:20b:458::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28 via Frontend
 Transport; Thu, 2 May 2024 12:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Thu, 2 May 2024 12:55:22 +0000
Received: ("Tessian outbound ba75727f6dca:v315"); Thu, 02 May 2024 12:55:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a3d663c824be6967
X-CR-MTA-TID: 64aa7808
Received: from fceef794aab7.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id ACF2BA1A-89DE-44FB-9C10-D123A9FFD576.1;
	Thu, 02 May 2024 12:55:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fceef794aab7.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 May 2024 12:55:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1KX6qIlBlK1ha2dBdTtz4az4uvqf5FrD0Kyh1aw5xUMZn3GNqyPzABEtAcL1R+JUgY3Ht+JsYniPyUSei1Sq29zs9kBhlM5utdUevBmyrhOf89doKo29zLHIoldOmKx9+7sv9mK78SMHrk7BTTGgki7xomGFaFSMXoHMMPIxapMeaVBl5BBi/O3Ktr8cv3HLgBHAEI9hIN71AEmUZh/DWU3Qeq5zxRtozxRPhKcw7nGSwErkSobcKs7hF5HalTrrrqzd5AFI9ETqr9v+Faj5OIVYerzkUr5TkkwZftpp7/Di3SERGuXO6k8ensCAEAO9OqRSh4/TvH51lPiYBGxbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VQKQMLI220CIHoMOLsxJorl/yGzCCKceQPk3BQtDzw=;
 b=gQ59MEarT2FIX6uQ6MdMaMgcy745m6Cctr7t5qKpX80BcRqZA/HWNjj3zpjlVdr/whkK/n2DATwqCKc4fJcfflbWFmi3OOv3BCdK31thVqOGURuYo/3owPUoQi208dQApHq1wGA45hH3G3wGZUt8Gas7KTlNh/5BPFTYAZb5Nr0HiykGxNjiQQByrnl02omGNA5dlBXggoJeyZ7dmek6CtRKWJkCZYfLYdN+NRBvALLYjlr8Kq9bO3Wd4FSFb+dg2UnJuuTOj5m6LxK9+RJUOsdVhcApSAJ4P+E94pFtxBEt+SzCnaoxA6tfYaLlGLvc25NrTVZI1StIRxiB4ZwOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VQKQMLI220CIHoMOLsxJorl/yGzCCKceQPk3BQtDzw=;
 b=rGK7YimZKI9XWWj944mRXSpimCJzyOiTqbOrDnh9pjUUp76hP9DuO2dV6fzyDoQ8MEM+ehvunG6bdkJMY3vr/2rRhh61dkkfz90uOQit/sLXOD72JHkJRexztKvcrTGmDo4MtlFLUV1/MiNVGRQHVm4Aj9dYXht5im+55UJV26k=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6723.eurprd08.prod.outlook.com (2603:10a6:20b:2ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Thu, 2 May
 2024 12:55:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 12:55:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Peter Hoyes <Peter.Hoyes@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] u-boot: Enable devupstream
Thread-Topic: [OE-core] [PATCH] u-boot: Enable devupstream
Thread-Index: AQHanH+XgAlETyHlCUSpVr6f5gbySrGDx28AgAAfcQA=
Date: Thu, 2 May 2024 12:55:09 +0000
Message-ID: <1EB3EA63-E201-4593-A262-29D719E640EF@arm.com>
References: <20240502105721.775868-1-peter.hoyes@arm.com>
 <89b78e2bebb91b35952b7eed06ea8a0919fd31a7.camel@linuxfoundation.org>
In-Reply-To: 
 <89b78e2bebb91b35952b7eed06ea8a0919fd31a7.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6723:EE_|AMS0EPF000001B4:EE_|GV1PR08MB10503:EE_
X-MS-Office365-Filtering-Correlation-Id: f0fc9360-c011-4560-cc67-08dc6aa720cf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?WYHezsXt6S25HuhXaDDjCfimPfWzM+rocu81QwGGgKzAr0gUuVnOm9zzDmbq?=
 =?us-ascii?Q?F4p/ivfZGAd4S9FGzrxx5IUpIv91l50HkqUVbiuwq7wkWV0/t1dPz0YzhJ7H?=
 =?us-ascii?Q?tBpXT5kX3HT9xsf45tPe8ZDtGjEaGtq2ZYw/wkhg2TVe2V5Kt/7qZPxAr+8n?=
 =?us-ascii?Q?dGY2Xqhos38Wrl3MUc7Luq1yCP9IGj8z64rSqK6BGE48l/Sc54QdaLftc77S?=
 =?us-ascii?Q?tVJBRrHXAuhuSd2ZBjKHw+gyviQ4STmtPq/nK0r/oSfVAncZSgIb5nXioZig?=
 =?us-ascii?Q?pNJPnI6xpmIBclQZZVGW4w/XyHW5qjjiIE/ewMO9xA0+upciTY5Dyx57Aqbl?=
 =?us-ascii?Q?YiA8MboIX6vfVblDpJqeDJRTB7pxYKoWZi0N3LYJSSWHqQodnOr737yEh8te?=
 =?us-ascii?Q?grtlJKvyULz4C2P1LTdWLy6ruiw01qP4kNGSjZQbzsH1hHLE/ZsSafmWl/Yw?=
 =?us-ascii?Q?9qY/lx6+jCp64fsIDwY0Wy0DAFE1F2LifhhycdOFDbNrd8/lKobKwQlN8VwW?=
 =?us-ascii?Q?B7HJvA8RVcga9TCGM+Y/rF2nD51x4p2mXEt4anq02/f0Ixk7a04YF43VTrBi?=
 =?us-ascii?Q?R3KFspbe1AtH2n2HTYOa8k6v+AnZR/LfAQwrMdhIhNrRrZDV1Fnwyg7tDTS0?=
 =?us-ascii?Q?7imFs9V1HCnzlgu7Jn/B++8DoSt7xqFlNIhHT2dpXOMzZvAN0OD7lwSMXeJa?=
 =?us-ascii?Q?BZvfLYfPLD8RsSR6kQef0wE7M+985xUU1Y7p8bZJFpj/M6NdGTah2uJVDR+b?=
 =?us-ascii?Q?20ub7L9AuR7afu3VVoryAC9PpsXqpM5cXuuigC/hewO4rxOAF/tDXHBb7ahS?=
 =?us-ascii?Q?d5d2mo2hdxFtdYGzmaJue8a9dlUHwPVV8ZFoarDll++5g7skIIHEF87VPrvp?=
 =?us-ascii?Q?DR3qGvsm7khcifNZEEzq1Lr7zgwWXCWGei2LCovX6m5hbY6RMFshVYGVdW8Q?=
 =?us-ascii?Q?Ql2AuZekJaAS4Ap3RwuqbKg+cJ0CZO/sTT52LzYxABFKjaC3p+O8LOpdikum?=
 =?us-ascii?Q?KzhK61M0b0BTqlUK19kl/LmbDQOTtJOyyGJ5qDwKJG64mlycopWrUQOC19+/?=
 =?us-ascii?Q?3o0bENtANXjQd037+Vl6YrgcV2HTi+f1GLj6Gz2yFT+OoRadbPHx8AMQkELz?=
 =?us-ascii?Q?faHS8cswBSNIlhhnbBY8JsA+Lh7nYjJuxSwLsbHGHU1ebiHz8RKjKfG1b1Vb?=
 =?us-ascii?Q?bApAySRM8B+9OW1neQn6s6gde/BeUs6bt7rI1/6Xu9/yZQmdj9IqoVmQiN8W?=
 =?us-ascii?Q?VdmDVuAehILSD6HC5AQfupvTKZAY8nGPI5rCI/8MycKTNavyvbYgKV0XMj4x?=
 =?us-ascii?Q?jgL1EoCsoYpGWuDcm4O/Ddbij5VIU3lwJS62S8qdhwVVZg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C58DF98D04D29646B6B77C24ECA116D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6723
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bfa74647-9867-4da5-465b-08dc6aa718fa
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LI88bq5ADmUrxyC72foL9wffV/Hhc7t6Oz1tz8YCKBNNwoIzxybOm9iL/RQ3?=
 =?us-ascii?Q?V4H9IJ5Wg273aOSdtKuBDMvO/3+/8BZgB+CbBfdGIHg1tF3ia1jrENyArj0E?=
 =?us-ascii?Q?puC9okJq8W8EmLwMX6z6Qb7SKWznyxHn433OaihDnvqyHTcnN5kTIP02FA3N?=
 =?us-ascii?Q?uLdhDVF01TUxwhNO8gS7cJAc/mxySDG2waUAs3xcw/N+8+43emjyz+ndBmfP?=
 =?us-ascii?Q?8RXAHaqgOyUEOTCoBfRrdbvQH8mpxuv2j2UlP9nXxj9wpSBmsM7lGfWd72VS?=
 =?us-ascii?Q?NyEohqwf27AfE3AQnGk08ehZJYKJ/KPfNcsZSZyqkg+UbFtj+Sv9SW+rH1vd?=
 =?us-ascii?Q?dIDrplEWTsBcFFovuBt78DQKwXlgs+9hIfHi2GBL/qSLvmkN0QDW3Akfg1xP?=
 =?us-ascii?Q?FmPnsepUUsfMzfK4XlBhmUYwDZgiH7PhFOumi3rEt1we3rbSPc6wQLwWMIfW?=
 =?us-ascii?Q?2nqirmbtzdTW3KNvheL6ZYdf9RV38rjKjiQSL1qwhn3OHdModG1zdeTWQzin?=
 =?us-ascii?Q?98wB0f0g635BQ9hyR3/nteEiGHPorjoaVR55Gq+oJFjZ0EXW13uWkFWV/FJ/?=
 =?us-ascii?Q?mDnLKuQS9iLu1zHmCzJwNzMFGHqx5oSJxdXOOa0uwXQnGwU025YhJaWgpasI?=
 =?us-ascii?Q?rwLv4102JfOhp9M+1KyqXmaV6rajnD4KP0v5WFDOeH2WcgBo3WyF8c1fC6p7?=
 =?us-ascii?Q?elngg7UuEJIEwzqK35G9MWyMWAfMB9iUwqMOiBOMm6YNtuTCUxIkNUXW7GG3?=
 =?us-ascii?Q?4KsXJpHpn6gkjOBuW2ASZGKfM8LryLJK5IND6YRWTJ+AOWoajmYTgXLodHMW?=
 =?us-ascii?Q?kzGk3YZ+eTfurQ246LzPzKkPW2rKiYhGX6ZzEy0pnMIGzPyIpCI7WppFLr4O?=
 =?us-ascii?Q?TxcHCIouQeB98x+LzTLT2ptirmI3huQ3moOIGWKPEcqtG32riotCV+cB+gLP?=
 =?us-ascii?Q?YzHYQBQ2lJyFG4jxLN3F6avflzmhLpRlubyIRVG/JKUba0ZeCrTxggwE2XjP?=
 =?us-ascii?Q?ViPNQNcGgeaSStxbPmIJeLbUGe3jVbPX8+XQ3xBIA6Y5aDoi8b2uU8pdRWIW?=
 =?us-ascii?Q?dMPiSLN8ZeHq6CFuvKpWBE41UIF+fprPfxcn0akn6uE5G63ArTihj8vi6yNd?=
 =?us-ascii?Q?AusvFn201uqaDBB/xQwoZDY0dETlxP2lM74DCE7DoP8B5A8iORMHC9XEj/5L?=
 =?us-ascii?Q?o51NSclVvQVAvRO7696LtH6tq9186hNurXca4Y/z2WIESocysQ8BywGYS0Ux?=
 =?us-ascii?Q?OtgIUzYlBXQjTEsPbAiYpHKO8gtXDIXniINiiVCM7BwRWm/RjWAqB6Ksj22r?=
 =?us-ascii?Q?uibzxjt1B8Ixwaes8kKq+ViPx//Gwsr3qLCE3OLes0cPfvOSOHmvk3nqltj9?=
 =?us-ascii?Q?xfopmzP3lHaQGXQBoVNTxB3S7A/+?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 12:55:22.1870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fc9360-c011-4560-cc67-08dc6aa720cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10503
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 12:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198916

On 2 May 2024, at 12:02, Richard Purdie via lists.openembedded.org <richard=
.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>> +BBCLASSEXTEND +=3D "devupstream:target"
>> +SRCREV:class-devupstream =3D "${AUTOREV}"
>> +PV:class-devupstream =3D "dev+git"
>=20
> Doesn't that mean parsing would hit the network by default every time?

I _believe_ it only hits when the devupstream variation is actually picked.=
  Is this acceptable?

Ross=

