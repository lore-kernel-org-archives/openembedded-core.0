Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999B9C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 08:32:14 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8372.1783672319766031995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 01:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SN/psNWu;
 spf=pass (domain: est.tech, ip: 52.101.84.20, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejFrCycC+LbP2p0owlQi9e91T/xcjgfpeP507IZYdrGj64BD2GaW8h1A57eVhfNrFIt4MPUK7URUyk873Rzqzw+ES7I6yhVqZMrSIOxKfiMCl/NkS/Tyru/Gwp2HjCdhN1HQHf8fG3eWZ9DCgxcSG6HYlKaPjxmzrA2A1F6MuoBSMTPYfhWt7JgxfDBpwwDZQaUPW/1gMO+TTMQ3vQwErOEwbvb5NsXagOQVeEWYrRITu10F6i1PwYcrj04s4hNA1yHG1CGipmmJjnw8CBMEnxP/zvO1vMzRZ2nZ5tnBW14BodPVFKsPPD4jDxlm0riouJ+DIAjShq5sy1pqredmqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF+aj36wfT1rIOolo8OJZ1tha3rO6WEIo9Rk0PfYIwA=;
 b=C2N4Mk9Bc8vqJtfWXRemHRVI5GJGTc9Jh1N7rKM9yiXNf1n3+NyvKj9E7Yt2mayVpKqsoiX4VhNCVaBwWQxaNIb2JMnfd2RgBsngC4sHqGc/Ec+R9hTF9Fd88YhDnjLN9WlOQs9zpbP4ZCSTD84NnigfOQoKIYEst5yO0XV9qDHgsPhafpkm8fSTSOvwS36Q/nkqN8fIuiYy3Z+z55urnfOJ6V0IyK0RjXCw9aItvRdniGQTIvMXGA9Q/Ry66I0j1XEUYKKKIo6+pPP7n0nDjx1BwNVFUY7jA+zcXbx+iJeJkc+T+59+2m9azVGLNY2/X9CVPGVJU//gnfEiGrA6Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF+aj36wfT1rIOolo8OJZ1tha3rO6WEIo9Rk0PfYIwA=;
 b=SN/psNWufVg93TzSlIbarg4AVbH7zENHAPJESPKcS1HhQOOWvzTkWfw+VvAJMuVZr/7Fj2iSrjhSkOvYed45C9Cfv2Yp6oVGNTNpy7kg+Ef81Unsgyg3jv4S0Isy6uI4yBw0K4kDawcJYN42lyp5rDwBe2GGtv7N3hwqIQhctXk4d9voZh5cjrLbyxjg1QsIV282Q7MYah4G3jqwSsN9lZ7jqgqB2RaVv+W/mhq2LcFVlUDHUkROW1OMU2Vo446C4bimxZVB2ssmMPJNnEzM8RnOLC6p0dMVGTADH6ETqlr1NEJAsnWrYcJGi/6geKpxjFwLPZVgI8lhUtk2w9K7+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV1P189MB2106.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:56::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 10 Jul
 2026 08:31:54 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0202.009; Fri, 10 Jul 2026
 08:31:54 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH] bzip2: Fix CVE-2026-42250
