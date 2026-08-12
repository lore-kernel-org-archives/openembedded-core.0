Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB92C5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 07:29:13 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2746.1786519753081166496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 00:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aPmimi5M;
 spf=pass (domain: est.tech, ip: 40.107.159.40, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPIQ3fobo4Ueh+jaUocrDmajd6t12rZMfHTxglUqzfGtw+oxmbOu7yqSXtdEZudcdu+HL4wlr2HqURPBpU1EVFouubSHCXRAbDd7rFm1HYn86HPgRSechirD1UqrO4Jtp5xRK8nx2cAZwFxIfcNvCoWG3IzDw2qAbj3i+WIkFmgf6U062LWkm50HeROx9Fj2ABNXXa5y0kPQTT7Zu2l8Zn4sGxua1pzc9fEtrc4D3GUUO2WxlTHKgFKr2b+heZsiSc6ZvYY3Kjg0bczQH27ON60j0zNMVwdwd4xVdUPPV12CPuIwnXd6m7ADyt1ymbO1mE1VylZXha/Y3aBQ/s9GFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rg7QjNpeDmQK6FTXBN3OCJQd7VdbuII9g4WeTL2/6Y=;
 b=rkmKnM/d/jB+CN+Shqz7EeR5ipG4Nwb1qwsNBo++1U41VuJOyWaR24zQTqxiC2ABlUE4MoSwdCYph7px4CsFgbhyNUEwCDxBisdCP94ozKQCAj69DJ4zl0BmNiCRqDtmkDYE/Fc1ADGczm7Bk0AMbY29bS4KJQy2pH7shgw71N/Rx7q83uKlR8cRtisZqAaZbc3ar9XmjHbSof+GDwIjyz+BnPNrVQhai8xowpaVGacKUBK44dfYXocoMdgCu9Y3kDJUymZtVQlz8nAyO6dUhvjQlRg5Sj5u4xeKCbpxYp4jidp+2oSCXwJfEHvFyf7eAEXI0Hr3ymubiz25k8+NFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rg7QjNpeDmQK6FTXBN3OCJQd7VdbuII9g4WeTL2/6Y=;
 b=aPmimi5MRo2s936PKySxwzwm8GowEXmXQHVf5tPZypbuakFFwHVWOAxGh2D0+UeBxaQeuRX2yExuobVDu3Hc1Pag0DBoe2B3cC9ExN5yyD0IH74Bizh9kwW2Pc661raf5M2GlYF0BTtR/kePROz+1yInod7GVpwuQNxVK0AUMExfvwxOg5LTMOrTbpDlKOHCjq79XogLiE0DfgL5iFh+J2xvUZFDyX3ymMJvkt22dkFwuYm64mRam7+6Mt2gO3Y+YcpQBGWthwP1P/gz4jNeCdYbDRyB5ZAyAeAVvTWWQNqp9+OyxWfAWvQUOgnVLeFs6Xv2YXw2QPd0Q9Z3n0FNLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by BESP189MB3212.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Wed, 12 Aug
 2026 07:29:10 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:29:10 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH 0/2] binutils: fix CVE-2026-15003 and CVE-2026-18220
