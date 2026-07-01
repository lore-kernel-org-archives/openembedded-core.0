Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5163DC43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 15:04:56 +0000 (UTC)
Received: from relay-r17-hz12.hornetsecurity.com (relay-r17-hz12.hornetsecurity.com [94.100.138.217])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47492.1782918289854393682
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 08:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=QYxPTVgV;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.138.217, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate81-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.159.87, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=8CbGUeIG890i2t0ilU23j0spWQ/4CgGxUBXy/9v0Bkg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782918287;
 b=KS0YG1aLMueo/8DFlXQ6Su/Z7b0o2A8CWjf9FyD3phI8p/1kecb2cagBrbCHV2yOOBE0J72o
 vmxrl/NlhLSKaxDO1WHqOzlFAMJ1DSnJeIvHUG3AJQQq9l4m9IJXwwoJBdsol7+FLw/vv+XdoGK
 2176FT+hCoijZ452L6enQePhDxHQGZgAZsYAhCZupF6gL9CRxH7QLRWQJsvqc6g4Lf2laWkVUbA
 3BOA2VIZhmI2adtfakcul1y2kR/BBlZW5L9tSbKV8PpYTV8yKJ8pQPZ2xDL8K/JXJP1TP59NfZq
 AGtEZkFHN+ULGj41MZFDLuJaPgickA6D4CYulBFKftzUQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782918287;
 b=j2GXmLRniXixDbKV2k0rc5WG7LqT/Ct/CTuG583jo93QvlbBvZxzOOeabZVB3OSzYPImYSkx
 JnGH67RhHvSZPcgkSsvL8PgAjZP20rgUd/CMudBMArVCCubffQUPSZ1mI1MWiFkF7HOHlusZEJe
 KR5/D9bYiN44uUFbW12JaVVW1fucB6v6RitVMqvGvfvoPwwTnmrcBbWZkhgsTdCdDrk+VTcBJ62
 dHYnPIM9sf16ZrLSl2nu87Tzn9rprJebIbFtYzkrCln5OXncEH/htA+ROK8rHM7AJLUDv23Oifp
 afhSvFS7aTs+Sjkf++S4EjhmQ4AVkNlLktclolwCsRqaA==
Received: from mail-norwayeastazon11023087.outbound.protection.outlook.com ([40.107.159.87]) by mx-gate81-hz12.hornetsecurity.com;
 Wed, 01 Jul 2026 17:04:46 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzGNdUUi4tWLnK5UpdfHmmc5FwQTerDajYxEqmXehTdmXgrfOwBct09e0fOh24cwF1WUCctW8UlOYKhWZdAfVevKZUe14kP+oh8WEwzT2Nx6MkD0J/w9SFFQQ466Lm8oBPm+Kh16J1L/WEj0w7aQQZ4BmuR7FEQvtP6nFNNUkQ5fANYAeyECKBxU5zdx9F+YatNxdgsyUsmWpA8oJNT915ot/Eil9hDWXneXBsASNs/39r4Yq8deNmnmcOW5ok3tEibilg2suGePcFvLaHGb86swiHpDXpzRnbCEX9+nZe4PbD612Gm4OpE0/aWmyEabPOVlwoIvynvBiE4PkWhWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CbGUeIG890i2t0ilU23j0spWQ/4CgGxUBXy/9v0Bkg=;
 b=NyPhkwO02pFDEwDd+XPqCcclDhsYWeR5hA2v3sWfGngU2ag9Fnmf9V6dNq/6sVk3cJy4ohClbysZirpx9Qb5u2Mn3bi7PUuVQSAb2VJ3+rbt6Bxo/XlQTBkk0q1HmIaFhZwrEkKOBbuYAs7S/ZjFJJnZldEZilo4cbO2/7k+HcmaiKV/gKjb7bwagjoDfTc0wqiSk33RICpcb9CfeIext0ZD0YeMe97B2NaSa36mmzzIKiZJDM1wVbVlXunqRcWJ9zhLKeAJWO3ZiUjIZ6dtI8bGvItQrIZhdWirLSlo4bppZjSaqWqPlrlpOaovxx/qdwuiqJ3da6f1iZgZKcQyMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CbGUeIG890i2t0ilU23j0spWQ/4CgGxUBXy/9v0Bkg=;
 b=QYxPTVgVxHZeCzIvZnlDNI7vut8WaC+sYjyE+XORFa/g5eFlOtfPmwzFTB7cunf90t916H/J03GF4ie7288k2uKo6uaUjD39UgriWD4b9P1mBRBkfbM1pkiGAbHQRJKJiz1vGbu3JyzEN2LSIY3dBQnGtxOWCbevYVPK+GPf3WEZ9kDIJCAIbcpK316BEYI59QXBXLD7pclUON5D8vHODXioYCS+Gg0IJcyKt+ZkhNVmTnoLLjaE5/CrxKbTOPPPWb1j1/d+8vluPZj1hht+Dq7yhkDHC6Y7izFy8rqT8Oy5N7+Gb+zEgua/TvTrzqnhuMxL0zkdo22bm6qPo/45pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by GVXP192MB3339.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:2bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 1 Jul
 2026 15:04:40 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 15:04:40 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [scarthgap][PATCH v2 0/3] dhcpcd: patch CVE-2026-56113
