Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B33CA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:26:14 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1921.1790663169963565784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xACbPoci;
 spf=pass (domain: est.tech, ip: 40.107.159.16, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygv3EbfN+g7t6CdT9F9AOXIcdJyJFPagH0j9fjbPdIHRPq60UTHJTJqmbtDaP/QttfRqhLAeJUZ7YkcjHOF53OtwvTCKiajUcxGYyLIKZ1CHJs+991V2qwjdlVAfNfPomIQIG+TZHqGR6FxbzRRgFWVr1wu+Nt/UuCF5SMy7fibZ4a715OSkfwjUFcfgsjHDHDB1dfdgnroSj0bR766eNJQIUmQB9xyjF7HZpBWuIPZ+2A4wxdaNgG1y5/H7v1ufVxmX6H2uywg1U6m5yYDpziBW9FOAtPRVOD90dNlQNS9Ob7X6Nn/gyjXT+j9pHNP+rn2HH+9DOzh9r6yVd+zmPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4c4QKP7D+73jygI9xaGtYatmnl6LOUeX4nN9pyFeyw=;
 b=Pxs9QhgtSLFpHqPFsirelc6H9nHZjTmlO2HBYIqvP4QMN1HPV8BDXaEnvGyQfUBvVt2XRymYwgqkJQc2pEmjwjq6TNNqHjM1fYva2uYwMK1CZHL9G8jSSI9dozBU/p4/gdK15u4vxGi3hm8X5PNAIpRyVfggfvvLfVcGD3Jl42S0tCvAsD2D8yIu5cfGrXHuQ45zvmoUfuh286CWO+SRbjIVY84OmxeRpeFMd77KjGnt/9xb/ixjYeUd+oQM3PTimdW/5GKgvnBohVNV3MGkLbMGztJonwGZvzkfYYDQ09QhTFHZJYyn44ZBD9U3TqudQubbwYG533JcH5PudvhofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4c4QKP7D+73jygI9xaGtYatmnl6LOUeX4nN9pyFeyw=;
 b=xACbPoci7QrgGdCgJE7mKYKRG+zyoAJ1swD3gdHqHz6deWwy5yGcZxTZrCrJe67Hiy9a2c3QHXoRbEWJMPt1+qQbfo3aH1yrdfBN2M99Yhny8haN+OSynwjjiTFoCoxaBqKm7iBZFFtNXQ/XjMPAK7cPkrbDb3tiX0qKbR8Co8PzSvAAv9Qq8spquC4G4atD6Sy58l65yJg1cJ3NDp2q6IzuWKcNy0bjBRsnI6Pth3OANo+cXAUI9d0imD8+t48hzfsMSkqqIF1th1sHrxTMvb4HH6+pxQ3itnc7SAF+7NnygJifkbBVyZhFhCyfP1KY1Ex66P1KUBMczaTB5OTxuw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PR3P189MB1033.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:29::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 06:26:08 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 06:26:08 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] perlcross: drop redundant LDFLAGS-when-linking-libperl patch
