Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24D0C77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 06:24:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.48])
 by mx.groups.io with SMTP id smtpd.web10.19792.1684477495554200090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 23:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=vwG9NsTE;
 spf=pass (domain: siemens.com, ip: 40.107.22.48, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISoC6xxont47fLVaUittK6ELE5oH1rin0q/nd4kskmP7xzh/6ouC968ihbPauBix83rP2e0TEJqyjAboMlzsKPSQ1u9xM/9uN1QmyIJTEJ9C1lHSR9YXKbX+q445xBVMYgWrBH75ApTMI+HMJK/zB1PoeGWMdjdJImplqf4VdP9duUCwHbw4NfEbEWCYs1bsD4IirMDnDhduxh8GI2ZG89uiP1z00QLcO+sUAZOB9lM68GnHx0bVfswIOqkbcm3W0ey846NqfRQgJiquPdwUI7CbvLd2nR8WNAaqZZ1pVzzJYRzMy4S6am2T4KYJncrM15Evo89EvLxbTS6KAmVHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWsiXAGKva0e4Q2+tCDT+9BxX7Y8FgxxTyngz3iNrD4=;
 b=jTU3wYXQGvUm+up1WKCrtlVuL0jgLvs9+WS9RaZIhdbD87wa4jDkJTbpoTCj8jT39d7s21nVwd9ZwUizjXRlnmLJ8VjJdMujWvGKlXZNgCD680uI6CTc7aZSfkU20kXA7wPyUNmPrsXHfkr7dPJIIXbD+ZFdcbjb4F5fp1SZHUiKE2S7krQ1Vf3/jhDYc63gT/k6sIKFfBQGuLA0jxvuwZ7CuwatV3YLbNYDqxj8goM56PoYsYitNHhH1gXRbPOUAG/CWnWDM8ObqU9CxPmFjiSoROROEUBrsPCVc2gEQkDC3kinXwp0LVTEzev0to2tK4oeM0sIjPrEYl9q2Lyvdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWsiXAGKva0e4Q2+tCDT+9BxX7Y8FgxxTyngz3iNrD4=;
 b=vwG9NsTEvW0y4FZuBRXGiXRwibhhcm3eqrXW5P6RaP2AaTaSOhg+mQd2O5W4ckNzpQIoLMAqPkWx5TQG068TP7zDRPWBIjLxTdvPEphU8pg/yUueuFKNGcDwlvtLAsN2vgRRZFsHDGI1AYPHJcP85k2F1XZDlZXMEq0lwWdHAERJvJUUtQnNVfMEgFu6jDS8Nu69Rnd6BEpK4vuBvgZ7atEhE0MqO6KDEXTdDxKlTSsGxAGFoH2kq25ITjpsUsWAsp1ywUz5NkQhPtQH3YJ64kb5+qJh415CfZV2L0ZqLIwmq7J3tN+Dhtlg3yWGNYSLEeNkAHoAG4IcQITM78DZpw==
Received: from DB6PR07CA0062.eurprd07.prod.outlook.com (2603:10a6:6:2a::24) by
 AS1PR10MB5240.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 06:24:52 +0000
Received: from DB5EUR01FT059.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::1) by DB6PR07CA0062.outlook.office365.com
 (2603:10a6:6:2a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.6 via Frontend
 Transport; Fri, 19 May 2023 06:24:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 DB5EUR01FT059.mail.protection.outlook.com (10.152.4.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.16 via Frontend Transport; Fri, 19 May 2023 06:24:52 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 19 May 2023 08:24:51 +0200
Received: from md3hr6tc.ad001.siemens.net (139.22.107.140) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 19 May 2023 08:24:50 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mikko.rapeli@linaro.org>, Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v3 2/3] oeqa/selftest/cve_check: add check for optional "reason" value
Date: Fri, 19 May 2023 08:24:19 +0200
Message-ID: <20230519062420.37015-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505111814.491483-1-andrej.valek@siemens.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.107.140]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT059:EE_|AS1PR10MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a96bd67-6055-42d9-efff-08db5831c146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4f7btyKcy2S4BJjNthUbJILPsYggpyujFimVg3BRoLTaSx1CVFIC4QzekKTznR/L0ypOCdkAZ0891ULpmOeyqaKAdHtEGBkeUyrV1mKbW3WPuNyiEnHt/IdG16qxD7HxR7yGTo3UXHiwqjaBRIaEYNiUEzABzS2N6kdHLbCjFjGKyz7mkJSbZ8uQ9PePYteP6WBw1EJK7E2l8MyxxJHHqVsjmIbk+XwXnev1b7IhgaOLXDGVHJkxxJ0nt6vaQ9NgUBzPj/sOTpNUhJzE9uW204NdmD54cUcVduE39VWZA+lZpAwsxws/2pTP6aU1inXOsJMC8ZVSfy2yX9a+yq2RhCF1MiCU4xl1evNwSXYVt8v50X/BbtuNuEx0LdbiWa60j8uquClh4kTgm0dA0S7kFz1eHb2RnhLQIuiLaJTlk4YQWLXGyMv1Kb6/Z+rLmabjBgSt3MiLJA+Hn2zfH/Snk4kDQGTPR682qaqWi42s/5QcWGDO/JqaOAnrExn1GtPs4lxpbegYH2lzTnbVfR9+QrLd/lzgVBoGojLhyq+M0nZkvHmVxgG0wLO+P34M+vtUesasOfjnPKbWmLMCECA6dNrLRL+w1A+XGoxxfGMPj5evXSIdmkKv0zFh3Vn/8HT4BpJfDs3MtxN9mexElYgpOy6pD9oyv7VmwrvdeCUidLsoMWTfruuhtODytH0Yec6/K7EaW91qw82W+o2NFGN+SZSXtifxgTmwZsubuOAMIBiVDxmvEEiaJE2jsKtO2C+lt8/vhJm9Vor9+9GPBVflYA==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(47076005)(41300700001)(36860700001)(8936002)(107886003)(2906002)(8676002)(26005)(40460700003)(6666004)(356005)(1076003)(6916009)(40480700001)(82960400001)(70586007)(83380400001)(82740400003)(54906003)(70206006)(16526019)(478600001)(186003)(44832011)(336012)(82310400005)(316002)(2616005)(4326008)(5660300002)(956004)(36756003)(86362001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 06:24:52.1616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a96bd67-6055-42d9-efff-08db5831c146
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT059.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5240
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 06:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181532

- After introducing the CVE_STATUS_REASONING flag variable, CVEs could
contain a reason for assigned statuses.
- Add an example conversion in logrotate recipe.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/lib/oeqa/selftest/cases/cve_check.py     | 20 ++++++++++++++-----
 .../logrotate/logrotate_3.21.0.bb             |  6 ++++--
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/self=
test/cases/cve_check.py
index 9534c9775c8..ea37beba031 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -207,18 +207,28 @@ CVE_CHECK_REPORT_PATCHED =3D "1"
             self.assertEqual(len(report["package"]), 1)
             package =3D report["package"][0]
             self.assertEqual(package["name"], "logrotate")
-            found_cves =3D { issue["id"]: issue["status"] for issue in pac=
kage["issue"]}
+            found_cves =3D {}
+            for issue in package["issue"]:
+                found_cves[issue["id"]] =3D {
+                    "status" : issue["status"],
+                    "reason" : issue["reason"] if "reason" in issue else "=
"
+                }
             # m4 CVE should not be in logrotate
             self.assertNotIn("CVE-2008-1687", found_cves)
             # logrotate has both Patched and Ignored CVEs
             self.assertIn("CVE-2011-1098", found_cves)
-            self.assertEqual(found_cves["CVE-2011-1098"], "Patched")
+            self.assertEqual(found_cves["CVE-2011-1098"]["status"], "Patch=
ed")
+            self.assertEqual(len(found_cves["CVE-2011-1098"]["reason"]), 0=
)
+            reason =3D "CVE is debian, gentoo or SUSE specific on the way =
logrotate was installed/used"
             self.assertIn("CVE-2011-1548", found_cves)
-            self.assertEqual(found_cves["CVE-2011-1548"], "Ignored")
+            self.assertEqual(found_cves["CVE-2011-1548"]["status"], "Ignor=
ed")
+            self.assertEqual(found_cves["CVE-2011-1548"]["reason"], reason=
)
             self.assertIn("CVE-2011-1549", found_cves)
-            self.assertEqual(found_cves["CVE-2011-1549"], "Ignored")
+            self.assertEqual(found_cves["CVE-2011-1549"]["status"], "Ignor=
ed")
+            self.assertEqual(found_cves["CVE-2011-1549"]["reason"], reason=
)
             self.assertIn("CVE-2011-1550", found_cves)
-            self.assertEqual(found_cves["CVE-2011-1550"], "Ignored")
+            self.assertEqual(found_cves["CVE-2011-1550"]["status"], "Ignor=
ed")
+            self.assertEqual(found_cves["CVE-2011-1550"]["reason"], reason=
)
=20
         self.assertExists(summary_json)
         check_m4_json(summary_json)
diff --git a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb b/meta/rec=
ipes-extended/logrotate/logrotate_3.21.0.bb
index 87c0d9ae60f..633987ceed6 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
@@ -16,8 +16,10 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar=
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
+CVE_STATUS_RECIPE[reason] =3D "CVE is debian, gentoo or SUSE specific on t=
he way logrotate was installed/used"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d=
)}"
=20
--=20
2.40.1


