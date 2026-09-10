Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF93EC88E40
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 05:12:08 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6892.1789017120475080008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 22:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GsZ618Qx;
 spf=pass (domain: est.tech, ip: 40.107.159.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBXcDCNybTAwP+ZLT74pEZwlHVddnLPwsJ0tuUrS3U8JeqVz+uZbiMclrsd45CrIL9fv3CKylQyHUv3L9Oegecfh1ziPvKwto9cMqAoAdcASTcnLDHTx4I12CyzwRc/4Vp5fiqm/2AMjTHvnWuCMAgbpYyh2l/2Nmc95nIIHcRqxCLCIjUneyg5Sbb+POpe1TW4bc2z74IVcgKmZ9YM1jQ+pxe67HuUJ4ohGDtDxaz63mbKeb7awcVud/jZDLhJ66XOyMkXckgyhrLDlzFncGgxk2hMLKCzTiap/gz0atci6VZMA7rMYKvCU8Vj2PeUOMWq2OSsksrRQhW17wwLTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIrgFiCcclDQo7S2CySR8Jajyvk9ixBx30BaNCWVxgI=;
 b=Bm0U42vNqGoztP7GEfrFni8xH1MGog7xYhUx462rlcu88q0dObHSa9x9Sx3Kh+7VgDj/qAsCrLOI3fT11tv/OxFIICb5SwKDEQLt32dhnPWnRyRF6gQwAA953ZKfEMRYnUEPuGjakCyt2LFzqtdaM6ICyoLvW3kvyf7SPv82AJGWNJ5Bh2dl0s04TnZ5rbxFxtl9l6iBlWWuFYt/lBR6++uzaw4nygAzWjEPnJl0RoBG/DyYBZUD5lq0uYObOQmPHUAp8lrxz2mKGrbkBcQOm43adu6IMb80k0V+iI5X2Xqztho8voXOc/6ypkiscKrNnvbtTm9l4st4IGtzW6N5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIrgFiCcclDQo7S2CySR8Jajyvk9ixBx30BaNCWVxgI=;
 b=GsZ618QxZateRYVwfbMGgNuSWNcZs5J8c6Vd1E5m69tMa0fZoJglGd7hvwHXVLJddOXEW1RQY5eIS7DM7Fi8JWQmX2Wx0SrZA+oHe5Yr33JNlyQNJjiYohYsdEz4WqXa4L5gvtL2mT3mASnJTtgeWWr73qxB7kCuABx68WtrOkbtIUibPFb5m3peXgSbFyujTn4hFqmSZs9Gz7/sF3VEExpoe4pdhw5wXkVogmVBEkzzaO91wF9EBF+69WzfGjV8tJBpZZIjjsekKOtRwQy/iGRXvKeK/4QFhiBN2T2VuE6+dUgiVJ0DN8vxWvXqb+NN2G3PuvwR4EcpKzRPh5Sy1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB2085.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:514::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 05:11:56 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 05:11:56 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 1/7] libpcap: Fix CVE-2026-0799
