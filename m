Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD21CEB64DC
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 14:16:26 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.46])
 by mx.groups.io with SMTP id smtpd.web10.11556.1687270583237180732
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 07:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=Fe1brsnd;
 spf=pass (domain: siemens.com, ip: 40.107.21.46, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fd6jt88fP83SfD//pGiA9FHCTaXPa6/aVAdt8jTMFtGo3VqyC+ZRWPlI9CsLeEddRU+wzw8z12GfbXRyRo9d5u/4GkYWkMXCosaWfifdFb1WPvhYno0jrT7Vpthe9oL0bNWUGNqFzxQVjo4b0UgVAx1pgRgqGUZABZpADenfySSLHsHZh+cG1nCkWVCS3zxl/DXJhSZ0F8BB8Yfo4A4Mjjkc20cQ1TRh5jAvI1qbKSHUTM/a6SWYzP4YNQmJXI23OA3445TCVA6BYVjXZCNHRrV/duR7IUYgB2sm6fsgHsXIEeX0WZQeu6xFln/kFbX6Ht/RvF3LeDldMFjJFQdlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWyynRHbafpzB3yn5a5CBDqacogecEDyygX/r+qWmxE=;
 b=UcarRY8i5VwL8pt4wgzNuQmWJK7QoR3MVlADVrrpu7fLY6+be5sDuM3hI8uG37GMdgq9bdPHQVlFQdA5Ff5hDfZ+qymg92sX6sop60mUKr0nO4/12iHqCz0gluzSTUiy8fm4Lvjh/HfB9VWkHvROeAlD4c32MYqeEwDueCbcgocXPy09Op+NM40b0/pw9G/hNuSuPQio67vB7S8zyTT6XpICleFplIFADCiA+bJDY/F/YPr3hQHEkJvfOIrEktPFeeTjyRPKGMhwQzFTQq62t0oDFI0eyzdnF49e9ke6NSIyemeT0x+iD2nisVUWTm3fhsCjSGfNTKpTUA4Gsc6Eyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWyynRHbafpzB3yn5a5CBDqacogecEDyygX/r+qWmxE=;
 b=Fe1brsndQSm8T0KU4jK7h0qsFp0dF7ptzZ/gk0r4o8V3L5q7sfqecdXC+u1+8MNH9Kdlioo7kdL/sqBzDD3IwOjbjFDALJps+YkCetojeon/Tw32k+5l8cdBGhROm7Qk55hiQoLv3ctHk7WtuE6yXubZMIOImfQ0TZMfKusxNzMkkBPkFZRULwQay6Jpb4llKOttYCshaw+f9IOK5yxyqwlGq+gYdJXblJoC9dgjeLypxHoZLiTtPKXUVNV6fV4o4WD2766SoYx44vxDgyvlpcUrGEnrPR9qYV1LKQkq0HOCxV4N8yiOCyaRTk1HLr65XbIeQn+B5WHcMKlyJx8pKQ==
Received: from DUZPR01CA0307.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::23) by DU0PR10MB7216.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:448::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 14:16:19 +0000
Received: from DB5EUR01FT013.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:4ba:cafe::e) by DUZPR01CA0307.outlook.office365.com
 (2603:10a6:10:4ba::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 14:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 DB5EUR01FT013.mail.protection.outlook.com (10.152.4.239) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 14:16:19 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 20 Jun 2023 16:16:19 +0200
Received: from md3hr6tc.ad001.siemens.net (163.242.56.90) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 20 Jun 2023 16:16:18 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v6 2/2] RFC: oeqa/selftest/cve_check: rework test to new cve status handling
Date: Tue, 20 Jun 2023 16:15:57 +0200
Message-ID: <20230620141557.54562-3-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [163.242.56.90]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT013:EE_|DU0PR10MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a1daaa-dbc1-486b-7c75-08db7198eb04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QIuQ0tpUswdy+3JLlJdE5PGnMxP0y5LV+RlnLuGrmJXh7iRzzlqzSnQ3tjmmgHl5p8djX0IYTpu6w2Fxd3Qlx2cbgs3SMgQwdbJNhruGvWblLpQ/8Q0FSndE+b/+d7/lxbgQgkLvH77WGRyaB5rXDBVzfpq6Ur7/vtCILOCubAMqvf8sNlYJ8EeKo/NBa5GX6xdOY09iCQFaetJX8yhAzlcvDUwRYMJ+aWOgrJj6sb6SD5FrZyng8ac2w+DMY2MOtkH4cWVHHW8av+7eoWxI4y91sFGfTLpRoGtwZE04vjUymv1OtwyRcNslgY1SVQVVL5bSVkANpZyOUOqvr1p7lULeFG8AMlrMBAlDD5oQrIopG+QxTC3ChcbRzVeh4Jp+xZdcYiQvzSj12kucbXrG1RMwqV0LlVbTUt8WdxMqMHeOZiCZGbbP+4Ff/EIOUp5YeaiMkwj/I7tF/pMywkRvWrq4kPRhVZ7t5fDsfZANQIISa72xEKR50+DNp0DNRw+jIQQCfjehnDpgW8lbt13D6xbYK/sbVKEVTRILvF515/Wx9M/8pqx/hd8wK1ZDmOG0puETVB+zW9FupJtsSx8odlnoczFIJ06rz5i7yYPI6da5ZSq1m9i+5h5i2g4rMkPbAnNj5JAp9Z5wTZgBnWTOF+p1Vd+0ejpevy+r1AvfGM83mGUidLPu1p965hNdTSmZ1p/87JKnUeMajpp/TrifZiEbXpXMY/wAH3PIw66q4Ivg79wdZ1Fk5v+sxlmBvDYtYiSFykz7s2IEZGPNGLjn8g==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(70206006)(2906002)(36860700001)(336012)(956004)(2616005)(47076005)(83380400001)(8676002)(478600001)(6666004)(70586007)(5660300002)(16526019)(107886003)(8936002)(44832011)(6916009)(316002)(4326008)(26005)(186003)(1076003)(41300700001)(40480700001)(82740400003)(82960400001)(356005)(81166007)(86362001)(82310400005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 14:16:19.4339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a1daaa-dbc1-486b-7c75-08db7198eb04
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT013.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7216
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 14:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183140

- After introducing the CVE_STATUS and CVE_CHECK_STATUSMAP flag
variables, CVEs could contain a more information for assigned statuses.
- Add an example conversion in logrotate recipe.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/lib/oeqa/selftest/cases/cve_check.py     | 26 +++++++++++++++----
 .../logrotate/logrotate_3.21.0.bb             |  5 ++--
 2 files changed, 24 insertions(+), 7 deletions(-)

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
index 87c0d9ae60..b83f39b129 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
@@ -16,8 +16,9 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.=
xz \
=20
 SRC_URI[sha256sum] =3D "8fa12015e3b8415c121fc9c0ca53aa872f7b0702f543afda7e=
32b6c4900f6516"
=20
-# These CVEs are debian, gentoo or SUSE specific on the way logrotate was =
installed/used
-CVE_CHECK_IGNORE +=3D "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
+CVE_STATUS_GROUPS =3D "CVE_STATUS_RECIPE"
+CVE_STATUS_RECIPE =3D "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
+CVE_STATUS_RECIPE[status] =3D "not-applicable-platform: CVE is debian, gen=
too or SUSE specific on the way logrotate was installed/used"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d=
)}"
=20
--=20
2.41.0


