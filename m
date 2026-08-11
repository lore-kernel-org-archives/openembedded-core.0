Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39247C5B569
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 06:13:49 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48324.1786428820246534812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 23:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XHbOFgq8;
 spf=pass (domain: est.tech, ip: 40.107.159.0, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbZh7kovzZrgM1wioq9Xze1l4tInZq+S8TnWDBwaP3naKFFSuERAR46H2CReVfUP0Qie+M3WhA88zUvXSL/pATxGWN46fTteIOfutGAMgxZhmB2gZgpZ5BEoRD8U0MvswLO3zJOdG3fTe8UKBZ1yXUUS07rIvmcgO3B7VZtSWABBtnBk4YQPLURMe8aMaV0yIgUaldJlqBMgv8WnKqLeYz4dqjmCBEwKCL3Ja5UYgK8LabKy2QLATTH+gVQjaVlOhQ6CAemKC8O+QLBLyqyHdmqyUHqoezwcT/fcwjFGMcOTC1wK3sQV0xO+Rb2JTNhOulmVhWmGlT8A4ZoMFoRaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+/lnZ3d6XyrajaW9EhHRaZaOPgvrRx37NLiFsR71WA=;
 b=jNb9xoSzNLlWU/s4cI81YSxN+SQcxW87Olh0fFVK6z/1pitnjTWffwfQW44gjkxIOt88seDWgllwGOiEdCr+jlXKX+n0o6a4PoFRgk6iyObKFjWW9QMm1BfT1QXdccs6PLefnuidDT69yTHnzuMOswrJGslgnvdBWsbhfAkTEqO64EmXPD6cO+1VOdIXUFQGCvmzt0GBXH4XC15PsDYKaA87eED/jhGDM3OxllYPsk5H+pFc4XOe/VNUUIacXz4cIsYwBhiiwW1QI8AKisRs18kRusrfshwuou3uZaEyDnBqvc8oxt25mnGBsfHsmg4R1/YJb+FoBAfa/lR+SAHXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+/lnZ3d6XyrajaW9EhHRaZaOPgvrRx37NLiFsR71WA=;
 b=XHbOFgq8VvzbR3pj/JgULifm04AFrKvfFnr/9e1Lq9Q+IumvUioyzc5DaOfXoEE5EWClxDykj+DCn6nDMv0EMSmC7ipvA7zTNl0fAWkY5s81vnIAx8/wksK3unV1a0HiO3uGzrWBI7NerdUNFQike3x3vsySW5JzDOaj2YwbgAYLK6BPWmQ4/8wW4oQC4qHPTW/gop8ImfHS+Mf/Z/lNWnZSDn9P6azMztyMrZLcFkJ+OOPPawcc/vVkOSnPtarx4xOC7YVObepImfzH2Ce8uO8/gM2FfMFxhd3d/3TVVZHBBEmMeKFN+/ZzBCMzm/+yxEL+p1F7dHj0qpJb8PABEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS2P189MB2581.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:644::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 06:13:38 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 06:13:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2 2/2] babeltrace2: fix build with swig 4.5.0
