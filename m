Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6D9CD8CA4
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 17:53:26 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60943.1780941198237319574
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 10:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=AKUD7bHx;
 spf=pass (domain: axis.com, ip: 40.107.159.15, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBU9zU9s/eOIFF1PiCrIXOCmEdNi4eeh/zfRBLVvGiethSTwpCgVxbbZ79SELqHl0Zt+GPAW4PSos6GVAKqNo94WyUrf03gnm1OxV0xncNS1gb9XVbzSeknVMv806OCoaeM/RXtfcv0Sfim3pSyXpu+JHYNM4IL0Z2L/e4bkdmVZaQH6brf+cBBRuDCJ48FJzApfIQfLxu3h8eN1UYSba5OXbefS3CjoQCUpUPFOjTuEJ84N3TvG6nD5I0ekmf1SUl4H4TWT9XvtfS2L+52PiKQQ+no2kJeUG38xM1ewMrsQUhyN3DtWI+oZ8yWZWFPVBgpYzzATfmWZX+waFep81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SDzR1YJX/ISKo3jd7uM1/ziFDsM3gfCg9XBr/xcKKM=;
 b=Uruyu5fu2ZJmxeNgOgYRmCs2M8KtcqbOJujRxyhspuRRHS0dgCj3nBUwyNA/rukCdOxc3jtTHG/eM6M8I+bn5pM9g5YfMWsHFm5MCleVb3nmmfiM4asdi6n9NXVC+IxqEbE3uXX1x3KIs0MwkWsj3g812LsHK1slGd/8fyhweUC/IsWFI8xVLw6B3GSCfwcirlYJmRGnZmcGqA8P8flQnww+w71iuCMDSsAMR47ZeYfJFtUya1jEW7K/icrcnpGaXozKa2YutQ6QK4dL2xceWAaXH87cgRg5fc+L+n8i6vqc4ueBhZlZZWxBk0RY7vA1wfVvfU3f8rcuZ3SWdCc7bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SDzR1YJX/ISKo3jd7uM1/ziFDsM3gfCg9XBr/xcKKM=;
 b=AKUD7bHxdYfcFve9YOOCJeOzePygHx05pZ8r7FqblKleO7ieSR8LTw+NgTxbG0puIIlxj3I4gKWXBNnrURqBKFvg6yz9tZ+BSawMloNh74uPfCMCzPTNXJAP6kiUGJArQ56WJcJWU3c19Dlo4vU3NKrMazqoPBIxP8vVMmgb44E=
Received: from DUZPR01CA0192.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::15) by DU5PR02MB10906.eurprd02.prod.outlook.com
 (2603:10a6:10:51b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 17:53:12 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::9c) by DUZPR01CA0192.outlook.office365.com
 (2603:10a6:10:4b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 17:53:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 17:53:12 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Mon, 8 Jun
 2026 19:53:10 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 8 Jun
 2026 19:53:10 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 8 Jun 2026 19:53:10 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 351FF1DCB
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Jun 2026 19:53:10 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 2E60112C4AC; Mon,  8 Jun 2026 19:53:10 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] archiver.bbclass: Add ARCHIVER_MIRROR_INCLUDE
Date: Mon, 8 Jun 2026 19:52:59 +0200
Message-ID: <20260608175259.3238900-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608175259.3238900-1-pkj@axis.com>
References: <20260608175259.3238900-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|DU5PR02MB10906:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8d15d4-0f51-4637-094d-08dec586cefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|13003099007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	EhUInc+WH1XO3+TqJpk+VEayY5Ax5tECuocyDqfaL0AzcjoAhR6Y65t+3LYlFnHrDCvxueWIFAWH5IBFrOkGweFPMgXSinXWt7jRmbtDpzfTM5smlerStzzHY6xEI6gGGOuag1KUf1XDtQFB72Zhzbf+MltpvIefYMgaMawyPGuE+hrl1yEuZc4bJEFiJAJd3/Wl68+ccj+XuNKmUm2nkV3lGOQ+hT6jhgq3A5r37jA0j4ac+MME6K0gUvF1Ai9OXuXnY84DW5fiLK1Rl+mLPtStVjP81FPxLHfCYI/wDkj5w7qqAoCmG5/Mv8DT1Xo+I4jAjTqVEfUXgCSPiYN5LPpewMlWY0M2iITee0Otky4WvOzTNK2ntCJpfuenW47hW9aGPmaqsWX+aVprZxzPHVZ3OC2kwmSrw7J4+A3sl2hqh1lLmUM7VnM11hIz66ki9PZRIk2+KYNalZsfDFpt1Z5ehMkjcVl4iYVa8n1OwGvjTeXWjvDLooyjH98NtuVaD+LivIu8q3IM5QiyaP7TYm2d5uo0qqwkh2hhsueThKD8XMvD2oN2BZPRSD/3aZk0GHTvRRoQq9LRZg2kRr6DPmqF41HfOLAUZy8WGxYEIvAVkYuqKsKb4uNtiZ4JlO7idJN7lzkhT5XUYAb5n7NGFo0d9BQxFOS22NslVmsNCsht6y4clabApj7ApOb5DWjX
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(13003099007)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7ARaco4qsHeVbmlrJmJNmpWcnAsOs7QtqwSsO9vDHUUo+vogxAwkpmRRgKtqumAoFQp2fdj35LBSM2WHOW8vjz9qYVHQaYzyBvN14k498CqFzn7Era3vBqiaWx4ip7erkXgsIUo0dojlAkxBNztQZO/2sAjI4/I1+T30tkOA9nk2cOII40oJzb81p7QpN400IPmEeP+03VtpGFk8XRzxBwmqxI9xUJnR6wFwifk9o997ZqFUhvbCiooTc+qhL0ez01p2ZtlItvNjJF7H2tEligTXjZpCfl03QqVX0ZRZck3+4X2fAPLKWwgD9ysxV+z7X5Ubm1Tny5iaeXmF7SnaNu7M2Zu48Do49Eixdn3/u1iwMBGj5F/5AiOSZ35KB3H1Mjqfg+yGclJsdvrRopY5BH/93a+3RdTl586785gCfyp++V+s9UymxpxYlx/IU/a4
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:53:12.1742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8d15d4-0f51-4637-094d-08dec586cefe
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10906
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 17:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238255

