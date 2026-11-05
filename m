Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33253.1793881491094167127
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 04:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0ikBUjz8;
 spf=pass (domain: est.tech, ip: 52.101.83.25, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qr1ro2b+iUdwzSXK9XV88LKXT3HWAwe8U8hEgoPA5g1JwcP3U6pHzc4RnvizQaVFo7TS6ORvUuMqVEuS//S/lQFR4ZYoH/Y+lH5zznwdB6QqdsHmvAFAVkjfaOIlnvoBkaLGEOl6jI7sONY/wa1MRIIhfHjP1m/fqDBJv6iHEhRLrldnUAPbUayoCCjIixoUPSeZjOpH17LwA+6A9hq7egwMLXTvSh1GCOB0/SDgVh4vylKNgjZIUq4wVS9FglrQdOOl6645sU0+jRpFWuqu2p0JFBFiBgsxnj7K2v89wBMS8QgQCYoOKc8/p6/OV/sOkSkwWYrdReJjXrIsXd7oJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ed3pIuebcgBgOztJbjCe86axs2Usg3HHVGUP41CxMis=;
 b=ogzyb6NHcklcF1H8YmrJL9LnwOZufWllmLptC8zuF0JmVNzi60n9+enk9KiczrODR2qDeFULY5tufwBO1IFIbWCe4lQa6UTKx367YpsWY8ggIN2az+f4WU602DFRPi5UqCgSQauFahak3QNSSwaC+WwUxJLCBUBRCYBDFw4oWuApz4YD1Fwo2Tbc7Fc39AlDutzjPbxJB/Nil4YNkRHFfTam2lj/jeDNJRUNgW6M0NtsyYoFNKMDl/qimVeq1A0T+3q7xePNX/vJmhiX+z+4ng01RDzNzpE3ymehz1qTSW7X6Ov9zM758mP7mf2fHZVN8tJlVLtG/XhMX5Al9wIGsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ed3pIuebcgBgOztJbjCe86axs2Usg3HHVGUP41CxMis=;
 b=0ikBUjz8iPAPpgYPFhqsyOWMznUisUC3kADrrMCrGTt/1k5DRMkXh2rfv/qkWWfS597TfWAOaCF11OaKl1EfeEcg+4Vjg0DDQpZ+V0XCpGkTHJ9h5qlL4UXOd4h+Jf5V1xgYAgjeWzubd1aqpPa7RdPKb55HOVa/p6h5NiTJRVzwVYpvgE1/ICYb5TGxNaAOWV+5yG3bEWLgzdHWmqjixA10p3WvOkCEod2H6JTa4SCjkib/UehPCGh3WKpVeX1I1NQgnNxniLWmq9e/HMIg7qUHsIxLhHcjFb2/It2JM7aw2Xv0PTt8gnafQ6QdaXOXi4smto29ZmxcDtWn0bTaUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB2662.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:461::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 12:24:48 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 12:24:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 2/4] systemtap: use installer instead of pip for HelperSDT wheel
