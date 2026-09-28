Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E250C9833F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 11:40:10 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55337.1790595604195884966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 04:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=BhNxk6rv;
 spf=pass (domain: est.tech, ip: 52.101.84.67, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENBDmvrk6GRQyi58mhk1EOzj45YJ9AbjYA9FY6DF0BcK5o8eKdYCn1iAHLh4MENLhm4J82fZSixCm1Aqss8fSaqt4G7pVKXK6HRhuPWCSapiNMGUFyZ1WF08wjWBYocRV7fHAugP/K7iHTY8RAGW0dnEwvI6UCfYimSzHYcJPpA7ULI3FE1vOAl62bwjaX29I5A8gZFO5RxjUQfXwNu7Rpwcfq0NMUm1xvQ1NElOSnw6wRlE8vKIUlAYb6aNYG2hIlxVR1Dv/gukKJX35ymH9W08SVmkKHYuvlHIXmUBjGAp7lEL9EpCHemxAs9cv4ZDmhlrERg2EiZbQie7TBz8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFLGyLgZbKFhv2IrHb4m6/8GJPCbHuvrISw3nq2MSDQ=;
 b=n13ezbUWAPKKBxqhY/0Y+HkklCcM0bcYDdX7owemB1bKEMftJUa5FK6XwuuC567JfdRwK8ZteBx6wJBkOE6AuxUDiMHRfqEi0Mja/jOwAnoR32oMighSv9gKXf07Xs1OQwDS0vb7zmWhiKutyNAdnAbZuQRsKrlDJR0mrpI6CCFcNON61KylcCYDrmMUK3lR5n4+xU7zUCN0M2ZbEqEXh2sahtKKkTLRvKgfuWyyrtPtXMBuHFuxPMKS1Xt17GDwkoHs55UqdbdChKu3iYGRJAZR9uH7KfDE4e5amfGDSfCX7x5/oGu+TCn2IB6AqjuBAhIuFVVwrqOiRuhBKeBncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFLGyLgZbKFhv2IrHb4m6/8GJPCbHuvrISw3nq2MSDQ=;
 b=BhNxk6rvWubLA9vgAJNCpgCyFlBo6Kar4sjo0L7wFKu1vqE769GDwOvh82zfQcFrSJirQXEJjLBspN3lxrDTrvNotTACZtjdY1CDextYBmJmafFr0q7PPycwfSfLHJfhYL5tt2Y2SB+wCqk2z9oo2o8Q7TRFGTpN5daJC6bRm4QoQqK3BVnDnZiT2fM+PRzRJFEeBZLoy9+hbvJvPwAylTA18P0Hsw1lXnrgModwsRRsJT5VJVwmG1zcaAR9QFA5ahrfTGzFIovYmZLMQUJmuy0OnyHMKnBXcLh0T7/daLZ0SVJrYPc3B0ZGYh6dlzUnRyIGpYGy28qDkljVHgdTMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VE1P189MB1053.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:162::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 11:39:58 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 11:39:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] systemd: Upgrade 261.3 -> 262
