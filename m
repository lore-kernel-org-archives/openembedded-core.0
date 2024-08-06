Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42775C3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 03:56:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.78])
 by mx.groups.io with SMTP id smtpd.web11.9578.1722916610521779044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 20:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AI9q6ifV;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AI9q6ifV;
 spf=pass (domain: arm.com, ip: 40.107.20.78, mailfrom: jon.mason@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Fj6pt8HJGSIqRa7LZ2ze5ZlQADxGrJnIch7POPI6PowFOy9M6JqZYAJbftBdHEeI9Ni59VdiTRp6vP8z4gFc/MSKwoORe2ARPLvXlpSdPzRthOmu+byubHG1MTiFS9uFHQ3LlbZNLXgYaIljgSt85jP4VYmFD71LJy9CYpQM45m5oPFnasu1hzwsu5XH6l45dtuD8KxhmI5AvWRY4hlRjrYS43yiNZmO+HuD+xw1CQUJI/VsOcBkt7Lfl4E8COVHskSLgEgFkgnPlms0Gf7F/c3RMjZKPqwODxPb0dq1Rms3mub+BipOwRD5b2idV2tF0VnUeR0uiPhSTZxrB9bUsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/+e1tdiclVl17YqilKNKsJAsRbcm0Tn2yeQ7191FrI=;
 b=T2gPt8NXu2IwjriRw07KYTXTb/BI3TTIpM11lcQbkAxhEsj8eXWsjrEzWEH+8d4xn8i7ICgLbZHHGt5r8aX52GNUTAQp91psaCv9y0083pL1HwoQXEG5i42eYjCFK1FfObNvnAj4ZsZirm4osbj04+sE39b9fBvIa/cEYoItYP8z3kesipNADzYx/meXRYkS6TZcoINjSlM25CWCPrOGhqnnIpsA884hndzEQJZKoeHGjHa/x6tRPAiiSMODn1wDJMsmMyNu8C8Ihgkn/bqaNoKdJ66QI3mZi/X8YOKJO7ou6z6snmR2A6rTL2A8x07jVxo00i6OTgrICOuZSJ7C+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/+e1tdiclVl17YqilKNKsJAsRbcm0Tn2yeQ7191FrI=;
 b=AI9q6ifVKPdReEtuvsQt0rWhrOgFSLZyOGHxClmmtwunRz8lbAkMm/S25CMgk5Qac2d5onMWJj0L6dbaESXMp+dqJJ6OFHW2fppy3i7zHUZAMkrmCsTXxZYByepoqeBHpt8x4V5fYYOLalZIH/u4Gwh7XaztaVAD3RYe4UfYDL4=
Received: from DB6PR0301CA0094.eurprd03.prod.outlook.com (2603:10a6:6:30::41)
 by DU0PR08MB9156.eurprd08.prod.outlook.com (2603:10a6:10:417::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 03:56:46 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::cf) by DB6PR0301CA0094.outlook.office365.com
 (2603:10a6:6:30::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26 via Frontend
 Transport; Tue, 6 Aug 2024 03:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7828.19
 via Frontend Transport; Tue, 6 Aug 2024 03:56:45 +0000
Received: ("Tessian outbound 7956dfaf21d1:v365"); Tue, 06 Aug 2024 03:56:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 355a69cebf21c4e6
X-CR-MTA-TID: 64aa7808
Received: from L97e4d2358eec.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BFA38EF1-41E6-4F82-972E-2E0A759C7EA7.1;
	Tue, 06 Aug 2024 03:56:38 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L97e4d2358eec.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 06 Aug 2024 03:56:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZLgNVfRyrVDgHNBOXFZrmhPqgRyeoSFapf3DH4E3QQYeQ6QBt9SBRVwQleVkVTJMt8eRBU6UM839lwCVb1gGFn0FwrPrrhPYqbQQDRUrc0JPP3v2RrgWVHZWA5JLK8vk8oPjMH21rvmRK/g4sWsNzj2lXZud9SwL7TxGJlCRn2G6toe4PlQELA272S1Q9wizGF3tpci0O9+lhg1ZDsa71NjKf9u0OU+hYfR38qXMNauNX26vK514x35tzRgKYN7LOY3gOhkXEqIM/E0+nXGsaBlFxFAcmoGFh4dj4p38uc8x8kJzdMFgy1KMjgNGEUoFpxNZiSYTV9Ww5hch2LFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/+e1tdiclVl17YqilKNKsJAsRbcm0Tn2yeQ7191FrI=;
 b=fBMCXOt4XO5AGENB6o4qA+Wm0HownYu/2YNGhQZQonuWi/pz3sK961rJx1ccSBHWX/XsfSIaDsbS7eTnKtDyXu2/Q5sbZmfAlBfw2RDQe6TQCjtmz33x1OIKrM2DWPrH3Nbh6xy9kxVZ7g/6x8kSSf6nxx65SQt5a9hUcY3cSIN+n7j74WTvhwe/c//MiahFLKV6IE1XFNLhv0znuC45dkpRvdNOAGjEnz6EW96jWzWEltXl5G9QukjuXwX0wiutlBLcCvciWWDIgVcVLjxuqXUIeoXrO1maG+kDM0rXpqcLjI/CmVXMTE6xIIIhmrI591QtuN7w70ayUZDPxq3fKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/+e1tdiclVl17YqilKNKsJAsRbcm0Tn2yeQ7191FrI=;
 b=AI9q6ifVKPdReEtuvsQt0rWhrOgFSLZyOGHxClmmtwunRz8lbAkMm/S25CMgk5Qac2d5onMWJj0L6dbaESXMp+dqJJ6OFHW2fppy3i7zHUZAMkrmCsTXxZYByepoqeBHpt8x4V5fYYOLalZIH/u4Gwh7XaztaVAD3RYe4UfYDL4=
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB7909.eurprd08.prod.outlook.com (2603:10a6:20b:52a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Tue, 6 Aug
 2024 03:56:35 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 03:56:35 +0000
From: Jon Mason <Jon.Mason@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: Scott Murray <scott.murray@konsulko.com>,
	=?iso-8859-1?Q?Jan-Simon_M=F6ller?= <jsmoeller@linuxfoundation.org>, Ross
 Burton <Ross.Burton@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] kernel-yocto: consolidated pull request
Thread-Topic: [PATCH 00/10] kernel-yocto: consolidated pull request
Thread-Index: AQHa5Lq30DFtwIcXlUaXCfQYGbG2bbIZluqAgAAIFsc=
Date: Tue, 6 Aug 2024 03:56:35 +0000
Message-ID: 
 <DBAPR08MB579899FA7AE1058F4CA03A5CF0BF2@DBAPR08MB5798.eurprd08.prod.outlook.com>
References: <cover.1722524523.git.bruce.ashfield@gmail.com>
 <8e96d9f2ce3e7f2e35a69ec2d9bec9aa6ea0f2fd.camel@linuxfoundation.org>
 <ZrGXf+0O9dcbNMCg@gmail.com>
In-Reply-To: <ZrGXf+0O9dcbNMCg@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DBAPR08MB5798:EE_|AS8PR08MB7909:EE_|DB1PEPF0003922F:EE_|DU0PR08MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: 5022c886-68b0-48f7-a7a8-08dcb5cbca5e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?IzqYIumWGCqidbAJrTYo9SUzUkFcgu7UdYPkjDyiZU8fdkSbnfGvmi/Qh6Gu?=
 =?us-ascii?Q?W8HJGyBc5lubZd+3vYiZ7tRzngi1+iMjY2ynAxlKJvgYS/iPeVxK4Ln0IlHh?=
 =?us-ascii?Q?ckzByGnGgM8+4XkSsJG2LpgyQuiiywyPUKycsJAdAhUlDKWQgBnHKrikU9Xw?=
 =?us-ascii?Q?F2exB2WOHgDSH4ouUAdQzuf1/UuQCQ3CA8ZXSZk/SxoaOjrMwoL5QD0bILf4?=
 =?us-ascii?Q?Hj9v5pAnX/PdCw9f+MA7Qu26IVU8+gh6njDacGbWjpQ9tsJ2S6UH/WcPmOsg?=
 =?us-ascii?Q?1/z9aWBSD/s8U5TKCgJV/HvD3BFW2DbuOfWndi0UlvB21MfmVft+6LVNaeSc?=
 =?us-ascii?Q?EBvlk7ZhrXm/55Mvbp2qLbKObuEoid5FoT0JdUSFhC4+KYt4YRwPxe/6Jql9?=
 =?us-ascii?Q?yzZSkJud98X/4CrNrNbYLx3VROVvgYkQGxwMgE3CnHn9l99pDRNrsqbiKd5B?=
 =?us-ascii?Q?FvVi4oIA9ziYFQYgJUNnzshLIVPL/WQPVFkMk7PYyJjgwkOPTVzRo7p6UOXq?=
 =?us-ascii?Q?syKUAxybFzsz7Gj87YhAtSnZXjYHmRSD9XOU2rJdQLhGuUJ4kwgaPTb8z4px?=
 =?us-ascii?Q?XAWYrVmNU/OXA0wfPLcus82racSyV/LWs/MJLRj5VuC8zmQPtdQiPVF1LKCE?=
 =?us-ascii?Q?fLUapWSR7ktkfKcblZvERh/9GdhHUATMVTsY3/7OtKhTYwvQdxIqQmmr95zT?=
 =?us-ascii?Q?+AtlRXI87VR2hdPXCOKXef+950/7VPnpO+m4CuW7NIjIBPPZo81PNcaq+/jt?=
 =?us-ascii?Q?exXMPW7kywYLosS/BQG0NArLv/dmDkxorFLdu1NNl430RhvU64aYIvP4kQc3?=
 =?us-ascii?Q?4CNtPIg1vJgXoNFIzoKoW2iwyG2qLTCh/Lqp4Wdqq2tVx7sygHdnpGS7OHIs?=
 =?us-ascii?Q?ghWORqvXWsFLWxps+cyVRFaAmPPSPNOlCFHuHTpMpEER9KBlQpK6MqiB/YGX?=
 =?us-ascii?Q?XZHZg/LKL90RmyRJvCNOKNrWt5GK2cugpTRq25YpvuhaLOK+8xaDYv0vhbB1?=
 =?us-ascii?Q?DebpnLrYyyRG4H3JhTxY3AGzbALMkz8RnYoW+wAs7px5MBZJqezhTiCZ4loO?=
 =?us-ascii?Q?qSCqeY8Aq6sR6dkCYUiZKZYfJHgJzov8+MDp6F1ppoM6m25fbiG/zsNNCTQe?=
 =?us-ascii?Q?qkOkad3jLTYlIyRJQRCMy+0UAeHFeT7yvIK4mHUc2DarmGKoKt90cpDyNPlF?=
 =?us-ascii?Q?LArOYz/sGiHOB4OLGhzPeQlEqGGVwmJD5jGrjSWejHDE3R/loL4KHY+vpPDF?=
 =?us-ascii?Q?e2mUJ6owa27pZTEHMt/vVQpnlFRBrYcA7Ff2icBDXVebLlG0j+437GYM5jfb?=
 =?us-ascii?Q?zSTs3D6lkAQ+zvusP90tsPbXUXgRZWuiINXJZ0DQZ7JxTNML8qdNNk2sBhea?=
 =?us-ascii?Q?bRKi/Hs=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_DBAPR08MB579899FA7AE1058F4CA03A5CF0BF2DBAPR08MB5798eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7909
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3953580f-f704-4d4c-fbe8-08dcb5cbc441
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?/KCRs9avuzlFcleFzIyoWUVLyuX/NL3exVrg93r1YK00oNFryRqkDBCaN+?=
 =?iso-8859-1?Q?AR8znbJGRzhVGqPGhA2elOkYnASdnkwkknxcR9uzLbCf7ouE+/7dv/J0lT?=
 =?iso-8859-1?Q?+wiAOTaYdVZWB4ppsXLK+VtRWjdTGeiv2ADz9vNgESCA/aUzKJBjQhHbkm?=
 =?iso-8859-1?Q?I8KLcii4tYJEsrut2IEJmOwmGexVyIDzG6ZRaDGtnGyDPVdEhSwusnUl5+?=
 =?iso-8859-1?Q?WCHX3joZH793/LXXA34PAx4RxNAeqeV14BJzg6aMS9Q315dwn2Sk1IUu9v?=
 =?iso-8859-1?Q?Kfawe7P/3j4FZcFJ4IlR8A7l42furFrtpH7HJnYiKADBBQi5MC5YG+dmPF?=
 =?iso-8859-1?Q?+LbXzrCGDdbZLO+CDeFTQKMxBLsD246V8FuAN/9BwLPHCutaHiSVXaaf/a?=
 =?iso-8859-1?Q?7mx7fhv230PVokq5L77kmF4YXI4kmlqu+qmKAfb9ozclP5ftaOQIHX05xh?=
 =?iso-8859-1?Q?DaccQRPZiawZNF2LEeyXDzNpmE2zzympA8+ciEbpxGl2v9W1viLPolP1Cw?=
 =?iso-8859-1?Q?h8OWIyjWBhommWJ2mK6i29CE5pNa1QCqxJYGQkBYkVVGaEAYfykHAcDqRu?=
 =?iso-8859-1?Q?TWJpZbZH9+8Om7q49h/jSiQgDnO+/JdeliOjlO3DPzSAWM7gY6hmH8x8ry?=
 =?iso-8859-1?Q?64Ysr1gYZ2+Ywl/ly8KjAn6F3IZoUq8JdHDNZrS+6Z+8mp+ewyCXWc4QZj?=
 =?iso-8859-1?Q?tC7ejq5X1wA1oj4YaJoJltbGaopbwnRN1T2gOfEggD0avZXk24Qy6BWk2i?=
 =?iso-8859-1?Q?8b+MQK25hnYKwtijp4orS+8CQGOnPznYxABc9/m49BKCrfrPCQPN/MTuYc?=
 =?iso-8859-1?Q?zvLJwXDaRLGMWobMCqOCmPn7YhYTub9szYA6dI6TlX/NK5DwMw/TjziLsj?=
 =?iso-8859-1?Q?+kXtjyQCHNTyb0ZuVD33R9RxflKFHndWt7lDpdSk5ls9DwZEQZLDVL/pmk?=
 =?iso-8859-1?Q?wyWa012b1YSoHbbpRmx9EGVfTg4NxIegvAHEDGOLj6bTX+oVTQyckpeUmr?=
 =?iso-8859-1?Q?aXuHo7lYDI37KmB0M6NfFshWjhRL+CKUpvbECbS+9I3q0ZVZeAknjDWhOn?=
 =?iso-8859-1?Q?IrhFqKUQ7nbS0/ravI6uIdHW9VYEeZF9teFqV6GwzbaRPPUs/SOEii+Er0?=
 =?iso-8859-1?Q?hMiRCUyDz+OqAuls78gXsG2BXCHaJfpw5icmaxH+LMlK9AvkZtStOjLWMy?=
 =?iso-8859-1?Q?2WCOOkkxGd3zC0xB/XuEfTsPCJQpS6B2bwVd+PIcYxcKoQIHO6jbQLlwBI?=
 =?iso-8859-1?Q?lI939kqY8LAzqsluF8lKKqSiTfgLq3r3iSuwVDWY86fLyO4grJF07kYUT9?=
 =?iso-8859-1?Q?1JL8+T2Sc4HDKZVyaSDMlq8oriv/D1ksJz8/w7mXP5h57w7rJqU7GY3ew1?=
 =?iso-8859-1?Q?tFAEN5vl5uhvE7KsqtvcN52Mn0/JUYI/eQPy+QkK/pKz3RIkgFEEqbcDJq?=
 =?iso-8859-1?Q?u7ykXhHX5XdE54YA?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 03:56:45.7644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5022c886-68b0-48f7-a7a8-08dcb5cbca5e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 03:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203009

--_000_DBAPR08MB579899FA7AE1058F4CA03A5CF0BF2DBAPR08MB5798eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry for the top post, but doing this from my phone.

Genericarm64 pinned to the 6.6 kernel temporarily works for me.  I can take=
 a look at it when I get back from vacation.


Get Outlook for Android<https://aka.ms/AAb9ysg>
________________________________
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Sent: Monday, August 5, 2024 11:24:47 PM
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Scott Murray <scott.murray@konsulko.com>; Jan-Simon M=F6ller <jsmoeller=
@linuxfoundation.org>; Jon Mason <Jon.Mason@arm.com>; Ross Burton <Ross.Bur=
ton@arm.com>; openembedded-core@lists.openembedded.org <openembedded-core@l=
ists.openembedded.org>
Subject: Re: [PATCH 00/10] kernel-yocto: consolidated pull request

In message: Re: [PATCH 00/10] kernel-yocto: consolidated pull request
on 02/08/2024 Richard Purdie wrote:

> Hi Bruce,
>
> On Thu, 2024-08-01 at 11:08 -0400, bruce.ashfield@gmail.com wrote:
> > Here's the next batch of kernel updates. Obviously the -stable
> > updates to 6.1 are routine, but the larger changes are the
> > introduction of the 6.10 kernel as a new / validated reference
> > version.
> >
> > Some notes:
> >
> > =EF=BF=BD - I've included the poky/poky-tiny preferred version bumps
> > =EF=BF=BD=EF=BF=BD=EF=BF=BD in this pull request for simplicity. Yes, I=
 know they go
> > =EF=BF=BD=EF=BF=BD=EF=BF=BD to meta-yocto, but it is easier to make thi=
s available for
> > =EF=BF=BD=EF=BF=BD=EF=BF=BD AB testing when they are all together.
> >
> > =EF=BF=BD - I'm watching the status of 6.10, if for some reason it
> > =EF=BF=BD=EF=BF=BD=EF=BF=BD EOLs before we release, we'll jump to 6.11,=
 which I have
> > =EF=BF=BD=EF=BF=BD=EF=BF=BD under test and will push as linux-yocto-dev=
 shortly.
> >
> > =EF=BF=BD - There's one known build issue with 6.10, it is zfs in
> > =EF=BF=BD=EF=BF=BD=EF=BF=BD meta-oe. The upstream hasn't updated to sup=
port 6.10 yet,
> > =EF=BF=BD=EF=BF=BD=EF=BF=BD so I'm watching and waiting on that .. but =
there's no
> > =EF=BF=BD=EF=BF=BD=EF=BF=BD reason to hold this request for more testin=
g on that.
> >
> > =EF=BF=BD - I've tested 6.10 for all architectures on core-image-minima=
l,
> > =EF=BF=BD=EF=BF=BD=EF=BF=BD core-image-sato and core-image-kernel-dev. =
I've also
> > =EF=BF=BD=EF=BF=BD=EF=BF=BD tested against musl and poky-altconfig (6.1=
 with the
> > =EF=BF=BD=EF=BF=BD=EF=BF=BD 6.10 headers)
> >
> > There will surely be AB issues with this, but it is now
> > to the point where I need additional coverage and eyes
> > on the changes.
>
> Thanks for this, I put it through testing after tweaking it to remove a
> rouge inherit. There were some issues:
>
> a) genericarm64 version issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/687
>
> Warnings since genericarm64 isn't available as 6.10. Everything else
> seemed to miss the preferred_version and build 6.6

Unlike the other hardware references, genericarm64 doesn't set
a preferred version. It isn't something that I typically test,
since it is one of the hardware platform.

Until it is tested against 6.10, I could send an update to set
it explicity to 6.6.

Would that be acceptable to everyone ?

>
> b) crypto-dev failures:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9329
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9340
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9313
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/9161/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/5141/s=
teps/12/logs/stdio
> (the latter taking out the reproducibility build so that wasn't tested)

Hopefully your patch addressed it, let me know if I need to
look into it more.

>
> c) meta-virt xen issues:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3455

