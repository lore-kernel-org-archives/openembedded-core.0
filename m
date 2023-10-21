Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E36C07545
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 15:51:47 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.60])
 by mx.groups.io with SMTP id smtpd.web11.81900.1697903498558281721
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 08:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=cjIkhOUC;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.247.60, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhlLkcZ0WiMgtt1gCT7owKCcEVeaOo5EQul2epwyimXgQprzkoYKhPvOKcZ6qm0UDmfNoQgQDy+gax/xv0xK/24QXNAPyWX0sDA6QctfB06I11hI7EyD/wTlM6JtjKjKy5eOibs5WzUEJJIzRUoX4A+1zDYYqEInfoYH5XsXwilDbO9nlgEh/UZOXRu7v1Ccpvilgtaj3PoECr0wKAmVugSBA5v9k5uUoBdCvo1m/1qf0vLed6KQrT34mABpbymevuBLgyNtXA53ZK2xkumJRWsT/lTghRXZSyvuS+f7L5lR9THlqEsI4fZKLSWKrbyuxTrR6qaliNsm27N7v5nJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GTAgSo0bf24wVqh+rk/z/iZBJQxR9/i+10+SvMI3Ww=;
 b=jwxy3N90wtZJYXrbvkbhH+y1k5y5xmb563fEYRyFkv8hZtBfR+uHMjTt55ZEXGQicx3kg64+0Txzi2wMg/MfsbUcN8G6gZ7osRLLQ61KLUDciMnL6zyRi9uywICfs+W203ChW0m4MTmGC+QkiRXvlslafTqs9OJgHzyGTplPmgxgWIbwyz9I+9vShvqEgYcr5vCBVeOlQI9TBJdu5gpGEPsO6nIduyVLtG7mAHbGLmpAPYv7b59raf4C3D1ot+MnDgZaHG+l5Afy4ROCfiGb0D9MtmjsO1gqUNvakQCJsbv2TrQWXPGRFFg1XKI8cWq8heOWutBoXurhSWwiUgtv5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GTAgSo0bf24wVqh+rk/z/iZBJQxR9/i+10+SvMI3Ww=;
 b=cjIkhOUC5057Lg34U6N+pxxpOK4NQ29MurMUGYAkB9dFSjYT1nmON0X8SkIbxINlw8+eRsfPvlxMOHttSgz7vYGbCEWAEmMnuIwsN+EFU+eU/4CVeUXeowt1OSlfaLrj0XYHHkgqdbkWxYS72xiDeU/SFlgje2STxHwMMDZF8EKUYKOHJK+KBTw++MpqHU9U6pifv4QUULCQdrxk3BYU72J2ia+NdG1eWMu/jLEkPMUfQ8zN34fxwerIq+0feMgaSfBJFYiFE4f0gEk5L3cC6jfWL/GksqhYJo4gNW4KLgjChWVCFeAF2xyyImwSq03gE4fbEi5X26pADW4n0zv4Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB6892.eurprd06.prod.outlook.com (2603:10a6:102:8a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Sat, 21 Oct
 2023 15:51:35 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9%4]) with mapi id 15.20.6907.025; Sat, 21 Oct 2023
 15:51:35 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCHv2 1/4] package_rpm.bbclass: Fix some pycodestyle issues
