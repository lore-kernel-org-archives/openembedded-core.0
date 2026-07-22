Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADA8C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 23:23:12 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12790.1784762582248888565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 16:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=lHUwZDmm;
 spf=pass (domain: est.tech, ip: 52.101.83.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tc70ZPqyDHu787gsr/mu2X9HqUTieL/PbdbxhFQc2BoeOFCXhZkX4FGKv5Lo/4OnSnCYX/QL2LYU8F7yu0EpCvNAj3rG4QsHmJ3KVEwU7qGUUHEsAGs1rY0HZTaDWbs0iQZ6vusiWgJzYNiNcd846piukV6dDk9LMduyyfTThzuzBu2aYbMSi68ebyCE+hgmndQQn3HWSzlskqgQS4DKt5TjCVmYpX3LB+NK/+SzGg5FwyH7G6ShkTELjKKGFln9QBxtrxBF/pGcVIlEmd/SMSQnA9YoekQUqoMoRvwgXOhAmrjGSdMN6ouVayiZPEKn2XoGOdWsh+lUE+hWidTL7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppW0sZmlVovZqwjzMm6PM7FgP5GZ4n8Fuv5PBJ3iurk=;
 b=ILihMEIidmEnO+f7vx9k3G84G/6uSljaJrsMVcO6MbRO+ZeV5A+EGNB5GZqoVSCutOio8aBJD2Gm2fTyLOzFBkm8snlbW/3DW/0ibyoUVFr+GQkixqnFbPBbuL8EraMRp0Hg4o2c0UeB9ntNQ6RYLQd9Jcp4BrPU+ron7tm6aHM0RGZYfn23E3jZPKcno+Qqxl57qC7RJvvuAHUkW63TR0EYso/Apm2yyb0BHLl9hlM5TxVIOogMdtyhx7GMtdtdtz7PK/3nyciDiksxe/nQ80+DO0K548Rf7UZ+WRl74TCukjlaxV3wztPv902cesn5+xt+S41cO7a46ep5U4Rcnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppW0sZmlVovZqwjzMm6PM7FgP5GZ4n8Fuv5PBJ3iurk=;
 b=lHUwZDmmFUswRlzChqRBv4tmblzL/3ATZOPVgNwyhW7Qg1tfvicBplA6jMC/SNg59PpTIZXMI4ZpgNJOMrTfSyyJMKaCYVN/aiHYYZoEo28Xe3PeyvF10KRvhXhXb9t1tPLivjds9Mk4T3lgLdFrvlIKjmtVcKMGss7JMQO8bSUfgi1sH2leo7s25leuzS52gGIrOjqO1dqv1BAaR4Xt5MX1RIZyVEeB1dRhpXTWTDh65lL29zyEO6vfUxYhMCC3q4biA0NUqafwUWk0N2OaZw9Wn2Xbl6SIWaxh6jjXtnVaghd/gQ3Q0eQGI1/ielj2UVbkXuXigGvTAB8jZ3gFCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DBBP189MB1211.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1ef::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.4; Wed, 22 Jul
 2026 23:22:57 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0270.004; Wed, 22 Jul 2026
 23:22:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2] perl: upgrade 5.42.2 -> 5.44.0