Date: Thu,  5 Nov 2026 13:24:41 +0100
Message-ID: <20261105122443.53245-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105122443.53245-1-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261105122443.53245-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0280.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB2662:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5dd7ee-0b6a-4594-b53c-08df3b37c8bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261026140227099003|260925021911599003|260925022911599003|260925021311599003|11063799006|4143699003|261026130827099003|56012099006|261021133027099003|261022115727099003|261009223027099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261022113327099003|261102123227099003|261021135927099003|261026135527099003|261026121527099003|261021130227099003|261028144727099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: HugdwiaU/E0LgJSA0WLVohmRkvW9Q4wImw5CvofYKJwryMO2cIgd6xsECQx/GW+ctwlqnl53uWQZMSzVLrwhsZgCYBmnl0kx/uI2WFhfVel5EqnqbcEovqAyolH5Z4SA64t2pLUSgKhh2tSNI74raiq0N+b3tDwvWcEpUB//AbOMceyh23EoOqmW7nZtOW0QcHGUldXgwG+pkfEtt3+yOug481DU2lHvlx9pyGEijKME1KZbgV6vXLFh2zXR8EQ5OUIoJSgt/XtHQfimonp6QNUme2KQiSV3OrJJEj/NkJczp99M/1/iRyzNgU0vhSvrfjRNYurfZ3J2HbqougFheEnZZga5UT7ay8X4lMhDBPUceKtR8/rYCYGaGj3lhiagDTApfDMgQFkuXBBSGelhCyDRKbzUOdWFJI95l7D3yJnzO1TQMMdh7xXjHF1OjPXwjJ3471JmHJkG78UWAKWRobmP42w7CLqODd61bQyll/xNGIOMKwPNihX1dvN+nvtU2wWZ8RdX+rZlXpOJthBFMxWj9f09cVYVEqVQX5/B9rQcI9i698/0RgJ9ZgC8TLLVQMH4FtejqFfYeJmW3ouRRnyKfz0x2qfLQ8oo3Y6DL1xkVf3wmccr/eL5Pr0ZlqvC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026140227099003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(4143699003)(261026130827099003)(56012099006)(261021133027099003)(261022115727099003)(261009223027099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022113327099003)(261102123227099003)(261021135927099003)(261026135527099003)(261026121527099003)(261021130227099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B+X4jB1Kuppak0iZ4aOF3zLuANGBOIpUqKsFLQOYXYquAvm0FYbGiiTRKCSD?=
 =?us-ascii?Q?JYRYMVwGi2B+917ZEn3eV0CDvA1E8wjB+oLg4sZwHavVCbNxUesRi9VTV87v?=
 =?us-ascii?Q?cjBgezogm7eTPEvJ2u5qOcOsbj8KcJM/2ItCtuwWht6Os0MfgjKBaGIBdWen?=
 =?us-ascii?Q?cgVIhsF3ok7/qefJ5Zwn9a43SuWGm44H1HrwaTAMtdkdCxPHPbRxWnQuhMDr?=
 =?us-ascii?Q?ScRIhblZvMk/W7bIVLU3RKSD2olG78b5CtiApKKuciRo889YkapfqbbCrqPh?=
 =?us-ascii?Q?9vCwewUG5PtfrU29sEulNFquBI/sSzNNXuG11F9Bqfb3ehN6RJ32cqLy+bkR?=
 =?us-ascii?Q?QW/zKkN4kalELuyDTQMC2Of1iB5HoCjBoonMTeVgjKDKfgdJIdJ29rInz0rg?=
 =?us-ascii?Q?VfSKJyOifaekTGKGdTlB3Xt47saKAT08ksrEVBtna0XRkgSjkkgyW++kKNJ2?=
 =?us-ascii?Q?zpaNoypKjUuDSENcTEbpux+PTjICzG6cOrMxoA5UIJpLmu0GfzsxscmF3KGj?=
 =?us-ascii?Q?L+uWxSMjt46wNLGBNZ0e0/zgJYaT7t/IdZgFLVJthcmjrzfATn8Pzk7W362u?=
 =?us-ascii?Q?y7+r+SekZGf/obEiXk0ba4yeqSfDiHCTZy9m3l2xe4tkVdq8RgiF1APrGq+E?=
 =?us-ascii?Q?ndgGGJgbbTSj17qKCrGQ4g4wHTA7I6yRlZDpjm1uvxb42bgriKpt9t3Exmh4?=
 =?us-ascii?Q?Pqg1lMnBzvRCkJ3s4rSbTvvEvaEp4WyLRqSGIKR6cMgBLaHchJvBN9Kksnl/?=
 =?us-ascii?Q?RhV1wL3apYAlgQxQ4jx/SCaGTP8FOYwb7XFLVPdO9Ev/PB/dLBYsHuBd4lXq?=
 =?us-ascii?Q?ygyYM6mgUeB1p5di04US+I8Bt506hH5qRm1p6XYV4vu0has1fUgIFlzzoI4P?=
 =?us-ascii?Q?WqpFAZXEYSxEu3mFhTg7l8lD/vz88S73M1iNVqABYAAvFWSwY/54xu3pqtaV?=
 =?us-ascii?Q?lP9DCY98OX8C0dpzwd3HxHgyMu5iUg5OIwuMt59tRXX38pdNU59ESYMCU61R?=
 =?us-ascii?Q?+x4mO2umCdpdS2O+F+OTgE1CCYkMCiePFENriyHCEXVhvJ+J2FVuow6RBYVI?=
 =?us-ascii?Q?mXLc7hi02ye+oxMAhshlgh7zgucypuYYp27xHSOLQdO/4SR1/xvAbvNt2B2O?=
 =?us-ascii?Q?cbS8/fPJRRF2h2vycRFR8dTJ9RTjRZNW7FlymM6dFM20RKyLCpZbVG02mi3B?=
 =?us-ascii?Q?HwKfmZ+jYSw6g3SQ+mHkxVXkc1o+m+LvwVgjhU2YjVy/buh8UHacnuEQQG13?=
 =?us-ascii?Q?5MBGWEaUrZwIIW1Tm4nXt6EiDayt/wsnwlKCemDUcReo5v8WBMpPbVRWzY+n?=
 =?us-ascii?Q?R1bQ+WDKU73j899j7LtJK4HWfNJ5i9tU9lHgYQSzVFHrl1WVs6othjgGRXc6?=
 =?us-ascii?Q?u6qpubzegf6PvlS0Sl5aiapY2eTuvaQ8qY9Jo9O1h+PSuM6W0qVKzQcqAH9+?=
 =?us-ascii?Q?hX7pXopIt15tJw12e8D4LzFqiMPfNJJySK2MmQo9WPfYGjjiJsSOK6OTqy7+?=
 =?us-ascii?Q?dr1PASglUadR0jLSvwcVFAQCh83uCOPE0003SIF4FCV9lEDjWP51AXID4XU1?=
 =?us-ascii?Q?KwQYOtmftDX7R1KZlEODAsx5RvyJWU0tvB83ZdCjlQ8R5CZIh6EitfCli0tQ?=
 =?us-ascii?Q?iCCybvM2fAEPmdHxuJNbQUE72SUUto9FdOZ8wMjsnER4zg4MSnDHLAIzJWx0?=
 =?us-ascii?Q?wuW0hom/I9lpVeOCPzc9j6YQK/FgZgtOU5/6+GL7y4mTKkZu4s11eGF8yLUS?=
 =?us-ascii?Q?63khiQqYAQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5dd7ee-0b6a-4594-b53c-08df3b37c8bb
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:24:48.8026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMpRRLmsqvT6MF3VpZjKdYjzq0gxGUSWbnmVdO4nNDadta+suRjl3nCs6W+Qc7OvQg4dqrdIF/SZQyl+srGqID1CX63UhD+vUj5SMpe6JnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 12:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249546
Content-Type: text/plain; charset="utf-8"

