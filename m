Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C88C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 07:47:18 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4907.1790063229598642681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 00:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bWr5ehPQ;
 spf=pass (domain: est.tech, ip: 52.101.72.0, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAy03VMh9lEguFkebq8fGxh8Q2WY+QRH+twzUMqdbn6PvJo+ZHl8I9IDLmkybepTfMHSun7NUCwJGOM7MPZGNEowWxxpI4f8ZKAOq15ty8Pmq8/Kxi0c8ZVoWdsitNW2JIVDtPljTor+Yf5J2IPTKOMnfazpYjhnZtBKI7OYsUTvUE82PdRU+VY40p97ll9kki8EVr6ODv83KdgEXuzHQZbLI+yzjDaf4ATZyNipLSHndWjiuESjqw9LDop3FS+JDtVouGNJKgWjJ2qXHVUFbzedw7DAwBYKs+MRk1xXYMumri7obFhJVp+gJjpQitESObS/z0jTT51MzoG/v8BTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TsgY7r7nR3mmh8UhMF388fjwUJ9nCFCJpb1pvsKlVY=;
 b=LQ9kiS51J1I8fcZ7uV4RUKA8PjZ0f86doxQFFlxf70ql9SQh9ieFc9QdYU8r21+vzGjiE40vDPg0Q7lHdSDPbdNwuiA32Gc+7BuN/s86d+frgtXj2CuoTVpUbUtM7sDsg/Pvsom2QD92EULMTRLZNmtzEyzjDsW34AkIa+ALUcWVLAo7KKT4KTq8Z/g3ygAs8eLPhizZDcg9dOulNHG053YCuoanvddYdijzodlRbnMBiL6pq4iFLrtqOQ6gkLdK7miwpUO0Xo1YKJ1fIkdly97Pgc143xF+oXA4O1dDOIxS/hFfmYPDbE4dQSWCqto/46UyI03sYvzZw5ix9nYYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TsgY7r7nR3mmh8UhMF388fjwUJ9nCFCJpb1pvsKlVY=;
 b=bWr5ehPQ2FFRVWQsNOhuXVHeT41ixo8CWhVmJoNrgVc+PPFnWWhDzKbu7OxahenN0atEZKxWzMmm3dbl3kOkHZtbQYM25R62kORNvys5T0s2hoMkM/IV8fZyec+YFDKVmfVGHDlnjLQU+cEG2y1vxIX0EkGnR29EU/zX8log6QHBmZOLcuknKCVtDdeE8Cz0qp5LEReB0yBtRR6WmhJTbz9aUqzuvs+pFx/rZoS64Jagd+QinGNuuWQq9xRTUdhXNy2X0ol4sfnKMj9CFG+MfssUGcLV2jX4VVgvneC4JWTRLxDDwPJFirReyBBWrctd3gZ4H0No8/t0dM6okHKToA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2979.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 07:47:02 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Tue, 22 Sep 2026
 07:47:02 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] util-linux: upgrade 2.42.3 -> 2.42.4
