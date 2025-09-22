Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E183DCAC5B8
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.28])
 by mx.groups.io with SMTP id smtpd.web11.46850.1758529025065698531
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=U1f+4s+1;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.84.28, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYIYNHmURrOQ1AWklwP7VyDp1bawnt0nO/sTQwpE938FAcppKo65LtrwKwH1nFJqROia6LByYV9T4feuC/9MbKJMVAJqbe/vf7E4UGTLUx/kDM6QfY1R4mUkMTDlhkxXA212Oozky5w0B4KftqvEthF0U8izbSSh/XV39zQigVA86tJFtmKUd9pEjduWtafkeigvWlt5a0QAmujNrdy5gNHlegh4/hmmodl0Glb1LsgqXdXDtRzlF4+Jhh8MLiYWcHpuh2YxM5d9ONHS65r72iN6sHOz3WrvLgtL8/GFoj6m3nX1nqJzPTa28C8Mex0HrVyVpZG1rl0sGrYUIoWqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dUukTcVdgJD9gZEFnyo7uiWOt4VVVGZ7pIfN5S1vpw=;
 b=CW0mdntqRnVmK18JlqpH+xYJEiq9E9d2AIbU2z/hMeVjc1dl+w9rGQOC0epZMH/IdrcJGOETvYXIQ1q5WddlgrpPiW+3bOYZEiPHsYs1+Ny2nCqebES2UGc+3eklSuFEgxBSQrhqY9ayGq45YCrietQaEmP7HZV2hHuFGCjJQHlQMV9ceLqfVRRcg+TsFgCPMwEiimE1UJTCSgqujWX9j2wtqtqEGrgKt5XAQksbzYXQUVqYPKCNk7tsJE6i+dHYaDRKtO8ieg2Ttd9TtCHzvB1o5yzd0FZK1rB8R0WRNS+Gl3uckri9izSMGBiWoF6+qKd2OYPjPPFP57NB8vALzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dUukTcVdgJD9gZEFnyo7uiWOt4VVVGZ7pIfN5S1vpw=;
 b=U1f+4s+1wYXW4k9Xvimi2gAm4I5s1Qsv4Nbr8yKmG5YPTw67AlyXEzKLa8usuS2ghMH2unZd9puY4ijwFXY3SO76Ahs26e276ahSz79XOnidAdpntMqj2jDgmh4c9++2XL4OMqtgZNzkTXPexKfY2Cgrf/VAuRD2l8Kl//oqjxE=
Received: from AM0PR02CA0004.eurprd02.prod.outlook.com (2603:10a6:208:3e::17)
 by DB9PR06MB7881.eurprd06.prod.outlook.com (2603:10a6:10:290::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 08:02:02 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::2e) by AM0PR02CA0004.outlook.office365.com
 (2603:10a6:208:3e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Mon,
 22 Sep 2025 08:02:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 08:02:02 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 10:01:58 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: bsp-development.geo@leica-geosystems.com,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/8] systemd.bbclass: properly handle user units in systemd_create_presets
