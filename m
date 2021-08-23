Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.82])
 by mx.groups.io with SMTP id smtpd.web12.27865.1629742368994517337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 11:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=ozmWp0Dt;
 spf=pass (domain: kpit.com, ip: 40.107.139.82, mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtaeH0sGQnLYdXfyQiDCSz2cE9rBjpZ+A62CitPZghWVLKP7niSceSJCXs2vPveQ3n11YBjyvjbvYMGZw15PjU+CBZrtdzD+pfLT3X7Lr2wRsg0ucqGAT8H7DaYRxFzt77AxaELO2SO9JU8JggcxwzNMHlkOIk2fEDgeL3vtacAT4O+B4em5sFFcnGXUYAawjDuLZhNnUzDpwiQfni9eY3kB2H+mZLLrTPU1MALjJhUMllATcucJFueiXTFnapLlFoDrMtUnpa1w86CbbGwPnGho3Q/TRiKUk+eI2KR8iHDadcqsT4ZYWNtZPAWzsAz/cZgWh+pYM7GX4EosIDmXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAVOdCuRQLyVBmpfysbYaJcYrSZhqLEde8E2qMcYe8o=;
 b=HswfzQ8ERcTSKxLxmeUPHxAPU+SBiRukajRzLmTRdNN5WATx8c9tS8Q9Ttl4reqsmVb3O31JQAafxo5NfRgHiJOCrcg2AE+sWHhCa0+cXV2i59rAM2jamID7mb08cUkbqzEHCNDnB885MgM44x49dkPa8tnXh+CE1NVscUSZhS+kZDzNwnU2m0H9HlqonIPlOYzsi5W2frfQk/4/JzcDjyK0LHBPjNW+kMVsv8VeDuzRHUgyO1GsSHVqSafcw7yb6Tc2gBLVfzvjIRJOvBH7sQgHOj1wC4rPqDhOBXKLhZ+HPb1/tFrlxS+82u2ZeujE8W30Q1nQ/ghh/EdnBr2IKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAVOdCuRQLyVBmpfysbYaJcYrSZhqLEde8E2qMcYe8o=;
 b=ozmWp0DtDYAp5xsKmj+HiKpBqtuGgGz6hAVNzkQ5Ms1MFtrbST90+5Mw7LYyQXocLFLU9k1T+bck1YR9EsO/5DhLTJ6J4VlyGUCXZHIPfCiVDLjMhc8LAz9+wZxMkz3qD1T4Bhhec2InN0w55AkTWWBxlsj5pw/mfvTrMKqDKPs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:39::7)
 by PN2PR01MB5078.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:40::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Mon, 23 Aug
 2021 18:12:41 +0000
Received: from PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::80d4:55b6:bb63:f809]) by PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::80d4:55b6:bb63:f809%5]) with mapi id 15.20.4436.025; Mon, 23 Aug 2021
 18:12:41 +0000
From: "Ranjitsinh Rathod" <ranjitsinh.rathod@kpit.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta][dunfell][PATCH] rpm: Add fix for CVE-2021-20266
Date: Mon, 23 Aug 2021 23:42:26 +0530
Message-Id: <20210823181226.3259-1-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: PN1PR01CA0113.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::29)
 To PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:39::7)
