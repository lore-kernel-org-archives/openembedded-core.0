Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39051C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 06:58:01 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86699.1782716275039157759
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 23:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=ErRzp4Oe;
 spf=pass (domain: ericsson.com, ip: 52.101.84.1, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJbHfCw5juKZOcoMxm6ZSGLWYblVujxLy6xM9VWGKMMWkFN+QKrAk4yvhAwwcGzcoWPcBSD+jhXxeRvYobReHNer7muq7SiHGO2Z8wq8XmbMbK9pqtpCZnlvs6kCQddZ3Bv//YpflnFh+Kz1jZ5Xeu+L5zzVQ4hMUF4ts0yqTT6ImqNGIAtuIkihaEKRZYij4yxN9foA7C19xG5oRI8kjxaDSknJsVRYJ3mDe+JBxCh4YvO+P5ou2vnfzyO8ovcsEdQpcEYsxU97ve+aAlDe4XV+72hTIV1DzaNaci9k0g5XL5DrlKdHa1WQUvoh1kIPPyGvPS1KmLSNvg3eDLtHHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOTRxRdgeMot3kxUO5exwSGXgP/Xwxp4OAykMm+JrSE=;
 b=HOo12eSDJVmEtcP9+brd8dp8BQSI/XNbmGygt70tgV7JR1AJjv6c6bapXy5SyxMMS3TuMcgmpny3N09CnpoZrZKf8+7snaxIbLbzHwjso+/1D4FqoT6uN4+A5sL1mVMns6QLaxL6MX5yZ7nAcTWQjKw9sj/1sagb0ZyRyTW96SLxglURMDWO2Z57fQrlVEAE32BAkE4Qh3W4N7FvygvtPSu4VQ/PIKuXUKSO3Cjwr2U+eyvrttr9oDfPU8dkAQ4F+2pzzL5fpefPv38F9b/A0GTNrDC2h+goeHEeXRBqxXfurozuR1oAcga98taa7k1hvV37hglnmjY1SiNbmdVyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOTRxRdgeMot3kxUO5exwSGXgP/Xwxp4OAykMm+JrSE=;
 b=ErRzp4OeIe0Em3dmR+kfgZIk0e5XPJ/o15RKtS/BiY8DErmqIttxFg1K5PDWE1C+qTA8mQFGq89cq8jahh3EGIrF93am00e4HIDL6/JrYSLnvBUp20oDkMchuxjDQIeEwqUykH/REsuBQVvVx5ubkGNlE3zy2umJZcOlN80M6kr5+MV33GEGlR7qXC8NifQWQzwrlgGCgXZZOVe6N6kY7xXjYak0CZ3PxTMfbW+QwUS6S8yM9UGTqNe9v/hlee+f3/jEvB8IjgHNncajYcyCj9WBX5xmmSS+EKYUfxbcRVVcGr8KV/OXxnsHngIEUu2581UWK10fi960YYu6OWeV4Q==
Received: from AS4PR10CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::8)
 by AM8PR07MB8293.eurprd07.prod.outlook.com (2603:10a6:20b:328::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 06:57:50 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::ad) by AS4PR10CA0004.outlook.office365.com
 (2603:10a6:20b:5dc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 06:57:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 06:57:50 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 29 Jun 2026 08:57:49 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 681CB95800;
	Mon, 29 Jun 2026 08:57:49 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 3D471700DBB0; Mon, 29 Jun 2026 08:57:49 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <yoann.congal@smile.fr>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap] [PATCH v2 2/2] libssh2: fix CVE-2026-55199
Date: Mon, 29 Jun 2026 08:57:32 +0200
Message-ID: <20260629065732.3314317-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629065732.3314317-1-daniel.turull@ericsson.com>
References: <20260629065732.3314317-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9B:EE_|AM8PR07MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 34049b76-c21d-4714-a8f1-08ded5abbbf0
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|12006099003|13003099007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	y53TU7YyPIcW/jMGFLKuz6FbOEMOc1LhOiGI/NQJ+shsEqTETpPwZE589EwHNoTQ4M66gBKvP2PCir7p9xKkEo8LJ79YA7ZXQPy/kpOMHROYXse8re5HcDErzqCziVCi9hvq65WxohGm966rcgV6bTo5ntDLb1jRaJlvwX8lcJpTvP7rtzAu4eNUkprUxW7X6zpAe2FfKT8JC3noGxV++taSHhNLyFWzV2qVw3KqA6w5uXCPDejqpIrfgMwgFCfM1Tc9ySN274oCfBjZU+JOZNMWwPege5igyQznlMVNVMsVdbDQ0nq2BG4EJCNFw6wENJ13Kv/sYX3lxV86YYpI4AT5KDLnalEX/J4HHxEnccdHMYVlD4v2tuk0By6lyWSeoQuHEnTFqoR2+npfnJKd9MhWBJpr1ydv1T21LoiCBhF+TO/h6VmBeWo2V8/SkUwef/mHC40XAKugojnP1LLCnUjfKWJ5DQ3fbQckbMpqsp1htT+yp1DxdlVSOEwx+kawNX3/Clok1Z62cWtT8Olo1ZuglxUkoFoDLaXzK6LRP4BH4ci+YLUSH5ylitpouDXc91lt76KjvYMVRH7dl2dv4FqZWGZRmKioBznqUSzqYg6kh2NvPu49qd/sB1qSynl8Rj6W3O/XYUvsVDW6H58oNJPj2uS6v4W2RwegoBhT2vbqWM+ziAwEC/oKEJ5erlJlYt/97yG0vDoBzyFW78CLLA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(12006099003)(13003099007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NO+qDNC3RRoNZgLGn9A02ZZLrj0/DMXiD8chLYyN0sG3r4U25ULydoUhbM364GkSatmviN699Qsr9XVbTdmvDTek/wz0ILlaUBGQ+j4aqSANOtLVuTAlJmVdKqCvHlvE42gvnlpQKjZJ45evL8Qj5ChufVne43bwgbIPnySxdR2Jn72An19lHuBRmrNP5d2vpi+9zzWUzpk28aFrUSFuaUheWTWo/tlBlpWVEpq+BfO6pg3ip+cMDCDVzBe+2OSeg6pVrBuE30jXY7lWpfmZq7tfOZU69dx6hnykho9Jtldba/Put4Kn8joAIlHz5lWlvmCWyrgbGvYyXAyORtOiGBi9n+fn61OqfP4xbaK2f8zAUAc8py7wlOV/f3ob9X6E8KCi9XltHhOadPLt4HQ3IGNhR6gPoPbQD/+JsRPDgXEujSQv0CvCrIcz/dtW8Tb0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 06:57:50.1818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34049b76-c21d-4714-a8f1-08ded5abbbf0
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB8293
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 06:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239729

From: Daniel Turull <daniel.turull@ericsson.com>

Backport patch to fix CVE-2026-55199.
https://nvd.nist.gov/vuln/detail/CVE-2026-55199

Upstream fix:
  https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadc=
ee1cd84a4

Tested with ptest:
Before: PASSED: 3, FAILED: 0, SKIPPED: 0
After: PASSED: 3, FAILED: 0, SKIPPED: 0

Reviewed-by: Anders Heimer <anders.heimer@est.tech
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../libssh2/libssh2/CVE-2026-55199.patch      | 44 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55199.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
new file mode 100644
index 0000000000..81815486ad
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
@@ -0,0 +1,44 @@
+From b5cb1c1781ba5f275485f65855d61faaba6542b2 Mon Sep 17 00:00:00 2001
+From: TristanInSec <tristan.mtn@gmail.com>
+Date: Wed, 15 Apr 2026 14:51:08 -0400
+Subject: [PATCH] packet: check `_libssh2_get_string()` return in `EXT_INFO=
`
+ handler
+
+The `SSH_MSG_EXT_INFO` handler discards the return values from
+`_libssh2_get_string()` when parsing extension name/value pairs. When
+the buffer is exhausted before all claimed extensions are parsed,
+the loop continues with no-op iterations until `nr_extensions` reaches
+zero.
+
+The `nr_extensions >=3D 1024` cap limits the worst case, but the loop
+should still break on parse failure for correctness and consistency
+with other parsers in this file (e.g. `SSH_MSG_CHANNEL_OPEN`,
+`SSH_MSG_KEXINIT`) that check `_libssh2_get_string()` return values.
+
+Closes #1864
+
+CVE: CVE-2026-55199
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/17626=
857d20b3c9a1addfa45979dadcee1cd84a4]
+
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ src/packet.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/packet.c b/src/packet.c
+index 6da14e9f..ebaddae5 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -868,8 +868,10 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsign=
ed char *data,
+=20
+                     nr_extensions -=3D 1;
+=20
+-                    _libssh2_get_string(&buf, &name, &name_len);
+-                    _libssh2_get_string(&buf, &value, &value_len);
++                    if(_libssh2_get_string(&buf, &name, &name_len))
++                        break;
++                    if(_libssh2_get_string(&buf, &value, &value_len))
++                        break;
+=20
+                     if(name && value) {
+                         _libssh2_debug((session,
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index d6ee97f7ed..960ff71df2 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch =
\
            file://CVE-2026-7598.patch \
            file://CVE-2026-55200.patch \
+           file://CVE-2026-55199.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

