Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80133CCFA07
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 08:34:11 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.118])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13398.1762245230231928511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 00:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=R3U9U56S;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.130.118, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w08r3VF0qjUesMoSAxNF9LDY7ajk30LmTgqtddXJq828ey1KrHptfrg39tV8W0+v0gIhruwejOC5N8J4r5IURSrubS2PFTypmwGXrpa0VtLe2DztPGceTfPWVnz6maRmeVrsY2/ByfGvh8XK5852vy2b5XnOf5ev9hV8qvIXcX/Q6FHUMyllaXuhCnBhWVtj7ccVncWPouC6SYlCUvfzKt9CISSQ1YCC/aZQ2VzfOzwn2qq2Ue73c1Snd7VwWUt8QBbqs+jqX/DVhF3A70fijmodn4U4EwyESzSHjgbhc144ucs6sv6Cd6WTa6x02i5g3Pi4B7htyabUmMP6R31WNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRI0XxFeGw1lpJuVFmWffzfkts/c7kF854+sNyM0P1c=;
 b=ALh/XJKl66SogK4/wuPNUdUIhaj4ldz/aeXgIAm2RgqqJlDArv60nrmz2u4CipcWyM8YeNW7YPq+pz3CIE2gCMtuT5+HxW9tSohjaxeci5d5JU0N+yPBwVmfuvBlxbqWcTwOuyFawObLgdbn8StUrPpzosOLbFqm6FBsUWfXUE95/Opk1KzoKKwUV+qHM1ni372Z+D1tA/HXTuDBIRHIE/fTvnhHsXw05y8KAYpniaO/zUdci9RK+rQ69BAeQ4yQQCNIPXGxQ6xeN1VTm+tXPJr7KFV+yvUIG8aIcIv2I05xSdhSc5Stz49cCifbZ/cjDePYitU2uOvZfbTqo6BoHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRI0XxFeGw1lpJuVFmWffzfkts/c7kF854+sNyM0P1c=;
 b=R3U9U56SLvQ/bCiFcJtyZIu2RKAn8j+Pl1ich6U7gCDCgQuUgwM5watFEc+8z8UC727qjcpVqlIp3jn9do1Ujdg6tyJBBUPUdhhP/vmEAlJtCNFfq8ztAT/U/nOowQmW55fB3j7CzbykhmTqzGCWWtNdqi+qQYsNAgSf8ezKgpmo7mx12FPvHf9d8zyo8CrLGVpmgwEyFIj83VquxCA+dx8oNQDkIqZsfqpUFU+chEtAXa+p19lw85QEbV6WlPmIO6vB1tLLC6a1QZSJ+a7IkloJNGWhgEPsTlNIGxvknKZlTrpAqg5MYW+8S4Mr+gANxFgkZIQPVO4MgE0k07SJdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7405.eurprd06.prod.outlook.com (2603:10a6:102:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:33:46 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 08:33:46 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	rybczynska@gmail.com,
	peter.marko@siemens.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 3/5] cve-update: Drop obsolete NVD1 support
