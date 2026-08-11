Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535D6C5CFDB
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 11:11:47 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51814.1786446698270951245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 04:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=D++QD89t;
 spf=pass (domain: est.tech, ip: 52.101.72.27, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLWWLyCVxfFt8pQ4Dz6zatj7tbPA57Wr+XbWu9iI9/yS4dDOpY3kJPs+e1378jzBencg4zaLmvlg7YvpeeWCO+zJZkCbepf8Lx4QGDKEZnR61hY/4JY2NTxXbZH9sT/A7dz7PmyRqQPE94qASCiZvoDTOAL9n08I74QhZ50fYcxvccFTq3VQ3r7I7/QLbnQX/w3fM4vLgaa9NywLzUZH1SAHLD06XFc2vR9j96NURPLBZ44c2N9Y86UOGyGv8cWgIDrpMFIqe5KORk1eIu0JgFB09ApsoeylCoaicieHycDY476gbDNiX0if53hiIwB35rf03dQOZ+iZ8KXdWmilDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+/lnZ3d6XyrajaW9EhHRaZaOPgvrRx37NLiFsR71WA=;
 b=mhLdmRBsEr9/HzdLAc4Nj6DVIkDTDaRBfiMBtNWivC6bVyS0a5D5pzZexBWDtqhI/twCVZ2IurxPogRDP3+/8GMqW1MdElXtvwm5EMhrbREyHG4uHZH5BiMJmEz/JAZ6tsWJpHumX5bxkZLxYEfJLgKVTIwRWtGooj8J3WnrJI2pLMKgOgKQomscd5tJM7WVhwXB8ryrGN9BleLCEHIiEOLnIOavAB71RCaSkWTiwOikdR1imaGUQ4l/L+dABYWiTza3/N1kV44fUS2KkDqxnbMT9HtCQBBgf/PGRUXgyD65CbsGLOJyLXALnAApQLug/d4LzcDEAb1fh92vylU1vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+/lnZ3d6XyrajaW9EhHRaZaOPgvrRx37NLiFsR71WA=;
 b=D++QD89tul5PSQGw/SKTnoGhrtnZ/P4cSTC1wE8LQrbEjfRkuforgPIro2UbUG/Wwh3dG3piz4J2PbrnfpY40MDIk+65b2Ty4EyoEa4iC8oFAZKpBpXR84mImhFkcuXHdAhfhQCQIl/iOf8VceUVX77pLV3C3RMudIQrucw9kqwqHj1kgXApFUCw7mL634A6ysW9hlRbrG4NYB9y67CQtaPByR8qt4xCrCNGtwMiUjAQZJ1epVT0a/KER9jW5HMB+pUItHPd5JsrA8xnuq6g88Xoabpde+fa53aG7g62H6dLpoFfX2NFfY/OuAu5YDAJj95OFj0gfiubJ2ZRp5UPmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0826.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 11:11:33 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 11:11:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v3 2/4] babeltrace2: fix build with swig 4.5.0
