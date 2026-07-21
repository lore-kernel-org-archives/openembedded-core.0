Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51E2C44532
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 13:46:31 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23118.1784641583863960667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 06:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=pcK+TUEL;
 spf=pass (domain: est.tech, ip: 52.101.65.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zm9Sl4CCySoXHbQosrTuDOwwW3Gme5Sbw5ePDyVKkttn/axL+hAzvT625WXDn+dYeDUBNVY4hjQaAw4CXmt2/q/lhJPsdeYkedbY+eo9COB4aWJLzg81weysSpimnXylVAu9RMiT5ERz/TcCiF1xDbjOiidnM9pE6um3Bf8k9HLWe6JlQnCWJrLEDlZtnw82Q/SDgRu6SsUF/8o9d4sqkmMAi5HhJk5ZGkk8d40WzBBPaM0I46WaIOPtmLspgeUmQEYgQQc1Y3Yd6Cz2zF3U4lYeqDyJmbhTxe0AVnZqYQi3i2G7V/08BuXBUHa2LohC3d8P+XhBFf810rUuKUSJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5q7N+Pi21W+hKtMHAny2CcktbYBN0nNt35gxSCc1/4=;
 b=O7Fksm3bWnYmdHTldQzu/tAcK6r9qenNK6f4Iv5hIuZ5ce9cv4SA8RtYD5RRF9CfxoCwA039eKefiJyA8KPP4I0xFqeKx7IB/KEHs7JApvrlhyG9g43eYtj41jqhQn6YOZbL5hGvvNUH7dbM/h+ER0plTs5sWUoG+ATEwA71VGCwaJ5SK/3gsp/f5rfARGxaBNaLGLML+OByU2pcOXcg1Ce0cLJojAsmA7Gof/OnaiAkXs3qe6yacWEvRxmxcDNEkJe0N8KNVX6//apcl410GJ6kljmRFaVWb3cg1//UDh0Oay0G4yBALnjWP2MgNHmAm3nsaflFDjlueJolyxhjVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5q7N+Pi21W+hKtMHAny2CcktbYBN0nNt35gxSCc1/4=;
 b=pcK+TUEL2gGqmiGLdo1lBCw1nOx4OhmLVZNnwsCkdcMfL/yE/fOtF7uTqD0+LBEWyGSbeo63c7IMt+4IOmZd6s73Rl39rlwfC7xdrv7QNs3KnP3Kp8jyG50lPfI5198lylHPloTlYkjLxPNgEb2yG5vD+uBJyHQUAgexBo3hkyEBybeoOlmfE9gqZNHA5K4L/Txdzh+ghruN78oxrx6md8y8VRTvPeSJnKIlQTBpNahkzxoh7DjNw+6XfLZNKgl5PhXfK5Y2VRIlhf5gg/yZrypW3y5zrAuYK6EFmufB1ciB46yEoxM5nbBmjEqq3u61LEP2IMbZPzsDu/JX34QwpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by FRWP189MB3482.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 13:46:23 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 13:46:23 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH 1/3] perl: fix CVE-2026-13221