I pushed a new .inc to meta-virt

>
> d) meta-agl kernel config fragment warnings:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/4556
>
> e) meta-arm kernel config fragment warnings:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/5810

d/e I'll leave for the layer owners.

>
> f) qemumips64 parselogs issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/9240/st=
eps/14/logs/stdio
> "failed when register_sysctl_sz sched_fair_sysctls to kernel"
> "failed when register_sysctl_sz sched_core_sysctls to kernel"
> "pci 0000:00:00.0: [Firmware Bug]: BAR 5: invalid; can't size"
> (and other BARs)

One of the format's changed and the other is harmless, I have
a patch to update and add the other to what we ignore.

>
> g) qemumips parselogs issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/9256/st=
eps/15/logs/stdio
> Similar to qemumips64

Same fix.

>
> h) qemuarmv5 config fragment warning:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/160/builds/989

Fixed.

I'll send v2 later in the day on Tuesday.

Bruce

>
> I've copied agl/arm people.
>
> Probably nothing too surprising. I'll drop some of the patches whilst
> we resolve these but see if we can keep the headers upgrade and the
> point release bumps.
>
> I'll try and test the crypto-dev upgrade on the list as that might help
> that issue.
>
> Cheers,
>
> Richard
>
>

--_000_DBAPR08MB579899FA7AE1058F4CA03A5CF0BF2DBAPR08MB5798eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div dir=3D"auto">Sorry for the top post, but doing this from my phone.</di=
v>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Genericarm64 pinned to the 6.6 kernel temporarily works f=
or me.&nbsp; I can take a look at it when I get back from vacation.</div>
<div dir=3D"auto"><br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">
<div><br>
</div>
Get <a href=3D"https://aka.ms/AAb9ysg">Outlook for Android</a></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Bruce Ashfield &lt;br=
uce.ashfield@gmail.com&gt;<br>
<b>Sent:</b> Monday, August 5, 2024 11:24:47 PM<br>
<b>To:</b> Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>Cc:</b> Scott Murray &lt;scott.murray@konsulko.com&gt;; Jan-Simon M=F6ll=
er &lt;jsmoeller@linuxfoundation.org&gt;; Jon Mason &lt;Jon.Mason@arm.com&g=
t;; Ross Burton &lt;Ross.Burton@arm.com&gt;; openembedded-core@lists.openem=
bedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [PATCH 00/10] kernel-yocto: consolidated pull request</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">In message: Re: [PATCH 00/10] kernel-yocto: consol=
idated pull request<br>
on 02/08/2024 Richard Purdie wrote:<br>
<br>
&gt; Hi Bruce,<br>
&gt; <br>
&gt; On Thu, 2024-08-01 at 11:08 -0400, bruce.ashfield@gmail.com wrote:<br>
&gt; &gt; Here's the next batch of kernel updates. Obviously the -stable<br=
>
&gt; &gt; updates to 6.1 are routine, but the larger changes are the<br>
&gt; &gt; introduction of the 6.10 kernel as a new / validated reference<br=
>
&gt; &gt; version.<br>
&gt; &gt; <br>
&gt; &gt; Some notes:<br>
&gt; &gt; <br>
&gt; &gt; =EF=BF=BD - I've included the poky/poky-tiny preferred version bu=
mps<br>
&gt; &gt; =EF=BF=BD=EF=BF=BD=EF=BF=BD in this pull request for simplicity. =
Yes, I know they go<br>
&gt; &gt; =EF=BF=BD=EF=BF=BD=EF=BF=BD to meta-yocto, but it is easier to ma=
ke this available for<br>
&gt; &gt; =EF=BF=BD=EF=BF=BD=EF=BF=BD AB testing when they are all together=
.<br>
&gt; &gt; <br>
&gt; &gt; =EF=BF=BD - I'm watching the status of 6.10, if for some reason i=
t<br>
&gt; &gt; =EF=BF=BD=EF=BF=BD=EF=BF=BD EOLs before we release, we'll jump to=
 6.11, which I have<br>
