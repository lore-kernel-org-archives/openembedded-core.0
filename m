Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBBACCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 08:34:11 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.118])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13398.1762245230231928511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 00:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=clEtobxZ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.130.118, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObpGmETgkMP0iftf8ArEMzsvRRWhd7996CgcFieDzIjurjwd8T+pRrytRavCygg4ncjnOutgGOTuUsBrb3l1FSpPSCe+1fYcTNhVBbdqcYy7R+T3iIYIHOsEk71cq3SjhaxNOyW7mjF/O4R/aL9rHsQZJmhmKUVoBWRCcbASU9z9hC+89LV3jMddjvi5y3NyC6VOqwyXj5/WvlsNEG+H0XURg2amvBQv/4cTWamOEIZTfTvRdoCHSCGv2ReCWMyQhzX+CpQSrjUD+eOxuLdH5sZ1s7+Y3V3Ms5d2Ns6mgCgba0E+v7+kiV365gvAxTs5HMkejqObH9gW5InhRG1BNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYI+zkiow1utrRD6Ru4WH9LD8DZ/k1CaaJeDxpOMCuY=;
 b=fwnTkj/DFQFBgEBzPpxCidIfxGIPaJuSZfcbmO5l7qsz24DTioIRf3J0cQEky1Zgyw4GHqc6RhMHpuJ1Au1XKqu8g1oLGVEqdR3RtDxgOnVydWVChzYf8WzxHF8S8HVhTyRX8jjqWxukdTNq8w3PTEFijqcd9xmP4ib8wQMiYkfDTZ0TLN0v7NPG6QU7Dy1Y4dQGFpJyfNh0PI3wnkfqT3lFe6WO1GnUdsMthpjINlj+XWRiOMkoYJmR+IrfrOpQjLm+qQ6FbBm7/T4BEkajoxqhVn8MLkaKAFAcsVLEyIB23nKsSk0hKUjTgYn9fk2v9lMB7CIkGNLkDhcqXBsyzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYI+zkiow1utrRD6Ru4WH9LD8DZ/k1CaaJeDxpOMCuY=;
 b=clEtobxZKLf2swEPAmPXR9Myl+1nvXjfDlttHyR8n906PAsPXNpiBQOaiwPfUbwfms9FAR1iHRQFWfX+8YRmwBtrPg8ZUTEDLmEWVTwTMwvY79hY2pqnoKc8oJ8Qvoc7fFRyLdwE6dNwbrndSXelks5+sqNiskqJFYOnotDSUVgJ6lmLsykvu523/eRKEzeiK0nwcLj7qQnVIHOpFdk6Ib3AVOWiISf8avSG4Fh80LlHm3sAXX2YPAn/F5qUpwnEKTwax1qE6UX+XWeTxd/6+NqjwTaQ9BBCyRR00Mszt+0SqoGEboHYRP+WMDmEiJomx8zbtmylM1ve9112rDt6bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7405.eurprd06.prod.outlook.com (2603:10a6:102:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:33:47 +0000
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
Subject: [PATCH v2 4/5] cve-update: Take shared .inc file into use
Date: Tue,  4 Nov 2025 08:33:32 +0000
Message-ID: <20251104083333.814331-4-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 609b7d7f-1b5e-4d7a-cb97-08de1b7cdf12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LEd/vJeDWGwZP1XKGePYhw+OPI0jXBIm2FOg1SlArEtPvtWNJAq/s7luunL0?=
 =?us-ascii?Q?MeDnY/XE0Y0yRX5bbI+0UBoa7S0AAKnX65dTYCzCNARAuSMtPA3t47B9RLZF?=
 =?us-ascii?Q?wmd9F8M3EpGS4TwBY776lSgw83aZDFSW7jawLSI6IOwIMfF8NpHdu4EicRIY?=
 =?us-ascii?Q?FhEn25u2Jywq9RkbAj7TUx7pywax0C5/rG639P4GtAZR/I56spclEgE4bvgy?=
 =?us-ascii?Q?rucIxlOvwYSla8W0dIAwvgoUd7MttSR2audAo8TH3YI5NgrmeeN2EiiRUCe7?=
 =?us-ascii?Q?IbM9Fj5nNWxQFQ33Vcdq3oG5oTMVM6Hzq9rAxfSAywjE2Le78ZRGsbc6aig3?=
 =?us-ascii?Q?wcbuaZygLhchf/hi9T0NlghVeC4VzMqJ6WVSu4gosQEMuwMCbRJrageGh+vW?=
 =?us-ascii?Q?kv1FzFi05YBN9qehpOL3B8LBRKdNLcEdj+s5zEPHH7cCf7gaW9V7vGFg2qGZ?=
 =?us-ascii?Q?neNmhP6u/HEFXwkcg7/Ps+6JYKqVW+tNnmHQFGzgBI1HhsrJhnC7hweOXEev?=
 =?us-ascii?Q?3FaV094YmsO6395VR/FDbqHuEe7CV8CRpSmwD5K5sJu8oHW3BHyhEOrHig1M?=
 =?us-ascii?Q?XMM4uRYuYql7ugfypSph5ulVI+KlOKJ6nNhG7CDUK02twdV7Rn+tnrJZfwYr?=
 =?us-ascii?Q?/FG016oB4p6JzdIXQmL8Obq4fQ+aowMLD5CX4Qn0W+NZUfT14LZ4AiM74KEs?=
 =?us-ascii?Q?jor65qUPymBOfzOFnhdkfrzLgJiaDshxU58XW2Djr2sNZz5nwKoNELVmp1cw?=
 =?us-ascii?Q?7CwRls+SiEKIOyXJPP9Q8WRcD+rNlXi0Bxy05UyZCNTlpFF0ot+QOAQELfO9?=
 =?us-ascii?Q?M5LsPVNmj1VDcu7WgfSh13BJVjY7OjUU0cVkigHslKK2kkWduCGVtbndHGx7?=
 =?us-ascii?Q?TTe1p3LLgc0LzRlBGxJvtpHsAUy6RXoVbon/ckRPJYoltV7FWJojwMoyDYiS?=
 =?us-ascii?Q?MIrUvdgt+69jocukz+DAGYMn7flDmulb40UABy7WK6QNAnCG64g4UgCEe3da?=
 =?us-ascii?Q?jzxDdQB0b4o3RKlNEahn5bPPtNC8wi+JjKnpDRhkUIfsEnSgLzu3A5+vKpwx?=
 =?us-ascii?Q?/db9luhf86o6LZ0PmlKLyWWbCSgv5xMvubRmzN8Zldbx0l7ermJU6QwTHy8p?=
 =?us-ascii?Q?RcA8T5GJe5ZgPv04YGaJb5N0L4DNFZOZ+lIq9hUzb1j/5LUCn0DV46oUsQSS?=
 =?us-ascii?Q?CgLEgMylABSX6Wa090nX7WTgLpDt+Pv27PVagwnMxUo3hxYMUVMlHY5DuyU5?=
 =?us-ascii?Q?tdS71OOWhOpx/bhQPPJ4noGsV0Aq5ludQka6yYp50N9mowiR0jfv/zZ7lJ75?=
 =?us-ascii?Q?noOBC6PFilTCz7z1omOdk9TTzQFqBCe6/FvpgTnO6WOzJXVIcf9feo24ZIeD?=
 =?us-ascii?Q?5FZnzsVIg7tx4iyxzSYI8ieHtWBWIFekSvpEEzC8yva10yNAtMsDkSPUEPUs?=
 =?us-ascii?Q?g0pj8vhDvwBTd2bm3EwWRY/2rHO7seoMSoqiUFOgilUI+Ai4g0jxo6lNHU9e?=
 =?us-ascii?Q?BX1Zxg4OMbnGHgLYHHnG4KecJsajeAWKgABo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OOv7Kf3x/6lIBLN80efpBegWc2ZHo1SzD6mjW7wNtmmFWdxEsZHfmUiz2i7a?=
 =?us-ascii?Q?cPjerOrQubI64rEeIzm/yQjqvzfs33okB5KtdaXyGGXCY5xjqfJWdvJstb7v?=
 =?us-ascii?Q?bE/W/NhTg2N3s+oCCTh0kkedmdNDz2b+N4C/r3/oFP5tHA8Eqj/oIjjI48u8?=
 =?us-ascii?Q?Z8OLWETVcRy20LtHYC+n1nJrx4csvj2kyI/Rmb0RA128uhWweipuIzet7KYs?=
 =?us-ascii?Q?nssAzW8aUWUHU0ZVAL5Cne7A7CtcQgIt9gTsHkCkdvpmnXbgI/F05dEhg6Z/?=
 =?us-ascii?Q?SzKoNVSsGUuaSvXMeWRISVbMrC15X2YXEK6jCqb2ZVycAZW0CajPSz0VA3pq?=
 =?us-ascii?Q?mD7eJSD8qMIFdK42bfZ309cJbRi3WIOXkdgPhH8eRnMZt/ce/i4KSPtFKOVh?=
 =?us-ascii?Q?aTOg9ZcJQOeRMvK0DN21om2gBLmEwc0+UvUwC+AVZM0kiO1fCQRlGl3ViD8Y?=
 =?us-ascii?Q?H11TzExl6oAtR66bsNikFSABfuiYXcBrOTYsrbYM3CpK1jF8KG9j1LS4f8oq?=
 =?us-ascii?Q?5wnauX6bivB4uWAibB52lAv93Z6rLoaOunwCoV86n5Afur9w0O17tbus2EdX?=
 =?us-ascii?Q?ZMGSIpMp31AlL5ZHyOjaiPeqQ1W3rn8EYycEjavqxXItX9PaDUjhKW9w+xlu?=
 =?us-ascii?Q?ONx7+d+Oiibs+w3MxfFyTS69g4TPGtrCzZruduIbEKdAYMwJo/Gy/sYzwGYg?=
 =?us-ascii?Q?cjaZBRMGUNZtFfTAAOswbJMcxdZ66v6Pp1N6PkhfBJ0BB5ImgbOfwBNKccnu?=
 =?us-ascii?Q?uEX/xqiRsqDG/D3zNtda+1L5ZhdldJ6YgZoS9SwUBN6Al/DIqPHdiqp0q2K4?=
 =?us-ascii?Q?E+dC3pTle6ML22zfYoXSbtPBWZXxEdXbm5GJag+GKQNdPCFEFCgNBPvxL71s?=
 =?us-ascii?Q?U9x7fPOf31S4lDY9WOH4XCsbIe/GDkqtpiWxDgdA4JQQrj1+hfnwyz6RUEBv?=
 =?us-ascii?Q?Q/fBNoi/TEovKKGlkcOjEPgo8bJe55jm60q6OmcGkImUn/97vH4jLvPkKelP?=
 =?us-ascii?Q?3yeU6SCkBjm3ga1xXi3OHt0jSIUKY9kgqWoTbgwhRqpu8hBF7mxDLw0zPM6l?=
 =?us-ascii?Q?QelzJ6Ug7e2gbaoSxz43miV5V/5/mNg1DP6z64SSejVTa+7c6iWIOYiW00hk?=
 =?us-ascii?Q?QhiiJ/HoPNGzFG5ociOVEht7A7I/0v2/CdOiBNGA4ZAgqK/GpUFG3NNIMFTb?=
 =?us-ascii?Q?qOLgRsce8XEYHR5YhWbWemff+egxQ1B4x8NuWmq8oKRIOYu6AXZZoSbjmrsI?=
 =?us-ascii?Q?GxJLJzAPenf4I8TbdrGjaOVDKIAr8gdNnSiLj5AMLQAd3m35g3INlP3FL7xw?=
 =?us-ascii?Q?xuxPJK72o+LVheppeEg3VXZ+toTocFKcGoPbaEhg9YiTGKGIWmGSEb7cOHSF?=
 =?us-ascii?Q?r2bdSrwknjBo6eBYRhGAUyWlI8ZlfdAYyruW1/kFHtZKVD2gpYeGYDP/ZD+Q?=
 =?us-ascii?Q?hKf9U7sxg6HzmSpoWy364vcrHruraSwxFZVGYYhcaWIHc3/BiqDdvFl6FKdz?=
 =?us-ascii?Q?tHISyG7H8GbMfTbwYmtGiAWtFv3axgfzc+fo9djvcgF2Efl9cbSLkhNNFDpw?=
 =?us-ascii?Q?NOmsBw/zMgTksw0VN56LiqTPWrt0D11J+4gLyW2aUH4q67O6J8bMhLMVevzP?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609b7d7f-1b5e-4d7a-cb97-08de1b7cdf12
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:33:46.9204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxNUbKOmp27MVHBRPpAymyfwidMysUgKNFJOJ6f56sXMLjAIdrSKhGH1KiCgtiQkR4tVK/+UFqJlmnWRRmnDMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7405
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 08:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225716

Since there are two recipes for the similar purpose with some
considerable differences but also some identical definitions, take a
shared inc file into use by relocating common code lines there.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 124 +----------------
 meta/recipes-core/meta/cve-update-native.inc  | 127 ++++++++++++++++++
 .../meta/cve-update-nvd2-native.bb            | 126 +----------------
 3 files changed, 130 insertions(+), 247 deletions(-)
 create mode 100644 meta/recipes-core/meta/cve-update-native.inc

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-=
core/meta/cve-update-db-native.bb
index 4423216be5..ca83c80958 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -1,111 +1,10 @@
-SUMMARY =3D "Updates the NVD CVE database"
-LICENSE =3D "MIT"
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-inherit native
-
-deltask do_patch
-deltask do_configure
-deltask do_compile
-deltask do_install
-deltask do_populate_sysroot
+require cve-update-native.inc
=20
 FKIE_URL ?=3D "https://github.com/fkie-cad/nvd-json-data-feeds/releases/la=
test/download/CVE-"
=20
-# CVE database update interval, in seconds. By default: once a day (23*60*=
60).
-# Use 0 to force the update
-# Use a negative value to skip the update
-CVE_DB_UPDATE_INTERVAL ?=3D "82800"
-
 # Timeout for blocking socket operations, such as the connection attempt.
 CVE_SOCKET_TIMEOUT ?=3D "60"