Date: Tue, 21 Jul 2026 15:46:14 +0200
Message-ID: <20260721134616.16538-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260721134616.16538-1-jaipaul.cheernam@est.tech>
References: <20260721134616.16538-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0229.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::24) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|FRWP189MB3482:EE_
X-MS-Office365-Filtering-Correlation-Id: f2aea252-811e-4252-ef5c-08dee72e73d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|12006099003|13003099007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	3QsfgVIv4tMZIoPmUg2SFnMPPys4wYiAMqtnYR0wIJdwn273dnDMGfYjPVwit6JWd3NqEUACmR2OKhC3+09BWXFf1A9b9YXRFJ/mdvJZB0gen8VdHUb8eLsSp1TfrkZJlH7RXyL+u9QJA0C9LOedokR6doynKu7YaA4UMtCCxKJFBCKGfm6/avBoURMYQEd4d8RNKtL/ZeEvpOpg1XT0XCfHm0J52lDYNebpcmFAGHhWjg01VBFHonScUkfIEDaD5Fy/0LoTvk+9BO7qSU+Cyd1GGtIVVHoqEHS3HEJRQyKC236IuIxJqMcbPZKgz0bLMngXnbOLr3W3AB+Y3za7i1DNwlrPEyfBt/mb4coVSM9SjH4Rauedv6G8oMuKdD62ISDUXriLZfbNsMGGTAgbwMLcci4I54pOgcA9kmlnIe1CAJK2LZazbWcz4uE5+E+YlAvljYUkPwyM1UNA7nZ6/joKuYEtWcEZVYo+vs6fzon3qJVjWUkYcg0Cct1UBjx3+gYJm3hcUFMzbc2t8MwMY9ghyuqbaJ164HsMjhpxi7sYio2MX4ofR70Ndcw4t3bhlWABfdBNGVX6sokkQjBYNsKW9wYowm5ppNjdnq7Ce+Aix3WnmRL009KEYMcJ5MwH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(12006099003)(13003099007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B/8RD2aw82tbOMvk0qQtras6S3r5luG+UmfUzKpWT61QFsvLrZB/YWbikQU6?=
 =?us-ascii?Q?3al3DFwNBfKJaN78fXa3Ys0AysJ9ACXepcTe0x2kHauBDph3rbsM1YTYOXmV?=
 =?us-ascii?Q?kh0PDxQd5JpchuLPU5s1SDcnYt7ZstaJxwAJS/g4O3gYLNbq0DLA5WX0kZmG?=
 =?us-ascii?Q?nuLVaJDrQzk/kRUejCYlLdyLVy2BI1NIDnnw6pEASvfFcudDc5XJER/S5BcC?=
 =?us-ascii?Q?l9BIPScMhxpqkxv4YxcuPVUBRgEil9ZWfIC0NGFJbHXC+PAirIlpQzNFN1El?=
 =?us-ascii?Q?pCJNjyAaA6BgqyPVHNbyr2qZ8QB+ymC6m4eHz3ssccaias6Zk9Fj1UeAN7kU?=
 =?us-ascii?Q?X/rmr94oycfYHu2MvX0jrrjWyXXKYgeHupvVXOjIy1NiZjyTH0S///tojrTK?=
 =?us-ascii?Q?iRneRjwxrBlLO0MFnBj84JJgZZb7Zw32OR0WwgN85LZQFHL9O4TSng0Ag/36?=
 =?us-ascii?Q?wl6s0dTpogYees5XvIJ3guHicxyXnKKnYiJti5meD3V6dnhSavTycIAs/2Ky?=
 =?us-ascii?Q?b1N2l8VBvUvBONm2Rug87rMYNZJRBTc7Gm78Rt3r3S6NvXb/DoasN9PWNFrv?=
 =?us-ascii?Q?5LfAOzvovyfwEakOjc6HAoewhZLSeJcpQ8ODupn7kesO5beQgpYU8LbjUWGl?=
 =?us-ascii?Q?UvtigLgZ/AnKDib9vDyOgMf1UaPxKbEJitGxAhqacVESEn+tOQg+Vc3riEHk?=
 =?us-ascii?Q?qniODQw2KbBuhodeg6EddG797q6RlEXlZaTAJXEUVnk+QDeLs0SVj8WU6kqb?=
 =?us-ascii?Q?7qzBWuY9EZn0tdWgKnt2swjriQt0aLGMFNlMFSVY+pWbPwTAJyuqOLvf0qd8?=
 =?us-ascii?Q?b+EEQX5RzCFjkCX/0DBkUm7TOlM0ZNBV4ufM2+I1GtqnZhKwGF8K4bQp/5SE?=
 =?us-ascii?Q?owf6wLw32y7TxeHQ8e9grcGnO0t01dsVkiVqFOo7h0F6ggB8qzoPR9KYDzkZ?=
 =?us-ascii?Q?GjDVOluntDQQXvFbfmpcK+IEYKhzCUOZmoT7HceTpTFHqOXG6WzHAaJ976Qo?=
 =?us-ascii?Q?LtaIahTdeSPI2DT/mJSqVrYi5QnRWJ+XKLbzrH/Dc/ux0vy4+2BqRPSdiMPR?=
 =?us-ascii?Q?qW4NZRHZeDEJ2vTzfgH1KMMFqhCTvuC7VEKvPLwgYWOfFlHESwXKsjZ/IEBO?=
 =?us-ascii?Q?O+LHG6Bef1OS/eWrlBljuCALs2Oo8FvAkUAkyHsxbNG4JQdlCtwxzi1HwqGD?=
 =?us-ascii?Q?wFzFqHbDbjrtZb+CY0MR21K5Y9vRP/Ok+aVQytwgM00CzoN8l6dv0t88f9Me?=
 =?us-ascii?Q?cmabNyP0f6pREbxZxzJLxfc/8nq2VaoQxHk9GWMrFjySqKCsYClwutgEUDHn?=
 =?us-ascii?Q?8EXQRWy7mBI9Q2V61yL667EsYwSrsKxQilCx/EeURc1Y6XvmOicA3gU7i7NB?=
 =?us-ascii?Q?I/CU8s1gAdpLdcAnEYkbsQ4nIc9fXO37IX+icF7s9PLRpwESJFDOouM/l2Y6?=
 =?us-ascii?Q?UQkYR7Uq5cSC25PtZtJu21MyAzo34fJH78eIj7e3jbLvzSvvWzlWcRCR/JUl?=
 =?us-ascii?Q?6i/hJVbsY3sJ637UFoVhzTOwRLAMJ9GnkyGf+UC0wFdCpdcBNOMmKtXNzwwO?=
 =?us-ascii?Q?fOOpQ+U/cnMJOLBK6AwWHKQTRkoCYX/pfklYrqNcIj5hFRmtnVm9MHGMIHXd?=
 =?us-ascii?Q?O4fRANRlkPtJ3MDK/hQ6CuR+goPMHutIIcKindWAk/mxHXfK9RIEzWNsEYs/?=
 =?us-ascii?Q?L+QxljTunWB3aZVbb38J1UFP+4J9S3S7OX0foAYAfuW6BZWkWx2PSYeJbZcG?=
 =?us-ascii?Q?qBM2Avbyx7Sur/agEQSrgenxkr0GGjw=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f2aea252-811e-4252-ef5c-08dee72e73d9
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 13:46:23.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLHk1UozW1vCHN9LJphg35YRNvWZhUNz5Z+RF7gNERc5VsY6MbfhHzvbPoJAIMJCQgHtaxSD5pBs/DzDr11RArM71dHm5qB6nPrEY1y8l1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3482
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 13:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241526

This patch applies the upstream fix as referenced in [1], using the
commit shown in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-13221
[2] https://github.com/Perl/perl5/commit/03f74bbbd3a68350d926ee93d56ee4808c=
28c4c7

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../perl/files/CVE-2026-13221.patch           | 75 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-13221.patch b/meta/r=
ecipes-devtools/perl/files/CVE-2026-13221.patch
new file mode 100644
index 0000000000..03396f3e43
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-13221.patch
@@ -0,0 +1,75 @@
+From 03f74bbbd3a68350d926ee93d56ee4808c28c4c7 Mon Sep 17 00:00:00 2001
+From: Karl Williamson <khw@cpan.org>
+Date: Thu, 26 Mar 2026 10:13:49 -0600
+Subject: [PATCH] regcomp_study: Don't create a trie that would overflow
+
+This addresses GH #23388
+
+The design of the trie compiling code is to batch extra long tries into
+smaller chunks that fit into whatever limitations there are.  However,
+this ticket shows that that isn't always being done.
+
+In this case, a bunch of branches that have TAIL operands can be
+combined together, and the final TAIL is used.  And the code requires
+that the delta between the first branch and this final TAIL fit into a
+16-bit field.  That is the root cause of this bug.
+
+I'm not familiar enough with the trie construction code to easily
+understand why the final tail needs to be used here.  So this patch
+simply doesn't optimize a sequence of branches into a trie that would
+overflow.
+
+This could be revisited by someone who knows more about this than I, or
+earlier in the development cycle.
+
+CVE: CVE-2026-13221
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/03f74bbbd3=
a68350d926ee93d56ee4808c28c4c7]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ regcomp_study.c     | 10 ++++++++++
+ t/re/pat_advanced.t |  9 +++++++++
+ 2 files changed, 19 insertions(+)
+
+diff --git a/regcomp_study.c b/regcomp_study.c
+index db7ab3a409..a1b2c3d4e5 100644
+--- a/regcomp_study.c
++++ b/regcomp_study.c
+@@ -1933,6 +1933,16 @@ Perl_study_chunk(pTHX_
+                             tail =3D regnext( tail );
+                         }
+=20
++                        /* The code below currently saves the difference =
from
++                         * start to finish in a 16-bit field, causing
++                         * GH #23388.  This defeats the design of batchin=
g
++                         * tries into chunks that each fit.  khw thinks i=
t is
++                         * too late in the 5.44 cycle to relook at the de=
sign,
++                         * so for now anyway, don't make a trie that woul=
d
++                         * overflow */
++                        if (tail - startbranch >=3D U16_MAX) {
++                            continue;
++                        }
+=20
+                         DEBUG_TRIE_COMPILE_r({
+                             regprop(RExC_rx, RExC_mysv, tail, NULL, pRExC=
_state);
+diff --git a/t/re/pat_advanced.t b/t/re/pat_advanced.t
+index 398680838d..c9e389ecb3 100644
+--- a/t/re/pat_advanced.t
++++ b/t/re/pat_advanced.t
+@@ -4898,6 +4898,15 @@ EOF_DEBUG_OUT
+         $x =3D~ s/^[\x{0301}\x{030C}]+//;
+     }
+=20
++    { # GH #23388
++        fresh_perl_is(<<~'PROG', , "", {}, "Avoid trie overflow");
++            my $x =3D join "|", "aaa".."mzz";
++            my $y =3D join "|", "naa".."zzz";
++            use re 'Debug';
++            "fnord" =3D~ m/(?:$x)|(?:$y)/;
++            PROG
++    }
++
+=20
+     # !!! NOTE that tests that aren't at all likely to crash perl should =
go
+     # a ways above, above these last ones.  There's a comment there that,=
 like
+--=20
+2.43.0
diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devto=
ols/perl/perl_5.38.4.bb
index 9f4cc1c404..8dccd34499 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.tar.=
gz;name=3Dperl \
            file://0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.p=
atch \
            file://CVE-2026-8376-01.patch \
            file://CVE-2026-8376-02.patch \
+           file://CVE-2026-13221.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \

