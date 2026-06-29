Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30EFC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 13:05:34 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37100.1782738325842836255
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 06:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=AJAWINSP;
 spf=pass (domain: est.tech, ip: 52.101.83.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6VsTJbYO4NvrmrS6y2cwFSPxVOEVX8rhOxa8KhDWLUDE7hZm+mvFV5tifjCSLpnTygcFp2vWtXRFmuG5lQ+tNbV9gsXgN56Rg3+JU19VyYIqsXjQMK/KJCfuBcN4SZyAh00gGz0sm9hYDnC15da/6YosKBL1HO26WlRDKPbMRhwoR+TCcDjJEcf5XoJsrRaz9mieBUcIywHX4wSu8sgVBbsE937zK00f+WYDghPpLrK/u6YtFTT8RejK0VmAzVUJDotYSt/pQj2FhU9YZHuvdHQvUqFVkngwd49Tg3AWdiu8K2KtpXdhg83bICse98cOq64npLbBkqBNfTKa9uA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L+BIvvSwiflqX3YWMjUHgjgowUBrjhIRHW+wHMy+M4=;
 b=kG7wPcQZY+GPlPBw9ds9LPFoc1+Mmq/G1a6CmFt+iy4YFSqAOKQyhHXKiRmP4DIiE0vSgbcbil1UlCQzXy3xEfEbbnEoGN6FFFvVTDWt1+Hbh2T8dBwNr23oO/IavNq4j6clXDdACJgZXSc0nsgzWjS/jKuV0VBzilXT3j31t7LCZNBsvnqBV7Zljzk5D2A1xTd0ORxBv5gVdup/ED7ysjFwLzbfv5XE1CgPXa3op6gRY8Fx8YijBc7ZeiqxNW8Sdl6cGwxC9EC5LyVBCTMtGwqGguTvRgg+QSr2iNb8D8Pvva6e7i5oJ1A/EpR+CYq0driGlslwaBVn/rrg54UupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L+BIvvSwiflqX3YWMjUHgjgowUBrjhIRHW+wHMy+M4=;
 b=AJAWINSP5/19+cLOWDiGGIIguJaOdJzco2ytwlUqJUhsVyHeri827qgxtN1IOd4f9OtEWwukGMXUysWWjJI+aV9Wbs1y60uidJCTeViKgo2i3qxOGuX2ytfn3cE2QN3CIVd9ynbSpc7jUp0f4CgGrS9HdSY6TaJkYMuYNidSLHsz7SOhmeFpENQbVQE8BSetzOJHnkqsB+7pHfaHBhSD8GJL9566QSaQVAsojA4oQxFpcte4gm9qbfkWXBlyZEYoDQsJEssbrg8zdt9npZr91nC4UpMqONvGZaWIeHFz8L5mu9UFGBMsQHWQKk0vo3wrOnGWkiHyooVhZ0JEeh0Eaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM4P189MB3502.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 13:05:21 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 13:05:21 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] [wrynose] perf: Fix BUILD_BPF_SKEL PACKAGECONFIG to not define variable when disabled
