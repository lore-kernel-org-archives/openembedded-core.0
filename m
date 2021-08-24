Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.84])
 by mx.groups.io with SMTP id smtpd.web11.35602.1629782938915225396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 22:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=EfYBXgc/;
 spf=pass (domain: kpit.com, ip: 40.107.139.84, mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Znie1lQxpbmnOTawCtxIJSq0MCcNFtV8pzRtkkFYxRd1y0l0KVITbBzXeU3WDHeHzE9fenrbmJL7N5diL38ecYbzpbj+xox3rN9xLLzxNIdFfs7DkJNJcONLZRtN4zMnN50twZjzGYplkf5RS2qq6k9jbiNaXIMignTMhDBX0SEIRlkOwJ2iUm+r52pADFj6ncnvQGFnVwTmXY1WrD5F0RnT98f4SZbxuZTt1SG/feDCrrnSkTjKrWlio6aIG4UQK1mzJ+/lm8KdfOuMe/y4IvVtpY1FojXa2FVt8oVYfFpOW1TvZE82tOXwRWQiMs3FJh7jO4ZdsRr7LoNhPF9JzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30WxvnVyfwstDiTKkBuQgva8UuvW6HtbM1p1n8QQpAc=;
 b=CL6wniJeveX/x6J8mssdEevYaxrdMUdDBCTuQayI1UlLnkBFyaqO2J0JECYLKVSfap69+fo6WRNUMwx7Cz/olXbbrHA7hsLBnFDznFx1MKOMQ0gjAOmMDWGoovI3NyXhM/flRedZhKt/qf2N+NbTZYuoWdWH1Qo0WIBYfFr/8yC9khdMiSVnlnI/UQ6d8F5XMdwspIw+iE7eJIvKwFyXx2F/AuSGuJ9LfS/18FN9R4hkPQo9WGsEol2dVwLID1BmIgIk7+nqIPyeX9RK6RC9UprjH6PJ9O/Lib0P8A1bgKxZJAPabT+wrqA3j8c5VH98iv7hsDZl8G11UIsyVBhgZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30WxvnVyfwstDiTKkBuQgva8UuvW6HtbM1p1n8QQpAc=;
 b=EfYBXgc/O9f4uS0DpntYzlpObOQW2e0MAyt/S/KPchS0B7/HwsIwZ1s/XrKOru9ohEgM+MzjzAV14b03/ftXtbjWleG18e7E+igCSJxvO2rCyK8bT8KlekpWV0TPr0DKNw1RJuT1VeW3fRZ4VVo5PN9hJEZRrqRyA6XowCAAdh4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:39::7)
 by PN1PR0101MB1632.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:13::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Tue, 24 Aug
 2021 05:28:49 +0000
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::80d4:55b6:bb63:f809]) by PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::80d4:55b6:bb63:f809%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 05:28:49 +0000
From: "Ranjitsinh Rathod" <ranjitsinh.rathod@kpit.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta][dunfell][PATCH v2] rpm: Add fix for CVE-2021-20266
Date: Tue, 24 Aug 2021 10:58:33 +0530
Message-Id: <20210824052833.20983-1-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: PN2PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::26) To PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:39::7)
Return-Path: ranjitsinh.rathod@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (103.85.11.25) by PN2PR01CA0171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:26::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 05:28:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 577b0f3a-d185-405b-8da9-08d966c00d36
X-MS-TrafficTypeDiagnostic: PN1PR0101MB1632:
X-Microsoft-Antispam-PRVS: 
	<PN1PR0101MB1632001A253331BEED58C3F58FC59@PN1PR0101MB1632.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:51;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rw3a2ABWZkdvXTPOB72vDHxDaOu+k1x5JeCxK6BD9xjvP5i/PF+vx0/pMjdvR1B9+amFdCsvcOar2EcnNZ1kNaLqzLlPKBGhLE4T6jIPb5BYd9EUCXyVSC5SbO9rTv0DYwEL1VjatrGn87PjlK92m7dRRrQH2Pzvq6aMFZ/EZOZhWE7qKkL0QVzaQwc7brm11knZJ7OBe5Np6zIKhtgOXbFmnt3wp6u0zkniKj/34Gr7XdNKH1YFAbMOnO09G1Yn04Y+io8XfGGK9EjDfXCKFQajsVimw2kgLz/mYrjPqQsGYvQ5yLdXnBTKgo2aL3bCEFOHUrDUfaJCVhRmQwwK218XIHnGXfUCkSagUO/U0Ht6gnoXYPOLnHVWqqdvjTvzrVoT1rd73Dc31TDvEB1p6eBh7+e0CzvtoQWUQsRWN6JKPhVAw6fi/hTNIPb7K4taP8gpn27iZ9u9FcisF3dGWZnLD9vpWAh3XplMEE1P5hs8ZpgZ5Mgn8jTYOmtvJWpYLGUlezKLHGHtCIitb0gilDhdOVjEaMCYBd740+Dkcjf72Hw8Mw4LJNkKHIGHJZmI73sIHUr5ZCUm/TWpPJck6/+IaWalyjtVBXBbGsb4hrH/c4MWhbNFozTIZb0ICLZXtKIZg68YSgw1WrBVmmoHbCKH6I6FQIzn6Nrcvs5V06nmBKA70GdtFD+Ln9Ix3iI8t/D8o0cxsVE8HODq3DF59ISVDHODOdPkCKmq3RLEV3twjg8isyqrCsIWcKlKnVtWPVJDNnlUyoUpUZxsuP9m9mKWPJm6k+whtzN+c5y53pQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39850400004)(366004)(6666004)(5660300002)(66476007)(44832011)(66556008)(66946007)(6916009)(6486002)(316002)(186003)(86362001)(8676002)(6506007)(36756003)(956004)(2616005)(38100700002)(38350700002)(478600001)(2906002)(83380400001)(8936002)(52116002)(1076003)(66574015)(6512007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zp1VQlkFPhrHcG2dSA3vaYNKZX+hDH/Q0QHPREN6DXz7HHgWbeWJGXelAgpj?=
 =?us-ascii?Q?uZhjhnsHTYeoJLKnTb3J/OYl2ZWFGByEhOeeNEPQae0xJxnjyphoiRpNH1K8?=
 =?us-ascii?Q?TD4ZJotGpbQOAIVE1kES36p29ycT9ioZbiGQ8m4Fqcmci4ccLih1+sa06kel?=
 =?us-ascii?Q?mDGSU+DBt0s+0Aa+kyBb45sbkwB/dVvKUc+r+yTfVu7nJW67+HZ9XsN1Bunu?=
 =?us-ascii?Q?wG9JtlV3IEPsZm61YQTXRBRkuZ0xz2zELCwwFvJ81T9xglYYWiy+acA2e2dS?=
 =?us-ascii?Q?4vcrkKzwMwv4M9h+SxYtxeVIvLMaiSes9+g1qTcbHNhpCfrX/pnNDbs2LPTV?=
 =?us-ascii?Q?E7VmnhI4fSa6F0l89CzOLEpN1oDs1zcebhkZ+yoVvAq9weJmyyKQ1mywWcpo?=
 =?us-ascii?Q?pJWo5p8B9Bw4lmVlJXO2FkCB5ckvLp0tYZ1FlYdJ//aGDrPrhxnCIThDt4kl?=
 =?us-ascii?Q?WIgS6RcCkrzin9Fbcjk3AChRKr6KqsYi6rSZogyNrQ6YBtlbSlxwLDXYZ6ue?=
 =?us-ascii?Q?KYwvuONiJ8n1H8UvmrUxupV8eEquCZoGR5diW3NN1pgjPmX1OXT21mvmRSnP?=
 =?us-ascii?Q?y/RabJDG9I3yBu5RSPCSRpq0sAkaM4WAzU34AK6SUgX2OZFjUmzHFkz6bUsI?=
 =?us-ascii?Q?F2SfRbWH5hucObEDgv+JiYG8+hflT4AxUADMr9ASqUQUOCXRqxwtnXFWwZbd?=
 =?us-ascii?Q?xxAEUOipXHhaPKXoOkxphpkIBO/9APoH5wjCH9152TeQC8TCdCJBROpuvRRC?=
 =?us-ascii?Q?n2nLZsv/TH21DUSt+4z75WWmOfSCkWY/2UpyBXx0UWit+UT5omWfDqFVqWc3?=
 =?us-ascii?Q?exjBJEX0HPsfqRnfozD6PeNZ3F2SJnWlRwHMnGvqB+1dEeb8Q+WIzRgCoRGC?=
 =?us-ascii?Q?YoPBZTF3UYVNFzrxMKUdn3RoFPRCo8ZCvuJk1g0MSERInERrqAL2PdC3miEr?=
 =?us-ascii?Q?CdwF/TZKbDkIQ1FBtOlMT/l+dofB/CI3CaCmZrqrXVZcoBEnCEvVoUNObNsN?=
 =?us-ascii?Q?wdMeZmQB5TdIijFfMrjmoEp+wvGcWS/ka5ktgFJy07kz26/AJRCq4+7Ezx4s?=
 =?us-ascii?Q?0a57dei4KIIsfWlgZoz+/eM//fhtHGDJ+wFJyEQ4y8KqZ9qoUVzHCH6/BdS+?=
 =?us-ascii?Q?3co2mfgFUQlGHydcP+/FU4uI/pk9ZjM9uR+Enw0eMHdQlJruT0EflbsM7u6m?=
 =?us-ascii?Q?Ryl1GggNaCE057vwexzz0Njm65ZbJCWwP4kjntra6xXgrCaCQyQ62r/2TIMp?=
 =?us-ascii?Q?gchitadh0tTvLCBbX4exW0u7JshDitQoXDORqQt9m9Rzq9uYQSKPB7WSTdNP?=
 =?us-ascii?Q?2pc4bIk2ZDnI+545YLWxa3/c?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577b0f3a-d185-405b-8da9-08d966c00d36
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 05:28:49.4055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pK6X5jfVW+w+LI7im1IdSslUFNQ7HlMvtgDJnr4uMiWdgH8NvmglyG1qY8yBz1guoau7dF4goHjSpfjMOsLpWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1632
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Adding fix for CVE-2021-20266
Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/p=
ull/1587/commits/9646711891df851dfbf7ef54cc171574a0914b15]

Note: Hunk#2 and Hunk#3 refreshed to apply patch and match value of
dl_max variable to make it with current version
All Hunks are refreshed to solve patch-fuzz

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../rpm/files/CVE-2021-20266.patch            | 109 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-20266.patch

diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-20266.patch b/meta/re=
cipes-devtools/rpm/files/CVE-2021-20266.patch
new file mode 100644
index 0000000000..f2fc47e321
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/CVE-2021-20266.patch
@@ -0,0 +1,109 @@
+From ebbf0f0133c498d229e94ecf2ed0b41d6e6a142a Mon Sep 17 00:00:00 2001
+From: Demi Marie Obenour <athena@invisiblethingslab.com>
+Date: Mon, 8 Feb 2021 16:05:01 -0500
+Subject: [PATCH] hdrblobInit() needs bounds checks too
+
+Users can pass untrusted data to hdrblobInit() and it must be robust
+against this.
+
+Backported from commit 8f4b3c3cab8922a2022b9e47c71f1ecf906077ef
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/=
pull/1587/commits/9646711891df851dfbf7ef54cc171574a0914b15]
+CVE: CVE-2021-20266
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ lib/header.c | 48 +++++++++++++++++++++++++++++++-----------------
+ 1 file changed, 31 insertions(+), 17 deletions(-)
+
+diff --git a/lib/header.c b/lib/header.c
+index 5b09f8352..ad5b6dc57 100644
+--- a/lib/header.c
++++ b/lib/header.c
+@@ -11,6 +11,7 @@
+ #include "system.h"
+ #include <netdb.h>
+ #include <errno.h>
++#include <inttypes.h>
+ #include <rpm/rpmtypes.h>
+ #include <rpm/rpmstring.h>
+ #include "lib/header_internal.h"
+@@ -1890,6 +1891,25 @@ hdrblob hdrblobFree(hdrblob blob)
+     return NULL;
+ }
+
++static rpmRC hdrblobVerifyLengths(rpmTagVal regionTag, uint32_t il, uint3=
2_t dl,
++                                char **emsg) {
++    uint32_t il_max =3D HEADER_TAGS_MAX;
++    uint32_t dl_max =3D HEADER_DATA_MAX;
++    if (regionTag =3D=3D RPMTAG_HEADERSIGNATURES) {
++      il_max =3D 32;
++      dl_max =3D 8192;
++    }
++    if (hdrchkRange(il_max, il)) {
++      rasprintf(emsg, _("hdr tags: BAD, no. of tags(%" PRIu32 ") out of r=
ange"), il);
++      return RPMRC_FAIL;
++    }
++    if (hdrchkRange(dl_max, dl)) {
++      rasprintf(emsg, _("hdr data: BAD, no. of bytes(%" PRIu32 ") out of =
range"), dl);
++      return RPMRC_FAIL;
++    }
++    return RPMRC_OK;
++}
++
+ rpmRC hdrblobRead(FD_t fd, int magic, int exact_size, rpmTagVal regionTag=
, hdrblob blob, char **emsg)
+ {
+     int32_t block[4];
+@@ -1902,13 +1922,6 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_siz=
e, rpmTagVal regionTag, hdrbl
+     size_t nb;
+     rpmRC rc =3D RPMRC_FAIL;            /* assume failure */
+     int xx;
+-    int32_t il_max =3D HEADER_TAGS_MAX;
+-    int32_t dl_max =3D HEADER_DATA_MAX;
+-
+-    if (regionTag =3D=3D RPMTAG_HEADERSIGNATURES) {
+-      il_max =3D 32;
+-      dl_max =3D 8192;
+-    }
+
+     memset(block, 0, sizeof(block));
+     if ((xx =3D Freadall(fd, bs, blen)) !=3D blen) {
+@@ -1921,15 +1934,9 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_siz=
e, rpmTagVal regionTag, hdrbl
+       goto exit;
+     }
+     il =3D ntohl(block[2]);
+-    if (hdrchkRange(il_max, il)) {
+-      rasprintf(emsg, _("hdr tags: BAD, no. of tags(%d) out of range"), i=
l);
+-      goto exit;
+-    }
+     dl =3D ntohl(block[3]);
+-    if (hdrchkRange(dl_max, dl)) {
+-      rasprintf(emsg, _("hdr data: BAD, no. of bytes(%d) out of range"), =
dl);
++    if (hdrblobVerifyLengths(regionTag, il, dl, emsg))
+       goto exit;
+-    }
+
+     nb =3D (il * sizeof(struct entryInfo_s)) + dl;
+     uc =3D sizeof(il) + sizeof(dl) + nb;
+@@ -1973,11 +1980,18 @@ rpmRC hdrblobInit(const void *uh, size_t uc,
+               struct hdrblob_s *blob, char **emsg)
+ {
+     rpmRC rc =3D RPMRC_FAIL;
+-
+     memset(blob, 0, sizeof(*blob));
++    if (uc && uc < 8) {
++      rasprintf(emsg, _("hdr length: BAD"));
++      goto exit;
++    }
++
+     blob->ei =3D (int32_t *) uh; /* discards const */
+-    blob->il =3D ntohl(blob->ei[0]);
+-    blob->dl =3D ntohl(blob->ei[1]);
++    blob->il =3D ntohl((uint32_t)(blob->ei[0]));
++    blob->dl =3D ntohl((uint32_t)(blob->ei[1]));
++    if (hdrblobVerifyLengths(regionTag, blob->il, blob->dl, emsg) !=3D RP=
MRC_OK)
++      goto exit;
++
+     blob->pe =3D (entryInfo) &(blob->ei[2]);
+     blob->pvlen =3D sizeof(blob->il) + sizeof(blob->dl) +
+                 (blob->il * sizeof(*blob->pe)) + blob->dl;
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devto=
ols/rpm/rpm_4.14.2.1.bb
index 018b2f8700..c93654aa8f 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -45,6 +45,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/rpm=
;branch=3Drpm-4.14.x \
            file://0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD16=
0.patch \
            file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
            file://CVE-2021-3421.patch \
+           file://CVE-2021-20266.patch \
            "

 PE =3D "1"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
