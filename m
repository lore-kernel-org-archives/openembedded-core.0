Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A12CCFA07
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 14:32:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.97])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22259.1762180339875654168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 06:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=RBGGHElW;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.162.97, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7TVeJmwubUJM1bGRs/spnq2FoxrW5hvDfBiyZT51bBsbISRQZJW97k2EO9SVRqznYIWsilAuMoB4c4fPlpazDlZNgmVorhMrRoyMzAJUOI4fil0qMZ3szffNBZzstrsXV5gKQKm4bJHDH5Bt0UCNJqbwPjNx1BDqoz/phdDbZmEaZw2llx5CSC7DjgiQNPvvL+7xbb7RV3Fj3nWLszkTb2PNQfev95bTh4D+Gmb6q3bE1YAHfs9lrUPmF36Wq2hIs1De8f6fAiwKLRTxZiDpYkyQo0rNJu9FCHJaox5OL8IuH5T2YhJXzya+AAzLmOyMEVI4++r19MD2w0jC+CMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYI+zkiow1utrRD6Ru4WH9LD8DZ/k1CaaJeDxpOMCuY=;
 b=RxWSjzVDopQiIY3CIQWKzACEP+hAOnz54trr9mdrTWDOmtwdU3m1bJ2XKYor3gG3uETeDLs0RQaVt4ZnDoD88tawY3Vyov5Pf1++MUGxX3UJG+69QdpTneRIIVsbT11BPKSxGUzDzHdNtU4x+zhTT7hNI39fKbRrwOaQs2LkgtBrcoqb/7pdCqXTj9WC8Zz2lGs21G3ROCJErLWd8UnxF3+K3yUb0vXXpXboYa7zaMUdU87vlgjiwUpaWF5faBxp8l3gNVV8kQIQQutq66kYQFLCUOFtDoFNiX33p9uoABzfj7EaJw7VsLH8MxdKgfVpuNBz2/uiz02o26pUP7JUXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYI+zkiow1utrRD6Ru4WH9LD8DZ/k1CaaJeDxpOMCuY=;
 b=RBGGHElWcEX/u5FvBSpN1gibH9w4hstl0YVRxHBtaH47Xn/GZFFSdHhfR6oUSkKf++mcYlhs3ewhQqTD2BsZxpC2TH2hKsQVZk/hjk/lIVL8+vy3wnxkshSKLG2W4N+NVaJKhco50gs5ggrK7QdH5JdnjpKV2uZqsTwRBjFQc05cKmobOdlKuI1u1zirZocYUp/yWJWMfFTP68ztdQY5+2EDHxmPc7G8mFNAoB8d8nAE5k+kE8J+/YaaU4D8H+9EQawC5BSrvSrVJrCxG9fNZTqVlc9QtiEc5WcbbO4HmWIf7cnzOYW7CkApGjidf3vTC84pKYrT2E6BK2K4BAdnGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB8407.eurprd06.prod.outlook.com (2603:10a6:102:22b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 14:32:14 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 14:32:14 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	rybczynska@gmail.com,
	peter.marko@siemens.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 4/5] cve-update: Take shared .inc file into use
