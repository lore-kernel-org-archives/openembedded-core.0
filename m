Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207FDC021A7
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.76])
 by mx.groups.io with SMTP id smtpd.web11.1132.1739286057297610302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:00:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=rtwIXnpb;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.76, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5EbFpkbCsyve8Q/AqMDrV3Y2EfLWjQJp3NUgGHhIH0HdLND6LrGYYmMWPhEO+LNBWT11r7HhwRG2SUjHZgZ91rvQsG7Dgq4MiCduzou+BoKxLZz21GkBl+WcW+Lr63+13O91ZnCYlbZ3sXB9QAGHtxagsBQszqEBqlirV3VDtVMUW5AOJwHMM1w1yeqC/DjlJdvdvte6jIOUefvzKiyK15a/S1SqtF/YwLA1h/2639mSRTlV1JSjxsIZlsoMq80trS0/wND0Vm4g4zxBWGxYYxWTDTvR6sp38DRFbz9kX10vA/dh44apZywmFwJ6xN30r2yji34PkhJYQPPuJn3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geqTOqFQ/Cs7MsW7t0k/cNIf0rh9fj2wTgeFCddTq4M=;
 b=kHAVBiOTC/TexItCSoSOLgsn+9Vf+lnMRNZRtE2UoIAFT3Gi2tcDqSNnSbgL1RnxYmkkJCIUWyrqKf5eAemQJMakmnRWyeaDF5jdTq4j6Q0j6LhyIjdbQtUTI9kaGlTL0y8Xw3sxG2wqg2vLe0owJOErOdu0LA/pVOChFv8BG+zlIsxJ6fyaeVZyXtC7g+o58go+nz+GwY9p2qWl0i5h/Vs9dC2YWoZn8ALCJU6XfwjqPHK4Id6/b0kSEnyHY3vZ+UeOMctY61Lnda9MwoaHq0VSQ6Vbn5OF7fAS2KgYR5+l98f4DEOeNN60ZxXnxqH7ZtylDDt0Jy52mOF5lTM5HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geqTOqFQ/Cs7MsW7t0k/cNIf0rh9fj2wTgeFCddTq4M=;
 b=rtwIXnpbhWxtb1W1HVSG8fJFkPOVw6AhfUcVRY1qNDrd9dUox/zs99qDteHcUd+cx0D7fiqTTxcdkbGn7/94c37J+o70SNK5A1kvKnHRUc/cGmhqlkclOZSlggDo9fts2g74zHjAp8IgFlz9os9mgqGmPC5sDXnfSkPlIY5DTnVNL2sepTGF8kxGJ9c3uQZZBSkWkhyWkDXEvTc6y4tTeSiurHmyW1V8vjhN9SuxrbXEvqvicf3AP4kmFJcpWhwUhpU5GHUz8z5Xg40mtlWeJWUsC2vRhgWvbk93cUNN09IqoWxWBQLLNT9fV7ihXWa4Kz4OfjD/S1Pbhoj0LX7S5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Tue, 11 Feb
 2025 15:00:52 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:52 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 07/30] lib: oe: vendor: add go support
