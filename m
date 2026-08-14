Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C37DC5DF69
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 05:18:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6893.1786684725685092687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 22:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=t436umOL;
 spf=pass (domain: est.tech, ip: 52.101.83.63, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaZQAFQdTVCZLymgL8+ROy5Ei6VGUSmKG3jhYYQ0DbHNh8ISsM/Fl0q5p3A291J5GxFX95Jqau1/ct+Mjuxs2yJrZqBvxfLFugAeQVIDLvrUaK8prI/NWvQQOANQ3JmOxn2aMnlrc7gX/+AWZwIZql+ghhDLuYdcdsRTG/s+EDjw3dDXv2nZCdsPeLtXOHL5dxmhNjFrIXL1ftOPwW0Xc9BpP7PTZC5H+iPH0fOfmaHZOKGoifZH5aIHcCZjET1jHWFO6e7lB3vBdjIhYDxJHAH8vTpz6hNkZopKBHzQCXLiuC5q73zaCuYx8CiK2jzQufK3G43zlvTeUQLECO+Mag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnpQqhiTijQD2viIb0eklZ9CPeDOsOv5Wm0kLohqvzY=;
 b=MM3tLjcTPLFHiwDRyLKTEVv9RZJ+WcWFeRFqcxRs7HenRE5cBHhTxKMRzCT2K9XZQDVagiTSa2g9UvPjXBYRwvXB4mMEjjOgvzhFAXMPdEF9aAeF80ysaHdZy2y7bVctmLm7BJ6OU2GxPZaHhlIPUXM3IkC3wfCKUdUoXzZhEkV0EZjZDbMJcYzDeAyti3/y4Svfuv8Y5SK8jfbf7IGbQjs2ja95DZQ9DvluK1EavM5s92VGExZI7zGSov+UedDytcNIKzo9ecNwPHd14sHw8fYZJqeYlViSw5t9RoyLFjbMCpz9KFnMlrIzwZzDCk1Iu0JJqO2D4jjMqWTAJLZs4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnpQqhiTijQD2viIb0eklZ9CPeDOsOv5Wm0kLohqvzY=;
 b=t436umOLDc3CayKiIpSIHHKJTl5QOIa53aOQnVcTNp6pi8vrPQk8ZzHPMbsCrrFB1LnGdsVarIZ53J1al4Yo1nGOESSuhEfyyN6k8nuISoMzhEEwx77EpMX1/flGS91bwtTQU7i1h/iwwzlqoCqHDB7ACLEMtqwbJ6EUp79hi04YtGZTN4VAle/M+uZ/loO1tgUkPTvaDOhl/dyrmYLmvbibg69lAPjxTt6Y/v+Rg7sbNvkkEGS60iSKFoXFOsE1w2iYcb7RBjXIMXmSkGjSzaFswT+vxvA+RslRBmLUQarBmI9mHVfUBy4ru9lYS/0wjd4wHu+G9Tqg0rjl2dMgSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GVXP189MB3385.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ad::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Fri, 14 Aug
 2026 05:18:44 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Fri, 14 Aug 2026
 05:18:44 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 5/7] serf: fix build with OpenSSL 4.0