Date: Tue, 22 Sep 2026 09:47:00 +0200
Message-ID: <20260922074700.3320-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB9PR06CA0019.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::24) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2979:EE_
X-MS-Office365-Filtering-Correlation-Id: ce512b0e-48b6-4ccc-4b44-08df187db0ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|18002099003|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	jbRNVIj+T+RjPFa1jF1jdWzdZDsC6LvaDQ3LQlohQH7XvMem0t+7Yu95/2Wy61JijN1XN3jbTQ0W2aTrru2FV1sJdx5KvW8LWRGbEc9RZKJl5SO0+p+zgyTESt0vTWbO2I9dQfmPfq0cbyRQv48EHPMHN5V7b5/MM19OP665slXE3Vqh2bEZ2nBPNHmAbDfpccrhQwExaMnH9DdQcapR0eq/As8x+Gclgcp76mADUdlFzd3e/aVg8NePKaqt1FmzwZz7Qxg34x8F+zmdKzH5bwYyasEEY1CNfBo5D82BmC5doCt54zEugj4xwkvmxEtVfkALorjsR1Xt1aoHzx9CL4L57sCo3U4NiXOSmas8/UfJMGYsNXDVKnlEVEezCQm4GSHib3I4vT9/5lcy1WJEoYWUj0qRqoyQLQDcMkxffpIXQBmv3fTAkRW6WJTfJlajC8NBD2LslkJGBHdP76JK9/SY5j7SVs82Arbe8o60WeuxcsC2WORg20RL6Sw+DJ9IavKRRtoUK4riCAsCqMCx1bRsenCnT1Cu5HLSDVGrVuHM+ehgFRZP6aAmTILUNBcFqWOBDSjB/8Bmjx/b4C745CWaIXaqCroruUAZFu1qKihqTAmMvR9ST7ske2AwuU9d1mJQms4p3HSUBXS8JEl9gWNYnl+vPSePnT0lM0FA2ZU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(18002099003)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6N9QLFHL8VHhdzU2HPec+mlfe485kUPPV6yrH1q1BfooY5hSUD1yD7JX0Tld?=
 =?us-ascii?Q?JDJ/nCGytiMiCuB60dS9Fh/tNW57E6PEjmYERUM8vi0ZDkaxsbrahVZ48fM1?=
 =?us-ascii?Q?CKdsPqK7iBoePddjJE6GaV2NJaGvdvi7x8Limzizup4tDWxDYWWoGT+qkwY4?=
 =?us-ascii?Q?CxQDZurMzfNnXVuXsv1l8wF5grUuadkCYV+4mz6WL0NsvmhpJP6hVWhKDdxl?=
 =?us-ascii?Q?ZBc6QkTzJQqRiPPLdj3CjEPjd9nJkYja9YsqejGu8RqgeeDr1xE2wmbGWLu2?=
 =?us-ascii?Q?IG8t+4qjX6XUivODzkvonQvBM+r3oSFC1o8QrwhbnomR4Rmm74xQqyMf18sZ?=
 =?us-ascii?Q?urj4+7dZnjrGqIf17YK/Lle9HuZU1kWrDaIaYdRM8I+A4IkH/fDIzkrw5uWw?=
 =?us-ascii?Q?/7NOXjHJjxgEi+fBtwVRXu4lUZIysEGUqYT+e+ZMRYD8AKGRI7mtIn9ijnEr?=
 =?us-ascii?Q?t8DllfrZ2DWZqBFmBSDIlqy9HW88P7Vt+4yQ4Xj//DMB9MDLmz8qcxz1r3b4?=
 =?us-ascii?Q?FkB9L1MosJ4P4T0zHsY9iL1oLqoLDhCtFjhRWjSIcvhvqg2vf6icPTOcqtm5?=
 =?us-ascii?Q?Sgo0Pn4R0HoIVqn6VfT0zdZ09YfA7Wx0r4YMJ5GUt5DkH4mVXCFmNE/FiUNu?=
 =?us-ascii?Q?JIB1bno498NxPom7CxF9gll2Xf99cznQQskGGhECyU9TTB/dx/W8A1XFBz1J?=
 =?us-ascii?Q?rqGlaNQVq+gGoXdoE4uNm+ghzomXwLCsaM75tEWjd625rNoMl6A12ys3UhZC?=
 =?us-ascii?Q?rBgz4IJ+dTQ9fJ4tIus4/UseeeNacnRKONoFZz3Jrf6staS2O6YXn7o9z/nb?=
 =?us-ascii?Q?cVjAD/5/PSz/Fx9numGhEDwomqvRQAbFdw2CxwaDzR+f4uWK3MxfIUlXpZyB?=
 =?us-ascii?Q?+GFbCo4Xt4hkE3PSPB+aDf6neHGQR9si1U/5aq69ZkamS/QrARCH5dg256xT?=
 =?us-ascii?Q?H+5Pu9OR24FdHgYkvEhS/maI+ptWZRzwXBMs08lCGmlbBmHN+JeWmA1vlpcn?=
 =?us-ascii?Q?ZJCN9VdWUJDvvEwAno9xwgLzCQkgfZJTiYDc4G1bpUM6tq2hck5My7YifS8E?=
 =?us-ascii?Q?dzdvXoOfDjLr9K99IphEEWZjoS/cSN1uFx7f/mW0z8YZyDEROUCwp+AARPkE?=
 =?us-ascii?Q?MgzZtQBEj5LTxHIs27znX7yS8iJZx5VxCcrxLxeKSTuF3R05pmtohrm9Y3ET?=
 =?us-ascii?Q?5n+fwlsUhd/aDRLBdKdkXFhBBe9Hi36X/4kPv5y4W2pJMO2Qu/v440s224Gr?=
 =?us-ascii?Q?L4J1TiDybF7FTuWVlU7FK3OmIUJ14kCzRgEEaXKpkcNgs0m9Q0QpIBhdNNZ6?=
 =?us-ascii?Q?H6r6Au4CsL7Jp7SkzjQRu5o3W7Sgs9TVdpXmNuUwGLE8LPmXwOFgewo/Ex04?=
 =?us-ascii?Q?jcu3E/xEInC3wgsvcww5ldCmWK9wUwDQxLdD1x/E28jAKhhUJcBB04DwHQda?=
 =?us-ascii?Q?IqB1G7ifPBQ2joc0gDeXXtsNdV4FUD7QIxcVLKZQk2rpcJIsPyAZGuWTIsvC?=
 =?us-ascii?Q?GPMIoD4wqzVFr4Ad1rvnLQHHZaCRQxVascc+s7b/MULXo+EBvuPaStzgvz4A?=
 =?us-ascii?Q?XrRlgKzHw/JvWsXCzlw724fFYcKNRYotFazh2js2AQIa0mABs0q6Cs5hw8l1?=
 =?us-ascii?Q?Q70jsAUapllXVJ3GI051zOhdbeBZ/OJzlWMhZDF1oW1v1sh+Qj4f06h1hCUD?=
 =?us-ascii?Q?jGuh+q8g0F3pWHOtBYENAKnD0am9bWV4wTYZRh6eztpNUmox7RjZfHuPRsR5?=
 =?us-ascii?Q?Vme/aBHNUisvogHRtXMg34d1RVPjXGA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ce512b0e-48b6-4ccc-4b44-08df187db0ba
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 07:47:02.6653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUF3FP0vCMgOm2u/5inXC5OwLL8rBtreMiTVXTom/O7cB0fAXmzO0Gqbhjp7X5IszxRax4mO14lu3/nKf6DBLi08+cSurm+hDkHLZOoeB3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2979
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 07:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246387

