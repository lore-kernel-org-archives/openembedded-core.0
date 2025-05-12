Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C013C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 15:52:46 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.124])
 by mx.groups.io with SMTP id smtpd.web11.54012.1747065163174818400
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 08:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=olS7lHXM;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.65.124, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXyrMRBaSh1uL02S6if6ZMpZSaIrrMqwgLcjxbvXhp8+rLePPgnROKsrnpgH/1SKookvqjidEPMk/1b/mEpvCLSSsEU7iKXwUOv+oBPqm4iHuwxLnAcKO9EAR16Khc0Kqe5W/USjzBonRDAOhqcR/2mhm0W5wnxLs7noAE4d1lTsXwnIEm395zYsD7qMlLdp0L8rbOoIZqtkaQ3zb296W4ey0bcuBIYxAkOWerpWwvke0XmCmUxhiRZnYk+yV4VbJxhkzz28tsFGcrLfYMsXOghvL0khSMnJ6DMEo/q9dlTAFhDcQqWVQ/aaIWPqy9Rcg2lAFvxSHuXRiPwlvtmydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIHB/9jDYUynv6YrZMinXmR2E7jAgx9gKH4zGMRx5Y0=;
 b=VhtmjPk+34DRAsLYGx04J8RpwxVVpGdAJ2f9ROb/14fIdJPMFYsOAyUnDmT+wkw+dp//3oPaBLO9Yc2yIBJlHoHxUdD9bVu0TfQiW0f6FnG6YkIhwOhiS6vTm0oayRS8yTRq6DitGjzDW45YwVPw8q8GfO1s6lyfMmKeG7S8p5+gOuaW9S1VFiwblqWDuoJYIqan3ZBZFbhDlFilp7zR7f7vxeZS+LyoLO1epMa6bmpS1CXQBrvsbycdswXJzYDdirkcmi8pmt69P/t3N/rTY5ZEp/twPTAIK96tbk+wgcFH6KfxwybmM1DuTVIWm+Ir543lMILvhRb622yPvTFM5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIHB/9jDYUynv6YrZMinXmR2E7jAgx9gKH4zGMRx5Y0=;
 b=olS7lHXMhmSe77kmXJpTBtfttvgU0zZcL0xVUClSHhDZZMaNC7EbJ1nQICm2bEjEOOjwapdZQyEYur+GftZpJB9FbHPcXN6xg/V3nxiRM2O7/kTYgWsVIWJgUMBvTWOsF1bpJ5A+g0E3Ep+QPuq/vKMOXIawWn+vzUQYUYcFOQ+IvTuzjtk4geIsoVBfXu2B9idGSaNQ8o9IeyVvYcqSHL7y+3nLTpzS2ez14cPa+Xt+jeFDqj6AFfPKl+PLnImpH3pvtf2XNSG56naIrawu6TKMaQVprkyF2H8/AcVMwk1OnGYxzIV7LsR/dSsTyZsImYu065D7VGwdxkAtT16/RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB8022.eurprd06.prod.outlook.com (2603:10a6:20b:3c0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 15:52:40 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 15:52:39 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [scarthgap][PATCH] cve-check.bbclass: Fix symlink handling also for text files
Date: Mon, 12 May 2025 15:52:28 +0000
Message-ID: <20250512155228.3503512-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0107.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::9)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS8PR06MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: a553ae64-81b1-4f4d-19bb-08dd916d0634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XpTkj2X42fDnIWPZB9HBNa2ZdrxfYzSzEKnQb33sSHAHROcEsoCTqlJghMV7?=
 =?us-ascii?Q?A8uoNFDtDDNb4PbpbFVjmnKZsgbFpPUCzxBPw4pdqn0ZAMtPrXSX9ZXdcGGb?=
 =?us-ascii?Q?gzExgc7PW0Ch0briZIA+hvMQNf20MGcMdmn16vy5AWH94y5z+1LhL1ZI2leu?=
 =?us-ascii?Q?n58wRBkE8aG1Q1dqvWmTG7JFnF4QAXZMDJoEI2APZI5lDsHQpdIQMYbYoB9K?=
 =?us-ascii?Q?JflunIKWGbaqoG5+WUIvYChp3bSfaOG45bItP3eF3Q7lf7uqbmaAgOHw+1S7?=
 =?us-ascii?Q?+GeoU4+9Kn1Q9OqHHwy1gR51RBNHB/VVCPyYzHapLcPFXgqiCIyMqZSz9KYW?=
 =?us-ascii?Q?iKIq92Q8lj9n0ObtEtrzL66ALehUGRFQuJTCLr0lwmm+PQrg0PsmOkopPLGD?=
 =?us-ascii?Q?5PCPs2BOpuPE223cW20DaIAwEUbDSUXEsnObp+uMWwcZ10mIFTQzQE3FdRvB?=
 =?us-ascii?Q?wvGhlG274tKAa4ITysyUTJ0brhnDhP4Ktyi95oFkuA++s5s4T5yFb62PfUcR?=
 =?us-ascii?Q?THSBUer7ij9FUwhsyXotl0o2j/4n0e946SjgKq4ZPaktx2u9f8JaWKe52d0U?=
 =?us-ascii?Q?M4KHwa7dra5G8H3qf4Lk9WdzWYZYa/z6nNqu5U+4/sS0t5L19+W12VsqFaxo?=
 =?us-ascii?Q?nkTeNKJRiPse3+jT3rDX0GH4FY71dE9vhnOz7hNo1Ka4dQ/deRH2LdfOBtyx?=
 =?us-ascii?Q?XJm5yqewSDHXMrtesmAyEKFTKJrpLEEy3lALQgBLyz8WaQv+mET0jkiWVW7K?=
 =?us-ascii?Q?+x19lO1S8Ng8YnBQD/EMUARKxwTkg/mKzc0x8UfwWKSMi0suIu3TekygFbrI?=
 =?us-ascii?Q?/98RM7CAsoGMoqGHHLRsIwzQMV/9PSD6n+DqrXbt13mTz4d3rwm1aJYqrcJ8?=
 =?us-ascii?Q?gU2dgy46sxeDbfklcxHRpG/6fHIKQyBQPVGDaAMZNgtvPobyoYD4alJwDEN2?=
 =?us-ascii?Q?bo6hXMwoj5uvLHU57MIVn443UqGnXZt+N0cFE704Hrt9bh8NnO53siDVSDyz?=
 =?us-ascii?Q?R2cVd/TvEgXnDCGkPwXY/ptfuxVah3JuLTFLZypQ/D8jrO2+hpoUIjfWHOpW?=
 =?us-ascii?Q?pnVrd6BCz2wZO0A+lTJp+jt0hs30PvXeTBJ2Cv79Z3QPsb2TKBe9kgcc3272?=
 =?us-ascii?Q?qKCzkq+JZi0V18h2ooqXm169OD9WvfEvlJXepYwJ6ocRBaEwJkrpKOS6Otcg?=
 =?us-ascii?Q?ktXlzRkL0DJrbkw777xBB1GPu4ECWj53+Nm8hNxfdA8nD+KYROf+aqWvocuo?=
 =?us-ascii?Q?ngYcLMH7FvvYBUwv+jaZ8+KnIvgEYeUdECBWNuLCUxdWp4ncG419flXNc73V?=
 =?us-ascii?Q?c4jZ/GT84UteY4t43ajgwE4VzjUIrl39E4IoLHzXX2g+wHF9h0XaSi6wfRFh?=
 =?us-ascii?Q?l8qUu40cuTZb4DM2v+Ia6g3oxrL8kF4a6mutNwnLjHgt+/JmVG/IUQywQ33V?=
 =?us-ascii?Q?T3okCoe3X6u4bxK5EenhZDZ+yyp+1aSQrkBdSdV6tEw6Ujoi+EaggQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MBh8NAZL37prv93PscsymqU/TI3bf4AvSbQ3WhnV65bApBxmfanHqMOqB2lF?=
 =?us-ascii?Q?vWpQ+k+0BHNKLCXGSBViuGl8rfTWcs6zEum+KBT8WzRv6XGDOGJsYdG/j8b1?=
 =?us-ascii?Q?058GZPApTrTcFAds1Md1GbTZ4KKtK2BDd7TcDbfY29VjrLzID1FfJQ1DFTcc?=
 =?us-ascii?Q?9kNKHpLSGJ6BVMXCn/geQm7iQO2Fi01Q+6Q1b6l1oSZciZxw8vJcNNdoBRv0?=
 =?us-ascii?Q?a4JbDaTLoDd4x1dvqXc1FpQLYXHYnjhnB4vK5eHKTLEf6EJLWI4+EupyCEW7?=
 =?us-ascii?Q?VVn6guOJAQYJxgom1pSziheviud9Z3X/cxp9KBv2NTIR6DrjdSBRMbDLhVKJ?=
 =?us-ascii?Q?QNBMYvoVvetVjskf743EiNuP2G7qUUs8OkdTbRBg9IcFSROXgwj7vWA5RVfR?=
 =?us-ascii?Q?beh9lp4idib84Z+9XsmdN87DT3hD8dSrXnfRk7dALOJ0246hMWfyYhCvSvrv?=
 =?us-ascii?Q?BdySRCuJMY8wXCeHSZsk0tXwG0Mk39s3de1I5/AvixwBqGJQL1H+eXD74cFY?=
 =?us-ascii?Q?zQQcTEvSHgFmz7MXMormBAWyw7BizZROmlZBcXzJkEssa/Wu0a+Mct8GMQOv?=
 =?us-ascii?Q?3A8UvK5/A2gDmIfPj30E9ZV4QtBFnLwBDas6wVMQ/MtUNiKtTFumQ38pxrb/?=
 =?us-ascii?Q?5P6cdoTvCcZQB9lY3dgbW9f0hEBno8HmuAA36hJRSbc85MREj3v/27LgURXd?=
 =?us-ascii?Q?MlY7V0YWMONg/Y96063Zz0nJPr7POmLlOI/RFNhG+ONwUjuEhWIFeJPF27Eb?=
 =?us-ascii?Q?2EbQsw0r7ye5u4zWQxQUI+MulvMdpiHkfu4S+OebDGNTIJyag1jQFGs7ci+3?=
 =?us-ascii?Q?1M9tSN2rLMQcqBt13m5FbqPlo3FKmtSvABqbw5M2GwcF2oK7iz3eXtmPDDHK?=
 =?us-ascii?Q?ZnymMjWtuPSokkNPEaBEjoix4FD3J+5Oah2Euvt5kM2hwgzZczjKrFLbyT74?=
 =?us-ascii?Q?e2ReGoj6P71lIS6mWbG/X1n45eIvqCY4SttbKg6GG4LxEji/ffEtzTYYwtbz?=
 =?us-ascii?Q?Ks6Wc3XWDJWpNlrWtlKpFSZ/QYbBGELHvIAJkTFFaYZ0N9kd9ChwCVQ5WXHL?=
 =?us-ascii?Q?1YO/isLvFoLFpGzwTo8y9pUX6iLmRE/Wl1taBkYLg8wrldPI9Zmp6elhZwpO?=
 =?us-ascii?Q?1GJ5OXHtUd+QS1qyHMhrIaO9bKldksgyPfiSm++H1yIyK2epTPLKfRYXjdXC?=
 =?us-ascii?Q?byjJ81YXNK3YYqKsD7jabGsOnGwm5HAU22EviJai0rmmUiz6vIL8FjZbSPkw?=
 =?us-ascii?Q?D0YEZ4baX5bUblCyvECuPnU5kMv6CTgBMILs0ItMOyim3Hkj9kt+o3JLQ/or?=
 =?us-ascii?Q?EcYRUDcMZXZddbbe/OjaAs/DkAwfZ4QaQF9/DFsZzVqvmFlpwW/edXmmllJa?=
 =?us-ascii?Q?3Fo7d2wje684YsxHu32kcHxdupHqRVhppTvC5Y9EqF+MtPkaz6a81A3d6Idl?=
 =?us-ascii?Q?pCWQ451ponDIr6eWlnO40vi5tlXbsHYBNrKqZFtmPGrsXAtP/kot/mFBgGih?=
 =?us-ascii?Q?elKQaXy49NiB6MydZiDApcf2Wbk983faIaufdVtQ/WBqp6ZJBhe7+vU0Juf/?=
 =?us-ascii?Q?4k0oP7nsJTBiWRJd0mjZclvuVJQPxDOIq+w8v4UvGNBsC6QRjriHkEPmdwdy?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a553ae64-81b1-4f4d-19bb-08dd916d0634
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 15:52:39.9118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BZUeWd+M1dkQEGL0Jx//V6ZsymiDAj/da1M0OiRcuBN5T7NBpEMRk67pUgITPOsncooCGTFHUdTOh+rsDiP2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 15:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216378

