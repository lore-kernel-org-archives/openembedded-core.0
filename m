Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA566C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:23:52 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24041.1784643828365687799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ze0L5+gp;
 spf=pass (domain: est.tech, ip: 52.101.84.62, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnUo5v60W9WUb2qXOr0PkuTBWDjicWl8uGD0+h6ZRFf4KWtagFrJEcytwQWYc+8LHc3/f83QBufKFqNK4i0HvzizM3DQqId7SIYo0vYLPA373X7Aq3IAb4PtJcIn8BHV8tzP9VwuI6a9Md3v6TGI4skn99OvWLCRGaswdcjg0DKthRRI/2UWGnMTpjAF1mbmZ3T7c5UbR9AvcGY8b+JMZrEn9oSlkTnTblnlE/fpebfs+wS2/EIO6EyIgUuCz01ceQNDd44nrVjsmU8X5uxvmHRiGoXqJEC26Zt4v2atAqh11Lz5JU3QVYpwV70+zbWqfnDdVGmmlzal69FVbWalYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5q7N+Pi21W+hKtMHAny2CcktbYBN0nNt35gxSCc1/4=;
 b=YtHtGl6NhiXaoDChc1fgNmAjiw135FnXkpa732WyDFpolLw8F0AJAZUVV1fXO6NVWeXYGTLHZQKO6sNTGH3ARBqlNDjyswFWzXLV9kvtNU1jM0c2vw3RUTS2BLPZfOkq1326EY5QRaDzAZqFWoJQiUED8vUt+XQXrhhvpG4Ixo/GVU3aIvZXcits7m8/uE3Tw9q8qs0it2fiUFhm1hppZydcdwCCHsGvsfOPUyutj9NlquyrXiHGpJGDwUBGiBlC6gkv3rWaHUtINqkdkZD4ToSroeoNGzvNw+pDXjisHpSffWQR8XAZC3gKebm3BrtWB2IBGW9dROriwrUpXZZ9AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5q7N+Pi21W+hKtMHAny2CcktbYBN0nNt35gxSCc1/4=;
 b=ze0L5+gpvQzz4/gNh5UXAM3/S6cH+vSMkCBXqBkdDASWTOGS+CL029k6LUa3/L3bnHVvrGPbGXykfxfjVk8sEIlTKfxTJTZtmyWAsrYxjPyrVOMavRA2YYZ3ueeH6Z88U3qwiGQf4Ovljm2GdA8BCS4DdAC3pj9sTorKqsLpcvne45nYVzO4Ey1q7Bdd047ewTU1pdvDIV/3uM81U/HXGxZouqSsFz74wYo+bfKrDvwvKOKXArP4UDi+u0ecK4Zl/bpZ6bOFGK7nb8B7xMKhE3E6Q/Ozk6aKEpHxfj2P0pTPuqCRyx1vSROuyFlhJnF2TCP0maumfIe7w1xCRty3sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7P189MB0850.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:173::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 14:23:45 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 14:23:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 1/3] perl: fix CVE-2026-13221
Date: Tue, 21 Jul 2026 16:23:34 +0200
Message-ID: <20260721142336.21513-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260721142336.21513-1-jaipaul.cheernam@est.tech>
References: <20260721134616.16538-1-jaipaul.cheernam@est.tech>
 <20260721142336.21513-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0179.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::34) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7P189MB0850:EE_