Date: Tue, 11 Feb 2025 16:00:11 +0100
Message-ID: <20250211150034.18696-8-stefan.herbrechtsmeier-oss@weidmueller.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2515c3c5-16a2-4cfa-1a04-08dd4aacdee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sYNLLWg8icJw+4+KReSz+18pKoERK61b/UbFY5YXrwSDT8d8u6o0OI5z04ju?=
 =?us-ascii?Q?6V3L/d4Fl7DXcmfRYGd/rzQg2pd40ZpXEEZ6NwriHAXlinFpYlS6sXxowZZ2?=
 =?us-ascii?Q?okYbdyf8Ltx9dccvNd9E5C+T4tuK65ZZf2eE+HC1PWyH7dKGWZzRzrMuuKOq?=
 =?us-ascii?Q?/ycz6BtRd1ozJmskGLOaoIAxQrFVVefqfC+lMiI3ATDYOI2BkoywYW6jsjgs?=
 =?us-ascii?Q?PAwcefQDqAY7k39D1gsXLy7s5Tx1rfipmSA0X9Yts9QruGZ+mGYo1v3v2SaA?=
 =?us-ascii?Q?f03WGBxMfzY7cZi51wT2Ahx7PEFKxSWueqYdlp+791VDJ8C7/1h0rG3WqHIH?=
 =?us-ascii?Q?wFZwBfRMbwUq264+Sxn6lhMJrHoemqhReofJ7k3B0e1lOw01qiiuO3K7ZNRi?=
 =?us-ascii?Q?EMF1TnvcdENnydwwbUGlC+pMBzxyh6LZGZ/CZt+7SQxFpS7B8qc8xmBjtomv?=
 =?us-ascii?Q?CN4JpvzieOT0sMi7XAFORn2Qrp/czEt+oHmZIeZprf78IMuQd+9eqB/Kn5vP?=
 =?us-ascii?Q?AN4IOvGP8Y7PUe2Q6UScZKNR6jFcUF7Lp8m7Z/9t3kDWWr36CpDTiq+AYeHi?=
 =?us-ascii?Q?msPOfH7ra0lkHwoBvWEt2vyZMaiHgIGoRg5FdGqHHCtWE2MqRAgZ94SJdpSB?=
 =?us-ascii?Q?MMKVj8U2dFOPUiZY4sAG/ZyAOp9r7jaRsCRj+9st91muLm9ebklBdm2KEzk6?=
 =?us-ascii?Q?9KWtqYnmLvE4luDQJlfaKHjg8IUxnOLYaYE6SsTjWvXHGkYE5n81YNF9po/d?=
 =?us-ascii?Q?PTwYva6sGm+ST0hlQLfYN9ksokE1/vFO95OTvQvMjdcrx4LcJsNiD/n++KbN?=
 =?us-ascii?Q?+oMN8C6b1t9BMckaFBY9r2TtjX1d0jdANvk9/BdOKEx9PT0p6Sb1S53TjyW8?=
 =?us-ascii?Q?iiOXFO/XB85gxUT7j5gelubxN0JO5lc+WHkBG7UlQrC/o1LmETwTgk95cdgU?=
 =?us-ascii?Q?Z2/duwyfSAiBDPdXdnYUOQE/ZPsDlfXQfvy2YgVPT08Idvsd41odFuSy794C?=
 =?us-ascii?Q?vF49q7tak4kd6Ib+N+f3PR9SkRT766gjFXUgEKY4gaSVkWzZipi5Fmw+PjEY?=
 =?us-ascii?Q?jVX+bQDPzOsJLt3l06PXWx7tr+XFtXP+U2kpPoN1/LHpuIv1u+a7/TtyGYA9?=
 =?us-ascii?Q?LOC0nzQkgGBJAreWPLhzIgjOCuHE2pmc9n3+Zy/aY2LmVHAjUYkVcYu7xmaS?=
 =?us-ascii?Q?jCsNPgtUSn/U/pQAqKxoEmf0GiCS0Bg80ht35Um/09J8aPfc8WzRhYzlfUjW?=
 =?us-ascii?Q?7Ma0cafERYbW9eBEJDDY11AJu2oG0g5FX94no5Jupea3SWzMkgEBzjViZNzt?=
 =?us-ascii?Q?tGbh5lpPmPq9qFhfyOjM00JYykSA/RTgrNbt8XSfZqvjTf2B1VOyHGX7qIKb?=
 =?us-ascii?Q?CfjC0tUCP4g60GJDDj2FagPSEmcUoLVZJn6h1KS7/g1TnqEYAgDzJF0zD2jb?=
 =?us-ascii?Q?YRa6vp6skSnN3hntASaGKIsKb7F+Wzqt?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hcKWU9sYOqakdBKiKvCUq9dhpFBsdDgh1okDJ0PfEG9Ak6TZNmeyCnyw30bi?=
 =?us-ascii?Q?bA0t21xERu9mxFnb9kV4jbCokE4I9fSndXpNDW4kghdanuM394R402DY704O?=
 =?us-ascii?Q?FJ/vx0z07mePPrp56E7iOr9YIbqIks0luMRWFbm/hKZqO564p6PCDCZdxTsZ?=
 =?us-ascii?Q?lzviUJ+RvsB7XKmYpvGR4RyYvZZLLxcTHA6WzphklhfkhYmoXFgZ7+hrFABq?=
 =?us-ascii?Q?R996+D+3yDTTUrGWfZ1zWtxSZA8RPBncnW987ZMGcVTsGYJFORlFFF5co5Aj?=
 =?us-ascii?Q?ZcdbFBzd/5Qxi7ZaWIF0uaieW2j0D0bxXbh1dTkjvmo6yVLjBPiIBRFpa6H4?=
 =?us-ascii?Q?ibB8OXnU7kuSOA72v0/uBc5fWhY/UgS8U9uFbhHc5HRmAIRFGX212DaufdnH?=
 =?us-ascii?Q?+/2MtyVY0Bl6cBo+l5YFRmtUhOUM21LMm/pYknWTBn2Q+jjQVCS60xl8AIe+?=
 =?us-ascii?Q?j3umrjGCEWpmaNzwoI42anwCV/BdcKuOA4s1xlwjValntkMwEAEASMCfiHRS?=
 =?us-ascii?Q?+RkdPvVBJG1g8T+rcrWoUKaCNV9IEJdDNPOGGS7zkfpq+yV5OzFxT8Q5Jo7F?=
 =?us-ascii?Q?YA9l8NertQMTvmFcXSY6tK6v6mnj14srlp7od4xhl9F+MD1X6JYXcv4yoDrx?=
 =?us-ascii?Q?nScWLX7fjLl2T3hFL+VaaTag6gNz8vOPKtwTnhakxmhLdz8DPQkZEd5UcAOZ?=
 =?us-ascii?Q?YJ42HvllAgaU5/5Ns702ncqQlsoi0R5DoDAaFbi0D8dgyGkBac8a/NNVeWKA?=
 =?us-ascii?Q?tGFhQiOZ2sK2nP5N7onPVC/IUVea5ZGFzEg0sitKokCXhPgV1SX+uZGQNVUX?=
 =?us-ascii?Q?hIHtjoy7TMO55k1X5Relpx1Hyf32v8ol0KcpA3XeJgQLy0tR9WH1yREQgHDi?=
 =?us-ascii?Q?/ycsgAZT9qpQwNXJCV+7t710FrhNNcP13zw39el5CtgpOzZJJ8jacErRKnil?=
 =?us-ascii?Q?4cKCAWWjEXWknMX6mImZU2zIriM2UQlYwsiHDsU7Yaqsfnw1WfT//LFKQnzK?=
 =?us-ascii?Q?QKeC2kjijqTw92yPzt5YfIuBBBFi22Af8eJvkNtEGJa6R8k357JR4r2YA1cZ?=
 =?us-ascii?Q?01nf/UuRr6abbDdVuZd3Vc8Z1KfWHVcyhBTzyM7kX9Tw1n+9NAked2YSRnVd?=
 =?us-ascii?Q?p+i+39hvqoZT0pChYEMts465cEM4tmKqwdaoaLlkYU68p8KlZf8ny7RD6G+u?=
 =?us-ascii?Q?l8vIVKcrxbsAm/z0yecb4QbafGcacLYYBd9r2y9vMii6ZiH7vs4Nqp/l4fOr?=
 =?us-ascii?Q?yCVjQ/M5yJ37k6YYBDW26FyQj9r6M4iDXdFNnDEE0jpUXmvHXO+qyq8Tu5eV?=
 =?us-ascii?Q?RoKV6wNX5TFADSSq510bqeOhPcHAj8OB9MMmZFDrHu1HFrRnyfuNExNFKzB3?=
 =?us-ascii?Q?rPkUC24xLVBfA6NMTRp7l3zwF1e8ivtcA7zm7QI7zmkoPnFxa27Gd6ahsxXC?=
 =?us-ascii?Q?12EMwswr++B3IZ84XHB6gXWlR3XC6mEkZMf4bXHZFGiWFD3tFH6W4gJKXZAU?=
 =?us-ascii?Q?WAWIYAOfXgscap9EtVJlJfUbFjmpt5wsfflkSdS4ypRRa0lLms0/DDPcg6o1?=
 =?us-ascii?Q?0h3Qkns6DVRh2/JNUYIn42SK/rg/Myw1uiuC5dh6lxWBi0Dh+QnDr4ik57Om?=
 =?us-ascii?Q?ug=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2515c3c5-16a2-4cfa-1a04-08dd4aacdee3
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:49.1981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbSx3ds974pbBTIYULn/gi/mYNNS6Mq3AVfw1GLmEj6XIPqOhInsIlpuLZVDqDRKB51bYMUcn2YNVHv0EjW19g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211134

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a vendor module for go to resolve dependencies from a go.sum file.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/lib/oe/vendor/go.py | 96 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 meta/lib/oe/vendor/go.py