=20
-CVE_CHECK_DB_DLDIR_FILE ?=3D "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENAME=
}"
-CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
-CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
-
-python () {
-    if not bb.data.inherits_class("cve-check", d):
-        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not=
 loaded.")
-}
-
-python do_fetch() {
-    """
-    Update NVD database with json data feed
-    """
-    import bb.utils
-    import bb.progress
-    import shutil
-
-    bb.utils.export_proxies(d)
-
-    db_file =3D d.getVar("CVE_CHECK_DB_DLDIR_FILE")
-    db_dir =3D os.path.dirname(db_file)
-    db_tmp_file =3D d.getVar("CVE_CHECK_DB_TEMP_FILE")
-
-    cleanup_db_download(db_tmp_file)
-
-    # The NVD database changes once a day, so no need to update more frequ=
ently
-    # Allow the user to force-update
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
-        elif curr_time - database_time < update_interval:
-            bb.note("CVE database recently updated, skipping")
-            return
-
-    except OSError:
-        pass
-
-    if bb.utils.to_boolean(d.getVar("BB_NO_NETWORK")):
-        bb.error("BB_NO_NETWORK attempted to disable fetch, this recipe us=
es CVE_DB_UPDATE_INTERVAL to control download, set to '-1' to disable fetch=
 or update")
-
-    bb.utils.mkdirhier(db_dir)
-    bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
-    if os.path.exists(db_file):
-        shutil.copy2(db_file, db_tmp_file)
-
-    if update_db_file(db_tmp_file, d):
-        # Update downloaded correctly, can swap files
-        shutil.move(db_tmp_file, db_file)
-    else:
-        # Update failed, do not modify the database
-        bb.warn("CVE database update failed")
-        os.remove(db_tmp_file)
-}
-
-do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK}"
-do_fetch[file-checksums] =3D ""
-do_fetch[vardeps] =3D ""
-
-python do_unpack() {
-    import shutil
-    shutil.copyfile(d.getVar("CVE_CHECK_DB_DLDIR_FILE"), d.getVar("CVE_CHE=
CK_DB_FILE"))
-}
-do_unpack[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FILE_=
LOCK}"
-
-def cleanup_db_download(db_tmp_file):
-    """
-    Cleanup the download space from possible failed downloads
-    """
-
-    # Clean-up the temporary file downloads, we can remove both journal
-    # and the temporary database
-    if os.path.exists("{0}-journal".format(db_tmp_file)):
-        os.remove("{0}-journal".format(db_tmp_file))
-    if os.path.exists(db_tmp_file):
-        os.remove(db_tmp_file)
=20
 def db_file_names(d, year):
     year_url =3D d.getVar('FKIE_URL') + str(year)
@@ -113,7 +12,7 @@ def db_file_names(d, year):
     json_url =3D year_url + ".json.xz"
     return json_url, meta_url
=20
-def update_db_file(db_tmp_file, d):
+def update_db_file(db_tmp_file, d, *_):
     """
     Update the given database file
     """
@@ -189,21 +88,6 @@ def update_db_file(db_tmp_file, d):
         conn.close()
         return True
=20
-def initialize_db(conn):
-    with conn:
-        c =3D conn.cursor()
-
-        c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, D=
ATE TEXT)")
-
-        c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY=
 TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, SCOREV4 TEXT, MODIFIED INTEGER, VE=
CTOR TEXT, VECTORSTRING TEXT)")
-
-        c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
-            VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START =
TEXT, \
-            VERSION_END TEXT, OPERATOR_END TEXT)")
-        c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS(I=
D);")
-
-        c.close()
=20
 def parse_node_and_insert(conn, node, cveId):
     # Parse children node if needed
