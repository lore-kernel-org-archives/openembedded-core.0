Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8C8E63C8D
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:57:17 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19331.1769432233846952963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fSf+ehxP;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fSf+ehxP;
 spf=pass (domain: arm.com, ip: 40.107.130.35, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GXRwJ3/zP+vXD7leti0uV/FG6IBL3AKiM+UkhdRVKMF9am0vJRPDsVV4i3IN2iatQMfupExhdWJu4m16sQmppr4m3DFKIamTWOgFEW5q0NnUfaZzcxZHbHDmYMXpal1iAeoMGyZcfgsa7WN4lc1mtWriaK25POOysN6LEA9KzrQXwA9sRD4OBFjTOAbO74P/5W6mYg72U0oJ5klVe+Gzlzw2yYqDjjhYan3BOfCndUjN9X6hgW5pj+MiuQM8z0k+hO+lbYLVJvBLH97ZRHjyZHmjiuNdVpGX4d3918GUpzGGMmmi8rVpH016E1VHP+a2aNFeMqtVEEsIJXJNleP2ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcGQI4/eCoTjAeVd7kuyaVqrEwECT55SjqW5EzxqVRs=;
 b=Qht2xANZPesS7E+5SkELtW1AOJXZg85WvNYMSmASuU2iN6uMjFWuB2gtrrhRpKcKTqaarKkZHXGzDyoGPCDsePRpCBaB9PmOL7StkGeQGzvfhNhA5MnteGtg6t95yQ3nxW1fHZ5YJn3f/t/pj0QD+a3ddt2tQE8nOoiedAdR6clum9x8VL9QiQhfW/2Vz90qjqB7k/f/dGDeaESiKh1vLbyevIJEloYcDHnUkjwShDTFc3Bh+dV9ZTx8babVG7WpQyu/5QM6u3EOThy49M2CKESX8ZQkWwKT+3TfFgKgfAvJO80zjTYcvx0UeKKBQrQIAyCGlFRUIV4R5WkzoKsNaA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcGQI4/eCoTjAeVd7kuyaVqrEwECT55SjqW5EzxqVRs=;
 b=fSf+ehxPYC6ydCtpRiHDHbAu9UtoATvqD8iiV4331yEuts/s5oV/x6bFLkbmnNjDYgH9LGXBI1TnfgXI6MErKxAs3tjgw74045Q8jWPPN0N496C1TBTsBhpkiozkj05ZCEzhtEBbwzgBTfmqT62ewh0SuFfNYnfnTWVQMSZtth0=
Received: from DUZPR01CA0111.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::12) by DBBPR08MB6251.eurprd08.prod.outlook.com
 (2603:10a6:10:208::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 12:57:09 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::27) by DUZPR01CA0111.outlook.office365.com
 (2603:10a6:10:4bb::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.15 via Frontend Transport; Mon,
 26 Jan 2026 12:57:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Mon, 26 Jan 2026 12:57:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L37rsstn7qdlcczH+OYzzzzWB8WoVe0+Ppcd5CsXs+fsK3ukA0AlhDD1Wuy/VakCT/Q+dPoX7ItnhEb3Q1fRYR5e6udJQ4ke/00HPN4On09Wad/HUnXsKrC/2GYgeHCKxbqyLUuO5aYBDKfcxbckdkaG9vljco7o5Yen0WhRA9r8809BxgCOSG2lNuTD10wcvjFHQXgRlxjlIKvZn3IrXmbqQzL2eNW1m71NEvT0L4QbIfYAZFxyjKHLjjIcqApCFSVDu+g0Yg7V2NeNbHwQOWSxaYOrzE1astZX8AyzGGkShCGbqnylMjge6hWap2W6iY1gz5JxenmtGYn9zbnsSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcGQI4/eCoTjAeVd7kuyaVqrEwECT55SjqW5EzxqVRs=;
 b=mA5GbcxPcazmIpO7BxlmQtxZBpZ7ZReHbQNlOYqCQvaOOndgg3yIhkUQBbzdf+6V3qyx0RoF9K2mebY1me9nOpzSgz7xRZruIgyRoAPYu/4bUv1fpGVU1r8TUIShMInt2D0lB9tzrUxFAzF4CcP4oV2YK4KBqz4PK5d5144eWeidiRPLKmSvXCGf/4ubeuWTqAhv1voufCKrMkO3WIlrg2MtUvIsEjzHi4xGSAaj992DL0c6G5oxZyNAkKYkRewxsPxI4Teyc/pdmMda9uNaf+iw2AktaNAgQmCCIBAmex5Aa9EytobQsQq+myOhEaT6khftyc/PfF/lbJ66itoyaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcGQI4/eCoTjAeVd7kuyaVqrEwECT55SjqW5EzxqVRs=;
 b=fSf+ehxPYC6ydCtpRiHDHbAu9UtoATvqD8iiV4331yEuts/s5oV/x6bFLkbmnNjDYgH9LGXBI1TnfgXI6MErKxAs3tjgw74045Q8jWPPN0N496C1TBTsBhpkiozkj05ZCEzhtEBbwzgBTfmqT62ewh0SuFfNYnfnTWVQMSZtth0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB9277.eurprd08.prod.outlook.com (2603:10a6:150:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 12:56:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 12:56:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "valentin.boudevin@gmail.com" <valentin.boudevin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "daniel.turull@ericsson.com"
	<daniel.turull@ericsson.com>, "jerome.oufella@savoirfairelinux.com"
	<jerome.oufella@savoirfairelinux.com>, Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/1] improve_kernel_cve_report: Add a bbclass
 support
Thread-Topic: [OE-core] [PATCH v4 1/1] improve_kernel_cve_report: Add a
 bbclass support
Thread-Index: AQHciXM33aNOpcR+/kaWeWlSX0S8YbVkc0yA
Date: Mon, 26 Jan 2026 12:56:01 +0000
Message-ID: <BFCF4626-E19A-4020-83F9-AD64DF48F210@arm.com>
References: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
 <20260119184051.2878026-1-valentin.boudevin@gmail.com>
 <20260119184051.2878026-2-valentin.boudevin@gmail.com>
In-Reply-To: <20260119184051.2878026-2-valentin.boudevin@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB9277:EE_|DB1PEPF000509E4:EE_|DBBPR08MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cd48dd1-4044-4e40-cf69-08de5cda6a81
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?EKq6bOFLLcUl93RwSgmSERXS+3mWR0atSRv8iO/n3qFwJhCBr9+6wvIEB2BE?=
 =?us-ascii?Q?qemWhsWWVI6LUWd7Smkyj19e7DDRiyu+gcVUeAX6v4H+fk7WndmdlRe6TwDl?=
 =?us-ascii?Q?2HYy1sBr26EHYkKxGoHjtzegxXtWLmSm/en/4dCLwzWRz43hLQetdcBhbAxc?=
 =?us-ascii?Q?5gUEvQ8AOB7uYopbNpplSvPTlpnCTX7zIfl6TSNwV4zcM0enpCSf3HcP5jO/?=
 =?us-ascii?Q?9NOyYJ5UCJldoRBknQVz60gKs3O9jHfHzbahF31aXsYi+7y0tymDp1z/pQkn?=
 =?us-ascii?Q?Z7M97A6Vn+c2fS+hWzM+IRKfwIb9TFN64RcMTxewWAxAubuJ9hs0d9lKh86h?=
 =?us-ascii?Q?kvM+88W1ym5KhAbFRGNN5e1TbKL5E6ww6Q+rdMHK1QChVsYm+tT+6kdQ9wtJ?=
 =?us-ascii?Q?XiYpv/+YdE/cpcJ/rHpdglA7HOQoV7oWl05bOj0mqZ2Ej4qsPW1ZypdCfuRo?=
 =?us-ascii?Q?RXl6YYo5V05p5N2bhRk8IlAgk4tu9RVFJtD68U3sYaVty3Iu+vuTurDGF6X9?=
 =?us-ascii?Q?/a7txuUqUrSSbKG6hgYD0orGSYFBDfv40rSw7/lAqX9I2A7cTqo24VwnpWCK?=
 =?us-ascii?Q?0Jx3B5zU8jjGcHCqJg0XulAqKOwy+fC9v8WKmfsyzjo8QevOm3CSpdo8R4FZ?=
 =?us-ascii?Q?h8qKCavGXIMpZaY7BAVZgsM3D6wsZ5dJHHl1IymSwvkmfZCqPVqYtrnb5osM?=
 =?us-ascii?Q?e7gvNl9Swurdy3o9ClJpunAiX8dHlb20rw7sokLvxjl0IjV8Ti4FFtZsKUmk?=
 =?us-ascii?Q?2fFTvU6pmJco6jyNv6lPENCnebyKm9StQ6w5BXVFUUaaphDBVvyD8RC9rSTI?=
 =?us-ascii?Q?0MrROx51IJrpeBjY1HU3qUWegTleX/wfEg6v7vEJ+3bD5Upn07tvR1a1Olm0?=
 =?us-ascii?Q?wQ6Bgcou1a41Vku9nHSimjK+hGUa5qqGBOc2aEPXaTo8iqeT+IPB8/jt9y0f?=
 =?us-ascii?Q?tUA24EC3O7pTohsi4ghMQnWwmkgJ3ysmIuQrKDCsDBUH/iKvrNREOchbLCij?=
 =?us-ascii?Q?t318/2z2Ury7vFFnc2DsLw3krpULzbMpvGBbus6oPW+KrZ7or6ZlD/hAuou3?=
 =?us-ascii?Q?v1NswVQ5ztXG+tvLu2VPtD4QDR+ngLHuw7kIb0Js6W95utUPtYDE6u/zCfll?=
 =?us-ascii?Q?65InSsnAynzNLfGfUJOf3uJlPBPfhQBcAN8hQN0h5xQFcuqqtYBsFgBpBzd8?=
 =?us-ascii?Q?6ui7SovymHIXAAYE/9Z7mc99ckyf2T5h/7YGUnRSn8wAyw/jABm6xylLSnKX?=
 =?us-ascii?Q?FWEYYNs5QTN0NjMgjHYe0WC2KuRUhft1l70BR3Mv+XXikB/s2n7A30u3B5/o?=
 =?us-ascii?Q?j68A+Oh8Eb/kn4G+H6hAfwte1L+DOJDuieeNotMSGPKBysKKVtDFyDah4v0j?=
 =?us-ascii?Q?0/1vrQvkDcXb4+87YlDKU/I5FQyIYUTaJ2i+uUvC0Jh0oIEJVURWmDcxqYcd?=
 =?us-ascii?Q?xlbEphJPfTA+i00O7g/pIzttT/4Ffavx9l/0abWvA4qWsWYUpYtnVusODWFP?=
 =?us-ascii?Q?XMvO5yqyz4hjuX09uf5xpFpD4MxPLA2g93XKPr0UezZ4fyfsr65bCNtOHsj/?=
 =?us-ascii?Q?toG/RxalHjfiubZ/+CURYYmhXZZeVtn+2T6KfixIhdijgWb+h2QP5BriTlWP?=
 =?us-ascii?Q?QP/YlL9UDKSGB0ihM/fxPtM=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AAB758B3DD8B0747A42744DB09D469D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9277
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3d069c7d-18e7-4d88-5c86-08de5cda4263
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|36860700013|14060799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fkY1knu2L6ij1+PAaSDOLT7hBtCPnEjC2+JGm0zhgQG3AvO/CRYtGCZGsJ7L?=
 =?us-ascii?Q?l3KnLYekPwSQESJqaMY/PpXvwbFw4Cbmny+SbumNnQoV3f5gOsXZnfzNiASb?=
 =?us-ascii?Q?22gaEt7Vi+YSY9GyaJh6zBGkHYvnBM2r+jReE0F3Py59KOm3qMTawUeKGajz?=
 =?us-ascii?Q?Ut4Th/uALvmB+a0clT0EtvAAcR8yZDG03xOs8wxCs4JcBxj+Ox+130+6Y/bU?=
 =?us-ascii?Q?LejPG5Xj0YfKwxB2+CNUiQXG7tiDR9rO6EHeznIzI+UPrcVmco7sdHqda4Tf?=
 =?us-ascii?Q?3XbJWiUCoi4VxoA+P+pb790W7FHbJb1f5FDeNOuGLRmWvqRlrc1pGAiu/z6E?=
 =?us-ascii?Q?93SrS9NXQWbAaD8ST4+ShNi6DBaZSxxWrfpf8qykd2rmLXY2HMnW4d/oo5lY?=
 =?us-ascii?Q?oh1b5Hbp3rZDfWMw1A5vDpMDfdvqZIxs6kp1EItbct7xA8TrXUllo+KlvWqK?=
 =?us-ascii?Q?gBN6Mu6qyX5tcsyOsakwoSVJy+PDtU4HJWKUa97Ih9aOQjAHU6FmAwjupA/5?=
 =?us-ascii?Q?pApMP8BcGtr/gzu7PVNiB5fEJUp3N1Fmp191/r0+/YfCV/I/xaEOsEqNwc1a?=
 =?us-ascii?Q?wTolj5258XMyNpiYDTv//Sx7OEzCMyOqYST2oWcsEiIxXeunushYAK7iZMyp?=
 =?us-ascii?Q?PzgpG8hjXYe5Z8Ij4S8OJShqQCnWV+oJkPoApB25mXoIhqCGG1sx+lR3iisL?=
 =?us-ascii?Q?4pvKtkpli35nxqt8QMB4mIlXcnM6wj2xsS4u/h+ZsLyjVdL+X2yG21c7U/lx?=
 =?us-ascii?Q?7Jva2y6dDq1FKB2QogyHYPYSf1Cs6+CfLKkEUHsun6VNTrU33Qahy9JKqAvH?=
 =?us-ascii?Q?GOh2iECHwTB7lwg/Ad/M6iXDjfb6RB9k2s3xRO8n7fRts2pPh2dQr8xOUVp/?=
 =?us-ascii?Q?EVE+QZ0DB7mQaiHzxs0N35knmASJFhsTgj2aKUBJNVOMCr5NO6+Cog4Z+ts6?=
 =?us-ascii?Q?6TcLvkH9t5Vv/GJ0+MVUAfOHpWOjpzuGKHjxA2zZZ35UkelOlrdztizL1Wjf?=
 =?us-ascii?Q?beOfFzvoy/v+RBsv66xNQfpKdROX35Dnto5RRM86yw5zyeNvM/d+0wmzX653?=
 =?us-ascii?Q?rR7m0plAL3f0ggtvyCmdnZ87Xg+HYPo4zTrPRbH1APj1VBtXqugVIPuLnxvZ?=
 =?us-ascii?Q?uHSsTQoE7xenoVdD5iBsUbE58VkIsJVuEMMIbfqhKFNl/ALX8IOtOUlJFyJa?=
 =?us-ascii?Q?CFCsgd+b5qadvjQG7I5lChvwDMjh6ETv9wtqkpHOLn6Z5DecXRFj44K7SJF6?=
 =?us-ascii?Q?SXsKRVGvSD5y/TqZPFF3QZJA6OboKfUOBR0Et8FIxT2yRSYq6Q6Cd9t5cWEX?=
 =?us-ascii?Q?k6Q8N4siJkbczzdRh1y2K/ZAs0DIwGg0mogzFKPSbmKAcI35dUghswsk7Jts?=
 =?us-ascii?Q?DX37Kn3m6IaZRckVn7k1AWCQdkw/tLd7UOcEKIDErMQ3k1PtZI3ay4g0J7Ue?=
 =?us-ascii?Q?AgI4V0l9duMpc1OkJidHbVjUdAU66qurb29GyHaqqyxnAAu88b5Tbx5GM8ag?=
 =?us-ascii?Q?K3DwHsybKpnyzs/KENCxSAut3bkoBBT85vRldusC6g8k4/SaxqLBvaKMukx0?=
 =?us-ascii?Q?mhH0ju5XBdaSQVizoKoZLH/65oV+sbjyXPwxBA3KrdZeIae2FwgSyF/p08Vx?=
 =?us-ascii?Q?HO0OZa7l4kHub4HiqHxGD9mPva7Y09OVW5IQfr7rkJLeu2j0b1pUkcZtJi62?=
 =?us-ascii?Q?sseIjA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(36860700013)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 12:57:09.1680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd48dd1-4044-4e40-cf69-08de5cda6a81
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6251
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230004

On 19 Jan 2026, at 18:40, vboudevin via lists.openembedded.org <valentin.bo=
udevin=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> The script improve_kernel_cve_report.py doesn't have a bbclass.
> It can be useful to have one to generate improved cve-check files at
> every run.
>=20
> This commit contains three classes:

Copying Josh to have a look at the SPDX integration pieces.

This will absolutely need some tests added to oe-selftest so that the code =
is exercised.

Cheers,
Ross=