- util-linux-libuuid: upgrade 2.42.3 -> 2.42.4

util-linux 2.42.4 Release Notes [1]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

This release enhances previously released security fixes and adds protectio=
n
against symlink attacks in the legacy mount(2)-based code in libmount.

Changes between v2.42.3 and v2.42.4:

libblkid:
    - minix don't detect erofs images as minix (by Clayton Craft)

lib/fileutils:
    - add safe FD-path and no-symlink helpers (by Karel Zak)
    - fix RESOLVE_NO_SYMLINKS fallback value (by Karel Zak)
    - fix unused parameter warnings without SYS_openat2 (by Karel Zak)

libmount:
    - add mnt_fs_fetch_ids() and populate uniq_id for utab (by Karel Zak)
    - use fchmodat2() for X-mount.mode=3D (by Karel Zak)
    - restore the original namespace on error paths (by Karel Zak)
    - secure the idmapped mount replacement (by Karel Zak)
    - pin the legacy mount target and bind/move source (by Karel Zak)
    - harden restricted mount targets and post-mount handling (by Karel Zak=
)
    - fix X-mount.idmap ID names in code and man page (by Karel Zak)
    - use USE_LIBMOUNT_MOUNTFD_SUPPORT for idmap hook (by Karel Zak)
    - add missing fileutils.h include to hook_idmap.c (by Karel Zak)

mount:
    - fix grammar and typo in X-mount.idmap documentation (by Karel Zak)

nsenter:
    - close cgroup.procs fd after join to prevent authority leak
      [CVE-2026-78408] (by Karel Zak)

po:
    - merge changes (by Karel Zak)
    - update sv.po (from translationproject.org) (by Daniel Nylander)
    - update nl.po (from translationproject.org) (by Benno Schulenberg)

po-man:
    - merge changes (by Karel Zak)
    - update sv.po (from translationproject.org) (by Daniel Nylander)

tools:
    - add non-newmount.conf config-gen profile (by Karel Zak)

- Refresh existning patches context
- Cleanup patches which are part of this release

[1] https://github.com/util-linux/util-linux/blob/v2.42.4/Documentation/rel=
eases/v2.42.4-ReleaseNotes

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...2.42.3.bb =3D> util-linux-libuuid_2.42.4.bb} |   0
 meta/recipes-core/util-linux/util-linux.inc   |   7 +-
 ...ing-fileutils.h-include-to-hook_idma.patch |  36 ------
 ...ncrease-wait-for-flock-child-timeout.patch |   9 +-
 ...ests-script-Disable-size-option-test.patch |   2 +-
 ...x-unused-parameter-warnings-without-.patch |  66 -----------
 ...r-and-typo-in-X-mount.idmap-document.patch |  48 --------
 ...LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-h.patch | 112 ------------------
 ...non-newmount.conf-config-gen-profile.patch |  26 ----
 ...t-rw-mode-for-mmap-ed-packet-socket-.patch |   7 +-
 .../util-linux/avoid_parallel_tests.patch     |   2 +-
 .../util-linux/configure-sbindir.patch        |   2 +-
 .../display_testname_for_subtest.patch        |   2 +-
 .../util-linux/util-linux/ptest.patch         |   2 +-
 ...l-linux_2.42.3.bb =3D> util-linux_2.42.4.bb} |   0
 15 files changed, 14 insertions(+), 307 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.42.3.bb =3D> uti=
