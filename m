Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1456C61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 11:18:25 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.4])
 by mx.groups.io with SMTP id smtpd.web10.57231.1749467903762984797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 04:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hDTC1cOn;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hDTC1cOn;
 spf=pass (domain: arm.com, ip: 52.101.65.4, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I+Hf+kGw/RF99SRYjy1EBXYbgjXfokYoSCFaggcyi+ruFNB6AwUrPG1XMN8gVsxB0TxCzP782iGOWbOPYArbFU7HUm9ywYzXbckiKPJPFJmQtQWRg/+7SY75rKrD44kEaLwR7WGWFt9wFlEpGDXskS6b23PrPcW6D2+yDDZ22191Stvzaglg1YY1l/gr4GJX0UCbMOYD4JpKDpuous0LmFtg/E4PDLL7IjjFNVqav6cs/AvrHUBQhMEXegO+6Cu0G3IHii8xQqlPQYkvIDmGI+XPxiYtl469+Qq19sT6zrHeU0ZilzMKXDgjGAIbuxm6xjmxCq8IhUGIT4dkD9+r2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFWBwYJVne1xMGeygcX1SfrWAXZrDLbgrATdwymQyig=;
 b=nDdPlf1Wl/Ugn5K2Hi/6oSpokcZB8YM6lCYdTH0YaNR/W99r5l4PQhrx4u5VdBhvWLFSrBp6FJgl3kocL4DBbTIv6O1hbUmQBeAm6jVQPdV2X+Dp2f+329eN6wXD158uQqS2uMvuYgGSG6p1maHOmtnACCPl2dst1EvEmVrAQBeUBDfNTspMkXRZTj/9HNrQjqnPP5bZ/Gw97LSoUW2+AVKLphWO6TwhFbkPqTZTK81uQbT9rrkEb5nU53PP66a9aAFexO54y2GjjQJr7hUUaPGq2kwu3dQRt6LcusOlJxWGg8/AndVuOIFsohN65GNN4gRgEXdUfsfi3Ah/FhdTzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFWBwYJVne1xMGeygcX1SfrWAXZrDLbgrATdwymQyig=;
 b=hDTC1cOnW9PGJ3Iqh1lRKRs+yoishpiCJ3zIQR5+T1yIKvlAjKtR0S+Gm7m+yQDSAYscfGinQ3YZnVbopzBFalRSX3MCvLO0ga1yOWCtI8F1LcK4ZdKJyHXvLlWfDMILUe+qdcsIRYL5koZgY9fhxOGSASjZoYZivQ/QM3eei9c=
Received: from DU2PR04CA0289.eurprd04.prod.outlook.com (2603:10a6:10:28c::24)
 by GV1PR08MB8033.eurprd08.prod.outlook.com (2603:10a6:150:9a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Mon, 9 Jun
 2025 11:18:20 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::fc) by DU2PR04CA0289.outlook.office365.com
 (2603:10a6:10:28c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Mon,
 9 Jun 2025 11:18:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 11:18:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0XUaLdbs9DEG3hsf7apFAKeYzz9jNNnxv9bCJpF7kImcRERXHttwHxRkhuRvUzNS7c5tteIQAisFeShoyScqxJT0DwatbM4g24OTHxljgKzgEf7KuaRisFRBCIuSDdC9dt17ceF2ICtNu2SjnXLNgZV3ViXwsUTAt12mmIn2oioamoEdel6f9Qoc/DkwLxby7mAfJgJW7TLX6+D/I4tvuC+bAU+7nL1ef5hzU4efPOlZzriu7TvP7WlYzgg40+I9N9CF6omFDBD7368RhpMgCpU2b1cbhDrKYt1+1YD0ZXbq620KPFFJBArFJtL3CtBnw4p/ottcrak018wNzoYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFWBwYJVne1xMGeygcX1SfrWAXZrDLbgrATdwymQyig=;
 b=OpzdvN6clVbS6IQ8bRUXQ5iZVYzEduQxCEOs7RJgxgABrzUX20Gf9Iod3mcQ/VkLJIN4XCXDa/2oI4O6Q6DmanO+Pe6s5tsBoFphSJjVSnpd9FIcVjCpor9BKjOeqD+tYWg48RAyE54/SPZqVN8Jsy599lqvVPCFQEy9RZBL98NEQjW5JBNQtnS0kErex9MYhoqwjekttNOnwgtErKJEF4tSIGkTgHRfvCZY5B1iNnTj+37HTAABYbG7xHAiEToChPQMgTrw60okOvWXNedh8vWioOdJ9IGl3XPKE6jec74DYAB308Kqw7j1oFPDXZK3VCanSEL1QWEBEc1m8cf3aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFWBwYJVne1xMGeygcX1SfrWAXZrDLbgrATdwymQyig=;
 b=hDTC1cOnW9PGJ3Iqh1lRKRs+yoishpiCJ3zIQR5+T1yIKvlAjKtR0S+Gm7m+yQDSAYscfGinQ3YZnVbopzBFalRSX3MCvLO0ga1yOWCtI8F1LcK4ZdKJyHXvLlWfDMILUe+qdcsIRYL5koZgY9fhxOGSASjZoYZivQ/QM3eei9c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10406.eurprd08.prod.outlook.com (2603:10a6:150:15a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Mon, 9 Jun
 2025 11:17:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 11:17:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 09/16] squashfs-tools: update to 4.7
Thread-Topic: [OE-core] [PATCH v3 09/16] squashfs-tools: update to 4.7
Thread-Index: AQHb1u+CzRRq6pXxkEiHlGeLBdBQ2bP2qhMAgAQIPQA=
Date: Mon, 9 Jun 2025 11:17:42 +0000
Message-ID: <E086FF81-642E-4742-BBF4-114F0D8A45FD@arm.com>
References: <20250606142822.3387675-1-ross.burton@arm.com>
 <20250606142822.3387675-9-ross.burton@arm.com>
 <f322ed9dbb8a47bdc9e819a91b1fb7968592c41b.camel@linuxfoundation.org>
In-Reply-To: 
 <f322ed9dbb8a47bdc9e819a91b1fb7968592c41b.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10406:EE_|DB5PEPF00014B91:EE_|GV1PR08MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d3ab18-77d5-469f-26c0-08dda74755de
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?CkOblTSXbyKIFs2WNWjGPsUxRfvWBUloJxeBcNc2Q5cnKgoWD6mVc7U0T2ln?=
 =?us-ascii?Q?rwhe9+H03OrX87yWirp8UpcJZcufod8y7SVsTXecG0TWI2NKrZc5mukRn0Fx?=
 =?us-ascii?Q?itQhgk5gVRSeN8uWlOd0DNmMnVcZkM7Ko+kn8IvSteAGSzXd0srVt/O7f+Mt?=
 =?us-ascii?Q?JtzePlMoQUBhqimRLr4KakQAjIekRsM9DkPNJAnPFjVhef3gsqWoEhUelGR8?=
 =?us-ascii?Q?dURUdhjNPGzq9V4RD/zabE/PQFo2TJrcV9ODa7630bk9c0j3h/qwccH/3AEm?=
 =?us-ascii?Q?ZvL9FIf9s+w/Ai4tn/N7awfel4VFTNcvs363o1nlPgJtlp1y6vklKoJq+aS4?=
 =?us-ascii?Q?d1uNANUyedzRMtpEcrATl5rJZHG4Rt2bSmH8TEGABZ02MfxzuNS141xLjRIn?=
 =?us-ascii?Q?q/A3FMN1zZKAxj+q08AiT5yGNuJIFZ9HxHdmWNP5kfiLHdLpvYuV7ahcLmu3?=
 =?us-ascii?Q?xeMj+jKfToODGVdEbfwtzKfBAncfgrS9oRl5jXcWtB6XFEB0jiSc8AaUvceJ?=
 =?us-ascii?Q?GCBj1wHnRLadWkGUCFcVYYBxg6f2sPT9V5BfKv1RJdiZF38f6UoB5aKIWohG?=
 =?us-ascii?Q?LMzm0W8muE+GIMsEmTHoenXUOfoRvqwAbJYIWK3O+7LyDHVLREZrPbn8BwGr?=
 =?us-ascii?Q?oB2vbvGPvMCit1yaWiGwk3RUC6k0EqEvEL1VJg/hqY2khaWu9pvl8z0CbQhl?=
 =?us-ascii?Q?jj4iWPVfgQ+INez/BODiG1zTUZgw3b6L6oojZ1qv1A/qm5g+nadiA+9TE+1e?=
 =?us-ascii?Q?9ZVBqskb7LFV8FOlL9u0VK12P/YavTebeacS6AxFfpVnN+PRQyD3SG5Hz/HS?=
 =?us-ascii?Q?2XtT6mJ2BEE7YJYQFl9KtFdMQVij7pFlY7CtTyKJuTu8XIlp2GRcwCiSGKKd?=
 =?us-ascii?Q?vyipvZkND5z/YjWhlV3cRL1kjwUanXzvYKJjQxwe/Q7EtXr25KNLAxEUHOWK?=
 =?us-ascii?Q?YPOCs1ob06WG1PQRgCU9L0s31ozXdfoMFJU7fuJmTRkPieh9sbqfbjnUBKKh?=
 =?us-ascii?Q?kmGRQ3GlrHYLvuDlSXGLLeF5+nLKt7KYQ/UfMPKOA74dnUZqCAI/vXVX7mtC?=
 =?us-ascii?Q?sSe0kiblLr2pjEjb+WmYXJkvBP8kyO9XGuAhtDM8/kwjOW0VXMqN+ZDF1Yiy?=
 =?us-ascii?Q?mk/2NSPIk1z9CiS9CYKt+GmOQhwkvFEObOp0BdeHZeWg6WNzyH/o6O2tWHV+?=
 =?us-ascii?Q?MAjreSI8fTIREojsLqmzO8qjUyVMgNxYNB9F28MmqV4jc61cXstObiZXhovG?=
 =?us-ascii?Q?zoRm1eOUUbykSpDCHPzNSFn3qhQORTe8Gk4SYtMipkdJjdWEUi8gCE9ziDLH?=
 =?us-ascii?Q?p9EK3qaQCkTxnsCOo59CZxWhhgvchOdZqNNptmNtB5MFyHLoGFIoTbIOwqRX?=
 =?us-ascii?Q?dGw+W2ehI41FE67u7P+WFWSgd7GBh3tHkGi+wD9L2D4b0bXWnNZujoBjskEl?=
 =?us-ascii?Q?/v8+IoZaDj4=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F565CBA676292149A88A3682607C5B77@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10406
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3cbf78fe-95ed-4aa4-541d-08dda74740dd
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|14060799003|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YOiP6Zi3dTK0ma1kHRxpUro/BwdDEiKhFflCVsZ9/mgOPsUEnqw1lMJ/DKjP?=
 =?us-ascii?Q?FqQ1zfsLz6bykALcmzAFEPDd8JKJIXey9IpNYOYx2T2wJLlQ3md5t67JPTfY?=
 =?us-ascii?Q?5yH2pjrENM9HfWBztHrdxBxZn6/I5XHUHdvEQA1LqCyBhj1nb8jIGT/yNCVE?=
 =?us-ascii?Q?JvOf9DxN+UeAvJyKs431MlZsGy7rdhSAS/8N7n7e5kxUJFaczO+kJn+i2ZIe?=
 =?us-ascii?Q?pxjvYWMXOV7SahSiirAXLWEU9RAL03g0Pp5Y8ooo0QsM7Rs+1V3ZMxuOcp3j?=
 =?us-ascii?Q?upaIXQNyOt9HFq8QfhHfIIIF8iMDGlvmVukgVGaMrjM3oGrRea4Z2EgcHZJ1?=
 =?us-ascii?Q?ovDQZ73Q3tqxQAsBvr1bb4Rkh+j+kX4VGEkLA8YVKYKUeFEcd90eu9/s80dv?=
 =?us-ascii?Q?inQDokkg1s6N7gNV4oGXx16SWc0oDdWHhuo1mTISuMVYV2X4OLgEGcZ6q+mx?=
 =?us-ascii?Q?eeIPFL6rGPGrtEq6U+vb4j5GMIPZ468rarehCeDaQvz+FwNjv3ez0A0fAGI3?=
 =?us-ascii?Q?RpqNtBQ4w7U0LbM7HYYdNHIMh80EgknKGPDR9y5fzXuql15B5g64qJrrJH88?=
 =?us-ascii?Q?8KBTJ2MsYYMu1ayUAKQG9yK4Fi2PJziq/zUPvWQWPpngIfFsAdDe6gqRtarm?=
 =?us-ascii?Q?fEf4+NhI4Ja2Tgv6CxZ8HhDIZi9fQ5xKqyIK93fSaKi9C75mOq/1rqmoYPcM?=
 =?us-ascii?Q?9rQk3We183aXNFHar48dfoAU1TBOF1/cVKTidnSAcLu4EC3YG4iDlgnJgs4W?=
 =?us-ascii?Q?5qScvNs7PYpycfKC0CUW5pEyWrUBwe0zRCu7iZMa0Nba5s8rnGW8QUqmB7sW?=
 =?us-ascii?Q?hLrgo23qjGMFRgEg2X9GApnZSd4+t5yN1CNqju741oow8KNhpSlAulg0vBQk?=
 =?us-ascii?Q?xf9BQPa1dASa1p6lH77M9vnHpe2d7TTrJnpzgXmBi1F6P3ZPWyAfnNd0898G?=
 =?us-ascii?Q?OHQ4BEodPFB3+p5BHHlmMnXPW4nYs4QXLqdmZQVsmVUlEg4lA4uLz97HA5z5?=
 =?us-ascii?Q?KRWZFYskm1wsDEqQ9amsRTE4U4a92VMLbguvNbiQtdSi+6TUKfSfgYbuPsrn?=
 =?us-ascii?Q?T2bm5oOu8grUu7fChihcfPS6Hh2gUW7N4WgQ3Tg2jXLWpoj8gKQEUV8yeW1Q?=
 =?us-ascii?Q?NzTa+98NqffOWMOPHMgEvth3lu9DhGM3kQksJJam4jvt/NZY9tv8+k++DohI?=
 =?us-ascii?Q?j5Q+0K1WDtq6UrJ09HeIdKyJrS5zMM47Jkko4BRwfp/Heno5mmI3mg0f6qyM?=
 =?us-ascii?Q?BVjR+dvZVsCRHwlIuQctdTudvJhfMYNiQcYB4Y5S0cgS3BCl+HA4rnnexC8J?=
 =?us-ascii?Q?LAV1PJklOt7ZcpuL0zMg+VKUK+RPtOixXpLXxHdyRkHnGrXlQ8tvwow7xQ7K?=
 =?us-ascii?Q?BVPOMVkVvrRv8s2H7wMlOEnsZ3vGMvDaGj7tYfXkFKViG1ktOoS5/dQQ7c72?=
 =?us-ascii?Q?L/Z9Vl85SH/zymdbnboOzH+3x15K6oZHceR5ZrGN3he74lD1OoLR0w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(14060799003)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 11:18:18.1167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d3ab18-77d5-469f-26c0-08dda74755de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 11:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218269



> On 6 Jun 2025, at 22:43, Richard Purdie <richard.purdie@linuxfoundation.o=
rg> wrote:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/537

Sigh, human error. v4 incoming. rebased to master.

Ross=

