Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168B3C36013
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 20:02:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web11.3390.1743192114318143811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 13:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=ErnFAH9y;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.61, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RS/j8n/klK5wUKdi2t+8u+xNBNjd1931lcYWSEKTu87SyfuZ0+bnuQiiWZFfvk79gwInUdSXjHcie66oJPS5GGMnGwdYqngtHUgqSlimT/kEe5nmzVmSF64VXYW7l91HBn2VHkXdWWe9tH5tU4xrl1uYCLXXczbNdIkq2moyttQwnb7MLHUgtQZqyu3Gymcop+iaagw2wIfgEbuuvSLFefNxQGyZiYWiP+OnSQFhQc6xouYKS5MLxoP3M1X+oNAHcz0pDjJGgxpA+0chs5yowCHEpBoqOxGTo3nrBiwGD8qQe97LcBw+0gOEFFb4bbpI6Vj0WUcl9X859zQcvOMbeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=i/o8bKuMeLqLOKSsNU4tBa+1kB3VRu5NInrfb0euqmek/91u3o9KpY3octAMYhWjQe9ylw4X6Vhmg5W3eAoy69UgXXhtiO8W116SAqWA+UUS3NAUdYzPnsI05F4YpVfJs854ev+NQedlvT4hxpGaIMBacB9iC91XAmyp0jZPpf5NpLI42Q6MJQO80q3JaXHs/HoqSt4g/MKzk4d4u9jJBf2kYh7uwi4NivRPHZ2GqS5znTnjNZmYaECl1Xsm0SqEtjjexCXNs8v6MupYiGa4Q2xekJePOocGVBm/wJqcEDSuioDccZpAHA8n/sI0uWb/YCqRkTtGYDyGMw3g/QJTsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=ErnFAH9ysLC/0Hv3OBY7/4kPihbPqQW0hylOBteRB9IQOfdU7z79kgFKTUEJnEKs9mqVlo13eU3GR4rwwak/orhbOooam/3adrtsaOzVJAl5cOGWNowqtIHVtAyQhf1xLFaIBuaSWJLXdGZvXEwFebXfrD43E6wv27c9d5gYNl/4CB9+gn9x9sdT0ept9zMDgnA/iNrngac115LufCp/JCL/PVI7OqdLs4f6PWLjhlG6PKzok8ptgRqqhCSJ32pjgVUiBs9qEwiht16R8Bw/XzlBpyTnDAqbtJJRPP5NCK+K+q0KsuM1w8kRBsk4/YRFo2wuXRGmfKs+6iPQnqdmtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU2PR04MB8741.eurprd04.prod.outlook.com (2603:10a6:10:2df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 20:01:54 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.048; Fri, 28 Mar 2025
 20:01:54 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v2 4/4] meson: Allow user to override setup command options
