Return-Path: <fhoerni@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFF3C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 07:54:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.122])
 by mx.groups.io with SMTP id smtpd.web11.15837.1747727669701106329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 00:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=qy/KChgN;
 spf=pass (domain: witekio.com, ip: 40.107.20.122, mailfrom: fhoerni@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRGxxSugqsz17YSENjwdOVhD/v865oNsEAipcgVIW8uWiMxtmNS0mrMhU7sL0D0UgcbRP7EuC9UkqhCFUCHKKELeOQWIe96fIUnhcDsaNbv5xlTD5z7vmLbHx0xBtFHCppxkaw4zcmq9zqDrEbboGu2+jZROSXww7MclJIHO/EdSUWtTn8v6pEeBA4conNF+xOEHm03aMy8HZ2WDNgDqsAz+/x8g/hskjGtFC9O/+aMURfK8yq6UHbi72LUvIVZb4HQ2XWp7ZfoEeWruCrXUu3xUjDjHf1rsYyZEGq6DB2hjEfP4xURfcekSDpYQQXThw+/ZA+DOQh3mAg2qJTHGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGapB7pw7am4GpvSb9f/uM43h346uWoWarpKEEO/25o=;
 b=ApHyzA+EljPKuBwv3d2IPOGQAZx7RbsRuunbrSdZDeCmqWWAcKTvH4sDnbXr/eQKc++Q0EOyXnMzvO/3rH0eC+N6ZrSbg22MkmKRVlHRHaMknRysDoxURpM9fZJtTtj/WxHY7PvT0ZhwzVkNbNUxqRM5RwzcqpQbnYSVXyhF4pfxH1pBYvmatiDqGOZLwx436sgsEv70sFKFn2YtZkBOPB1TFoykfPB+DEnsHM79O0f1JRVgliDD1gNqRSTWMUFaneRUIR+Ub8CZZRvB3SzyPfDJtl/tYtu41IMTHeXZLdeIdvX9OR5t5Om0rLAHvDXjlLqTMYvRZvCj0xFPMg0zlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGapB7pw7am4GpvSb9f/uM43h346uWoWarpKEEO/25o=;
 b=qy/KChgNMxRBvspVf/3edBFSSNCYP6uGeAnWKYz6ggbVScHVcyw659ri9Q0mw8vm2I9WS6vj04kaSuFO041WVlYA08Uz18q0m9BMaUQZe721BWecRvIhXiO8WUb067+WlSdrxngQ4ph+0kgYG5p1pzUhC3/gPUq+bM/DdWdHgDDs9oDVXtWH03M3N3JQRhQ5KFT/Udl8NAoEmSgsQrDw/Qln5m8W2s3YyqxepoXH5dMsVHp/OmCZQBbzh9q6tYKihovowzWqnCwL+J/HmD+hCUZXMbWu92nLsYTv4nUpS5UaqjVI5v6OGj5efxk8gtS8N+oHmr21TpP9yTlFSSKKTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAWP192MB2225.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:359::22)
 by PR3P192MB0863.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 07:54:27 +0000
