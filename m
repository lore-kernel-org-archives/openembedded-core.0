Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260EAC433FE
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 10:04:14 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.92.69.13])
 by mx.groups.io with SMTP id smtpd.web10.38541.1639562652048623452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 02:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=rBA+2guF;
 spf=pass (domain: outlook.com, ip: 40.92.69.13,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbO9xa9WTI8tz70CFNLkI49nfsNH+V6G00kQtjKgqfgaVQHik+/PRkLSiKBBN5lgBjAp4tymUummny22x5iNG0APex3TKgtzRliOSn9tOY9U/VqxiR7OVAdYavq7gci5RzH/ZtM5jKejzbcjWZhSDB6O7gfxiWxdTVzEd2OSg4jgl8QF+NZAfNwIKblQLiLK6lstaiZodFh3M61pweU3xuqzpIRgxXvO8a3ru52XGCDz1PXnynZXXMpwKNTyA4tCTSlzuxT5tibjUlCR1Yl3QlpD3sErXELXS5nudKtrf/GfPmYS0qjRDIrQ2+N6mOLx1whquWKGzzokel5kH7w0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpYidvYhR3wIuPYNVEUPs/gqCG0rI1d0r4eeKBcGpAE=;
 b=dYJV9fQYRcVvt9C+QrrYUHUlC/IyHuPbS9BZItrxYo9SKDnCrpixTU74uE5JqLYAtUi0oAOXKiZeLaDpHuehvuk+9Gh7huncIVCQ1NCqUE32GdYd0kXTmX5agg+I0q/6i1Mb/N21+0k1tFpKM96eVtWmEYwbKctjrzqcGFvPdaDQ0BNZ1kryAXIZRFZbbxU5YTLRJgllLLrzJaVTFavfzmjaOT0a4+rb03d6L+daNpJlu9JKKlM4jeYBl8N1cPv2ZvsPk4b9K6znCcXtMe9NGnKpbg5nHeRPAoJeNjW+3OMgo78mPRlM/l6H6lCb6rPjynGPfac/bN59e1iActW0iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpYidvYhR3wIuPYNVEUPs/gqCG0rI1d0r4eeKBcGpAE=;
 b=rBA+2guFC90qsb4vLBHlCwJ9R65GGQ2ORKooC0GXQOeobwdE/3ja/ZFtqvQWAAw7TxDIFM0wdJtVLsEiojs8qkh/yEGeoZAK1o7saVuiQUpyvzypC/GjgNlzuOU89/Z8DwqZ+z2SDuHgf2tyTwfE/kwAdGaq+pbv6CTt504Jz+0R/sEW9t2dlJRT81Dqylo5yjzIdU/RL+Fjs0h17U1A6Zn3PIyJwu5gyKpZFNLIOQKQtn+qM048kxizH/G8kVJovCpMYDVzUi6VHgqrx16S3N/3thyWkFDbc+DRWFbMzwT0Ktt+jG2xqosp1Gxtb+L9Qy6nY39rwpVMi9gEzDty8w==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4068.eurprd09.prod.outlook.com (2603:10a6:208:191::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 10:04:10 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 10:04:10 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][RFC PATCH 2/2] insane: make patch upstream-status
 configurable
Date: Wed, 15 Dec 2021 11:03:44 +0100
Message-ID: 
 <AM9PR09MB4642D4A55B08C53CADDD8104A8769@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215100344.3266900-1-kweihmann@outlook.com>
References: <20211215100344.3266900-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [arsNxVgVf5pn8xzje+jug800ptiQN8xr0pT1NdcTfi+m3pOzgsioMdBvjMDY/DOX]
X-ClientProxiedBy: AM8P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::11) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211215100344.3266900-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90165419-fa24-4cd8-28aa-08d9bfb23ce2
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyKESGhdDjLi5cUGKKByotZqnMKKlqrcNR5RXX5H5x61tXcBBGw+KkimEcnGSprHvShHZ4MYKy/ZV8bK5bMtgFzr5PF8zh7V06hEvoEA4t0jbkMbx7/eMXU+vFDRh8JoQfg2oQlJEcSlqmCWzjnKltlkLxDB/3vFV6GUmKAj04TISfIyo5yqRJcV0lLdCAuXNxuGd6Fr9fzSm2iokkRiWch4Lg4o1uDZrYeHP6Lw84c9MeYvE98yOWTV2kOC4N79+XqpxEKQ/LGNDlgqNYbmTmLMkqf7y1FuSeW4+fjPg2DPDa5Nf5lMbgC5tZDmEqVCEM7M/OFgqlom2PPHnR/qsC5qW8Dfc2/OMqbxsFABn54renZuiA5k47SxB1urN6NYJ9jkL2H88l7lSSr3pzQq83K+0egiCdPAEPm7JYTGVXCUq13aoqEMNwvQGV05+xit4t7aIVoLEvNXKd/w3e3VE/sc4F3IRD1wjYdl3KswZ++U4KVXb7zVDhug6GODoEwcdJnIVViQTSvdGnAENmLQtfjK0kDY3GKLEQH1qcC/OvQiYuSa6LxcvRGHAzDNAYVabTcHICudkafxB2PmcW8RF8Leu1VYH5wfQYNAw81MACd+pPv3rluqmf0kg6SGpBSobfXx6xqfnsERgbc12aDdLD6RhY3aGS9VHYXa6elATX4SzoooRsY/fgdi0QBndhdVMu5X/gZmh2psQmmLxpZ3HiuM8uhMzswhjvDzojc4nOBCTpZiaLbrFREdI2CoV8XfC8U=
X-MS-TrafficTypeDiagnostic: AM0PR09MB4068:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vWFbLCtMIiX/vUXao9bTDRjHkECUaBikrvx6JuD12f6Os6JWoVj6ruQydW6ZjwzK6SlM7OCE4RPF48QO3gQBOxMU+U9ROJ3hX+wzEYZEYweOppaNKXAaEXhH+vAAKFEXyJkiZwmqtz3rshGmDYlW5ceJ5XFus8MdmiiOg9HfIqCPiks9xbHJXrixLUK4HjW5v3Krn7hJL+NwmHvLiAOwIrhTWWH7ZuHxQUHWQiSbNRPC3lPwStKh9kyV5xOQN9TT28TlZxOFrpn2KBUy9+zi07qKMu07vsJYGcOwTJQeqPi44GOn0t3FZyNOOZmQanO9otsmn4i7iofybXK6eJYRgCiQEccKlYwy+xAzp8MElGQT1xTyIoGaCCq+6gKzqvf8N2PukwvbNqC9xEppkD5QdnUK74O7HKHkB9ehwqSPJaT1ayqlxGx1XV1QZkTF6ol8I70DZLAZ27ktEXeoX/NCoJqocXB3gMnPRFS7cKkEqf2OKuwccZN2bFjUbAljb/ByZpLP6PXbsh5U5B49hmiCbZqS2XbQprdbfqELHbLoFuHcBxlKd/AGxmhdlcz87SCJuCRk7UgH26R0mNEtt0Z0wg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zp9G0jPkSrKFZqsfOQaYWAlCjZZpcM4hKsQw66lbzFGacLgDHpcIVRW0ll7q?=
 =?us-ascii?Q?Vb89BmI+gKKo9Ku7FYvBbKN4bFTXTHF9xfCtSz1I7b1AiU5IQHeIv/KSllii?=
 =?us-ascii?Q?4Youd3w6I1qPT6z/1joL/09vSC9UlFZzp3+9pqYXVJuuOTckyP8d5derIcvp?=
 =?us-ascii?Q?+U889FwdEf1haIFxPsffrQ3oImMlaiEqxQ42fAurKbP924XCVWrST9U6vp4R?=
 =?us-ascii?Q?iAq+198iGnxIGaKiam3SypEFlb4CgbdnbYkus0qPhRGGs4sA454odM+lwFVC?=
 =?us-ascii?Q?wuuW50OT8Qb4RAdAkE4QB38CzxTqFzjjqeoVB7HZ79D85L8ltUIcx416uAvU?=
 =?us-ascii?Q?Pt0qHPQ7OO3JWsQhsPmdQvGhOGET5SCZhhs6t3kYrNGQ8PIeMreEm2mdcoUA?=
 =?us-ascii?Q?FBaNVNT8Ltkrv+aprzEyQE5Rv5lNPFVJlNGry0hdkAnIxFu89yzL801o+yBo?=
 =?us-ascii?Q?dCtuNfjrbVo46kc21NIWU1ee8UHJAM6IsR9tf+M4r1c6Myjzjqdd0hrwnTfp?=
 =?us-ascii?Q?qZFr8BR+ACMIC5vqOSOCSCQTivwe9zXpt//PGI0VC1FdpeqJ2uAUfpf04A5v?=
 =?us-ascii?Q?PK86K4ykcD1qzeBsnZ4bdG6hug6Mvph9NMxeCLJ5nKhdj2MeuYqC2lFTQHK4?=
 =?us-ascii?Q?2KqqJb89nUt1HVngAm5AD7+PkqzAte1TTRzSGLjKzd8/Hb8raD6w5+lNHDGE?=
 =?us-ascii?Q?hnxz4+m6kjTfTFUlf+FgIYoaf9+3GghsE6cvG/rUyk1M5j8TexMRhnYV5lSf?=
 =?us-ascii?Q?/aKpE6N9K4pdMKjCFvbZB/lVOr1i5qc2uWdu/0fqgvm9N3dASPr4jdCTNeJ1?=
 =?us-ascii?Q?XWepsbB8NTpNpeUgrwk4MY4kyB9HpQyvnV/QK++lYYe/reUQstVA8BV8B1w2?=
 =?us-ascii?Q?GNbwgL1DEgvKknPM7HkyGthKJ6/KHk776NiIH2+DWoTYGGvUnMuc1QLokCxg?=
 =?us-ascii?Q?0lIaG+PLSfyJA/h/fnNEEunq1n5GKpzRTZLSDTrFOR5QOKNmcPi50l2xemJa?=
 =?us-ascii?Q?rD0eRizwc/aDhA8bYbe5KSeH9Q=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 90165419-fa24-4cd8-28aa-08d9bfb23ce2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 10:04:10.0392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 10:04:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159718

