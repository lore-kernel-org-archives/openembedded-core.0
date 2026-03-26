Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3989C106F2E6
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 07:51:40 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42442.1774511451539945320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 00:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=bWTsfauh;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.69, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpuS4pE8xGt00ADAMICxHUwP+ryY4uK3nURLlFZwpPfSTsjPFQSFx+CBITVhtTBBD2ai3ylfddqdRoN98m58X6LYnmZf2Ck4jW54XDLOdcc7tAsp4jVL2IkFEB90T7mTQ5wdqPGAzX5E7cK1qNdp8hKRniw1a96JNzW99sTSXfyq8J0AVi5LuMUgZR68YeqfgYe/KB763WMKlhaNI/7gx2A+dgxBcjWLUi4AXDugId58cAISu/+XickSc3/HuTvoSNff26TMmlTk8RdogJJPVTxW70X/d90zyZSVdLn+ziQPCtBPevBXtzveQu94Yo3r7mois79ypMGVlBWigALeXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhhKOBYGK12l7NJK10iV/GBj6kzkoHgsDuLsDeHWBK0=;
 b=owiXKo8MMtBWlwrjilC4gYVkj0J245GXkMlSgQA4ATWemmlSs/RlilCthXnnVOx0NXYZEq+8SYZaTmZ0f8N/zUwUCanU/Z0AqChAYC/KokaGqq24bUUHaCPW+ZW9+RuIfZbloBM2u6Br4UU+jlCJvYrHTIddI279l31IAC/oTPiK+3gqiON04rtd0VLf0GttmTY4c6iSLbNTcZBCzZ0mNrL60QuNMSaxREpweL2ymEXWAgfkv4QIxHimhWy35QnvIIM7IGjzvP1jJOo6tAUk4YiiMU3BgCTUrdOSifORt/T9LHzNCaCMy5S7l3pSFGsabwIm1ogFPQ/AdLx1epZnlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhhKOBYGK12l7NJK10iV/GBj6kzkoHgsDuLsDeHWBK0=;
 b=bWTsfauhJRTGrPV1lNXlcRBBdGZd5Y0STsAI9Z25eJfq4/x8a3mb51/Umw2G+Qc5lks1jYdvP5uNvJUq4LaxVtIo7l4rNz0Ajjc9pZ5ukC2DrAsfqGFDR1HhCGWA8p9+Mhs/vu38RxY0KVVyg+UUxV0HK5aWxd/ug8vqfTdQ+EavVHe3WrHWeMrk7/eOoaDRUWJK5Qey8sIzDkEpx+ZjdRjQ9W2kVUUbBdoHzY2NiMToWmSB8Z5b07f6TQ0IfjCR0ItFhiGi4Ny3KI0qACel0wQGD1KD2GGNDPjcjGgQ+L8h+iedaV8sINkt0ugkgv3fY+++AM1Ty003VfEA9+mvPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by PN2P287MB0809.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 07:50:44 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 07:50:44 +0000
