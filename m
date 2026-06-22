Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4839DCDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 09:33:45 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39448.1782120820179873165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 02:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=UbYHPO/6;
 spf=pass (domain: ericsson.com, ip: 52.101.83.60, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spuLTokQO/DvSsG6FYOU0/SQ0tFgYzmhW3QzDS6C12e3XZqOpxG0Yq9kPuEY4xlmQo3r2Qd71fM8KhFCM8bb8wtpQUBGA/8pTPDYo3lNGUbjcRhHhlpT7O0QZmUYQo8zAdqKQnM2wOWGLMIqq6OesWobaumS32QFpjTmABFPehgycWd+V09K68yBkUI+Sn0BbGUr4AKlbAkbl8gskm6pMTP6Z+8KfcrlMqD1qiK3h1BcLFH8YB1B2DN/S/xY6801p4Wmv5zFNUvEEUTOcvD0OZXrv+2fy98mr6aVEXYMlZFcXOsZimnyTkgyfuwRJ2oh6Zswv7oqjra+ijcnyUrBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CtN74w4iI4owgOnkGn9kJA5zqZUZk5DrhgJ1bUDnb0=;
 b=bfR27Dyh3hGvV1+hi9Z9yVF3vgmwYBU6rIYxtoxlFig+2h97/mxfUUj6Y65DB4z0tYTlB9JEwXbrOP7DI7OpJhiTtBffJ8wcF/eeVGn/5O6QvwBGf15LTlx+/WxOzWcBOGZaiFrzDzV3mE76qem1ZwPPJd6Kze3ZOzrfudSW4jsubYOq4EE+Roi9NJMjS/WThvUpls1KkCjIYQa0OxJGkz/eKKFmc42GU7AL+f0YkquWC5wlbx71HS2yPKI/Om8EdGXlmbXMh3XRBXtLOMwpXT8ElwrFbrUz4RcbHusQcHB8Y91g/OLh+VqAhZ5VXQf4crYKglQ+DVFDhBeo6EPBQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CtN74w4iI4owgOnkGn9kJA5zqZUZk5DrhgJ1bUDnb0=;
 b=UbYHPO/63PVnLICDDaoO/CnjujolaNDWichUSr9xXafdRDubVwBley6+T4aJHCSA0+PwQUJu8kFQH9WTumPDMOh7mZDtD8FNIU973dB4D8h9hOzVYeKPgBFf2nv7hURMHRA0U/VeKhEbSbzsN/3J5timp2bNLtmUk12SZHqdts+yt6zkFFLvWQMAv2EEx50o3/mjxNmpkA7YfjyiKlfQqvpCvg8bMF1C4btxcTKVXZ1fhw1OJcMf0fZmLwz+Nw9WJz23dgoS3eXTwh4lN7TZhwQAiKTvGXjTkgEU3NdsOVZbvpJdpjRzyXoPXCylisNPwDqhXebZXB6UlBwxWPluDg==
Received: from AM8P189CA0007.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::12)
 by BESPR07MB10745.eurprd07.prod.outlook.com (2603:10a6:b10:ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 09:33:34 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::12) by AM8P189CA0007.outlook.office365.com
 (2603:10a6:20b:218::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.19 via Frontend Transport; Mon,
 22 Jun 2026 09:33:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 09:33:34 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 11:33:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 9B88C4020B70;
	Mon, 22 Jun 2026 11:33:33 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 85263700DBB0; Mon, 22 Jun 2026 11:33:33 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <anders.heimer@est.tech>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] libssh2: fix CVE-2026-55200
Date: Mon, 22 Jun 2026 11:33:25 +0200
Message-ID: <20260622093325.2735695-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6B:EE_|BESPR07MB10745:EE_
X-MS-Office365-Filtering-Correlation-Id: 68afd331-df2f-40ed-837d-08ded0415489
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|11063799006|56012099006|6133799003|12006099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	owoP6oIq7RnwQM9paetT4pffTy7RMdYsOWUajDwE3KXTi/mfkJEi2HJMBgm/yxHc8UUmvQ6/YztN/nlhEV0XN1ucsiDPdAdxWo7+PT0eNxEKvOwptyzXQSdB1uaPVkZ7RFTnmtMgiB5bnI5gtTlwz5/bk1+0hZ7MPuQ1ORqh70x9zpjJwL4taRKkN2Thrxp9HI48oIweZ40+fvbmVw2b6PAvMrwq+vkVyckDW+7odBCOe1YAnaPi74Rd74D8vJW2xdp6OAA5CbiQbMk3G2LtpnFB7+k0WxXBq8FEBoo3MiUhGJiFv5ZVigJneHgqOiXcLTsUi2qF4zu2bWi3FageNGfyHo7Wjr95lpUb7xsM8zTox1qRVdhVdKFKSTgXjas+bLUsNjLcm3D+OCy9D0lmT+8I9hOo7xSiEKZm8TlKhLROFR75QWLR16zOlyR2cCLu/b2S7e4aOGQKSGNsxb3YPz+VPFfXo12S3QiOnSjwfxoec7SXyaQ1vJ2KIvnGN22X476RsdZ/AGees8ZcDfRI5QzmSSZeDYvNgoXJmtWZ5f+Z6vpGmscDmM200f/Cj5slTv6BxRlgobCAS2XfaSn7T6YcbXPytoYT7GJVazRwkKj06+1XrTN61iww+cgxfbWGzlE4nPrWHEnEpzMYrgPgHzvYa5cdfwwnfzUTmPV7mVd/4llhe+A6thsCD5fCKTkGVIzik9WdVzkI/swEWE3P4w==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(11063799006)(56012099006)(6133799003)(12006099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4myMcSlmqJM2ug4g3HOIq756p5KWZwH82vU5cNdIJnS1v4mNQwqbKAtueMKXsHeP7iHDTkJLHWdHg5vOgKM37L9qNU4z95YWrb8SIyzhE6VHXpXcUM7Ut+pkvNyW+LBbTkjKn3Nj6MtthTWpGepmW3Tdr8Od1z9RlWNReBBNPNvxMJXoAtyy9kmfFtiutAJqgBtsXO8HAuDm8QF3fkA6Akg0KsKkO31yDSwpSy/2Yi5YXrY2goCVrYK89dKqqNmJOUsyuFAOJF/PcwdoBXGztTNBgKHF1jMr5YceIP/yh1pyIVICrf+s9HzAuA2rbqwaro/W3jbxYaIK5dcimdjzlwOSev0Cncn4kFc8XJiOna4q9ug90ZRn2G8GIorc2LvuB/DeMH/xhd+rlHip9PWWxfhkFpwcw5WCIsMu4P24mAu+l8Y7pZ5OnnCF84C9YiQr
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 09:33:34.2335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68afd331-df2f-40ed-837d-08ded0415489
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR07MB10745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 09:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239278

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
index e825c8c5bb..5ffc40b8fc 100644
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