Date: Mon, 22 Sep 2025 08:01:48 +0000
Message-ID: <20250922080151.3483394-6-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
References: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 08:01:58.0746 (UTC) FILETIME=[2BB2B3A0:01DC2B97]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|DB9PR06MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a9f9a8-44ef-45c5-adb5-08ddf9ae5067
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027|43062017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z6aeB85gAyF8n+QuuTb1PQggEkQYMVUnO/1aMVPL+68TYwxtNpKmPvZZGkSn?=
 =?us-ascii?Q?ReZcIFSaiPXeMnKRfslfN246PcugL1JRlx6+OH46AEd4AtGIAXrQahtk+BYq?=
 =?us-ascii?Q?mVp4kkl6zM+XVSmcDxr48r2Q76/wfWBPiNnV9OFeHUjij/4cUtEJKm+t0SkI?=
 =?us-ascii?Q?9Grl2Vua9ycngj1KOzcTsG+6wpG10r13FsjyX9lYfKt+z5oNedFHZb56iP0k?=
 =?us-ascii?Q?xWtYkkAMOp0kGMkA4z9nJQCg0y/QW8qKB3hgAccl5mRUeaZcIwNrirp8QG1L?=
 =?us-ascii?Q?/pcJjwPm9P6ag5mHt0/IKQf//Ixy66YFKwX+C71+iepcFJz7yED4donxIN4b?=
 =?us-ascii?Q?Sgv/GX6TAzZIinQgDjU+J1Ye0wmvSzpbykTQDZi1MAThN8EWS+ErBIxNpUXy?=
 =?us-ascii?Q?1R+fKiwYwbfBvAmdur+nl+ctPUgpAdfnwZvQ84zee8Zbck0GdbSwZDF23/x4?=
 =?us-ascii?Q?LtqfhATMh1/nVHAgZyX+euTjlyhK1LbSc1dboNWRVuWD7C0VgA7NfR/E/ro5?=
 =?us-ascii?Q?rAY90B9FohYeXcNXclQLq8tOdxkUWEDJgGZoT4W0bp3RCCLDHhwOID3M+6xH?=
 =?us-ascii?Q?0B7yBcalqdGDdICqK4xr0utZOZ11Hlh/ZueiAjApe0uMYnEsvOsUCE4Vh5V9?=
 =?us-ascii?Q?XSCEWO7iu5cxoPbRNB9HHIA9RCWeygViZspKcygtFHirRnsQfz8zcoVe7+tX?=
 =?us-ascii?Q?i+gavQmOJDAE22L/UKMJ8oeYEQVGzVoXauEi60Hb1hrx+psk11Af5WovzLh+?=
 =?us-ascii?Q?xVNxJegdnp8XmTgYWQC6dWvXcnca1HOtOS8LqsZ806gpoREgtFtF/Xzuegps?=
 =?us-ascii?Q?i246Mrab7LJnH9Xz+cfq1wf3sJjT5zBt2qPVc8/osx3oFjBQJbmHwQL55Qf2?=
 =?us-ascii?Q?kte1TLkXPya0ZQs8rtP/8/pfz1oNNh2IgpZnfZZPMmlwFeYkq7FCa0pnhXBd?=
 =?us-ascii?Q?LfezAPIhnN8PMAxJHXgwKmp475PcBXQzm3aizDz8uY0yYobrME3tBHVtmKrh?=
 =?us-ascii?Q?yhNtVxmWLa5QUOzTkzOufz4uhw6uU28H+Wo5cC2ducJey9m4VZOv3cnF1M2b?=
 =?us-ascii?Q?BPzAWVCL/Zcx65twQ8i2Kv07eAb5br8+O0m2OYXvFwLsdgd27I9/QAJvJh63?=
 =?us-ascii?Q?gu6RGWmsI0GAkmiqvj7QR/soA1OsHsvJP2us9w9JAj77xFxzD/HEg+6x/NsS?=
 =?us-ascii?Q?o8UsHpINUCWR9spKCSy7zk5axWdB+9c1YctyyRXfoNUVywrIpvt7C6rDenVa?=
 =?us-ascii?Q?H592ae1UmCEcdv8aB/PTLNs2XGzQzykdagSjA7HbKjp+FT81fwdiLk/Qf03q?=
 =?us-ascii?Q?YxwBn+8z/927vCCRMhdlhmSivbxslgoSA0pMT9eSfV+S1nIdTT+f5gm754Eu?=
 =?us-ascii?Q?2elFnP/lQkUTgtPsCjfVL8sdI4hzCNmfE3F0VzwUDKpgsaybKcCEEaZ9FeKa?=
 =?us-ascii?Q?tj6V2DG4ebhd5B5YzSVcyiew+zd5hA96JDkoCND38G9mPDeTgDy0z4DBMw8T?=
 =?us-ascii?Q?v+jZe1fCLoEW8lZ1/J6nvsbyQ+rMuxmDdL8JcBeESUu2R37+kKPgjNBt+AU0?=
 =?us-ascii?Q?asuZsXa8scw0jA98UDY=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 08:02:02.4731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a9f9a8-44ef-45c5-adb5-08ddf9ae5067
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7881
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223841

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


