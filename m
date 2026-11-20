Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.137])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7179.1795184984591348040
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 06:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=zZIKeu9e;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.84.137, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoB+ym9t0CLqRprWVt2RBKtvtpOVzOx2LZ8HDFoqBw12a8wXs9PUVuy9kjKe5nQ+3WGAq9yDeeREdQGapwMOO4S47el9vdAa/s6iPLp8/LBZDLNAys+RoJ5efKY5xkz4JYNeAIiQC0U0j8And2dD5h/CNid3JqZHnHKeiDGudRq3BL2EUFclqiSbf5NRoYTUMscGp0JEEgx4gxFEnCWbUsl9TJYkOqkOqgkrrdgvZ3zZOlPV4t0dgYX13a4kShd3T7RsnMDLZH/xLu5bhSsZFOdcVKAOX0Kot5rfCDoRj1lei2GwD81mvtjtRhe+IViASh6b6TzqhfWl+tJIff9Tmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFLwFjS7T0mzTf4w310Q2Sis2ByThwxpvRKLgfodN4Y=;
 b=jpPcx2IYKwmGrncHVNvqS5Km0WjgOFUApEg+BkgTPOHtIGlrs9ROZzGlf1s9djT91XaD86HUmlp5DZlOlWLNn8Nkh8rxy6QuJvnQvLGEp8GqtS83P0lSk2yJJWyAj5cDWvWprkZHbamlXll7d6cJjAL4D/TOCg1FlF1Gj64o1TCl5si56gieYFVInWSSva2FM2TGLYppJx9zUEbePu83VN8RE2DHmlCJAVg1TTRffFLouf9voj26yhbO84z2Pr2iiJMGj2lUScxSErwYCmMesYItt4XGfj6Rro3xV05dSA1WDz2sCenAhHbWIznk44vsbmt2JjoL9kAQ5G6+rMiZOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFLwFjS7T0mzTf4w310Q2Sis2ByThwxpvRKLgfodN4Y=;
 b=zZIKeu9eRtTssdNul9DupUdidaM9kRLSxopW7VU6TIijSUGCfIQSZALqTxI8GptharPXbml2I9VnfDhdI77rW+ucVs6yiA33vZjaLYvF7ORHfUNxgzBL/E6pR4CeQS/BpWcCp++QEEKQG2K6C7BxqZLnfHjXySi4xHj8rXtXSHOVbobeSuVJ/hUghp+npjHhVng0nwXh61hRHXYAP+LNqZ2L0Y8ZI8NzjuAU8J0rfKzDcu6Ao5fY9azU1vaDGVSdCAfRnwq7YFUFnGyIo2tzL6vNZzYswAANjxgsucftmlEEI/Q+HMl3TmujLtRskMXka/Ho0LFe3GsdgZDrSWV4CQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com (2603:10a6:150:1dc::17)
 by GVXPR06MB9597.eurprd06.prod.outlook.com (2603:10a6:150:1e2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 14:29:36 +0000
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc]) by GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc%6]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 14:29:36 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: yoann.congal@smile.fr,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [wrynose][PATCH] systemd: Fix resolve hook stall before network-pre.target
Date: Fri, 20 Nov 2026 16:28:57 +0200
Message-ID: <20261120142857.13769-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3P280CA0052.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::6)
 To GVXPR06MB9766.eurprd06.prod.outlook.com (2603:10a6:150:1dc::17)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR06MB9766:EE_|GVXPR06MB9597:EE_
