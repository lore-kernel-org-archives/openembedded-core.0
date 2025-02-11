Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B78EC021AB
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.76])
 by mx.groups.io with SMTP id smtpd.web11.1128.1739286052946746079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:00:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=q56IapI8;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.76, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwa7obfkBDVgg52R7//6N5RzJOqcm/K2xgKpf95WWXr061Hg3CyExVetNdc9jMZGRqYVo9RvY8Gu/y/K8mbj8EN/vUwhKsNMJsbapSmIChxMBul5YFrnVTk7cXrUuXLWyzkexxyU6vXitJ+cnVBD2EdGYfQOPGkFpsDGd40BXRVmKQMUvo2EgZMWirbrQiMhtKKRAo3roZzPlkIJ4wTN1elOU1/I1WvEtwIU5QUERq82AIPETMf9vLHlDxw5OjiSsZM9Pknkwe3goHV9CP7Aam2dWC4XEI3OzFYX0tQvWqH0DIg9k43VhR7m9j7TfR3drElQsCiQAr4vibFqig2CtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4JXh/EGRc4IpqrK0PJnmUqNSOFgHWS6OMviH3LpTAU=;
 b=HZp/gJZE2P8la17x+ZGQE4RisbMd6LjqmlXAzOdtMir3gSlAQJvR8hBtrfK6MYxmKAA1/R50AhcQNd3+5wSSpcFpc04LWFrUI/3jr/7OkQNukQ4Lc6FYjAeBX0oysOq8Pjs3E0qxw+rtIbPuZGjuM5U7eRnpOhTU+LuTDJIx4mgP1MKUDe2Z8tudhvomYWd/Zqy1GEja8P8er7Ky/HovwjRyI9jwf+pOF9AfhUPXjrV2+B16jOOteRmm+KXV/QY8GiVMK33sdP1L9zEOvVMABCCM7Ry4S3K+oVEMmZF4wcyBkN29eH/HLsbeF+WilL8wFF5wt0UnX/NuqrTYmrtMBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4JXh/EGRc4IpqrK0PJnmUqNSOFgHWS6OMviH3LpTAU=;
 b=q56IapI8Gf14cPk3Bny1XZoFqACQ5mbYo6g2DqMmJNJ/+jI231/yph3H2q4TgUZYZz5CxJHfe+ywgi2Kky+kNqoYsRHGRL1asqUOMIyU2gQj/usqtEzppTOoVxEULYA+IeMckwp94sGq7neWlejJ/6ob/1+LUPJIZLSOh1kM73WkYSoWT2cCiGn2s7sDyynWNBes8PTnVTVL32TVhz8fybPOEldIrhBiVqqmO2YVNyUtKc+Mrx5NGrSwgyVUySwiybAT6AIjnk8q4JMNrwy9I5KCrPmKsiJwbT4gAwelxPmHhV8rdrypQu8v0a8Zx8CKqdlxDDDu8u+YpzZN15zZrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Tue, 11 Feb
 2025 15:00:53 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:53 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 08/30] lib: oe: vendor: add npm support