Date: Mon, 29 Jun 2026 15:05:18 +0200
Message-ID: <20260629130518.39904-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM4P189MB3502:EE_
X-MS-Office365-Filtering-Correlation-Id: 765ca4a6-c841-4594-80c2-08ded5df135f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	M1YWGz+AYOfQ2rsxXE+ILirjdPOKBehMhBZlj6LVPB+IslAEF+oCysZzJglE9zIszN9bT0ApEw5+qvO9Pss6F1S1/EEq3yUWDv4erJ+D+o1L3ziuqR4XviPPZ8wlbV0euj2XXc8EPYZKQAi2jxnuXRELn5lJwnw023TDFFw6dedN+krVKoR/E/FR0IsbuosafziVjOm5gNf0MLqrUPVQpX7p14MpFodPTVMZpF3euKFd70uI9G4pZyBeb7NSAAmgCrxHOGXCgYTIZgPjvf1BlTAYT44T2Yj9TjTsC8cnzJCa8eMev1UjRSFHnAV+73rPpQ2aPZWZQdzi3ejyECuTlXBbyF+HvtnMqa6usYZroelAKSBHdGelnIiuE1MZ4Yy3dFsSWKOGpx/x2o5ZUAaSt6Kw5MmAwUmCAV01jHZ1hZEFvZXfd/LephVVP+/ULLKqUH5/1eGe0ziOyDHn07ix4LN3q6ZdxBZutnfsefIoJpQ1m0/Q7eoSH0nfit8LGHfSljQJxkoRIKEqwco7LMo/DYg0TYPfqnOOdODDf+y3N08SlRL3iPxmWdN57bxg+pNWo47NaTpVxBEAIiCuZZWY4U6lB1zdBTZXBFIW4mPK4wyHIGwZzgMGo1WTRjgIhqt0dloQ3KdCDI2Alht2+0y2WA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m/WmxAmbnvqFzG0gt6faSiwdECbN0Lp82z0KQRbSM7d5WnyXvinUqenm5nVu?=
 =?us-ascii?Q?d6gsGXbXp2GrK7w5ZzrWJwOSSG5LZ44MOnim6RJpY0MHbvdNT4h7+ztLe1Ts?=
 =?us-ascii?Q?eWdm9GGb+r2Skve4DkN/gHQ2J4o4kFUPVsnVJaLc0SewMR5hRmB40m8BtAn4?=
 =?us-ascii?Q?kDZZ5/5vHcWpSTAyEavgmtKQMCQh724mBRLiDolRMRsHAEwRTH74pbKOpLpm?=
 =?us-ascii?Q?2051QyT713YV5vP4l2dQVTnGICW1eUiQRMLnGuhg2QeCx2IUK3KS0jF+nr6Y?=
 =?us-ascii?Q?jsvmmuBzN8iUqGITAKkpczNk44u86+v5I5BYPmAuBF275GCCDbHz/Jxq6xs/?=
 =?us-ascii?Q?ydfdy+I3j+woMlcxHE/nX60raRetivc6w+WHfks/RynwuY0r7T9f2a2T7lYd?=
 =?us-ascii?Q?2KEruI9yhGqkqfYsy+7fLPGX+zapIKFUEvIeWZ7RsyA2mNbWRkhVYogVYiBp?=
 =?us-ascii?Q?QzPuie7i7XakBv4fWAOsA+rGB0eHoI/WMI0Rbyg2wczgaqba1YSeFHICjX5O?=
 =?us-ascii?Q?ANH6xqsrCgAx4JWuLtoExIbWbF1dNADac2Au45X8IgUle5uiO0E1mTkRSuyW?=
 =?us-ascii?Q?zOMQXqlC5gHkrIeK1kRqo91kae13qwmOpLE/Ls4yCfNfnRqZ1FbAn/zXrlEh?=
 =?us-ascii?Q?JYFqoIA+nKWAvRYt2N5kG/te2BInikknBhRYq2mlECSHL54vlCc1Ocz1qeoT?=
 =?us-ascii?Q?wf6eisNsdeUKBSmm7rzdWeQJ6FAHCHooRAWvfPYCgilUqWwGbaX9pJtBgww2?=
 =?us-ascii?Q?qmjtv+P85irInnx7njZAZi4RFoYAb3YJUvosV50W2hwZL4DS41XusdSudnsp?=
 =?us-ascii?Q?bVDb/qRgT0skC5XPbgR0EjhsoVIq1m+KfF7o12wUR4Sjntuegb0jnqt6ceyd?=
 =?us-ascii?Q?3VPdzZxb47SAOte3/vMRBesAaGS1gUrO5Gg97bTtxRDZPMMthhxfzE+idwJ0?=
 =?us-ascii?Q?b1NUcyhm7aQXbX1Zb+Y+oGdGJaHwGJ7iEv/GIgr0HMuvVhUjBYQ4zJ8RPFtv?=
 =?us-ascii?Q?+aQJ1Cf2L1TnH9ByX/xr8/bb/QoBeNjZ3+/AbSy9HfpQm+i/Ib1nkgGQEBw6?=
 =?us-ascii?Q?gqZrQIYb/srffhdqQaqSplkaqx8x88BBz+puXwCWgnf/HFsfTDeTmxZ9CfMI?=
 =?us-ascii?Q?YBQrxxEew7x4f6Ud6m8iesRuoVKy4Rs6V9A9C6NqFT9hukNWQlbsO14gpOtX?=
 =?us-ascii?Q?niiqB8QGEhr+RXpLm5NWIQuloJsjkXFrl0Kq+OJQWqFIfSEsEKIsEmmdpcRw?=
 =?us-ascii?Q?9FJocEQcisIT2esKrStgsn2VFM/tttCwxekvbadKr72yvvDDWOb6eEE91Bho?=
 =?us-ascii?Q?zB0/XDBkdsG25bLk5iUEzVAausW0yMII9QcAXXW13GzN0iIQyjVUpJdg6brM?=
 =?us-ascii?Q?+LI7BWZpHTJlf5JhLCcZRFsYA3KM+mnxYCz2RqrvrF3Z2KLAVxeAKQj0FeB1?=
 =?us-ascii?Q?bss6gnPsKjSRmPKLCcOfOlwuFX6MXDuXnHQhCBCUC6NESH/vQeSXYlcn7T8n?=
 =?us-ascii?Q?jKDsiaYg8n+tXayapc+2enFui3IoEYVy43u1vNs6Xv/AKPDEZqcFkSQ3GSNg?=
 =?us-ascii?Q?7IneZIOiwHjVuo6VVjny7pYTQEygr9GZvrRvfllaX9oQx7+HCn+46VHf0DlN?=
 =?us-ascii?Q?lpRmz8Gibb4iFQhnkgge878JvACU5TumuHOklUJndfDnW3G4FehUG0BjvruY?=
 =?us-ascii?Q?Y1F2pKamsHET8cNfnpx1Dff6dFD9UxNeFpmGiXzPswt8QOs3f4X7a0SZi5kH?=
 =?us-ascii?Q?Upf6B6xAbA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 765ca4a6-c841-4594-80c2-08ded5df135f
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 13:05:21.3695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLe3Rfxp5UgYNY9kz9jE8qfVpW9gEGdrrR0nM+9kcTXIcd992nabLoRi3Z44kV+aUB2C/3/BFesrRVTP4VSNKWWzxTSDyjJH4aaz+Ng5NkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3502
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 13:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239775