Date: Thu, 10 Sep 2026 07:11:48 +0200
Message-ID: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
References: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0151.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB2085:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b0db70-6ee0-4bbd-da51-08df0efa08dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|10067099003|6133799003|3023799007|22082099003|18002099003|12006099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	PhCWJxhB3uTQInkbnpOAKgn9hp2QYECW5Wk9HpoeGcHUzugqN4/NlnO6qBP1S/bFTp5JQX2ynovVPMX/vFg1oowR7sAqDnkOdYJ5dWE1QoYsoiiHNyPBEVDR2Cd3cQoTVJRHc05tfsaJaoFS2IPNg+tDvezSJJsZnZT/E8GG286PwOTUuFpUQQ4B9nzDwbY+Vy53y55RzvjBfOURGB72GyPW+XA9DKMoOup0SoHv+CMmthi99zQgPs90zZlW+L0Tj1iX0Zz5uR3qUst3W/NUy7CJlpuA8Mgg7ugT22adiMASn06BPq/UbT0Zu1rhVEA63SshJ1xOmKwcKUl+3YKaUcA43HZK8ek6d45CPjZffgJN8HsVtZ8KXcloplTjpxukIBkmV1I3CNC7oTYz4a/l6NpCp3uB3ySpsVBDt2LpMhVouQM2cMRVIOQDnIlKTvuc+N1P1aprj3y2Vr60UYqVMQYKUwo/9e3kj0FB5gtuLe3QUpDCD2AyyxQa1YNwB4onf5M+kgNe4J+AixUyZe6VVchpTSZy50eFah028DhART4XpgaYbV+1rT4vgmvONThAk/dMkj8SGTyx3YyrMLUg/Y9QxcCH4FoZ5/PCSPvAnFhIstNHzGaTeWLVYUv4S85a
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(12006099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xNXGP2WGHP26sbNdP15Jd8T6SGUdDnyoUUft4ynRt92HEZKJi+54xGQPytox?=
 =?us-ascii?Q?5X+Ox+z/SFvKPv/holzw8EuTE+SXcLabm/xosao+Aq5yQpBl3fCDfJ+vn0wU?=
 =?us-ascii?Q?zhj1rRGgf6dIlmWUndto9PIcjF9FHcIDpgB9GcCxTVR1KDkuB6Cl8g+ux0Gn?=
 =?us-ascii?Q?ge3MgP0HoTMWD1mfcb2yK3Yo+tWEVoBdR9lTpjTDpVTqXWaY2inr7gJGJ/p8?=
 =?us-ascii?Q?dgvhqS45f+AluqVpaY4f11wL5LVuhmDIV1QyYJAeEkoOcNYRN30Xc3aJaOsB?=
 =?us-ascii?Q?D1KscodffWJIXOt1/YHfFFy6WQuPcczXkGI5FXbnDU7jvJKxOQcdqwkff4TF?=
 =?us-ascii?Q?ImANcaVwZZJ5ZK3ZuAWQpVp/qZnK3fuubO33rZ9Bbei6APNyaAt8mSRwk2RH?=
 =?us-ascii?Q?p7X2O85+h1v2/gCOfzqNn+ZS4jqkg42+5sNeZWtI2YvYMbmJlkS12iPU4Zr3?=
 =?us-ascii?Q?dhYa8c4dxtkyEeqrT6yNAfFLQN2H5LajaQ9gBtNT8uRuJew28OquxWkIaJw0?=
 =?us-ascii?Q?L8WiRLOOsVVSIZtdfeV05Shy9fLYestrdE9bNfFczPCGIuRgZLb+QbZZSOWc?=
 =?us-ascii?Q?zZZcWJzTBK5L5GUYIruevrz/oke65x7rwt8/bf5wuGZkI+0am8EMN7qE6WtV?=
 =?us-ascii?Q?YJzJOGisiUPLRfjj/NAbYBd5+fwTJ135hX9YScDsxfvvjG4bfkH0RGz9uarO?=
 =?us-ascii?Q?jK3/THiF4jteeiB17KoyXsNjTRNK7vOX2o6v8NVJuI/L1nRoNqbIOVlCcXrz?=
 =?us-ascii?Q?G13py8TCZZlCkQb1RCwdipQPpsS3T4vK1MeVwBZ644MrAceRAp46i70ILcvY?=
 =?us-ascii?Q?ylGAIntMgKGvGJ9DQrdmy2qElcDpeEyvF4CJ6w/lXHbWNwKLZrMPXabqwkF5?=
 =?us-ascii?Q?h4ZZH+6dYcI4VK7WogLD94uQjFAOlp6RHWjXiFgJ5zTEKMvk+uUna19xxW2R?=
 =?us-ascii?Q?Nsnua7pKbdrlSDgpiKZ/4ag2SIotCalNFS2dxcs3frj17ud/QQAw+Z9KPvGy?=
 =?us-ascii?Q?0rxZ2vIuIQOCF9IdBozqpraCifFPbp+Ixbjd4nMG2C6ZTCpWEQlSw5yoseYv?=
 =?us-ascii?Q?SZ54XVWFm/LCYQ78ejvJRajeeec4VPpU8F6VMPArQ+2PFsbNYG1dwnp1GP4S?=
 =?us-ascii?Q?c9IzxPeZ4AFONPaVXdI3csFDkdvD10IikD4rS/Ty7iGbJIfILyZolscRP4rW?=
 =?us-ascii?Q?wh8VR4EXunz/vMetkIB5fbIbtSwTCXUfVtin/qcchAsfzAlDGaKFvaFnR3nP?=
 =?us-ascii?Q?y43gHeeNtTywHYGRX2a5KCGsMt229X05cACQTGIF9xO4JvlaqAXq4/HZXzIk?=
 =?us-ascii?Q?/pIpmhnXUNeKeCvqYXPLvK+PjgewjKTM8QILPJZ5WZ0oJlFBFx3b2XH/h16/?=
 =?us-ascii?Q?hYG/36gsVqeYHiU3EG/1u4mKY/tT4CgBZe4JoeiWCz/XYJYE6+UAexlv2G50?=
 =?us-ascii?Q?ZVyQdVLIdOb5TXg4i9dFAnRhu3fSkUAJmooxUmpvxuHYUiDWexGE/in6wBEW?=
 =?us-ascii?Q?+7+ooLfOTCaMPnWYTZ96S+suHZfZacNXEMdIjxpxYmOiqw/0HQQfTszasKNk?=
 =?us-ascii?Q?kWuRmfmVUXkSetfYu64+7Xaq3aR0r/G5prCsRrGfzTdO8wjp+Kuwh3BCz1DC?=
 =?us-ascii?Q?zLCXVgXk7AvKxZaQwwsD4yMMIiFjn3jRUjl32sW9Dl+s+UHtTMgHMHNOsVdE?=
 =?us-ascii?Q?Ms0m3ef8XxeKCukau9OmQv0uw5CJ1O0UXhdQyY14p8Q6bYGrUIs2roWsiIbh?=
 =?us-ascii?Q?Kmq/tK3BHxH0NiaC7oVjjiEz85J2dhhj6Wogj4pOs0fEDq3K1HB2ybH1Kpon?=
X-MS-Exchange-AntiSpam-MessageData-1: V6srX7C6eoXfSVbW2SL200eSIhCBMRuQUsw=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b0db70-6ee0-4bbd-da51-08df0efa08dc
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:11:56.4110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVN5sZmtAxNFTggprPq4i+TFBjnasgYs5FYgaq+i3RLVGfBiP4glcWfcFrIV92mhJV/Q5Lctf+LaGzitI553bjENJMtLNf5aiT2tFJ+s3uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 05:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245524

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-0799
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/48e896=
0a7108e9e828f9d7bdc7e97bdab841aec7
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/01-CVE-2026-0799.patch    | 87 +++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0=
799.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
new file mode 100644
index 0000000000..58289d7e3b
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
@@ -0,0 +1,87 @@
+From 3c55fdefa576c7a06feab86a9e4341be414de49b Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:33:41 +0100
+Subject: [PATCH] CVE-2026-0799: Access M[] safely in the BPF interpreter.
+
+Include Security identified and reported this problem as a potential
+vulnerability in 2018 (case reference "I7").  Their work was sponsored
+by Mozilla under the Secure Open Source program.  The vulnerability has
+been independently confirmed only recently.
+
+The current revision of pcapint_filter_with_aux_data() can, but does not
+check whether a scratch memory register index is valid in the "ld M[k]",
+"ldx M[k]", "st M[k]" and "stx M[k]" BPF instructions, and assumes this
+is always the case.  This holds for programs that have been generated or
+validated by libpcap.
+
+However, this does not necessarily hold for programs that come via
+pcap_offline_filter() or [deprecated] bpf_filter() from an external
+source and have not been explicitly validated.  If the interpreter
+executes such a program with an invalid index, it will read/write the
+process memory at arbitrary locations starting at the current stack
+frame.  Depending on the address, the memory layout and the OS, this can
+result in stack buffer overflow, SIGSEGV, SIGBUS or other effects.  To
+fix this, in the interpreter reject the packet if the index is invalid.
+
+(backported from commit 569f8fd3524192acbabf93c9cd704471bb38f84a)
+
+(cherry picked from commit 48e8960a7108e9e828f9d7bdc7e97bdab841aec7)
+
+Notes on backporting to 1.10.6:
+ - The CHANGES entry added by this and the following CVE patches is a
+   downstream addition to record the backported security fixes.  It does n=
ot
+   come from upstream: rather than import the upstream 1.10.7 changelog bl=
ock
+   (which also lists unrelated, non-backported changes) or claim a 1.10.7
+   release in a 1.10.6 tree, a dedicated "1.10.6 + backported CVE fixes"
+   section is used, listing only the CVEs actually backported here.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/48e8960a7108e9e828f9d7bdc7e97bdab841aec7]
+CVE: CVE-2026-0799
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ CHANGES      | 4 ++++
+ bpf_filter.c | 8 ++++++++
+ 2 files changed, 12 insertions(+)
+diff --git a/CHANGES b/CHANGES
+index cb603f8..74f8ddf 100644
+--- a/CHANGES
++++ b/CHANGES
+@@ -1,3 +1,7 @@
++1.10.6 + backported CVE fixes / The Tcpdump Group
++  Backported security fixes:
++    CVE-2026-0799: Access M[] safely in the BPF interpreter.
++
+ Tuesday, December 30, 2025 / The Tcpdump Group
+   Summary for 1.10.6 libpcap release
+     General:
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 9b899bbb..510dbd9c 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -217,18 +217,26 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			continue;
+=20
+ 		case BPF_LD|BPF_MEM:
++			if (pc->k >=3D BPF_MEMWORDS)
++				return 0;
+ 			A =3D mem[pc->k];
+ 			continue;
+=20
+ 		case BPF_LDX|BPF_MEM:
++			if (pc->k >=3D BPF_MEMWORDS)
++				return 0;
+ 			X =3D mem[pc->k];
+ 			continue;
+=20
+ 		case BPF_ST:
++			if (pc->k >=3D BPF_MEMWORDS)
++				return 0;
+ 			mem[pc->k] =3D A;
+ 			continue;
+=20
+ 		case BPF_STX:
++			if (pc->k >=3D BPF_MEMWORDS)
++				return 0;
+ 			mem[pc->k] =3D X;
+ 			continue;
+=20
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.6.bb
index d381a4eb2f..265c46e3bd 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -12,6 +12,7 @@ DEPENDS =3D "flex-native bison-native"
=20
 SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz \
 	   file://0001-Fix-error-messages-about-32-bit-integer-overflow.patch \
+	   file://01-CVE-2026-0799.patch \
           "
 SRC_URI[sha256sum] =3D "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd=
7c7b5f834d5dfc"
=20

