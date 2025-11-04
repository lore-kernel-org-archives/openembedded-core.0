Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954BBCCFA00
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 08:34:01 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.132])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13294.1762245234843206034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 00:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=BbAmiljf;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.70.132, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAzrqcVm6Z2XDLz7cQFlOs72UnecxtQoQgOPvr+rEK4uBv8fADlVYhPvPuw+BQ4VQMvQKujtUCtYn3Db3oAnDf03TKmcZMr+WWB1btGmX4Hpgvqk7epVTAUDwomXUd6T52M+8X9E0sWUL0SunCXVSwgvIUpIWvomXz+mIK48C73D3Cq/HZJWr1tzQOGwFMTaJUv+99YBQ4jsyippO50uwjzH0R08AM1cOrj6gIjGcvQsj6T0DqGSpDJ3IXxvuZJPKjCv+XLFbERy99MoVJQ6H2lfyZ8xQ3QNf17dhDyKS5jvQLNjYJTICPfsYvQwmYexu22VGfMnnvJVW/Ws3HTqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kz7+j52efeel18qN7m3froKPtuYM6WUqOKv11YpL3uA=;
 b=N/xUUm6bsfLWyOfSq7FycdSS6faIai5A9NsoN3wh3rCBalLPPizsY2io8J1+ZLczhk92OVzkEfD6LPGJInjsHXuoPPOJFAQ8ihJSUiZ+PfIHh2kM/xmWBdrq0nFLpMYi7WxUOVO3vFR3+OUNZSmyBMHCcjwh5Cx8Z9VoE5SK34uRgpuDj3pOD1ltSyqb4tX/FZEcu0DAxPfZ3NZa80toI7561FXMs2h7SO05lB1uK6WerGAoQmf6ljYs5n0f3xNujrhqYkd3jAPGQpWutviUv2CNge7bTXIVJ9tYrkBWl9rMbCCl6GZ+PzcaHkP2Divugi3HWRUzZ5jOGGk2zuYWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kz7+j52efeel18qN7m3froKPtuYM6WUqOKv11YpL3uA=;
 b=BbAmiljfhOyv+A9BmMx3Dw5lkr8XfpV4Fhg6oPZjfAknl6dWXg1NXU761QA18OUByMFkeTzQ10uPza4F4IZIxz+vAU6daFUv7EfJPMlIfQCiDiSCGWkvU5bSQ0xBsk0mOWF4jjDgZb6oMbK6PkQ0PkLHbKVohaTQg4pb0KQZK6DEQae4FmQiY8pDCLoT1DYWbkQ4WY2m6zBAMOGXxFw5yZR+9y8OwZgtZU5ClhdMqhCKCZh36XIsZul493JR6mjDxCorHs5NAAWccWd75wZovfRwoTawk006MBbb0F32FAQjPwLBnfDv0/O+9sT0Kwamc5PmemUUhM5IIzIUw5o7MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by OSKPR06MB10123.eurprd06.prod.outlook.com (2603:10a6:e10:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:33:47 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 08:33:47 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	rybczynska@gmail.com,
	peter.marko@siemens.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 5/5] cve-update: Keep mtime stamp in the database itself
Date: Tue,  4 Nov 2025 08:33:33 +0000
Message-ID: <20251104083333.814331-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251104083333.814331-1-niko.mauno@vaisala.com>
References: <20251104083333.814331-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000384D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:f) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|OSKPR06MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: 847d921c-a6a2-48e3-3f12-08de1b7cdf87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hlwUFqSJrZh87LXAFioNlVj270uSe1uBsOk8cQJBkMj3FY2+ax/xMQ3AFFN4?=
 =?us-ascii?Q?bqStNu1WggGBmi4J5Xub3tFuFVEd6qwxOMDeYAR0ZxIr831560svVXeF29Of?=
 =?us-ascii?Q?bNqNvs/5M3ypI4bvkt9NwxFWBEmbV3uVbRsaZLkw9WOG2Aiyl3+u1zlNutwn?=
 =?us-ascii?Q?Se3ahoYBhW5rxpBlNQtyuxt40nR5d6quu8L9hWuhv5THz8SbgZpB6f3Q00g6?=
 =?us-ascii?Q?XUZKmE55IEPbUhPptWbp9pzHa3l+OG6Fbzzia7xW9jNkt6QUOWN3ukcfL/Od?=
 =?us-ascii?Q?eREleR5IQ7Jqi4mzGNTXgn1WaD6Fs3iVVMXiAa3ZSqEnJXMetMPXkW051/po?=
 =?us-ascii?Q?TSpX3WvzgEWJiewBgvTuSW0DQJmQYm4HwmWXgY8HIT4nuhTMLZO5OWBTbyyT?=
 =?us-ascii?Q?EU+Rr/Sf1Z129PYgpcsprjAAG2ITKEktoxxOEu53DbdImGL5sSEytZ4Isi/a?=
 =?us-ascii?Q?mosPtoAMneOeN4TaZh9tOwq5in/d2wgspM02pkr/1IrVY31c/hgSpG+LCCOz?=
 =?us-ascii?Q?WtmUlD4Gz9ZtEpQLU3tu0y7BXoN+8n5ScJOguxrkCsbfhxa/NEK3FqAAU8oJ?=
 =?us-ascii?Q?sJuF8Pm2BYbyFwnZ29l6LJBTJHE6dRdkXHRmwFy3RXHkyX6pfPp6APtFGnmc?=
 =?us-ascii?Q?0yYhYwbEs3xHMcQrb4j5SKa6y5tevOMxBxpd/+Vsn/qe9mpYw+54+p7sUCQx?=
 =?us-ascii?Q?AV5u479F5D+S2mn+ZaTU/ocre44SIoTZpZhqoLoeFb17aOqGhFHi1AlKB706?=
 =?us-ascii?Q?6jC0gbxA9lpN7C7DzbXPaISNNexwAK+9gzTdDFUweG9MgLiT9fw9DD+ocimC?=
 =?us-ascii?Q?wDsYM1YqGx1ddHuDbPOqhaLNEc3JVGBCOlAN7puNLNOfigWmWQS+z99+YrwN?=
 =?us-ascii?Q?/I131LjOk3qNLOzyoYeZMyYd0jr6wQdyLqpNgll5njOIF9g+FD8RvyNlTx7a?=
 =?us-ascii?Q?+UPOz5WwGyQT+pMq8zLP66GTLCMCvvWBDXHAdoIV60614OUIO+sFpgUyz/PX?=
 =?us-ascii?Q?hEPoIDEa31FvXtlhTML/zdqj0aPot2iXPu7f1xfZXps50wT6erythWbuxcMq?=
 =?us-ascii?Q?pJqhfUFneNAmFpzsYONJ0MU0EvFo9M00CCikbTV8y88jSb6/jFZ9FM2T0avg?=
 =?us-ascii?Q?gKeex+N4161MO6cTyEe6/u4pLEQLqtRjC2JOWml4uQ0bNl6gtNxAf5Ryki5A?=
 =?us-ascii?Q?sH/GQ+erCE4cPjsdqzJ98ALwFD54y7C4teA9Ujhxboaky0YMIlXKmiWURq+G?=
 =?us-ascii?Q?aQlv7LgFRum4+wcYy2ndkT0Z6agfkv4AfHLfaUr2p09aOPbQNJIOlSvnM2l9?=
 =?us-ascii?Q?ZOAf/iNvYyuplq7hxBzLHq/py1w9PZSV1wJ0AwKHFHWIxXiA6uKmWULqXT2Z?=
 =?us-ascii?Q?JE0pDsoGDpbTd9YTealP+/f7pFL4tdXFF+F9U0zIzUg5FEk8nDlqI1IE559l?=
 =?us-ascii?Q?Wt145Wno9WCiZCP4ogH45ZZNz4kiFETLOuPB91AgD/TH53h++mKNyUT6T3M6?=
 =?us-ascii?Q?8tMr376mFOpNoA5sL71tgy/8Yopjhq7iURzc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s++ZbY7O2nnk86/UeTp8Qh+kpwG9BbdLHPa3LBoP+ndVK8pLxaTNivgqN8nG?=
 =?us-ascii?Q?gPmxka5QEJDHyBdAl7DG411tu61QMcl6OSogfqrFaCxJO+P/aGLk1LcXRzqM?=
 =?us-ascii?Q?fz1D3GdPTN6yVweMxMjht1HiaiHcFyWlHEUaTAukeyB8Dzho5JRftOVwcm36?=
 =?us-ascii?Q?WxQErgR6zfArgfJzA4P3op4xqL++Hyb9Ix4JbQx9PhyWx+NbNd2XcYlP+jKD?=
 =?us-ascii?Q?jinFN/7oiaCkj+Tz87wVrL3rIKKbvjxlp2JetIjffX9k3UEP2QQtFW7tCo0d?=
 =?us-ascii?Q?UEVezXtTlBLF9xK88jBf3PtiYhduRMqIHJoJiDvryvAYcxQJlZKpBjUZ7cJB?=
 =?us-ascii?Q?9h2N4KEHCuCeYU9m9MaeKTmnuKlL5NLn8lFvVnukAMFM2+DB2EJ+CDkcNNnZ?=
 =?us-ascii?Q?bkGTQMo5rf6y4lrCbfLgg47o98NSBOsa0KUerSzE2ReJoD4vvthwwLozS0pD?=
 =?us-ascii?Q?XguJyfuvIfP1hf7QUsLccexVtl/N9BjShrWAf3BUcVvOG4VQWPtcmGKxkWha?=
 =?us-ascii?Q?T3lbqum+KH0Y73FRn0hXXp5VduFSn7HzoP26bVe3uD8+2TXkEg5NPUlLqpns?=
 =?us-ascii?Q?L49XQeaKozqLnwN5jYlcZx77h7x1uzTcBh6tIVzkyD3XsG2DJgL1ZYXNAWhv?=
 =?us-ascii?Q?LPgePEA921M8NOd4fy61KpO4zQfsp5buZ5i+IhIzDX8wUp+ygkJc/FlhRMCS?=
 =?us-ascii?Q?Z6cdNGK3sqctS8fCtwXQsEhL72WJLYbLqtsO7EgEl7QvHygJFpqCa1SOuvHq?=
 =?us-ascii?Q?iRC0VO8qb/TXFaelQOeuKSUBb9yTaNxasBswVeQVfQi44B4vQxhesnP2hbsI?=
 =?us-ascii?Q?Vqts55zQZB/bGFUPNqRIDxyjhHV9M7VfI9Sz29/slYItDxl8EE8/tfpZQW/v?=
 =?us-ascii?Q?5ynMKqpfkN0FY4VLeEUPJ2IRzOF9jC5nkfa8dTHWGc+wEZCgfnaUpO1u7H9O?=
 =?us-ascii?Q?IHVfQL0tc1GgqglCIQ1nxNamUO+rI5Fhq7E7cMRPdEu8/ULgQA4OPfBZcCZd?=
 =?us-ascii?Q?EOoAmIRRKu6kmU19IpDu/XUVTLCpZT4D54wBt2daigDoITdiH3i4POtvEtnF?=
 =?us-ascii?Q?wDlp9pEU0e13Z0HZpSA1AvMmn0iXSCa8CpIlNAePekd7g1uEHqATbzqwPLLx?=
 =?us-ascii?Q?QE2R74xXArpdYSrW3tAKolIpzXKj6byjeTGLuBumFzMf7yGKeX87bnBAXIkg?=
 =?us-ascii?Q?QL1dezS0yxRx38jJmlt5+FaB40XRPsYlpi6BygcFYC7fXIBf4AoG2ZE92DAO?=
 =?us-ascii?Q?Ek/pDqsQeDMmpLYnHGp/OnAwMj/WN6obZgtd/CwuSJN6D/HDaEa4KpA7F2Bj?=
 =?us-ascii?Q?K+WhLs8qXKuzv1/SlCBNXCXF5lCBt0tCWU9a43Ep2GlKwoUCf1iiFRegGkRD?=
 =?us-ascii?Q?jgONC5o4YwU17inKWRNoLpjMjMWXUkMDs1hGLv5QzEUL02poYuODQpjZfwjg?=
 =?us-ascii?Q?0u7eD1g/gdTYnK4H4XuAg0Ak3rsXVal6pdh2A062VsLjWiKpryauPqvzOunE?=
 =?us-ascii?Q?59WSOqI2SO9nxwophAn2AsEPxpHYeties64q6DtZHPull93tDxjMirrch7OO?=
 =?us-ascii?Q?k0bniMm8Kd9RQS9LG91acPlUQg4VTVbPHb/o1KvBZxIaI2ckR9ZXLmM7F8vV?=
 =?us-ascii?Q?uw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847d921c-a6a2-48e3-3f12-08de1b7cdf87
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:33:47.5960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eqxjrXV1h/e2jNT4noUUlCyVhrrdsNc4qi77CJP8OmDuACPi/BDNfgcigOj2AKxOHM7YfTjZxzmRzkYH/k3eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR06MB10123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 08:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225715