When using the archiver's mirror mode, ARCHIVER_MIRROR_INCLUDE contains
a list of URI prefixes to always include in the mirror. This may be
useful if recipes that are included in the mirror (due to their
licenses) depend on some recipe that otherwise would not be included in
the mirror, and that recipe uses files that are normally only available
on a private server.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/archiver.bbclass            | 37 ++++++++++++++++++++++--
 meta/lib/oeqa/selftest/cases/archiver.py | 24 +++++++++++++++
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index a3f8689b19..035d0dce0f 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -35,7 +35,13 @@
 #     ARCHIVER_MODE[mirror] =3D "combined": All sources are placed into a =
single
 #     directory suitable for direct use as a mirror. Duplicate sources are
 #     ignored.
-# 12) Source mirror exclusions:
+# 12) Source mirror inclusions:
+#     ARCHIVER_MIRROR_INCLUDE is a list of URI prefixes to always include =
in
+#     the mirror. This may be useful if recipes that are included in the m=
irror
+#     (due to their licenses) depend on some recipe that otherwise would n=
ot be
+#     included in the mirror, and that recipe uses files that are normally=
 only
+#     available on a private server.
+# 13) Source mirror exclusions:
 #     ARCHIVER_MIRROR_EXCLUDE is a list of prefixes to exclude from the mi=
rror.
 #     This may be used for sources which you are already publishing yourse=
lf
 #     (e.g. if the URI starts with 'https://mysite.com/' and your mirror i=
