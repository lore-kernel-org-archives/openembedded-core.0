Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8546CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:03:26 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45967.1781185856035078584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 06:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ImjN2LDE;
 spf=pass (domain: est.tech, ip: 52.101.84.39, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9V3LQnP/DkhMiCVYybCbPDJBuykMwin+7FC/npMwMAe1+1B6U6oxpcPB0QxD/CZYLr26h9xOEf/ZoFACmoSCFOzWWM1YzHSHNVui4trXBAUJEfxSi5c4gO8ZODBq4fqm/sZlOU/4R1FjiDeMLc8DN73h00c//GOO4Ao7R2QsUxrddS4/Di83/P5WwQZTso4ziooab7pfmf7zqbqQc5+0BmKVINr7tPYs0kLCyIPEfALYhFQtIkUFtnR7Gk+JCd4AX00QLMy0E/V6rVnJzA9luR7KKo/mX1x8FxQeXBWwsNEPVuX2sknR1v+iSZWy9DNKp/8fTTWp2pQ/4UgtCT4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwHKVW5TFgPjtmglGiDCyJYN2Y4GzTAz1uCw/pUkB7E=;
 b=ceP1Yas7WuLMzahfHhIz/j6YbuzG2dJ1lT+EwK54Q36gcWwppXYseMIxojOvywVIVeA62QTjhi42YnrqztbU9uvl5n/Uooo/xfL/aH185Y8XNgEBa3iFpJeAL8o+TiGyjyJ+mFvqhW624s0anNlsYJ9RoeKfMS20aZLLUuivwdYumbKAPsGdM+oclteMN8mZYhhI3xEX3GpsMVD0BaZoKBRv69Vm1TGG1HmKcWk+kbFiidxx8CtHAHcWyFMaaucaKRoGLEHZhtKFaEnncSa6S5Pdj7r1UyJf4llTd5BLw7E/H4ITyrC3W4xXhKlTIvWvxO7q0SV5Rj1OO1gt2Eou0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwHKVW5TFgPjtmglGiDCyJYN2Y4GzTAz1uCw/pUkB7E=;
 b=ImjN2LDEeHEnzXI2H25hkPGm6cmWBha1h95Lfu3kRhOGJxaVXEnkrsvOH3FbvM0KxKvUtyl3BnZ7HnpB+d2ZUnTELFTLLrY4L6suaAAgPf2o1j6ONfrJErBPpridXJz2oAzyJNcVajXPELvRgzAmWFsDVC2abcrVRo+/kGIfKCG3c+YOSfNZZXo9l/RTJ8ZCMl1N8zB5bkHMCn9DOTXFuM5wXtlUKT1mBo4sZrrgt5hTqqz18PKhs3fEpY3EvUR8/9YYpNdgNjVmL+Jju2FDV6xU0qWe+IpNBRjqWpn45JXRn0tHGPFtO5MgocnbbsJRlnuNlWLAe38fMUIQztckbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV4P189MB3726.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 13:50:51 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 13:50:51 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH v2] openssh: fix CVE-2026-35386