This should help to avoid problems that will occur if the modification
time of database file itself is altered e.g. by unassociated
process(es) on the file system which hosts the database file.

Since this change updates the database structure by adding a new table,
bump the 'minor' version number in database file names to enforce full
database fetch. This should also iron out e.g. situation where the
database might have inconspicuously omitted entries due to way in which
the mtime of database file itself was relied upon.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/cve-check.bbclass                |  2 +-
 .../recipes-core/meta/cve-update-db-native.bb |  3 ++
 meta/recipes-core/meta/cve-update-native.inc  | 42 +++++++++++++------
 .../meta/cve-update-nvd2-native.bb            |  3 ++
 4 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 259c699af2..7252c4ecdc 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -35,7 +35,7 @@ CVE_VERSION ??=3D "${PV}"
 NVD_DB_VERSION ?=3D "FKIE"
=20
 # Use different file names for each database source, as they synchronize a=
t different moments, so may be slightly different
-CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if d.getVar('NVD_DB_VERSION=
') =3D=3D 'NVD2' else 'nvdfkie_1-1.db'}"
+CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-3.db' if d.getVar('NVD_DB_VERSION=
') =3D=3D 'NVD2' else 'nvdfkie_1-2.db'}"
 CVE_CHECK_DB_FETCHER ?=3D "${@'cve-update-nvd2-native' if d.getVar('NVD_DB=
_VERSION') =3D=3D 'NVD2' else 'cve-update-db-native'}"
 CVE_CHECK_DB_DIR ?=3D "${STAGING_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-=
core/meta/cve-update-db-native.bb
index ca83c80958..c1db67ce55 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -18,6 +18,7 @@ def update_db_file(db_tmp_file, d, *_):
     """
     import bb.progress
     import bb.utils
+    import datetime
     from datetime import date
     import lzma
     import sqlite3
@@ -31,6 +32,7 @@ def update_db_file(db_tmp_file, d, *_):
     initialize_db(conn)
=20
     with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVar(=
"TMPDIR"), 'cve_check'), 'a') as cve_f:
+        pre_update_utc_timestamp =3D datetime.datetime.now().astimezone(tz=
=3Ddatetime.timezone.utc)
         total_years =3D date.today().year + 1 - YEAR_START
         for i, year in enumerate(range(YEAR_START, date.today().year + 1))=
:
             bb.note("Updating %d" % year)
@@ -82,6 +84,7 @@ def update_db_file(db_tmp_file, d, *_):
                 bb.debug(2, "Already up to date (last modified %s)" % last=
_modified)
             # Update success, set the date to cve_check file.
             if year =3D=3D date.today().year:
+                conn.execute("insert into MTIME values (?)", [pre_update_u=
tc_timestamp.isoformat()]).close()
                 cve_f.write('CVE database update : %s\n\n' % date.today())
=20
         conn.commit()
diff --git a/meta/recipes-core/meta/cve-update-native.inc b/meta/recipes-co=
re/meta/cve-update-native.inc
index 298c89b498..47cfb6a463 100644
--- a/meta/recipes-core/meta/cve-update-native.inc
+++ b/meta/recipes-core/meta/cve-update-native.inc
@@ -33,6 +33,7 @@ python do_fetch() {
     import bb.utils
     import bb.progress
     import shutil
+    import time
=20
     bb.utils.export_proxies(d)
=20
@@ -46,16 +47,16 @@ python do_fetch() {
=20
     # The NVD database changes once a day, so no need to update more frequ=
ently
     # Allow the user to force-update
-    try:
-        import time
-        update_interval =3D int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
-        if update_interval < 0:
-            bb.note("CVE database update skipped")
-            if not os.path.exists(db_file):
-                bb.error("CVE database %s not present, database fetch/upda=
te skipped" % db_file)
-            return
+    update_interval =3D int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
+    if update_interval < 0:
+        bb.note("CVE database update skipped")
+        if not os.path.exists(db_file):
+            bb.error("CVE database %s not present, database fetch/update s=
kipped" % db_file)
+        return
+
+    if os.path.exists(db_file):
+        database_time =3D get_mtime_timestamp_from(db_file)
         curr_time =3D time.time()
-        database_time =3D os.path.getmtime(db_file)
         bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_time), =
time.ctime(database_time)))
         if curr_time < database_time:
             bb.warn("Database time is in the future, force DB update")
@@ -64,9 +65,6 @@ python do_fetch() {
             bb.note("CVE database recently updated, skipping")
             return
=20
-    except OSError:
-        pass
-
     if bb.utils.to_boolean(d.getVar("BB_NO_NETWORK")):
         bb.error("BB_NO_NETWORK attempted to disable fetch, this recipe us=
es CVE_DB_UPDATE_INTERVAL to control download, set to '-1' to disable fetch=
 or update")
=20
@@ -107,10 +105,30 @@ def cleanup_db_download(db_tmp_file):
         os.remove(db_tmp_file)
=20
=20
+def get_mtime_timestamp_from(db_file):
+    """
+    Resolve the time when the CVE database was previously updated
+    """
+    import datetime
+    import sqlite3
+
+    conn =3D sqlite3.connect(db_file)
+    curs =3D conn.cursor()
+    res =3D curs.execute("select TIMESTAMP from MTIME order by TIMESTAMP d=
esc limit 1;")
+    latest =3D res.fetchone()[0]
+    latest =3D datetime.datetime.strptime(latest, '%Y-%m-%dT%H:%M:%S.%f+00=
:00')
+    latest =3D latest.astimezone(tz=3Ddatetime.timezone.utc)
+    curs.close()
+    conn.close()
+    return latest.timestamp()
+
+
 def initialize_db(conn):
     with conn:
         c =3D conn.cursor()
=20
+        c.execute("CREATE TABLE IF NOT EXISTS MTIME (TIMESTAMP INT)")
+
         c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, D=
ATE TEXT)")
=20
         c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY=
 TEXT, \
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipe=
s-core/meta/cve-update-nvd2-native.bb
index 01d3e8e754..77d7408b16 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -72,6 +72,8 @@ def update_db_file(db_tmp_file, d, database_time):
     import sqlite3
     import json
=20
+    pre_update_utc_timestamp =3D datetime.datetime.now().astimezone(tz=3Dd=
atetime.timezone.utc)
+
     # Connect to database
     conn =3D sqlite3.connect(db_tmp_file)
     initialize_db(conn)
@@ -141,6 +143,7 @@ def update_db_file(db_tmp_file, d, database_time):
=20
         # Update success, set the date to cve_check file.
         cve_f.write('CVE database update : %s\n\n' % datetime.date.today()=
)
+        conn.execute("insert into MTIME values (?)", [pre_update_utc_times=
tamp.isoformat()]).close()
=20
     conn.commit()
     conn.close()
--=20
2.47.3


