Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE91FC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:01:11 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.83])
 by mx.groups.io with SMTP id smtpd.web11.13911.1749034863469949323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gomspace.com header.s=selector2 header.b=Ak5srhz0;
 spf=pass (domain: gomspace.com, ip: 40.107.159.83, mailfrom: mns@gomspace.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyGA9opWWpYlslO9bimW9YjcH6QIIz5PH8yzuTaANmuuw0L6gNHwsN8OmBNQ7Gp/IHaEfBPqMgl06f8ptZtcARyAVVCTq0YmkI3/X1YH1Ir3fEE9h2zOo+tBpMN4C31fyjCtpCGEsbp97iMLmIt/sCxoqkrR1eqaU+pDIvyFCZnoryWhfAjjKBgQI94jEJrfOUirMHb3jE4wbSWKkBDcZ9SkvCoNqyN6Dm9Fo1++3Ygy18G+qGAFqS1eDVT/Gt06DhDXDbvmhm6T4zP4Xa1ieYMRKVLq999gv/sPW34gL7dcNjoudAYNAHm3HDc4dau66WYHVB6VrACV5Xa6ZZ16OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJTbrDyboYdYohbVDL/BUNR0O+RSmetYOHAo1gtOnqw=;
 b=kosGbAjJv6T7/UN9U46bAKMSksTNqMSRHg2DtKHjVB3OBOSmQ68fas+uAYFxoWzHYGrPEImf6+5wjLxB7S1RVKO05LMYPB4LJ8tFNq0sbSEeYgw06s0Z2pgFzFaMmZsBsBYZxIkH76+r1O4rKNA16UM98CBAf4bhg17/1xlUkGn0GDY6xO6o3GnRDfoUgdaQ0KkPxnX/qH1ztHxFXnh0BObT8v0bMIvRmb9M+gcrOT5PlVGEY2pxpy9Q3lIT4UOmlegScEFIf8+I8ClHIs0p3oJKpl/3+oGs/ZYXQhIkdYT5nz6vGiqN74H8/8A/VknQQoUCbVgOz7cASXnmnqN0Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 79.171.149.170) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gomspace.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=gomspace.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJTbrDyboYdYohbVDL/BUNR0O+RSmetYOHAo1gtOnqw=;
 b=Ak5srhz0FL74oUWMb0TcqrxEM6XLN68tBYzgkrMgabvnoSROvUHvLq4OumSqMthkC8WAUXxG6CvPAP/W9IBFtiWlP2x+E/v5Ki37QhO1DxvJq38QJQR7qVfPMw56Z82DXIyA60VXxX2hneYNhvdL6WWEvqv2P2QpCetNkTV4CLE=
Received: from AM0PR05CA0089.eurprd05.prod.outlook.com (2603:10a6:208:136::29)
 by PAXPR08MB7393.eurprd08.prod.outlook.com (2603:10a6:102:2bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 11:00:57 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:208:136:cafe::20) by AM0PR05CA0089.outlook.office365.com
 (2603:10a6:208:136::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend
 Transport; Wed, 4 Jun 2025 11:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 79.171.149.170)
 smtp.mailfrom=gomspace.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gomspace.com;
Received-SPF: Pass (protection.outlook.com: domain of gomspace.com designates
 79.171.149.170 as permitted sender) receiver=protection.outlook.com;
 client-ip=79.171.149.170; helo=webmail.gomspace.com; pr=C
