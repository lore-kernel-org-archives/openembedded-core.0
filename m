Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9095C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 19:05:51 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30996.1784660261964317541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 11:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=REFRNkex;
 spf=pass (domain: est.tech, ip: 40.107.159.71, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAo3Q2LFr/oKCv8aLa0lV+QaFAKs/lLRJrACcfZtifdOhpGDtCOiAU7/bqdPVkOcKu3arNVOwCgPusVzPtohFfNQSz/dhq1uRPr90epwSmAelDRVEXXwDBANvpI0hDadDNebexkfRw7jIaX6MjV82/NSuvAP1GvHV3B1vdJoRwMiON2k4YAQcTwAzqxSDtYbCO8UJnO+MDndW4mW/hBdR4uiCeqj4IwNKTt69YAPpkhiqGt07QspQbps/POQGN48d3IYnfOxPaq/55zprTru5/NnZpt/+efDkrwjyk0rFxB+f2/7AO/uQFwLzADS4wDvVLGiUcwX4X5keO7irdHH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNX0r6GG8TSq+TFPD2yTSWyvY1RyVAufEMf0++TrGpk=;
 b=mpo6jE97Hx1095b0Yi6Qg0yJcBQA2UP6Drfh16QjhKVTrU/GO/xuU7tny0K7UtPfmDlUy2ptVkqpcFPoPM03wsfQKZOrAwycUc46KZvI+TwbBA6rZz5+RkjEumyFdi4nYxLJUl7rL9zNdynlmrV43YH4AenNBm+V70lJCF9huYyiCj3Cl+jWwfXk1MjIKNgxh4teBd9tmauCcFnfXur9p7vwsQFjR+dQ4Mq9jm1Eib6NseP2K6h33pVlqOimXvvk9PUamd85NkVCUxV/3hOQgVCnMwUCN/5oeFHhBdBdZsq8ekwwipbh2T7XXS089GxGglbDr8ODEsmzLRbuZ8ktJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNX0r6GG8TSq+TFPD2yTSWyvY1RyVAufEMf0++TrGpk=;
 b=REFRNkexZTB0d4IeCJNlUflBPFc09JX8NbBdZlMXdpevcV3y49RmZC24ZpZjjuAMfVrvswJnJ7yNOE/0NsxmMogFkVesXckNBysHbOX7b9v6HhoWEeBb45nNUNNEkcb2aBr4rwzaWBgR/Wy1VHINHIjDJ+nVzr2LdbjhDrHimaySjMCKooSZs/CXdNycTSHFmYND/6Mokqgc+fxeZDP4l7ZazD2bYGrrHks6p6/Pa8QWwAu6nmbSAwWkeoU8bvGHa6zcmOEr86rFE49jwKdQg+XyDI0mvoOILZuTXyLIoHNYypNiSJhV8cShhnJNk0QIYrmNl4vwJk0Rla/1W2xizg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by FRWP189MB3380.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 18:57:38 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 18:57:38 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][wrynose][PATCH] gnutls: fix CVE-2026-3833
