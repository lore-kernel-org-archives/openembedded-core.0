Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096D7EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 06:59:55 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.79])
 by mx.groups.io with SMTP id smtpd.web10.5918.1687417188416645861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 23:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=sKDFFHz2;
 spf=pass (domain: siemens.com, ip: 40.107.105.79, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mx+m9Gu/XUY/QJAI5LFjJZK3QvUBG0KYbSdVvIOnpfhZvavrZeiQnQx1cPdnQ9e7dxZFRWzxR4ua5cd3fgnxkDzR2j5JUlGht3g1gYyEH6+eanLrYt+fA3J0O4cD+v/dN/IjyoejJQAKFlXPD8LPQD81Md+RuYj1UcUAFlJmWa4EzqQqyLrB9qLNtJv/9LDC8jYF6IBn4d9474+KfAx/ULV7yGSuqUkS59SfYKHnaDvvFor8Bq5pY2h9kZ944oCJROXcSGFFD2qGGD6aZyKjgRTHhc5nvVkVof09T939nCWaN21K99F8+168ArFv/Dqe/TRkPIONoRZI8S78saexdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJPZ09NSHY2LJBONSPY8Jpvj33zsTgKbX/FtqJxSWBY=;
 b=bbWmHvJiRVDt9kJHn4Tg/uUd64hlBHPoJeGbUjZqij/dnS8vyVvGyKF6QslCcblUVBICBlCJTzgc1emHa9sJbfNXTFEMYUgUC93HgZWOscWjoUQeXUe9uklAhJyI01GLsS1IoXvZHsHxVnsY5nK5xcidQF+0kt+cnfp2ptdnza2qRk00fcX5xSOX6H/llMwhce2Jp8ELou4XkQHA8soZvS/fLGSsJyr86vJrcI4VryIxoxRPj8JwQGJtP2B3q0ss0JZzUUNb9x/so6yOXAH2dDwwYiEs5+1IccT99WxtFXCKHX8YD3xhqxLd335P6uwDYg+J4trYKM9w8p/zofnUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJPZ09NSHY2LJBONSPY8Jpvj33zsTgKbX/FtqJxSWBY=;
 b=sKDFFHz2Rq7ydrXMSex894rpStR/4XLQUngR2BiyQpZyPE+on3MEGF+zNrFaGpZuY8oLH8YaeZaM4+HGTvqtySPCY13qliMDrNY8wuYG+jM2YDD71y5LMq4hQqCQBs7mhuzEwVa8+LLBRZNHbYMeKARMSAu797z6/7Fs0KGasDNmg5YHXOuVGcnkhqul1YZl5WnQVERX9YTAkkXejJ1YM3kibz8MIJnRTep+vCHHTjg3/wGs/SPAm5xajie9kw+mq7gt1bXJ+pabbl5ntZzs3difOLS23tb8UAO4ke7aL7KZsDiAm+PuCbPpF6Az7Jn2qa/R99Ii7HSYBWkoRORYWw==
Received: from AS8P250CA0007.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::12)
 by DU0PR10MB7358.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:446::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 06:59:45 +0000
Received: from VE1EUR01FT067.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::98) by AS8P250CA0007.outlook.office365.com
 (2603:10a6:20b:330::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 06:59:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 VE1EUR01FT067.mail.protection.outlook.com (10.152.3.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 06:59:44 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 22 Jun 2023 08:59:44 +0200
Received: from md3hr6tc.ad001.siemens.net (139.22.106.9) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 22 Jun 2023 08:59:43 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v7 2/3] oeqa/selftest/cve_check: rework test to new cve status handling
Date: Thu, 22 Jun 2023 08:59:04 +0200
Message-ID: <20230622065914.37448-3-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.106.9]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT067:EE_|DU0PR10MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d3f6db-cf0e-4245-f158-08db72ee425d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T7qyP7T5AvhByH6IS5xpX2bWw0GjyIdl5QS3aCPkSbNzKBquImiywWfREAiwaLg+3ersr6Sm8k2WxoVA/uBfoFlwF6nEjzBujP3ylHVWU+DMHnltULxSB8vTmxnABszD38eYVVZY7rzQ9HFvaS352jGlb4TIY18BFwLFHCJ5JglwRoSrh1Fcwquci0SARMSi1wwst5srZ+6aM9MC4M0yB55/Uiw2ccQ01KCiyzyG/H5zchGUvFrufS2JTjlkSALjfm/IXmfazQAxubegxq3Y49ANOBuQh4D3W3iw6WPEdRmJJJD1+JbTxaF4FQ25cP75f2YI3WTOyIUDA9Y4AeaFnRCY74EVW0q8hOe0Vx1SvEb7q0hWtpMowbGcmYwSVu1pj1t9xrWzyjbFXlrhTgFeGo0STyiT9Qf4uHiIV4y5S45dvCmBev7uhPzrB22qEfMAEXGS18M1A81fsULm8vSFZxdnela+66wR4chxMimF/NTt1aXBmAcOpkq5gynYRQV35DBaVEwauWXgFpA51iTVCWf51gZt/6MdQRpJKTWBQbKMTKEd7IWdMVotx82VyI8C67bVkV8gmmKHXWiJr3+TS9+pxJ1AwR++6MaA/xZRg+HDgUfHNwJ50pQw79kCTBM24USN2nRaJa/UnOLbfuQtgUD1/o5JJsnmYNRh6UyG3tCeY27XHcKW9dpGUFbU3X07OrvZs4isngsZKBa/qaHse8m4eb2cJGf90G47j5pg5+DgJ/Lt2+KI7ap/oCuxS0TzzTFhqZV9FMoDtG802i/CHA==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(81166007)(478600001)(70206006)(6666004)(70586007)(83380400001)(2616005)(956004)(36860700001)(40480700001)(336012)(47076005)(40460700003)(86362001)(36756003)(2906002)(186003)(107886003)(1076003)(26005)(16526019)(82310400005)(82740400003)(356005)(41300700001)(4326008)(8676002)(6916009)(316002)(82960400001)(8936002)(5660300002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 06:59:44.3668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d3f6db-cf0e-4245-f158-08db72ee425d
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT067.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 06:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183226

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