From: Suresh H A <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: sureshha <suresh.ha@bmwtechworks.in>
Subject: [OE-core][kirkstone][PATCH] systemd: backport patch to fix journal-file issue
Date: Thu, 26 Mar 2026 13:20:29 +0530
Message-ID: <20260326075029.2091186-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PN3PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::13) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|PN2P287MB0809:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc3cf0d-4c4b-4b5c-608f-08de8b0c62cd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|55112099003|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6iiJZROhV9D7tOZi1h/nI0M72ZQXBLPlEoSaRK9fWs2mHXYYRNtQCywo4BxnoKtEzdPVKXYvNmIULfERt+jgoiMA2FtjYy7SJ78lHLEZZfKFb5AWAa1vUPsLj/2oq15OxsOTypFZM+AVXqNkaZO/lh6B5aORhjNCnsHHabZWkynquSVXJ9oV2xyJjao4v/164pgDQIDAcOsqzr3lh4K09gNjc+B4SN/d5/1aEI8PkrgVtrUwniJh0dL95zIRQmvTljqWjzll3e6kjQHuBn+wXhuos9XsWmKqyn3nRYlgHXCxxGKlji2BUwdI4h5Ur2oAmKAatVFtlt3ZlbLFOyxyNfFVMDu7Y166ROm7Cdq1pRu7Kd+jdxP1LCE4h2I0+6/wYmuSC26fe0eINqWEP9vfEFsbDzXidqR+oSfeeBF6fBJnWrpgXqQtz8k+44SXPt4x2404UgYTAYhxhwb2HgkZYVTgfqSgDRRSztjtF+OuiwCH2LBwgbbMRdxnX6TBNpjWrLVuDTcqKdnQrRXHmdunhsq8/b2hQ53XvZdeV0CuoXfa/t6crZb+jxL5l4gC68+PhL2OPoNakbNcobikPjkjggxjvkfmOwZTkVaDN68QY0858I41UCOi15L6YKWvzoA6doBSG0oQTmT4TYxjvwwnVq9EcrxJ++4qV0rgrwwlx8ugBajMuuQ23kiyNvui8fk1DVQO+1x/UX+FevlMbxduLDojIvBhhM0Hhs9Nnx/diLM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(55112099003)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aAudWW4zq0AEDn4AzkSB0md0Dxp7O4zCYWC1tQuq2dVKMerMGfIfp+WF2noD?=
 =?us-ascii?Q?IGOJRoXwMyEayQ9raUVrDUoNuf7zio5a8EfcQHK75uIYLUPVuSR16TTEnwtF?=
 =?us-ascii?Q?binslR3P0t/BMZ+K6T9IiUEIJIp+T/ETA9oFNjT464YUcmmcXs/cKL7pjYN2?=
 =?us-ascii?Q?hoGSGlT3tz2f43uM+12QseG6sNO9a4KnLGoF/kGHN8BQT21fwPedj9Lniud0?=
 =?us-ascii?Q?Xc4uobY7Y7VnzzkRgGGDxmLm19yE+vCFohA76TOTgKfml0A374fsjMNVWa0g?=
 =?us-ascii?Q?RGZ/O0ao+5Q7bmQZ55WlzDvjobxsfja4Q6sxFzF99cjB68A/HylatdILep9p?=
 =?us-ascii?Q?SLLxDQgpJNWWdwZqUihejZbKSmbyabnjz4ZQ7UMcQ40NUPyT0uI917sbX+dY?=
 =?us-ascii?Q?Ru3Siw7el057SYA/XLjqzenAk4JjzUy6cx7Zuk9RjKNzU+0r8lBu0ACPSDhF?=
 =?us-ascii?Q?TGggoUCYsQGsvHZS2aonRkAHzTYtr2luhXq3gob3WDJcLO+FNKRD7zTnUl5V?=
 =?us-ascii?Q?/y/codOskVjAPYTUC9u26eS+a7RYcDrOH4wCCJYOQKd3sKF/WqDLhLS4QiZp?=
 =?us-ascii?Q?yMYUyw0qIWPOCB3bE1ZvnVL6nrXsVV5AhLd5qJOQNr/uGXQTO37O+5I6eW9B?=
 =?us-ascii?Q?kWeiXXwRJTPh43AVbeaadrpS+Qqh2sLbzjKiikkQchdrNbexGEw2tIjdc8yd?=
 =?us-ascii?Q?o3MNjUdNtTcrt6fovKGQS5ItDstauXyxfc1Nr79APYQVHeyWw3mpB+Bt3EJC?=
 =?us-ascii?Q?Eu/2beYvTkhOZzcwpihAgMkYCd3EHyuiAwKoUIyN8OaLpZytLGrshicVFxKQ?=
 =?us-ascii?Q?fR1i11fh/0iczYKITpsGU2TFhWRbvxTP1QoQmlnsS8uW87I4P+ii7k3mlNoU?=
 =?us-ascii?Q?97jIqTDROQaDg1eQ5FpId66AzdVnY713yIw1iR2hZ9z0GgZQe16R4rZhl8Is?=
 =?us-ascii?Q?Z3CrQSa1tNQtah0g0GXXXyOYleLIvD/jzwyzzpWRONMjSSSqff6ELG2MOUBj?=
 =?us-ascii?Q?PORaLiAVEYv+UV6XNHUKt/36hGusdZCu3HGp7I+5kEJV21/eC45PuitbFD9q?=
 =?us-ascii?Q?971q5kEjicTnFIMLLYJ1SuA5ZGI9tgdPJACt6a3uy/aCHvG7v2jHgLhsfZXi?=
 =?us-ascii?Q?Uk9jmGony+Y1Cf/0lJyWee/pEPbELjMLqvhaty6AveI4iRlWNUAC0yx9Ta+E?=
 =?us-ascii?Q?lRu/nbnEWf0Xl2/ObsM8fZGrSR+q25ynX1hJOCF9kO1JUlAToop5oY2xJQU6?=
 =?us-ascii?Q?Uf+TWsdQ50x+O9a3WUBpM4e+yyFokqS9uR6YuGfJODHx9ERZ83jpkqWCNAzw?=
 =?us-ascii?Q?iy/NapykduSygEDYHqGxnI1muv4h/lAY9Co3ox1X+/a/ofT08a6JJDtLuux9?=
 =?us-ascii?Q?xxEo4jSgKCtw6b8nxJvbizgZHfpIp8e/mEBY+4l7A+flCuootx+LE4CL9u+c?=
 =?us-ascii?Q?UX+g6SpsH89sv3DQ7Fic0MCyaPNJuAQWmfp3Dd7gBOncWt0xNQBbfZMQlrP7?=
 =?us-ascii?Q?huSZefRhN4meUJlC+tEgozc4g/pG7XP+8lPuzLZIetBrABO2eZQE+Gj4pACP?=
 =?us-ascii?Q?gmVTCiF11/98Y1UqP2uSJLWqp8PSKpNVGTVa4z7stjqIOGde4KQN0Jo50/dV?=
 =?us-ascii?Q?KF/Z9kSTU5MF6dr7xlNy1CvkgTxeMajcUXcatlC/AMYfxEAcXcP494nLIPzI?=
 =?us-ascii?Q?1czicnv7ywofXkojLgHvaTF3Z1eqal23tSqpGX7i0R/wIQfQSiSML+ihZH0C?=
 =?us-ascii?Q?Ge66JKsUpA=3D=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc3cf0d-4c4b-4b5c-608f-08de8b0c62cd
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:50:44.7521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbVB9ajbIPHyB4g1ljDUE6ncNu3lgJV98IChN4WbNi3EmaCfynjz/J8Kst551TZNzRN7/G5gy8bULOHo31qu6Th1xpGAj1tCvCZ+nmAe1OQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0809
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233954