X-MS-Office365-Filtering-Correlation-Id: 6829e7ec-59fc-4794-8710-08dee733ac86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|4143699003|12006099003|56012099006|10067099003|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	zLfExOLNXMa8Si+nHj+ZjOe5+VpiZolBISTSLdT+4MYLQ/lgkL3rq49iBFSNEwGWH5SgmgzbKdnCPZpltMcvVdgNsaCDd5TdG6/TVhwtl7y09xx2C2wS5Fn8DZNpaWQLhIZXQXCnCCiNXo/q9aPvSWopEI34NDJDJhUzdQWRk9RqbjmsOtf/nodj6RbLlE1nlNKt6FeCFSSajlJ9CrjtVbwiBGYBo4L64O72RYeFnRdu3oCTVD18oGGWGcL7kZCeTtfiBdoFmVYaS+KffYKKNhb4dzWi9jSY8fupbg9TxCNRGz5YaupSqy1/9yQvMDSbgmHbSP5AQbwpGsOctYrwsgYHbhwwSz5V93yxK0mQPFSU+O1rGh4Bk+jpEVmvPDBvh3G/alASny+kg0++8MS5hNXzD5L2LXFMaD9ixQDqg/g44BTFs71mR+s+bGaImcZhD8dsSCvO+PeMzhUAXUICRZjz8ZQ7YrqK//xbUCXL153dQYSt+g1vN6R+AU6qO1nE+wvyDDpRGw3QUiVWnChIdqq3//L4qSMGmibCeRNL/FSW+ES9/1JK6YYs0nLRPswEKbNhrfnPLsFxzUI6/Q+O1/MoUGN19hGn910lEBJfQdEpH4BMuMzPPd1LQZxs8NKK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(4143699003)(12006099003)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0wivt5hmkIo9Cz3x0vHBrn9baj5KijfUm1zm9IsnKwKTf36Ov51Rpl9FzaPE?=
 =?us-ascii?Q?0oerMZNRV5/cCDHbs1BFx1S0ubWBxcOsJh5nRQzWcHglncTlYgcJd8ZeJlvX?=
 =?us-ascii?Q?KsFbMB6SdiMbwAl7muWD6Cv3Gme92BPd+y2TenIJCRX0rhWJfpYSZSdOLI2P?=
 =?us-ascii?Q?qqRFtq4WB1up90+La05HkhsAzOmw7T1tdEovesBR9SsI6wkLEHYrqhfZ4VyI?=
 =?us-ascii?Q?MSJ9QCmz0hed530eRfuG+lGGTpfCkWNXzwF9FAjokM+pWcmExvz1yfB0iNF1?=
 =?us-ascii?Q?r35++0k2cEBbHSrAcLec+ezhyVrEKjrWHmhyBxkMrvsdRAPGNH1HMF8X7abC?=
 =?us-ascii?Q?zviEsqrSzJJxlv3wLkqIHqMUayNtYG9qaGfmkxLC7w8lIeNNxwsabLMNhL0J?=
 =?us-ascii?Q?Exg9zMqjKN3Ibz/tSXHQqC3CPbKTYYTila3hSMwxtDtESxSQY7u0+lhsr8fK?=
 =?us-ascii?Q?bsddbSFzGi/r0ZViP2EwYEgjA8bIgOzcLnvB+5qKbPuvFAx8YR+z4veutk7d?=
 =?us-ascii?Q?mtKdcjFPdAy8dacjKMsnaa4SsSUNQlNEz4TLk7TOD+Tv6N3S3afVgpHIUZ5w?=
 =?us-ascii?Q?RYeuR6hy+y5a5XDl+Ir2bCCcmIBQha6tpgBNSSrFS9AWGcu1YV9G1lLV6VSq?=
 =?us-ascii?Q?bryUvT50/G1GAmLoFD7vdJnsvQxrcKPXhxWCkJ5VYrhnWwtC4EkXUqDI4uEv?=
 =?us-ascii?Q?Stgye6Wiy3xVmHkk9SmM8EsNe20kVUUzcMyZLiGuEfteoSSwIAef7vWbcQMt?=
 =?us-ascii?Q?GaDha8CXmmK1wuK/zlM6zzFA0UpZGINoYgReiIB/9Sc0ttmNnKHEXff8rNXU?=
 =?us-ascii?Q?31lqHHgIqO3f/jmcPeGclpLeb/BcjzCerHKJ1OUMU4LAtHDStY2gKAaUZ0Lq?=
 =?us-ascii?Q?ieL8eVzs5QdsOA6OlIbtiCKeAdiAh+ppIMaG09Pys2Zf0Z8X7yQ5FNbA2o1Q?=
 =?us-ascii?Q?Y5+Lp6jRIRbMv36no+PblPmsgCGIFoi7aLkZBFi3zIkRR+dTwuxIrlYZ4wca?=
 =?us-ascii?Q?Jyv+wSaKccyJQvYWQv78qSk7QR4ROQWrbxP7dySIuFmA35f8YuqizZfVRFmv?=
 =?us-ascii?Q?sWdYCqzeSSuQLzxBcc0oBEiut1fWxgsWsmcKWFadsCd50yeJMMzVZPmHnMps?=
 =?us-ascii?Q?fqKwj1XOwEeBHrjvDxJm+idljuEGdebxXGk6LZFRVr3j2JnzjmGirdqvHwZy?=
 =?us-ascii?Q?OoBQ23Kaf3dhC6gVvv1FWhZuARI9lNw5p+FA7L6tvox2Fru4mUGGRVedtMMl?=
 =?us-ascii?Q?SS1nJ6LqNRUU6vL2JmYPYqItk7adS75MWhHmbvJDYPxFa1O184r4f6CUv+By?=
 =?us-ascii?Q?KbD1dAiQNK8nM0aYnL3y7F/VKmR1i0l7HRLChWSnxZy+0khYzTO+J3AjMw3m?=
 =?us-ascii?Q?N3AEVV6Db7LyJbzrPh39Go36UKlzs1M2xUaJwkDFtLN2meUoLEEKAPUQ3IeL?=
 =?us-ascii?Q?petf98Da1c6ES518UZtnMuTKHSkWyGvnZ8YVK8DmqSQODltr2kTEewpFE7Gf?=
 =?us-ascii?Q?vbQ6Og9fhNvNrlRHOHx26ozsmN4qLUnXWR7TsIaeqRWK1txW5EusMqclsV4H?=
 =?us-ascii?Q?54YuFXgumBQKMo08dYzT3CpUR3t1tLKcsAjb84281HKSzIpe+URNLoNWhgva?=
 =?us-ascii?Q?07zKYMSk1Hy1AF+Fhp5dh9TrPOpNNRPBAwpG3RJT69u3pU20Kk+BXjBU4NcV?=
 =?us-ascii?Q?aEC329HlaKvm6MrYoTEG9Voyw19xOVFDEwDN/gSk6xKEULb5OWzDRPSLi6yF?=
 =?us-ascii?Q?5FbWjksQ5MLPrS1Jz0t4ynIcL1Np7ts=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6829e7ec-59fc-4794-8710-08dee733ac86
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:23:45.8299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQFHW7z5hT/zvaUAjJ6NPG7X6X3ABvIZgv6Ujo4E3obpwcP0DSiXdcR2ovMds7UphgxU7eG6SxNY45V9v+3LmeDTbXQEhXoe3dJ+z8mvk28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0850
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241536

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

