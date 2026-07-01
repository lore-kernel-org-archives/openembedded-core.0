Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F01DC43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:47:08 +0000 (UTC)
Received: from relay-r19-hz12.hornetsecurity.com (relay-r19-hz12.hornetsecurity.com [94.100.138.219])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41925.1782902823813058055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=PxfWUWWs;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.138.219, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate91-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.84.124, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=db3pr0202cu003.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=XrTbo8ygJKXeoMb9md53LhqThpfJOpnPKFPlfHo4fQU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782902821;
 b=tg80wCeWjtdqOa4fjjpxfupMfjfcEdpgHmF92Uit6oKabQTwkJBE+v6Yu6z/lU/YTFUJno9d
 alWWQwF4Qn25nA0SLMydnRHKUpslPmE3A4iB+qN6/wWBFrSXTwiW1uC82gLEqYqmpLqoiH84gJe
 xfHnSZiklWpeI+MLmQfuz4WQEkxfDP8U40Vn5peLIZAuE0UUxAEn/BpESFJvpVWI7cotKGIPisD
 9ilMU+WX7fSuUqHBpkNEmZUTuEqpV30nOa6Q9NJHfrJnDPYiT6l8+xwUgMaMq/EgPgW96PHbnkG
 vUqOUb70l16NPU/F5c3aXl2s0Dt2OHQbS8aNAv0EOdu6A==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782902821;
 b=ExmwSDrkckRLDQMr6CFUzUCrXf2gA5N+05CfgztWORLxUrlnwflg5Re2fiCxjOKqcnaGrAqZ
 sNmI9FiXvGlX72d/Md9n6Zf7rg6xXmw27N7sfJ6Bx7xRZMPS4OB6YMinekxLB4K/d/SWf5sVuxk
 SJxQDinQ41JGIjDjS2tCljsL2QYDhhpQrScM+uMFeix5pc5bvNh6ROffVlxbV9VIBlT4Yvnj7Uj
 rp1CCJsQOS+gHET3A11eWgtJBjcm6yaAz52a+Ob7e0Ag6I+aEBZxCCJOnxJHIkcaZ1/uyxKWBQG
 t/cj5hZ5NZX3sHzP7cP2eBbFl9txFa5kQ5PdL9+yN29KA==
Received: from mail-northeuropeazon11020124.outbound.protection.outlook.com ([52.101.84.124]) by mx-gate91-hz12.hornetsecurity.com;
 Wed, 01 Jul 2026 12:47:01 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5Z/6WtzdVP0SRohdRBQwOJKBOTRQxPHsJohQO9UlKJsUhKyYEL4PCg1PBrbe3GAuT4jNU8cry3e5NCLtxikuXByxNCAZ35HLqQWnGfSEAA6NLyyQOls2fKgWJstZ99gfgS7IuBGoxkgrUJ/cv6Xvm4s6vJyu/MU2ZhAfwOHUTQV/6feYotUgP5THnizrDE+igN66AZeRFg5UZcvkEVz8oc0M+QDvA9/us9YGcmOsXAyJdlnlfrAyXhqGmdf9ES/SE7ROp5HVR1xCF0CBbOy5bq0RPnkWn/PRGmvRcaH/IJxVk9VJj8XAkj9J+yCRwx/L8mzO+ncM3Cv0b40skQhaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrTbo8ygJKXeoMb9md53LhqThpfJOpnPKFPlfHo4fQU=;
 b=QOZBoxkTPX4YuY+VfWrYEeYZZSVRe5KNPjkxmPMuzzjMOf7cMUEuyr869O9OdcwmBe5nh4zXSXCXmIlN989XR61ym30wVbbW/pmCuhkEZWO8tdtAhfZiF5AKAGMHF1V1rdWZl3fytFncbx3zRg0ZQyV5cTZgo9JLns+jqo1Q84GLfwjzD60AKEn/r3thVYMv3j49lf4r2vyPbBrOtzfcnWE43gk4balHGobIFFIH2mt/0OHwUDlCgxZQamuwJDAWV2XkP1dn8TLY3Vy5f2MeeMx80Ax0ThjLrelmvXHc6YaD2wnatrPLw+hO5BKHXJG8ARYT03/tCZwNuHOHoKgkDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrTbo8ygJKXeoMb9md53LhqThpfJOpnPKFPlfHo4fQU=;
 b=PxfWUWWsyKK1VBZSbSwya91yBZndTlnpaRg+AVEE8s4d+nu5QNIgiXgW14hehZYOC9iggszqPLaiIKWomB9Bmgy9MC+MU4WXciX+pLHeAoEBsBp0gW9ZJGKx2YPGEevDiuoSo7Nu+fENmAdWhdzRk+UXp8MYhQtVZghTG4t6EaJCGhgY7qmFx7KdMPZHxxxfTddpnzwhwRP6iw0vRdK36UZF2GGpLGVvvJ8QD9jC0WsfRoK9Dd84NH5Jq5mCgVV5ltk7mAtdEXWRuBd48sc2xBg90flP84ULEoqjGZcT19MvDlxh5O3cihsfdociWmsDy5gCT+/nMG9r0NckAZbMhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by VI2P192MB3195.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:2df::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 10:46:55 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:46:55 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [PATCH 3/4] dhcpcd: patch CVE-2026-56116