Return-Path: ranjitsinh.rathod@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (103.85.11.25) by PN1PR01CA0113.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 18:12:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70a9f54e-69f2-4a4a-5036-08d966619896
X-MS-TrafficTypeDiagnostic: PN2PR01MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB5078BFDEEAFE6E9B5DA0D3CC8FC49@PN2PR01MB5078.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uNe471zEswTzgO+UGjtKjq3uBd+kNWC8xy6KvH13c/htrFuXOnMLfJZLbnFrfQU73CMUjj2KqHiJzgPQN44vbipzmIkB5REKcpaXGAo3EsFmi5Eyzql8t1O/prxERu+dSku6RF8pu7eVt4tFNy0Z2vwvmjl+cpL1AMtH3PRq+B95VV4gIjadtOQDCHj9Q78pByd5y8FNGS3F9EHa5eYGCuWZnxbNM27VBILFZwyo/OKsEXDUpzqRU0emxdkC8JVnxWdb2Kqwe7ZlH4b5dZ6LUzU5fLOuKggz0pif4AO7ZKMV8oT4bhuFYkBxzHKbDjwVJNR9/Hva/UzVmzBFmYGD3s4Egq2HKCZNc1sehHqER1ja+AiLiUwDf0pmlmnhGvG3yb5VWqW9yKzwsFVSmgC085bFzCAS0fhdKwx3NNMN09S1XSVcD8a5m8xt5apzq2NMq3tK62FgU5BrWkp0+KmLEBj+1/tRP3b7Pu38gyW63lzV5YUkJFeswBbIfTpZ6Bt+xnCnM7LGnDk1ujh+uzoIcrOLQ3xqpHorsQ4txbRr0jGwiH+TZvGeKJ89dLknH/ZqF1tiK6h9UeQrams5FsBlsQ9sLaUDVHFD08gGdO+BCdCegAnbUs8RcUdk3AgKkQA5/jgME/3jdIpK9sjvBh6Oc5vUrjY9oD85GwpHSs0ttKAkUhDnJrNu7CH41wXZCDVX0x+H6jzcMYWiqbRf66FX4Kzta6EqWzw8itF6PN2jiZkx2IaMZO5w+DlPaJrK9s5+Dtd7DUzDlHE989gccRcVUUQZlGv77jhbBVaUx4hmKHE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(1076003)(2616005)(26005)(2906002)(6506007)(316002)(6916009)(956004)(44832011)(52116002)(6512007)(86362001)(66946007)(6666004)(66556008)(66476007)(186003)(8936002)(508600001)(5660300002)(8676002)(38100700002)(36756003)(38350700002)(66574015)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oAeEsmCGYxGgEH776ljq8qTIYnp2ohzauu/LwCdrJl9PF0wh6Cjj/DT3xfSd?=
 =?us-ascii?Q?vRnl9fH6FDIcm9Ii1q6Y8u3trfreG/J0bAmZaVkNna1zmmWVBHPFUtHw9RtA?=
 =?us-ascii?Q?WiD6po+yZnPtLPeDMnEGZYdYsjJTZgpxLDLi//ieBY1cD4J5H0Yh9H+CslVQ?=
 =?us-ascii?Q?EhfohcOMInAp/O65asum+Wa2KNc8dFDNbvJEVWQ0cduex8rZxKpKnnAQiuld?=
 =?us-ascii?Q?XFGoAKQ37jUpPHs1uls01Sf06B2O/W/NwooZQKy8Z+a4zLtvfTKzboXjLOjz?=
 =?us-ascii?Q?uXFoO/3C0+Uj3JU5t48130V5IDRNPbd480V6gEmspDpzyOTh4VvHxlcDH7Yp?=
 =?us-ascii?Q?8v/RRxgrbdL56Xj7zOKO4Zu7iNF3bKWbU6s/zqIu5dQqqVscCbrp7ZkK6rao?=
 =?us-ascii?Q?PeXJIyXN6wB4Rvb9cPUSlVYLHFn5oOdXZr9Cd60NUGrtwj3439LO1tmqsA+T?=
 =?us-ascii?Q?c1Dfena3bDr9sj7mCDm4aHAJnzXnfCL75owLW7KSx8YOwyF82FYgk4t2UCG2?=
 =?us-ascii?Q?+LONIPe3EmmJTvcPNV1e3jgvWJk6d4/vHwf0EVb19TUA5ytpXRnWhE6hvMbF?=
 =?us-ascii?Q?ubRRaWFwYOA6rFuhlwPB4yMEXmZ+2yjuaVCksprDaG3qWQEUu7KiYef07rfH?=
 =?us-ascii?Q?TErBIUYZgEXGY7//FdXlPubPnvRFc+RuYgArjia4J1vLtmhzTiyLiU96SRf+?=
 =?us-ascii?Q?h+StlqY5yxmYxdA2EWsNesealgh+K9V5BsL9gG0dcz3AHT07wPOiMLQxgh90?=
 =?us-ascii?Q?Ef5Qgec6fM0Hx8K+oVQi8+6ZMUYGIHADxJ451QwbHT1Bfk8/Ycq4tIV6UCSN?=
 =?us-ascii?Q?NyH5r52R1CvRhUnlAsFR+C/3jy1pEnyXr20NxLq0L368/pP8TBgQcCBnlsmX?=
 =?us-ascii?Q?G7HLdJgDYGYJ3LBClWtDUyAnE7KmpDqdnhn3u4OuO5zbT9JhuLQR/qWEKv9h?=
 =?us-ascii?Q?xB21K5qNrInN7wcFeu6erL8FflrRlktdU78ieaBOZ1gw4okMH92rkTBX2Mwo?=
 =?us-ascii?Q?+1lMdVPwFjG1EFBD6XW+gvpyjHCh9j0Jt40dYDbXajA0eRxL+EhV4wqPRIbo?=
 =?us-ascii?Q?HSjN9IbLi+JXUnoOsY8kY4oIBV2p6UWHHZ+02e5oQtehWACpmhipT6kzsPn8?=
 =?us-ascii?Q?V1iK0wMnSQpM/nWyAT8wEOnDOHF+rp47R6zTfbr/8l7XB3YcZV2baRASDyFK?=
 =?us-ascii?Q?F2c1nKKL5kSSf9n/BT6yTGTBjjZKBmSo8Ckg0e4HY3txSpXhKT45SzVZhYqx?=
 =?us-ascii?Q?9T1uRByDQQtKqTlB/HXZtKXzyc+pgngtm4Dvk9CbzlAD1lm9X/f30z44bbF/?=
 =?us-ascii?Q?YTOWxT3uYdtYfYk9mMwnIZf+?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a9f54e-69f2-4a4a-5036-08d966619896
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB5278.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 18:12:40.9515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzEqN432rTG6eP2y6PQ73mBqb7XNdKzen7DQhy9TeQNedxftPjSpZuZiLkHpFz9f/VR7AhlKJ8N5AozvAPqhfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB5078
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Adding fix for CVE-2021-20266
Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/p=
ull/1587/commits/9646711891df851dfbf7ef54cc171574a0914b15]

Note: Hunk#2 and Hunk#3 refreshed to apply patch and match value of
dl_max variable to make it with current version

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../rpm/files/CVE-2021-20266.patch            | 108 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-20266.patch

diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-20266.patch b/meta/re=
cipes-devtools/rpm/files/CVE-2021-20266.patch
new file mode 100644
index 0000000000..d8b91d4f8e
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/CVE-2021-20266.patch
@@ -0,0 +1,108 @@
+From 9646711891df851dfbf7ef54cc171574a0914b15 Mon Sep 17 00:00:00 2001
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
+---
+ lib/header.c | 48 +++++++++++++++++++++++++++++++-----------------
+ 1 file changed, 31 insertions(+), 17 deletions(-)
+
+diff --git a/lib/header.c b/lib/header.c
+index 6af48e61af..46ded5dd99 100644
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
+@@ -1910,6 +1911,25 @@ hdrblob hdrblobFree(hdrblob blob)
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
+@@ -1922,13 +1942,6 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_siz=
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
+@@ -1941,15 +1954,9 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_siz=
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
+@@ -1993,11 +2000,18 @@ rpmRC hdrblobInit(const void *uh, size_t uc,
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
