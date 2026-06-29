Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B978C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 06:58:01 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86698.1782716273263062319
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 23:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=NaVFzNVw;
 spf=pass (domain: ericsson.com, ip: 52.101.83.31, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8fiKQScQAeNknFcMdHBoGNslNdLKI5tHJlZxp4iS9j3idEzFgBcqaEE9XMZryOe1Yx5VnbDnL9ANuv7ZaB11psb3JUMJNsE7FUuk+hwL2BnTKB8grA4fqt4MC1sRyPgkzwpLnHEkWQmOV+yE+qhTKRkWY1yxNHhL8qsqzJ3ExuIUOXS6pOQ3mbbgPft6MWtVvV5TxLEzsSkAtqvnn0r3puka8/tLyFh7etKEDURFAPS1fcOGuVJHc6wr6EStqnt4Njod59VszV38CDET5gm8QTGq1QtnCQDmO5BIGOa3VWQUgyQlBjX6WHpdODK1LAcQyEVfVRaqevb8jmMam6TPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKQGiL3nEHy3AtOfR34RBTm4QrH+pFKFBHciuAKQFRA=;
 b=vaXwpS1kHwggS9f3bhQGnPyu9ERrbrpRX34Hyik7fjMyFVxQNWCywpYQZ1exPgFxMnWA4fRQ4nCCYwBfP96VetUy0cyO1C0mR7vYmrg6V8jChDTg12EsAP7R8CAEUiuhxrCJS3OFprGOgUgiigJj0qjysEIpCmHKa5iBtDU8ec8Hi7sUCQ5FcagwQlk0HZSRDq1zLbK3yxFzUXMTmhzOz/nQBm8n5WBrvloJGEVK2jWJscG0YqaetT13VgdLUptvBFV0WFhrv5FBXPbWKNMqHC+FKugB0a5OdhC/9/9YHYJVm8TX9ybtSkq6j/+K5jo9mUWgxOnZgUI5e/S3Q/pIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKQGiL3nEHy3AtOfR34RBTm4QrH+pFKFBHciuAKQFRA=;
 b=NaVFzNVwZPAsf1VlzUYCUalzKiocZGyvY10aF/pe0PXM2mIiZ6BHos4uXJH48KQLnL1lZV7PSLJzioO0XdbTlv3I53jNBCmGICaSIcveIxm0EVxQ2CC4qoFGjiBwtTE6PBLM/vx53uoDKRaLzreoXwsyOjLICCjCCpY9O0juK1CkCQkBH048ArW7w0eLYek5mxdjHrGPA3drDYV7YInfkjuRva6qaqW3FxHcOQbL/svAgYoRl6t2MFNloocDpUT9s+/c8VbVulIQhq9FEzHMA0FmtH2DxA9LKNeDQTDOlx40BhLQYTEB5VULaaHwZ1puz0BEtp4EnHBMrGHybDCgNw==
Received: from DU2PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:10:3b::11)
 by VI1PR07MB10020.eurprd07.prod.outlook.com (2603:10a6:800:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 06:57:46 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::8f) by DU2PR04CA0006.outlook.office365.com
 (2603:10a6:10:3b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 06:57:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 06:57:46 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 29 Jun 2026 08:57:45 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id ACF774020A8B;
	Mon, 29 Jun 2026 08:57:42 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 7DFB3700DBB0; Mon, 29 Jun 2026 08:57:42 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <yoann.congal@smile.fr>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap] [PATCH v2 1/2] libssh2: fix CVE-2026-55200
Date: Mon, 29 Jun 2026 08:57:31 +0200
Message-ID: <20260629065732.3314317-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|VI1PR07MB10020:EE_
X-MS-Office365-Filtering-Correlation-Id: 177f5ed0-b3f3-40b5-46b9-08ded5abb97b
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|13003099007|6133799003|12006099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Hc9I85InC9Cy4PdPFUidi6hVxOLyhL6kfVoPvSqKyU7FGjVFimAQZ1h9o5kEs2Vlrzf0QS7waUNxNAPsBV6x2R6IWG5Fg0ufFfiXNyP8j6mu1NWZNyF9FrtZuwD3yuCFb19KPJyzJWd6asw4Wysz5g+4Ymf7u0AQIzaJHeJihZgtxJHDjsSrirj2X2x706G6f4omLCmgqSR2o9qHeHMKIVRDuKastGIfbQTnMEeMIQb+udQKykO8ywuhoGIWYOhipGRdEFHsQ36JebW86hKTvVcw8g67rr2b9UzLauh1BXBOPvs1hrnqIV7CsC9Pv2tzXRxldxJTJ+L3roN/5AEd3cfpQPTW1CDaQJKDazpY0XEsfmMxa3xSeyoBIbtCFVGbuyIWkW1jlUYAZXIa2jqWvPX5+c7EN1L1VcM5b9jZeWvQEGNmVALL6apgx6Kmx+NdGivv5rba5FhfOcw7XB7Mr50Oe+jrrNG2xFryuw/us2lgY+rmuOOwcGVHoRfUOubez3IYcN+6a4SISwmAxV9N/hyCic5aS5cAqcRk09rFZfmUu4cl3j6SjMQWLuDMQvkDa1MOJMS02hpaalz6mcv/18ra/FHS5GPYgvewxTyBLSPaaVKiiwtNYUJfktg+DlksTHjVhkhyWCT2Ky/Nl94KivoKBJCl6HHDsJDj7QkI4/kaBWOdOfQ5TDaV+yKNYUXQDcI1WyMvqDx7ljS6uATrbg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(13003099007)(6133799003)(12006099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8bedsdcyxe4Y0L6pIgWZklNDwY2uO+9SDhm6gENTPDc5c72t0yLFoGwaO7Bkhh1SBb66CFjfJ6ylDj/+/fwpYWkTyZ23tW/JQ1a1jhihfqnLCT6U8mzGW0K2GZdKXC8S9YT1mj3jkamW0e0t5naYM9/5hKhxmcyQaCgP3jqH8Ew2vhkgc7qQ14UNZqW0XGMtbuFraZq6nfZy6gfalCy31OjL1ywonmhqVQajGs/ri2tjunvTCEuglr3MNPeLRM4EwYZYHhJ2KDld/uOm52lO0zatn5xiOBbG9g8Y8uM9xFs6RSHYMB1vhKJiWtOc1nbh71GwNueuQuPd4y0HnFBbxIKtSC66LXBzkJTiYZO8ganYCYzw/HF3zo7+joZ/xOcXp8CoIHg/0EA7kSYddqUaoh2Zp6zEbxd7VKv0JtKt2IoMcbXhe/yo80j3Xvlp3E77
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 06:57:46.0332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 177f5ed0-b3f3-40b5-46b9-08ded5abb97b
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB10020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 06:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239728

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
 .../libssh2/libssh2/CVE-2026-55200.patch      | 36 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55200.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
new file mode 100644
index 0000000000..9a71277cce
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
@@ -0,0 +1,36 @@
+From df0b03ee5ef12f3a46fccc0fc688ebfb91702972 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 12 Jun 2026 15:57:44 -0700
+Subject: [PATCH] transport.c: Additional boundary checks for packet length
+ (#2052)
+
+Add additional bounds checking on packet length to prevent OOB write.
+
+Credit: [TristanInSec](https://github.com/TristanInSec)
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
index 2284d054b1..d6ee97f7ed 100644
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

