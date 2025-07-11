Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904F4C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 09:15:46 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.45])
 by mx.groups.io with SMTP id smtpd.web10.9745.1752225343819391981
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 02:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=p/9AfKmM;
 spf=pass (domain: est.tech, ip: 52.101.84.45, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JU4Kas4FH9oyBSQYK1llCruTCKk56kGRiHhJCeHPrT7kICuFSixYPraOLDQuTJrJsbeir54qHng4dbcQZrAEGaZZ0WaUyPuz8zekOiocuYgrG//46woN8HS3K7+M1b76gyUajORgvYSfKUVWnhwTJsRoXzHPJ6hNkjZQFpWMtB45HNnkELkkEm1k6yOt8E1BDqKJ+7UuWKzUjX46K+IChSuxA+PedV9Ky5QqnPQyLQqBZ5a+uvcxq5kCjcbYYmLPC6648eutvcr+2hWoqrCeHbP14Pb9dx15MpLvOiQ7g/CMqyOiSc54j5dLCJWQP7eUEbN/PB+8WbdLBtoYT/UlLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvIxmfNGXLUKx7tK8N2pwqEBzC0c+0oSA2u7RIjCwcw=;
 b=VeX9d1QMbLcHt7Hxa/YUniQnitcLMkncyHB0ElgEmAwANBFTTRaJLSt4Fm4A58uC1yZMcNO2RP1F/mwR7JElfjWqtN/gDC6oVhi5j8zPN77ZXx3KbAdqvfZPBs5nTQc5nPnbeBIeOVmMcwkaZqlWUfsM5Gjrv95zgsWaHNam4j9sjBtJTf57lhIxQAd0/+uaXtUA1C1GcM9yBLEbLCWXZmtvGZ+MQpagL5VqLbBT6qHYPYM4KFcH64adgYkcgUyERoIc/HBX8lygLonp9NoIliy2cp+HmwNHBXdOZGlmxxtX5bHrVXG0BQRG86RNcN+QmFTAwXfnanY5arnnW/E4wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvIxmfNGXLUKx7tK8N2pwqEBzC0c+0oSA2u7RIjCwcw=;
 b=p/9AfKmMmcoPGT2j4eaxvMhR05PlbIx/zRdMWPzSkHSMO6bP9a42Knn9kZLJA8f/BDbgeKloXaos+5EdF76wOmB5iJ4RVSS4gmQyk/7ZV90bfTcKAkyw2+mAk3eoj5ft9FF/urCq8wZCAyyx+vfya/1OoQtI4GdlowvVtnXud1ygFRRuq77+shmCeSfNYJj7uhx32t6i2iTyAFS/lPzXw+lQ8KAdH6V2r3Nc3oQD9Z+2Z7DwrKBZeJ6RWEIKYt6fYI5dGZkpBuN+yZhLTNd41s9r6rfBhs3+Aq0HXqXS61Gsf2dHgKHrO513o4zV62jTJk35dNGKI0GLOv3Hp7X0kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PAWP189MB2804.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:46a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 09:15:40 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07%3]) with mapi id 15.20.8901.028; Fri, 11 Jul 2025
 09:15:40 +0000