Date: Tue,  4 Nov 2025 08:33:31 +0000
Message-ID: <20251104083333.814331-3-niko.mauno@vaisala.com>
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
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: 33eedf9b-7e25-4b4c-2d0b-08de1b7cdeb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7CKw49E92ioRfFzbCRCfTecISlKM2GXfgLNGOqUITarg42IBLjoWjQCHY3Ey?=
 =?us-ascii?Q?llFoIliq9eqWZ7eO2x4yNeJEaffPPV1ZZdkZ/2xBMYX4aCC5jrTFlSAUS9Vb?=
 =?us-ascii?Q?1I7nGofe6xlMveujG0POorR5kK7xdhjnozIwA+130CD4Dy7ORlOVplYV/rvE?=
 =?us-ascii?Q?kNcIA5SbZJneOcrkTYRcXaG57mxW4K/0HMz4Xp3Qv8WcfRe4XGuMQOGhKBGI?=
 =?us-ascii?Q?s5MuWCaJQCxvaCSPeUvsPGYz0TQZuzOTrRcn67qzwyQDvCFgIBniFv+kny3a?=
 =?us-ascii?Q?Iaigk/7ZiqTwdUr/Rhuexl8rYbnb9ylIJdsn1c6Fe9BNluex83K6fL9NQcfT?=
 =?us-ascii?Q?8nMIRjb8fPB4opyTZuwHl+9ajhe6IIeqEsL+V4838TibORYmf/qbvIdBivtA?=
 =?us-ascii?Q?QuMQWRUBlRimk0YrqyHDzNx7TPhpgS/cm0xH7LRUkRSF5AkL3cZ/UjFWIeMZ?=
 =?us-ascii?Q?1c32p19InK6UzMoZbOUYm4cgF/tmNpYbnmJ7LK7VMZfcltpHifx0bMRhpAWH?=
 =?us-ascii?Q?MJ/hPrigscTzJUj9cPhIDaUc2ujsATc87GI0OlzJrQm7A1+E6sFVv0n/VZ4b?=
 =?us-ascii?Q?IIa1F3ofOqngUxr0+ZpN7PjszFOdZf2LTDqp3O2d08k5Uyv4q7UePXJccL7x?=
 =?us-ascii?Q?Ed1cOYsSltZUUT67f71zuzd++03pKJiqEMV2+8kvEGaJfiLUj6tBIYyUqZ1B?=
 =?us-ascii?Q?KVTFGHWiHYnV8pl5KHCrPCFRWtsLlJOLFN2OibLaY88y2Fk4MXXbL8AxjmRB?=
 =?us-ascii?Q?XcgT/5Ih2GueMz5KtiOLsUy27nLyd3GCA3wJVBBUHbMkFUSJQXUYhzx5ufH7?=
 =?us-ascii?Q?qWJv6htCswwN7qK++gd28SD0kyyc90rqPhqKSfi3mTIIbnHjsy0o1I2NQjLP?=
 =?us-ascii?Q?xgsLjUGA1c3HJQbfqWDqVstxJpZg8GBdOD8ZkcfjOVZ6T48MMsgXgieAsrNM?=
 =?us-ascii?Q?QBkQZg6o2kxe+Ua8vuplCvcfD5V6ZDeLAyuNDZZUGNz7APMnhAOyJZP59ybC?=
 =?us-ascii?Q?A5mmetH95m4rXIlSzXW/8LORhQPlkvZocjhIRsXtqceG1pPUagn49NbXgdPk?=
 =?us-ascii?Q?75YIcDrbyeFrFOLy9vixwpPocwS9wdEMq73Oh5RmPPoDoS1fyACkWD0n04nV?=
 =?us-ascii?Q?Kqq511ZDR4iFcn9YGQWHuODCBrkqSl1fQvL3eWeeJ4uQ0LB8tbQC8AAgvz9K?=
 =?us-ascii?Q?iIFTQrHQFTpsiIlYxcLWCqJsKF1o+zQLSQpPnDikAbuTW9rwxjkTu7J7wFS9?=
 =?us-ascii?Q?raeJGKVPQFg4YZH9q+8ipFvlkq9Ev1mVWWqIF+oWWoIcF3x4IbfYPw9lTuYJ?=
 =?us-ascii?Q?iuSgv46KkG4qS6Qwf6riq/d14iYkFvw77olC19rjRATXwGQzT15Ogo2aNar1?=
 =?us-ascii?Q?UWdehTXnilipJd3Pwmv/O4Ww9EBBA9k8lLDptqPPufMWapQ3foZY0Jr6HK+8?=
 =?us-ascii?Q?lg2IVDcizDi5Ix0i94i39CfNVk6YwsEitRK91cijZH8ImJQT6kMqUMx9yy5C?=
 =?us-ascii?Q?CCm6/vRs8+3PLSkk85AXcQ6zj9r9ZQs9B21G?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+MU2VgMW90T0cS4g/kC5HO+FMwj4vzMJOXHpIG22QXL1DSLaKu8cBJ0UNwet?=
 =?us-ascii?Q?HAHDGug9QpSjatzzBJDqZUJu43D5CH26yizyO8hc5fvjPDKamjLUDRUvx5gB?=
 =?us-ascii?Q?BgksYHT7fQWW97EnUD85578nkDZRDE/yMdc6bWOp4qzLODIK71A2OOXYjk/v?=
 =?us-ascii?Q?6Cokabv1UVQ/wne8fdqJJhrNqc6iieXKexY7P4IoTmaCkMdtWjDMR3DxexOJ?=
 =?us-ascii?Q?RVXcJ0wu/WT7nL1iDbvn3ZKk0Gh8fid23vgvdm+44xhUvC7j2UZhszvR6+Ns?=
 =?us-ascii?Q?uYvCCAnytluUs2YFRG6lhW302NCCd2CMD/HP50dkTIMq4zfUGfqxRLSAcEh7?=
 =?us-ascii?Q?/X0xyYpD00wXU+/WEbG4GZphZVgKkQBDOFh6KiP/3+cyzQJ2fiXacqXDjk1l?=
 =?us-ascii?Q?U56u7fAHvZ6S+0dvw0gDet/z93AoLiz7J2AAYV+bUBaXz3LdHYQRKCV3Zkmb?=
 =?us-ascii?Q?He/VyrtdUkJU0cZMyHCVHXDL0qLzzkbKKM83YO/OSWYtO31Ue0LHSEnA7hxE?=
 =?us-ascii?Q?GsW382LP9HN7pxbnsvyqd9l3EDaku2uYcIPn1NKmq+slvajksr7mt+UhRP6q?=
 =?us-ascii?Q?Zg3b4gvMMPYfxPI2eEwlRmDJJuWP/KqxEeJc0k5MFGn2/OTu6f4JgoBr03mH?=
 =?us-ascii?Q?q7Z1VgaJAcqNwWbx46f2mGoTNlVlU/P6m654rp7wDrBp02xDX+QvcfniJkZ1?=
 =?us-ascii?Q?V7DumvoowLLohz62ftqGId5XJHx+eancsdQv+798leckFP15nNs0mTKIXkmI?=
 =?us-ascii?Q?5Pv+zrhga5qoRMqerlchCY6piPxlKj/+rjFypGP47+2DTxJYHtOvlQI7qkNm?=
 =?us-ascii?Q?wDBy+bTZ/ueAx8roxy3gihSjqPMomwFInZuYva8cdM3SlzVnuJP2O+MA5nIj?=
 =?us-ascii?Q?IwGsPC7sK3m1p65lg0S9chO0Qz9W/Xu5AuTp4yYCxtphS4+Z5wYkRSk0OVbh?=
 =?us-ascii?Q?2aSYmvyrd9ni3u0bR8XZ4bOnpK6gkNZI6xCdrarhAnITmdaDTbXXShovZ1+k?=
 =?us-ascii?Q?y7kurMTtNpkzdEbXB3faA2XqZEkHb/gpZQB7oiZZv7z9BhBHJlV8/O1spoag?=
 =?us-ascii?Q?R9sB7+P5C6DrAVF9O8XQlgLxyhV5jeX3FcLzuMYS7/jrrQ5yx5oyMgwQniZd?=
 =?us-ascii?Q?Xe++p8M82rz8HvRAcrFooHCjUPZV21QVcPNZZUQq0fd11khxufm+5Hv6X/aX?=
 =?us-ascii?Q?0grO8kBQ6ZiqkC0oBrsqbYAVOJ9EMASKfxQMzAAotS0BjgYYP+3DsjlwRa6s?=
 =?us-ascii?Q?cWOo17MSQA2Jho/te1Xev/9UHijEAwRWKhzZgkGpTBE/mDwND1/7Utqv22ya?=
 =?us-ascii?Q?/Zl7jpsILWhFwr6vh3rDKzgWLKT7Sw/9vMNvT3kHO2VZsOlRfze1eFvjeubC?=
 =?us-ascii?Q?1shxtkgMMT/2ZDNBbCYEi1mxuyPFPlu15uyV2twWAa3HCuT1awQbfsPfOGiB?=
 =?us-ascii?Q?853b0SBcdouIzd8n2kG8Z9PAWNBGEZo+KRyGffgT2MmuOD8EMRXCHtrDZHzS?=
 =?us-ascii?Q?sWo4y3az21aDP7d5RnNcPkK6ilnUgOwdSxloq057+nA0I24b9pClO5t+Ax+h?=
 =?us-ascii?Q?hKzamf9MKNWyVK8BAmW9JSfbawyf6wCKwL6X2c6YlQB9AU6szfwyfDFLVDfL?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33eedf9b-7e25-4b4c-2d0b-08de1b7cdeb4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:33:46.1109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L96LfkUQNnOfEmDzzBmOkahWz6/PM115q+XE1Cz8EsQdKeA9bA+47eXm9edqTRdq29P3GwdfFTRvB/MXtRompw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7405
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 08:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225714

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


