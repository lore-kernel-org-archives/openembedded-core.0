Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16445CCFA06
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 14:32:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.97])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22259.1762180339875654168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 06:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=BVxpSNS8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.162.97, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lluG+ZiWFHioJWLtNynui13WitaTKN6c64wLYZstL/TZjUfZNbi/pJNku1N0wB39LEbLwFDmW8w7HtEyJnDGMY7JwybCnehTKxxfj6dhjrpqliBPvNlFtB011Snkzv3mhpEwChJOe1n3u0dJwUmlBVlGoP4MP3YCX07MkJzpSsO9+u1FF9xsnqWkucvPWubWJNC7kLqletQAE58xw2hIyB+qpbaE8F/hv8Q2B/jtbersqRbtals0S2X5ByhjlYkBlKUW0dknQzA0lLO/LHMjUBrzJ5injbm29ODN47EnOvrJUtwvs+uyyxp8EZ1YWwMQV2T73coQ2o4aULuqKgufNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7M0nXrtmMKZZ18RNZBIajlvwXXjRjOOR9qdlqhHyNo0=;
 b=ZA9c+R2X8/ATFRbHH/VXqmIEerzAagpulCHrkSbCJfcJxFURuKYoMHj2wD6e50FEOvjyoGNdXW/tuCrK35TWZgAcERAUQ+ulH2mvNss8QddV50c6/RuWvUvZRql12p0dJ40B1qW56fRWWjb7C0E9BjRrT0sVu8RHQ43ixJNhTpppX8/q3d7E2ZEVtYxKN4sMpzgShdcOB/D09E5gaByfh/U8+yBfLGJuC/Ej9EzF2Nk8ghVfSt5go4QOIv/Vcnbkb0YJT8u2BBob08L1bFbINtARMHmF5L4KqYpLyGWNehYD4tqE5+gD804xQbjd/9TyaWXqV30i+gncyj1+MgvLQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7M0nXrtmMKZZ18RNZBIajlvwXXjRjOOR9qdlqhHyNo0=;
 b=BVxpSNS8zjnKNEK9UydpIENvyc/w5s5V89yIJFMdg74dGsOd8bv3F2S/V9BNQvo3kX1VJuLHMcaoaQxfVBaMYNeHTTPTHI9v/EW9SFtg36IKy1/t+NkLaqa2vl8g70jWw/0SjhrQqJ5qfehd1zsAHtuz5Xafzea5R+22osk94+ZG1nH9eIOJC9BcyegFfLUgoexA5zotpbTp2Lg0jgB8v59oxl/Ntdfp90GMYPyP0g4oXGE2rYZwnKyGDdDa2hwAy6LxjJiPWQw21QNzyDZLsZNlc9s2x0axG4yVz/QWTuqKATeWRX79AGhBpkX5NKyLRSjhIZCeUmXDedOIxX1xLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB8407.eurprd06.prod.outlook.com (2603:10a6:102:22b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 14:32:15 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 14:32:15 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	rybczynska@gmail.com,
	peter.marko@siemens.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 5/5] cve-update: Keep mtime stamp in the database itself
