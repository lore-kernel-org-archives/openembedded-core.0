Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F9DCA100B
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 14:06:58 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.42])
 by mx.groups.io with SMTP id smtpd.web11.78253.1756822014666545738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 07:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=eFTzQFDG;
 spf=pass (domain: axis.com, ip: 52.101.65.42, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHt9ons8yVGCpPreLzjGYr+TOoDr7HJN7mTWm6CMm6Fe712VnQvFfAuLATKGhB3xSeNeBb6UyZH+8/WU4YhWcEBrvmihKqvP3YOiWRm1zktX5KcBX923XWtxou5As4CzMQzfq/6044jloeBau/G4bUlJ/5oXwy6cbRs5YLkgPxJP8GYAt0x9asMkn3CH+UvSz6y2gsSdJUgtXgyRnq07HzJtNOmNVUJw2JcB0+bvutidfyvr6YY/nZBauvz6rXDIo0xW720bsCuH8Qs3RWfN4UUUQi92uYdZwk/jimyLtp8br2WkI1tTWwg8zEPK6r3X46rc8w4tvfV5WKfFHiJjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Q4GGcK9ZQl7RNDMv0WW1h/yBqltxTHrUpYa5tKPcWs=;
 b=S0rkuLk5+GjEcZ3ZWokh4onvtMYkRQpfx0+7tkumlZ2lgauPovJWkJsRA2xrbWbfJ9HG2l5UVQZPqmwd7RYEYceW69WED6I4oOwTeta0Ej3tJiBzkfYe932ve5D9zPE8tTCPmbhtefnkOUuxL+G5W82+6O6uGNTLVQPKfpCKWiWhO2zTot9d+36ZGj0sMzSpOvY5wRztODlR95C5fs7BsF/H6pJksXkDzbT4fBaNU158YwS0xE+V0WL08TGXynUqrpAR59g95LF/YIuxlKrn1W1PQYY3gG2oegwtILaJUOTK6RCZAZKXtDj5SOzcPGsYnCZ/eYXYtb2RtBh4Xg/hYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Q4GGcK9ZQl7RNDMv0WW1h/yBqltxTHrUpYa5tKPcWs=;
 b=eFTzQFDGcRZcmWzELSmtJZlTqgoEy1pY1naFtm9oJ9tH+zBrvkfgw6GlxcDnkP5cZaPoFr/aOorDVQRjPsmX2Iy8LVicf6jmDsFuYDbSi62kg3kxjVY1NAPeOIh4BsOkH3a60f7LXDStrO+LIYjImtdsd0tcan1CNL/B0sANPsk=
Received: from AM0PR02CA0183.eurprd02.prod.outlook.com (2603:10a6:20b:28e::20)
 by AS4PR02MB7976.eurprd02.prod.outlook.com (2603:10a6:20b:4bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 14:06:48 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::7b) by AM0PR02CA0183.outlook.office365.com
 (2603:10a6:20b:28e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Tue,
 2 Sep 2025 14:06:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 2 Sep 2025 14:06:48 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 2 Sep
 2025 16:06:47 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Sep 2025 16:06:47 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id A9CB42D18
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Sep 2025 16:06:47 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id A40292426D0A; Tue,  2 Sep 2025 16:06:47 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] recipetool/create_go: Tidy up a bit
Date: Tue, 2 Sep 2025 16:06:47 +0200
Message-ID: <20250902140647.126140-4-christli@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250902140647.126140-1-christli@axis.com>
References: <20250902140647.126140-1-christli@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|AS4PR02MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c693d4-6b2a-40ed-0522-08ddea29f561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZxRlHmmMWFFqvcDB+ard0B5VY/QVf9TByexcI6uBFrMZ2rTo8T9VYKjXFkzF?=
 =?us-ascii?Q?N5IFBSffkUj+lX3CY29lVLlGYz0gxQ86t6qPxEQMNo5clfLbgEGygaFfgGq8?=
 =?us-ascii?Q?+1V8J6hMOecwFA4bQwVzf12Bvifr9FdGDP6fn6mEefldTYMls27xvH63TVGQ?=
 =?us-ascii?Q?j/tnJ/ydta6tIrRCGtaITw2JVSlWVBHbSDg+tpJFERL4D+G0IPHZX0Rerjva?=
 =?us-ascii?Q?4kJopj+xbA55DShhSPN5I1PkNiBm+UGvaRx1dl2Jf5OBp2GwJOEfBRYt+CDy?=
 =?us-ascii?Q?PyiABW26vIh0lsos5tdWsZ7v6O3xAl+pvkH2kCXutxonJN8ZCV9A0ElYokds?=
 =?us-ascii?Q?m8O1vDNAJcotvSHQuz3lMHkwgl5/Wf8bft02kJyeyAVKz1Wnej2eUhTHa5wx?=
 =?us-ascii?Q?aUeHiOwamC0NajjomhWYGjKA1XqAUB51j8qHlga/dqm2ljYZk8LLBTI4bY0u?=
 =?us-ascii?Q?Dbjklpb6HmSTSI8vKxkTk8riZYLJYChDGE+caSv9x53Fz7EJb7SnnQ09v/NT?=
 =?us-ascii?Q?wusoUk3i/uBYOL4aFkQu6XWXrNEoFEF+CSsv42tkGByQds8MeZ5+ZRJb9Kd1?=
 =?us-ascii?Q?j33KRRs7WiADAq7ZCOLwCclZPaU5xpco6WZeMNG5ISug7wSh1CIXzOBHu7TE?=
 =?us-ascii?Q?qRU7tMO+2hmPUTQwp0PTp3uAfehCbKu+CD5SZ2tnJDuVYRM0KYwUI6jQkw1x?=
 =?us-ascii?Q?fE8ElItOIeSlgWsw/y1GWkvSOgNnKwFv25K3+woZgBBSZ3ckv0nCvPC9RW41?=
 =?us-ascii?Q?R1/HEbeWn3SYFQEND4cRzjzRnDc0gDU1AXiQHn7NfB64C0WTuLCkJyZ4jK71?=
 =?us-ascii?Q?lslm4l34+j21uXYpe5oiffjMqLpT/V+0vrmVgzyIIabZScP89gqicM0vOeJ+?=
 =?us-ascii?Q?9oKDSVdyXoVulLJNqGte2mEUhADHMOCn04FSxz8C2ns5iVJL9xbQ/rMjZEcU?=
 =?us-ascii?Q?Px3UfxJyLrZB3KlnNgjKakAQgPlX2Kud7M9QlWTtiKSoIArTfwCN1HK/oAsh?=
 =?us-ascii?Q?bIXvYNN4Hz2ExcgFtjWDHFmUjL/ly6tpp8X6Bv74hWQSnGshaf4qL5IMfa8J?=
 =?us-ascii?Q?JO9/qfdY9EtAy/ByGqm1r7BYU0jzyn7nHfpLesD9TqFs4nE2ljYACaLVY3lw?=
 =?us-ascii?Q?x+Re97RDtkNh0E8tmeBdB7zngkLXFvkZVGngbFFpM91GtBgCPvZB3VJs1ZNl?=
 =?us-ascii?Q?qtgilnCVYcfHxjHjc1WR6KzoOTmlJKBY/7fUm4c7/WpfH5Y+kh8xyGOBtG+E?=
 =?us-ascii?Q?xxsI0yjRmYN0jnFw/pHO2nfGcf9Rt0QXmbrNCkXq0wuKVangNF9nZt2SuJmo?=
 =?us-ascii?Q?s6C+fChmnW2pHyyfD+vwseFdNv+vHVL+0h2P2VlHVWFJiSwmZEDCkC5GQRdn?=
 =?us-ascii?Q?K8vwuSWHRlQgst71BF4mVcOpqDgPRE6BWmVTiz/uFnqj5zYvSmOcaGM/hFkv?=
 =?us-ascii?Q?O/PY6d0k3l7r8knZ2FSkz3rytYHiQ2U8WZgLJXGtTWjjxxSZ2JQFulI/0jiu?=
 =?us-ascii?Q?TBX5G8rnbPtwSZiQWfVBQGM8fC8F9Bh3EdFR?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:06:48.7407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c693d4-6b2a-40ed-0522-08ddea29f561
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB7976
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 14:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222727

From: Christian Lindeberg <christian.lindeberg@axis.com>

There is no need for a temporary Go module cache after moving generation
of module dependency include files to go-mod-update-modules.bbclass.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
 scripts/lib/recipetool/create_go.py | 70 ++++++++++++++---------------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/c=
reate_go.py
index 4b1fa39d13..1b2e5a03d5 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -32,7 +32,6 @@ def tinfoil_init(instance):
     tinfoil =3D instance
=20
=20
-
 class GoRecipeHandler(RecipeHandler):
     """Class to handle the go recipe creation"""
=20
@@ -85,41 +84,40 @@ class GoRecipeHandler(RecipeHandler):
         classes.append("go-mod-update-modules")
         extravalues["run_tasks"] =3D "update_modules"
=20
-        with tempfile.TemporaryDirectory(prefix=3D"go-mod-") as tmp_mod_di=
r:
-            env =3D dict(os.environ)
-            env["PATH"] +=3D f":{go_bindir}"
-            env['GOMODCACHE'] =3D tmp_mod_dir
-
-            stdout =3D subprocess.check_output(["go", "mod", "edit", "-jso=
n"], cwd=3Dsrctree, env=3Denv, text=3DTrue)
-            go_mod =3D json.loads(stdout)
-            go_import =3D re.sub(r'/v([0-9]+)$', '', go_mod['Module']['Pat=
h'])
-
-            localfilesdir =3D tempfile.mkdtemp(prefix=3D'recipetool-go-')
-            extravalues.setdefault('extrafiles', {})
-
-            # Write the stub ${BPN}-licenses.inc and ${BPN}-go-mods.inc fi=
les
-            basename =3D "{pn}-licenses.inc"
-            filename =3D os.path.join(localfilesdir, basename)
-            with open(filename, "w") as f:
-                f.write("# FROM RECIPETOOL\n")
-            extravalues['extrafiles'][f"../{basename}"] =3D filename
-
-            basename =3D "{pn}-go-mods.inc"
-            filename =3D os.path.join(localfilesdir, basename)
-            with open(filename, "w") as f:
-                f.write("# FROM RECIPETOOL\n")
-            extravalues['extrafiles'][f"../{basename}"] =3D filename
-
-            # Do generic license handling
-            d =3D bb.data.createCopy(tinfoil.config_data)
-            handle_license_vars(srctree, lines_before, handled, extravalue=
s, d)
-            self.__rewrite_lic_vars(lines_before)
-
-            self.__rewrite_src_uri(lines_before)
-
-            lines_before.append('require ${BPN}-licenses.inc')
-            lines_before.append('require ${BPN}-go-mods.inc')
-            lines_before.append(f'GO_IMPORT =3D "{go_import}"')
+        env =3D dict(os.environ)
+        env["PATH"] +=3D f":{go_bindir}"
+
+        stdout =3D subprocess.check_output(("go", "mod", "edit", "-json"),
+                                         cwd=3Dsrctree, env=3Denv, text=3D=
True)
+        go_mod =3D json.loads(stdout)
+        go_import =3D re.sub(r'/v([0-9]+)$', '', go_mod['Module']['Path'])
+
+        localfilesdir =3D tempfile.mkdtemp(prefix=3D'recipetool-go-')
+        extravalues.setdefault('extrafiles', {})
+
+        # Write the stub ${BPN}-licenses.inc and ${BPN}-go-mods.inc files
+        basename =3D "{pn}-licenses.inc"
+        filename =3D os.path.join(localfilesdir, basename)
+        with open(filename, "w") as f:
+            f.write("# FROM RECIPETOOL\n")
+        extravalues['extrafiles'][f"../{basename}"] =3D filename
+
+        basename =3D "{pn}-go-mods.inc"
+        filename =3D os.path.join(localfilesdir, basename)
+        with open(filename, "w") as f:
+            f.write("# FROM RECIPETOOL\n")
+        extravalues['extrafiles'][f"../{basename}"] =3D filename
+
+        # Do generic license handling
+        d =3D bb.data.createCopy(tinfoil.config_data)
+        handle_license_vars(srctree, lines_before, handled, extravalues, d=
)
+        self.__rewrite_lic_vars(lines_before)
+
+        self.__rewrite_src_uri(lines_before)
+
+        lines_before.append('require ${BPN}-licenses.inc')
+        lines_before.append('require ${BPN}-go-mods.inc')
+        lines_before.append(f'GO_IMPORT =3D "{go_import}"')
=20
     def __update_lines_before(self, updated, newlines, lines_before):
         if updated:
--=20
2.39.5


