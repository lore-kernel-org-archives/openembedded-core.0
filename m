Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB8ACCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 16:06:54 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2499.1762531606860875637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 08:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mIq7SFiG;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mIq7SFiG;
 spf=pass (domain: arm.com, ip: 40.107.159.12, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pAmmqdOdwjBB9c9JJ31C6m2YmIvoDxEGOP9EUnEJ7XYq0DyhuxfgcpgxwOlhJ0Btd45g6Q3RgeAra1BfIbyOfpHHeWR17/nS6yRiDL1giizIfTTpqn16bvLVNs0czNvxHYUoL1B7ELf9q87Wa2zPEFsLZrojItwrwJYl23xz7AtHJ/INO0AWoHTq0S6oS0GpmfTGHmvlwjbBp7CgWsEEuFx7ijVawcBqRYnunjpJ/eicXjeTKTM+stT+JwNp5AfJHRbEfVJpnllnCG32KbfTzis3kfcgWd+uPZmoQOM54E9+SHlVxcAqE4+QlI14h1AR3dDFDcpgaSMQQ7cP75RHUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp+/cXT9EhLZK+mtoyTBilZTh7YpNz40b6HOoahkBDk=;
 b=kQvjOMGdMf7OkFfoqoPpFyxk8tqsHtGDbyAfS5/2ZEm02JHislpyufh68EeuUy/JRdjnBEgUJl+yRsNPU121rwQwC/r8L7Oh8ZToj9pDODqnc1zVvAMvS0JluT9w466fQIUph/YC0MSnsvSCdNfLhZpQ+djEVtGYt8qvRWZJbnqKhRQB2fEHhrr1Hu9shIm+ej0c8FDXK7vde24+oXoByWwWvOFwyB+qFAvv0x4UqMz8BIyAbM5BOn/UGyNBFyjaSn8JrE8xj8PMYfS3fbf1N4JSmJBlxBfbMTyloM7vrlm5Wsf/RD1gjyowigAqpYdtRy6VlY6cBLN9R+NhuAxwow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=smile.fr smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zp+/cXT9EhLZK+mtoyTBilZTh7YpNz40b6HOoahkBDk=;
 b=mIq7SFiG9dksglMXdnHcKp75SmF2wkwH7tFQIMZsrzzMKNkeaDVFZd2Omo4JXXUoUj1v/k4STV6f4maaJJD+OX6NdezovD01at5ukBRtFaL8QO7PTwgZ2HsvtDBWuPm+ilBls2v3w4UBMVw1pA8YpUxb2zS4JA81r8AzL7fXJ9U=
Received: from DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) by DB9PR08MB6362.eurprd08.prod.outlook.com
 (2603:10a6:10:25a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Fri, 7 Nov
 2025 16:06:42 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::99) by DUZPR01CA0067.outlook.office365.com
 (2603:10a6:10:3c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 16:07:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 16:06:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHQBfZuUOlN+jVs2kBtnmRgvN74kBPkMfRYL1A3T0j4+i8ghYc+7MuGFaZdUKPbuqlMw105tdH3dhn7gZpzEhN7FkwFok6rIVru2JglwqoeNLNY6q97yo8AgT1fAO1tZo3Rkg2qdUhB8o1Sfl+4MBTVoWvcIV7pAeAUsjKj6J7y1DbvBdsAboDS5Ga3XNPd/VgrTsivj40ysxzZGntcQQljUvZYKlEYnj/FC/1wD9GEpLbshsRuteud4drMab/MU/SBHWWzJ7Q8DRwzM/t/rCyf6nVLu6VUDiKLbIuygEmPV3IehOXuK8f9MyaRp7Q8v1LDs0+zU6cbBnJ9LXKPc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp+/cXT9EhLZK+mtoyTBilZTh7YpNz40b6HOoahkBDk=;
 b=o1eKh91yx2MW0i31HSP6RbRrcThod59KU/bUKdiw5WQ7H6WQdtBECcIitDWCwXYBNgZmcGcrS0vg4r3d/5FTM9K0LagfRxdugRuDqRvS1kiisUA25rbFlgAWMbjeq/ySjI+TDF2bB4QZtobpxnpEcDEVaOTz/WUjXjblV5DF3I9xHHQeXRE3U7k0BJUr9ZDjuahT+SM8336zxFpz2k01F0YjVAhighhVt2j0ZaGkU0RzQysdUFuLLNb3t5uejabOhSaUgJZNJYvddgrH9S4aW8QffEnlbQL6r+VBZZnH0MEE1rtdMESrazWPNXDIoCx7/kp3E3MpOr5dZRl7xiyZOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zp+/cXT9EhLZK+mtoyTBilZTh7YpNz40b6HOoahkBDk=;
 b=mIq7SFiG9dksglMXdnHcKp75SmF2wkwH7tFQIMZsrzzMKNkeaDVFZd2Omo4JXXUoUj1v/k4STV6f4maaJJD+OX6NdezovD01at5ukBRtFaL8QO7PTwgZ2HsvtDBWuPm+ilBls2v3w4UBMVw1pA8YpUxb2zS4JA81r8AzL7fXJ9U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5751.eurprd08.prod.outlook.com (2603:10a6:10:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 16:06:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 16:06:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] u-boot: make initial environment binary image
Thread-Topic: [OE-core] [PATCH] u-boot: make initial environment binary image
Thread-Index: AQHcRLkkowwLkXxvxUWej3Qs/7zyH7TWR9AAgA8eRwCAAhFFAA==
Date: Fri, 7 Nov 2025 16:06:08 +0000
Message-ID: <A6DF29CE-45E4-4D16-8456-6EABE959F27A@arm.com>
References: <20251024073738.1060583-1-pierre-loup.gosse@smile.fr>
 <AEBBFD72-49FE-46DB-A159-3961D1E92D1F@arm.com>
 <CAHT-cZtngzAK1hxrFHm7OB0sBB4uCic3aV6WB=P8gVut_bkeiA@mail.gmail.com>
In-Reply-To: 
 <CAHT-cZtngzAK1hxrFHm7OB0sBB4uCic3aV6WB=P8gVut_bkeiA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5751:EE_|DB3PEPF0000885A:EE_|DB9PR08MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b81ef97-68cb-4801-ecae-08de1e17a38f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?pudyXel/CV3tOw54Z5StL4sF0Ahd2R4bTguQAb7ChiM/E7giEaXde0nuAC2N?=
 =?us-ascii?Q?LGVFlkP40gwRFhpb9t/dZDhfjWBCSDo7oj93ejMaJuVJ926lEOrT6RXJGrlf?=
 =?us-ascii?Q?kCkuEumXHKT8C98ogOE88Fu+en6zXdQsIMAIl082hhFb2ov086PDeus+l3Vy?=
 =?us-ascii?Q?84DP006bDivQsGIqWUFirfu/2ERV49oWdPMpatEByLGyREI2+UbHu7SENAQa?=
 =?us-ascii?Q?j6GUVeXwHORA6sQ2N0fYbQT/2HGNwkNIhyLrbo/pE5i5FjZrGv02cznGPlSM?=
 =?us-ascii?Q?JKxrY4RqwVWFQ4GMEK+ClT8xE9N8Ns5/jkQ/eZim76C/alEZInvyJvx4gjUJ?=
 =?us-ascii?Q?MkJ5UUX6FVAkbopeLX99Mt/ieuTK6WSMlrRZ5T6RfQwEq77wE9NwUCZ+i7cW?=
 =?us-ascii?Q?grxvZZMWrjpZcyLxz1te6rJzAcBBz8LbVzl4QYbC1pPB8cwUanJvvC1DzQAu?=
 =?us-ascii?Q?5gBNWiSgXKXYUlS/5sLBkcoEhIAXqlBrZEvK/0DWhGPIAPay6JC4xF8Kl6SH?=
 =?us-ascii?Q?+mybqI8efHH2ocnT6/DhVwN0bCgz1i/qe0DD4h7PrXjyJ0kNsYX5en8LbqCB?=
 =?us-ascii?Q?9OKXtsyhla6R1v4O6ZM95GM80+T3A25b06cNSXI7okinEDk6G/q4lNW96cZQ?=
 =?us-ascii?Q?RoYDF/ZxSHLj6exPiegt0ZAPjZw6IyQSvQKrAjxmGLeet0jsfW8/BvFpnzpO?=
 =?us-ascii?Q?kSWvMc8FZ99sKWUSkx7+waHoorgEq16RBhV2qyoYy7nXmHZzGfDbeYn/noEo?=
 =?us-ascii?Q?D+ufT+eb1894a1yVtW9SC/8BMqbqz63audtzdQ7i2o6CoDFh/ZB/1H/58P+5?=
 =?us-ascii?Q?0kUE1i7NQAbdDkvJudWG/XDVHDQc/kYmAL0bm+D4QxVHaqJf4NzIpd3BphoR?=
 =?us-ascii?Q?vpVGbAK9FWSUpnvjPqnS6xoaNqZs2/qh8MwdI5IhSN6S5i00lWL5dJy4TN9f?=
 =?us-ascii?Q?zUcEmMX7gQ2tw9nzDK8NodOydtSzfeyLwkkKFe6Zyi7invAIt1xNJaKYd92p?=
 =?us-ascii?Q?GBte8bMAry64iRIOtwq0c6R1tkFxKLCb/jVbRR8VYuIRFVtCFwhiQSrAdwYL?=
 =?us-ascii?Q?6up5ZYaYc//IseWkihRsjPc9bCIY1mBzNpLH+7OCiLGp/f1KSLW7WDbcEPjT?=
 =?us-ascii?Q?W6Df4v92dq1F7IfGUqT/nQF5PwepiV+B3ksnMTb+lqW65s4biFITmcH/77EF?=
 =?us-ascii?Q?9f5+un11sCzWOV/KiQ07KawzvcT3PidHc29tEY71qzIhVjVjexQzvgn6GKDa?=
 =?us-ascii?Q?Ag05adDWHr41yKZgq5a1BxtFjofPkxKnF52TmPpy7uSoJQ8KLAFKBF1MIaEA?=
 =?us-ascii?Q?4+R1+1jVPkwe6vO426pU0zDXuamHOXlWi9k+D5UwbO1XAAcbMcjNNeMoMKao?=
 =?us-ascii?Q?KsqWpy13VhT25y+zvwxZPIPue38f+E1KeNFA55rs+xHh3HVFyCvIzGfqO3VH?=
 =?us-ascii?Q?OwXkEMpJujsS2lrfaarwz+8JtvPPnreGQtN1s18DOigKvCtD0yVfsPz+6rpe?=
 =?us-ascii?Q?7yfxNPZWbwGtRVq19BJwbtnzmGs0AHHZ6H8e?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FDD79B45F71A9C4993A0644694922B5B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5751
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f64458eb-5e8f-45a3-53da-08de1e179029
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|14060799003|35042699022|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yVjyyNWEKuMMQU4sk0KzfN7sHdFUet6qXPqfHnx/KniCH0zMELhejxqQW4SE?=
 =?us-ascii?Q?rI7Fe2PcJE33rcyFHiLzs8M8N/QL6QMYWPbD3uFhBn6ordBDSkpqh3w1iECa?=
 =?us-ascii?Q?zK5RBOMb7EJCHgnoLA69U2D0nVonPbcx3PKVjYH6kLMWR/gzNbBAd/YNQfIp?=
 =?us-ascii?Q?OETNtsmINABgorLvQXs/XHRtyle0Jff8ow7h/dwLqq/6O5avU89S3DU6K9vM?=
 =?us-ascii?Q?RPREuHDooH0N6n3CjkZw2xFcRP78u9SdBaouO9jG4S0Mh1hFPPrYawJ5TMHj?=
 =?us-ascii?Q?NTWdRBPLjpRycKPgo6WmlSze8B45MEYMWYszr09YXC2OP7kuwUeJpG2gqJJd?=
 =?us-ascii?Q?5suvAfCsU1laNuIw+MdXl8/OOiQwryIU9MEvw8V8u4/nLZAnZFP0hyCCwhqJ?=
 =?us-ascii?Q?2JDyhwLUNCZVyCv+bt3aFBuAF3ECb49X9eLx1GxPRy9g4zSktiHfFyz6l/e8?=
 =?us-ascii?Q?mHquExlDH6IPJecsO6fqFnF1QCkUhTx6vMK2IqTb2XSYBFKqoH/7D426mecz?=
 =?us-ascii?Q?rn2sHP5Phk5y8hMhWrYpqUFy5twdxfdmING6ioENsrXJ7w8pzNX0Xdr7Iik+?=
 =?us-ascii?Q?jkcplkGCWyC9I+OUuLjKoFdiydlYTGxmr/k0wJ8QLinVaRILgq86QLNIzgQ4?=
 =?us-ascii?Q?mvGjy3fMVlmKa7uzWmyQEqYbvmikDjIfVLZdG2Qvu6MLIbdt9cC/anS/EGfP?=
 =?us-ascii?Q?1o+iLDXje9cYoKUyzFPrl9T8JrKYTE4zZ9TnhtLAedDSC/jmboU6k8T9JCvK?=
 =?us-ascii?Q?UGHtJRiFj1pA1fQbbJ0wyeHkR0fPIHRU2IuIBfGhXZUvEHYnRQoIbNK0kyPA?=
 =?us-ascii?Q?yJi4k7HICPRGOmV1qPge15uqsN+ByGiGfZvY1dcNLKi0M9iUvUcwJFQmEzlh?=
 =?us-ascii?Q?Y1s2IX/Fde8oW8ATjF3xP2GQxKuIOX485Fs7cr+dk/jWJNXj5L7zhX/IRCQJ?=
 =?us-ascii?Q?poQ2YtKxWMnRwNvKnIiRZZnoWC8BmLvQiUdAEeXTC7dxNCD/tYHBe4woF1B4?=
 =?us-ascii?Q?aySecmTp15xlt1ILBEzPzrv26Qhjjxc/T35H3sbrbuo56Dl/fBbfjhby3Q2N?=
 =?us-ascii?Q?jk/360RynZdDH4vjKabfFeYupaUfVQXQtCWu5GxxJ3cxcC5hVMoTuCxOPFIt?=
 =?us-ascii?Q?FEe1sxNBQA9pbkGDAwaOEWdUf05meJbH0VHjBapAAckoJKOmzH1Iq2f29+sF?=
 =?us-ascii?Q?7dwS7OZCWBLx/6E2erK9XfwXW6cRdlXk92lZsXa2iLmHGEZu8uVG9yp/p4EC?=
 =?us-ascii?Q?8yp9C+MTI1lLFXGfHwx4PL+Ol65+YGbbUrB1n2L4pjosMHGHk6ljPafEbiKq?=
 =?us-ascii?Q?McQyMI2Sa7AUVNcKgSIyU02GMuWDrKKoQfkg4LnLtGHTsw9JuGHmo08tdtJM?=
 =?us-ascii?Q?kZTFpCnrCvrBMZLxZjWlan7MIKoI8zrDU00ivY9YqmktnJeco/VZM14PvApQ?=
 =?us-ascii?Q?q9w3NLenyN3X7YAIHsmnqsj6PH0nZryZdsaCDWQ8UoenXdTx6M45tp+n7g80?=
 =?us-ascii?Q?6T2fCU+M8wn44K1AMZOI5l7cDbiUVrzxkJLFhhAqIDTOeKBjDqNJhoRXrLKw?=
 =?us-ascii?Q?+ikILgBWV5YdB3q7QKo=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(14060799003)(35042699022)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 16:06:40.9808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b81ef97-68cb-4801-ecae-08de1e17a38f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6362
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 16:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226062

On 6 Nov 2025, at 08:31, Pierre-loup GOSSE <pierre-loup.gosse@smile.fr> wro=
te:
>=20
> Hi,
>=20
> I could not find any existing test for U-Boot variable in the meta/lib/oe=
qa directory. The meta/lib/oeqa/selftest/cases/uboot.py file only build and=
 run the bootloader.Should I extend this test file to include validation fo=
r binary environment generation with these new variables ?

Yes, please.

Thanks,
Ross=

