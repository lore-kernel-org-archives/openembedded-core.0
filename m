Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BBECA9EDE
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:36 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13147.1791811226690939817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GZmCrb0P;
 spf=pass (domain: est.tech, ip: 52.101.84.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyIk8kR6za3/hISYbvoMDXRh45lIoMLYhzuEnERLIwOUQVFCd5EBoRBKyjxhCsKL/jBz5yJNY4XKDpao+DFCBePk4jXd3ctlDye4nv/SLJFkb/XxU/t7THlQJxeMHsqm1kT3QaxP7KJefYOzK51B7OYVMnL+lPGgd5ELhaVfhkVdY7R27L2EGJXuJkFWI4jE9exyN5Ef9CZsANfdBui4MWq8L1zlqJrq+LllqP8FFwgeqitW4XDE22vGIwFXD8pYARXVnEAOVMcpVnvVVvRhXnhF7QqppFEKH8IlX2azXYCLdhVx9CRETsuryFKmB0EMPSoDBosSh0yiJg6ss/hw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIxF8i6X1v0ylUJ87tHBAeHTP8C5CUl1SbrkLfhfZPI=;
 b=R6ExJlXRGBk3Jj3nx9pohGdkG6mv5FNQftFaECPkQqjSRQu+JuAsawcODvlT6rXvK057V35XVdwCHBIz4u9uQyOOSEh5lEn9pma/8A/u7D+WnRe7/IAf10WfJVla6HAco8iMuznfZqrE4l/o9U2MG/ax7VAvxbirulF/F0124bZDsvrMCZqZFVVZmB8fihmHp+Jey0d+VmTdwJUwajHdP5rXYjJxw7tP1itdBOb6COZPJ3gOAT47E5cFr7o9WvGmHM2FgYaiWbPoun8iUWwSHwxB3m/AiDNyfC20i1S2DC18HDMJf9T1OIkdqUqePRmj26BacjYNts3PIuZ6NIOLVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIxF8i6X1v0ylUJ87tHBAeHTP8C5CUl1SbrkLfhfZPI=;
 b=GZmCrb0Pu1n6X9oBZuEbayguCSPjzwCSFy8chnIgcrXHsNB0n2QQf268xjUG5FFhzFd/vnPTEZAe4PfkBwbjBopIWdmgFrks9kyGYyB4+mrKghtVCODZDnYn8i5OGzWDqQtaNmGu0cL6eyPFVIrMEPU9/FV7lUZqTZayoZc9OGW4VJyoPmrZ3R3LDr7gzHATOb/oKnZxEyoaz9i1E7bH+mTCyNwb9wG34AFlqdqpermq/G0F3GLajpkt99wSYTfSY0PEkaBnwJg8dlGiGOSfcZQjtll/KylJQIJniDNMRBzokMLxQp0ec/ZRdlSdoKZDDYp560AM90UFnOSZZOhYZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB1966.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 12 Oct
 2026 13:20:26 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/18] python3-beartype: upgrade 0.22.9 -> 0.23.0
