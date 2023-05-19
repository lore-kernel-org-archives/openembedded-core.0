Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345B5C77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 08:19:27 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.71])
 by mx.groups.io with SMTP id smtpd.web10.20896.1684484357258909574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 01:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=GLO8Zt5d;
 spf=pass (domain: siemens.com, ip: 40.107.105.71, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8Be/YwzOLfEIx+cCTq7ABPFvVCBYpqZhNxjrl+WkRNV48qvWOkldNw19VwhQ3Wrz1PLc8ejcxVnBhKJSJx0G/v/0koW41ESAxRhzZgrjYJoOAJS0TLJU//dlS+grE1+6917S+6MLuElYKwi1t7kJt9u5wxCbe0yKAr3SJKTquyoraKsU3jQjwlocdMG1It3fATpFdVLIXxZ7Gq6jpqQ7N9H/ozBCkjEiiGkXSGfPT7U+Vu2MtsOJmR+WdIUvc+j6ZAjBWzkkTNBT071LMS9BUb/2MKWszJgCFjKNGPgjRjZpzr1fqG6lr/sSifGRPepY8TidqUfmbbN72JK6ch+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWsiXAGKva0e4Q2+tCDT+9BxX7Y8FgxxTyngz3iNrD4=;
 b=QxPO6tkJO1Eo0XF4sLD4Ngk/fpwK5awJ5NN5LdlzrniY7mDyfaQVbYMbm4EsVdXlJSTPOvBqKDE43FxsDx7Qg2JGdGI7JzXzT50/VnuQuLse+NAOjzwJWNw0/oJNNH+MmApekcgSVs/icIiRtg7h3PbvPat7ts4tJr9aWyyMR8Nhe2O8g08yU1Ag+iizy0ZtGXFhy6L73526oSmkbaw70PERlz/Ko6TCfgYAMdg9AQuvCdrH9otkSYc5EjYxdjPd1FBSxSzqteCRPyAsVneoEFB71iBB6iClWEeXxjnVeMU9ASGR88IA8g/sZfYnAS/xslm/NGom4bBHrEdRCiSD6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWsiXAGKva0e4Q2+tCDT+9BxX7Y8FgxxTyngz3iNrD4=;
 b=GLO8Zt5dHg3uoCouJG3ljn69f891BWIqXPklKwH3yA7w2EZ7mI+tbVI2624AGbkbUSN7/u2ikKkFiG9np6lVBVwrU6cqTYGKQwUs0xDMFclrHU/W++VjlGI+XkF7/a9vI2GluQQE+vGpIR9SSRAVihp8Pa+Xcwjgv1Z/fUD7bW9HghKZcQTPdxD7T7Td2GyJXwpwZcsyr7OJXyQz1zCxhseUkoDM9H8HdP8IlUu64xVFeHnW15qfqWM43opP7aG5A+yToQiPX/E7c9Iar11FKPDqWWVCP0wiB5xvjpeN22qiNkh+hDx9WToC1xa1SkU8daS/I5TVU98UhMM9aznbqg==
Received: from FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a0::16)
 by AS8PR10MB7112.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:61f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 08:19:13 +0000
Received: from VE1EUR01FT046.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:a0:cafe::70) by FR3P281CA0179.outlook.office365.com
 (2603:10a6:d10:a0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.7 via Frontend
 Transport; Fri, 19 May 2023 08:19:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 VE1EUR01FT046.mail.protection.outlook.com (10.152.3.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.7 via Frontend Transport; Fri, 19 May 2023 08:19:12 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 19 May 2023 10:19:12 +0200
Received: from md3hr6tc.ad001.siemens.net (139.22.107.140) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 19 May 2023 10:19:12 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v4 2/3] oeqa/selftest/cve_check: add check for optional "reason" value
Date: Fri, 19 May 2023 10:18:49 +0200
Message-ID: <20230519081850.82586-2-andrej.valek@siemens.com>
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
X-MS-TrafficTypeDiagnostic: VE1EUR01FT046:EE_|AS8PR10MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 049b720c-aad3-45cb-8ff9-08db5841ba78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5AVcxKQd3gAbLdSkpX/bx3zlamAkuVPWQ/msdKokTEp+C+rCsDcH+opr4v3rAjpFVv4ymp2V7dmZC8R8zTHdCfyFuuruoytmXk/BxpFKxd0ruzD6vTkQCdoi1C8/i+QMQaSC/F+K02+Ue22yrjARmTgKSFpJ7m3BEi9yaQMoHF3S9UHyZtwSLLEb/fVe8vy0gcRhJQm28xMCvcX1peYINEpyT1uGNuk/naRDIwlZSLK0CTcnyE/tWGpeM4aF9DU4b91gUct6TX/9/Snadet/Kylal3it87nSMFCqGoQjGBqyLsLBwaQmKxUDcbpzmSrlD6caIMHSDhGYGsVvabsdx+iTateOgNeNNJmPSHVcsyXQbXs76dKoLm8nGEzuYBQ7w184DZ51BqKMfBnYIIIbig66jQUqLpPAKa29f3P/oMA2mh+8NelFxqH3534l3Zqg/fq6+rjxJzL3fG/0f1BngEubfzRk81oDdHrPffmXRd9VzxEz2bYsehhrHrc50zaTYEX5lYnwp0lw7dhUEctcZJQNRTylmDGINxFFBfpCER9eY13+YwWMFEpfJdiIs41lHiC7L+7E9hVMwIGzjPgqmAGFCRX+t0F+LPMtjLZVouASUD9+1jigQbkukgpNc+6+JDN8QeghUt8IUcF3xW8ZPFzwrniJskKTU9xHbtLsQiq4VLgHIb6ForTNeHNVUoaRneGZRsDM94P5fwxo2FQ64TiPYt4Q9BUAyEJPFbiJ4ggRt8DVqBjBgyfwSxxwhhvWfSDPj4+Z/0pzgf87p85oIw==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(26005)(40460700003)(1076003)(107886003)(36756003)(83380400001)(36860700001)(47076005)(40480700001)(956004)(336012)(86362001)(82310400005)(2616005)(81166007)(82960400001)(16526019)(82740400003)(186003)(356005)(44832011)(5660300002)(478600001)(2906002)(316002)(6916009)(4326008)(8676002)(8936002)(41300700001)(70586007)(70206006)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:19:12.7170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 049b720c-aad3-45cb-8ff9-08db5841ba78
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT046.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 08:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181538

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