X-MS-Office365-Filtering-Correlation-Id: b1dbd8cd-a647-43bf-6949-08df4712b38d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|366016|18002099003|6133799003|261009223027099003|13003099007|56012099006|11063799006|260925021911599003|260925022911599003|261026140227099003|260925021311599003|261102123227099003|261021123027099003|261022075727099003|261026121527099003|261021121427099003|10067099003|261028144727099003|261022105027099003|38350700014|261021135927099003;
X-Microsoft-Antispam-Message-Info: /w+unkUG1EjQ/rKvaHw/i1fXDGIowTRiPW+oaZCzsza8pU+n7ngUIWzSejScA96hrP28InBusVn9GEeLA5cjNMtqW10mD2zWNuBjPVrWYPDmrLefiqhFK8u/DFLJlO3l1+rDteEo46d4PO9fADmdBgpFbJDFsKWJ53BWuXvu/uhww9gqdEKG3Wwt6ZVSDb8w73VN/m8fvTd434QIdITunTu5zQgulbnzbQRDFlqrjyqV6xuqVhXEWecOKEYbSfqkgySd5Y8qWr34XrcxYNhJhMPtO4GTTCHL5aozRIvti83JU6aYaZCz7QxO0aifO7h/At/D2yfKI70usUUstBp6in4Da+Nw9Ttt1dTVC2Yy/33tIms9MhPupWvY6fKDS+miFRP6+YDLuw/Z1bbWdcb9+rSNwc1chRDs6ErGHOmPnhUYQOWYd5xooZb2SgRNBRbz5OyAitjeM/g406F565e9q1IAZSrjMSHyuUOKCIMWTrrl4AGrJmFHhxGlyUqkIBOkPvfRToWReNDaTyeIhbMU7bUugCQKLTBCa692GBDZEiAT+6xu8Gblo1jxFZY+ZRMKm/6f5XhRtAv7Hmc7/OO80QJ5KVJBc67gAZ29GmB6PcDMmgbU2Ow6n1+X4uHWskXVcgw6IBWw/DYW7Lf+sfdHMaQaaS5plTsdsZwTpKJ3gB4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR06MB9766.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(366016)(18002099003)(6133799003)(261009223027099003)(13003099007)(56012099006)(11063799006)(260925021911599003)(260925022911599003)(261026140227099003)(260925021311599003)(261102123227099003)(261021123027099003)(261022075727099003)(261026121527099003)(261021121427099003)(10067099003)(261028144727099003)(261022105027099003)(38350700014)(261021135927099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hG8GB0m5pkBWnf8kYg8idfB2m55Vp93MReSFPtdCn6DzlIr1p8X8ByV2mLTR?=
 =?us-ascii?Q?THAmV/BbE5sDQbNxJ/3dk2L6vmKP2dP5K9acHu7xT66Q16nbKDD5OjiwyS65?=
 =?us-ascii?Q?vrq/HnBSsAxyvi63umBckIoJMD72bA8LglbK4BMeUdCHt5VYybgvZizSt8db?=
 =?us-ascii?Q?OzW7iJFJBcPeVVBMkS145PaaaMa2ZSMFb9icTMZUtj3JPiVrHxG2jYqFTByx?=
 =?us-ascii?Q?GA58oqk8M//VuVOsDrpaSuBg1QeYwpg/IOLfmvjFTFSZrnSr7GnhW9Q/jp1T?=
 =?us-ascii?Q?SyohUEYCMCsib6A8AJTxtqx55KEVJ9CD3kZ734WwHPrPbFXaVf0CnnaJlMSs?=
 =?us-ascii?Q?VVPLdLCD1exYkARP9prIdIbpfFjvlamCtISw9gDFE3CGLQ797yacPCFdOwWW?=
 =?us-ascii?Q?YeXcdFVux83IuqSdz4JOX+jFe2fhiWSrCgxzTq/96KcK8kOiAAnKjcNH+8vq?=
 =?us-ascii?Q?LuVbSLs6mXnJUFM+T22NNpOqAaNuax+bRm35mpbq20ApWqA79oE+tgwDhbqe?=
 =?us-ascii?Q?pczYJIxGhQ31ZPGx/skI3FR++S4nJlW6EjBD5a8k03fHKaEBldDQAEcBkzxm?=
 =?us-ascii?Q?zpiFBMzz/+qor00qaSFqhk7X84nacto+dk+wugaq/3Iznm1rjiRpXDD+2bwR?=
 =?us-ascii?Q?lhVohkSAXIdrYfqrD8+a4HqDJ96CB/QHsUpjLpWLaZgZRVHhBFWQSDY979/n?=
 =?us-ascii?Q?sFDPBzxLa0rOJOu2SrfXh2R1s/4GWvYzxF+8XdYFWXkQxt8/qv0UyMBnEx9f?=
 =?us-ascii?Q?pUZ8CZOataMGCJe9ED4h63CoMoySv6hBk/J6t0Ma2G0MJgwMe6lUJYwUtIdg?=
 =?us-ascii?Q?MwIsaAUtIeyA83R3KDEF0ThjZGN+70X03BWH7gtp/f2w/Lz3XA0GHIEKJZbj?=
 =?us-ascii?Q?LuWt0295DAXhmcSdtpfTUXtIg/No0C1fl7bgJX7+m3vUjbhZVY8hW2SlNdyr?=
 =?us-ascii?Q?4ns6HgWIO8mS7xREV/TLL+31n/nQLBcMcdYQgY5OU7aBT/75DUha0lmkJoJo?=
 =?us-ascii?Q?F0nSdP/I/yA653FFszPNFQp3LGWbrLzifO0p8mStQ+3bXY4vKJ+5eetnjoc/?=
 =?us-ascii?Q?nnoftOpaLinlhvncXi4DPsLBrtjWmfv47obJNXRmMtMhE/JRWFVkeIY5fNHo?=
 =?us-ascii?Q?gUQmcZUcndpZlH/DNVWEJot+84EeeACKZV67e5hEVe+gcg27UoYRcefaHTah?=
 =?us-ascii?Q?BTtClDX2P5SB4zwvDHxqpGc7C/lef4zAYJFcjl3HauLwIbKakjcWwk72Dr5y?=
 =?us-ascii?Q?zDyIlVcrqLYXGUZMkKB0CU9fXTD/eDl5s4nWIDR3LJJ7A0aMnVMfNXOj/Evj?=
 =?us-ascii?Q?gEtajqz9OmLuxJxgZiBlOl77Z7eFFq2Lk3094+w/94SR8lz6FBmunQpJ8Scw?=
 =?us-ascii?Q?GkK6yGPznmAtdTYAPU169JJXAstNMZLQHxmZqju4MFnKZCttqieEBO5nuyjG?=
 =?us-ascii?Q?9NUlqqOmGwEtGj3/t1rTFj7EMRzjR+bBGrppjIgQV7SwEV4TvQb8hTkW5TBv?=
 =?us-ascii?Q?PiBcimd+f77+7+blAQXM+5FTumwN7m4ldBCWYZUipKZ51zPmppN7achVu8jN?=
 =?us-ascii?Q?+ZotbATfO431Zo3O+cDuEMU+2+UwfrdOzRJb2KjQG8rus/ycjH4D+qeS28Bk?=
 =?us-ascii?Q?nPsfbk7IYfe2DNR4CrYDonEGF7hz8srbiRaTCHkr2oEm0SwFBVb3vSmOhkhE?=
 =?us-ascii?Q?dC6207Wvd2mi2M9uQxC1BH8Qa8cPfA6U0aOHx2PnBMLJWsYexrO2Z9VG8Oqq?=
 =?us-ascii?Q?Yl5FWM7vuA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1dbd8cd-a647-43bf-6949-08df4712b38d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR06MB9766.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 14:29:35.9387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ibqt+b8XyzvtLe+rwR/nVVHBsTpAuraBxiHSGYpEmesEwD2O493M09FbloHV8vCU+q6Jgy6NxJeY1D3nd31NDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9597
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 14:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250806
Content-Type: text/plain; charset="utf-8"

systemd-networkd-resolve-hook.socket is ordered before sockets.target,
so it listens long before systemd-networkd.service can start after
network-pre.target. Until networkd answers, systemd-resolved sends
every lookup not found in /etc/hosts to the hook, and each one waits
30 s for the hook query to time out:

  systemd-resolved[134]: Query on hook '/run/systemd/resolve.hook/io.system=
d.Network' failed with error 'io.systemd.TimedOut', ignoring.

Backport systemd commits 37adb410a2b6 and 20572a8938dd, which order the
socket after network-pre.target and drop Before=3Dsockets.target to avoid
an ordering cycle. They are in systemd 259.7 and 261; OE-Core master
already has them. Lookups made later, while other ordering still holds
networkd back, keep waiting on the hook.

Tested on qemux86-64 with systemd-resolved: a lookup ordered before
network-pre.target now returns at once instead of after 30 s, and
networkd and the hook socket start with no ordering cycles.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 ...e-sockets.target-from-networkd-resol.patch | 43 +++++++++++++++++++
 ...workd-resolve-hook-After-network-pre.patch | 36 ++++++++++++++++
 meta/recipes-core/systemd/systemd_259.5.bb    |  2 +
 3 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-units-drop-Befor=
e-sockets.target-from-networkd-resol.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-units-order-netw=
orkd-resolve-hook-After-network-pre.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-units-drop-Before-socke=
ts.target-from-networkd-resol.patch b/meta/recipes-core/systemd/systemd/000=
1-units-drop-Before-sockets.target-from-networkd-resol.patch
new file mode 100644
index 0000000000..46f464576a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-units-drop-Before-sockets.targ=
et-from-networkd-resol.patch
@@ -0,0 +1,43 @@
+From 479a2dcb1295cb1f27ee883286c9ef917c4d71f5 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Fri, 29 May 2026 01:12:29 +0900
+Subject: [PATCH] units: drop Before=3Dsockets.target from networkd resolve=
 hook
+
+Otherwise, it introduces cyclic dependencies:
+```
+systemd[1]: sockets.target: Found ordering cycle:
+    systemd-networkd-resolve-hook.socket/start after network-pre.target/st=
art after
+    iptables.service/start after basic.target/start after sockets.target/s=
tart -
+    after systemd-networkd-resolve-hook.socket
+systemd[1]: sockets.target: Job systemd-networkd-resolve-hook.socket/start=
 deleted
+    to break ordering cycle starting with sockets.target/start
+```
+
+Follow-up for 37adb410a2b62716b666dbf8359edf8a6546ff94.
+Fixes #42353.
+
+(cherry picked from commit 20572a8938dd017a23478a66c04f5768b763cb56)
+(cherry picked from commit 26c0d2d61c2e27cca1a1a490ea07770ffef80785)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/20572=
a8938dd017a23478a66c04f5768b763cb56]
+Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
+---
+ units/systemd-networkd-resolve-hook.socket | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/units/systemd-networkd-resolve-hook.socket b/units/systemd-ne=
tworkd-resolve-hook.socket
+index 8a724bbc0c..07b596319b 100644
+--- a/units/systemd-networkd-resolve-hook.socket
++++ b/units/systemd-networkd-resolve-hook.socket
+@@ -13,7 +13,7 @@ Documentation=3Dman:systemd-networkd.service(8)
+ ConditionCapability=3DCAP_NET_ADMIN
+ DefaultDependencies=3Dno
+ After=3Dnetwork-pre.target
+-Before=3Dsockets.target shutdown.target
++Before=3Dshutdown.target
+ Conflicts=3Dshutdown.target
+=20
+ [Socket]
+--=20
+2.47.3
+
diff --git a/meta/recipes-core/systemd/systemd/0001-units-order-networkd-re=
solve-hook-After-network-pre.patch b/meta/recipes-core/systemd/systemd/0001=
-units-order-networkd-resolve-hook-After-network-pre.patch
new file mode 100644
index 0000000000..4fdf2c7a38
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-units-order-networkd-resolve-h=
ook-After-network-pre.patch
@@ -0,0 +1,36 @@
+From 55ee2c19a22afbc93227906d9ed905c625ede179 Mon Sep 17 00:00:00 2001
+From: Nick Rosbrook <enr0n@ubuntu.com>
+Date: Fri, 24 Apr 2026 09:38:42 -0400
+Subject: [PATCH] units: order networkd resolve hook After=3Dnetwork-pre.ta=
rget
+
+Without this, the socket is available well before systemd-networkd.service
+is able to start, because of its own After=3Dnetwork-pre.target ordering.
+Then, if resolved handles queries before network-pre.target, it will
+hang waiting for networkd to reply to hook queries.
+
+This is currently happening in the wild with cloud-init.
+
+(cherry picked from commit 37adb410a2b62716b666dbf8359edf8a6546ff94)
+(cherry picked from commit 6f5079de5d5eab115635a959a68af8438f3d88fd)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/37adb=
410a2b62716b666dbf8359edf8a6546ff94]
+Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
+---
+ units/systemd-networkd-resolve-hook.socket | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/units/systemd-networkd-resolve-hook.socket b/units/systemd-ne=
tworkd-resolve-hook.socket
+index 3c11b8e8de..8a724bbc0c 100644
+--- a/units/systemd-networkd-resolve-hook.socket
++++ b/units/systemd-networkd-resolve-hook.socket
+@@ -12,6 +12,7 @@ Description=3DNetwork Management Resolve Hook Socket
+ Documentation=3Dman:systemd-networkd.service(8)
+ ConditionCapability=3DCAP_NET_ADMIN
+ DefaultDependencies=3Dno
++After=3Dnetwork-pre.target
+ Before=3Dsockets.target shutdown.target
+ Conflicts=3Dshutdown.target
+=20
+--=20
+2.47.3
+
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_259.5.bb
index 3c74754532..19ea896980 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -36,6 +36,8 @@ SRC_URI +=3D " \
            file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_ne=
w.patch \
            file://0004-tpm2-util-fix-PCR-bank-guessing-without-EFI.patch \
            file://0001-Revert-resolve-refuse-traffic-from-the-local-host-o=
nly.patch \
+           file://0001-units-order-networkd-resolve-hook-After-network-pre=
.patch \
+           file://0001-units-drop-Before-sockets.target-from-networkd-reso=
l.patch \
            "
=20
 PAM_PLUGINS =3D " \
--=20
2.47.3

