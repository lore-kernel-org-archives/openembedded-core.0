Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0142C7EE2D
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 18:45:17 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.56])
 by mx.groups.io with SMTP id smtpd.web10.315.1677869113498314114
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 10:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=chRAA/FU;
 spf=pass (domain: nxp.com, ip: 40.107.6.56, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fn81MSJWgTexCRmfCkJjDh1GwyRxen7K3STuFTVxli/J8gOJqJDK1knNk81O4+y4JsXo51w+W8ay81GG97ENvFd5ZElp8zRerWBBPxcUdFGeEHsFxJG1f0MKTnlyqKGIvWlKGX7izYYTjPme/uCbM/GaQ04eVM/vZiGqkrk9Y76607NBKzxsSqFQ7n8grsydc4KDKaCmyT8Cll1dl79Yd0cffvMfpXzyjAYdtvu2fFOW1z/a15EKhEygwnrBr2GC1pAE61bRO4LcubBDsZYtp+89nf/0QA8L4ejOjupXIxcwYqWyczohq1aIyNkUsTaXo/1ObdacO/2QHNNjdNdbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0AjcyKI/RnS7nAICJB/+0M4QrOmZ+U1V4rSj6HCMFE=;
 b=WrFh4eYeVk51HBGKnVk07n+sGliSxIfdMT452+gdrEkEguSzbCgvb8a4HkqVCz6NVq54X2KyIYmsdo1rIR+wA6aXkG4LBrXxlrO9dTBiMxNcKUsLclWMhMmhRf7BMcKGUL9VIDXW/wivWjW2NoWlnmm8TI7usNqaHjzEY+RsUJmqf5FtcEBd0cwZVCwHF+J2zuHs5XkHEnPoa5d5HT5lNToiA6iDyfhrCKIrFaXeLeqlDl7ojYw2YC5IY2pgyc/bcjOlBrOIu8ybrx9oIm1aHo5kWr7+jdUdnZTBei4YGCVDDUSJaqSOHv4GX28PBHVw6oN1co0ZK0U0sesEcmWCbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0AjcyKI/RnS7nAICJB/+0M4QrOmZ+U1V4rSj6HCMFE=;
 b=chRAA/FUdbcdIxQ4LZ0P4/LT2TgU8RQMvDm4RQdnqRYzW2vWY+QSWoizi53SEXyEAFivkJPZu05SQ8FLv4ASxiHVC2pRsXSOAffmlI+EOcKVF3XelFMX45+Fcz+GPm/k7Jp2W+g66C8WnsAr+xTzu6QnojOeMer8oYeKmPmqYjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by PAXPR04MB9520.eurprd04.prod.outlook.com (2603:10a6:102:22f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 18:45:10 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e%4]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 18:45:10 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] meson: Fix wrapper handling of implicit setup command