Date: Mon, 12 Oct 2026 15:20:00 +0200
Message-ID: <20261012132005.23909-14-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB1966:EE_
X-MS-Office365-Filtering-Correlation-Id: 69eedb02-27a2-47b0-eda1-08df2863947e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|18002099003|10067099003|6133799003|11063799006|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 
	kTcSibEnURsa4tQ6aJwOIYGdSbMI2Y+4Wf9fg0dkY+dDdvwSO+Er/ODRSINWdJf/4jLMXA5LFeD4S5vRHxyoOp24OCvw62qFvFbYROB+6PW0J7WuQNSaaZs9OsliXnOe49FeQYEae0+DDD1HI9/2AmDuNQShv3ne3KkI02pAeTwUo+DT1qUjrcQ4ZEMNBLbS720a7lMe58a1Ka0QRPI1AuNdqW1ZOIGSaW7hwCpeQ6qPi/CI1oS+qAqDH/i8YCfikFRKkigUzdQ0RRlxhVnljoqmCpbYLD1oRH7wJyGojIrGsyjNJLOK1Iuvic/U0UxvQcPMfnpsAtOO4QiRw+H4UEJKhpDejxSwdKXfJnoCMfvSoIXsu964kbBhCLF6CX0Dl1EyTydvWU/wgMY/n3KrEcmspOuP1HcXy/D+DMxyfieRiKokTqQgtuRpW1yXWZbdQRwbaqNmtCj0mBgArJwwkf+3ykiW1JS8L0HH0VUsauJ0jQUC3gVx/EKNvxJkQ8iroqUwRvV5IW4yF+IKX1ORPTLEG61xAs95Lmh/Rss6vyg1Rpq/RhuZ4mz80U3aVHvgST99j7+zdy9UywE/FS4MjU9O2L/l4MDBagUVGL3She0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(6133799003)(11063799006)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3Yu8FRmO99JOU+eewPZvK4ITB+nO+mIH8ekIK0EDRutsZJIePHCxuPnivp/m?=
 =?us-ascii?Q?E8LiCERNPaosZTYtWcHo//PgEILXNO9LSTi/c+nlH32ztT4I5yW70XtXR59m?=
 =?us-ascii?Q?P44xmJt4ucFyxgBDeNlFIhEVAWA3yS/Z4bnnjkqtpGTdjjFjB/+s0lJpBe6s?=
 =?us-ascii?Q?Pnt82UlhQTZ4MuSFisRRdU5YRliAiaJwwvRDp9jtrej7zGXsuNthDBI2AM4+?=
 =?us-ascii?Q?aZ2CarYkoU1ZRDfcHkty0XULMfbWZ96UhvZOuSB7eROHMl06YtO5mNlWZsau?=
 =?us-ascii?Q?yEPawMsiyUvqQ741fGH6EhmhfSdsaN8/ERLzDX+tcyEJ/3du3pNEeJ0buiTf?=
 =?us-ascii?Q?F52aUsiNVOtc3BaKt1Ubv0GKn0W88yD2CbtJLcoabfOo1uFICiG1IFJeTjpD?=
 =?us-ascii?Q?fDkKU/pvTUcoDs+ytyWtUhGKqMnzD0579rY/LReEe5OeJ9qcE3ASpJ7mA3JN?=
 =?us-ascii?Q?Ys6t77VqLzK+r0RkknuDa4ORjNceO6BXDyiZww0lgcmncdU02O81HwMs19M6?=
 =?us-ascii?Q?m5vWtH2LTOMrZsAonfJHkYkzwB+rhxh33HPZqEmslAXyFVriahKMlU9AqC4W?=
 =?us-ascii?Q?YXFGY7unLFWSEdyHCoJT7GoErfWgssSEyI0oLROnrdj692KflC2d2gr8EmA0?=
 =?us-ascii?Q?IOWvMa9pj2fIT726+0ugxGYUuDmP+j2lYPCnSYH25+o3hzPXWIqjFFHjDMMk?=
 =?us-ascii?Q?er1Vt8BfrmDyJ24t+C6oK4NqWE31ffmz167q7bTOvLx6/BmSiZ8P2KB033TI?=
 =?us-ascii?Q?yZmIJ/WDwyctk7ByDWMgwjzQMYv8YA/aTva4BllaiV3bTS0zRT/RLqjL88WR?=
 =?us-ascii?Q?/DloZCAmjWmR89kowZeJH8GBYtJt+iXQpi6Xf9gDD5BXlQpSxlE1huFzrbYB?=
 =?us-ascii?Q?6nI3OCNzPjHVFULGhH+hdskSXGptVsGcQNV4lG7J0TXUH8AETg4/m9umVcWL?=
 =?us-ascii?Q?sKCgYK+w5Eh9ACoELfl9Y3tzfRgoDL0MKdcr/9meuUMhD2cOlqNylWi1cg9v?=
 =?us-ascii?Q?/V+1HcQf7coufF9e0cJS8ZG24NnQXXRDYSrcpOnj+fTFhf1rBlye04zzjbHZ?=
 =?us-ascii?Q?ElEQmg8RfzWfwRHXB+0zRo8dk7resYyYWzP8mzvwz94JCkX3m+93aYb474Qs?=
 =?us-ascii?Q?6fu0DP9ZrROhNtSZABKtbrBzCVAvpj52BYuhY5LWaFZl+xp4PaXiWtQY8mnm?=
 =?us-ascii?Q?Cad2ndSGz7MiZmhITJuV42bacmyfwlAVjJ3ABIz7oXWvLnUgByR0ZP+Gh9nb?=
 =?us-ascii?Q?EnhZKg+1XRyKzJIdgfauyuArl9dLf47vs2pUYnk/cZe6j5Z9gwM4/9GXs/cR?=
 =?us-ascii?Q?y3TuPrUiy0VEklC8arQf1hvX53ZV+JCJHcEN2/UGZOFd9x0jNT3X0yADzCJn?=
 =?us-ascii?Q?ePT+M9ag8WJF15AREZa+QC9cGbafnfzI/7Abgf0ZUDSttHCPSHNcMsV7YzOL?=
 =?us-ascii?Q?QSBRKeFk7LwN4RNJxmJrvGZCFCMV1OmzPeN8FecmwLbNX+pPwMZF0+D9yADu?=
 =?us-ascii?Q?aYu0uCtFKdWvERBlmQUvZBf5hU6i9jC4SI10EEAowARSkeLCwpkvEY0NfoU6?=
 =?us-ascii?Q?IwvyQt81mQo10/nwrzNXAlxm2bRUPf5a4Az5alQXgRlcNrWKYkEquoe868ub?=
 =?us-ascii?Q?5W7KCqi02Auy10+jaxy2uzPIPoXNTMR4UDhfBlWvS5CBodrwVA5shI/MzXSU?=
 =?us-ascii?Q?0Ba7qEhGk7EZrs6qpurv5pDL7AIeLwMYIxUA2IgV8pSSBRjkgkBGurYAoGwh?=
 =?us-ascii?Q?9UNwfed2Cw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 69eedb02-27a2-47b0-eda1-08df2863947e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:26.8987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxpBQh1Xb4fIpkPwWZrhKbtGzSg+9hVa1lfQYhXaAiSQCQBm/1MQx1jCZ/Kfvla/tFleZhzTf+Vpv+hVph4P2pY6ugGVoGhBBjpS8DowXEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247657

