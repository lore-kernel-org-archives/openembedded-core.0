Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92042C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 10:37:22 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.43])
 by mx.groups.io with SMTP id smtpd.web11.5015.1719484636071404139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 03:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LXHLHBiP;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LXHLHBiP;
 spf=pass (domain: arm.com, ip: 40.107.249.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NfsRhBBaX0p8NgIm2IZj7JNhIZd7rQeLu9sDKElRGw85CjAG1KDQMjs3bN6mkZ8yH2UErNBG7Y/j4X8VC/0qai5a+Z0XIkbWQB+NVNJgDCMgVZXST6balucV1Hc0kHQD/5A06C7FtqS1Oxj6Zpe9i57Z30hbX+arpo7yn0JRKSEqR5XSxEvZE1nscIkwiUn2+OKF5FhHPyiK5+ynMmTSSb9GtdSuErSNz5hlAmta4DUdUmYSUJSjOiVs104zcqlrEbr+GnCa7YyMUYMKeZXQDwrVSIBldYnSgIc52hXEcKNKnmppqPnRWpNx5LAmxAHeCkj8AtBK9Os9PA7gTuZRgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyI/9p3Cg9QctJwxLm0hV8taArN6pqky5fbSfGudLWw=;
 b=nK0vSE5vPUc7YhcjwyCaP30IoCzZoJrWvjSHjWATlbC50adBePj/tV2LFgLyIiI7UyxpzbGJV5disgknDlrzWyarNof18a6o4/uLu8Z8fsy7ILkFnt1AdQPXr4QGNrzS7cbj7POo/2gsIvnHvAt448f7BCS8EQtJ5gYEO9BpufUOnVuJNL5YDwUPREvmwvnHUQEhJf7ad/ZX7OTOuwXKU9ItZ2bpR/Ingm+bb/OlvPw+EmacQKkwSNz/TidXfnelU35tDvMo2xh4PDEV1vA+d9bQnQZ0CJyK315ZRwG8MKv6QfyJ7dOcY+4mILEh9ta/70jsuY3Hl+SbEseSPPo7Ug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyI/9p3Cg9QctJwxLm0hV8taArN6pqky5fbSfGudLWw=;
 b=LXHLHBiPme3r2YtjN84d+IU1L2vkWNIYnpSzIiywL185yN9DTuIZ58hJvknPqffneTf7xgjBeFVlV293bswHKga10jN9ADpt6xY5We6G6uqFULxMhVHFwZ+1fDxFG0rbVIDyObX9HklwdbIf5uI0S11sxuYCb1q48esrATZ+W0Q=
Received: from DUZPR01CA0112.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::11) by DU0PR08MB8639.eurprd08.prod.outlook.com
 (2603:10a6:10:401::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 10:37:12 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::9) by DUZPR01CA0112.outlook.office365.com
 (2603:10a6:10:4bb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Thu, 27 Jun 2024 10:37:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Thu, 27 Jun 2024 10:37:12 +0000
Received: ("Tessian outbound 9799d09cf206:v357"); Thu, 27 Jun 2024 10:37:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13a2727ff8d8e592
X-CR-MTA-TID: 64aa7808
Received: from 05c656c37185.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AF9E2565-1706-4A20-A053-10E8FD12030A.1;
	Thu, 27 Jun 2024 10:37:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05c656c37185.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 27 Jun 2024 10:37:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wuy1XkFGVDcI/ho6LuPotJjPimWwSCDGqpdS8iVrrK8Jpsup06leRx+69gGu5vVU7VnKjbZfSo4NAALSeylWPsSXERUZHRv8O9tnPKI7qWMNN2Tqa1X1gj6qSAlfMiAxAOsKTQG3puhIbbpWKBy6bIEwoJp2mswqmMOD6l+C9Tt+nUuZA53xJUOLQxvVjXdM1Rxim9DojKhj7yZhZsegt9mQUn6CUdRiKX+RHUFTF9AfsHfM5Nd9oIGsGXJxs9Nnhg1wNxkFEbl7VUPqBFzKW4RelarqyloGSHICc9VHBrLzx/Zu88qFhF3kZl4dUS56CMuIdD/T9nw6JWs2L4CZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyI/9p3Cg9QctJwxLm0hV8taArN6pqky5fbSfGudLWw=;
 b=aC1xYVJOr1qW61c8O/ZgfFJr/cKEiw+C7IBSBlWZa8rX099j7K/GmP+6FDCnbQpvWAs8EmcWZg6rK/DibW+LxWQ09IE5kdsK41q8ZBmO9d0r9aMY3eqceOPkqhRxvN+1oDbb1fbZvcwcI5a0zR30abTZ13g5icJlxbAMVrB9EKeQAHUJ0qzkBNHe3UEOHyIF1qVe27lJ/mquv5JIUuVlL23tj5bmlsD4R0o3Uw9RnN39fsa//aanxWPrZlhl4vnELZ19IwVUKQuzvLwq4s+2WNZJa4IyqwX24MKDMFi6lhfje8b5k+1KZtlRP3zOMClMIxRUhLzuOXc9FM9RKbIizg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyI/9p3Cg9QctJwxLm0hV8taArN6pqky5fbSfGudLWw=;
 b=LXHLHBiPme3r2YtjN84d+IU1L2vkWNIYnpSzIiywL185yN9DTuIZ58hJvknPqffneTf7xgjBeFVlV293bswHKga10jN9ADpt6xY5We6G6uqFULxMhVHFwZ+1fDxFG0rbVIDyObX9HklwdbIf5uI0S11sxuYCb1q48esrATZ+W0Q=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU4PR08MB11078.eurprd08.prod.outlook.com (2603:10a6:10:576::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 10:37:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 10:37:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "egyszeregy@freemail.hu" <egyszeregy@freemail.hu>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] mc: broken source link
Thread-Topic: [OE-core] mc: broken source link
Thread-Index: AQHayBMh/me27dHt9kuGZN01Z9QOWrHba7IA
Date: Thu, 27 Jun 2024 10:37:02 +0000
Message-ID: <1EA2FE0C-0589-4346-B2F2-AA61CE6FE812@arm.com>
References: <clOW.1719438316160754314.rIC3@lists.openembedded.org>
In-Reply-To: <clOW.1719438316160754314.rIC3@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU4PR08MB11078:EE_|DB1PEPF00050A01:EE_|DU0PR08MB8639:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b78e63-3d4a-4ccc-f366-08dc96951abc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?8ZP+MGFJxL1W1WCtahGbEQ02QXXWLueslra2/FU+17FKZ0T1rqU/a00rYfoC?=
 =?us-ascii?Q?fk5pd95GnQ5WTEdIhKufdgagqPOxnjNMmOBTmn/ZkoVscvzVThf7ga5YI2fE?=
 =?us-ascii?Q?q8rb0u4FMHk+A3+NhM07V16e01Wwf0igZA+tPqSL9AACSw6EUWzWXk8nik5V?=
 =?us-ascii?Q?hD76k9Hy2sICbrHoMFRnVtx7jV0tZApSviml4FSPjd1/eRkZ6PdOWpqVHFTM?=
 =?us-ascii?Q?lZLK7v5G5phxs+EZnzW2ckD5R/8qVlZiMTnp9wjZgg5hqZp6Bs9CcClblW+d?=
 =?us-ascii?Q?+h72Segy2xCc+Wzsj2w30XcLpWBcNUHX7Jy8NQegyJ8UN/dpYNlv6wL4/XUe?=
 =?us-ascii?Q?aUgrmVlj/c5z26r6aS50IQ1Fs7RgSQZbzdFIzIcWGIMoL0FAy2DsyUdVqg1X?=
 =?us-ascii?Q?4WjDWURtgEVbB8DQTBBZJrAeoUkqVV3uGdvbFlBIM2Q7voLZ/lDd9cWNpeuz?=
 =?us-ascii?Q?5Fj7qyJyrt+VZRP+mT8D2o8hY2AAzEBsO6e0iNdZ2/iEY5wrzKkARrXZW0ud?=
 =?us-ascii?Q?tWteOgx5c2GAl+Gzwtbz6EsBlzYCXQRFCYOMv/0J4xZl2M3A6o+8Yujhwcx9?=
 =?us-ascii?Q?jX/GlPgz2PRR7sMCi523XM+YweqMXhOw8HecZY813mgj3SY+yczW+1HCD6wT?=
 =?us-ascii?Q?LpK1TeWuoM4XQpLOK69W42yLbg3B9LNwMkWxFVt9YcRYbvAB+UeHSI1A77++?=
 =?us-ascii?Q?3OvT1KBsTpC5O+8sWQcwU+N52KUkLq7N+OCdDbyqkhafpD7QwmPhYr9wrPTg?=
 =?us-ascii?Q?MftrZIqpZti6gz4H10XZGGWXzTeK5QW+Wn8dI1/E2iub6rc7TjJBWyigYylR?=
 =?us-ascii?Q?Ry3d+P79TZbvnFGD5bG6PHNypgeaAUnwPMpRbnY8ZCN67b/yPcmqLQ4popvZ?=
 =?us-ascii?Q?mkg71TUmTCzVxvLm+rbhEGqhmuH6HZJ8PLMSe1dtcqMPAQhzsgymGISxYrA4?=
 =?us-ascii?Q?nwVhCKyQtyhAb+Ns8I6FHZ1dHj8o9DKIXhqUrFKRKMfVpJ9V4D4G++2Y9xfM?=
 =?us-ascii?Q?KRNXexdU6dtnqSFmMxaPpTjhooxp/GKnbfyWCZQvU8btuthvTmk1xUoM+SAp?=
 =?us-ascii?Q?n952QcK5VfF51j/xhlXDBsR3E5jAizauoDh7uWur6UNMxA7E3cWHMgD2K0lz?=
 =?us-ascii?Q?A6ks1/0+bYUqgF0bQM44uP7kycUZkS6uSLB9gzyPlOnV3MPcwcGiHMh035Ns?=
 =?us-ascii?Q?K7pW2og+sC3nLTipjOAQ6ZT7S04WwRUQFRezMZflAZqJkoGH2Q7dTX5uQwLe?=
 =?us-ascii?Q?W4mNq1Lu7y1+8YfLH6V9//cJps+5BsuvB+6p+Ey6hT2AGhOC4rvOL0CUVC02?=
 =?us-ascii?Q?Lep/d56+zSHVXdbeGJ/m4OVQHQuzRNV+yK3Rhz/5I3JxgUi/IsPD1ffAXtjv?=
 =?us-ascii?Q?cCQ6OE0=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <71E38312EBD2E448BF939A29F384E122@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eec32e4d-fe63-4e7c-283f-08dc9695152d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fYlKzErdRD/zym8bd2MUNDX5MfXFm+UeshqL0hUYiZ5NB5/SPLBeq2U2gicN?=
 =?us-ascii?Q?zgnE796tCdFyikZ79TdALPAVIunF1Xo2gZuzZuoVVG2su91D6u3CMwZi8NSC?=
 =?us-ascii?Q?es30us6WfQYBkjTBoFKCyyK5jYMQqCms6+izzez9L6RK6ZZG/iISNszHYkmH?=
 =?us-ascii?Q?LIqOx5xVlyzLYutKUcjuuvXtrN6fEoLGEznN1Tuu7VV/siCwlX1/TXePaLAA?=
 =?us-ascii?Q?iSABS10Hcp3ApWpOv7YdeWsA4AQ1e9K6aCrhcFEU1Va5oiQQ5RnoUNPt7z77?=
 =?us-ascii?Q?xB586+DydygyeMtPwKOSIbLsxO8e6wQpZjKzKE6BWFqj4HS0e6JSioMmQiI1?=
 =?us-ascii?Q?e21d5wsSt1BBCSLbx2JJD9N17Ej1Phi0DgiBymJ9CVYBH8ysZF1goDLS5hnQ?=
 =?us-ascii?Q?w/5ai9Yxcx7+72diE7i7T2ZX6gmX8q93toxl+E1B/ptrLgZrR+uA3zC4+9sZ?=
 =?us-ascii?Q?uvvSPpqoSOzZWyIoS3oYwAyZq15RyZSeQOl3tMuRo4Cz+kMBUpiM06azMrXD?=
 =?us-ascii?Q?8J8JSvJNfzsyHpYa4l/uHUnxL09pToWju07wKV6h1XhV8tJNw/pPfjrzqxCq?=
 =?us-ascii?Q?on5rAKPH0JmYDjCs3smpEpFCdWhOSUWK2ZV4Cy3GKobE/ngmlW6bgnsCHXtL?=
 =?us-ascii?Q?ds0SL1IbnuexPGScXIoAMBq+hEP4DCYzuE+gWodVftjShLTHnFi5obX6viSY?=
 =?us-ascii?Q?sBfvURI2TNsbPuLdVdSKdPL42h8uUZfM7bf85nxd6ifgkqZ28n/sFJnhJSMk?=
 =?us-ascii?Q?sqM3aQiIQdzVBO4pbCEwSTkugDawdAWecrRhbM29AHOXUebdJATdqo1QVDH/?=
 =?us-ascii?Q?EeMwWOds8slJFbaeRa7B5Va6ehYPAAOziAAy8o3dSW3nm9LjXgoUu6x60TjT?=
 =?us-ascii?Q?e2rILti+ipAN6Pmk5EBz887WHDyvz/n3AkFWTiZHdsQSj6osBGdd/lfuSchj?=
 =?us-ascii?Q?DT77MlfKm056SEEmOaHb69adV9J8SL8g+VS4bAVNpp3wR9z6CIBNeioQm4jj?=
 =?us-ascii?Q?i3DVNicOkx5/m8+u/8Y6+fEekM0hx35Jz2C3sUmv0SETUQfmfAgbOhAlv3aj?=
 =?us-ascii?Q?OCTeJPZ2PG1rkCdcz6sTGKxF1weHU+350QF5FbXiqN76BaRiRV0vZhtORGsv?=
 =?us-ascii?Q?iiwalVrEfffZJ05w1xeZSE9RgW9vzK7obtiQBue2RAwn0E0nm0NIpyftUMO3?=
 =?us-ascii?Q?zLwMoa6/+anQiafsp55Q5mxIA4b8hvvgI7vDK9Rtar+GGHUQxx8EldiHLS6p?=
 =?us-ascii?Q?oFnleF30phYP/mcB+naHV2H95FJms9Ik0Q+bGMRYcg00Nrb1eV5ulmpWJKYg?=
 =?us-ascii?Q?54pJq5Iyxp2oV0SPJRrnTOohTDC9s9XRJ4RdS4t85RmKNBTW+x8Kl9QQQRXs?=
 =?us-ascii?Q?MMTlN4RgMkYC47EfTTVv32xbSWAhWKlVNtJTL6Hkx/JDUzKPRQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 10:37:12.2495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b78e63-3d4a-4ccc-f366-08dc96951abc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8639
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 10:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201199

On 26 Jun 2024, at 22:45, Livius via lists.openembedded.org <egyszeregy=3Df=
reemail.hu@lists.openembedded.org> wrote:
>=20
> Hi,
>=20
> Source link of Midnight Commander is broken since long time.
>=20
> https://layers.openembedded.org/layerindex/recipe/5603/
> http://www.midnight-commander.org/downloads/mc-4.8.31.tar.bz2

Would you be able to send a quick patch to fix the SRC_URI?

Ross=

