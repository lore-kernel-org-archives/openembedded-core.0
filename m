Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54608C5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 12:06:15 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6486.1786536373173179878
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 05:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Bwky3iOl;
 spf=pass (domain: est.tech, ip: 52.101.84.15, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8iD6GtROZ2KiAXn+kDsFxJYjSbb2a2z3touDpI5jjhq7lEw7oIpNW2GK4TbsFc4PLAPcEvArgxMWzHuECzQQ+fkMvGvGAFA1wyaJPo8L2KFJSuj4pqHTCy+j+1EdvzHQt7fzTKg7NbhXpxwoX6P3v1edKsoRyxuaKZTz6T/Qvlp5ASTfcHRRZTPySqLQx7UuHseznOwaVrrkABkeRdp++qe9CyLrjMWloFl2SvC0m/Yi6tuycF4cVbtr44tWr34Ru62aLUO7KImgDYJHGGLpAIoph/9qCvcJ9FwdVkfJE68kMPLNCRP5GDWl7Zt1DHYUQ2MQeAMCjty8Xea5DrlyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+/lnZ3d6XyrajaW9EhHRaZaOPgvrRx37NLiFsR71WA=;
 b=bjgFRDyjNCv1mFP+s/MJL4PVmp8zL3VJ6AqNk9B/g3YnRVw7uBRBGwgKtVg4d1PV1bZLK949LOfwfnE6aANoIlOTj+YV9yvvhfp7WHQOPgusDssdYkJjx7ZjEafQcII6PRP6q8nZyEH3FJK8/DvcRCMv6DPPe/Oc6tmktgdzXoHK+lQiBaMd+wEIRrey/fZgMlUwL9WqSCCeoaqFKrKu4bhJkBsZcJw1oT0pR70A7wAg2UlU6iLXGF0IKSy+50JBwqUDr/MifwBuyE/9KcP/fmZZopzy5D/eAHwIPAspHHNWEevyUDZF/tJBv7Nw4IUxvih6c8XjxPG1Nv0bbkQMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+/lnZ3d6XyrajaW9EhHRaZaOPgvrRx37NLiFsR71WA=;
 b=Bwky3iOl+FlLMaIlDuFnMTZZJRL0vYJT0FWLOt6+Lieb91C4IWsp2CQfrBJx5M8SA9FDS1TDy2JdgD6WPFcmBVI40RBkesV095H4k5ACwRXTFh9ojT0GxQ60n+x3KmcjViEK/eHVQBCUkXnqc3f+YeKnbGe3O0oeL/idYx4LrcgEa2D171F/DLPYYtHohRsHRlUpepJCJYK2NcObhVWx1wCzvo5OM0guH+qKOBuZTJXDzR60lPa93khmrQ4VISrnn4KsZ5czta/8oFZzwymi6IuwCAhKihxn3c3+MA8xlDaaJ4LdYNACHZt/PPMQ5S6Zy/cdPlQPlqS3Qola7xS5uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU0P189MB3354.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:59a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 12:06:11 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 12:06:11 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v5 2/4] babeltrace2: fix build with swig 4.5.0
