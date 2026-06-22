Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E56CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 09:32:55 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39261.1782120766386519663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 02:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=dI8c3iWy;
 spf=pass (domain: ericsson.com, ip: 52.101.72.18, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkaMpvXd6SbKbbc2nwOoee8zcIHqryN6+Y//WsSUHNAjB+37NWFOTS0/PlO/tpDBNk4K+htf/3WMeXLKbmn9QkydgAwjSH6D49yZHFVQnDFQd5Kv5gbnl0U1RM4CEThkT7J9+ZCFZx4RXNF/jlR+02AJYDbSO/X9e8cjNp7654oLLJ4VD3om2O1FJ5MP5ci4DqSpm/CS8ajMa7Z9Rb++2baL2QG0vxZ8K7Eq6+rgn6GwT/bDh0erXYkXPKr8oChlAye/NICp7jXTP00LWy6JIXlPHrGR1xG8ljsF337bybCohjWr8IiDZ4gD55FOiuG3XNoQ+GGgwRLZzqbIaYpC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CtN74w4iI4owgOnkGn9kJA5zqZUZk5DrhgJ1bUDnb0=;
 b=ErgTgTpdgaRsI0u9iuavf25Vlb9ReELSItId4lBjPlwuNp1qsFLHKUo+jhYxGa7tA1kFNJYlhhJPPiyCC7Uhwg+k7EWqfEqN3i8lUGFHBOxikz7+llbHEm5V90ftYx988pjDCPQug6+YON7IlJPrYP5tF/Jc5QWyPUPfCVYgvrQ/dHCBlFZGUuWPaZcHmOd0TO9VHrHzIWLViS2M3sZsXcU+fZHYqyyDG5EAa66Si49tk4oLY/ytJChyAM7p/5LfVem5CP9lrAO76Q0Hbw5AXYsT4BIWIfvjYf7JTJb4tvBobK975FSZdg7LS4Zx9PtrfkIhl7q18C7KVdPTwus+OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CtN74w4iI4owgOnkGn9kJA5zqZUZk5DrhgJ1bUDnb0=;
 b=dI8c3iWyzyzG7/arURrPzGseRWA4azZvuezvDXH0jVqTj7v+8jzT1k2HN7wX3y22YKao7fq49/fp8odQd/EEC48OkBSpOCcCZAHb1xdQat4nDyTdETdhtDWgb41NE2l+l2JkHPnGNrrDS5fVatD9qJLy9YH47Y1Cjas4FN92XGPMeZyfYqZ9kXHIy9ZkRQCRYrov2OeL4BgKkha5NGtzHjYw6hu9zC6HzFx0pvYejrlRP45SwZFFYZA7UdUWskYsdQxp6ybReX/En2sZZzZQabb2fiM01erHlupE17orQD7+7EMiAkj5b90Ca1yZ4z+k+ulV5Aea3O3qJYWEnty1zQ==
Received: from DU7PR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::10) by MRWPR07MB11774.eurprd07.prod.outlook.com
 (2603:10a6:501:8e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 09:32:41 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::59) by DU7PR01CA0022.outlook.office365.com
 (2603:10a6:10:50f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.16 via Frontend Transport; Mon,
 22 Jun 2026 09:32:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 09:32:40 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 11:32:40 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 430414020B70;
	Mon, 22 Jun 2026 11:32:40 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 2B0B6700DBB0; Mon, 22 Jun 2026 11:32:40 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose] [patch] libssh2: fix CVE-2026-55200
Date: Mon, 22 Jun 2026 11:32:32 +0200
Message-ID: <20260622093232.2735667-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|MRWPR07MB11774:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b118d69-3ae6-46c2-c61d-08ded04134bb
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|56012099006|11063799006|6133799003|12006099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Ovofm3zvYb3LaY7BK71GWSnvAvMz9Vdtygb5xXeEq1FRlDD9Y0cxllxafQtWAa3otLu0H0sPWBa2ypAUzpBNYkYIna9EGTiUxULkcRkiOJm2+itA3isxupnnxInTzjZUjsWNKtI+XdWkAnnltSkOwQqJ8qg7FtpOdKKg8WN3B5a8q/tsiMn6qu5W15T5JBbIlag6iYfRQKYDygi7dHqlm1xLfbEVyP60Uc385i6JR6bYnEugHZwtXLG7xCPi6XYE4woF6LNQRQ29R3a8/SiuhXzIHtQpZBosshlt78XYuel5rzRK6Q11+f14OnbXjSs5BrH+5hSdd2pRJxrQ59+QS2P4ong1xnYqmCoKVAJ1WX9g9pXKkCtKcKVvCEmEsRZAQaVhZf4IRRPRpSUxx2BfqZDX2KVu04qGhHHYgdWqQ5ok6GYoIJ57rOOmg471+YX62ZY2muCI0LdsOvF2pkhAsv9kiVJW+KJS2ZHJTXskia4VZQN84UrUgSA0ac2xG7UwfJjtj4GAawHSJOHfWE90j/uBClyKCIwGLlAUN524PU0iYMvGB26xQJwXvmroOSMj7C+rCY2bzortegQtpqUwqpMSNRi/gYHbKlRTM2qAdOTThFj3WtgL0CKypI4BFgLhib0Ft2aT0w9odUMsPxOT+v0C92UTKuP65KnJIDeebKOEu4S+LQTn7ilyA6Sv/Ui21AljNgPdF7FN+g+TDdQzRg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(56012099006)(11063799006)(6133799003)(12006099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7RkC1QtAFESs808nHGeAxADOObANzVs3qrbMVKIeG+TGV2HZ5S1A+PUzLdLTqAqQneyPjx4ilEyP3R460B6Q2solWlLnJHmANEKrTKug1SRmIXjHloqUHUozzR678a75KgHXnlmmxruEzn6WwgoygbRVHXWCNnPem8gBYtVl6UJvjcq6MeLLKxaJu4WgBPKCFmYyc8Xiz1wLfve1rGV5SrLbbDVPZFJGiH0RuQ6JO7Hw/RCa/Q7im69E+Lrs/J3Gfq68o5FbYNlTaFSRxZO/Y47wa2tmFgH+631Zl3aZq08bVGZaneTj0RGsWMhdqrahKdjtPeesM/gYjGbKL5pcHt7cBW0BCbToJ+k+23qTbrY93XQyqcPpoasEgmYxRBuGY7/avo2WVmt3RvY1QVWpyF2h8TG/sI38crQH+YM1jr86Hfk/BlJr0eBr25Xp2juY
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 09:32:40.8536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b118d69-3ae6-46c2-c61d-08ded04134bb
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR07MB11774
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 09:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239277

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


