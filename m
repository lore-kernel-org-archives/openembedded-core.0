Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF95C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:19:35 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87557.1782721167676082017
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 01:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=f6R62JNm;
 spf=pass (domain: ericsson.com, ip: 52.101.70.65, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MC26Wzhu3elfqB+SdNQ22WuuOoOtgyBPDImzmy/w0UbCGv2Fk6ZNhO8uDEDAa6pLnTV7k3bDdiLu81DWCk9PIkp+L8pPMvbbVUgH1klQ1aRfREncIETOyypeVoy7hBI6DLEX/klKbINk2DRljuC9Sy/3HjPP4SnfjIuPRDZhkkZkZ5W6edggP6bENGRR6dYaBaWsBjjvDt774XmH2GALiRLquJ3Z7P5CSi+uaVaxcVakmdseJnjMZNbt4x4jDVgOBdCuKfF+MjHTetDKJAj5X0OOP12isOwiavQ2AD+Cob02jVbu3G3hYerKr6PPD6TsVdKZD1umqxbNc3Np/csdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSvO7hnOj26K/KfQPkFBbLg6hgPFo+oSP/XZHDfUl1g=;
 b=vdoQFt2MSTLmzdG1Q50h7Ru2YiBm9QG35EX5wsVh8hAnlsvsX/DywlG6lu83HnwX8s6qYYMIUoQlQP547JTk3MjQP+1lIYbiCcFeBfDv2uIn2GGo7nBURT/Ku6UQnQdfr5yyK1vU86A4ZgWy/a5/JUWbtdD1TOmtZ2nZbmw+SqyF4HrfWn8bizBXijwFgm/oUDOGEAYQRYI+MB6sVRMRw2vOLjor2BwhNaPuKAwqIRsnpqy5/Ec8e1Vi+a+FcVObEzy5kLhP3Ht+sunQRV51QYtsDcxBVbYLgzoEqASAWQqhYAxfs+Ag1ZOI9X1JaYOl3H4iwFfkZRMollogTQRH9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSvO7hnOj26K/KfQPkFBbLg6hgPFo+oSP/XZHDfUl1g=;
 b=f6R62JNmI6mEY7XDgQpXpvAjHG45fqMIssVajPbpjAV0NbNurp+wA8rfNjzkppPWeV796KlH8ywR5mRick/7wGmVco9mHpX/lDSH/6T4mhddIeLcGrEmfpIPNtNceuxpeFYVaRy3Bv0dh8Qh4AU2JJvZwX0Viy36Uscvc5kXEdGXzeN9Dmpo/aLx6SJ/fTOx4+kURgAu9c1uU4vzN21ZaA9uZhSiKrW4yHg9Pq752vgA7KgEoMHE8oFoDkrpHlX2awwVjLTtreydSZGBX/TpxMgSfAplbNuMcqHFgUfW1sKnFSkSFi7iVVYrqywP14DN5cz47a2BUKxXmSUq2p9Cmg==
Received: from DUZPR01CA0123.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::8) by FRRPR07MB12204.eurprd07.prod.outlook.com
 (2603:10a6:d10:1cf::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 08:19:23 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::32) by DUZPR01CA0123.outlook.office365.com
 (2603:10a6:10:4bc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 08:19:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 08:19:23 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 29 Jun 2026 10:19:22 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 49633957FC;
	Mon, 29 Jun 2026 10:19:18 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 184D3700DBB0; Mon, 29 Jun 2026 10:19:18 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <yoann.congal@smile.fr>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose] [PATCH] libssh2: fix CVE-2026-55199
Date: Mon, 29 Jun 2026 10:19:15 +0200
Message-ID: <20260629081915.222139-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|FRRPR07MB12204:EE_
X-MS-Office365-Filtering-Correlation-Id: a340d9a7-caaa-4358-05c8-08ded5b7204f
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|13003099007|12006099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qJXmxh3y16wXkDNuk1kkWUhEGW0qISy/womlgK7n8Dr+c7MM3FytxjiU+LcxGPIshHjVFIIUc1oV2P5UGaxkUsa8+i5/NJz1lSPc6KxrQO4rupQDk57y/m1wlASPeZMrywoHUxBzsrbDzHs/HT3FU8UdcRBUEBAMFUBXFccfUHrtOFCawgoN3c25aSyYY4X83EictPJmxwqSdODlp4dta9Ri0LUE9QEnkBEpYO1NwGd9jYi2RI8BPOQ2d4qIn9i/dIMsVVjtZ2UqOKgIXmCrRwq3m7OBBJifihk7M6UUKqRC0rvrolxG4s4mfuvec7DikPaZBXJ+//uz14u1Vgy5ySG711EMNAgrYPxh3+doOcRUi5AA9iR9wIAhOJUl2trn4LJ+IceKTy5X7/BMVHgEjH1noag4NDKLiL15GUFfMdaCA/whKW4T8CmuLfk/lPg6i6B8SfFNLgQnIUuCezWgRNbyF6ArZCvcqbxOaNrkKwq6XaRGC4uTU8yYXrS/pgiYbEGY/T7q6HnAFuEDSpGJRHbzedF50qoRiYsf8sGOaGTcJ2Z8IgRK1MuP+qHUN4YQgZL200yto5U0JErdT7rGdYpUOpJQrwMSoecebQnNHHFXh1iCDDrcKXWWx1Q5R6URnTSSgbOGlg7asGAXFw9LjEUy6FgQNgO+RQJufjQuGUDOo65/6kFXuhSOepeyjKisV2kYlv4/iNltQE8F9ms+7Q==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(13003099007)(12006099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rCEHg+Bsln848LvszDv9R4+MaYFHkCqvIY7ztXOy26ObD+HhdidF0yFX7PPlSESBUX59E9Gmp4L0M6uvCbUOlnZcqtbONVCCjpXtTNVGvt6/0NaJNauHXlRsH9XfEJdosRWhsP7ONspwtfXZ/dWl1HUPk5b0IK3DRUKVgEmDE+YxXh8itdfLwpgmzLOyA57OsTacOb3eW5SuPduFNnEedP9stLa6lkZ9CrW49DiUH19UkwGySNSHCc+IlhD+slG+Z1qthfGVeExBCkggOmP//+Cjn3ZXg+KbG/SqS+Z384lRMu/oJFs8gyYrEEkO563F28S7oc6lln5t4IZf9SIU8KojX4IS/ZluQ9bZtd0Qq6QyN6njp2Q/leGp7jRN5HY7L7QaC8hDbuDSiI2RgocsbDSOBoall1F4V5LqCDE+eZiE8NIu4u6LUvx7j5oEkeXo
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 08:19:23.0157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a340d9a7-caaa-4358-05c8-08ded5b7204f
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR07MB12204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 08:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239735

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
index 5ffc40b8fc..2407ed34d9 100644
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

