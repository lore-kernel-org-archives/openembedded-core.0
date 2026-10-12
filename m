Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E3BCC6B08
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:27:33 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3961.1791836843813899989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 13:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=awjwmZjv;
 spf=pass (domain: est.tech, ip: 52.101.84.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quVoQ72SJ3DBf6oqwHLJz6VoufXbAiCI2LjJCvkjYMWt8AepV7rF5RT36OGZpbKo4Dt/3xhDdI9GnMGakUweNGUsW9HpeSAMhvts6Us4Y+JD5T5SnjsDqH7XUF3+eAnLaO2/hDxc2tUnN+30K2vXydelDcuo/HR5IsUDbslY3FGj1EMwlzGa0Z5NEV29iZ+qSNRRLGk17+SlvyG+xMOxLm0YBoC0iLDW3sqPIIIrMmzq/nKtsQDgmP2evanua/m51Xo7OqS+eXSIocpuYGb3mEw9+kqE+Y/i1oDA9l/ePl9OYm/9KfYDeLH2YFnYh8bMbatzWz01QG4QMyU32gBHnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6niljhDoEEQiWWotxQCP7Re2fIl0LN5osTONHSenxyo=;
 b=iKOOfOaHJiIdAvawAPi0lIOYuvZpSx0r6Rqh3YCu3iPXeNeDOBDJFeu6h9OSTbzApvih+x9/ogabFVwUa9ViimYHzlKTuHy1UmgnZR7l7xwgR/b2g4F8xlJl0e0n8B7Ej7D7wUZV0A3vemGhzFnqjIHv4qS93wFy4eZY7ayMReY3r3At32zOQLLrLG8aYoqIZIuuFYg036doKyJE+KAHZ7uFtQfFGsCKZa7SKtu8bq+0hn5j1S7gDKUIubDlpvXbINqf62TQ0JBqS1kSYn3KCxLyUFTQ6dW61rgZ70ux7/y/LBNbfhxScNxtH34cEJfftTMjyDWEQTYvgJh18RmkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6niljhDoEEQiWWotxQCP7Re2fIl0LN5osTONHSenxyo=;
 b=awjwmZjvEE+2yOou8+YVtgVLLSG5zwpuCtL2ScbU0C/+bOZW+yUTDyqHWge7klNKhogcv8k85ptjHaPzin2jLZEWREQfsP3TZ2lOi7r58MpL6jvuQuNqjJm1vGPRRBnhnVfgvq3hef0dfpzBMwiNvway3lXQd3kmZFZNWvVkLJmKdaUcHTcB2HGUDaGGNLZXklWnzlExXiDYX/PRGSHdFa/8Kp88NkB3bRMZsTeVB7TpcscFZLhlvwl/CO57ylFo50YOVNKpoVIJ6ySn+t8rK6ER2YAtgvJls3CuARmTUXPPMINeMv/HPQwgxNZEwJYrFQNmHNY4pK9+NqOgGFccDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:27:20 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:27:20 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 01/10] gstreamer1.0: upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 22:27:07 +0200
