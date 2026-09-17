Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDF2C982D6
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 14:41:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41431.1789656055661525063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 07:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fBBJYDfD;
 spf=pass (domain: est.tech, ip: 52.101.65.24, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7xqFD4CaADlU7A0vsxbH9KC7mTjYd7uU08jpOiFRssOPQLUUcQRjpkAk+3KxNR5pkhOFAAF0vb+AFcl9rLu/fMEkk9bM01rNCnPcmSUJCiEilh7f68qYUMv+yvhu7TOczm7WIRZY19CiC6CkLXjXB72yIrLuZVeRQ1//kMy6eRoUW3BYECWjOt0brRT7Kyy3HyM2LtzQxvbysLRf0/9C7I1D3pDf7SLhIzTciFUN48L9EpHtk+dT8/jVNpjKSuDzImsHcNFUexBnbzbo1xyIjVypbxPtJ1Aln09AzmBm+LHmKSB5EC0Bzdba3PN3CoMaDWXQvt617DdCSTAacvfCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JpgZeuHj1uoGoc3RFRrjLNdBngq75h76tvuTjXsKkM=;
 b=zIuIDbSaH6S6lhYAkuRPGYhbwNcUCpArXqd5afckuXNL01epQTYUbfx9bGmHL0HRNPPUMi3Q6iRHf5d1qE6HGSx5SN7gVFSQ18d0fyBwkdeQjCU6hIf+fFy8k9Qc5KAAPYJYHR8PPoe2iXdcMMXWYeAHTbcVi9lWdbZQ+aBbFey4HbvAG15GErkprxnfMZnKko8XfjOWavtCXDhERQfBcj0+7/SvdnvXZO9B85lK95pxmsrPXsGUNCtVTdwrs7sG3gQJtwpDXUS6J07ZguedNI+/AnsqSN7IvwaE0J0ZhOw8y9Was8kb9qWmeXN2v3nvleetVidV297C0x1/qvvLGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JpgZeuHj1uoGoc3RFRrjLNdBngq75h76tvuTjXsKkM=;
 b=fBBJYDfD3dJQJhXgt/2GuRH6Yej5AnFMLq3qUDBU+e9lW5rujHA1yBSuIY+dJ3q8HbvZO8IMMcZXZ9uT4G4esAU0+v6LSDYvt0Kf8DGQIKsJRjL3jyth5K2exSR1CqpRN/GDSEmkbUYduE1HLnGF5NVw0JindiqeBVuH+Bh7MYUAhIIIbk17+HW5iwmoEE3r+e9feWOdTyTrM11HltVzfoefQC/j3gqlqwKiHLbDdbuLoOMaP23R9VZfsBHDRr2JTSlhepRHh4n5426QcaPSCQrWRGrFfqYsW48tDPmlGcw4tymS0bUJ3NDTOGUkBvrIyCBsprN0iKmZOJxpLnqr2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by PA1P189MB3724.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:501::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 14:40:51 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 14:40:50 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] util-linux: ptest: fix flock test timeout on slow targets
