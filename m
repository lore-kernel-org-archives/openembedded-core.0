Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91545C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 10:12:19 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.72])
 by mx.groups.io with SMTP id smtpd.web10.7546.1721124738053198855
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 03:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nlRODEVV;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nlRODEVV;
 spf=pass (domain: arm.com, ip: 40.107.104.72, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FOBH5k3MwfZ8WyMb7zfVpDiZvO+4eA8TGsISmUri9i1jg47EooLKF5st34giC2vBHmz9Snh/wz8Bf15iP4ejPOO5NQ+imAZdLXcWclzBLdKgOEcMWpc4VznxestDuThUPXYl775kpwdSgH2UzLg0Bye6x+S1NPTQbRSsqrGiLOWLV6l6zsTEbUBWuSdO0aynkbfrD+kKbLcIpovHnRelMPL1CXWaFFYIhErtbX4lNVhBNC79pyy3Qe+uiAB6yQ+BvTvWSM0oh8ebNsvkw+bAIscX2BbrXWH7Ix64X0qOBHGSikFlDQH7BwU5pxIwhpRc7vkDiT5BmRi9SIRleJBVrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RL1s+AflWdYxPdwEb0eg/Hj4RVfZxBNUt3PKNr8aS6Y=;
 b=nPU+5PYH/fPJiCXCe/MqLquD8RwjtVMoDik+nI6UTa+biQNA7W4kVsd6porfRhklvBU6VovYuaUpYEEbZAayNF/RRhRgS6HEu0iXZh1a1ky4gR+ejH/zYjqXxkeXVgXArew1fjKKNMHLZv2GCZT9T5p0iPf2ScCf4/amFSJZlk6H1p71FyoE+gZr1ViB8jb+Rk1ORyWqdoGpSCFlHo/rnjT6OHVmnuq34A9+fNOt3qCbC3yTh7DtsI3PX/f/abGca+6WvSZTICtCdMQSp3fsMFZnXSEm3ZVeUpbEgEfKzDdg/iYmMtJFs4HhQEY3WpGHmTI2cAZm6HAWjOapg7ewRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RL1s+AflWdYxPdwEb0eg/Hj4RVfZxBNUt3PKNr8aS6Y=;
 b=nlRODEVV3pYmyDnJddyKQy9KVaeYupDSCG6drJoFq8Cf3IOQldGxSwvQbzG2H/S53rWPjjHWR6ClTyH0p9u5t9Gq+x93tduWAONZUX2ZIRv2DrtWOJsShv7SSRk2mf8DOt1+47hsn8u06iS3A8TLa6Cvp6D1CT/WSS5wNHVIfAE=
Received: from AM0PR04CA0088.eurprd04.prod.outlook.com (2603:10a6:208:be::29)
 by GVXPR08MB8235.eurprd08.prod.outlook.com (2603:10a6:150:16::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25; Tue, 16 Jul
 2024 10:12:10 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:208:be:cafe::55) by AM0PR04CA0088.outlook.office365.com
 (2603:10a6:208:be::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Tue, 16 Jul 2024 10:12:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Tue, 16 Jul 2024 10:12:10 +0000
Received: ("Tessian outbound 2679ea9529ec:v365"); Tue, 16 Jul 2024 10:12:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 270dda718b7b6aec
X-CR-MTA-TID: 64aa7808
Received: from L5ddeb813d3ff.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B48CAD34-E59E-45FC-A791-F5E489F6C8F6.1;
	Tue, 16 Jul 2024 10:12:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L5ddeb813d3ff.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Jul 2024 10:12:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUd+UzSvTRCJ1n3ERwj33CbpLTutj2lo8wJegaj+fLhFF9AIHfu1/r/f2A8NchEFx4kvHq4dJIC0Ff1WDEO9ZF+Yx5Qz12iV4hw3qIHYozZbVJY5ZZ45maDd9gyu+92E3Bx7ToSZTTN2NkYjklb21HCYRttGSISce5BHFv/4zjnO0kz+OwtCP9HnYPDc/Wge8whlymQSxzRfMfo0TSKMzEJDZ1G3YwDAqScS6WjusQRcxC045biiZx/2Ye6epk0BybRKszZ7HwowzqagREMbCEb/nP5PBuGiBQWVUbvMVLsQYcHB6LltCvMkxNNDjsARb7oW9hgIqblr8KINlotGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RL1s+AflWdYxPdwEb0eg/Hj4RVfZxBNUt3PKNr8aS6Y=;
 b=c3CZObW5ztJzFv12h9P6qkthbqMKDTjKh5LAqdCYyWewm4QUTPQriz8picpJDW+JILLcg3xk0jRBn+TfAwOwnLnh10eV6ecof5IS3tCff3vtF6Ma2JMWmo8n0b9tb6WWB540kv8iLZyDPY6oUi0X4izTOxoAFNCnz6B+L2/jvF9Y1y7JhSKcb0p3gFwtUFVrIBlPBB/FrifovB40U3J2ATqr6XkrNBf2RbXmRyJAocaiJywwP8W+3CWjVR7wV89fSWWLI2voS7DBuYW8tnrlIsxa9F0uQwDwbGCwomA1NB29jZx1XQxlgPxc7WvS/DtRlq4SO4qdCp9ZOhLdQ+kqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RL1s+AflWdYxPdwEb0eg/Hj4RVfZxBNUt3PKNr8aS6Y=;
 b=nlRODEVV3pYmyDnJddyKQy9KVaeYupDSCG6drJoFq8Cf3IOQldGxSwvQbzG2H/S53rWPjjHWR6ClTyH0p9u5t9Gq+x93tduWAONZUX2ZIRv2DrtWOJsShv7SSRk2mf8DOt1+47hsn8u06iS3A8TLa6Cvp6D1CT/WSS5wNHVIfAE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9368.eurprd08.prod.outlook.com (2603:10a6:20b:594::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 10:12:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 10:12:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "kweihmann@outlook.com" <kweihmann@outlook.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes/flit-core: fix dependency loop
Thread-Topic: [OE-core] [PATCH] classes/flit-core: fix dependency loop
Thread-Index: AQHa1rFtiLymMqFzIEezvnhx9evJfbH5I8IA
Date: Tue, 16 Jul 2024 10:12:01 +0000
Message-ID: <3D92F9FB-177D-4E13-B21E-2CC9BF2BEC9A@arm.com>
References: 
 <GV1PR07MB91206A63390D43C3F32D7118A8A12@GV1PR07MB9120.eurprd07.prod.outlook.com>
In-Reply-To: 
 <GV1PR07MB91206A63390D43C3F32D7118A8A12@GV1PR07MB9120.eurprd07.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9368:EE_|AM3PEPF0000A79A:EE_|GVXPR08MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d05e95-d532-411f-fed0-08dca57fc197
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?IYr9vAV8D+UQU1IQzhQriUxjxG4k5tZtfFO4Hvyj6oGn0gR/Xs4BmZjiXTTF?=
 =?us-ascii?Q?FBBxA9fBLdgg8Z6xbdCOZUps7MW3I8cMiR8adpwBj8caxsppObAYnNkP+jj5?=
 =?us-ascii?Q?KHEIHLLlnoX6/BpqbNxzaKmADbITBZFImFTvv0TS4j6dCe4u2O6LUXa0R4aQ?=
 =?us-ascii?Q?wysgTENbT5O1bwnbaaKrebGNCoBKeybN4C4F1+gWkTof+wtLxEw+Gvt2M5Kj?=
 =?us-ascii?Q?E0yyuN1JP5pdQ0mhb8sT2npCkfWyYnCPqTInGucYgmkpxfkL2hOKTT5aAxT6?=
 =?us-ascii?Q?86jmC9LTYV3wHRslrESWi2+cE+PfCLrfC3xvb2yHtUrdUvoVpR+zyIijHt3g?=
 =?us-ascii?Q?KusqZNJQ4/MNx6eWK6cG39l4Xax+NvUdBENVmK/2lQYfVJeROhQ3i2Z5liJB?=
 =?us-ascii?Q?T64JPRGF6cpw9PIK+5SmhditMT8o1amP/3xkzFvlh+HGu56Hs5gT5qgtScjq?=
 =?us-ascii?Q?YnHE7/Nu3nnxHm8/9BZJZCAJ/gOpfrdSYHmGBSdwxyyMFGctgWrtjV8IxvRx?=
 =?us-ascii?Q?p1vdUXx5nkuD2KpRHwFZvlfsY5xdASb/3JWtZLHgAaTTYQWsRJP1AUjYUXGc?=
 =?us-ascii?Q?uj4+z8DySAp1Wwc00M0LJYv5sPnPCJPNjSKpgGW6JRltjNCbbIKsjOqB4ep6?=
 =?us-ascii?Q?5JkiS8SXr7VZ7OtAiUuEVRo8SAxCLcKMUaThX+Vhd6m+niGmilXobjR6X/02?=
 =?us-ascii?Q?V1EY5eKZppOSg9UBPy+Px0M469+A4MOjTQ/+S5ntJE+6XFvWWBMg298YDXNg?=
 =?us-ascii?Q?Xdz/zatlL4CTSpabp//ALt5MlUY4xcNEtLAo0Pa2VmAjgX7ZUe0+GVAV0XoM?=
 =?us-ascii?Q?g9VQ7H3U0oiRd1TNqRxyHM6a0W25lbRa0Q0OL8V1b6uv0luvz005Snaj/sux?=
 =?us-ascii?Q?l4JSFjZBQavNSWuV8p6Ic2als2kVyQbhjp9zkjcnHTZdqV2F2p/gdhFrucyU?=
 =?us-ascii?Q?LqCGG1RqGDyqWZM19cMSJdNEbfOrxdfc4YXRnSvCSz82R+2KMHPeQ6lBAxzq?=
 =?us-ascii?Q?Y02t3CsVtM/tmW8Y/Zj6hoUSdToJVgZZKKeQAdGn/4gij0PSYoazH73u8xT5?=
 =?us-ascii?Q?SDYOGrbgYmme2gE7HHPX5O9x0VCsyhn68x4X6vO3rAB5zRgA5wf96VD6SX9J?=
 =?us-ascii?Q?tm34R2DsyTNkBdtVGwEPzX7AE+zVNCfeNrEVPeorwvgUtdlFUtNmcbQ+SvUM?=
 =?us-ascii?Q?IR5WrnU8IyG08373Ezs0HoaZCP92MgCT1nKc6uANqZ3UxNsMe+BstBxTxZiK?=
 =?us-ascii?Q?EvtZUBguoTBkRRM7UiLsuCAo6g9t09ZX+nwIlS1rVlQ77i8thsR7uIr0iptf?=
 =?us-ascii?Q?tkoB0+QzaDEBbB9Kw99PRIp4t/RY0Lt89kXrAFAxUmREa7vt0mEFuilWLRNS?=
 =?us-ascii?Q?sNV3Dovwm63OUwUVt8XF+4Mr2UHS5doQQnz4m9eISZz3K9/uWg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3CA228A0B1C77E4F884D07B54093BB4B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9368
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aed9fd7c-64a4-40d7-08ce-08dca57fbc15
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ptl6iD74mlfbxliRT3LrNrnvxPmudl1ThOfhKDlJSJvznHqPYsilFe7qC8hs?=
 =?us-ascii?Q?Aruomrf4kIr6vwBCYw0FfGRKqQivdipgrmHUZ8QWlufMpmzZCKmnn7Vm2DAu?=
 =?us-ascii?Q?Eh6MG+3iZAcqUatK0vXR4tU89q0UaWDxQDKODLdZi3N62VB7Fgye0teMwtUm?=
 =?us-ascii?Q?EtzZZ7iM+gRpALBp9SjXkxq1wHvGCr+NFt7px/29xIS7P6sOkiAYhjlqpyDy?=
 =?us-ascii?Q?pX7o8NnpCGbD4pD4kmVc4n3EYH9anNM8CSU6est7EOs/Wc0knlUPeVE5Z5Ju?=
 =?us-ascii?Q?r+j267mrPGDdtxvOoi+ap0DP0MWJsJt10zT+6btYzaLBcFdhQBQsItfHC+Bj?=
 =?us-ascii?Q?ivzuh0pF+wLk7saaGIe0I0q35nCzETLPnxbbbTAE9C9NGLr17ZYN/HEU77Bl?=
 =?us-ascii?Q?1ERfG39ObILfol/UZgqwKDPV+Jsg6sby+DCxp7+FZb3BRFpE7bl8Q7XL072N?=
 =?us-ascii?Q?wKRT/mjWLBQef/H4h0p39g9cQ/beDqFCBvicwlSqQj5UrvIrg9bdEM+ZpZ4A?=
 =?us-ascii?Q?UiLe0sMKVthrM79a/FvObiRCZAdj19gGa2ZfUELI0UA2NG2SkyxKP2XIHMfL?=
 =?us-ascii?Q?8hr/qXMTAXUkEE2HU2mp2lrL126q0scpxvQK0fYvi7kKo1Sq6sdMfmVcprHt?=
 =?us-ascii?Q?5IHoeYhG77itNfieLM2GoB1ynml64NjtpW/wRjZ8d3KJjUkwpBDL7tJNUNJf?=
 =?us-ascii?Q?547VMwV2ECJEaxH2uDFIKg6VLuNHzOnP4Exe7Iy+Fa2WVWctERx2y7sVAUUb?=
 =?us-ascii?Q?iFcHJd8CYe+2OtfNtrIHJkL+ynQIrE05mAsbNHNVI5SC1yLco9ZaIn5V6BMP?=
 =?us-ascii?Q?hNjtJFY/fxDxoKZHcuP8bnh1uQBoFYOIj87MflhUEIjqUzeb6T2rmhY4locF?=
 =?us-ascii?Q?Goi5CaeY5Mf60fWD3yrhKSKZrv4NE1TAD9Yq9jtNX2m6wqCUWG09BERprKQz?=
 =?us-ascii?Q?MtXeUK7wyC69JCF2M6b1yosGJjpbCwpgjynJGxdZh38n7pFiSINOj/H7T4b/?=
 =?us-ascii?Q?fDIwZ/F4bbFaTOA2wP4pm99WQNm4/3NbFjeqPgpIOwErC4+2Mm0M3cBOgksW?=
 =?us-ascii?Q?mMqhqjHxHdKonR3DBQGd6Trl5QQUnjQcYEDrCmiZAhlxhiH4lak3wRnzCKyc?=
 =?us-ascii?Q?HWOcuG4JoE51U7KpCg6XadvL4ykOuv5oIebC06y0Bu/3+oloBKW06S/3M6No?=
 =?us-ascii?Q?u0jdFoKN8VzchKXYuE1ToXXDGBfANjFoBT2DMgi898WLOMumroebJbn94QJL?=
 =?us-ascii?Q?RYd5iwa/t38u5EuC7MthDt2L1O5qKvZ1LtVfjS6sweZVNe7MTbHAlt3Hx5FH?=
 =?us-ascii?Q?71kNBZdhaGCl6kO9j3JnhRzQ0KCyoL04wtBshUpu11lY7NwG0rYxod6gq0Jr?=
 =?us-ascii?Q?1XYGIogK2Dc5QgPiQ8wuO60Sm2asPq/2l+3VRGreY8IdPWWHl3UBqkb0wF+d?=
 =?us-ascii?Q?jgHtX/wU4sD5yIy7zY+vS96keMQONJet?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 10:12:10.6692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d05e95-d532-411f-fed0-08dca57fc197
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB8235
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 10:12:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202101

On 15 Jul 2024, at 13:18, Konrad Weihmann via lists.openembedded.org <kweih=
mann=3Doutlook.com@lists.openembedded.org> wrote:
>=20
> when using python_flit_core on a native recipe
> it was creating a dependency loop, as tasks for
> python3 requires tasks for python3-native,
> which is essential for building any native python recipes.

We build native recipes in oe-core with flit, can you give an example of ho=
w this breaks?

Ross=

