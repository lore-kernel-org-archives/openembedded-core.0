Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18E7CC6B2A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:39:16 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15337.1791988748056411672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=rakFsRHY;
 spf=pass (domain: est.tech, ip: 52.101.70.53, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeZQ2OPu0dAywj0SrKuQN3Trc5KroXIFAjW4F2M3dGxGioCzfoGqBWmQ6pk7srHuBo2domNe96YeE0uhdIIB3OVuvunyCoJQqEY6voPCGOeAL/0w+YwBLMNtru4oAwq7uy3U44aNFeCVe6OKogLgz+cZdo9x7Y69pO1znNkIaDMV9WLZv0knT95UFsOjh1O/qs4hS1XLhaCi4hICX7t5+mxmMmBi79Ry1NP4aKlz/xkRZBgaLqX6niUGTsOxS+jhGpHEdEfbjN+aIg/l1ZZ7gpt7r4KOsDPoGXa0Qz/XQ0BaB9eVo8gglpwUbxXjv+nCFUWLsyOOTQlqQfOfBDuzGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5a6wgmYxO1aBeckioTV1DZCwK+Re+GgRIdMCKWTouEI=;
 b=fvbWUjX14+PN0Yj5b27OufgVkser7NudWa3Cro0YN0TFP9WCczQD3cqCbsRtzMeBbzbKn0lncqBuMRon+hHI726+vH2Jw+s0qbPGrpJjaPOdqm0Nc3yi8lfoaMNLHvx8Uh6tiY2FTkQ37wPpQojwUscty7dku8GzkVvhI4vtbDtlbodXDndepBKDKUn8IzaTJmlbyWXWySl/bBe79p2xAu3OA6cr4Fxh4GFfNGwQik34HOhCNjxoqPGzubwroZyskYhwvvDltz/aU9BTg4/SpeuVjzHRjwYsAjNtJB2L+fLSN4s+qqTHYq8M0Pk8op+UiiF1dhuSZ8RYYgJACaHOCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5a6wgmYxO1aBeckioTV1DZCwK+Re+GgRIdMCKWTouEI=;
 b=rakFsRHY79sD9BGXU8F+XN73eAdBoi+k7yOOBCBqaPhSJY+XM+fffPpBIVok8QNRO/FSEPjSV61Fvr6LSb1qUurmB3cNVtEUTvfJP0MZv9d4+jMW7MQpZWS6M9fOsbhVJZTfuvJd88whsiW1qs5X9W2nSHwoo2EfULCv5BXRg1GNg8SI3WLbJLXfUZc41Q2msJLjA7Z4hTT/wOxlmAtFRwyZqIog9MndasG0iNDtGn7SBMuH8JfpQROeHnBXPgmgFUnGb9q/VcMmxERNzF5DXEQXj7BCANy789HU5mG1OOU0N5w8Tj9A+KwDYqhbV2HhpsIBMRMMD6mQ/jKaT1QfYQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by BESP189MB036075.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:138::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:39:05 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:39:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v3 4/7] libpcap: Fix CVE-2026-6244
Date: Wed, 14 Oct 2026 16:38:53 +0200
Message-ID: <20261014143856.74426-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
References: <20261014143856.74426-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P194CA0022.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::26) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|BESP189MB036075:EE_
X-MS-Office365-Filtering-Correlation-Id: 5850b5f6-63cb-4c9d-aca0-08df2a00e5f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|12006099003|18002099003|22082099003|10067099003|13003099007|11063799006|260925022911599003|260925021311599003|260925021911599003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	kf7HZPaD5ueQ91QqR0LJhcyY9ywi7ugSRg6pYKUKgy7NYq9XNj6YRrTQdxLowEhebbbNObtFO3Sfo6C7l8Hux4L1s3SAY6KfT/rmizqCjyUcFXPJilQgpGXiFGBzXn6FRrRlC5fMR5fuHHVv2WsROb+JoURrbo4fXV59lvI9Yf7raCDM2JurX/OqQ6XS1aTZRFiEvMlxASKye9/+3wTCRu3P6oI6/StOS1Ji9jph/zys2eRph3w6p75fzmL1OFhZKIuZlN4Ck74OlDkcy8mIdP22I/eL/7CaIIk3JZcILgtfmqtvUCWzWj5xCddQ37J9+gHIxW49cTKETsTAW+Q3D6UhFkX0t7uUGtZonBOjArsmLMucC+MURD37Lt/040blkKaJTFhDg8lRLK+6ta3NEaA672/JuFXz5fzHbIqP4WLDo6J9B2JvTABCsQwMS7I7b+7QK2sLwmM351nNKLr9WFDKdgQCfrgem4ycOmm+foIqIuJqlrLGmvRQxjDBdOu0qv3MCSjtx8sXD8UTfhvBdQ/WsQTvQvTh4Pqac6KlPa7UuN+f5aJU3VZRcGM00/Ojh7ScIXkZXFuEXliwLnJT6C+pZ98TxK6VzyfTZhDIb2b5T3pkjBSFugprcRM8enRY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(12006099003)(18002099003)(22082099003)(10067099003)(13003099007)(11063799006)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qx7M0LEqbKnecrDGsOFP04McmowHjK412Iqpl9tdmLx4xLqpmYAUGANvdZkq?=
 =?us-ascii?Q?EaWF+nkgud5aP0PQTOH7wixuVUBCITxpjdPaPj7Hp7zh6g1185uhvS9MvOqi?=
 =?us-ascii?Q?zB/UGOZVmc+EsBQcTh1D1nw/6rA8jRV7K6MSTzZMz6lon7e7kxLIfhfn8PUA?=
 =?us-ascii?Q?FMB14vH2AZbtLEayXR0JyU18HfeaTVf5SHDevG6pWC5SoU3gHe2sbjsvLW/o?=
 =?us-ascii?Q?TRHq0l38JhaOoWVPY2uDkMML7iqFHown029jaz1Fm0zV9XVUcJ4cfdKUBC8f?=
 =?us-ascii?Q?kTygJQR0MfaX5YhGDMZCNwBcvPv0skS6GyEt4vbyH1E1gpsmOuyfgmfO72Ih?=
 =?us-ascii?Q?O101tcVFVDmGJI9dReB4MQi9/35uIwzftX5AQaPI4Qqsxwvhii/CItjyUKRN?=
 =?us-ascii?Q?XKweKCTNgdjnBBciFL5/obhPZACiWYtuhtdNNQbR9rDRK3BtYx6lZU6Napl7?=
 =?us-ascii?Q?UBR4iVP5AfPWV6CTUnLlD4U1b18CT4THm5xPFvGUGjwPINcLzKrB8aeJpXCm?=
 =?us-ascii?Q?DadqJFn5aAYt+qZRDXdizdflCCOyzWt9RWHmuZMTHoOGVOc7HjmDm5ruIgiD?=
 =?us-ascii?Q?x7cTpFmhMCQ3aeBIl+dhyYuvh7xnIhdyeoNIvMob8Emr1jtpPBLmtu60mSZ/?=
 =?us-ascii?Q?RYZO9fYQbz0sIoPbsIIgTo/5B2pVlcUPdEewBhBPsqEuvW3/VE8Idybqbe+G?=
 =?us-ascii?Q?b4guEqU0iO9OIkvuGCbuVvI+yQlQBKmmAL8zx8GoBId1x+UQ+NOfEPVqof5o?=
 =?us-ascii?Q?9NqhUN3vrothLec9goGDCOUJrLoaay+xS+8a4b6VD5l9XBZnviIr6wmrC5t0?=
 =?us-ascii?Q?O7AEA4wcSTX9qGMshUXb7p5bS0FM0ASczBWzL5j1e6M7KESeul6p4QSr9zdV?=
 =?us-ascii?Q?ivmAadiMMv3wR++AUpLjEzCV0AV5e9KzuSse3Mr0HSS3mQygWMjkTFXjzjtJ?=
 =?us-ascii?Q?uv/thDCi5MdpDEmNTpE75scXsbVfCSdy6fXRch3QZUsEQlB5bTW6H8VYV8tC?=
 =?us-ascii?Q?+ZANvAoaNr79esJSu/shDZqemyaAhBN+ZkzlKpwsMnFNxlQUAtXonuTgW1Jc?=
 =?us-ascii?Q?aF3DNLbV+5ad73bTK8bcDUGwQZ2WW1N5Qs3F8LlBWm/+LSmMsCsCSiKjpi3d?=
 =?us-ascii?Q?qdPX2qJEa9gTFuJRE5enLBfemCRdrgd+HFjS6F8oxRdF14FRY3XVQgKzciAS?=
 =?us-ascii?Q?Mv/QsE+4m0gDQJ+ET7a5e9poGtEoANxPbQE1TZOVWDzEn2kowc/Z8hFR6Gme?=
 =?us-ascii?Q?mNooBhxy5oL5FIegcXww8tbmd2x5r131MJ2Os2aV/P022zbijyLO4Fd/Y9S5?=
 =?us-ascii?Q?fW4WLTrURIqgvj6ZgHYxOjWqq3/FK9Z/7TnYxHspVCfHOY07U+yOAa+IWaXv?=
 =?us-ascii?Q?JMeRxfaQZdoEsR04c9eM7fbO4Nym30Y6sB0v08aDD5BXpSubzsYNKP2r3AR7?=
 =?us-ascii?Q?EZivMVVFgA9YKyItIOwl0xxk4qh9TMdSFFsevTIsLTgaeuYM6JLbTCUFzO7i?=
 =?us-ascii?Q?0LTEknONrB/Gy9dc0CCwKTy9ybo5jN9yKX9xFczJcyRso2c/t6G920rcynE3?=
 =?us-ascii?Q?Gp2Mjtt7KHyCPQAqJL9tK0ACVVmTspexHe7tGqMuxGkniB9yR+NQx6ezwLV6?=
 =?us-ascii?Q?NR9kmdblRCArxdI4BhsjhSPGq1goH3KgSGnVEEtJaBhINKxWRrWnxNJNHm0m?=
 =?us-ascii?Q?GtTwtCEiWX648VU+1ZYWYk/2cABDjgre6cX8MJrVFUKWh3G6Hmn9/j0n8Et1?=
 =?us-ascii?Q?PwZCQQ2+Qg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5850b5f6-63cb-4c9d-aca0-08df2a00e5f3
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:39:05.7382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mfm1k1BqsFKGsASPT0UAABioA0yihCl4WUMNhxUk8U5+h/16x52zRiaYgz0MZ1aGRgNAZr6kOh35m9N+odd5ZBDizOR5jDjCcaGzgPJOQLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB036075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247770

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6244
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/98bb92=
1b141aa642faedbf2ac510541c76499a19

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/04-CVE-2026-6244.patch    | 49 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6=
244.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
new file mode 100644
index 0000000000..5215b12ffb
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
@@ -0,0 +1,49 @@
+From 98bb921b141aa642faedbf2ac510541c76499a19 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:34:21 +0100
+Subject: [PATCH] CVE-2026-6244: Avoid division by zero via pcap_offline_fi=
lter().
+
+The current revision of pcapint_filter_with_aux_data() for "div x" and
+"mod x" correctly rejects the packet if X is zero, but for "div #k" and
+"mod #k" it assumes that k is never zero.  This holds for programs that
+have been generated or validated by libpcap.
+
+However, this does not necessarily hold for programs that come from an
+external source via pcap_offline_filter() or [deprecated] bpf_filter()
+and have not been explicitly validated.  If the interpreter executes
+such a program, it can attempt a division by zero, which will typically
+terminate the process via SIGFPE.
+
+To fix this problem, in pcapint_filter_with_aux_data() treat "div #k"
+and "mod #k" the same way as "div x" and "mod x".
+
+(backported from commit 0b2b1ad4a1796513613ff68e9dc09049cc8e0af4)
+
+(cherry picked from commit 98bb921b141aa642faedbf2ac510541c76499a19)
+
+Notes on backporting to 1.10.4:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/98bb921b141aa642faedbf2ac510541c76499a19]
+CVE: CVE-2026-6244
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 497b1586..df92c433 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -422,10 +422,14 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			continue;
+=20
+ 		case BPF_ALU|BPF_DIV|BPF_K:
++			if (pc->k =3D=3D 0)
++				return 0;
+ 			A /=3D pc->k;
+ 			continue;
+=20
+ 		case BPF_ALU|BPF_MOD|BPF_K:
++			if (pc->k =3D=3D 0)
++				return 0;
+ 			A %=3D pc->k;
+ 			continue;
+=20
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.4.bb
index 5b97c14e85..d23a018a95 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz=
 \
            file://01-CVE-2026-0799.patch \
            file://02-CVE-2026-31912.patch \
            file://03-CVE-2026-31911.patch \
+           file://04-CVE-2026-6244.patch \
           "
=20
 SRC_URI[sha256sum] =3D "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159=
d20e47160ebe5f"

