Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7768EC00A98
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:45:38 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.81])
 by mx.groups.io with SMTP id smtpd.web10.53230.1697805927092307722
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 05:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=snQlcoLv;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.8.81, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GD33Kg8POrTKKLtd8v9yj6lcHU+6h2HUld2nr9nqZdI55BIhNmg7W0Zx2k0sx0bnub46ctJBv7FFR5uhawYYpCGAJm5+E1XAoi+sienSbG4YQUFsTHlZT6f9XXVpd9pwWoZAWOt37WZP/aM7awPbq2+KfDzZC2Ti7BQSR4puqFUBJbliiCgZQZfuw8NvpTIgwwavfIIPrOujl04K2iQ1KKNphX9ZEMzsVjPYoq8hDoUAqJ/eVCacy6CoRwrRkLS7QpO6yhUlxbfSp3AprTaE1hymvM2OPsWlaO+fbYyigicn0SM6xZXK3TtzxbdJ7p9DItcZrEIMuW57g91QkSy8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GTAgSo0bf24wVqh+rk/z/iZBJQxR9/i+10+SvMI3Ww=;
 b=FHaqps9uvZzfptcZuTnfVPDZ4doR6SGh/i7AT+4pG3VdSQdx+opTuUiqiMM981HQPbsTCvM5lJsUimTQwpmg4HoFe7+ZVsb6eT4MCAiXwLgxGfZLJIMiu6j1xWNRdN8Kh+u84VxizSaDf3ohycJTJBAz+kEYE3EKfSSiuQUt+GSTofiM932prjtjLJ5g584ccB6QRP34nKBTu01qFie0D0CNPPD/wazNIPQicyTFW3l2pmy78DwfBJ8l2jRwwwqRNvNlOFU5h/8p9ytYNMjJXKiafFhez5Iv3kpcussTKUugjRbVBtGeQdSvSPVA9mnaISPykGW4xIzF92j7zP1DmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GTAgSo0bf24wVqh+rk/z/iZBJQxR9/i+10+SvMI3Ww=;
 b=snQlcoLvPEvGBmGt6NL5vyCYHAtDuRSvnF63PCc8WsMYJ5HYc2o1AgBUfJs8XPNft2J38Ye03WFeH46I1XMo1X0DU0vlxlYZfyYEsDYnHdc2UKN4+rfWiaBuLPfaMvW9heWuRvl/R7Jy2ndnCn7q5ZYYBMRcluFpPXPsp4h37kxPQCUmGxh2LBP+UBDdMgh7e9FwN5sPoeemWDOqpQERS+rOqw7pe2D5T1TU0i/kjR1+YwxKSQHx3cujgA6af3dQF6TaROoBI8x7V8K92fzF7sHHt+5uRCfMSFiQo+SDiJ92O/AZs3X91dvADm/3HJa205E46+FlNgvCJgT5f1ZLUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB7515.eurprd06.prod.outlook.com (2603:10a6:10:260::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Fri, 20 Oct
 2023 12:45:22 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::cf3a:acd1:fc53:af3c]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::cf3a:acd1:fc53:af3c%5]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 12:45:22 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/4] package_rpm.bbclass: Fix some pycodestyle issues