Date: Fri,  3 Mar 2023 12:44:46 -0600
Message-ID: <20230303184446.2507886-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:a03:338::7) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|PAXPR04MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a9a3f06-6ef1-4b32-18cf-08db1c176ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eK09yJ+ujzgkZP8iaoiuM2Y94T92D5di1CtyztOl5we0jNg7B8TnhPAoDj4bZiCCubYjZ1qGQd2iJaoAVzHtei+0izwB1xzUtso9rkXq6G8Uhieuhsq5wP3I7JNZCzmTvcip0lEAw43uqJpjSBc8SYwlsr41gb+4p3RoyYaeN3biSQ0axT1CP++Tl6J1Wr0qoihCxJ22LXeaZ8Mc5n1dcTb7NeLnbcdUia/KbIjO8tJCbw3UMoqiE5xa5T1UZTywSOTkDTyx3vBdmnGNS96o5MZcmVVVfqs/rL3O1K9Vf2XQ5iDr47nXIey0iysh0UztmE2BvBDsw50s/AeEzHfMZTDAf8eKdBJERViT9ZZyRPCgy+f1ck7FzQydYvdcQ/lmSoVzu7aq5VZHXv6IwfWGi2S2uXY/im7uqZhIVI3Qgc7csLVZuQivvJnRIOZhFzUcRNT6ma3ZH98wWAieK1RNelIcu7JiGySNA8OaR6XUYxJzDCkPP6gcJcg6zfVu4dI57DVrMKjOy0AyY3Oyj8rV3nP0oB1R6JO+JpQo7/PS6W3dUkTVP7HkZelJRrWT+8WY05Ah294OCzZATR6q5hFrUucEif2TVojzE/cMUtwXSTRuJhW+TYqLtSQk1TRd5nF1KrzOYE+FTCtGL8TeLndAXCLSciUhMwLhSouoXzrr3EWnGk1tunof0Tu8j1coWP7Qs7lODPZRUCmyMPT2C3y6xw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199018)(36756003)(6666004)(6486002)(26005)(6506007)(2906002)(2616005)(1076003)(6512007)(186003)(4326008)(316002)(6916009)(41300700001)(66476007)(66946007)(66556008)(44832011)(52116002)(8676002)(38350700002)(38100700002)(8936002)(478600001)(86362001)(5660300002)(83380400001)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cTM/5ZNBWcK6L+tP8kThQBParuodBgNBMIziigSFjotl0t11032eha16p3e8?=
 =?us-ascii?Q?OXBHb1Ap86GAngU5PPzKImc8q1JQS8Cb6dx8HlxLbAsBV7gHuMeBoDVMkdK3?=
 =?us-ascii?Q?9wy7VC4tQxjgWrN8uJgsNHB/EehBG4Zc0me3R7uYC2WdVNN+2CwfwWDT0/PF?=
 =?us-ascii?Q?pxaZUcaQA2jctlTbcvv09AvBlI/Rbzmdomr8F44O38FOU68JPQUuo+8hTB71?=
 =?us-ascii?Q?YI+tkPPm37h+WFSEB8MmecJ4JiksSYsHjTxiDlEG68VYXqCu7SAV3lhku6QI?=
 =?us-ascii?Q?TZDePefibdr+2giyyGlb3tX/k/54ypS/v7GJRaskBMrsLCEffiS5MXfe1USH?=
 =?us-ascii?Q?h6/lSRUoDHRMxr9D0qdGScBWRLx4lu5Fjx+HuDNqkjTrOtkyt+0llKG+uK53?=
 =?us-ascii?Q?uiu9xHCAztNRQ/Wt6fbqOAwBUqh/nvm7Nt0tews2dsVfac0zZH/G6VpbhIOG?=
 =?us-ascii?Q?AsjR0oeffA11of24ulXLGNXpibJpH5x11mliSMa3RGXLvK/MRx2KiJoF35M0?=
 =?us-ascii?Q?NgRfAasUbsGQ5VwTAWINZLg2oqkXEIkGDZxDig9u1BAX/XE2q8pZ0TIrIjta?=
 =?us-ascii?Q?iT2h8wnZbUnjZ6soKqkKDoX515NWVXap2iNpWGS25zcPiF5K0RF8ApRkhBTw?=
 =?us-ascii?Q?JGciLmXsEHzdmWCM8q9XeKO2RYr95TYNeCLDxbaI1neR+V2y0LzG3CoWv4il?=
 =?us-ascii?Q?aLECjTFK/e9lwP2+7aDMi3BlK0GiJQoLlIlswGIJSYWX660DAhJ10MI7n1oz?=
 =?us-ascii?Q?0XIQEP9T939TMgGZE0c3ld5zZMR3shYub5GSdQNrGq0bmfZYz9yxmepAsTQT?=
 =?us-ascii?Q?PPYmG1ow7QVW8nYntfkPZog3MjekYzOcvUtl3dIPzpSAyCDi6fFkHxzxoNyg?=
 =?us-ascii?Q?Wu2RO4g45Bxu4AP5eV9A6u6sGPRZgKJ0hohMVClGhwNgeJpNVqBeIMi9mbRB?=
 =?us-ascii?Q?Fi5vN0GncAx3x29HQQsGkaJDYgbLSRvn6WW4hbTlQ9UTJKTNhzKdwXNGfagz?=
 =?us-ascii?Q?Jz+9kiEoCLfErnNDqi0wgE6ly6KJYQVbWQ25UFG/nvVlHmskzSFLHu23d6fU?=
 =?us-ascii?Q?VCwLgX7igDKQrlSWn3lFMFveVX5/4aYvnBOqlYofpVJqjj/ouard94X+mkMa?=
 =?us-ascii?Q?YG2Yl6AwoJ80yxPWdyanBYZTQaexc9a15EEJ/PPdVsh5/UqMKVK0rozXlUif?=
 =?us-ascii?Q?1puplR7aNxwyIAEjuu+jKqEbHXBzlC39hWjYvQjDoueifmSsllJVqDUjt5BP?=
 =?us-ascii?Q?aSrrqgtLM1kRBuxeyQe8VG1QRXI5VStcRhjPzzTFnw2VXunZpapZGNHA6LmF?=
 =?us-ascii?Q?pMYWSqPThZAjH8JlcvXcii5eNmdoM5J6mXeMLE2tK8QDB6i6L5B/WX8IMBX6?=
 =?us-ascii?Q?8lqdkoJqbRwL6xusUeb47bkAo4iPTx10CqUmNEXmCkS2zabQc5nn75yofkqn?=
 =?us-ascii?Q?9TkNRhP7DqpFwdWuqgYoKlsAsXK7onCFIciHzLqSnkaC3FB2OhsB4/bQD4Pa?=
 =?us-ascii?Q?/WQsMioRghgNEjA07UMBnBybPVBs0E3J2pFENS4Zl+v1tr/Rp+edY6cC3IZE?=
 =?us-ascii?Q?RQojsXzfoKQj2nPsSGwWk6Ggp3ofgjDX5EDmuMhn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9a3f06-6ef1-4b32-18cf-08db1c176ad4
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 18:45:10.7042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHEZn8b+/Syhkyfu9O1HGekyaPRqYxhOcoBGfwffHn7r9C68fTODcQw43FjGKvK7soOZLzThJ7eGA/4HjZu+pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9520
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 18:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178021

