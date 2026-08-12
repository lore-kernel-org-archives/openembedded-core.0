Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A670C5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 12:06:25 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6488.1786536375559720517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 05:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=hYIKsLEq;
 spf=pass (domain: est.tech, ip: 52.101.84.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCvPpCkiRdhTXvfSIUZCptnnD41W1roeJLZhVdMn6oU7sSTX2PhiIQMj5+FWVCNa3t+i/i0QFRjnT6bJ8mqXC4I4O9W4tnKvT3ACVxxNnVrCb9n2Z3ixKhENOC6zItGUa1L3mbjAcuGI6srbgoazzC1dXe0QkdtU9vQSck5TFm9/WP4QQUwN9teil4dIKJnp8tU04t6IV6Hr40pjfxZuAqFabeI5wjdzswPIA1U7ECMRGW5Lw5JqOYhiyWkhoV0nefqENAqopBeWDstPveXufEQJ5GyIk3i3bhkOt0880v2CHbPaDvYoJ1M5NXLIqf9wYsm/zhN+nzEDiOXJdjvcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AU245JPv5G9JWxpzqN428VHt2aGpvEiqVr77Pa2nvNc=;
 b=wDffrFsRkxw2qDPrsI5OEZsxP7M4Wldbodi6jcypgFO5r2GpfBJVR2jgLEmWSNJmrL6rofKtbrkq9JVVDgqZ7dBRML3FbIiWQqH1qUlSy5eIADp17MFeyoc9029oNVmfu+keZxHBoBg/5kmvOaV+qalH+CrPk3Z+arD0g6n21uhlkdZRlHSQJqP/rbpAg5NcbJmRTybK97p52A5x0U9YeD1NHajUmYXQAFWY1QYzCwaN5xV6djjdKSPUWQM/dM9ONwK6RUDdov3lla4blhqguEpa+jMKd0blYj0gord1Na16nS+G+MzavbFS4goURFFD4OFmVxo36VM7IiYoJfO38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AU245JPv5G9JWxpzqN428VHt2aGpvEiqVr77Pa2nvNc=;
 b=hYIKsLEqoU3XQX5yYff53lhEmiN2qW5ka2I+s5rpK1njEADXjNTC9loG2IJzbtDZfaK8KtIrdq1dQ0oHMhgD/kZZn4XIOb2w9ODb2ao151g5rWebhtEtVmy5ekI2gHOcf0QXY3mYkpvRjsJBkq6UOqI+xqB3ARlAe6Nv7wkJULJ0oTG8bjzKa0hVaza2QijCbtxZoaDGcYL4UnoMk1jSDZ/8lla0v01b/0qsphEk8SSG8sRcllPPuj83zyBATVC8DDRHIEWyau04W+ITRvIl0CO8ZbdtckkK/ZnfqD1HnYM2WiMhs4sQi5nnirjJ57CCEEgjSrQlbWyI53LJu6ESdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU0P189MB3354.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:59a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 12:06:13 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 12:06:13 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v5 3/4] u-boot: fix pylibfdt build with swig 4.5.0