&gt; &gt; =EF=BF=BD=EF=BF=BD=EF=BF=BD under test and will push as linux-yoc=
to-dev shortly.<br>
&gt; &gt; <br>
&gt; &gt; =EF=BF=BD - There's one known build issue with 6.10, it is zfs in=
<br>
&gt; &gt; =EF=BF=BD=EF=BF=BD=EF=BF=BD meta-oe. The upstream hasn't updated =
to support 6.10 yet,<br>
&gt; &gt; =EF=BF=BD=EF=BF=BD=EF=BF=BD so I'm watching and waiting on that .=
. but there's no<br>
&gt; &gt; =EF=BF=BD=EF=BF=BD=EF=BF=BD reason to hold this request for more =
testing on that.<br>
&gt; &gt; <br>
&gt; &gt; =EF=BF=BD - I've tested 6.10 for all architectures on core-image-=
minimal,<br>
&gt; &gt; =EF=BF=BD=EF=BF=BD=EF=BF=BD core-image-sato and core-image-kernel=
-dev. I've also<br>
&gt; &gt; =EF=BF=BD=EF=BF=BD=EF=BF=BD tested against musl and poky-altconfi=
g (6.1 with the<br>
&gt; &gt; =EF=BF=BD=EF=BF=BD=EF=BF=BD 6.10 headers)<br>
&gt; &gt; <br>
&gt; &gt; There will surely be AB issues with this, but it is now<br>
&gt; &gt; to the point where I need additional coverage and eyes<br>
&gt; &gt; on the changes.<br>
&gt; <br>
&gt; Thanks for this, I put it through testing after tweaking it to remove =
a<br>
&gt; rouge inherit. There were some issues:<br>
&gt; <br>
&gt; a) genericarm64 version issue:<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/166=
/builds/687">
https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/687</a><=
br>
&gt; <br>
&gt; Warnings since genericarm64 isn't available as 6.10. Everything else<b=
r>
&gt; seemed to miss the preferred_version and build 6.6<br>
<br>
Unlike the other hardware references, genericarm64 doesn't set<br>
a preferred version. It isn't something that I typically test,<br>
since it is one of the hardware platform.<br>
<br>
Until it is tested against 6.10, I could send an update to set<br>
it explicity to 6.6.<br>
<br>
Would that be acceptable to everyone ?<br>
<br>
&gt; <br>
&gt; b) crypto-dev failures:<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/=
builds/9329">
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9329</a><=
br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/=
builds/9340">
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9340</a><=
br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/40/=
builds/9313">
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9313</a><=
br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/52/=
builds/9161/steps/11/logs/stdio">
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/9161/step=
s/11/logs/stdio</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117=
/builds/5141/steps/12/logs/stdio">
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/5141/ste=
ps/12/logs/stdio</a><br>
&gt; (the latter taking out the reproducibility build so that wasn't tested=
)<br>
<br>
Hopefully your patch addressed it, let me know if I need to<br>
look into it more.<br>
<br>
&gt; <br>
&gt; c) meta-virt xen issues:<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/128=
/builds/3455">
https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3455</a>=
<br>
<br>
I pushed a new .inc to meta-virt<br>
<br>
&gt; <br>
&gt; d) meta-agl kernel config fragment warnings:<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/120=
/builds/4556">
https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/4556</a>=
<br>
&gt; <br>
&gt; e) meta-arm kernel config fragment warnings:<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/113=
/builds/5810">
https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/5810</a>=
<br>
<br>
d/e I'll leave for the layer owners.<br>
<br>
&gt; <br>
&gt; f) qemumips64 parselogs issue:<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/74/=
builds/9240/steps/14/logs/stdio">
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/9240/step=
s/14/logs/stdio</a><br>
&gt; &quot;failed when register_sysctl_sz sched_fair_sysctls to kernel&quot=
;<br>
&gt; &quot;failed when register_sysctl_sz sched_core_sysctls to kernel&quot=
;<br>
&gt; &quot;pci 0000:00:00.0: [Firmware Bug]: BAR 5: invalid; can't size&quo=
t;<br>
&gt; (and other BARs)<br>
<br>
One of the format's changed and the other is harmless, I have<br>
a patch to update and add the other to what we ignore.<br>
<br>
&gt; <br>
&gt; g) qemumips parselogs issue:<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/60/=
builds/9256/steps/15/logs/stdio">
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/9256/step=
s/15/logs/stdio</a><br>
&gt; Similar to qemumips64<br>
<br>
Same fix.<br>
<br>
&gt; <br>
&gt; h) qemuarmv5 config fragment warning:<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/160=
/builds/989">
https://autobuilder.yoctoproject.org/typhoon/#/builders/160/builds/989</a><=
br>
<br>
Fixed.<br>
<br>
I'll send v2 later in the day on Tuesday.<br>
<br>
Bruce<br>
<br>
&gt; <br>
&gt; I've copied agl/arm people.<br>
&gt; <br>
&gt; Probably nothing too surprising. I'll drop some of the patches whilst<=
br>
&gt; we resolve these but see if we can keep the headers upgrade and the<br=
>
&gt; point release bumps.<br>
&gt; <br>
&gt; I'll try and test the crypto-dev upgrade on the list as that might hel=
p<br>
&gt; that issue.<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
&gt; <br>
</div>
</span></font></div>
</body>
</html>

--_000_DBAPR08MB579899FA7AE1058F4CA03A5CF0BF2DBAPR08MB5798eurp_--

