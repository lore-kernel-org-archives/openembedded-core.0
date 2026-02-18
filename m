Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDA6E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 17:01:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16815.1771434110721002476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 09:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MLC0p5lp;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MLC0p5lp;
 spf=pass (domain: arm.com, ip: 40.107.162.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TTNsz6pXHS3snJ5ZfEjmCe4q4+oBadG5fe2VY2hkB0xzTPt+AWgzGkRTTrkRYdIkhfHPqDwtUfgaPBo+R9LksMRqoCLCJB37pnKlFcCjJLo4IYP2WFz9VbsZnGqPdHPUqrvVgL9nHpnP4iJmwOgRWdwKn3xOCh/IMqsRAAatswLkoZ6TYF2fFHex93MhDRNOGk73H7TSFk+TWfD9e2pqOkZjt7LYU9GDW6BjJ3ZeH90qGhYs8oOY9jsCfp8Yxgik2v+RlJjgzF6p2acu5gf/Dpjhicp8uqgdtP0hkXEl+ztkrUVFVoTVd/qAqC5OmSdnCQjUElCgOvzprgJmR+Y+QQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNicw+48V8+/WpO99gubABmnxpDUQpnROpc8VUq0Vlc=;
 b=ieXwBq2ecmaFAsq0oW6xoAq4bUifeBMxq8/mmFr8cETwn9Zy9PMJfIymRY8tDUeA8DUFXZPqoFk8xYgQYTT/M7Fe1+kD8Zvrp8hajRQgWSs8WIpCjJMhvRmVYhgrFr9przoBbJA4D/dZE8Vraa0gSWtH8H3aeUCInyqOzEFpmTx8FFxOKNjjzIcDzbZ2v5dMtdomUqxbnCEGd13I4oQynvzhpP6sdTJfyl4Oo9bwmINuYXUZxLICKaEqXCuFA3EmDu2FX/SU5ibtqFPzu5TWcdMmhPYuajer7fmhT2qUXe2SezCES4/ZKNXLeekmXQ5t3qQIx1iRIl6Y0vYcWyMAOg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cisco.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNicw+48V8+/WpO99gubABmnxpDUQpnROpc8VUq0Vlc=;
 b=MLC0p5lp3MpStxn5lfUmSo2J+zk+z4IgU0P6hLEwnXLs+zrXs9yvE7MQgmzLJkdb2Kr1F8Q2lIEyYHJd0HxwZPXVqrlvQBR3KpalsqfhOVVNGv1ZC4UFHdh6qJSwvIK4dTF5CRWaehEyXVeZle784cy8KQvQHKADvmi2DYCXbyo=
Received: from AS4PR10CA0005.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::13)
 by VI0PR08MB11774.eurprd08.prod.outlook.com (2603:10a6:800:324::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 17:01:44 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::b4) by AS4PR10CA0005.outlook.office365.com
 (2603:10a6:20b:5dc::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Wed,
 18 Feb 2026 17:01:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 18 Feb 2026 17:01:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8FBCLrIZzfAz386ZLYEqb5O0JAu2H9vRGyWid5X0VxGb+yuA91yjjHLTDKFjsFBWN1y9B4npkHQFHnX0L7YIidUGLPik8pe3hOuumT52B5U9KRdyJ/Ma+p69dMCSZmXXwuJTW4UTx5/5yUI8fw2QZQF6OmQFQCgmeRKUKiPFuX/09bCJQEJwmpr5PHYMtR/Y5EZxrePPU3O4GwxWjcZmRy/1rCxytbbbQZb18PMIPazpQ8bN7h9jefSPGy8FP6ME20fgGgLxBF8JBqP3+BnXNtg/kCg2knIRv8I9sSp5tVCb71xj6dVKlfgN9msFZXNO9YIY31Bk1uPE/lXS+IoPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNicw+48V8+/WpO99gubABmnxpDUQpnROpc8VUq0Vlc=;
 b=KccLA3Q/KAknL6cigaFHGxHbURXwRcC7gyYRPIFEuqabi8vw02MbSFgocMs/rb3ebK3XP5zkzRpUPqjoXHRS9gp8sXKQKPYpzoKcY7fmRmydvFmMCLBOtjsVZGdAB5WfqXXZDd4YELtuLnUMQ0UAgptdPPLUSFiskOOrV2vFaGVMRBwy6ISMcoCwB3C/RF72vAx7oyjfgoyxnpXpdI+AD+/6PrsFmu6gxa3yAVazxeHbp0UcAdnUBtuuU1Bgmh2wVGsjzJuBMbE5tZHYbrw5AUWrkhIjALzvS8HRTOvQpbvi4NcL6L1w/ZnVBl402VexItH5t4bSsmER2qdLj9Qbrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNicw+48V8+/WpO99gubABmnxpDUQpnROpc8VUq0Vlc=;
 b=MLC0p5lp3MpStxn5lfUmSo2J+zk+z4IgU0P6hLEwnXLs+zrXs9yvE7MQgmzLJkdb2Kr1F8Q2lIEyYHJd0HxwZPXVqrlvQBR3KpalsqfhOVVNGv1ZC4UFHdh6qJSwvIK4dTF5CRWaehEyXVeZle784cy8KQvQHKADvmi2DYCXbyo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9660.eurprd08.prod.outlook.com (2603:10a6:10:45c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 17:00:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 17:00:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "deeratho@cisco.com" <deeratho@cisco.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [openembedded-core] [master] [PATCH] cmake-native:
 disable libidn2 for native build
Thread-Topic: [OE-core] [openembedded-core] [master] [PATCH] cmake-native:
 disable libidn2 for native build
Thread-Index: AQHcoPgc3mdKBOJB0U64/VEa4PAF+A==
Date: Wed, 18 Feb 2026 17:00:39 +0000
Message-ID: <F25315D2-F9F7-40CA-AEB8-3D124EDC99A3@arm.com>
References: <20260212050352.4090817-1-deeratho@cisco.com>
 <D158E9C9-E6C0-4FD3-939F-E941A85A4FDB@arm.com>
 <920657.1771264467737815347@lists.openembedded.org>
In-Reply-To: <920657.1771264467737815347@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9660:EE_|AM1PEPF000252DF:EE_|VI0PR08MB11774:EE_
X-MS-Office365-Filtering-Correlation-Id: 575c0121-2ccf-4eaa-3ee1-08de6f0f6522
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bEtXWTJ4VXJ0elFCS3dnN1JLdWJMVmljUzZOVnk2UDlJQkJwcmVSZkFRT0Vx?=
 =?utf-8?B?d3pKbXFBSEtzTUF4RDM2T3cyekRCWHJBUWdkZ3lta05lblVPTEU0bFEzWEQ5?=
 =?utf-8?B?Z3BNWFdrV1BHNUZldHNmOFhGK0p2c3ZpblB2WXR2MTVzZ0t1bmNnY2lMc2Rv?=
 =?utf-8?B?RW9GdWZjTE5YZk9FYU9EdFBJcHlpNUZreGFmN3lXWDM0WDlBMElwTEwzbWhU?=
 =?utf-8?B?RnJ6Y0tIaHBWdHFNNXI1Y2RySGJnbnNUZ0o1ZlIvT0hIVEpianFmQWxrdUFh?=
 =?utf-8?B?cHB2U0ZaeXZGakViTDRQMXVCWmZQOVh6QWVhbnUvUGo3Slo0UVpGbnBZVExM?=
 =?utf-8?B?azdqZkFnZ05wYUhZMGxFYWJWRUpIT1g2SGJZVXBCSWw2aUxjb1RKY2x6K2Fw?=
 =?utf-8?B?TXNDN0p4Z0xsUUcvWHlHQW8rOTF6eUFlck9JYWFCUld2Sno1YjNJRnlXbUly?=
 =?utf-8?B?VVVuTVJvS0RkbEkzVHVndHZSQnJFd1ZVcEtHQU00aWJYVENSbEc4Q1BYakdU?=
 =?utf-8?B?ZjhUWmovci8raW0wdGpEckRlY1BDSTJkcjZHNlhsTXFWcXQzVEh2RVFINDlq?=
 =?utf-8?B?dWp1Rkw2YlJvcHlhNk9rL1R3aVFDTmc2SWx4bHRnWDZoWEFYNmFnNTRDbXdw?=
 =?utf-8?B?dlpuSTJXeEhQRlU2TTcvdmtDbWRldXJibXZFK1Q5TTVUVSsvd1NKeU56ejJU?=
 =?utf-8?B?a2pzaVY0NFhReUwzTFgrY0Q2SzdhUVBtdzBIYWNnNCtDancyZEMzR2Fra2tk?=
 =?utf-8?B?RXJSUnR4dXhKbk8wNEtQeUhYeG82eStSRlFMelNCMm5laC9XcXdtYmZIM25S?=
 =?utf-8?B?Mmx4MjdGV0diM2NNamNPQzRlTUYwYkJJYTloQWg4SGwvdERMWnZVWjl4bktR?=
 =?utf-8?B?SGU4WHRLUG1oUDJxcllNcndBK0dyaHd5SGd4MWN4Zm5iVWFQR01oaE5nT3VN?=
 =?utf-8?B?UDUvaE84dVhxLzNIYVNiTlFTTHRNcXRPSzdXY3dSOVdRMGVtSkxzdk5DaUEw?=
 =?utf-8?B?Q053QnhvR3NNTitZb09TZk44MUt4QUhINVB4a25ONXMwVEhYVlBvcy9EWStO?=
 =?utf-8?B?cmIwa1JDb3NmQzhZZ2J5MjBLcWg2SFNpb2NVMXB4VGJRN05PV0s5QXpLRTli?=
 =?utf-8?B?dFF5UnRlM2FRNktlam9oUW9RL00yVDNrejNoZ2p2OHlIRENOQXpQNGhVZkpp?=
 =?utf-8?B?NS85RldjekZJRVNDKzQ1eERRdWZiK0tjcDFaN0J6TWd4dDlOcVJDYmx2WitN?=
 =?utf-8?B?SXZLdXdkSzRkeFh2VnF0T3IxMER0ZElqTW4vSDJyeGhLMzVkU2RhdXBUUVpF?=
 =?utf-8?B?SzA4V0RIeVdHRVUzTUtHSkpMV2JMWE5yQVlpd3o3WVY4aW91RmcvNkpKZ2FU?=
 =?utf-8?B?NW5aK2tSUnIxYzA0MFFSZHh6THZWNzlrMDlyVnN0OUVmR1hDTlNMbEJxTmpR?=
 =?utf-8?B?c21DdzBmSGU3VTYwVjdMVkNHb0pzaXVWUnJqc0l3MzlLNnlpbktlK3YwSDV0?=
 =?utf-8?B?MlVUaXJTbkxoN0hFZUllUTZwMzZHQy9HY3htWFh2bWJFdnp6Visvd1JudVpU?=
 =?utf-8?B?N3hRUVF6K1pWTTNleHVyNDljT1hIVW5uRHAra1QzRXZTT1hLOFZPckxTdFNM?=
 =?utf-8?B?cllQZkZkY29WSlhpV2pjaEJQZ1VTUTRsRVFKRmpCSHhMbFBzM2JmNDRTMXI5?=
 =?utf-8?B?cHR5cWVjQzNLZ1MyVC9OeCtxUE9keWdnT2lCK29wR1Zzakd1dlVLMUE4c3o0?=
 =?utf-8?B?dHdueEREN1RXR1F0aXlTWXgzTkk2MkVLSU9aZTR3bHFvcE9wK0pSMG94eGQz?=
 =?utf-8?B?T25oZG9JMkZidUhtanFoYzgyeCtxQkJ6azlPV044UlR1TGt5UU9mbDluN2Rt?=
 =?utf-8?B?d0ptaTQ1b0NTbXZVQkpBMHlybW9IVzVBNVJ3c21wd0pYRVh0c2J0dSt3K1RH?=
 =?utf-8?B?YWZ0cURQa3NyZVdrNU9xNHZLUEJYQ0F5dmg2OVdLcVQ1NHRBbHV0eEo5RFhp?=
 =?utf-8?B?eVB0TG5JYW5MbjZvNUFMaVc3TkxHNjdjbDNKcDRiOXpla2tWcmg0Z3N5NW1x?=
 =?utf-8?B?S2pNZEMrdTBHVE1CVk9Lc3pYZTBVaXJHTy9vcXNGSkVkak9qVDFZSy9ja3lj?=
 =?utf-8?B?bVJtOU42Sk1udi9nVmlCdlE4QU44K3c3Smg2OFk0UHJKMnZVaUswdmllUUhn?=
 =?utf-8?Q?RyWPVPZy9dV1A/ODRXG7Xq0=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB0C3F0FB363A545882DDC22F2C4447A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9660
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6b832831-6550-4112-0018-08de6f0f3eac
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|82310400026|36860700013|14060799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N0NUMWpYRmxEV2tsWFpTd0xHdVZjdlUreUFFZXZlREczZ0hSZTQ0WHBJRGZ1?=
 =?utf-8?B?My9oWkMvQ0FqbmduTVJLNUo0V0p1bC9wbFFxSWd0S0lUVzN5aTJiZTNCUXYv?=
 =?utf-8?B?bEU1bHpxOW0xRVJhWC80K3pLSnNDa0JmMVN2WE50ZnQrRGxaVjV4OG5FRjNj?=
 =?utf-8?B?dXZ0OS9uck1hRXYwVnhHMy9EbnFoNDVhaXBrSUhJYWhPazVDbW1KQ2VkVFd3?=
 =?utf-8?B?dVlXbVNXdWtucHpoeHV2Kys3OWRVNlZubnkzRUE5cDlDNXFVNjc3RU1mdXJH?=
 =?utf-8?B?U0ZGNGRoeC92SHRkR2pJb1JIY3dpSmd3U1FFdmR5cUw5Tjh0L2J3dy91OUZt?=
 =?utf-8?B?U0NGRFEzOHNYQ3dnMStuTVFwTHNuVmh5RGVRekZzNzg5QjJHQmxMQ240SlhN?=
 =?utf-8?B?c1dkRjI3WHVPUEUxM1FwQUVrUnY5cjJPYXVRU1lNWDFGK0c1QmlXT3I0dGhn?=
 =?utf-8?B?REpKNTdEbURkaE1rUGMyYWMzUXFhYkJiblJVbWFIWW9BRnpWS0ZtS1NpZ21y?=
 =?utf-8?B?ZVgwakljSlp2cDBrWnJlSFdsOVp0NXowNmp5WkFCTFFuRk5hdFZYRmIzYTUy?=
 =?utf-8?B?QjJ3RnVyNk1rUmFEc21PNFhSSFpGcnZMWE9Pb05XWVZkUldHT2hERkNVYWZP?=
 =?utf-8?B?UXYwcU4yeUYwSHRZaldJUHpzeC9saFVtMDlHRTU5bkIrS1V2Q281TVRIOUZY?=
 =?utf-8?B?M2JiSk1wM3hnWkZuN1VNdTdGcHUwTEo2RHowazlBeWxUd2Ntb0FSUjUwVnRB?=
 =?utf-8?B?cXJHeloybFhkbnpVdVZ2b1l2RHBGSDlHYUdMY3RXMklWZy8rNWRUbVVzcHg0?=
 =?utf-8?B?QzZmVG0vOUsrZ1l0Q05xcXpNZHBEM0dTZi9yVExqRXZBSjZmMzFsV1RlTHNu?=
 =?utf-8?B?c3FRbnU1WHdVVUZjaXp4WVJUbEJ5YTY1NklKSzZkVEZ2eGpHMTJneThDYTRp?=
 =?utf-8?B?OFdrd3pWUkpyV0tEMy9hR0lHZ3FMZ1lWMU85VVR0K214dU1iekZuQ2J3bTRo?=
 =?utf-8?B?MFhMV0hvaFFZbGptV2EvNjFRY2JqUHpiZFdNenBaa2dsaUtZUjE5ajg2aGtn?=
 =?utf-8?B?d0N3d3FET1ZKZ0hXZXBHd0phV3kycHY4cG5zamliTWZFT2lmV1ZEdHkrUzBR?=
 =?utf-8?B?K2xnOVBrL2xvWW8wODV6VDNQaHArRlZDME1WampMcjdLTmQ1RmdHcnMxNEpi?=
 =?utf-8?B?UnRGZHpBK3VmcnJUQmNjK1FyMnc0aW44YUZtQmRCVzBtSDUzVmd3U3ZDcVZI?=
 =?utf-8?B?bkg0OWs2YkZWZTdlSFl6dzdEY0oxUUlGTS81alRlQUdpSml2UVhKTDZMbjc4?=
 =?utf-8?B?ZDkxVVBUMC9TOGhTRnZIeHl5Rk5raklndWM0RmdJYXFTUTFYbEFFcUxWZFVC?=
 =?utf-8?B?R3VXWXE2VFpFVXk3QmlWSzRMSTlIQVVYN2V6RFFRVGdMK3RWTWVoUlFGcUlJ?=
 =?utf-8?B?TFE3QUV4Y01LbTVTMlRPeFg3OE9uejdnRCtWSDBQZUh2ejVjN2FINTVHaXI3?=
 =?utf-8?B?RGlabkJzK1BCWWN5aEdoSlJWdmVlN3VmQVo2VThJSlcwcUZvYUo1SjdsUlov?=
 =?utf-8?B?Z3Q1RGN1TEU4djluRGJENWJRbGd4dDAxWUZxMWltMWhrelorbGwxL2pMbS85?=
 =?utf-8?B?MHY1VUZ0U2NKem5hS25MOTlHenhlWHlzempSTHBoRllNU3NaVnFhUGhDazNs?=
 =?utf-8?B?bXgzMDIxandOU1VJUUN6WjIxUGM1VWIzWDNkUU9YUXl6MG45ei9SY0JNemd2?=
 =?utf-8?B?cm10UVZqVDhaTnlFcU9EQzRabU02MTYzMnRRS01DTEtTOGQ5TTNvdGhERFJX?=
 =?utf-8?B?ZmFnOXdqeUV4cGdvZ0p2MG5NdTBoT1M3bU5VZ2h2anAxNng3Mk5yNHRQZmxl?=
 =?utf-8?B?SWJNR1RuZGNMcjBleUZjdG95RnlHOTRKYnFzOGUramtHbzZ1Q3NOWXZUNWlR?=
 =?utf-8?B?UGU0eDMrbG4zU2U0WG1pTVhyaWM4SHJHbFpUY0kvSC9DeVJJOHZZOS9wUFFm?=
 =?utf-8?B?dTlNTzJuOVpLa0RCNHc4VVRTaUV2QVc4bTNNamFCSGJmWlRjb1M4dStPL05P?=
 =?utf-8?B?ckJjL2VaWmxFOWJPMWc4bW5NbVloN20rZ1pWR3U5WENOSlZyY1lMZkxWSTlX?=
 =?utf-8?B?aGw4T0ZUUlI4TmxzZ1Roa1gxTm56czVhNWtad0dYY2hDYk13eEhIYUYvd3hx?=
 =?utf-8?B?bkNIR0FXM0VxRndhTmRRMFBaM3RHY2x4TS90dDh3a1krRWNjazlVWTUzb3Ru?=
 =?utf-8?B?U1hEWW5Ld2R5Y2xrTHBZR3AwMmF3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(36860700013)(14060799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tQ2kNgWJGWVAAVpNS6tXxcE/KOgyizj3mZVJHkbYDr50z/Y2RJun1omF4zY/GC4N5pqkgVi0s5Ms0sEQK6tBZdqByvya2CL1RLzTFOgJ7s5hLHTsE6/RsN6Z4am48trGsgt7sMMF9xQ7dVMHDMBNLifasI3TPc2ZFgK6hQNMtHpeqXBoV3P8Sb5JFTv2n57GIXwHajXs9dhyNiiPy6ZTaIWonW17ZOOV1MWABlaksdTzKoGcWVhnXFn8dKrQ6w6OerLc8nRT4WPY/wNfC5LLzvoDI4QnFOfLa8p6C2miZwtMa+NFpuF88NxnijVHKwJVl9/afclaCan18vxN5XE4+new+KhiY8mrHgOpTkx/wI84NTnuRmZHHzSLtUFAcpbvlQvP3237apQrnlQC42nEknyAIpzsWWABKgFs7J25A7AJjc/nPHx+EjugPWnX2V9u
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 17:01:44.4784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 575c0121-2ccf-4eaa-3ee1-08de6f0f6522
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11774
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 17:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231311

UmUtY29weWluZyB0aGUgbGlzdCwgYXMgdGhpcyBkaXNjdXNzaW9uIGlzIHJlbGF0ZWQgdG8gdGhl
IHBhdGNoLg0KDQpPbiAxNiBGZWIgMjAyNiwgYXQgMTc6NTQsIERlZXBhayBSYXRob3JlIHZpYSBM
aXN0cy5PcGVuZW1iZWRkZWQuT3JnIDxkZWVyYXRobz1jaXNjby5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBSb3NzLA0KPiAgIEkgYW0gbm90IGFibGUgdG8gYnVp
bGQgY21ha2UtbmF0aXZlIGluIG15IG1hY2hpbmUgYW5kIGNtYWtlLW5hdGl2ZSBpcyBmYWlsZWQg
ZHVyaW5nIGNvbXBpbGF0aW9uIHdpdGggdGhlIGZvbGxvd2luZyBlcnJvcnM6DQo+IA0KPiBidWls
ZC90bXAvd29yay94ODZfNjQtbGludXgvY21ha2UtbmF0aXZlLzQuMi4zL3NvdXJjZXMvY21ha2Ut
NC4yLjMvVXRpbGl0aWVzL2NtY3VybC9saWIvaWRuLmM6Mzc6MTA6IGZhdGFsIGVycm9yOiBpZG4y
Lmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCj4gICAgMzcgfCAjaW5jbHVkZSA8aWRuMi5o
Pg0KPiAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+DQo+IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQu
DQo+IG1ha2VbMl06ICoqKiBbVXRpbGl0aWVzL2NtY3VybC9saWIvQ01ha2VGaWxlcy9jbWN1cmwu
ZGlyL2J1aWxkLm1ha2U6MTA2MjogVXRpbGl0aWVzL2NtY3VybC9saWIvQ01ha2VGaWxlcy9jbWN1
cmwuZGlyL2lkbi5jLm9dIEVycm9yIDENCj4gbWFrZVsyXTogKioqIFdhaXRpbmcgZm9yIHVuZmlu
aXNoZWQgam9icy4uLi4NCj4gWyAyOSVdIEJ1aWxkaW5nIEMgb2JqZWN0IFV0aWxpdGllcy9jbWN1
cmwvbGliL0NNYWtlRmlsZXMvY21jdXJsLmRpci9sbGlzdC5jLm8NCj4gICAgIEFuZCB3aXRoIHRo
aXMgcGF0Y2gsIGkgYW0gYWJsZSB0byBjb21waWxlIGNtYWtlLW5hdGl2ZS4NCg0KV2XigJl2ZSBo
YWQgbm8gcmVwb3J0cyBvZiB0aGlzIGFuZCBvdXIgYnVpbGRzIGFyZSBhbGwgaW4gY29udGFpbmVy
cyB0aGF0IGRvbuKAmXQgaGF2ZSBhbnkgaGVhZGVycywgc28gdGhpcyBtaWdodCBiZSBvbiB5b3Ug
dG8gcm9vdC1jYXVzZS4NCg0KUm9zcw==