l-linux-libuuid_2.42.4.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-libmount-a=
dd-missing-fileutils.h-include-to-hook_idma.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0002-lib-fileut=
ils-fix-unused-parameter-warnings-without-.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0003-mount-fix-=
grammar-and-typo-in-X-mount.idmap-document.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0004-libmount-u=
se-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-h.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0005-tools-add-=
non-newmount.conf-config-gen-profile.patch
 rename meta/recipes-core/util-linux/{util-linux_2.42.3.bb =3D> util-linux_=
2.42.4.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb b/me=
ta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index 249ae095453..6529104e281 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,16 +17,11 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
-           file://0001-libmount-add-missing-fileutils.h-include-to-hook_id=
ma.patch \
-           file://0002-lib-fileutils-fix-unused-parameter-warnings-without=
-.patch \
-           file://0003-mount-fix-grammar-and-typo-in-X-mount.idmap-documen=
t.patch \
-           file://0004-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idmap=
-h.patch \
-           file://0005-tools-add-non-newmount.conf-config-gen-profile.patc=
h \
            file://0006-tests-lsfd-accept-rw-mode-for-mmap-ed-packet-socket=
-.patch \
            file://0001-tests-flock-increase-wait-for-flock-child-timeout.p=
atch \
            "
=20
-SRC_URI[sha256sum] =3D "66ac7c0e725278eb2b039e3104f2c91119341d941b41bac7a2=
85c695f940bd57"
+SRC_URI[sha256sum] =3D "fbd62a100ab7bb8746ba0661255c3c48185b1e9021507c624d=
a01fbc696330ec"
=20
 CVE_PRODUCT =3D "util-linux"
=20
diff --git a/meta/recipes-core/util-linux/util-linux/0001-libmount-add-miss=
ing-fileutils.h-include-to-hook_idma.patch b/meta/recipes-core/util-linux/u=
til-linux/0001-libmount-add-missing-fileutils.h-include-to-hook_idma.patch
deleted file mode 100644
index cb20c60c9d1..00000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-libmount-add-missing-fil=
eutils.h-include-to-hook_idma.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 92369ef3fe1bcc48548441b68fb17786500c2bc3 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Wed, 2 Sep 2026 13:32:27 +0200
-Subject: [PATCH] libmount: add missing fileutils.h include to hook_idmap.c
-
-The hook_idmap.c uses RESOLVE_NO_SYMLINKS (added by commit fb8e26535)
-but does not include fileutils.h, which provides the fallback #define
-for this constant.
-
-On Fedora (glibc 2.40+), this is masked because glibc's
-<bits/fcntl-linux.h> transitively includes <linux/openat2.h>, which
-defines RESOLVE_NO_SYMLINKS. On Ubuntu (and other distros with older
-glibc), <fcntl.h> does not pull in openat2.h, so the build fails:
-
-  hook_idmap.c:335:33: error: 'RESOLVE_NO_SYMLINKS' undeclared
-
-Fixes: fb8e26535 ("libmount: pin source path with openat2() for restricted=
 users")
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/7e2e010874b10b3aabdc3c4c844c9ffc46a4a374]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- libmount/src/hook_idmap.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libmount/src/hook_idmap.c b/libmount/src/hook_idmap.c
-index 77494e2..2c697b1 100644
---- a/libmount/src/hook_idmap.c
-+++ b/libmount/src/hook_idmap.c
-@@ -23,6 +23,7 @@
-=20
- #include "strutils.h"
- #include "all-io.h"
-+#include "fileutils.h"
- #include "namespace.h"
-=20
- #include "mountP.h"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-flock-incre=
ase-wait-for-flock-child-timeout.patch b/meta/recipes-core/util-linux/util-=
linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch
index 60b6c86eeb1..7213b007861 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-wai=
t-for-flock-child-timeout.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-wai=
t-for-flock-child-timeout.patch
@@ -1,6 +1,6 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From e93cd673d49aa087f13ff9edccb2e70fa0fad9db Mon Sep 17 00:00:00 2001
 From: Pratik Farkase <pratik.farkase@est.tech>
-Date: Wed, 17 Sep 2026 12:00:00 +0000
+Date: Thu, 17 Sep 2026 12:00:00 +0000
 Subject: [PATCH] tests: flock: increase "wait for flock child" timeout
=20
 The flock test launches "flock ... bash -c '... sleep 3 ...'" in the
@@ -23,9 +23,10 @@ Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/tests/ts/flock/flock b/tests/ts/flock/flock
+index 85e341d..e0e5ebe 100755
 --- a/tests/ts/flock/flock
 +++ b/tests/ts/flock/flock
-@@ -65,7 +65,7 @@
+@@ -65,7 +65,7 @@ for api in flock fcntl ; do
  		ts_die "unable to run flock"
  	fi
  	# the lock should be established when flock has a child
@@ -34,5 +35,3 @@ diff --git a/tests/ts/flock/flock b/tests/ts/flock/flock
  		|| ts_die "timeout waiting for flock child"
 =20
  	ts_init_subtest "${subtest_prefix}non-block"
---
-2.43.0
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-script-Disa=
ble-size-option-test.patch b/meta/recipes-core/util-linux/util-linux/0001-t=
ests-script-Disable-size-option-test.patch
index a70d038cee3..a5a37d39b3d 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-script-Disable-siz=
e-option-test.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-script-Disable-siz=
e-option-test.patch
@@ -1,4 +1,4 @@
-From c83f9dbfd7d9b96e4969ab16d5db69e064c67c50 Mon Sep 17 00:00:00 2001
+From 48490e19f25b0d0eb88d861475f518074419fb92 Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@pbarker.dev>
 Date: Mon, 5 Jan 2026 09:56:41 +0000
 Subject: [PATCH] tests: script: Disable size option test
diff --git a/meta/recipes-core/util-linux/util-linux/0002-lib-fileutils-fix=
-unused-parameter-warnings-without-.patch b/meta/recipes-core/util-linux/ut=
il-linux/0002-lib-fileutils-fix-unused-parameter-warnings-without-.patch
deleted file mode 100644
index ff6577e7e89..00000000000
--- a/meta/recipes-core/util-linux/util-linux/0002-lib-fileutils-fix-unused=
-parameter-warnings-without-.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 95eb4a92ab0bd10e890783b8bc0794b2fb1cf438 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 3 Sep 2026 09:45:29 +0200
-Subject: [PATCH] lib/fileutils: fix unused parameter warnings without
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
- SYS_openat2
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-On systems without SYS_openat2 (older kernels), ul_openat_resolve()
-is a stub that returns -ENOSYS, making all parameters unused. With
--Werror=3Dunused-parameter this breaks the build.
-
-Move the #ifdef around the whole function so each branch has its own
-declaration =E2=80=94 the SYS_openat2 branch uses all parameters normally,
-the fallback branch marks them __unused__.
-
-Fixes: fb8e26535 ("libmount: pin source path with openat2() for restricted=
 users")
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/a471b62e732a491f1abe42450352fb0f9b5b43ea]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- lib/fileutils.c | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/lib/fileutils.c b/lib/fileutils.c
-index 89f1e21..80b69ee 100644
---- a/lib/fileutils.c
-+++ b/lib/fileutils.c
-@@ -440,10 +440,10 @@ char *ul_basename(char *path)
- 	return p;
- }
-=20
-+#if defined(SYS_openat2)
- int ul_openat_resolve(int dirfd, const char *path, int flags,
- 		      mode_t mode, unsigned long long resolve)
- {
--#if defined(SYS_openat2)
- 	struct open_how how =3D {
- 		.flags =3D (__u64) flags,
- 		.mode =3D (__u64) mode,
-@@ -451,11 +451,19 @@ int ul_openat_resolve(int dirfd, const char *path, i=
nt flags,
- 	};
-=20
- 	return syscall(SYS_openat2, dirfd, path, &how, sizeof(how));
-+}
- #else
-+int ul_openat_resolve(
-+		int dirfd __attribute__((__unused__)),
-+		const char *path __attribute__((__unused__)),
-+		int flags __attribute__((__unused__)),
-+		mode_t mode __attribute__((__unused__)),
-+		unsigned long long resolve __attribute__((__unused__)))
-+{
- 	errno =3D ENOSYS;
- 	return -1;
--#endif
- }
-+#endif
-=20
- int ul_open_no_symlinks(const char *path, int flags, mode_t mode)
- {
diff --git a/meta/recipes-core/util-linux/util-linux/0003-mount-fix-grammar=
-and-typo-in-X-mount.idmap-document.patch b/meta/recipes-core/util-linux/ut=
il-linux/0003-mount-fix-grammar-and-typo-in-X-mount.idmap-document.patch
deleted file mode 100644
index db4fca57b6e..00000000000
--- a/meta/recipes-core/util-linux/util-linux/0003-mount-fix-grammar-and-ty=
po-in-X-mount.idmap-document.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 410c4db19325ed9b1aa7aacbc34f657de9f906d3 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Wed, 8 Jul 2026 14:03:43 +0200
-Subject: [PATCH] mount: fix grammar and typo in X-mount.idmap documentatio=
n
-
-Apply grammar improvements from PR #4400 (field order change
-intentionally omitted as the current order matches the code).
-Also fix a GUID -> GID typo in the example.
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/b38324a9a4020123e8972079de51a2aed7e44c69]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- sys-utils/mount.8.adoc | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/sys-utils/mount.8.adoc b/sys-utils/mount.8.adoc
-index 8a6e09f..71daf92 100644
---- a/sys-utils/mount.8.adoc
-+++ b/sys-utils/mount.8.adoc
-@@ -826,8 +826,8 @@ Set _mountpoint_'s mode after mounting.
-=20
- *X-mount.idmap*=3D__id-type__:__id-mount__:__id-host__:__id-range__ [__id=
-type__:__id-mount__:__id-host__:__id-range__], *X-mount.idmap*=3D__file__:=
:
- Use this option to create an idmapped mount.
--An idmapped mount allows to change ownership of all files located under a=
 mount according to the ID-mapping associated with a user namespace.