diff --git a/meta/lib/oe/vendor/go.py b/meta/lib/oe/vendor/go.py
new file mode 100644
index 0000000000..a64d867e47
--- /dev/null
+++ b/meta/lib/oe/vendor/go.py
@@ -0,0 +1,96 @@
+# Copyright (C) 2024-2025 Weidmueller Interface GmbH & Co. KG
+# Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# SPDX-License-Identifier: MIT
+#
+import base64
+import os
+import re
+import urllib.parse
+import bb
+import oe.vendor
+from bb.fetch2 import URI
+from . import ResolveError
+
+VENDOR_TYPE =3D "go"
+
+def escape(path):
+    return re.sub(r'([A-Z])', lambda m: '!' + m.group(1).lower(), path)
+
+def determine_subdir(module_path):
+    module_path =3D escape(module_path)
+    return os.path.join(module_path, "@v")
+
+def determine_uri_path(path, module_path, version, extension):
+    subdir =3D determine_subdir(module_path)
+    version =3D escape(version)
+    path =3D path.rstrip("/")
+    return f"{path}/{subdir}/{version}{extension}"
+
+def determine_downloadfilename(module_path, version, extension):
+    subdir =3D determine_subdir(module_path)
+    filename =3D f"{subdir}/{version}{extension}"
+    return oe.vendor.determine_downloadfilename(VENDOR_TYPE, filename)
+
+def extend_uri(uri, module_path, version, subdir, extension, checksum_name=
=3DNone,
+               checksum_value=3DNone):
+    downloadfilename =3D determine_downloadfilename(module_path, version,
+                                                  extension)
+    uri.path =3D determine_uri_path(uri.path, module_path, version, extens=
ion)
+    params =3D uri.params
+    params["subdir"] =3D subdir
+    params["downloadfilename"] =3D downloadfilename
+    params['unpack'] =3D "0"
+    if checksum_name and checksum_value:
+        params[checksum_name] =3D checksum_value
+
+def determine_src_uri(proxy, module_path, version, subdir):
+    uri =3D URI(proxy)
+    extend_uri(uri, name, version, subdir, ".zip")
+    return str(uri)
+
+def parse_lock_file(lock_file, function):
+    try:
+        with open(lock_file, "r") as f:
+            for line in f:
+                data =3D line.strip().split()
+                if len(data) !=3D 3:
+                    raise ResolveError(f"Invalid line: {line}", lock_file)
+                function(data)
+    except Exception as e:
+        raise ResolveError(f"Invalid file: {str(e)}", lock_file)
+
+def resolve_src_uris(lock_file, proxy, base_subdir):
+    src_uris =3D []
+
+    def resolve_src_uri(data):
+        module_path, version, hash =3D data
+        if version.endswith("/go.mod"):
+            version =3D version[:-7]
+            extension =3D ".mod"
+        else:
+            extension =3D ".zip"
+        if hash.startswith("h1:"):
+            checksum_name =3D "goh1sum"
+            checksum_value =3D base64.b64decode(hash[3:]).hex()
+        else:
+            raise ResolveError(f"Invalid hash: {hash}", lock_file)
+
+        uri =3D URI(proxy)
+        params =3D uri.params
+        params["name"] =3D module_path
+        params["version"] =3D version
+        if extension =3D=3D ".zip":
+            params["vendor"] =3D VENDOR_TYPE
+        subdir =3D os.path.join(base_subdir, "cache/download",
+                              determine_subdir(module_path))
+        extend_uri(uri, module_path, version, subdir, extension, checksum_=
name,
+                   checksum_value)
+
+        src_uri =3D str(uri)
+        src_uri =3D urllib.parse.unquote(src_uri)
+        src_uris.append(src_uri)
+
+    parse_lock_file(lock_file, resolve_src_uri)
+
+    return src_uris
--=20
2.39.5