Date: Wed,  1 Jul 2026 12:46:36 +0200
Message-ID: <20260701104638.3576579-3-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701104638.3576579-1-tgaige.opensource@witekio.com>
References: <20260701104638.3576579-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0275.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::10) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|VI2P192MB3195:EE_
X-MS-Office365-Filtering-Correlation-Id: 3646fb45-a20b-426d-b770-08ded75e1133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|10070799003|1800799024|366016|376014|52116014|18002099003|13003099007|6133799003|56012099006|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: 
	eU1D2Uv4Kn3GSJcVrYAp21iV19juB+sHkSaFtmXj4/w+ixkbUP26dpTJaX1ZSW/mQyj7BiDD9CZHUceYhukt86KQJ7yqgVk/WITIJCdOhLOBIf8vWxm1fb9R+WsoK//f7qIvbBtKUPvkZMax5JoAxKhIa1IquY4dzsoQMHy2LDbzPBaSoQAzzNCG1jFbTqQEaZGtfzUGCIzbe6UNi0Orz3em/HMJHvPuMLKYZA18o842zi3cusK0SPV0ARWk1FTUqRGv+pORm5ROOf8P220MHJYIo4arUSrKmZBQtMoElwpF/pmZmSXyoz4nfwPRAwTv/V4MLGfBE95Qr52u/HxKWRv6r6zo2LG4vOxEkn6/5URneXuo6z6idxY/Xq1rp+q/mdQmzeeKVcA5FlqD/t+0dDZE6AkIpqc+5kgWvn5TDyeldXkEVb0spo15a6rOruJ/tHGbPsAv/Ks9TskqY2qcCy5C8H0kl8WIYezFc9yImF3fnct9Ya/P8LsqasXVRp7Qy6XblwrGPQw7o+oBOqZnYhH1lvn68hWp7Wu7Ut2fHOCYVGuYIipYWTPjyIoKR7wq3+d/yIYUSW0G1pkMS5Z7P+OpXCQfNGJ34M7hqfuZbg5Vn/ZmK0y6nqFTeejRiaDkcQNQwCaCyBgLyAWTP7WYTTZG511AJSvMGLWeivspLiE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(52116014)(18002099003)(13003099007)(6133799003)(56012099006)(3023799007)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bbgp/k0oGIYISpTC417RUENaS+zh9SQdPpNSEQrOYpCAjkqwhy7/CYSaAmnH?=
 =?us-ascii?Q?wayr5m/HsWr29hfcIHTJ6liI4kYP6DxwA3sBbknLMF0EfSgkl6IwLmn0q1sq?=
 =?us-ascii?Q?z1FCwok8teu35jUCgHhWa0mjUckeVgMBCu+/gk9JwK1SaWU5UHiQhrwAY9pr?=
 =?us-ascii?Q?aq7IkEANOb0mcV9dEDbtWChZXbpEUTkWck5DVlzh67xWIGJ7VBZfOB5miOr0?=
 =?us-ascii?Q?w1eM4WRX4riExuLDIKx6Uj5CzTCNBwVyH4iIWJMYxPmw959Xho/C7ypwnDQg?=
 =?us-ascii?Q?jr7F5zKxaLxzVHOHNkUsG9jeTj0iA1Xj4xGT38HYPNdhaRMOu3TS+TgvMDx8?=
 =?us-ascii?Q?GjrbvB+lfb2B5+4wghRRm5mrInnpj7ipFePVFtoDlPwsOr4x40AWA63pB92f?=
 =?us-ascii?Q?otkEJAogU/8D4A5yXmExURdVNjy4QCU6upyIaHGZREapLcRVk4CF6ecaeSkJ?=
 =?us-ascii?Q?TWCP16/guKC6zvZkcPEgK0EuKjpvDwwYY+bTJDORT/ZzVELtr2Q/qeht76az?=
 =?us-ascii?Q?wOZjglBUOz3jNmCTRTFDd3cOUnQ11zsvNp4oge9mRPF78M2COv07jNpO7HOe?=
 =?us-ascii?Q?ArUuHeMLu4TlMc9Tv4f7L375nRnEBv+jCkVPtvgFXxmYBHki/uJj2JQPrcO9?=
 =?us-ascii?Q?kkFZQpGwvAWiDsHmyqaBopOAsER4/8/VYehEz3qQRmPaDnRHlHO40jyZL8ng?=
 =?us-ascii?Q?tVerjANR+5c/WlnxVHtuyL5TNUurRmdZzybH+y29/v707WmOgUBqRcl+mxgB?=
 =?us-ascii?Q?JBel9YdQ4IhWvEi7AFRQqcccrPa+nFz04mgzsLRSdVpU3lE4iHlhMYF4D3KT?=
 =?us-ascii?Q?KM7uWsF3V2w6o1J+NDFuVqT5Ofi/SqEH8eEanvaAc48w0gbWeTzmYUOR1em3?=
 =?us-ascii?Q?UoBnsJrL24cwD+SZVCSu2R0tSgIRKO19UHvUosWQncs2LxvZeRF6M5q4jXxE?=
 =?us-ascii?Q?9buygv6OPItNtBOdXs2tGNFIzT+gwlNcG8xZVjKHgDGSHk1bxHhDhi8NGk16?=
 =?us-ascii?Q?Rwl/546pYVtnMLkDfAXqFxZeWoiFzRfJLtWgHDaXKZ9VgKWymaj07/slWi2P?=
 =?us-ascii?Q?roYZ3Xx41TXG0gnxbYnCRwNhShs8P+3W8u026urjl+raQaoADppaL5kwsgi1?=
 =?us-ascii?Q?4gxwC+iLW+eAtbP6FS9a6P3Hdabakl2JMxz4Z3YnU+sIRtcJ0V5OaDDJ7TWR?=
 =?us-ascii?Q?Pr2D0SQpNQRln8PRs68NAZWep/WloiA4CMSkxoTG+9ZninRQjGBkJ0av1wZJ?=
 =?us-ascii?Q?vqLN/vDJk3c8o/bizCskgN0JBFoe6PVuuUO1GmdCR+zBUV10db6iK37Rv+lj?=
 =?us-ascii?Q?6X0nyfGdJDNRYYkYWGpfPKISwHzZG/8gJ2CgPahK5deO/YjPBulm5fjlFGzg?=
 =?us-ascii?Q?9IYYT3NTmW1EIFPdrz3AIwnQe1CJUjo1KORXf7a86YLByM9hNobjOJ7mbEX+?=
 =?us-ascii?Q?fLF+QrDhp5jC1wqTyEOy7dftNRbZETVFpQqjNCfoE+TTtcHL4tNNjjhq5UJk?=
 =?us-ascii?Q?MsxKCyT/gUPPLz41UGIgDr8DhUXrzNSFwrswqSVpNP7fSXWiHPoVOja1mEJa?=
 =?us-ascii?Q?7TRVm79GSku/daHlQ7kJVPWYQFjW1w3ZlAxhHAa59Hn+a+gLMh+0TLXgFCuq?=
 =?us-ascii?Q?yBTH8k/9oYEpOSyB/at8yVH6kOU8XhrGOwQt5RDTHILo5KA/EcTMhcWGG6f3?=
 =?us-ascii?Q?+TXKwFC+96Wu/wdEt93SPHupRze9x9AfQfM8OKzYObHev4544GJ6UzwqGEtv?=
 =?us-ascii?Q?BClUjTyboRXphQygcY47DvABpOmI7knNTj6SD119gs5DrCm5oh0VKT94pTcL?=