Date: Sat, 21 Oct 2023 15:51:11 +0000
Message-ID: <20231021155114.3979864-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF000013D2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::f) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: ad7c1247-f065-49e9-50d8-08dbd24d9a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1egr1nzouiIIZzK8xKbhZp/HbRzQP0xkgcV1oyWDFkyvNoE9+WGU/OxoTYjpv0SOdIUgE6JLIKIffvGHzJzFir6uiO3kpozNcznDJaUQ0pWAxd/t0Hlahusykxhay0H4OJFeRN1cbnQ75NU28o03+jdNqkLfyuXbvp4/sE6peLoduvn7lSH9sQNk9ffp1VIhliVEWcU+dsImWbzdiOZQ87OJGVZTaFAru0tW8EZVaZUfJ0q4beW+DdqBc8kWY/jnrmSOR3bhQXsilGW+4wCvkfKs+evAAIMvi0OEO8G5s7mMFy+hFtJ/k49bAad0QfgFpbO11+agT3g156dHuGu2ITCdl/u1CNCk6n2hskDkcfGOVo/T3qcKqYAOr4kYZb8BueMNgs5fTtAKiMi4/Y+9TkpetTWM7PGAceuAkVDVM6oW0fAXv3UCKzDglKZlZMBM+UgLaPYrTLV1OX8l2idwYbr/6JMBcd8hk/KzjlE3REkKfXhVF/TWPQ1UX8mryt5cmfLvD+KkyKuHM/n7TrB6LusY/ln15KfyZFeU7SMqWmQrsrQjLjJ2MNRZGQLvvFK8QAAC+kXwhW/PmZty/pvezwj2SlHcX1A3Y1WyEpKiDTu1t+EYe6Uh9jDDZ8rUsDb5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39850400004)(346002)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(1076003)(107886003)(9686003)(6506007)(6666004)(6512007)(52116002)(26005)(2616005)(83380400001)(8936002)(41300700001)(5660300002)(8676002)(4326008)(2906002)(478600001)(6486002)(66946007)(6916009)(66556008)(316002)(66476007)(86362001)(38100700002)(36756003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w2J5OlVA8bmyHJm5K0KnMnyd1rvYA8kf8Ge98gn3iYGHAn68Kx8O5TMlqOi4?=
 =?us-ascii?Q?JkAE1/J4aBVZjErwAgy4PHgX+2l/kYF8nTR2S2r3hhd4pSIRkXOUI6nBrSm3?=
 =?us-ascii?Q?BIzVCiObf1WPhDdfA1GDKKOEkYn90t7giJ/5aMfoEPJOQV28zmVdiOau3xEt?=
 =?us-ascii?Q?MyEab/5zpId2IE0ZO60IyzfC8dDY8ywQdTrBzPePSiSoTDA4T6/Baa0/H91L?=
 =?us-ascii?Q?TE0iB3Eq23W8AEOHOWMNT5IWVKoRLCgnOUVpsjpoegOOO1NpsUEOXiN0HGhZ?=
 =?us-ascii?Q?P8xIHnWg2M2/nbKkAe9LbTrTKLtwmOYuBvhl2CnFrrJXqA6vt0Y3UGOqtIyG?=
 =?us-ascii?Q?UfHWmd9VG0PcMkhlfvQ7aYAftX7lJKkZ2rxebKVjAnLr5HI+vi7cg6GbGCly?=
 =?us-ascii?Q?M0BuOxZ07SH3REr915Ni+3qisFNCkGlKdXa+t6XSXA1UaGLQxlQkZOkmHIul?=
 =?us-ascii?Q?wpVAHdzJFj0cbkrg+Y1iSFmUZc4lGh/+GNvFjGQzj7i+Lh6Crj86UH+zr51X?=
 =?us-ascii?Q?I2ZXw5p6Fv1COox5wnInvYwvET6govY/XzCeDA6TeSUf/cI8sqK71VUFePjS?=
 =?us-ascii?Q?DNWb5IJ97amIiehuTsLXlWWU0DRnaxz2cIkR+VA/eo51ozsopH3qWxNLcJPi?=
 =?us-ascii?Q?kDHiyY7hldW/c3nNDd6njy+N6AKdy3pFdG4F2BNw+4QrYBKc6Mro3dXyudBk?=
 =?us-ascii?Q?DKLwWCGD87LmTLbjWqPGutblpyOLt3tQTJaECvCXgbFPZHFiZYlaVftiZve0?=
 =?us-ascii?Q?Nb/9PJEX/52FAURD71GWyyJr36J5wsdaol3Ht0ZP/Y+PAvraScJqmJthyEH1?=
 =?us-ascii?Q?iIRjC+XQsmc82nokmO344mVMsmfKOJiGWWQRYPsk4CoP6y96G+u6zdQaPVo0?=
 =?us-ascii?Q?+7VLPZ2VLoKGfg3CY9HJPd4TV3cWZvxRl9eneKZp0cQdjWOE7H+thgW5GQZX?=
 =?us-ascii?Q?tsk6eBNyrBCVvhy3ZOOAzCyc6EoiiKyrAA0gOSh5fM1FLSEyYLscd/sO2hPR?=
 =?us-ascii?Q?0+iQ38ZAHhsmE0zzaXJGN5fQe/Y3Ipi33FT4PQyZiDvBW1X1rmEmnV7+LhsA?=
 =?us-ascii?Q?y+t6zJNDWPq4X6sYtLvrnY8CKhstPZ3E7H3YJ4Q1bl8G5lMHeOdSNLS9qZuJ?=
 =?us-ascii?Q?SERifpwIGnyQqQUn1Ufzix9ksT+PWX78/bOdpdnoldb+GHZHRhjxkrvDetGv?=
 =?us-ascii?Q?QchNRBWbINqSjlnMkrS5yxShJBieO2RQzfFXxoM9n3MpIUQeHlx4BMTfPk78?=
 =?us-ascii?Q?s6B50fPuDbbrQlS/dBs/EzN1NSnxL9g/4OZUJmwO/3s61OllVGmn2BnMamYI?=
 =?us-ascii?Q?JSksff/LPNCkz778UcLGqtb6iT8LA49ZpvAR95Mx5A0+7Q1A9cT5F9v8OkHU?=
 =?us-ascii?Q?P5p7hEmYXfChL4sPA3x/7qjTE76wqOfQEV78uDE5JWpfDodCkpA5KfMNow0u?=
 =?us-ascii?Q?Wi6li+ByGqSnVjtROv2MMgXv7H330RLELPkgrp5r+uYCQG7/UpBLyLAAyK+v?=
 =?us-ascii?Q?k6cEzCkZz5r/c4Zhrvbbtjszjm0cslCzCwLVCU/3y8/eYLvINcDEItNtbVut?=
 =?us-ascii?Q?2rq37GNxvVAUm69CDoBLSwEQ8TwVe9Zk4aMkrXo8yS+RRNOkHJRN754FtZMK?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7c1247-f065-49e9-50d8-08dbd24d9a97
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2023 15:51:35.2705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J44PRYy1cKFOdNtQfwAifaMJn1l5t6p5MGDXo873vYNnvsJGiTBbjOx1wNalXMhVFM5M94dOdZwsl3XaCmubEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6892
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 15:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189594

From: Niko Mauno <niko.mauno@vaisala.com>

Fix following subset of observations reported by version 2.10.0 of
pycodestyle utility:

  meta/classes-global/package_rpm.bbclass:65:46: E231 missing whitespace af=
ter ','
  meta/classes-global/package_rpm.bbclass:66:46: E231 missing whitespace af=
ter ','
  meta/classes-global/package_rpm.bbclass:107:19: E231 missing whitespace a=
fter ','
  meta/classes-global/package_rpm.bbclass:109:69: E202 whitespace before ')=
'
  meta/classes-global/package_rpm.bbclass:122:103: W291 trailing whitespace
  meta/classes-global/package_rpm.bbclass:194:74: W291 trailing whitespace
  meta/classes-global/package_rpm.bbclass:448:16: E713 test for membership =
should be 'not in'
  meta/classes-global/package_rpm.bbclass:450:16: E713 test for membership =
should be 'not in'
  meta/classes-global/package_rpm.bbclass:520:1: W293 blank line contains w=
hitespace
  meta/classes-global/package_rpm.bbclass:521:15: E231 missing whitespace a=
fter ','
  meta/classes-global/package_rpm.bbclass:542:12: E713 test for membership =
should be 'not in'
  meta/classes-global/package_rpm.bbclass:544:12: E713 test for membership =
should be 'not in'
  meta/classes-global/package_rpm.bbclass:647:67: W291 trailing whitespace

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-global/package_rpm.bbclass | 26 ++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/=
package_rpm.bbclass
index 85d0bd7fce..992446a033 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -62,8 +62,8 @@ def write_rpm_perfiledata(srcname, d):
                 for dep in depends_dict:
                     ver =3D depends_dict[dep]
                     if dep and ver:
-                        ver =3D ver.replace("(","")
-                        ver =3D ver.replace(")","")
+                        ver =3D ver.replace("(", "")
+                        ver =3D ver.replace(")", "")
                         outfile.write(dep + " " + ver + " ")
                     else:
                         outfile.write(dep + " ")
@@ -104,9 +104,9 @@ python write_specfile () {
     import oe.packagedata
=20
     # append information for logs and patches to %prep
-    def add_prep(d,spec_files_bottom):
+    def add_prep(d, spec_files_bottom):
         if d.getVarFlag('ARCHIVER_MODE', 'srpm') =3D=3D '1' and bb.data.in=
herits_class('archiver', d):
-            spec_files_bottom.append('%%prep -n %s' % d.getVar('PN') )
+            spec_files_bottom.append('%%prep -n %s' % d.getVar('PN'))
             spec_files_bottom.append('%s' % "echo \"include logs and patch=
es, Please check them in SOURCES\"")
             spec_files_bottom.append('')
=20
@@ -119,7 +119,7 @@ python write_specfile () {
             source_list =3D os.listdir(ar_outdir)
             source_number =3D 0
             for source in source_list:
-                # do_deploy_archives may have already run (from sstate) me=
aning a .src.rpm may already=20
+                # do_deploy_archives may have already run (from sstate) me=
aning a .src.rpm may already
                 # exist in ARCHIVER_OUTDIR so skip if present.
                 if source.endswith(".src.rpm"):
                     continue
@@ -191,7 +191,7 @@ python write_specfile () {
=20
     def walk_files(walkpath, target, conffiles, dirfiles):
         # We can race against the ipk/deb backends which create CONTROL or=
 DEBIAN directories
-        # when packaging. We just ignore these files which are created in=
=20
+        # when packaging. We just ignore these files which are created in
         # packages-split/ and not package/
         # We have the odd situation where the CONTROL/DEBIAN directory can=
 be removed in the middle of
         # of the walk, the isdir() test would then fail and the walk code =
would assume its a file
@@ -445,9 +445,9 @@ python write_specfile () {
         rprovides =3D bb.utils.explode_dep_versions2(splitrprovides)
         rreplaces =3D bb.utils.explode_dep_versions2(splitrreplaces)
         for dep in rreplaces:
-            if not dep in robsoletes:
+            if dep not in robsoletes:
                 robsoletes[dep] =3D rreplaces[dep]
-            if not dep in rprovides:
+            if dep not in rprovides:
                 rprovides[dep] =3D rreplaces[dep]
         splitrobsoletes =3D bb.utils.join_deps(robsoletes, commasep=3DFals=
e)
         splitrprovides =3D bb.utils.join_deps(rprovides, commasep=3DFalse)
@@ -517,8 +517,8 @@ python write_specfile () {
             spec_files_bottom.append('')
=20
         del localdata
-   =20
-    add_prep(d,spec_files_bottom)
+
+    add_prep(d, spec_files_bottom)
     spec_preamble_top.append('Summary: %s' % srcsummary)
     spec_preamble_top.append('Name: %s' % srcname)
     spec_preamble_top.append('Version: %s' % srcversion)
@@ -539,9 +539,9 @@ python write_specfile () {
     rprovides =3D bb.utils.explode_dep_versions2(srcrprovides)
     rreplaces =3D bb.utils.explode_dep_versions2(srcrreplaces)
     for dep in rreplaces:
-        if not dep in robsoletes:
+        if dep not in robsoletes:
             robsoletes[dep] =3D rreplaces[dep]
-        if not dep in rprovides:
+        if dep not in rprovides:
             rprovides[dep] =3D rreplaces[dep]
     srcrobsoletes =3D bb.utils.join_deps(robsoletes, commasep=3DFalse)
     srcrprovides =3D bb.utils.join_deps(rprovides, commasep=3DFalse)
@@ -644,7 +644,7 @@ python do_package_rpm () {
         return
=20
     # Construct the spec file...
-    # If the spec file already exist, and has not been stored into=20
+    # If the spec file already exist, and has not been stored into
     # pseudo's files.db, it maybe cause rpmbuild src.rpm fail,
     # so remove it before doing rpmbuild src.rpm.
     srcname    =3D d.getVar('PN')
--=20
2.39.2