s
@@ -77,8 +83,9 @@ do_ar_original[dirs] =3D "${ARCHIVER_OUTDIR} ${ARCHIVER_W=
ORKDIR}"
 # This is a convenience for the shell script to use it
=20
 def include_package(d, pn):
-
-    included, reason =3D copyleft_should_include(d)
+    included, reason =3D archiver_should_include(d)
+    if not included:
+        included, reason =3D copyleft_should_include(d)
     if not included:
         bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))
         return False
@@ -99,6 +106,29 @@ def include_package(d, pn):
=20
     return True
=20
+def archiver_should_include(d):
+    ar_src =3D d.getVarFlag('ARCHIVER_MODE', 'src')
+    if ar_src =3D=3D "mirror":
+        src_uri =3D (d.getVar('SRC_URI') or '').split()
+        if len(src_uri) =3D=3D 0:
+            return False, None
+
+        mirror_inclusions =3D (d.getVar('ARCHIVER_MIRROR_INCLUDE') or '').=
split()
+
+        def is_included(url):
+            for prefix in mirror_inclusions:
+                if url.startswith(prefix):
+                    return True
+            return False
+
+        fetcher =3D bb.fetch2.Fetch(src_uri, d)
+
+        for ud in fetcher.expanded_urldata():
+            if is_included(ud.url):
+                return True, "URL matches ARCHIVER_MIRROR_INCLUDE"
+
+    return False, None
+
 python () {
     pn =3D d.getVar('PN')
     assume_provided =3D (d.getVar("ASSUME_PROVIDED") or "").split()
@@ -182,6 +212,7 @@ python () {
 do_ar_prepare[vardeps] +=3D " \
     ARCHIVER_MODE \
     ARCHIVER_MIRROR_EXCLUDE \
+    ARCHIVER_MIRROR_INCLUDE \
     COPYLEFT_LICENSE_EXCLUDE \
     COPYLEFT_LICENSE_INCLUDE \
     COPYLEFT_PN_EXCLUDE \
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selft=
est/cases/archiver.py
index 122d16b655..e9f178d5c9 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -261,6 +261,30 @@ class Archiver(OESelftestTestCase):
         archive_path =3D os.path.join(glob_result[0], target_file_name)
         self.assertFalse(os.path.exists(archive_path), 'Failed to exclude =
archive file %s' % (target_file_name))
=20
+    def test_archiver_mode_mirror_include(self):
+        """
+        Test that `ARCHIVER_MIRROR_INCLUDE` causes a source URL to be incl=
uded
+        in the mirror even when the recipe would otherwise be excluded by =
the
+        copyleft license filter.
+        """
+
+        target =3D 'selftest-ed'
+        target_file_name =3D 'ed-1.21.1.tar.lz'
+
+        features =3D 'INHERIT +=3D "archiver"\n'
+        features +=3D 'ARCHIVER_MODE[src] =3D "mirror"\n'
+        features +=3D 'ARCHIVER_MODE[mirror] =3D "combined"\n'
+        features +=3D 'BB_GENERATE_MIRROR_TARBALLS =3D "1"\n'
+        features +=3D 'COPYLEFT_LICENSE_INCLUDE =3D "CLOSED"\n'
+        features +=3D 'ARCHIVER_MIRROR_INCLUDE =3D "${GNU_MIRROR}"\n'
+        self.write_config(features)
+
+        bitbake('-c deploy_archives %s' % (target))
+
+        bb_vars =3D get_bb_vars(['DEPLOY_DIR_SRC'])
+        target_path =3D os.path.join(bb_vars['DEPLOY_DIR_SRC'], 'mirror', =
target_file_name)
+        self.assertTrue(os.path.exists(target_path), 'Missing archive file=
 %s' % (target_file_name))
+
     def test_archiver_mode_mirror_combined(self):
         """
         Test that the archiver works with `ARCHIVER_MODE[src] =3D "mirror"=
`