X-MS-Exchange-AntiSpam-MessageData-1: vidRflTaTNdUFw==
X-Exchange-RoutingPolicyChecked: 
	oyIOWOICwGOELojOTamhk8COKypUvU4bc6auFlOrehg2vNSYy2oGU2wPeQzE8bMI8Lg9XbpRn6cjYBzWjNasS9VP1s1f/1IMqVRu4euGcEvsq8H04cWvU140yvX3x7n6Eu3txC3YgnqESfQZJ6iF3FSnajmLJpQnl1/TsiP6pmJrFjIRuvhsDroKDo65yOjx/a9Du5QMmGHCTVRMtyAYie74fdqDXTqSCZiCpwfQKg6QMQOBbwtcJVNPkKVkL3vNJu02b9rkAeIvQ3eQshUNa/Aqii9XiiEm1sVzzO/lbfKOFCnLb6RL6fT+XZMMAfK2HzpELokD544fR4VbEzRVUA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	QvZ22B5fgbL0ZrvvJZz4AkgUYKfAoSaFam2O2qX4xCe7YZHHmyw6hsErfa5n2u2Xti+Hyf3767Gl2NQV64QnjjZqrZLgLrhGGAHETYAP6ubMzkvIF4GTS6OJw1xHpqjsW0ZbDM/K1s9y8S9ZLp+HUir/wzuumEuyRW86NCcXkOyDkt9pOOY6NepszsS+JBsvkrFF97SOeSQ81zQVOPJh46Z0jZslZDl6puWB1V4aR9Yx9bdFxx3mcXJXle8vBKqKNxmPVARXjN+D/rDgVBvFv15+qkloe8n9WrkpMcKfE3Ia7rNhyaFLTlo7b8XXiGwP6DD+XbynbmkZ9KaWpiw9t6+7Jq30hB0cQwS2U+YluI+rdfVstD9iiHOYbbgzftLIAHZos7XdqWzhS16WgcKmKy1qULHzuS8qwCMsPkofDeBPsx9Ld1jvOCwPybA1SPM80imKndnbRFxVKFfRCozmKzXKqd/bLwaEWjnDQ9B9HNxVU6Ayea3G2k2fURaX9sRKYiNRz87MmgozzGB2O6gr1ZH+nkfkmyprcJ1vnPOrKdxsuM4jFKHiei6u/PtdEIFd5RvHRuy5161jQEmaVPCNRYZlBLGhLwwz6ZEea+HjeW7FWipBZle1ke99JMwEOIvT
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3646fb45-a20b-426d-b770-08ded75e1133
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:46:54.9731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiIgr83+MQhUJxw/IK3aCa/sRGtHPnbNGKAovZUD1Ya+QkP5JM3bZlMmJtdDFmSPC/gaWWQjIfDII/Wzt7l9Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P192MB3195
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate91-hz12.hornetsecurity.com with 4gqxXf3Zbbz7t7V3
X-cloud-security-connect: mail-northeuropeazon11020124.outbound.protection.outlook.com[52.101.84.124], TLS=1, IP=52.101.84.124
X-cloud-security-Digest: f0c919212fd67697b0d1875ff98354c2
X-cloud-security: scantime:1.068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239964

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/708b4a56bae080a5b18c2e0c4c6fbe103131a2b0