Date: Wed, 12 Aug 2026 14:05:57 +0200
Message-ID: <20260812120558.24897-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812120558.24897-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260812120558.24897-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0295.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU0P189MB3354:EE_
X-MS-Office365-Filtering-Correlation-Id: f91f8fa2-caea-44e8-897a-08def86a1ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|10067099003|56012099006|11063799006|4143699003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	LECxOJszVnMTvDR1yjiRhmAVXAJUK+nERB8XGgFrvLu1mn561kpZJogeRuImmgRk3jUYYiiN7bLoOFbG4ZesZszYZ9nKhuvNcc+928L8bq/BF7cXZsowniJollBuC8rks3eO3fs37yn0jmdJq7myF4nqBI56KTNY6cRFvUcqvcS4IB6KkXOKtpeJJmqZcyZ22cS2zvs5MYd0Tu483l4L81PygH935oF39dYpYK1EnGVe90zc8lYpJpsztDXZkKw5lhN1L1CiRPO6jfqAYvJ5xkaPfQUAlInvJV69CQ0GUGxe3+vnuUtlrecYg30YJ9NWa1I5iYdEsOdR0c2JrYkxzXR+pFHhXi8JpDrIjlOGV8KFYWabOF+sEhxg+FhbHe4xL8SOgqU/r+XWpLw508K9TJAENQWlTLyOtFgPmyzZ1yyj33r9vMpLhYj9Llg6JFQJYT5PrwjmEQejalmwNwJQ6CdH9iNrR/HxLsSwR5L/kYOHEq81yMme0OULGhbj/fIU7+41p08V0K8EdSOn+aKf7bOZbHDlkFxti0/kIBEF619iOsj/icDeCa2G/sue+xAckXa9QuwO7H4qEdO5yDdYa/aBax7y+D6a+wXJx472RMwvM1KjF6DJwjMYjyZ9pbool+QtLkc23hu9Cg44fcAoEEqyg+EufQd+a4eiO5oVcsQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vJkHIkxGs1sSrbSQMrtkEOzAsphdCyMVlZqdNKvPlkF+F4cie6LLB1Gj+67s?=
 =?us-ascii?Q?pTeLONixyLs3h2s5DxTu7l6KOKVLlEuRfd/y8crZeUpEr3iT1kCBLBUTN5jj?=
 =?us-ascii?Q?ukCcp6ALioCTy0yo35WvB+HkO8kce/nNOcLBS4RF25Xcdd6AgRkgtdHPZyDJ?=
 =?us-ascii?Q?9N94jJc0d9Yme+ESPCPZIWvJO3upKxquegEwRsfSDuvB+hgGqBEQ51B+I3Lo?=
 =?us-ascii?Q?4fe8o6w7i57G3dl3KuQNaRCkGQI60a12LzCQSSf/8pVYk/GsA+kt6PLDi/ei?=
 =?us-ascii?Q?ZnszggHqpdf4yKCLs2uEYj/YYhAqHcn91aQKbjJkG54rkSn9zic7+tdfc3SC?=
 =?us-ascii?Q?rwvEd8qQgjzbRA2FgSpTD628/XaAPOTXvucQTQNlWc2YttrUVVIyR71oTPJU?=
 =?us-ascii?Q?uBn6HSNEd74cRo76ML+SLgNhUQEjCTY+M+72NYeQLJWZ9yXqfStw+Q+wD3C4?=
 =?us-ascii?Q?XtHJFiI3avNnCaZeaDKFDlyze9uOFZgM5HG1Vi1mYrGAt5yESVix6uU6zqcj?=
 =?us-ascii?Q?UVP9BqfzwTndzkNeb82xuJwoncqYKYiboT58yOTj7inwESeKmP+YvoGeZjIo?=
 =?us-ascii?Q?2YSiEpS5ByotK6eZymNZxdBfxTMFE2biGdpFZRhsx0Px7Yz7RYITIULeLS8a?=
 =?us-ascii?Q?hXWNDUZ1wT47IqbjES/dmkR+8pdXEXQDGtG0w9FbIIALsFP481tzjrrmB4zH?=
 =?us-ascii?Q?2RmGjsoGrEm6ICskNfMUJU78NnTsk9URPsEpqFHrdbSYUFse4xH9mpLXGcmb?=
 =?us-ascii?Q?Ps8ZkkUinW3k37BMfFmXYSgrkv5oalNWHHuqK5nB4Evkw05nl+SmXup40y3X?=
 =?us-ascii?Q?4dhfrn4FvHFZH8whJMIS2slXPDE2F4CCzbTBk70zCgGkpAxwhsXDfao8srS1?=
 =?us-ascii?Q?elENIyWwahAscATC5P6I70IyFy5VBy5N4gCttMR8O1DDtOwTO0srt7tpV4fV?=
 =?us-ascii?Q?u6QThEIQNZG3ge98FoD2q4Fg3hkNDqNrtLCzCJtsiAkkPn/TIGfB5la8gHti?=
 =?us-ascii?Q?SkE3svNcvolFGj7R11/iaYAQDcz5AK89e7G8iyi57jmvGN5PQna9vvhvwnb5?=
 =?us-ascii?Q?7OJugiuaIguHzccuXDCqH5sEonQgLnNNipgvRG2Z4lBdUmws4zR+NOwMUfIO?=
 =?us-ascii?Q?xwDMjQYm5Ob7trx5w2t7gmjf9fWvn/2hdRrAb6T7Dps6hP/+HX6jhqxuv2z1?=
 =?us-ascii?Q?o1KwPCQxMeZ45I7zv44lPBBF37rwq2Tv8NWewfvYPI8M5sQsfvhFal67q6/b?=
 =?us-ascii?Q?FTSaI3iW1insBPlMULZsO5chG17EkD6Qz/xtk1UoeLg/VewuRCSbv9P2svbp?=
 =?us-ascii?Q?fU3SYuVvE559saRPjNpIjKVBDjEJakTeW0f+EqXJWT50tQZgG0BxYf8bZu/f?=
 =?us-ascii?Q?V8lsBNp96neta0NsTQaVtYXBYdRfbu/GsktqxMT/b8M7YvCca+dH/u6IPa3y?=
 =?us-ascii?Q?YJdopRMAtxaK5itiqvUdRP2j/jt4tQNa6F3vyvTBwgBpPSX/16eRwZscWrrz?=
 =?us-ascii?Q?bpLeGG+WUQbbGXgICBPy89bHO2W0drwEEtiPi4eJ3AdTp1VVI6n+dbg40lMF?=
 =?us-ascii?Q?4MGo91VttqHXgM4RjNQR2Wu3QMg5i3Dm97O/pKkrFXJuhAiAp9eWOjJPVL4h?=
 =?us-ascii?Q?F66EkATKmcz84nJ1o/cueCaiezoxz77A0NGKf0CMHL5TqR/JLGNHPhYZlKTQ?=
 =?us-ascii?Q?P6wABKlwp1+u4EXSIBlTcrUWHOZUQDdNfvRfH0/3fO4CsriyA0MdfRpbCn+C?=
 =?us-ascii?Q?fDaUBBAACDg+V4Z8bUeoRxbgNH6wl80=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f91f8fa2-caea-44e8-897a-08def86a1ac1
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:06:13.3615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNAV+1JqSX4sq6hMsBtUfRbH6mnPdMqsM8giI9FzYUBviXkkCF79SYF2r0h0r2tqRGHirS/qQan00bmZ3/JqkY09s4oxjhMt3EMuaJlMs8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB3354
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 12:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243281

SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
from its runtime. Backport the dtc upstream fix to u-boot's bundled
pylibfdt/libfdt.i_shipped to replace them with Python 3 equivalents.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-removed-SWIG-Python-2-compatibility.patch | 55 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-rem=
oved-SWIG-Python-2-compatibility.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SW=
IG-Python-2-compatibility.patch b/meta/recipes-bsp/u-boot/files/0001-pylibf=
dt-Replace-removed-SWIG-Python-2-compatibility.patch
new file mode 100644
index 0000000000..c1d0204e32
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Pyth=
on-2-compatibility.patch
@@ -0,0 +1,55 @@
+From 886616d03b6afcc5ce8b34e7af91f7ccfbb0a5c Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 11 Aug 2026 13:21:01 +0000
+Subject: [PATCH] pylibfdt: Replace removed SWIG Python 2 compatibility mac=
ros
+
+SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
+from its runtime header pyhead.swg (see commit 79f7a2b7cb7d). Replace
+them with their Python 3 C API equivalents:
+
+- PyString_FromString -> PyUnicode_FromString
+- PyString_AsString -> PyBytes_AsString
+- PyInt_AsLong -> PyLong_AsLong
+
+The replacements are safe since the macros were already aliased to
+these exact functions in SWIG's Python 3 code path.
+
+This is a backport of dtc commit 5008d1d6a356 ("pylibfdt: Replace
+removed SWIG Python 2 compatibility macros").
+
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/patch/2283713/]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ scripts/dtc/pylibfdt/libfdt.i_shipped | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/dtc/pylibfdt/libfdt.i_shipped b/scripts/dtc/pylibfdt/=
libfdt.i_shipped
+index e4659489..326a15c7 100644
+--- a/scripts/dtc/pylibfdt/libfdt.i_shipped
++++ b/scripts/dtc/pylibfdt/libfdt.i_shipped
+@@ -1033,7 +1033,7 @@ typedef uint32_t fdt32_t;
+ 	PyObject *buff;
+=20
+ 	if ($1) {
+-		resultobj =3D PyString_FromString(
++		resultobj =3D PyUnicode_FromString(
+ 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
+ 		buff =3D PyByteArray_FromStringAndSize(
+ 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
+@@ -1064,13 +1064,13 @@ typedef uint32_t fdt32_t;
+         }
+         $1 =3D PyBytes_AsString($input);
+     %#else
+-        $1 =3D PyString_AsString($input);   /* char *str */
++        $1 =3D PyBytes_AsString($input);   /* char *str */
+     %#endif
+ }
+=20
+ /* typemaps used for fdt_next_node() */
+ %typemap(in, numinputs=3D1) int *depth (int depth) {
+-   depth =3D (int) PyInt_AsLong($input);
++   depth =3D (int) PyLong_AsLong($input);
+    $1 =3D &depth;
+ }
+=20
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u=
-boot/u-boot-common.inc
index a1fa701e10..d82d42cbce 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,9 @@ PE =3D "1"
 # repo during parse
 SRCREV =3D "ece349ade2973e220f524ce59e59711cc919263f"
=20
-SRC_URI =3D "git://git.u-boot-project.org/u-boot/u-boot.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV}"
+SRC_URI =3D "git://git.u-boot-project.org/u-boot/u-boot.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV} \
+           file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibilit=
y.patch \
+           "
=20
 B =3D "${WORKDIR}/build"
=20