Date: Wed, 12 Aug 2026 09:29:05 +0200
Message-ID: <20260812072907.22268-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260807140902.4732-1-jaipaul.cheernam@est.tech>
References: <20260807140902.4732-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0064.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::17) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|BESP189MB3212:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4dc8f6-4e7a-43f9-bd8b-08def84366c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	w30OxVKunruqIUElSpPblwMQ4GjEyBbhQjEjFq720z2FbrSWb3sn3D0mV4naz8/17nRJ1PnXl3kJPs5aJw+zk7XTFuU4M3FpXcwqsog7ITxJIH0Pjc7T6BToBjDxbd932GaqWq3aOjMDaU7OrRdvomJpgF/IBwT5ni6MSDtqDy6nbDOC186pJF4jh/cupD5B5coKxPi4Vks1yfEXahyNGjb1CHTLzkr5vZ4eJKUMHJ/kqf83q8cPHPwm9JwboUFgMupEhn443JkUb2WU9oGaPIrTZO16obeVjB4vVHj4wZQPDfI9KaCkkPe1XGQv9/tQVtBswI3gLyrnJHdeq7F7Bv3YxQvg6yB9/DpkrRn+g3U3mizmJ5eeKUUrlZPLUlTnrtL3nLPyM8R2Ct060ByX2ZSyDnlf397H5+u4Y8laSDwjt/ZZQ7D8T8lGaObalcZop5kbGzqef2CLB8qlOrte9ZiU3f8MMEVg4nFrFj9ZLamo7LZq+h+cpzUczLAT+pHUuK+e9xcexXAFCyBmQYRFcbcPkeK3Z5RUrzQkWi9+HZWXvOCLBj4zVaXMhlIkmx4pldB9nlTvT0DrR32uUtHaQpVYxUDhGr8sQAYGrcoBjDoT2bFZ1cAq5b1fHqwSj3DYTBmg/bkeLDiZiVBOPU/qg7SFdgcmqUuflQqM5TAxzX8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BsMxHuC52y8PRaYKsCKXRmgwIKbWOhFeTJCjlqZM0iozNXxVSdd8rbD1WTXj?=
 =?us-ascii?Q?cXd43Q5yBuqMUIVxIBHfLgBhF5p+lItu0dW+Q8818vM0n31pfWPf8yMUNLkY?=
 =?us-ascii?Q?qIC/4HBIeu6IatETM8ZJEYk4orbMM65qBK1Dy3SfbFtTxUa4YJfb+Kmcvx/2?=
 =?us-ascii?Q?FJlbsQXE7jDiZHnb51pyZxpPvYHKWYWwAay/QFVuqGhEBTXLe9uf6emPJmFv?=
 =?us-ascii?Q?2f3Gdd9uYLvdAeMY1TiG+ylJOZeeLh6D0mJNMbVmly8MZiF/G2bGCrAANz1x?=
 =?us-ascii?Q?0JwzqEzwLYHPQIs4IGvTWUzAhgJRR0nbR0msh479qo+8ei6CF+LFj9BqpKoo?=
 =?us-ascii?Q?C7mP3YgywXqoEukqAhnhoR4LKTEh+3yX6mFqr9Oo64cJ5QHa8fPdoUFSz+m6?=
 =?us-ascii?Q?AxiMUYpDgNiXg/9iN+vZyt+WCt1WGTTUfoVSaSMMP+/KW5BU/MrYtN1/SSXl?=
 =?us-ascii?Q?R+3QiqdCNnajTQG/JZTBjH8BRZAIvlKRaJ7MW36ZNbJYNqvmenz0k6V0d8Gq?=
 =?us-ascii?Q?jql9mYq+lyjtYRONOb8jErgXtm7jpFtiKxYFBt2UgA/drpVZ9vNuqBGNPNG5?=
 =?us-ascii?Q?G2PYLlegJmRllag8Z9DVw+1L+g/ajdmZSgUDKMz8zNdOOFc3+od3jte05BI/?=
 =?us-ascii?Q?qgnCyL6hTyLTgQrsEv2M/5J+CGu38lDG5A7tW2cfk0E/bGap2uxDU7ytqTQE?=
 =?us-ascii?Q?DpBVG/fpN8Vc2wEFUOces1iCyExpqu59q7/u75wXDBgKCon81pugc5Inr3zb?=
 =?us-ascii?Q?+c8HPlD3LHuchdrbDwR8ckOjlGnbAlyL0Eiu/qeNWJm3b+A3fUPTOfnH9UR9?=
 =?us-ascii?Q?euFCj/IcXEgxrLXvygJpkzM3ObY/UQQrWrKHYSNFVK2MyHKNZdC/nZhlgkc/?=
 =?us-ascii?Q?Lr+r5/7ckj/UQ3CUgUUSsLw/ntRshKWLkbtQ+S+0r8NAg7wt5NMAoaoKimX8?=
 =?us-ascii?Q?oBFyjjB+lexOKfCRSLNfz07b1v8il0d//9iVU1ZiCkIIb3Ly86CatxNFnYxM?=
 =?us-ascii?Q?7TUnAKZvPvcwVZisd3l2nkJZBY4A/kxdJ6oPGSzcrouEq0PGrc8dggGCrU2x?=
 =?us-ascii?Q?nOFsRTIMye9YuH+3orNMDgHeGCsiTS42ZDhu6sfrCK8WVKRJc1lSLPbCRVx5?=
 =?us-ascii?Q?+dnD8bb/M2UHzmfgaE59/PitcxfCjeQJfyU7t+1g0o3G0bzAGq+JHAL6eQxi?=
 =?us-ascii?Q?DHMk1sY/HUSX6LqtYH7dBHE9///2YRqeGs5+AgKLj3wkqEd1mFxkgLeueZYv?=
 =?us-ascii?Q?8I1RS3f9nOmusqmJ3/ho/Uktxst13D4ltEXL2g5x1b/jx6NBs48Xwlvx23S8?=
 =?us-ascii?Q?uuLMhkyGhJwO+T/+Mwa1qequo2ioMn3kKexKxWbqE5do311KfWagvJIdgKQg?=
 =?us-ascii?Q?MeAMtNgiQqqBzYi5hc5mqQpbIHRhCLT7gt4OKKQEImkHo/F28AVkP+oHP0Ob?=
 =?us-ascii?Q?ZFXq+bz7YRos2QrzSE93os1f2mhHLGIGPxFPgKtX4PgoIjVmd80BfHbtgm5a?=
 =?us-ascii?Q?9Pqv9hksmo8hlUNLjan/2ukiyVw3kDgOIu01LFEW9oaYOAnct5dJQ4P0Kbo7?=
 =?us-ascii?Q?zhsMZ35cVFJ/nprcOhhJMrcDm55z2lW7WGy6Dmnh6M7LiZ9u2Vlf8PGxOMx/?=
 =?us-ascii?Q?NQdUJL3qt/PwqwZjOfQqSctqSI8Z3OhoczeLnFmMxyaYd7BnNUm0S0TiX0Xt?=
 =?us-ascii?Q?iaea/VS6Q+zW0CKHkCwjTfACUCsihWzW5hI/L0NkT6WVyyDykmDppfOMIZ6C?=
 =?us-ascii?Q?qj/tk9ACRNkR3RKeh0x/4yQBwMxVN00=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4dc8f6-4e7a-43f9-bd8b-08def84366c6
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:29:10.5431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYJcPuX6Ltu7g5l8ZXqZh693IUwujGsiJVTvL7tHIiys65I7gTnMDQpgZ4foD/FXlrtzVwrISlT4hCANh6R/IclUvQMEIBJEvw7fDR7tevQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 07:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243252

Backport two upstream fixes for binutils 2.46.1:

- CVE-2026-15003: buffer overflow in xcoff_link_add_symbols (PR 34053)
- CVE-2026-18220: buffer overflow in elf32_dlx_relocate26

Both patches apply cleanly and all tests pass with no regressions.

Test results:
  binutils-testsuite 2.46.1 (x86_64-oe-linux) - All tests PASSED

  binutils: 327 passed, 5 untested, 9 unsupported
  gas:      2091 passed, 4 unsupported
  ld:       1899 passed, 7 expected failures, 20 untested, 109 unsupported

Jaipaul Cheernam (2):
  binutils: Patch for CVE-2026-15003
  binutils: fix CVE-2026-18220

 .../binutils/binutils-2.46.inc                |   2 +
 .../binutils/binutils/CVE-2026-15003.patch    | 402 ++++++++++++++++++
 .../binutils/binutils/CVE-2026-18220.patch    |  65 +++
 3 files changed, 469 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-15003.=
patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-18220.=
patch