Date: Tue, 21 Jul 2026 20:57:31 +0200
Message-ID: <20260721185734.1156784-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2P250CA0020.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::25) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|FRWP189MB3380:EE_
X-MS-Office365-Filtering-Correlation-Id: 091151c0-6830-4ac3-4934-08dee759eee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10070799003|13003099007|12006099003|56012099006|11063799006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ZewcxzPHIkd95jUweqQUS92uw+2SwE8PzULlVfD13+3fukxMqbcmxsQ7ewjUQ0jiceUPOGD2zZuh9YlElrZunbd8ANqQcmZn7xG1mpEZInWfUHTNgN7yctlzIXHVvLXH/9JSDZFKBroAoKSCsQ5hYnkLdF3OtnfllgozbyxTc9Wnz5bf0Mk+EnpbnrmNJrcZtT8d2tp+nvC4vR8zMbWR97o5WfYZPCbSGXuRoVJv/vWyb+taa9e7uJZLh2ETQS/I00vLUYmnM1xdnTLlyHUbhFg/phVhdtUQv+L10DX3wmm9pZuVcGUZoc+dTEQjthHpSJACC6JxovXpJpZ7389CuHcAVdgA3jk2vDYk38XNjrwvjqiya0AobPc7acAWa3RBM5tvtx6S66YMylT2H4VenYVE0bDlFs3OcClOqP2xj0NQ2TtcEqpdxyfRsv2wTn9ojCI7Fd7U7JYwKerClmE4F+z+YLLsF17J2YI2ZttuvYq7Ir/w7TBOO69JaiyqPa6nFVex1Yq30Y0iCMdYlFiqUn0AKUq1HxDwFq75Y11rAaix0JAdfW7zXj8B+Sefb61Eq+jll+J6X0NZsmi8sArfTHMeKnxB8hL3In17W8Mgf3HHApgKYEhY3BISSOd2ttkBFF48VWcj2Zkb/sa16u1hnuH1JyhslcFMGERGajMyJw8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10070799003)(13003099007)(12006099003)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Lgrov5Gux/XN3GsRm+uf9XVC7agEhojLy4injC0hAgs5/jhtQTM58j3Cyp3w?=
 =?us-ascii?Q?w75WTZYuQtHEeYLbkVOil61TZ8UzHxwC7X8I6Fr/2WdpwcPmQuWUnM3h3aKx?=
 =?us-ascii?Q?dFB5XZA+H5ZHlJK2yhcrX/gKvAIx+DdYdJyCFR0PUZM40ZfnJFRvTiMbVLp+?=
 =?us-ascii?Q?1VAAQkIlB/2cBpF1MsFMBrPS/HtC8uxELBmGa1W+l/Od8CzAWlj4yZ0gcNlx?=
 =?us-ascii?Q?rrqaOo4jq/actE0Aq+DLzesSLVK7oAIWziKICedB4uYVviWO7a3GrOq8IU23?=
 =?us-ascii?Q?xO6eLu7hSfDTlc/TmwUBhWXH5UPKKwcpf1pMx6+Zm9xnos/Z4omWA4k7Alef?=
 =?us-ascii?Q?oOTnjsGESRAWaxnlDcepVXSXzWNFas/90zpjtZLKCbu6ffWgN/1IPoCTi6Lt?=
 =?us-ascii?Q?CSGYD/pnjPAN4a/XZOaijVPg9e3Hqyy5cmskFiHPnPSiAADtjUpoL1blwWX6?=
 =?us-ascii?Q?QNO6yAE2OBZL9iTbDE7SYgyNZAbk/6WPLqW7Jt0iuWP6geAhKs5ZwzayNXoi?=
 =?us-ascii?Q?edc1g6cb1edeP1ZG2JuiRvK9oypv1iYGn+VOWlwmUhe1ALl/FNsFKeAc+8hb?=
 =?us-ascii?Q?qNzz+u6QDcj7H6qVhsIb0UhgXXrbovZCvXf6Gue7NpiXP9j2paeeRhmumEhO?=
 =?us-ascii?Q?jNs/+wvYS5Olm8WE+00y9jfcf/0sJJUpJgY+fx2MRjeqTBlimBsrtENRvoiU?=
 =?us-ascii?Q?QeJ+wEjLOKXZKzQIwWJvknh7x/uWf60WHaCJlTqpiRHyum/XCluEZJzZA+/v?=
 =?us-ascii?Q?xaaYnhBh6gK9OzxOTZp34sdLgidQSUdHpwmZQ44efqGeHp9WDyyPy09B9+sT?=
 =?us-ascii?Q?iGwfhxC8khNVFP3jUPjQgc+r+D2cGztDJjSVL5ZG+jp6ClagkmHbHJLgYNSk?=
 =?us-ascii?Q?yck60HNP4j+Wn2q9825Ms4YFPI+4b5yIDpSG7Mrbd9djeL22E/7l56AWhZ3b?=
 =?us-ascii?Q?tN9xDvLhwst+gcHaM41QuV0BrpGf1X7pqf7Q+HMeydpkXcFbbKSAdiRFBWRe?=
 =?us-ascii?Q?BWRaKjy9LSQdDtMA2+F1yLSbENLvQ8HGFGiKR2MPTv7FmFdR1gQo9SS9vxUp?=
 =?us-ascii?Q?8EhoBGkW/ARe1/dr2zWwJxTrqyU0GZ6VYtyynJ0w/jGLGfgPwOp/ah0kI1yg?=
 =?us-ascii?Q?JnQ3kCwNZcDTreYlbhpn4tQoCKSUVQCDYEXdUVFJlf6DXXinf/DytiLgLEAQ?=
 =?us-ascii?Q?IOFlv64rUUwSY1Vzo93tmxkgYZG1u0z40dpFFHdGVWKp/nsK4rUolvQkeaG7?=
 =?us-ascii?Q?oFhIzpMvPEclBYlqmASqzuum8MzKo+eyhRenkVFiiClX03UMhKRwJ6nLXBSf?=
 =?us-ascii?Q?4Vv276HghPx5bl7SGjY9i7+38qFesPJ/xiDBdRO048eOIs3eZxXqCUKbepoE?=
 =?us-ascii?Q?SE4qh1t9FDuPSW8LjUl1bJDvr9mp90KeOnXaDP3R5Lnuc/ecnEtkxb9hgSaY?=
 =?us-ascii?Q?eEbKqxop1pYSwqTwho9iL7VE88PpbaWVCVGSsqPELs9wpo3cipsOXAVGf246?=
 =?us-ascii?Q?iF0/odiuATxK/TUh5oyMXt+Zuk8PdAdPWetfZjBp/PLsEGMVVFGhfk61GGNF?=
 =?us-ascii?Q?tMbUK3k07Nmr18QQMtPsSEKqYL/hahtJ3JDVVyXdebv1vkHVkJf0uNh9NhFj?=
 =?us-ascii?Q?kwu4UL9tQ95WKMwtYmLOu64ojABPfpEiWJatEDSVDRvtVdGnIk9/GtL/J36p?=
 =?us-ascii?Q?u0YTZrOEGVCGWMMhSnvdaRo6oyBUSkhLKZHY3NCbk9TxPcmu6q3Y2xZoRbKG?=
 =?us-ascii?Q?t4K8IwfdmhshLRUe0f/a9wJxN2u8FTwYNWV9v7BRkp1xzSTKal4+3YNnyNZ7?=
