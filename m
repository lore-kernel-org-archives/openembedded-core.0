Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BD9D11183
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 10:58:06 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16095.1764241078566547294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 02:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hLAGbUmZ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hLAGbUmZ;
 spf=pass (domain: arm.com, ip: 52.101.66.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UJn2x4Se05bczrZZj++EcA0T2kAOu2Bs7Ed8YK9eEBFpXtg1TnLOTfvZed73l70eBxvEhedysymqzC4xOUs0JI/D+1OKnucfLOzpewfJIjvlPeoG9U3vKMBISEx1V32D94O7rgwgd7M/cbUcUlslEcTYAh5nnfcJdP6Iiw0sRKGYIXHQlsPEOAOhsPEInAdQ+77f+hUGjNsBuQkaDKPPdYLSFhmdsjrfiYGn252gRMS2D7tiTHNYRVPKWxI02k2YM9rG8NDIwJuSJqZUtOP7tojFIVG7MUzoiF7UVRHkD7IYZWGKq0LmOEDqwQrEYoW23g+fSzxr1mNjDxXfHEBjfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bdm6dqAobYooHq9EuTfo4ZU+hzYtdwCQv9Uv5H/8GVU=;
 b=nJZ4D2hEOFpi5jNmGPhUq4laINDplYaXWDvLf7Z9XDEC4vSSVa5K60bwr5V1IJNLPR9qK9LL7JMBbCPZ/7sec6SGaxslfgxyYQNMoGxo6wiD25uf0xM/RIwVKLB1usELkno90mI+ar8TdQQ4ll1ac2ZMu9gOALHxDSpf5HBt/CQoQAI/qUCQ1EDQAdSRGqa3fLH9nqWXpHoaZuo8qTjxJwKnfe/ZkU7g+IIlXLJrrlp3C91FtxQrsKrnNN5PNAHLg6RVqGOC1SRDhPtLu0WMf9m+O4wRykpztfDZkpI3WyBIuYzT/klR96zTj393DjKJ54OkxC3hSQBVUL4Sgnx6GQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bdm6dqAobYooHq9EuTfo4ZU+hzYtdwCQv9Uv5H/8GVU=;
 b=hLAGbUmZzp3YTyA0XSbY6wLySsOqwt28Q28k2JvkVivVQXofZRNfl5D7qJp/hmUKV2UY895jMtVu1w5+8DYGvLTTZ5yuC4L9FQT7OIyjcLOVppUXcd3rjkpDwCi9Yy4QOUFYA/WfFKSYqTmVPei3FgXK7ZC9D8DnUD2pgI/8MdU=
Received: from AM9P250CA0026.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::31)
 by AM8PR08MB6628.eurprd08.prod.outlook.com (2603:10a6:20b:362::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 10:57:53 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::9a) by AM9P250CA0026.outlook.office365.com
 (2603:10a6:20b:21c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Thu,
 27 Nov 2025 10:57:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 10:57:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIrmedm8tZHk12DRVxk/KpZ1KWtRMj57NXj102WtGZjMmiJ2y5oRMsu/uOvhH4FX4VVcNpQiUqpc296Mq/xVtsssM+AG1q4TwBz2MI1ER9zDmVnuBEi1UCzQY8dde+0IB76w/OyYoTTZPxwkq6LRs8KXOX/LwNZZctwtisYUOQPnyCnRV7hdDvFo3QB/XZfhNGYrLVtFrx0jDQ0BVB5OCiCt3fZ9j3oGShHnFH1CSAqM5RtgC0kNsn+zj4oors3rvarCFN7+t8cNLRlHeK1fnCqda9MKAlOFSLbhB8wyk1zsp9DmGoDImoI36JLlAXBKArCA0SKt4CtbxL6aRk3owA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bdm6dqAobYooHq9EuTfo4ZU+hzYtdwCQv9Uv5H/8GVU=;
 b=L3qG5BC7wBcXr3gBR/z30j1fsa617HAox7hmcAGYs+9HJVys2JV5ivSXkcqhU1QH/lAN+BseMwW1mUge/ZCkbZ7ZoTjH3ZQQwSjGG/phbHLS5QGQqPTSi3qh9qBl36gpgfgJO9JlUhNvg9DjcBDC3GAfLvUe4icOdlS25dWZ643kyyT8H+8olt0tNTAtut1oGvy7295a6mY6U6sz6lBaVg9k8yZlVRsuWDYWBYKCj0tHXolewxz01d3f7bmniIr5Vi+L4YGLbefQspB0Rsze5dAacTc+dc+Qt04tzd8AwmaOnHnK2ZehxfJ3PQDKqsiz7Dw8XNz1CJvizdR3J5nSfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bdm6dqAobYooHq9EuTfo4ZU+hzYtdwCQv9Uv5H/8GVU=;
 b=hLAGbUmZzp3YTyA0XSbY6wLySsOqwt28Q28k2JvkVivVQXofZRNfl5D7qJp/hmUKV2UY895jMtVu1w5+8DYGvLTTZ5yuC4L9FQT7OIyjcLOVppUXcd3rjkpDwCi9Yy4QOUFYA/WfFKSYqTmVPei3FgXK7ZC9D8DnUD2pgI/8MdU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7391.eurprd08.prod.outlook.com (2603:10a6:10:352::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 10:57:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 10:57:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/5] libxcrypt-compat,libxcrypt: upgrade 4.4.38
 -> 4.5.0
Thread-Topic: [OE-core] [PATCH 3/5] libxcrypt-compat,libxcrypt: upgrade 4.4.38
 -> 4.5.0
Thread-Index: AQHcT7VgK1n5vl5pjk+3yZMsOgN4obUGebsA
Date: Thu, 27 Nov 2025 10:57:19 +0000
Message-ID: <7B947F4A-F020-4AEB-B311-22B5444845A4@arm.com>
References: <20251107070819.3751599-1-raj.khem@gmail.com>
 <20251107070819.3751599-3-raj.khem@gmail.com>
In-Reply-To: <20251107070819.3751599-3-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7391:EE_|AM4PEPF00027A6A:EE_|AM8PR08MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a5e1f3-2c50-42e3-d86c-08de2da3d061
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?cf4noG9gM4BQELmEOAriA3x1qsICBuicZPMUIvz2n448ixuDBhYP04gty90v?=
 =?us-ascii?Q?JKAREugT+i/iI/n2vaNzZQWtLn3Et6iZ5fSxOk4b9qWhCEpcGWLve8O0ckZA?=
 =?us-ascii?Q?0izzpZ+IrjrgKf75tgMiZb6ghrpL4los2EAVHGtQs6FT32yUe7cGKZdtYm+V?=
 =?us-ascii?Q?VKt/5kaPXbv/R2glBiQiBbU6p49bgGBpPl9gwScsRHTlaiIi3NfJZjr8+92k?=
 =?us-ascii?Q?eStjKa6/1CEbf4J7SvZOYnnEwCZgGc1BTu4pSpqghjXRABhWgI6rD0NUueKA?=
 =?us-ascii?Q?wDxgZdho67EIOb7PtlNq/5cvhZ7SbC2sYdewB1UOpjllJDBP80QIUEonqJoE?=
 =?us-ascii?Q?9kyQ7U4V/BSYOkr2GR33+O+tLRJsKH9QUdnxZNpvaLUXtsfwXHGqxL3vHCEJ?=
 =?us-ascii?Q?1z9IklgmLyD4YmXyY4KdqxsVwdaBmBRy0IPpkKEklyJzb6fjyc6RYnmw4O5k?=
 =?us-ascii?Q?LAyHd9+eNC7Cnq960b6dqIS3pfXwJcqYKyQqcWi/qrZbg+pC5bqbIlbGB0Co?=
 =?us-ascii?Q?D5ghm1gYKdQ7/ChRSfv3RQNZMnB3tKB8plegnPXDEL2lQCD4roDQfh5TfSAW?=
 =?us-ascii?Q?kS+ohvCfEacXg6TJM4nHLUrQ/XrNjX/8IZ6nnwZbSoftMRZPOniPqn986Awx?=
 =?us-ascii?Q?Mb6Nd68BlKTF1TdQgcglABDV9BTMVvyPvDoMpTHZVC5whAlUFVv99k2wJ0R7?=
 =?us-ascii?Q?IKufLrvP75cE2PGgeCuDzdfmzpUiNcQnIamSzp0QRzQG6NwZa9dUHY0Ol+UJ?=
 =?us-ascii?Q?pPw706wtbLHhnKd8XB4HjcR2qM2rdTg9KhcAgbV7c/AYGAYGNSxVtRRbFmMR?=
 =?us-ascii?Q?iRo6TtYSjOum9pgiOxZRwmjN1HT0GOatIEcI/x7yI7//7NE8Sec6npmOX0+l?=
 =?us-ascii?Q?IISqHQWtQ+/w5U2k3w3KwymvvzrzNaQ6A9R+XPnrTsiwGPRrnOV7mPWX1o3u?=
 =?us-ascii?Q?SX2adV3P7/DftUEMu0ZuHLAE3EhP3hyWgZDPt+hsXp7tsnBybAP5c5TsKApB?=
 =?us-ascii?Q?ufDcUreBTdg/yZs+eeazWVVDksdQosnYRZjbfrUaB8iZyvG9g+WdeazxCh57?=
 =?us-ascii?Q?XM/aR7uMPsNAwbUqMtswtimpu8jdAdNxLQAvvNW92hGT5SnbKy49/wKj37/1?=
 =?us-ascii?Q?KNhezCU1Fhk4u/sFIYRoS6kTTe0rfv7X/0VkumCj0FEcTi5zpMql3KxuIkGP?=
 =?us-ascii?Q?hIUac60Fisx5E4I7sKeUbtChorObvj9FMzPWhlUnOx5+ZHs6j1FI6+13KVYN?=
 =?us-ascii?Q?+Xb1Vs+KXV8qV1nSvVPdaFQcHBLegB8iEIUH6yWEiiJNkw+KCCAYxuoA6QOy?=
 =?us-ascii?Q?NoC2e/tF/cNlNzuwrt/ZzEvDVQKjjXii8TumevgaG2IiEmONyXtem/9k3V15?=
 =?us-ascii?Q?882Rt/phfdSpgkBUdoSpB8pLqGNKm6V50uUYXjp76ztRCEqATwFC8i14tHIT?=
 =?us-ascii?Q?2U3YtPnpEC6jGw8qYaz/C8+Pzv9Gaocv2j+UihzSShDCK4kT+QrDoCrbDDX1?=
 =?us-ascii?Q?VncZJ1bexsea1SBHLx6zSX5BuLuR4JZE8jYG?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6DB65E46EA831D4E8CDF1A22801D3D88@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7391
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2789a872-b59f-4737-3f43-08de2da3bc2c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|35042699022|14060799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rsYf6KBQXUuEZJT2OM4rAacKvsZ41rtl1deRnXfr4kq/SFKn8xgRZbQ3j5zg?=
 =?us-ascii?Q?2iO1sZThiMoIxd6S5TumAvMMDIeq+2jHFizJAUvoJpLlu02G8WfLruPJ082n?=
 =?us-ascii?Q?mkKaWiBzFXnVf7BFNeD2FsxrzCHpa6y96pi3Tngvvt/gzeuYwCBCkS9cT4+x?=
 =?us-ascii?Q?9h3szW0mTmuyKbl/XL7HRfSL/yR2qB8+HJxbg+CHQhisaBGH2BrzKHNpXGdT?=
 =?us-ascii?Q?SYXGf3mfABdefxLZeHvHkg4crrQLvq7H6a+h/YHNOoAFDK0pjpeHTPyulS0x?=
 =?us-ascii?Q?v37rWGb0WehcgwCHlYCntufk1Lk0svrnkuQPPQ1PFlJ1zpJKRJtJTVP2ktQn?=
 =?us-ascii?Q?dMxH4AA8GWikCD/71na/fAfX2H2Z3mFECCohwcWICcmnja9p40Ro+YwmhcBn?=
 =?us-ascii?Q?A4aTFZeLBQvqpG4ZWBO/HBT5nM+c4wSA1yDu1xrat7GzdOzIya+Eu2CcjK0D?=
 =?us-ascii?Q?Ht86GGLsXNrkxVbYcsmCCtKqNs8fFkszqfzntQSr9F82Mb8/SjJN/zNMx9vW?=
 =?us-ascii?Q?vK6Du3CB5KZ6fmB7FKUI/A8t8XJFn7XS7xmBM4WSgmL619ITGtyNEpu7iHlz?=
 =?us-ascii?Q?G9KfHm7n6RhF5BkYJBJ/EuHoEibw0sXep5AXcs3mCcOsci4N/O8l9Id4r0zA?=
 =?us-ascii?Q?0046K9veN4cinhTnCmtaoc7P0tH8xk+9hMeTAj8eFUf8Yx/lobVk2qkgCKkm?=
 =?us-ascii?Q?cMd4/EIneEW+gcC/TRZVAMA0TcNGYy3HjUb/0frUJvkXVqdAA7KyfQmMFjVX?=
 =?us-ascii?Q?VeOaqVDkI1JKVmNhTSv+iYXfgjcTWI8L/5UXs+YXYVyG4s8G7EP/WBfyE4DK?=
 =?us-ascii?Q?ufahmc6Ofo577P3z1qu4RjaYqLrjlMR+TQR9NMMc7/ocY4F/e0eaDIxCS9M0?=
 =?us-ascii?Q?1YBot9z+mYyufJWJa5xNnIgDWMXZkshhnstaSl6EQ0aqSUrJM/AFjWbHCd4+?=
 =?us-ascii?Q?sLiqyxTvidzfo0hqzKje1WJC9M4TkKweSiunyYZSfwcpJQuSQVYcQb+afTuW?=
 =?us-ascii?Q?8uwEabzXpAqNOEvumWtvmrBsmsOYVqHHMOHca7ivzZgmx8jejGsYXcJQY1wK?=
 =?us-ascii?Q?eVMAK9F0pvdAETJrO+1ibadvdbvVqp9sphFeMdsX9Q6iB3mArwV5CEJHfmNn?=
 =?us-ascii?Q?80Cupx9hyPVuCPs48njp4Vbd9iUNk3EtNeY1r6bQiDSmvgliFkvwnVrMIMZd?=
 =?us-ascii?Q?7L8HcQwstYgd3JuEKX7bU8nIbjVVoITYt/yopFnSEKOv/hQvynQKWj0reXnV?=
 =?us-ascii?Q?4sWiKX1R46Ck66ipf3WBZvqQ1Sq4XDHx7baf3vKR6Uthq9GnLxicQVN8iwS5?=
 =?us-ascii?Q?4N5rIoChrXnXZX8TkjleDPvke/BPwqQcQNdDairtGZgUuhyVl39v1Ayiizz+?=
 =?us-ascii?Q?VyQ9jTedsSBVsznHCQ/niJ2zeM5FaOlJnSjCIk5VSn/xI1Yn1l/wf8tF2ltN?=
 =?us-ascii?Q?MjaHU1oNJJzB1YTOFKxmU9kh20griCKFKD23ncon+cYgYzMBlSgONtq7CGjs?=
 =?us-ascii?Q?3nYBAfNOPUbpGj3D2HBAlLW64rw6/nlipeV2vTBcF8PqJ7B+QD+xymLYIgtM?=
 =?us-ascii?Q?zkmZ3bHP1pphtLFoRe4=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(35042699022)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 10:57:53.1826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a5e1f3-2c50-42e3-d86c-08de2da3d061
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6628
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 10:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226832

On 7 Nov 2025, at 07:08, Khem Raj via lists.openembedded.org <raj.khem=3Dgm=
ail.com@lists.openembedded.org> wrote:
> License-Update: New source files added under 0-BSD and BSD-3-Clause licen=
ses

This probably means the LICENSE should be updated too, right?

Ross=