Date: Wed,  1 Jul 2026 17:04:30 +0200
Message-ID: <20260701150433.3889478-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <239971>
References: <239971>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|GVXP192MB3339:EE_
X-MS-Office365-Filtering-Correlation-Id: 44abf0e2-d4b0-42ba-334d-08ded7821364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|10070799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	aTrCeBAAKnNGOcyw1ElqJliFP1hucjZX13MwyHwDIK4PfmTv2vLgoANiEN2jMrcDUTjfH1Fq3fnt+4fqetVswjBuMoSIjjEQd/GVv4GKl/d9BOpmHIkRuf1V0yqXB4ek+gvSHsZVMRGZhAXFQvjYtu3kjAlUyUDyKDPoFxDwm7/JzJXMWaLhL1nYIOdfsT4U8YqUZ5dRUlLD8Odzaz5vLTGbxz8BD2xKGR7K/mcNVWAWEvr04hZGDduMVGwgTDywIqe4wGyv+yiIVd1aw1wtshv8sREiwy6hyrmLBQHV7BM7PJVRLdWtPG3LhVc5B+Fi3YfVzn1A2F2eab5LITVaQ5PP309z5cpwf/Zm2CJhloeFkw01PaXP9Vf7NBv5JbjeEk2RmN69YnnJCD3DLtikuKl7/qWZvJwyQ8aRuvYAmOlBtyVlFXKY+3bg5IAxoi8gxo8Fyf/hJCTiXp+QHkHYVpre3BQ093SWpE9bnK10gE7ulqG3maa2FwRP34XF6sHSwWPsdVTU5+P7QQCSfNASlOsTl4xZGO3AvarrkB3pbrEtZ4RUwe+odqWcszNrW/77YKcEpaNpqrsaT4JHKvr7eh+3Cwig6S107YWkJZvjnmHq9spVdW1UHOCU0Bc7qAh16fae7VdQiPUaP9YFoB9Fh1gfNHgEJFs/5tD+tMlcQq0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(10070799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5Mckq65j90quIKlyqe4J8sNe0/OXwRxDYtfDpzIOyiWGSoLS4190s/4JDyIk?=
 =?us-ascii?Q?ndLd4RJkAJeWxbONNS/QbLjMS+QTpx599WZXv+4lNm8RpW8Lxisa6bGuUlFO?=
 =?us-ascii?Q?z4R0oQYL5wWM815rReChYqyOHT+JS9omlmUtjzLpkxAGnCE2Et6Wxqqc6jAa?=
 =?us-ascii?Q?b5vxfn/B/wKKjTZM6QLhwwSK3MEgk4OTDvwLv3Z0PoRjzHEn6omEz8PTJbFG?=
 =?us-ascii?Q?3JhaweA4tubxxnamjcZDLuc+WoatTEKGwsN6qE5TY4h3oIqvO0MD0dXEVd7y?=
 =?us-ascii?Q?mlrXS85/CodboX97QhjNxCak4iCoCulub/raNWS7RYXoQn4MHqd07LAhdOVO?=
 =?us-ascii?Q?gRuFswA4BJ3CZ+JWDnXWwrikySM3FfTnQIArbrN/UtKHk5NQrKGqsLVAi2nT?=
 =?us-ascii?Q?Qo7YdlU1eWuUxO4OQQc9a4T5tgOlnBFmwSCd2BlNGys2UBTYjmAIM6zMrHbc?=
 =?us-ascii?Q?ONBKSMQ5G6qb0DgAllyJLMFVm6PhsCB1FcDF9YTBDlt+OS3ESQxvi/Z2zmzQ?=
 =?us-ascii?Q?lKgCPbV9VlR/yr/nAuLjlywqM7S90Oeqppwxc5GFI6B9XsBAulT5FyuBQhfp?=
 =?us-ascii?Q?B9YNlO4np19AtX5rCMpfM0iAecfL+zDHGUPiKVjGZ45RdO8cDjKNbuver+pA?=
 =?us-ascii?Q?N/lU3OIRRfCIWdEHFvTTEUMfGSyRJn5xbdCgZawCCkhCt4OvX1lWXNy6b2GT?=
 =?us-ascii?Q?NR8jqXzA5QRHOK0XxZ/MiQMoco358vM0a6Tgn735XUc/JkmPA2PRcgSxiwD9?=
 =?us-ascii?Q?2HDfBDwnDSk8SkbP3iMP/Mz4TPOStys05V1qBCrGIPJGkl2EHSHsTc4VB0y7?=
 =?us-ascii?Q?CBTkgb8r81tQraAKf1dVea6hD+NGZT0zcpxk004AEFmMoF4hu+kyDapLiSOS?=
 =?us-ascii?Q?E2vjyCU50zNN2i5dAqweD+F+YtOozRJOsrF0L+9Y2k+h00o1GNBUnx+y80am?=
 =?us-ascii?Q?mhNMOdAO9eZ7nL6kZT87ItHOq0CUBO+DP/qcDbOUHXw3Ib1I0bKiQ5olcvS8?=
 =?us-ascii?Q?ZjLuFVVBttKYMRnI8qvWd1WL327qGoS+OW/oZKXMUDt0q5DUnX1oLPSqPsn+?=
 =?us-ascii?Q?zETFHB7kPXgyKA5Ue8BhbmzChXiMwvIsDMB1ZoSQ32IMwSpz2iWvkbbfC47h?=
 =?us-ascii?Q?fmQ4CGBXj+t6BSxYrNNoBmKSOVEja+ZdQdfQdLpgoJSUJWUhvlv+JKNFrjx8?=
 =?us-ascii?Q?5j1EvUh8nNmziny19gJgpVnY0jMUTT8Oys4ANL9h7IeuZC6uY31bejBFcAy7?=
 =?us-ascii?Q?OprtZgGgLO3nSy1uQ27E2VBiH4PTC5pgk1pSpf2enrbmV2CqfWhZH3t/oDWG?=
 =?us-ascii?Q?mJQHlkoTVhxvnVmJkWb8LZ8XPzsOvbOruQE3v4AjNi8TR4xkw3rNzvso8rqj?=
 =?us-ascii?Q?u7AjEj4xV8luHMmT3M8y61bWGL/LwJrLA2/xCcj2tt1YbLsNY/UXRYxNSje6?=
 =?us-ascii?Q?ToCDt26cyiq7G2RDrFb/aw37h558iuTyKIB8WyBL3tT0eDwvu7JOq+E/epCU?=
 =?us-ascii?Q?EqhTgL8JkzCeR6y/k8BVzfO0z+Wk7d3/vvlcZKUo77t+DhVNAetFfekUNN+s?=
 =?us-ascii?Q?T32r1QhpRdAPdqfI4tJViRAajbjdAX2g/GKRblcMAtIWuDDyz5iJS1XOcLw0?=
 =?us-ascii?Q?CvUxwjoWOmZSq8QLMVkk0dxWSB4cVojb3JnS/3VrcGRymcVFR116YOQ2Tvs4?=
 =?us-ascii?Q?0ZDcCuOdbIlmoHjBnXiAdU5DTnFo+lM/rBMi71MYn7jRxpXztNT6W6mKWB+b?=
 =?us-ascii?Q?yoVcDOLmWq8s8qwiMzMWTOWQEFtQjadQPCRzYqa+UqedCRdWuolDSedCO+l2?=
X-MS-Exchange-AntiSpam-MessageData-1: zTT1VbzdXDVNAA==
X-Exchange-RoutingPolicyChecked: 
	nXQmSURT+009R0MGYiuBLfgGzHLye1ys1PDPRL3vKLobXNMBjCSEDbdwlxn4efhFZ5gY21BbaEKdRERBgXsmYpRgBwB/KWn94Nr/mJde6s0zklBdGXT9BBlyYyHyaOaOgsGBHTh+0pzORtxJJbEeO8AehZh+Iy4xebGhQ1qjWz8icne0lVxBLjSHRmzdtPIbGzNega6Fwd9bU0tTy76tXX8MI/lkIDhKOSGb2hQt88sIsvqsHaRVMaE0PZR/eQrlnSqGFm9GKuQZczkFTenSjznQFoI206qNeeFg8kheAvYXLP3PFsPnps03pv4wSOffh8y5ZO58/ge+Vlry9BeHFw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	8/+q1GGJ66waGsUW1PAwl93mAajFlgG73KNeNWt8Q3BKLJJm91k2ONJQNN0lYdFN3f3BiMmt/qjUdVc0+7CfMZRqxpBcrP+I+HqEsucJn7A8H5z0gn2dQ5l0OkCtd4IOqzh/Ht8y7mNpaJFbPzSr17HcxbugmYeefWNn+VWMFB+vFKrPuc/P6ZJVqgSvo5MYGjBycYfemDwZJfkncxad98ZZbhJQl5+hUwd7auSOWMdM4vo9gjqtjd8N9UbH6wem+FCl/9PUv5/I3l+6PBPecHc0c0vMS8dzPpLn8ECN472bVdhATzl32Ua9PKsffJraoeYJFV6+Zu0xgStUTjWTHwLGpqms5UJ88IdIE4On0r7bGkvVwALnAzglEFCbVI5y+05OF1KhKwmj2Wz+8S/yJzMlNo4GmM95waCYBGHOMctVqcpDHNE1AmFsdtM0oSUUwDc4AQO3tDJGQsymesDEsAHbwZ83TIsy8GBezInXB26BOMTkBNxGD8f6KHDaIFiNhRlklWlxjfMY9Q8nlLyCCrEvTx6K4uB0Wc02bxK6ZumaB/OxTu3mkTkoJverm/UfczHdQGS8vPdUBz2Iv6M+4HPHlIC/XIsjw2Byxt2KmQsI+OHyHVYEZ5rOUHARRV/t
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44abf0e2-d4b0-42ba-334d-08ded7821364
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 15:04:40.7858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cf2Jv3vbZ1OKdH9gnShXlc/yGLJOMtWOR32nYrl9CbO0AR35/qpD0b3lUtkmWv7WkXmHZJJBBQAoiBnApJ1HLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB3339
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate81-hz12.hornetsecurity.com with 4gr3G35y7Sz1PJ6C
X-cloud-security-connect: mail-norwayeastazon11023087.outbound.protection.outlook.com[40.107.159.87], TLS=1, IP=40.107.159.87
X-cloud-security-Digest: 7ad968fff7bb32fc045503cd34b68936
X-cloud-security: scantime:1.240
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 15:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239984

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Changes in v2:
- removed CVE-2026-56116 patch because the version is not affected

Theo Gaige (Schneider Electric) (3):
  dhcpcd: patch CVE-2026-56113
  dhcpcd: patch CVE-2026-56114
  dhcpcd: patch CVE-2026-56117

 .../dhcpcd/dhcpcd_10.0.6.bb                   |   3 +
 .../dhcpcd/files/CVE-2026-56113.patch         |  92 ++++++++++
 .../dhcpcd/files/CVE-2026-56114.patch         |  34 ++++
 .../dhcpcd/files/CVE-2026-56117.patch         | 167 ++++++++++++++++++
 4 files changed, 296 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch

-- 
2.43.0