Date: Fri, 28 Mar 2025 15:01:25 -0500
Message-ID: <20250328200125.1051797-4-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328200125.1051797-1-tom.hochstein@oss.nxp.com>
References: <20250328200125.1051797-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::30) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU2PR04MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: fc132c25-9ce1-4591-5c9d-08dd6e33631f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7kwRZ2MP6XKz/Sg4ZzSgMQ+PuRpZTRKR+VhmSeMFsPOo15MQsqQJ/ZlIht1o?=
 =?us-ascii?Q?xOsPSGC6GZR/vio4mk06o4UpZGPcPmGNMWLoiyuT4rzKVADOuhw24Qkeesc4?=
 =?us-ascii?Q?h1BDm31e5Usnk7xAv9TUNVUMgpl5pdXWOGOc7VvKLosvB8zCmijiNzocmvoH?=
 =?us-ascii?Q?JjSgycFRKWiPG39opnlQ+zMi00HLboRCALp9/hDZA6eZFhrgvqF2EnDudArN?=
 =?us-ascii?Q?yDO6j0F6Skq1dkuQ2mH1CSflmXEKwO+r0unE2VPJe+usOMPkuLtsA6sB5dHn?=
 =?us-ascii?Q?o7qOz1hSgUpLqIG76bTv4WWEfOhuDCB/LxHyXr87dsSGkWEzw9wxuNGGIdYe?=
 =?us-ascii?Q?5tqjD8bfdmOwtwyS/Fx2CYF1gF3+Wg94rKGZYIvQSdJCh5/qCW1Bd5ATo2e/?=
 =?us-ascii?Q?RYItxOFNH8W79oJY8XyBrxNnX/Ol4h1QObQP1ok319IEaIBwjB5ae7+uiGiU?=
 =?us-ascii?Q?EYvfN1qgbN4BQOz0HiE+xR13Bt4ZnLgANT3YkkKzA78dYOoDJP7Mny7oITyB?=
 =?us-ascii?Q?iT0M20wwTWs69EcKN/J3WItPQcDLrb/SxpEZ7RCTZ7S/uvV9LxMETxcGADly?=
 =?us-ascii?Q?vOIDfsc4Tp65KUfBIV+jfqsUETsE8IcWPZBEd2t+plEgXCHE0TpqV319I40I?=
 =?us-ascii?Q?F49DBMYh6v19MSo2UjuBHMI1klwaa+/HlHo7GTyl8SI+zupNSIDZ60HJJoU5?=
 =?us-ascii?Q?OPyKh4a7zEgPG4cYPzO53lDeR5uVOhyAHbep7a+q2+9Xd9XX/f6viGcyE+9U?=
 =?us-ascii?Q?meD8QRw2i8Ef9xRaX9M6ORhdYwxmeluV4oExhMdDikAfIogeiBAjg9v+yO6N?=
 =?us-ascii?Q?CQ8QpNCjmLCEY5c06xmOc7ZzLRwNemk4sQDpRsS5F5Yz73I1qWcyhQLeFzhC?=
 =?us-ascii?Q?4e90Ql6S4NgHPfYN6BokG7Dkved7xzwC78gk3CMW3U1ZFWColRU/M/EL6vrT?=
 =?us-ascii?Q?A2s37dn8bwWIyPQ3cEdbO04c4Z5HGMeIYGFMvlccWi1EcyDRwNG0lbKPzLw8?=
 =?us-ascii?Q?dDDqw2gy5zDP5ZMB2Q/w/RvF90Krnaoo+OnnFBZRuZeJUeXF/+R73xBu4hTR?=
 =?us-ascii?Q?bNrT2RWBPIgQ9sYL22TjY93vyzxAyFExBE5lRibmqThdfylDa37iDQx/bVRk?=
 =?us-ascii?Q?bMXdP756RHiNSJ+Q99t8HuQouCJWxBnIeG6coqj7xKpuiTL98qPJmKT3CRQw?=
 =?us-ascii?Q?xFeC3JnhSPkZaIocrncKkoVypvJgN3V3XKZ165RRBjSgC6s/jmy/e+H3mxmB?=
 =?us-ascii?Q?zbX4T4O+0+mwDLM0DMhMvZfPITu2joJdnaAQeRPNpiEyD/8V/p/9P6kq5OYb?=
 =?us-ascii?Q?YyzOXv3zR6ZpQzJYxFJ7qlbmbJZnk34z58Gx1dErhq42jCpeL52KvBWC/tHQ?=
 =?us-ascii?Q?hqlwj0tW7jbp8+7d07jw+ktKVJ5Yt8xKcew3XoOPVyD0V8HAWsJ05FxfTwQi?=
 =?us-ascii?Q?tp5Wl8tT6QI6GM2N5stBHPb5oi/esmFGVYi+WYbaT0LTw+xvnWvOyw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BT7Ly1Ktaof3pt3J+DREpToqtjJHSOyfTHY1v2QzEJZNe2O9JUydQRfCV9ZF?=
 =?us-ascii?Q?wTBco2XZ+Lk64bo1/uP19rvaeffc/zPE32DHZvNRGkCtQDcHD5jt7FIxlUP1?=
 =?us-ascii?Q?e2hMz2w0chzmafEuz70/jRQptqPyDzgSyTw5g82HnOa11gQhMnH49SeC37Bv?=
 =?us-ascii?Q?UUbW92Wa3RZ8oQ+QKAk1Su9MRJSi6lGYTz0j9W+L3xPkc3ZIJacaKmpLP6Qb?=
 =?us-ascii?Q?3r591YOw9J3cEW+8MEdo1Q+FNVi7sQnTtgiTYq9ASAaag+JgdoKiih36/4ZM?=
 =?us-ascii?Q?7M/m8COc9xDqu7ELLhDRAYYaKMVrsolTk566pOnoG4xsujdFvPQbj49L5WLP?=
 =?us-ascii?Q?R7veNjZFSbhxVxADqa9BeVG/O+kBO4vzwGjAz2W+LGiiI8790b3BKUiTd8t0?=
 =?us-ascii?Q?b3rr+Chm/CDbdHveq6rGWG8UgtlK4CsQdAyZ3gBLwj9fisXrT5fkJTHNX+Ji?=
 =?us-ascii?Q?tXUP/Q69UyOS2kxUxKoBHdSKMw85yXiHJVhqVjKjwMsevnCjfzwFvcEZlxXX?=
 =?us-ascii?Q?tlO0ITaNU/w4AdyHqDYUq1JqNjAl3TeDhQWEkcLriNlOmCIEZ9h8TwQMFDoz?=
 =?us-ascii?Q?KWPkubn6xQtLetB3OKQMiyP/hVY3yaexdyviBoaSwj6m7O2bnIEyDhA0LWmN?=
 =?us-ascii?Q?V12+QeNrhP18XC0ABeTrVGjEPZi5i09jXwddAebXbxZYChr7AqOAUEE4j4iC?=
 =?us-ascii?Q?n3M9rXQBcbeLb5apO74TDxKBHkBYhuXffgRaN71/pLakhpdYmDgWnx9P+5pe?=
 =?us-ascii?Q?76Rd3Wb+JnKDSy/NQ95V26H2vfI5XNWaeQfZKN486BKeJEoc6ovVyJglj1Of?=
 =?us-ascii?Q?ApXhCdH6OlR7+vMaehlbwRWu8TRVplHUbxxFHu1jG810rEE1D8uvf5chtbab?=
 =?us-ascii?Q?l0EeTkMvrHYYogePI9KFyW6NVmmwREHi6+JPQB4ZQUmxHwUoCPYWaHRSAekW?=
 =?us-ascii?Q?cUTt6/BdeJz93giG2Xtjj+aXgLXO95daUyhc9OEi35wJs/PkPFjGMeTv2+xu?=
 =?us-ascii?Q?ZxCFNQZ3DohfFyhtgJt/tkq9bAenKZNcbY9DJHTsRCP6lQqHqtlrLbwwv1e7?=
 =?us-ascii?Q?f6h3AMQDcUfZ0EffRNrgqBPEBOlV+1emXdrBB8xvT7nkcv+J2jQTMaysDNTI?=
 =?us-ascii?Q?KEzo6x+3BtofFrEwz0uuJzf3YnBk4c2U1BlS8lVr0uLg3g3NvxqEyrvX/0S8?=
 =?us-ascii?Q?zOfAVHi60gFcXpiUWtgCFoLkAd3HBijFtjwRiYaVM8nTsRhqEGM8GS/JrJCB?=
 =?us-ascii?Q?giyRS7Sw7xfinps8bglQZB5+yW4CRsC3faLieZbhb5TBV00Eh9CJPtj/wQlW?=
 =?us-ascii?Q?clN5RieCxGnTaKTPqHUz1RueheL2/21c3K5J9B34wb7t4w+pBYb3JqfX7qPU?=
 =?us-ascii?Q?Ic2c7texdgAOvUZZ7T7Ax2GDB9csfeeVNHNF1NgV3vHnzfiZstSHrBFidD2l?=
 =?us-ascii?Q?sUHF9EECsZ2i6N7emphgLCfeo/QPb6OMiD+t4VivgZv/dJ2S13EfqlMo+CTK?=
 =?us-ascii?Q?Df15GVjAh9v6wsL9h5bFVXGjCJVFXliJgG274Ps9CIMW5SMJRrY9/LTE+Hka?=
 =?us-ascii?Q?G7vCrX1DaL2lL8Q5+ru5en4Sg+9aCIk5/nADTgVb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc132c25-9ce1-4591-5c9d-08dd6e33631f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 20:01:54.3485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLSFoS5y6G6/Spc4henyPuhHEqTMcPWJcV7mM9yQTuvaJKiA4n+OHW6pL7LRZaRX9d0gebUVNmvOW4wSzfko0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8741
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 20:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213869

