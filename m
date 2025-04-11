Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7665AC369B2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 17:28:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.1])
 by mx.groups.io with SMTP id smtpd.web10.32589.1744392526803705511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 10:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=qdYBEYvE;
 spf=pass (domain: oss.nxp.com, ip: 52.101.67.1, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpoWyN+YPprjSmPZjdnn4SpParH1O9Y+mmZ9/OPOD8k6QYKs9MvYHd5VUS71AdsxgJotWKe1pAgcFZ6ospHg+hVpvpZVFrFmx0NKusM21w3G3E1tE1lgsMVmYMQbasSejZblW0xfzjE1gQ+FsW7Wksjg2QHG2f1LrmZG2Dx5NjIq1Uj7/iJL+DbDVTamBev982PcDPwmfsWwsO5532iKoroBZYxCe2NYNli/qI9yfsMjx3KlzpMHyUTiw/mlaU7Eu4NFenlDJzKA8dw7AnHnx3ykp7zwc5wNWcfYkEj9hwwN4tqPXlZxfu65nidjfe5u7EqgopSEmlsx4rJ8mQqaog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=JduQVVKpw7waxYuGDI7LQcUctnHawH8pGnSTfzGqZTCci7L8AGsCckFf6af1/Tp21G7iYxQf+9tJu+OluEds/4MmyG8eI5x4kftm9d0oA9GFlI0/qXPXgKII2bvvMVPHuJktAI0OlrzVV6SRnWZtbswyxSRsKzW68AccOqoR+xP681whN+xEEoKStH5b29kiwsE3/PXfebj51TLw5OM4oPiZERl406Hj/Ptbbw8JGPH6ffzcSHTJBTiUQpKJt4D3ZDcx4BQEb7psaNaKJQG5KW7X7ytp12U6raeW6LKMNqSKq/ll1XDplLxksvNH1QU93XUyzpj14ZEPbAEs0DO0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=qdYBEYvEi7a0j2ugSt4Wg5sHeh/sMzCwIwSgRbZVCnsdX3HsH4/zG+5EOf8tz9OGvRIK6klcsZKjAKkTiBr7LeflG/vPe74KsVIxx10u68nQ7WFk1cNS+NGa6C+i/fkgE4hRa4gv9o41pMbmN5c5PKAFLa8BFElhhH3DWQHlhDKJsO7KpKPTkXAFzEy2x63oUdiDs6uoxh4spi9gfn3Y4pIbLAOs1F3Cy8sHw3/hQhSaPFWi9vMCzNpq4APdVZ7bfwp61PUgK5DhYkXy/U2Qo7ctej+ZXpXTXgTCJExnGvD1Mi6A5KximGuneGvHoSjtQoAExNmtIVy4Rt1KCtNckA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8100.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Fri, 11 Apr
 2025 17:28:42 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 17:28:42 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v6 1/6] meson: Allow user to override setup command options
