Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46918CD98CF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 10:57:57 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.151383.1781607473218178437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 03:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=qFOfIfCF;
 spf=pass (domain: est.tech, ip: 40.107.159.55, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2Yp4X6xkqlGVOrFmSY1/TpQWcn4s7Kwu+rEZ6XNuFVTyedwfQf2n5tViLIbr48ySll0n+M0PoiLBTeWhhbWINjll9B9qnUeUQXMbTeKEG7hhl0E7KW936XqyvCSsRe+NLD6elimLD0mgLv0thFu744MTVocDNFSaJv92PHG4HpVupDRGYSvVI61uPXY7TNVzPvZY/WWdjjEdbXFyqQ80mCHubsMGt/xWJBfMhwv3rSknhmE1Uq9S4ylLfRZ2zDYS9ebZHQpjwu6pVWyzWn9QXTVV0MUhT2CjknQbetsC38ziXyyUdrmDzhKLNmFAf0GAeI5ns+JQQPSvR5NU0Pu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6mypYunFYuseyFLg1L0iyoWt8pk+PtHp/J76fEQwko=;
 b=CE3G23oYmi3Omc9n/99A1d3RgmvtfmLZj0QextRXKR0Bilg6uWNMt2M2btxvm0hioXTxbSZmHJqVDQVlFor6AG/HyL3FFqmCCiGDeYmlLPoMp2F8U/PkcP589jmwUibP6dtwS6zUAsyNEcspwqsm2zLxGcP1iCZzU+9RUsFo4aNfH1TboOpEZ3NZL4q2F9Web62m+UdkdqetcEhuS1oJzS7+jn5P/X7DW7yk8KBqjD4qhxslzH3ZBW0ZOhTRozR0szSJgAye/itc3OZ+G13BhUJBRfjd056BXU+kMaAHXrDvE35D76T3s66ZOnPTZFYPiyhQCaAyfVcD769MRBGPzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6mypYunFYuseyFLg1L0iyoWt8pk+PtHp/J76fEQwko=;
 b=qFOfIfCF5SAYpUusngsqsHTQY24UEn8fdwHPavWvx+c1pz6xTVFAqJvzKy85cHG8bMjoHglMIWEjTECT9jGMlIcIuBf/73mH3zU6Hs539S4BYu5S4+IUn1IB56hfPTsjl3kLwHg4BHwejd/f9/sSOeoBnZDsPJD/UC3d9GBYbmLQpTeDoYBbr50r2xJsk936jwM4wFul7nUbJJZ7D6U21E1mM/5nbSkQykX+NUsdXvQJJAOC+z03GxIJo6QeNrU06IWmxefJHqbjTSu/zmTgg4vmOOqHiV88DlgQ1lXoTglIGiaQywJwwoqWHFwq6l0E/bg8JbpqT3XZ3SgBREaq6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AMBP189MB3109.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 10:57:48 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::566d:7425:a795:5560]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::566d:7425:a795:5560%7]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 10:57:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2] install-buildtools: auto-discover environment setup script via glob
