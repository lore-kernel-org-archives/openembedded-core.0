Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA0CF9D0F0
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 19:03:33 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2349.1776193411110003081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 12:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=S7WN1y80;
 spf=pass (domain: ti.com, ip: 52.101.61.3, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGJwtUgpEmbwIMQ39bNrRRyUAegJoIzA7z759GSnwgpe/d6hOwC4zeZCWo0s6O5d0h51eOCZE7Gt9U0j+Bo6iWVIL6EXNR4qJUka7lMf8guT/OH6VP78ksqM0DupKNhkkuWBI9KABdY7PR7Lo42/cU1AQ+YtEvFjKo5udmO0H6eMkfgNQefarX3vQEmxYQJCaqVJcxvS7PPGrhcgn5juxGiiv/T0ahDVfbCM6mxd2m7xQzeFOLWQE4dAEve9X2+Sm4aXBSXDYZZ+Y/An6PTooGzeqm8+49aVwqUlp2J3VayYpaeRsOeLeTfrQyhUCDpZFTzYEcEM3Qsp6wxvDp85ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqv098NLEtzgIPihm9OyJAkeW3lKnT0upWfLixjD2wo=;
 b=nrSkK1m/VH/3h8Pzq0ZmFfcQRYEVAIkDPd6Rd1VFd1LTBjTKScFJGMS6WClDgRZ+2UERAtSBufrWPoO4i4L+SpERGjrj/df62ED6GVOLpyztsb1+G+n7Zt+BvUVuR8xsVllCybljNCgQYK3Lq7/ubNYz68ka/Bikiy4beyYtWCY3g0zidiSKENXCg9biNBrUe/7iQOhaM1nP4RkfSSOfzjeFCFTYpE8bSxUbR23iYrQe+vcG6DUgIGfa9kl/6qfZ0i6W6FnjC69DUa+WnFHp68rLbYwDQ5pxSd+dQv2FrtEOvcAqPby2xZfxVpBIMxrf47IAAOgujbmZXBknuu4Maw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=navimatix.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqv098NLEtzgIPihm9OyJAkeW3lKnT0upWfLixjD2wo=;
 b=S7WN1y80MMnL16Bvc4gGFKNI+SeOjJt+Tq7ZnAXAJw4ouVCNJ5PKmdqp1CewwlRJewXSheJ9dKT0vLShJB6mw2JLoflkrScYDa1/cdGs+AOELczib/mzFdM65FO+o1zrJJEtKhfoYsuXC8rwcTTeq3rIaq0i9Des1sZswMn6R2Y=
Received: from SA9P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::25)
 by SA1PR10MB6494.namprd10.prod.outlook.com (2603:10b6:806:2b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 19:03:28 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:25:cafe::d7) by SA9P221CA0020.outlook.office365.com
 (2603:10b6:806:25::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 19:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 19:03:26 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 14:03:19 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 14:03:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Apr 2026 14:03:19 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63EJ3JjK608166;
	Tue, 14 Apr 2026 14:03:19 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
	<mathieu.dubois-briand@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, <peter.kjellerstedt@axis.com>,
	<joerg.sommer@navimatix.de>
Subject: [oe-core][PATCH] systemd: fix edit functionality with vi
Date: Tue, 14 Apr 2026 14:02:46 -0500
Message-ID: <20260414190245.2182865-2-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|SA1PR10MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: 5046cbae-ef2e-475f-856c-08de9a588252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	dSbUWJpCwWt03Owm/W6bgYfeELcpeGD4/doKiyvYhmwODHRmLGPu+LjYFAJy/7DK/uZh6MyHodML139MIm4syl8w2ts2Kc1DV0kZp7azX2B8ZJ+A7IzmMmYJB8IObkXgmzeHiXNAcUTyd7/ZsZIypngLAO2/HdTrHS5BTpXdYzonIt/mXmDRaNaNYYiCk+1aaiUVEufLoB+GHm9CCAaU3BCyNoEcvpTwDahIWmKvL73R45s0jRfqC1iwag45jg+Ch5ucAEcl4e5/F2Z2EnkLLgr6TtrIs3OLSWVKHH2okialQYZhN7uqihh82OOyvjAuMVyF7PCMnpA7jMbTZoD66VR3u6P2Sg7tK1i/oQn12ya6XoO0AkLfgJfsmxaSpOPKG47xNMCGJcMHxYLSKoFDDIUPHOGq8EN3h5jBt4hVmt1L/YeDIV3bsPOSXXnLVTufkrcjpFeGz13d5xM1rhQecZGxSoznyb8+H8gqnvBQFpTFfFFmokDWi2PfmPuCZEiz9Hr+jTThQxuQNmi+OtgITqrVSocXSykTe6wSn8x+y1XLjMByFPHJaYiDOXMQjJvesZHJSSeqISCuxJeymz1/2xJs1XDc9TcZtUWrppxLtaXtI1iSRvgBmZd9aQdnwB20/1ZPO1Yc+HeMtHjk9wkuTYxqitDj4GqPZT3amC4IcB+L/E82IggkHWsrPVAhnxC2kfhEsJKP3CSfeZAVxzmsmUhLWJdJcibBJTUJsLRa/juTiS8myIsyIO8T7YxmqY7Fn248cqgnerIwuORL+INsDQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EvsebCoH5CM3NAnHsrktg3Fp6PgDZVlrpPHZuzYI3dBI0IEnF5CHrKRzbBmbNwlXL3vQlgCSYAjlCq40NwPEDvTPy/O+scdI9TfH4HOJ0ebXVj8yQ5I3hW9HiK2HgOpi5ZRyhC4A7dmiWUKfNQo5n7p5j0k9vMBcoXjeHGBXxGKf1nG02Kzmxz9iy6qTGZ9Gp2DcfFs7VFrp48TC+XzXh3xbB5LzlhT3xm15/dYs/2zerrL2uwxbpvMl9BF1NBduE0nhDV/dHGLIJnbhXF2zguD9M1roGhe//ocF2t1MBQ6vScR7E1dskadEhnj3X0MggmCtNjyoaKQiLowl+lN3Ax1AGf8SLyaP9IndnNsvunbDD1PnvLtpYWHUXSuJiB8q/fpdEnlENkmWEHHBa12MQixketVZRhuqrDcEtb2iLgrky64UbU33t1T+4ar40Prq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 19:03:26.6958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5046cbae-ef2e-475f-856c-08de9a588252
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6494
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 19:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235172

From: Randolph Sapp <rs@ti.com>

Systemd currently expects any $EDITOR to support +LINE functionality for
jumping to a specified line in a file. This makes busybox vi misbehave a
little as it opens a file called +LINE and shows the user this file
first, as it's the last argument passed to it.

This has been submitted upstream as even IEEE Std 1003.1-2024 doesn't
dictate that the default editors need to support +LINE functionality.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...ot-assume-the-editor-can-handle-LINE.patch | 46 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_259.5.bb    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-edit-util-do-not=
-assume-the-editor-can-handle-LINE.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume=
-the-editor-can-handle-LINE.patch b/meta/recipes-core/systemd/systemd/0001-=
edit-util-do-not-assume-the-editor-can-handle-LINE.patch
new file mode 100644
index 0000000000..cbcb472201
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-edit-util-do-not-assume-the-ed=
itor-can-handle-LINE.patch
@@ -0,0 +1,46 @@
+From bc4177de928fa9c80f2cdd70fd79d07a37d7b2e2 Mon Sep 17 00:00:00 2001
+From: Randolph Sapp <rs@ti.com>
+Date: Tue, 14 Apr 2026 13:25:55 -0500
+Subject: [PATCH] edit-util: do not assume the editor can handle +LINE
+
+If we're checking $EDITOR and trying to use an arbitrary list of text
+editors we shouldn't just assume they know how to handle the +LINE
+notation for jumping to a line in the specified file.
+
+Nano and Ed can handle it, but require that the line number is given
+before the file. Vim and Neovim can take it as any positional argument
+and just assume the last file specified was the intended target. Vi
+cannot handle a line number specifier at all.
+
+There's nothing that states the $EDITOR has to take anything other than
+a list of file names. Even that isn't really written anywhere. The
+latest version of IEEE Std 1003.1-2024 does not indicate that the two
+required utilities (vi and ex) need to support this functionality.
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/41642]
+Signed-off-by: Randolph Sapp <rs@ti.com>
+---
+ src/shared/edit-util.c | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/src/shared/edit-util.c b/src/shared/edit-util.c
+index d48c36c1d5..b813c206c9 100644
+--- a/src/shared/edit-util.c
++++ b/src/shared/edit-util.c
+@@ -260,13 +260,6 @@ static int run_editor_child(const EditFileContext *co=
ntext) {
+                 }
+         }
+
+-        if (context->n_files =3D=3D 1 && context->files[0].line > 1) {
+-                /* If editing a single file only, use the +LINE syntax to=
 put cursor on the right line */
+-                r =3D strv_extendf(&args, "+%u", context->files[0].line);
+-                if (r < 0)
+-                        return log_oom();
+-        }
+-
+         FOREACH_ARRAY(i, context->files, context->n_files) {
+                 r =3D strv_extend(&args, i->temp);
+                 if (r < 0)
+--
+2.53.0
+
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_259.5.bb
index d84e38d7cd..4f443cc2d0 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -35,6 +35,7 @@ SRC_URI +=3D " \
            file://0003-Do-not-create-var-log-README.patch \
            file://0001-meson-use-libfido2_cflags-dependency.patch \
            file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_ne=
w.patch \
+           file://0001-edit-util-do-not-assume-the-editor-can-handle-LINE.=
patch \
            "
=20
 PAM_PLUGINS =3D " \
--=20
2.53.0


