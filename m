Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA79C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 07:34:44 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25920.1785137681993780995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 00:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=EmmdE15u;
 spf=pass (domain: ericsson.com, ip: 40.107.162.7, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDc2N3haw43r8hZF5b5v2mdJo6sUmySYJRwKvIIBFkXjzKxaqHK7HeOKfpNofQui5W0bvw24JQLmY6PpI10KbavD9/K7ZlamzXXMVuMvMrTou8ySqBbydgKUlHgyNW56oIZMEyR4P6CPYDmF+O5YUOcusNk0yaqFgJulza23WLIcuhiUXEFBv59x8EWRQ8NYK21vs9aTzinHBzpT6IRtBCo7Ro030g8SkvA1ZEBKQ2ppbw+EpQPNuqw6kR3J0x5PSI143JkwyfepLUJBfWG7hOGnWV+Lru19cCQ1mwiUGzaG+IYf7u1s++2si/xFLO8iC3K8VKJ9CmB7e8HC1drEKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmBwA33azcV5yyLmP/kK9HXj9gMfVa5HLRI8xeEg5nw=;
 b=TS8qr+cwDIB7pgp5OrsDN64RUglP3SzUw4re3KY7uFyUrjAdDUmkerPT1N+rhlbNghxA49md2CvFfxXAsX3to8G+LnSJBF5mYI3x+N7JApX/NnX+55/Dir64IfeaFlcaG/hL2/4QIgrwY3I02lyQ+BZzK3WC+NAg0W9BlzHAo3FpWL6wL86ucTkNSh7ftqSKFblOy0XimWnEiRWEAryZqxLXaO8Xzm15tlrVMhDXKTkxbfIPK6TCqyBQwvZ/gwjbjI2rQeOZ2luaRBXE5Nyx7HSNDQ1yaMcuEN4fgmVs4EM1E/jalyl6pWCk9QVJzMyDMLCNa4RVYdOKg2EEtMTBAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmBwA33azcV5yyLmP/kK9HXj9gMfVa5HLRI8xeEg5nw=;
 b=EmmdE15uj1M5gImj8NRkBLqkz5gMeG3AbY+Wo339b3o6Aw7aathU9lFnAA0J6214KECd9cb5exhn0q0RmzPGRhL+60J9QLjPHuODxUoMXeDOWCwjmUykR4WM78vVIaIspGwqNAY4/JWLkcAJ5UeHI6boF4ew2xNCs+mzlkahvEplhGzaTbWsTqBIE9Q+OkaI2FCJCNOGi3ikIGhDHw8sljQrjG32ISVZpXvNfK4dtN1V4bfimooRyZlly1+9wqzDSJRcP4KUW675WMZ583Q7MM56zkke2jwjpqCx8tRSiiGeh+Any/+xSfM/8dMQgKhoLWk04nNSWwxjE9ovnofXNg==
Received: from AS9PR06CA0112.eurprd06.prod.outlook.com (2603:10a6:20b:465::8)
 by AS1PR07MB8455.eurprd07.prod.outlook.com (2603:10a6:20b:4dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Mon, 27 Jul
 2026 07:34:37 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:465:cafe::8f) by AS9PR06CA0112.outlook.office365.com
 (2603:10a6:20b:465::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 07:34:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 07:34:37 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Jul 2026 09:34:36 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 687DC95800;
	Mon, 27 Jul 2026 09:34:36 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 2DFA1700DBB0; Mon, 27 Jul 2026 09:34:36 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH] libarchive: fix CVE-2026-14164
Date: Mon, 27 Jul 2026 09:34:31 +0200
Message-ID: <20260727073431.2019724-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C711:EE_|AS1PR07MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c99ab9d-9da0-4e5e-3d7c-08deebb182f6
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|56012099006|11063799006|10067099003|12006099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	/xOPpEmlbctWSUaHG2tvfNUw90iIj0Drb3CxfQlMr208aC+CoXL4RuHqqpFlBwLw+je8PnzlVphi9x7teAuLrfrRs44s3LNa9BIz+r33+UC0uMP86wY+nuppHRub3CKfshOi9pw1pjcDvL5bfu2Wh7IuzKL4tT7rwipTEYh4gu/4wlh0J4JSGjNy/ieLCl9u41Vv28WHelw9WHMYOm9nMvhnWPNW17rmvEB5i41WbmhLfKNseti15hPVZcl5oHqdMB0ZBiWmx4SbT1vaU2tBYOYbOZHp5feOId3N9GVjxEmwZbH2zvlv5mZhvq4DjdnUMaVosiRdSwwEEmLotcl5GUoezOnVwsc5T1LjGdl8bKt0dmjEjn8UzJ2gpOioo2rv+76yIIJ/cHNuPsp62zBK+4zQIntZnBDHT+nwU6pJonEui7MhFvOP3/dAvgS15261uBMLDON8UBiZ/Jv0y+dOjwj4x9kuEDIcyo+1mgORyDqe+KQDrqq0wg5ZPLsIjuDN5rU5fCHM5kiFe0BJYxiAV4NIaEm/HTggXXeFywX8ODmjN5CWL7vF+i5VxK9xgHTlVZ36dICFFtpGYYU3yAEEqJlI2qWtZPH+b69CXzYPKlLHJoBKSVf8i5m9FJNmD9UalIbHojcxM+Adh5kdAd7k7A==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(10067099003)(12006099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dx892+5ga2vpnHpiOqTQ1/1t4ABWKgLDu1x0GUrP0p0TyIgkg35sJUfvrkd4SJBv+nlKW3ButdtBH3gserNvpeA5dJfP/pE1e+vYIprj0xq8QaqsYMGG29Z8L4VLJR5ld4P6LVb6NyrrnRuQOYJNfqQTFonhM1fPjo2Sci3bfKInGvcR310ZcALpBgXv7Bwy7eHFHM/0ymOjtAY/WXuM6N/5tS/nOgTtn9u2aK58zkhUjJwgXOHoLlSgF0Bs+GHG5pL/Q/kJGenVLDNZMNIT6i0BpN7JOIjtWLyOWt7fQdzLw/sRTNkYxJGrlM03dlq/p3308DyoLdS5VbDw1FEIjJud5wpccJ1n+LvYFKnU+Qr7fyDfFCeISYaGicjUfvLZKkYrm0EnfE/uyfjEeLqfogfrZGCdDkS9mIE/Ve7gQzL5KTKiH8wcs6W6TD2vf5Tq
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:34:37.1482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c99ab9d-9da0-4e5e-3d7c-08deebb182f6
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR07MB8455
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 07:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242056

From: Daniel Turull <daniel.turull@ericsson.com>

Backport patch to fix CVE-2026-14164.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-14164

Upstream fix:
  https://github.com/libarchive/libarchive/commit/f774f03b40cb109348e5c6d52=
b59c864e3cfa8e8

Tested with ptest:
Before: PASSED: 5, FAILED: 0, SKIPPED: 0
After: PASSED: 5, FAILED: 0, SKIPPED: 0

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../libarchive/CVE-2026-14164.patch           | 53 +++++++++++++++++++
 .../libarchive/libarchive_3.8.7.bb            |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-14=
164.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.pat=
ch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.patch
new file mode 100644
index 0000000000..b734fc448f
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.patch
@@ -0,0 +1,53 @@
+From edbac77e8e544286fe7581bc398781c949ee5a22 Mon Sep 17 00:00:00 2001
+From: "Dustin L. Howett" <dustin@howett.net>
+Date: Sun, 24 May 2026 12:43:00 -0500
+Subject: [PATCH] Merge pull request #3071 from stoeckmann/rar5_doublefree
+
+rar5: Avoid dangling pointers in init_unpack
+(cherry picked from commit 42453cf16255800726b4efedab25138639ceef20)
+
+Conflicts Resolved:
+
+libarchive/archive_read_support_format_rar5.c (1 conflict):
+- The stable branch's init_unpack() already unconditionally NULLs
+  rar->cstate.window_buf and rar->cstate.filtered_buf right after free()
+  (the core CVE fix), but still retained the redundant else-branch that
+  re-NULLed them when window_size <=3D 0. Removed that dead else-branch to
+  match the upstream fix, and omitted upstream's added
+  `if(...=3D=3D NULL) return ARCHIVE_FATAL;` calloc failure checks, since
+  init_unpack() is void-returning in this stable version and predates
+  that hardening.
+
+Assisted-by: kiro:claude-sonnet-5
+
+Changes from upstream commit f774f03b40cb:
+  - libarchive/archive_read_support_format_rar5.c: adapted from upstream
+
+CVE: CVE-2026-14164
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit=
/f774f03b40cb109348e5c6d52b59c864e3cfa8e8]
+
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ libarchive/archive_read_support_format_rar5.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_rar5.c b/libarchive/ar=
chive_read_support_format_rar5.c
+index 63dd97b3..271aa0cb 100644
+--- a/libarchive/archive_read_support_format_rar5.c
++++ b/libarchive/archive_read_support_format_rar5.c
+@@ -2568,12 +2568,12 @@ static void init_unpack(struct rar5* rar) {
+ 	free(rar->cstate.window_buf);
+ 	free(rar->cstate.filtered_buf);
+=20
++	rar->cstate.window_buf =3D NULL;
++	rar->cstate.filtered_buf =3D NULL;
++
+ 	if(rar->cstate.window_size > 0) {
+ 		rar->cstate.window_buf =3D calloc(1, rar->cstate.window_size);
+ 		rar->cstate.filtered_buf =3D calloc(1, rar->cstate.window_size);
+-	} else {
+-		rar->cstate.window_buf =3D NULL;
+-		rar->cstate.filtered_buf =3D NULL;
+ 	}
+=20
+ 	clear_data_ready_stack(rar);
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.7.bb
index e8c3a3bfe3..ecb13a6772 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
=20
 SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-14164.patch \
           "
 UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"
=20