Date: Fri, 10 Jul 2026 10:31:31 +0200
Message-ID: <20260710083131.58029-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260710083131.58029-1-jaipaul.cheernam@est.tech>
References: <20260710083131.58029-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0020.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::25) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV1P189MB2106:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ccc872-a777-44d8-aa34-08dede5db259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|13003099007|22082099003|18002099003|11063799006|12006099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	fcclHFBkV1hLIDl0mOiWD+E78GtywsMf4g7DnHJtQi3xamkd9M/YOBGCxX4BcfMkr8nLGnlVhX3drwi5p1/qdH/GfKpb8QvsSINAZmZt87aExVqhT5a8HKnBfdMoTKiOed5PCq0PkHpZa1KmBEWJKHMf0cvgLpITVJ2skTFw31EddK0hjqfNCAZa292MxWCQgHjuFAw4wutGy+BayG4LgOccbPnjIWwMBNq3/Gnb7eYsz962s0YBcnt1szQ5l2F+6JM8sckOapKXNEIDrwHXylVo2BfGpTmBZhdgblOeNAjttpR8R+930IYhZ7ZTHuOtxRK+pZOD6D/HLSLPXVi9fQPvnuNeRYKmFeDeOchEwV0CL8DOzlHIbmUkjRneGwIhaHFfzFm5xnz5zyt+mIL+iFQYVevWtEf/07147NwalUv8ItVfnyiI6PZ02RmxuRcvczKrdM7uD4Z1JLB6ahRYl59OEr9HLo9KcxNurpWNHqdkqPLBGQEauGVdmN7rIPO9YBnbyni69y0lgYwnu8Kzc8wRDeIuoFkqw/m80duftdWyVFCyW7P83YqcXSwep1oIZt80xGl9Fj9DrTr5j2jFmD39L2bjAvLRBTrzeflPmbv9Qw1Y5s+iwaGD9dZQqDxERtFLuIXF4brlTAbO7GWNlsRGF9804dX9F0axAOjz5es=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(13003099007)(22082099003)(18002099003)(11063799006)(12006099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uRY3LTBjJh0gUOsii71d1QVbvK9lggevudkBrwN5/TMHw9Jth89iDxRPTUdH?=
 =?us-ascii?Q?oKUd0Hm1pkmg9bspdVVB8XBAwZePVLnZfxlMFxG7idUYJtNZQ7BZP5Ef1D9K?=
 =?us-ascii?Q?T91FmIBI+DYViOey3ObO9ek9vxGntXW4/Z+X3Tvn4y8NuCrMcIBolPBnKqT+?=
 =?us-ascii?Q?00Swxudu0+ydWNlfoW0WZRjqoTGm9toy799Ci6kN8EwXET5R4yhEcGTiVV1H?=
 =?us-ascii?Q?BBVMkJ0pgEeJ0Tx8EsDBkE4SfzUMlN+nWSA1lLp5IvmWLMwhDNFePbKBU/VF?=
 =?us-ascii?Q?1Tr1uC2194LjiRwD0W/oXb6Q9fSmkc8Mr0P+ogOjtJkJBE93f920AcSmZwGM?=
 =?us-ascii?Q?Psbjlx8n4oIi/pLnTW3cAr5UuvDYNj8BWJjr+0JFkotnVsx529JYTHaWaey3?=
 =?us-ascii?Q?1VvDvlcWucazbJV5DZJQUoC/89kIHM2IpboR3jN6LubTrhp+XBok/AKvkLbD?=
 =?us-ascii?Q?TLtvdpeyqyy7ZwnmzVa2LkSOjQRKaOHd3eMCdpVeh7NC93V6w+bcVnvnhTX8?=
 =?us-ascii?Q?j7ZFti8YJShDQJ294nV5u2XBnvysw6ZuIHN+Rnl9ENe8NlJqqZSrvdpvBsev?=
 =?us-ascii?Q?PnkJgQotp5IniypgjSgheCFQL00Jm5a8zdJ+8CJNdLlxYfETxNlPxGEkFTH+?=
 =?us-ascii?Q?DK1t++7BTVM4rj+46eMGsLXLl50RhriVBx+qMeaw/olA5e99RKsUQ7PCg8OC?=
 =?us-ascii?Q?FZeAiFhHuFT0y2P9j9+ytkR41KsuHzfb/V7iP9y58xj0kfHICW8nRqutBNak?=
 =?us-ascii?Q?z6ZpxSn7lQ0I/pusXbvG87gXKUuks34Rmx6trXys6d+1BF6DCSIClXHMw4ZF?=
 =?us-ascii?Q?fV9OvYhAiOxv4u6UhHu0J+RBeRtpju5VNB0GkC1rxBbDpcATKVYwkPGN2AOs?=
 =?us-ascii?Q?Qzrj70/tuhyJJKaQI+X1sColkVCOP6CmSCVfwAh7+DOmq5jBiq+gvdPuGpBM?=
 =?us-ascii?Q?cxWdBmI3l/B+6wt7JLIiUakxtyN7v+9J8GdRJAoaxcmoiqtrEJh7NOIUqcia?=
 =?us-ascii?Q?QOsw1XikvzQhoedXWhQti7vVlaOaahCOinjEcJlR2S3D4qjh7DKC+0N7jRAD?=
 =?us-ascii?Q?JngjGghvs8Ft3yaDFNWVvDr5hZQm4Vb1FF3TgiG4WWIOQpzNgYa4GCEfIZEa?=
 =?us-ascii?Q?tBg29kDuetqruaRxYJAhkKSxCF00RwoMB/zUFh7+XXjPMvrnS52uTW5RuEvX?=
 =?us-ascii?Q?GhklkyB77p7Y99G0HjXThu+vX+W3Zyfcm5+FHjLWdyEkaJqcfjXfbtLtIgUJ?=
 =?us-ascii?Q?9FKBmcs2szP8C08tp0ZNxtR1AoxvKYDyvKMpFpBJxvMbpnQu030PGH7BOwZh?=
 =?us-ascii?Q?A1LTSwXOQ34yrDP5HvHgrfuu/OCP17W+id59T2y04go2I+XIGL5kuhrxXHUW?=
 =?us-ascii?Q?Vzbo363o6IuVQ38U+V3oCtSYyihWiWb1ltrBRqml/zCIJwFtgTiy2ws0ZLMz?=
 =?us-ascii?Q?1Fcc0Y+dykcuk9/ZNDK8tjSco5kweDPlC9SPotzj0ROlsbkyfWwZDnu5xqhg?=
 =?us-ascii?Q?amMzd1AF6Ai6DJTmAqvMay+jyle8b/7+8N4QEC+W9IywUz5rgTSQNb8WXVSG?=
 =?us-ascii?Q?sXtlNjX7e7EnHrbFlTTZ0137NpCfRmRcraVKHUMU+NMaN3DDHU32hHM1nPao?=
 =?us-ascii?Q?6ZFhrMpeVfZf5fUEtP24H+orVMYfLVHyjw0fgcbJcn2f87SgDN+SCf56XYAG?=
 =?us-ascii?Q?jIYivTG0FpvykufvhnKAK3mNbjPY08w1keALQxH7HZzdowDXMolPuj8nxX4o?=
 =?us-ascii?Q?NMENbBTPaA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ccc872-a777-44d8-aa34-08dede5db259
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 08:31:54.0249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n13D2VYUpHVilgmelKKWhbmIQJu7iCXk6LbCRyPfT/87GpaZih02F+i4DkrysfmHVyXSkgm85iAntsS2Gmnxv/IgO7z6yLQmQJUKRjQdNbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 08:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240620

This patch applies the upstream fix as referenced in [1], using the commit =
shown in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-42250
[2] https://sourceware.org/cgit/bzip2/commit/?id=3D35d122a3df8b0cc4082a4d89=
fdc6ee99f375fe67

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../bzip2/bzip2/CVE-2026-42250.patch          | 35 +++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch

diff --git a/meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch b/meta/=
recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
new file mode 100644
index 0000000000..1679e74447
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
@@ -0,0 +1,35 @@
+From 71bf61d2e664c754ae5b1eb04018c8eaf5f99ae3 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Thu, 28 May 2026 16:15:45 +0200
+Subject: [PATCH] bzip2recover: Make sure to not process more than
+ BZ_MAX_HANDLED_BLOCKS
+
+There is an off-by-one in the check before calling tooManyBlocks. This
+causes the scanning loop to run one more time and cause a possible
+read or write one past the global bStart, bEnd, rbStart and rbEnd
+buffers. There are no known exploits of this issue and you will need
+to compile with something like gcc -fsanitize=3Daddress (ASAN
+AddressSanitizer) to observe the faulty read/write.
+
+This has been assigned CVE-2026-42250.
+
+CVE: CVE-2026-42250
+Upstream-Status: Backport [https://sourceware.org/cgit/bzip2/commit/?id=3D=
35d122a3df8b0cc4082a4d89fdc6ee99f375fe67]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bzip2recover.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bzip2recover.c b/bzip2recover.c
+index a8131e0..4b1c219 100644
+--- a/bzip2recover.c
++++ b/bzip2recover.c
+@@ -402,7 +402,7 @@ Int32 main ( Int32 argc, Char** argv )
+             rbEnd[rbCtr] =3D bEnd[currBlock];
+             rbCtr++;
+          }
+-         if (currBlock >=3D BZ_MAX_HANDLED_BLOCKS)
++         if (currBlock >=3D BZ_MAX_HANDLED_BLOCKS - 1)
+             tooManyBlocks(BZ_MAX_HANDLED_BLOCKS);
+          currBlock++;
+=20
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-exte=
nded/bzip2/bzip2_1.0.8.bb
index 9cecf6a331..36267e5073 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "https://sourceware.org/pub/${BPN}/${BPN}-${P=
V}.tar.gz \
            file://Makefile.am;subdir=3D${BP} \
            file://run-ptest \
            file://0001-fix-bzip2-version-tmp-aaa-will-hang.patch;subdir=3D=
${BP} \
+           file://CVE-2026-42250.patch;subdir=3D${BP} \
            "
 SRC_URI[sha256sum] =3D "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248=
e682cd0c4a2269"
=20