Date: Fri, 11 Apr 2025 12:27:58 -0500
Message-ID: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040AF.namprd05.prod.outlook.com
 (2603:10b6:518:1::5a) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: a955fe99-30d5-4305-f06d-08dd791e4ddd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NGyL4H+WjGpMM/YF58Zsla7tl032xmlWVGG1bIU2CjDeY1SGRcLVCMAEk8YW?=
 =?us-ascii?Q?+qDjPf8/2ijKLUFJmnGyzdgZzjAt4U9wWae99HaJfu8YwS9PBjawg1YPJwSc?=
 =?us-ascii?Q?IalAFnWWk9x4CYCZ3Y0L3DamyuNiJhCC9wvqQu3Jg7eRg79VroMBKmMrvJdn?=
 =?us-ascii?Q?sDw5yQ+0mxmGvIN4pKAoC2cQ0B1TMr9bkA5Xps9QSPRuh5vE7v914I1JfMX1?=
 =?us-ascii?Q?Cy6z76Ai2CRqidTqrHcwaoMV34+/CRGzi0pOJlYw3Wd5QAaiqLzkSom/pr8F?=
 =?us-ascii?Q?Q5kYAhkEGUceVfpvUtV6SBQ68Mp+vJd9hZYGhR7bWYsF2RH6Y8sZl7SatK1K?=
 =?us-ascii?Q?B4uYnUmxuAhiZymljhlosHgQsr9GkOqP043n49pFp2i8gg0YAbngpTZEzOkt?=
 =?us-ascii?Q?wSTBQaHBcfvLJdzEnpVqj/s5MIM2xG2HAyxrE6Yu+9z2SoEAmX01hwlvrO1R?=
 =?us-ascii?Q?luGXLh/LWe6SWvN6AiXnIcm0kly8R8tMPNbCMp7uScK+xT9tGaKcn6Zn9pvD?=
 =?us-ascii?Q?3RWJv+VTym4yxCrJg7qPNP4BloxmnTTzrqPxid/hXD1g/x6oTgTQFTtm9se4?=
 =?us-ascii?Q?fclQirRGjrs6BsbnUykKGAtupTMEkIxkDYZPnErR5wdw1JV+VhFu4Z9IR/7x?=
 =?us-ascii?Q?k8o6k+CBjJAmBdK/bV6CQty4MLtXRftrc8t1uvW8VytFIYoH0dxd5+2DP+yA?=
 =?us-ascii?Q?m77nf7XVbbxlDUOn5LyQyLwZwMSNuVwsS+aHvotqXvNSyhu6RS/Qr2zSkMCd?=
 =?us-ascii?Q?QrpBiHWbQkKO/XIZMNYQfgI+KUqxxWo5ebnYNPxnBxY67rSeiF57TFJPLpHK?=
 =?us-ascii?Q?EzfKWNbKIhJYpTL5gedPgIRjOHB5x8sUNWRig3wFq393hzN3o1TcEQyZUXpJ?=
 =?us-ascii?Q?dSwJsExQm29g+g2wkbsPFlOUA+h+Oie2uWiD5nr9s70O3kAZdwIcjl80xsqC?=
 =?us-ascii?Q?DUUwv92WHTqOpZ6YOjcpelE2kVr9JO9SCSPILmRFwyRAT67c/w+rDV/X6lVf?=
 =?us-ascii?Q?0m0fab8XI7+NOYw/B+i8g+79PJKbEI9XbUmh/q+F7HKvj17a1voUtr70aMIe?=
 =?us-ascii?Q?5TsXODA9pR+hw9lQjieQT8Zl4PVchRm3wh/nKQgOXZ+s91J3Gu3X6vAyTuZR?=
 =?us-ascii?Q?ac/iEFMxY+y1AeISi03Kgpm+0Zg3kmgTXAsghfBKDkVZw9owNhoiAssSaw4q?=
 =?us-ascii?Q?Sm/OaVSTxZDawEWnG2b3Dvx//MgiA4qpw5i7Yik1P0Ysa4MPyyTRVkMukyit?=
 =?us-ascii?Q?kTBri4RjmRgBVfp4Hc5AaFOL4Z6wiBCpVuMpqH+IWoA+IhyRn7SWCdAr7g5b?=
 =?us-ascii?Q?cRK7Ot+XTAfe981D5XrHsW+7DsvEki3qZUlaX541qoerlCkBMylLSH3752Mo?=
 =?us-ascii?Q?NcMGqK5Of4TDTqWoWpP45WC3QK1qoTR81oKJA+sMDQDcFIRSqPnfxYZhftAJ?=
 =?us-ascii?Q?KPlCPAXX5ELLHFM+l085MswCSRxKnEwxUHy6FgSxzRz0vIEW2DeBrUy7hEAM?=
 =?us-ascii?Q?+hGS0TixSI166Zk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+m/+loMvB/CRSQEwgaBDe/Q1PWL7hOJtn0/ufKW9Yy7rjGiLyftUaikJXvKw?=
 =?us-ascii?Q?TjZnyyKu0JZ8zjFv/mRyMh+hSPwRUef5PWaEcLZZ5Kb/QaJcRHV3E1Sk2Bz1?=
 =?us-ascii?Q?OHYbz/MUSsTmn3MrEmBp4Bki9fWOOkqMXmFJr1WLb3ZTTRfMp4pezf8TDCil?=
 =?us-ascii?Q?2ye6uOjX+iEyi4A5yHin3FKMXL/LDpFPde5nU9Z+lp0sLdLti9bbZMruU3fj?=
 =?us-ascii?Q?PILsp1nb5zwBhypNePVXeD1xAHW9dP36dOQSXSs3CAvsFFZf55nmruHzNCuk?=
 =?us-ascii?Q?L+67jELXdjKIkKfSS0ill7gvNbnyUaQWRTGZ7ToxbS5Yf77nKNFGEIDHtsPY?=
 =?us-ascii?Q?HTwZuUHzGDeZhN15z8448BBzpDZ75StAc+nTEvt2N4NyXqXdt5vHDSoR7D7q?=
 =?us-ascii?Q?nkx0Uu3O//Noqg6dZlm+BwQoSxZCVEKWAoTTJJ7xfRdp690gwLuuf9vUJnTV?=
 =?us-ascii?Q?F6CzU1fnVR6Y/XRG0mb/Z/7NvLAXBJy8yM1GFAdB6vbz136W7Ew2twuU+LX6?=
 =?us-ascii?Q?QdVBEgybmnc1VjhQfA+YaG3DVAIrs0QuSNl5uHH7od5d5Kp5ziJvD9Vuc3ZT?=
 =?us-ascii?Q?tJFDTeHG1sU/W12JJ/pm62+/GY7fwFu/MC4dHH5N4kHtgd7iFvRBbJ5aMygI?=
 =?us-ascii?Q?VF9X0fXnzI3u+6Y5QxMDMbBVReFkHuQodSLKc+R0+D3Jjx4wkHvlXVqCuFT5?=
 =?us-ascii?Q?K9CZsYDYC6ki5rzFaN7NhLymziSVVTUD4Wbw969IC3bsi4yaHQPwgCuPB5f1?=
 =?us-ascii?Q?Y+5n89Ax7vLIGhvu7hW8Tt5xjbNTeHoXiJ/VnvqYHj4AXT27xwpSEsv5Jb9a?=
 =?us-ascii?Q?aQwnVrsDIQ2J2A1lVygJTYt/Jn6MKP2ngeWzOpVtM+z/gnsHxyBJFwNeJAxM?=
 =?us-ascii?Q?8t8dFoU/E2LjEgbjK0W2fIEPnkhAmUm6hB6XGa5a5ql/PVjuTVH/piefn6NU?=
 =?us-ascii?Q?3eqrwQltpt93JAr1pygb5wzWMHrU2PhQDbhB6NmNjngLWy0q4gKyQxvXNFMH?=
 =?us-ascii?Q?rl01pvM8q7UwgqixtmuAJrTBpw3VC6lIuwbfu/D8x4qpbowN85UWd4W5IBvB?=
 =?us-ascii?Q?ekk4yd6lDoxOo33pVIk3wX05xgVA5NcQ5w1roFAhMcnP8KnG+ocbdBMu5EYC?=
 =?us-ascii?Q?h+x0PaVch21MMnHjmKHLamLyHPNMSilvNStJoTtrAvBjBXXaADjVQh40LRkN?=
 =?us-ascii?Q?Xyrk/QdlsRemrkLheIv9JF9e0c2Kp1yTOdByjy2DcDvjq8xfo/98moMT0AWH?=
 =?us-ascii?Q?r0iYjlZXT0XfqPHJSAsa5P/fixJpNkqVaaIWuKUcI+G9dfNDVNfifr6te6TE?=
 =?us-ascii?Q?xeSkr6PWE9fTJGx5AhwM5U3ffSfkj07WdYHXjJLL1/OneLMUp+75y6kY2hEa?=
 =?us-ascii?Q?RWvoRMmvW6Yb3fQA4CTrs9UOWlW+fPT1hBFYPY873V7n2emaaqs1w1K0XTsN?=
 =?us-ascii?Q?5PWZBG6GgU4HFctyPKfw8CCsO/X4ytJovT4q1qlTCKcuPXYbsTz4KzFAIq7y?=
 =?us-ascii?Q?r74qfMozkeXc3638RYqMhvAJuatbN7DLcbXeLtVmVRW6pRR+CSrz+crgLxUy?=
 =?us-ascii?Q?3K4TZkHGJtXmLPcgxiq3ULnNB9jCe9xhyzYFmuSoE47sGHRj+rIXta4kd7TL?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a955fe99-30d5-4305-f06d-08dd791e4ddd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:28:42.2106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNdUUCM/z291kNkhFsvOwW79Iy1pVNpuZJtdEvxoe6uA7arwOMD/L9E5d30MdhBcWAPKupbbRibpshlSlFxE9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 17:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214747

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


