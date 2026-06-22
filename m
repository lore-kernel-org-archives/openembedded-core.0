Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A187CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 09:34:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39275.1782120862186867944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 02:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=KnI0i0aP;
 spf=pass (domain: ericsson.com, ip: 52.101.66.7, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TG6EhdtDD7k1D5QRAEPVssIVQilnNM9XEKQTMBGQKF+koTD0Pk8kn+ZoLViQAYO1SiBUfWJzcE34/VmkvjhC05bRE0tZkArNHQLSXcfI65Pt6Eza3PJlv1m/7qDRnvwTGUEMqn8pfdb6sWJPpIgCJMhk23b9EaMBmpU9VQS64p7ZrAHZvkNV+66cFnFO1Oxp89kLWiVzjgC4XZGgsOkY1yFmI3RxRIGnHVIgWbn1d1mXVv1DDDhECEGZiF6W2eMkXRLvHZJ8C217Z/vYq3DzHkOTN74N75wNHWdlzITHey8ernEz/J1a9bn/Vt9rTJPJxryQBTK9Kvf7EGFv4dIjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgqAM9N028WVmFHOJukpc/Muv0VKnSjMFqmoDyJkdnk=;
 b=I0LvHA+fRUxOoj1dm8drB7RQHiwISj6O9Gdz7dcXZPc0Mgy0bYRdW8OTdk6fE4jCskRYZiK2kNPembkGWxOSVZjkpO2IPyLlD/u0tlGu2nPzqm8zSLhpJxJYf0jj0Gds8iBBDcaH/vPG9hahcNrusVugpstHK8OmEt+dQsqvRXFdkgw+cnOluTX9IlG6klx0otH8lHNQsYOB/1c/AhX6fzgZU/q3r/+RvHIn7cnaMCgJFunKjHysPciH7MKOsygmv/tnILyQmvXzzFdGBShxJqQLk8m8k1PrpLy4Q3IcNb4XNg9cORCS82/Em99Wj2RTD6JySv1tlCKe5Th6iWVC4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgqAM9N028WVmFHOJukpc/Muv0VKnSjMFqmoDyJkdnk=;
 b=KnI0i0aPAeL05GHeowVongz6xFhAe+BcV9qKBv38U++Di2tpwItTe2we8YbxRDVrnH0Cx/1gqBsVfVtv6c8kca8ZY1KJZzgB8SLbGJwvBQElKrcG+EdJcBWO863CUlQWPzfPIjDmMJEtczcJjUnAFQNQiJQFE3GX8UQ6U0/lnh/GZXrqYDDTm7Hts6BexI6qkLY8nKIT4kESmsSEkSIK0jkoqjygApD2tBAwULxOb5w0AvHl2CdXmG5QK4+qjSPD3twVDAEKSC9MdQ4ipAAU3QfB4QnplpkmpYzjv45jkAvwPeEuKiI0bhrl4mNvsdMB9E/MBPchSKudZ7FQEzzqjg==
Received: from AM0PR10CA0052.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::32)
 by PR3PR07MB8068.eurprd07.prod.outlook.com (2603:10a6:102:14f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 09:34:16 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::5a) by AM0PR10CA0052.outlook.office365.com
 (2603:10a6:20b:150::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Mon,
 22 Jun 2026 09:34:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 09:34:16 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 11:34:10 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 283D5957C2;
	Mon, 22 Jun 2026 11:34:10 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 11623700DBB0; Mon, 22 Jun 2026 11:34:10 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <anders.heimer@est.tech>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap] [patch] libssh2: fix CVE-2026-55200
