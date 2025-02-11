Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D89C021AA
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.76])
 by mx.groups.io with SMTP id smtpd.web11.1128.1739286052946746079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=F1vt8QyD;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.76, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVJsfj1PIpkUAlsOR0w2ylDC7G20jkQTQ1NguX3IJie8wGN0REVclamV7N2RgAGV6jympyAj3P2X5jcQdsC9MOUed3CQoQNQ0rhEn3C1UJ6d4M8jm86nlnH+ne/usCPudBqkibZX/Scrn+PVO7ke5NvCR3oxo+paTs1bU3fWvkVPPg6bpMQ4uT3hhH4y/yut4hirSwe9x1iz0YTrjp8E5ADX4mLYE4i3hiDpzH9pWLqTNYkecGOEu6yDthFmVb0ll0n5DIudPd63gZvmdDlBmf9gaLGz8O61Aq33oImCk5boGpOYnguTc4OpLpiyJan8kbF5k1dsZ1fjTfD55dUJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxoSYnPx9KB8dZPCT8lLGGfADzGCDjolU+ZWJRwbVJk=;
 b=QwzcYe4IOZdL4qRYw1pGmaF2gnRGXEtqtzX8LfKFdMtgJWjM3fti0gLuqXkIvxgydyvBsZc9msyIYIoAC0RwVoVMKHPUQbwAlNEdWC80UDAD9oFRLotfhds1MEQrgZfyDIjm3N7Fohefsx9kFFO9AlUCh/+bKweyX+h7H7GcMtKqZqc/DdameUBpotu0lkLq95JRcPEZD8+J9ov9FHtDIiJbzlEc45O8OCIk//n2q1u3eV5qBgm/Eevi7mkPHFsa+t0pXgW5L4zWyFJHQm2nNcSbVf09qfnZF/P0eiS4n9Yx/Nwjd/mVZCU9KqWFRyLTNZiaubNQ2fxesui+fMgZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxoSYnPx9KB8dZPCT8lLGGfADzGCDjolU+ZWJRwbVJk=;
 b=F1vt8QyDbwxMk+jAACWdEkJ4jwR5q8feH8ItfuZ1fXOkzkG2PacdqQNQ0WHXTkVpV2f4eVi/eNwCiHi6wsuTHu/izi6/gPT0fhcfqrx7P/oXKUbIQIKG9TMdn75n+sHoHU16gyCio0coEWWzDLp526IEoFUXtnw0XBCzt3E8MAUbLvYk6m9j7ooF1HMiEJc5IPWp94sb0ITxJWGmhshqu1zgRZwMPVHQxafbSboGLENVqeCawktgNW7VinfznHdfRafPRS7ZHrJy6a8WAdHouucZHJzVEsd/r2Dri/2P+vinnXGf0jT/oHDP1O9C02q5mgAukN4Gn3MOWnn7AGA09w==
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
Subject: [RFC PATCH 06/30] lib: oe: vendor: add cargo support
Date: Tue, 11 Feb 2025 16:00:10 +0100
Message-ID: <20250211150034.18696-7-stefan.herbrechtsmeier-oss@weidmueller.com>
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
X-MS-Office365-Filtering-Correlation-Id: a3473e45-c145-4ccd-d4b2-08dd4aacdea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a1N+0LRPK2XYzW2qkofbzLxvnBP8LgycfU6yRkxWSxLwutpeEyBztmlgaaLX?=
 =?us-ascii?Q?S4P6Ur3QkOtxAbNLm6lYtWyDjXPC+ZgER/a6506z7nKRnqy9l+O13jIGHgyU?=
 =?us-ascii?Q?qJeZ5avLAFHa70p5aiyEHhX+ZxViEqSJMeVkz8Rkopku+fsZpQmA91RavyXP?=
 =?us-ascii?Q?2aEzA/y3JUJAH9s7fNerk+En0nbGMZECgUT1MW+MZb4LRz1HmNygH5H/GvNm?=
 =?us-ascii?Q?prtl7ngcg5FwIH1YIxxD4do4934Wrf0oJwNDwDeYX8M8skyzlZROdgeQudzv?=
 =?us-ascii?Q?fK7nwW3bb3nXCqn4rUljLuJmFxKxqxjFX2OBF2ugggwAHvzBVw9QGf8d1hUa?=
 =?us-ascii?Q?6YxmSeenSuLh5TtmYE2eosK7rTCRJ+yQEgaKm9Djik86++ltoXmA867k2o44?=
 =?us-ascii?Q?H4659Vu+RYpwRYXtufJSDMBjr0p2uuFGigtmPiSHlk0DepHjf+SSS51Gxkrw?=
 =?us-ascii?Q?yoa6ZX7ShN7Ys1wdGwCUuKdytsA7R/+it9PZREHfGCaWra8bb/d6QDfpM4cr?=
 =?us-ascii?Q?6wExvL0MzX3Z6ul/WTG6HAjsgTembletqwu0JMruK1963G+sH/qSkEfAOD4A?=
 =?us-ascii?Q?Erozq7EPp25X5ojS9VYC4eLI4MLBjf7xSW1trMK42QuRYQqfBAYGgw3DYSl8?=
 =?us-ascii?Q?FjP3FduZn8/u69cgxL9f2zAr5MgNJMpcPpDVMx4mvd+vl3hHnmSK2blexzEi?=
 =?us-ascii?Q?gj9TIcuud8Q2h+bJc3v6OtqoReJrWHwoMR9FYdzdapLfrYOziAOFtFoegZOD?=
 =?us-ascii?Q?71r6uxTxP8tqn3YwiGsYMDL1kZ5l5nKScET9CVTi/XY0WeIQaqTYZ3me0+gc?=
 =?us-ascii?Q?HK4NdorjbXk6wqE4/yTvEHk+1AAn93/QQo+0RkqH4gAlwXdmi7pfvE3sXFKb?=
 =?us-ascii?Q?N4CQdYvPyrKbF0CenVtd1i+neqmhhYDZB4IdKdnLhxpxTWHI06elYEYMRb8a?=
 =?us-ascii?Q?9FSaSsft3EN8+1vIf5AYHBF8VLObH8qtoFXPeoPqwSOJ7itqNlh3L7EMyztj?=
 =?us-ascii?Q?MAxP45ZFbDy2ixCbcEaRp0gFFW+NMGb+PoclsdNSyYlxM55RUQOQPVwirlEE?=
 =?us-ascii?Q?+R7OhxNJqd9gpQcjVFHmMThnO4Gd0xgc2Mkni0OXCAbSZOklo2qVYpB4+8Ck?=
 =?us-ascii?Q?a0oympM8EE/3DXuD7z0OfHghZ1Z0vJlYLGWXoxC/gg1gw/mx2m9pBZn7fNhA?=
 =?us-ascii?Q?4INIDFwL+RdTAzHOyAxhMvvbigPYxMbTo9HWrPeRu3ZZ4OpZ3GzBfDDpyTqt?=
 =?us-ascii?Q?YosFEUR0J+uOai1pHHcIvKKQpfZ7UY8jjv1tKI62FchHE3hLKADVo47KK9fB?=
 =?us-ascii?Q?7ggLQ5xE3N/C9HJh+jUUbHatXqlAyYBJ4ldNHYfL0JpwoUUI4ulZFwQjP1/u?=
 =?us-ascii?Q?6pE2UxYe6VpvPnR7HwzimY+Y19Ge+uVs4xQXPDM/apXp8jYCaw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XkhYjuMIIN+vou/TOTMDY1UMyjn8NgzMy+pLs1tMtfuwixWo0ebbKtJN1pL6?=
 =?us-ascii?Q?4FA/D0tC3bqvS1MzDP/zhMlekkctn7rRjRhQ5b7ZKHn+i66LbZdC4bT1PZvo?=
 =?us-ascii?Q?1BEsBpNSPY1ciRf5hmqPDoAB6AlCgfWdJGVcQskZlff/8jU7pkciUu/xuBC6?=
 =?us-ascii?Q?rPhSF9pUdWyX2XN2jydf0akUHCXdg6ru+DNUr2Ir/E8xtWJmZaPoraHKjIE8?=
 =?us-ascii?Q?mwejfSLMHMiwfSDE9jSdiPikJ9Ye4Jy03SCoxmkq2hu2PGs0o0Ej6y4jmPjf?=
 =?us-ascii?Q?Cy7MIvwpNvzBwheveoorYiDbJFDICGkjBk5wJlx7oE785udotNhhcv8Ujul9?=
 =?us-ascii?Q?er+Z40Zy0b7w+ukIqKJETICYAyVQkPSOxJm4haYANQKaRBeRTDuerL+Q0pkW?=
 =?us-ascii?Q?e3WROwaLexmcC4cjnv5H3GOcJXV1hARgN/K3IRRhPDwS1OPhgn5cj9NHRcX5?=
 =?us-ascii?Q?pXt2Ybbx9gzTCbBoRHMCOZDCRd8JIVp+htqjY/S+jBqWfE0rNDkKB8UmNzby?=
 =?us-ascii?Q?jUfP04qIwQhy1WqAnqi5FBMHmcKGCmcOq+zcAukD/aLp2r55A1k/FDHbUVbf?=
 =?us-ascii?Q?mjfLcd81nQSZ+ICYyMX9Rz4ODsyf1IPPaSy2dBBIuNtsuTVDxwIXBX2Y7hBF?=
 =?us-ascii?Q?CiN3+v85L9UQ/L3AX+YD/oRfNL+1vwN6skaG3C53GiTySoW++SYBoJ/Nc5JM?=
 =?us-ascii?Q?J/5xRa8bwSdtGv5uSGKF3m/gRZCyM0aiHsytOT97Og5HBZ5H0CQRO38h5fAX?=
 =?us-ascii?Q?XQszUSVTLHmmThwqZMO4tVAu8E4dC1oQhHSlBM+UnTFUamz1PqmJRxlE9ubB?=
 =?us-ascii?Q?XSjjYKTG+HY8WnhLqxlMlDjRbNLVdEialn5eu/tbU4hFPh7LaZzebwoWCTSX?=
 =?us-ascii?Q?3mTtr1i3wg2vkjS7oxiBhteagpvBuYdjPpS213xORLLzDQMUg2C7yxfmCzED?=
 =?us-ascii?Q?EJgqjPjroniwed5JNnB6Asl5iDkx8yDsmCgINBRGw1QbYEk/oNJIRqc+L5S8?=
 =?us-ascii?Q?rAFDnsIpZWmRIZfQgO6g+V56jWSXoN9IEB30LttNlgxibtNMc0njXuKvm4QB?=
 =?us-ascii?Q?vEgaJH9DaJW5ohP1rroq/SgiY5M2umGw7fi2xhZRkUJRDtYimImLZ0LgbB5Y?=
 =?us-ascii?Q?PPpcTHYwtQnNdreBXdu4X85ODo4BCERywL/ddfzAdKYe57OQPjKLJzvzDkgr?=
 =?us-ascii?Q?FrM9r18ITtK5sRHHF5cQMQl3ue50Zp4IBnDVb77c+7YOacm18yutZlw7IrLX?=
 =?us-ascii?Q?xeYi+MibWV4GyIzjpxdhwKWHvpUPl2sXVNalwlINtFo50cEjWeVggYpyEh8Z?=
 =?us-ascii?Q?ND1PuFy2zFLxMHagqWj0dxEOBE6ZEsqpaZbc5wqke+b56YMcVm48hqoDtda4?=
 =?us-ascii?Q?yAfWYnD21T+SBm42JPSOn29TelNcXJn9eUP8WggvkTAwhB9MnxRoBqgVYxUy?=
 =?us-ascii?Q?bla8Se23ggP1zMMsg2CjMDjguHRVWEMySkqX9A7/EYKRlxjGrn/icJ7OaBGx?=
 =?us-ascii?Q?NW/qX3sTmMD/Q5ePkmOOzYcSD4MPuvrnTcwtNFf3PHahhm5kfUf7F2vclf++?=
 =?us-ascii?Q?/RKE5VgdneweHREowGU7v1DSTc0nPxg8pX0RlWkU3mKGqAbxKRH+IazxaVZO?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3473e45-c145-4ccd-d4b2-08dd4aacdea3
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:48.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19mB3bdn4H8uCz8Ld5loTxSXYoI7otnH42F+M9W4in71n7PSUzMDLQOzCzipVwrP2apNrDl7kuKhggLrgcxZRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211132

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a vendor module for cargo to resolve dependencies and populate
vendor directories from a Cargo.lock file.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/lib/oe/vendor/cargo.py | 121 ++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 meta/lib/oe/vendor/cargo.py