Date: Tue, 16 Jun 2026 12:57:34 +0200
Message-ID: <20260616105734.47592-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260615121653.96009-1-jaipaul.cheernam@est.tech>
References: <20260615121653.96009-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::21) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AMBP189MB3109:EE_
X-MS-Office365-Filtering-Correlation-Id: 904934b0-ede8-4fe0-2f59-08decb961a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	L+F+MNx4u/6rgxfJidkkLue7R48dqkS6KrgoQdXaPRYOz7X5jINCkVn2Ms7luN689N9agc4u3I8WNj1Oh0MIIm/4vrzRPJfv7vT9TmlxhqMAExeG7YQf/ewQnoY8qrk1yct1HkG8a6iACwOAC+TYgd2g8wOgGWdtReGJvdo5pbDPtfFkcjP2ntWFTmGsSX0/KhAsDjVefCQ7Pv02/YOD0oLdvcCENnlrYlRkk2Ft5Gu9+apJSicV4te9YJbO+UHZXBr/TxeMPKiADLfd9K+TOYjQytvH1BJC4cC9gclF8lrSg/GJen6lqIuxKg/pJoPtYoOjMG/LxPTHPzgDOW/0NYCcV+E/734Mw5pi0DOML8Ilj9Y7dCDGyOPkJi7BYm1zj3rCyGfypsI29jqpcdqez1dpSVQnS3qyizV+TXvbM81Li19dSDuVW9KKneviEvMFpVDmQ3EK1xq5MfZn8yXodQf6IubYumDvv8avGhzXUiL8ktjBeUlKTlkmd93GdxH8HShWgkH8kSYw+P9L/UCGNpprUc5+1SAnr9V965nJ3URi35NRra3tFHR/vGZK34yWWGwZY/QWoiBymhPtMDL7YUKBhHQ7ohpxD2nzO7IHd5fCAfMK+vwYX7QhlQZwjsrevCxXJ7NQ5oSBSX0X5HFosmKpvseBpBD5P/OvCBQRDC/X4a+8NsTXZXzebfFEiBvF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tLj8GlYpA7WKAIQN+90RFemOWxEynSO3rEMFwXW2CPgVuhBz2hTzfgcwXKyW?=
 =?us-ascii?Q?p86HU4FJprsPdGxXzo2dKxAUqpX0M3WwNVQmEHIcwq35WNADC2TyGlq/s3cg?=
 =?us-ascii?Q?Z4vChAEXoPJk8dPxm4Ndv/rV8JPl5fqAevowUnPGufKT8Ok8d3LuCjLeYtLL?=
 =?us-ascii?Q?hMjrsDskUcp03j0bUiGFr1XzD6SDfKKLOOixl6633jmhU5Sl+tLbqPp/wpAj?=
 =?us-ascii?Q?3pFn5acOqEUP4H4CIp7sKNAVp2k7LkFwQFO3dSoQImYWOsRjapJ5T2dLbxb2?=
 =?us-ascii?Q?XC4BQ+bZv+KJw9hOzK5Tw9U0NGBJLtSBEHUpe9XCsO/uLhfDEhLy1yLoXpCT?=
 =?us-ascii?Q?Z1TRtoGUG1IAGUTlTX0RFmVKWoTbD57B1QFA2L1qBMTOWALPUnRbUJuWP2z7?=
 =?us-ascii?Q?Kz4CLorR7XwdThMPgJ7iQxJ/YRpP9DcCr/SvoA304sXs4SAsrZmd501zD+si?=
 =?us-ascii?Q?GsCCYBbF9uKqS4A7sZ3JDwPB2AFiuEQ9Ucp16xg0nT+5w8TsW3fCqrrniUlZ?=
 =?us-ascii?Q?EXtFgWTWFhGoR9AsLIGYvxdzC+If0pYDCP6CHmpVvuwCy19JJmYwgGjFN4/P?=
 =?us-ascii?Q?VSkngcZwPGI0fz9nUqCsRboNwg6gUdLAOXW1R4yvsBT69QNYCbCF4s3Iu1oq?=
 =?us-ascii?Q?fUC+41nOBMkaartqrk/KpLHFPjCLgyYymcjCVcdHZz6aepRk+nDdVVIGR6Jm?=
 =?us-ascii?Q?7LXRxH+IXf0HdHoWWgTnxuT8ldDfglOTyxF+A1U3ZFr7kTozAu9KUzGHXPsV?=
 =?us-ascii?Q?idEgbl+Z4haFlVFkSoRJg6DagbWQF+MVVPkgLrIJXGqMP7e6o2pm5C/jGTpA?=
 =?us-ascii?Q?/Hg+My8Ic00Mp78HjaRdQzpMi4SwF6LwYiBd4BNdRSwomdk5c5JC+Np3+Pif?=
 =?us-ascii?Q?yrYeexDgYQwtHnn/MjkVMD8LkbH9wZsyMtHwqMLoiKnbyvP5bluOZNw88Yk+?=
 =?us-ascii?Q?xfpAqndh7RfjZFeG14dL+Pb4d0Nf4I8KIkjXSDh0wvhD1t2HiPhC8bBzy2GZ?=
 =?us-ascii?Q?66xTHfxUBLya7dJPMju1sxmKrg2gdp8Q6TJN5RkHM0AZn/OTacG5SW4Iq2Sz?=
 =?us-ascii?Q?VgXiWzhbz1gMnePeusACBbVYi5/dlBeuFonK/6HCyhfW84dMmKKexNiYlec/?=
 =?us-ascii?Q?Jim8QD6sd06dmBIuZGE1kDjD527l3aJKur1RgCg7rocf1FD00qxdQHrwzhs9?=
 =?us-ascii?Q?H49JaDKJwtP2FAp8Jc3pKUWrowkWWyHO2AnNqjEaLWqtO9iChH54P9M2ZxPK?=
 =?us-ascii?Q?uvIOAIov3JHH58US1imdYvfFUaUtaynfJCoDMB715X16VYa8xaVE4JetSygV?=
 =?us-ascii?Q?yoQ2f4H/QO4MyKWlHzzG7x9JSAWmLiVukcRz1go2MHfNCEj73CbYjiAIneO6?=
 =?us-ascii?Q?+GEh1f50BJ4cDT3R/K+UUE1oZruJ2h9Vz0/f+P9Fewxz/8JunnJIhz6A50yF?=
 =?us-ascii?Q?IRQd0wYCOqnNhybruV7gpBH0HGB6+9iPCVih8gBf1Gg3OG0xHcEnAyvzf0F3?=
 =?us-ascii?Q?K78jMSMR83x908CNFljjExuKU3B3Z8hRxjXaSgI4JkqvnO63uyx1GA6ztBYP?=
 =?us-ascii?Q?zAqTwbh6Lm38Hmsd18OGu3ZATvX3lPenVgzS73m2MwGwvps75p7U2z390zXa?=
 =?us-ascii?Q?dokcMdfo8z4HLr0xNJUtw9uGgGxviXGHiq7VNuLLxt922E9rgUI05ycyFMKJ?=
 =?us-ascii?Q?0dUtWb0qOsRrsw+E1DFZStUSDt5nxZ3wKisvRFmYxINuOc3E6mbKToPOEbhw?=
 =?us-ascii?Q?AOr1br3rCg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 904934b0-ede8-4fe0-2f59-08decb961a4c
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 10:57:48.1526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FxSr/81DLDgBMEJLGaVPl84gFZPIrZbmOFKY/jh6jC9Kxa1GuClm0b3sMzsbA39xdhtuyuCEh5fqWf+Qi185SjmHQFRv7q2ubDzkIBYmZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 10:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238888