[2] https://security-tracker.debian.org/tracker/CVE-2026-56116

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.3.2.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56116.patch         | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
index 3a6e967657..8f1615482a 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            file://CVE-2026-56113.patch \
            file://CVE-2026-56114.patch \
+           file://CVE-2026-56116.patch \
            "
 
 SRCREV = "243ad84ac67a87d631ff7eb83b2eed2727acebb5"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
new file mode 100644
index 0000000000..2d8345cf18
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
@@ -0,0 +1,31 @@
+From ae33c2d8fc7319a2957acd6e8efad99116b68dc6 Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Tue, 23 Jun 2026 00:34:58 +0100
+Subject: [PATCH] IPv6ND: Free routeinfo when it expires (#670)
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 708b4a56bae080a5b18c2e0c4c6fbe103131a2b0)
+
+CVE: CVE-2026-56116
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/708b4a56bae080a5b18c2e0c4c6fbe103131a2b0]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/ipv6nd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ipv6nd.c b/src/ipv6nd.c
+index ccf71241..557ff50e 100644
+--- a/src/ipv6nd.c
++++ b/src/ipv6nd.c
+@@ -1789,6 +1789,7 @@ ipv6nd_expirera(void *arg)
+ 				logwarnx("%s: expired route %s",
+ 				    rap->iface->name, rinfo->sprefix);
+ 				TAILQ_REMOVE(&rap->rinfos, rinfo, next);
++				free(rinfo);
+ 			}
+ 		}
+ 
+-- 
+2.43.0
+
-- 
2.43.0