Received: from webmail.gomspace.com (79.171.149.170) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 11:00:57 +0000
Received: from DK-AAL-EX02.gomspace.lan (10.0.1.86) by
 DK-AAL-EX02.gomspace.lan (10.0.1.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 4 Jun 2025 13:00:55 +0200
Received: from ThinkStation-P3.gomspace.lan (10.0.8.56) by
 DK-AAL-EX02.gomspace.lan (10.0.1.86) with Microsoft SMTP Server id
 15.2.1748.24 via Frontend Transport; Wed, 4 Jun 2025 13:00:55 +0200
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-core@lists.openembedded.org>
CC: Patrick Williams <patrick@stwcx.xyz>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [walnascar][PATCH] systemd.bbclass: generate preset for templates
Date: Wed, 4 Jun 2025 13:00:21 +0200
Message-ID: <20250604110022.210041-1-mns@gomspace.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C709:EE_|PAXPR08MB7393:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ed9b95-e5df-4759-3a7b-08dda3571566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?auE/7yGL79IivDvAoJElBVVr00B/Q9AsAqZQdFFm8QvCeI2TxfJhwGAbb01m?=
 =?us-ascii?Q?idFASEGLdn4QK5Em1mTvVC5bCZRUlBifoef16zoKsOUsHLy0QY2Z7bNFyIBY?=
 =?us-ascii?Q?VVPTmRiVURWZgBo8CfFgI45t2lfT6uv92BV8EAqInrM3XDIUDH3OgMFX8B17?=
 =?us-ascii?Q?W54rkD5l8+j1JU0V3zGbrA436Po0r4X6PjfJ9wbqKzitTlUMrTf90hgLzq7z?=
 =?us-ascii?Q?ds9MXK69Wx4SCW/00U/HvdYC9PkFIqWO+pJmyB9+zDFpXDpNRpw4mfE+y8PL?=
 =?us-ascii?Q?+UIbkFkmKPxer6coPOz3OMSQ3sma2usWHSvKf9jxMCWuEzhMEzdKfvgiBDCB?=
 =?us-ascii?Q?Z9LZFm2ZUFu2X14n+cSoViKHKYoCLvRnRLZttJYU/WBEyIejAUxc2jHf/17D?=
 =?us-ascii?Q?LofAd3JJZ8CsGHnx3FtAQykqrfz2uY/0xo7GrPNMvmEocoPrhjqbMvgH/jdG?=
 =?us-ascii?Q?q3yfkAaJcjALVo6fDT/oY9u5Z8XchHQ7tK3WtLFVB64bvODxOAe4H01jwr6s?=
 =?us-ascii?Q?OeG1DyXwpEf+tVgW2o5LRRABSwSJticnqOp8Uyz4q01nOJpOqZXvpmwjZ6HK?=
 =?us-ascii?Q?m3fOfRGoRsg/MFJho+gRM/3rvokw0bLlKwCSOhQf7Y9+slVVPIfDUpIbT8Ml?=
 =?us-ascii?Q?ScqCoPx9b8APaljX4WUxVpBY+QkEBv3s5O/k+lsKNxKc2D004JBCzSzHc+Gp?=
 =?us-ascii?Q?qgapmTB0YDvUm1b8SYoY/kgvVHJzcN3vZXN+DNIYGJn6zaUDEjWAmwHC8SnY?=
 =?us-ascii?Q?4hVjzDCUSqm3XOJe2gqgHCfaA9Qj3SWy3uGE/TzCdEjCpgm1YhPurTheqduh?=
 =?us-ascii?Q?Ue4EiAThP/r1We/MyG6oAJXMVWPdl1cYLXxRF6zt6li+eHp3Ar1pnCL4M15F?=
 =?us-ascii?Q?C/1csKnBGM20Pdwg+KaLoaJslQUmgHURaqkimKt3sIDw7539kSwrUMogryIV?=
 =?us-ascii?Q?UPj2eUJvsOmuleOfWQWjVOz+WNBJ8A3xN4Cl9J927hE1CFyOkQ27qUDIvPos?=
 =?us-ascii?Q?8s3uyFw+KPSnSBddarcKfhCXB98Eb1qNLGYwwkyk/fXn6/nFiPimDGfDGCHo?=
 =?us-ascii?Q?aFnBZ53xU+ZNXwJz1HAuzL/HPyMpP9C7/o5Be6lvHiiwNdCEjGlzBMt/lBZf?=
 =?us-ascii?Q?TBo3TFU1R+wkEiqgXv7VFHpKiswyOdIADMCOBw8iUrBDh8Ugs6bIiXZnDZyd?=
 =?us-ascii?Q?UtDsfDxaXFO3xuYlEVqwwW/tBfNVzUJ/FAr8QGTItMLulEvC7bTuhWk2QLPV?=
 =?us-ascii?Q?3y+IFes5a0EfmU0bDKxPLOTXJ0mU4LXaSP9Rnnybyl+CMXHMzI9y3g9bGMjg?=
 =?us-ascii?Q?0qG71BCkxplKvhhy6azlOHrDfdh/ZCDdQ55+bC65nKiAel03pwv5lIawSy9W?=
 =?us-ascii?Q?oxroFizWf5KV74wpmaggQxj4KLZLzInV4qvOzZR5wfVZ/BhYLXfK0Im2agDq?=
 =?us-ascii?Q?hQlIWDq1WeDJZ1LW2M6miZsPfiQghqZZlifrwAsAwsGq+XmCVx1ONA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:79.171.149.170;CTRY:DK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:webmail.gomspace.com;PTR:webmail.gomspace.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 11:00:57.2489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ed9b95-e5df-4759-3a7b-08dda3571566
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;Ip=[79.171.149.170];Helo=[webmail.gomspace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7393
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217900

From: Patrick Williams <patrick@stwcx.xyz>

There was a regression introduced by the change to use
systemd-systemctl-native rather than a python fake implementation,
which caused template units to not be properly enabled when set in
the SYSTEMD_SERVICE variable.  Through investigation, it seems that
the best way to re-enable template instances is to handle them
explicitly in the systemd.bbclass and enable them with `preset`, like
most units are handled[1,2].

Per the systemd.preset manpage, the format for template units is
different than for regular units[3].  We need to coalesce all the
template instances onto a single line and emit them as an additional
space-deliminated argument.

Ran this against openbmc's phosphor-ipmi-net recipe and generated
the following preset file:
```
$ cat packages-split/phosphor-ipmi-net/usr/lib/systemd/system-preset/98-pho=
sphor-ipmi-net.preset
enable phosphor-ipmi-net@.service eth0
enable phosphor-ipmi-net@.socket eth0
```

[1]: https://lore.kernel.org/openembedded-core/Z2ch.1747051947055246176.okt=
f@lists.openembedded.org/
[2]: https://lore.kernel.org/openembedded-core/aDdoTVtCmElpURYD@heinlein/
[3]: https://www.freedesktop.org/software/systemd/man/latest/systemd.preset=
.html

Fixes: 7a580800db39 ("systemd: Build the systemctl executable")
(From OE-Core rev: f33d9b1f434e40a459614d8dc21ce45e11581008)

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/systemd.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 4c9f51d33d..12c59647be 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -224,6 +224,8 @@ python systemd_populate_packages() {
                         service, pkg_systemd, "Also looked for service uni=
t '{0}'.".format(base) if base is not None else ""))
=20
     def systemd_create_presets(pkg, action, user):
+        import re
+
         # Check there is at least one service of given type (system/user),=
 don't
         # create empty files.
         needs_preset =3D False
@@ -239,10 +241,17 @@ python systemd_populate_packages() {
         presetf =3D oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitd=
ir"), "%s-preset/98-%s.preset" % (prefix, pkg))
         bb.utils.mkdirhier(os.path.dirname(presetf))
         with open(presetf, 'a') as fd:
+            template_services =3D {}
             for service in d.getVar('SYSTEMD_SERVICE:%s' % pkg).split():
                 if not systemd_service_exists(service, user, d):
                     continue
-                fd.write("%s %s\n" % (action,service))
+                if '@' in service and '@.' not in service:
+                    (servicename, instance, service_type) =3D re.split('[@=
.]', service)
+                    template_services.setdefault(servicename + '@.' + serv=
ice_type, []).append(instance)
+                else:
+                    fd.write("%s %s\n" % (action,service))
+            for template, instances in template_services.items():
+                fd.write("%s %s %s\n" % (action, template, ' '.join(instan=
ces)))
         d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("systemd=
_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg)))
=20
     # Run all modifications once when creating package
--=20
2.49.0