From: sureshha <suresh.ha@bmwtechworks.in>

Backport patch to fix systemd journal-file assertion on removed or corrupte=
d files

Extracted from systemd MR:
https://github.com/systemd/systemd/pull/40378

Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
---
 ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.14.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0029-journal-file-do-=
not-trigger-assertion-on-removed-or-.patch

diff --git a/meta/recipes-core/systemd/systemd/0029-journal-file-do-not-tri=
gger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/002=
9-journal-file-do-not-trigger-assertion-on-removed-or-.patch
new file mode 100644
index 0000000000..040e3a7560
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0029-journal-file-do-not-trigger-as=
sertion-on-removed-or-.patch
@@ -0,0 +1,65 @@
+From 1350f39db7e72116c3b2423db02da3ddc8e29082 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Sun, 18 Jan 2026 19:15:31 +0900
+Subject: [PATCH] journal-file: do not trigger assertion on removed or
+ corrupted journal file
+
+When a journal file is removed or corrupted, then the value `p`, which is
+read from Object.data.entry_offset, may be zero.
+
+Note, journal_file_move_to_object() checks the passed offset and return
+-EBADMSG if it is invalid.
+
+Fixes the issue reported at
+https://github.com/systemd/systemd/pull/40372#issuecomment-3762907261.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/2185c=
30de333b09f46ef28b743b123f45e774738]
+
+Comment: Patch is refreshed as per codebase of v250
+
+Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
+---
+ src/libsystemd/sd-journal/journal-file.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/sd-=
journal/journal-file.c
+index bac258ca42..7b6b7eea2e 100644
+--- a/src/libsystemd/sd-journal/journal-file.c
++++ b/src/libsystemd/sd-journal/journal-file.c
+@@ -2602,7 +2602,9 @@ found:
+
+ _pure_ static int test_object_offset(JournalFile *f, uint64_t p, uint64_t=
 needle) {
+         assert(f);
+-        assert(p > 0);
++
++        if (p <=3D 0)
++                return -EBADMSG;
+
+         if (p =3D=3D needle)
+                 return TEST_FOUND;
+@@ -2618,7 +2620,6 @@ static int test_object_seqnum(JournalFile *f, uint64=
_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -2658,7 +2659,6 @@ static int test_object_realtime(JournalFile *f, uint=
64_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -2698,7 +2698,6 @@ static int test_object_monotonic(JournalFile *f, uin=
t64_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+--
+2.34.1
diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-cor=
e/systemd/systemd_250.14.bb
index 087c0035eb..8b4b83a247 100644
--- a/meta/recipes-core/systemd/systemd_250.14.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -35,6 +35,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://CVE-2025-4598-0002.patch \
            file://CVE-2025-4598-0003.patch \
            file://CVE-2025-4598-0004.patch \
+          file://0029-journal-file-do-not-trigger-assertion-on-removed-or-=
.patch \
            "
=20
 # patches needed by musl
--=20
2.34.1