The user cannot override the setup command options --cross-file and
--native-file because the meson-wrapper places these options on the
command line after the user options. This problem was noticed when
trying to build with an SDK using a custom cross-file.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/meson/meson/meson-wrapper | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes=
-devtools/meson/meson/meson-wrapper
index 7455985297..3aa1a93520 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -14,8 +14,14 @@ fi
 unset CC CXX CPP LD AR NM STRIP
=20
 case "$1" in
-setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewrite=
|compile|devenv|env2mfile|help) MESON_CMD=3D"$1" ;;
-*) echo meson-wrapper: Implicit setup command assumed; MESON_CMD=3Dsetup ;=
;
+setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewrite=
|compile|devenv|env2mfile|help)
+    MESON_CMD=3D"$1"
+    shift
+    ;;
+*)
+    MESON_CMD=3Dsetup
+    echo meson-wrapper: Implicit setup command assumed
+    ;;
 esac
=20
 if [ "$MESON_CMD" =3D "setup" ]; then
@@ -27,5 +33,6 @@ if [ "$MESON_CMD" =3D "setup" ]; then
 fi
=20
 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
-    "$@" \
-    $MESON_SETUP_OPTS
+    $MESON_CMD \
+    $MESON_SETUP_OPTS \
+    "$@"
--=20
2.34.1