Date: Fri, 14 Aug 2026 07:18:27 +0200
Message-ID: <20260814051829.35088-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GVXP189MB3385:EE_
X-MS-Office365-Filtering-Correlation-Id: bac6618a-1930-4caa-655d-08def9c382c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|10070799003|366016|22082099003|18002099003|11063799006|56012099006|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	94zmMRNY0vm0iNQ5E5BkWN+GyNoBeSeF/TILTSsBBcEsyHHhiZClN6GBe+3jCAPnlDI1XDShw8afOQu2s1bnoCG9allBT9DdKgWMf8FBa1yQJqBHQ4PPmV6eMZhi6tuOgG/f2rBVpB/VD73ju8FS6dreOvjADNwrrzfDCAya7IuUGKX+z3Om1DocGYjkGPQd6Djm9m26LgIAPFLpJ5Q36Uah67wMGc+xxbZmr+ioBpLlcIzTznlyR+IeUdaHiwciBnaIKZyrKuEwtR0smEhellT0UXus26EVNZJfkmn9jTKx6WlLrzlzMArICt/9oykaULWBHeesR8CSi7Fmn7SgOUcT3WkedUMIIRPO8buxRA9DxNEIlVrwTol4XNOTrQlvY9d9gfUOfCzhK8IMMcqxym6j0w/6gs+oRaMBpZdIwcXGWcdHvbsle5Yf38hJ8IE1wA0l6kJObcyYZofpu9ib8engLF3k1IZb60AnLJZXjkmGjQuP9zfdZaCEbCL6EeRTUlAs0bI6EQ+5DM8gtasOUbdbPoGuG+a0uJyF7i0hAtxhAg56TAvxQMEg4ilRoLnc96TdpTWVvkXQBMX6II2mZARh+3Y4b948CVhd4YSECOvKCQkVSBLLfje/BdlPXCLtvyZKfgP2zWukh1iQ7XyIDTFiGrGpxFaDJiPBEQOE6Fc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1Qvff0yug0kOJ++VkwAWbjbFSJzC0gDDYP4pzmz4bUEZOMc5azUCFo4LY3xE?=
 =?us-ascii?Q?0py3OeMPQ+PnmX3159YxuMlEIPIqLTzed0jJgrkkHLHTh3jcot+k3zleN3iC?=
 =?us-ascii?Q?VcxV95nYdJ31MBvV8xVAAkmL5UCvF9n3DYKAGHvfh4uQOdy3HCaGh+e1pxfi?=
 =?us-ascii?Q?ziCwTMecwOiAWeMRvELWm8FpSpN3ErT8RbL7HSMAb/FrrK0ktvm3Lwsc0XBs?=
 =?us-ascii?Q?OEWeo5WrNPbgQlnoawQ5uKf2eHxPx2C6Q8zmqQI29h7DNdLDwKITzD0Z8usI?=
 =?us-ascii?Q?33GPF5YYLtEBD/4ONrK4obavnYatdsuUSgu34Ml9SQ/nlKJv8Vl54Jond9XA?=
 =?us-ascii?Q?gaXwoBL98pMh1jdDgZ1E3s3xz0rZY26CEjry4Di+JnrFhaJ738hoGTM8gv6y?=
 =?us-ascii?Q?oCL26QpW0v8sEB0bfTXo9b7SdLzX5Hl4/P77BIiwrhOIYinbQJbd0BDLkdtI?=
 =?us-ascii?Q?w+6JLrYfURFEM3kO3Xxfjli7IsgkYOk0CLH082+Ijn8ZlJM4nXmafh1tgaCu?=
 =?us-ascii?Q?HAnRgn5IXyfzqHQKfvNnPvkbWXmyDsot/bEoeOE2pXcnAu2AvMBSUzspfxhi?=
 =?us-ascii?Q?y0VZ00D8Qy8Zlf1jm5UdnV/IDmVZHzpbihidvszj/Vm2C6dLoVJ4SwHTYcNe?=
 =?us-ascii?Q?spAMSQyw8KG5CbhPp8SU0mQvrsMLkfUvA0RLq6BLIFB38WpJWjeiAD7TI8bh?=
 =?us-ascii?Q?DlhPIPTMrgLZq5Y6g4fFnfM3Qtd+T0fZl4XZ/zIhdmmthkm29S+SSFttpu8N?=
 =?us-ascii?Q?HChwsdo5Un10kN0YgahXU+DQbSKBNRoJY1fcw36cadM3CGhu5aA9X0xJUaHo?=
 =?us-ascii?Q?KmM7LEwidqZZK3xYNCU2oQrkb99PjmkjpBugRhOlO0Xb/lHLyfnbg6zv536y?=
 =?us-ascii?Q?MLDxr5bci4UHAbcyKViT+VXhGP7+WhuuLifSlHof6zjS4qKAqZZon7QnHkLJ?=
 =?us-ascii?Q?jC6l8MCdZGiaE+anzWdtZ88qe/F/omFOzbQY+oVNfxqVPlF5BPbO9nn+uUSV?=
 =?us-ascii?Q?mQwAN7VQQnqrINmYqyxAv9BaE5OmMSM5Ugz5Nk0FwIY1lP5BuK8L1KmwP3ZG?=
 =?us-ascii?Q?0nSD+yD2miWgtT7ao1simSqNhlp87IFDQ5A6ZgztghYldaig15YwmXy20CB2?=
 =?us-ascii?Q?h95FvKB/KZOYscrHaJsheOIn2ydcbqjudWnhyJ+qMqYz5R721TmXsrl6hMyU?=
 =?us-ascii?Q?EGdO6g11HtFiAg5e1qrIMuRQVdLOfN44DzqlXG1stmVdjMsWKf4JYcT++o6m?=
 =?us-ascii?Q?HaxRnOt1mUvLYoYA2pbH9SRUm/v/ymv7gq9vG/kswOZ6DrL2V+MbfsUWUoWB?=
 =?us-ascii?Q?39eWVI3tBlVm83me0z9AXoodrnBKStSlS8w1A3XAmCP4gWliIEpjlopUNlv2?=
 =?us-ascii?Q?d6mjtBwtatXD/WnzFw6TGtigcnTjRSzOJM/r2j5WUMmI2pENt1lHP4JUr+I+?=
 =?us-ascii?Q?TpOotzgJYc0A+SJKSv+BCStLqCZgXKWzrzQulBbfZA1Qkv13aCEZORam6EMV?=
 =?us-ascii?Q?wMVW+9Sra00fB86dDI21tJagkLKnYpvwUD6DPUvC/UhRxWGcm8gcqAt5rokK?=
 =?us-ascii?Q?p6A7izTMdENQHsDLLOf3ReB9WX5bN0OuVdES3Y2BwOLISbJ3C2j9MHeuFveY?=
 =?us-ascii?Q?amRggjRBOvesrtb0XNsERkk1X5anF8SMzmrczJrAU3gXX7W25wKqJjFzBU4Z?=
 =?us-ascii?Q?eVhtEgHrIRzV4rPuJJZmcw0eqKkqBXewEv8I5unf9I5yaX00xM83+2gaK64K?=
 =?us-ascii?Q?28ThT+O86RHMYeILw2NQdftXESKvQ2E//f4+rxV4x6J3EAxNlMHUIBnm7ol4?=
