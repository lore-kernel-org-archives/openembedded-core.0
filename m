Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FA4C624DB
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:45 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9239.1788343178702289721
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=OefysXhT;
 spf=pass (domain: ericsson.com, ip: 52.101.83.52, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVaGK2j1t6miMKtoAYysV7sXC13JY75SJiL60C4cirdzfbeQbK3JumGoKzw3kPIo/pUmkAktfbUm5vU2wNmFdHhA8id2t/rwks2xiaQH8lGZEB9VQnltdhFD/wnmCl5qwumVGPwcYCbjjoeK+LIhTe9wRDGBwaKnIw7mAYm21Mdw+NoLPge8wg7PaWHNfGbcyR/uIMHQYKTGAd038/p5DIOjMfPF3AgoeMHS/DUJO9T4dYVLA6BPdPmnauf/WNBPzL+nuNISkUVlY07TyNg0m3v3ZSQY9eFbVnuHzk6jHHZmBCqPhEC2BqOfsiUs0kCL/2hA34opKCAjuSq1eVCy0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/lk57ki/VQASwlKITZ6KJiWjrZCxLTjhrrtsUGQ+yQ=;
 b=EtKmzz3kF7uctno/daoIo9aTZ1l7ga8zHqQdfJiMES6fnUhOA7y2aB+wtnrubP2Pjg+gLiFGKcfioXFpziTmHS5EGTFV5LG6z4AGYP3k/7naEmnaOr8vcFSM+9LNdnogaA4L0im2WDcSH9e9Wf7jANfPs4bABemy/szhTGVUbm6pswqj+HTCN3POuByVR4dspa+zNbHO108VXF8EV0+fw1abOtZZzGY6pvbL09vt1DGfEVDWwu9YQ0Y0ljYbUFtp0tUkL5veVWQZWIXNl8f+AFivuSyUE16TPXHyBbfk1ion3W8to72RZpuiKIbEyzOGWfaqG0vJijBQ7S2iF2zy6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/lk57ki/VQASwlKITZ6KJiWjrZCxLTjhrrtsUGQ+yQ=;
 b=OefysXhT1H61I+leS0HfeysqyE1WwbfZJqh3LQMee6lXfJl0h5DY0suvwX2H2bvHkofiCN/UdN0/52LACppYCx1nR8DJFHy9dDGqXDyC6yoJWqVy4hh5LmhxCGSyq94bKmpzw/xpjrn8cOQDDrv3w2etFMBystkfNemapWPHq9Fh/BPm7jJL98hPT27HzNtLL0aw21JxXDGnEpM48V90EsIIsmX2MMh9FuMqwbw9Nz9regK/bBlYS7ImEYOvpnGirda5wAweTWaHelNPlE3Wek+6oknqBxTd7d7vzr8uuzZulqM+TB3B0mnv+Li8Ut3MMx4gVCbYfppFqlZoybsHMA==
Received: from AS9PR06CA0763.eurprd06.prod.outlook.com (2603:10a6:20b:484::17)
 by AS8PR07MB7863.eurprd07.prod.outlook.com (2603:10a6:20b:351::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:34 +0000
Received: from AMS0EPF00000566.eurprd02.prod.outlook.com
 (2603:10a6:20b:484:cafe::66) by AS9PR06CA0763.outlook.office365.com
 (2603:10a6:20b:484::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 09:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF00000566.mail.protection.outlook.com (10.167.242.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:34 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:34 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 118F24020AB2;
	Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 5A957700DF7B; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 08/20] git: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:08 +0200
Message-ID: <20260902095920.2840293-9-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000566:EE_|AS8PR07MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: e27f3c09-48f2-4c8c-cbd0-08df08d8e448
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|10067099003|6133799003|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	EcbDhcF9p67wQwmzEO3fWFTbtnhGojIhUA8x3TOdP0PzxhgzfDO1ZvFzPGxQN4kv/pax7bnY172l8S830yqQEjaoYILg1bsb9tmm2uqbytH2nRI4+SQ4JTVbrktZQ5l66NL/YCfmuLDGIINXSAvTip/uG+/epw3su877TpLjdbnRR2IbOXGlzyIBU9FdA4AfvB1npIZKKYtKYqcJP4Vp9XYic0HjUMcrJodPT4wA+N0ya4f47hj5IIMW+l4/BpQWgUgy+UTh+D7XO0KOJ0Xjxe8Y/inmMk6mAEEzLpcsRW+RcRInSpZue9G7J0IJBtl8gJjA4bb+Jq10RsrcJJwTecjDJBpYtsT8gvCaVwr59ESAmTjLfLaHt1M7baoiqws3+S2pH0kLN/TkChGqS4FurqkNTxRx49Ihhd4FVuSruk9MWzwFLreDY9GPGxMX6jDzrrTNQb4j3M7bcA+EVyaVc89zgq293xnomyqooKmdX4S3q6n0SQ56GgGNdbxw9uS6+o4agCjP+B1iqUmzdSKak+GxrwaUe29044V0vW2NEx3mRuIwClBbfhqKUY9FEwxFfyumWAya3wjhbuap/aWDOOniZYnmlh5z9C0ehjDsrCrteK0Gnb1iS+1M4m/Q7qLBm5AMfyUuTuMqc2zZh4y3oXG5z8+a50RzkIEQAbuBZHk=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(6133799003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tNbN8vXJOjrIr9yYwSo25flf3JeN+bzsTR+r+U+rtBTKRs7ajla54ODiYLjoLILTfX3KQJMO0W1NOnbcRwZSjP4cT4WG/MUjhNVMwvteGK7RCQTlGpds/fJVdrq80aJVp9qmrozWVwHDlJEEJ1v1MC5B3NYp3fvS5mq8L0f3afyGFXPRr+i/57ryfTVZvUPo7v5vgiIRpOzdMHOnOGn8ebsH/adFTuSzH4g54DDEgUuNkzTemZsuaKJ8SLatmuU89Isgg99EGLdI+q546h1Vity2RHLE722sPwU8Eq/HS5JE9LPx4tOjYfiwtnZ9kMLoPWm2/dkz5AFr6IctyzllKpNSfHn04DkKiobQCqlfePWzsVKFRYs7MoAXSxfHfqbPRSYv+8cxZXZ98eRMhgqOG3cbcNievvO98o+JeMlTUTiGyDlXvg7HWr8snJuRpLVB
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:34.5207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e27f3c09-48f2-4c8c-cbd0-08df08d8e448
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000566.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7863
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244910

From: Daniel Turull <daniel.turull@ericsson.com>

Git's maintainer documentation defines the version scheme explicitly:
vX.Y.0 are feature releases carrying bugfixes and enhancements in any
area, while vX.Y.Z (Z>0) maintenance releases "contain only bugfixes for
the corresponding vX.Y.0 feature release and earlier maintenance
releases". So upgrades within a major.minor are stable point upgrades per
the OE-Core stable release policy (ref-manual, "Stable Point Release
Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/git/git/blob/v2.55.0/Documentation/howto/maintain-git.=
adoc#L47

Checked recent maintenance releases for feature creep:

  2.44.4 (May 28 2025): CVE fixes only, seven of them, merged up from the
  fixes that appeared in v2.43.7. The release notes contain nothing else.
  2.35.7 (Feb 06 2023): four fixes -- two libcurl portability fixes, and
  two symlink-escape fixes in apply and clone back-merged from older
  maintenance lines.

No 2.55.x point release exists yet, 2.55.0 being the current tip, so this
relies on the documented policy plus the historical pattern above rather
than a same-series point release. The ref-manual admits that basis: a
recipe may qualify on clear historical evidence that a class of bump is
bugfix-only (ref-manual, "Criteria for Qualifying Upstreams").

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 2.35.2 -> 2.35.7,
five point bumps, and scarthgap 2.44.0 -> 2.44.4, three point bumps.
wrynose ships 2.53.0 as its initial version with no bump yet.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Adapted for wrynose: applied to git_2.53.0.bb (upstream: git_2.55.0.bb)
(cherry picked from commit 4300d9a707ee6ae2012ee03b4f4efae38521863c)
---
 meta/recipes-devtools/git/git_2.53.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.53.0.bb b/meta/recipes-devtool=
s/git/git_2.53.0.bb
index 8d71905f41..5244891113 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.53.0.bb
@@ -48,6 +48,10 @@ EXTRA_OECONF:append:class-native =3D " --with-gitconfig=
=3D/etc/gitconfig "
 # Needs brokensep as this doesn't use automake
 inherit autotools-brokensep perlnative bash-completion manpages
=20
+# Git's maintainer docs define vX.Y.Z (Z>0) maintenance releases as
+# bugfix-only, scoped to the corresponding vX.Y.0 feature release.
+inherit upstream-stable-release-point
+
 EXTRA_OEMAKE =3D "NO_PYTHON=3D1 CFLAGS=3D'${CFLAGS}' LDFLAGS=3D'${LDFLAGS}=
'"
 EXTRA_OEMAKE +=3D "'PERL_PATH=3D/usr/bin/env perl'"
 EXTRA_OEMAKE +=3D "COMPUTE_HEADER_DEPENDENCIES=3Dno"