Date: Mon,  3 Nov 2025 14:31:57 +0000
Message-ID: <20251103143157.315178-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103143157.315178-1-niko.mauno@vaisala.com>
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0085.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::8)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 56083833-d437-4815-4784-08de1ae5c882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lnBoZKkfBv/V83NAQKWonIVyGIdnrumcsk79n6ZAkzDOIpJEsqmwNvDm2651?=
 =?us-ascii?Q?bz8LPWGA+pahdBm6KHPA4YdIY6KmbApH6LXcTzcL5e66wSbpBx0WU+E4K4TZ?=
 =?us-ascii?Q?qrErvrPXzZrfmtVHSfZYzuSghWZvnYdnx0eoU4vjiVIbjvAsw7UV5tyiND3b?=
 =?us-ascii?Q?RW9SCAhpADEcDdWx8Gg1eJEY9zJrWR3f40in5NPzHW80uKh333BV0LYjOPZI?=
 =?us-ascii?Q?3d+3Vrl2RtXd6Bq8ohNzZq2r/1XpKB1KCP5Xanon/toZnrfiqHmSVpYL03Bv?=
 =?us-ascii?Q?fOWrGY6vPGC7Vmr8c31zCpOWDRF/bxSLpMcHLeprcJLpDPhCNoMmqp5tHr4R?=
 =?us-ascii?Q?KqbfY3q/O9Hs2oChgoQwDWnVt4CtnYXEqnEvvn+qAnCZIAy9RYp1wDbijO5D?=
 =?us-ascii?Q?zvizIh6dOJnVyFJFKyDydUT3DSP1prpKPKrMrhBZtjWqUn17wfq9zV2gi4w5?=
 =?us-ascii?Q?esYzAiQ2pY8HeK/JSxtwJjH56qLhwathkNt0hSLb+WZFZhkNg2A/ZPu+t65G?=
 =?us-ascii?Q?1VQdORx1SodxqVGD5wTc+/qyD6GtJaY3OHUd1TGUcNgoKEe/L7Fw5K45yjN0?=
 =?us-ascii?Q?TFFR9PFdF9RFPj5f897VvsPNeu7qoJvm3kY2gn2vHkF9GHJzIOizfJCyoshD?=
 =?us-ascii?Q?fkau6Vtru8SIyO0dE2t1CkTC6TroVy1nqyU7CGt5HQ28S3aMOrqFmsiL+oda?=
 =?us-ascii?Q?Gp+0XK61Rez/UBhNm3Oz8fgz8fpZ9ptm06rfI3sX0ikqKlM3XlZN+dO3JpC0?=
 =?us-ascii?Q?3B+zi03Tlbt5zwx8EvBH0/A4e8AKXlrKjhmJF5LWJY3E15TEgqt/zzQfGuBa?=
 =?us-ascii?Q?K2DeMbzC1zo7OVEYqpaFGsviPpRNuzxEHc6jt1ksw6MQ0rdWUkhotps7RI7w?=
 =?us-ascii?Q?AJMe8TZbWpFIKuDQOL+2zi3qFMCTi4ggU7bH4XdLSa+XXo/+/FiVmBG7DgZ+?=
 =?us-ascii?Q?Jri+s+cMbIAckAdInMA0TcH56tHExaaUl2yXz/sKDkzRIL7JqhfMbGwyKtmh?=
 =?us-ascii?Q?w0aiBUll0hB6AQStj9XuYMYDbgQsAHHhNsiYWcaYGHADIhPo7bn5AM9SNXG8?=
 =?us-ascii?Q?bKxteVOJpQxjMphXZD7WVIp23WDAIKk2XR+5/UowvHkoTCjnZnB9yk+qk+6v?=
 =?us-ascii?Q?rh/Oge2X3lbKdTtwcZlnycJJ+Qqnkz5npDChgjCrdiIgmoVdQC5gCVstW5Rx?=
 =?us-ascii?Q?hRJJGLwQBXFL7Fs9P/4UNhx++Tc/I3iRx9G30fBjYQUQo4TvIcQMYb2kZv8R?=
 =?us-ascii?Q?g+8F7t5HWd6DrhkjD6bA3Q9OoGL0+qhwwzgYCF39zJeuCcXyQHIh05YOE3/W?=
 =?us-ascii?Q?67LoD/NGdNFmmv2IwTwxhCZelHOvvwWO5bBSC7JQki1VJuaKDBhqn2g+rtas?=
 =?us-ascii?Q?aq8FanZuWwHAQosgYR/zZMU7BLErCZvLsgWe8Z4Skj3RETRAaEeN9gIVfAju?=
 =?us-ascii?Q?DtcX0WvbLGhOBlUBfkcrHwyzBjJ/7KivWgjE0F+CcjABmWs9XaldEH8HoRs9?=
 =?us-ascii?Q?nYZ0TUvo2Y3T6k0i1I+QQWFvfe3L9LvkTvac?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NHzfGd85eIOc3nw1k3UyuLOqkFTTb863a0G8DrcF7m78pmLj6OsXLdrr+Qnr?=
 =?us-ascii?Q?ptBg1OQ3fZmQLO2Oq/pe6NxYhJBCFm1wV0JzopdcUPRFJ8NFkJ5HcIsQiiGb?=
 =?us-ascii?Q?u/MlQLauDJtF+41ID7Otkg8VgYcFbiadjAd6qVpNewdeuClM+NUidZGhTQx6?=
 =?us-ascii?Q?9herqFoYhpj+8NAc+9JAj4olIvqn8FrzhulGnEsyt3lgtKHWTZpfBOXbrOl5?=
 =?us-ascii?Q?Aov996Mk7V2IBtlNIwmwewJgoE21kO2/PE/37FwivTPXvK4HKWuiQd8HZurt?=
 =?us-ascii?Q?Ofv30E8B+hyUVXGRxfI/w4H7xEOQ7i9cbgdz9crWDXQIJwXnq0j7ZFrB6au9?=
 =?us-ascii?Q?2RM52xJxrM9Ne1WBPLAslNPCb26zJm9NyPBb/iqIYvNbuieLdJgh+8SPj4Ku?=
 =?us-ascii?Q?+tGPKtMoQ+A8ovlQ1VQf5qeFccNWXWZWm2Oo2skocdV2hFqbw4BPQFS/S1M/?=
 =?us-ascii?Q?mZH54VQOzOuRKLobJxGvwjhrsqL8q4UqfiADfsLd//WCTcif7+e4bY7oz+2x?=
 =?us-ascii?Q?iLGFziD3j6MmWR6FtVQUqc49qmqrecGyWksd53WyhSrG5dV4EOrgtKMENvmN?=
 =?us-ascii?Q?chnyEXwnjPr0jRjrAb30sl9bnfk/TZxapk5Siy209fq4q/cjrDaWKli7l7dT?=
 =?us-ascii?Q?6bfwSi1CyCCIp1xpf1b3aTay+3j7/CpOBpDgTb7BFLUJKjwKrwWmlYbgULGK?=
 =?us-ascii?Q?xCXZCfHIr2SpH4Gg/tGU7FRcy+C8dqK/KRb9rmYh/GorzSzmJ/Ryv22Igxm1?=
 =?us-ascii?Q?bnfZu47wcQI/PKTjhkwprMS3To7cTggqtyMCkfJhrDWTsCIgvyxJjaNfQ01k?=
 =?us-ascii?Q?JdtW8LXFA7phlcRh+/JC/KgDkVhorEANSAiUAIfbUyywWyE7VDyBXml4Wef5?=
 =?us-ascii?Q?acrjA44DFRB/cbooC921AANRE9fKEbXjbseRRhc5P6jXCVVxpofCC2sjw+K9?=
 =?us-ascii?Q?2Uw2NJhezPjl+Hg0kxY6JaMV9KXwzduQVESzonCRiyj5WsEgNhxDQU9ODtcS?=
 =?us-ascii?Q?1OGUf3MYB8zvtryGeyH0rH/V4g+YS8Sy/MK4YyzXLutHKghwab7PxPYIDKdG?=
 =?us-ascii?Q?rMVbrRGaJg1dTT7fRyBtmZby1prAfRYAKnQFbaGutL3mWRPAkei/SiknXZOz?=
 =?us-ascii?Q?Ph8SWhIvDwI0i8L+xU6fmS7p1KhbYgJxbykrdq5wOOtVZOx7qhQYYHpQu3zD?=
 =?us-ascii?Q?qk2VGANrXjp2GnxoV6/WMeaIYLCb4sUnpDIPBcIPtAPPFQnNYQ4Y0dkYAroS?=
 =?us-ascii?Q?UQ8H4ZxLDJBAy65n0H+XEgdx/6r7cNQdWXmUq6csbMplOGydw9aReUJcFt4n?=
 =?us-ascii?Q?/ZpiK2onjcDhnMJQgvpIeLmDpjgbASno2QsAqjUde5qN7iqWstwgdluJvENq?=
 =?us-ascii?Q?B+rgPU4JXiC4C9gcSRhwouT6O2t2TrnVhI0OUZsQfkeRTo+UfjxXbyaI/MY8?=
 =?us-ascii?Q?5ue6TCtrJBQWzuXBQjHlLTd2Vx84hJ33TI6gMLLEyK2XqNxxe6zVeyQVRHB+?=
 =?us-ascii?Q?eVQpovWZucLyTIXjIQVNaLAl4SYVyFc+9jhGVGVpbVEe4nepkNCc/Ex/a5du?=
 =?us-ascii?Q?tBiJcAfaVcyxwUeeQW7ciIteM88dUoz2xknK0na/kXc5/wcEh65w94+eq+fk?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56083833-d437-4815-4784-08de1ae5c882
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 14:32:15.3522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29jbAwFxl3CxCrlHG2gZRAomPNvW0MRx/dARL9AdDq02YXgkRu68pU4sOJH9Jb/KtXHSc7khRuWH1fyYFTirHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8407
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 14:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225658

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
 .../recipes-core/meta/cve-update-db-native.bb |  3 +
 meta/recipes-core/meta/cve-update-native.inc  | 59 ++++++++++++-------
 .../meta/cve-update-nvd2-native.bb            |  3 +
 4 files changed, 46 insertions(+), 21 deletions(-)

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
index 298c89b498..2934f7ad07 100644
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
@@ -46,26 +47,24 @@ python do_fetch() {
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
-        curr_time =3D time.time()
-        database_time =3D os.path.getmtime(db_file)
-        bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_time), =
time.ctime(database_time)))
-        if curr_time < database_time:
-            bb.warn("Database time is in the future, force DB update")
-            database_time =3D 0
-        elif curr_time - database_time < update_interval:
-            bb.note("CVE database recently updated, skipping")
-            return
-
-    except OSError:
-        pass
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
+        if database_time > 0:
+            curr_time =3D time.time()
+            bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_tim=
e), time.ctime(database_time)))
+            if curr_time < database_time:
+                bb.warn("Database time is in the future, force DB update")
+                database_time =3D 0
+            elif curr_time - database_time < update_interval:
+                bb.note("CVE database recently updated, skipping")
+                return
=20
     if bb.utils.to_boolean(d.getVar("BB_NO_NETWORK")):
         bb.error("BB_NO_NETWORK attempted to disable fetch, this recipe us=
es CVE_DB_UPDATE_INTERVAL to control download, set to '-1' to disable fetch=
 or update")
@@ -107,10 +106,30 @@ def cleanup_db_download(db_tmp_file):
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


