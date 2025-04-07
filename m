Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3F4C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 16:36:42 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.75])
 by mx.groups.io with SMTP id smtpd.web10.52637.1744043797536009632
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 09:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EZHzPBKv;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EZHzPBKv;
 spf=pass (domain: arm.com, ip: 40.107.247.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Vmzv+lkPJewJ7/ZyQDpgj+7zH7LWqfQv97rehaVK3vkktN5E7ks2vAXQs/++4UW4HXGVrwEfwHl+PPArqsIdQy96Lq9cQimZTjudzFgKgSNrWLWU9MfjnuhH+fy+j+tGyjhaW9tNz8zKemeMprRhE96GQi6A6sW8Qpcp8Goa8yvuEJs7jBnH6R0HP5xUDa7f3FcpmVDQq00ByacB6L0U9hIUWgqBNWGOh0q3ZVH1lAGEshSp+LCTgw1bd0oXjftHi62A/8JlLIuW3W+z1Aq4diowIuP3TAfuhOzH8E23WSTstnwS9dGPmDryTJWt2tWrRblrH+CvgxwGuOwF2fym4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7VnNdZOD/cHNLIjz3tn5cF15jrGSHHPcd1b9SW7eBo=;
 b=AQg8u9r1MDUha0pp1j7BILLf7SLeDHZuCw7dkGLcEm1doQqhSdwQqKA5UBKHxO0UEke7RVvpvjla2u4ID1Rgt2tMP9vvbZxkAk/SqcxW1vKz8jZiC4DsUiSAfUnvA95TKb/Q4KRX2eXUT/6hFI9XAHTj4uNVRD/vkUJV1V6j9HElZcr7+qSCkEourkWpPP+ggY1mCwNGPtfRlqzA824Gg2S8QsVciQ4kELBceL/B+0kVBiBk9TU6aAHnGj0LhYiFeBxnAWZDxtwQRY3kLqiGtpX845NynxyhHdvPC5deJRMpN8JhlkIIRCGjt3mM0F/iC+zEUIyPxReW+/kOs6iSjA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7VnNdZOD/cHNLIjz3tn5cF15jrGSHHPcd1b9SW7eBo=;
 b=EZHzPBKvNeE+3UfiOS/K2pPXTyzk/14pXs0bJwVNXKDKQmIDzGpPKAlz17Rs48U3RFbrNutdN4TpxEvUu9bWiFf1GzKZYo5VK7Kb/NbXv6hSS7iU0Pz0NIXtz3eJvhi7tIBqw0Xq6UdiDltsDfWMfAGJaE53U3KMz4npfGaMROo=
Received: from DUZPR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::15) by DB9PR08MB7675.eurprd08.prod.outlook.com
 (2603:10a6:10:37e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Mon, 7 Apr
 2025 16:36:30 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::68) by DUZPR01CA0003.outlook.office365.com
 (2603:10a6:10:3c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 16:36:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Mon, 7 Apr 2025 16:36:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ap+wFSQPfKQ1Ohtxv6WWZJHFCdVquuOlgXTGDxrLc3o7icp8ghRAAusDLJUlSz8LB/bohEVsEhHdskpJ6TIC0ZFLVHt/Zl+cV/sULJ2hgD6P+0Hoo/SCHWmkCqA41N9GLvtskSlFBSmSEri6P7B198DIwzEd/9lw3Co5Fbtry28bXvHemwWPs0Em3FUtdG9FWNASyRS29yW9qjc7epRFvnEzE2gMRPG/1fCxQ+ZCXpufrhRD3JUMEas56wBRIIpjuz+/5aaXmqzWczBn7lXxATP39iBlm5VsOohicaNz37CxHRZ1NUvjf4SgI+fjpccwasHY0ttWn02Is7SsEsNaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7VnNdZOD/cHNLIjz3tn5cF15jrGSHHPcd1b9SW7eBo=;
 b=Z9pS4ZpRYQXRyke7G6zoJO/pcLSEzrVVXFM895PFAeWAyXYpxzjIiF/9Bj+bnxq3Tc8HukAVd50+EGLq7dBwMcau7mRD/cBbrrRrxOpIRe+GX7Q3vh7yuorHg9D4tLZSyY1w+mz4cFqvICdg5s5BrPypDLu+54dTr75aaxXS+osohn7HmZnoLGcuw5a1kEu73PCHbhCZx0HwGbsQAI8MVR2E6CYxIDuqzszqEwm+AkJQa8lbg51pWZFDVhiDYgwmWtoNa9bREv9Kvh2qfnxfvDehKtzO4VXtSeiVP79mP2BZBNeCskr4i3YPwEK7gyK1clegJNKQbgewr8zlUv97Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7VnNdZOD/cHNLIjz3tn5cF15jrGSHHPcd1b9SW7eBo=;
 b=EZHzPBKvNeE+3UfiOS/K2pPXTyzk/14pXs0bJwVNXKDKQmIDzGpPKAlz17Rs48U3RFbrNutdN4TpxEvUu9bWiFf1GzKZYo5VK7Kb/NbXv6hSS7iU0Pz0NIXtz3eJvhi7tIBqw0Xq6UdiDltsDfWMfAGJaE53U3KMz4npfGaMROo=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by PAXPR08MB6573.eurprd08.prod.outlook.com (2603:10a6:102:dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 16:35:57 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 16:35:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH V2] qemu.bbclass: move to classes/ directory so
 that INHERIT can use it
Thread-Topic: [OE-core][PATCH V2] qemu.bbclass: move to classes/ directory so
 that INHERIT can use it
Thread-Index: AQHbp4vmSzszqR12F0GZZ72o2GrQVrOYZyEA
Date: Mon, 7 Apr 2025 16:35:56 +0000
Message-ID: <324E9FAE-CC7B-4C3D-BB8B-F422C35268F5@arm.com>
References: <20250407070827.423672-1-Qi.Chen@windriver.com>
In-Reply-To: <20250407070827.423672-1-Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|PAXPR08MB6573:EE_|DU6PEPF0000B61F:EE_|DB9PR08MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 3597614c-d47f-47d2-f753-08dd75f258d0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?T6P3kwQWOUrs9S+gxxnSG8YLiq0MRXQeaqsdQuKzu7cXDHqnPIrBUxnv4cLV?=
 =?us-ascii?Q?13ULnee1T5yoaXSIIigg1GECx/9HxGZWiJ6i2fNk7bz+nvZL5jxM6U9/c8U1?=
 =?us-ascii?Q?GX67QPa3ZnVYzse5z5UKu3ubmpZl7P8J4srrqHFWPNMYt07GZ9qv50xW5/KL?=
 =?us-ascii?Q?AVVVWwCUXVLW9R2IITHgwpF4cLVxGwR+RElaXYdKdZS77WLwj23pGRiElAUf?=
 =?us-ascii?Q?HCDBHTCF6jFrEAah0gjMhYL5X161olsVRKeMULItiojviSSgnwa455erzOIE?=
 =?us-ascii?Q?16ZSrpymBZuIK0y39R63KHc1kwzmIEarHowaB5U8haINJCmy9DFu7kvTT07m?=
 =?us-ascii?Q?GZr9Fz8AZqlxh4cEtuJtwxIvE4QrWlq5HjliLb0CU2P+8GwKXobuW1rrj0Yc?=
 =?us-ascii?Q?9xasPrZwZzE1T51/6fmK4YRw5AEbE4+cCJ8VljGTpDkDJh4yniwI9MDjbrNd?=
 =?us-ascii?Q?SmRvncJ9MNNARLynHy8R61Xod30/qGGJDx3v9oSkL9c4kM/XJeq+i9I8TGQK?=
 =?us-ascii?Q?aH0Gn05EmsiBxjIK4tz9wCH2Gempfb+Ob3FXvgLr+zrHfP8KVUKjhgRaj5vU?=
 =?us-ascii?Q?sT7HoPOqoW81NaKGxH4kVTXaGOum0Bhae0/xa0DzC74DHHueXJc5XtseCE4M?=
 =?us-ascii?Q?6SH+Zd+QsaKcMEP4CKqNOPyCsHkdNRq1hGmIJsrWkIRiOKrH6/lIoZ2qVOkR?=
 =?us-ascii?Q?zgiSPiFQUPctww8zdQPmMGYSObC2XwiFTWj2WTdL5m/OgfMUdVPIQPuiYBZE?=
 =?us-ascii?Q?pgIgR+fS1L1cGPzLYtwTZysS4krYzKa9HpfDrXVqZdEtgkETScoBLoFNB/4A?=
 =?us-ascii?Q?bZdNN41NHJb872kHF3mteqd4bZbLohZ/bl5dmCZK9TWKXyOmknr9ftMZvoM5?=
 =?us-ascii?Q?O7gkJ37NALqbdZTOImiZ51WC9SBDhF8D2Hn8sLTlZbrMUozuBY4o8yw6lPuO?=
 =?us-ascii?Q?R5D35sLjpm4iM7vAg3anVz4f7dW/6vSBlCjWbEqwjPZGGKko0spXRmtXaAra?=
 =?us-ascii?Q?wDULNkD2XW2l5flU2Lv4qjmpPAc6zMCglphLsYOjS1op4yiHXGKvkdOkg7KM?=
 =?us-ascii?Q?8rKzg5VA5RGo0MvX2kKwlyP2dhtivpG67zPTzVm+m2N5+tI7VkDHRu2AXBEO?=
 =?us-ascii?Q?taz+eE5zszbhJPJDrUOFIZjHsA+xrj+1LlEElYA5boTSoAPZTFTeDze+Epwh?=
 =?us-ascii?Q?DmnjQQHMJtJmzNzHgkLzhfmPqvvbKiggD4VBQAlOVB/OaXKmL9QKLNnODPui?=
 =?us-ascii?Q?YyV1fLF7AMGlaYNP6IHQNtPlhpTOtnvF1VQw5mbOHb0LKE+KJJw9cU/5FXv8?=
 =?us-ascii?Q?iWLXaPdRwpXWviB05OS/N2Rt+uFGk9NrNwJJ55feQCNyMAEGnIcR/RJnF9Y7?=
 =?us-ascii?Q?Lkl+7xEsUVgQZoGELE8Qua7NwY+nalJ6ylLS9McxdP9yim5ikTePbN25qcav?=
 =?us-ascii?Q?ohRce8AuLztMhhohgdddtixxR0mSgmQT?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8E24694424538746903E535BDD757C18@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6573
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d2a7aa81-5338-42f4-9116-08dd75f245c3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|376014|36860700013|35042699022|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0capI687lEWmrP6i4Eix+A44/rSmTwI/sWHDe/Eu399N+AA0vjTUrS/2Kn/w?=
 =?us-ascii?Q?9hFvcn8EAZL2Uv7GO6JZU8GgwcthJy9QO0jOdj1vCVFPx6p7vN+A4cxSTOFG?=
 =?us-ascii?Q?2vA7lCEcFqk5WGnf8enDd10X8lLPy0oRn60A8pmAklrbOAf8Hcpv3l56c7nC?=
 =?us-ascii?Q?FDUFXeJ0Za/HeVdcnRDg/yQmy3OiRGPjhNl5ohvEYbHapjXoV1hhznJJhGCv?=
 =?us-ascii?Q?JzAkpkw2tsCytA1J+wz55gbSNZnH298QvolbacopCrRDKkBDaRVlBsIfZZRr?=
 =?us-ascii?Q?uPcvN03izAszW8huDZ6s2Esng6BGteVQ3yKTB+ADl9cC6FEGIFYzwEOIV1ul?=
 =?us-ascii?Q?uhRs0TlY4P9U15lqaMWYXwWEb6DjkhtF3atikOQbygbCqICiT1yga0vTrMTw?=
 =?us-ascii?Q?YTvSZhSoYuOYj2HJF2DLw0jUQomA9Y2rjPDx0FKewAOqlXMbwnDFeh1ntqk9?=
 =?us-ascii?Q?4dlfCj4+bHbKrOvnFEnyTzsGOtNk/KN0y3LLts0ZbvomHQ+f7KXxJ5tL35Ti?=
 =?us-ascii?Q?ClYU8qk86THPTh7lIT+oHtyBYPCcYvXmfsw7ZeCUR10JixJTPcGZht+GnANj?=
 =?us-ascii?Q?JSeYBQLIvtdN+0HKL/KJWBihqAsTwsCQKn/syH1CJobIttO2zfryA3y0sAp1?=
 =?us-ascii?Q?Uc0hndPdJRxICWa1+UWeGyIV4jj+5IWcUIfckO32g6xP0nJmZid7gqqTQ3DU?=
 =?us-ascii?Q?diM+P2LnsqUcmnwWxCpkqhptKGHp/LqZygZZsv0RXZ1tEeKVkGqkMXOOiz2k?=
 =?us-ascii?Q?7Sm5usnFv2JMfuX1eIr2UUlzn0k6Uehdx1C1vuNsZjS7jVwEO8OxbmPjOWgH?=
 =?us-ascii?Q?76RdCudnMmWcBMVRa1t0ttFGEsIHFWnBtfcOT/opPzLLylfaU2UEgfsdvczJ?=
 =?us-ascii?Q?RpOvf6e/dDSqvfjwgrVgVUkAltdQvMwb2qiEuXgykXx+y5M7Me4a4GFifMkW?=
 =?us-ascii?Q?p7NnetCFyu72ygd2Dny0D6sNvePSPkpedqzQiXuQ8OXyHrNE7i5G/jbQRXjU?=
 =?us-ascii?Q?YKQb9m+Sj3Fq5+iWx6uXyuzyJxPpO4JX24R3Y9uubmOhplkkOrR36gYecMbe?=
 =?us-ascii?Q?NU/W5sUCONeTpjB8lVdrd4X3g9kxE0lOWWLlMlBOtvfYgxIw3i9pCmtO0LL/?=
 =?us-ascii?Q?TscOqOUhwUbBU+ixANJazhS8BpH1tQXYRCzdJC1xO6nw1PyF4P4BXB3E3PWF?=
 =?us-ascii?Q?WZp5X8gDYkVSr6kTMy2bX0vy5ujLsnwHKhtGO3PnWDWQFOJBKb3LzRGiZAzO?=
 =?us-ascii?Q?rLKIswBbxH8hvkj0VMvX0ENYveqtAnxbPs8QF/VAZ/6XYytW+c/3yQmLewND?=
 =?us-ascii?Q?me27jqpWghdxbmNN2M9RnJXiucxDtWlGhqshjVly7oP7IAy51p0S1bqY+SFZ?=
 =?us-ascii?Q?ta43cY8SE6ui6TQNyu/lxAd7NaX6mIqQWZx/bKuW4BaHcuBm1iqFUjlYQms6?=
 =?us-ascii?Q?H9+CtapjG8SABUNjUx7Uf6G5PSU9dFBFU8z2WR0rBn7vFptyTYbQMIns16/L?=
 =?us-ascii?Q?BHbI87lC+jYMLmk=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(36860700013)(35042699022)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 16:36:28.8166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3597614c-d47f-47d2-f753-08dd75f258d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 16:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214462

On 7 Apr 2025, at 08:08, Chen Qi via lists.openembedded.org <Qi.Chen=3Dwind=
river.com@lists.openembedded.org> wrote:
>=20
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> The functions in this bbclass make running binaries via qemu user mode
> easier. These functions are generally useful, regardless of how this
> bbclass is inherited (via "inherit" or "INHERIT"). So move it to classes/
> directory so that these functions could be used by both individual recipe=
s
> and other bbclass that are intended to be used via INHERIT.

Global INHERITs are typically used to enable specific features (like buildh=
istory or cve-check), not to simply add functions that other pieces of code=
 can use.

I agree with Alex, if we refactor these functions to make them more easily =
available outside of recipe-scope then adding functions to lib/oe/ would be=
 the right thing to do.

Ross=