From: roland.kovacs@est.tech
To: openembedded-core@lists.openembedded.org
CC: Roland Kovacs <roland.kovacs@est.tech>
Subject: [scarthgap][PATCH] libxml2: fix CVE-2025-49795
Date: Fri, 11 Jul 2025 11:15:28 +0200
Message-ID: <20250711091527.15224-2-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0057.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::6) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|PAWP189MB2804:EE_
X-MS-Office365-Filtering-Correlation-Id: ac8a4dfc-d072-4a3d-8896-08ddc05b8149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cMg2CumxMzFo0M9Xve5uL+R9o2LRa0tmUn2kLPh1007DWH+yDrZuVrL7rj2Z?=
 =?us-ascii?Q?lINQiESejuUmG8HGZuB/kbNrvqZ2Xvr3xuiI57dbK3kAUxsKgZj/9xs0zuS8?=
 =?us-ascii?Q?ymp5jX1kwyzpL5BEtAYyYzamrRcVgP8s4JVeRlttW1bXUKZ9ZY0m8dtcdlIg?=
 =?us-ascii?Q?DhJk7BKTGqPZ5GIwKrqLlbl/cGy6o2FRB1aThnv0YsSv29j/BPpoMqkqFFRP?=
 =?us-ascii?Q?eVdQE5HeeMpPkueY3nCe5tJ9Qe0PIX2Z9n9fC03hkkbwKRECrzqlcj8xyEns?=
 =?us-ascii?Q?L8r2OUzL8r008qmTkbvgHmclhxpr0vQwKdNqmmmNfEQ1IdoNBkF2ijmR+Nsh?=
 =?us-ascii?Q?xmvm14/OeNHGV6gsGgo2q4G5/viCm5lo6ScpcV9LfYDf4uDW8re2lCZr9EXF?=
 =?us-ascii?Q?ISKuz8NgE4IUGylKvvfRQ28+9UsOHpa/0QEX/b2moHKpkNDolQZYoOKReTHw?=
 =?us-ascii?Q?+zZpGdweqt5mbgS0GDJuIXozHcLGm8aEf/mb3QVM5CejD72XPMc1X6+Osj+n?=
 =?us-ascii?Q?yLv6z+WK+0FiaiBLIwhGPd+SafzcrBk4JRbjLKEjG/QU//ZQDvyzV6LKpGsy?=
 =?us-ascii?Q?HvPFXk3wQetrhxfIyb8Hwiy8jWr9Q0Ne61pOJC12Kx0x2mUaHyHa2SMCJfeA?=
 =?us-ascii?Q?HM4QDDqXedd2hu6cY0sbohVx22kNnNdxKRsQOK2CvVx0vFXbPZdiSy5TGFSM?=
 =?us-ascii?Q?2KIObLNdtf6kgayF5dp2HYzZpfEcNqnKiDW/QlvHuEPjSQzcZs+2uA9x/20h?=
 =?us-ascii?Q?7h7FWYldOcqXXT7omCbo6nbBpo7tt7TRzLZiAU0P8nOAY+oIoDRMGMmpbIdT?=
 =?us-ascii?Q?d4G3OwpzywQyJvVSkxkS+WAUewFIHWkDf2fr3JRJv+H2cdisqlaVDktuMrx3?=
 =?us-ascii?Q?hjPzYui47O2t5NjmRTuaUBYKj6sFhdCFIIMq9pOB0BFR83RTzzLgUeElC4Hr?=
 =?us-ascii?Q?6tX5mDMYc0/306rBhli6nwL0JfBBZuIsftUloyBsiAtVael5cr6LEiUo7BGX?=
 =?us-ascii?Q?EYl7sx9dnqElr5u4Myf8gSnOrWOWsx6xc6Mascc9wR9nFs7uSfp52mbUumPX?=
 =?us-ascii?Q?rQ6v3Ty8z3q9H65fRVsmTWoUpOR2zJN0cLIXotsIzd2mYbDU2Mf/+3iP52wH?=
 =?us-ascii?Q?zhmxIgbTlMmvlHOjRTIeFZYgXbIRJ8q9pSbmdN+0LHZTx2AWBNywMmjTJge2?=
 =?us-ascii?Q?GmlEUvc53M8QzYxMExf4vfc5sy1eSf+3orXzacbf+MDoHAExpW/nejlOQsL2?=
 =?us-ascii?Q?DEryRI6nww+QlwIXHuLfF2itnZCfDuPoWeD7QiWSNiajATOjmfoElFeoce1D?=
 =?us-ascii?Q?hXZWy8Br+BJjibyd1I6lz0sif0/V6XBGTvoPjhRY5yKiqLgqlWJDM+/QS36q?=
 =?us-ascii?Q?qs1PJZPsvoUThq/5YtVjliYViYg3Uej4i992NY5laGHEYqht//FEhnN4kCAp?=
 =?us-ascii?Q?24FVB1vyeEE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u8qRs8zHUegVi8lW9EHsZk2UEOqHBvEuv3Sst7aZehQHkDElhdUh2qAvAYmi?=
 =?us-ascii?Q?EQsLTcfIXIIUrejIbRDmjJqeNni9WxUCaUAZdrHp+2AMPf7SWoAMaXv7lwU5?=
 =?us-ascii?Q?KyyOdyZ4mvRgKyS8pRJb/SfhwGGCTpGtXJx8ccAUNguPeUkOQiDrKUzIFhMb?=
 =?us-ascii?Q?SVXeTleV22noNl+BxNqX96QYua7bJXIf3i/EarWJna/ozOU1bHup0fBGQGqo?=
 =?us-ascii?Q?24OUSEbi2rYMXUoZAdFyIcBqRlBPVlZECVd5tF9up8Yq6AAUK0X+5MDa5Ovz?=
 =?us-ascii?Q?5ulnO8BVBCwepizNPsQ0QuziwF+/3c/Xe/gr4JdA8N/u69N/xYW6Wh8USVt9?=
 =?us-ascii?Q?ye2weG2uD6epwcOyLPzHBGc9bafLqVkvsQ0kZe9FNn1PVoDsKSiOacPnaJVW?=
 =?us-ascii?Q?yQ+YR64GDv28eRzOjLpfvceIE2+Uc65QwuiSSsKZ8VRa6CGZQUK+QksauMXf?=
 =?us-ascii?Q?1R3TNJqWDbqjL3zqrk+LKZ02XssKx8RiEf6PXHR7j4cUirXIP53mYIDt6RKQ?=
 =?us-ascii?Q?MGkn6U+TUMVv8cOcnLNAGjTFSVGWtEAQhYxYhmhRPDceh70998gaKy5XSie9?=
 =?us-ascii?Q?XOeKtaQuMYajRRcAtzOT081XjlS1v0/Q4QI5OU41KzK2HRdPjuLKYA2i0B6Q?=
 =?us-ascii?Q?Pa9I4tNVQpMWfdIXZuXNAC0HfDocO3J6VEbQHeNCqGh2x8fsN2YE5XvAoN6w?=
 =?us-ascii?Q?gXOkSbciYNRfDmFORmIC6HIZ87xu0wHrCabfR0jxATPXN1PIg6QseG/XIAxt?=
 =?us-ascii?Q?EF8RCdD7Wd1FXxrgDtz0QG547lXB3/cti4GwsFTlZRIzkGckjzoZY2eZeIUI?=
 =?us-ascii?Q?XFJD/u1egNlyc2dgeVxlYB61n8fQ+rVHQqQWwp6F5gIxo3aMLDQPr4+rpKKj?=
 =?us-ascii?Q?6+xsTqwIVOLH30Pr9fwFVHydrUGMvZLCm1EXAeasSKaHgnKmBm0GwLhr1RVX?=
 =?us-ascii?Q?fgRa2TCBhkz0paaceWWQ3EqYLNjfnSufJ22KEoFOiy6PK5N4Kky63cjvVfp9?=
 =?us-ascii?Q?f3IRt3ZDYN0wvMJYNiT8WIOhDVub45WHPIcPmB7i+XnND8P7GXf4XOPrxG9b?=
 =?us-ascii?Q?Jv8WFjSdaNVLx8QQ/t2e/yheOC3hT2LvLm4vxbwxEeWWUksIIUIAXzT5flA1?=
 =?us-ascii?Q?yUOxKFOdZvZzsCLKVQvpiH148X5rLFP4YeWL0jkYrJO/5KxetmlUVcNVlYa4?=
 =?us-ascii?Q?RS1NdSlNZbba7+yL9+4aXdyTPi7V7NU8lRtUrtEgR9SWg1FlPYIVhrLRMdh/?=
 =?us-ascii?Q?Bvxtm8Dufhg5fEwANRNhnTLyRdv7QYUITEB3+OwTIVL11u0RHqXbinlkkN7Q?=
 =?us-ascii?Q?BYsqybt9bCmdN13S/S0XG/7wo2tYc+Vj1nRDK5vUeYU66jJNV7OFKL5YWHso?=
 =?us-ascii?Q?kLX1VeqLdRYMUyC5BomudfNjt3ea607PAEh2Emyn2+LzaPXfORqpBJXGIS9G?=
 =?us-ascii?Q?1jiraO6AwVQ5Ktu9vn2HGDPxGn6QwUIja0tVTQPINolr8K9OWB//0qDsxEzU?=
 =?us-ascii?Q?88LMBTruei2sxs0oXRN/zlOGstqDEZQ+cFtIzqIVtgaSQWcmSrWhLzsz/Sks?=
 =?us-ascii?Q?QpcQ2eITEO2t7e8RCBCmZxAwNlz/8VAzZEGv3PvI?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8a4dfc-d072-4a3d-8896-08ddc05b8149
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 09:15:40.1750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vecYnwZmtkaHQRHcA/CSzT75iBkUKcve55WZmHssZo9yOcO0TqDjVkQHI/W3KSFPkadjN/Tg/hOm6yLBHt6nqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2804
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 09:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220138