X-MS-Exchange-AntiSpam-MessageData-1: nG1E5173SC0mhEvypjtz2rrJNgUkMIDhylA=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bac6618a-1930-4caa-655d-08def9c382c7
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 05:18:44.2216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDnrdu+03Lnyq2gQ36qa9zZsWJW5D0EO7y8tqioecZothnl4XEY3CT8ZVPZYj2NHipeVVOO2Npwp0tw9Dq6gTQ2Iq/6uUzXO3EBKF0A6qeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3385
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 05:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243401

OpenSSL 4.0 made ASN1_STRING opaque. serf directly accesses
nm->d.ia5->data and nm->d.ia5->length which is no longer allowed.

Use ASN1_STRING_get0_data() and ASN1_STRING_length() accessor
functions instead. These have been available since OpenSSL 1.1.0
so this is backward compatible.

The fix is already in serf trunk (r1935023) but no new release
has been made.

Upstream-Status: Backport [https://svn.apache.org/repos/asf/serf/trunk r193=
5023]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 35 +++++++++++++++++++
 meta/recipes-support/serf/serf_1.3.10.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/serf/serf/0001-Fix-build-with-Open=
SSL-4.0-use-ASN1_STRING-accessors.patch

diff --git a/meta/recipes-support/serf/serf/0001-Fix-build-with-OpenSSL-4.0=
-use-ASN1_STRING-accessors.patch b/meta/recipes-support/serf/serf/0001-Fix-=
build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..2392cf1dca
--- /dev/null
+++ b/meta/recipes-support/serf/serf/0001-Fix-build-with-OpenSSL-4.0-use-AS=
N1_STRING-accessors.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 11:52:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream-Status: Backport [https://svn.apache.org/repos/asf/serf/trunk r19=
35023]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ buckets/ssl_buckets.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- a/buckets/ssl_buckets.c
++++ b/buckets/ssl_buckets.c
+@@ -567,11 +567,11 @@
+             switch (nm->type) {
+                 case GEN_DNS:
+                     if (copy_action =3D=3D ErrorOnNul &&
+-                        strlen(nm->d.ia5->data) !=3D nm->d.ia5->length)
++                        strlen((const char *)ASN1_STRING_get0_data(nm->d.=
ia5)) !=3D (size_t)ASN1_STRING_length(nm->d.ia5))
+                         return SERF_ERROR_SSL_CERT_FAILED;
+                     if (san_arr && *san_arr)
+-                        p =3D pstrdup_escape_nul_bytes((const char *)nm->=
d.ia5->data,
+-                                                     nm->d.ia5->length,
++                        p =3D pstrdup_escape_nul_bytes((const char *)ASN1=
_STRING_get0_data(nm->d.ia5),
++                                                     ASN1_STRING_length(n=
m->d.ia5),
+                                                      pool);
+                     break;
+                 default:
diff --git a/meta/recipes-support/serf/serf_1.3.10.bb b/meta/recipes-suppor=
t/serf/serf_1.3.10.bb
index c6b51452aa..fd3560876b 100644
--- a/meta/recipes-support/serf/serf_1.3.10.bb
+++ b/meta/recipes-support/serf/serf_1.3.10.bb
@@ -10,6 +10,7 @@ SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2=
 \
            file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patc=
h \
            file://0003-gen_def.patch \
            file://SConstruct.stop.creating.directories.without.sandbox-ins=
tall.prefix.patch \
+           file://0001-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessor=
s.patch \
            "
=20
 SRC_URI[sha256sum] =3D "be81ef08baa2516ecda76a77adf7def7bc3227eeb578b9a33b=
45f7b41dc064e6"