diff --git a/meta/lib/oe/vendor/cargo.py b/meta/lib/oe/vendor/cargo.py
new file mode 100644
index 0000000000..4d0a0034f3
--- /dev/null
+++ b/meta/lib/oe/vendor/cargo.py
@@ -0,0 +1,121 @@
+# Copyright (C) 2024-2025 Weidmueller Interface GmbH & Co. KG
+# Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# SPDX-License-Identifier: MIT
+#
+import json
+import os
+import tomllib
+import bb
+import oe.vendor
+from bb.fetch2 import URI
+from . import ResolveError
+
+VENDOR_TYPE =3D "cargo"
+
+VENDOR_DIR =3D "vendor/cargo"
+
+def escape(path):
+    return re.sub(r'([A-Z])', lambda m: '!' + m.group(1).lower(), path)
+
+def determine_subdir(name, version):
+    return f"{name}-{version}"
+
+def determine_uri_path(path, name, version):
+    path =3D path.rstrip("/")
+    return f"{path}/api/v1/crates/{name}/{version}/download"
+
+def determine_downloadfilename(name, version):
+    filename =3D f"{name}-{version}.crate"
+    return oe.vendor.determine_downloadfilename(VENDOR_TYPE, filename)
+
+def extend_uri(uri, name, version, subdir, checksum_name=3DNone,
+               checksum_value=3DNone):
+    uri.path =3D determine_uri_path(uri.path, name, version)
+    params =3D uri.params
+    params["subdir"] =3D subdir
+    params["downloadfilename"] =3D determine_downloadfilename(name, versio=
n)
+    if checksum_name and checksum_value:
+        params[checksum_name] =3D checksum_value
+
+def determine_src_uri(registry, name, version, subdir):
+    uri =3D URI(registry)
+    extend_uri(uri, name, version, subdir)
+    return str(uri)
+
+def parse_lock_file(lock_file, function):
+    try:
+        with open(lock_file, "rb") as f:
+            crates =3D tomllib.load(f)
+    except Exception as e:
+        raise ResolveError(f"Invalid file: {str(e)}", lock_file)
+
+    for data in crates.get("package", []):
+        if "source" not in data:
+            continue
+
+        function(data)
+
+def resolve_src_uris(lock_file, registry, base_subdir, vendor_subdir):
+    src_uris =3D []
+
+    def resolve_src_uri(data):
+        name =3D  data.get('name')
+        version =3D data.get('version')
+        source =3D data.get("source")
+
+        if source.startswith("registry"):
+            checksum_name =3D "sha256sum"
+            checksum_value =3D data.get('checksum')
+            uri =3D URI(source[9:])
+            if (source[9:] =3D=3D "https://github.com/rust-lang/crates.io-=
index"):
+                uri =3D URI(registry)
+                params =3D uri.params
+                params["name"] =3D name
+                params["version"] =3D version
+                params["type"] =3D VENDOR_TYPE
+                subdir =3D os.path.join(base_subdir, vendor_subdir)
+                extend_uri(uri, name, version, subdir, checksum_name,
+                           checksum_value)
+            else:
+                raise ResolveError(f"Unsupported cargo registry: {source}"=
,
+                                   lock_file)
+
+        elif source.startswith("git"):
+            repository, _, revision =3D source.partition("#")
+            uri =3D URI(repository)
+            params =3D uri.params
+            scheme, _, protocol =3D uri.scheme.partition("+")
+            if protocol:
+                params["protocol"] =3D protocol
+                uri.scheme =3D scheme
+            params["nobranch"] =3D "1"
+            subdir =3D determine_subdir(name, version)
+            params["subdir"] =3D os.path.join(base_subdir, vendor_subdir, =
subdir)
+            params["rev"] =3D revision
+        else:
+            raise ResolveError(f"Unsupported dependency: {name}", lock_fil=
e)
+
+        src_uris.append(str(uri))
+
+    parse_lock_file(lock_file, resolve_src_uri)
+
+    return src_uris
+
+def populate_vendor(lock_file, rootdir):
+    def populate_checksum(data):
+        name =3D  data.get('name')
+        version =3D data.get('version')
+        source =3D data.get("source")
+        chechsum =3D data.get('checksum')
+
+        if source.startswith("registry"):
+            subdir =3D determine_subdir(name, version)
+            filepath =3D os.path.join(rootdir, subdir, ".cargo-checksum.js=
on")
+            with open(filepath, "w") as f:
+                json.dump({
+                    "files": {},
+                    "package": chechsum
+                }, f)
+
+    parse_lock_file(lock_file, populate_checksum)
--=20
2.39.5


