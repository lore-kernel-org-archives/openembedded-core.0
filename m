Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48482CD8C9F
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 17:53:26 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60944.1780941199980528318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 10:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Q9YkEg6F;
 spf=pass (domain: axis.com, ip: 40.107.130.32, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ivc0i6TaUdbvQCHdkyXoWWGUV5t0Smys8DbqdKmB63izCuguc1YQldzBHmYdmCVLcDr4JEk/No1NR9f+KHxE245J4SmQTotkoU2oInNVX8Q+cXnDIAdKbpMkwFw1UxbfvZq886dU5TlbjZ57ILS9L/ytOPTBJTT5ixdYBwzuUE2dgjGproQyJclCcuJPn1W7Bvw6nmpS2Nda5viJNpkpWgdh+r+jUVKE5AHUdZ+i8QSBS4B5ZMQNHhqQe1Dcc+JG2WavvcHLMXH+44AVNM9WK5TsC8cEXI1QiwnWUBTUwAx6TOw2kGn0nnD4u10yb58vn+xxrtgVHESRCs88iLbdOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZtJGEkIZSUGKbsUA8K7478+OWBrY1K+vozAnz9u4Zs=;
 b=H0IUMa4yunSgaEsnby1mDW+fMvSVfeSeWfREfDd5KYaGoXU1nKS2RWt6GCdzja3DKEKBUh4GvSJMY8TyZJ3q8S9dZwIFhsYtyGGxwxC76pS8t63K0uuDhw4MSJqttIQ2OJBj/EQGequS6SrJlzJlirrxE6azrlp/U0605HtY0ql1AeYPZilPgMco2HyOhZdACAWfo3490SpENR7deTBpiCBPxPKszRVwih2A1Ii+qfaImQK3s3Dw7F2r8EbDn+EijRFmSkt9/+G+AmUs9lTiPNaaA1xFH0uikK6zq0eTyxBCtRHe4LhhRNCkvpIrDnDrQhsvxFHJJhzB9CX0aVj+8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZtJGEkIZSUGKbsUA8K7478+OWBrY1K+vozAnz9u4Zs=;
 b=Q9YkEg6FhkVQEkMkm80l1RRfwcgmU2YzvnFj1OF1OltKHToaX/yQ2igbBrtDzxwweUgU4iIltk/Y0m4LpcZYrn+1pCQyOAHROIiS/5aYbp9uXIdwzcWDNTBVBDa9LG0zRE4Re6Upz2McTI+Tx2mgLzGP2rNUsccOwzf9NdOmB2Y=
Received: from DUZPR01CA0207.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::9) by VI0PR02MB11116.eurprd02.prod.outlook.com
 (2603:10a6:800:25a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Mon, 8 Jun 2026
 17:53:11 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::2e) by DUZPR01CA0207.outlook.office365.com
 (2603:10a6:10:4b6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 17:53:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 17:53:11 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 8 Jun
 2026 19:53:10 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 8 Jun 2026 19:53:10 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 33F001D47
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Jun 2026 19:53:10 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 2ADFC12C4F1; Mon,  8 Jun 2026 19:53:10 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] archiver.bbclass: Properly remove artifacts when configuration changes
Date: Mon, 8 Jun 2026 19:52:57 +0200
Message-ID: <20260608175259.3238900-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|VI0PR02MB11116:EE_
X-MS-Office365-Filtering-Correlation-Id: 9307265f-5b80-449b-eab0-08dec586ceb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|6133799003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	llbqBi5ihy9lAwLkivSbybeCtTRtmHjfHWdm2pzlovcNQj34jEQCQDtLTxbsG+M4b0rDWix2zy+Mv8AVcde5DKbkpw3etNVmHatyLT6GQvxwx3Sk5rwiuFKUxrrakLcSRYzcmMOqzy0lVZiZxaYiyHSKneKSiVjuVbSZWZBjSkdbizfz46UFVILK4nub+iZ7oMUXTzgU5FgQvn0BSkAY+6u6YTBr5li2u90S0QdGxc/Rmev+8Vesg9IhuJle+Aclknk5IJCDQeRlVBymxVbTyQ6Qr3mu5QZzIla77JsWj6oeg+IyPlUXQbP92J+QcQU9lpQ8w17Jv0yWh1UIxPe0A6MQQjhbbd95C/s2A0zhPEgOMawbJI6cvZtF0qol7qpnVvVzdSYTyYB4kagsvVcXz3Y8GVdkNZscc0xLC8xEWbM3iY7CysfT6NML7zW2m/JP1XKldTxb+Y9jLYOva8rpAR9L1QnqZ9PzfiUhEDD4bZDo8vHaOcFRZfkNczR0+2yDmDxL0VbqLi3PTy2Z0wUwB6a/PyW6puOiCvF89+r9K5c85IHHuTJInX3D8XduZ9FCwOwIVJcNdBhk5LmlPjRp4iPHPzOOlU3SVxGUs6eIR4HbpWcWnK46ylONPRFiHvC1TZW+WskVDDOFq0KMeem4qlOyA9eyHtdyoNIm/DHFrWs9VboFlq1le8BD53894HZm0Smq/BLyWWep3lD3mrcCZp4vlv6vIMyZDjB6bxqBbbA=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(6133799003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qdVEcECQy2GhCTlVQYFoJUXVTMo0pz3Y/XkE0pZAPSX1q+cXI63b+A0TMfL+C0hf5Fnn2wL4TTJu++hV4xfrnK0ljWmQb+9131a6dvkD01yl3WVs8LJo+8+FmFYWTP377lf/XT5zFeA5PnmrpeDt6DpAkVh2zEoFrGKdErdJFvGofxphnDVVCK1qslDA73qkUVMq6R0doJkaKJT7A+ZRtUY8RzXZhC3d6eoA2k1XPcWkG0JF1gZALf2/zGNcIKUuKKuyKZzBUlAJy1NHaonznpp7gdmvwg7AggJmb7XIJJDzW5mTXoAzc/SuQy93HDUqoz7HLZK9zsGWtI6Odst8ToFIBT0Lr1/LoJhLtLcpB27pCr35A0a7glpcVtRd4MztHHOvs+HMVOpz/gnD4QpL6kMVGZ8DrdyRWxouFLL9g2eD2GKJF6uVUH+OdMKw1k4b
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:53:11.6814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9307265f-5b80-449b-eab0-08dec586ceb2
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 17:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238256

Before, the different archiver tasks that produce artifacts would just
add to the common output directory. This meant that changing how the
archiver is configured would just add more artifacts, but never remove
any. E.g., if "dumpdata" was enabled, it would add the environment data
for each built recipe to the artifacts. However, if it was then
disabled, all the generated artifacts would remain until each recipe was
manually cleaned, or the entire tmp directory was removed.

This adds a task that cleans the output directory if needed. It is a
separate task that all the other archiver tasks depend on because they
all write to the same output directory so it must only be cleaned once.
This also means it has to depend on all variables that affect any of
the other tasks.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/archiver.bbclass            | 27 +++++++++++++----
 meta/lib/oeqa/selftest/cases/archiver.py | 38 ++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 1f1ee45bd7..a3f8689b19 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -179,6 +179,20 @@ python () {
                 d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do=
_ar_configured' % pn)
 }
=20
+do_ar_prepare[vardeps] +=3D " \
+    ARCHIVER_MODE \
+    ARCHIVER_MIRROR_EXCLUDE \
+    COPYLEFT_LICENSE_EXCLUDE \
+    COPYLEFT_LICENSE_INCLUDE \
+    COPYLEFT_PN_EXCLUDE \
+    COPYLEFT_PN_INCLUDE \
+    COPYLEFT_RECIPE_TYPES \
+"
+do_ar_prepare[cleandirs] =3D "${ARCHIVER_TOPDIR}"
+do_ar_prepare() {
+	:
+}
+
 # Take all the sources for a recipe and put them in WORKDIR/archiver-work/=
.
 # Files in SRC_URI are copied directly, anything that's a directory
 # (e.g. git repositories) is "unpacked" and then put into a tarball.
@@ -609,14 +623,15 @@ do_deploy_archives[sstate-inputdirs] =3D "${ARCHIVER_=
TOPDIR}"
 do_deploy_archives[sstate-outputdirs] =3D "${DEPLOY_DIR_SRC}"
 addtask do_deploy_archives_setscene