Date: Fri, 20 Oct 2023 12:44:47 +0000
Message-ID: <20231020124450.9736-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0033.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::27) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9454c2-b920-452d-220a-08dbd16a6c77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nqtd6wq53L9B065NkSopU2NB4uyLvE2Qcy6fizQzrrx4KSIpiTBrJlvzKExhpXJfX99NxUnGvnSMPdaw3GDaWsGzgFpVc0L5uhb9hshBDRKOXhEbvQ9amFFnuutJ6GNUuu+jHTF6Xo/WCMYm707X1UfRnsg5lzGgTRKzHUvBNQ0Vht8AiMdBA5Y0aL9iYRRdk6+cJjIqiPtwwDHpfsRYmFptp0UXAjRn6HSIc13mSMlzwEp+eFR9YuNmXPUblk9RuRKs7YHcmEC+Uho1c42ueZArywYd6zJzdw8BK/SSt1tRy6iwh9UjAucuJ70s2Ks2+4XdBmm3zzXAdtWmes9mI7kFrFF3FIuFFBqyTkXubBAZi1qCVSwz9OAaIVQXQvKWGuMm7PnCTRoMS0qLHhPTBP+XbP9llXoAySjKZIKk7K4HpfgK6nP/g8JyiYkSHZj43+B1yx2ibRdmDY6OYCNgehXT+10uDayT2VXPS2hX/HNT3UB4UiMl2nqCuvVJm1idKjeG1U6ArE7bPzhvxMTMzp1xhO9u85QL9WtVCxAdjtZK4ucEwJCMMGBnu8BXQFRLfQIvMTx1iqTMkXAGOefaQbAXXudVE/bNarigeUcoObpMMPFAlyTrqHQmD50rpk+M
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(136003)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(41300700001)(83380400001)(38100700002)(107886003)(9686003)(6512007)(2616005)(36756003)(1076003)(2906002)(5660300002)(6916009)(66476007)(86362001)(8936002)(66946007)(8676002)(4326008)(66556008)(316002)(478600001)(52116002)(6506007)(6666004)(6486002)(26005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kq5Vqx939tQ3Fo2wwfJbr4Q4pbvTWWsr7YO2vxVrjwWiH8ARCRwgO/58zHRe?=
 =?us-ascii?Q?3BRS2WHVIsDH6vqTS4sCoaoll1xj2VVM5d+k+UtIgDx7JThgJX4Rvxdv6U7/?=
 =?us-ascii?Q?xk1ldKGWe7ZgjAwexArgxgnGUfYKRCxl/FWxOnRuw+s6j/7Y05BHZR+1R+u9?=
 =?us-ascii?Q?hoK26QQDFdnNFgiYOptifVTMBTyVKrtsdvuEevReV9lbFU3rvBtld40uhc+1?=
 =?us-ascii?Q?riN2yVfRQ5gZYV9+y7J9mCacbepDD25JOzB9BsyPlabcaCOz2F+UKM1ipbkF?=
 =?us-ascii?Q?QVDQoL2AY3XNXO5CCt6uedBKO5DSMnFj8Vs+VCvRaikebDPLMHn/bctCW2pn?=
 =?us-ascii?Q?8JozHhBzQL2sdBNdvmAYqfCs50h0MqP6oamPweOBgnX6uno1rUVYL8ZC/5K2?=
 =?us-ascii?Q?BcUJ1BPqQ95aOd7N2jhaM7UMHPXN/5Ns/J9nhuehAFM6PTdV3r3+qdX2vNsm?=
 =?us-ascii?Q?KmLsO7p1vw5cXZdtj+k31miTcAz9mSaC7Y/vcU+zJoKCGAYV69SmTmwTOEoG?=
 =?us-ascii?Q?YdxxkCpk4QqNUnsbj5USn0jOmZcRhuzQihGaHVKooRt8q9NwqFGqIvnRR8Rh?=
 =?us-ascii?Q?r80tINxs+wAI42OBiaotW7NaUJBrD+CIHJKW38jBgUGqeJMsQNdvDZGp+m2x?=
 =?us-ascii?Q?zlD+y0qaAn+3ktRRR2l+q3+lWJV9v+ounx6+XqSEOvm5IHbGDTyGZRxT+oPC?=
 =?us-ascii?Q?333o20plfNGixIdc0x7tA8NjcoZIkTXvvW5Hfr/beoM7YcxrLSJcxxdSVYBP?=
 =?us-ascii?Q?w/mgRNqpMbIX8cakXFDhX4LcZ3t3uSTGJPEMZ663+carq3Dv8/vFSFqRHCxu?=
 =?us-ascii?Q?AB1hcqD+9s9HZmfQgRlS/m73QeBVlHzX8YOSVUxsgo5QkAMjzKGMv0XdVaem?=
 =?us-ascii?Q?zegxtfOugL4ofjuCXXbz3G1QR2Q8RbRw0yv+3UqadclLF9N5tyRyXvgkTfZo?=
 =?us-ascii?Q?Dtp83GJee/GkJjpXbRKGBaVCgbDzMdFABON9HnSLdDcnHihb2idDg8raxudx?=
 =?us-ascii?Q?UfqCcqVl4kwauzBZkHjeU1mn3zu4AZbs+EYQyR17/pDe+3SDVPqALDClP/r4?=
 =?us-ascii?Q?YD5edN7n30AePYuwiDJ4S173ap+rVXa5bb1BGs1vxbNT2MGHrn9WaZcOFPxk?=
 =?us-ascii?Q?gcBUMTAVx/xIPYskEndjivK8apQfn3L0oYBqyo/On5ZQPMlltik0jMHacIn2?=
 =?us-ascii?Q?/xtwu5oGalFXTdo3lml7JNjSKX3Kv1zhCUF0uC8nFFOaywOqrl8d2d3XLuRX?=
 =?us-ascii?Q?MiZ9YfBLIcqnAjmZBgoGPmX7+BXsUzri3q3Xil8vDQfJngHHXnd3zLwbCkoG?=
 =?us-ascii?Q?F6vMTUCg0K03CBR77jq1tf97ZtkrPSpfAbiYWV3RbVW1z2uaau0pH7fK1Kyj?=
 =?us-ascii?Q?fGYGV81w9oq1Bh9KsgSdWVEdwpY/rRrTLlUkwdTyGxwvFJ3vHIuBpK7EPU2q?=
 =?us-ascii?Q?S2jpM4L4O4dXwWZw2qRpxqnnP68iZwMLBoKgLN+UTavw01nCt6MejyjH+a6W?=
 =?us-ascii?Q?JH22qGNAdDlAhExCKEDM6ZjAI3henIS3nkujLcbbQfTtfdorqsMJCI0doicM?=
 =?us-ascii?Q?VAsFjfNJfvDA7OgDYurGhJL4Ct8PgSlSclGVBlK6XQoXQLg2F1r79bw2HAhD?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9454c2-b920-452d-220a-08dbd16a6c77
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 12:45:22.4799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8aA0GabrEn2pYQ/M8UiFzZJPEEyXhNwV3owqhebXr6nIWdJoZ0nDLkxu8ISJhFc2TWNTAa3++jrELExF6pYnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7515
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 12:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189520

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