Date: Tue, 29 Sep 2026 08:26:03 +0200
Message-ID: <20260929062603.67218-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260929062603.67218-1-jaipaul.cheernam@est.tech>
References: <20260929062603.67218-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PR3P189MB1033:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f78cd7a-6dd8-4905-3383-08df1df28c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	g6crFz1Kb9u+4+yafRCHOEZDobAad+qlBtGQBnYj7X9pX11x/veSCQqmI00HWg3g7JeyPtpNQ0D5NTntD/Q/7P5DzO8y9PpboAXzL5c8ebJmvXVhElwk+Huf7o85avBfXVMJj/2Xa3meXWhzYkCdBLhc96WH/Cz5NpG4xn/g/sBaNi/EgC87HvH9MmV9dpX8VyhJ7YIpFwsQo9qQV9e+Nt8XODdUrvZP3ne5lvMrygLFqw8JNE4ghtoP7uDFfmweMTwtTj8V/7vYGLKVSV5C49zcvrxfDWiF0Lyyx+3Fk1WtBWqShtS5dGPifn3i03LGfyx9Q5b+rrjBqbBE4A3jbiAirmRi+XePzX7kgpxe9YbTkHa6kJ1LlSSoxC+OTsRrrMLgXX4sxxDdeoT+/R225ba9zaiUiKVMyTtsY8cSxXhhfDLfqOiwP+4FVVDiUSRB1Op3CiGc7GD3tV1mlkM9X6rGSElWGGUxphcAtnY8IzRwdbQd2yLRyK1GgJyBZQHGhVS8DzTmz4NqvtUhqzusLHOt6H96Uju8F6DCuAacj/ct3GoTeBwrF0ws2O+vggGNqLg/o22VP4j6cFlzsB4TinbEb5jhasLaChGUL/pb5RZQD8rRtFPE4XiOlufFv+mow7woqeX+CDlPGCQ/3cm3coWlX+OE/6GoRDwk+rw55nc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vf6ieuZND3nnzpq2RDJRWW03JYknEqMQnZP/EQJVpa+4syrxtUL5RjJDoE7l?=
 =?us-ascii?Q?eo60FihjJ95leKVbPXcn348aJUXiRP0MMEZOPFFyLyhAmRiaiIxsayWApTDJ?=
 =?us-ascii?Q?TgvGosI6/eR1HOIfOPliz9t2KrKKOaIIE/nN4SfOseTvK+xCsMkKRH2J5w71?=
 =?us-ascii?Q?gsSh4m2ALNCxSN15YnCVx5XXnxSVSZLQWUwcqjqCUz2081d8dTf2ELMZB/ho?=
 =?us-ascii?Q?n6+copxoKFvt8u3OfQntFQiueKJizqKO5Nh/Hfji2T0C6+JsuIXAiJ7lhyfp?=
 =?us-ascii?Q?BX7xHHZCIzu5ZsNSs67zeNwo4L4DdqUw9Np/CLJykIBw2G+z9VCb4w8yCxow?=
 =?us-ascii?Q?7M9d1rLXKLUL7RsHX7UASNrXKvTJvcqYnYFB33jTuld4+I/DlJR6uvrhnddn?=
 =?us-ascii?Q?xmtnSnzjXcdoHRKUO/51MFDpsEk2AEQJdoUyOdmyRRNXscQF2PzcKeYPOwgO?=
 =?us-ascii?Q?kxB6qE/KoGceShsC9H2HPh+ueimi1JAEMCYs+/IfhUHduxa5w0CYVdeLEC93?=
 =?us-ascii?Q?+gYsd9SBr+ycZxnHYK/bc3O3Zp+sdwn115Ns6KbEVaHZMIhZ+WGx8vE0iYsZ?=
 =?us-ascii?Q?0E6GnDaDjDzJsFm/uhQkuCy2UQ2AWka70M9lx1LJRuxPWrtUWUZnsL9cwF0T?=
 =?us-ascii?Q?tZJR4Mwq5mzvedxWraQlUyIU47O9JapBadH26tUJnfMdPBYu7elZagvQrxcm?=
 =?us-ascii?Q?q1F6P93L6yYRBbJ8xk7o+5xzquk4x1nvVhA4XJkdzvS+HLiSn/SZc61fTdEz?=
 =?us-ascii?Q?x6WU4L+uqbj3OAWvnXLOB3l9sKztHtUpeBJ0NBPF1sKNDs7V25FZtSyxsdOe?=
 =?us-ascii?Q?3YK462lJHzWdkIGCIISCTTSwi70uBvYqMxioqUtDV6WoIcN0fHoIhR0uLwR7?=
 =?us-ascii?Q?Zfz5WLBeR57jdec2GgHnU9gCPYlrAWmpr2TlO9b0Rt/kYg8z3MBxsQmVHmCr?=
 =?us-ascii?Q?dLYy+bODnGSdvnCqbHJ01PHSN5mp+KF99SKuW9lLQSgF1vJlBaz/voffYaU8?=
 =?us-ascii?Q?1vIm8lQ94pu/4bnHBqXKUL4Zd5eZ/+pZ9JrecoLNWJc5rbzbs/9F3udBa10W?=
 =?us-ascii?Q?LyIhFB5X5dQ9yTlSNmT4mIYM14XGkQp6QW+ob1+LzxgOI3V4GozvJRGa/VJl?=
 =?us-ascii?Q?saZz2vp89PJuvN7R2WKhjFWK2GVuscNLrS8MF16Z2/d4HB5Ee7Dqb3HonIPO?=
 =?us-ascii?Q?E6lw/2WlJF3sXIUmXZUugy552uoKKjBS8QEgeajWlxTe4qOuPGwsYa5eWAE/?=
 =?us-ascii?Q?iQPjCBKtGk4yKbO9QJqHxSi61NMHL4a2vvxThNxK8Zjc1kwyH7ryR+5LximV?=
 =?us-ascii?Q?g4+VliHB+kLDjY2RZ43ZVu+dOxiv/oI+t6asgVKz36OATxiNVIPRYFAt5cjn?=
 =?us-ascii?Q?1KxDnCgA1M91Z+xlJPbxrGeA6lH9NpWFDcF5fADxUvz73BAr7K0Yb2Pg5OUo?=
 =?us-ascii?Q?u24sqiKFNHaZx6FchBXkhkTAtTIbuQTADUXa2KFNAHJVv8oMVeuCzljfQeyw?=
 =?us-ascii?Q?IOJGypvlb8UOVNgLBoBYXvhSZRXX+ES5ZhbmBcDkMyhGdKRXD4N1cnx4ihuq?=
 =?us-ascii?Q?3YULcWXdps+YDhWZiFSBxy0JK7lPJaAq+KR6hyre9M4wnlUAY6He6FjknL8N?=
 =?us-ascii?Q?7Muy7YJ9estMvKoKc39MeQXEypnqOeFu70Hrup63FMSmdx6cyyI0G2g5CXFG?=
 =?us-ascii?Q?2Xz7qxPUmlYFbCA4tEPrB+KcllkUQScTzZ5080fTE82UeQhOWwI/jnapewMe?=
 =?us-ascii?Q?vIPsXA2maA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f78cd7a-6dd8-4905-3383-08df1df28c18
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 06:26:08.0771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCuZLzq9oK7645LMhM2YsaRhl0zbz+MM1fAcUPH1b8HdXKrxWiuvbqVmX4Q4MT8ujMcLHSVATJL8HmAiw+W3vomhCsSnZW9S785TzDLTE2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246841