Date: Thu, 23 Jul 2026 01:22:51 +0200
Message-ID: <20260722232251.76599-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260721134339.16175-1-jaipaul.cheernam@est.tech>
References: <20260721134339.16175-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR06CA0015.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DBBP189MB1211:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c39ea6e-27f3-4536-9f00-08dee84829b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|6133799003|56012099006|10067099003|11063799006|12006099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	k6+VkeKTWnrRyII/mZ7HC/Qu8oSz9q16dcIATNVrwQLeAfuMMbbByrzhriiJpLDp7DLYKuoHackJSEM4dH/WRxeydcsTiQ++bTihqWThgs+k58oClWnP1PKaEo3aZl1jjSnd8Vt+Y6xkurgzGwrscOAk/7XV3D6FAqLzgaxXuBmlzgKRwHkxvP1n7/EAknk4TEKUPOn9Pq8TQCUGMgFTLy81xi/erKbf5kiOI3wACNpIRpw9a+OoCe3Nxxvq6kSWANsYtCaWc+8SJqhH+QOKBmoM37tVjcmZ2rC7zV3XK0BIXjaBSYSy7OuVWSBeecIqR24rYThkXVj7QNgYwxWpI566S9e4NJ0l0Owar1K2zJ1nk0IyV8TRooxUaJr6cdwdzGbWRdJGisWqjRtjPPsMkx/lJ9zvv9exh88zvCkQJtF47kkZkwuC7e7Pl1HEsVZO+CMXkkwqe3FHYmb2S/syQ33rG8MEpq8pPpZ9JGWtbg6seygV1sNXLtobptbPb86OlCQTFkMdCitgJmvIKMnoPnmaO3K57Mu3HQWn5sECMhdshx8gcXvri4kuoABirMYzgEOgHz6ikJ2VUH3Q1PnFraPtuE51SlSQWX69y4TnSDkkx5YjPcJCYp7BQfoe6X/z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(12006099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sIeJXWogJt/gNCBQpOF22aFuuUzu+os+dPDIQsp6y/7Km/1fDxNn++kgQ2cW?=
 =?us-ascii?Q?QZrJ+I+/FMkZF1DSO7Mq4rz+uGlXh4mtOUvzfbDBh1aMQzbeu2nXYSiXDJpS?=
 =?us-ascii?Q?ewJpiZQyYjFsq3URjVyuPTIOAPtrCDPeeFE/EIMRUVlmwEsMDuc9q4dy7J7m?=
 =?us-ascii?Q?u+kAF2eqpt3NLGjXkMhc8a4IY5WXj95Wj/G2mLdpUW9oTGQwNFdifiwmUAjJ?=
 =?us-ascii?Q?JRuwduzf3lXPSIby1dgoI2jMjSPPtM0r2UvOeXpkidC9v2W2YSWxuicWiA3F?=
 =?us-ascii?Q?9p+BoNk9dmokqPW3CoiS47wVjuZ/f4OlSuOtm1dfyZAvJDZIqqCq2jtV771u?=
 =?us-ascii?Q?dPv+WhxCLLGhbGhxfPTTBuu1B61NUuYts72D9iaAjhLNguczJYfZESbEaEZW?=
 =?us-ascii?Q?ukV3X08TAZmt3sLQJKytjdtcR3hYhuvM9ds2Tl2sspZ27ujZS0rEfaP/ke2K?=
 =?us-ascii?Q?JWJwGh4bvm+Q4SGSrwVTT7r7kNBdokazZRNPXLUnOrreYI/rbE+Z4mCqgdby?=
 =?us-ascii?Q?wpDnwCGLKg0iNlj6k33ngWT/Y43DkIzTOvzJUo20/OpbBIQP/PrQaPqzyCwe?=
 =?us-ascii?Q?As9EBChgY/ockh0kNSFJRJRKRyKXPOccmKfaXc6ylQY7JJmzh19aH6QEbSR+?=
 =?us-ascii?Q?KOqUrHixa0o6i74EhQfkc/aR/pnT3IsHK3oG+eqVQEJOBjiENos8xRqLduXI?=
 =?us-ascii?Q?NU5RmJH3k7NyaZRQLeePcG2pcTRd5upgnu9Yqyu37WkPF+DCwGFv6KEUUMxc?=
 =?us-ascii?Q?NJy7oi8dTx9YWxeHVFKEbJQz/S0sdmkAJxMhFfsKL3YQ6bmkjA6dRRwS727x?=
 =?us-ascii?Q?8nlhJkTZsW/kEEe9WVmnQqFV3WJK0PKyCk9EzbzKmuTsObI7lscuHxk94Axz?=
 =?us-ascii?Q?o363bkh+iuCLhWMPyQMDZLixyUb12MboyiyrWGVX5IOHiB/AG+HeBKZct3mz?=
 =?us-ascii?Q?0u77WuiHTFMu7PlWBwih0woHRPJp7K4YcCiKHhu8daMAFeExeAFbxj+H7B6l?=
 =?us-ascii?Q?wAz/HLjmjrQkZSqCjD5Qcjb3Gbif0NmZBQsTOrG0rBPJBcK0bjwVWflsE/Nc?=
 =?us-ascii?Q?FPQQSWSb4yGgynAdFV3dzSJAhse15Q78bp57FCoRfHKSEMs/w6Bc4nhcF64N?=
 =?us-ascii?Q?yidk5tdYs2yMcNqnmkEnU9UpUojMXy3bmlEhOaXku1G6ofPene9cRAo0OYDQ?=
 =?us-ascii?Q?YLGUBQ9/S9RguxPIq5qLUnPZKgFCrdPdcezq6ctS43v1gmErdK3j3NLWZkMz?=
 =?us-ascii?Q?0YKMUugn0jkXJi1qv4Vw1FG4t1VqCWrUCHyzoak3U++6fYoJ/3HG//v1RJRh?=
 =?us-ascii?Q?u9xNlas6oSuRfVNEvo1rSCSKcB56TQQgr2Mziay3DfiCU04D6zzlFmcqSNmM?=
 =?us-ascii?Q?xSuG5myRF4/+z/GiL541QOMc8BYOG+eAPs6eAFACmIscoyZejTzttsCF0P5i?=
 =?us-ascii?Q?Kz5mM1EgUBNXj5fAsT5d4Ymci1m8rv3IAUPYqhlt6IaBvyguzbDVVWJi98df?=
 =?us-ascii?Q?zAAHO/h/ud6NC/BXrJ8VroYFPlerwrKpSN/HpcCSsx/wjyxlY8bDDbAX9Hws?=
 =?us-ascii?Q?UrbAVxOhfH3m4X5I5yy+3KxtKqTRGdcKvYTf+b4HFBmJCWrEG+uHvueCCwMu?=
 =?us-ascii?Q?LR+9z8r15bdqBOK70sG2BrypOizpIA1JQMyd1kmDB65SHWMj5wtp7MaFjBdi?=
 =?us-ascii?Q?+/sZgom/hLxWu82dqg5xRdP1iHRWZPsnF6OnbuWjQYYwB6s60+s85gLKp+1P?=
 =?us-ascii?Q?0lkNpOOLcXUYU2+Sp9WFmXWYpBkvUdE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c39ea6e-27f3-4536-9f00-08dee84829b5
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 23:22:56.9686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGSk7gG+z2XxzYcY5nZjNy9jckaookhzKNX4KaVAaAMhF/+jpbAL5lYMGdHuVmJ0rHLcXjeOxcT3bPSADQKPnAHX8SGA7HCQR509zVVkl68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP189MB1211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 23:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241762

Changes: https://perldoc.perl.org/5.44.0/perldelta

Add perlcross patches to support perl 5.44.0:
- Patchset symlinks for perl5-5.44.0
- Configure checks for d_getentropy, i_stdckdint, i_sysrandom
- Fix checkfield() for C23/GCC 16 compatibility

Verified: ptest 2730 passed, 0 failed, 211 skipped (qemuarm64).

Drop patches already included in this release:
- CVE-2026-8376-01.patch (upstream commit e842efdafe7c)
- CVE-2026-8376-02.patch (upstream commit 5e7f119eb2bb)
- determinism.patch (Encode::Byte sort fix)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes in v2:
- Fix perlcross checkfield() for C23/GCC 16 compatibility to
  resolve ext/POSIX/t/time.t ptest failures
---
 .../files/0001-patches-for-perl-5.42.2.patch  | 110 ------------------
 .../files/0001-patches-for-perl-5.44.0.patch  | 110 ++++++++++++++++++
 ...Add-configure-checks-for-perl-5.44.0.patch |  47 ++++++++
 ...Fix-checkfield-for-C23-compatibility.patch |  35 ++++++
 .../perl-cross/perlcross_1.6.4.bb             |   4 +-
 .../perl/files/CVE-2026-8376-01.patch         |  62 ----------
 .../perl/files/CVE-2026-8376-02.patch         |  49 --------
 .../perl/files/determinism.patch              |  51 --------
 .../perl/{perl_5.42.2.bb =3D> perl_5.44.0.bb}   |   5 +-
 9 files changed, 196 insertions(+), 277 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-for=
-perl-5.42.2.patch
 create mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-for=
-perl-5.44.0.patch
 create mode 100644 meta/recipes-devtools/perl-cross/files/0002-Add-configu=
re-checks-for-perl-5.44.0.patch
 create mode 100644 meta/recipes-devtools/perl-cross/files/0003-Fix-checkfi=
eld-for-C23-compatibility.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
 delete mode 100644 meta/recipes-devtools/perl/files/determinism.patch
 rename meta/recipes-devtools/perl/{perl_5.42.2.bb =3D> perl_5.44.0.bb} (98=
%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5=
.42.2.patch b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-=
5.42.2.patch
deleted file mode 100644
index 8d9aa26293..0000000000
--- a/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.42.2.p=
atch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 61e182b82c13111c91ccbe9f6e94ceb4164b2aea Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Wed, 29 Apr 2026 12:43:32 +0200
-Subject: [PATCH] patches for perl-5.42.2
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/174]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- cnf/diffs/perl5-5.42.2/constant.patch       | 1 +
- cnf/diffs/perl5-5.42.2/dynaloader.patch     | 1 +
- cnf/diffs/perl5-5.42.2/findext.patch        | 1 +
- cnf/diffs/perl5-5.42.2/installscripts.patch | 1 +
- cnf/diffs/perl5-5.42.2/liblist.patch        | 1 +
- cnf/diffs/perl5-5.42.2/makemaker.patch      | 1 +
- cnf/diffs/perl5-5.42.2/posix-makefile.patch | 1 +
- cnf/diffs/perl5-5.42.2/test-checkcase.patch | 1 +
- cnf/diffs/perl5-5.42.2/test-makemaker.patch | 1 +
- cnf/diffs/perl5-5.42.2/xconfig.patch        | 1 +
- 10 files changed, 10 insertions(+)
- create mode 120000 cnf/diffs/perl5-5.42.2/constant.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/dynaloader.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/findext.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/installscripts.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/liblist.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/makemaker.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/posix-makefile.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/test-checkcase.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/test-makemaker.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/xconfig.patch
-
-diff --git a/cnf/diffs/perl5-5.42.2/constant.patch b/cnf/diffs/perl5-5.42.=
2/constant.patch
-new file mode 120000
-index 0000000..065e198
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/constant.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/constant.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/dynaloader.patch b/cnf/diffs/perl5-5.4=
2.2/dynaloader.patch
-new file mode 120000
-index 0000000..ffb73eb
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/dynaloader.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/dynaloader.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/findext.patch b/cnf/diffs/perl5-5.42.2=
/findext.patch
-new file mode 120000
-index 0000000..9efbe5b
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/findext.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/findext.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/installscripts.patch b/cnf/diffs/perl5=
-5.42.2/installscripts.patch
-new file mode 120000
-index 0000000..1c05e0f
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/installscripts.patch
-@@ -0,0 +1 @@
-+../perl5-5.36.0/installscripts.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/liblist.patch b/cnf/diffs/perl5-5.42.2=
/liblist.patch
-new file mode 120000
-index 0000000..5037380
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/liblist.patch
-@@ -0,0 +1 @@
-+../perl5-5.42.0/liblist.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/makemaker.patch b/cnf/diffs/perl5-5.42=
.2/makemaker.patch
-new file mode 120000
-index 0000000..d7bd609
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/makemaker.patch
-@@ -0,0 +1 @@
-+../perl5-5.38.0/makemaker.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/posix-makefile.patch b/cnf/diffs/perl5=
-5.42.2/posix-makefile.patch
-new file mode 120000
-index 0000000..29463b7
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/posix-makefile.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/posix-makefile.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/test-checkcase.patch b/cnf/diffs/perl5=
-5.42.2/test-checkcase.patch
-new file mode 120000
-index 0000000..36c5186
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/test-checkcase.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/test-checkcase.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/test-makemaker.patch b/cnf/diffs/perl5=
-5.42.2/test-makemaker.patch
-new file mode 120000
-index 0000000..4e970ff
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/test-makemaker.patch
-@@ -0,0 +1 @@
-+../perl5-5.34.0/test-makemaker.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/xconfig.patch b/cnf/diffs/perl5-5.42.2=
/xconfig.patch
-new file mode 120000
-index 0000000..87ac501
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/xconfig.patch
-@@ -0,0 +1 @@
-+../perl5-5.42.0/xconfig.patch
-\ No newline at end of file
diff --git a/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5=
.44.0.patch b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-=
5.44.0.patch
new file mode 100644
index 0000000000..36f065419f
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.p=
atch
@@ -0,0 +1,110 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 21 Jul 2026 09:10:00 +0000
+Subject: [PATCH] patches for perl-5.44.0
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ cnf/diffs/perl5-5.44.0/constant.patch       | 1 +
+ cnf/diffs/perl5-5.44.0/dynaloader.patch     | 1 +
+ cnf/diffs/perl5-5.44.0/findext.patch        | 1 +
+ cnf/diffs/perl5-5.44.0/installscripts.patch | 1 +
+ cnf/diffs/perl5-5.44.0/liblist.patch        | 1 +
+ cnf/diffs/perl5-5.44.0/makemaker.patch      | 1 +
+ cnf/diffs/perl5-5.44.0/posix-makefile.patch | 1 +
+ cnf/diffs/perl5-5.44.0/test-checkcase.patch | 1 +
+ cnf/diffs/perl5-5.44.0/test-makemaker.patch | 1 +
+ cnf/diffs/perl5-5.44.0/xconfig.patch        | 1 +
+ 10 files changed, 10 insertions(+)
+ create mode 120000 cnf/diffs/perl5-5.44.0/constant.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/dynaloader.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/findext.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/installscripts.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/liblist.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/makemaker.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/posix-makefile.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/test-checkcase.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/test-makemaker.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/xconfig.patch
+
+diff --git a/cnf/diffs/perl5-5.44.0/constant.patch b/cnf/diffs/perl5-5.44.=
0/constant.patch
+new file mode 120000
+index 0000000..065e198
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/constant.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/constant.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/dynaloader.patch b/cnf/diffs/perl5-5.4=
4.0/dynaloader.patch
+new file mode 120000
+index 0000000..ffb73eb
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/dynaloader.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/dynaloader.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/findext.patch b/cnf/diffs/perl5-5.44.0=
/findext.patch
+new file mode 120000
+index 0000000..9efbe5b
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/findext.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/findext.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/installscripts.patch b/cnf/diffs/perl5=
-5.44.0/installscripts.patch
+new file mode 120000
+index 0000000..1c05e0f
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/installscripts.patch
+@@ -0,0 +1 @@
++../perl5-5.36.0/installscripts.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/liblist.patch b/cnf/diffs/perl5-5.44.0=
/liblist.patch
+new file mode 120000
+index 0000000..5037380
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/liblist.patch
+@@ -0,0 +1 @@
++../perl5-5.42.0/liblist.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/makemaker.patch b/cnf/diffs/perl5-5.44=
.0/makemaker.patch
+new file mode 120000
+index 0000000..d7bd609
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.38.0/makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/posix-makefile.patch b/cnf/diffs/perl5=
-5.44.0/posix-makefile.patch
+new file mode 120000
+index 0000000..29463b7
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/posix-makefile.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/posix-makefile.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/test-checkcase.patch b/cnf/diffs/perl5=
-5.44.0/test-checkcase.patch
+new file mode 120000
+index 0000000..36c5186
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/test-checkcase.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/test-checkcase.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/test-makemaker.patch b/cnf/diffs/perl5=
-5.44.0/test-makemaker.patch
+new file mode 120000
+index 0000000..4e970ff
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/test-makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.34.0/test-makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/xconfig.patch b/cnf/diffs/perl5-5.44.0=
/xconfig.patch
+new file mode 120000
+index 0000000..87ac501
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/xconfig.patch
+@@ -0,0 +1 @@
++../perl5-5.42.0/xconfig.patch
+\ No newline at end of file
diff --git a/meta/recipes-devtools/perl-cross/files/0002-Add-configure-chec=
ks-for-perl-5.44.0.patch b/meta/recipes-devtools/perl-cross/files/0002-Add-=
configure-checks-for-perl-5.44.0.patch
new file mode 100644
index 0000000000..e7fd9df2f5
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-=
perl-5.44.0.patch
@@ -0,0 +1,47 @@
+From d6010680c68655b782c2e07bd0d38562c1ad0ccb Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 21 Jul 2026 09:28:12 +0000
+Subject: [PATCH] Add configure checks for perl 5.44.0 new symbols
+
+Add detection for d_getentropy, i_stdckdint, and i_sysrandom which
+are new config symbols required by perl 5.44.0.
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ cnf/configure_func.sh | 1 +
+ cnf/configure_hdrs.sh | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/cnf/configure_func.sh b/cnf/configure_func.sh
+index 20f9cdf..4cbee2f 100644
+--- a/cnf/configure_func.sh
++++ b/cnf/configure_func.sh
+@@ -104,6 +104,7 @@ checkfunc d_getaddrinfo 'getaddrinfo' "NULL,NULL,NULL,=
NULL" 'sys/types.h sys/soc
+ checkfunc d_get_current_dir_name 'get_current_dir_name' "" 'unistd.h'
+ checkfunc d_getcwd 'getcwd' 'NULL,0' 'unistd.h'
+ checkfunc d_getespwnam 'getespwnam'
++checkfunc d_getentropy 'getentropy' 'NULL,0' 'unistd.h'
+ checkfunc d_getfsstat 'getfsstat' "NULL,0,0" 'sys/types.h sys/mount.h'
+ checkfunc d_getgrent 'getgrent' "" 'sys/types.h grp.h'
+ checkfunc d_getgrps 'getgroups' "0,NULL" 'unistd.h'
+diff --git a/cnf/configure_hdrs.sh b/cnf/configure_hdrs.sh
+index 249f5bc..b2d9d88 100644
+--- a/cnf/configure_hdrs.sh
++++ b/cnf/configure_hdrs.sh
+@@ -64,6 +64,7 @@ checkhdr i_socks 'socks.h'
+ # i_stdarg below
+ checkhdr i_stdbool 'stdbool.h'
+ checkhdr i_stddef 'stddef.h'
++checkhdr i_stdckdint 'stdckdint.h'
+ checkhdr i_stdint 'stdint.h'
+ checkhdr i_stdlib 'stdlib.h'
+ checkhdr i_string 'string.h'
+@@ -88,6 +89,7 @@ checkhdr i_syssockio 'sys/sockio.h'
+ checkhdr i_sysstat 'sys/stat.h'
+ checkhdr i_sysstatfs 'sys/statfs.h'
+ checkhdr i_sysstatvfs 'sys/statvfs.h'
++checkhdr i_sysrandom 'sys/random.h'
+ checkhdr i_systime 'sys/time.h'
+ define i_systimek 'undef' # not a plain header check
+ checkhdr i_systimes 'sys/times.h'
diff --git a/meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for=
-C23-compatibility.patch b/meta/recipes-devtools/perl-cross/files/0003-Fix-=
checkfield-for-C23-compatibility.patch
new file mode 100644
index 0000000000..b92995b131
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-co=
mpatibility.patch
@@ -0,0 +1,35 @@
+From 7faa8a36afb579f07101a48065e4a19729034807 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 22 Jul 2026 09:21:26 +0000
+Subject: [PATCH] configure_type_ext: Fix checkfield for C23/GCC 16
+
+In C23, 'void foo()' means no parameters, so calling foo(value.field)
+fails with GCC 16 when -Werror is used. This breaks detection of
+struct fields like tm_gmtoff and tm_zone.
+
+Use (void)value.field instead, which works for any field type.
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ cnf/configure_type_ext.sh | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/cnf/configure_type_ext.sh b/cnf/configure_type_ext.sh
+index 0136c90..9ecd3fb 100644
+--- a/cnf/configure_type_ext.sh
++++ b/cnf/configure_type_ext.sh
+@@ -7,11 +7,9 @@ checkfield() {
+ =09
+ 	try_start
+ 	try_includes $4
+-	try_add 'void foo();'
+-	try_add 'void bar()'
+-        try_add "{"
++	try_add 'void bar(void) {'
+ 	try_add "	$2 value;"
+-	try_add "	foo(value.$3);"
++	try_add "	(void)value.$3;"
+ 	try_add "}"
+ 	try_compile
+=20
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb b/meta/rec=
ipes-devtools/perl-cross/perlcross_1.6.4.bb
index bc5bb4f4d7..1aeee7a2c9 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
@@ -15,7 +15,9 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/perl-cross=
-${PV}.tar.gz;name=3Dperl-c
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
-           file://0001-patches-for-perl-5.42.2.patch \
+           file://0001-patches-for-perl-5.44.0.patch \
+           file://0002-Add-configure-checks-for-perl-5.44.0.patch \
+           file://0003-Fix-checkfield-for-C23-compatibility.patch \
            "
 GITHUB_BASE_URI =3D "https://github.com/arsv/perl-cross/releases/"
=20
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch b/meta=
/recipes-devtools/perl/files/CVE-2026-8376-01.patch
deleted file mode 100644
index af94eec29c..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From fd23f4370d24d00352d1cc09b16687f16da6ae5b Mon Sep 17 00:00:00 2001
-From: Tony Cook <tony@develop-help.com>
-Date: Tue, 12 May 2026 14:47:31 +1000
-Subject: [PATCH 1/2] perl/perl-security#147: test cases
-
-The suggested case from the ticket and an alternative.
-
-(cherry picked from commit e842efdafe7c51a687a4907e4887988fe6a025ef)
-
-CVE: CVE-2026-8376
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e842efdafe=
7c51a687a4907e4887988fe6a025ef]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.=
com>
----
- t/re/pat_psycho.t | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
-index 336039521d..73a7992372 100644
---- a/t/re/pat_psycho.t
-+++ b/t/re/pat_psycho.t
-@@ -10,7 +10,7 @@
- use strict;
- use warnings;
- use 5.010;
--
-+use Config;
-=20
- sub run_tests;
-=20
-@@ -31,7 +31,7 @@ BEGIN {
-=20
- skip_all('$PERL_SKIP_PSYCHO_TEST set') if $ENV{PERL_SKIP_PSYCHO_TEST};
-=20
--plan tests =3D> 15;  # Update this when adding/deleting tests.
-+plan tests =3D> 17;  # Update this when adding/deleting tests.
-=20
- run_tests() unless caller;
-=20
-@@ -211,6 +211,20 @@ EOF
-=20
-=20
-     }
-+
-+  SKIP:
-+    { # sec #147
-+        $Config{ptrsize} =3D=3D 4
-+          or skip "these only fail on x32 and use too much memory on x64"=
, 2;
-+        local $::TODO =3D "This crashes";
-+        # original case
-+        fresh_perl_like('/\x{10000}{1073741824}/',
-+                        qr/Regexp out of space/, {}, "ssize_t overflow");
-+
-+        # synthesized but similar case
-+        fresh_perl_like('/(?:\x{10001}\x{10000}){536870912}/',
-+                        qr/Regexp out of space/, {}, "ssize_t overflow ag=
ain");
-+    }
- } # End of sub run_tests
-=20
- 1;
---=20
-2.43.0
-
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch b/meta=
/recipes-devtools/perl/files/CVE-2026-8376-02.patch
deleted file mode 100644
index 39b3d510fe..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 49c18d4c91d5b49e0a7cbb8277f3149198004c36 Mon Sep 17 00:00:00 2001
-From: Tony Cook <tony@develop-help.com>
-Date: Tue, 12 May 2026 14:51:00 +1000
-Subject: [PATCH 2/2] perl/perl-security#147: test against the actual chara=
cter
- lengths
-
-(cherry picked from commit 5e7f119eb2bb1181be908701f22bf7068e722f1c)
-
-CVE: CVE-2026-8376
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5e7f119eb2=
bb1181be908701f22bf7068e722f1c]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.=
com>
----
- regcomp_study.c   | 7 +++++++
- t/re/pat_psycho.t | 1 -
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/regcomp_study.c b/regcomp_study.c
-index 9106452dd5..05f1b017b1 100644
---- a/regcomp_study.c
-+++ b/regcomp_study.c
-@@ -2770,6 +2770,13 @@ Perl_study_chunk(pTHX_
-                                                (U8 *) SvEND(data->last_fo=
und))
-                                 - (U8*)s;
-                         l -=3D old;
-+
-+                        if (l > 0 &&
-+                            (mincount >=3D SSize_t_MAX / (SSize_t)l
-+                             || old > SSize_t_MAX - mincount * (SSize_t)l=
)) {
-+                            FAIL("Regexp out of space");
-+                        }
-+
-                         /* Get the added string: */
-                         last_str =3D newSVpvn_utf8(s  + old, l, UTF);
-                         last_chrs =3D UTF ? utf8_length((U8*)(s + old),
-diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
-index 73a7992372..9fd764fd5e 100644
---- a/t/re/pat_psycho.t
-+++ b/t/re/pat_psycho.t
-@@ -216,7 +216,6 @@ EOF
-     { # sec #147
-         $Config{ptrsize} =3D=3D 4
-           or skip "these only fail on x32 and use too much memory on x64"=
, 2;
--        local $::TODO =3D "This crashes";
-         # original case
-         fresh_perl_like('/\x{10000}{1073741824}/',
-                         qr/Regexp out of space/, {}, "ssize_t overflow");
---=20
-2.43.0
-
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/reci=
pes-devtools/perl/files/determinism.patch
deleted file mode 100644
index 61ba1a5791..0000000000
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 012e670f8fb6d4c6c196c91909c95358ca9f6289 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Wed, 5 Feb 2020 23:54:02 +0000
-Subject: [PATCH] Fixes to make the perl build reproducible:
-
-a) Remove the \n from configure_attr.sh since it gets quoted differently d=
epending on
-   whether the shell is bash or dash which can cause the test result to be=
 incorrect.
-   Reported upstream: https://github.com/arsv/perl-cross/issues/87
-
-b) Sort the order of the module lists from configure_mods.sh since otherwi=
se
-   the result isn't the same leading to makefile differences.
-   Reported upstream: https://github.com/arsv/perl-cross/issues/88
-
-c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends =
whilst
-   there for good measure)
-   Submitted to upstream perl: https://github.com/dankogai/p5-encode/pull/=
179
-
-d) Use bash for perl-cross configure since otherwise trnl gets set to "\n"=
 with bash