=20
-addtask do_ar_original after do_unpack
-addtask do_unpack_and_patch after do_patch do_preconfigure
+addtask do_ar_prepare
+addtask do_ar_original after do_unpack do_ar_prepare
+addtask do_unpack_and_patch after do_patch do_preconfigure do_ar_prepare
 addtask do_ar_patched after do_unpack_and_patch
 addtask do_ar_configured after do_unpack_and_patch
-addtask do_ar_mirror after do_fetch
-addtask do_dumpdata
-addtask do_ar_recipe
-addtask do_deploy_archives
+addtask do_ar_mirror after do_fetch do_ar_prepare
+addtask do_dumpdata after do_ar_prepare
+addtask do_ar_recipe after do_ar_prepare
+addtask do_deploy_archives after do_ar_prepare
 do_build[recrdeptask] +=3D "do_deploy_archives"
 do_rootfs[recrdeptask] +=3D "do_deploy_archives"
 do_populate_sdk[recrdeptask] +=3D "do_deploy_archives"
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selft=
est/cases/archiver.py
index 82b0293338..872504808a 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -343,3 +343,41 @@ class Archiver(OESelftestTestCase):
         ]:
             target_path =3D os.path.join(bb_vars['DEPLOY_DIR_SRC'], 'mirro=
r', target_file_name)
             self.assertTrue(os.path.exists(target_path))
+
+    def test_archiver_cleanup(self):
+        """
+        Test that the archiver removes no longer needed artifacts when its
+        configuration is modified.
+        """
+
+        target =3D 'selftest-ed-native'
+        target_file_name =3D 'selftest-ed-native-1.21.1-r0-showdata.dump'
+
+        def assert_dumpdata_present(expect_present):
+            bb_vars =3D get_bb_vars(['DEPLOY_DIR_SRC', 'BUILD_SYS'])
+            glob_str =3D os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['=
BUILD_SYS'], '%s-*' % target)
+            glob_result =3D glob.glob(glob_str)
+            self.assertTrue(glob_result, 'Missing archiver directory for %=
s' % target)
+
+            archive_path =3D os.path.join(glob_result[0], target_file_name=
)
+            if expect_present:
+                self.assertTrue(os.path.exists(archive_path),
+                                'Missing archive file %s' % target_file_na=
me)
+            else:
+                self.assertFalse(os.path.exists(archive_path),
+                                 'Unexpected archive file %s' % target_fil=
e_name)
+
+        features =3D 'INHERIT +=3D "archiver"\n'
+        self.write_config(features)
+        bitbake('-c deploy_archives %s -f' % target)
+        assert_dumpdata_present(False)
+
+        features +=3D 'ARCHIVER_MODE[dumpdata] =3D "1"\n'
+        self.write_config(features)
+        bitbake('-c deploy_archives %s -f' % target)
+        assert_dumpdata_present(True)
+
+        features =3D 'INHERIT +=3D "archiver"\n'
+        self.write_config(features)
+        bitbake('-c deploy_archives %s -f' % target)
+        assert_dumpdata_present(False)

