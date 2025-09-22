Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62FBCAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:51 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.60])
 by mx.groups.io with SMTP id smtpd.web11.47559.1758531650734246001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 02:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=khR6gOBM;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.83.60, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nieTPxmzGFAeG19211KAl49StK3Fdnw0bQb9R/d9T5ZgKM/IOFoNC1/ArPqeEryLs7XuVHt+2IZvRkgVAM9wIUTVopNL+f6KGzQJjVzuHIMEdcrXTcw8GdITlwm2pOhXhroTqiDfh3qx/b1QAwstweq1IG8PiOe+sYlWusn2Q93rORksUygAXD8h0f2oDjUIl3r9a5JiTsWnKLX0cVPSw+Crey+o/MNOOQqMQGZaec58tb3w337UBnIlUQrKrY/Bkh3kUq7gqi0ejf4HEY82z+z5FINshT7obevCN7l4IfqM2TWSq0cdm3MznPw53GZ7N+d1+eNcOJ94QUQC3gbQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dUukTcVdgJD9gZEFnyo7uiWOt4VVVGZ7pIfN5S1vpw=;
 b=Ig1qJC5HNUlK91KeJm30Z5JZyUifMPme5TLnvnZPsLRrZEd6xREp8tSgI80OXy8tRILC+PD0hb4V44gKG8GdFFhcn00/kOw9u0C+0hxppl+lOFIZzyBO4kF4sjviwMRVe/kp5Vk3lwtrOoqu8QrsBt9Py5Q8A6pkqUah4Vt0FpMONv0qhGDC6/NXu5wEbxmqlJYXXO15glvDDnXizt9+qDpDptUsQj4nEbHxLHoV0Rgxf0DjiRbQYeVX6fKPUErd7oyL20CgRL1TczBhdcSsanXR8tOfMQpsluciWibHtsYBJTT+GlSsiyYMm8kasaHwn9mCQrnAM3rJmp5W5cyQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dUukTcVdgJD9gZEFnyo7uiWOt4VVVGZ7pIfN5S1vpw=;
 b=khR6gOBMfdIAM7SdK5atv0VfzoH2pUFDtJQxBX1O3031SXl9cMakEY5O8h/2mXbMMHYalY4MeKnYHvViHCr+cl2iocqh3yXjUZq4rqnk2jQlrxpeFVrJk1doBJ87hbRKHqK2h2CjxffhZCxvjByWOE7iSKJSpGBFYQvBf1PJInA=
Received: from DUZPR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::14) by AM7PR06MB6612.eurprd06.prod.outlook.com
 (2603:10a6:20b:18e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 09:00:46 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::a6) by DUZPR01CA0012.outlook.office365.com
 (2603:10a6:10:3c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 09:01:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 09:00:46 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 11:00:42 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: jie.gu@leica-geosystems.com.cn,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH v2 5/8] systemd.bbclass: properly handle user units in systemd_create_presets
