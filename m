Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F75C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:57:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.72])
 by mx.groups.io with SMTP id smtpd.web11.102675.1709567861283533028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=PsMnLIMA;
 spf=pass (domain: axis.com, ip: 40.107.22.72, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WY14PupfIojcl0827wVFK9NOv/6RlWU7KUoIGfzBmHBNRqHXZ0cfPK46Jz4YcWzVykz5m5qMr2Ds2H/gi+E5xh089vkV7Gh/RXidlhIuITak93pMIgkeyxRWLYWZ7yDT+r1dZx1RB6plFo/ZYWv5oTf6cmyBJlSbxtHnVuK4jWpjh4XEylZKXrfgPhzVhOIc+mZSIuVAKNmZSehLbeBZ2Zhk4yE8zxZF8Wc6onvMWU4BA8TaKe84DOuwGdWkch1e6ROfAxSMoArwFloRhICxBoF4c3G+8GvQKf46HnYqecEmBcNCGBziSVuM6lmNAZzFm7Xi9GZmOcFG71cV1ildDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5xVx0kRtRWvSfbVOfTNR7VV2W8CLoyJql6XdgM+rmQ=;
 b=e05kR07M+QoXremHeSNDq/IRxs7eXNdeqvLCyRAZZwohoBmrppOD0i4YMGVL99/JwiLtIc3K7CVGeT/Amp4SOh3UenmrUAHIIBORFogaIERrRhBEIfpp8I/pPq1dpn8FONnyXqpnm69YkdhxR1T5oJdWxSB82XbhE31NX4ioONEg7zP9YmzTxb1u8+TSGX2ZTDWKjg1lIPUdfvx3CNUaMJpw48YG9kln/ZjFWg1LA+rzB/+dB2DRyDCvYlBvP3N+A8rE0lzAtbkPjI/DqTgtV0dg1NInNxrZmzhji2duhLw5xDJbC5vJ9yB3JuOcNcRevNhN0rHoaBlovQ5inzEf7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5xVx0kRtRWvSfbVOfTNR7VV2W8CLoyJql6XdgM+rmQ=;
 b=PsMnLIMA5oZvN5cjmr1ghp+c6bgoS0FmNvTznKI/MCb1/YmFKPdygoSBvGPaLx1pzlHBYypNw37ySDWHVuPM1HxfhsOSqyANtfx2fUsTR1ryZmm4/XqfzMM3Uwh4hvsD64n2FqRo32HmsALnhL8Jcuhm+CmJD1o+TzeIeDU/xZc=
Received: from AS8PR04CA0066.eurprd04.prod.outlook.com (2603:10a6:20b:313::11)
 by AS4PR02MB8600.eurprd02.prod.outlook.com (2603:10a6:20b:58b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 15:57:37 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:313:cafe::9a) by AS8PR04CA0066.outlook.office365.com
 (2603:10a6:20b:313::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Mon, 4 Mar 2024 15:57:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 15:57:37 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 4 Mar
 2024 16:57:37 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 4 Mar 2024 16:57:37 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 210B2159A1
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Mar 2024 16:57:37 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 424FvaNW2270017
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Mar 2024 16:57:37 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 424Fva9H2269840
	for openembedded-core@lists.openembedded.org; Mon, 4 Mar 2024 16:57:36 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] kernel-module-dirs.bbclass: Add class
Date: Mon, 4 Mar 2024 16:57:31 +0100
Message-ID: <20240304155732.2267310-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|AS4PR02MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 60c67370-cc9e-4949-cac9-08dc3c63d060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QHwIySl6tSU/P2u3bHGNBMWrrTkvqzh1hizMIBpQM8xXfRMb8oc8XLcHExikefK79HcmIiJSrzSskue1YPswng40YeO78LcsbhsdV8+adFOEwBNbP3V7OvATIYRbLbI4/8h08DojbRb6Dt+EjakEzI6ZNss82Qi1DpMY8kQi5aJeExpgHjYm9kQqbCwPhbOJPtaz216lfwg3lgNHTuZ7YfdQUqHhO5PPXka2uQpkTJF9xivEeJ9H8S7v5Lido+0mQukqLFW+T1K2i7a4+BrAzJ7U7d5NP20wzryRjZUvazOFRruqu+FojPUdJ5WN2/9w2r1Rz2fvmnB+HjNzRFUEumjy/24ELKjqJeY62j+62VBvW4DoUyQCaJpwcuDITkpfutCzgM88+toDGtwse+ZNkVAdXT65oBVr9YLnpZwmyDVlGPkrXaB1tw7t0wRTLRdGw229uA71QEU2QFcZCtRx0AUXasYo12wZgh9PoUyUZXOfNOb3cEy13saPJDB/BjINAraeewWIdVu6Dpab6Jv4zNb2YLCYSG7N1y001HQkxU1e7XoKsTbGk3QrMp/liIa2Du6uAvL8qhS2pWNEZSP+Zhx7nwbAxzkRtB4L3UZJ+TWcSQumo+ri5VTto8Nd5R0//Es0avRFugdW98MJ4PhST0+NRwVkEYHMAKLyNXFGuuyFK833rqpZZyM/JHn6yWsaWwrddYNz4PGLRb4gsXyW+JT/tRDXxidRUEYRTQqAdttxOzzfFsIQRyTvwUim0x+C
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 15:57:37.4888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c67370-cc9e-4949-cac9-08dc3c63d060
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8600
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196611

Split out the two variables modulesloaddir and modprobedir from
kernel-module-split.bbclass as they can be useful to other recipes than
kernel module recipes.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/kernel-module-dirs.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta/classes-recipe/kernel-module-dirs.bbclass

diff --git a/meta/classes-recipe/kernel-module-dirs.bbclass b/meta/classes-=
recipe/kernel-module-dirs.bbclass
new file mode 100644
index 0000000000..eecc36ab52
--- /dev/null
+++ b/meta/classes-recipe/kernel-module-dirs.bbclass
@@ -0,0 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+modulesloaddir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
${nonarch_libdir}', '${sysconfdir}', d)}/modules-load.d"
+modprobedir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${n=
onarch_base_libdir}', '${sysconfdir}', d)}/modprobe.d"