Date: Mon, 22 Jun 2026 11:33:49 +0200
Message-ID: <20260622093400.2735723-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|PR3PR07MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f24585-0f20-45ca-d992-08ded0416ddd
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|12006099003|13003099007|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	0G8LPMNRRE0xtI5eYhdCteV1fM807GknTKn08K71kRHzT3rFwTKXx0ryv1mBSE7hkCFg7hUtD3q/35YUJ0YZI2BT7/68YrU6kwL6xxtCUWl24f+XwkORiai/aiBCP+coz/1ic3rrj0N+/2mf0nkmsyganYRxDr4ys9ttXUaziS82ALOYLoi0CdDVDgwb2DJNAQ79wJfWCkBdP5qiBXvBciBmcg46CeFn7nENn9Tg5dHW9ZycWC39u5GzNDpD81O0CIwDWiWU3javHxB+11G37+DvVQIry2OfcaR5QquIBOYlYymCtM08JHfTX03Azx2m2idL+G4icIDJOEle6/wjuJqt3BA3Lp/1ZEBqPj96cx9QcG76ifX1fjvz0xdalKn9Ogwb5zM8OBw03pfOVylMiAihDGHq8qKSmYzDekR5Wv7gD0Ho51y/2tI6SH5I7TpYmOO+Wygncc90cy0Zof0LN7H2+tQeff2/9TkZAL8fPQfEGJiBJYM+zWbvU791VAAm+yyM+UParZlgMEmVKqZZdNDFXjeZeHpFBnTk6Q0XoTbbsdzipQY+ibfCUtKyFPEUxKtF4H8/lTx1/DS24Agd+aCtQ2IZdp4AcqGl0BJCTbpqZvXLcLR3V4GBnfkc4smqIFpz02huNWUjJcvN8b1BaHeuurzu9N5EgM6b1BSQEUPp9gopeokc1sb36QYrZVHiUEV/404BZM6fGpcj5sKlkA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(12006099003)(13003099007)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	i9+Q/KKcZUskFi9hJQeZE7NiA+UF+ZbNpNZa2oTRpxm/KkkNFHIo5r5dPZjGOn6CrNSLlOUq7qk41pp8B7M1JQmAgNDGHKZr51KFWDCT/oQh892RS9k3hFcmYEjqRV/nHBvkeBJ9lSbyfafzT6UkvYZ5dRx7sBpGl6Gn/s70qN/WaWQYrE6f8RYEdpX0Xb2FGTmtw5WD0hhkjMwRu2qe83WnOuhROKO3X6p7HLe2cdrdnpufP/F4fHdyME6AJc2k5tJzpVVe8M6Ov5p7jzO2yM1T49mHIU0XXYRahrgMfkv1WWIHMz3rs1n7vkZD6UQ91oB2CntBIeiW1ip3mRJFgcmRYS3E0smvl4YhqUdqks9ro21Vz4hZy1aXgbS1cP0rLTHCtwdMTP91Z9i1+LmEKjVs6M4KIliNoNSQfx95q8DOw/UF+LtVeR7iaR+g1ZS7
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 09:34:16.7285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f24585-0f20-45ca-d992-08ded0416ddd
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB8068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 09:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239279

From: Daniel Turull <daniel.turull@ericsson.com>

Backport patch to fix CVE-2026-55200.
https://nvd.nist.gov/vuln/detail/CVE-2026-55200

Upstream fix:
  https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f237254630=
1d4a1a7a8

Tested with ptest:
Before: PASSED: 3, FAILED: 0, SKIPPED: 0
After: PASSED: 3, FAILED: 0, SKIPPED: 0

Reviewed-by: Anders Heimer <anders.heimer@est.tech
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../libssh2/libssh2/CVE-2026-55200.patch      | 51 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55200.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
new file mode 100644
index 00000000000..f5ab9b9f204
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
@@ -0,0 +1,51 @@
+From df0b03ee5ef12f3a46fccc0fc688ebfb91702972 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 12 Jun 2026 15:57:44 -0700
+Subject: [PATCH] transport.c: Additional boundary checks for packet length
+ (#2052)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Backport Resolution: Add additional bounds checking on packet length to
+prevent OOB write =E2=80=94 checks that packet_length is not below 1 and n=
ot
+above LIBSSH2_PACKET_MAXPAYLOAD before proceeding.
+
+Conflicts Resolved:
+
+src/transport.c (1 conflict):
+- Upstream uses renamed API ssh2_ntohu32(); stable branch uses
+  _libssh2_ntohu32(). Kept stable function name while applying the
+  new upper-bound check (LIBSSH2_PACKET_MAXPAYLOAD) unchanged.
+
+Assisted-by: kiro:claude-sonnet-4.6
+
+Changes from upstream commit 97acf3dfda80:
+  - src/transport.c: adapted from upstream
+
+CVE: CVE-2026-55200
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/97acf=
3dfda80c91c3a8c9f2372546301d4a1a7a8]
+
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ src/transport.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index e1120656..d147505b 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -639,8 +639,12 @@ int _libssh2_transport_read(LIBSSH2_SESSION * session=
)
+                 total_num =3D 4;
+=20
+                 p->packet_length =3D _libssh2_ntohu32(block);
+-                if(p->packet_length < 1)
++                if(p->packet_length < 1) {
+                     return LIBSSH2_ERROR_DECRYPT;
++                }
++                else if(p->packet_length > LIBSSH2_PACKET_MAXPAYLOAD) {
++                    return LIBSSH2_ERROR_OUT_OF_BOUNDARY;
++                }
+=20
+                 /* total_num may include size field, however due to exist=
ing
+                  * logic it needs to be removed after the entire packet i=
s read
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 2284d054b10..d6ee97f7ed0 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -11,6 +11,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://run-ptest \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch =
\
            file://CVE-2026-7598.patch \
+           file://CVE-2026-55200.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"
--=20
2.51.0


