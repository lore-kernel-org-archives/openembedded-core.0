Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93860EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 12:00:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.70])
 by mx.groups.io with SMTP id smtpd.web11.9391.1687435235049339071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 05:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=o+za8Qj4;
 spf=pass (domain: siemens.com, ip: 40.107.22.70, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhGqL06fiDVtizOWIdm9SnYzaOf2pg7Yce/i7oIKBfddHNXKCo3XcaMfaw7SgiPgcH504wmlzzB89YXKYlxxM2qnTo/aqDzxsUlaSEQZS3zc89L8UmKI3/yq3T29cL9VQKse5PhUfGAPP8QWtrHWF6u9jS8KUJZed27DvRHJGZR4ogiCAZKkBhlZ7+P6FU/AGOT1yK3YedtqZmlidY4ujxroxnZ0pMnjn1Xx0h4PHQg/5RO8eqqPNaDZwEgnh6Qv98qA+rjCIoqyNeoT6xFTjMCBnzYOoE8AVNB9jvSBZiLu7vI5h+oCZgWGgil/Y79tHqAePjO7go2hzlpbervwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJPZ09NSHY2LJBONSPY8Jpvj33zsTgKbX/FtqJxSWBY=;
 b=EXr5axaTZRSmqJaOfApHbIzpXIUDjsK89CS0W2iFX6972XEEv31Afdwx+QuBNCsuBgwpEctrKPIjOz4qrhvaBDqdFyttJb0e88wLif9UYXLUWhPwR/bZADSdE+EHKDuCSxUrsGrtEVarLMxFTeHX5jTQ6UFvE2IHu6fN+4l+JyskrfQW0b4mnKUgk3d6qBKqBBHxKuzTyjgelonJlmjsRURVRuqacRQchm2H7hV7M4JW26zAagJZdebSqI80v2OyeVW4ehmBRqFi1DNu56vZnSOhImJhhBoL7jOZPOa1d1xgWbfNXeU3XZvozxgKYCCn5r6sVEuZKHYzh3DtSaq7kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJPZ09NSHY2LJBONSPY8Jpvj33zsTgKbX/FtqJxSWBY=;
 b=o+za8Qj4ZQfGr90f6K+52F3vdqh9xvNmCT+3yJNSRT0Ri47tFJS66n1MyKWQDm33DhDzInnXuibM1BJ+FkDAkn0ppHzI35nx5LeHtVZKQdCdCZuc4nKE1dT+kGXhMyjNqEl52CLPr7ne+ojGZvL+6K+DUe3q0VpNQEtqGHnt2VPBZCQlQoFlGHhetFGmJrAS4955XeQZpatTNLDBlwx8MPEHXyXX1qWtvCKRUxSQv4Ex5YRyIsbgvx294rrlvYLH3uoyfFb1J9dYdZGtuSiLxuUfuR5cIEPPKG4uEHaiwaWHsr98mRtiAJ5bE9OPwEQ40bqp3UUO7ZAv1BS9aDxgPQ==
Received: from FR0P281CA0153.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:b3::12)
 by DB9PR10MB7953.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:306::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Thu, 22 Jun
 2023 12:00:32 +0000
Received: from VE1EUR01FT046.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:b3:cafe::80) by FR0P281CA0153.outlook.office365.com
 (2603:10a6:d10:b3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.9 via Frontend
 Transport; Thu, 22 Jun 2023 12:00:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 VE1EUR01FT046.mail.protection.outlook.com (10.152.3.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 12:00:31 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 22 Jun 2023 14:00:31 +0200
Received: from md3hr6tc.ad001.siemens.net (163.242.56.90) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 22 Jun 2023 14:00:30 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v8 2/3] oeqa/selftest/cve_check: rework test to new cve status handling
Date: Thu, 22 Jun 2023 14:00:02 +0200
Message-ID: <20230622120009.28939-3-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [163.242.56.90]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT046:EE_|DB9PR10MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: d714a3d8-bfeb-4104-3167-08db73184776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k9X6171b/HgbV58i9NGE+UiR3h7hyjfXn4XWGt0VnlQG34Q9yi8t4SHccWBk9z2ctKulM0EVbcTlhVqVDOke+Q758OQwCFyVJ8ruit6xSgwxk6/CWYrueG5ZEKpjC5tKD0UXVBRRL8mxki5T1AfS0rLTDRpqvoWhvKhA7W/AtVBNhUyjHnCSpp1f42TNiUW3MOMDcDqxNc7QG3hnxHEZ3AI6vDHU1RN15m8yrRuBueql+YFvqAokQrE3vJ/24Ox6J43MGHwanKkd2pvCIBVY3SZB7delGOXsJykaIf8QgWL2ZcbrxnaZ4QZ75uShSAcSR1ZHDF6/8j8yXETxFeGXzS1PSw+Mu5j5LaOzZECIAUfc12Yb3evTl1g2TX6O5DckOqBgxMER4kd1WBnA0pl6J+uBa+B4aBcr6VDQyEK3/AOIx3Ak7Ry5yFQ5JobEEWt06Zrb+M15kCixxg7ObMazT9XtUke9LL8gdc8Dul0fHczIfOBdS+3mxFyhmTys1m5C6r0r2d068/foavDxvKeV03gVPpARMNKDQfcNdaxoC/CzwTBxlHPgEG4bfMPJ1KUE0EInEBfdmO33xpX0OvRLlT19n6mmJsPqbW6eIaLuUipFBsTMzg5ETEpm6dCzBXKKKx10xEKRwsUeS3ni1M30mlHO9AxrQIui52VwEhrn50jIh+Mhd3Prcr0EAU6XugGmthR0kT6eIcKwT68U9umgojwV7ZQaIaGj6d68wU2b+87dqP+8SeEOOktvexTCjojZ
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199021)(46966006)(40470700004)(36840700001)(7596003)(7636003)(356005)(107886003)(82960400001)(82740400003)(40460700003)(2906002)(478600001)(36860700001)(40480700001)(6666004)(316002)(47076005)(83380400001)(2616005)(956004)(70206006)(82310400005)(5660300002)(336012)(41300700001)(44832011)(70586007)(6916009)(1076003)(26005)(86362001)(8676002)(8936002)(36756003)(4326008)(16526019)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 12:00:31.7769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d714a3d8-bfeb-4104-3167-08db73184776
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT046.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7953
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 12:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183239

From: Andrej Valek <andrej.valek@siemens.com>

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


