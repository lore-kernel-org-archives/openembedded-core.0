Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDBFC5B572
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 13:56:08 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54566.1786456564346706674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 06:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cPSzxU60;
 spf=pass (domain: est.tech, ip: 40.107.130.54, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pe02h1TJoRAZfLud/145o4rA0F3Q3LMxg0i+ryw7hJ0VVFQmDiU1qvO4YzL2M8ZTN9FE1//JVc7CVCJlV/Beyck6yLmy8EFzFhMi8JvOvtlXdmTlf5ZyAb+nAfZJInPJPukP7WVRAVNaL/lvqHfXAm3gMMyPRFBsZu6TF/BZ/+Q6Lh/Lj6ikDw/Hy0Ka/gTv19xof+JHv1J3iVDnPR/SYWh2oSAP6Ds8ipTAw6RoUDKXx1Lpkfh2cAsTHTAWN0P/ZSSCqUAqoteJPl6WKCKnVIsm7uWRI4H/pS5Mt9Qems/fxnTiP5lf83fI2A6L1e+aeNcNTwLnEuXRCjJXKw9UVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+/lnZ3d6XyrajaW9EhHRaZaOPgvrRx37NLiFsR71WA=;
 b=cRZaChPrFMItqv1WXlufWm8xAWaFOekmFYNj7tCNb3Zm/DcRU4VNnYnGjQWktWD7A31MrEEBxyCGk4dJQN/c/ZQ+GW0GfnJcngu0G+1pBHlcdirlLI8fHU3zYTTL+LF0N+pHMoqMpTjqM2izsi2NGiao5V1ng4colLD7FdZqE8WIVqJAas+gr8KtcIUumdYHZyUUsSWaNokPqmPc0FOQVDE3bhEu4ZzHdeY/Mdvx2on83nbx5syG/4tiNmUe42D5Eh1kzmDb4EG5nsylVX8fgfea+r7Jb+zp+wHNPf8Vc/6TQMHNKaBVY8ZKt3RHv+EgD+wm73j+xFzHrriLKjwi+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+/lnZ3d6XyrajaW9EhHRaZaOPgvrRx37NLiFsR71WA=;
 b=cPSzxU60t+WQwtnL36LHzqfMsQARxD1YbPH6rqd9Fh0yeEovKxpRdJVwnNxilWA33rw+L4dop7gGnf/r4kCXOs26MIJmHGtJVOkZWINlJbBiFAR9lAg4IFR/pmkVd43YesfPWVnUCbCkg3gSHqp6AFCD470Dk5SMalOHHkenPW9/kzb1qtl0SwKjih+UbVPVBNA1acTwjWOpBGbBPG+a1BuHDyCZDDd7SG0ybHF+ve6yR0oAv9R3x+yamdTPy8RW36WG37K/r97V2Rd/mF168jRtEsjJNZb11ZJVpVoJpRMX14/3nfkUvdnoJU2nLIUKK9cXOfgkOHEqPzrz3z2EwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GVXP189MB3447.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 13:55:57 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 13:55:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v4 2/4] babeltrace2: fix build with swig 4.5.0
