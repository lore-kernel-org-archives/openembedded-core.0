Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13BCC54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 09:39:08 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.53])
 by mx.groups.io with SMTP id smtpd.web10.20039.1747906744255766729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 02:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=L34cvq+z;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=L34cvq+z;
 spf=pass (domain: arm.com, ip: 40.107.249.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pXLQrV0QZWTnxHWfvVqH/NZXS01hzEhsahM6Y8gTKfztzstBWZT4UzWzKB4XL3w/v3c8/FoFqH9vUDGgCF1wJ6XKiOxT2Ci8dN2EYSx4/mqS+qa0A6EeuAbW0Teqjj037pPKDyGaBaU5c9tWi/TR3krjrw3EnMkvyORg/aGmGd4CUZa7+lwF9KqWhgg8chcBcP8O3/tRGTZe52LubOEvPg1lVQ/vya2Xrctea0W5BUDcHDqvF0/NmvTqmQY/vrTS7/fL1bakfk02TdSQKPTsHNErz/CgCeAkYed1vw0nAuB78Bry87qZ7010BbQemRfY1F2Q5CUUfgXZPm1YUyWwpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpxPV5LFVfaNFt/breiOnQwbg1F864xYJlo1JCCoqvw=;
 b=ZPgAeQovWGglWQy0f7L60++GnPeKvfczwSwyTbVRyzDVGExkMKLjqzTGGN+VW39pAcV3pZjukzVoymgDO1Pe6sz4QQvnftNlHVMGQ33aVhGKVJi/+KWznbG57E/11F9kEyd8Xk0AKRJZbINxn+HZEsFxPbrFvJVh4WLz/WOZWgHfPIzOrYWJDaMAieRK6mtJSjfcQL2TV+Jo5xv+s6BeVUA6hFsTxYd85M36AucI+zDohYwfV3XWYSmkbepAVcX8r9YXKGd0extU0o6Erds5DIl8NBSaiOECt6WdYjyyJc7JhTVtJ0DTXC0AwyEoNk2p+e+/xPFDavU+zLYAtb5kUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpxPV5LFVfaNFt/breiOnQwbg1F864xYJlo1JCCoqvw=;
 b=L34cvq+zssC2bAZ1pgPARNy2dXX0rGwuvooJ2SinKjfvUFoH/3YEyXBUenQ3XMptzc9LHy56cBXuO+1X9afTzdSHOO60KkKP6cDAK5V6nVkBN1Ofhbajso4U/zrHeJsx/OUY5Vq7XHcwwAlAaAaVSM8aX+djU6YYEkeHdO8z/ww=
Received: from DU6P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::24)
 by AS8PR08MB6501.eurprd08.prod.outlook.com (2603:10a6:20b:338::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 22 May
 2025 09:38:59 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::41) by DU6P191CA0013.outlook.office365.com
 (2603:10a6:10:540::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 22 May 2025 09:38:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 09:38:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2h7QjPM/iwxZC7qXV4aRg2sOxBUSnCs1wLlyqId6FaeU/sVB85MBHEcRMQIiIgLT8nbEPSCQdbL3/+esUFxCBo7ziYNt/nYv7uPLarUIfKquAdvqCFVD9THKUuKGOMAkEsp2Yv6AXc/lI0MEUhQvTE6cMujuwNYPgSDN3TL3aEijYqhuB9B+ograZmUsRuX4DTa2FsmtQiB653u35cGgWv0JfwPyxINLkXJibETQTxZxC7bN+fNQ3wo4vnjv4OyRCLo4eHKhqnOFbdfuVvJEzjont/4vgN4+5kCnsQ7SZiPis2U4eLBxlU7QnHrzBTW2oOwY7Z/PVaKRuAS+wesfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpxPV5LFVfaNFt/breiOnQwbg1F864xYJlo1JCCoqvw=;
 b=yHKqFie3Nkcu0a1arWQahHmArVOOTk9vbOF3itHR+O0Ix/DTYD857/Mn6C15g7jJxE4uXZo03C71Q6cK9yaCsuTBiJwQfdyTjP4IQuPKYjvb/zOUBimUSK9U1yvV6FtdtY/cgzPJvLtBkORK854+LUEsGP93b+8zP/rCcEu3zec9eraD1KM+BS/nwjgYK6xMXbGoLvIoFxGGkTNfXdjBusb9D6/W0FPuvBjkjYEsLTq4I+VAv2kaWkk8NPQpqs3x2aosKHxCFEayutjdrNM39EymbXaoeUnu9oqO5HUeo0dBubSOHqcSfCy760x161t30xKr33YT8mhXzPJUb0r8NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpxPV5LFVfaNFt/breiOnQwbg1F864xYJlo1JCCoqvw=;
 b=L34cvq+zssC2bAZ1pgPARNy2dXX0rGwuvooJ2SinKjfvUFoH/3YEyXBUenQ3XMptzc9LHy56cBXuO+1X9afTzdSHOO60KkKP6cDAK5V6nVkBN1Ofhbajso4U/zrHeJsx/OUY5Vq7XHcwwAlAaAaVSM8aX+djU6YYEkeHdO8z/ww=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10996.eurprd08.prod.outlook.com (2603:10a6:102:471::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 09:38:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 09:38:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 03/28] vte: Disable gi data generation when
 using clang on arm
Thread-Topic: [OE-core] [PATCH v2 03/28] vte: Disable gi data generation when
 using clang on arm
Thread-Index: AQHbyhh6VVQ0Q8yRBEKXBEHhWYJ4krPeZkkA
Date: Thu, 22 May 2025 09:38:26 +0000
Message-ID: <57AA8F30-F987-4150-A379-1F2B74674309@arm.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-3-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-3-db97c2eb3756@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10996:EE_|DU2PEPF00028D05:EE_|AS8PR08MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 55944985-097f-4b74-c38a-08dd99147ab8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?vaBNfKifD4RpiKSF/D3VVH4RmvqVvGk6WBvHJ18IViGZSTfOKl+Uajc9DOO2?=
 =?us-ascii?Q?1bkBCCJULxUkdUIe4Y2qidcmV/BLx0hROIZ5ENPdtM2xCl7qIApgCb87QPL4?=
 =?us-ascii?Q?s8i43QjZxpcgGd+qVnCwl6coK/HrHuq0juvopufTWOdASKgLZSu2TvKFH3ty?=
 =?us-ascii?Q?3c6zJwlEsfS3cRfnYJnEzJ50kEbYLk/UZyMb+A/CpdSknDS0p7jZ+FwgkJok?=
 =?us-ascii?Q?2cmW/6oEvIvuoDYulCCTQwt37ugvvLrGPanagU6KWMJPsSuE1rSKMnKZMQ7w?=
 =?us-ascii?Q?TDMO2niDJMyLrOQfQ1Sr20GNWVmhLJnVgDXYasFnMlqJdKoFYmmCJlquc+9y?=
 =?us-ascii?Q?6HOTxsROqu9wEKc/zdlxYCqIRsEj/4UzF/tjHVRM4bUZLt7Bf7hL2XfrVfsY?=
 =?us-ascii?Q?mFWcKLlYkfkHqDycqHhiz9vdxygx6+TPBiLwBTQ6pAUZSa/rJdkCVsHAw2qi?=
 =?us-ascii?Q?kZQ8IAMyF2oIPw/p+EUa9yUkBo4QFP+Rh2qI/DxLi5Wzrxllpt5h18vrw19x?=
 =?us-ascii?Q?avdDwK5qeomX9v/hsrjMBsY9QWW+o6x12lQpNWcrXE7lrHzf9zhPg8cf7v9s?=
 =?us-ascii?Q?6g050bJUyOiXyegU/M3lA7qX7rYtDMIpjQq5JBi0kxsSsc/L10a5nLvPsoOG?=
 =?us-ascii?Q?SLPLx2Dvm6DwDSeVNWzt+MiY3nVvvG0mqhq+gqYHERpVOKwiiHCs/lscloMc?=
 =?us-ascii?Q?lkOGJQbDOXOSWyBHXdqMJA4nkzNAl2rZFPSVTijHxnmbUj5nll0hdzb6xCJZ?=
 =?us-ascii?Q?KCRdi402XwuMxZp/ofM3vVE52lNTrCzJYFcg5waZn00Lb07dXfs8Tt0BfevT?=
 =?us-ascii?Q?COdh/FFzHBRqUktpouIasnqqF9qeM+S0vkVZkAjiWIoKQ47fh8zR5zL9YeeW?=
 =?us-ascii?Q?9SrT2JaiwJBQt3RW6dIw4fbaGuWzBRizZMbTPDoXWWlukPBcUStAMWKO+lq9?=
 =?us-ascii?Q?Zc+7ZiPNxVKnkoibbcOOWYPXoijAIY77eqpGQrQBrIySparsNZYTMyufZaYs?=
 =?us-ascii?Q?zR+q/BZAF9+4sfEF638/2VwmLnmV6p98V70/S5D2jSxT2W2cmPKiyJRtE2Ay?=
 =?us-ascii?Q?Nvc72BcmV2d/Wgglfesh9QR/aPNyxwO/tmI26GnlabkYevaK2GzsWCUCjsuA?=
 =?us-ascii?Q?VbA6Klq+NRMWlw03/ov2c2YM8jF/44ktn9FXwTHYcHddV5xNiItVKGcOrr2+?=
 =?us-ascii?Q?1kwg4f0W/7EG8fhF0tObMjs0vZJajOHp8PydeE95ru54z/+GjmWYUpE3nL2p?=
 =?us-ascii?Q?5s1qLlAxA+oKlLYIxwOKQ1NRwkB0kBYRcXL+ZBYieubzf5Tny00gKL7poPUr?=
 =?us-ascii?Q?OrjZ9PHsIbdW1piNx+ALbIpZGNh9PBw3a+UJbYVypDF18IMcLs551Xr7WdQj?=
 =?us-ascii?Q?VMzZYLTcxqmvTuWIMXXbPhI9qrYLKKHqPsU02Q846A6y3F8aobPGGsKnVwHv?=
 =?us-ascii?Q?k1X27/d1NxU=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <06FC33D054840C40A8520B244C62DF70@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10996
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6513150a-9fb0-45a2-8304-08dd9914670d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|35042699022|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9m7GHPiX5YsqDPLrMg4eFEnYwXkdXdyq0aCxgXrgrdfgZGRBXJGr1JEIny0f?=
 =?us-ascii?Q?jPL+S9NUQ5Ch+ynT9QVHBrTKw6AtRtU1arkFD0ASBxKIW3XABxzgbcRDM1kC?=
 =?us-ascii?Q?vZvGSM3n7FMUgeuj/xBoPGXFpla2WCPybUx0L4OUBUQpGb19E+P67HGygVhM?=
 =?us-ascii?Q?0PySszGQ6Ge+uISvU9XvJBue71d7BlrEa9Thk/bQ/0zRigBLG+JRyrOhxWgv?=
 =?us-ascii?Q?htU8lLeB1w+9Vn9/0MU9DwQCAplQL118/BRyA/RNePUJlbkHmLvCtuMEcLF/?=
 =?us-ascii?Q?OeT4DA5+a6tNvHc+1Wt5JVs62ziBhRidrySR82jrn2UL0zb2LH9f2XuNUzjn?=
 =?us-ascii?Q?MWFgaAUUUskBrCo3f63OUNxZ1Dzr9xyaKWxu4fiWTc2oK2mWR9UI/OsljGv+?=
 =?us-ascii?Q?UaijeXDLDvoK4cAVoOqlUwAfGS1XF55HapPC/8OE54/x4+aZ/fuPvIJdGIwB?=
 =?us-ascii?Q?ExOSo9fn1ffUIaUOSc2eMW538W6MUB5EUds41vMmP4sy0vpDfue/DCIoObO8?=
 =?us-ascii?Q?AGdZw+bENogZC+aAGaQFoyyvMB0vM/c5B9Ym85W01/0Jj/aFPlC0OSOLaR8q?=
 =?us-ascii?Q?sUv8cYNQjBGfTgeS7RTNSFkO/TbV9xtmqnWyTgd5hkwt9lWMsr+iadbkXkc2?=
 =?us-ascii?Q?fZJ5IhGVeaYpVVNgx9BjWcy0TMKHgHcHyXYQweRA6dV7z11DnOzAfoZIlinP?=
 =?us-ascii?Q?svH8j905lU3QH7kljiiJ4WR2r07pgnXd70L3W+i6w7mR1Q5a3n4PX6p55aMG?=
 =?us-ascii?Q?V1gwQQtUKxGL9/Y35k3AibkJROjEsb2VbW9FXGzDBQhHTRrh8iTBQFm/xGqR?=
 =?us-ascii?Q?r4yEzZzdZJRGeNKX/4uvvM1QBTaLcrhxVZ4CMBfU1JteKVKevY+UQzgdL3po?=
 =?us-ascii?Q?X0tuUPt2mzA95xKK+jnAsPxcwhOsLKl8a+PA7DAXvbjZgqdht2pUf0qrpWu/?=
 =?us-ascii?Q?Xj2vTRUX8DJ3jy2vdvSUigoXYfKcIb9oyTMv4ikhvGVMxEXs5ZrWDfN0B4h+?=
 =?us-ascii?Q?2XhOilIYVtZO0Yj9XlJAT7dyjWwJ5CoW7Q2JktRPxHVYRi7CLYzH41Pwncpk?=
 =?us-ascii?Q?EtcmQeX1hScMc0k/qERYs2o6VhoOaBV0cJZMbwhDYkdmRrqYiW746euA6SRi?=
 =?us-ascii?Q?2XQXW/HEEECb/kDwRjw/G1U4GyeOHtE1Fw0yyE+4KHZFFeBMzzTdUwWBMEuk?=
 =?us-ascii?Q?pducdsWUAoL/88PEPS0dA+7iYja5cBllRNTyZ19qrlBLKTAlJsvXw/UIBze1?=
 =?us-ascii?Q?thz6Kpd3/RUktmqh7R/u209uflOTDaARYumqt2sgvXjXWwyi86THRtpmQSYy?=
 =?us-ascii?Q?lJcDmc5gxjQC07AtBinldfVqUfnC2m2ZJBajdEj5unXVTLn/GEHC+nco7DjF?=
 =?us-ascii?Q?R7K4UlLW6/ZUA1XnF1agR7YlSN+MkG957buD5JC53x3hR8XOPvZXE5tePwwk?=
 =?us-ascii?Q?anEwnCAvaW/Poy9Sy7l/6gW4S8FZEBaENg9sCF9MGlykANEBOXNiAw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(35042699022)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 09:38:59.3349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55944985-097f-4b74-c38a-08dd99147ab8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6501
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 09:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217071



> On 21 May 2025, at 07:19, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> +# qemu usermode crashes when using clang as system compiler but works wi=
th gcc
> +# see https://patchwork.yoctoproject.org/project/oe-core/patch/202409232=
34336.3978188-1-raj.khem@gmail.com/
> +GI_DATA_ENABLED:pn-vte:toolchain-clang:armv7ve =3D "False"

No need for :pn-vte:

Ross=