ReleaseNotes: https://github.com/beartype/beartype/releases#release-v0.23.0

License-Update: copyright years updated.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...{python3-beartype_0.22.9.bb =3D> python3-beartype_0.23.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.22.9.bb =3D> pytho=
n3-beartype_0.23.0.bb} (60%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.22.9.bb b/meta=
/recipes-devtools/python/python3-beartype_0.23.0.bb
similarity index 60%
rename from meta/recipes-devtools/python/python3-beartype_0.22.9.bb
rename to meta/recipes-devtools/python/python3-beartype_0.23.0.bb
index e39599ccf3..fc2b40d6b8 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.22.9.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.23.0.bb
@@ -2,9 +2,9 @@ SUMMARY =3D "Unbearably fast runtime type checking in pure =
Python."
 HOMEPAGE =3D "https://beartype.readthedocs.io"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3a5bc05a109d235912da97a053cd7a5=
8"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2597b30908b2171ba6cb2080fd5be4c=
5"
=20
-SRC_URI[sha256sum] =3D "8f82b54aa723a2848a56008d18875f91c1db02c32ef6a62319=
a002e3e25a975f"
+SRC_URI[sha256sum] =3D "9d915ce043a2262ee3eb110d1c1c528179f06eb4145e375a75=
0f72ddbdf40fa3"
=20
 inherit pypi python_hatchling
=20

