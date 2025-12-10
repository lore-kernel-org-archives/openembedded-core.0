Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AA2D3C91E
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 15:08:34 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17747.1765379308439964985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 07:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oLPX+Vz1;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oLPX+Vz1;
 spf=pass (domain: arm.com, ip: 52.101.84.27, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AxUdA3Suo5Y0LUe4nxSJ+jal5keD1Tcy3XBOFS8eaSJSwT/j4Ml5RgQCBUzdn52ELG3cDHgs+WhPAngMKCwqZxKm3Hj9SdbPDJ4mVpRe59NwJtyCvo8dVBb1OtY7+TkekXSiZFMhTpg9toS1XuDsOR7obFUWX5zkGNRIViB0ei60xOu+PLAjZQIazmgXFFwpE/94u9rrYJOfRL+ZAQcrNat+eDuBSNDZ7pnyaaVyoyDkmMM0T+ggxqjLoIdPKsTrN/to4x9lfE9pHiKWM8FVuUBbeKplPV4qOAw+gmRKPnVrRUa+rqk3kI1j55QX3cXyb0RtX5EwPjdt/PN6dVdy4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVQquIv2y9cJwL/dOgN0C05G0xhJZ6MP9jCiW1o90ZU=;
 b=FS8FnfW0Bqwm+NVLmx8sL+s2UdaNNmmOckdASGJZCE7Q19RrDZYG79/6mh/e71b/YVFJbfMk2O7Ao2BeMLx6vu8V87wrdo2yq0ITKpBloeq0nFAClKNhBRnFC4lYiaAT/9iM+LR53kBIAilLmg8MyXeDe7YJBpw2KOuRV9RruNJDn3q5wQsTtMbRREv1UWhzzV2D+xBLacUj+nzyDfwKy1bSPyzzdnu9zDiEk0sEuVtYjDXAQ+czMzbNkanh5Bjjz1DWU0UbAKi+oVDB28MXXSRB60meU9hoW5Gn8/kyqv3WTDmzCSDZRtqvY212d7/aTFAhQC2RURk0Fi9Lge+X1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVQquIv2y9cJwL/dOgN0C05G0xhJZ6MP9jCiW1o90ZU=;
 b=oLPX+Vz1+xuQafxjfHBPIbr9p52qOdvgYPAQ0dq1I85hZoTQAOnMRtWbpBjlPZ4lmaL6GtSPhJ+Mj5TAERL7JndnuAoYDNpto8pzT9OscTuII8++4Mw3H5pGLMvesZ52zmkqtglQw42AcN5u4JBYKI+9cd3yPzW//iM2SoL2t14=
Received: from CWLP265CA0535.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::7)
 by PA4PR08MB6239.eurprd08.prod.outlook.com (2603:10a6:102:ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 15:08:23 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:400:18d:cafe::2a) by CWLP265CA0535.outlook.office365.com
 (2603:10a6:400:18d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Wed,
 10 Dec 2025 15:08:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 10 Dec 2025 15:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3NGjdIxZf+qgb3RCPnzTCjtuFOrEv69lMB7/qRizmUypDEJ1PS5ylLDeTlnJv+oKGLD3Q2VPJaB9FIFH77i/p/QZqXzwHbeKXUH5SXl94+32GuFr+XvP0th89C01TEfwtlExBFVbUXhs86pdNKIcNJN0uO0mBJ4lOnapKUbpRgKtYEp4BisruGJwd2xpd06oJ6YQ2ZhMBKOstf3h818E1WRsHeL0YWivM2CDVe9tbrKHX9qkU3Old84Go13RoGNOol22j/YNr7KrVV760EZydHjTiDf3sUlVJMIpRqnfZ5KdZw1uhHzBSVWi9w43smMaQq1+gQXj+Ic5qcXxd+9Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVQquIv2y9cJwL/dOgN0C05G0xhJZ6MP9jCiW1o90ZU=;
 b=VjNhyYIi0LP9iu1pxd2PYZXLqbigHPvX10IiJ2bLUqklnaeMFl29pVr3robwQIRUVRInlbuqynDJHTvB5NaoJFr1R7wfsi87I+1svW+IKq4eALtyvIF89E/OamBI86J24DLu0bbw3aWUrWbmkCUmoEgERkjuoeg8m96AoIAnhMuXdwOMWPRwohOLdbfgmg3Tdi+0RdqJKD0Tv86hOMUSbGwLSbQLn4ADRhAeWd22NjCESPkHZ8robDm9/IvXbZ4BYEFKEcUBTJRUPa5fJNCZ6TnyUpD/TJnkSChI8rUdPfRy/gcJehnfXFiSKpAmC3gKWDaFBV1G7tp4UQGIH6r0iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVQquIv2y9cJwL/dOgN0C05G0xhJZ6MP9jCiW1o90ZU=;
 b=oLPX+Vz1+xuQafxjfHBPIbr9p52qOdvgYPAQ0dq1I85hZoTQAOnMRtWbpBjlPZ4lmaL6GtSPhJ+Mj5TAERL7JndnuAoYDNpto8pzT9OscTuII8++4Mw3H5pGLMvesZ52zmkqtglQw42AcN5u4JBYKI+9cd3yPzW//iM2SoL2t14=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by FRZPR08MB10950.eurprd08.prod.outlook.com (2603:10a6:d10:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 15:07:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 15:07:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meson: upgrade to 1.9.2
Thread-Topic: [OE-core] [PATCH] meson: upgrade to 1.9.2
Thread-Index: AQHcaTM4hsWkcvTRZUWC43ys6p3SWrUa0GEAgAAqhYA=
Date: Wed, 10 Dec 2025 15:07:17 +0000
Message-ID: <C690B7BA-DDEE-49E6-A2AA-C40B18E80F13@arm.com>
References: <20251209174220.2972106-1-ross.burton@arm.com>
 <DEUJGY7DX7HR.18JETI2LY83QZ@bootlin.com>
In-Reply-To: <DEUJGY7DX7HR.18JETI2LY83QZ@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|FRZPR08MB10950:EE_|AMS0EPF000001AE:EE_|PA4PR08MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: 389ad009-0d6c-4518-e5b3-08de37fdf687
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?Zxx6kKwtFMnq/2ivUhWLsxWvhq2AoAgmBO8m3QULoFmr8WdRhkxyt3czkYha?=
 =?us-ascii?Q?paFfJt2cvA84QhpeNAg+IqUPtgxLgmVB5YN0hl38m2OkOvFMWwBqbxTnhi5f?=
 =?us-ascii?Q?asB+vy+WNrCdp117D9C5Jw+O0RU+eLVvCncUWk+x9AcGdN3qMNQKfuuN26Ym?=
 =?us-ascii?Q?VDYrULTWpdBbHAi+p7i7aUOO6vsGBoTlzWT+hz6iP8K36KNEBO4AefWRXr3I?=
 =?us-ascii?Q?Ya9lfMqw5MqaC6F6WW15MqioVTKoCk8GLwez9ZpMQtPDnxUIey98O/EhIXkj?=
 =?us-ascii?Q?dHL0+q843xPfckZzgjBJ47sCUvhk4YaUxTuSJd5WNDw2TrPOfKAb/0lE/6/P?=
 =?us-ascii?Q?dADbGrOjCKUNB5jtJMoghAKrtEpVM5+HFrjkPmA+H8n3prAeaqwv82uweut5?=
 =?us-ascii?Q?VJL68IARB0eumzGLv3d4dFcoOhzoVtx4zuIWZHG97TMlx5Kk/9ZynHg+vJzm?=
 =?us-ascii?Q?RSKnLRf/DtGvOjJwCACWFvCnUOnmoElCV4nX82twAiiJ2C7oDqpKz/oGDLeR?=
 =?us-ascii?Q?ZhIDHv4AZY99F1f8+gCXxtMrxNVn5aNZtrBcBgIcq6JKb+mwk5jCx56VLBES?=
 =?us-ascii?Q?5sZWHzsDqrSZiWAUoSprD4oS/gNPm9DMHMZftNvML9AXba7df1iZdZQhVcNc?=
 =?us-ascii?Q?VIzaCUMvzyrHvM0GRQLrO+iqOf7gyiE5jMExFs41S5ysn7oHG72nXbs5zZaf?=
 =?us-ascii?Q?4NUVcJ3R83e5dtIMly4fxveKJAPG6dYTZdovd4r0s5JIn7hqCT/24qaG1Y7f?=
 =?us-ascii?Q?bPQambU7oTAUOo358ZoHAR4q9JTsnBRRQ/U1j1IwUOmRoEcF3Irsq+0RdJkE?=
 =?us-ascii?Q?rleRLo+Iy4p0+FcHegQ504kA1tngjnSX+rEuKk5aKU+FNPpE0H/qiXI3+h97?=
 =?us-ascii?Q?rXf2CXp7Wgza/0KPBs5Ayx2UWUKQ2D1Rpnh31YlftNDIIKeVMmmV3WkatKre?=
 =?us-ascii?Q?uPgajY3dQv0IYGOFDLo61bO8o9EY2meZuaZRfv/JfY85bNGZmU8hw1VOilyu?=
 =?us-ascii?Q?EJTEXyKZPs/byVZVbOyxiVS1Wli6HPiSBqaYGXO4pdCTq0ULFT3Gm9Fz3PWa?=
 =?us-ascii?Q?jIuRiv/Bak4HBn4ZEbJmzFm5cZajkF354mGwTVS5FuSVtHOKFq6mAX33IBki?=
 =?us-ascii?Q?3luBpQbI7cpM9qVuzwqr4PMzALcXrY1o65FoF2bZ2Nnm7499KC9rLR2cyYn5?=
 =?us-ascii?Q?AN1TrtPbILuc0Y9DORmSpcqMFljRkVokfSgfaKSMHvC6tGRfvk2/Kfl15lVB?=
 =?us-ascii?Q?DTWs9lDJdM/T7WtBtEbONeagx59NZhjXee2lg2xJy2OQpaTqIwsAxH6mVAb7?=
 =?us-ascii?Q?U0Tf3iIiJId4oWMrhmxa1U45jt+EFPVhgQmLZ+q44ZF8W1SgturdN34MH4qk?=
 =?us-ascii?Q?Sw/JIjb68NSOHRRUYe2c8ZBVBhXSnQsHivHERujURgl9O08ugBXXtnr+6Q+B?=
 =?us-ascii?Q?iPztZAK/2jz91fQDzgEWzBorYpz325Lh6H/J5J/b6GpUPi4garbXpkeE5Mkx?=
 =?us-ascii?Q?DQG6Y9H3VeW1j+608hmuQkBZrs67SwUijH0a?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <45BC78DC1A121B4692D24481F19CA94C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10950
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	894834cd-eb2c-46d7-0bcd-08de37fdcf5c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|376014|1800799024|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NJyIFB+95JfTSbPpWwTBWb9BREfk7Hod6hOXIVhvbp6iTbgHnPQL9ByA+YvF?=
 =?us-ascii?Q?pHnKSTlDUW96tWHAOzgxrUcUcARJ6vbhhJKczwJ967YeltWToKaMLndA6Cj4?=
 =?us-ascii?Q?+4pPqCLp9yTpEivVoMGviJ5jo9Grwpi2IAfnUhLMYz8eoZOgrWxYfBuuHjyC?=
 =?us-ascii?Q?zqjWFI7ltViCpICR0biLrPyyrnvvPhIj3KTULwNnj23LlRRbqYW37BaRSsOb?=
 =?us-ascii?Q?z7Ew5vahEz3yi8Vl2zgKx3trhSt9bN3dPR68YBQ//5Ab22P2/LcyigSvkWJc?=
 =?us-ascii?Q?FPrchPhxl+TIEunoMD6tBOB5/Tu8PjF1xLRtwyoR6ZnC0WbnykE0eRxnvKvV?=
 =?us-ascii?Q?eB1B1ujfXOVypEGfGwe0lgfih5C+s8PRdyqbJhS+EUN6XIdD6bvD2uemmblO?=
 =?us-ascii?Q?ZY02XQB0VkkGN/uwg/TWwOkvAQXawUwt7St00lfh5Mf7FhLkp5Lh/SpbHeqE?=
 =?us-ascii?Q?3Temv/jowxmySAJWlX5STxpvYk2tR4dN3BiMRwrF4VAQ1z5O0KiWETGIS1KK?=
 =?us-ascii?Q?uqSCqqihGwAsv9WhTcupufAAJLMjIITew+wJM5V1DwPLHyr7St/sKizPstJ0?=
 =?us-ascii?Q?JZG39KGvUMXvpA9k9wyOlXfVXn5+9fLa3tq1nXlj21995itrxX5i4p6yUu9r?=
 =?us-ascii?Q?3TM9w5R0IKLYFqEHzFSSKG4RY6s6qKGo/mSJMGbaDCPz9m64MNLc7LN8pIZn?=
 =?us-ascii?Q?u20iodUgsQw62EQw21+QmdgOww9wVBCp1AiplXYr4ELMEstEhe00Q2eHGjer?=
 =?us-ascii?Q?ScUlDzUT8E8KkkgecJ5KPxdqUwmYH8QPVxlfjcj2trftEDgkOlqbI8nZZz6C?=
 =?us-ascii?Q?UC87bQZNcouJwnVaNhyRLzlOcXbrTJLOJZ+2DE4z18KKDEt5+gUDy0wdnrC7?=
 =?us-ascii?Q?q3SM4qtLHUm94w+Alz64AUIQpVr5ESgY/dnnmCVZnWxxxfWfcYvM3dNwTCi6?=
 =?us-ascii?Q?4ytkfPtRNQf8cbOuJEH69zq2VgMcs6aY7XOais+c4sQq9lQqMXdj5T5/hhwu?=
 =?us-ascii?Q?hvyeDpqFg7gH6vRwZP2Ryi6rsnJaXc3TmzQc9jvir6K/GgzdRROhILlZoVch?=
 =?us-ascii?Q?luu9Boaj3yExbB/FXjosEbdajO3vxnA1xjICvR3G8ZX9UB7ryMfNehegPt48?=
 =?us-ascii?Q?NtfLP/hs9r5qyJ4b2TQoiI+H96aJK/SeffLh+1Pyo9xZVSpKEYavp9f1g/kX?=
 =?us-ascii?Q?AyXYsP3MiOGCO1NeUiJFP7eoEu7hw1+SEZxJFPBMjIuf4vv28NAq8KaCwKUz?=
 =?us-ascii?Q?fNkv1gLhUzWpgiV1Y71gp8/n8UsYhhtINL7fZoJfpzP12RR5Tj0xwOSwox+m?=
 =?us-ascii?Q?W/KVSfUAiAjB/cqMVGokfiNRE4L3tgpDS+OaMr/8KXI/QhIaO5+BFFYyKgX3?=
 =?us-ascii?Q?Y1mZVxMw0PeUZgQVPoaV1rc7MPsRhLdY31UKbKLWbQBRVDcVE3tDDUyXO6t5?=
 =?us-ascii?Q?Ko4+whzwh3n/CssdgU4Rum4/E/090KorV2FKHayqiDVJ5YgfgxAnItJPBP8U?=
 =?us-ascii?Q?2QK6XEyOQwAqRCEUf0li8PmWmb/7i+pbZ/ctK6UsmnOFA7mWy5RKK6b6/r5k?=
 =?us-ascii?Q?75OrG2HVxoUnAKWRZQA=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(376014)(1800799024)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:08:23.5138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 389ad009-0d6c-4518-e5b3-08de37fdf687
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6239
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 15:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227482

On 10 Dec 2025, at 12:34, Mathieu Dubois-Briand <mathieu.dubois-briand@boot=
lin.com> wrote:
>=20
> On Tue Dec 9, 2025 at 6:42 PM CET, Ross Burton via lists.openembedded.org=
 wrote:
>> Release notes:
>> - Array `.flatten()` method
>> - clang-tidy's auto-generated targets correctly select source files
>> - Added Qualcomm's embedded linker, eld
>> - Added suffix function to the FS module
>> - Support response files for custom targets
>> - meson format now has a --source-file-path argument when reading from s=
tdin
>> - Added license keyword to pkgconfig.generate
>> - New experimental option `rust_dynamic_std`
>> - Rust and non-Rust sources in the same target
>> - Swift/C++ interoperability is now supported
>> - Explicitly setting Swift module name is now supported
>> - Top-level statement handling in Swift libraries
>> - Swift compiler receives select C family compiler options
>> - Support for MASM in Visual Studio backends
>> - Limited support for WrapDB v1
>>=20
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>=20
> Hi Ross,
>=20
> Thanks for your patch.
>=20
> I suspect this update is the source of the following error:
>=20
> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/poky=
build/yocto-worker/qemuarm-oecore/build/build/tmp/work/qemuarm-oe-linux-gnu=
eabi/core-image-sato/1.0/testimage-sdk/environment-setup-cortexa15t2hf-neon=
-oe-linux-gnueabi > /dev/null; meson setup --warnlevel 1 /srv/pokybuild/yoc=
to-worker/qemuarm-oecore/build/build/tmp/work/qemuarm-oe-linux-gnueabi/core=
-image-sato/1.0/testimage-sdk/epoxygccq2bbt/build /srv/pokybuild/yocto-work=
er/qemuarm-oecore/build/build/tmp/work/qemuarm-oe-linux-gnueabi/core-image-=
sato/1.0/testimage-sdk/epoxygccq2bbt/libepoxy-1.5.3 -Degl=3Dno -Dglx=3Dno -=
Dx11=3Dfalse;' returned non-zero exit status 1.
> ...
> tmp/work/qemuarm-oe-linux-gnueabi/core-image-sato/1.0/testimage-sdk/epoxy=
gccq2bbt/libepoxy-1.5.3/src/meson.build:100:4: ERROR: required dependency m=
ust not be empty, "" was provided.

Yes, that would be https://github.com/anholt/libepoxy/pull/313.

I should try and find something better than libepoxy as a test, considering=
 we disable almost everything to make it minimal and in doing so hit build =
configurations that nobody in their right mind would use...

Ross=

