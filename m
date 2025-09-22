Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B0FCAC5BB
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.68])
 by mx.groups.io with SMTP id smtpd.web10.46601.1758529074813150509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=qzLE64Ne;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.70.68, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pb26/QjfHwiOSuBzVuBr5l7uoX6tRPCyj837SDgQ8PMLe5Eg9xQ5tmQD8fgIShJKcJExWaIOuyINmJdl7b+w+vY+oL5FsvaKlXFU7iNUKg/BlDMUZzrTxGaVsbe2v1Zf7ZppH0iOO+AehRYY3l7A04luf3C/x6TMLunrYcOsgyZ5MCrUWY4P6Va6mG50pYFC43YqS4Y/pUe/WtvkRCtKmeuCzXlaVSDz6ZWjz5hP7CEOW9wHnxE42PWKN38K8KwY95Re0v0vpAbz10YXlHLdRzqPI0XJ+Gu3HXDuMfnrr2dvF+/KNaoSVNLHKFtrl4slWCvUZBBKLzpou0Axj4vvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnU7+t6GcX4OvNUGClQp7+PKnzAiwN+5xL/xibSLQeU=;
 b=Gl9/tT1Cpgk5nEEAwM4GkNW86AB7klhex5BFxH85ydElu6ud9YvQYskYvLPVCGhDo5cm6sA3NoeRvet15IOL/fcc7IElTqRL25uuzV0ogTqk6QEbVKC0GV/zY1QmcW3aU8ynMDOC9G42OeSnjEH8WASBojXRnLVCfq8/6Jj8UY7ngrSiGlLenxkTxf+lx2ZAtSH9n5itwZAlMhi2V7BT6qwlMH57rNpGdBc304T4Me4dax8sBjSbn+crEEgmeyP92fC6dq4whowATFbGWMVof2IGvAJts+SUOCd52eoa6Moi2bsbTxeGaC7gv19DmEUPhzHEE0jAgHEEWKIAFVnSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnU7+t6GcX4OvNUGClQp7+PKnzAiwN+5xL/xibSLQeU=;
 b=qzLE64NeS9wjdwjJluw92+tuD9hR41weBnhu5p/H6vgYUbNjeBPHutMcSJt/UY5zY4HxpPh741OcwH3BJBvJ7DEMr95ZIVpURF/EiIjM09SWjk8voh4XxHmWSxUHHHy0xG8NpLE0+XiNqRXKqdToGFan2V6DYmJbgmfyKI+7yPI=
Received: from AM0PR02CA0016.eurprd02.prod.outlook.com (2603:10a6:208:3e::29)
 by VE1PR06MB6957.eurprd06.prod.outlook.com (2603:10a6:800:1aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 08:01:59 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::94) by AM0PR02CA0016.outlook.office365.com
 (2603:10a6:208:3e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 08:01:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 08:01:59 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 10:01:58 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: bsp-development.geo@leica-geosystems.com,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/8] systemd-systemctl: add support for --global flag
Date: Mon, 22 Sep 2025 08:01:44 +0000
Message-ID: <20250922080151.3483394-2-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
References: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 08:01:58.0605 (UTC) FILETIME=[2B9D2FD0:01DC2B97]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|VE1PR06MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 5daa99e5-997e-407f-d551-08ddf9ae4ec6
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027|43062017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ufs7US0Q5ndjDc0PSqJFZLWAfEuFwRDw0WkgOLulJ/+8QifHa2JhWiSSn2WN?=
 =?us-ascii?Q?sjjVljzXCWsV9jPbwCV+EszmJQ5AxTLXZBqdAb6NghFg5lj95rWDhM//dQfD?=
 =?us-ascii?Q?szARE05dqKSzG3YVGKmi+4G+ivI1kZ1rMHiMYKJic0Pc6fERAnATLKgrlf68?=
 =?us-ascii?Q?Kwxt1DKQL+Ork53TzG2t0zc19sbd9uVI9M/OiRCTPciiudx0qJOvgaOfrNBn?=
 =?us-ascii?Q?MqkF+0aT5LE6Qox0hARx7XinE8vno71erOScwVtcmwGj2W8TDhSBhonSWS45?=
 =?us-ascii?Q?B4zQ2I4CTAqQeZ/v6qYvYmxsehWnbDHHuQhUKgQh/4HTRJNYZFD2RX3NT3LN?=
 =?us-ascii?Q?NeXO95U35MxHBL7i9uc+Cgw6wd6bQNwpxh2fACiOl2LYiiCQMiLQ+813/1M9?=
 =?us-ascii?Q?ydWb4uady4VcwQw0f/wUxg2RrihQtrP4zxi5VvmzvU4JRDSWJ/EDk54K7PFB?=
 =?us-ascii?Q?K9KxbJ7bYuBRgefnKhHn09SK1lHqYXMFUvDtqQ5g9CLblJRDhorJ5LsV42PT?=
 =?us-ascii?Q?IRvVSmYLHrsClGtzeeGj2+oEw4RZ5wO+ehvF3vALpRmlC5ifiN4tbpTPc+Yx?=
 =?us-ascii?Q?CKwIJnZqB5ygiIUBgOs/KzFJxtVMKzeSbzEXPQz9jzO4W6qLW3d4MnCIxKDU?=
 =?us-ascii?Q?6J1VG2qzV2Kf6s8JkdXxEqmrtbkkuLZkdZC11CD//jK/U+U/xSvh+8CGj7jl?=
 =?us-ascii?Q?NjiYi6oEXaLE78nTyxQywr6cjbatkD5+HucD1nvSfK54LPKhzNvVl/DHuC4d?=
 =?us-ascii?Q?4Tz4ixVa7gAV/8f7L23q+PBeCGkz6EjGO7SVnqyYbcpmmyWXbcUgvaYgIbHL?=
 =?us-ascii?Q?sHTAW2xiaEHOA32CMXWRHgr+H6RBBFdtnyoxO3MzFSTsqz8Q9DIhGD4rVfDe?=
 =?us-ascii?Q?AvB8N1bD1VUpiyr1750QEVZpGm2BW0wor0+eXO5PUjKcDEVYYzCXHOfmQSd/?=
 =?us-ascii?Q?QMjHZH0hUlM1Dw+yCQf/he8euK9+rm8DPX3RCcIgl3RtiANCwJllO/amF1HE?=
 =?us-ascii?Q?pVLlQWiUVvdeGBVRSZ2HcUUj3IX3APimykBLqIbH3U19kyGPUZiZyshnAp3U?=
 =?us-ascii?Q?NmkxjK9v4V9d3v0MAV1WKSXb0PL3aEbff639IzHLMtIUhNzxxlGMGDw4h4OP?=
 =?us-ascii?Q?/GnJlL7xrsYBE3z4cqQm9I8gR5IdKMz2qRKxUlkk3HNe4zhHI0cRW1DRbH2x?=
 =?us-ascii?Q?3/lNANTDisfdsO1bNx45EpMeiVyrxi2Fl6vkrWH4AW38BFyFU4lQ3lQk0Io/?=
 =?us-ascii?Q?6bwK7DWaXpFlTeYVyF03jgKvnIOU94vcwMJwycuLuWjLDhUNBM81HyM8xERj?=
 =?us-ascii?Q?Z4sXwk1tlJtUyZrenbzzxE4kreQBVy2IndEKOfJ2IwEvmK2NOXxjSCTCXH+X?=
 =?us-ascii?Q?5Iu91FnADKud4YBxXSaXCqWExkm1UoS8fqWbIPp/OwVG9W9EzYUYeMJ1j3RT?=
 =?us-ascii?Q?pEXp7DLWCx+JchMlZ9Dv9N1bgw6QVUouF+1z7nDm7EKnQ+aEHjzh23vzkomW?=
 =?us-ascii?Q?bZg/TYnlvPyokskGImg1L5d9JV3bvpFWYmgT7QELTu3MZNikisvh7p8/HtJG?=
 =?us-ascii?Q?TyqzDYoVN5Sl661HmQE=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 08:01:59.7412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5daa99e5-997e-407f-d551-08ddf9ae4ec6
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6957
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223842

From: Artur Kowalski <arturkow2000@gmail.com>

The flag is similar to --user flag as it causes systemctl to operate on
user units, but it performs operations globally for all users. This is
required for user presets support.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab6476d28485598ae842472a7b15ca7bf244c776)
---
 .../systemd/systemd-systemctl/systemctl       | 42 ++++++++++---------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/r=
ecipes-core/systemd/systemd-systemctl/systemctl
index 2229bc7b6d..81c246a5b2 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -29,15 +29,15 @@ class SystemdFile():
=20
     _clearable_keys =3D ['WantedBy']
=20
-    def __init__(self, root, path, instance_unit_name):
+    def __init__(self, root, path, instance_unit_name, unit_type):
         self.sections =3D dict()
         self._parse(root, path)
         dirname =3D os.path.basename(path.name) + ".d"
         for location in locations:
-            files =3D (root / location / "system" / dirname).glob("*.conf"=
)
+            files =3D (root / location / unit_type / dirname).glob("*.conf=
")
             if instance_unit_name:
                 inst_dirname =3D instance_unit_name + ".d"
-                files =3D chain(files, (root / location / "system" / inst_=
dirname).glob("*.conf"))
+                files =3D chain(files, (root / location / unit_type / inst=
_dirname).glob("*.conf"))
             for path2 in sorted(files):
                 self._parse(root, path2)
=20
@@ -182,21 +182,22 @@ class SystemdUnitNotFoundError(Exception):
=20
=20
 class SystemdUnit():
-    def __init__(self, root, unit):
+    def __init__(self, root, unit, unit_type):
         self.root =3D root
         self.unit =3D unit
+        self.unit_type =3D unit_type
         self.config =3D None
=20
     def _path_for_unit(self, unit):
         for location in locations:
-            path =3D self.root / location / "system" / unit
+            path =3D self.root / location / self.unit_type / unit
             if path.exists() or path.is_symlink():
                 return path
=20
         raise SystemdUnitNotFoundError(self.root, unit)
=20
     def _process_deps(self, config, service, location, prop, dirstem, inst=
ance):
-        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
+        systemdir =3D self.root / SYSCONFDIR / "systemd" / self.unit_type
=20
         target =3D ROOT / location.relative_to(self.root)
         try:
@@ -229,7 +230,7 @@ class SystemdUnit():
             # ignore aliases
             return
=20
-        config =3D SystemdFile(self.root, path, instance_unit_name)
+        config =3D SystemdFile(self.root, path, instance_unit_name, self.u=
nit_type)
         if instance =3D=3D "":
             try:
                 default_instance =3D config.get('Install', 'DefaultInstanc=
e')[0]
@@ -250,14 +251,14 @@ class SystemdUnit():
                 try:
                      units_enabled.append(unit)
                      if also not in units_enabled:
-                        SystemdUnit(self.root, also).enable(units_enabled)
+                        SystemdUnit(self.root, also, self.unit_type).enabl=
e(units_enabled)
                 except SystemdUnitNotFoundError as e:
                     sys.exit("Error: Systemctl also enable issue with  %s =
(%s)" % (service, e.unit))
=20
         except KeyError:
             pass
=20
-        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
+        systemdir =3D self.root / SYSCONFDIR / "systemd" / self.unit_type
         target =3D ROOT / path.relative_to(self.root)
         try:
             for dest in config.get('Install', 'Alias'):
@@ -268,15 +269,15 @@ class SystemdUnit():
             pass
=20
     def mask(self):
-        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
+        systemdir =3D self.root / SYSCONFDIR / "systemd" / self.unit_type
         add_link(systemdir / self.unit, "/dev/null")
=20
=20
-def collect_services(root):
+def collect_services(root, unit_type):
     """Collect list of service files"""
     services =3D set()
     for location in locations:
-        paths =3D (root / location / "system").glob("*")
+        paths =3D (root / location / unit_type).glob("*")
         for path in paths:
             if path.is_dir():
                 continue
@@ -285,16 +286,16 @@ def collect_services(root):
     return services
=20
=20
-def preset_all(root):
-    presets =3D Presets('system-preset', root)
-    services =3D collect_services(root)
+def preset_all(root, unit_type):
+    presets =3D Presets('{}-preset'.format(unit_type), root)
+    services =3D collect_services(root, unit_type)
=20
     for service in services:
         state =3D presets.state(service)
=20
         if state =3D=3D "enable" or state is None:
             try:
-                SystemdUnit(root, service).enable()
+                SystemdUnit(root, service, unit_type).enable()
             except SystemdUnitNotFoundError:
                 sys.exit("Error: Systemctl preset_all issue in %s" % servi=
ce)
=20
@@ -320,6 +321,7 @@ def main():
     parser.add_argument('--preset-mode',
                         choices=3D['full', 'enable-only', 'disable-only'],
                         default=3D'full')
+    parser.add_argument('--global', dest=3D"opt_global", action=3D"store_t=
rue", default=3DFalse)
=20
     args =3D parser.parse_args()
=20
@@ -336,16 +338,18 @@ def main():
         parser.print_help()
         return 0
=20
+    unit_type =3D "user" if args.opt_global else "system"
+
     if command =3D=3D "mask":
         for service in args.service:
             try:
-                SystemdUnit(root, service).mask()
+                SystemdUnit(root, service, unit_type).mask()
             except SystemdUnitNotFoundError as e:
                 sys.exit("Error: Systemctl main mask issue in %s (%s)" % (=
service, e.unit))
     elif command =3D=3D "enable":
         for service in args.service:
             try:
-                SystemdUnit(root, service).enable()
+                SystemdUnit(root, service, unit_type).enable()
             except SystemdUnitNotFoundError as e:
                 sys.exit("Error: Systemctl main enable issue in %s (%s)" %=
 (service, e.unit))
     elif command =3D=3D "preset-all":
@@ -353,7 +357,7 @@ def main():
             sys.exit("Too many arguments.")
         if args.preset_mode !=3D "enable-only":
             sys.exit("Only enable-only is supported as preset-mode.")
-        preset_all(root)
+        preset_all(root, unit_type)
     else:
         raise RuntimeError()
=20
--=20
2.43.0