X-MS-Exchange-AntiSpam-MessageData-1: Kpm3cYm/2Oww24EY48bzqsRZREeKwV6zPzY=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 091151c0-6830-4ac3-4934-08dee759eee7
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 18:57:38.0510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5uZ+I+0H9b/dx7ziCSi/AL+OCC8AN1JijVyZpvJMi0ymk7R4QJEWfzlrYr/3hGDza6/5zkdemjrZNDwVaAhn2aOZ95JcEB/DlVkEE6PIYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3380
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 19:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241574

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-3833.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-3833

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/19f6508647bdcd3ce21130201e484d7=
ca6d962c5

Tested with ptest:
Before: PASSED: 371, FAILED: 0, SKIPPED: 15
After: PASSED: 371, FAILED: 0, SKIPPED: 15

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../gnutls/gnutls/CVE-2026-3833.patch         | 90 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch b/meta/=
recipes-support/gnutls/gnutls/CVE-2026-3833.patch
new file mode 100644
index 0000000000..25ba126054
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
@@ -0,0 +1,90 @@
+From 0af3e60734ade8e89e6bec6c2687164e273fcbf2 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 16 Mar 2026 15:29:40 +0100
+Subject: [PATCH] x509/name-constraints: compare domain names case-insensit=
ive
+
+RFC 5280 7.2:
+> When comparing DNS names for equality, conforming implementations
+> MUST perform a case-insensitive exact match on the entire DNS name.
+> When evaluating name constraints, conforming implementations MUST
+> perform a case-insensitive exact match on a label-by-label basis.
+
+Domain name comparison during name constraints processing
+was case-sensitive. For excluded name constraints, this could lead to
+incorrectly accepting domain names that should've been rejected.
+The code for comparing domain names and domain name parts of emails
+has been modified to perform case-insensitive comparison instead.
+
+Reported-by: Oleh Konko <security@1seal.org>
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1223
+Fixes: #1803
+Fixes: #1852
+Fixes: CVE-2026-3833
+Fixes: GNUTLS-SA-2026-04-29-5
+CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:N
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-3833
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/19f65=
08647bdcd3ce21130201e484d7ca6d962c5]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/x509/name_constraints.c | 23 ++++++++++++++++++++---
+ 1 file changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index 04722bdf4..dee045d25 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -35,6 +35,7 @@
+ #include "x509_int.h"
+ #include "x509_ext_int.h"
+ #include <libtasn1.h>
++#include "c-strcase.h"
+=20
+ #include "ip.h"
+ #include "ip-in-cidr.h"
+@@ -80,7 +81,7 @@ enum name_constraint_relation {
+ 	NC_SORTS_AFTER =3D 2 /* unrelated constraints */
+ };
+=20
+-/* A helper to compare just a pair of strings with this rich comparison *=
/
++/* Helpers to compare just a pair of strings with this rich comparison */
+ static enum name_constraint_relation
+ compare_strings(const void *n1, size_t n1_len, const void *n2, size_t n2_=
len)
+ {
+@@ -96,6 +97,22 @@ compare_strings(const void *n1, size_t n1_len, const vo=
id *n2, size_t n2_len)
+ 	return NC_EQUAL;
+ }
+=20
++static enum name_constraint_relation
++compare_strings_case_insensitive(const void *n1, size_t n1_len, const voi=
d *n2,
++				 size_t n2_len)
++{
++	int r =3D c_strncasecmp(n1, n2, MIN(n1_len, n2_len));
++	if (r < 0)
++		return NC_SORTS_BEFORE;
++	if (r > 0)
++		return NC_SORTS_AFTER;
++	if (n1_len < n2_len)
++		return NC_SORTS_BEFORE;
++	if (n1_len > n2_len)
++		return NC_SORTS_AFTER;
++	return NC_EQUAL;
++}
++
+ /* Rich-compare DNS names. Example order/relationships:
+  * z.x.a INCLUDED_BY x.a BEFORE y.a INCLUDED_BY a BEFORE x.b BEFORE y.b *=
/
+ static enum name_constraint_relation compare_dns_names(const gnutls_datum=
_t *n1,
+@@ -121,8 +138,8 @@ static enum name_constraint_relation compare_dns_names=
(const gnutls_datum_t *n1,
+ 		while (j && n2->data[j - 1] !=3D '.')
+ 			j--;
+=20
+-		rel =3D compare_strings(&n1->data[i], i_end - i, &n2->data[j],
+-				      j_end - j);
++		rel =3D compare_strings_case_insensitive(&n1->data[i], i_end - i,
++						       &n2->data[j], j_end - j);
+ 		if (rel =3D=3D NC_SORTS_BEFORE) /* x.a BEFORE y.a */
+ 			return NC_SORTS_BEFORE;
+ 		if (rel =3D=3D NC_SORTS_AFTER) /* y.a AFTER x.a */
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-su=
pport/gnutls/gnutls_3.8.12.bb
index 8554ab943d..468b4bdd40 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar
            file://run-ptest \
            file://Add-ptest-support.patch \
            file://c99.patch \
+           file://CVE-2026-3833.patch \
            "
=20
 SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf=
470bea012b8e51"
--=20
2.34.1