- Upstream PR #122 was reverted and replaced by appending ldflags to
  lddlflags at configure time.
  perl recipe already passes -Alddlflags=3D' ${LDFLAGS}',

- Verified LDFLAGS still reach the libperl.so link (perl do_compile log,
  qemux86-64) after removing the patch.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...oss-add-LDFLAGS-when-linking-libperl.patch | 24 -------------------
 .../perl-cross/perlcross_1.6.5.bb             |  1 -
 2 files changed, 25 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-perl-cross-=
add-LDFLAGS-when-linking-libperl.patch

diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDF=
LAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-cross/files/00=
01-perl-cross-add-LDFLAGS-when-linking-libperl.patch
deleted file mode 100644
index dbddd9bc616..00000000000
--- a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-wh=
en-linking-libperl.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 10140792a3d9100ca38ddda5f47c0faeb26af1d4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 27 Nov 2018 15:37:40 +0100
-Subject: [PATCH] perl-cross: add LDFLAGS when linking libperl
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/122]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 4b80079..c6d6042 100644
---- a/Makefile
-+++ b/Makefile
-@@ -191,7 +191,7 @@ endif
-=20
- ifeq ($(useshrplib),true)
- $(LIBPERL):
--	$(CC) $(LDDLFLAGS) -o $@ $(filter %$o,$^) $(LIBS)
-+	$(CC) $(LDFLAGS) $(LDDLFLAGS) -o $@ $(filter %$o,$^) $(LIBS)
- else
- $(LIBPERL):
- 	$(AR) cru $@ $(filter %$o,$^)
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb b/meta/rec=
ipes-devtools/perl-cross/perlcross_1.6.5.bb
index 77ca5b0e302..64cbeb4078b 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb
@@ -12,7 +12,6 @@ inherit allarch github-releases
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;nam=
e=3Dperl-cross \
            file://README.md \
-           file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
            "

