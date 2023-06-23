Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A8EEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 11:16:24 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.73])
 by mx.groups.io with SMTP id smtpd.web11.39599.1687518978400700850
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 04:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=N7GB2TsZ;
 spf=pass (domain: siemens.com, ip: 40.107.8.73, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Es9BEEozRwRHuRYN4IOIQIAlkhYCV7V3/TJYZQ1nvhkgRwNlWG+GtMheLKJAIyxBfzIJi9DgDD1sovAr5lLbPRGCS906DBcR3tL26e6xj5X0dAoakDIJPra0KurU9E6hkn7nwjzIYH53t2ZVNGo5TVuC/ZGMJntyf+AG+mEbSBdzTDwpEjicb0FGuo0vtWmCW+uDxqeqeCSFOpU27inVtUJjOZhix7GQvV+/NQ8IyUDooms0OJRBKtt2rJBiKTYvhUXlOQySYUWK89IkBkdJQ8klaB6nQ5C5hzW8zRec5kOaQ/TSkezolPmBuE1msXlfZ+TPe1pkZqNOFHcrfZiA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJPZ09NSHY2LJBONSPY8Jpvj33zsTgKbX/FtqJxSWBY=;
 b=l0mx0aElyDmTVyDDIirk5Oq48F24pkPfUOt/jFPGmodNWiVp/v7mWqHACj2PXYS8VP0NNJ8DWOfOPn+tLpMXXMmY5IY+2q5Zm9HS0K8Rnzw7tJ/kI461EjWcuH6FaufrggIEzVWMeT4tAj9tGBItpDmam1N9AgGq7S+EZGI7osyagvOCPSVDtesZwYBYxNu6d9Kvrh6BqQp9ro/qpqQG4nBSQt1SyeDpg3rVRjQz7VDv4jQUcuaVjAHlpcpcIZk8FitvSB3Fbv8GlTJfRLCO1GNgXYqUhB0DoNnLNOOK4tIsxDMPAlUaFNcjLwKE/dZ0g2eI6GfaOuWVC9B4ikHX0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJPZ09NSHY2LJBONSPY8Jpvj33zsTgKbX/FtqJxSWBY=;
 b=N7GB2TsZFVQNoQMKUcQHEkEuQcJ27TGUz8x+cve8Be8GLc7gjaqiD7w03ytiRPVS1fPd6Y/mx6NDIEMYJbde9Hk9ztIXU0/Q8TtZxz4TczZuSx8b2YdGWo8aL9L7hqHoHrBU45R4ZyrbEkkCdkIYLkofGawXVUzf50oU8B4udn+R3/vbPlJ4+SabCdz8nc8sdZ9SYBlaimnog/NHSHZH0O2FHU4TJjfoH6xXFHkhU4z32zVFPXMBHUXcSMu287EgGiP1ZwTY6gnv3E2aBrUM2Y/JM9oNR2bOibpVTB6ULuuHCBjWE8bQa5z3CVZqR+yHY2pq0FYCBNHP2n3zoJZv+Q==
Received: from FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a1::16)
 by AS2PR10MB7226.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:60a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 11:16:15 +0000
Received: from VE1EUR01FT008.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:a1:cafe::a3) by FR3P281CA0099.outlook.office365.com
 (2603:10a6:d10:a1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.9 via Frontend
 Transport; Fri, 23 Jun 2023 11:16:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 VE1EUR01FT008.mail.protection.outlook.com (10.152.2.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Fri, 23 Jun 2023 11:16:14 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 23 Jun 2023 13:16:14 +0200
Received: from md3hr6tc.ad001.com (167.87.2.72) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 23 Jun 2023 13:16:14 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: <luca.ceresoli@bootlin.com>, Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v9 2/3] oeqa/selftest/cve_check: rework test to new cve status handling
Date: Fri, 23 Jun 2023 13:14:57 +0200
Message-ID: <20230623111459.97933-4-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.2.72]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT008:EE_|AS2PR10MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: f836811e-f27f-4766-913e-08db73db4240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Syl+XfxZu9Zr/c3/Y0uSGVYLZNiyRYSMPZUw/yR4NDlZb6RAmnF4G34SWU/xWXbRTOk8tkahD8tgtg7obFovbF3D1vdVP46LKpulbg/bJoASi2p2koFcMXVoXwmhqIBjblbarkqh7Ji/bNyA0w5WY/z3ESugrqV9kJuIIdwG4OMrrmc43GtyMpddeeYEkjZehQNqsg1drD27DdC9ar3jpYGOfApRK6yZAdYXL+jepmspIgvqV1XJ3DXbtSsQOtCOsVTCDT6cROeGBUZM5tbcOQ7kzxQFVdlRz81GXEF0AlkeUoJh/P9psAWCsrNnNQFRjlT+6zZ97FUiE8OqlCF1COv7E6O8RC+gWgaBR359xY9OrSye1pyta8w2TvUcIBy+jXxJ6rlwX+T0yzOCojil4goyvjrtTlSplJCvMKdpLmUjN6JWMlKgJpxN/1gnZNQCvFzUi79Sic7egOZlH/eYZQMHHaw0sCLTnzpk6z4ynQNW1Yej0dmhnmHjmXOngw04TWeN/OW8izEgqyezrtnCz2Da1tnnYYy+A9iUiRsJ/6AZekqG2ENuAaFdfr+f0UUCIE6YntkHpUHNjH+RIDlk254LS2VN486/Q8NY+1v0vpZqp8WIekmN1nZsk9u4io/ZNgVPKjJSBcW1YsAsRcHLz0uaFNlXeZuFwpFy7Y0JyHgafk2eJ3PTSzcS3uZqqtOBEWo9FqUDMWgE5jU8E06nmmWAuzfwww5pSWHFoJeGeV4gbT31XrPOHD13GXLet1Y+
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(36840700001)(46966006)(40470700004)(4326008)(7636003)(82740400003)(356005)(54906003)(82960400001)(7596003)(82310400005)(86362001)(70586007)(70206006)(6916009)(478600001)(316002)(6666004)(36860700001)(47076005)(83380400001)(336012)(956004)(2616005)(8676002)(2906002)(16526019)(8936002)(41300700001)(36756003)(186003)(26005)(5660300002)(107886003)(40460700003)(1076003)(44832011)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 11:16:14.9148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f836811e-f27f-4766-913e-08db73db4240
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT008.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7226
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 11:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183323

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


