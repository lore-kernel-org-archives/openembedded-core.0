Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C38CC5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 11:11:47 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52154.1786446699216408260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 04:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HCoJ8CN3;
 spf=pass (domain: est.tech, ip: 52.101.72.24, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LM940KAxg/UuNHtYp5Lcarj0hgvlHZX8cKFdNnXz7vu4RYmH7SgLPkBILwfslRk16wayzTaycTnxlmhhYFYOeIAMC/eJ5Dmcqz41KR3VAHUYJdoI7E62EiDE4dxLLqPJJNLWXBL3DoUYQDwWhdhZ7AAeOzAUYPoRp2d8T1fDguZJ8fMG1PBwgDSm3RvwxJCyWWR+P8TqixMQ303l7BJypoLJ0fKa/ZsNLSb9Shh2DKfoed37nHooZOT8FVuvqvNOf338fbNS42u18I2J9DaIWicc3auRnvkGx+cK5AavX17yzfv6e7RdZXAVvS/OxvgAuROtPHjcOqFZ66KVp9vwHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5WWm3HvHzi0s57pWeCW+c7mMXPkccmF2ls5eOv0Dt8=;
 b=OMCqnMUVT2rHlowBPa4XvOLPbyCwrj4mLuFrXyDWAHCUweQOv8ni4xaankY8TI1y3A8rWikXm3krTDPZVAvSLrMtFP0YMTeH3+80Qw7eiESbdvT8e6HbSXKJgLsd1S/OHDRsXwXSNQNm94xA3sVDOjki6luZXie3HrbP3KD6/xCFwQhpnhEzcJ/v5jAtfeDm8xTIaxtiVHbh1YFEXvF4eq3CaMj6PSpE/DL40UXKMjb00XU4fvxc3gxcIeBXIXWLiR1hpGRJuwd6GS1KupfC6+BF9I/2h6KouVKhGobAT/HKQjVeM3OsNGw+G6NbEuL+L6lAM2UjFsOOM0iV55O+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5WWm3HvHzi0s57pWeCW+c7mMXPkccmF2ls5eOv0Dt8=;
 b=HCoJ8CN3ZlUhX6XCTKV69ctN124ATKxADgn/ildE/ddbG+ux449ZfcZqtwYI8dJX1GWcPsmNx77aQ2ahj4PxGIIrOSdV+w1MwBWB6Pq5F/Cq9Unr5XAHpCqExNgeNgwbDDQpctXIfr4v87ZVy/VTUd2vzusrEkhGO8XZS64c+B0Fr7JLWugAT0AY4iu0D7tOWMux14frG9NRJHOhwa3Dyu3iVV1WppEmziNZJIJh3tQjTkYpnp21qwNBRSfo5q7WFEDdRGfWup8STxTRGJWKFXlmKnchBb2MDfBYAv5+kWCFXFyxB6//lAkGIq0fT11Y2BSCQ/48fW8c94uS0tUIHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AMBP189MB3247.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 11:11:35 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 11:11:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v3 3/4] u-boot-tools: fix pylibfdt build with swig 4.5.0
Date: Tue, 11 Aug 2026 13:11:19 +0200
Message-ID: <20260811111120.17612-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260811111120.17612-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811111120.17612-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8PR04CA0014.eurprd04.prod.outlook.com
 (2603:10a6:10:110::24) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AMBP189MB3247:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6505be-13c7-4d63-1020-08def7994ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	W5JNwa8K+olY8wcpTOTGMpHw7/f4pVHX59SHM6aCCz1iHVayNFiLtAC/IRXpr3K52VvBdkVSGN8ahZ12cyLn7lgmJCEq1UtiJfWb4B+A3jvwYOVZMG68G19iXPawHscqElJoYI/pG00jlfBbfXdN8l/XZEjnGkSc3AO9OednY7KEixwr0qqzisYbSbNeBaJ9HpR4Y+gJu3tOIWLMtjbqvofpalen9JqJ9pch1naFqEE7aUsN623T2lc9Ie4H77GAz9VWmFV+/zOW1DZLIQx4j/5QdOntVb//9f/0NkdM0UobTO35aVQVKXckElNGQ03wa5aJ1s/B5nptm1205Ya8K5LGp8Ve6g4bdVxOA5u6ju3hZ9fjYDeUPUD3bcF4QLKvbq2rY/5WNLkaG0K+uVGLSwTslB0Ht/U5NF6S67YXjsOr9aAkm081Esod62cvUGSpspUVvZUmHNQVqTSVZOBiI/sXRLf1fIX3lYMDA0NjDgHrB7yhaeC1ylnu4slJOupK6xNqS0QmxwZIp2smn7+6cUgCT6K6QuQnmzJmU63fa5gp0uM9cSeq8yxwv7O8mAJZ7HrlQP9mufpO6puqWYlGB44gd0u5JJr24FN/xFdGho5FApuG7p0njEyQhbIDSpFrWkTqY5lRDSCDIpkHjh62XHqyfzvRLV/4eWdVfv+8voM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EBeVgPa6gnAlOj9xmZy6iCcX4YvBV3lZMyWZcywwN8+Djb9LCtNcmJQbdmNx?=
 =?us-ascii?Q?5YbnMcb+bvKHkzJJCVfPGkphI74oAZo6qaL/e13mxXbrd8/7fLlUVoiMKBdL?=
 =?us-ascii?Q?ynHqyGim5T0n3hP3sf14wGePCnTrzT01Hqum7pSW4pI7HqGM5bG0bYWUWtA6?=
 =?us-ascii?Q?zj4Bnrs2cLR55WljVLhLmio/PUSrPAxXUpxTW9xjCNQkzwgSVi6SuACRospL?=
 =?us-ascii?Q?KMTONSPri9rs6qSuT0OKc0k4bFFsxpqGfbx9L+DgCW6StrflU6KwmbQ33T+6?=
 =?us-ascii?Q?OkqZ+xVrKvFdAEgHALWjypMFTIfGzBnKxhFCYiQlQxX4H8LyVRFKCl3TUGtG?=
 =?us-ascii?Q?famboS1u6/pnuqNb0Ctlq6iwccsuVe6MqqBt8suuXDX3qOzpRg3VHX4IbRpD?=
 =?us-ascii?Q?wjTABRq4N+3kU7+am/2XlKzZU1OJCyx65BiKE0ISMsi1IrOtj/5gzIGoiMbt?=
 =?us-ascii?Q?vgK8RJkMZasfX9W1CR2n8/78DuiHds4FtrwEAqvLCtzQS4Wq1A821BsWV4Vd?=
 =?us-ascii?Q?I0jJp9QNlplRX0b9Q1g4OQR0o3A2B1m1DwOn0c9Lob7QJKZt/cN0f1qP+tEv?=
 =?us-ascii?Q?mIn9PMSvj9jbmqhXgwwAiEq2yTHQY5rNn8wS2LYvriOo9dFmGcVgNvJKkZDr?=
 =?us-ascii?Q?2H1wU+JVBg/Hs8HLxgr97TIf3pxClgzzmW35BOUS85CbM4ntiWWbC/QI92O/?=
 =?us-ascii?Q?NjFydNfud6ZZTsbuPyiDLgcPuzz2cTu46k+rQNmEWHtgOpT7turF/XniKh5E?=
 =?us-ascii?Q?4S6O0y4rXmEEDb4VNI/fEGnA3Y/XpBnjpwc3SVGaSIMEnwj4FzUoBGd39gVP?=
 =?us-ascii?Q?jcmuhtPxAxTa4gz8YMwCgW6wZRUnkWYMFdf6vTel3Jx6rVhH2FFmcGv2EGOO?=
 =?us-ascii?Q?VONUGPMQtRJIx0ZtPnAttUoa71N2T7D9P3EpqzBQ6ccTw6URmu9+R25up4fg?=
 =?us-ascii?Q?PvLfJdGRDG3tWoQJrk17PFrr0eU0heP+f5QALmxvwi0yWCvXarxy2Gt87qKV?=
 =?us-ascii?Q?S9E4V/WVQSxA3u+4o/LJcRMJa3YZ0G29gxCgL8Oc8UUuvxBVKhZgfI+y7tI1?=
 =?us-ascii?Q?Lw1tuJL5jTo3bG8ziftu6pVnXUCwBWBQ3HJqGQT0uRZ7VCx5ndw8DVosCKHL?=
 =?us-ascii?Q?llmMy70paud/1bRI4I/ByFG6KGzQdr5ZaABW6VWe0HNQPD1jCPwQNJzU1MSE?=
 =?us-ascii?Q?WcACk0fplBMYvknA29qFqnqwMywyt+efbGI91VjgCQJrF8UuUmEntIGg/jNa?=
 =?us-ascii?Q?ylwee2yRaJCir3v37HiPQimm7tAJ0ffhvouWTRKrxAFx7w7LinDnbNdVkS5i?=
 =?us-ascii?Q?e8FUh/7HPPfqc7roin5NJCpxecceyU+JavfOE/7No/2oeC0FEiGb0uuCXFQl?=
 =?us-ascii?Q?LUXq78eBtfrYAYrjK00XWl3fSnMezRwKE2ihQnMMhTZXG9RPX4I6Eds+/dhK?=
 =?us-ascii?Q?jquqo2V09gyOGgwJFR7A2uTxbbVQD5cYdKrbS+v1xFupFG7LvQfUw9wY03SD?=
 =?us-ascii?Q?A4B5N5Ctb2DR0G0ePZKzosavIomQA+QQqOXhGmIFrZJcxzTvYFX98qYP/iMf?=
 =?us-ascii?Q?7xMkBCKpFQCo6TDKUHjwTSSmXrFj+TJ2wn+0J4jRZnafhe8XROWfdKb0VQu4?=
 =?us-ascii?Q?XeqY0O32Pd36DV31jCVZ+qonjxJrJsA3+jGduQDqVNkCqtT1c4l87NZUXccL?=
 =?us-ascii?Q?v4CrwkKhnFlEHL5YrFquOBY/OkmluSjkudS7PfO2i4ORNuEjH0jE+my9C1lz?=
 =?us-ascii?Q?2LnraqMxoEcrN2hJ3ZC2mFslvwVJQVI=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6505be-13c7-4d63-1020-08def7994ea2
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:11:35.5410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwJuO8rXd7GrgFh8b3mQ06lBmd5jGYOymi5T5AHSeob7rmngnyvHacwh45OXwu4Fu0n01oVkg82M1Ymhhydr3nHMQkb7SxOBWDM0FQEyHM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3247
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 11:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243190

SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
from its runtime. Backport the dtc upstream fix to u-boot's bundled
pylibfdt/libfdt.i to replace them with Python 3 equivalents.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-removed-SWIG-Python-2-compatibility.patch | 57 +++++++++++++++++++
 .../u-boot/u-boot-tools_2026.07.bb            |  4 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-rem=
oved-SWIG-Python-2-compatibility.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SW=
IG-Python-2-compatibility.patch b/meta/recipes-bsp/u-boot/files/0001-pylibf=
dt-Replace-removed-SWIG-Python-2-compatibility.patch
new file mode 100644
index 0000000000..5fdccf5e9d
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Pyth=
on-2-compatibility.patch
@@ -0,0 +1,57 @@
+From 32378d7b4383a79d13da9005035600d8f0c8c29d Mon Sep 17 00:00:00 2001
+From: Jitka Plesnikova <jplesnik@redhat.com>
+Date: Tue, 29 Jul 2026 05:55:56 +0000
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
+Signed-off-by: Jitka Plesnikova <jplesnik@redhat.com>
+Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+(cherry picked from commit 5008d1d6a356b8d0a78060da2e1021507d529cff)
+
+Upstream-Status: Backport [https://github.com/dgibson/dtc/commit/5008d1d6a=
356b8d0a78060da2e1021507d529cff]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ scripts/dtc/pylibfdt/libfdt.i | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/dtc/pylibfdt/libfdt.i b/scripts/dtc/pylibfdt/libfdt.i
+index 1f9c0471..b1cb9873 100644
+--- a/scripts/dtc/pylibfdt/libfdt.i
++++ b/scripts/dtc/pylibfdt/libfdt.i
+@@ -1136,7 +1136,7 @@ typedef uint32_t fdt32_t;
+ 	PyObject *buff;
+=20
+ 	if ($1) {
+-		resultobj =3D PyString_FromString(
++		resultobj =3D PyUnicode_FromString(
+ 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
+ 		buff =3D PyByteArray_FromStringAndSize(
+ 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
+@@ -1169,13 +1169,13 @@ typedef uint32_t fdt32_t;
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
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb b/meta/recipes=
-bsp/u-boot/u-boot-tools_2026.07.bb
index 9e7a178310..ea90b726c5 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
@@ -1,4 +1,6 @@
 require u-boot-common.inc
 require u-boot-tools.inc
=20
-SRC_URI +=3D "file://0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support=
.patch"
+SRC_URI +=3D "file://0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support=
.patch \
+            file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibili=
ty.patch \
+            "