Date: Mon, 28 Sep 2026 13:39:53 +0200
Message-ID: <20260928113956.42485-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0113.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VE1P189MB1053:EE_
X-MS-Office365-Filtering-Correlation-Id: f12bcdc4-decd-49c2-0fcc-08df1d55391c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	sS0hatqMj1wsSvwAFP1PThkMlSLY338s6eFSLFgN/5L2zMWUtkkGcyLSQQUzUDF9xoj2pNZn5jJvLMTvGSBkuv7VPRHgOAqKyUk7esLoydp6SUvajf1ZNaO5AJMrcb5ktm/8cIpdAEZr8kjePL1/GVB0bzF0GcxTfd5jfKt4KI/z9WiDfY9dMMvsGj+37e1n/wTOOOZ1gdV9ygBMAyunlTA1J3qF1SH3BmWl4EPmN7XS5b29YiiONkv2EGMfHJgSA/ZGdnXzJ08S4pcUqCXQBbGFvFBbQQv5H0Jfyw23+AJImNkskCLNg0KvrbI25XPxeJneNNSMW0Qmo6smL0oCyJ9QcqaTnFccrVRvBBeBsHSUbkSfGQ3M+W5QLNq3+WN3TvboGTjmITL1xVc/wUyimcVqWMooduCaMVMW9KQEy4JllAeU71DHQKT1K3lixUcazHmDxEmuMAOzS631cOSbPGeAUHPDuJNmRR2sMensPt4NdhkV3wSiUIzRPWgZICjm36qf0HesKVYj8ZGmbFiVOOg5BFgmegd7qXoK7hdzK1k/liC5Ijm5AVjB/fLFt48L+AxX4o6hg1p/a717rOVjJBjvXAL4aS7XdytXlpaAXPQdnCJcOMc48e7XPCQTCTVliP9mUmxBlitKUxFTYheynlH8STei8ASCFTkm/iaWvEA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g1LAqupu4VFqFQfCDoJbqFJW4X6IzZQRwo+6nHU65Uvn9HkldmDRVUCVzLBx?=
 =?us-ascii?Q?7DwvDRLKZkEXnni0REXEmSZGmLQzSaDANBXmr7RDfe/RRv0UZkPrBgkWc6p3?=
 =?us-ascii?Q?GHQzfeHqYSQUeQ78l0Jlk/1tO8+lgpw6bscgtCetftAo1abNuIO0w3AOMtAd?=
 =?us-ascii?Q?hrEysZsiCQlasbc7XsQpOKPzar/yB77h9Tm+tF1ASscOUm9oZxCsdZqpJgbE?=
 =?us-ascii?Q?clwbTzCmRUjKkz/GJz+c/OyvqsUx85Qc7NIB9FWloBUg28CWOy8z7lVGA6Lg?=
 =?us-ascii?Q?cabuy057Nxf1xSuLu5bdim//KBfOQ0nQLfWWQv7ty7bAP3xhTIa5F5JQ6P28?=
 =?us-ascii?Q?lCfaQ64UPwYBVw4RQTdYXgJrF83EOkUu2Kb8zYWkXK5iOF+3SOeLnZDMd+Sv?=
 =?us-ascii?Q?q1pK1emY8GZ1IFXH4G9AlvJfbE6uuTRoD0ss1MCtwzqOutH38kxUfwaoUBHU?=
 =?us-ascii?Q?tEcSwmCK2nv0/y4r8u2jhzdODzFuQk04v2yRqPDmv2UXUQWSFb+8BDL/4tYe?=
 =?us-ascii?Q?y36tVwDB9Z0A0ltemxReJ/+i7348ThwZmiclORtK5LZF8rlzbOncxDjS1XRA?=
 =?us-ascii?Q?IPc+zQ50Q+d4QKLpRVrRKZq1hOxasDLn7NwNNiAHG/QfDj/ygYoVTlr49suU?=
 =?us-ascii?Q?1VKAEcTVgtYu635QHhCMT7bl5kyivTneppr7jwxdkOri6a5HZDAYpr/toH5B?=
 =?us-ascii?Q?pmyL76qyJ1NSj+wUXM9i7N/gI67YYRflzqdDArcZ3oAN8+u90IaFkblf44fE?=
 =?us-ascii?Q?G3ny9iquagV3FC0dJB5EBb4FIR2pwmm5RXj0PV92gjNUzHdHJZuV0Hfp2St0?=
 =?us-ascii?Q?O8hhBamC8IKWUT1eGbyI5K5mdAtAW3Zch8Mg6+6cIjH+IGdwVUhBFPt8hw0K?=
 =?us-ascii?Q?pCVbVtSfHVLrbh2bFZpGZtuJOJoHoLKa/P5iHQKDNxEMZvUCL/MIVcD6r5D0?=
 =?us-ascii?Q?In57QC6LRBCNM8Kn3O4oZqd5dQFjend+pdU6dQQruDPxBKk1jBtJootE5v+p?=
 =?us-ascii?Q?cV6omRHxD17XjyN//kbVoasghmQEHgjePcfhDxwM4Gq5T7vj71aV6GgbBXFP?=
 =?us-ascii?Q?htf/dZjZL/TnVOF8NXTp0+wHh1ibjz2Q2tKPPolmRUqBVhUrJKY/kjA2JCzT?=
 =?us-ascii?Q?/r4bGDoK0xWyxizkyhMqu6On+4CLByilkgkfu67Cf4cXYW2w+X3UZjfxSzPO?=
 =?us-ascii?Q?vv+RMAsztHbIGzsAUCGv7ldh0CjLUDhc26Xdia/hr9x8ais2AOVopvyK8fF6?=
 =?us-ascii?Q?jyLRLSWkdXZVI5ojINUG+J6o5+LO4TlistMTe20RsrkwUO73Rs/U0MtUochc?=
 =?us-ascii?Q?yZHDSzPeyMFMJxMiLJjpww9XSO48/NEOfpBYmkcXaFGhtuPlDt6QH4jRGBJ4?=
 =?us-ascii?Q?p1JJYWB9vdJfN0E45sP/D/c2yBJ7ky86z08UT0MMioEd38PDKuG6L52FJTcr?=
 =?us-ascii?Q?llBKXp7N5dG6wyGJBTTmEYioa0w0kFs4h9IcBCMA6UjZUK7Z332kTuxozfaL?=
 =?us-ascii?Q?gKpQUcekrBHOu4zjiVSSqw/UXi74ZwfN4ARomD1ZM8whYG5Cqq0bqP6dGZ8H?=
 =?us-ascii?Q?CkG0mGDGNr6fCUXGeD+PaXsqfCnEGT3EnpDRAKk3rc5/TXj/D2p1FeIziiTx?=
 =?us-ascii?Q?AjuNiHFpZwpaMJtiism6lZJlgad3W/lEValXX0GsLYpSBd4A8KXKDxGZEhOy?=
 =?us-ascii?Q?N1oZm4ubzJH7otHtXqq4nmosmklpUR/4P/hQq7nbHyHWHmfcWoNJysxw9qgd?=
 =?us-ascii?Q?XoNoeyEu5Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f12bcdc4-decd-49c2-0fcc-08df1d55391c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 11:39:57.8727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsDOQq9QjtTVtPcNxBbCZkp7wXJmPKzjm/JlOKNgPEOXx6dBvbrYRWxUt+tsfAoubJ+0/fDb/bfdHQFpq4Z0vcV1Il/45zlymH3B8UnJckk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB1053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 11:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246754

This series contains systemd upgrade and update HOMEPAGE, DESCRIPTION

Jaipaul Cheernam (3):
  systemd: Upgrade 261.3 -> 262
  systemd: Update HOMEPAGE
  systemd: Update DESCRIPTION section

 ...ve_261.3.bb =3D> systemd-boot-native_262.bb} |  0
 ...temd-boot_261.3.bb =3D> systemd-boot_262.bb} |  0
 ...e_261.3.bb =3D> systemd-tools-native_262.bb} |  3 ---
 meta/recipes-core/systemd/systemd.inc         | 20 +++++++++----------
 ...tall-dependency-links-at-install-tim.patch |  8 ++++----
 .../0003-Do-not-create-var-log-README.patch   |  2 +-
 .../{systemd_261.3.bb =3D> systemd_262.bb}      |  2 +-
 7 files changed, 15 insertions(+), 20 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_261.3.bb =3D> system=
d-boot-native_262.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_261.3.bb =3D> systemd-boot_=
262.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-tools-native_261.3.bb =3D> syste=
md-tools-native_262.bb} (93%)
 rename meta/recipes-core/systemd/{systemd_261.3.bb =3D> systemd_262.bb} (9=
9%)


