Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4E2C10DC1
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 20:55:51 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.44])
 by mx.groups.io with SMTP id smtpd.web11.44675.1701896148262301517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 12:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=lX6A3BjH;
 spf=pass (domain: axis.com, ip: 40.107.15.44, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUrXOgOJQdQiPHQZBAERXO2IihftGn0S89WcqbP7pz5sWHfDg3xVN2JWl/8Zg7dyiehcHmMHKa9ZL/pPk/CDbX+QO+/GOdlOemy/RiRtQ6U2mLbqCROAyHSZ+xsoa68ZXD0lp05KpKYLhVJycBVlzEQOAajXIplmCbhpICmeE/LLxdnJhvX6wXJfZxeNTc8SaEfcyjJysBNAWqUee8AyxQsX2iQ5ftxDPSzhqvVpS0eHecKr8kHy1JOHh9SH42pEgYgAMUe1ubutwFSg2bGg49IpUEe4b6Pis63kfDwDXjtiJ7snOC1K48XBXxe7MVrBdCgZNfrv9PGOYnHSZPOTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2OnWcBxh3olzslySUW58TaI2XWrQx0dnh0ToS3CdtI=;
 b=VclwHF2YTdLjteCXxsjO0t7xPsm2kc05Cr6vgstd3V2/NFpK2kfEs5Ppm99AqCkjmsHhfUCO19EdfcilUhBg2/TvIhxpEe0r7P418pahFwv3ro/qaGIc0GRrodkIHen0Vc5VQU/UMCNyPcToTpRMKwi01iKidmecM0E/FmkkLIBIbsEjVq9/UJJxW+8UtnFCtCO4YVR8hKLF0SQtVjZOO+A1V79gF6i1ftQxUNz4PxOLNOvYhZ6YedIMEias2zm9VbmpCJXnj2YpGhIFZ9wuGVr0uS9ob3uTM8qfjU5B6VU3BzdWkeYSqzSQz8yf5TwAZgiWZYPeNK6iPmChoUwSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2OnWcBxh3olzslySUW58TaI2XWrQx0dnh0ToS3CdtI=;
 b=lX6A3BjHXo5Izpq8mlsk/7nZBwWBLfWPf9hTJF7WqaBfCH7+NM5AYEqwC3Opqtwk6GKXnHdXTN6I03Rim3nQs3z9eic2nstTBWVV4Eune4xiRm4nR5wDOCWiyFum4kIuU5xP+3/SnsqurbJsV8Lf6dFIs9Yo5MNXH61WrPVxtVA=
Received: from DB8P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::15)
 by DU0PR02MB9516.eurprd02.prod.outlook.com (2603:10a6:10:41f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 20:55:45 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::56) by DB8P191CA0005.outlook.office365.com
 (2603:10a6:10:130::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 20:55:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 20:55:45 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:44 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:44 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 21:55:44 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 615BBF686
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 21:55:44 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6Ktict4037601
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 21:55:44 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6KtioA4037600
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 21:55:44 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 4/9] oeqa/selftest/recipetool: Make test_recipetool_load_plugin more resilient
Date: Wed, 6 Dec 2023 21:55:26 +0100
Message-ID: <20231206205531.4037549-5-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206205531.4037549-1-pkj@axis.com>
References: <20231206205531.4037549-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B97:EE_|DU0PR02MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: d717a7de-0e0d-461e-fca7-08dbf69db7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uHRrWQbjK/1W0/b1G1909+gdn8i30aBIdZfBfS/bo+xNy8K4xwdJKB6sHAo/A17JDcAHow11ucdxSqbQrNHvDlLmBU1GgAgZV1Pwfssaa8Z/budLWVG/92xLtYfE63CMvp0lvIr2g9OhPD/OyNAWjhuihPVByjCLeXjDiqlQE52bF8XCGos7kyX6NVU7VjMEX18nAIZpvA94hR3mpKWW11imYhDsNhT7Ay+CJBf48o3WOYLLnC5iy4K+idFc7qTKsQNawABHCDhZwxjUuddeJnXKiOAJ5Sft0S3XBZcVe+NnIvsgitYxVqvnrffip+WeOX9jMQ5CpzitPeCxQERQ6EytqnV0WnVwcCKoNnyidLA96PQdwbDFRrCaGBoVdNdLoBMtF9L18Sui+y/WkWdxvdQysHv7tgIP+uROUNoSpgyKDg/2WVmZcr3P0tpM3pwTZV2G8hdSIQhK5KpuG8F/HYXeBeRiW0Jz/A2hg26cIfv+bxUAHUtb5LoOe6RPCXIODnU2qY8tMMSNL1iXkDGI5pdLekAwI2Vhx5WnzLShLEPEJ3N92DSHuzoGUvkAvpQ3a3nklviiSWxd0LbZhel8fWb/Knm27TWi8+VDoY5e+YULkZOVLbpxudsS7Rqej4sDCD0b+VomSbwFNnMu3B1rFe474hICiKa+jJm8GHdCS4l8VgzwBeMG4fbZpZH8Gne9lZtNd25JsGE1Ef9Ftnev1RoPciNltxqupuhbgRWtyX4Xw6wv7vJVjAj3a27odeOtJ6HAaZg/U3WGi8SmjVb35g==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(82310400011)(186009)(451199024)(64100799003)(1800799012)(40470700004)(36840700001)(46966006)(5660300002)(2906002)(6666004)(40460700003)(478600001)(8676002)(8936002)(6916009)(316002)(42186006)(70206006)(70586007)(83380400001)(82740400003)(36756003)(336012)(426003)(40480700001)(26005)(47076005)(81166007)(356005)(36860700001)(1076003)(41300700001)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 20:55:45.4821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d717a7de-0e0d-461e-fca7-08dbf69db7b4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9516
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 20:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191925