Date: Tue, 11 Aug 2026 15:51:58 +0200
Message-ID: <20260811135200.18942-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260811135200.18942-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811135200.18942-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0180.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GVXP189MB3447:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa0c3ea-aab9-4aa6-c595-08def7b044a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006|3023799007|6133799003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	KgfoDoKvf64FSIh+mwll9HOZNJI/lSKEEfmgcirKn35+wkQNn554Pd0izsOTNb+EzNQeiHQgZYlGot+BtipuMYr5SAGr19C9+/u8Cb2M+28tBHKi64i+KerRLu+vjO5FTiO0n1Zs8eHyEfYsWmJ3NwVWUNjPoX7eXeG5d9DkUjNhf01ULAKJK76ezifuX4pjp9S+pEuvGV9bQ6BTJ48oQ6sKsRMj1NeOPtpn2pvx5DTXCh5m9EU41U/xpjw+L58YCxzed8Nph25s6gg5Xr9PqXDJaPtWmxwOe+fQRVvlMOp0MiZUFzc7B+HY0l6UcRWmYBzcehbny7IoH3nmkz+fxcQHCAa2D20JdovbP3mBZARRQsABMMiC74wkmXEzUf/QMRxRyFsKdtMEFqiNnbDdz+XNlO++sDG7kz5QNH+hx9AVPTuglEMaTGJozm998x53EINrqpABO8n1QJFQEkXDj9VL9PQrmFlUd4Wx2UrrlNbUzmg9NSF7bCDjhYixUvKXWO3vB+uD4h2iQAHSdmWeoEB8CuG2wJ38+LXrDNaEFPvA0MvDnJ0IriUZUbSiykOe6Kn2kKoyCvizqFRv+OeKxfUQ14NHsdUQdwyGFK4YlNj+qksgTlcSBkrtuwTnI/TL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(6133799003)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IRM2Wfvj4eb8oH8+xO+VgRypHdvlbs92irnC0plyVN/YfE74D9On7kAWDydJ?=
 =?us-ascii?Q?xQriEjXuUtF4j7QLfAkiJg8R657qtgonSGjzcf6yI3tJ5+VQlP3xfm3N95Do?=
 =?us-ascii?Q?8jbECo+jjFVCi3qL2RGsd1Ma0zkyIFgZm91uGlrzf+ltVxmhvQKmyn5KGK5Z?=
 =?us-ascii?Q?MLe3fv1Ext0jRjOUlZC/T2K3b0wKkRTeeh1atgBYgSfrBb/v4qRRjbmKkYHw?=
 =?us-ascii?Q?Nq7saD2Ir4Rj5rHnk4rqIpbyuwYcHvPHCiVrJc5Xhi2NAfbVG1twAi9WVMDE?=
 =?us-ascii?Q?u7Ww4nRYHjKtOjE9qiwVHx+JN9T4ftBJ/28sZdywJ2g0dn2uqk6RvwKJFi1E?=
 =?us-ascii?Q?URjFOlXASoGSKG3ZEyQIi751MHmdfPvgyxI9bL77vzGMKZ+HBKKD0e6RHUBJ?=
 =?us-ascii?Q?xZypzDM56+bcVnzdwn80m/SoABv3uTRasErOQm4itUSTtzLYUbK/0I//+JTz?=
 =?us-ascii?Q?9oPoDCpsdCpvXNVg8ohXmrXMUCYf6VDXlpYOiR1WsVup7xGtLgb2SZWsz4el?=
 =?us-ascii?Q?D6/rJpnJF9DErdI83HwgwIGgVSvgQu9//FF+t8r3cIGS7Ysf0zKgIn83H9Jr?=
 =?us-ascii?Q?98pP0Z3dUMFjiBm+TdKvhRWHQ0uvHdloJQiRWImjLCTFoX2KfaX5Enyzz3Hd?=
 =?us-ascii?Q?lLYorbhxGI+7QslWsMY8wEPvK6qL4Qsgsh1wDSDX8uiRo9bpTEJ1vQDRWTEi?=
 =?us-ascii?Q?O/1A35IzdR4g8iFs3DEEoV80jleqpxBJ5YqE4KbtmibPS6RB7Sg+OsUDMNg3?=
 =?us-ascii?Q?TvtbbeBjWiuXirt6YjoWeQQ52jU2wm1eCNAC9Fr/fNIFwlQFqqXuSgJQrVvb?=
 =?us-ascii?Q?9aMdzTzz/bStH7O/41VDAJPDYxFYkzuSwnU+sv3mNDlzdDTm5beORCSjhQP4?=
 =?us-ascii?Q?QzOOSZ5CJZmTpsBIgI4XN/mD86+2LomZhqWmu1i9U7qSAQHXhtpeeJb+QOeJ?=
 =?us-ascii?Q?5SGMIoGiyRgiEaFQDZkMzLXWHU1N9wc6waiDv6rNh9SE/puFZZKbyla6eIay?=
 =?us-ascii?Q?BP0YtHzV1p3Un6Pv6rXoVV6iUh0h/DxIzRbNV1dEwjTwUAq9vsy1JHu4VCBM?=
 =?us-ascii?Q?4BiCFVS9t4IIYLGw0h+AvV5Woqmi2UOo2OG8nqQNJJheL5AEek0sdF7YMkRs?=
 =?us-ascii?Q?zS/dY1HoF4tcnL4QLSsBTf1XvN8Q+5rGxm/RwJsZ1UxiqfWf9Dsk9cK7rQOU?=
 =?us-ascii?Q?JVdUOYTfo0oTKMn6gJRnqPEBiZp1qKMxSwJJYJh3nJXi7kn1Hc7rtSBetWhq?=
 =?us-ascii?Q?xr1nUOpWVfviqigTuo3L1hsLNuCh5LG+pPbXTvu08GrdzaBXJOSXOT7RcOhW?=
 =?us-ascii?Q?F3wB+bGF8qzKZOx4OIeTCzBasZFxH4v4hTs5edQXvVahmmgPmWNUM64UxZFD?=
 =?us-ascii?Q?2ZyiT3PyyzKZpB+GyLheDBVq1q7KhzbtQkPNc215KBrzCOk6QVKDMh0wXrzd?=
 =?us-ascii?Q?8E7K05xybSSo79+eg90e/iJ4BhWkqutUs1Jg8bzsl8+rFNe1DH/TMduac/VZ?=
 =?us-ascii?Q?iKiPViRxOf+YhtbMNI1ijUQCmw2j9zRKAzYrK4EVVUVRWWp1VBC9NCDAJQYI?=
 =?us-ascii?Q?vNvGoJO66+5yA4xjKALSY43vtSGo4zLzOjlaqywzJFysUMm0Ul7luS8rQod7?=
 =?us-ascii?Q?Q9LUGs/Q6ZbGJ2q1vltBoz3QzbvqEZe5CfWDLBxuJ0xeRKABMtJGPu15RP9Z?=
 =?us-ascii?Q?pvDVbPDjhN4dA73KKNUvLUNnJoFIaCYIefmkFokmiNqApGpdIqgXxYeQypkx?=
 =?us-ascii?Q?yHtPPQWGJbgsSQe198pNYj8lyce5kf0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa0c3ea-aab9-4aa6-c595-08def7b044a6
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:55:57.2673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 924lUl2jB0EeTMzeqpGS0O4zX2jcyL4YCDmNKzQ6lPhgdbnrzuU8wvLzECzpL/VCRS/62S125eP+eVEFdcQFNzSne7ZLb0f+v47g57qWCQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 13:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243203