Date: Thu, 11 Jun 2026 15:50:38 +0200
Message-ID: <20260611135043.1463501-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2PR04CA0032.eurprd04.prod.outlook.com
 (2603:10a6:10:234::7) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV4P189MB3726:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb01290-7fff-4554-e4a9-08dec7c07311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|12006099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	NlP1v4G0CJAljQtwJkwqv90wK4zBNYdZmTuaGfpNA91H36Vhxz0C1at8n4rGjjoUjAfkAwyt5atXqHw7XTn1/r/ohcNyv5hEU3lsUD1avalQEU3hpJiTLIPUkNwCz1Js3SWnT1G3fpJD9YJZZWCTsDQFIgme/rghcxqV0Y+3z0hdyMVPrjOm2fNtgIh4cyLDS6dkPAZ+rNPglE3hak1u1pVCTetdazsCvPrtkvWF3wCQakoBicfcquP1N+8cpg5KrjBhs658wp35+SThi8Eu98jAsXR8bZnpcMrKBScNg6fs6s2MOuvUUN7oHCV1BfqEhwDYOPAOHdQdnZZxC1ZXviIbsO0eB7I2E93gyf9LD3WBV2P1aES9j74qN/fvCFXDzRLhU8DKM56SHhsuEKvmpicZd6XI7CcEtibpY1BWKApWao5vwLOJQl4RNFgZSkLr1yrqPP8KtrdsP3+qKi1WsmbpP9hTQmsgN5qPjoJS07qRZWDMZKJyN+IqqripYq+zMeFu1LmkZZpRPqzNmRMi2nMz6Ok2QkYLFeXNEHw/Fq5lxop6xiVtTaP9LZdGFfi68AMPTzhbq4rjQ2vobYj/1AEQ9PTqq/dLIQa49qSRw9SokTJjS0S9Nr4VMWvMERdQeW4AxVGoc5PeDa7Uyn1/amIYlQ/VIeDvb0ojDlfUZ3XxOicsNgpvVB63pKRhR8yET5GDOwkQYJJPb9wAPgJShQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(12006099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cKBN3flEQIAE9NABQvNL5KWoq84KXrurb42RsG/cA3hnivLN8ycLxMBO/p8D?=
 =?us-ascii?Q?rCWQQHFh9UWRM9CUxb661NzMQXELTAqm8Rh9YNE/Uszlx7LTmmlQW4rzre4j?=
 =?us-ascii?Q?CLR+ClyotcqFlnQ3Wa6eF1YXD0M630LwU/Vm6YrWHe5eXl8UvMtmi+MYW6Gx?=
 =?us-ascii?Q?l8yV2JzbsoGJ+ShyfWOg6vFDHxnmrSEJtxdC+olILsEQEHsnAzloowkhG7OX?=
 =?us-ascii?Q?80aoU1jgSZ5N5+hyyp9KHi1B+b9oMCoEoXvfYroFlcPUyameZnrRXTnUsZy1?=
 =?us-ascii?Q?aKSUP3NyA2XnOvfbUVWW/i4PLEHqGJkjhsFrLoNRUtWQ4J+yx7mTf/m8NjiB?=
 =?us-ascii?Q?7g2izJX9VceL92xcJpVMaLMCjaZRRVGA1DU/Lya3sxKfCAY1Ux98rOIyLblb?=
 =?us-ascii?Q?2Yv2ESQbsKObjdYk7+O86wziTQExU1Z1vbgcmUXJsLdV3LyPr6ID+aSpu0CT?=
 =?us-ascii?Q?rWJ530Hn6k/r/H4B6WKKoAgKB5qK5DNVfO4X5kMzoL4bsI0RrN43XkGlbwTh?=
 =?us-ascii?Q?KDNsgfUzLj33+l+FVtRlUwDeIVqYNB59MoyDcnlPrbAcMIeabzvVqTaRzS+/?=
 =?us-ascii?Q?LBnJlAuF+8WtsU0/rk14ivSMou6KV8Hpmt7DZAER31HTy4IaP8J0ARN5XhBO?=
 =?us-ascii?Q?uSzMSfUzzykQXoRPol3NSAuAggbaKep7OIyXjNI0SC6F4DFw0cAXhqZ4Ue6k?=
 =?us-ascii?Q?koZHjVW83FOsI6wQfheA7IZowvLUY6PvpMCbLN2cd5cmeUUhFKbzNiX36QlP?=
 =?us-ascii?Q?kh49CmvNB7OGxrqOsrHeX/Cxs6pUL6bEjO8lrw29O4xD8Gvc/QnAt9Aj1dNu?=
 =?us-ascii?Q?8cXbWY9NGKzCPtsPakfmLFr8WTMKuvzjgg9nmKk1p5iy8y1Sm/a9RAWwkdOp?=
 =?us-ascii?Q?b8wMuTEekpbg31j55hjNtnGn38KRkGmk4w8x2Y3h/mhusXzH077m0f3BYOT+?=
 =?us-ascii?Q?CkWjJ6eV3blR+oBJT/YMnqKPwQM8lItFCn7JbajpRGURzK5AXNpz2qUM1JVN?=
 =?us-ascii?Q?gSULnsh0TJfWahmDLyt4U3pSy0ZofiBuMIsbH4wJyQCgKR297pOGNGnFA+WK?=
 =?us-ascii?Q?TYBXAuzi8lJcocvCjwLuJJ1vHL1+tTahGCUsWd3lQs39M0bKUJkxML6VEjbd?=
 =?us-ascii?Q?2GiUHxfKTyZhJlyl7aRRlOkfICt5c/Jrk7QC1JsGCVikIGOR7QdD90j3429R?=
 =?us-ascii?Q?z3qBvcD2bXjQo/ftujuMur21Ms7mKFXIIpmtscYlBVyxU0Q33bTtA94bGEjN?=
 =?us-ascii?Q?2iHXkgai3UrhO0/EyL18wuc/UyXoY5aMDlNEh3IIwnOf+4H+UhyBz6DHh0np?=
 =?us-ascii?Q?yy05XI4fGz8uxJVAfJqcG971rqdVqUkaE3RXCRxPZq2EfVeqE788/TX+zW51?=
 =?us-ascii?Q?IOUJFnNCQC9vsBfVpbWmBOOkdDVLTbwgND6hIZcU0spLyhBovU+5cjPIB+cI?=
 =?us-ascii?Q?jXn1EPAExdi66vL5fwD9Trqsmf+nkaL+7IfA1y+uwifqcR1NghCMWwa4VkWa?=
 =?us-ascii?Q?09RGuuL8UccxJx7VjU3hC6U+Nhap1k3kBQ9KhcPQfqxvcvN04V623EHWTark?=
 =?us-ascii?Q?82T1HT1Y6PgTj9h/VDhHDcw7P3hnXMVQYM3KbqodIuR4dkl8YNTMUnXg/rRy?=
 =?us-ascii?Q?d6Cc3zJJtvMztehEAnxIqP+FW6iXuQHe2H5AD4gsM2Qmf5M9TIKbYlN92y/P?=
 =?us-ascii?Q?5bvYacVfV2pkAk027PfHeCGFvAxbXqB14UM/64N/eusyZ849xIq8s3okS36p?=
 =?us-ascii?Q?oQPkFga7GGuW6Tq5tljjJjRoASU52NE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb01290-7fff-4554-e4a9-08dec7c07311
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 13:50:51.2350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIE7zq6SJBCoC6+17Ny5qISpsh4N4eJ+jiy0yLgbnzq1VeN0LKL/Q2ME9hGEoPFYqwaeZnUPZT0wnsBjln/Er2hBJzNQUnN5z+vgfOYALpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3726
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238446

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

CVE-2026-35386 is already fixed by the existing CVE-2025-61984 backport.

Rename CVE-2025-61984.patch to CVE-2025-61984_CVE-2026-35386.patch and
add the second CVE tag to document that one patch covers both CVEs.

https://nvd.nist.gov/vuln/detail/CVE-2026-35386

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 ...CVE-2025-61984.patch =3D> CVE-2025-61984_CVE-2026-35386.patch} | 2 +-
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/openssh/{CVE-2025-61984.patch =3D=
> CVE-2025-61984_CVE-2026-35386.patch} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch=
 b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984_CVE-2026-35386.=
