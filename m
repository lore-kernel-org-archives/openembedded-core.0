Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F130FCCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 14:32:21 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22256.1762180335060390657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 06:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=AbWYwzst;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.70.80, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FK7Xf3+AOlpRJJ6GZuOeoZbMABfRQMTEKBBHtU2GZElgOFp/vUXMXdqSZcaG87Iu1MTuJ1/YfYX2EnH6dJSdGYGRCvOn2XSQOC13USCbBST1JftRvE1C8ip3GVFa36b0A3fGJDuZF3H0bIbliFhiAHU8OhXcn0e0j7z86SFtGlsfpxngQfBL0gv9Mqw+nAxT/9qO4GS460GOClqSs0B6arzE2XMTKlqkBhq4mFb16fbBB93desaGAPwrohRvVC8idceXchNSEAHSNAmM/jo07Dr8Z6I4GqVlNy4wvsMHx3uwRx/B+EflT5ulJYSlyI2fQZ49dxy9KEmmwbLEiwdOXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRI0XxFeGw1lpJuVFmWffzfkts/c7kF854+sNyM0P1c=;
 b=AScUUQAxU9HiLO+QTjYiYb+G1KFMwWXFXNejT2vgktMGUtD7OW5hdQLyAUtIEH7AnN/ors5gJ+OSBtyca27hfPZRrE5JlcOcM6yF8k+41JhhekcdVhKaSYCCu8EEr5XMkYbWoVcq3FvKDnF3KQ8N/INY8HBH6DUpzN9Lfy0uXBsVlT/3hpJacwKnJnKzUyWsTqB51x2V+aOON3k6+OtPxuYkuf1vnM/Wajl+hrrfQehEqieNutI2apQUQderH0cz4yrAD+Ob07mb/oz2hW9FKBqbYK6i5eKmKcIeGogOt+Qgk4bFGSlQy0WrXU+oo+fM7OnaQgSUC/LAVq6slxWWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRI0XxFeGw1lpJuVFmWffzfkts/c7kF854+sNyM0P1c=;
 b=AbWYwzstxeH/I7WPy612YMIvKZOVi2qyo3AOWar5IxXAhJcZdG6Bttg+yuZE3EmGgRSS4jxMsLuPDlZESZkZ9gKpMIwbEQnd+YnPkuyIJf3U7QLod3bwnkMtO5ZmbbBC6feKl21TgjzEcrvpjZolRJiUHQBmCvRRgnzepq6DdOeC406pqba9dWi05mxnD51gJL0tlR6HfxBqbC3Nys4kw2ITtrOEME7RRYjWnKs3WGaLiiTIbRYaOl7oVLfefajWK728qJ5mIgtYu/B8DlcZek64oh+dGjSQvhsPQY0lUmASuMwGRuFm2GR03u//tf49UzXIXUVb2NQIgl5yJ501wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS4PR06MB8517.eurprd06.prod.outlook.com (2603:10a6:20b:4e4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 14:32:13 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 14:32:13 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	rybczynska@gmail.com,
	peter.marko@siemens.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 3/5] cve-update: Drop obsolete NVD1 support