* Avoid trying to write to read-only directories and file systems.
* Support symbolic links in BBPATH.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 25 +++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 55cbba9ca7..3a05343210 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
+import errno
 import os
 import shutil
 import tempfile
@@ -860,7 +861,15 @@ class RecipetoolTests(RecipetoolBase):
         for p in paths:
             dstdir =3D os.path.join(dstdir, p)
             if not os.path.exists(dstdir):
-                os.makedirs(dstdir)
+                try:
+                    os.makedirs(dstdir)
+                except PermissionError:
+                    return False
+                except OSError as e:
+                    if e.errno =3D=3D errno.EROFS:
+                        return False
+                    else:
+                        raise e
                 if p =3D=3D "lib":
                     # Can race with other tests
                     self.add_command_to_tearDown('rmdir --ignore-fail-on-n=
on-empty %s' % dstdir)
@@ -868,8 +877,12 @@ class RecipetoolTests(RecipetoolBase):
                     self.track_for_cleanup(dstdir)
         dstfile =3D os.path.join(dstdir, os.path.basename(srcfile))
         if srcfile !=3D dstfile:
-            shutil.copy(srcfile, dstfile)
+            try:
+                shutil.copy(srcfile, dstfile)
+            except PermissionError:
+                return False
             self.track_for_cleanup(dstfile)
+        return True
=20
     def test_recipetool_load_plugin(self):
         """Test that recipetool loads only the first found plugin in BBPAT=
H."""
@@ -883,15 +896,17 @@ class RecipetoolTests(RecipetoolBase):
             plugincontent =3D fh.readlines()
         try:
             self.assertIn('meta-selftest', srcfile, 'wrong bbpath plugin f=
ound')
-            for path in searchpath:
-                self._copy_file_with_cleanup(srcfile, path, 'lib', 'recipe=
tool')
+            searchpath =3D [
+                path for path in searchpath
+                if self._copy_file_with_cleanup(srcfile, path, 'lib', 'rec=
ipetool')
+            ]
             result =3D runCmd("recipetool --quiet count")
             self.assertEqual(result.output, '1')
             result =3D runCmd("recipetool --quiet multiloaded")
             self.assertEqual(result.output, "no")
             for path in searchpath:
                 result =3D runCmd("recipetool --quiet bbdir")
-                self.assertEqual(result.output, path)
+                self.assertEqual(os.path.realpath(result.output), os.path.=
realpath(path))
                 os.unlink(os.path.join(result.output, 'lib', 'recipetool',=
 'bbpath.py'))
         finally:
             with open(srcfile, 'w') as fh:

