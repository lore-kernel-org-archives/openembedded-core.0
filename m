Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72A5CAC5B3
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.57])
 by mx.groups.io with SMTP id smtpd.web10.47298.1758531647844223549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 02:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=XPDWvSPx;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.84.57, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRlyImmBvAPEhGyoyZucBmdOwC5N1aD45XTqAa9jg4JxrBD7Dxwkn0R6DRlmwCKPKAc1rlpZY3dS5CSUoEOKzCbos7XL0iHWkA4Nc5oINL5vmdAN9+xpUj0IslGf7wftImdzP31pWOuKgjghZeb5fhc89zf1aQFaPC4t+e/TGxXzP6Qw+l5QhRuZE0rN0Q/pclzZQ7B85MgdUUpCgAFkazEVXS6fT3DgkerlxnGg7JZAYfpRoTMayuJojgCEkIFzPR22rwm+A6CZZPhaXRQB76IMteBmdiznahRZkG+FIvhmBRbckhl0mmbZfEYVxUYYfzSdBK5Y252laA3GLR44zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnU7+t6GcX4OvNUGClQp7+PKnzAiwN+5xL/xibSLQeU=;
 b=hjPrmNhRrX+Hro3CFbQkTEuZ6suEqOI1vsX//By+xPw+VAYQVApCyc8hSrrnZId0SpTkvJCssWbBynDKujuBToR2IYMdvGkfelrNQb6pKULyXU9lR5EGv2L8kA65yVZN/xozmglzXd1JKILvy3ErWKpEa4X3KbbK4Tmt3WulW1Qu+Eu/j1/7MUui8dwfJ+NGZA+tPdpiIgSrDefDCQqmexDIPzNQFnkflvDyLx7AMImt+rXSNwngP2rg4NEqdsInjEWedC0d8BkbjD668gm8CX7iTrGv/lFNgIp2KdAd7BGvR0pKon+6hDahLgBviJ8fmKd8NQ45urKUrkrLqcVMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnU7+t6GcX4OvNUGClQp7+PKnzAiwN+5xL/xibSLQeU=;
 b=XPDWvSPxViiZqGKQhr/7ZuZDqCZX/e/1/j08ApDMWmKaWmu2y3of/hq2Fu4iavfD38GU0eD9EUTFejcyJ9Y7LLockylTUwA96AaH2B7HBTy+SWoFIwI0VR+Y6MDEpJRHu8zIslo0JS+5eodF4FZuzvYOGBpT9gDEvf6qSJPwero=
Received: from DUZPR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::16) by AM8PR06MB7123.eurprd06.prod.outlook.com
 (2603:10a6:20b:1d9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 09:00:43 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::b0) by DUZPR01CA0009.outlook.office365.com
 (2603:10a6:10:3c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 09:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 09:00:43 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 11:00:42 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: jie.gu@leica-geosystems.com.cn,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH v2 1/8] systemd-systemctl: add support for --global flag