Date: Mon,  3 Nov 2025 14:31:55 +0000
Message-ID: <20251103143157.315178-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103143157.315178-1-niko.mauno@vaisala.com>
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0085.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::8)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS4PR06MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: cdeba838-706a-4ea3-07e2-08de1ae5c755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ytai2fd0PK4VKKrk55ibmbinv4ULhJuZGgSGY9HEX3rjLV+KhfzEzjZM+85n?=
 =?us-ascii?Q?MpAEPysyyb7g2ouQrpIgnUf5cHgsChqmTHN2sxOh4WK8PesJrL/zR/Cu4n6c?=
 =?us-ascii?Q?v9mKTdKif1wKbFHg5B5L0snxYy2tppfw4sMN1OTafXu8bLnML67Uzwaj3VWm?=
 =?us-ascii?Q?X7oYnQIwqpE5JndjVsnBuOe0h+rX3YVMTgBCAxS08uCKX/F2VP5Oxs3sMniL?=
 =?us-ascii?Q?5h2DBCD4E8w/X5j9Z50tHdZ11Fmgpr88CsoEBH+AycL1v5T+DUEJx7a5SQB7?=
 =?us-ascii?Q?XAQ178F5mpnHv+5Vv+3/DU424wydbhiKq65kXUr9Q7O4BmMVbHowFW3Iuqf/?=
 =?us-ascii?Q?LyJjZjsDMLcKJq5pDReuvha+WXdRLCNw7nO1CU6kZzDg6PCns9UJLh6lYreU?=
 =?us-ascii?Q?WwuId5DPy4vkmqQWGDcWlAmr145sIgkDRoU7n2CzmY8IcuDUQiwNPYrz6GQs?=
 =?us-ascii?Q?58fCL6wjZflAouwEJcSuYKQm/hnlDQgz2Eh86TTmoODUO2ahI9yQHdxqtRcH?=
 =?us-ascii?Q?LmVxSlZFlyuqd++H/VpU1nRkxTI6wTHQ5ZgjwQBpn1lpD39yI5RRHxxlIv7N?=
 =?us-ascii?Q?pjfeQKujjEdAWdqUgG/OWUG099MIf0jpwVgD4dFH5jTBP8Bb8cJcCqnn6WMA?=
 =?us-ascii?Q?CvwI1QTOkIXzPUu+NgMvPV8ZcZox4ocxTLBlyIWhjjIbKFChzfloKqT+3BKb?=
 =?us-ascii?Q?FqndiotO75Rrbn7Zmh/bWYqM4uC4luZ0XagCjSAfP+JQDF9lnXGv9zGvl5ek?=
 =?us-ascii?Q?D9p7xcNqC2ewTyOaLr1p/mmrER8mncnb3jjUchyWXnru2kSaHRIJLvJy131f?=
 =?us-ascii?Q?WCWPYb7NQmXaF+miVjm+exhegdgesM68ZsJ0f1MIOfRryWiRT2ubYF+Qjcaj?=
 =?us-ascii?Q?Ei830gER7H/X8XsHD5cHzrKYCjKeJ/Rqdy25mJEf+5pi4UbeuFCh/de8LPfk?=
 =?us-ascii?Q?QnMT0C+U6Cb1izknkbi3V6Zqvf6MMEKNLzfp9LcdZJFr8lP3XZF6uU9g0cMd?=
 =?us-ascii?Q?eNI5X60slKdqmnFbjqxMflWo3N0NDxLH/F4QhPJTpcf2XdYSZDsKbZ57y0Fi?=
 =?us-ascii?Q?9y+/5nZw69ZKKCnQMAetFVmEospksp6N8gHLN9nYpHCtmyj3cabcbpm8XL0n?=
 =?us-ascii?Q?dwZDJjvSqLPW9qiD9EUaLGAMoQ4Cw6Pl04pqtErplA0AeWqt7OhKwij6DgtX?=
 =?us-ascii?Q?+/5orBPlzUArVrR+LNUYh3bG4qH0UKxn0hOozveJg+EIevngviIHII1qE+X2?=
 =?us-ascii?Q?n6xS7VpQJp90PS7hTvghOsuXX66IeysHqQD1kpbh25x3Q6b1P0c/C9iMZkN2?=
 =?us-ascii?Q?AudR9STGtS0CgsMbRmJOCltiJOHBw26vYhpxkTwdtnVO8xWsyfBuxoWZ0CAL?=
 =?us-ascii?Q?UW96wykilTCPnVwLVNoLCXnkA9C6y+T7GJVGMCXvTP6Dc3hvK5NACNG4XdYd?=
 =?us-ascii?Q?z8WWbgC9kyTaYhq0BESHssPyIBx4HQhUfmk8nSwNHGspjrz7id3NdZp7K0Dj?=
 =?us-ascii?Q?2A2yj120i1FMnJ8KXaC/LkfYUNnE/BoAap2G?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6R2dbJljDEyF5+6JfWKJnmPpE/ikM+0VWd/g4kckl6JQr1025WMZ39YFkElL?=
 =?us-ascii?Q?mph2oDQ+2ccT+S0QqwKOFgWvePY383Ly8pWLBH0mAhUgXXvC2XA05QhYcW3S?=
 =?us-ascii?Q?gaZzoBYW3B1UdKItwrr82rhugcXcS6uODtJyBjRpHiNg8hXCjzDPSmBU28U+?=
 =?us-ascii?Q?rfOBgRlyAHAab6mUbosXA7XE3K/PaxC7JSV67ad/cOPV7sMqgjgOyCgQYLb0?=
 =?us-ascii?Q?X293UJnUwmeRr5OhRYgvEX3djz8fv/kvBdfOpZlFY4tl7O6U1deOpjh4qZca?=
 =?us-ascii?Q?l1HUWRsOd1WrspjxsEUz8rnoi2HSCZlxJ37M97hXPFv0f1DEvveS+x0l/BlA?=
 =?us-ascii?Q?07SlVjbl0M3I4+gwTwiPPcm1Pho3IBnitIfRj3edJOzXl5FkOKLT+rN6qT8N?=
 =?us-ascii?Q?HYC+Eap98PJw7xsVoy7tKXqZQ9RbyXnWJ0SzdNHaZUT/7lCn5uq5uYHavrVF?=
 =?us-ascii?Q?XMYzi2vRLUtDwUFSYi5O9GtdJkA7l26UhGcpiKeEOd9MHVkuhkLzW9CGGnmA?=
 =?us-ascii?Q?R8d8S8X2jz+nkkXUe3LcmbqV9ohwIzmjpuw/HXZdCXiDThvPd/ILaSndwr22?=
 =?us-ascii?Q?shv+Y70PYtv7ZGuxFEFB/hPZsXLmsUi0P+o4sDhisr3L8+jMdnKnXIBBMB2Q?=
 =?us-ascii?Q?IYFILmQQ5rcWFqyhItIqANROkRhgHH/t47iURmTZKp6l7ZxFsSJYHigDu3BR?=
 =?us-ascii?Q?E8ZqG7GABcz3ivuBwR/HFPfhph/sFbWe/xicV7Zj74pWvnl0ca4G06Ch01Z7?=
 =?us-ascii?Q?7ESxO7sl0Ib+ErRWiOiqcoZp2modyO7xs6vAzEb1h881V3xZq5RKjts94qSq?=
 =?us-ascii?Q?rYnWf6ENyKO6hkzzk/3Lty+6gSdRiOtyjVCcrmJSoszTqqmD4E2/j1Wz1xqP?=
 =?us-ascii?Q?V5C4v6zpbg3UG0VSwtZKEMgqODjuznYRLEv7hMxk85JxoyDMH7K9yO3GuPCR?=
 =?us-ascii?Q?C5o0bPxlznWikA8hZnd6n5GfHxDQmrJttRv8ozcq6IRO/C9F+2gDJwqpvk8o?=
 =?us-ascii?Q?xFOkynhsfCoXtu6tL5hrOniqajcXZgONzqegVDNFTvV1kPY5pNbFAJ0v35uC?=
 =?us-ascii?Q?6Pcp3c3z1fUvHhntvicMyC2/MZYuq989IksKQKUYAo6oXFKcg4ye9BQeMCqz?=
 =?us-ascii?Q?CD2sdJhJJSp5mLJakgnnN36CW/XtrldlX4+U3/CoiEuLea8lSsIF9/yrSU6K?=
 =?us-ascii?Q?t/3788ysBQRaxHjuQP1tkyDTjREUKJ2W6xtmztNmwYwIwfZhT8Cg9l3/N+Sw?=
 =?us-ascii?Q?xArn9U2CQnacDLf1ayaKybfz0qbMLky15LOrejmJvK/syYQn6vckdn5/c/MD?=
 =?us-ascii?Q?8vs3QtoZB7rH4RjeDeZiiENRiuKYE2k25tNUz0nFRon+w4b1s8nY44rG+sXq?=
 =?us-ascii?Q?QH/q7MyITvRTNilBPZlG8lW2E5C4wlVidCBXiYptvOH/zNyoB2IASjMSvlhw?=
 =?us-ascii?Q?t2Su1CMOkG/PWTfijSzVrlviGn94gJaoXSnluzyvGrvJilbBuEhSDhCkN9Dv?=
 =?us-ascii?Q?jvCP/XOumctkwJOh74TptXAV2dE/59X72xZX2Wuc1MXuCD+AzyaxOLEIUirF?=
 =?us-ascii?Q?tQ4j5/ifbo72oLu0f2JH/8wCzsJrAu9EuTz/bBJE90pb5dSZbAX3z2w+3RGP?=
 =?us-ascii?Q?vQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdeba838-706a-4ea3-07e2-08de1ae5c755
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 14:32:13.1860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajvhN4afcg6GkbvPSU4A5SvF4/LGw+YvOCuskAVsrANDyUAC94cuoskFEeTKdl5TNpZAaSrYWuPBCZllWhT1GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR06MB8517
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 14:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225660

Since enabling NVD1 as NVD_DB_VERSION nowadays leads to BitBake failure

  WARNING: cve-update-db-native-1.0-r0 do_fetch: Failed to fetch CVE data (=
HTTP Error 403: Forbidden)
  WARNING: cve-update-db-native-1.0-r0 do_fetch: Host IPs are 172.65.90.26,=
 172.65.90.25, 172.65.90.24, 172.65.90.27, 2606:4700:78::90:0:180, 2606:470=
0:78::90:0:183, 2606:4700:78::90:0:181, 2606:4700:78::90:0:182
  WARNING: cve-update-db-native-1.0-r0 do_fetch: CVE database update failed
  ERROR: cve-update-db-native-1.0-r0 do_unpack: Error executing a python fu=
nction in exec_func_python() autogenerated:

Remove the support for obsolete NVD1.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/cve-check.bbclass                |  8 +-
 .../recipes-core/meta/cve-update-db-native.bb | 87 +++----------------
 2 files changed, 15 insertions(+), 80 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index c63ebd56e1..259c699af2 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -31,11 +31,11 @@
 CVE_PRODUCT ??=3D "${BPN}"
 CVE_VERSION ??=3D "${PV}"
=20
-# Possible database sources: NVD1, NVD2, FKIE
+# Possible database sources: NVD2, FKIE
 NVD_DB_VERSION ?=3D "FKIE"
=20
 # Use different file names for each database source, as they synchronize a=
t different moments, so may be slightly different
-CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if d.getVar('NVD_DB_VERSION=
') =3D=3D 'NVD2' else 'nvdcve_1-3.db' if d.getVar('NVD_DB_VERSION') =3D=3D =
'NVD1' else 'nvdfkie_1-1.db'}"
+CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if d.getVar('NVD_DB_VERSION=
') =3D=3D 'NVD2' else 'nvdfkie_1-1.db'}"
 CVE_CHECK_DB_FETCHER ?=3D "${@'cve-update-nvd2-native' if d.getVar('NVD_DB=
_VERSION') =3D=3D 'NVD2' else 'cve-update-db-native'}"
 CVE_CHECK_DB_DIR ?=3D "${STAGING_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
@@ -108,8 +108,8 @@ python () {
     extend_cve_status(d)
=20
     nvd_database_type =3D d.getVar("NVD_DB_VERSION")
-    if nvd_database_type not in ("NVD1", "NVD2", "FKIE"):
-        bb.erroronce("Malformed NVD_DB_VERSION, must be one of: NVD1, NVD2=
, FKIE. Defaulting to NVD2")
+    if nvd_database_type not in ("NVD2", "FKIE"):
+        bb.erroronce("Malformed NVD_DB_VERSION, must be one of: NVD2, FKIE=
. Defaulting to NVD2")
         d.setVar("NVD_DB_VERSION", "NVD2")
 }
=20
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-=
core/meta/cve-update-db-native.bb
index 3a6dc95580..4423216be5 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -11,7 +11,6 @@ deltask do_compile
 deltask do_install
 deltask do_populate_sysroot
=20
-NVDCVE_URL ?=3D "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
 FKIE_URL ?=3D "https://github.com/fkie-cad/nvd-json-data-feeds/releases/la=
test/download/CVE-"
=20
 # CVE database update interval, in seconds. By default: once a day (23*60*=
60).
@@ -108,30 +107,12 @@ def cleanup_db_download(db_tmp_file):
     if os.path.exists(db_tmp_file):
         os.remove(db_tmp_file)
=20
-def db_file_names(d, year, is_nvd):
-    if is_nvd:
-        year_url =3D d.getVar('NVDCVE_URL') + str(year)
-        meta_url =3D year_url + ".meta"
-        json_url =3D year_url + ".json.gz"
-        return json_url, meta_url
+def db_file_names(d, year):
     year_url =3D d.getVar('FKIE_URL') + str(year)
     meta_url =3D year_url + ".meta"
     json_url =3D year_url + ".json.xz"
     return json_url, meta_url
=20
-def host_db_name(d, is_nvd):
-    if is_nvd:
-        return "nvd.nist.gov"
-    return "github.com"
-
-def db_decompress(d, data, is_nvd):
-    import gzip, lzma
-
-    if is_nvd:
-        return gzip.decompress(data).decode('utf-8')
-    # otherwise
-    return lzma.decompress(data)
-
 def update_db_file(db_tmp_file, d):
     """
     Update the given database file
@@ -139,12 +120,12 @@ def update_db_file(db_tmp_file, d):
     import bb.progress
     import bb.utils
     from datetime import date
+    import lzma
     import sqlite3
     import urllib
=20
     YEAR_START =3D 2002
     cve_socket_timeout =3D int(d.getVar("CVE_SOCKET_TIMEOUT"))
-    is_nvd =3D d.getVar("NVD_DB_VERSION") =3D=3D "NVD1"
=20
     # Connect to database
     conn =3D sqlite3.connect(db_tmp_file)
@@ -155,7 +136,7 @@ def update_db_file(db_tmp_file, d):
         for i, year in enumerate(range(YEAR_START, date.today().year + 1))=
:
             bb.note("Updating %d" % year)
             ph.update((float(i + 1) / total_years) * 100)
-            json_url, meta_url =3D db_file_names(d, year, is_nvd)
+            json_url, meta_url =3D db_file_names(d, year)
=20
             # Retrieve meta last modified date
             try:
@@ -164,7 +145,7 @@ def update_db_file(db_tmp_file, d):
                 cve_f.write('Warning: CVE db update error, Unable to fetch=
 CVE data.\n\n')
                 bb.warn("Failed to fetch CVE data (%s)" % e)
                 import socket
-                result =3D socket.getaddrinfo(host_db_name(d, is_nvd), 443=
, proto=3Dsocket.IPPROTO_TCP)
+                result =3D socket.getaddrinfo("github.com", 443, proto=3Ds=
ocket.IPPROTO_TCP)
                 bb.warn("Host IPs are %s" % (", ".join(t[4][0] for t in re=
sult)))
                 return False
=20
@@ -192,7 +173,7 @@ def update_db_file(db_tmp_file, d):
                 try:
                     response =3D urllib.request.urlopen(json_url, timeout=
=3Dcve_socket_timeout)
                     if response:
-                        update_db(d, conn, db_decompress(d, response.read(=
), is_nvd))
+                        update_db(conn, lzma.decompress(response.read()))
                     conn.execute("insert or replace into META values (?, ?=
)", [year, last_modified]).close()
                 except urllib.error.URLError as e:
                     cve_f.write('Warning: CVE db update error, CVE data is=
 outdated.\n\n')
@@ -224,17 +205,14 @@ def initialize_db(conn):
=20
         c.close()
=20
-def parse_node_and_insert(conn, node, cveId, is_nvd):
+def parse_node_and_insert(conn, node, cveId):
     # Parse children node if needed
     for child in node.get('children', ()):
-        parse_node_and_insert(conn, child, cveId, is_nvd)
+        parse_node_and_insert(conn, child, cveId)
=20
-    def cpe_generator(is_nvd):
+    def cpe_generator():
         match_string =3D "cpeMatch"
         cpe_string =3D 'criteria'
-        if is_nvd:
-            match_string =3D "cpe_match"
-            cpe_string =3D 'cpe23Uri'
=20
         for cpe in node.get(match_string, ()):
             if not cpe['vulnerable']:
@@ -290,44 +268,7 @@ def parse_node_and_insert(conn, node, cveId, is_nvd):
                     # Save processing by representing as -.
                     yield [cveId, vendor, product, '-', '', '', '']
=20
-    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", =
cpe_generator(is_nvd)).close()
-
-def update_db_nvdjson(conn, jsondata):
-    import json
-    root =3D json.loads(jsondata)
-
-    for elt in root['CVE_Items']:
-        if not elt['impact']:
-            continue
-
-        accessVector =3D None
-        vectorString =3D None
-        cvssv2 =3D 0.0
-        cvssv3 =3D 0.0
-        cvssv4 =3D 0.0
-        cveId =3D elt['cve']['CVE_data_meta']['ID']
-        cveDesc =3D elt['cve']['description']['description_data'][0]['valu=
e']
-        date =3D elt['lastModifiedDate']
-        try:
-            accessVector =3D elt['impact']['baseMetricV2']['cvssV2']['acce=
ssVector']
-            vectorString =3D elt['impact']['baseMetricV2']['cvssV2']['vect=
orString']
-            cvssv2 =3D elt['impact']['baseMetricV2']['cvssV2']['baseScore'=
]
-        except KeyError:
-            cvssv2 =3D 0.0
-        try:
-            accessVector =3D accessVector or elt['impact']['baseMetricV3']=
['cvssV3']['attackVector']
-            vectorString =3D vectorString or elt['impact']['baseMetricV3']=
['cvssV3']['vectorString']
-            cvssv3 =3D elt['impact']['baseMetricV3']['cvssV3']['baseScore'=
]
-        except KeyError:
-            accessVector =3D accessVector or "UNKNOWN"
-            cvssv3 =3D 0.0
-
-        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?,=
 ?, ?)",
-                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVecto=
r, vectorString]).close()
-
-        configurations =3D elt['configurations']['nodes']
-        for config in configurations:
-            parse_node_and_insert(conn, config, cveId, True)
+    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", =
cpe_generator()).close()
=20
 def get_metric_entry(metric):
     primaries =3D [c for c in metric if c['type'] =3D=3D "Primary"]
@@ -338,7 +279,7 @@ def get_metric_entry(metric):
         return secondaries[0]
     return None
=20
-def update_db_fkie(conn, jsondata):
+def update_db(conn, jsondata):
     import json
     root =3D json.loads(jsondata)
=20
@@ -403,13 +344,7 @@ def update_db_fkie(conn, jsondata):
         for config in elt['configurations']:
             # This is suboptimal as it doesn't handle AND/OR and negate, b=
ut is better than nothing
             for node in config.get("nodes") or []:
-                parse_node_and_insert(conn, node, cveId, False)
-
-def update_db(d, conn, jsondata):
-    if (d.getVar("NVD_DB_VERSION") =3D=3D "FKIE"):
-        return update_db_fkie(conn, jsondata)
-    else:
-        return update_db_nvdjson(conn, jsondata)
+                parse_node_and_insert(conn, node, cveId)
=20
 do_fetch[nostamp] =3D "1"
=20
--=20
2.47.3


