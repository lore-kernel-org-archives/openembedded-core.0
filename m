Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9273C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 17:48:49 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.42])
 by mx.groups.io with SMTP id smtpd.web11.90873.1701971326974636447
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 09:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=UP3Q/b73;
 spf=pass (domain: axis.com, ip: 40.107.8.42, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEQu9ivXQg1/Aj9q7lu1sKpPj31GZcVsdolwPn8gveSkXdJ1/aSfAJZRLmkkpL/+Vz65zujhmp/m7ku3MJbSvTBGxIYr21mOD7C5sE0exD2EdJ46l2KkX6+Ip+OwkvkHvAbvH4TdCi3+w9WED/0DimIIEX9K5zx4Xq04ACVG13fkHeO23pNiirIsKF6D/vkCHcn+IerQDWyrBIkpGzbW6hK1aGt6IGFFu4Z8Wm5S3vFG7oyb0xvaoMGSGs75zntpeo6+63faeoXuYbqcfNC/QHY1PIocErpYNGML6Bwt5EI385e3fhC2Dc6tw5UYq8wUOIC2Wa48LfCPCFQtrXmRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsibqySQ+4iXqNmzSWpo+GlbUYMVpKLn8vxLB9o5zsk=;
 b=IddPopGI9a3WABoWHcQYpp66s0aO9rP1NDcD/rCbjYpWCjZwnSyngFUpkStIXMnGE6Zl6K+FbBlX6g9aVdhvAwpilfePpLUuVEmvCZXO4WOqO++QCu0/qyDrmseFw56v/Rn5qmTxLzfFFQVFXgYh5ob1Hu+JN9Kms0X1UYUwqPts6YCrjgsVRDSv1iZoc4vGly3LJsAFkZENDTK/fX4i2Y260CNP1ifPrUYc8j78dI/IxTi7fBuZXmBy6PfFaee68HYf7sFnu9Mz2C4NWvDuYPPDZt0KcrbcVSDxnx/KDhHzmMx8aGZYUdwRda3wNFW/d/Z8GMSnDv3ClYe3wNfPqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsibqySQ+4iXqNmzSWpo+GlbUYMVpKLn8vxLB9o5zsk=;
 b=UP3Q/b736W35DHdh5lQVIAoLRyGzcRLxDKZCxNlV9C/vetu99FCMJYwfX0VrIswGJ1wQFuBv4J7q5k7PAHMNhKlBNOz2pwLfysXswDTo7rEPGIu+l6D5ngMi3zxZos86y2IevoffGEK9nh4xSEZMyzBT9wa+ANvVITedIxRIeLw=
Received: from AS4P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::8)
 by AM9PR02MB6803.eurprd02.prod.outlook.com (2603:10a6:20b:2c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 17:48:43 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5db:cafe::43) by AS4P189CA0016.outlook.office365.com
 (2603:10a6:20b:5db::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.35 via Frontend
 Transport; Thu, 7 Dec 2023 17:48:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.2 via Frontend Transport; Thu, 7 Dec 2023 17:48:43 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 7 Dec
 2023 18:48:42 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 7 Dec 2023 18:48:42 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 9D1AFF6F1
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Dec 2023 18:48:42 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B7HmgrC810110
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Dec 2023 18:48:42 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B7HmgHs810013
	for openembedded-core@lists.openembedded.org; Thu, 7 Dec 2023 18:48:42 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3 7/9] recipetool: create: Only include the expected SRC_URI checksums
