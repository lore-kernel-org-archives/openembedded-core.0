Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE088CED26B
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 10:24:39 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9314.1763461463648070993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 02:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=d2R8C9E8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=d2R8C9E8;
 spf=temperror, err=temporary DNS error (domain: arm.com, ip: 52.101.84.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sgynJuujXXGQfe9bc/3lZ0I3HbhjJOWdLgjnyNx8zB+6z6f3W58ynFKV+Y4Of9nmdQ6jJBHYt6PTXHm/My4ca6AhJlr9uoWfIJrT1Rws8attpVCAZvsTTyRyh4Iu/9hQYgNWGD9hR2SnNx3+LO/0381a4XnZc0l1F9Rxf0/6qhvBLeiiG1NE51C7zkmxntbprv3iIIBmjaeI6bp4zFL//2wPI+lWrlCgorud2e4MPUFmyN1pDhtH2KOOm/eFmyXkhsqqwR+X6diVbnt0vPQIPAgAiH4OxN69CuA4C2OBlnP+O7KvYIPe1ChKbpxQvOlUrmFTr0tUdjsBh+obUUtHJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwnOKfpWN54umTKwSw3LdACoqpLVKKDxWpYswCW05as=;
 b=tb+Uzb+pI3pvwCljiSAWyk13vWEEjNGYvqqmF8X/tJcPuzb+GPnX2CZasJ01Yay+idS0gSvdTKFpVZTV5k9wIC2aTvP660WBHNSvkQW8zjfz2g4SWoV9V7prEvCmMLUuFg3N/VdRLN/iKDtUa8zxSFO8tqRVNXcRu22zdlMz97dI1YfD9F5scZQXE2kJ2Fg6UGe/omLIVc2Q7b2M6G2Sdp08J1BQ0YSVNC4iN5FSifzh1p/B7r9P7sSWgvq73sgnQwg3KP3XBHreLqjw0rLMjxWcfJDrGHuPlMXPvSPYsqei8+J6kGXeYmn1A5pGCy9DBzs7qq7mt7t8Jhu1vlGsvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwnOKfpWN54umTKwSw3LdACoqpLVKKDxWpYswCW05as=;
 b=d2R8C9E8NUW4teIFUi8FaN+lteqpKXVVcV8ze0FQkx37Qx6ceoITNzjZkOKGgoSfqM+Lq38l5dFb/azXg3sMdjBDPi8WlYsTHTlChmPFNlskJzKm4gaBDOsTpsvoNSsYd8qB7vsV4exUY9GUNpHNxiWg6Ch3X8tAYPVDoUzoCCw=
Received: from DB3PR08CA0021.eurprd08.prod.outlook.com (2603:10a6:8::34) by
 AS8PR08MB9575.eurprd08.prod.outlook.com (2603:10a6:20b:619::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 18 Nov
 2025 10:24:15 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::5) by DB3PR08CA0021.outlook.office365.com
 (2603:10a6:8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 10:24:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Tue, 18 Nov 2025 10:24:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfCg96aZY9IhnGEA70WMAPYpnS1megw1s+Vduopm+tFx0nYFsNF9bU09efTUWiGm60FXCMDuKdZmyUQZ9CLIXqkReUGTM4u19UNHyvK0tA5eZzlvMCczxkPazsHZHZBFixXjp1yyB8fHoeDgTTh3JvktCjEbN4TgMorBFZGCr5pinLVTPuOTj9DnvJcjW1kfaxzHAFw9BpvqP5thGluD3Pj8WXnsgDYnPgjgf/ksDHq44aCbchGcEINAwXwhKFjHVnHexVEYRbjVpEDf0wKVqwkTBvOGf4tjp5LD5K73Hs479iK8UUWjy6IRTha6ozORFCW/BqLMFsZdRHG2wk5IwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwnOKfpWN54umTKwSw3LdACoqpLVKKDxWpYswCW05as=;
 b=tK4lpqv8mSP00MxNGNKcmBx4rfOkkXcq9cFnHUSynXWltKq9ke1w6mzBLu++jFr5V4Mkja4H6QqZmkEH3AdSnqMyozvF7CmSwVfvqBfiWcTLfQFID9D8Bkg1GfPhxsG26OwdQAPTgsE707gpKouRgsAO+L/d64JlEUb4YOxFfTpzrKjNaLtHJhszFh7k4J0zbrOQmlQ6HZuQOeWtYSPrrP9lG57mrUZgon2xLFUPO6yaoSHrVJ1Q6Vk7yApMyHfixfTiog/s8JGjHwef2WenBMi8mvCkDgC6W5QffErZ6UwREyjCW6sZGDaipCGf3zRodXpNhOCG1dUqLgnEJAxPqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwnOKfpWN54umTKwSw3LdACoqpLVKKDxWpYswCW05as=;
 b=d2R8C9E8NUW4teIFUi8FaN+lteqpKXVVcV8ze0FQkx37Qx6ceoITNzjZkOKGgoSfqM+Lq38l5dFb/azXg3sMdjBDPi8WlYsTHTlChmPFNlskJzKm4gaBDOsTpsvoNSsYd8qB7vsV4exUY9GUNpHNxiWg6Ch3X8tAYPVDoUzoCCw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8807.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Tue, 18 Nov
 2025 10:23:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 10:23:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [AUH] nasm: upgrading to 3.01 FAILED
Thread-Topic: [OE-core] [AUH] nasm: upgrading to 3.01 FAILED
Thread-Index: AQHcVk9At52JEuRoUUCqEdTrowBE1bT3I5EAgACz/wCAAGaXgA==
Date: Tue, 18 Nov 2025 10:23:42 +0000
Message-ID: <E1341B5E-799A-4F6C-AA83-FC65DCF4986D@arm.com>
References: 
 <0101019a88621386-99534d34-9ca8-423f-9c7a-5e49665a5307-000000@us-west-2.amazonses.com>
 <B65A887C-3297-4262-94DE-232FA1C396F4@arm.com>
 <CADySD0EWNpDpYyG-PeoDUt0SZ=ePwaGhXgKk39KRSbStUaN-gQ@mail.gmail.com>
In-Reply-To: 
 <CADySD0EWNpDpYyG-PeoDUt0SZ=ePwaGhXgKk39KRSbStUaN-gQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8807:EE_|DU2PEPF00028D11:EE_|AS8PR08MB9575:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e85fb53-288f-47be-08b5-08de268c9f77
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?hWQHyqFM/wLtSmKQl8UPL484xPtvXDZsR0cdoDQt+mQVkj04B4xNb0VOHrp8?=
 =?us-ascii?Q?DoFky3B4ucaxuA96L6EeWb+ijmDV/IkAosxwaBhj43/Kxj4bHERoTP7wnLAT?=
 =?us-ascii?Q?GRSLLQtCl5pCXO7jKABCtvfCkysnQUOTAIjuKMiAkMBszxPn3nIQa3p31FLo?=
 =?us-ascii?Q?X1CF8oBR07FhVYdvkS+ZxqJfAZLK1+aopLdx9AfslmkD/pcFopNNu4LMj7BT?=
 =?us-ascii?Q?LHCHq1QEl1HLo7TulQ/24kM8V10bPYrLc8DZEzk9OORGO0J5wkdhyHJ2ze8T?=
 =?us-ascii?Q?SF9sQD+I42TB91OGfKFA5x+xfZoB48dekAr/l7laN8eo/sn35jH6xF1zpAKg?=
 =?us-ascii?Q?4qSO0LHWWEisKUp5/UdpCvKGuongssja/B+ZvnNCXtY/q01LYvFHQzQKHERD?=
 =?us-ascii?Q?3H5wB+7nvr2DbkqYtBvu6ikATEu8Px4Hk9Vlc1lFuEeApHniZaiEBSKSFXoj?=
 =?us-ascii?Q?zawRTTUT6t7Nbk6YDzh/3B/r0HWjWS2G3sJF6X0Kxs3Q5EpQd71aglD+OEO/?=
 =?us-ascii?Q?icP6PWQgM4Zttm8idbzYJAevxavPH8/OTOStnIwidYSg3cyZKSVD+hexw4kQ?=
 =?us-ascii?Q?ZQzVNiYPX8rdZxrv5COD0Dj4SjHSAs6TB2pSSbRS7fQFgO5UtnPeXYtMURiS?=
 =?us-ascii?Q?r3bQGMiz1yxTUFP5aqwJw80fYzJVS8qlwVVAV/0DZiPDK/7URI5xr5C1A2hn?=
 =?us-ascii?Q?R80Zy328awZQ56h2CMACwWwO4mFk9DXQArCi/rED6TPv3UkPyJwKQt7VLXfW?=
 =?us-ascii?Q?l2J/JF+W1ArfAd+Lru7arnzAt1Uk0lRAzMGcAQwA8HHE059NPURAdf9bI9pz?=
 =?us-ascii?Q?YtD31jzd1vgQ1Uw3tzLmTf43TxFoFEzDcNENT2TKKycGgXQDIAppOhJpZ3sE?=
 =?us-ascii?Q?OfYW0kfyiE5EtxPOZ9Qr9sWYCc2mAOQq1m9V44+O9ZFhLfgBCnFrWhDhHcfH?=
 =?us-ascii?Q?iIBlcXGsQGzn1LsTaWHOOp5gbIYlZWHDFks2GX3NJeEJE8884lrRXSEixsvC?=
 =?us-ascii?Q?5MoSlARYtQz8NHM8TeeIkVNbx1vYP7QuON8PoJEwiBhs5KdkpSXLIjMAT5wc?=
 =?us-ascii?Q?5GwGfs9vHb7WeCE9ERMyKlVPeO46UMAoOAokI4A5AezgYdOT+w5SKwrNaLtn?=
 =?us-ascii?Q?ZtxEaFBHFLrcvi8ElMvonbgbAyt/CFvwgzt7UYKycfgxNlg7Fo5r27fNVwxZ?=
 =?us-ascii?Q?EJ8r9gT9u3Wc8021gGEUI8uDIu1RNDS//6l8HvHW/TnMDFMatSEtKQpVSKs1?=
 =?us-ascii?Q?gyBToulruQzPjwTGnQcznFoMyg538aTLTgUddUKvvtFEgAJbAd5g6hjxi42d?=
 =?us-ascii?Q?lPDaofmbu6oRWqrnBcaGyDEjK5ApFRL4E/QHz796KcWrCiAAirQJfim6Cd2N?=
 =?us-ascii?Q?bNk+3hJ3Lyjh4rCdtOpNDg+07s3EWhGfcU9AAd1GuHpGU80eRTrjBVSaU659?=
 =?us-ascii?Q?NkxSLaH+Z7PEhzU/UKLZvrZTx7xElvvI2ZeipKXjnaA4XshXUkpOP1k1OkhO?=
 =?us-ascii?Q?bVW0tEpGhStpYT1na1XbtosjA3xaFOHZ2Ysl?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6FF628893E7FAD4F9A83CBE64460EA48@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8807
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f9e3e46a-4b09-41c3-d122-08de268c8c56
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|376014|1800799024|36860700013|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7YOS3M4De+qWBHcrq5QV+3aqnBkEBzwX2Mm72F5lO/CtuBVM1t4MoKJ8NxPK?=
 =?us-ascii?Q?nc9tn6zMy2Ej5O+cTrMJtyQiZIMedfmVRW3XJYIGn4C0dkTAJGihRh+K0of9?=
 =?us-ascii?Q?UJ6v02TaGPhPEmjWYwWlNn42AkguCIxInrgFzk4nNrKavfslOov6lYc2JBaH?=
 =?us-ascii?Q?bNSgbtiSiEM521qfK302cSzjFh1+CDV/IeKz7JQrOZcz5g7dtTs9wfL4K5FN?=
 =?us-ascii?Q?BbyrcTPJmIR/YUdkn0cbBm5J7cU8aW/QQkUj+q1MkVAYxMeFPtuCp2idAqiE?=
 =?us-ascii?Q?QM6+5mpGO+ncRIZ89kpOBJ1EYRVsrHE2hpgCnU+0FAlaUtdO2S+mYoTzYyGX?=
 =?us-ascii?Q?S3cZfRteD7oCjbNqMQCYEjwAn0ysfDUxcGEJVIIjkAiG9pTUkr3b/WBTJ3LJ?=
 =?us-ascii?Q?e4FBQwmVMZUbbVOnfwmylt2GvPs/44Q/Qm1/TyhgApIudSQywDgTBjGH2u09?=
 =?us-ascii?Q?e03BeP3W+xEYjse/d3V6XewMGI/+IRF/EG74928slJM5/Wx/e+O/cqgrtICo?=
 =?us-ascii?Q?mwVQqOlmSO1EC523+iU39k6iKY5EDUQ9Ib873hlViSkQcDxsVYYW0igp5WAY?=
 =?us-ascii?Q?Ns5m/RNMyD7RiOtS9lMcYLCIjhcgxlRtl8jt+dcY7wzviDTWAsBhSRTqsex0?=
 =?us-ascii?Q?5/i3Vrg0/qfqj0BmXuCwHTBFyB77NebLfY1NqXqiF29z5SdlcXWKsYztXpt/?=
 =?us-ascii?Q?O3pHueuiKKd6ZHsfBZMCLbmvx/el/RdZJSHuRuj8lIuyA7fhzYiFAN4bLDrF?=
 =?us-ascii?Q?St6P56WxA9TBQiz+ZEFtKbgGaTFXYGcu8Dtwh8gl9qjjptJ1tLYoIG+LcknH?=
 =?us-ascii?Q?6RJh6wa+8ju9zITVh+pUk55mFg0D67bqfdtrLh7SeYmCkZqOa9EXlq6in0zp?=
 =?us-ascii?Q?abniuyLrAk8eZPNtunkkxORDFT7n5BQ58Nm11xMrPxHqRHBKxC/8cyqhB69l?=
 =?us-ascii?Q?Z5EQ0v9EPUr8fqb+flhL3UohmHsWSPi+H8ebeuW989tBTzwA59jtRtEaCZni?=
 =?us-ascii?Q?jJlOjn20/CIyqbMNvqChlq1qJsL5VM5dyqVp4pRPAh2RC57KuBnEqs9/P26t?=
 =?us-ascii?Q?Xp6fEOTuqq8+nEJbs0McC3aYGR6Z0zQHJN3uOmF4SGFtjgGnIt8o/bTsXz6K?=
 =?us-ascii?Q?Xrj0pzaqscGFtqB3BPH76NzrCs+8FMBMYJ4gwDqBIeLJNcKtBcTJeE/h57ot?=
 =?us-ascii?Q?R3crSA6hcqsDR7n4ubikK3TXNQvZhrITFUAOBzMnqdbder63XTDOcVzE+dnB?=
 =?us-ascii?Q?dXcdUsQjswTb1BT/Z4apPzh5+vhzuZYJkLiyOD7dNSXyubaa3Ab/W9iPQ0q/?=
 =?us-ascii?Q?zywA3drPNLY4vlPTpTRYIgq8gKvO0Q9xFtug4dhdJpWMBqTASEYdje+2/WMu?=
 =?us-ascii?Q?s0ZdOw1ZVWneB3mI3Z7mbUYU+k8n8hqIIa3zgkkIjdQzyK6YOchb98i50kQ1?=
 =?us-ascii?Q?gZZV4DB46jWeEJ3zngZsNek443M6QhZMFF6kgL7VpHaDNTe+vvTaL1CMtbBC?=
 =?us-ascii?Q?XQEta27N366GlckfOWr1rffhkLkecGeJLcPWZk2FEUbeiefUUOJyF8eQZOkr?=
 =?us-ascii?Q?iMMKu1N+QZd73Njy0LQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(376014)(1800799024)(36860700013)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 10:24:14.5308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e85fb53-288f-47be-08b5-08de268c9f77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9575
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 10:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226518

On 18 Nov 2025, at 04:16, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
>=20
> Hi Ross,
>=20
> I have submitted a patch
> https://lists.openembedded.org/g/openembedded-core/message/226509 to
> upgrade.
> Let me know if you encounter any issues and I will try to fix them.

v2 works in my very brief testing, thanks!

Ross

