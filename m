Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E128AC7EE23
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 11:59:52 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.73])
 by mx.groups.io with SMTP id smtpd.web11.56537.1686571191197342626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 04:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=N4B4Pci5;
 spf=pass (domain: siemens.com, ip: 40.107.8.73, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilfuVBfdYgvjSy5ufFK5+6Vv7VpylZPDmKyZOEnNg5gW3qjScxSC8Nh5xcK/g68JZfWPUVzh7dZln7QNwtBq+TMzjaerd6BXDb8BleK9+0bed7eWeOOOtdJzTFzJ8u4wUD8jRO8eQcI/STtoBxtrxjKisXBh2byepmyKljrk5xBhjgfXp1ehOyI/Uiip7cp8vBLGr2x4lPi2yOrtOwck7yi8xepW2ARvvUUr9kOL8/o2VaH2JgUaPNYTVDKzZchBj/C3dmGeH+jJ+hoZ9popwkSFHQ1xuu553WjL/AeSBKtcWmAcI3FYw7GYpLBeNC6YwCv/CYGWnDLfyPzPm2+rtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0o2lq7XlM5ioHBYsZyl+duzuCi3nYVGHk1G74Msqeo=;
 b=TQXyReF3hLMlMaoBMyTUQoVWf56fdupraF/H6eox08TN8JxaXCKJ4SjCNwYYs1dyMKZxVfwgvdptAm6bu7WIsaJvyxJikrvfrP3CIuBY55K1FYo88MewkUz3dzdxmSNQVgGLUcb5YmTnPAK885O25PEsSoOh6JZWw0gpdJA1o4vQ4kG7aHFOR0JvKikBh45/0hMZ1SEG7QAMPE+wR62maSZo1XSYkGymY7ML2pXNaKsadsZWShSRyhwrNWMOa6kWRV+vDWhGzdE81nNMJZewgB42ngHLg5n8q0om5aiSokkNdkmATqUQDSu74wwMSaD36gWEXcNoLTFjt6kt8Z2tOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0o2lq7XlM5ioHBYsZyl+duzuCi3nYVGHk1G74Msqeo=;
 b=N4B4Pci59czLtcetTZAkoQG9ZgmFQy2/LAacMKLp1g0YP1LNRt6os5zE+pFYTJvLf3ZazFgHC7l5oSClbOLpxNBHi352glhW1cXtCbtQOxU4qCr6dXrOfrfrzDM+TLZ3wtxVBlCDHrozosDaBHiYbKdgxCgKrLrD1a7EJ5At04o/PYBJnayc8kB8qUt/2mmyu+kpsCo8DFsi/u45WT7DGadBS0o+FSZRgXVL0Osx5s4xblKCBj73PRv+HKkGMMm9Y4SSz2waSvUcAz9q2BFUErII13jgpEDunBcoiKpw1Sr/4OSiPKXi69lDrP01jdpa0DaG8vm6XoPvZQctkkhqOw==
Received: from FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:97::6) by
 AM7PR10MB3974.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:13e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.27; Mon, 12 Jun
 2023 11:59:48 +0000
Received: from VE1EUR01FT063.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:97:cafe::12) by FR0P281CA0126.outlook.office365.com
 (2603:10a6:d10:97::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Mon, 12 Jun 2023 11:59:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 VE1EUR01FT063.mail.protection.outlook.com (10.152.2.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21 via Frontend Transport; Mon, 12 Jun 2023 11:59:46 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 12 Jun 2023 13:59:46 +0200
Received: from md3hr6tc.ad001.siemens.net (167.87.37.146) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 12 Jun 2023 13:59:46 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v5 2/2] oeqa/selftest/cve_check: add check for opt "detail" and "description" values
Date: Mon, 12 Jun 2023 13:59:23 +0200
Message-ID: <20230612115923.53067-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.37.146]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT063:EE_|AM7PR10MB3974:EE_
X-MS-Office365-Filtering-Correlation-Id: ed704c6a-dc4b-4685-014d-08db6b3c848e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X5bDhjhg/+ThBS6nGrbjWUy93XpMYL3ifpDbexNmOJxwvWXOot1gHbt9D5ZuXGSNhF+AEpnyebmi7ag9W1TedQ10nb0Z+jfpvP9vnrpX/AZ3uygFg1bJr08o2BSWmOxFptVyuEMo1qnCfGQ9nOH38bu+yAfV5YFHNcfarKWIuRKnJsajFwoNMuSPiNshKqh+d32CYW57sOLiWuJnM41/CXrRvBJvMNqyHbEjuV85IwgyPcHI04oAkeU9nh/Ma1RjWPchVCbllY++fazCk66wG36g2PW5zsnZeVSs4hMAIH+IAyeFeGnWATGi23N6ZqYt2TFF+gsvZcJCBCttoaxaSX/GpiNaaxzCbj48a7rTf1xWz3HXALTBvHACSsnp9sJ6JVrwuB2h3c3dx1I/MeWEJ3jHUC/cmCsW+u9luTnzOrFOlynBsKjUsy2qdHFLBY0whcNOo1gWubgTuHfqJT94/e2myMZYnfk18dvstPSH14wAUKybDgRzDD4unU4VX+FI0uZuIeEijFsclbmGElgrgXsw6JR8uthfd3MsJVVPJ2oFIXg75COoUBYx2Cg5HO4oy1jgR4FAJN1jbe0db36R/92Xj272j0hSrPpB8HJzWP1EuJaBVxiro5EdIXv4eL/wXhS3+i2JzFPf8YQw5y/Ne35wq5c7eLaEuegsqv1D2VP59cAWG82SKHsri65GimHFK5eidGec+h5Qsk6aBc8w4I5R/oRp5ZXM/rtYvPPJFUGpeyp4NDSiIpGI+kOyLcWh3A3gLLi2VHfSwHTcqRXUCg==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(40480700001)(47076005)(36860700001)(336012)(83380400001)(70206006)(6916009)(70586007)(6666004)(107886003)(26005)(1076003)(478600001)(956004)(16526019)(186003)(2616005)(44832011)(2906002)(8936002)(8676002)(5660300002)(40460700003)(86362001)(36756003)(4326008)(82740400003)(81166007)(82960400001)(356005)(41300700001)(316002)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:59:46.8651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed704c6a-dc4b-4685-014d-08db6b3c848e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT063.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3974
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 11:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182667