Date: Tue, 11 Feb 2025 16:00:12 +0100
Message-ID: <20250211150034.18696-9-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d05ec9-f981-4936-1fbf-08dd4aacdf25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gs9O+HQleI0pGDxaXi4ci04E5PJyFUnK/NHXbEErt6+5lHG3dwWSbWm0CpH7?=
 =?us-ascii?Q?RLmZFlmmeJuVsH9W7HGYApAJ8L1YS6mleAhX66iLli27lC0fV8DwwRNs4Yss?=
 =?us-ascii?Q?IkxYpUImxguoIfwkLMbiVyPZXzlZ7iJ9XiAnl8Ud+Eyht0+dLlNJ+MwB95Vt?=
 =?us-ascii?Q?tHuJOBBM/be1HB4sLZstoljBDbiZSWk80WT7xK33NLc9YsRz055OkdMj0OYs?=
 =?us-ascii?Q?1KFBWnG9R6jEc/b9CRHWxWsx36zKzt44kqTu6MFH7SW6FWAwgTjlzrjsizwK?=
 =?us-ascii?Q?XqCfb3b/PzcvjlQPeVYb6wqlPHBBcTwxhgoXM1TZgn5amuf0TPz6Dz5MG6B2?=
 =?us-ascii?Q?om5EaMiSM7s/cnJiU4A8NpLepwpC93K+GSO+KV0npt+QwPvGu7WtQ0j+mXXT?=
 =?us-ascii?Q?eIghqqcsLEpw/mlkNT+oqPA3vfyK4RgvrlW/qAf8n9+56yMWzwYvoU5YFA+1?=
 =?us-ascii?Q?CrSeyepd4Ol0iab9F5qWNKLq1W97RrclCqHNiKHveKr9kqoMS49WJKB2Eh7t?=
 =?us-ascii?Q?BD/l5bw8KRbkI1RlQJc4+Iq0pxhCPyyNbdZqqcs+sLG0d9q2X5KN+HpswQyk?=
 =?us-ascii?Q?8/vQDEXoNMQzWk80+aotPPv2ch4Y+KNwPK4IOlvlOwhWlTLajOFHD0ytMmlk?=
 =?us-ascii?Q?iQwzN7pPxtdbszbLFeIQyYltBGGDsFR4uhf4Uo/YkwVEVJOABgCtB4Funzgz?=
 =?us-ascii?Q?31zUWQXXBwLkkHSqZz5/MOLQqf+snpMby08e79BIaaBxmF4gaSpgjGIfgTSU?=
 =?us-ascii?Q?uFc2uPsW/PfA5VP1K+o9CTfMngvBBuUYUTvc+T5FaleCTkh2v/OsLKyhBXQW?=
 =?us-ascii?Q?x+MP4NCvN5q2Hud1eTum0PB1s1N2zFdWjvCIKbWqrJtLNuTG2FTKJklDjKLx?=
 =?us-ascii?Q?WBdVptpD8OvWL8dKKr+BhvIUyRkMW9JrvTEwOGckAmjBxLaYmrVLGgOkeFw5?=
 =?us-ascii?Q?aQ3jfbZBmB7HUIE2beCTwFcKqZzD/nD928r9DhsRS4cjdCtt29u3sCnjFxXK?=
 =?us-ascii?Q?fPQ1HdbViAPh53Q6OturOjepp3m8ZEX5I5NTQaggoza4vvEz0HQoWkjay1bc?=
 =?us-ascii?Q?QJG6q/6M1JAIHq2Poettv5s+XjkM9GSUOzdGaZdyVtYx1mMsZO4OYkoJ1TwJ?=
 =?us-ascii?Q?cqIJapYQCfqbnpiuZnkDPFvuYMdj6MDVxei659BYFj8h2+Wzi+QZxVAvqk7X?=
 =?us-ascii?Q?YoBpBXOrm2c9mv+MiaAMYbK4Lavt/jSbSUgrAXwSQ87wJ+cJMhkTNMGmH0JW?=
 =?us-ascii?Q?em832z85M8AWh52mTopFshgSYp7IC7tKJ0j8Qp6jGviTqbTqzM3jZSdGgiFl?=
 =?us-ascii?Q?Zcq1j1mXQrsnwcR9ABlQy/Z+c3FT6mqXHo128OBRigcyFzuiwL4qSO8AcuD/?=
 =?us-ascii?Q?GBujMvClCzKGF/kpoVSRfLJnvIGm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?97NdLSPiXn5f3XfXLtIKFgMfJYa/Q4wyqYl7giiHZKekXB/pBZRYoyymF5wk?=
 =?us-ascii?Q?653QRQQBPSQun/QAvO5idtN4LgPWCinLszyG26RTUu+nkuP/zhHccKW/TIGK?=
 =?us-ascii?Q?F5a/qj/d1W933O+pjwEikaMPhdA/5dH/kIjrnzfbrEG9ZRybTqn+y1wimG7Y?=
 =?us-ascii?Q?jILmMPazXCe/+jlaossaWL8Awrpg5/VwYmr1Iwnsy3XLqAHl8aL+pTLrr0KD?=
 =?us-ascii?Q?WU04kwLG6lleP5Z15ORUHwgrozn3KprlRasj90Hajmmz1k18cUN5qLlrx1Xb?=
 =?us-ascii?Q?4xdzxHUh4ii/iYJnl5k2amGmOCAqoRv1LmACMefhYE9UK7I6KsbYaGP6//Zl?=
 =?us-ascii?Q?yvX3C7BLezwyKAkCUs5L/ie+dvJ/I5vdlscZWb9Gb2nP5W7238XuhF4LAFIE?=
 =?us-ascii?Q?uFkM2XYVTLDWfZzeMfd/NrZQ3lwr2A4cEJnpPNII4BX3mJTnvX9XX5XGqAw8?=
 =?us-ascii?Q?ZT5L+786Wb0Jhlor2XiCRvHlyURVPWHs/qyMFh4tShQjqz78fFSt86SEUT3F?=
 =?us-ascii?Q?PmFmHYmEhPtkoRXNmBNomuyesZfgYAayuNTo0/7HMPiT7fscL7ZpQ0RrJjtO?=
 =?us-ascii?Q?HvhDdnF+kK95SEtrduAbQJeFiuzonPf4Db1Nym/X5bn4AbxBwqTAva5H7MhE?=
 =?us-ascii?Q?g3WWa0KL4Clwd0HbzqkXOYBl6fjixJjq6FDNJ7kX0NUhh4OlDXpuwsxoaQlv?=
 =?us-ascii?Q?SJqhhB+8jYsKOYfbjxA+9mTvL+E7pFfx8wYb1RnwZVcgGMtmOesoL+ZhuC59?=
 =?us-ascii?Q?CfPv0dNpA8KrNVC5sVMKuifyjUMEEFfEiEjb+evW8SPQJSxrvMA2f1fxgHq8?=
 =?us-ascii?Q?r5DHL93ggnC8Fp3YQ+XdCVG+qKgW1Xcz7By4GGtU2dfa7NoGcAgn5AvX/Lah?=
 =?us-ascii?Q?/yPiQpVM8/pkHQJ4tEnXTzv9SzXRbpdH+ix7GOG1OQAtgdPcg91UTMVbZzqs?=
 =?us-ascii?Q?an2TxUnOgav2TdZV3ElTFapDC6fY+FohcXt8PvEmnUmD1UzTxmCbDNrw1sKH?=
 =?us-ascii?Q?9Gz7TJKxQITbL2jfpS3PJHM9qTzUm+l824p5kQM3cl4FHJZdX1xvr1Wx/krO?=
 =?us-ascii?Q?fIhQWfp50FSrFkdC7jTBxPi220KIG04UgTNHZnYQAC7p9uAd/Ra7aDPeJvfL?=
 =?us-ascii?Q?CkYizoRU17TAKPNx8rW5wAy2A1TyefcmE7z4vcBhCDhhpPOYdEIrKfjxuVfX?=
 =?us-ascii?Q?G+k1qWWeXgketyknXhUpYNcy+t8iaH7iFH2PoUeX120fthW7JHMxK6jdYm8K?=
 =?us-ascii?Q?jHTzyaN4MnYTbSYwmDpIiMIjYt+5V3+9/bQOyjxOYNNiUDE/6XzS+xA1sjG8?=
 =?us-ascii?Q?xNAMVLcRbpbGY62acxhALn1cDNzWfrEssNtYpbDSOdgGogN+8UFxA4OvXcFg?=
 =?us-ascii?Q?O0Q63Ao+QD3cg3nybU91HJE0Szhy7+T0uSDRkZEMthAJvdjW2oOMHtdyN4A/?=
 =?us-ascii?Q?byf2ki6/en7wgNxvq5NzFMkfbF1rakfvDICQhS0HExjMU+TPtrZELxC2YhfS?=
 =?us-ascii?Q?nAfpqYWMOONZG77dUbajkMPBcqaFY4O2reP0LuTtBeRQV7fRm2rbQjo4OoLd?=
 =?us-ascii?Q?+TZz9bkyrA1PNOhePpqLLSRSY7hmeq2ZOoARBD7s2jcpz3L88G9FbO5U8QY4?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d05ec9-f981-4936-1fbf-08dd4aacdf25
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:49.6329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrWE5IO3dQWqhBznBQlGMaknLGXl9FrSzD9IUNCTcTmxoVgQIJQ58jZduzpnph2gcBLXQuIuH5zYFRbRrHwQuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211133

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a vendor module for npm to resolve dependencies from a
package-lock.json file.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/lib/oe/vendor/npm.py | 141 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 meta/lib/oe/vendor/npm.py