patch
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
rename to meta/recipes-connectivity/openssh/openssh/CVE-2025-61984_CVE-2026=
-35386.patch
index f705410b24..7fcb02d613 100644
--- a/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984_CVE-2026-353=
86.patch
@@ -32,7 +32,7 @@ Slightly modified since variable expansion of user names =
was
 first released in 10.0, commit bd30cf784d6e8"
=20
 Upstream-Status: Backport [Upstream commit https://github.com/openssh/open=
ssh-portable/commit/35d5917652106aede47621bb3f64044604164043]
-CVE: CVE-2025-61984
+CVE: CVE-2025-61984 CVE-2026-35386
 Signed-off-by: David Nystr=C3=B6m <david.nystrom@est.tech>
 ---
  ssh.c | 26 +++++++++++++++++++++++---
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_9.6p1.bb
index a1b5d4a553..ea158b56b4 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -33,7 +33,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/p=
ortable/openssh-${PV}.tar
            file://CVE-2025-26465.patch \
            file://CVE-2025-32728.patch \
            file://CVE-2025-61985.patch \
-           file://CVE-2025-61984.patch \
+           file://CVE-2025-61984_CVE-2026-35386.patch \
            file://CVE-2026-35385.patch \
            file://CVE-2026-35387.patch \
            file://CVE-2026-35388.patch \
--=20
2.34.1