- After introducing the CVE_STATUS_DETAIL and CVE_STATUS_DESCRIPTION flag
variables, CVEs could contain a more information for assigned statuses.
- Add an example conversion in logrotate recipe.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/lib/oeqa/selftest/cases/cve_check.py     | 26 +++++++++++++++----
 .../logrotate/logrotate_3.21.0.bb             |  7 +++--
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/self=
test/cases/cve_check.py
index 9534c9775c..60cecd1328 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -207,18 +207,34 @@ CVE_CHECK_REPORT_PATCHED =3D "1"
             self.assertEqual(len(report["package"]), 1)
             package =3D report["package"][0]
             self.assertEqual(package["name"], "logrotate")
-            found_cves =3D { issue["id"]: issue["status"] for issue in pac=
kage["issue"]}
+            found_cves =3D {}
+            for issue in package["issue"]:
+                found_cves[issue["id"]] =3D {
+                    "status" : issue["status"],
+                    "detail" : issue["detail"] if "detail" in issue else "=
",
+                    "description" : issue["description"] if "description" =
in issue else ""
+                }
             # m4 CVE should not be in logrotate
             self.assertNotIn("CVE-2008-1687", found_cves)
             # logrotate has both Patched and Ignored CVEs
             self.assertIn("CVE-2011-1098", found_cves)
-            self.assertEqual(found_cves["CVE-2011-1098"], "Patched")
+            self.assertEqual(found_cves["CVE-2011-1098"]["status"], "Patch=
ed")
+            self.assertEqual(len(found_cves["CVE-2011-1098"]["detail"]), 0=
)
+            self.assertEqual(len(found_cves["CVE-2011-1098"]["description"=
]), 0)
+            detail =3D "not-applicable-platform"
+            description =3D "CVE is debian, gentoo or SUSE specific on the=
 way logrotate was installed/used"
             self.assertIn("CVE-2011-1548", found_cves)
-            self.assertEqual(found_cves["CVE-2011-1548"], "Ignored")
+            self.assertEqual(found_cves["CVE-2011-1548"]["status"], "Ignor=
ed")
+            self.assertEqual(found_cves["CVE-2011-1548"]["detail"], detail=
)
+            self.assertEqual(found_cves["CVE-2011-1548"]["description"], d=
escription)
             self.assertIn("CVE-2011-1549", found_cves)
-            self.assertEqual(found_cves["CVE-2011-1549"], "Ignored")
+            self.assertEqual(found_cves["CVE-2011-1549"]["status"], "Ignor=
ed")
+            self.assertEqual(found_cves["CVE-2011-1549"]["detail"], detail=
)
+            self.assertEqual(found_cves["CVE-2011-1549"]["description"], d=
escription)
             self.assertIn("CVE-2011-1550", found_cves)
-            self.assertEqual(found_cves["CVE-2011-1550"], "Ignored")
+            self.assertEqual(found_cves["CVE-2011-1550"]["status"], "Ignor=
ed")
+            self.assertEqual(found_cves["CVE-2011-1550"]["detail"], detail=
)
+            self.assertEqual(found_cves["CVE-2011-1550"]["description"], d=
escription)
=20
         self.assertExists(summary_json)
         check_m4_json(summary_json)
diff --git a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb b/meta/rec=
ipes-extended/logrotate/logrotate_3.21.0.bb
index 87c0d9ae60..48497138be 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
@@ -16,8 +16,11 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar=
.xz \
=20
 SRC_URI[sha256sum] =3D "8fa12015e3b8415c121fc9c0ca53aa872f7b0702f543afda7e=
32b6c4900f6516"
=20
-# These CVEs are debian, gentoo or SUSE specific on the way logrotate was =
installed/used
-CVE_CHECK_IGNORE +=3D "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
+CVE_STATUS_GROUPS =3D "CVE_STATUS_RECIPE"
+CVE_STATUS_RECIPE =3D "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
+CVE_STATUS_RECIPE[status] =3D "Ignored"
+CVE_STATUS_RECIPE[detail] =3D "not-applicable-platform"
+CVE_STATUS_RECIPE[description] =3D "CVE is debian, gentoo or SUSE specific=
 on the way logrotate was installed/used"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d=
)}"
=20
--=20
2.40.1


