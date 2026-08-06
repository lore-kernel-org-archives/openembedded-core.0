Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F08AC56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:17:45 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16968.1786015057221569634
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=I4iL0xxO;
 spf=pass (domain: ericsson.com, ip: 52.101.70.7, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCNvYzbzJUnO4GZ0Xel+GOwbGFN81aHXaamfCsJ0d7/OAEE+4xndhizB/xf93wPj5hqc2jLOlZ/SKXT5LEyNZyT/ziMXJiR/63F31uoVLvAJgC8YrevQvCqAd+Gki7FXlsGVQIifcpCCCHFdzYzAtFXpieWyd9s8Lxp3mDbuN9zV+DR+pukg6YuoWhn+Z5G66hREDuVe64hKHvsxxUTty/a6PstO+bwFuDs0BHLxoDwr47meCBMIW2Nx1gJXYx+vEzTkTXely/wLFVlMYcNK8sMUKYFOeIS2UBNkQC6+xDGR2e8zi1VfMnz3cCc0XXbZKC0fS9VrZfSBPdQfxWIJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jeab2Krx12195TMRJkoRLFjKIs1ba7PZj1efbA6M8o=;
 b=C/jHnPQ+k6hSqypwsHzU37LrRq2oP+oaB8KS6T39G2kNh1XW45ZjoWnVnr1zcfeFG6qekd+NGlRTzFpIlhpLTBNj5Glu/K/qc4dc+OdgCKpPh3/F7DxSTYCcvPEpHyJuLHg75PHDqmkuuEzRUwCtMlMlnsOZ3AnKR71WD71Az0QWJH+1swWVpJF53aZkui4HEFwYBttUqcIf9XcDJPJ/G+of0cIUIG5dzxBlnVbkF+QBlOhhHabhtyNLM9xs6xReYJzLdtiBMl/1PyfsnSD6xjmaIXYyOdTeFRf8Ufh9I1LDRcQo9cKtwJ5Dtz1VoB51KFnkRMdV8ilYnhUcZUWJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jeab2Krx12195TMRJkoRLFjKIs1ba7PZj1efbA6M8o=;
 b=I4iL0xxOEZ5skqrM9EfohbqYgUHdwgsvUs+s4b2S8Jg6jJB5Sy7e4ZeZvnUzGMXcEw+1KKYN0KuCkiOu+6xv7+SfqXPmYJHdP1rz7grMgmAOn/m75R6nG9I5O6aMfwDWZuX8+RqCl7qH/nzwa842LnqE6uKrwayo5kAzk2tjv2DaZnSyzp+GA678Y0HrDOSJqJn2kYuoJuVg1hNf77lOK4Xmna4TWy7dJLOwgLGm+6IPKwtbKKNE4YHm+Y8s8dx3vhTQrcX6zoE8sxd7Ib1HezH8RShCrktStLlVCzMvskZ8TprdicPxQPoeS86YkGMc2Ad16Ipcyu+Oj7/eiTvXnQ==
Received: from AM0PR10CA0037.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::17)
 by DB8PR07MB6329.eurprd07.prod.outlook.com (2603:10a6:10:137::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.8; Thu, 6 Aug 2026
 11:17:31 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:20b:150:cafe::45) by AM0PR10CA0037.outlook.office365.com
 (2603:10a6:20b:150::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 11:17:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 11:17:31 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 6 Aug 2026 13:17:30 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 1D7B74020B6B;
	Thu,  6 Aug 2026 13:17:30 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id D8E09700DBB0; Thu,  6 Aug 2026 13:17:29 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <Openembedded-core@lists.openembedded.org>
CC: <Ross.Burton@arm.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] systemd: restore libdw/libelf to elfutils PACKAGECONFIG RRECOMMENDS
Date: Thu, 6 Aug 2026 13:17:17 +0200
Message-ID: <20260806111717.4060900-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|DB8PR07MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: be4c07dd-58cf-4937-dbea-08def3ac4eb5
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|10067099003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	vZ39basFYOz9sJothH66JAOuXTVHh8hci6iIufOQH0ai8v5a0s1BrPc7YR01xszjUX0Gt1D0GYVfY4t5YIj17y5VWiqj9/2IyH8lYBI+xwrIeReZAYNy26DP6jeSbXZdMpMqmNOaspW6UOaSN97IHfe7CXCzLdsBm+7xkbmVhIrhB+dJUw1QJWsQ/Iqg4mIDgegXuOeFS8q+MhQOGX67NY6Si1d1U28fQTBnU3Jzl7dr3rZqTv5zME2i+rxXZ57oruAgHjk0xB86fn1zT887XuBLcu/Pda0ErrRM5KzURiw7QV/XO1TyfcKrd0h2kVwBKTdsMCEN+b8Pn+IwvVv4qydJxyokDcCeK7RGIiLIDlmJ2CWik5j5d9O+avN9YF4JMYAmlz0Lp9UoociAc5lapfRhKzteEtj49wLown45WcYL8HQ4UJ3zhTEznww73zZlMj1dZYtSIkgdsGMjQNPg/8MIaNqba3IaOyqnFnEsIJJKtXj5Ad1aQx2r2sx9zi5bnJoukPeJgnVzSJkEbjj3ZDijba0Ngd4OxJpANR5JcbpeyfSQcmJYY9XmHEbE7Ec7mOV7Jare1oMlEoqYHDOZLtfcnRM7QzfNSBSOweYCrCLACsOZ6qs99/zWV9JT4iWOxklQSwE0nsa6qqc9E+Ni4zgy5k55HxnMhotTKYfTDDfMv8oSBd8ZoY+yhqtxpZXmYXGqcfQJI00mDoAE0XIerg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	o+fr5f7UF+l4oc4NWu/gi62ZhQUedjSaF2tsGsFt+yIxI4QOBnKycZofWVfDZmrzESNLlqtDXUtkge/bJa4h3opXATzHNWmimb1FrD0yJoo6Yi/7RwDfOYX1kcyn/Cph75rMo6CUvd1s1xzNyCWBYPjHv+jIviRcujlSK6KXq9OFU1sRk09oVlpUBwB6Rh5yOmJhnLE2cPqkBAinGJu8zVDtX64K0OWVZ0QHKATd0j+TxaBr2oIl8Gnulw+veaxIq6fy3dECP9oNJgQZZl+u5CpsxOL6K2NRbdWfSFgsogbZhbD0NLzVLSPt53jJtS8wPHoBUVW5Oxj7TTS2lzbWCWPofm0HAsdhJPgDm2WvT+m0XwEtPPkVdgipItY2ItzZQiuim7v3ICJORuyW9O8vbbFtiLGjAbfqc4ax6FuAu5RbzEXd8i65J8FzlytFJpgM
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:17:31.2853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be4c07dd-58cf-4937-dbea-08def3ac4eb5
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR07MB6329
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 11:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242928