From: Roland Kovacs <roland.kovacs@est.tech>

A NULL pointer dereference vulnerability was found in libxml2 when processi=
ng
XPath XML expressions. This flaw allows an attacker to craft a malicious XM=
L
input to libxml2, leading to a denial of service.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../libxml/libxml2/CVE-2025-49795.patch       | 238 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   1 +
 2 files changed, 239 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch b/meta/r=
ecipes-core/libxml/libxml2/CVE-2025-49795.patch
new file mode 100644
index 0000000000..fd784ea45b
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch
@@ -0,0 +1,238 @@
+From 68ce19940f8e08c85f9c8ce65180cdb90bf4b0d2 Mon Sep 17 00:00:00 2001
+From: Michael Mann <mmann78@netscape.net>
+Date: Sat, 21 Jun 2025 12:11:30 -0400
+Subject: [PATCH] Schematron: Fix null pointer dereference leading to DoS
+
+(CVE-2025-49795)
+
+Fixes #932
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit=
/c24909ba2601848825b49a60f988222da3019667]
+CVE: CVE-2025-49795
+
+(cherry picked from commit c24909ba2601848825b49a60f988222da3019667)
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ result/schematron/zvon16_0.err |   3 +
+ runtest.c                      | 139 +++++++++++++++++++++++++++++++++
+ schematron.c                   |   5 ++
+ test/schematron/zvon16.sct     |   7 ++
+ test/schematron/zvon16_0.xml   |   5 ++
+ 5 files changed, 159 insertions(+)
+ create mode 100644 result/schematron/zvon16_0.err
+ create mode 100644 test/schematron/zvon16.sct
+ create mode 100644 test/schematron/zvon16_0.xml
+
+diff --git a/result/schematron/zvon16_0.err b/result/schematron/zvon16_0.e=
rr
+new file mode 100644
+index 00000000..3d052409
+--- /dev/null
++++ b/result/schematron/zvon16_0.err
+@@ -0,0 +1,3 @@
++XPath error : Unregistered function
++./test/schematron/zvon16_0.xml:2: element book: schematron error : /libra=
ry/book line 2: Book=20
++./test/schematron/zvon16_0.xml fails to validate
+diff --git a/runtest.c b/runtest.c
+index c78eec81..736cae5e 100644
+--- a/runtest.c
++++ b/runtest.c
+@@ -52,6 +52,10 @@
+ #include <libxml/xmlschemastypes.h>
+ #endif
+=20
++#ifdef LIBXML_SCHEMATRON_ENABLED
++#include <libxml/schematron.h>
++#endif
++
+ #ifdef LIBXML_PATTERN_ENABLED
+ #include <libxml/pattern.h>
+ #endif
+@@ -3881,6 +3885,136 @@ rngStreamTest(const char *filename,
+=20
+ #endif
+=20
++/************************************************************************
++ *									*
++ *			Schematron tests				*
++ *									*
++ ************************************************************************=
/
++
++#ifdef LIBXML_SCHEMATRON_ENABLED
++static int
++schematronOneTest(const char *sch, const char *filename, int options,
++                  xmlSchematronPtr schematron) {
++    xmlDocPtr doc;
++    xmlSchematronValidCtxtPtr ctxt;
++    int ret;
++
++    doc =3D xmlReadFile(filename, NULL, options);
++    if (doc =3D=3D NULL) {
++        fprintf(stderr, "failed to parse instance %s for %s\n", filename,=
 sch);
++	return(-1);
++    }
++
++    ctxt =3D xmlSchematronNewValidCtxt(schematron, XML_SCHEMATRON_OUT_ERR=
OR);
++    xmlSchematronSetValidStructuredErrors(ctxt, testStructuredErrorHandle=
r,
++                                          NULL);
++    ret =3D xmlSchematronValidateDoc(ctxt, doc);
++    if (ret =3D=3D 0) {
++	testErrorHandler(NULL, "%s validates\n", filename);
++    } else if (ret > 0) {
++	testErrorHandler(NULL, "%s fails to validate\n", filename);
++    } else {
++	testErrorHandler(NULL, "%s validation generated an internal error\n",
++	       filename);
++    }
++
++    xmlSchematronFreeValidCtxt(ctxt);
++    xmlFreeDoc(doc);
++    return(0);
++}
++
++/**
++ * schematronTest:
++ * @filename: the schemas file
++ * @result: the file with expected result
++ * @err: the file with error messages
++ *
++ * Returns 0 in case of success, an error code otherwise
++ */
++static int
++schematronTest(const char *filename,
++               const char *resul ATTRIBUTE_UNUSED,
++               const char *errr ATTRIBUTE_UNUSED,
++               int options) {
++    const char *base =3D baseFilename(filename);
++    const char *base2;
++    const char *instance;
++    xmlSchematronParserCtxtPtr pctxt;
++    xmlSchematronPtr schematron;
++    int res =3D 0, len, ret =3D 0;
++    int parseErrorsSize;
++    char pattern[500];
++    char prefix[500];
++    char err[500];
++    glob_t globbuf;
++    size_t i;
++    char count =3D 0;
++
++    /* Redirect XPath errors */
++    xmlSetStructuredErrorFunc(NULL, testStructuredErrorHandler);
++
++    pctxt =3D xmlSchematronNewParserCtxt(filename);
++    schematron =3D xmlSchematronParse(pctxt);
++    xmlSchematronFreeParserCtxt(pctxt);
++    if (schematron =3D=3D NULL)
++        testErrorHandler(NULL, "Schematron schema %s failed to compile\n"=
,
++                         filename);
++    parseErrorsSize =3D testErrorsSize;
++
++    /*
++     * most of the mess is about the output filenames generated by the Ma=
kefile
++     */
++    len =3D strlen(base);
++    if ((len > 499) || (len < 5)) {
++        ret =3D -1;
++        goto done;
++    }
++    len -=3D 4; /* remove trailing .sct */
++    memcpy(prefix, base, len);
++    prefix[len] =3D 0;
++
++    if (snprintf(pattern, 499, "./test/schematron/%s_?.xml", prefix) >=3D=
 499)
++        pattern[499] =3D 0;
++
++    globbuf.gl_offs =3D 0;
++    glob(pattern, GLOB_DOOFFS, NULL, &globbuf);
++    for (i =3D 0;i < globbuf.gl_pathc;i++) {
++        testErrorsSize =3D parseErrorsSize;
++        testErrors[parseErrorsSize] =3D 0;
++        instance =3D globbuf.gl_pathv[i];
++	base2 =3D baseFilename(instance);
++	len =3D strlen(base2);
++	if ((len > 6) && (base2[len - 6] =3D=3D '_')) {
++	    count =3D base2[len - 5];
++	    res =3D snprintf(err, 499, "result/schematron/%s_%c.err",
++		     prefix, count);
++            if (res >=3D 499)
++	        err[499] =3D 0;
++	} else {
++	    fprintf(stderr, "don't know how to process %s\n", instance);
++	    continue;
++	}
++	if (schematron !=3D NULL) {
++	    nb_tests++;
++	    res =3D schematronOneTest(filename, instance, options, schematron);
++	    if (res !=3D 0)
++		ret =3D res;
++	}
++        if (compareFileMem(err, testErrors, testErrorsSize)) {
++            fprintf(stderr, "Error for %s on %s failed\n", instance,
++                    filename);
++            ret =3D 1;
++        }
++    }
++    globfree(&globbuf);
++
++done:
++    xmlSchematronFree(schematron);
++    xmlSetStructuredErrorFunc(NULL, NULL);
++    return(ret);
++}
++#endif /* LIBXML_SCHEMATRON_ENABLED */
++
+ #ifdef LIBXML_PATTERN_ENABLED
+ #ifdef LIBXML_READER_ENABLED
+ /************************************************************************
+@@ -5117,6 +5251,11 @@ testDesc testDescriptions[] =3D {
+       rngStreamTest, "./test/relaxng/*.rng", NULL, NULL, NULL,
+       XML_PARSE_DTDATTR | XML_PARSE_NOENT },
+ #endif
++#if defined(LIBXML_SCHEMATRON_ENABLED)
++    { "Schematron regression tests" ,
++      schematronTest, "./test/schematron/*.sct", NULL, NULL, NULL,
++      0 },
++#endif
+ #endif
+ #ifdef LIBXML_PATTERN_ENABLED
+ #ifdef LIBXML_READER_ENABLED
+diff --git a/schematron.c b/schematron.c
+index 411a515c..c970d31f 100644
+--- a/schematron.c
++++ b/schematron.c
+@@ -1484,6 +1484,11 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr=
 ctxt,
+             select =3D xmlGetNoNsProp(child, BAD_CAST "select");
+             comp =3D xmlXPathCtxtCompile(ctxt->xctxt, select);
+             eval =3D xmlXPathCompiledEval(comp, ctxt->xctxt);
++            if (eval =3D=3D NULL) {
++                xmlXPathFreeCompExpr(comp);
++                xmlFree(select);
++                return ret;
++            }
+=20
+             switch (eval->type) {
+             case XPATH_NODESET: {
+diff --git a/test/schematron/zvon16.sct b/test/schematron/zvon16.sct
+new file mode 100644
+index 00000000..f03848aa
+--- /dev/null
++++ b/test/schematron/zvon16.sct
+@@ -0,0 +1,7 @@
++<sch:schema xmlns:sch=3D"http://purl.oclc.org/dsdl/schematron">
++	<sch:pattern id=3D"TestPattern">
++		<sch:rule context=3D"book">
++			<sch:report test=3D"not(@available)">Book <sch:value-of select=3D"fala=
e()"/> test</sch:report>
++		</sch:rule>
++	</sch:pattern>
++</sch:schema>
+diff --git a/test/schematron/zvon16_0.xml b/test/schematron/zvon16_0.xml
+new file mode 100644
+index 00000000..551e2d65
+--- /dev/null
++++ b/test/schematron/zvon16_0.xml
+@@ -0,0 +1,5 @@
++<library>
++	<book title=3D"Test Book" id=3D"bk101">
++		<author>Test Author</author>
++	</book>
++</library>
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-cor=
e/libxml/libxml2_2.12.10.bb
index 2eea65732b..ea40ca68ed 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -20,6 +20,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.ta=
r;subdir=3D${BP};name=3Dtestt
            file://install-tests.patch \
            file://CVE-2025-32414.patch \
            file://CVE-2025-32415.patch \
+           file://CVE-2025-49795.patch \
            "
=20
 SRC_URI[archive.sha256sum] =3D "c3d8c0c34aa39098f66576fe51969db12a5100b956=
233dc56506f7a8679be995"