--The ownership change is tied to the lifetime and localized to the relevan=
t mount.
-+An idmapped mount allows the ownership of all files located under a mount=
 to be changed according to the ID-mapping associated with a user namespace=
.
-+The ownership change is tied to the lifetime of, and localized to, the re=
levant mount.
- The relevant ID-mapping can be specified in two ways:
- +
- * A user can specify the ID-mapping directly.
-@@ -842,13 +842,13 @@ It is possible to specify multiple ID-mappings.
- The individual ID mappings must be separated by spaces. Please note that =
in the __/etc/fstab__ file, spaces are interpreted as separators between fi=
elds. To avoid this, you must escape them using \040. For example, X-mount.=
idmap=3D0:0:1\040500:1000:1.
- +
- For example, the ID-mapping *X-mount.idmap=3Du:1000:0:1 g:1001:1:2 5000:1=
000:2* creates an idmapped mount where
--UID 0 is mapped to UID 1000, GID 1 is mapped to GUID 1001, GID 2 is mappe=
d to GID 1002, UID and GID 1000 are mapped to 5000, and UID and GID 1001 ar=
e mapped to 5001 in the mount.
-+UID 0 is mapped to UID 1000, GID 1 is mapped to GID 1001, GID 2 is mapped=
 to GID 1002, UID and GID 1000 are mapped to 5000, and UID and GID 1001 are=
 mapped to 5001 in the mount.
