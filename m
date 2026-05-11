Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5ACBCD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 13:28:00 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50279.1778506073381353581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 06:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=dsiSqA9a;
 spf=pass (domain: cherry.de, ip: 52.101.72.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyOh+I6VeaArHSoOtLbx5iWBV/2Z3rJsf/ZHx1IUOle59IUUpoZCZukJA47OOEHj88fbWbloSzuQEJYGFiis/IPKLi3nzFs33e7i2sTq6/WIjZ48zpISEbtavHae3lHf+MlODGkm6NVFs5skdb5yLYoG+DhMCZQtr37qzajO5/mt6u170kghT22Z6+ip8Ieier3mzHiNgXGVufZFE/yEBl+HiYoc//uxWuJcIEsrACzGYmpvnyd0ZeuXxlTqjoApEGmBKHqd4/Qtg6gIKh6XGzIcV87KiWgamnMAzD+FWOYdbLGyD0aLyyu/pqsE3+FitvB0xWF28+OyFxFvkzeprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIl/1/OZavGSnFHpmk7rBC/rwwwH2XW/h/1pdH8KL5E=;
 b=Prsnxq0A36U8InzF2eEA/+Fm34/9JRXkaAm/HgeVXcuRwodXgjHYzKzg6CzHGFQ4S+o8/r2qVTo7/1w2t2E46w67Qw+1ZksURW7uQc2tKC3/B+u3B7515wBT3LUpdYO6s198CPMKQgRKQ5WFUY2OxT2Su4vbHg/DEm/o3Yivms6tDWWfaYjupBquSz14X9rGHFL1gpJq85JB8ZnuwbvCu3olM3rO5EURXNGpfkeCiqrGcLsBN5MdkqKdo2kGVbxYFSzimeY1V8mJjfN7REHj0X1Xc9d7ouMDew2mnRF8i65hwY6JCjJEuClK+4yYfX0w8wOhCLEjwcED5CXnkqz0yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIl/1/OZavGSnFHpmk7rBC/rwwwH2XW/h/1pdH8KL5E=;
 b=dsiSqA9ap74E9mXk+mzA191uc415SOHP6en+Xzdg8bwkgyWkyAuYcDDf3ehA5v4oxJCsbds52LsF0nYljAXUvpQgZ7APC2szYxPuAPrdTZoKDHsfap5eIup7JBVLut3hFEYQ+M2Y7Qb9+gQI2cKWKsBwNN7+IH57f8x7KszQ6Ec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GV1PR04MB10992.eurprd04.prod.outlook.com (2603:10a6:150:207::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:27:45 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 13:27:45 +0000
Message-ID: <5f42f257-59fa-4085-a42c-7cbe55472567@cherry.de>
Date: Mon, 11 May 2026 15:27:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ovmf: drop gcc-12 specific BUILD_CFLAGS setting
To: =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>,
 openembedded-core@lists.openembedded.org
CC: thomas.petazzoni@bootlin.com, khem.raj@gmail.com
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
 <20260511092935.2631121-3-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260511092935.2631121-3-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR06CA0196.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::17) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GV1PR04MB10992:EE_
X-MS-Office365-Filtering-Correlation-Id: 19f1cd6c-d66a-470a-0b04-08deaf61165b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|4133799003|11063799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	L/Bzy3lJ3SEmsPVtQqYiUbJQ/VG8ZMoeETTYakwmmOxqN6ClZE5MKgRLZl62un9TzUfC6+qWYPxPF/to4toJ/83Gkk/y8XPNp0W6cgRYWMJLGFAvSoXpMkF2/HUDwePRVWaHbYBWysWZ3O7kJzI+UAOlgTOEtcH3cR0nY/LrbkpufGjSoMw+8tkc3gxpxEiF7dFWqGg6HxBIXc1klYgZQC6AdcI/N6QLJYeuWi+gJzN2RgJoDTr5kVTbUaIdAGpt4zWkggKbguaBHLlZwv9RBCLXv7Tx2ek0MkdwD0anz3wqfVBPSZyUz0UhWjMesvDNu11lbInm2iVdU70OYLUSYISca9wP+A+EPpo/LKTQzgbUy+iiINE/WDofZIXVbrpRvgJQMaZS9o+k2hJJd2EvYf5Uw5JDEi+OPANLltx7tXY+UVy6frFbTYa5M8ELizyd6p3RT3+3hEnFAQ55eXMTiAnsPuVaGVI6ttg4U9C18PlxmjzfWQIFkrKd+b8XhhkYTFUdSgKFnX0sg6L86BlZ2KUwjFASYLAvYO2FxsvJx1t1oNuBdrllF05+6dPDcU7bnv3YarxQYtT1kp5luMHItxUkVzDUxKzLanK1sGVGFVWTiWD5bQ0tHfH7UkDLYfNjDokl1C2/wRHMUiFujr3aVw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(4133799003)(11063799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gmV69WP5r/g33AlITziKH6O6CiEK1nmz94kz1BKFyFcsCkXs63jnAr8Qi3py?=
 =?us-ascii?Q?w2xxdjbj3ifWfptpvuHi8f/YsyaU+Jwh7Q1Q8fVTQxSaHAp6NRxJGIq8UZU/?=
 =?us-ascii?Q?Gdi3feVR+7Y5DSWmwz+nD470uK+YyONyQLwWxaIKU721TuncDP1DUqRli4Wi?=
 =?us-ascii?Q?YdBZEAvm6jwibHuBW6pYbNN9iV8wNHwGuiD9RPXxCCfsakmdW2uq4DI49+T/?=
 =?us-ascii?Q?XkJEj4gQh4cSnk7dj6MtTzKp4u7LkzC98/do02qq6Yi4QpiYP5ANgrJsl5re?=
 =?us-ascii?Q?GuZgM+gy5I/nQkhrsd6uehgdpycktTuXouzdoGyCqEtjpQIUWPlc5bvyJYOY?=
 =?us-ascii?Q?weRgzep1vYlXT8O9jlhJQ/W7mruJu2V5QFtsFfWxbzfTsk+gvq0lBQwe7+IS?=
 =?us-ascii?Q?+mmyT/Wp4RUXgJSZHhmk/FM2GhCL+wY9pGkuUEVy9jn5hry1Lk2+Mteh87Wj?=
 =?us-ascii?Q?WxLHL1Tnxwv/q2qsEsGvqLl54cNz5H6fMjnE2WtrxjxGUdSd8z8iYZ7NiXY9?=
 =?us-ascii?Q?C7XWx0N1Jw+n6MPBUgLymkbnKkxLv5gJI/n2rDjXL2w2I8uQ5J7Zsq3XpwVO?=
 =?us-ascii?Q?9AKu+LIvtRNLugZ2ODejrVzABY8B/g4WUu1FC98MB9+8BMX5zudaNpghgrW9?=
 =?us-ascii?Q?ju1nZWOWKOQwu6zbPSEtgR++/l6HBgf0GgjvuGLtq77d912lPY56/K8j3/No?=
 =?us-ascii?Q?H+CUI6H3T7unwJX1jhnXZh0u3ZnSfqxJ8i349An/gZsa4F0XfnDjU7yRKoqJ?=
 =?us-ascii?Q?4Tu2LZo2Br1HeLKCkv/2psy5992BVri8sw6qROV4IF84U1mZG5l7xIDSycO5?=
 =?us-ascii?Q?qE3k02gs1FPAoxCw/z0B6hvfsa6h+SnaP4rdjmFEefBanOOTvO3+1GV+aeVO?=
 =?us-ascii?Q?h2iLbvjp3Pp/qpd+kGtBUBZLFDZ7NTjVYMUkYe7C4inKMWa4XWuq3wN6qP3O?=
 =?us-ascii?Q?f+QAeIYli1VodzDlBWXMlZHUI0zafgUayuENp7y6WK3rLiwjoDTFLL7oq1M1?=
 =?us-ascii?Q?ed6+xWeXpqyt4nOftzA9v/3TXjuueDfazv/l36bf1YsLiHEMP6pzc8bxOX0K?=
 =?us-ascii?Q?Knn7v9TLWmq6830eaUgbeCsB/nqADZ+BOVutTLYfB6FWmAGqKj+nw1qhma60?=
 =?us-ascii?Q?YOMwORvsw4G3uLAseNxlfjmURTeLcq5vlgaq4xTGFx+okkQYCA8+zmsRR3pN?=
 =?us-ascii?Q?1p0Yv/hmI083luuKZcgIjS+HJihMjvwAflIrD5BO81TWeKxpNxPTwaHFrPRT?=
 =?us-ascii?Q?/KeGD0DkMjvzWEHcvCSI6fVDuxWQYebHmX3jeZLBcYjQKxQnKU09sZanfxAv?=
 =?us-ascii?Q?OeJ/0q8UJPd2DLp1k9I4utzbOY9wCKEaDxHOnQXtYTglrf/YDEAGlHRAdlY0?=
 =?us-ascii?Q?/wo/xWyTN3N1o+7dJ8IMDGHpr/kl9AP1+7SdJCg4Tcp2Pkjpbigw27MaYgVw?=
 =?us-ascii?Q?GjzecxQPhbXXABusfR8og0KinIeWY+51jcfpPvwv9GhydoKZvqVnSB8ZtkRT?=
 =?us-ascii?Q?rkZC3Jb6mfkcJ1tvF2nytpw5HtreMooHuiFY6vkN/SikvqKw+seYfTByfAJ4?=
 =?us-ascii?Q?jnm7QvRN5Mydso9qoFEwXbz1QonMXjAu7AmIGgUXJ1Ae78g/sd/Q/ySq357a?=
 =?us-ascii?Q?NH1m7mgR+j3xoLTT+NdKGSrEY55o+jEeCNjuoUu/ydMpscWQZLBEIY+BcVbS?=
 =?us-ascii?Q?gSHAG6141riifGb+lVShxZ7f7BvkgU+RCgdSQEihqL6uGnSkAsF/5zR/CM/L?=
 =?us-ascii?Q?D7hM4cJSYQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f1cd6c-d66a-470a-0b04-08deaf61165b
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:27:45.6361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIUOVToIS2CQda80wIBzEANciuC1a3Xa0IJ1nNqjOKGWMjKVHZe88AXAAbCrylxNFeXYZy9Yssx0PLSrtWMN1PETdjB6GqeRMqr5t7/wbLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10992
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236814

Hi Jo=C3=A3o,

On 5/11/26 11:29 AM, Jo=C3=A3o Marcos Costa wrote:
> This was handled upstream a while ago:
>=20
> https://github.com/tianocore/edk2/blob/master/BaseTools/Source/C/DevicePa=
th/GNUmakefile#L27
>=20

It's not because upstream supports it that the version we're building=20
has it, so pointing at a commit and mentioning it's part of the version=20
we're building would be nice.

22130dcd98b4 ("Basetools: turn off gcc12 warning") part of=20
edk2-stable202205 tag (and also edk2-stable202511 which we currently are at=
.

Also, unclear whether this single file is the only place this flag being=20
set would be enough as the flag was set globally and now it's only in a=20
specific file within edk2 source code.

Cheers,
Quentin