SWIG 4.5.0 removed Python 2/3 compatibility macros PyString_FromString
and SWIG_Python_str_FromChar. Backport upstream fix that replaces both
with PyUnicode_FromString.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...Python-2-C-API-macros-for-SWIG-4.5.0.patch | 70 +++++++++++++++++++
 .../recipes-kernel/lttng/babeltrace2_2.1.2.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-bt2-replace-=
removed-Python-2-C-API-macros-for-SWIG-4.5.0.patch

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-bt2-replace-removed=
-Python-2-C-API-macros-for-SWIG-4.5.0.patch b/meta/recipes-kernel/lttng/bab=
eltrace2/0001-bt2-replace-removed-Python-2-C-API-macros-for-SWIG-4.5.0.patc=
h
new file mode 100644
index 0000000000..e0b042d62d
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-bt2-replace-removed-Python=
-2-C-API-macros-for-SWIG-4.5.0.patch
@@ -0,0 +1,70 @@
+From 1c59884d4d3c74d8ea7257d9cdc0fa4b533ae7b3 Mon Sep 17 00:00:00 2001
+From: Jitka Plesnikova <jplesnik@redhat.com>
+Date: Mon, 28 Jul 2026 13:29:18 +0000
+Subject: [PATCH] bt2: replace removed Python 2 C API macros for SWIG 4.5.0
+ compatibility
+
+SWIG 4.5.0 has removed some Python 2/3 compatibility macros.  The two
+that affect us are `PyString_FromString` and
+`SWIG_Python_str_FromChar`, which are both replaced with
+`PyUnicode_FromString`.
+
+Change-Id: I3c74d8ea7257d9cdc0fa4b533ae7b3a5ef9521d1
+Signed-off-by: Simon Marchi <simon.marchi@efficios.com>
+Signed-off-by: Jitka Plesnikova <jplesnik@redhat.com>
+Reviewed-on: https://review.lttng.org/c/babeltrace/+/18423
+Tested-by: jenkins <jenkins@lttng.org>
+(cherry picked from commit 1c59884d4d3c74d8ea7257d9cdc0fa4b533ae7b3)
+
+Upstream-Status: Backport [https://github.com/efficios/babeltrace/commit/1=
c59884d4d]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/bindings/python/bt2/bt2/native_bt.i           | 4 ++--
+ src/bindings/python/bt2/bt2/native_bt_error.i.hpp | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/bindings/python/bt2/bt2/native_bt.i b/src/bindings/python=
/bt2/bt2/native_bt.i
+index 7f8d9f699..1807d8ff6 100644
+--- a/src/bindings/python/bt2/bt2/native_bt.i
++++ b/src/bindings/python/bt2/bt2/native_bt.i
+@@ -56,7 +56,7 @@ typedef uint64_t bt_listener_id;
+  *
+  * We initialize the output parameter `temp_value` to an invalid but non-=
zero
+  * pointer value.  This is to make sure we don't rely on its initial valu=
e in
+- * the epilogue (where we call SWIG_Python_str_FromChar).  When they fail=
,
++ * the epilogue (where we call PyUnicode_FromString).  When they fail,
+  * functions on which we apply this typemap don't guarantee that the valu=
e of
+  * `temp_value` will be unchanged or valid.
+  */
+@@ -67,7 +67,7 @@ typedef uint64_t bt_listener_id;
+ %typemap(argout) (const char **) {
+ 	if (*$1) {
+ 		/* SWIG_AppendOutput() steals the created object */
+-		$result =3D SWIG_AppendOutput($result, SWIG_Python_str_FromChar(*$1));
++		$result =3D SWIG_AppendOutput($result, PyUnicode_FromString(*$1));
+ 	} else {
+ 		/* SWIG_AppendOutput() steals Py_None */
+ 		Py_INCREF(Py_None);
+diff --git a/src/bindings/python/bt2/bt2/native_bt_error.i.hpp b/src/bindi=
ngs/python/bt2/bt2/native_bt_error.i.hpp
+index ba8cef097..2be1e347c 100644
+--- a/src/bindings/python/bt2/bt2/native_bt_error.i.hpp
++++ b/src/bindings/python/bt2/bt2/native_bt_error.i.hpp
+@@ -19,7 +19,7 @@ static PyObject *bt_bt2_format_bt_error_cause(const bt_e=
rror_cause *error_cause)
+                               BT_COMMON_COLOR_WHEN_NEVER);
+     BT_ASSERT(error_cause_str);
+=20
+-    py_error_cause_str =3D PyString_FromString(error_cause_str);
++    py_error_cause_str =3D PyUnicode_FromString(error_cause_str);
+=20
+     g_free(error_cause_str);
+=20
+@@ -35,7 +35,7 @@ static PyObject *bt_bt2_format_bt_error(const bt_error *=
error)
+                                 BT_COMMON_COLOR_WHEN_NEVER);
+     BT_ASSERT(error_str);
+=20
+-    py_error_str =3D PyString_FromString(error_str);
++    py_error_str =3D PyUnicode_FromString(error_str);
+=20
+     g_free(error_str);
+=20
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb b/meta/recipes-=
kernel/lttng/babeltrace2_2.1.2.bb
index 7c151bf729..9962ef377c 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "git://git.efficios.com/babeltrace.git;branch=
=3Dstable-2.1;protocol=3Dhttp
            file://0001-Make-bt_field_blob_get_length-return-size_t-instead=
-.patch \
            file://external-python-tests.patch \
            file://0001-src-explicitly-only-build-shared-plugins.patch \
+           file://0001-bt2-replace-removed-Python-2-C-API-macros-for-SWIG-=
4.5.0.patch \
            "
 SRCREV =3D "d0e946a71faf5f0c2d7f1fb5b92a369983e9cf10"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>2(\.\d+)+)$"

