Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C48C624A5
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 14:44:41 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31226.1788187471836117729
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 07:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=i1yhQLqN;
 spf=pass (domain: est.tech, ip: 52.101.65.3, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBISsGW8jJOKkw9JJTvfIPxGK/3DQvTSetTprZZcPiJOXtMgw/rV0twBsll32jrypt6DQsB8Vg6R7gOfNobAQ+JCxYDK8DPJ2D9cBWRtaQussrhjJFDV7RdaF+hads2ygkpyG77Q2ldcWSH5g/Q3r1dNyxtZA/hRQBi15kvPV0XaGC+ope6j0pGdDIh+LKBZa8SxPdNErdSTl5NjteL+bAbEnxMyccpPg9z4oN+YVLYEmja2NqAgYXKEaKB+TTUlJDjR4G93BQiMiHm8THOBSG87HsLjfZWy5vvO0ytYefdJiocxG4ZyA5AM0fKyHcMpCggag5HhT06ptU1FR1B8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT7QojON/uNYWM6PUPSRo9Qt645trNKQEjyHAm/1qMc=;
 b=wFdCPvNB+B6fV1iheo2Z/b35uVohzLttI/LXy6L6HsehMOikxM7mTPJ59IQmw8SpJvreEzECwKZccc7be6jRgQik01xYZ9303ilYJ5jsWJWDc3Iz7gRh6P5XZBRQn6/UaziI+ViH5NmOaW00kTHSR+BrC+Bs/lBnTjKJhq9pS9ZyVjWo94lR+b2jRRt7OZ5mAsXdBtyXx/GsVw4g0w94R4vK8kYecN9j4F2GTab81DaHY7xEwPI+heuFu2QFGnEPnfY8eXXo6Sm2dUjyeHb9ZTtFo3XcQcNvHUh8ylWbJ3gJ0olq+0gtTAQ/V2nB5nYz+19avwo+DWIkliTiEson7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT7QojON/uNYWM6PUPSRo9Qt645trNKQEjyHAm/1qMc=;
 b=i1yhQLqNnRZmLWlkhu1DsEuybfWgKO2IN4qwbWsO7+VCqaIwdyBpfFFt7foKvxJJCAF7wVOPk9KlKZ70R7BacOyuXj1sfpYzdvq3agHZOjmnOVYXNFLfCKvMs56PN+EcjSjgA6h0LDcqwJDGnfm4xsZSt/kTj44HMsFiUN0xhxofcCFk2foIEXIHhI5mC5wNPfnkcQghxTMgn2DfSuRwrURjGqIffnFm6mU8DcF/7mhNU0lbWe7wAFCkJSDToM529tKrWcINfR16fr7fXIOD187SZIcvXDBDhsgvy/1xRSQNZ8hp/N9r+Vte8wY7VThxTwQ1+PQnWpccH/SVEM3BHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AMBP189MB3280.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 14:44:28 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 14:44:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] perl: Fix CVE-2026-19487