While backporting commit 7543e4e24a8b ("cve-check.bbclass: Mitigate
symlink related error") I failed to address the fact that in Scarthgap
this bbclass still generates also the text CVE file, in addition to the
JSON file.

In order to avoid the error that occurred with JSON files from
occurring now with CVE files:

  ERROR: core-image-base-1.0-r0 do_image_complete: Recipe core-image-base i=
s trying to install files into a shared area when those files already exist=
. The files and the manifests listing them are:
    /home/poky/build/tmp/deploy/images/qemux86-64/.cve
      (matched in manifest-qemux86_64-core-image-minimal.image_complete)
  Please adjust the recipes so only one recipe provides a given file.

update the symlink handling for the text file variant too.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/cve-check.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index badfee550c..6b8376bf17 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -270,13 +270,14 @@ python cve_check_write_rootfs_manifest () {
     d.setVar("PN", save_pn)
=20
     if enable_text:
-        link_path =3D os.path.join(deploy_dir, "%s.cve" % link_name)
         manifest_name =3D d.getVar("CVE_CHECK_MANIFEST")
=20
         with open(manifest_name, "w") as f:
             f.write(text_data)
=20
-        update_symlinks(manifest_name, link_path)
+        if link_name:
+            link_path =3D os.path.join(deploy_dir, "%s.cve" % link_name)
+            update_symlinks(manifest_name, link_path)
         bb.plain("Image CVE report stored in: %s" % manifest_name)
=20
     if enable_json:
--=20
2.39.5