-   and "" with dash
-   Reported upstream: https://github.com/arsv/perl-cross/issues/87
-
-RP 2020/2/7
-
-Upstream-Status: Submitted [see links above]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
----
- cpan/Encode/Byte/Makefile.PL | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cpan/Encode/Byte/Makefile.PL b/cpan/Encode/Byte/Makefile.PL
-index 6824bbb..4af4a50 100644
---- a/cpan/Encode/Byte/Makefile.PL
-+++ b/cpan/Encode/Byte/Makefile.PL
-@@ -171,7 +171,7 @@ sub postamble
-     my $lengthsofar =3D length($str);
-     my $continuator =3D '';
-     $str .=3D "$table.c : $enc2xs Makefile.PL";
--    foreach my $file (@{$tables{$table}})
-+    foreach my $file (sort (@{$tables{$table}}))
-     {
-         $str .=3D $continuator.' '.$self->catfile($dir,$file);
-         if ( length($str)-$lengthsofar > 128*$numlines )
-@@ -189,7 +189,7 @@ sub postamble
-         qq{\n\t\$(PERL) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
-     open (FILELIST, ">$table.fnm")
-         || die "Could not open $table.fnm: $!";
--    foreach my $file (@{$tables{$table}})
-+    foreach my $file (sort (@{$tables{$table}}))
-     {
-         print FILELIST $self->catfile($dir,$file) . "\n";
-     }
diff --git a/meta/recipes-devtools/perl/perl_5.42.2.bb b/meta/recipes-devto=
ols/perl/perl_5.44.0.bb
similarity index 98%
rename from meta/recipes-devtools/perl/perl_5.42.2.bb
rename to meta/recipes-devtools/perl/perl_5.44.0.bb
index 30e707df0a..a449b904fa 100644
--- a/meta/recipes-devtools/perl/perl_5.42.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.44.0.bb
@@ -14,10 +14,7 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.tar=
.gz;name=3Dperl \
            file://native-perlinc.patch \
            file://perl-dynloader.patch \
            file://0002-Constant-Fix-up-shebang.patch \
-           file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-deter=
m.patch \
-           file://CVE-2026-8376-01.patch \
-           file://CVE-2026-8376-02.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \
@@ -26,7 +23,7 @@ SRC_URI:append:class-target =3D " \
            file://encodefix.patch \
 "
=20
-SRC_URI[perl.sha256sum] =3D "9384e8deb75b7b1695e5637971b752281aaecd025a3d5=
d4734d33c1d0adfee47"
+SRC_URI[perl.sha256sum] =3D "3b855066b92491cb40e86affb1ca57d1a388aa43e51b9=
1c7806a32c2f65f96c3"
=20
 B =3D "${WORKDIR}/perl-${PV}-build"
=20