Date: Mon, 31 Aug 2026 16:44:26 +0200
Message-ID: <20260831144426.9995-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0157.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AMBP189MB3280:EE_
X-MS-Office365-Filtering-Correlation-Id: 6539af21-efea-4840-b28a-08df076e5be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|12006099003|10067099003|13003099007|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	NYkPD/UHU4cWqeSmLDJSTw7cTGoKO72bDKKF16jiBctHMZ90glGkmwTcds+7RPVzXHSB/Ke9Rd313fpHJg5apyTEko3j81SmnGGu9sn7NgluZQo6Dwq0F7TFiL7C9c4rMYRzs5oGXUxXMSgdOA/DHDPmcYZFkC5xdYkt8ZpbugTD6I9gEyM9EaHq0rXPAi5wV8449cdcDF37NWSTOQktssUdp+IBlKm36pi0xfO/T1smHRenz8CWPiWWQVXkV1/FSkaM1wVtdEE6Z8RLppG/Ws5nxAtKQKyltw6ttepbFn3KsqSXiXoAMsRxXBWAwlDIR6nzPBzuCvHaDValg4sWFOWmzExpjBH4e14iJEKWwmxUAg7/kfSanShfTUKLu7bZRy1Ql9P/B8BKPLN3m1z7lV9BCUKmyv9G840WzhMcRm8L4uYegCbkBn7E598En+Ggf3g1rUCDNqG/l5IYYennNgTqsPvLAGHDLBllT8L/PtaumDUIQfLko4uIL5VjoKGuBi2lIGCaFQJoOh03jqioGn26Mr9Zpxqi9VcvjuAo9pPSJ7T/qjx2/ZAU6e6yGOFQ8bufl7xKPu70yNkouls0CNbifU53prLvZD0mxk/c0vuLaLw8Q1e77Bsjzb+vGjJrEPXMGLI33aKWahttO4pwP8JcPIpXieg9Nw+K9zH2w/o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(12006099003)(10067099003)(13003099007)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IYPVx82GnZfRw0wiHvCc7yAuB9AA9JWSAHZHL9HBhXtAwO7czudesCF+7eOD?=
 =?us-ascii?Q?LGdzLTRE7OYOsaLgPUFHP72BmHepWTtbPTpUvWbHHaaIevZEJ2CwwEQbPojO?=
 =?us-ascii?Q?P8EBASAXZB40X4ypdao0QPzLv3pHZD5MFidRjgi+aK2PdWX50U6lKJCCStJt?=
 =?us-ascii?Q?RFccLCMhsGUxO0Aqng6Krd9S5r+fpowSBAbsFEwGqkmYPXUErODe4L3It6IH?=
 =?us-ascii?Q?Y4Z/kFUJKVKr1XBXPHvhfOjbGo2vHVTePK/yyiKmSK94N2R0CLC29T8/XL5k?=
 =?us-ascii?Q?bweLFJBUQ9SyApVEXIARqmzSZpCMuIG+uO8Nuee7AiNTm3dcvTKW2razj5/E?=
 =?us-ascii?Q?Tl921nZBRJJIWLbUTdd+MVEEOZbRh6B5rtTGEEzNYAKMryuUqYF1eHTUVfC6?=
 =?us-ascii?Q?iThbNxhtHCZoQLYRQt7lxH8ESHhS9txzmZMaIwO2nuQlNaTZDutC8uMfyAfU?=
 =?us-ascii?Q?wQSTIjoE3z4gLnAPziWmSNYKZ28R68Z7CBkxL3hKm8iLcFOokr5jIPEy3aHe?=
 =?us-ascii?Q?0mAwCZYaA7Sr9GSPHEW+J2RZRlz2pu2wK0X9OjZo3xilwL4sDuD0CnTJmsY6?=
 =?us-ascii?Q?GvdtwtI/54sN0clr6g+OgWO/Ar47GvV99EB/Uz3H1gsJFaBSxCvRGZPykUgI?=
 =?us-ascii?Q?o5Sz5vXZQA3ZKsu5CIORbMRfl3ZFNFjbcxEJ+uWdQ2jnvBZNClrQBEYEeHJW?=
 =?us-ascii?Q?IsdTagyImQvyduA2grQKByqd/E1Kto0XAjh/386AmkLYO+Yf5SDPW8XsjADL?=
 =?us-ascii?Q?f7s3BZwK3Z5QatQt2LV86z+EmiZxAIdW7tptdNbt5QrVsVnSe2ZRwPBmVCYh?=
 =?us-ascii?Q?FLxIacTazpj0UrW7kHxCLp7SisbHohEi9u+0mAB37DG+1ekPaKlwhID9u8ge?=
 =?us-ascii?Q?VEuRTB3+nQSQvnIHuFijLJAi1CrW4807FjSdf5xbfyBQ7tRT71cQDJsOxu3k?=
 =?us-ascii?Q?TI+jIGRl3Dk5gZiWH6x5TigNaaMO6vebPYw3on9sij96fYMoQSwrM7LpRZJx?=
 =?us-ascii?Q?X1xpVw8e0PtBWQ/idLPiuOFjB5MmRsvHRXZHVWHQuJvCq2RHZU5qMFRvLeyA?=
 =?us-ascii?Q?HhlR1xhSddE4jZQjykdHAlYAPh4Vo8uoXlODNhz/X/j681dhb/k7s9gLwHYD?=
 =?us-ascii?Q?OkexYjxqwGPJGKpZWf/fyqdW4puinhqVDs6XTpr32maxw7YZC41ROwSr8qO+?=
 =?us-ascii?Q?jhivVFZoREE/kAsFhODHzrGHxxDvZwRbo2BP8ZpQLJCozMYJfA+4MjqSltww?=
 =?us-ascii?Q?Y9cOTD4TB+I/7dwixBvu+ESbMEJImZfW9XO+rltY7UKZ//5nm4XnUiSoEus/?=
 =?us-ascii?Q?WxdfDMCp+/iYsv89UXVDqgzAqZFC6oA1OL9eTRsy9ULnkPJVmQmsYGilam+v?=
 =?us-ascii?Q?RbhXkwksVH1H0pP7aaZ2Ga4DhIBNjsON80eycHE2Ry7Qw6FUimWghFWYxTFy?=
 =?us-ascii?Q?WSLx0Bcn58Yx0SH0pbblFO3rOg6XzhIUurT8A+tE63xGVRrmnTNipdHo1W2x?=
 =?us-ascii?Q?dgqGt0RX9DvgrUv1EcAmGBsBgDQpI1+A6Fp/OXfjFy5waE5RhUJha+7AE5h/?=
 =?us-ascii?Q?It90KZPxPNreDiiUoDCYxBC1mH8BLU5jMi/LbFE7kWv0Db24s5sgdSaIbNOs?=
 =?us-ascii?Q?bxgTrFVDqc8VNDJGN//dtQ3G560WHCwF5F4j9FUaqOD7+W5/sujEz0NptT5M?=
 =?us-ascii?Q?nBXe0gMx1J4wJJj3BmKBafALaHzHuvkQMGg1ldUHN0a66fixGyFg4XDqyyCX?=
 =?us-ascii?Q?BWZJnf0rDw4giKGm8yDA3k6H34yKmJU=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6539af21-efea-4840-b28a-08df076e5be4
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 14:44:28.0650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZwmMDHk4xdl73DiXX0h33iHoyYfZbenl1I6dXa/VX8pO9FC8OMvpgZbnOT9hk3XgWvor4mCqlbVX+0X22ViGH5IgmkjYNU6LRKCTRiJYKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 14:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244768

