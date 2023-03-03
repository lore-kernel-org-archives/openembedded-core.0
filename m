Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175C6C7EE32
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 20:43:10 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.50])
 by mx.groups.io with SMTP id smtpd.web10.2331.1677876181506572315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 12:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=Hz22/IST;
 spf=pass (domain: nxp.com, ip: 40.107.15.50, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccLaIYPDOnead8DBZ2TGrvzFLpdkTDjqtjxdJrO27JUO+CXZ1fGLfxNC/kF5p1paOwML0qN8jWM8lddyEWOR4cfiTf6Fb8Lwd7ZK8cPLgt5Ket8MV2LQDaDvlw6GeiPSyNKcBLCbq3L+GGoQaaB9XixVf9moDBULcj/0tG4jY2qX9xMNHiUjRQ7+AHaNWkyuYrV12AJFmJlz7+46oTSd0CcNCRot0GOXcrWa/EVmHNJr4fCbtXpsFHjCjpF1c13m6BVIhBf5nd5NNMYETmPCxf5uWThcIRxjk4BNNVUi/ZC4gxIjoDcGhumeWNrCEhoLFVUGtsOOZH6rprP2c7YFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0AjcyKI/RnS7nAICJB/+0M4QrOmZ+U1V4rSj6HCMFE=;
 b=n/zl/scYqs9EoxygJWxOsaBAEmw35yd9sQFPfK6SKkimhINUw6xcdxMuhNuOS7hzK0J2bG100fkJ8jWoMR3sKfdPIeAKdy0GIabxtVmIEdJMqFXqnPVwjCrN67L6t4n6AByjKw6CgXsi0WO6x2HV8IqaxRcLBDfAmb2dFPaPGMY5Qgiqy+jW1DDzg6x5IqsumJp71ruHMfVq4X2xQWBM766vqm7YNuVMFxhuxH/4BJB1qHLUYbeu3GyxMFl99cTk4upJtb6MBYL6gzEXHINQM6z0Kug4l6sv0Wq7NscQb0Zom/2p9kd4EvMoI5wiBkgX3nnRq4HVHE+kRrfDWbtoTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0AjcyKI/RnS7nAICJB/+0M4QrOmZ+U1V4rSj6HCMFE=;
 b=Hz22/ISTebKNDcYRT2Fs+uhXFVnnrkDEHDVbroHasix5pInJsljQVhS4cdRmkWJGoOxV5CtdSYqJaHKuik5onst0qECjURm7jHNY3sbmJ+vBYNSWZNAYcoXmoVzjSnh0MA/YSG5U28DLeXM5KJaTZj5sObafZzCbl9w1kX28mVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by PR3PR04MB7228.eurprd04.prod.outlook.com (2603:10a6:102:8c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Fri, 3 Mar
 2023 20:42:58 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e%4]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 20:42:57 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [OE-core][PATCH v2 1/2] meson: Fix wrapper handling of implicit setup command
Date: Fri,  3 Mar 2023 14:42:36 -0600
Message-ID: <20230303204237.2508724-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|PR3PR04MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f5e043-0935-420a-0333-08db1c27df16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PHrls1IU57xS8czBe1wbr65+hM+WPAGjMMVfBRQFWyjrYL77vPlqgBDBYlqZ6yIxrle1r89W8cL7OkSj9HE9WKSYy7aMNG44vFK51HwSKGPin1xJW/ZLmW0VVLXqfdg9KcEdCqM80w27C3sTWcP0BPx76G8MtrdLaORCbso7PNpjJtZ+nY66eU5QMvoTExxI8aqRB6EqTAtLKM/PWMFWfU3H/e0JU5g+rlsWMCeubtrlqSW7pR3EiB6s17k10DM4UaKgABf0CrI5JzKsEjbBKhZoMLCBS9QVtF43uHGtOJ/1cTvSIuqxmSj5h5xX2N5Zmkz4bC07iYWCr4yJd9dtvsZgtCKKpHyHFZzpJEfDXis85zbFtebdqEWKzn04k4jDEShfvYshvf9dZVYadGt3yOBqnzBwJMtzI7vFr/+P/7CFAOCtmtb3nZ3YxMqrmKzWWGnhgGpra7wTckLIHQSNKrpCkc0FOtNVel6x+FKN1b4nlY2X/DA6bLvBf2abpJT1CJaKl4di+T/+5CHljJOXz6JX3i5k4lWWBbZumgi/oFE9ezbQ5FfJ2vSkKG/LbyTOBp7+NeMCHAF6zKNmZTNeVUjX4kctlqjq08mPoCLULsyGjH7pfmJzZ4pxLAV8lGUBJ/3NivNy++kxG6FEmjo725IvD4cxLGwKDZpK0HhYtSnIjRPC2LpuHxkSKb2J9mezqnV6ODboJppTzwIi4vu57Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199018)(4326008)(6916009)(66556008)(66946007)(8676002)(83380400001)(316002)(8936002)(6666004)(41300700001)(2616005)(1076003)(66476007)(6512007)(6506007)(186003)(26005)(478600001)(5660300002)(6486002)(66574015)(52116002)(86362001)(36756003)(2906002)(44832011)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UA7eSar4ulSXQi3mTRuXuk7f9gRtWqc0rohBtb1G1hy1aFW6YQjEyMrBZklx?=
 =?us-ascii?Q?t5VBoyLKTuk8N+qOlOUNjoCNF5wt1Dm7C9BAmhHUyWc7vJPHkkXVp/ztyo9T?=
 =?us-ascii?Q?KazUJxiZRCD4Na54aR4ahwSB1LujOoqJBzun4Kxqa5kPruU4bleBfz9QlODV?=
 =?us-ascii?Q?Pl9e16dGlWDtlzIbzHreKXztSg5NHqKfcc37IwUW3jw1Zq6gRdBYEWw+77cV?=
 =?us-ascii?Q?hlEsJz/B9yD+Tc7a1ef5Ni7RUWjIhCwB2+Io00iSdmBSfCgMEinRjOVtfVYv?=
 =?us-ascii?Q?9XiRpiDtDFA8eUti7Ls04JbTkU/g+IfwKRkQP+Nm/qWoAn1JHwCm5Kwsp2v0?=
 =?us-ascii?Q?WtSo3z8dAY90Z9ZEX3n9eA9BpG2Gs43ALsLEzgw4HidZzTjN87HNSu8hASBK?=
 =?us-ascii?Q?8/Mj+m2+GbDjQzw3Orlv1vNK0uhlptoX+3Ew2IiyUCmJWcq6XbRHOe+z6ryO?=
 =?us-ascii?Q?L6UpkduwZQjxDgmFbrZyYurjiT0VFCJSdgNJ9vc6h3hCHeN4QssjSbpR+VVG?=
 =?us-ascii?Q?Z+KaJGLwyvfsttitll1wIJBd2kWtb/umnN8ZCKPOUzsLxrb2ebTlPZxwye94?=
 =?us-ascii?Q?t0h5k9OpYiiCok/8ZfPzLEmFlrYg3X08gkvnr/d9g5j1Mt6j+rmeaGBuKdj0?=
 =?us-ascii?Q?Hq8Vk3kPzO0G3SI7/u4H9AHkoVjedEb8B+8Q24j74QrOLfMgAzplpl05oknA?=
 =?us-ascii?Q?MrUXx3DMiBEzHcmhNf8iGRIP9DuPvh7Ie116zjaYHAGr2jlqWJ0Um/kZONaM?=
 =?us-ascii?Q?WpW7RWtk1GKIfI5sENL8+zdj0eGaAzhkh1W6oVth9aq84QHjGM5r7xWP5dri?=
 =?us-ascii?Q?AbBdsD6tpynAebBV8HhiE/idj9Wo+xKkAu14FefwhS6M7Wj+ZtL4gDRKklCT?=
 =?us-ascii?Q?m1nhyh9nQpy7tIlZAKTNIorLXuQ02NNy72ZCjZlXvY9xZaZblA077NTT/d4w?=
 =?us-ascii?Q?IodPsCYbQfJeKxdg9fJK+ch3G9irFviVWCHhbF/KvZKJ//UAaGEYihokt5xZ?=
 =?us-ascii?Q?SWGkfo/aodnQvolGakruOmiwAU8db9S4DkjKwZ64KKdvbaXjby19+m3QQbtm?=
 =?us-ascii?Q?MHfPIudyRMHnhY2RrdjjV4Ojqi19fRiuLpXBy7itk9fzYOXIzluiE8VxH8K3?=
 =?us-ascii?Q?z7Spj2mRxWvhipYD0GbF9LFWcC7HdfmpQ8izYdMkWEMq5zmE7VrIscc6RDbv?=
 =?us-ascii?Q?jxkjf8fVAtgDfXo4jNBjwA3xSfZMKUpnVaJrpD/PCn97tU2gzQayWANcJ/g4?=
 =?us-ascii?Q?0+6rZtKtv4jR+TzbPWlte92PItYxu3MDMh4IJZgNLGsQrDLQb0WYWvC19jG2?=
 =?us-ascii?Q?jfJscae3nAOne5MUwkImiglqFwiLVVYKPBR62TyDxe2R0pxtIP+KxCDKt18A?=
 =?us-ascii?Q?AU7xAtSkU52BIrq4+GInVZivInYj+qbSixUYLBkeDR51X2e9hpQl5PC+7jX3?=
 =?us-ascii?Q?X+Ktro5QZcZzQCIZO3PrYkgqIrmtTQSJPxZ9XkXMmqBGCzpiUjcSwkaLIB4S?=
 =?us-ascii?Q?mKH8PE4DEWb6eSxrpllP3Wxw2KeFeQEo3W8hdVSkKt3Z/BlLE7VQc0qqQNQf?=
 =?us-ascii?Q?x5RjLxWCUSU4asHzqjDOJvMkTrIq5EZRy+lRaKOO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f5e043-0935-420a-0333-08db1c27df16
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 20:42:57.6683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sD2cfKG6TLevFwvfT5XyhfHUV4JuTDPpvTvYS3cEKOfWclPTlVclrtDnW6FzOHC5pPC69WHed9S+HUTxp2f2Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7228
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 20:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178024

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