Date: Mon, 22 Sep 2025 09:00:33 +0000
Message-ID: <20250922090040.2859103-2-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
References: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 09:00:42.0822 (UTC) FILETIME=[60360660:01DC2B9F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|AM8PR06MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f34aa84-ddfe-40f3-031a-08ddf9b68347
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gH47unEPd+0D6RutsY9pKEOwVkma6Qgx83RttWztLR+JpI7LI9s7/sLk1rzm?=
 =?us-ascii?Q?C0mMmaolh+8oSMtqniHd9UQ+FjvHB/IkkVhvwtHiempn5LHB6XuqnJiJlRah?=
 =?us-ascii?Q?XI+8HGsxyAXKa1CIb2VxtjtW7N1bCP03gnBSxSQLWgfma4cGR4FNniu9NbP9?=
 =?us-ascii?Q?TBNcYb1qfBKOUpB8BRHUpSo4ARsrMaDDW3blI0gRjqvyr19rUjeNP4fAT8a5?=
 =?us-ascii?Q?qs3dhx/f5ST9OEktaDW9TTCq0r6CPiJWOTUyCHVwVwzLy07eHGmqvSkN3ClK?=
 =?us-ascii?Q?E9+NY6/54i4UbkBkvGdZHRMc+RtchlRkRL7yFh3iBBMlETDIR3VTXBg9XMWV?=
 =?us-ascii?Q?ROk+jbEBK0HLQPo3rwQJHB5aH0R3uZMc4idzSfYsHSB5/+opt3jIE8bygCni?=
 =?us-ascii?Q?Kzyp8q/GAIAZSKZ1KVVWobWO8n2bgDYpKyBDyyHwFTu0qHTzwtHdQwt3ytNP?=
 =?us-ascii?Q?jDgap7zqtixXPPGTqoJYoMji9VlvisHdsrXoFjYlCW2iivFv2Abb+SnThu1Y?=
 =?us-ascii?Q?cdu5FD2zKQjbgbwdtkaVPz7lMRkvv3Ttm95wbu9i/twk0dXD4XELCttZ8QgV?=
 =?us-ascii?Q?GkkhoOy23TXCgzUgrLUUSfdWYkusfSxynjCPoD15zbndoip7TnCqJP8lJRRV?=
 =?us-ascii?Q?8Jka7oy680pdSiugXD4Qv0ztkRfNwY5Ak4uN9HIh7YZsntWCwyDZMIRPrhKp?=
 =?us-ascii?Q?cY4PVXU7aq6MEHbuu+zrZTkOz/yzfNjqVG0d/kiNbiRiRGHVtyeXIqgtNzXD?=
 =?us-ascii?Q?kSCID5bRcwV8w4rUr21uREZC5bW0ltweFpr0jPFODCdjASeXjM6q1AIFjx00?=
 =?us-ascii?Q?0czFFO+m4xv4Bk+b4qNcthYjqJzzD572hjBAVkmXGMKqWKI/xfFRlifvnxy7?=
 =?us-ascii?Q?ykgWJ03HzdgA1/5lh4QeQFEkaxxA8kYylBOg0q0Wa6AakjLArCG3Ahyx5jOc?=
 =?us-ascii?Q?LXbSw9SBf9yuRQZUDvjWBCdFOkntxp/XJEvKBFiNjtoZC7orVznkKlZ2XtJV?=
 =?us-ascii?Q?L7oIEMyTdFAT+bLgV2zatACN+d4vNzfRSFl0GWINWpbZKZSndjCqK6x1/xdp?=
 =?us-ascii?Q?5dfSqPrrxHt9zSmL+oCZ1QOwP3XVlix9vUnqw5Pr9q+CxnfStQ7lcO2oh6LM?=
 =?us-ascii?Q?NXg4xWuzDgK6qbAyTw4Fd384G7GqkAm0Wb298+TZ2l/iRmOUcwv2LrdND9fI?=
 =?us-ascii?Q?NN0VU6XXQsuOVGb4YAarf3u/E1CHnZm35aM9hF6O+xn7Ri17DAEIUO08rfqs?=
 =?us-ascii?Q?6mYCnIbaa+QD27bd+ticOOz6z0HBAmWNLn+3XcniMQXElap8uP5Bv4ukKgXo?=
 =?us-ascii?Q?gfXcFia6hz0EDqceKWtwWC6qfQKxJ1I12AFF8GKbSUApRYtXW7GqpOYj5swO?=
 =?us-ascii?Q?0us005+gVLZw07p2lL1sbrzgza30dibmC0zWxRhkFw54YU/RqPOhtwBZBqpo?=
 =?us-ascii?Q?6E3ZoJru/t8ovgjTxQut548HSretz3svYQRxHS94LVCFVzk1SbRnViTG2oBu?=
 =?us-ascii?Q?v9EZ3HifKCuOeggkF2QvlgC8bNWbc287VN3PRzO64d/5nEB/e7xSJYBlTMEk?=
 =?us-ascii?Q?vrMa8/WKehJSydLW+Yw=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:00:43.7673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f34aa84-ddfe-40f3-031a-08ddf9b68347
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7123
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223846

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


