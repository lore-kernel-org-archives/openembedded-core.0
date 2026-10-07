Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382AECA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 05:45:43 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1929.1791351934163915654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 22:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ou7EXtvt;
 spf=pass (domain: est.tech, ip: 52.101.66.21, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ix7/QgTZjHS5yIOHBO47LCaNMT8TWgYY3Xh1L29aEqH0SauqHVYQqovSNzT0nBoBb3XCCrpHyuRapOXP6gIm9mYYYAzViGtz7zDnSr3YTgM7VdmCAAd8wq3EbY9crLV2LjUSunzwDXf4VzoT1nYCzMGYxxrIYT6SAUxFctxP+3a/6GXoN6OtOw5fM+et5J8U90ICaG47fWVA58pOzQSj0OWVGvzUK7KHgh+kozeYKL4zdIS99L19CvcVT/lZv0bDUGF0P1mnMF8m6TejDOfoeotuH7R/gDqQmr5aMcTl0gNIeg3Fz15aaAFWJRWTBhQD7mRoCDatBVL7mFmHKZ7Jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/IxTZ/PCQYjRc2cybvBD2RzZpwce7/i4ufvPWtOhAs=;
 b=bsV1GK4lF67Gi+x46IeI6EYB+D05g3BV6GrryedJj1qiJ2YIvhGMs35HroTrJ7c4/HdAivqtcBhsUdguR9Zti+qKlyaQGVxFDd3WNEQdeQ+SreHVWPTrvq5+NJFrFj5FkuvUs+E3VHLN6LYde86tZJRHfqWJZlI9RS7QfdrBwQEYdYhWoPGPkXPdQX8XO78kyUbLu9RkR+OvE3RP0ir6v5+aq8MsJVID5nXttK+bAxx1SeYaISY1Skz8iSGU5ubi3lt9JYZFYTgi2OGNJCu7YtBF3PjTmWE04nvdb/e4UYrT/nDl6yFzQSlxZpwAMS6FAwdrpZ7y/KitbLxHIQn2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/IxTZ/PCQYjRc2cybvBD2RzZpwce7/i4ufvPWtOhAs=;
 b=ou7EXtvtHa0ywclBwx08Hvbe8XDKiDswAWwO8aCvPgeXCcxy8sAyUFJeJ+Btl9n/spwtkX1+81UoQJFs7god+mafPPSglpjOxRYF8r76TwhLgmIT0O58Je1TH8SN8HP4pIyfweB0H7YDAgRJwzG7VD+5qWN82qlcCikd/QJxbzoVMEsVL7MZNZFTO+O4ldorALO3PRmfTWUu97aXgLLtl7OWj44lLpW12yMyJy3sgrkLu+X0MfM1RVx1ZihQTaMEC5IHvEm9xSkrEig+RMERAGil7Hx2+b1cIk2247YiB2yTMlkf3FxpTWZVzlB/n9YVvUhePZE6KfdwMfCncchduA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB3674.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 05:45:28 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 05:45:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssh: Upgrade 10.5p1 -> 10.6p1
Date: Wed,  7 Oct 2026 07:45:26 +0200
Message-ID: <20261007054526.57966-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0044.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::25) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB3674:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b46cfb-5db4-4792-6422-08df24363166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|10067099003|18002099003|12006099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	dyDrgKy+ahSii3k+eZ+8dCU6GWgmPUUyFPeEzRoJzIlE4pboD0e1pJAqK83JADjmN/0KJMVqamMOXDCg1W3tQAH/swko4T+MnN0ZGBL0J8HgP9g4fKIlor63I3kEdrSQwUO7g6EDtd+F+s5PiH3pCDB8yc9PmRKE+NwcUT4P6odtrvdNktFNNVzTFW+T0T/HWdzCHQSaUeXhTeAj2LuSB0G0CUJl35RyURs/ZJOQU5nQLPwYJOG52H0Lqftw2rqg2qm0stvxjZ9UJ7It/c6rgPg+eBTDxA5ySzPmXvYkWCOT09NsxaEAbzqqVCQWgip7+kFVW2daEHrYLVBuV1yTJxj6Ps5gFHy1zSzEWFXP2i8eGkrTtdJaKv7GV3kP1FGTiM80p5ME9lx4ztg0HSyzp4o+eajI3rUUHajimMVrJEfEJREreMbz0wOxk8kFKd9i4J6W/34TzLX/CZizBe4uV41I7znXTjY2/wxLdp49k0Qw75no3tshUjRk8ekPLDa7LX9RlD+WR4B+u9jM+eyilGzz3MUDts1XiawgWcu/tdCMPWnWbBXTf945JFdvKen5tKFM1HIlkSKHkJfRDigvItaQJATbhQQZfmF1Sy2WdR14cGQ3Bu1cxYGrv/onLyGm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(12006099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?czoZEbYpKhN/6tocmKmVKaYxAEJ+jyn1+79YOARk7ZbTaw5uPhmwwBXCkblv?=
 =?us-ascii?Q?wSe7WlogmMVDoOVFPRBEojm7kZ0wHZn9X5jVyc6gISKVVcP66PqXcUUhb9Ir?=
 =?us-ascii?Q?8HitpEaEEuqDLhumrP91Pud3dtg7BHDbKqRNFJenL+5QCbL3LCavtLt0jcrd?=
 =?us-ascii?Q?D1hKZVhQn8YH6HTFbDJV/gI4Uub2mthvqScVUtyGbRcsxjFxrBdzgjU+wJUD?=
 =?us-ascii?Q?xLV6zDCiIdO6xyIeJirlgxOCRIUKjKKqawi3Q46Q4EkNWiGViT02B4UAjZbH?=
 =?us-ascii?Q?c2ndUtQuac0txbe8dZhnKIEqEzA8Cx7ysLzQCKia2HilwrSc1vMIl3/W3b3g?=
 =?us-ascii?Q?C/ZhfphsZkoZgEIrUI5CrGz88pRfF2QkrSZ5DEys5VCMiL7bstML7Gm/Fi+a?=
 =?us-ascii?Q?bwNuQFe+kWbT5UyRWdSP5rAagvNeH+nLNtBAeoht3E+PjKhFQfNgBil9fYzO?=
 =?us-ascii?Q?RDZMn/9l8lWV+KgrccQ0dX0TiXEfOKNdzAcsWoxMr6A5DCp9FfMt2tv0+yS2?=
 =?us-ascii?Q?6EzL8gVU1eOqHas5Dp2oIWHTh+A0vVEbBTY3P2+eZZWGKqz5+SWladlSj2wZ?=
 =?us-ascii?Q?YNA0xhOjNx2+HkYj5LX3K9P+MJuyb8MVLDz+D0Lr3qGjZ5Pg1R8zCmu8B8XV?=
 =?us-ascii?Q?ZXEQCzNR2Eq8TMiKjbWmsvEJdYC11fPIq8j672bpjvwdein3eSuCOWakdx0y?=
 =?us-ascii?Q?ylYBQbWvaBQbAYhXQiJF1B7nkyR3F1AiieJ92xXYrGfY8vAHwz6Me/HQPfIy?=
 =?us-ascii?Q?fo3lXQ6Br4SWqUqu25IB1lvJ33COg3oOoiSpAi0CnWcflEmfnEh4xP1/hrN2?=
 =?us-ascii?Q?gmT9Xqin1/mINVHm/E5XXjvyc5eHijwSEsUi7PpdL4NM9s+ezgLUS99OA16b?=
 =?us-ascii?Q?5mj+ogWi5EmXxZpcwY5NodBOrc8wtuxDBcfKTHgrdUmNnUhn1F/F9Y+du1iy?=
 =?us-ascii?Q?nWjHZedRlmHwD/i1Q+BqCSoxiZX6mq1iXi66sFXU0s9C5cFmWbehktAdWHAK?=
 =?us-ascii?Q?hPbcmVPl+0K2lGpj1Dvhd6E4LzaGkaVaZibQFkSF2AINcWzu21eWNnv29dr3?=
 =?us-ascii?Q?Al+Ap8GqnkCGydC/fna0CR5OsIqO9p6f0Um4hTDRtecu/Lsqii4vKABcjYiw?=
 =?us-ascii?Q?NQ1IdqHnMfpqb06ECpMPr+V6xt+q9AzRJYJs9mS8+s6yw2btP93O2FS4Cla7?=
 =?us-ascii?Q?SY8SQAoW6l2cgjV95v8ikO8v1pgq6vvcyPOg0MWi1uz90NP29yAe1tVkvCXv?=
 =?us-ascii?Q?TjCNecs01nKsNtrR2dpJaNES5s1VyQFPLjpmpSJnJcQxhoJDtnM0P3ABEPBV?=
 =?us-ascii?Q?PUaoyegpahWpBgpr3tkHwm//XsjX+3jWng2HHHY8VdYGf3Mt3htJ/pS+QvA7?=
 =?us-ascii?Q?6T3ougxK7z2bmLw8tkDiObuMp8OPq4BwOWtkpNPfI+PENA0OoQzWje8VYAFn?=
 =?us-ascii?Q?YztaDw9QbdptRGLmliWfzCiWvuCS/4L9fCC/Yfpf6wV/LTpwLZ7rd49ieIez?=
 =?us-ascii?Q?ANriy10QxqCw87KH/VUVU0QMXCekRUWJuFZM4GzagtimiK8eg8mmvRmCaH2/?=
 =?us-ascii?Q?E0nNvymNZg7U/Wv3auikfYnLneY6+6GeC9u2y597bCyC9Te6+DQSft82E8O5?=
 =?us-ascii?Q?yZ4BvA5nd77ZKIvYT4guWgnoL07oTcrIScXEXTmJgNRRHi8HNv8AjWfzEtiv?=
 =?us-ascii?Q?ff0gFrc1awXMsPc82av52TPFA2xyBbT1h610agvmz2WQR++fNSzrOf93G3MY?=
 =?us-ascii?Q?ODvIP1K4GAnZJ2cyxoq7fA6NirGlzaM=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b46cfb-5db4-4792-6422-08df24363166
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 05:45:28.6799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEPrZcs/55BPIyxvH/D0EzYDaB4YWY5nz/bOfJ33F5CUPkM/fnIaFBa+oY0JxVEQWMYZfQ3vLYmjsUrye0gGUbEAsZzu7AzGyImiuSFw9uM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3674
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247358

Release Notes: https://www.openssh.org/txt/release-10.6

CompareLog: https://github.com/openssh/openssh-portable/compare/V_10_5_P1..=
.V_10_6_P1

- Refresh existing patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...1-regress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 .../openssh/{openssh_10.5p1.bb =3D> openssh_10.6p1.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.5p1.bb =3D> openssh_1=
0.6p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.=
sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/ope=
nssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patc=
h
index f424288e37a..902ac7411a8 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-=
input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-=
input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
+From bea215955125b39c802d2a255cd08dff4fa6298e Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/rec=
ipes-connectivity/openssh/openssh_10.6p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_10.5p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.6p1.bb
index 052686f2896..6043f140b3b 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.6p1.bb
@@ -25,7 +25,7 @@ SRC_URI =3D "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/=
portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-err=
o.patch \
            "
-SRC_URI[sha256sum] =3D "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3b=
d6cbd19218db11"
+SRC_URI[sha256sum] =3D "a9dc9565dffe8640f64d863cd29a32bc4a3dbdec0566a7fc44=
c5d6ee767d5f39"
=20
 CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is specific=
 to OpenSSH with the pam opie which we don't build/use here."
=20

