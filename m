Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E40D2444D
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 20:14:44 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.46])
 by mx.groups.io with SMTP id smtpd.web11.54434.1728591276285047147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 13:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nFEkvuh9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nFEkvuh9;
 spf=pass (domain: arm.com, ip: 40.107.103.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BZOD3rX0h1jE8tc7Z4aGuIoS95ulS9oTYTRMBMb9eQnpiBquDu9uGTSc9peYXbzyc4oIxFDtq0NT0JF1lkoncbXc232GimlWSW3+uJoMzYkJsh/o9pNP+8+7Fi+itUFVbtMlvb+1UJanXydLg6y/IDgV7aorNBY+yV3Xe/8jkvPGqDX06GCpRcsRn8gwuyvsYKhPa34gt+LE5qBhhFSRHludzdBi29iWhbDBVpu3KVsFdXaqMLZdhtU1DEFNdeU9TyWfAAYow1H9oNlxNpJkPaVLl3JgVvnCEcYd0/u2lcty5q+1VyKgC2l1pWzVTWoVj0c4ubGoSaOvx5dvWiRJcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4Tx5uoE6rpz3oXueLbeIZUEZs1Vh/P4VdAcpS0WP5Y=;
 b=kEIV/Qta6lEgkKuzRhuJv85QaVtd/Nhyf4ZMe1qMAeFV71En5PCYZDYPEJ5S+5itv+++HTi1XPIfXQVotRdOOGN675Y8moYH40r5cFPVHuNB426VE1kfrFM5NShwIOQSPPaZXVkbnXTkrZ3nozRydRZkc+ODc6gq8U6m57jDp4bdWsEtRYivOdht3QEVsI4owtvz7LPNHjeFeOC/05wk6Cx0nXYr+YH+ySKcsJa32LHc1Itr7uGpPKX32opQVdS9BttGFtCZNTZQUXfkXSxDdbGnCT7bh83ZMVpvuwajXld7lvaGL4IMlQO0/c3+yWJwnGYLvZveHnaRMP/aVU5eRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4Tx5uoE6rpz3oXueLbeIZUEZs1Vh/P4VdAcpS0WP5Y=;
 b=nFEkvuh9Uot9MrfxpcFj4fSJOCgPHd8Hsh6mXXcPVU4nEH0T4zhMO1IukmhYrspmJ4aJOX+jfMh46WDCc5RyygCfeI4Dn7xEkPMTHyqKxpdOjd9uiAKtJka0iqOeg/WqMGyjSIUY8fCdaDhAa3UpeblbprSkWl8/4QBYjZWh3Gw=
Received: from AS4PR10CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::6)
 by AM8PR08MB5857.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 20:14:31 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::8) by AS4PR10CA0022.outlook.office365.com
 (2603:10a6:20b:5d8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18 via Frontend
 Transport; Thu, 10 Oct 2024 20:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8048.13
 via Frontend Transport; Thu, 10 Oct 2024 20:14:31 +0000
Received: ("Tessian outbound 5e8afd4f8faf:v473"); Thu, 10 Oct 2024 20:14:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 34c4288fbaa633ba
X-TessianGatewayMetadata: fSTYb/nzUnAy4TfukqS2Pp0iE46yX98WQTtOJZMTEjjGOEPeePzkoo/dESFco0k2ZVL1FmIuFjDKNeVv4ERn/uDJqQFa8XBIdcIkn8+mUxuGUSDWlJtQZNEOWI2y3ramy+n7fnGUvblZj1FKjQwW1wA4qMjzjhKSWSKMG0iilkw=
X-CR-MTA-TID: 64aa7808
Received: from Ldddec5210438.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A8B01A9A-D877-43F2-BA5E-4DE203DBC981.1;
	Thu, 10 Oct 2024 20:14:24 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ldddec5210438.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 10 Oct 2024 20:14:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nF837R3hXoVG2HfOpjmzDBB/M3Fyced9nV3mu9SobraY4iqGfHhu1pvKyZp6ojwLhjH9VGSEPOomB3r+MgwnBOqEa831WWZNogiP8fa72CPWRz18JHeWkRsz2EvT5urkjQ6BSW1LvMGjCnW1DvBg6wF5IFfrKZWBPFWrfD6KwewmJ1XiBknEI7bZXK2mnRP0dkXQO8rW5zyb/+Jwnh2AXJ9spFA6gdh3XgzuIcC4nGzoN/5+dV2IlaFvvqwTbAaWKFPohr7n2E8xPQtNlKnewoXudAD0VtWTIf2qTebyjM9BqpeW2xETwJAquL0Z4yBPibIuP7ZQMoAU92uKSbGRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4Tx5uoE6rpz3oXueLbeIZUEZs1Vh/P4VdAcpS0WP5Y=;
 b=NDsHAS0+OR0jDgaUBN6mido+dGXPfwhBEooXqJNef0GeLlZUI9njAEi8ehpJ7ozMBjRVlXMyxD8XIEBYGwpoP2O+IKEVE1SVsVBV37TR4qKGJ7qYUdbNFWvlDKfT8JmUrGczBIF0WneuhX0Fp8NyGTHFOhIR8AnKHAQI7KKXYFM1nKvkabqjkY/UGe0jIWx5pFQ+vg9JFYagFQbOAHYdOPCtKTviiRRtC6HMwQgoZ7pmXGexM0zBdlISHIUkw2OL9o6IN5nApabMH5umrpfervbMWlZVWiiGIFfXVIux0Z42Uypqk0MERcSXYo0g71Z285mlZjbUS5B+ogF0IVOCbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4Tx5uoE6rpz3oXueLbeIZUEZs1Vh/P4VdAcpS0WP5Y=;
 b=nFEkvuh9Uot9MrfxpcFj4fSJOCgPHd8Hsh6mXXcPVU4nEH0T4zhMO1IukmhYrspmJ4aJOX+jfMh46WDCc5RyygCfeI4Dn7xEkPMTHyqKxpdOjd9uiAKtJka0iqOeg/WqMGyjSIUY8fCdaDhAa3UpeblbprSkWl8/4QBYjZWh3Gw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8334.eurprd08.prod.outlook.com (2603:10a6:20b:556::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Thu, 10 Oct
 2024 20:14:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 20:14:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Michelle Lin
	<michelle.linto91@gmail.com>, Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [OE-core] [PATCH v7 1/8] uki.bbclass: add class for building
 Unified Kernel Images (UKI)
Thread-Topic: [OE-core] [PATCH v7 1/8] uki.bbclass: add class for building
 Unified Kernel Images (UKI)
Thread-Index: AQHbGvJs4PFYGZwUw0affXjqAjBqhLKAbAwA
Date: Thu, 10 Oct 2024 20:14:22 +0000
Message-ID: <4BA0FFC4-E427-4666-9413-83D794289816@arm.com>
References: <20241010085647.439990-1-mikko.rapeli@linaro.org>
 <20241010085647.439990-2-mikko.rapeli@linaro.org>
In-Reply-To: <20241010085647.439990-2-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8334:EE_|AM4PEPF00027A67:EE_|AM8PR08MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: ee32a59f-d307-4d5a-5e36-08dce968268c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?x5uH+V55wL7mxGX3o4Ti4YoE36bwW6O930SOdOjDQrQwpiG4Cdow5c1pmGDf?=
 =?us-ascii?Q?DnivxCAwjgrEV4Mfehh6YH2sN/bNMLcV0wAxWriB99uHl6S/TTLVs+W4L6Az?=
 =?us-ascii?Q?kqMeSEHXuDeynLzTXjldq7nW4W4JS1YSUx6oVNGA7nYW4gjftpZJOiqxvp1Z?=
 =?us-ascii?Q?vU+VFWtf9ZRLWsMfympiniQXsBx0bp97qYyiJznJaxKC70rVa6gEw8afr93J?=
 =?us-ascii?Q?yEKsINT7yn2nRtADxzzv7ZMnRUE57uM2X8Q8er9dO4T8an9hmGZJet9OSbMB?=
 =?us-ascii?Q?1jbMM7oaU3OkKGYyljFU7cgI25ZDwDQiM4ucyanWNCVsHgTr5oYclbgE49FE?=
 =?us-ascii?Q?FwgiYlhuyb1U3QieDVJ6rjGwBm4++5Ly2vUBC3WIYYi8fNmeYJzsOyYKrAEf?=
 =?us-ascii?Q?pCik4VFSLimLUaknHqjwIjTjt+7KHT/c7l7yWhbJeFwW8FnWNiQ5DEVQ6/y/?=
 =?us-ascii?Q?E8O1ny9lUNrBlmGep6QZ3gvy+AtCIyLdsHjqdz1d2zO/6OdIRB5GSJ43PwmV?=
 =?us-ascii?Q?qCmt9JYHDXEVZll2wNULwR+o9Vn8WOHFcA6GsbmHWVj06M1fEktwGjH6yeLL?=
 =?us-ascii?Q?qS6BnhXeI46A19TcRStL9WmKOevj9l54fN35iRGdEbqg4TVu/2qzOPapb67t?=
 =?us-ascii?Q?stP04tzFUe4TG/B4yUDPzZXAu5V9M8xfS1/YhfASADRBlUeR6B38EJDFYdcF?=
 =?us-ascii?Q?LRI0BN39D8mnjqtU6xpXssL5vLO4FQkvl+M2mEMTvFXDDrWs4VWOjKKNK4GY?=
 =?us-ascii?Q?cDX1GaypRPgZbOJomj50c2oPdxxkhXZ8HtG9+ylUurZtsk511A+HMfAA8g/7?=
 =?us-ascii?Q?pTh2PQj65mFsMbd7ieRmkDT7xhRloQhf6MFMCL42QU6XdY08ysiP1/uvsnmH?=
 =?us-ascii?Q?J1umN68pYRyHsE+8+2iuWQASccttJ+1FVt31sKr+cXTJftssK3JgROABr60S?=
 =?us-ascii?Q?IijFD0vnryaU0jblnZYBkwUiLfWR6AGa9046qcLY+Kzpmz0Qq+OXsTLoxRbD?=
 =?us-ascii?Q?3sbO4iyVFQ4JpEUStmqQeEiQE4zpAZ7XzMWQ7BXPyIk0TjZxc2cfTKyQ4AEP?=
 =?us-ascii?Q?V7v9+kG4u9mJps1mS2ibGDT3fKxiJsXwV6yEk0hJ1r6+FthQ2Oq+lSVSTNnw?=
 =?us-ascii?Q?QMr7I4f2CS/l6oyBsu8QOIulgTjYnabSHYljogo2nBnzqWg//KjsdoHp9kO6?=
 =?us-ascii?Q?tVD6lQKi5NU6n/X6AiloiROUAGSvf5gZMiDAg/kqYZ00dUuVFGJuedVK1n0n?=
 =?us-ascii?Q?hKZkoj8SkGnckpR4k46Z4KywM1TBx4xUnnWfk0UXIFP1VWFSqxD3BbUqDf0k?=
 =?us-ascii?Q?Nej5xuzLiHm5G/DBKnURd8Co3meFlsS7lbG635TIzRj+Fw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F161C8E1DDE0144382EE08D64C138657@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8334
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	06835350-988b-43d8-6ecf-08dce968214f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KuTBfBzTd8GDUc8zbIiIYdsedc1Fun+RnzftN8yi7wgf1DzeRLZxszAMzNrh?=
 =?us-ascii?Q?1LJMGbIJV5+gVDE8OllOJFJlo6K80/M/neVojn3DqoDInS4dc9qhkTCiCUaj?=
 =?us-ascii?Q?dDx9zjv6OcPx9seg6OLrhMP4efTQxn1oWap5VrXDVMWaLefz+qXHMDtUSj4w?=
 =?us-ascii?Q?WySuXjZ9MycWe7cwwbOs2YK+AGkdBzdehxkp3pGzFSII4C6uX5rqiLkFZLvy?=
 =?us-ascii?Q?YAQ7ZGA6mWmFG1a7cZjosbMgiEd9qMEnKkbiqJBP6Em8YvCJ+HoOKsdHEVLs?=
 =?us-ascii?Q?mcw1H3SnACyXrJQrBGtWjFexsoHoAZZgCMxJTXXyNOs7jxjIVlmoGwLA0td1?=
 =?us-ascii?Q?7+YpcCGh40w2Xr5EZ9JSEI9iaahttlRzJZt0awhLBHLVVnmXKwKH9UyG2btb?=
 =?us-ascii?Q?XaI7ILB/LVf1j++iJAFmanqAYrBCvMcl6MhbPiz1EdHAiwvw3AAt9vdCP60u?=
 =?us-ascii?Q?oY0CEwcmKvbfDYIxpNzSwGJt0FKE97yYxDQoqbP0Rc8URkxeA1lvLW64HDTA?=
 =?us-ascii?Q?c/Wlvhcr6LAW0/tdoUyi3atUra+Lo2YX7JnUBBL6+taKzJ5CAkbFPM5rZXSP?=
 =?us-ascii?Q?rtLzcALMlSOwWIAdp1KT4ljRAuN+AFN8Hrrbqd3Dh79q/hTI26b0ujpyHoRE?=
 =?us-ascii?Q?+xC5asE5AC9SBbczNFAPAd4XkUCOzXRLp6F+NP052XykQTRDVEon+vm6s3AX?=
 =?us-ascii?Q?58HodUUFf9UHPJTHtojzvsw31GpdoUAMvJjxbC52vBLgn5FU0V7qcecK4WP/?=
 =?us-ascii?Q?SqENdWpTqVpI8TXutlLttU+nhE+x2/GwP6V/+1rPq1W41TSYkD+Zr8fgYGS2?=
 =?us-ascii?Q?mmNZk2PHwn8zVY0tR/A62UVmsri0eGPDKBmg97r6QtZJvOO8SlElTREWo6HN?=
 =?us-ascii?Q?RK84YKVqv5ec4xXt7IFdTK4xPJQG5uwPIbBLgZt4iArO8pi9JYBT8GmzO3XI?=
 =?us-ascii?Q?zorbUiP/gD2ZqatXu2dqec1ZSVl6ZYrTyvA0nWMEiGHio0a+cl6sqrg16UnW?=
 =?us-ascii?Q?lv5d9YbfLD6s1h2KJzGch4wvdFlA2kji7EfB7TQqrHGg7uXn4LLlxsiEBbLp?=
 =?us-ascii?Q?cM8zFC9MqcpnrXngvur+2SPVUS6D+Rp+jvBzTq9wX5wGCXCza8d1XFJWVu3m?=
 =?us-ascii?Q?TGeLcatwZ4DQD+j3zXU5GOWEaTirfKJHmSfRw7xcdnohFT46fwkewga9cs5u?=
 =?us-ascii?Q?YPHLaSWZRtKc9yAsU/uBcaoQRXkoiAsQp2RhPsk0p9NYu4emcMrgUXVzXxro?=
 =?us-ascii?Q?nSvxiH4OjSgBF1X+cMGVpfRxQ8fQeJxZrcIkgAEyCJQ/F5N1y42vVyEO/3/Z?=
 =?us-ascii?Q?xtfRVpVqe46KQd7aYZ2ljlZ98Cggi8OFECh3QK5HJK57DwVqcYnavmbUJufk?=
 =?us-ascii?Q?eFKyH4aypx9vj6VOifxuZuusLOhC?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 20:14:31.1903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee32a59f-d307-4d5a-5e36-08dce968268c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5857
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 20:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205643

On 10 Oct 2024, at 09:56, Mikko Rapeli via lists.openembedded.org <mikko.ra=
peli=3Dlinaro.org@lists.openembedded.org> wrote:
>=20
> +    bb.warn("uki: running command: %s" % (ukify_cmd))

bb.debug, please.

Ross=