From an SDK, running a meson setup build without an explicit setup
command can result in a native build when a cross build is expected.

The problem is in meson-wrapper where it tries to detect whether a
setup command is being used. The logic looks through all arguments for
a command, and the first argument it finds that doesn't start with a -
is treated as the command. This doesn't work for an implicit setup
command if any option with a space-separated argument exists. In this
case, the argument is incorrectly selected as the command, causing the
setup command options for the cross build to be excluded from the
command line, and thus a native build.

Improve the logic by just looking at the first argument. If it is
a known comand, then record it. Otherwise just assume it is the
implicit setup command.

Note that this fix does not address the possibility of a new meson
command. Two new echo statements are included to help the user in case
of trouble:

```
~/git/weston-imx$ meson --warnlevel 3 --prefix=3D/usr -Ddoc=3Dfalse -Dbacke=
nd-drm-screencast-vaapi=3Dfalse -Dcolor-management-lcms=3Dfalse -Dpipewire=
=3Dfalse -Dbackend-x11=3Dfalse -Dxwayland=3Dtrue -Dsimple-clients=3Dall -Db=
ackend-wayland=3Dfalse  -Dbackend-default=3Ddrm -Dbackend-rdp=3Dfalse -Dtes=
t-junit-xml=3Dfalse -Dlauncher-libseat=3Dfalse -Dimage-jpeg=3Dfalse -Dimage=
-webp=3Dfalse -Drenderer-g2d=3Dtrue build
meson-wrapper: Implicit setup command assumed
meson-wrapper: Running meson with setup options: " --cross-file=3D/opt/fsl-=
imx-internal-xwayland/6.1-langdale/sysroots/x86_64-pokysdk-linux/usr/share/=
meson/aarch64-poky-linux-meson.cross --native-file=3D/opt/fsl-imx-internal-=
xwayland/6.1-langdale/sysroots/x86_64-pokysdk-linux/usr/share/meson/meson.n=
ative "
The Meson build system
Version: 0.63.3
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-devtools/meson/meson/meson-wrapper | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes=
-devtools/meson/meson/meson-wrapper
index fca64a5692..7455985297 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -13,20 +13,19 @@ fi
 # config is already in meson.cross.
 unset CC CXX CPP LD AR NM STRIP
=20
-for arg in "$@"; do
-    case "$arg" in
-    -*) continue ;;
-    *) SUBCMD=3D"$arg"; break ;;
-    esac
-done
+case "$1" in
+setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewrite=
|compile|devenv|env2mfile|help) MESON_CMD=3D"$1" ;;
+*) echo meson-wrapper: Implicit setup command assumed; MESON_CMD=3Dsetup ;=
;
+esac
=20
-if [ "$SUBCMD" =3D "setup" ] || [ -d "$SUBCMD" ]; then
-    MESON_SUB_OPTS=3D" \
+if [ "$MESON_CMD" =3D "setup" ]; then
+    MESON_SETUP_OPTS=3D" \
         --cross-file=3D"$OECORE_NATIVE_SYSROOT/usr/share/meson/${TARGET_PR=
EFIX}meson.cross" \
         --native-file=3D"$OECORE_NATIVE_SYSROOT/usr/share/meson/meson.nati=
ve" \
         "
+    echo meson-wrapper: Running meson with setup options: \"$MESON_SETUP_O=
PTS\"
 fi
=20
 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
     "$@" \
-    $MESON_SUB_OPTS
+    $MESON_SETUP_OPTS
--=20
2.25.1


