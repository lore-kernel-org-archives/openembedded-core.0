Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A7BC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 06:31:33 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.42])
 by mx.groups.io with SMTP id smtpd.web11.34473.1715927486962907082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 23:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=HRpxleTc;
 spf=pass (domain: axis.com, ip: 40.107.7.42, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIlN61loXuxK1o5QrKjI+LHrG9BpJzLuAhkLLplG+L9ONJEaessJRw3i3zaGWsclg3cKNWT+tCpZ9ATuXOCF/VQgF3J6U226HKrnEWsZ5qdZldrvM7n6YKOtBM06vqX6NF26RSWttz42skn8XQO2XkgD41/ETOuMuNkiLfI8WGaruddJdwoD6F0eCUfsrDPXXp5jJcTLzTuvhIRwIx/F205bfCjiuqDAsQhXCKNjT+An2w4hdZxvu71ciDWftfbxEcR7bzCbrCUD3gPvvIHovFsxWcn7FRD/Noe65qTl65Jkn9Y7EUqh3fhtIfyvPES8encwFiy5KMElMrmEmj6ERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzvfzLS60HpfX4RD84xL7rU0weNJiXJJi16+mM3zJ0g=;
 b=Pw5J5HmRqZCdSfDNOn6E051h+wXxIM0koYFTtyOtGGEdZUZUkYktP8amA4+5EjsD4UiMpcBRjDue/ElwOLXGiEeP/zo1OFBrwR1pQo8SJPTj7ounxKnAOpR83D5aHBy1DpZZydI5u7ELmoK0zaDLz0rab+FlnArRPEUTqlXxiyJFYcv+lggsNY25EpC8HnUsjUsKXzAx0uM4W59huB8F16PrWxfF+70bayBTJ64OHnq9YT9ujIY86R2NbIVk3CXuCXNS45qjOrUaAwLRwxv06UhWr0VO0to4tup20Wp1xP9wNgvabo/87+ZM8fdKgFNbJnlx3wFoe0LCi2AUEg8uNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzvfzLS60HpfX4RD84xL7rU0weNJiXJJi16+mM3zJ0g=;
 b=HRpxleTcKpAk4RWG6Iaz2lSIbdphqB/yrCgxDRBxp44ISp4pSJkwEbF2ar1bZETJnBdyfaxVr2VQ9IPzSc5KDDpiR7583YgSzg2q9QIEW23FtExriqlE4pokWYN72HOwM0v6Ct2jVCJFUCXt9an8yaDZhGlM+jSFMJ/csVNsiO8=
Received: from AS9PR06CA0748.eurprd06.prod.outlook.com (2603:10a6:20b:487::15)
 by PA4PR02MB6784.eurprd02.prod.outlook.com (2603:10a6:102:f4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 06:31:20 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:487:cafe::8e) by AS9PR06CA0748.outlook.office365.com
 (2603:10a6:20b:487::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25 via Frontend
 Transport; Fri, 17 May 2024 06:31:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 06:31:20 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 May
 2024 08:31:20 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 May
 2024 08:31:19 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 17 May 2024 08:31:19 +0200
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id D2B7C131C;
	Fri, 17 May 2024 08:31:19 +0200 (CEST)
Received: by pc58073-2410.se.axis.com (Postfix, from userid 20853)
	id C39DE4123773; Fri, 17 May 2024 08:31:53 +0200 (CEST)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <olani@axis.com>
Subject: [PATCH] oeqa/selftest/devtool: add test for modifying recipes using go.bbclass
Date: Fri, 17 May 2024 08:31:53 +0200
Message-ID: <20240517063153.2587112-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000003F:EE_|PA4PR02MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f75c640-d258-4e40-48c9-08dc763af706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?j+L7ecnycT0VGnjzE6Y9HBGScolS7yydUHx3jjHzxJen9SiniIVp6DSzcj06?=
 =?us-ascii?Q?sjCqP6idR7fgh3YN9mBdzK+cw903KGbUuPdWtejsO4z7rFAWLqdCOi7yLha+?=
 =?us-ascii?Q?IeRGnxAk9qzdpyy+TZcE3q7fTHiyyo73ePFuqnDPHYc+bhG0KL+vlbEbunxc?=
 =?us-ascii?Q?dANcQSVMOCDprPmpaDdO9YmOIY3lms77cVpfSkwVW7C4EPvvOZEf7o3C8C5W?=
 =?us-ascii?Q?9BMKrDSG1RFUQ0UuG+W/NpWy90N/sbVMSOtvAdwIJBp6OXrkgMfizzY7bUc+?=
 =?us-ascii?Q?mWOKLEpUR3nfncxPrzymEen6Ub4LUbQ5+I3srGklhcvZSA6Tof9l/pARUt4e?=
 =?us-ascii?Q?xXfLWX0Rj8ZsapZm3B38zdK0vsseOTqYwXE6v5jnS+TsmJMIB96+YHanOTmQ?=
 =?us-ascii?Q?aX8B/p3c6uYEqcBdLefPtvOqCsvJKHGhar/tPUVmIJ6/2665FLw1x2NOvC2q?=
 =?us-ascii?Q?+Xkxw6Yj5wPlaN44ZsTUJfSDqO6JazT+lTqRKixTr8AOguR2C60dP1lM0xp1?=
 =?us-ascii?Q?osEqhhHTVd6Ql0R188uSRMDdn6pkhVM0W82ZcmPuoxZ/1WiOdgP2duiebf56?=
 =?us-ascii?Q?XSQDgt56rHkLIkJ8FrXSq1+xpW0wflQyGl1of61Vz7zvAjNw2mI6XoUB8HTS?=
 =?us-ascii?Q?ExFfYuAsNXFfrlAI6jOgK7UTSrhbAl7El/OaaExF3rn0YoY360F3jCazfF2F?=
 =?us-ascii?Q?rx3OAKnD9LnBcs7KZSr0p7615tDbI4SimNnKseJcfqb7ylTUGDkwEX7MVmkh?=
 =?us-ascii?Q?Cg994J7g48iCZe3a5E+26ZCIJaYrDJmb8ARn580eGFzv7AQGbJAzA/t6IFeR?=
 =?us-ascii?Q?p7qgQuVwd6P15+C4lfabd9sOhEUkdoj3bXN4QbVIumRJbc3ZhE31XgGivvQl?=
 =?us-ascii?Q?8ZhF/g4FKdrOqq78ot9OKpvmJ+HXviJ3eK/eYl7Cl3Cr91cJZA6GPbrz/YDQ?=
 =?us-ascii?Q?j6Lb5nnZh4959mZgRejKqW/iMDMx/eQn++PV2N7MzkYGBKmdFuwdcWvyv9eM?=
 =?us-ascii?Q?LhuFDGj/vNwfOID1vRBF5B3E7Un8vF2Bj0Ah6svwMaKBv2cs1f9iWpezMbV4?=
 =?us-ascii?Q?YuPQbembgHvdBnsroX0jCDm7EiN9JfxZwzUXwi4v0WaIiQ6WU4P1DXoLUUkK?=
 =?us-ascii?Q?wrMDcQ+NZf3YbT/FRqV/Mico9Lu5mCpUBb6hc4fOd2Ar8tKbb0ura8Wy7Hd/?=
 =?us-ascii?Q?6TyaggppzF7qHGSnhm+QvvLv0jlmmVaGaiNdj71SltwWBfTfSOEq2WNSR6KW?=
 =?us-ascii?Q?PMeEllwTM+OoTpXHpRZ8CcohoJQAyKgvB/mkEsbIVcnhvcL4bsYoqczWuod4?=
 =?us-ascii?Q?0KgaHbeCCd/JLZq094L2hFXXfmjWE7lqjF+sjlozMIbNvnU4SwxEND2R6r4o?=
 =?us-ascii?Q?j2cA3ynpo7QHac0W3zOdm+jfh204?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 06:31:20.4020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f75c640-d258-4e40-48c9-08dc763af706
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6784
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 06:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199504

From: Julien Stephan <jstephan@baylibre.com>

go.bbclass uses a special do_unpack function that causes the git root
to be different from S.  Verify that it unpacks as expected.

[ YOCTO #15483 ]

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index 882225dde3..fc08906117 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -753,6 +753,25 @@ class DevtoolModifyTests(DevtoolBase):
         result =3D runCmd('devtool status')
         self.assertNotIn('mdadm', result.output)
=20
+    def test_devtool_modify_go(self):
+        import oe.path
+        from tempfile import TemporaryDirectory
+        with TemporaryDirectory(prefix=3D'devtoolqa') as tempdir:
+            self.track_for_cleanup(self.workspacedir)
+            self.add_command_to_tearDown('bitbake -c clean go-helloworld')
+            self.add_command_to_tearDown('bitbake-layers remove-layer */wo=
rkspace')
+            result =3D runCmd('devtool modify go-helloworld -x %s' % tempd=
ir)
+            self.assertExists(
+                oe.path.join(tempdir, 'src', 'golang.org', 'x', 'example',=
 'go.mod'),
+                             'Extracted source could not be found'
+            )
+            self.assertExists(
+                oe.path.join(self.workspacedir, 'conf', 'layer.conf'),
+                'Workspace directory not created'
+            )
+            matches =3D glob.glob(oe.path.join(self.workspacedir, 'appends=
', 'go-helloworld_*.bbappend'))
+            self.assertTrue(matches, 'bbappend not created %s' % result.ou=
tput)
+
     def test_devtool_buildclean(self):
         def assertFile(path, *paths):
             f =3D os.path.join(path, *paths)
--=20
2.39.2