Backport fix for CVE-2026-19487 - AHO-CORASICK regex engine bug

Includes 5 regression test cases in t/re/re_tests.

Tested by running re/pat.t on qemux86-64 target:
1267/1267 tests passed (only pre-existing TODOs as expected failures).

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-19487
Upstream-commit: https://github.com/Perl/perl5/commit/1a21abacaf6f684928bae=
8baaa153733c8c238eb

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../perl/files/CVE-2026-19487.patch           | 66 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-19487.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-19487.patch b/meta/r=
ecipes-devtools/perl/files/CVE-2026-19487.patch
new file mode 100644
index 0000000000..86feedcda4
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-19487.patch
@@ -0,0 +1,66 @@
+From 46014ec220989897d7ea53ccc780cea767cc0862 Mon Sep 17 00:00:00 2001
+From: Yves Orton <demerphq@gmail.com>
+Date: Fri, 7 Feb 2025 10:06:10 +0100
+Subject: [PATCH] regexec.c - Fix GH 22892 - AHO-CORASICK edge case issue
+
+In some circumstances the AHO-CORASICK logic wasn't matching properly
+when there were two possibilities whose proper prefix matches a proper
+suffix of a third possibilty, and one of those possibilities was shorter
+than the other.
+
+This was because we were NOT resetting the 'failed' flag properly.
+This bug must be rare because it took more than a decade for anyone
+to notice.
+
+This patch fixes the problem by resetting the failed flag after a
+successful transition.
+
+A good example of this problem is as follows:
+
+    "ABCDE" =3D~ m/ABCF|BCDE|C/
+
+This should match 'BCDE' and not 'C'. Because of the flag issue we were
+matching 'C' instead.
+
+This fixes https://github.com/Perl/perl5/issues/22892
+
+Note: t/re/re_tests hunk adjusted for 5.38.4 context (line numbers and
+surrounding test data differ from upstream which targets a newer perl).
+
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/1a21abacaf=
6f684928bae8baaa153733c8c238eb]
+CVE: CVE-2026-19487
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ regexec.c     | 1 +
+ t/re/re_tests | 6 ++++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/regexec.c b/regexec.c
+index e96b622..1eb59bb 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -3406,6 +3406,7 @@ S_find_byclass(pTHX_ regexp * prog, const regnode *c=
, char *s,
+                             {
+                                 DEBUG_TRIE_EXECUTE_r(
+                                     Perl_re_printf( aTHX_ " - legal\n"));
++                                failed =3D 0;
+                                 state =3D tmp;
+                                 break;
+                             }
+diff --git a/t/re/re_tests b/t/re/re_tests
+index 10da625..eefa579 100644
+--- a/t/re/re_tests
++++ b/t/re/re_tests
+@@ -2157,6 +2157,12 @@ AB\s+\x{100}	AB \x{100}X	y	-	-
+ /^(xa|(?:[Z=3D])*\1a){2}$/	xa=3Dxaaa	n	-	-	# GH 10073 - RT72020
+ /^(xa|(?:[Z=3D]|zzzz)*\1a){2}$/	xa=3Dxaaa	n	-	-	# GH 10073 - RT72020
+=20
++ABCF|BCDE|C	ABCDEX	y	$&	BCDE	-	# GH 22892 - AHO-CORASICK bug
++ABCF|BCDE|C	ABCDX	y	$&	C	-	# GH 22892 - AHO-CORASICK bug
++ABCF|BCDE|C(G)	ABCDE	y	$&	BCDE	-	# GH 22892 - AHO-CORASICK bug
++ABCF|BCDE|C[Gg]	ABCDE	y	$&	BCDE	-	# GH 22892 - AHO-CORASICK bug
++ABCF|BCD[Ee]|C[Gg]	ABCDE	y	$&	BCDE	-	# GH 22892 - AHO-CORASICK bug
++
+ # Keep these lines at the end of the file
+ # pat	string	y/n/etc	expr	expected-expr	skip-reason	comment
+ # vim: softtabstop=3D0 noexpandtab
diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devto=
ols/perl/perl_5.38.4.bb
index 9f4cc1c404..5663bbd011 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.tar.=
gz;name=3Dperl \
            file://0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.p=
atch \
            file://CVE-2026-8376-01.patch \
            file://CVE-2026-8376-02.patch \
+           file://CVE-2026-19487.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \

