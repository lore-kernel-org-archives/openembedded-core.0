Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42786CA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 05:58:35 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2034.1791352706928220788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 22:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Cf1LFHAR;
 spf=pass (domain: est.tech, ip: 52.101.83.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZIF9VwNpaf47I8hnfASkPhkRKvAGtAzmUBdcVFvwUCZBXPTMOj4yZj7jWl19cXjdOXzYZlStwQe9+73CeTBiT3EJkdwH2MgXjZDsDaNFCnn0e7Fcd9ScbrD4n23YEFj932+oRGXeUzBGMEUqQSe5bKQZBjqW8gCa2CkKFlp81NzB+U32KKYa9HFbV2+Jk+BlWWFwcQBza8akKPk0MtDcnUhcEu57l2haawoYJ0O9rlOvp21YfZRQe2gKcVxcnbA6jqV7VTjyJn486yoenxPMjr8SICkiFtz1ZFknYpZbKQkvYlSxffi00qpbewxXoxfHsG34VMRSjuslwPF8ww2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfcWEHn6/Ja1RWax8uLwl1qZfIvi1f1TU6hvhFujdZo=;
 b=LXATmB2fLlt2BvEfEVvsganXfEF5TgrVOJ3XP9T1VRrObJkA+O8kSQ+v0noNbe+UwWfedEK08lvY0jfZ9bFA83XFwXvyRToarYJ44Q247gICfGsvq5o20+Gp6Y4lZMlhRUE8hHMw9+vrGa0C/7Bn8ZUfgOMK7VrA+JiqFnsfolE6Y2mQIU7Zr3tkn4GwGxiuedWKXtiKJcIf9QGscf3By3rbl5wSqhGfdwq5ywgB64r/S1R+KUGjqmMDlc/ar3zEcpT5ZjVDRyRi4bJA2PXQFirNtoqsLXF7gMg9ouRVBzm+OpUzXhatpS36nIxziKoEOc+ODNOp1sKDXiUpuw/hNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfcWEHn6/Ja1RWax8uLwl1qZfIvi1f1TU6hvhFujdZo=;
 b=Cf1LFHARWhcOWpduXgCUgCc5h2WvkMHnZVQpoG886Ss6IuD+0sZUQbseuPJNce1rk8Mmhq9sZ1zFrzoq2QghP1cjtCtAV77cl+GkYQSquplaCFtrANoGUz7NgxQwo6e0SS72/eTsmPLv0WFtKsDuSa8IIx0Hn+tCahIswKYYO7PdbLCg4Z5y6GUE/rxIV0beNKdgOhXKibGgCSJuveHlBH11bfA5Ws35VQcWjDgWQPUGGE4HCYrnp97xm/1xP/Sdfq+1+zqv/Ovf3rs3vEZk1rHHG7d3btCZKqZZ4MKS2Bx5C/LoVKQnD7ImNLmAo0MItOOt8CFNiU3pYIUgVHQ26w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM8P189MB1316.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:246::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 05:58:22 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 05:58:22 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] cups: upgrade 2.4.19 -> 2.4.20
Date: Wed,  7 Oct 2026 07:58:15 +0200
Message-ID: <20261007055820.59633-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM8P189MB1316:EE_
X-MS-Office365-Filtering-Correlation-Id: 793e832b-5e3b-46dc-6730-08df2437fe75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	3D01GOFmRecP5NcXxKSs55tgKde45RZENOmaskrHiU6Xy7K9rbOK/MwATwbCTWakrvGgc9SGua36UYTLXEifpnN2yABNq9hksHqz059Ix5ANocvqoiWmssI9T8HU7EKq0eQhorTgXXQRJQiDuVEmxTLTFJ+GGbVMpfab90OOcwlYxKKlTvGXWV0c54Ku/uGmfECFF5GuLMxh9wO4C6J8TkYiRE8OyQQ5XHIf7BF6aIuefMOQeXAh5B8z57b7tRe7bEJsHLdaCypDtfzaC/LDeYUb7GuAEPxPFkoZA5qGMID21+eaCSIJAbI6myQ2cljpi9GrD2c44I2R+5i8mpAWIePFEh/I8ZkBc0V69T+egXz4zqEoqXMw5ruFUQ9VJDd2hLddLn0fxgVJlsRn+q3di7ulSCaDl2C9mPsapsYa8Ge5fcr0bTfs+yDRlaGdXyWzLdVc2h35t3om/UwD3VLHf328jCcAvQSBcu1+ELeRQmEz3L9cgd37MkrJD9dSYR+gEsZG2iOk1BHOrYVVc98o8/2kzz+PF9XWb+uaG1JG+n9QQMU+HiWQHFTVvyFRRcvwf3LjthT7hiEpic9ME35H5V4bXueuXtAzE+rs5LBsyxvz9XCqJbJAXab2X7QpcYSQHZyRJNHnl1LSD6sJvgmrlCSOKGvBoGDN7yw4DvvOnF8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?puWm2L9kBvNwTjd5ff1Uvp3it4fkDRzuUD4+RIw/osiDyl7j5C5Sq+xhU8qx?=
 =?us-ascii?Q?eV0CA8UUDtRnEWsUHe8NqbuGDdxAE/QgUr6+/RLLEAXAR9LK2NLJZ3exGwUD?=
 =?us-ascii?Q?4HuW/xDoLkvFceJPm0/iWpeUOM4T9cf7ahFI7eG61XIUIvC/cPZ5mjhTvE0u?=
 =?us-ascii?Q?MXmIceK6lNtv0sKmZib6fG5gU0SRKa75ZaDtHpO1fRy9oPsJlGyhImzw4Ykl?=
 =?us-ascii?Q?CFwKYp4XIWGdaFDrLkPdH9iqJAV9Jp2WiDeg9JBuHcwHRvdFr+NTx4d89+vy?=
 =?us-ascii?Q?WDMdEp9M52mwiNqJQ+gBet0uXubXg25NCEPf5PXy+GhjVHHCH5Pd/FB/Nwm3?=
 =?us-ascii?Q?rcAm3+ICLl86KgJOktXpFftW4WaMAr1c7zNmZN49eaNrHDGOmjgGtf9T1QjK?=
 =?us-ascii?Q?P8Q1/eneu8GVMRlpbhnh0VpNgm41OELJyML47fxH8u0xgO6wdUIz7IVMUu1w?=
 =?us-ascii?Q?3f0697KaEB6XuqS4awDV6JBV9l6dBTO+7RcxLZoX9esuRov5mqjy03H2q76b?=
 =?us-ascii?Q?xOXcxAyi3xm6w8NlYw7OqqzJ35VQYslqhzb6OQXyLzjI+m3Va2uFoa0+jWoA?=
 =?us-ascii?Q?xghuNs8BuogOLlZpcCxjaGqBLv/qkktTedoONHTX+KRQYDblzDD51lBFHSjA?=
 =?us-ascii?Q?4DnXMoXyJA/NBMbFoYOk9cN0m+xrfk2zDe+JtDfkYQHrjjFIrTDOAL2kgv+V?=
 =?us-ascii?Q?/ZDKMFCyYFS4x/DR0dyZhB+AtgX1uUcqsc5H4dPDJll0mgwz5ZW3nH3AQ+BB?=
 =?us-ascii?Q?abb9Paid7xNewFzcFs6oCJPcp42Xbhc0WmtcB273OkeXn4v31lFBryX9B/BI?=
 =?us-ascii?Q?WBgVOqXfMd/TB1x8PdHGV1m0anowc3YikKKL6m6bGz2O4QVmX/iyQdwb44nv?=
 =?us-ascii?Q?NZxSq2q8xFdXNKnHIHgNXNywpEtMiY1mJ+PaOW+5wcqeSucH5+nJuA9JfvnM?=
 =?us-ascii?Q?/nHWOq/gANLa1EH9AHbip4Pm8V4bQ1VILPGntJXOENiiJ+12K3P4+HPkZfrf?=
 =?us-ascii?Q?mb/rFK1/iPfH/FyJP+tXSyuVrgbZeEj7wnP6W/Cxt/nQsOp9Ic4ERBx97xq+?=
 =?us-ascii?Q?i3RxaX+yo6WNRfGNXYgzIWqHfg1HtjPPf9il4wBEuMf4HdK0vnQCNrxjPtXl?=
 =?us-ascii?Q?Zyi778SG2ijeJln8dWvdJ53yfz3LBQlmwMWkcAEZanSK0A3Y1FC0EY8VTs8Y?=
 =?us-ascii?Q?jJYUunq6KvsTsr7ke0Tdx2w6CtmCsKbfKmj08Y1OYpnSCzPL/K5zoySOBPj3?=
 =?us-ascii?Q?WvWfouRpVNpMPEDRa2WRp0ek7/wYegcdD2RZDDabUuTeAI592ByVjyIM0Aue?=
 =?us-ascii?Q?0bosUUJjgykb49/M5yerCczivV7YXFbaqnRU9uElUW3bWfJcq7vDoRikqhXV?=
 =?us-ascii?Q?drPlSeOvUwW694OExGcx5lNAOEHWOjS2vC5Vdka/uVed+jSjjKo2WJlUkTwZ?=
 =?us-ascii?Q?9BPRH+uz2c8g1yqtfro1CLJYFWG7C0ODCHNnKK+MCZBMG1b31VKxOatG0qp1?=
 =?us-ascii?Q?iPQ4NkqMLre7Czf7p15+EHMbMzW1hMmImI70fjzSV3l2sSyFWnZDAZJ3MPG0?=
 =?us-ascii?Q?dfojl1U0GQCNijb67/DdBqqNVyJb3ELlypbFPpFExYtvuU3/g5+yF+F+IRud?=
 =?us-ascii?Q?FZ5Gj4XvFC4geW+4Rpxjxi0aFvaQ/ZU/wZSFJdJcjQqR+NRFcqQTlwjre/YI?=
 =?us-ascii?Q?7U5OBRqxY2o0yAR5Wrldsx1VbwllPlZMVsiGhIiOjkavFlGDBcTL/Qbcem6W?=
 =?us-ascii?Q?IcR7lTcclMzn27Npfv7LFVz8gyGimJE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 793e832b-5e3b-46dc-6730-08df2437fe75
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 05:58:22.2175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: autCnHmhgtyDEVQid2Q8A6gtCzLl1QkAjr2tDtGQJet4fVqAaw/eBZioU9k61J62QHP5mtm9Gk2NtNzHyNMUSAW8LeMDhUoXR+VRUojYmZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1316
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247369

Release Notes: https://github.com/OpenPrinting/cups/releases/tag/v2.4.20

Changes: https://github.com/OpenPrinting/cups/blob/v2.4.20/CHANGES.md#v2420=
---2026-10-05

Assigned CVE ids:
    CVE-2025-55480, CVE-2026-61702, CVE-2026-87875, CVE-2026-87876,
    CVE-2026-55453, CVE-2026-55467, CVE-2026-105326

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../recipes-extended/cups/cups/0001-use-echo-only-in-init.patch | 2 +-
 .../cups/cups/0002-don-t-try-to-run-generated-binaries.patch    | 2 +-
 .../cups/0004-cups-fix-multilib-install-file-conflicts.patch    | 2 +-
 meta/recipes-extended/cups/cups/libexecdir.patch                | 2 +-
 meta/recipes-extended/cups/{cups_2.4.19.bb =3D> cups_2.4.20.bb}   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.19.bb =3D> cups_2.4.20.bb} (51=
%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.pat=
ch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index e4b473aaf3..ca92548cbe 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,4 +1,4 @@
-From 575a890a818e8ddc95d22838480b62988ffcd639 Mon Sep 17 00:00:00 2001
+From 4b7e48fb41dce9c10a4c4f91dc9fabfb14b9f1d7 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
 Subject: [PATCH] use echo only in init
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generate=
d-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-ge=
nerated-binaries.patch
index 378ef677a5..b79b8be307 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binar=
ies.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binar=
ies.patch
@@ -1,4 +1,4 @@
-From 36fa890e4b30bf42318065fe3172ef92b2d3e313 Mon Sep 17 00:00:00 2001
+From 9818e95ed747752e37d792693d3bf971af765084 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install=
-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multi=
lib-install-file-conflicts.patch
index 2728fc7e3c..7dd5920338 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-c=
onflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-c=
onflicts.patch
@@ -1,4 +1,4 @@
-From 53aeff85692ce3fd0ac325ec7dcdff31748ccee6 Mon Sep 17 00:00:00 2001
+From c9c54505f5c1f77d598e8e1baea09a3794a4f5d9 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
 Subject: [PATCH] cups: fix multilib install file conflicts
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipe=
s-extended/cups/cups/libexecdir.patch
index 4acff27e54..4fdc2d7da4 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From fab57dbafccee851b22b757f08fc3273ad78b8ae Mon Sep 17 00:00:00 2001
+From 97f71812d2553661ccac15eaf7fd354824339ef8 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 13 Jul 2021 12:56:30 +0100
 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
diff --git a/meta/recipes-extended/cups/cups_2.4.19.bb b/meta/recipes-exten=
ded/cups/cups_2.4.20.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.19.bb
rename to meta/recipes-extended/cups/cups_2.4.20.bb
index c4885b60bc..18ab74c783 100644
--- a/meta/recipes-extended/cups/cups_2.4.19.bb
+++ b/meta/recipes-extended/cups/cups_2.4.20.bb
@@ -2,4 +2,4 @@ require cups.inc
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd5=
7"
=20
-SRC_URI[sha256sum] =3D "820984b12a67f98705785aae2dd1347fe0ac097828001d4583=
ff64574aed6389"
+SRC_URI[sha256sum] =3D "ab4d9cd7f3e58060091d2b24972223d6401675f11c49b65abf=
4f6ef31dea22ff"

