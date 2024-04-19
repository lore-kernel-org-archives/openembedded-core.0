Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96573C04FF6
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 16:38:43 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.69])
 by mx.groups.io with SMTP id smtpd.web11.26095.1713544720766306707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 09:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dzyXkRCN;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dzyXkRCN;
 spf=pass (domain: arm.com, ip: 40.107.22.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DJT4HMgSVlzoe9gAtbkDT6LxmpRvrr9d7Bvl5AlDBVqOPUqvvk726KREdSxX92MzuL4WlmFAbgY6hU32q/1boOquvAJrk1qXHD3vIQUj9xBfBGRSPbmUcFhvhj1ttfFBmy0Luoaj9WK6E8XML22JzNCvoGdeiNIGe8/HEn0Jy7pw0ffSV/F/ors5vhghteVpB2xlOIwg3CHwX0+W09ccaKRZ0vMPV6J5f8+aQ6Ngh+hcSss8ZtYVQCfGUGJrcaxXNd2ehceY6EtvBxpSq/g1K/n0EP0DnvqfhGaUw2blo+c8YgvtSdG0F3bMfdfGzYNm+asyX5rt1cfy9IAfsMIlhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PsedSn5Dva9FetIvrSc/w85jJgvtQ7IwqkwBpV7Y8U=;
 b=LLtE1DyloAe+OGJ3JZ8v84EXT2b6Kdw5icKgwvQAF7jpnWqZVl6pyfIVhLqDOTl/vyWo5F4ysJSsSaDD3lYPboPateB8hX+c1+/EkWZiQ8Rkg7jxFaMQCl3CLt04449XIYoFLCyE4cb7lBMnZ0n46XoZfSFJaROspcgaf5WFQv6VeJ/rWczTquTEMjKhhtiTlGqwjm73RipiKEciFgkbg3GZDIUSmDsZqGRoB8CaRWEOS6B1mPdggPibXUeUHSyMEbQho0LN3UUme1hHmuXYfnHBoZbJ+dO1BNhWQQyjx2y/7V6r2aMdPOZQgUM6K18ckvm08Z1vz7mGm6wcMJAXgA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PsedSn5Dva9FetIvrSc/w85jJgvtQ7IwqkwBpV7Y8U=;
 b=dzyXkRCNoCt+JcgQHEZUHs8xYLOZN5vr7bvPkxnsowDp9SnHfREnos+l8eBM9N8qkQtI1+Zn2rBUNO3hKpeWh08BmVAvxP1I9OOE3i7QTHjXvB3dYBHk42kozMyHLPkMfA0hagNWwdSVIF/FvGIP2bdtgrTBOzxKDa3Ijw8ZruY=
Received: from DUZPR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::17) by PA4PR08MB7643.eurprd08.prod.outlook.com
 (2603:10a6:102:261::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Fri, 19 Apr
 2024 16:38:37 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::68) by DUZPR01CA0008.outlook.office365.com
 (2603:10a6:10:3c3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.30 via Frontend
 Transport; Fri, 19 Apr 2024 16:38:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Fri, 19 Apr 2024 16:38:37 +0000
Received: ("Tessian outbound f1e9a43166b5:v313"); Fri, 19 Apr 2024 16:38:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 820f84bdd7ec4dee
X-CR-MTA-TID: 64aa7808
Received: from b917ffb51786.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AA6A6435-D839-4E6E-AF82-35CD2D648F73.1;
	Fri, 19 Apr 2024 16:38:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b917ffb51786.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 19 Apr 2024 16:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjNhCQ47Jz2t1Obddlw8YZEJbJKvXMTBaxndSoEoaVYTB6o9FNfAljVtQsuzTefhibbFe7W2Pvi87jJNHPttMwuAOkXKMPQe28bMnN8kI3eqJdFteqD8uJRMufqj2ITjsyGViXTAsjtkJtIBK2gDIkHQZKQAP5bphEYY3Gx09Tx5MhA19YM1ED95ZT1P9Qc2/luX6UVKTjHPFG1QdiQDLg8jSw633godDyTDzrvXLlAhOovKzo25/jTyp/RoGWhBqnNtjJ8QaiTM3nXY63fHlt7UU+wca9EDt3DVuuwqS+xm5yx/2p4R0lQRsyVJCqPIOdcrnEPh0ENtkajPzVwJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PsedSn5Dva9FetIvrSc/w85jJgvtQ7IwqkwBpV7Y8U=;
 b=n04XDuI6OOAIIiwioEDZ5Gv5sgYM2gR+sGzpIr+cuj/dgZhnb/eLuD0cailShJock+uOds1sbHw3j+FTYi/PXBo1c4BpwiCcGbJbQrtbSuPyqrMT7LH2ZqmOxMCjbJLaREagPR5MdwgzpSUbPPPw6ETFdHXraiI6OA1v4JNUxROW9vcnANtAojLkGcPj5et0JNUBDOopMiolH0hkMjQc3vvKqB6nfI+8K8eopFZLjr8+RzJiiAOYaoRuiGSiDvo/x+jrPNTasfKv9+VZMR5mYnOIPpmfV/OwCvijb9SdDBH7zXrqO+eaY9CgVM+vQFQJDMzhKEzX2IBsVc/FZmrFJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PsedSn5Dva9FetIvrSc/w85jJgvtQ7IwqkwBpV7Y8U=;
 b=dzyXkRCNoCt+JcgQHEZUHs8xYLOZN5vr7bvPkxnsowDp9SnHfREnos+l8eBM9N8qkQtI1+Zn2rBUNO3hKpeWh08BmVAvxP1I9OOE3i7QTHjXvB3dYBHk42kozMyHLPkMfA0hagNWwdSVIF/FvGIP2bdtgrTBOzxKDa3Ijw8ZruY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9933.eurprd08.prod.outlook.com (2603:10a6:10:413::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Fri, 19 Apr
 2024 16:38:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 16:38:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 02/19] package_rpm: remove support for DIRFILES
Thread-Topic: [OE-core] [PATCH 02/19] package_rpm: remove support for DIRFILES
Thread-Index: AQHaklP3QLKERCJnD0GeG/hAtvxj7LFvy0oA
Date: Fri, 19 Apr 2024 16:38:26 +0000
Message-ID: <39C19BE2-C704-4D5F-AE00-3F13B2FD04C7@arm.com>
References: <20240419121945.1920944-1-alex@linutronix.de>
 <20240419121945.1920944-2-alex@linutronix.de>
In-Reply-To: <20240419121945.1920944-2-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9933:EE_|DU6PEPF0000B61C:EE_|PA4PR08MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: a80007ba-914f-4a40-5927-08dc608f2991
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?W88CxEM7BQudMlyh2iJij7/E0+pRET4r/TWEciiZwxSgkIOxGWugsMHhxXQA?=
 =?us-ascii?Q?pcGXzZ2WTlWB2LhzZa1qkZAS+kmtTLBtSuuSLItnRUlM2SZq++Jfv3tlXev+?=
 =?us-ascii?Q?NsuGOS7RhkkFn9NC+7E03B9O2r8szPTz5GkjViv04mgQ+GkRRnXmC9cY19zO?=
 =?us-ascii?Q?yNgogF4X2k87XnVHQMk/BFwx7d1t9P4ga9rC7uENrAUeSU58A+O8UByFjnWS?=
 =?us-ascii?Q?LAUVaDyJjbg0p80Fbb21Se1VCCnMnZarED8TdCD9weAtikGCa0OoijvDN9+V?=
 =?us-ascii?Q?6oG25l28VHWv9llEdL9OUlbyf+/X8n6q7HuRMX90GXISZLLvxpIL2FHHag1w?=
 =?us-ascii?Q?xILKSsuQeOchB8q4A5AuINok7SR4LbGL25vzK7ZjlJb4yXAawb0u/O64+SiQ?=
 =?us-ascii?Q?m2vqR/5jYAmhIipIVd+i7Fazeoj8rg4zdObh/CQK6xv3RHLNHwhyQCp/TeHX?=
 =?us-ascii?Q?r8jUBvn6fo9OkNGlVpnGuJBL6GIYuq5HhvrbHACRaHPCQUwf4eanRB/p27Au?=
 =?us-ascii?Q?b7vgc16XuKM+DrhyQwTZBuaDnQDmWGuGhVEX9ZNAuK7iFxoAlQiVx40fc1xO?=
 =?us-ascii?Q?WUk6pkAgErXLgjHufh368I0msbVs1VsfPC/G7UJTac5DWC3y3qQfCiZTUip/?=
 =?us-ascii?Q?DFb3HEaFJEDIuMXc3a2F75zOCyGlzmTtx6GMYzH3B6Ae2j76bkenT++F4kvT?=
 =?us-ascii?Q?AhIbitS/B+BKbqos6K4fHBAuCTNH4TXE5MinkpIO6xV3uW57u4sbWmClNrER?=
 =?us-ascii?Q?JohXC2tjkayG70VS4UPe6FkqgWgQ594qW+7hFleQfueGWt38k9FiLp0+RHi2?=
 =?us-ascii?Q?xHgU1PS/FnpY1//ekBOyz5qusXhkY4Ed8enhBwFJeAlJlsxAedm56Q87SHC0?=
 =?us-ascii?Q?1ibT69ZHtwnvz7REHiFOpQO+Ndq6edszN8CHBg8RzIWI9n4D4xApq6ubuZCc?=
 =?us-ascii?Q?aktvR1aP1/2lFuBNE0+tfvhGleBcDdfzhloEVZCiHFRE108Ue1teKHwkrVmj?=
 =?us-ascii?Q?6uygIRKji5Dt7B3EKmluYIYlX28U61rYwkDlXuaU7wEQgvp4dyog9vm32rtA?=
 =?us-ascii?Q?yJPZBpu+uOSnP8BjgkkWHd+SPKXPqwuCQK4vCw1auIk2pdIZ73y3jyWxBMy9?=
 =?us-ascii?Q?xIni2LMR1nUPIsXfrzNzxUrSZ7ZSVHG5xsnfc/aFUOFEZJZXYbePTXrz3V8E?=
 =?us-ascii?Q?ns6Fgwk/64LYundLP/QQyQMiNho1dIj/4Z6sY0IVJ7C6/dI2MDHVT0LUO117?=
 =?us-ascii?Q?972AoGLXKzf4iQm7nPfZQZablxXYb8Cy8lve5JD38Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <397EA70F0306F64B990D6016F6C91C89@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9933
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8fead9c2-85c2-440a-8041-08dc608f22fc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?slx/5umWHR99KUTYxFvQTb18esfoz9l2ZinmzcbMm4a+HLJKKgjMhxgJeWIh?=
 =?us-ascii?Q?Pcikkp7PlDaKDalHW6jdphw+K+EIX+7KcY9XO+yOUmDKpN9Kd5yq1DhbLKzq?=
 =?us-ascii?Q?qPZCk5Q1LfkSBdALLpqSnNOwkNdZ1IIZvVXQckQ4/rfEzgvmtpj2qpeaR5OR?=
 =?us-ascii?Q?KJF7XMzhrNXbXngICnOGJEGFNLDPuxNb+PAgS2qO2DdDeqEmR733UJ/FWwWn?=
 =?us-ascii?Q?a/HaSAYB6nHQQ4WYKNPyolEj6Ezi60piO90N4lpYCVqY4nwGePayKBWCFmu7?=
 =?us-ascii?Q?GqAh1JQVap6AjEBKAVXD6/HzJKcVWZ+Z+J9d4yHwuRER39Z9IvbfavkaxT32?=
 =?us-ascii?Q?b06GJRg9aDm/QdozP/+7dYGcHnur4BgMvFG13Hk43veDi1WKXFUG6gkQjRmV?=
 =?us-ascii?Q?IgQnIQR2F4p00BWaAOAzX3qbsegKtQiUhEZiuoqR2gkgT0gQGneqEg8tEQiM?=
 =?us-ascii?Q?JSAcT0/CGudBFDT0cZew62zuAZwTTxSrQ6M/Wmuqy6t5n+dboyPAGR89AdTu?=
 =?us-ascii?Q?Mcmkv6odria6iitEq+bOe3m0WVtnyATmLpaevUsIrvBx0twwEVCvrtighMg8?=
 =?us-ascii?Q?srw0JWxbhqxeNP+Hr1B/kfJ6iKVGYhruKjycjARtmnpiQVHmc7eFKyjDkJAw?=
 =?us-ascii?Q?3EYpL7m+W+pQV6YI3saU2oG8+/yHHTB4EhbiUWH3J7mRbYIpyLhAOTZdMGa8?=
 =?us-ascii?Q?zcIDyyeT42L0Q9/LHr4QB91/03hOpCkaXnNfucZjZWBkY77ofhvDfE7WLfeO?=
 =?us-ascii?Q?mi03OSLketWhRQY8OrDCTLENuZaH7F/p4vLTZ20SBXYGJxMn9o3cgtsBgpqg?=
 =?us-ascii?Q?DVx9LQf38XIHHKMLoYSl4S5ZzV9zWNoZKNMxtHwgKG0PRoWGY9AIztd7gNEL?=
 =?us-ascii?Q?wi1SM8MJhAcsa0DObH7HM7unqu5BYnUO30x5cnkH07qCJCeiQJXwp/t+MDlW?=
 =?us-ascii?Q?uV+X08wkgnEOSQCtyyUCCLKlcgPLhSP8QgwiYfyHl1HqUzWhzRB1PZ6aC5Gk?=
 =?us-ascii?Q?KCwyg+M6xvnRRsZfwNT+2lRQ9+xuJBfffEFXwAu69okv9t6A2D6vJBuaQpSh?=
 =?us-ascii?Q?UmbU1muu8Qn9UH06okDHOEjaWhxwl1qQaWg17o/Duqo2BmyIhPEl+T7Y6ijI?=
 =?us-ascii?Q?RB8PzJPE9GKWXUnDIVbI5fXG+lYxQcNYQDegroO4kdBTfA+BOZMTtBgH5K75?=
 =?us-ascii?Q?j2Rjl8/Z2BhW7iNkoPtaax7CNUYJNKl9XEBzogP9PMN4DpW0xnSsfY3PMwOC?=
 =?us-ascii?Q?P5MA9tvFvItSOSfUkpmnkHwT4rxLFKJOQaoQurukmMwAOXU2GcS17vhZCGEe?=
 =?us-ascii?Q?Mc5XP7OXXgvxOPEy441E3DGI?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 16:38:37.3124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a80007ba-914f-4a40-5927-08dc608f2991
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7643
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 16:38:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198555

On 19 Apr 2024, at 13:19, Alexander Kanavin via lists.openembedded.org <ale=
x.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> This was added here:
> https://git.yoctoproject.org/poky/commit/?id=3D2f42ef8d8fb1febf28252b9888=
4cebabc931f720
>=20
> It's undocumented, untested, rpm-specific, and currently
> broken, and to begin with looks like a workaround for
> Tizen/smack security label conflicts elsewhere.

Thanks, this finishes a task that I started poking at long ago that culmina=
ted with the majestic commit https://git.openembedded.org/meta-openembedded=
/commit/?id=3D4d921bb5144b653c2f195fb2e8694a31dbd539f1.

Ross=