Date: Thu, 7 Dec 2023 18:48:39 +0100
Message-ID: <20231207174839.809315-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9C:EE_|AM9PR02MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b119f72-8e19-4a93-c445-08dbf74cc0ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tRMeUeMXuLoS1ZZrLr6OV7uvEk0ulsL/zAhJr6eI9bOrV1M5zRtOI3fswzhmH7xumbz7CHij2LEvya5teMw+aHPZHSBU1RmME0KEhR5cPn3w5s+QFm+JdcTb5fHKycvOQH2ZtydgJB1KiV5szJxDJsMS/0cmtIRpI+QZ9z5y26nLEnhCQ/Iad+R9Q1o4L+OfDMbcpnpKpOBRZ6JY485YnwG/x/bX1pYrxJa2XEAQXZ2uIVJGm4tp5GiPjs+0yYYOyU/Ywe+VXbqiD5dgkc3pQkANbHx72dXTRq5/BAXluF2tGy0U47sXBuMzFlG9PHRmIHRTjKkV38Vkg5Cg5rq2XC3lJK2muyARwlf2FqwuAV3dYnS8SKUuds2GDb6Q1v7IO89mlBw/upnqrTNUoGsmOPj05nlFloi7cZQ8TW0jVsF+RID6ROTaMaojonUGR323XVisL1qjuJ7vfCkX9tsxn5W/vG7X/5TGtKVxw2CI4kQ2ZZU8QWEji3VWB6suGTeLydirZ8yMd7FXCOgnEenhrSGz00FO3KWFtdnzaPtM+3DFfSKB/Rp0g7mmAfRqOsWqJvkyPSFnVtrOGwlZvTRfVdr5dHUtBJjH7I9sEdPQMNsfqdXl9EmFdIXXnRicT2Fcfh1ujB8N8RY6WQ1JiufKGYz6mPfqlwuBzOffY9RN05Jen6qYaby8bMqHj5zRhJu4Orh77ktQzETfm0eiNCwGUzjygCEhJZ2mmojcvrEnEGLO3b76oMG8SldjuAmAVNkh3uv6PrJyzIyu7pwEjMwV9cnZZPUi5XemRDCesIDSPxo=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(451199024)(82310400011)(186009)(1800799012)(64100799003)(36840700001)(40470700004)(46966006)(40460700003)(356005)(8676002)(8936002)(82740400003)(6916009)(81166007)(42186006)(316002)(70586007)(70206006)(41300700001)(36756003)(5660300002)(36860700001)(2616005)(1076003)(47076005)(26005)(2906002)(83380400001)(336012)(426003)(478600001)(6666004)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 17:48:43.0307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b119f72-8e19-4a93-c445-08dbf74cc0ff
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6803
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 17:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191970

Rather than including all SRC_URI checksums, include the ones that are
expected. These are the same as are output if no checksums are included
when building the recipe.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This is based on abelloni/master-next.

 meta/lib/oeqa/selftest/cases/recipetool.py | 2 --
 scripts/lib/recipetool/create.py           | 4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 20dd41f492..08da029e6e 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -349,7 +349,6 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] =3D 'GPL-2.0-only'
         checkvars['LIC_FILES_CHKSUM'] =3D 'file://COPYING;md5=3Db234ee4d69=
f5fce4486a80fdaf4a4263'
         checkvars['SRC_URI'] =3D 'https://github.com/logrotate/logrotate/r=
eleases/download/${PV}/logrotate-${PV}.tar.xz'
-        checkvars['SRC_URI[md5sum]'] =3D 'a560c57fac87c45b2fc17406cdf79288=
'
         checkvars['SRC_URI[sha256sum]'] =3D '2e6a401cac9024db2288297e3be1a=
8ab60e7401ba8e91225218aaf4a27e82a07'
         self._test_recipe_contents(recipefile, checkvars, [])
=20
@@ -407,7 +406,6 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars =3D {}
         checkvars['LICENSE'] =3D set(['LGPL-2.1-only', 'MPL-1.1-only'])
         checkvars['SRC_URI'] =3D 'http://taglib.github.io/releases/taglib-=
${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] =3D 'cee7be0ccfc892fa433d6c837df9522a=
'
         checkvars['SRC_URI[sha256sum]'] =3D 'b6d1a5a610aae6ff39d93de5efd0f=
dc787aa9e9dc1e7026fa4c961b26563526b'
         checkvars['DEPENDS'] =3D set(['boost', 'zlib'])
         inherits =3D ['cmake']
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 6e15326c55..d2997cc242 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -706,8 +706,10 @@ def create_recipe(args):
     if not srcuri:
         lines_before.append('# No information for SRC_URI yet (only an ext=
ernal source tree was specified)')
     lines_before.append('SRC_URI =3D "%s"' % srcuri)
+    shown_checksums =3D ["%ssum" % s for s in bb.fetch2.SHOWN_CHECKSUM_LIS=
T]
     for key, value in sorted(checksums.items()):
-        lines_before.append('SRC_URI[%s] =3D "%s"' % (key, value))
+        if key in shown_checksums:
+            lines_before.append('SRC_URI[%s] =3D "%s"' % (key, value))
     if srcuri and supports_srcrev(srcuri):
         lines_before.append('')
         lines_before.append('# Modify these as desired')