From: Daniel Turull <daniel.turull@ericsson.com>

systemd-coredump dlopen()s libdw to symbolicate backtraces. These
libraries are marked as "suggested" in libsystemd-shared's .note.dlopen
metadata, causing them to land in RSUGGESTS rather than RRECOMMENDS.
RSUGGESTS packages are not installed into the rootfs, breaking
symbolication and causing test_systemd_coredump_minidebuginfo to fail.

Restore explicit RRECOMMENDS for libdw and libelf when elfutils
PACKAGECONFIG is enabled to ensure backtrace symbolication works.

Fixes regression from bb9c619174 ("systemd: drop redundant runtime
dependencies").

To recreate the issue in qemux86-64:

DISTRO_FEATURES:append =3D "minidebuginfo"
TEST_SUITES =3D "ping ssh systemd"

bitbake core-image-minimal
bitbake core-image-minimal -c testimage

Before:

RESULTS - systemd.SystemdServiceTests.test_systemd_coredump_minidebuginfo: =
FAILED (2.71s)

After:

RESULTS - systemd.SystemdServiceTests.test_systemd_coredump_minidebuginfo: =
PASSED (2.71s)

AI-Generated: Kiro with Claude Opus 5

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
builds on top of the systemd: update to 261.2
---
 meta/recipes-core/systemd/systemd_261.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_261.2.bb b/meta/recipes-core=
/systemd/systemd_261.2.bb
index b295a69548..56c33ef157 100644
--- a/meta/recipes-core/systemd/systemd_261.2.bb
+++ b/meta/recipes-core/systemd/systemd_261.2.bb
@@ -126,7 +126,11 @@ PACKAGECONFIG[default-compression-lz4] =3D "-Dlz4=3Dtr=
ue -Ddefault-compression=3Dlz4,,
 PACKAGECONFIG[default-compression-xz] =3D "-Dxz=3Dtrue -Ddefault-compressi=
on=3Dxz,,xz"
 PACKAGECONFIG[default-compression-zstd] =3D "-Dzstd=3Dtrue -Ddefault-compr=
ession=3Dzstd,,zstd"
 PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Denabled,-Defi=3Dfalse =
-Dbootloader=3Ddisabled,python3-pyelftools-native"
-PACKAGECONFIG[elfutils] =3D "-Delfutils=3Denabled,-Delfutils=3Ddisabled,el=
futils"
+# libdw/libelf are dlopen()ed, but upstream marks them as "suggested" in t=
he
+# .note.dlopen metadata so they end up in RSUGGESTS, which is not installe=
d.
+# systemd-coredump cannot symbolicate backtraces without libdw, so promote
+# these to RRECOMMENDS explicitly.
+PACKAGECONFIG[elfutils] =3D "-Delfutils=3Denabled,-Delfutils=3Ddisabled,el=
futils,,libdw libelf"
 PACKAGECONFIG[fido] =3D "-Dlibfido2=3Denabled,-Dlibfido2=3Ddisabled,libfid=
o2-initial"
 PACKAGECONFIG[firstboot] =3D "-Dfirstboot=3Dtrue,-Dfirstboot=3Dfalse"
 PACKAGECONFIG[repart] =3D "-Drepart=3Denabled,-Drepart=3Ddisabled"