Received: from PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
 ([fe80::8a5a:c9f5:c976:7b14]) by PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
 ([fe80::8a5a:c9f5:c976:7b14%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 07:54:27 +0000
From: fhoerni.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Frederic Hoerni <fhoerni@witekio.com>
Subject: [PATCH 1/2] meta/lib/oe: add searchfile.py
Date: Tue, 20 May 2025 09:53:24 +0200
Message-ID: <20250520075325.64756-2-fhoerni.opensource@witekio.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250520075325.64756-1-fhoerni.opensource@witekio.com>
References: <20250520075325.64756-1-fhoerni.opensource@witekio.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR3P251CA0019.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::33) To PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:359::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP192MB2225:EE_|PR3P192MB0863:EE_
X-MS-Office365-Filtering-Correlation-Id: 424d8fc7-0457-4200-7f4c-08dd97738b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1eC+UO7BbihEyjDA1jVpXMu2HJTkc+Sq8eqygYiLQ2kyvhC/Gq915DQd2qg5?=
 =?us-ascii?Q?2u58ex8gefxubdCU6RNEPI9ResDfC0Wj/1IuMD4SapgLJxRSQ9f75IhFzSFu?=
 =?us-ascii?Q?UpXuGKQIbWn9jrwjrPLKmk40ebuiCGWjOoLlc7iw/UfCWtOwd+afQ1dLHLcd?=
 =?us-ascii?Q?+IXmqfrbZfDUrIm4BrGeuvs6cWpPhCnPTQXtDj5zD1ZYgphKQzmQuoaVIybd?=
 =?us-ascii?Q?IeQgRc34CqwHouZI/egfkKcm+xibGJDNMX5cCy0p9B0vL24YgJztYwLMIm/s?=
 =?us-ascii?Q?9fvSPmMa04lgA4tXfst5vI/BrAD+GozGqw2COYtNVEuydqCz+QXsZeLM9N7v?=
 =?us-ascii?Q?Ig4je8PVA3owLc+fbiNtrp0nPc97HzmF5tGTVlii3KW37IwxxevtQWaur6R5?=
 =?us-ascii?Q?V3q/y3f+of+CU1cY++pUMMgMyPp3O//q65lOpXDz904YmXtPBY4njLMJ8b3g?=
 =?us-ascii?Q?k6VjCQEDkLHOP2soJ6bZfmqTKpoGrKiS9F142VbdFlRjTqnrf9bUKv/mWYu6?=
 =?us-ascii?Q?vSDtxdLV1gFtdgFdD70DGxe9V+Mnmx1Faxa50eHDXnd/cFhiCdk02XpoaTpc?=
 =?us-ascii?Q?1okgMe2iFZw//JnuDu7IDt/L3Avy+cYz2j3lvCs9e7QYL0+qi/oIxozLKJYi?=
 =?us-ascii?Q?XbGIeg5BnPicFZczxnEFSELtiODUWyUc2BEqnsMF2sh1pd9PfHZIg+nJMno5?=
 =?us-ascii?Q?8F+qvbmIDwte/1MQflkSwo+9Q6uB7pD00tTglMwzZ5IrMR1UCWYF6tgV1Jf7?=
 =?us-ascii?Q?SIezalb3Fz4rpdaoB8Jlm3GKSXrmcldwSoRFsZGNzvEPKl7Wp8x/BrllAOUk?=
 =?us-ascii?Q?W/Oyl3nsqmpiq3gMTalpkaYNum7+EHgEBe+srN5wXezoFNuX9rBOpw6Q9Yxh?=
 =?us-ascii?Q?K6G+RqhFTZ8Yg/YU/tfDcnL4ZadN0GYdmnfspIOXBN/Z5Yla26+iWuUvy1DW?=
 =?us-ascii?Q?1NPeDVW3LmOzpQPjz01JJASAeQYs2NbAUyV9e60I9nANEVTVfULD3ry6LBSB?=
 =?us-ascii?Q?V5kE6KyaxTbxUrJR4tTzazuMBkTNl7ZDyYqYYyckp13JjTjzxxPYRgBSFieY?=
 =?us-ascii?Q?AR8fFQhZf0ES4/3hUEWXz/55TtcE0pA3rVD/0aQEGoPFhnmMXbolOICmiIOP?=
 =?us-ascii?Q?gL25KYp4o/7/0M4gMnIglvTAGgaxIcCo1f53HZQr7ZdAPwE/t/wJB2bJTqnO?=
 =?us-ascii?Q?aYNPhSpssHem7hP0Dc8QF+Asv9X94/hs1cn0dVTLqdk7XmcxATqpNQmLZQSE?=
 =?us-ascii?Q?+ZKBs0OsMz3d44ir0PYwzOywDE+X/g7NePO0xqab6oqcmPsliY5i3AftWk0/?=
 =?us-ascii?Q?49g8ZUdCKOubOnAVw6iiRLcPCHLd8vTYjFqINEWRL7ieXy6wdIuxyHeoVY/J?=
 =?us-ascii?Q?lOMRGfAYOl9BX1SrmsiNVP58QolQ5HixdMMiQqGDA6tHgob6Z+LnK/QNJTnU?=
 =?us-ascii?Q?y9GrU9rkNqo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP192MB2225.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/+vLwuXIDo5Ax4JITxbaaIrpLqFZYo6XrUrSEvMhyh4xMBqHcj6sn2RnRQQw?=
 =?us-ascii?Q?3TG9L+XgjOs51ClWZqlHUVfqYS80FNCVDjB13L21BqkQ13XRLI2Y0InHEbm0?=
 =?us-ascii?Q?J0TAc+6Uz+1mX538WiyKyZzZ4hcIC7eVHMAk0HvWmfY1TUOVMj0l0UTD0KWs?=
 =?us-ascii?Q?+bLJBKPry63Ou0kdCMNsoE4Snx4MmjU7T7kLFyLzyZ4d3aHfvzlB1DZHEcdF?=
 =?us-ascii?Q?rsiovhkQAh76MMkDyMvsDaYpHnnrrJXkgZuIZozzu0SN63cf2Z0A3lcYlKyU?=
 =?us-ascii?Q?zxmZHkXZ1Tw0lkmK1CRNgdwW3NwWSEfz+MAbDkcNJu+erjqmWEOUshwz/4VG?=
 =?us-ascii?Q?iFWkaNtH3/XARPXoQB/r3EL87aX5YKt4GeuUs6/GvSoG+HGqtCMJWaHWWy5O?=
 =?us-ascii?Q?F2CLsCXkM+OTy+7S848+iA+Qj54vcbmHs4tjnvpnJfkoFshqOwURAS24qhwN?=
 =?us-ascii?Q?/sUAM5Rh6dQ9l9EdpMUCcq8kxIUH7+PNiDuZ694Pb1C/cmlcPatxCKy3A51A?=
 =?us-ascii?Q?BejDKELzqJQLMQSQKFou5PeXHEDI4oaeUHc0fj8Pzz8HRrmsZGVV/nazjkMw?=
 =?us-ascii?Q?V9EpJybVr89uXmyJi3yYpIA9s4Q88LrsTp7GYwn9gt3tbLKxvUD+UW5aDzri?=
 =?us-ascii?Q?K/Cj+nIbLOshCT1R32fZQrHVyLRMg33HuOEzOSWwCXa7+AFJATxX8vn1OkAP?=
 =?us-ascii?Q?5zsDn4Dm8rEecb2xkN53jE5flw3tyO+wBJa/4OUmHBoD+Rmonp7K4PdmmtHk?=
 =?us-ascii?Q?JqqVT7U1gR77UjTlV8u8nQDTtVMdKGHizsTwrT673T2/tHV3Oe/FzwQzrTI6?=
 =?us-ascii?Q?NikHSrNeHeoUQdpL7mfzPlE+W5NRWeKMz0ac4OE7mJIMB1hJJ/HsWNeiFH94?=
 =?us-ascii?Q?3dIg7+H2Ch16A1ya+4Uf//yvrFM6f+DIIFv6oYdi82e70YPS6DYX/5aHHWvJ?=
 =?us-ascii?Q?/nFXv7aNIwrVIwA/hoUpwJxQ2FS07qmyWSfmFwvFAEkydaVc/knrIU3uT3Xe?=
 =?us-ascii?Q?ZdHpMBRFVTDLlryXpWVBjj5XiLl15GHHX368v3xyT6Xj7njIu3ftfIoyWgCs?=
 =?us-ascii?Q?3v/F69V1auh/u4LrRkOUqtKBRZqb8JIXHLVSH+PG/LtBjmgAh2qg2CAZ2owY?=
 =?us-ascii?Q?Z3zu40zrykFL5DgOL/j7IFHtJDrJgI1mdpAbAfKcZuTGHgrv66KtYK7WbGHw?=
 =?us-ascii?Q?9nmoYvlno8dfqHqBayZqe77VQO+skguAN5S55qy8V7mFkVt52VvpieNOmvYd?=
 =?us-ascii?Q?99mp9BTW3HqYEKRLYOJ3Ju9HKB8S0NOO711TkM6B/daYmZJj2O/mNNGzywGz?=
 =?us-ascii?Q?Hk1G2VqYYCX7o4XBwnKu3jbVmdYyVSzVjt2GTe70Bkstq6hWD5JWokrzwZAY?=
 =?us-ascii?Q?dOBx7OvAoxqPxEloLsBYgtibW56fyxaxIPkjmYgc32uv3cuixNJZGcxsE0XX?=
 =?us-ascii?Q?dHednUKuBzz8iWjG/fdOk9nPU0+WI2kK0jNT4XQTMCKfEcpAd9Rq9reGVlTG?=
 =?us-ascii?Q?jEMVBaF0d8qi5K5t5gRjmBvkNPpwquNW7K3U8AhaIw5Yd7xTJWxx97k4AkA2?=
 =?us-ascii?Q?aFR7SNLRM3Bnz+tl5/RGOo4OCSvZg16JhRQQzo+SKx6WBbpbQ3+dBxiB5jV0?=
 =?us-ascii?Q?vsNGkgE53BLMzkKyHWkftv+RqD94NStAU//182MEFxkt?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 424d8fc7-0457-4200-7f4c-08dd97738b3a
X-MS-Exchange-CrossTenant-AuthSource: PAWP192MB2225.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 07:54:27.0746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1+kyAgPMWMgv8ETJypZ5y0Q2CT6ivpVqEbvdKA5kKVm4YK5oaQ1J+vf3WYDsHwF+zNThgeiV8fsUksXY8TQNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0863
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 07:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216888

From: Frederic Hoerni <fhoerni@witekio.com>

Signed-off-by: Frederic Hoerni <fhoerni@witekio.com>
---
 meta/lib/oe/searchfile.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/lib/oe/searchfile.py

diff --git a/meta/lib/oe/searchfile.py b/meta/lib/oe/searchfile.py
new file mode 100644
index 0000000000..a7a222dedb
--- /dev/null
+++ b/meta/lib/oe/searchfile.py
@@ -0,0 +1,37 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import bb.utils
+import os
+
+
+def search_file(path, files, d):
+    """
+    Locate one of ``files`` in the list of paths ``path``.
+
+    Arguments:
+
+    -  ``path`` : list of colon-separated paths (like ``$PATH``).
+    -  ``files``: list of file names to search (may be absolute paths).
+    - ``d``     : Bitbake's data store.
+
+    Returns the first file found, otherwise an empty string.
+
+    This function also adds dependencies of the bitbake parse cache on all
+    eligible paths so that the cache becomes invalid when one of these pat=
hs
+    gets created (ie: the user adds a new overriding file).
+    """
+    for f in files:
+        if os.path.isabs(f):
+            bb.parse.mark_dependency(d, f)
+            if os.path.exists(f):
+                return f
+        else:
+            searched, attempts =3D bb.utils.which(path, f, history=3DTrue)
+            for af in attempts:
+                bb.parse.mark_dependency(d, af)
+            if searched:
+                return searched
--=20
2.34.1