Date: Tue, 11 Aug 2026 08:12:51 +0200
Message-ID: <20260811061251.14757-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260811061251.14757-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811061251.14757-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0032.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS2P189MB2581:EE_
X-MS-Office365-Filtering-Correlation-Id: 636ef97b-2158-49ef-8f5b-08def76faefa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|23010399003|18002099003|22082099003|11063799006|56012099006|3023799007|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Rlr4nQeFmKQ2vRkbXbdRjCmuZfcDE+9riTCOrxzljMY9jgaWLSOvbpAA/cXzJ9vYAc84pWrMPxRr+1OzOpxCmkS7++JLABWI5X3tihpJrXszKefagBrvTARkPMhWir7WlaJar0XZm2rTVVnftu/zAfVCNx0nNVL5NeHrUp9xKp06qholnElo93xfrALG+jg2Oh758tAEXOipaNXZ5KsSyTaBPodNbH4ex2hCZUFdf6MlAMSA02p+JaNoLRcNtBiozUZ4mYsbyDumx1+va1kWug8/9IskN/1YV1NS+Px9USN1cMSGDoUyoerkJ57wdH2P5aJ4Qh8EDApRvQAgnRoEZWPv8QC4frckNvPPCSfrfzKUqxiWwndwBcmcy9vdndsI/P7y5nTM2Jwd+26dEEiiisMj0jWj9YyVLc75PuD1RINDs++eYtekQjbYbEKCmcJWQZ53ppsC0tXxMR7t9IneOdiv9d36FoMjOyvmtnFrc/L7CovqczVzEFWeqeqSG/Jaj/rdhxKXUk6hdGF3toTFCkhi5jkcKfODQYRVL+xLUFNEQyNW6FJPjPPLtXEJi9vk1MC40KsRg+Y2U6GyWxqoAChsdrrvrfWX+A6paagxkju8YaLQbDcP80ziTk4eXrkvoT7NqzwQ59lW+eqUKv+KkeLb9W8FAXXZGOluqJg4m2g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kEgA/tbI5ZCwLBzJt0Pm0eKGbZqphRqYH0ECkqqX51thLT9YIiUvjYf/88KQ?=
 =?us-ascii?Q?grxjYD4zALit/ffSMKX0JCmj+28KZiXmbOA2090RJLZRQyXXO4TjkkFTrQOR?=
 =?us-ascii?Q?XQc2nPXdB8swJcbU94oBA2tpmIafRYc2wUi+/+ArsGID6EAEMoOpc/trlxhu?=
 =?us-ascii?Q?dN9/JlSTiyjaTexe91s5Zrz89+9lR2/o/knBlsUzhDxliWLpOSjwOU6XmDGF?=
 =?us-ascii?Q?rs5mZuj0duT5D8q83KUrvP1GAN1YOLTuQYGQInO8o+YIqQQnrOaZSATHMlPF?=
 =?us-ascii?Q?3l/hEM2nE52LdQMKSsX98FPqPwFln+qDsTqvYurMxT0M02NRKsBZjiSAwmQB?=
 =?us-ascii?Q?UkRmR6bcz2IA51fwkwbP2O2E1Fo7gc25FWuqB1oJ4RvMOWdGz3pzsboYxPJb?=
 =?us-ascii?Q?+VZTvU4VVKHFBVw9jGVXNKSRaUOeFaQakcxH+jyrJQtRNVzkMlWkZPQIL+Gn?=
 =?us-ascii?Q?sLe59ddHISKu5bVX9sjkRx8ii3P2GbrXzL6OeYVi9wAiBDK201WC731qiCZt?=
 =?us-ascii?Q?YTFwVvK9mZHM2Ot6u1S9iBVkNEHdevb7MRb631iZND2SFigEHs+XBcyENR2G?=
 =?us-ascii?Q?WRsLs52RFW5MinB5EnsDmAaNn8ja7XwFKgVIWuaYHlb3BdJ9V16XN2oK57lT?=
 =?us-ascii?Q?A9x4uIA5diRRS1RDApqHGJLZAQcdKTqwe+QKs3Dt/6SaSO0vHL2BJCLTojiy?=
 =?us-ascii?Q?R8dArSfTKuVGBcN3YhttH+VQmsZWUA+93+Dl354gM/c4Bs/CXQ51Q9KeRpxD?=
 =?us-ascii?Q?tuMETFpptGd8q5pfGjGVL10K39kmSqs7NKapoPA9IP0SehUJQQInVGX/APKD?=
 =?us-ascii?Q?ZX7j6k6QPbRc+jOQ80PJtM7rkYlm78oWdNwsk8UkGMa12+UVqmODPfCg9Tpm?=
 =?us-ascii?Q?8U/lvqtt6bFsFq32D2RDRCfkpqHe9ClyAaBj4WdIx6OrHmfQGBOxsyLLjW8n?=
 =?us-ascii?Q?MnrL1ufe1PvBEwWj+WuxKo5dIrcvdozHcCeRD36jkCB3Wj4hoW2LHRqmh/DA?=
 =?us-ascii?Q?PibN9ZytJ86vIqpUgi50IPxHS76zmfwT9Y0QcYp0Foh4ZNgopBBeOzeYPoN/?=
 =?us-ascii?Q?Y+I2p0gCyle8fqMbY/Z1A5XmlSqZ4elTK220YnJrcLp5r4weRs0yM+SMX4ok?=
 =?us-ascii?Q?vLzeSbIjzH9GUxSLMxnyZzlrXEnRPx3El3Q+uxo1EQ3hQRYrBbwcYMp6Dlva?=
 =?us-ascii?Q?EUKDj/lxwKC+WR2bTUsFTbxYNCPLjvItCyP2fjAu1DSeRRfzj55XFv8FLieF?=
 =?us-ascii?Q?ETw9oYWPjvy6ntZK4Us6XPmsh+6tgI438WLaGzMpZJo/Ihivm24SWCqkqzJ3?=
 =?us-ascii?Q?cOEa236gKehjAIXK9hVCNIqaamHRC89nV/6Y46C7Z8R6r5WVgrimfIslXomA?=
 =?us-ascii?Q?cvPG/kuDIdiqpiPEafz7JsWa2ifuspLMqhys6afmN8icB3u05jq1EdwRPF/S?=
 =?us-ascii?Q?TnQUkS5PEUbKH6t1aKj7VFSG/jdBYEuctCwden0/j9nV6yxV/AE7QA4opJ7S?=
 =?us-ascii?Q?s79EtsGJKSMZGI7R+2qit3ceqn/+8qyFbgyh42phHysk8oI8QjPSmian89ST?=
 =?us-ascii?Q?RVPzRBL3sKUC+XY99C9SdA/Z2NAaXmzCSot1DvVVpu/mc9FQVrv95/0RWtSn?=
 =?us-ascii?Q?IoCK5JFfDlNLA5D0T+5rVeh6ImxuecULb/qvAqWmTYNSedeHcXH8eOKbOjgP?=
 =?us-ascii?Q?wCykrOYekGdmlBcK/ZrQSA09en+rqOwrZRC9NMpE/v6QZQXRw4bpLofjpJIs?=
 =?us-ascii?Q?KB10YP5neO3Ff9kaBt7uB/blpKmyaWQoPxsesiMrRev4QqZEvB2cllrNv25W?=
X-MS-Exchange-AntiSpam-MessageData-1: Ih4gWoLM+DOMAF1M6Gf0ZOa/eS5XkkA9VT8=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 636ef97b-2158-49ef-8f5b-08def76faefa
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:13:38.3268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXHYYa6Qrfq90M4arK482TJQvGEyzRHW4kOSDEo5rSfrbgJrd1b/gPp0DY38VprpzyTO1fLY0U+eOJoTpf8v5wTGWhhKPJhoxk57q3XcHBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 06:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243152

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

