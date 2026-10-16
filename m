Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB6CCC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 10:56:27 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19192.1792148183785411592
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 03:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=hzooRZLK;
 spf=pass (domain: ericsson.com, ip: 52.101.70.55, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SN7tRscKTIA/GN5vKP4Qk/al/hnacHwZ1XS6j4vTRPeHb0dQLPg07bTAmE9RlN53502qHy90y3Svi9XvndfAA3eVKYo7/yqNth14Q7t11rQmM1Rs7TqZVNqCaJBfdcYpCvTInVU49dXS/UeCEUo8tkO8Yfc09r1UOnu7GdAm5Na29ylKY5+Ecn1Wkt0Lw75pwaMQzcZisvIfD6rau/QnLMzmeLSbe9xE7XFzCAXNeyMS6vmgdYqIke4d1/MAb/frcSK31rvrTNHyJAjw+4M3IfJODIfCF37M0r5PCKaDcOXyFso1ngHqkWxsTIpMLOnKOw5afuGiT7AaA8YCMHWtxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KetlgGdBKmizLcp9QHbJLZLDlXTDGdb8IA67do7WU1s=;
 b=SHv1jliS7BrJl1Ey3w9bo2VzHu7Zt7pY4mQPEv4lL+PFvwACkORTXZeJfDnq5uf0t2TwCp9JafsytroaN/rlXjfP5rvYQfiI2im6Z9TS5WbeSxF3CVYl+j0DyzbFfIU8ASxEMqXEa7KxfncHX88+CGybNIa/ixLzodKRCbHWVmcxF/vD/nC/+JwG+JWY3xEbAGSnVD3XzC8hnUpBnyRuGl3EZVBp2e2ZdykRByCVUyenzFp2GdHFAaTISk+vke8KEqh9+ACSHRrRWAoueVeWg0yF9GRcaS+ys+c2Ut2efd7lQ+AYD5i6mPEaEE9szaz4Eds30ka29vNnHoB1yufkwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KetlgGdBKmizLcp9QHbJLZLDlXTDGdb8IA67do7WU1s=;
 b=hzooRZLK3XHbcPlijE3hiTDbUg5OgLaY1fZ+/RGQTF+kTbBADlRSlZvfR3+x50XhDXM9/tgHA6o+mcMhW9PwRiKC/fDAOi+64K+Fk+CZ88B1Fuz3his40CL/7EnLdMi+INqbNb/LnYeKW4JM9vt/ICqPn/UGVnfi0ajo8MDkH7ulNDJq7fOy5ATP2we8VJPYEyXinPvwUIdNPewfT0ov6octiwkPsoxUX3+gUCGcM/IBuTKVPKiifr8Us4xC6fErWrilkLPMOezDvxqYFrEeE5idbDMlO/ttTlkv+VMiMyj+Cr15aMgQeEMcPT5jFTeVoESF5t/eFjgaYLDNYoAG/w==
Received: from AS4P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::6)
 by AS2PR07MB9279.eurprd07.prod.outlook.com (2603:10a6:20b:60d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 10:56:17 +0000
Received: from CPH1EPF00000530.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::87) by AS4P192CA0020.outlook.office365.com
 (2603:10a6:20b:5e1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 10:56:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 CPH1EPF00000530.mail.protection.outlook.com (10.167.241.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 10:56:17 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 16 Oct 2026 12:56:16 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 3DB0C4020B46;
	Fri, 16 Oct 2026 12:56:16 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 12EB0700E7CC; Fri, 16 Oct 2026 12:56:16 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v6 1/3] oe/reproducible: exclude __CACHED_SOURCE_DATE_EPOCH from task hash
Date: Fri, 16 Oct 2026 12:56:09 +0200
Message-ID: <20261016105611.330514-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016105611.330514-1-daniel.turull@ericsson.com>
References: <20261016105611.330514-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000530:EE_|AS2PR07MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 71bdef30-e934-4321-d361-08df2b741a90
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	QyK3lTNVHskogVnMFlE29VQp2hJxr0bjmesYsFGsC+WmFaEw6TJYFSLdUx1kheCt3l5AtudLwKhEmzKcBRne7qpzJPhbnbaKWuO/Wjx396+waGcyiVqW0wdzOnO31wf+J258teNqsuikNmOx1LgcZ4tzDmat34swcpswJAWDezGl/LLuyveowUnQ929T0g58PN/6SzoEsz0ZD1wR17f/aypnMm3E+EsXXpLx+7j2IQcd5BMaY+cHSDvv8Ll5ZkEg1MqkzHPsxh5jGSsuZYRZfZs4gvbVp8t0OoAPZjzx2ecG2V0ngEv0lk7PgdhwKR30jYS3zubv8ajtZ/dplHQI0QO/UY3VVZDTrnxloXRc0sGnQMOeJt3PiZt3cJqd5apX7wn9tchVTmF8cI+Hku5QxN9VpRF4w9wHVKGdKywMA0FKKojoEQWD4X4kZB0W6FpQR9xL6Pp6dRXwwIzrQLc55BsURUjrcPBKUb/Mlam4ctLEnEMoFMLt8CtQLX4xFz0Wz81XjJW5kqrT7ifIl8AsDbclqRL7Z4b77XgyhEdBsy9ozDSj6HlU1c60xfOCbmye+ntTIer7H0x+C7z6+xGjv5voYZHgUQ5Ku38oPWiv3Mhp4hdjPEhYjB5bqpFCL+918p0xIeN0rFVA7PuowWkOPI2FiTDKpJ7rDGNCQY9jThBGGOPdg0W9k+YSY/JGHWMGu+idYYsZGZQQtAaUWKLX+g==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ljGK83pMlN50aFa5l/BP0/w1tz328FA5O3Fm177MgwzCrXqkle8WnbUa9LXKChwLKBQzoxeuXi5gJTEM7XlNqZaja6NdvSmXSs+WJDILhj/gvxxEf8d1NhrOZ9po42GzCrYSM2GnUsQmrRI5LrzbpiSKS3Qjqq7qw8UciZgGSvuAU8m8sVcodD7Kn9ioO936OSR4b1kqrHHhbi9VQ67ATAOlqZBHMBq/9wh/YfexoVyuOcbFgT20Mo37Y2w3nYfoWAYBn1HzgUvQd1pDmvIJRLKvl0ep8tu45xINFvFRxsdoj2tF1DiHGlci/Zd+uqUbRzyG8td13T2rKgZApitn/L80M9Jpxpx3IzDghTJsporM9D2wrRteBncrryy48dYLVtSx9taeg65mqN45tJvQVfuutzvjsFZ43Hwmq6kGa71KhoXxmVqYBbXja4NUWOXN
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:56:17.1340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bdef30-e934-4321-d361-08df2b741a90
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CPH1EPF00000530.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9279
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 10:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248009

From: Daniel Turull <daniel.turull@ericsson.com>

epochfile_read() memoizes its result into __CACHED_SOURCE_DATE_EPOCH
via d.setVar(), so its runtime value leaks into the basehash of any
task that calls it, causing a "metadata is not deterministic" error
once SDE_FILE is populated.

Exclude it, since it is not meaningful build metadata, using the
bb.parse.vardepsexclude decorator on the function itself.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
This should fix the selftest errors reported by Mathieu

v6: use bb.parse.vardepsexclude as requested by Richard
---
 meta/lib/oe/reproducible.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index a80376010a..d8e1dc825f 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -156,6 +156,9 @@ def get_source_date_epoch(d, sourcedir):
         fixed_source_date_epoch(d)       # Last resort
     )
=20
+# epochfile_read() memoizes into __CACHED_SOURCE_DATE_EPOCH via d.setVar()=
, so
+# its runtime value must not leak into any task's hash.
+@bb.parse.vardepsexclude("__CACHED_SOURCE_DATE_EPOCH")
 def epochfile_read(epochfile, d):
     cached, efile =3D d.getVar('__CACHED_SOURCE_DATE_EPOCH') or (None, Non=
e)
     if cached and efile =3D=3D epochfile:

