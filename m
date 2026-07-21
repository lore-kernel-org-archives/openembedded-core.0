Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BA0C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 13:46:11 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23112.1784641567720329164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 06:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zpcHhCLd;
 spf=pass (domain: est.tech, ip: 52.101.69.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSdir9quiDOsBydMsKjuNN8Yu9Uv9n7f4dyv73u68vkZv0vMxdBuLSrxvNN0ujvTFh7Xc9Gtjxn93XrZQ5jhF1mzE1aJnY7gJQKyg0T/QEdgUz2jecj9jjnG8kWjWrQaYxGsLZHIJ7la3FEqDTRX/bQAtgODRH4b3xb3ORZhBXi2HaiIuCZZcuQs7qARQUEiAMhhbhptlXT8fPeDth6hdVEI6lC7AWyDY5gRJ+3xprqkegzkdgB/RvdQ1X9TryS0zYHuMB/ITj7C8TjB2rvFobacbrtm5EKxQtWI5W7OtGdxs3k6QtC715MTXyNY6nuN3id+Ne8a5pju+QA0on6u4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aYgyU7Pop5UxNBPtzkzzK2wl3W8YjlQ0hqLvBjccTs=;
 b=C8Zgpsr8vEFSbDS52Ae9DVQI85CYVwqXr73B8a0ZKrilgMU1hIvscV9UmdfmmHVU4bo6DarMy+TrqQ4/QdIJbb7QwcYyRZ/C7q3LPCFNJ4hjnaZXcaNSvxZCq8WGeKpWLwdZO6Kh86PTDqbgEglFtwo0fzh0/dXBmbyxM6wvrf6LyUw8IH7s9DZ+NjQZy+GYs8xYUu8VRwUHZ0Zvt+ophvaa2C/cMHJ7RIa4mne2qUyJiTzyAdMlkHWOznkglILwAHo7egi7GkV/mimR6eOtxvP/M7UuOJhWq+fAB8gmTx5vmk8bFj8gnKXJfCU9ftTAiE4THvjzqDGIjEDdenCq2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aYgyU7Pop5UxNBPtzkzzK2wl3W8YjlQ0hqLvBjccTs=;
 b=zpcHhCLdg4es6TawL4YzJnIML1QOpCOT7xFlIphmeYghK0EwqHCMNhraKOysDOPQRy8t9df1glXFdveQrLi2j9YsN0B9YWfzKoBeZbarZe9vV7xRGxI/alLYvBv94kVEAcZxGYCMcXqS74QO1+7qynsL2JkzhiFvK6yLndJWtUZPRoWIBK5UOR1Jp2xexXL+g7EMi8utA2xx+2D8730gU07fUVh/t7vCzexM0xbJU7SX3h70C7uINe6uEDI3oW6Z0ipbSP9UiIev7D9IR9xKBrmeU4KBcmUQwq8N/qzbuc8QHZdAf21xP47Kuj8ipKnP2P/oCR5bYTwE06+kjal3IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by FRWP189MB3482.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 13:46:05 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 13:46:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH 1/2] perl: fix CVE-2026-13221
