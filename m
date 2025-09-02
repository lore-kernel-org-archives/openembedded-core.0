Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0278CA1009
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 14:06:58 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.25])
 by mx.groups.io with SMTP id smtpd.web11.78254.1756822017251074820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 07:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QDWuXYuA;
 spf=pass (domain: axis.com, ip: 40.107.162.25, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEeJbHc7xnoJBQeBGKrwSQ011++wEu/f5OhmC3SZP6ktZwOEs0ylb+LG+MLXAEo1zDXURcELsztLCCp6r3mWv2wdPRrdF+CfIxKY4Ci7Nv3WoayGzSsjTR08YN2JvvFSDm2zaJod24mP+E1zckY3Z0gcLbivwWAJ1/qnvRpQc9yiG1sl5AKvbYyXT7WjlVa0wwNCzgzd1SmrS8HJgQwFZ0mrFdnVTEAj/O87YgU+44zidJPe/VM1mAtDj3HaJbjpKTgmrBiRsRlW0gK78uH1GKIZJUQrH2IZj6F6/ByA2/i5URKG9XRvmejp+YXvu4anmrWWO1h4cMFuxsYg545u7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXATFyfgy525gxdO87j9U57Bo+qFdGzNHjXOMZ9FY6A=;
 b=Jv7XbEmuUUc+EDvMg5zpY6AuvvFbCHE9mL0giHTJ9iWfY3ntYiqxEFNzkcVmjfBhAcWKNkm+2cL/GDIdLc8jBCLFD9bcCm/xIqStVDE8NAEfQ/tUmyqfD8gakLHtuS5kFZWo9fJRI9Gzj3MBeU/0Op6KHeEKQOvxxD/EBfwnD/Cl72Gn7rHhqx8kKXT20xOFJtTClagXa8AQVzGoh2LitQOBIJakXyqKB0dJRE3cnVTV2W6kbDDU6CaEyu0Q59Xxlwqm3sSu78k/f8Fs2QzZqiWI7NneUdbt6rjf71s+5z1uvDTrYDwQ3ocxUlfmFc3S/4n88FFRforb4kWbDVQSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXATFyfgy525gxdO87j9U57Bo+qFdGzNHjXOMZ9FY6A=;
 b=QDWuXYuAwwNgRQ1K2g3YBoFRe5SHbEynfucKvbGHMgJmCQEjOccWfyDutC+j7B/keU2cuq31qDtsoFFo+IMbbsgjky83DqUsSAWFo6jsrP1wKQnGYnQQ+YtOQjVxuy4KoHrjCePbmpqollFRIBdkoyUU7jKo26lhcVSLThlo66k=
Received: from AM0PR02CA0172.eurprd02.prod.outlook.com (2603:10a6:20b:28e::9)
 by PR3PR02MB6188.eurprd02.prod.outlook.com (2603:10a6:102:6f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.26; Tue, 2 Sep
 2025 14:06:52 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::f9) by AM0PR02CA0172.outlook.office365.com
 (2603:10a6:20b:28e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 14:06:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 2 Sep 2025 14:06:51 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 2 Sep
 2025 16:06:47 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Sep 2025 16:06:47 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id A8E70F74
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Sep 2025 16:06:47 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id A1E322426D0D; Tue,  2 Sep 2025 16:06:47 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] go-mod-update-modules.bbclass: Update license finding
Date: Tue, 2 Sep 2025 16:06:46 +0200
Message-ID: <20250902140647.126140-3-christli@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250902140647.126140-1-christli@axis.com>
References: <20250902140647.126140-1-christli@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|PR3PR02MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: b961cfdf-3cd4-4e19-e949-08ddea29f6f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cFoSu2RxbktAPwim0o4LDwgkc/3OjqhIdiu6O5q5QQlGIa2JI6UWPB3CFRHx?=
 =?us-ascii?Q?ZqHy49t0+T2UhAX0VNGMoSwPiq/Z+d+bDHpMOjv5qDFPqToYJoaBi+zgC4k6?=
 =?us-ascii?Q?MCfOkL2XVag/qVftiEnOUlXIJaXB/LAekj0T4j8Sempp7Ims0dYJaGK4HCjq?=
 =?us-ascii?Q?s4vwtdRp22YkNC7Ze0iLB6BZnGLwnGj3K6+2n7cNfz1nCMbO4wX9KtPNcrda?=
 =?us-ascii?Q?p4boqx45XcZFi5561EMfNHvZKgzI33nK/j8eGrnZyNGri7QHH9F30GorRSJ5?=
 =?us-ascii?Q?Dcq9ZibXVjcapqVEzacVow62cwnsIBX1/uuRhEoIi5+xJAgm/JgHJC5OnysA?=
 =?us-ascii?Q?jttnDshqTrF2U0jIwM4rofLfCwVYif8bNihGJEXDhHQhkukbVOE6OMKNNgfc?=
 =?us-ascii?Q?43LVV9kgVQUo4UMP9MbFdBwg2d8a+Fjso0rd2PjvVAkN9EPL+SsFqbAWIPUR?=
 =?us-ascii?Q?Qohx7ccfDzuGNAsmSmAMc8jJ/2OpqmmaWgHct4SX1Xoy7nwCb7qmengFICBg?=
 =?us-ascii?Q?zDEpY0dkYmWJSDtrOMgG/tpjWc7nOubpIDTut+ny3iIFzF9ptykoGE0NRHQM?=
 =?us-ascii?Q?e6Pec/gqLZLVE9B+7w22XX4dF8u9vRSvWjVbJTWJSJm3++kTirOEXkUnij9n?=
 =?us-ascii?Q?7VsK4/NZg51hUpkGlDbHUh8ol0vacXkr+XkCMDrd2o6mZiy/j488L8jzuTuO?=
 =?us-ascii?Q?2m20GCINT6iDmkIx+rwAxWE5aSTXslEXLymvfjROs5kHEqogDeL5S2QVpiZq?=
 =?us-ascii?Q?91ZesiByKY+cJkcxCZ25YA9YYFa15zRfKlGQzX5wlbdkW43s8BDecmxDiLW2?=
 =?us-ascii?Q?pUcvl0eSsOcuWEdJjdZ60UGgBjyIGmRpV7JePgS/Wdm4JBF0sTyBzjuysaRL?=
 =?us-ascii?Q?8c44B16AyvRfAqPRCSrugZt45zqcVGhAF0VaymhgOncw0P+vsGJwb6/c9TSh?=
 =?us-ascii?Q?mP3EYAfe247Zfnp9SqNfpklTtifqQV2zGp8k1wGkteEuc3uXxOSiCpR4STkJ?=
 =?us-ascii?Q?EsgHdUSQvDP70W+ZRLGsn7qsfu2DPGoT85fi9nn21vXPVesGVcSg8Rt0L2ln?=
 =?us-ascii?Q?48qpRmdWksWHshqbp0PRZNeTFhJUl5XIyfpdpQYznrbVc313ifn4krv58Thu?=
 =?us-ascii?Q?wugzZLVpbadWuEDvdJYbTM5e3kGKVJDwUULyJKUqz8y3v/SXUdjf3c668b8d?=
 =?us-ascii?Q?itvqJX4iOwj6w5JkwLHWKSnhbZ8dxUI5vAWxxxidY9NFX1GGwgPA3K8sb3Ej?=
 =?us-ascii?Q?GNytPNWo0tHkN1vsA3gR/NUtZSks6kuGgNSRG2++ed5c7al0m4iJmO518/k9?=
 =?us-ascii?Q?ZRi4+68nb/XEC3BxlTCywksJWclS/l4+/yHU+CfPcAN7oDzmtX914Mh4lxoe?=
 =?us-ascii?Q?dLZZXYUyreqsXIYl3A8PAC7Mwt+cJ2U+wNDnJumJei6L5vEZFqaoN1NWp06/?=
 =?us-ascii?Q?QiomK/GG1GWj18Oec8ebpQgLGM3UDxNvKS9oZOAvz0rE9klKVgiwbyMBv48T?=
 =?us-ascii?Q?I8yGwdoKDjCU/BshYdq/oeuiw9nd64ofRuST?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:06:51.3932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b961cfdf-3cd4-4e19-e949-08ddea29f6f5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 14:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222728

From: Christian Lindeberg <christian.lindeberg@axis.com>

Use ${GO_INSTALL} when listing package dependencies.

Look for licenses for each package dependency continuing upwards, but not
above the module root, until some license is found.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
 .../go-mod-update-modules.bbclass             | 30 ++++++++-----------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/meta/classes-recipe/go-mod-update-modules.bbclass b/meta/class=
es-recipe/go-mod-update-modules.bbclass
index 5fccd0bb0d..0083588a25 100644
--- a/meta/classes-recipe/go-mod-update-modules.bbclass
+++ b/meta/classes-recipe/go-mod-update-modules.bbclass
@@ -15,7 +15,7 @@ do_update_modules[network] =3D "1"
 python do_update_modules() {
     import subprocess, tempfile, json, re, urllib.parse
     from oe.license import tidy_licenses
-    from oe.license_finder import find_licenses
+    from oe.license_finder import find_licenses_up
=20
     def unescape_path(path):
         """Unescape capital letters using exclamation points."""
@@ -47,12 +47,10 @@ python do_update_modules() {
 """
=20
         env =3D dict(os.environ, GOMODCACHE=3Dmod_cache_dir)
-
         source =3D d.expand("${UNPACKDIR}/${GO_SRCURI_DESTSUFFIX}")
-        output =3D subprocess.check_output(("go", "mod", "edit", "-json"),=
 cwd=3Dsource, env=3Denv, text=3DTrue)
-        go_mod =3D json.loads(output)
-
-        output =3D subprocess.check_output(("go", "list", "-json=3DDir,Mod=
ule", "-deps", f"{go_mod['Module']['Path']}/..."), cwd=3Dsource, env=3Denv,=
 text=3DTrue)
+        go_install =3D d.getVar("GO_INSTALL").split()
+        output =3D subprocess.check_output(("go", "list", "-json=3DDir,Mod=
ule", "-deps", *go_install),
+                                         cwd=3Dsource, env=3Denv, text=3DT=
rue)
=20
         #
         # Licenses
@@ -66,26 +64,22 @@ python do_update_modules() {
         # Very frustrating that the json parser in python can't repeatedly
         # parse from a stream.
         pkgs =3D json.loads('[' + output.replace('}\n{', '},\n{') + ']')
+
         # Collect licenses for the dependencies.
-        licenses =3D set()
-        lic_files_chksum =3D []
         lic_files =3D {}
-
         for pkg in pkgs:
-            mod =3D pkg.get('Module', None)
-            if not mod or mod.get('Main', False):
-                continue
-
-            mod_dir =3D mod['Dir']
-
-            if not mod_dir.startswith(mod_cache_dir):
+            pkg_dir =3D pkg['Dir']
+            if not pkg_dir.startswith(mod_cache_dir):
                 continue
=20
+            mod_dir =3D pkg['Module']['Dir']
             path =3D os.path.relpath(mod_dir, mod_cache_dir)
=20
-            for license_name, license_file, license_md5 in find_licenses(m=
od['Dir'], d, first_only=3DTrue, extra_hashes=3Dextra_hashes):
-                lic_files[os.path.join(path, license_file)] =3D (license_n=
ame, license_md5)
+            for name, file, md5 in find_licenses_up(pkg_dir, mod_dir, d, f=
irst_only=3DTrue, extra_hashes=3Dextra_hashes):
+                lic_files[os.path.join(path, file)] =3D (name, md5)
=20
+        licenses =3D set()
+        lic_files_chksum =3D []
         for lic_file in lic_files:
             license_name, license_md5 =3D lic_files[lic_file]
             if license_name =3D=3D "Unknown":
--=20
2.39.5