The environment setup script installed by a buildtools tarball is named
environment-setup-<arch>-<sdk-name>-linux. The script previously hardcoded
"pokysdk" for this component, so any distro that ships buildtools under a
different SDK name gets a FileNotFoundError after an otherwise successful
install.

Use glob.glob() to discover the environment setup script by pattern
matching on environment-setup-<arch>-*-linux in the install directory.
Since a buildtools install should produce exactly one such script, error
out if zero or more than one match is found.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 scripts/install-buildtools | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index b9c008a2ec..723edd793e 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -33,6 +33,7 @@
 #
=20
 import argparse
+import glob
 import logging
 import os
 import platform
@@ -305,8 +306,17 @@ def main():
         # Setup the environment
         logger.info("Setting up the environment")
         regex =3D re.compile(r'^(?P<export>export )?(?P<env_var>[A-Z_]+)=
=3D(?P<env_val>.+)$')
-        with open("%s/environment-setup-%s-pokysdk-linux" %
-                  (install_dir, arch), 'rb') as f:
+        pattern =3D os.path.join(install_dir, "environment-setup-%s-*-linu=
x" % arch)
+        matches =3D glob.glob(pattern)
+        if len(matches) =3D=3D 0:
+            logger.error("No environment setup script matching %s" % patte=
rn)
+            return 1
+        if len(matches) > 1:
+            logger.error("Multiple environment setup scripts found: %s"
+                         % " ".join(matches))
+            return 1
+        logger.debug("Using environment setup script: %s" % matches[0])
+        with open(matches[0], 'rb') as f:
             for line in f:
                 match =3D regex.search(line.decode('utf-8'))
                 logger.debug("export regex: %s" % match)
--=20
2.34.1