Date: Mon, 22 Sep 2025 09:00:37 +0000
Message-ID: <20250922090040.2859103-6-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
References: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 09:00:42.0931 (UTC) FILETIME=[6046A830:01DC2B9F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|AM7PR06MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 26265cc9-98f7-4f3d-0202-08ddf9b684bb
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fU9shU3PD/jtFJ8KbDFyOovcZ0o1GpSgoW4Uo4Uc88HeNpvzwYY8UN/lcd35?=
 =?us-ascii?Q?9VWm/awFTSzuKqPTEyqUZid17OgzP6fIdAc+DYIHkSRroDr10MgoZ7/sNbFH?=
 =?us-ascii?Q?D7BZx15zc9CAxEJI6ZNs4iy+Gu65zMp6JJWH+0vRAn4ebR+1pj8xvBJbCQrw?=
 =?us-ascii?Q?6XLFtE/YGoT+aupya9ua9RwzOYunbL7JvJdhyRUhSdqj+Rhuqv0PmrxK8F27?=
 =?us-ascii?Q?IU3N7SZjlqpv5faKSqwNxy2yHdw7Qhozw1KObt8UV4KurX7WFc5tRPYSPkb1?=
 =?us-ascii?Q?qiv8Vj1cj4nekSvESpxrreaxbtKzsaZFVjfcDWHL/2n7tFVWet68mTcwIvZU?=
 =?us-ascii?Q?qxBp1wAt+ZYxaMtkHZLiRLD1w2KFSDQM2TkEHnxvtokNUFG6MWNp5ZLlzpVN?=
 =?us-ascii?Q?GupUk0WdvIOuSAc/p82tiVpGooLAewjQTY8+N/KzyXi6ATar182edeO/fZRI?=
 =?us-ascii?Q?O3psjhD+6l5MtFvKn7kPLgApYiEKMz4NmjgENBSJc6rZ6bfWGsl9Z/9ez803?=
 =?us-ascii?Q?oZZrLlW/6k0i/nc5RnDLvG3GbcT7/z4oFiOVSUr6BS6LvL7+R79EXrVvdah4?=
 =?us-ascii?Q?63BjPyNzW8aCU0dWgUOhixK+v4k/zvXTjHXpdQpmRapB6B6OfbnZ8WnZWjrB?=
 =?us-ascii?Q?aVVyhiJrzO5cqeES9v1FsDCc0ikXFL5i6Oax/J0NvtBe/kmDRLvnQi/298vN?=
 =?us-ascii?Q?5N53HsyfddN4ajtQ/n1xL3Na1039fdttVSlkon4eSAcMfz70PrLIPluOJCiv?=
 =?us-ascii?Q?QhghNrS+mcUGwcWca1cW2ao5GYiKl8MRNQmaLKtG3ltXs1m1yD2i2Fy6QDL+?=
 =?us-ascii?Q?spwK8nSLGjUn+xz8VZV7l4rPRcpTd9cvsV5N65APRWbdGZYrWS4HQ/T1DFi/?=
 =?us-ascii?Q?svOboNX6q5TrGMe110Vkoe88S4Ttz7YzptuJkmJDkXgJWWPRus4lFG6APEZu?=
 =?us-ascii?Q?psHKgZAnVcGwGQ6LjiLNFgJqk6ZH1SIcBwtZRqPFJ9He4j7xFqIbp4pKFHFa?=
 =?us-ascii?Q?kdj1SLAv1HwrLTMti2sk72uuIvBLH6Cf47JXpbjhThPb0wgFE9rVUqGR42HI?=
 =?us-ascii?Q?x8jFtz2Moyj21CCAq23k3k0qOjr/11JeZBz05Yzw2sS7o9e1kjSysvnO9uzb?=
 =?us-ascii?Q?aqZbEWZVsEB3UAsin3jJcsRhY01DVMxmJnBylN0MQNkc6WZkQksiWZbiQzaw?=
 =?us-ascii?Q?qmbUiFPR99iHQTCA0LpAW72mK+0qTRIKA9uuGeTnBRkOQfFeMSBOEONiHh7B?=
 =?us-ascii?Q?0/h+2z+6yOUuu3L/ZnJhxnGFf9PM7eiA5g76Vm9E1U5IY9wFo68clYRgGYi6?=
 =?us-ascii?Q?iqGIh+6dhbKobuz+lPbXdgHlyidHTp+5jud7ww0QGLt13OzEdliBmCwmx9hD?=
 =?us-ascii?Q?4I13MCSgvFx3RwC1XUOWeoj6Dr0sUVr43Ohj1x0NGT+DrhdTsljxgByTAx7b?=
 =?us-ascii?Q?640wMzzDm/iPio8Tse0/mK9eS09gwmSAGmKBD9zrD6ECJ4qidhhBTJaFuFxK?=
 =?us-ascii?Q?XF/HjPGkexLi1klr/iwKdc5SLGZLCSeM2mlaQOZaUBdRDsQTRYklSNCt+vzo?=
 =?us-ascii?Q?Yn89S6SbIH4X4sC7zD0=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:00:46.2056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26265cc9-98f7-4f3d-0202-08ddf9b684bb
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6612
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223852

From: Artur Kowalski <arturkow2000@gmail.com>

Previously user units were handled the same way as system units, that
is all preset files were created in system-preset directory, but user
presets should be in user-preset directory.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0218542d80723ec314a648af8e9649806c3a51aa)
---
 meta/classes-recipe/systemd.bbclass | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index ccbfc36121..3cffe95d04 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -102,6 +102,12 @@ def systemd_service_searchpaths(user, d):
             d.getVar("systemd_system_unitdir"),
         ]
=20
+def systemd_service_exists(service, user, d):
+    searchpaths =3D systemd_service_searchpaths(user, d)
+    path, _ =3D systemd_service_path(service, searchpaths, d)
+
+    return path !=3D ''
+
 python systemd_populate_packages() {
     import re
     import shlex
@@ -201,13 +207,27 @@ python systemd_populate_packages() {
                     bb.fatal("Didn't find service unit '{0}', specified in=
 SYSTEMD_SERVICE:{1}. {2}".format(
                         service, pkg_systemd, "Also looked for service uni=
t '{0}'.".format(base) if base is not None else ""))
=20
-    def systemd_create_presets(pkg, action):
-        presetf =3D oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitd=
ir"), "system-preset/98-%s.preset" % pkg)
+    def systemd_create_presets(pkg, action, user):
+        # Check there is at least one service of given type (system/user),=
 don't
+        # create empty files.
+        needs_preset =3D False
+        for service in d.getVar('SYSTEMD_SERVICE:%s' % pkg).split():
+            if systemd_service_exists(service, user, d):
+                needs_preset =3D True
+                break
+
+        if not needs_preset:
+            return
+
+        prefix =3D "user" if user else "system"
+        presetf =3D oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitd=
ir"), "%s-preset/98-%s.preset" % (prefix, pkg))
         bb.utils.mkdirhier(os.path.dirname(presetf))
         with open(presetf, 'a') as fd:
             for service in d.getVar('SYSTEMD_SERVICE:%s' % pkg).split():
+                if not systemd_service_exists(service, user, d):
+                    continue
                 fd.write("%s %s\n" % (action,service))
-        d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("systemd=
_unitdir"), "system-preset/98-%s.preset" % pkg))
+        d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("systemd=
_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg)))
=20
     # Run all modifications once when creating package
     if os.path.exists(d.getVar("D")):
@@ -217,7 +237,8 @@ python systemd_populate_packages() {
                 systemd_generate_package_scripts(pkg)
                 action =3D get_package_var(d, 'SYSTEMD_AUTO_ENABLE', pkg)
                 if action in ("enable", "disable"):
-                    systemd_create_presets(pkg, action)
+                    systemd_create_presets(pkg, action, False)
+                    systemd_create_presets(pkg, action, True)
                 elif action not in ("mask", "preset"):
                     bb.fatal("SYSTEMD_AUTO_ENABLE:%s '%s' is not 'enable',=
 'disable', 'mask' or 'preset'" % (pkg, action))
         systemd_check_services()
--=20
2.43.0


