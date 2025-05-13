Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4F9C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 12:49:12 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.87])
 by mx.groups.io with SMTP id smtpd.web11.75596.1747140547481837988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 05:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rNlBth2x;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rNlBth2x;
 spf=pass (domain: arm.com, ip: 40.107.241.87, mailfrom: luca.fancellu@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Hhn+OdjqihDS6fFJoWBSCgAg4KNSMP4gGCszI0e0jeP0HY8EvjWP4LYUV76sE2vc9cvCVlx76IP0ehpsxjD8d+a0oKqRIVlqMVyGueX48D/LdTNjnurUVQUO3g+bJDUtpCYjAYx757mSiAwneUKQFf8J0PQcPwpM7gt4Jy+sYioXGpPbxoPzCs0ufsFzHpwf7GIYfZ68SMRqSdIJq4LcWcQsF/B98tNx1af7cfSKRTupGH+Srt+3HW6EFjwujz5lgijsWv46oAbDki7BzQIcv6X9wrw2UbX8UpEIvnBILrDYkU5SSvQi4MNTEZCRGMEN4mEocbU0BZnVnQMFfNwyzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkK3ZLgzSQ88O3PkJDb0DQqaoHH9ASh5O5+mKQwjX30=;
 b=wfLSFF5nhsYJaEvzz3uM4e7EoW4uyxzvWQBU8xdTXCcgaRPByMgKXwx7XkX2qK5JZ7/Rqo9aJOP0Rm+CvFGHurk+8JhQHPn08r3TSBHh1sH7RQSZXiwNxkwP7HSFbtRY15mt0EPaAcIFx3yjrJHjJKNkWqPHyGuoIqI6ANADK3Xe/5IajeRaDBG1FNNnPKIdpxAyv+pD0VEqk5Q0IBez1MmKd0DhTCBlq7QVJX0enQKtjnC89W2kzQ7K/Q8H8GkScoIAq8Vc56VPZIV9Kx8G/cRSiniaaW808W7gPjI0Q3MrjtuXj0ayoCn3lbWh78fs5RsArE93ofgrXExeRLy2aQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkK3ZLgzSQ88O3PkJDb0DQqaoHH9ASh5O5+mKQwjX30=;
 b=rNlBth2x8w53o/5nkAMQmB28v97fSAA1nQLveEkG28+SpkSjm+u6qanIKDIVyFV353cxa+DGnynGeJ3XomVy07MqFBfB/9eJ2+lIOXXqc8in9rFpnI+eeWbXyBfNFLQPDVI7ga0OxZzTWvvn+aeu9JpEKQODe51fD7Xr+DX7E3U=
Received: from PR0P264CA0173.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::17)
 by GVXPR08MB7870.eurprd08.prod.outlook.com (2603:10a6:150::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.28; Tue, 13 May 2025 12:49:02 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:100:1c:cafe::65) by PR0P264CA0173.outlook.office365.com
 (2603:10a6:100:1c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Tue,
 13 May 2025 12:49:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 13 May 2025 12:49:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLYXbvguwGyiry+gK4WecGj5zFYoN8UVdVi1TSC+psnMrFtLAFYYu2yvF5xs2Fmk0lCpUEA9Kn+jIlWOe+nMDO8bqIjQ/pXltbBQU2FCMEDqCVt+9OiGwEKPMU5GqtYt25bM74P/Jvfs9YNHsMpPj0zfHQpDxQCfyKGNCSgZRKndrZX+GebhG+oQuXF9VqwS7RdMrMF2IaK8ljHndORhRbKxRU9EfhL9CLVwkHLWdV2Jk9GXwgtkAwU2p0OlrgRpGqYiJcovUGrNh4iYE1c+OY9fRy/FA12zslQn68h9qbLgSWXfO0iKgI2agiiPtt9mdEsWNOZFKuZCC1cwKVpWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkK3ZLgzSQ88O3PkJDb0DQqaoHH9ASh5O5+mKQwjX30=;
 b=t0dgnPhxZ0ryiXnZ4ffQGrW3RnQwI+AFlAAPccqcgL05mhSAkOO4oKH8Ge5FWrmWMWbNMFUztx2IAibV1Mb+qwd3d9eMUuEUKdrv3x4ZF7lCugUdzub2buURZf4ms15cmrFH8ZJlo5DoRRq21apLBt3jIk48Z+7b2iwCJk2DPSFopD80yeEe3Xk1WsI5akdpH7Xndi0Xci7E40LshcBg0LcgUWGtgbgs2yP0jNGAcbQyQ+nuUDtEekacUfYRxuIenAIJX897zz0eZRgMv5ynBr/C/RECeH6+EucyJcPiFbzh73sp0PHE6BfsKexe2NOtQYUEK7LZx1YVyRMLcQxN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkK3ZLgzSQ88O3PkJDb0DQqaoHH9ASh5O5+mKQwjX30=;
 b=rNlBth2x8w53o/5nkAMQmB28v97fSAA1nQLveEkG28+SpkSjm+u6qanIKDIVyFV353cxa+DGnynGeJ3XomVy07MqFBfB/9eJ2+lIOXXqc8in9rFpnI+eeWbXyBfNFLQPDVI7ga0OxZzTWvvn+aeu9JpEKQODe51fD7Xr+DX7E3U=
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PAVPR08MB8991.eurprd08.prod.outlook.com (2603:10a6:102:32f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 12:48:25 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 12:48:25 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-python][PATCH] python3-rich: Add native and
 nativesdk target to the build
Thread-Topic: [OE-core] [meta-python][PATCH] python3-rich: Add native and
 nativesdk target to the build
Thread-Index: AQHbxATyca1aqQYbMkOApgizjXga/rPQgnMA
Date: Tue, 13 May 2025 12:48:25 +0000
Message-ID: <F18B67E9-6B6B-4783-972D-2D90151E6C6A@arm.com>
References: <183F16E1AAA61525.11104@lists.openembedded.org>
In-Reply-To: <183F16E1AAA61525.11104@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DB7PR08MB2987:EE_|PAVPR08MB8991:EE_|AM3PEPF0000A78F:EE_|GVXPR08MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 50dc19a2-c37a-40cd-9e76-08dd921c88be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?AOr5x+ftXYF3h0ap7qKAQYwEU5V/CzAnqUCECqid90lWLFHWH2r533cvNiN0?=
 =?us-ascii?Q?B8nZhN45bmOKVFZFtsQagV2VUlVXgKXjCiHAmQjpZ3jhTlHWATB1oeQ6jAj6?=
 =?us-ascii?Q?Jb59GnyencgrEEmCk2xlQ8IOeEY60GIm9BZ/LvltZ0a9F7bIdyTTYD//Cb6z?=
 =?us-ascii?Q?h0tW+zstqHQhj7XS4jJBJJUCCmRSVPqT/dWqbpHPbM1p91pmk4BTZrBdP1OE?=
 =?us-ascii?Q?inIL5Q+L1JqchbcFftHlH5M28LEtWyNu4ackfPtxU5MJrLdC+8hhMd3+FMRK?=
 =?us-ascii?Q?pJnTLG2d1DA9Ngnp161Ud9o6LZQLx3x7lsLsdy56V7WozUs14bQ8xq43cUGb?=
 =?us-ascii?Q?+6xBLx/551sNacyOg0hjVUFLGDEgaHXUSmV85ZmlS7ehiCc0DM6kyZBD05wN?=
 =?us-ascii?Q?TzlgHtnwBz4ikpDVpj9IwD0bQYKWoOm6dV9m810M1KRARC5K6xsXBmD2H/kq?=
 =?us-ascii?Q?RClgnnFaMBeF17Sow7oaZ5g/gy6IXuFj8Kz2Ccex7oz3iLEQma9Vgbkr4csv?=
 =?us-ascii?Q?ffmVS3wEx+KN7TC7a31Je99L0BNkFLLgF7mRpDf4Mki2j3rjDpGZwNZNNzUc?=
 =?us-ascii?Q?wk97JORBbnvBlVfb3xo/391OJTBiahefHmPMaaFz2VoUCZoOLd1lOUvnFGYZ?=
 =?us-ascii?Q?oc3G+aLE9JhYwvgxOIqIwbzjWOeIcwPL5PvBNVC/nC1hzUrCXmnbqj5Vm2Yb?=
 =?us-ascii?Q?akiL2LewojfneXsaooduiKDPYvYU2Wr7pHF7l+xmnY/Ix+3sZeVLQFso5Arv?=
 =?us-ascii?Q?YyOXzML4FLxI8mV8TxQ079HVKVtgbtwmzuu3uUKQ/k/cDucHNB2WuyTqcGx9?=
 =?us-ascii?Q?x8lT6QsHlMG+Rtto4atCOdG+/K8ZOfIwVTqlHmSIxyQbzVl/kW6gcF3HWeCV?=
 =?us-ascii?Q?Hp1dW/Ic505tESMwhEguzEZCITnMxwif70Qfi+VJtJuNnQGGrvgLS2ZhQiFN?=
 =?us-ascii?Q?SjzCGuYvzcmthI7KY9I4gTDbYvuHHKomD9x0D+9kahqUE3Ji8EqQywDb1hV8?=
 =?us-ascii?Q?y2ldLyvtHc/p/NL/A60hQAjIcx9tBdABssaj72zXoeD6f68K+i1+pUdIz2Pj?=
 =?us-ascii?Q?50CCSwr8wTBMplm0hkCBbjD1hUbu6ELW8kZDwi1JLyBvR5D+Gs8ZqiMq7RqI?=
 =?us-ascii?Q?+VVt3BK5Vg9MVIc5qTyBNdHQJH1r4W+RAu4RJ2sMKPaVRHmzEZ29CWeR+J9F?=
 =?us-ascii?Q?z1Z5dS1rkkoYF1JEsijYdsBA4F/luuLMZbOBhcO44Xe1xldkwHZbf3aC8ZVS?=
 =?us-ascii?Q?g+rWf2EtGDpCsP1kpiDJGZ4yCgT/SSUd+0gSjehx7dW9oEJHrE2hsJPF7G0m?=
 =?us-ascii?Q?cux9OKJiMlLaYRXfNP2TRO6E6RpjBBDA1GBtsaqkJI82aFk49Vyr1cz/PDus?=
 =?us-ascii?Q?e+7qxi41swCPJwFaPxA/tjmhNVgIfvj6vCgRZQJfIsSuDacVUlMmKMl06Q/H?=
 =?us-ascii?Q?oLqDPJiHJsspLOiIj8pRvl1VcldPKR0Xd8gfdcWCZdrS9RSTNMcZTmJp1tW2?=
 =?us-ascii?Q?vJXlYdeiVjMqfcU=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <643B525CA4362549B40DD4E1D97A2921@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8991
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	44ea7740-f294-4ba2-aa7b-08dd921c737f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|14060799003|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hqyIP+RnwNDKATxw7Jn9PbdBUBy1mQdJ8PKLwK/2O6MGxIoHBJhwAQ/ptG6e?=
 =?us-ascii?Q?loujqXOr9pnopxhrbuHX6jayA+x1LhYaHg6bLWfTHe+i0n1gkCUkEq6u0TNS?=
 =?us-ascii?Q?40jvkeO8643YolN7r5FR7jkFOIfwWnTERTLGbGZ+jp3dkZPte9/DDBwu6dnC?=
 =?us-ascii?Q?qmE0wugXzHVnKTa6W+fuEyNVgDVqfPWJER2MpnqdorENp6OuJTyklJTH994m?=
 =?us-ascii?Q?KC+ksQq4HTbAfXZheM3Xg/zv+hF7/G1tzIU+jmHVIzkvQKXak/ogL4QoUCoh?=
 =?us-ascii?Q?i6l4eiyUzoEcuZgTKIk2CMN/jra9fv3Igy6bwwZadeSorUCzhcl+MNhTWTLL?=
 =?us-ascii?Q?/KxTHjQpTqBhPQ3U7woZkogIla++Y6xCUNkjwA0acWvDcV1xidvawTzclzqZ?=
 =?us-ascii?Q?2jjZmd82dT8kCFGoXzLz5vj5uhvIO3yeYwD8FsI7isvKuZQkGm766bf4Dgku?=
 =?us-ascii?Q?y328CnQX84jwU8cBcf0dWAQYsAyi4NYqUE+UCe1IxhSD3G+LaewY1r3BOf+7?=
 =?us-ascii?Q?AhxDxzDEiFdPiJKwJJImhcGXuTw/FTILd9bECS0jTOsH2W66v8xNqRgdw7hQ?=
 =?us-ascii?Q?rpdKi9R4lPxhnEF1LKZTnsEGZxNYHrxLMCvXiroDKh6LaR1Df2JvsdzssWrk?=
 =?us-ascii?Q?xY9WQBGYcXluSl+EXB9mONUopniccD4Z2CiR/OWYU0zo/gRqPxk/6M7Dr5gD?=
 =?us-ascii?Q?IdtkNEtamUXxS8LYD1T4eXFqqTtSdUjMgSuIHzRH+k70mCp0dIYqve6+cGQn?=
 =?us-ascii?Q?YL5YBQap6PQup+8iphey9kT/fpDXY7jHBnPqip1kkiHU+PbZD26nCoiwRHah?=
 =?us-ascii?Q?CVl+lV12d1VqXArBXM0DmLrxrUvoSxGkAbPxhYJTV3pdgnbUW6gEcUua9Bpo?=
 =?us-ascii?Q?TJMbxNOKyIbRR9P8U6wylg8JFOLgNjzMjOABEghqJm7toUeLVwrEjUq12AE4?=
 =?us-ascii?Q?cGQMv37IHkTKQGhJ890lMPc1+D8xQf/ZfLikZ5UZ06UGqF9ccRmE4GDOzLnw?=
 =?us-ascii?Q?Pi0rmNOUC1m5nz5qTDz3GhmFPvE8KMJhC+Fu7lHaxyKIDmD/hMKT8FM1K/6D?=
 =?us-ascii?Q?74U3RrlpuYLAbWdM+Qdvji2A/wDOoK3FpN2qnglVkVmIkjo6fUEOSeZqaLOQ?=
 =?us-ascii?Q?Zyd6uDt4f3C3VvSVrtmnlweT9BAXjGmcJIHpMS3ahg7a4FBvKhqZmrK5br44?=
 =?us-ascii?Q?bYa3p2STqy68Cu0wuQSYzIvjgbS4TmOdFK+p5cYpMHuxq9Zoi/MpMbITRmeX?=
 =?us-ascii?Q?Yw6GwNSem4HUWHutTsOnYjFknZpTOeLcRnelxsZz5/w3lGEGkF6x4jSe+4j3?=
 =?us-ascii?Q?LWZL8bskwrm7pNJqpsPdH43/0UwAsHAiXYxS4IH9IBQsAJwDaON7BEyD93vv?=
 =?us-ascii?Q?z2Aot5beIHUB0lS9qoXg8RIasxLsXIrCqOzbPBZHdN18xlxI2QB4XsUnLbCv?=
 =?us-ascii?Q?0YCIq6KPa7QC9zv5NZH4vyLJeEJGK9NxrpW93dyurQ/TNcWkqgiiNPAkfRdi?=
 =?us-ascii?Q?rZxTF7qdCjhZcQ/485fuktMGJ2Bgd4jOeIOt?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(14060799003)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 12:49:00.7090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50dc19a2-c37a-40cd-9e76-08dd921c88be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7870
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216422

Hi all,

> On 13 May 2025, at 13:45, luca fancellu via lists.openembedded.org <luca.=
fancellu=3Darm.com@lists.openembedded.org> wrote:
>=20
> Add the native and nativesdk target to the recipe.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-python/recipes-extended/python-rich/python3-rich_14.0.0=
.bb b/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
> index 95c0fd8a7546..8a4d6b843e7a 100644
> --- a/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
> +++ b/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
> @@ -17,3 +17,5 @@ RDEPENDS:${PN} =3D "python3-html \
>                   python3-pygments \
>                   python3-unixadmin \
>                   "
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 2.34.1
>=20

Can it be also backported to walnascar?

Cheers,
Luca