Date: Thu, 17 Sep 2026 16:40:42 +0200
Message-ID: <20260917144042.10045-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::12) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|PA1P189MB3724:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a4b2cf1-3d29-4df3-85ab-08df14c9ab78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	wIMHu7IY6SD7rePNjgTTOt7s5HmPEQH4s1KOiW59roZlvII9au9a3KmJ481SbFsT84N6QgCejkSJpD/YnYPI7oh56uD8x4jJc3M4P9bSx0Dv5YIdNwyAEkfu5t7TRJLh3vDIf1UznQ2peVYjZqCfGigDXkI4KKfR0NC62g3fX3Dd7P0YTg8r2yMylDcpHifmcn+SWz9jJUd/K43xgQwPNUYtf4Te83+ecCwJsspzQBmLUdECSg0kVXZfUVLKqnUHViHA6PGJX1RlsVkfrFtCbwLR7x3ZQNkquaB4GBWz4h9yZlMQhFDMPlsNDxvx+7fILBxYD3eZc5Bi7TKVse10XOWUiwLk7yMuNlco18nbg8l2s9h0K+I1RvXxyJgL7/lgtODEdYlVvH9NTffZJYduqXC14IslVFM/IRmzBx9q7/pohF02HqXDxD/hULjOqskwdhUWqND3bceetMgOx5+eU/s5viaegEgrLGuqoUGrwH7e2kC9h8m2EeVvjj4+yrEhJ9pvCD+1WdW9FzJZahuE4s9VfIUzfn0y2iEobpnP7oqIjntWdrxpUb/XXwjuu2hvdChQd8rxAdxI3PeED/4T40sdt604r4r8EBuVlM74K0BV9c+YMBW6zp8m5L4XKgce7wNAQGgEWLJuntk9yOue7KEdnwAfCn08WrdOtVYrnxw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?decoGByS13dth0VDh5I4b4mpyPCn5iJr8x+PmvfsFnYNC80w+mU6o477fEPc?=
 =?us-ascii?Q?KePLXVwQLKcXmuEj+TqtMk1HQc8zZtNxT55GYJcGbApNDY4QsdHOte86L/n0?=
 =?us-ascii?Q?78tpkM3BFDUWVY+6zF/M85n/+y4qyXLz/NWWYDCrghZ73Bmzb5/Vmdda5WAW?=
 =?us-ascii?Q?BJglZSyCbaOOUW919RHN7rZqfxYt3K0DRmFN/ukXWHCX4H04ixIeUj9he6QC?=
 =?us-ascii?Q?h/jzMoOlmxeCptOY3qh4vIqszKGHGy6CFVD1XGJmCxgx0S6QaF+Ga1r+oq9/?=
 =?us-ascii?Q?Zi0B7YkAPOKuH+VDOnMx4cvqO2bV6mkJaf+y6aS1dBBTyY8NNP4teyOcEstn?=
 =?us-ascii?Q?GlqzFGD2oNrhlPCOa4EcAoJUSAeqFfg/w8yoFhKEknOwCQ79t5XGDlGwpcwf?=
 =?us-ascii?Q?1/wU2fdMXzo9ADxD+C1m6esuaOfMrNJyqckm/WqeTKquhfq/w40BKegiXmyu?=
 =?us-ascii?Q?PtVcVIaGEldAEgOipiw6h4U7pjQCwuYsnJ+kdphiX6vm+AbUPniA6TyiiGmu?=
 =?us-ascii?Q?JZ1t1h38R1cQefyHdu5nVjffAtQ3+gYvb4mCQB/QjCRqpn1J1lBzq6mgHWYE?=
 =?us-ascii?Q?AA+PvQv5UxiNxsyeUQOdycGRfHfLHk8fNETVKIPUqL6YLHBWIn8LvwyzP+WY?=
 =?us-ascii?Q?j5NRwdQUF+03iOE+UByUIszqKH46j+lsfGwEWAuj0hqineCZ3aX0asr+Wo70?=
 =?us-ascii?Q?15UU3fpAoGR7GJ0d75ZD/r4MmtuEhDvB5vJH+Qh9LvO0Gm6WqxSsNDn956cy?=
 =?us-ascii?Q?P3N1i58VbAxeW1fQtax9bP2dT63dbdALj6y8r/Llo70bMrU4eMvXDYUxAy0B?=
 =?us-ascii?Q?pem5P/LHQoLDCyXsxkIEr+v8VvaDR1orWAgE8rIBfNjf4bMCxt0EQE44HZ2x?=
 =?us-ascii?Q?uN5b60Ti3Q20tBbX1t4QH6GIDQhHrqNW9u+IkH9bWlEV5rJ7GyvDpo1NWdY5?=
 =?us-ascii?Q?yB77xuJ3qFfMd8QtDivn84H14nrUcc4tZ3tUcMraHNPNbhc8y1MNNMSA/gZZ?=
 =?us-ascii?Q?drFe3IqT16bnYl/EYXqkPRgWmfoNc1kpRYVLlyArYYrVLUEQXLERCI1TH2Bx?=
 =?us-ascii?Q?RQXHi3sx4U0HzEuTZQxgbOsGDEBcmDIn22KqP+FfJ8zfKquiK8nU9Pclz91/?=
 =?us-ascii?Q?nShs5NMwMQO5NqpHoYD1LJVyE9Ab3Dia5aFr8FDf6CaSQ7V879TyQMVst6H+?=
 =?us-ascii?Q?m13vu9mEoEEm68J2SBODx/a5mUNBrBGB0kvOiTfq2pv8XpHFU7T/dssW3493?=
 =?us-ascii?Q?8FplPu38fDjtcS/ZnXrk9QvCSz+ppeMoS9BGZrkrTkhiGjCgajIizDslBPJc?=
 =?us-ascii?Q?fzXUjBqeNp6dTDCHBk5rtYBxeqY6x3dnanxuc3awEwS4vaz6sztfHGd6UZ8v?=
 =?us-ascii?Q?/wlAv4PWlkh15V58DTuiChAxJJU5LGvi7iVrG8G7NIlQL0+lizApxX/XNdb1?=
 =?us-ascii?Q?a6NPZrEXGaWFT0fPB8xYOih0byTkxUHpN6qsYlHnz0s2HrSzHTO33UgPoDI5?=
 =?us-ascii?Q?bDFUYZIpf0U6zIV8HVlwx/zBxHWQGT3ZtGQgzmJPeCWhdrnzW4UyKlhWjnWe?=
 =?us-ascii?Q?pJnFLAI5ZyK+O7bPezrYvYbtwifqgph/OwwEbH2aZyIC/kYcnJGOiCWI+oXk?=
 =?us-ascii?Q?x5XPFhszDW8L/8qRZguRTkCBtyFVGjVx2/3OHkQMl+WdCWtOSbPHj7golxrT?=
 =?us-ascii?Q?UD5BHdw0mzgJHym6f3GsY4q2L35fAT8vl0aT1ccShTKXOVGDEljERlwqKKwo?=
 =?us-ascii?Q?l3KnNSBWRw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4b2cf1-3d29-4df3-85ab-08df14c9ab78
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 14:40:50.8877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJ4acsGvXfOJsw7xFI26szEIvfmafFaNjztwF7DlBsCdsdCZpFVSaTYCqLya+1seYEZkkI2qwbACaIooucuTvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3724
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 14:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246072

The flock ptest starts flock in the background and waits only 1 second
(hardcoded "timeout 1s") for flock to spawn its child, polling with
"pgrep -P". That budget only covers process startup, so it depends on
host speed. Under emulation (qemuriscv64 under TCG) spawning bash and
flock can exceed 1s, so the child is not seen in time and the test
aborts with "timeout waiting for flock child", failing intermittently on
the autobuilder.

Backport a test fix that raises the timeout to 30s. The poll loop exits
as soon as the child appears, so fast hosts are unaffected; it only adds
headroom on slow/emulated targets.

[YOCTO #16425]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...ncrease-wait-for-flock-child-timeout.patch | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-tests-floc=
k-increase-wait-for-flock-child-timeout.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index b30fb04e05..249ae09545 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -23,6 +23,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/v=
${MAJOR_VERSION}/util-lin
            file://0004-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idmap=
-h.patch \
            file://0005-tools-add-non-newmount.conf-config-gen-profile.patc=
h \
            file://0006-tests-lsfd-accept-rw-mode-for-mmap-ed-packet-socket=
-.patch \
+           file://0001-tests-flock-increase-wait-for-flock-child-timeout.p=
atch \
            "
=20
 SRC_URI[sha256sum] =3D "66ac7c0e725278eb2b039e3104f2c91119341d941b41bac7a2=
85c695f940bd57"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-flock-incre=
ase-wait-for-flock-child-timeout.patch b/meta/recipes-core/util-linux/util-=
linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch
new file mode 100644
index 0000000000..60b6c86eeb
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-wai=
t-for-flock-child-timeout.patch
@@ -0,0 +1,38 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Pratik Farkase <pratik.farkase@est.tech>
+Date: Wed, 17 Sep 2026 12:00:00 +0000
+Subject: [PATCH] tests: flock: increase "wait for flock child" timeout
+
+The flock test launches "flock ... bash -c '... sleep 3 ...'" in the
+background and then waits for flock to spawn its child using a hardcoded
+"timeout 1s" around a pgrep poll loop. That 1 second only covers process
+startup, so it is purely a function of host speed. Under emulation (e.g.
+qemuriscv64 under TCG) spawning the shell and flock can exceed 1s, so
+pgrep does not see the child in time and the test aborts with "timeout
+waiting for flock child", failing intermittently.
+
+Increase the timeout to 30s. The loop exits as soon as the child
+appears, so this does not slow down fast hosts; it only adds headroom on
+slow/emulated targets.
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/=
4639]
+
+Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
+---
+ tests/ts/flock/flock | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/ts/flock/flock b/tests/ts/flock/flock
+--- a/tests/ts/flock/flock
++++ b/tests/ts/flock/flock
+@@ -65,7 +65,7 @@
+ 		ts_die "unable to run flock"
+ 	fi
+ 	# the lock should be established when flock has a child
+-	timeout 1s bash -c "while ! pgrep -P $pid >/dev/null; do sleep 0.1 ;done=
" \
++	timeout 30s bash -c "while ! pgrep -P $pid >/dev/null; do sleep 0.1 ;don=
e" \
+ 		|| ts_die "timeout waiting for flock child"
+=20
+ 	ts_init_subtest "${subtest_prefix}non-block"
+--
+2.43.0
--=20
2.43.0