Date: Wed, 12 Aug 2026 14:05:56 +0200
Message-ID: <20260812120558.24897-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812120558.24897-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260812120558.24897-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU0P189MB3354:EE_
X-MS-Office365-Filtering-Correlation-Id: b01a7aa0-2920-46a7-5a08-08def86a195b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|10067099003|56012099006|11063799006|4143699003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	jsmKE115YeUYyx2+SiSI8BQ4rfa+7uIM0ZAY0D3HUdse3UFkjZWdVPK4T2R71o+s2mVA8dvMtXAgpReP23E/tC5j6omjA+si8ZtWLhOlPtSMec3UKUuj1kv6Z76yLjP7xBu+M026DEsOk2D0hfs0p60LJRISbfvRaH5/BdwgOG5j/hP9PQepkwNiX9ZUgmW8Ou+p5v7GZJbKHlKSm8N7wLah19zAEUtgc8f4L0aIl/4Vua40C2B1Nr1XIu/B/ZXsBwT/6TUK700/+4/voyyXVVd4GBYoPy1LEB+uCMECjXdkl+rZJ8aehbVmMgSXodt+fcLvewwfUXEz4vNG35MOAGLYXOq9pQwa2wuRA9MK04zubas10bTo9jYAaL0LTPZ8GtUTbwwx4un3hD8QhlTOGS7ZA9CYOdR7W0TECr8inIFyiTf1WL+XlJn4lRJVbycO1JtmFOXYgOtWkMno7ZFh1K6sXImsvon9XBlm023hct55RiA1eJGjWQfIDFfx9WwWuRPe4lJpXdmnRJNs1eIdTeSw3V5pnLix4cBqsfq1YqH8bbCH/kYPT1ck+nD3dgFT9ejq+c8c0ItCMRsI11cbzT9vjixuILIl0VhlMDAHwSQ0QrPfWuQZJKqMzS5c/IXg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+US+D1HvrPis+R8KA9oQYQJo1/4LL8xOFA3pi1SttrgJax+dr8AJT77q2BPq?=
 =?us-ascii?Q?lrR6h6ZwX1nksfnXb831+TepWtb56hZqNXKL1eGrxiZ/Wi9Kyw54RBUHBYxX?=
 =?us-ascii?Q?qKyqSKpWiqaJj2pa6RAWiDbmHWbYyUj0tJI8byZ5qP8pPWN/KJPAJP7apUc5?=
 =?us-ascii?Q?mLOkG5mO6Py2Ex5wqjm+uouksEB7AWFH1AU3F2Ozx1vqiO7XmBGkTRV3a5Rx?=
 =?us-ascii?Q?RT6J7dT8iL/AirBr5HsxI154QZD/dMX2A33pi9IiWf4u9wYgLALfFPo8YsRT?=
 =?us-ascii?Q?Zg3+O10JRrN3h/TQ6zmLshxeXKnR3DLCR7NiZUNrYWJzsQiaTFxhPcvqwd/Z?=
 =?us-ascii?Q?qT1EgQwIVuz1bc+qGkGb88i3uOx7jdBXDkgsC2U+iFA0wwuPObW2AEqrSNkc?=
 =?us-ascii?Q?zeN98Cv2xSDKLXcm9e6PY6YvvHInWLZ72/PoDUzd3TQQevlbAaT8d3Yj/LWM?=
 =?us-ascii?Q?m4Nv3zizH6t0Bhp60RNdfIkCMRnKlbFA38OznmuCYewt0hhzBhQlry6Z9070?=
 =?us-ascii?Q?Ms637R75VQ56uYfnGWtcVVrZgGaldj/oP01WGBiJCFsM0v+QUZ8P4h5N2mJK?=
 =?us-ascii?Q?40oW6auWomhAr4tR+Cni4u6KK9suRUBYdUa2pBWVdnmaB5UXRFWOy0Y3T9ov?=
 =?us-ascii?Q?uTMJVhQSsjw6uhoG7Rgfz+7u65n2b7/gfIYOCQfQ2t7SzKF3NWHP5ATuOT7s?=
 =?us-ascii?Q?2xlismb1AHDl0AAQ3ok038vouAJmAgzHiKTTq9uYSNC2PMjudIKpO/bqX5HA?=
 =?us-ascii?Q?W28N+BDKtV2ayzZGWaQPOlLoWveZEdVaRO5QTIDXUFV6STeKfgl8F4a1KCnf?=
 =?us-ascii?Q?A+zwjr9pYUNDRFTg4V4vpWwglHbdlP8B9+w2e3//drR9rNNSlwmvyUvIQ+3o?=
 =?us-ascii?Q?8YqagrbsvY6LgSOsK8D8MfpyTIdh9Yb3kwudg4jAYXZ8CDXPXv4RkKPKp+q4?=
 =?us-ascii?Q?TV2X02RG5PPpQkHjylGSNtk+Rtx8mqnoecf4uXTefTIh/+Qr51oZzMvClOcJ?=
 =?us-ascii?Q?ed9Vdpzinx3EdfWyANp0FzEAftW9MYno2xuEQgS2JIvArGbsfqjbPkyvZpBI?=
 =?us-ascii?Q?Jt079YrV3Z2VHCQWPvxzKa6JijeQpPHmcPkiZeMn6H4kPN9RWCQXDXt/bQzl?=
 =?us-ascii?Q?DyHnwoE+/OaeIbypcD8830CwWkn6LcfHdnZkSWxf4U8GD+k3dIkd6rlBFO0p?=
 =?us-ascii?Q?UAjJa1f1ICXvWdgHTkmnylOFuSbeLhw8QrFpTYdIzIrxCZcRu2Ey2HVrNtCW?=
 =?us-ascii?Q?oF1pRQ7uxoq8d0j9w/dncVwdk3cBx9ETm1pOWcMmMWLLn87tY5WioRrD3W6n?=
 =?us-ascii?Q?eLDLCnChkFVgUEQoqlLYSmkb3g0mxaadri7FpTCqjVyIdmRHO0hJi4NuqyUh?=
 =?us-ascii?Q?tG9i1BZVGszT9RBxz3pSeX/v29e4E+vo4tmut5oM11IGYE+ZHXnma8jHltQz?=
 =?us-ascii?Q?12Vsxcy0tVUSLIWtM082ZZPtm7yV84792QDNDK6Ys55ZP69BH3C8Mc0mN1fW?=
 =?us-ascii?Q?imbFRPCAm/ULJ9XhdoE0hhmS3FP9//TpCCwFT3qwA9jkFXj7vpyrEjiZ5Onz?=
 =?us-ascii?Q?P8OEzFY3dpGn4GokdVPqYeUP9AKxcmVfMB0JYXRNW1Zvnl/2XCThOSWsAmWg?=
 =?us-ascii?Q?iBDZVbAvGiTHAta57kiRx1Cw2qTc3KiQhTVHIOQGRBSh+tLb7FggmaxvJGz5?=
 =?us-ascii?Q?0/owDLBuGY3MMEbhqIq2xMEIRYXfBcMk5YtzSoMFRUTfIMjVIwXQicmoJwlH?=
 =?us-ascii?Q?y8PNHyDeS4MJvGuCJg4Qxi/tBE0Vpfo=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b01a7aa0-2920-46a7-5a08-08def86a195b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:06:11.0116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsniV9bCPHAbW/B6gCGF8V09ZeP3awyyioKMTpZ0QTAwWW0YRfZpvxQn4BpT/BE25U9/TosGz1hUu3G5f7EEW6t4QGq5qKB6mb6BfqEI0ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB3354
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 12:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243280

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