- +
--When an ID-mapping is specified directly a new user namespace will be all=
ocated with the requested ID-mapping.
-+When an ID-mapping is specified directly, a new user namespace will be al=
located with the requested ID-mapping.
- The newly created user namespace will be attached to the mount.
- * A user can specify a user namespace file.
- +
--The user namespace will then be attached to the mount and the ID-mapping =
of the user namespace will become the ID-mapping of the mount.
-+The user namespace will then be attached to the mount, and the ID-mapping=
 of the user namespace will become the ID-mapping of the mount.
- +
- For example, *X-mount.idmap=3D/proc/PID/ns/user* will attach the user nam=
espace of the process PID to the mount.
-=20
diff --git a/meta/recipes-core/util-linux/util-linux/0004-libmount-use-USE_=
LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-h.patch b/meta/recipes-core/util-linux/u=
til-linux/0004-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-h.patch
deleted file mode 100644
index 623783b35c7..00000000000
--- a/meta/recipes-core/util-linux/util-linux/0004-libmount-use-USE_LIBMOUN=
T_MOUNTFD_SUPPORT-for-idmap-h.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From cd5780da58af24a07b033da1ebbb53005fb14fc8 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 3 Sep 2026 10:01:29 +0200
-Subject: [PATCH] libmount: use USE_LIBMOUNT_MOUNTFD_SUPPORT for idmap hook
-
-The idmap hookset was originally guarded by HAVE_MOUNTFD_API (kernel
-headers have the new mount syscalls) rather than
-USE_LIBMOUNT_MOUNTFD_SUPPORT (libmount is built with mountfd support).
-
-This was intentional (commit 9040c0900, 2022) -- the idea was to keep
-idmap working even with --disable-libmount-mountfd-support by calling
-the raw open_tree() syscall directly, while using an inner #ifdef
-USE_LIBMOUNT_MOUNTFD_SUPPORT to optionally reuse the sysapi fd_tree.
-
-This fine-grained approach broke when the CVE-2026-78410 fix replaced
-the raw open_tree() call with mnt_open_tree(), which is only available
-under USE_LIBMOUNT_MOUNTFD_SUPPORT. The build fails with
---disable-libmount-mountfd-support because mnt_open_tree() is
-undeclared.
-
-Rather than maintaining two code paths for a feature that fundamentally
-depends on the new mount API, gate the entire idmap hookset on
-USE_LIBMOUNT_MOUNTFD_SUPPORT -- consistent with how hookset_mount is
-guarded. Remove the now-redundant inner #ifdef.
-
-Also add a note to mount.8 that X-mount.idmap requires the new
-fd-based mount API.
-
-Addresses: https://github.com/util-linux/util-linux/issues/4598
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/e06799ac325a881a297d2ffd6fe568cacdcd00ab]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- libmount/src/hook_idmap.c | 6 ++----
- libmount/src/hooks.c      | 2 +-
- libmount/src/version.c    | 2 +-
- sys-utils/mount.8.adoc    | 1 +
- 4 files changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/libmount/src/hook_idmap.c b/libmount/src/hook_idmap.c
-index 2c697b1..b1477ac 100644
---- a/libmount/src/hook_idmap.c
-+++ b/libmount/src/hook_idmap.c
-@@ -32,7 +32,7 @@
- # include <linux/nsfs.h>
- #endif
-=20
--#if defined(HAVE_MOUNTFD_API) && defined(HAVE_LINUX_MOUNT_H)
-+#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
-=20
- typedef enum idmap_type_t {
- 	ID_TYPE_UID,	/* uidmap entry */
-@@ -317,7 +317,6 @@ static int hook_mount_post(
- 	 * Once a mount has been attached to the filesystem it can't be
- 	 * idmapped anymore. So create a new detached mount.
- 	 */
--#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
- 	{
- 		struct libmnt_sysapi *api =3D mnt_context_get_sysapi(cxt);
-=20
-@@ -327,7 +326,6 @@ static int hook_mount_post(
- 			DBG(HOOK, ul_debugobj(hs, " reuse tree FD"));
- 		}
- 	}
--#endif
- 	if (fd_tree < 0)
- 		fd_tree =3D mnt_open_tree(AT_FDCWD, target,
- 			    OPEN_TREE_CLONE | OPEN_TREE_CLOEXEC |
-@@ -544,4 +542,4 @@ const struct libmnt_hookset hookset_idmap =3D
- 	.deinit =3D hookset_deinit
- };
-=20
--#endif /* HAVE_MOUNTFD_API && HAVE_LINUX_MOUNT_H */
-+#endif /* USE_LIBMOUNT_MOUNTFD_SUPPORT */
-diff --git a/libmount/src/hooks.c b/libmount/src/hooks.c
-index 23eca4e..5ae91ed 100644
---- a/libmount/src/hooks.c
-+++ b/libmount/src/hooks.c
-@@ -45,7 +45,7 @@ static const struct libmnt_hookset *const hooksets[] =3D
- 	&hookset_mount,
- #endif
- 	&hookset_mount_legacy,
--#if defined(HAVE_MOUNTFD_API) && defined(HAVE_LINUX_MOUNT_H)
-+#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
- 	&hookset_idmap,
- #endif
- 	&hookset_owner
-diff --git a/libmount/src/version.c b/libmount/src/version.c
-index 5ec0d49..30cb340 100644
---- a/libmount/src/version.c
-+++ b/libmount/src/version.c
-@@ -37,7 +37,7 @@ static const char *lib_features[] =3D {
- #ifdef USE_LIBMOUNT_SUPPORT_NAMESPACES
- 	"namespaces",
- #endif
--#if defined(HAVE_MOUNTFD_API) && defined(HAVE_LINUX_MOUNT_H)
-+#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
- 	"idmapping",
- #endif
- #ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
-diff --git a/sys-utils/mount.8.adoc b/sys-utils/mount.8.adoc
-index 71daf92..c2b095a 100644
---- a/sys-utils/mount.8.adoc
-+++ b/sys-utils/mount.8.adoc
-@@ -826,6 +826,7 @@ Set _mountpoint_'s mode after mounting.
-=20
- *X-mount.idmap*=3D__id-type__:__id-mount__:__id-host__:__id-range__ [__id=
-type__:__id-mount__:__id-host__:__id-range__], *X-mount.idmap*=3D__file__:=
:
- Use this option to create an idmapped mount.
-+This feature requires the new file-descriptor-based mount API (available =
since Linux 5.2).
- An idmapped mount allows the ownership of all files located under a mount=
 to be changed according to the ID-mapping associated with a user namespace=
.
- The ownership change is tied to the lifetime of, and localized to, the re=
levant mount.
- The relevant ID-mapping can be specified in two ways:
diff --git a/meta/recipes-core/util-linux/util-linux/0005-tools-add-non-new=
mount.conf-config-gen-profile.patch b/meta/recipes-core/util-linux/util-lin=
ux/0005-tools-add-non-newmount.conf-config-gen-profile.patch
deleted file mode 100644
index 4a957489b1e..00000000000
--- a/meta/recipes-core/util-linux/util-linux/0005-tools-add-non-newmount.c=
onf-config-gen-profile.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 19b732395c1c7dc849823a3aa0d8a66122483f54 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 3 Sep 2026 10:15:43 +0200
-Subject: [PATCH] tools: add non-newmount.conf config-gen profile
-
-Add a configuration profile to test builds with
---disable-libmount-mountfd-support, useful for verifying that libmount
-compiles without the new fd-based mount API.
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/b8159405b99af7af2054f9f8222cf23901368a01]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- tools/config-gen.d/non-newmount.conf | 3 +++
- 1 file changed, 3 insertions(+)
- create mode 100644 tools/config-gen.d/non-newmount.conf
-
-diff --git a/tools/config-gen.d/non-newmount.conf b/tools/config-gen.d/non=
-newmount.conf
-new file mode 100644
-index 0000000..303b6cb
---- /dev/null
-+++ b/tools/config-gen.d/non-newmount.conf
-@@ -0,0 +1,3 @@
-+include:core.conf
-+
-+--disable-libmount-mountfd-support
diff --git a/meta/recipes-core/util-linux/util-linux/0006-tests-lsfd-accept=
-rw-mode-for-mmap-ed-packet-socket-.patch b/meta/recipes-core/util-linux/ut=
il-linux/0006-tests-lsfd-accept-rw-mode-for-mmap-ed-packet-socket-.patch
index e4cb92b3bb5..63c337672a5 100644
--- a/meta/recipes-core/util-linux/util-linux/0006-tests-lsfd-accept-rw-mod=
e-for-mmap-ed-packet-socket-.patch
+++ b/meta/recipes-core/util-linux/util-linux/0006-tests-lsfd-accept-rw-mod=
e-for-mmap-ed-packet-socket-.patch
@@ -1,4 +1,4 @@
-From e3c633ee981969d4bf53d276bc72052121774aaf Mon Sep 17 00:00:00 2001
+From 1dcf458933a755b68861816c5f2a0b7525183972 Mon Sep 17 00:00:00 2001
 From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 Date: Thu, 10 Sep 2026 09:35:49 +0000
 Subject: [PATCH] tests: (lsfd) accept "rw-" mode for mmap'ed packet socket
@@ -28,6 +28,9 @@ Upstream-Status: Submitted [https://github.com/util-linux=
/util-linux/pull/4619]
=20
 Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
+ tests/ts/lsfd/mkfds-mapped-packet-socket | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/tests/ts/lsfd/mkfds-mapped-packet-socket b/tests/ts/lsfd/mkfd=
s-mapped-packet-socket
 index ab1f72c..03d5db5 100755
 --- a/tests/ts/lsfd/mkfds-mapped-packet-socket
@@ -41,5 +44,3 @@ index ab1f72c..03d5db5 100755
  	    ${TS_CMD_LSFD} --pid "$PID" --noheadings --output SOCK.PROTONAME --f=
ilter "${EXPR}"
  	    echo 'SOCK.PROTONAME': $?
 =20
---=20
-2.43.0
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.p=
atch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 9b94cbf1c1b..a762e2cb32e 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From dde7b7ff56ed406ef96b975b88b6ab663fd10386 Mon Sep 17 00:00:00 2001
+From f9657110b4a6d7ec87b03c33b078941a4550d7b9 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patc=
h b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index 1c338126bf3..62d73539bf0 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 5981a174707a384d6970c7ce7d8d68322985a6fa Mon Sep 17 00:00:00 2001
+From 433f750dcc97131030e7569515b53f32e4591c14 Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_s=
ubtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for=
_subtest.patch
index 6ffcf46295a..a1b2614a73e 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.=
patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.=
patch
@@ -1,4 +1,4 @@
-From caadbbf29cfeeaac301d02185e717a5587a9cdf8 Mon Sep 17 00:00:00 2001
+From 588b121774df964e98e3443185defbc155ed009f Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/rec=
ipes-core/util-linux/util-linux/ptest.patch
index 1fec138c3a5..84be621b4e0 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From 368d04b58ce8b52e93d33be1321e78a9c6bf80ae Mon Sep 17 00:00:00 2001
+From 7f7f5fe328ef01f53b2abb3964731aac97c014c4 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
diff --git a/meta/recipes-core/util-linux/util-linux_2.42.3.bb b/meta/recip=
es-core/util-linux/util-linux_2.42.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.42.3.bb
rename to meta/recipes-core/util-linux/util-linux_2.42.4.bb