Date: Tue, 11 Aug 2026 13:11:18 +0200
Message-ID: <20260811111120.17612-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260811111120.17612-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811111120.17612-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0236.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::31) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0826:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ff000c-a2cb-4fb7-9a31-08def7994d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|11063799006|4143699003|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qWFk/3UmvFjgx0rpUzvL5MSzLAAmWl3oYEsQvMKfVVGTcm6TtMvNkP2cU2fT8rVUHS896Yh1/Fqp9N6ZDTPB1XrXMh9YAyyhf7kxxR6qQa+nOSfJ7n6ucIm7baAmKtL5la++n/8sL6leqTnSMphjV37QuoXgWs32hB/muRziCo4E66YCFh2fV8rMU8jf+wybGkGwn1RAQxUgFPJlTHQ5Zgynua55OUcXVS9PzfcTdbuCTwvWM9co1N6NFfn3EPipO07lhrcKsG8KwspeWGYp663PLZ0yrF62hszPArfWvV5c98J8IJLkWf5shXgc0HR9F/fNuiYLa8g0Ni2FFEqN63gbJgNpW/0MWr6AESQ/tzhN0BxlSY6kQK0x/diW0u/MFOOPFp7yfmpgoVUcQBPfBVwcTDOH/vUNVk2y2SaqvxedLTIl1IfQoa+X5Oc1vC959GmbuLgo7rZNCWRf6/L4sI93c2ZY9RY5m1S9mHQw3r9K2KcaJqJhYD5uWZ5T1MBGPxtLb6SSaaBsMRXSjArSwAz8Rp09Ru0nKndF7AtFyAKFQqUJ01DHEbqPTpx8ZCQYEuAlLiQhgBL7W42xGjizmol85k13qz/kSZBUvHmsd/vt/ty1E6Z4t6+14/2av0VE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Btva8ba8p/3dfmDSvQt6pK1RoIIezwO5pJP49B7LWlg5p5+1iqzALH02b7HF?=
 =?us-ascii?Q?S0q3mvvP2IjFZmbn8odtZOo/lPtZzVEGpZan0r/lyVHXxcjOyGGauPpGKlN6?=
 =?us-ascii?Q?hdOjSKJwWgv0i3sTBuFNqhIlQW2dZtBXrIyDnYo2XkOBs6xpQR5IS8xlywoU?=
 =?us-ascii?Q?+YH3tBEq2jqzvCDt3CU42ZzT9fe0Vq/wcgFZPfBC8wbUTFn6VcXkat8Ts1Dz?=
 =?us-ascii?Q?tMVYxqTB7ObHQ0lBwP/fabmDSJQz5PfIwhnKosoehYa5Kd/ZpgfCuEpg1aL5?=
 =?us-ascii?Q?GODYodzFEFuHe80OidrOU1qYFtuWSXa/aJoSbvsqN0Pi+nd7rqxD1XVR4DXn?=
 =?us-ascii?Q?dN978z7EqhpM7zmPSgnV/JxTqOoYI7iGBe3ScA/RuJ5WhNzR2vCosmdMQZHB?=
 =?us-ascii?Q?+7TbScNV7koxy/ygFOD53NMOSgyIlLkfVaXLNzfS6+d37onwdwEGCqJDjWYB?=
 =?us-ascii?Q?0PdDL2jp1pBhD4Z/J+p7zGEfaz0EWYvcniMsMKUHDBnK+9IkRAEZbfFWYmKv?=
 =?us-ascii?Q?ba0eEgJkWcWTbHKfwK32GRX2bTcV1fAJcHw6IAfNt65tQ3i21KjehDl2ZW0j?=
 =?us-ascii?Q?hyQSyfvUSkqYgdpeu2PcEiIw3vDZ9e3dmZLvZTzmjJUCunTcCOMTYwLey0pu?=
 =?us-ascii?Q?Ep+zBoriG+FhH/aLn381btdnA3iDmFWhgTBHtNj8Yg/KlP4Z65wkrWgIBunQ?=
 =?us-ascii?Q?Gn1N95PQH5QdaWOlXvXQRzfD/4AlO74VNji9XW/uLduixw/rgR6UtO0WPAvw?=
 =?us-ascii?Q?bwhBK6pIoeZcxx69XY2aEgZ4nnOFwQG07lh02aH3AE+LUjdc8WIrajcRi1QH?=
 =?us-ascii?Q?0Mq+EXpDf28BlTlOZ1U9tIO6hKQNvke6HM62GVSoHT944czaXVWnsfEoku+K?=
 =?us-ascii?Q?Qa1vRWqv6u5vlpRWfZ64ToFWUIUzdjxjDNf8/RVhPbzi7T55ie9PhEyQNf6K?=
 =?us-ascii?Q?qNr53sfubVdvmtA+EOCU7lqsP3ANULYBXCtStSVRq3oTfrxj61oRG8l8X+eS?=
 =?us-ascii?Q?6FnfThU4K92Z1EFM9dZ4VovsLI+iDxmACxZUU6YuPhfXVaqP1eFTbqy5f1uO?=
 =?us-ascii?Q?LS4dygwFuxkVv3Mlj9TgMzwTsSXHgSbmWfyZIKKzdevFydTG+PaZMQxzfdf2?=
 =?us-ascii?Q?YbO5Kz/f/dBYycMoW202TbZMNb2sbrfKYMF2ugggbU/0nhG1cEPCoOHjQy1u?=
 =?us-ascii?Q?13ZJZ4+1Mt4Ko3F4PjF8lHb5pw/z2pq0XT3rHecUG9I4Q1R4EbeYaejN/REk?=
 =?us-ascii?Q?Os7G1wW3szTm7unE9DDL9Q5a9g2SceiAaGNhb5VfIFdidFELtsfMPdi2Goe8?=
 =?us-ascii?Q?4tqEtQbKIKdJp8MSGcfSrIOHSymKdIU/PMoRCRLx3RSE5YENeBH4mvSFymOk?=
 =?us-ascii?Q?22pOWqskwKCwJZGv/97A3us0VCLItBVeP3pzSvjlM6UtXi50m6nxDKqu/YJn?=
 =?us-ascii?Q?uuVNd4nJBN99Yon3NTtgogoYSvkfI5ynA59bgoWAqHLVLp5IhptiXky+NQpb?=
 =?us-ascii?Q?WdvxMUMCssAgV4KXJ95GlDgcytl5XSjdCq3mvB6DdQSUGnlgUoZ/wpG4RkzL?=
 =?us-ascii?Q?CwXkrwSm4nF5k8LooScGWWYfKbXibjki9ukZBgKGJmQqgKxIG75kZLFyVJL+?=
 =?us-ascii?Q?RYJ/ONtNohRwvuzAVJGe4O3AoVvni/B76kbrjPASxFfFwfzjj7dTAlKaDHfO?=
 =?us-ascii?Q?q+8iHjYLEFeElHoLLP7NEnsnHiTb5dTYrItPNO4vNBD/kmcMOsl7txYpmCsk?=
 =?us-ascii?Q?kWbekb10t0DcQu7Wfi/WuiFP7TKrFjw=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ff000c-a2cb-4fb7-9a31-08def7994d7a
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:11:33.6214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEUtsHRcCriWVoqJAQ+rgwgU3ym7/qiGrcV+/fUilIiK4t8i/OQTAV3nNzu9le7KAX/qlXDeZswJmBgAlhNVtkzrh2JISOFWCQcz47cvTOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0826
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 11:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243189

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