diff --git a/meta/lib/oe/vendor/npm.py b/meta/lib/oe/vendor/npm.py
new file mode 100644
index 0000000000..6dcd756dcd
--- /dev/null
+++ b/meta/lib/oe/vendor/npm.py
@@ -0,0 +1,141 @@
+# Copyright (C) 2024-2025 Weidmueller Interface GmbH & Co. KG
+# Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# SPDX-License-Identifier: MIT
+#
+import base64
+import glob
+import json
+import os
+import shutil
+import urllib.parse
+import bb
+import oe.vendor
+from bb.fetch2 import URI
+from . import ResolveError
+
+DEFAULT_REGISTRY =3D "https://registry.npmjs.org"
+VENDOR_TYPE =3D "npm"
+
+def determine_uri_path(path, name, version):
+    return f"{path.rstrip('/')}/{name}/-/{name.split('/')[-1]}-{version}.t=
gz"
+
+def determine_downloadfilename(name, version):
+    filename =3D f"{name.replace('/', '-')}-{version}.tgz"
+    return oe.vendor.determine_downloadfilename(VENDOR_TYPE, filename)
+
+def extend_uri(uri, name, version, subdir, checksum_name=3DNone,
+               checksum_value=3DNone):
+    params =3D uri.params
+    params["subdir"] =3D subdir
+    params["downloadfilename"] =3D determine_downloadfilename(name, versio=
n)
+    params["striplevel"] =3D "1"
+    if checksum_name and checksum_value:
+        params[checksum_name] =3D checksum_value
+
+def determine_src_uri(registry, name, version, subdir):
+    uri =3D URI(registry)
+    uri.path =3D determine_uri_path(uri.path, name, version)
+    extend_uri(uri, name, version, subdir)
+    return str(uri)
+
+def parse_lock_file(lock_file, function, dev, bundle):
+    try:
+        with open(lock_file, "r") as f:
+            package_lock =3D json.load(f)
+    except Exception as e:
+        raise ResolveError(f"Invalid file: {str(e)}", lock_file)
+
+    packages =3D package_lock.get("packages")
+    if not packages:
+        raise ResolveError("Invalid file format", lock_file)
+
+    for location, data in packages.items():
+        # Skip empty main and local link target packages
+        if not location.startswith('node_modules/'):
+            continue
+        elif not dev and data.get("dev", False):
+            continue
+        elif not bundle and data.get("inBundle", False):
+            continue
+        name =3D location.split('node_modules/')[-1]
+        function(name, data, location)
+
+def resolve_src_uris(lock_file, registry, base_subdir, dev=3DFalse):
+    src_uris =3D []
+
+    def resolve_src_uri(name, data, location):
+        integrity =3D data.get("integrity")
+        resolved =3D data.get("resolved")
+        name =3D data.get("name", name)
+        version =3D data.get("version")
+        link =3D data.get("link", False)
+
+        if integrity:
+            algorithm, value =3D integrity.split("-", maxsplit=3D1)
+            checksum_name =3D f"{algorithm}sum"
+            checksum_value =3D base64.b64decode(value).hex()
+
+        if resolved.startswith(DEFAULT_REGISTRY):
+            resolved =3D resolved.replace(DEFAULT_REGISTRY, registry)
+
+        subdir =3D os.path.join(base_subdir, location)
+
+        # Skip link sources
+        if link:
+            return
+
+        # Handle registry sources
+        elif version and integrity:
+            # Handle duplicate dependencies without url
+            if not resolved:
+                return
+
+            uri =3D URI(resolved)
+            params =3D uri.params
+            params["name"] =3D name
+            params["version"] =3D version
+            params["vendor"] =3D VENDOR_TYPE
+            extend_uri(uri, name, version, subdir, checksum_name,
+                       checksum_value)
+
+        # Handle http tarball sources
+        elif resolved.startswith("http") and integrity:
+            uri =3D URI(resolved)
+            params =3D uri.params
+            params["name"] =3D name
+            params["subdir"] =3D subdir
+            params["striplevel"] =3D "1"
+            params[checksum_name] =3D checksum_value
+
+        # Skip local tarball
+        elif resolved.startswith("file"):
+            return
+
+        # Handle git sources
+        elif resolved.startswith("git"):
+            resolved =3D resolved.replace("+ssh://git@github.com", "+https=
://github.com")
+            repository, _, revision =3D resolved.partition("#")
+            uri =3D URI(repository)
+            params =3D uri.params
+            scheme, _, protocol =3D uri.scheme.partition("+")
+            if protocol:
+                if protocol =3D=3D "ssh" and uri.user =3D=3D "git":
+                    protocol =3D "https"
+                    uri.user =3D ""
+                params["protocol"] =3D protocol
+                uri.scheme =3D scheme
+            params["nobranch"] =3D "1"
+            params["subdir"] =3D subdir
+            params["rev"] =3D revision
+
+        else:
+            raise ResolveError(f"Unsupported dependency: {name}", lock_fil=
e)
+
+        src_uri =3D str(uri)
+        src_uri =3D urllib.parse.unquote(src_uri)
+        src_uris.append(src_uri)
+
+    parse_lock_file(lock_file, resolve_src_uri, dev, False)
+
+    return src_uris
--=20
2.39.5