The kernel's Makefile.config has two BUILD_BPF_SKEL checks:
- Line 219: ifeq ($(BUILD_BPF_SKEL),1) - value check (works with =3D0)
- Line 668: ifdef BUILD_BPF_SKEL - defined check (triggers for ANY value)

The previous fix (f48f6fb91c) passed BUILD_BPF_SKEL=3D0 which correctly
skips the first check but still triggers the second 'ifdef' check,
causing a build failure when clang is not available or too old.

Change from:
  PACKAGECONFIG[bpf-skel] =3D ",BUILD_BPF_SKEL=3D0"
To:
  PACKAGECONFIG[bpf-skel] =3D "BUILD_BPF_SKEL=3D1,"

When bpf-skel is not in PACKAGECONFIG (the default), nothing is
passed to make and BUILD_BPF_SKEL remains undefined, which correctly
skips both checks. When enabled, BUILD_BPF_SKEL=3D1 is passed.

Also move the PACKAGECONFIG entry to be grouped with the other
PACKAGECONFIG options for consistency.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-kernel/perf/perf.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/pe=
rf.bb
index e3e5d55e39..65dc8e7538 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -40,6 +40,12 @@ PACKAGECONFIG[pfm4] =3D ",NO_LIBPFM4=3D1,libpfm4"
 PACKAGECONFIG[babeltrace] =3D ",NO_LIBBABELTRACE=3D1,babeltrace"
 PACKAGECONFIG[zstd] =3D ",NO_LIBZSTD=3D1,zstd"
 PACKAGECONFIG[llvm] =3D ",NO_LIBLLVM=3D1,llvm"
+# Disable BUILD_BPF_SKEL by default. Use "BUILD_BPF_SKEL=3D1," format
+# instead of ",BUILD_BPF_SKEL=3D0" because Make's ifdef triggers on any
+# defined value including 0. Note: Rust-in-kernel support pulls in
+# clang-native, satisfying the dependency checks and causing perf to
+# attempt building bpftool, which fails without an adequate clang.
+PACKAGECONFIG[bpf-skel] =3D "BUILD_BPF_SKEL=3D1,"
=20
 # libunwind is not yet ported for some architectures
 PACKAGECONFIG:remove:arc =3D "libunwind"
@@ -439,8 +445,3 @@ perf_fix_sources () {
 	done
 }
=20
-# Disable BUILD_BPF_SKEL by default.
-# Rust in kernel support pulls in clang-native, which satisfies the
-# BUILD_BPF_SKEL dependency checks and causes perf to attempt
-# building bpftool, resulting in a build failure.
-PACKAGECONFIG[bpf-skel] =3D ",BUILD_BPF_SKEL=3D0"=20
--=20
2.34.1


