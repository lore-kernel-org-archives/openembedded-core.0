Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BE1CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 14:07:08 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.66])
 by mx.groups.io with SMTP id smtpd.web10.78371.1756822019986472079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 07:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=IYPA9MPs;
 spf=pass (domain: axis.com, ip: 52.101.69.66, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiMRVd8Z+FFVolWzr5BEaba7byDE2thOZuUbKRCHJG9MOSFhyMpYCMBuw3HIITlwwXJmj7QPxe15oj72Nx4IDwu/QxKpkHt7fSzSXbugTMt95EHAv7Bv8nkWVDTaX33wLchGQ7KCgt/K+baORCIbB2aZhSmVUnbaZtj0qZG5VXp3Soddi2u2D6HihMQQXViXEVtSjKKVYA4miyZgEgMZQUQpulX5BV2VQmMktKSnstwJAl6X8c9vU93jfqUVpZN0MZ6xoyWwilwo4TGsE8ihYiIiarncxhuEFPZCiW4hgw4+2dIxSteAobpdJCxGfLBNRlA0OVoAnl5ugBPBfuI/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YttSK1SF7yNSj9YH90jMBnZ1H1ikX5ny1P2kv9kIlMw=;
 b=tdb28WPrOs2Il2HDO3/Ws6uIoTKK9cNPYdaCyXY7PSP7oIOHVacAOIkrkGekl8Z1abcTUv0eYsVJtGFtkRcwKxRpK2dqw6aL18YbBFNt7xYSIxcJZWlDlsAiltSZ115DzhjJXTeHfQZS6lICzjQBypSJDUL8gBPK/uxM4cKy51Oh+/iWIKeuc1y8nqHvSeE7EAzK4vlujJ3vQNV48mvc1Kk2sHFe6HFzDjjBaIQDmz4Cb6SviHGrPF3BHHm2qQysZWsIEVzGViDNi3hBG1lS8glFaUo/KfoCkKAEIm62fwB0/15w2x/AANAoKnL21DQWvx/fsfpkyRZV1GuOMWIZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YttSK1SF7yNSj9YH90jMBnZ1H1ikX5ny1P2kv9kIlMw=;
 b=IYPA9MPsIb1RnBbRTBj0lfOqkzq/a2UAfgtwRZDKBOaaObm++d2SksetBDD1hYmN9dQ6BNIe9mHm/Y2evupFqV19/FIaBrbCTcfeJNazcCuJuXPcofl0y/PGYzjFY1wTA/KlKMAEAA5lVWxanXQDhZGa5YlTy9p5V+gpVTRsiOo=
Received: from AM0PR02CA0184.eurprd02.prod.outlook.com (2603:10a6:20b:28e::21)
 by AS2PR02MB8863.eurprd02.prod.outlook.com (2603:10a6:20b:556::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Tue, 2 Sep
 2025 14:06:52 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::e0) by AM0PR02CA0184.outlook.office365.com
 (2603:10a6:20b:28e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Tue,
 2 Sep 2025 14:06:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 2 Sep 2025 14:06:52 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 2 Sep
 2025 16:06:47 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Sep 2025 16:06:47 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id A72F3EE9
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Sep 2025 16:06:47 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id A066D2426D0B; Tue,  2 Sep 2025 16:06:47 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] oe/license_finder: Add find_licenses_up function
Date: Tue, 2 Sep 2025 16:06:45 +0200
Message-ID: <20250902140647.126140-2-christli@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250902140647.126140-1-christli@axis.com>
References: <20250902140647.126140-1-christli@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|AS2PR02MB8863:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b0fe55-ba03-4a87-d78d-08ddea29f78b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aQz/cJUy4IqY+OmHBmHUsl+n3Iy7PAJzb4SlIn+rqGbQkPqikvhPbxqEB0hL?=
 =?us-ascii?Q?vMHlQsq9FJLH0uIr8Fpcv1pWwVxqIYATNb2Gop3QoUNF8Ki06bDdqKrzOmP7?=
 =?us-ascii?Q?QEVULUyGVhY4Aai+m+Ok/wbfJzkUJ7P8JBhBMHs+SuG3NL5SxQCdkytShLUq?=
 =?us-ascii?Q?X05hjF4l30fz+0Ts1UpC1Wc771K9EP2sL4tFd+gSGP+OBWR8WiBOd4EHBohp?=
 =?us-ascii?Q?FNu+QL/AL54kg7zbLA6epks1ow0SjcIYtBIAkHU9lsV6AYB8nIZT4a0qe6HE?=
 =?us-ascii?Q?N8G8aD23k3B6bPGjbnKD++j9MS0MKd4uek/oKyxSZ3OIurXf222lBNPwYOif?=
 =?us-ascii?Q?xeerc88s3tyU0ZYCyPC94j1Cs9MxR57WCKuVZZmb0ELwFq5jecx79nzZ87BG?=
 =?us-ascii?Q?JwZ2Wam35vtILUYxeb7ZZLy6L/zr00F8AM6bhqTTQ01XSrmr9zKmt+ZWN4Ye?=
 =?us-ascii?Q?pivRtCYmkH8FUpE053lxPEqzksKXokO0JAMLx9IuIPIA3wSg6jnCH7sBkxp2?=
 =?us-ascii?Q?jcIiWmeqQLB2FNcT1LnBT1a9PjEAERYb37DAIdyMMIxkqEfNVP3D2LUvdODW?=
 =?us-ascii?Q?xOVNfC55lq0K8C03Iqxev6mTPJLUCQFjfIRoZI/wDYc2feG5IE3B7sR9EEsd?=
 =?us-ascii?Q?Le5Q5+lxEAqeWtGpBcdF5GkvfScf9S2xZLSl3xdduwU9F9bxROrNOaGswBlP?=
 =?us-ascii?Q?UJEDU2l/o9u7ihUcKlxskBggMlo08kevFEMeDpFtgQXEfLDGZkcxqI1yNFpT?=
 =?us-ascii?Q?vvpk1c31sqSCX2FttVMPxaW02DBcuubM6X2HxxLATX6WkaCQOoJZp21hvhOv?=
 =?us-ascii?Q?SLL49IlOtslPS+ltpu5Fq91uvxNZVS6nBtiuHp/nl68Jw2K47wY0PSiXUYWf?=
 =?us-ascii?Q?6vN7sU5c0a+Bcfgpb51dsLpcHN2xQvnYijf6s/k5KmW2scjf+Au0HWmzI/Dy?=
 =?us-ascii?Q?V+9mJZSJr0Nbq8UpecGyFOQAd6JIBsSEvgElf6la9F8FK363NjhMmUNvVyJw?=
 =?us-ascii?Q?W4rUOCB5K5yIDDYuhdZxftsbs+y9ftX074gPxWPrYtlI/48lczWxeEJgNwtV?=
 =?us-ascii?Q?s2xt2/Q+u3hmf7JXz2Cooq5adhifHI1t64Y7cJd6B+MPuCS0kg+O1KCqHCDQ?=
 =?us-ascii?Q?PY2RgsmppFmpHZoA9HGFviHdkXy62qqcXGlcGbgFV0hXfTDdIesvLO7SqjdO?=
 =?us-ascii?Q?674tPcuM9mYf3BX6UXTxgllcT1g3NjtlOwvH0DRDkjc/SmZ2c0ylBzOjafVn?=
 =?us-ascii?Q?B9MmYplHYPNDnw4+vRVOKzp9LdKfgkCeaqM6SzHLCiaHnygudVfJDKIiT0Vq?=
 =?us-ascii?Q?9KqeLtLANr1ktvo3fRpexU8828n8BkOB4oz/hnpPCGe8HzvTTcgM7AkJjC9T?=
 =?us-ascii?Q?sJUOxNV7qQ7xlRP8Wwg/TOxmo76nkxJqD1wFp/tE72CDFKJ9qHIfjlIFXHGu?=
 =?us-ascii?Q?TkdkMwkTDpOPVLmKkWv0wIX4ajE156TZFGP8I5Mqas9VEJB6ZZF/75/oDf7v?=
 =?us-ascii?Q?qhUwag9zfbC6yc+njiQfNyFKVrwqzvz5Yr6U?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:06:52.3756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b0fe55-ba03-4a87-d78d-08ddea29f78b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB8863
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 14:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222729

From: Christian Lindeberg <christian.lindeberg@axis.com>

Add a function for finding licenses in a directory or upwards but not
above a top directory.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
 meta/lib/oe/license_finder.py | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/license_finder.py b/meta/lib/oe/license_finder.py
index 16f5d7c94c..4f2bb661fd 100644
--- a/meta/lib/oe/license_finder.py
+++ b/meta/lib/oe/license_finder.py
@@ -120,14 +120,34 @@ def _crunch_license(licfile):
     return md5val
=20
=20
-def find_license_files(srctree, first_only=3DFalse):
+def find_license_files(srctree, first_only=3DFalse, bottom=3D""):
     """
     Search srctree for files that look like they could be licenses.
     If first_only is True, only return the first file found.
+    If bottom is not empty, start at bottom and continue upwards to the to=
p.
     """
     licspecs =3D ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', '[=
Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*', 'e[dp]l-v=
10']
     skip_extensions =3D (".html", ".js", ".json", ".svg", ".ts", ".go", ".=
sh")
     licfiles =3D []
+    if bottom:
+        srcdir =3D bottom
+        while srcdir.startswith(srctree):
+            files =3D []
+            with os.scandir(srcdir) as it:
+                for entry in it:
+                    if entry.is_file():
+                        files.append(entry.name)
+            for name in sorted(files):
+                if name.endswith(skip_extensions):
+                    continue
+                for spec in licspecs:
+                    if fnmatch.fnmatch(name, spec):
+                        licfiles.append(os.path.join(srcdir, name))
+                        if first_only:
+                            return licfiles
+            srcdir =3D os.path.dirname(srcdir)
+        return licfiles
+
     for root, dirs, files in os.walk(srctree):
         # Sort files so that LICENSE is before LICENSE.subcomponent, which=
 is
         # meaningful if first_only is set.
@@ -177,3 +197,8 @@ def find_licenses(srctree, d, first_only=3DFalse, extra=
_hashes=3D{}):
     # FIXME should we grab at least one source file with a license header =
and add that too?
=20
     return licenses
+
+
+def find_licenses_up(srcdir, topdir, d, first_only=3DFalse, extra_hashes=
=3D{}):
+    licfiles =3D find_license_files(topdir, first_only, srcdir)
+    return match_licenses(licfiles, topdir, d, extra_hashes)
--=20
2.39.5