Date: Mon,  3 Nov 2025 14:31:56 +0000
Message-ID: <20251103143157.315178-4-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8feb87b0-232a-4fe7-a2c0-08de1ae5c7e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pYR0WIne5/7eCONsPB4fODgpswyMxF+TZOURfS8uWsVCgT/0RHyk8X77jsYa?=
 =?us-ascii?Q?/j7vKFzcxpPQUCUaXGum7CsC7UHNja8CG8KO3jxGp7pjfMcEAEkLP9WJj97F?=
 =?us-ascii?Q?dmgBPvqw4zHOUui0lEQSAhBfY8fh2U85TbcL1AmA7ZNE7zo/i/OUGEnkh/y0?=
 =?us-ascii?Q?W1kAbZ/BYsAVPKoMDGx/BPtU8GvtupB+qJlVE5cSTHZ+i/Az4psFLP7kLjO3?=
 =?us-ascii?Q?QAETfjrFbLUOxF1Ds2667IDQLBF8LNFP6sAclChH6Hh0SOrwHauRzRkfN6wf?=
 =?us-ascii?Q?2tYc93fLlpBJ83bJLQnS7tXPgSKvYg+YPF6yGcGrVCjsJNgBmWlvSUfRGQqt?=
 =?us-ascii?Q?KHOgazKTUASJ2X34Lf7XZyNwkQNZSHOU6vumJAJfxqdhbu6aTDk1QAfDBe0I?=
 =?us-ascii?Q?2M54ddEiGo9AYowOHwfBU/+r73hv3t6PebCFcRrG1L32PefOewfi+OozFc5V?=
 =?us-ascii?Q?M9LCUbSgklI7AJ6MDviPuQJ0WOukimvDFCujrKlzLFg7x773Lyn65u+9cdzW?=
 =?us-ascii?Q?OQm9CfSvBFiyiNOOaja6r1Pc8e0rQ6ann2WTcGZT6LbqoMnhGeknQLblVZS/?=
 =?us-ascii?Q?HYc2kq2RBcYTNqN9BihowzdegR/guNuTGdqc9g8KTWdHaXcToHkptrGOhzPZ?=
 =?us-ascii?Q?S89a6A3pGIuFoHjgqlUuR5MKbkkPGSGRNNyc1mfAficCkzVB7dTx/BxDWydf?=
 =?us-ascii?Q?KCOGyRrDqLjMRQKMMCvwEuHxAA/0jr1KP1eTHhJHbi5go94XEGQXPvaR7zmT?=
 =?us-ascii?Q?dVl54zh/pGRH1dKtA/MLzaUW3nYzI2yUw/RvmNlffAooq/B8OAEApV/6Pkl9?=
 =?us-ascii?Q?XDk2fq9C1OcXCbxIEM7H/hjFgTpPL5QHQpRFDSLamCx9NcGeMATtZL9zcyyP?=
 =?us-ascii?Q?8D+uhYM2Yf1pEgLhobzxNt8JMX/8buslSyBtS3OiXHS1rTCHESs+dRcp14OI?=
 =?us-ascii?Q?9kbplVz1wrMddcT2MTaRwKw/lvSU/1V6UkjEvuzdYeZNGVOw4xiGa+L18Z7u?=
 =?us-ascii?Q?x20ZZRIA8QHAbozhwv4b70Z99xUEIDvqELSvkkLBOI84StM8hXmDqFlKnVv2?=
 =?us-ascii?Q?yLXZ9TcipyFxT2bsFX1WrLgb01t6AfKvJep3EvHE4gxoHV/Iu2Z/YQUY+bS8?=
 =?us-ascii?Q?WfTNcre0ZEYd0yc+m868yym3iAgC4DNmrtaMmyz/eEmtHPsNjESsbUybqnaw?=
 =?us-ascii?Q?NW9Xv5sLKXg96cwacwqpJT62WdosIk+uSuV4Se4OHI0xtY/KFLu9qqeaCcl3?=
 =?us-ascii?Q?eDAUiA+z9XN6o8aaUEPSsazZU9Gq5UBE17bhJ7FLawZBzcUfHxhdrYPO5rqK?=
 =?us-ascii?Q?vf1+P02idmxY7gCTylGsFh5XkrOhBEftv7JI/mOummq2FoTvZD9RqcxNN1nX?=
 =?us-ascii?Q?fHIFrqzO9MxJNXcVX65yerlGtWzke0HWHntAxBy37gCDNARfb9rGFB5rsr/E?=
 =?us-ascii?Q?HUWbMnjajn0IMVL8+lrqCEYSjQstHM/QMwR87x0CY1uaAwGx6K85uNAF3XDs?=
 =?us-ascii?Q?bkrea/b7mBwZF/aSSDEQMgVBCVi1nPjpPuXO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gQeuuc5hRF1E1A88QzKwWqTeljjLD+Js+sjrhlMbd79c52kLQuHYbqPAaRRs?=
 =?us-ascii?Q?InkNwm5UmsyWf+aFZV7LmZTya31DNbkiYsLucC2mLJfrX93c+s4o5IGXKHXh?=
 =?us-ascii?Q?3KiRQyOcuRsHahYsn/d81VCVI1ExElOA0t0q9t1z6HzFls6K8mg7MZ0LMIIT?=
 =?us-ascii?Q?AN5R8vrUgjlT16FqguNnrvYUjPcyehru6cSFa8WihFrCLpHXRzcsFt4/d09P?=
 =?us-ascii?Q?mn+uIPa68abTq5ebN48QsMaycbOVNOH3x4AEE8GSH6JdfgeoD4amqNakoEuc?=
 =?us-ascii?Q?Xts4oLgX1WRwaNxMdtHcPsXDQbdJolCylxl64Nl37saj0atSXKYHXxFX+s7B?=
 =?us-ascii?Q?sAGcjF2SVBwx1rXGsuKF1avjW+tQGNS5ygPsLPAdXLHLfVu//sy+2JbVB+bK?=
 =?us-ascii?Q?jJ6ijtAX6NFAKSd7N8Z6hTbnQzxzOoyEcbUXqFSh/y5wx4YuHXwef+ENvDu9?=
 =?us-ascii?Q?7kxHKPgO9v5YPr8pJtvBWzOs6PHMqV7YXyQpJXhk+lbiFBjCynmoRFxmA+5p?=
 =?us-ascii?Q?55lv7AseTMe2xkrwrIhjDOvAVBggAJlmnHzwiek16Gh9NUBcZBEH1eJmA9xO?=
 =?us-ascii?Q?K/BiYBilDKckBUatmTrDN7L4BfCMduHB2r71Rrx/KEjVkw0N3mfwKAyDUiKc?=
 =?us-ascii?Q?goQGwhMf/vbErRpZhkpppamCBdXIWCCLNJFLGs3d7nYe9E/Yoi8ZdRVX5myY?=
 =?us-ascii?Q?j/45f61zth5CdHnGdKCycIZUVEqUmfZpR1JsxjDto9TurIGsl9t7walgjQsH?=
 =?us-ascii?Q?GlrCsp++LoAZj8hgG1/FqOhlYCZX6YXpLE3QpR1xYyPL+dbFfg4cwNarJ1Eh?=
 =?us-ascii?Q?Q/ycqtjtx5+mxnaQjc72pO8tpF3eebZbgCSI98hcDECgDWGsd87+nhOGtXio?=
 =?us-ascii?Q?xOSdXTPr9j5/2/ok9aurhzoN62/KbSC+OfjvbwCkw7jVrJp1qXKAGh+xN327?=
 =?us-ascii?Q?PWAYNY+7ExazHAXk5DW4d6n1wMjhLOP15xqWcW7wzLWwopJn2EvtMJIHqlAo?=
 =?us-ascii?Q?0mP2h+H9Ph+xfvF3ft0aaXCSvHNoYwuZ1DoCzYX9BhSE0z3A5MLU51Fz4tkZ?=
 =?us-ascii?Q?YyaDNR55MBfSOg/4z1S9ceJviGt5EvPm21RxzPd4NfuuQbVhDBmUhPiy46qJ?=
 =?us-ascii?Q?s0xBga/MrUmq5u4cTuzDEGRbXuXkwYcmc6wnHjC0rnosPLpJ4LnT/chb+Nk9?=
 =?us-ascii?Q?eL2mMzu78jXDWdk1gQ+sFwlLu/ZpvRR9OtqyKZi+389uy1zgtMcHL535DoRu?=
 =?us-ascii?Q?7EbxZgWBa6rxpY7U0Hvh5vagLgdxOYulCcjgaV5BC+blAdGysriCkoGLi3pM?=
 =?us-ascii?Q?9L5SeOVmXZIAvC442x3rmnwb4EpACMbLEVcMT2nBwc7/cxubZ8oUjbOLwdAZ?=
 =?us-ascii?Q?/3+lChiIgE7DvSzZtk7uAz2x+qiaH9I6KgevNpq2T65EJoijoJkkKsj0KFyk?=
 =?us-ascii?Q?rXBEeN2nvK4Z/ngVuXalGKA/7AvKzmsqZGX0DCTp2OemqGGfrl5FqTdiU5SY?=
 =?us-ascii?Q?/Tc72lEb9aL3D6iGJCymGwJd4FJhV3cXTmB1tuVSRvbiEsyIqUTHJwNdVdkM?=
 =?us-ascii?Q?zrzNUhtyQjwahOvpak7wDqMT4reW7H22693CzNfYzoBq2kZzPDh/zHPfn7qH?=
 =?us-ascii?Q?vA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8feb87b0-232a-4fe7-a2c0-08de1ae5c7e3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 14:32:14.0156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCDo7zHzF3rWiHkZTaDeNdFQ9OHoJ4JcKjTeM6xMAlOXdeIY5IeHKRuFjPR1CbFkl4CDvBvxQLWogA6nIw1Ksw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8407
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 14:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225659

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


