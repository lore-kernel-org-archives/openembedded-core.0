Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F69C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 10:59:33 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15092.1782801347305386316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 23:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ak1/+EQk;
 spf=pass (domain: axis.com, ip: 52.101.70.55, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqIKmF4RMJJ81K+akHurM8djWLSi8MbC66QvkqmFchJBweDUzzAT0LUisZV16ekF5NIWXyNcC2DdKynzL4Jilmoj4NEwRL/OBqrlf0Baf/J8x6BRr2hbHWmkLTaHaxrh45Mdb98n15/QPZWVCpc4pUzRODqWcYRaOGC1NGKkvKFyVET8ZPYwgzXJ9jutqLpoDFhPpkuJ+kJjvrNG/mEXmjMfHoO0MuxBP+GoGCShglriW78V5QDoTpo2EliHe8ZhU+DSTJ5iELh+LYiBTb4KYFCzmqIIfgD+FDXZURJPgCPn3i/PT3SWD0WJ6DmVCw9k7EQ8GrBryCBKrnvoND4leg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTmdAl8hlIJ0wk1NLeYT9W1WcyQ/MW8psDoUSZzsJJc=;
 b=wA4Iwfi2HZ6GSng7Y9cdnIBL/Uy1PkqjLnZEWGroi9BqTJkTj5ljnNNwHfDhT49vzAF98C9/c/OjDtLHUSEazglwZFRf3ma1XNPUFYw05/H3uyTvSHuKtecSGgn8ImIMQyVIiYsutbquANwv7PYD/JyrA9Q0FZBEEAeInfxDliuli3Qmx/T2IVVg5FehKaLDo4iutsUowElOpM7p07XYEt5vwTwsrdPQAM+2OFCOs/iql0q11Pvkmrm/BGO3W3UaotHx+ViIEcoHsDZhCV+O9gpxpuRVhNhXKxcX6hvATPg4KDLZeTW/XwHbR1HORCX1lQvK8GvVD+ttWslxCBBcgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTmdAl8hlIJ0wk1NLeYT9W1WcyQ/MW8psDoUSZzsJJc=;
 b=ak1/+EQkB0ISkFfAE9ghBpRlKCSLyIHcjuiIjutTt9E7Ro+o/V5oONA9oSGbqc8f2/0K2h8MTWy67dWUcNRew4w3QdFSoyeu/Xt3fKTNpjsEuWnAySa52Y7QG0rZhhNPa26D5xwzb9SFVFQmScfaIzUMNR6E5BQPV6aru9Cn7R0=
Received: from DU2PR04CA0272.eurprd04.prod.outlook.com (2603:10a6:10:28c::7)
 by PAWPR02MB10066.eurprd02.prod.outlook.com (2603:10a6:102:358::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 06:20:55 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::91) by DU2PR04CA0272.outlook.office365.com
 (2603:10a6:10:28c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 06:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 06:20:54 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 30 Jun
 2026 08:20:54 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 30 Jun
 2026 08:20:54 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 30 Jun 2026 08:20:54 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 4B617EE0;
	Tue, 30 Jun 2026 08:20:54 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id 48145829382; Tue, 30 Jun 2026 08:20:54 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [PATCH] libxml2: patch CVE-2026-11979
Date: Tue, 30 Jun 2026 08:20:51 +0200
Message-ID: <20260630062051.516582-1-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EA:EE_|PAWPR02MB10066:EE_
X-MS-Office365-Filtering-Correlation-Id: eb32efba-75cf-4ad3-d714-08ded66fbde7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|13003099007|11063799006|18002099003|12006099003|3023799007|20052099010|56012099006;
X-Microsoft-Antispam-Message-Info: 
	0DsBTpigoyvnAWfLP53lToyyLosartqQ0SIVJPzbsWvejAU/3u/Nhfc3KZKsoFTUuWXRFcMGl0naI3GKHsyi/gTCpeh8CSmR0dU8A/qrAgggGqPYTTupsLLzkw17IWVEq1r7BKpHC7dA6KtRlKvidDVL1jyO48N0moyed8l5B2zc1+uLlkcp0udSSmbUf3DMySBsFiwEEAeFrEa9OazyRimVjeIPMhSOqmage8NayXCg2JUi9TYCJC8gRLiAl8cRvVFujGLZ3/tmtl722nOkrGdlzxvaxhsR3rHB90KO5kVr4cjlZ+s24QPPpsapey6u8rdzdjH2uhUmK/FFr5TkPgxGvweYMzoXolS2FVr4hDlHso5/767icZqnWnneLdBWMytvC5zXa/umZpDLmBmOIQ3IUYL+kDvMp13cVKkyxr0rag9L/LbSrGyRwWm4V2enP5UySvFni7043twhoFTFIKNIVMYHCFrrkj1tlzv+tFU1jHNwSiCxDKw/QwRE4FsuhhgmBfnaI5+pDCxIK+nFiCnI6/f79/r0TGpGYHFhlKexSgFqFgSGGqrPGewY2xGijdS0+rt4o6OvMVhFSjV8vxNx14B31ZAP9HDeV59J4zr9fU0FAZzUzlNY8JubQ7D0WCeA1XEuNZPMpw+UeVyvnBax7b/ZelPMt3PL8JIX7eCdf1W/87JXIAaPjRRMPjepyr/ZIwGCZy8k85Bg2nDiAg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(11063799006)(18002099003)(12006099003)(3023799007)(20052099010)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ja1y/niTq8mEbIGtbPJm0tMBlASlPhpNrc5msh8JKGm9aheLHYpjubmh30JBlbGy1hCB+2p0QIAmykVN6zfLAGMOVF6zafhNDIU6LO60m5NKol7pyNcAh5r3UF7R0TX+rATKuvqQa1nBCr80UMf2/cVjEMlH4Wf74nORir5sQvwOjoiEG2nhkZ2MrHOr02LVbHPbQG4s6gvwF31S2V12cPoroNNkRdoA36sewOmTlQugd/CLkFF+vlaIZnn3Y7CBPvCywVoSCqu5WQSm2Sq5UdUAdy+4pjpz3jTx+9ibP/3+uHLstKHDO7psNCFYrRREqEInqtMpKnYQxMhEKpMG2pvVBdiIaZsurVLDjoCoXu+FtV96xAN/n2hFd+j9VqNWnZnYVYsRmAjNBlK+8HX/aP0L87f+2q9ESA2QxvciRMFY16o4rheTt36p5mC+0sDo
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 06:20:54.8511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb32efba-75cf-4ad3-d714-08ded66fbde7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10066
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 10:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239878

From: Anton Skorup <anton@skorup.se>

Pick patch from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/c2e233fc1b341685fc99621=
b2768b503f777a72e
[2] https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1124

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
 .../libxml/libxml2/CVE-2026-11979.patch       | 81 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.15.3.bb    |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch b/meta/r=
ecipes-core/libxml/libxml2/CVE-2026-11979.patch
new file mode 100644
index 0000000000..a14e566681
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
@@ -0,0 +1,81 @@
+From dfad0660f7dab3b5f8317b703b16ad0b0d12697d Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Fri, 22 May 2026 12:21:20 +0200
+Subject: [PATCH] xmlcatalog: overflow check for large --shell commands
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1124
+
+CVE: CVE-2026-11979
+Signed-off-by: Anton Skorup <anton.skorup@axis.com>
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit=
/c2e233fc1b341685fc99621b2768b503f777a72e]
+---
+ test/catalogs/test.sh | 11 +++++++++++
+ xmlcatalog.c          | 16 ++++++++++++++++
+ 2 files changed, 27 insertions(+)
+
+diff --git a/test/catalogs/test.sh b/test/catalogs/test.sh
+index 7e5eaa76..84e8b90a 100755
+--- a/test/catalogs/test.sh
++++ b/test/catalogs/test.sh
+@@ -10,6 +10,17 @@ fi
+=20
+ exitcode=3D0
+=20
++# Test xmlcatalog --shell command line
++# Case 1: Really long argument (470 chars)
++input=3D""; for i in {1..470}; do input=3D"${input}A"; done
++echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
++# Case 2: public + long argument
++input=3D"public "; for i in {1..470}; do input=3D"${input}A"; done
++echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
++# Case 3: public + lots of args
++input=3D"public "; for i in {1..80}; do input=3D"${input} x"; done
++echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
++
+ for i in test/catalogs/*.script ; do
+     name=3D$(basename $i .script)
+     xml=3D"./test/catalogs/$name.xml"
+diff --git a/xmlcatalog.c b/xmlcatalog.c
+index b400c7cb..5113e930 100644
+--- a/xmlcatalog.c
++++ b/xmlcatalog.c
+@@ -135,6 +135,12 @@ static void usershell(void) {
+ 	       (*cur !=3D '\n') && (*cur !=3D '\r')) {
+ 	    if (*cur =3D=3D 0)
+ 		break;
++            /* Do not read beyond the command array capacity */
++            if (i >=3D (int)sizeof(command) - 2) {
++                printf("Invalid command %s\n", cur);
++                i =3D 0;
++                break;
++            }
+ 	    command[i++] =3D *cur++;
+ 	}
+ 	command[i] =3D 0;
+@@ -152,6 +158,11 @@ static void usershell(void) {
+ 	while ((*cur !=3D '\n') && (*cur !=3D '\r') && (*cur !=3D 0)) {
+ 	    if (*cur =3D=3D 0)
+ 		break;
++            if (i >=3D (int)sizeof(arg) - 2) {
++                printf("Invalid arg %s\n", arg);
++                i =3D 0;
++                break;
++            }
+ 	    arg[i++] =3D *cur++;
+ 	}
+ 	arg[i] =3D 0;
+@@ -164,6 +175,11 @@ static void usershell(void) {
+ 	cur =3D arg;
+ 	memset(argv, 0, sizeof(argv));
+ 	while (*cur !=3D 0) {
++            if (i >=3D (int)sizeof(argv) / (int)sizeof(char*)) {
++                printf("Too much arguments\n");
++                break;
++            }
++
+ 	    while ((*cur =3D=3D ' ') || (*cur =3D=3D '\t')) cur++;
+ 	    if (*cur =3D=3D '\'') {
+ 		cur++;
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.15.3.bb b/meta/recipes-core=
/libxml/libxml2_2.15.3.bb
index 3b7a0e3cb5..abf9889b3f 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.3.bb
@@ -18,6 +18,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.ta=
r;subdir=3D${BP};name=3Dtestt
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml=
2.patch \
+           file://CVE-2026-11979.patch \
            "
=20
 SRC_URI[archive.sha256sum] =3D "78262a6e7ac170d6528ebfe2efccdf220191a5af6a=
6cd61ea4a9a9a5042c7a07"
--=20
2.43.0