Message-ID: <20261012202716.38597-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
References: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3295:EE_
X-MS-Office365-Filtering-Correlation-Id: 520f57ee-d9b1-47e3-db5e-08df289f371c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|12006099003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	12hwYQAeTkpFxkWhFg6MkgugYwZCD3YEP9ep2qvoCjiud0Su5mfN0FhEeQLxEsKUqkpGdAZGLejtFeLyjPToOID9Hz1eQe/C4TV0AN7ZCAXgwigdsTrP1of0VPp4xdJWLhN1VcW3gfztGn7rVRAlxhnZt6sTGxP3/UMz9ttY9dTiHech7wZoAtEIFmWz/WfeY4XdmUxlYQwCnlbL57phh7RUo30oVZx7Yja3tLhGi8oeUpdVojmqAYVeu3svW4DpZHelIaZVY1OsjyVfC8L4ub2GsxJ7TMYJK43Ovey0XYygDs59oFK3TGuDPt0HJmQPbVyKB7zNBgIAkjArUN0oXMs6IFZ2EIzqbm4vFpifwpJwdwSqxSB0kO3YX7kKgfi9FFhlxb/aQqQz3B0SBzARIFt0WpTQ8co/Kod6DIlYPQWw3r5vA/ePshTQFAufDrkeIbe+kchvZuqlDpnyiaSSbA+C7qGKs870o2ekpyJSbYmMyb7Zhk+SeJ6FtxEw2WEfb9LPt1d3c/76lBv8IFDJngpHfFcTLxkmlQjFJWQ60bKTkm4aif7rJnZtZ9s8kDwsriCstTY9Y+Stx1CkG8NX0PutigdlM9c8uIrsmpzifio=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(12006099003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8EVpo1rVsNaZEBpub/geCkPTIjnMMif+GFasvx/rF5iATw7NzWsI4UBdeCLx?=
 =?us-ascii?Q?AmG5yV5TcblGAfdJjR2Nk/4ulzzMaWf/k9iX92XgiWTFIhWqyhIKPDIN9Irc?=
 =?us-ascii?Q?qcRA3qyF8JMINvH+FV2OK7mVEQoQJymKQmpqshVUi7erhENER0aqWHmm2SoJ?=
 =?us-ascii?Q?wLt15/bZikohPT229+etz7ncGdpX+Zsrvjv5xxmZLOkXAQS/zjsJ1AvCuVgI?=
 =?us-ascii?Q?I+1hy0SQKgGSZMpMk43RhqLKfxUR86VszDZGYEaITBHDY1+m5Pq9k6CvEyhO?=
 =?us-ascii?Q?Lfy0OMcB9o/IN8tOw5dFrx0vAwXuiC3w0OcXlYf5rijuOrt2fDq5QJCp7qSf?=
 =?us-ascii?Q?AC/TE2OTABtw0euDlEeRo321iXMMXtISNPYrRxARo8jE9o9X3y0KqqJ5474K?=
 =?us-ascii?Q?bBVoPYgwCofXLDjnNwbEo557U4QaQpGpzDOohxjrYk8HF0tmco1YWCQ91ujo?=
 =?us-ascii?Q?uBlRzrZnzMHwJOYDu4lVGKA6h1lqBjrzu7UdQRTYlmPSGTxgmD/lUWm57IeJ?=
 =?us-ascii?Q?PwRXmgYhbIF6N+8ClCL73HKg+ns63aKK+o9z+HUX0Mfo5fzLj1yONNlY3ceA?=
 =?us-ascii?Q?+c6Zz7+KATLnvtCcwr8UpheGURz/hlci2vCuGRHMfExI7em2KroBB5vS4z6K?=
 =?us-ascii?Q?BdVXOKkihrLi76U4lTw9DBSGWtf+zpYeplHj2lKQAMzUmH9cboY1iuSst4gj?=
 =?us-ascii?Q?B3J2eaKpHjNLd1EQIudehADb8bFltjro9/q077HBHdqDgox2NmJwHwEscvXJ?=
 =?us-ascii?Q?pvCtJib8CFhdgWNOJyW2jEAuDWULoyLD7EdME9bxovgHXv7s49pBDK2nIvEH?=
 =?us-ascii?Q?TDtpp9LPo5L0vnygRw/lhmY5NohIw/K7q5fH/ER2rQrkFxQNinSnSNRWBYcg?=
 =?us-ascii?Q?htEknDw8Eznkldx5PpGx9O0QMSLvLbRduDOL3BVjX36qIdHD0rxXMRA3kuhB?=
 =?us-ascii?Q?c0fywzGdUIZBo445EV3OjdiH7H9A2ZM69HFbAwGE5FbQ1gDjnsdkcND2QTGk?=
 =?us-ascii?Q?Jeqedec8nv37L+VbIfXbM2XZbXMVIkTvwF3X1bMAoAuvL7nuku6hluQSa7Tc?=
 =?us-ascii?Q?UzCZuEhvXbgaj1lepnrXysB5gvkNmqTU7F8gEgnaEoaJwVwTyFNR7zbRhxWi?=
 =?us-ascii?Q?p6ppY79AjokGISkwIGJRgP6Mja2o9+p28kiMVs52iE4jaLiM2nTMzwv3FWd/?=
 =?us-ascii?Q?VvDcmkgITQWSY80nnYwD9Lf3Z7lqllbMHpRBKsHNF9NwLnMCZ30EzMSf1CCc?=
 =?us-ascii?Q?eqEzPQfoCt8tzMBbRq1ldPZVeUiIGNLznQFoK6cPTiy7ijZGvCTn1yrcPvds?=
 =?us-ascii?Q?D02xDs17ZO4jHHl9FBV4jdUkglBDOTiegpCTAxAJTcToAX2dCJAAKUr0JweP?=
 =?us-ascii?Q?Qn0dR//woXsFbK2Y6HXJKzaWl5kYeUBbFObKR8F4ja+cT23JEb3zxMFGsr32?=
 =?us-ascii?Q?UvWzX/d3B+9QY85Lz58eEsCmEOonkq4rBMbueu57Fl6mDSAC6bflS8Wu7TkP?=
 =?us-ascii?Q?7SYblMSWf5oafPVoKrR729kGfYzttWN1PhHVBF2IN2WS6WDMLtVYX5WKnE56?=
 =?us-ascii?Q?Xb4PVIFDGCcNNfcG9lM+VGH5/5cDXsGWBM8rtvccsvBv2Z1uwkaP2Oe+Wwxv?=
 =?us-ascii?Q?OkLBXEnGsNUAzhUMVNstz8QhXC7H7NQiVtEs30Mcz7jDUtlAlubiyBRE2uDW?=
 =?us-ascii?Q?CA+qrBzXxS/dgLk9Yyc3d4QW1/beDCCSXlz6a8EJCDM3jmEzPqG/xE4OYVaa?=
 =?us-ascii?Q?vA/vGpXKug=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 520f57ee-d9b1-47e3-db5e-08df289f371c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:27:20.0449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Da/52DGvqD2oxUqIRW9xNcGaFyBs8DkF3zZufkB1rv6kiDuI99V/cQn4VvOLbnOeMzAGsexMWEVfvS1ECJppa39Wczvwom9mMmILr4xILPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 20:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247676

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch   | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch        | 4 ++--
 .../0003-tests-use-a-dictionaries-for-environment.patch       | 2 +-
 ...4-tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 .../{gstreamer1.0_1.28.7.bb =3D> gstreamer1.0_1.28.8.bb}        | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.7.bb =3D> gstr=
eamer1.0_1.28.8.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-resp=
ect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreame=
r/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 61844d793a..aa5db13237 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the=
-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the=
-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 27bae0561a09f06375c6c6d1d3fec2a142a1ca20 Mon Sep 17 00:00:00 2001
+From a4d5aef324bc7e66d293cb500d077b18fdd7545c Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-=
support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gst=
reamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 9752ebe921..7b555352c9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support=
-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support=
-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 00dad437c119cd23883cbef35d2a620ccdf3816b Mon Sep 17 00:00:00 2001
+From 59403a0c5d2bbd3e00cdf4855f0a2d9761395e1e Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
=20
 diff --git a/meson.build b/meson.build
-index bffea3b..a51b1af 100644
+index 4abaad7..b08d43e 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -665,6 +665,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-=
a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gs=
treamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 5637eff7a5..246292332b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dicti=
onaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dicti=
onaries-for-environment.patch
@@ -1,4 +1,4 @@
-From a686b15bf7ec5ca99467f138c57ebb17aa25c24f Mon Sep 17 00:00:00 2001
+From 9e728516ce60c128cb6666820e5449efc7bcfb64 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-=
helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gs=
treamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_test=
s.patch
index eb14d519fe..bb08b116f2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-=
script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-=
script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From e0290fc20f52ad7dfc21e8a572587ad826e5b32e Mon Sep 17 00:00:00 2001
+From 42225b4709aefdd3250be30d79b5646b2c0da926 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb b/met=
a/recipes-multimedia/gstreamer/gstreamer1.0_1.28.8.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.8.bb
index 0d1a931ced..01829ad778 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.8.bb
@@ -22,7 +22,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstrea=
mer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.=
patch \
            "
-SRC_URI[sha256sum] =3D "787329b2c5758e228a71d926a6dcf960bceaacca3cadd63874=
ba665dfcda013e"
+SRC_URI[sha256sum] =3D "baa8e86985ad6417cc0ad6e7b79ff2884c6779c8b1c7a6240e=
7121822c86e524"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '=
', d)} \
                    check \