@@ -345,7 +229,3 @@ def update_db(conn, jsondata):
             # This is suboptimal as it doesn't handle AND/OR and negate, b=
ut is better than nothing
             for node in config.get("nodes") or []:
                 parse_node_and_insert(conn, node, cveId)
-
-do_fetch[nostamp] =3D "1"
-
-EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta/recipes-core/meta/cve-update-native.inc b/meta/recipes-co=
re/meta/cve-update-native.inc
new file mode 100644
index 0000000000..298c89b498
--- /dev/null
+++ b/meta/recipes-core/meta/cve-update-native.inc
@@ -0,0 +1,127 @@
+# Common definitions for CVE database fetching native recipes
+SUMMARY =3D "Updates the NVD CVE database"
+LICENSE =3D "MIT"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+inherit native
+
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+
+# CVE database update interval, in seconds. By default: once a day (23*60*=
60).
+# Use 0 to force the update
+# Use a negative value to skip the update
+CVE_DB_UPDATE_INTERVAL ?=3D "82800"
+
+CVE_CHECK_DB_DLDIR_FILE ?=3D "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENAME=
}"
+CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
+CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
+
+python() {
+    if not bb.data.inherits_class("cve-check", d):
+        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not=
 loaded.")
+}
+
+python do_fetch() {
+    """
+    Update NVD database
+    """
+    import bb.utils
+    import bb.progress
+    import shutil
+
+    bb.utils.export_proxies(d)
+
+    db_file =3D d.getVar("CVE_CHECK_DB_DLDIR_FILE")
+    db_dir =3D os.path.dirname(db_file)
+    db_tmp_file =3D d.getVar("CVE_CHECK_DB_TEMP_FILE")
+
+    cleanup_db_download(db_tmp_file)
+    # By default let's update the whole database (since time 0)
+    database_time =3D 0
+
+    # The NVD database changes once a day, so no need to update more frequ=
ently
+    # Allow the user to force-update
+    try:
+        import time
+        update_interval =3D int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
+        if update_interval < 0:
+            bb.note("CVE database update skipped")
+            if not os.path.exists(db_file):
+                bb.error("CVE database %s not present, database fetch/upda=
te skipped" % db_file)
+            return
+        curr_time =3D time.time()
+        database_time =3D os.path.getmtime(db_file)
+        bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_time), =
time.ctime(database_time)))
+        if curr_time < database_time:
+            bb.warn("Database time is in the future, force DB update")
+            database_time =3D 0
+        elif curr_time - database_time < update_interval:
+            bb.note("CVE database recently updated, skipping")
+            return
+
+    except OSError:
+        pass
+
+    if bb.utils.to_boolean(d.getVar("BB_NO_NETWORK")):
+        bb.error("BB_NO_NETWORK attempted to disable fetch, this recipe us=
es CVE_DB_UPDATE_INTERVAL to control download, set to '-1' to disable fetch=
 or update")
+
+    bb.utils.mkdirhier(db_dir)
+    bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
+    if os.path.exists(db_file):
+        shutil.copy2(db_file, db_tmp_file)
+
+    if update_db_file(db_tmp_file, d, database_time):
+        # Update downloaded correctly, can swap files
+        shutil.move(db_tmp_file, db_file)
+    else:
+        # Update failed, do not modify the database
+        bb.warn("CVE database update failed")
+        os.remove(db_tmp_file)
+}
+do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK}"
+do_fetch[file-checksums] =3D ""
+do_fetch[vardeps] =3D ""
+do_fetch[nostamp] =3D "1"
+
+python do_unpack() {
+    import shutil
+    shutil.copyfile(d.getVar("CVE_CHECK_DB_DLDIR_FILE"), d.getVar("CVE_CHE=
CK_DB_FILE"))
+}
+do_unpack[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FILE_=
LOCK}"
+
+def cleanup_db_download(db_tmp_file):
+    """
+    Cleanup the download space from possible failed downloads
+    """
+
+    # Clean-up the temporary file downloads, we can remove both journal
+    # and the temporary database
+    if os.path.exists("{0}-journal".format(db_tmp_file)):
+        os.remove("{0}-journal".format(db_tmp_file))
+    if os.path.exists(db_tmp_file):
+        os.remove(db_tmp_file)
+
+
+def initialize_db(conn):
+    with conn:
+        c =3D conn.cursor()
+
+        c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, D=
ATE TEXT)")
+
+        c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY=
 TEXT, \
+            SCOREV2 TEXT, SCOREV3 TEXT, SCOREV4 TEXT, MODIFIED INTEGER, VE=
CTOR TEXT, VECTORSTRING TEXT)")
+
+        c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
+            VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START =
TEXT, \
+            VERSION_END TEXT, OPERATOR_END TEXT)")
+        c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS(I=
D);")
+
+        c.close()
+
+
+EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipe=
s-core/meta/cve-update-nvd2-native.bb
index abcbcffcc6..01d3e8e754 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -1,18 +1,7 @@
-SUMMARY =3D "Updates the NVD CVE database"
-LICENSE =3D "MIT"
-
 # Important note:
 # This product uses the NVD API but is not endorsed or certified by the NV=
D.
=20
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-inherit native
-
-deltask do_patch
-deltask do_configure
-deltask do_compile
-deltask do_install
-deltask do_populate_sysroot
+require cve-update-native.inc
=20
 NVDCVE_URL ?=3D "https://services.nvd.nist.gov/rest/json/cves/2.0"
=20
@@ -20,11 +9,6 @@ NVDCVE_URL ?=3D "https://services.nvd.nist.gov/rest/json/=
cves/2.0"
 # then setting this to get higher rate limits.
 NVDCVE_API_KEY ?=3D ""
=20
-# CVE database update interval, in seconds. By default: once a day (23*60*=
60).
-# Use 0 to force the update
-# Use a negative value to skip the update
-CVE_DB_UPDATE_INTERVAL ?=3D "82800"
-
 # CVE database incremental update age threshold, in seconds. If the databa=
se is
 # older than this threshold, do a full re-download, else, do an incrementa=
l
 # update. By default: the maximum allowed value from NVD: 120 days (120*24=
*60*60)
@@ -34,95 +18,6 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D "10368000"
 # Number of attempts for each http query to nvd server before giving up
 CVE_DB_UPDATE_ATTEMPTS ?=3D "5"
=20
-CVE_CHECK_DB_DLDIR_FILE ?=3D "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENAME=
}"
-CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
-CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
-
-python () {
-    if not bb.data.inherits_class("cve-check", d):
-        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not=
 loaded.")
-}
-
-python do_fetch() {
-    """
-    Update NVD database with API 2.0
-    """
-    import bb.utils
-    import bb.progress
-    import shutil
-
-    bb.utils.export_proxies(d)
-
-    db_file =3D d.getVar("CVE_CHECK_DB_DLDIR_FILE")
-    db_dir =3D os.path.dirname(db_file)
-    db_tmp_file =3D d.getVar("CVE_CHECK_DB_TEMP_FILE")
-
-    cleanup_db_download(db_tmp_file)
-    # By default let's update the whole database (since time 0)
-    database_time =3D 0
-
-    # The NVD database changes once a day, so no need to update more frequ=
ently
-    # Allow the user to force-update
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
-
-    if bb.utils.to_boolean(d.getVar("BB_NO_NETWORK")):
-        bb.error("BB_NO_NETWORK attempted to disable fetch, this recipe us=
es CVE_DB_UPDATE_INTERVAL to control download, set to '-1' to disable fetch=
 or update")
-
-    bb.utils.mkdirhier(db_dir)
-    bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
-    if os.path.exists(db_file):
-        shutil.copy2(db_file, db_tmp_file)
-
-    if update_db_file(db_tmp_file, d, database_time):
-        # Update downloaded correctly, can swap files
-        shutil.move(db_tmp_file, db_file)
-    else:
-        # Update failed, do not modify the database
-        bb.warn("CVE database update failed")
-        os.remove(db_tmp_file)
-}
-
-do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK}"
-do_fetch[file-checksums] =3D ""
-do_fetch[vardeps] =3D ""
-
-python do_unpack() {
-    import shutil
-    shutil.copyfile(d.getVar("CVE_CHECK_DB_DLDIR_FILE"), d.getVar("CVE_CHE=
CK_DB_FILE"))
-}
-do_unpack[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FILE_=
LOCK}"
-
-def cleanup_db_download(db_tmp_file):
-    """
-    Cleanup the download space from possible failed downloads
-    """
-
-    # Clean-up the temporary file downloads, we can remove both journal
-    # and the temporary database
-    if os.path.exists("{0}-journal".format(db_tmp_file)):
-        os.remove("{0}-journal".format(db_tmp_file))
-    if os.path.exists(db_tmp_file):
-        os.remove(db_tmp_file)
-
 def nvd_request_wait(attempt, min_wait):
     return min(((2 * attempt) + min_wait), 30)
=20
@@ -251,21 +146,6 @@ def update_db_file(db_tmp_file, d, database_time):
     conn.close()
     return True
=20
-def initialize_db(conn):
-    with conn:
-        c =3D conn.cursor()
-
-        c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, D=
ATE TEXT)")
-
-        c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY=
 TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, SCOREV4 TEXT, MODIFIED INTEGER, VE=
CTOR TEXT, VECTORSTRING TEXT)")
-
-        c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
-            VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START =
TEXT, \
-            VERSION_END TEXT, OPERATOR_END TEXT)")
-        c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS(I=
D);")
-
-        c.close()
=20
 def parse_node_and_insert(conn, node, cveId):
=20
@@ -388,7 +268,3 @@ def update_db(conn, elt):
                 parse_node_and_insert(conn, node, cveId)
     except KeyError:
         bb.note("CVE %s has no configurations" % cveId)
-
-do_fetch[nostamp] =3D "1"
-
-EXCLUDE_FROM_WORLD =3D "1"
--=20
2.47.3