Use pypa installer to install the cross-compiled HelperSDT wheel,
avoiding pip's host platform tag check that breaks 32-bit builds on 64-bit =
hosts.

This also removes the need for the previous RECORD and direct_url.json clea=
nup.

Tested on qemux86 (core2-32).

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...staller-instead-of-pip-for-helpersdt.patch | 48 +++++++++++++++
 ...t-install-build-paths-with-the-wheel.patch | 61 -------------------
 .../recipes-kernel/systemtap/systemtap_5.6.bb |  4 +-
 3 files changed, 50 insertions(+), 63 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-systemtap-=
use-installer-instead-of-pip-for-helpersdt.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0002-python-don=
-t-install-build-paths-with-the-wheel.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-systemtap-use-ins=
taller-instead-of-pip-for-helpersdt.patch b/meta/recipes-kernel/systemtap/s=
ystemtap/0001-systemtap-use-installer-instead-of-pip-for-helpersdt.patch
new file mode 100644
index 0000000000..05323edaa5
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-systemtap-use-installer-=
instead-of-pip-for-helpersdt.patch
@@ -0,0 +1,48 @@
+From 070fe259ffe163b12aea7fae15dc9f8c6ae6d4c0 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 5 Nov 2026 09:00:00 +0000
+Subject: [PATCH] systemtap: use installer instead of pip for HelperSDT
+
+Pip rejects cross-compiled wheels due to platform tag mismatch,
+breaking 32-bit builds on 64-bit hosts.
+
+Use pypa installer to install the wheel without platform checks,
+eliminating the need for RECORD and direct_url.json cleanup.
+
+Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?i=
d=3D34959]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ python/Makefile.am | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 0cb608d5a..226800ad6 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -35,13 +35,21 @@ if HAVE_PYTHON3_PROBES
+ endif
+=20
+=20
+-# Note that we're installing from the wheel we just built.
++# Install the wheel we just built with pypa "installer" rather than pip.
++#
++# The wheel is cross-built and tagged for the target, but it is installed
++# with the native interpreter; pip rejects a wheel whose platform tag doe=
s
++# not match the running interpreter, so it cannot install a cross-built
++# wheel.  installer simply unpacks the wheel and ignores the tag.
++#
++# --compile-bytecode=3D0 avoids writing .pyc files that record build path=
s
++# (they are regenerated on first import), and installer does not write a
++# PEP 610 direct_url.json, so neither needs cleaning up afterwards.
+ install-exec-local:
+ if HAVE_PYTHON3_PROBES
+-	$(PYTHON3) -m pip install $(shell readlink -f $(builddir))/py3build/*.wh=
l \
+-		 $(if $(DESTDIR),--root $(DESTDIR)) --prefix $(prefix) \
+-		 --no-deps --no-index --no-build-isolation \
+-		 --ignore-installed --verbose
++	$(PYTHON3) -m installer --compile-bytecode=3D0 \
++		 $(if $(DESTDIR),--destdir $(DESTDIR)) --prefix $(prefix) \
++		 $(shell readlink -f $(builddir))/py3build/*.whl
+ endif
+=20
+ clean-local:
diff --git a/meta/recipes-kernel/systemtap/systemtap/0002-python-don-t-inst=
all-build-paths-with-the-wheel.patch b/meta/recipes-kernel/systemtap/system=
tap/0002-python-don-t-install-build-paths-with-the-wheel.patch
deleted file mode 100644
index 146f0a456f..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0002-python-don-t-install-bui=
ld-paths-with-the-wheel.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 3f34320eb37bb583b7bbcec01347a52527991391 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Sun, 20 Sep 2026 08:12:00 +0000
-Subject: [PATCH 2/2] python: don't install build paths with the wheel
-
-pip byte-compiles the module it installs using the paths it writes to, so
-with DESTDIR set every .pyc in HelperSDT/__pycache__ records a
-$(DESTDIR)-prefixed source file name, and PEP 610 direct_url.json records
-the file:// URL of the wheel in the build tree.  Neither names anything
-that exists on the installed system, and both make the install
-unreproducible; distro QA checks reject them (OpenEmbedded's buildpaths
-test fails the build on all four files).
-
-Pass --no-compile, so the bytecode is generated on first import in the
-right place, and delete direct_url.json after installing.  Its line in
-RECORD has to go as well: the line holds a sha256 of the file, and thus of
-the build directory the wheel sat in, so leaving it in place keeps RECORD
-differing between two builds of the same source in different directories
--- and describes a file that is no longer installed.
-
-Upstream-Status: Submitted [https://inbox.sourceware.org/systemtap/2026091=
9135744.78642-3-jaipaul.cheernam@est.tech/]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- python/Makefile.am | 19 ++++++++++++++++++-
- 1 file changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/python/Makefile.am b/python/Makefile.am
-index 0cb608d..ebd1465 100644
---- a/python/Makefile.am
-+++ b/python/Makefile.am
-@@ -36,12 +36,29 @@ endif
-=20
-=20
- # Note that we're installing from the wheel we just built.
-+#
-+# --no-compile: pip byte-compiles with the paths it writes to, so with
-+# DESTDIR set the .pyc files record $(DESTDIR)-prefixed source names, whi=
ch
-+# are wrong on the installed system (and defeat reproducible builds).  Th=
e
-+# bytecode is regenerated on first import instead.
-+#
-+# PEP 610 direct_url.json records the file:// URL of the wheel in the bui=
ld
-+# tree, which is likewise meaningless once installed.  Delete it, and dro=
p
-+# its line from RECORD too: that line holds a hash of the file, and so of
-+# the build directory, which would keep RECORD varying between builds and
-+# would describe a file that is not installed.
- install-exec-local:
- if HAVE_PYTHON3_PROBES
- 	$(PYTHON3) -m pip install $(shell readlink -f $(builddir))/py3build/*.wh=
l \
- 		 $(if $(DESTDIR),--root $(DESTDIR)) --prefix $(prefix) \
--		 --no-deps --no-index --no-build-isolation \
-+		 --no-deps --no-index --no-build-isolation --no-compile \
- 		 --ignore-installed --verbose
-+	rm -f $(DESTDIR)$(python3dir)/*.dist-info/direct_url.json
-+	for r in $(DESTDIR)$(python3dir)/*.dist-info/RECORD; do \
-+	  if test -f "$$r"; then \
-+	    sed -i '\|/direct_url\.json,|d' "$$r"; \
-+	  fi; \
-+	done
- endif
-=20
- clean-local:
diff --git a/meta/recipes-kernel/systemtap/systemtap_5.6.bb b/meta/recipes-=
kernel/systemtap/systemtap_5.6.bb
index b58bb1543b..4a9a16cac8 100644
--- a/meta/recipes-kernel/systemtap/systemtap_5.6.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_5.6.bb
@@ -12,7 +12,7 @@ SRC_URI +=3D " \
            file://0001-improve-reproducibility-for-c-compiling.patch \
            file://0001-staprun-address-ncurses-6.3-failures.patch \
            file://0001-python3.stpm-record-the-installed-libpython-path.pa=
tch \
-           file://0002-python-don-t-install-build-paths-with-the-wheel.pat=
ch \
+           file://0001-systemtap-use-installer-instead-of-pip-for-helpersd=
t.patch \
            "
=20
 DEPENDS =3D "elfutils"
@@ -34,7 +34,7 @@ PACKAGECONFIG[translator] =3D "--enable-translator,--disa=
ble-translator,boost,bash
 PACKAGECONFIG[libvirt] =3D "--enable-libvirt,--disable-libvirt,libvirt"
 PACKAGECONFIG[sqlite] =3D "--enable-sqlite,--disable-sqlite,sqlite3"
 PACKAGECONFIG[monitor] =3D "--enable-monitor,--disable-monitor,ncurses jso=
n-c"
-PACKAGECONFIG[python3-probes] =3D "--with-python3-probes,--without-python3=
-probes,python3-setuptools-native python3-pip-native python3-wheel-native"
+PACKAGECONFIG[python3-probes] =3D "--with-python3-probes,--without-python3=
-probes,python3-setuptools-native python3-pip-native python3-wheel-native p=
ython3-installer-native"
 PACKAGECONFIG[debuginfod] =3D "--with-debuginfod, --without-debuginfod"
 PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readline"
=20
