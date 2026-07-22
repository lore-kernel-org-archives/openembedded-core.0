Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF914C4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:20:42 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43221.1784708437756185239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=omZGxDtZ;
 spf=pass (domain: est.tech, ip: 52.101.65.8, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXzymqW2yrc8QQnkvhQMjlzh4HV2gHy1nxo7CH7pKmOgE9cTPr/rEPiiD3Rn1Sxn8P1mQEX9b7xgsr0G9pLMXCvxwS2Mj3sfT8VQrJkRghCeGyQnbuvukX8YwuAPLz0pWFg4D+jcKk1aFPGC9rzW8XsXekTjU9mGktO+UQFF8XWVWnhdkwNJuDaV/rc2KpZ4AXQ00qwXmMuZHqPIMxHMG3dFV6YKuqIxCKx0lwgFbb31o+beGKYUatYxQUdKknkrOiRok5zt3Wj9VMACcabKj0ENsmAmF5xgZVZQ0Ta9BkqSF081apl7cDcqrf8tHyONTgvLlnK0SgATxB1oTfELZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWX9Ebjzl2/geou2kL+4vREcai+774h1I7GF7fx/tA4=;
 b=q/AJFeFnJvr6QaIi/U8qjiTbOiItO9UeEpMd4qsV8/iPTBnupXcabk/NrDvXAoiDzXv0TO8lI2vkS7v2qQC1G2K7KobOhdHForc6E68NcPFuWzSxWfq8WfVmMmfQXVW+UIo+YGBmwYkItrd6LQgn9JLFWaQwKdwUIP3KBFZWSBOgFl1DaxzF7U51ZIejbf5FPWR66abNP8VLJ9lsnYxYo65sx24pOcXOE+09FO5aVFC3/U9eHwaudVuAYy3iqDY7Fsq0mXEL03bGSy08CdV9ufxynoa1iXSAU13Wl0yXB3duHZ8qojRll6OkfqMys4s0yGYrIMCx867bz0VA3HGLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWX9Ebjzl2/geou2kL+4vREcai+774h1I7GF7fx/tA4=;
 b=omZGxDtZt/d0mIzz5185ZbTn4SMMGjdnF+onDnYxZ7n+mcjpa1aXA0vJqE+pJog9qna155d31+1Xmlzvkj4g8ka4+rkhqqqk5JB3FAo3Kgo6bQUX+bncpEFpsGi3Th8yPujvrTaAerk1noEMcFXPEfD1LwxKdoqu0r954pHioP1AYZV64oPXf97xOiK/EEO21wLXcyXqc50IS/lhBxS481r4aAoCj45q7Klzk9QbY5Hry0NK0uvxtEEwKSYFeFuXYB8rXJ3S8lnnlrP+7ZbhmUFvcDJoVJv3MMIkJa0pdJSyLDYOnkTKxSdk+eD0W0xQ1Kh27pcrdFey9cNUaHbuyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by PA1P189MB3492.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Wed, 22 Jul
 2026 08:20:35 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:20:35 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 1/5] wget: fix CVE-2026-58469
Date: Wed, 22 Jul 2026 10:20:14 +0200
Message-ID: <20260722082024.15137-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0292.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::14) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|PA1P189MB3492:EE_
X-MS-Office365-Filtering-Correlation-Id: df9cff61-3140-45e9-7638-08dee7ca1a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|10067099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FDhTCyMxfo+3Q/2QHk+YhTP8CUxR5ysr477jzkWasoyIZX5UIzLQRuy73GbpH1ZbdC87DI/eTBcKazOsj5OYxwCss8dkZZsB4Gi8uA45fzadw2Gqm2EZxcZCn1GKquYxST2Hqqu13WEtwcmgY6bxneIJcWFJNUKLuMbtgjBEA+dlabwKqg3IwMTW40zz4gzbU1bXgIgt7EtBAm6xQv64dGWqdqGOwUTzYt6CkCXm3oqHsr99akuyUHFqgCr4gf9tEQB5th5lX3XRG7AYveVXFxIU6aWjn7FhpgE0twCQ3UBEgoqnKSm7j/Git23wDAwAO2dCnQkJmx8ebFWqY5yhxHDCrNjNgoWfQYCsYIThYEEvWn1hmr8fkaZPhufeRlUBUi75VrMH2HozBtXX73anr9G3o/8nw9JMEs3gX/tFqCZHxnutujkpQID12Gax5iaff0j0ChlDsNm14gY3ay2HumwEY4Y0pM/J4NnD4yHP0EyJrY8E/kgYzzWmK72/UEYXOuxKfLpN2nUfMdx46sv9zyv+RccnaHvHIBJLrmLs2HmjLHQhby7CTdwccFhH5wQ+nmJzbhDrX2fq8VVrcug2L0/edyJS+wq8v0MxF6W01UkR0MZvwf0VPyBwyo2u6WM+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b7zYzNIX+sVpjFphkxKDLSm1KbXDcal/pLfdNLsr2kmgq1SdlVhUDIv6EaEP?=
 =?us-ascii?Q?O4Lhpdkx5Hd38+66JgMU3ZYf/qAFMhpm+GC7bC0KW0CPAfUXPPoTPHsSLQoI?=
 =?us-ascii?Q?1uLsbcphrzSRC6ucoLxkh1tZBkFG68Fu9xB+7NX7cCCxcioxNevKXljkgxAi?=
 =?us-ascii?Q?+Cqlz1hpsbMFYB1TynGRHgZBfaCxy8zuXubdgAGv+BzFwo8vgl2ZcHd70IYq?=
 =?us-ascii?Q?i47rOSTeUtAVldNdULTl37ZrqshltBma822BYz1ZGc2/x5z5clrBt967Q4au?=
 =?us-ascii?Q?xfV4RkcssZMEjK2siJS8EMK0phgj0GfJnMv4BuXzzgVk6OGcqFY5jpdS6a/S?=
 =?us-ascii?Q?keQkushgffr5bNw6Prsi0Y0uKskN+ZXKc/Nnq/+tRr/CoJBguQabHXhgANO6?=
 =?us-ascii?Q?Chy0b5yvCPWtTaImfenpkXLouRtEnKzbMHfEprz48Bu854t/kIcDfsJFCw0U?=
 =?us-ascii?Q?wE09/MeY1fTMw8cf3vQSA2Ycri5H8fUoWaIQvBoRxq36rLzd9hICP7HivdQt?=
 =?us-ascii?Q?CotVW0P+CTzv/IKenS3nJATnQjE9c96ulteuBUaLo73moAm9IuqqXiWatRng?=
 =?us-ascii?Q?CfDMFHLSpGP7ORZioj8HEvjZhLHk2H+L8iYBZ/Rg/VEy+nxyDF43w6qN6vNz?=
 =?us-ascii?Q?IFNveqTqnEI+doDh6rx8Tgxzn4hBBbN0xcALsgiHOgbRqUCYKOrP/EAows5B?=
 =?us-ascii?Q?w7l9etf6/Lj7KFiraZcSDKg5U+Jju1X/NmiHzJH3/DGkQMZRjrL5SONodWlf?=
 =?us-ascii?Q?nh2qA6DJp1BhhLRUJVy1cZ2FN+oDhEXE6bU+tZBQw8OCwQx8LyY5LTa2ruQe?=
 =?us-ascii?Q?NC6VAQ77fIeXXiFaPAq1I8DbU1myNj18mGi920rlAmX5n4vrZY5zIAl1+LTM?=
 =?us-ascii?Q?+CRlNhbtivWSSq0KDyfFXRjHEKO5GiyDmuA6kl8rMNXTjIz5utpppAqiLfvm?=
 =?us-ascii?Q?PBFeqjuUU497RDwuK0m6y+2iUL+LcPyazGkyB5Ibk39fjqBv0APLtO3Oh0ie?=
 =?us-ascii?Q?ejsXAnrv7HdlZVq5OOi3arJWjMOOuIEaGPubh2N7SXODqx0Hw1+ln32rZ1Kd?=
 =?us-ascii?Q?yX913mQGPMUnG5grtOSmYTE9wvEToMe5JS4xrrYHT6FHNHb5iqj2yZXbRODV?=
 =?us-ascii?Q?UWhB1zVeveZ9NT8S5t7sG3qj5X4QAA9u45DUiROaJJvYmSmvbE0VR20+RmYW?=
 =?us-ascii?Q?uN3V3M8S78OJWHWKk7aJGFUhySUXUcafnAoTKjTJrOTlP6VbMw6bFRe6IDn5?=
 =?us-ascii?Q?yPUEr4T04TvYI4Gr8GLqcVpUbVLBzs7bHWFCElh0KJkeiSpcCHOvdYHX2Wei?=
 =?us-ascii?Q?n461xhJzR/PTFSJl08ygk6PLTrbVq/kYSN9Ffp2oopqfGrUtIJN73LRs+Xdk?=
 =?us-ascii?Q?rYruEh+vc46uG9Z2MSXHA7Z0LQBL7CtuCju/OBAiMBQNyRYhjv8vAFvUb42l?=
 =?us-ascii?Q?OUfmxGVlbWmlUTDCF0wjKMeH/EXuDDmv5vx8vIOUDAaLTWvVFCa9oM0xzHLq?=
 =?us-ascii?Q?CP50ymWmxjhdi2Utw45h0m1JFWLPpawQD9djV7dVyKIOdAJIFahYK8ePzUlM?=
 =?us-ascii?Q?KzYv7uS9gVQm+O/B/JLIIEZO6o7F2BOcI/vR0FuK1Skpt/da+au+kOG9asyg?=
 =?us-ascii?Q?j2E2HEBE8XLzBcmKcpWEMmQGwqh03XZyKNRcFrpGrd43wjqEKq6OzHi84Tsg?=
 =?us-ascii?Q?o+jCO5GsRmNLwKDxzLI2sT5pc8kK4l3fgPuHYx1an4XUjIDJT34+ta575bFe?=
 =?us-ascii?Q?o6JSOosP5A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: df9cff61-3140-45e9-7638-08dee7ca1a9a
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:20:34.9692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDtU50cSaMPevXaIxK+Te1iZ4DKeEGuepuT2gNPJEcBC1twxXnxO6UqrCHTvCYQdss0KImf68z4AnK5lnEb2Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3492
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241615

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-58469.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58469
  https://www.cve.org/CVERecord?id=3DCVE-2026-58469
  https://security-tracker.debian.org/tracker/CVE-2026-58469
  https://ubuntu.com/security/CVE-2026-58469
  https://osv.dev/list?q=3DCVE-2026-58469

Upstream fix:
  https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb=
0b6f7826 [nvd]

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../wget/wget/CVE-2026-58469.patch            | 52 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-58469.patch
new file mode 100644
index 0000000000..c5d3df9090
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469.patch
@@ -0,0 +1,52 @@
+From c7d858a9ca8b9840e5edc520c36fe4f33f2e9cea Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:32:02 +0200
+Subject: [PATCH] * src/metalink.c (clean_metalink_string): Fix buffer
+ underflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58469
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/37a40f=
cb450153f69537c7cbc2a7a4fb0b6f7826]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/metalink.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index de2439c9..2d6e5846 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -1041,7 +1041,6 @@ void
+ clean_metalink_string (char **str)
+ {
+   int c;
+-  size_t len;
+   char *new, *beg, *end;
+=20
+   if (!str || !*str)
+@@ -1049,7 +1048,7 @@ clean_metalink_string (char **str)
+=20
+   beg =3D *str;
+=20
+-  while ((c =3D *beg) && (c =3D=3D '\n' || c =3D=3D '\r' || c =3D=3D '\t'=
 || c =3D=3D ' '))
++  while (isspace(*beg))
+     beg++;
+=20
+   end =3D beg;
+@@ -1062,12 +1061,10 @@ clean_metalink_string (char **str)
+   /* If we are at the end of the string, search the first legit
+      character going backward.  */
+   if (*end =3D=3D '\0')
+-    while ((c =3D *(end - 1)) && (c =3D=3D '\n' || c =3D=3D '\r' || c =3D=
=3D '\t' || c =3D=3D ' '))
++    while (end > beg && !isspace(*(end - 1)))
+       end--;
+=20
+-  len =3D end - beg;
+-
+-  new =3D xmemdup0 (beg, len);
++  new =3D xmemdup0 (beg, end - beg);
+   xfree (*str);
+   *str =3D new;
+ }
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-exten=
ded/wget/wget_1.25.0.bb
index f0d3458462..a1f34dfb5c 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -15,6 +15,7 @@ DEPENDS +=3D "autoconf-archive-native pod2man-native"
=20
 SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
+           file://CVE-2026-58469.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb=
726ac9d0da3784"
--=20
2.34.1