instead of hard coding /meta/ into a skip condition introduce a
variable called QA_PATCH_CHECK_LAYER containing a space
separated list of layer names to perform the upstrem-status check
against.

as this will add BBFILE_PATTERN_* and therefore host specific paths
to the task hash, we need to exclude do_qa_patch function from
task hashing.
As it is a postfunc it should run anyway, once do_patch needs to rerun

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/insane.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 240f3aad62..c19cc6f629 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -65,6 +65,8 @@ QA_EMPTY_DIRS ?=3D " \
 # message if the directory is not empty. If it is not specified for a dire=
ctory,
 # then "but it is expected to be empty" will be used.
=20
+QA_PATCH_CHECK_LAYER ?=3D "core"
+
 def package_qa_clean_path(path, d, pkg=3DNone):
     """
     Remove redundant paths from the path for display.  If pkg isn't set th=
en
@@ -1171,12 +1173,15 @@ python do_qa_patch() {
     # Check if the patch contains a correctly formatted and spelled Upstre=
am-Status
     import re
     from oe import patch
+    from oe.recipeutils import get_layer_name
+
+    check_layer =3D (d.getVar("QA_PATCH_CHECK_LAYER") or "").split()
=20
     for url in patch.src_patches(d):
        (_, _, fullpath, _, _, _) =3D bb.fetch.decodeurl(url)
=20
-       # skip patches not in oe-core
-       if '/meta/' not in fullpath:
+       # skip patches in all but the configured ones
+       if get_layer_name(fullpath, d) not in check_layer:
            continue
=20
        content =3D open(fullpath, encoding=3D'utf-8', errors=3D'ignore').r=
ead()
@@ -1298,6 +1303,7 @@ do_populate_sysroot[postfuncs] +=3D "do_qa_staging "
=20
 # Check for patch fuzz
 do_patch[postfuncs] +=3D "do_qa_patch "
+do_patch[vardepsexclude] +=3D "do_qa_patch "
=20
 # Check broken config.log files, for packages requiring Gettext which
 # don't have it in DEPENDS.
--=20
2.25.1