Date: Tue, 21 Jul 2026 15:45:42 +0200
Message-ID: <20260721134543.16442-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260721134543.16442-1-jaipaul.cheernam@est.tech>
References: <20260721134543.16442-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0204.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::29) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|FRWP189MB3482:EE_
X-MS-Office365-Filtering-Correlation-Id: db059f42-da98-4a31-9dc7-08dee72e68f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|12006099003|13003099007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	4Kf1ZZaqe8Th87+B5krtF/Tu9qOWBOwviizSeCNRGj0LXtEMSU6SLLVUxJPoiGNXe+hzgQWe82ChlAcQcq9LutO3KcIZT6g4Vh0HM9VeDzrv3NDiLFXEdX0kC9lAKHxaIc2g/g3EaVUNYhJSEN6TkueZyZaWIxWnin9lf3vU8tFSBepYavJaQAxKCPZPxOREfaIE3/a2wN012aPVDgwse/JZaXgkd3DrUXMqJUYx0M2N40y60wGKn3NmEji741/amCXg+r/LvhoO7/lf/geQecDDtjUFFBplK3xyfpf7gzPn0VPXVsyIQ0UmqS5HlX+uOlK5CGvuKWr4lV/S1sEIp2YlwgFbpLf+IugtzVEh4HoV8hN81CtG+R+K/6sZGSnc+nnVGmlzN9gbDZgjztByd31cLQIbJVzFo/twppYLAt9zckX7TWWXLQfqFJV9GUg4KscWlw7kLkBKLawuPoqtUYHBUvKNfB5t+It7nGnxAQ50yRC/adenVGkc17+511Tx4ELWNQGsEt/lX4FagzcKnm3ZGvt7xNXwTNGbl4G/aLAVBSgn0zv/8FHJmA4QgZMDrEgJMfvGc8zWcPq8d8ZVxNrHKYfzX7D/SOFWMczveRBDwLhFQ7E9Lxos89Hab6W+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(12006099003)(13003099007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5Ev6ukVNKd4F7mq2KPpqXgV4Ko+heoT3wFMaRj5TW4LlLPbvng/GhJUJ6Z53?=
 =?us-ascii?Q?C5tSWJmiB/A05vp0n7e8SSBeJURoA+eha1KlS9yZL/jhvvM5p01EgN151pWE?=
 =?us-ascii?Q?xkaI2FOjfv4fCr3kl7Zwn8escWgS+Tim73bownYOzm2IDyewIAhtxpAzN4uT?=
 =?us-ascii?Q?oQdxFczvGWioJ7YRtKGUY7IIJqDGBai0/5nqzmb6MIe3cRP8fw8zHsc/YvdP?=
 =?us-ascii?Q?yqRbxuN6uullJyP+CshDxU7GCW/cI+Ow/SrzNvMF8Iqb7HJyWKCknW0qAQde?=
 =?us-ascii?Q?acQ8U9WaYo7dN/l+vJjgvm5DPZ/vkuI/eJq1jE7tS9DU4IAluQIhChroR8aY?=
 =?us-ascii?Q?Gk/GbdrdMawlHHEKyGwHHaVtp8eLyE1j+yJ3RleDbc7sSy8uJoB2gsPrAo3t?=
 =?us-ascii?Q?ZUgkLLVPlIWEQKXUWXm85YJYOwImD+N4Z8blFDrjBBTbM1aTylXX+qMc9OY6?=
 =?us-ascii?Q?WXD+RGEEtIBOpWU8UFgx/1WP5pZUaXDb8cYKtZBck+pvjV+Dvs25UN5pkhId?=
 =?us-ascii?Q?/QF/zziaVm1SqFgX7RlKutuFja1EStRqjH2IxG8mpVM2cSQscd4GLUF3ckiu?=
 =?us-ascii?Q?JovFiPh1lCvLsRUw6t7Ea/4eQ4DTPHLolNHV1iuDe3JfEIIJmJeC0f9UT5bt?=
 =?us-ascii?Q?Yl2QWsu8YRrA/MnEIjW7sU6aFyP6vopFSGqnstFyZlF4galRi/89aKZ6xtvH?=
 =?us-ascii?Q?PApwXk5iyXF2jqk8D6tkiQ26+Lzgq3SoiajvLpqHcxba9Ove2xBtYD83O3Iq?=
 =?us-ascii?Q?YhFTRvk93igTrY5ekvqtA56NBQ7sU1vpay5kXDM6UxwvxdFFKhwacMgZeJaH?=
 =?us-ascii?Q?EWi7fLTAOspGSwsEeqDfy3euCAm7+r0+aauROluxjl+erL+hoYWpdAOjA1dM?=
 =?us-ascii?Q?lu4MICwA86pIuDGbcOlfqXtqYkiEuR5c+epOkTaOn7d6HxPOSelBmGm/ClXl?=
 =?us-ascii?Q?W8WpRVVIhp8ZsKgd/U/BFEqhILVtFKC8/C7fhTkRtUaTLv40QVBLAZh6Jh6Y?=
 =?us-ascii?Q?HYHC44a5lzBGZJwUxOMjw9CLz4//0/GXmbYpY9t0M6VpyuEXBWD6/b2PBCgh?=
 =?us-ascii?Q?eKmMALUdUaWbU5s7lNkb6UmHc/4t5muk0y4A1rUzqTAhoVazRPHzW5cBUOBO?=
 =?us-ascii?Q?49UIzfiWJ1hnk5YTjO2c1/rauyDGQPQPTtITmc1xkUgurTwZpJUPQsPTNqGI?=
 =?us-ascii?Q?KLOw4mZPRfyXNi7o8bc1kzyALre1oubLgHslozr9nV1Y9lVwQQE7Cmtwgt/6?=
 =?us-ascii?Q?kQtvFFtpY4I3qajq6CLSyY1cCWPluMrQ1Rw9uvkrUloIYwBtX6xJ18m023lt?=
 =?us-ascii?Q?iZfXq/maaf9hqiGxE225oa61Zbum+ptiLR+DV3JrL1R3c+DYovxT/9XA2/uu?=
 =?us-ascii?Q?IKjwsOvi8vSwQRJNG7qLMO+KOL4SWAjiDsQJMbFeqvDdxqvw7H+J/hGtdOEA?=
 =?us-ascii?Q?EL4Kp/kS3bqIfVQsnLhbp4K+pg6d0yBXHaTvBfo/6z6n0vRbMsXbdPa9ix+C?=
 =?us-ascii?Q?DJlYrZ7jMnz/hoOZH/j4WEHNIiM5Wqh8UoQbX4xEsIv22wyOy/S3h4L4B4Z6?=
 =?us-ascii?Q?NQo974yk3Fym6oqqxYC9qi/5WyVNhN8PN9RjruUJs5pghpv5xhF5sVCE9HtE?=
 =?us-ascii?Q?zNEyXoYih2ejShaJKxsRN7ydJ7YdkkE3oRfXUR6fvLTxAxoeiSYtIR1C9zhe?=
 =?us-ascii?Q?Y5CJ6Xzn4Edi3b019iNzxjmOlNfcKjAKx6lfa/oTgn6qXBWhjPNaSNmFnS0F?=
 =?us-ascii?Q?a2Vf3YslV6qZxmjx9YyynD1VezZo+nA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: db059f42-da98-4a31-9dc7-08dee72e68f8
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 13:46:04.9869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQWgvD65Yskwuu12vv3O+irdbIapL+DUFRhjBMgR7f/w6g8FmCKh0k+qe4aVmWkeKXgJpD7NJRPINGThW4RIiMvk0Av9VjmsEvBq6aU3dqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3482
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 13:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241523

This patch applies the upstream fix as referenced in [1], using the
commit shown in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-13221
[2] https://github.com/Perl/perl5/commit/03f74bbbd3a68350d926ee93d56ee4808c=
28c4c7

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../perl/files/CVE-2026-13221.patch           | 75 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  1 +
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
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devto=
ols/perl/perl_5.42.0.bb
index 1833b7a352..1a3451b747 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.tar.=
gz;name=3Dperl \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-deter=
m.patch \
            file://CVE-2026-8376-01.patch \
            file://CVE-2026-8376-02.patch \
+           file://CVE-2026-13221.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \

