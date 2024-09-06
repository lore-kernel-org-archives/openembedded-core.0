Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14005E6FE26
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 15:17:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.130])
 by mx.groups.io with SMTP id smtpd.web10.1434.1725635854525499576
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 08:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Lz4RgpX/;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.130, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGpxZpcCwU9B96Vor/0wSnCBRgLyC+5e6XDna8xDOnfYARUUUASfGQ5+QGaEBwxQg199Ul047COhej9jR7a0y+LhVGAySleuKr0QSniX61rL4wkmykzP3xgh/Pc2S8v7Rm4j6dVEybCCObzuM7NehkfzUv1kjzAQRD3DT+0iiDv7KGtfj1sk6srK4uTVeV+wotA5LuLJVh7J87sk+k7MiT+TofjAl6LhhLzQuvs2tZRPPL/swVH2TXjBw1zuR5BS91++mdGvcBembrQ/53bT2a3dkPV67PMXmrrgA1iE9Ssij7mu08hNw1ws4ZhXeTIBq8qTBSTyP0tPjLX+56BZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F56PwLLDLgF+1y277Uh25hXunEucd52EUWwzZYu79b0=;
 b=B+9LAXJISrJfte2HiF9rN4eqB5x180QnsxvGkIkkx+AsFIuWPPvfmjcgRbVEEZ1UVDsHDZZKjpLlS8xhAYRkiyw+AvL5MfhNaalAufIsEPCNgg9IUs9aI5QYXK03X6SsXZx9BxAWc1iJT1DxepOb7TIhvsTbOz86lEnGeQbjYHGs2tyY1UU9AXY+nVfh2X15JdpJzQgfYXB2eD7BXeUZgg96drYnmTP+lq/fhqRvTWAIrz0qZ9D3v0cSevT/naEXk/B0TxuenboWNZA3CfHrJZKN6r6dWmXHb2s/egeLHK9FIuTh3T4OiOzicJ0hs0fidc2iGV5NlF8jxNlJ3WRDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F56PwLLDLgF+1y277Uh25hXunEucd52EUWwzZYu79b0=;
 b=Lz4RgpX/A0NFspLMcqGAB72f27Jr5o8/kicQLcmnUzxDVHD88WGNoxsibfhDlj7so7yBoipLH+qBAWDRHIdDe1tiXp4/8t1kojYu90P/89tc8WROayAzmIiqRf5EiRKg1MvRSlYpAoYc34pmPiEPtV+yIk8C34x/awhO+VkIW4HK7XgEaRwYdmIsV1ULiudhc2TJNY4IKeyNGfh3S93O84Gegom90xd48hHLOAl7Zk7rzj076XkMFg4FTHOKn8X6tdgADyzsfIGxu4uM9Izy0mmIQRNLHJRNcD2W0Q6fLMF7BlLKGAH8cuhINFnajKa3lJ4ouPo/NYjvPZAe5nPgyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA4PR06MB8499.eurprd06.prod.outlook.com (2603:10a6:102:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 15:17:31 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 15:17:31 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 2/6] dejagnu: Fix LICENSE
Date: Fri,  6 Sep 2024 15:16:58 +0000
Message-ID: <20240906151702.3006933-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906151702.3006933-1-niko.mauno@vaisala.com>
References: <20240906151702.3006933-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0114.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::32) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA4PR06MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 97bde4d9-c748-4051-f680-08dcce8706d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GrM7L67a+Lxj7eeGzAqFVM5wAjnrGqL0vYUJJM6vWz6NG57qlYxerDXDPbxM?=
 =?us-ascii?Q?eoVkIfeELt/6jkku9TiIY/YirMK8+A6fdRRy+pK8tegBhUZMKyyfV5SHflDb?=
 =?us-ascii?Q?TsPTL56uwxXfkSSC9kcEgGtX1j1oW1ldYFcoZvPpQlFqjAbXGsyBiFFEh9ZN?=
 =?us-ascii?Q?03PJnXhO4QFnEVEG4wETcQ3O7pdy1Lrki2fjl984lyKDeqbOlT3ExcEsekS+?=
 =?us-ascii?Q?slCGCRiYtj6zMOWJ5htoBh2XrPd8ub6vcV8M+V6waGxmC+SaBllFI9VnGyMi?=
 =?us-ascii?Q?0BiDiQ/wxJ7NA9UIiR9SyLHw5uaBZt6siSW7/oonXi0RBIveJ4dtmX3CY8xq?=
 =?us-ascii?Q?+Irpq1Tb9s6IgA7/1q65R+gmdASoHR7lYbi165PmRRzbZGXEOYOglWiPR4Bm?=
 =?us-ascii?Q?B78giSkkIHPfx51kpdzjTx+LvLkx0dVIvdetB97b1Fh2uKv4lNCrF3L29M3u?=
 =?us-ascii?Q?ZeBrYzdP1o+ZL11zmrpgb7rButBSsHcIB5xLcsYstyijvg15+6R4vTU9rzuz?=
 =?us-ascii?Q?XIw5iM9lYqISy26QvUWg07wnA7mUjs+RGScC7mBRAeOGG0zqlCyBtmUfSzzk?=
 =?us-ascii?Q?oNoqJ/cVyOxqYFOwlLl6eRcZdkolZ7+mzH45Pq45gb0AttRKENJybHvhljsd?=
 =?us-ascii?Q?0sKl9jIB/R8iQ90/afIIjSbaDXhcOxIDJGGDsUt03PZjQpuCftRrtme4CBmc?=
 =?us-ascii?Q?QQb6nAr9BWRJ9YnAnIR+rH336VfZe9S/ds2IHSKJ2dwzOtlKekhS2v94Ln9G?=
 =?us-ascii?Q?Sx7vxSrHT1mg7hYgmfpdbTQjhZNFHzP8rEv/EQHKcEPRAid1UBOHJJdX5Omg?=
 =?us-ascii?Q?q/VpJpAxW6O3MSKrY0e0Du1roEJgefW4zePqUktJ7yHR1Vbe5FP9sdhWOVHx?=
 =?us-ascii?Q?a5JljGYl81qJwi55M/Dg+zV/l2ongtD24yTTE/7AOwBOfTFeg4bfhC7KstOM?=
 =?us-ascii?Q?v/srKJi6BGesoYsmk3eb+dn4IlXXpjzcP2A4Ki96YW+pW+hEw61JkMCyCvza?=
 =?us-ascii?Q?S2IeeiUjTADnTXsLWCovIqUDQDEJ32Ls09OoucZiBvbWGD6yO/vQX9mAM6fy?=
 =?us-ascii?Q?aosN2wRuG0k/eUckSmye6jstcfYw/01NJQ8FDfb107uT2CzsoTYeJ9ai57Pb?=
 =?us-ascii?Q?bNzntYnreT86CuBmpUmL+q5IGIThfLI+FmUx44+aIEgUV2CKJ8SVoq506LPR?=
 =?us-ascii?Q?HBlaaAWNQHu2Sy7fIjm8bt2HzDjhU4YrKdrcF2OTlaoVlmmEbnrimYr6mVth?=
 =?us-ascii?Q?Ervc4CNUrHBFif/XDHp9BwiZ03vV9yai5p7odg/7kowYZXck7JgvHI/QUN2x?=
 =?us-ascii?Q?u5N5Ie3qqGAo/bLxDy1m1wV/9qa1YU1C7310jC6Vn+L2IehqGnmxHSfAATNs?=
 =?us-ascii?Q?8KdLdHFg22jikF5jPMEWCsAe0rnRwjkPld/hHuNafxpQsrO77w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?noQcK6fBHxey/WuzTPUBKQTaZBsaczr6HzahEFN9WgLNxzE1FI4J4sRCisSg?=
 =?us-ascii?Q?qEz5cOrME0PNGX4Dbsinz0MLXFKLgBI66hfRZqAjovi5kb5JSkfeAsUPjm93?=
 =?us-ascii?Q?fKiCLq/WZIeXzQNdoYSgCPCZFnL2cA06R6GmZrutaLdbESkzP6nPvs4Ou0xB?=
 =?us-ascii?Q?0pOFe2mS8IZPB58M35KAUFQG6qKnGC2YAU/uVSs3nVo2/wD8fzs1qkZvAJge?=
 =?us-ascii?Q?tIiC1JTxYrQRKAcRcmCSpr+pIdizJ09/nqkYdXiM+IgQrvP31P98P7xhspkB?=
 =?us-ascii?Q?flO3Pg3D48wKMbVmlJuWm3Ge2NrFeYoBWk6Gfobsp/VeYgnS9TnF16j7hGuB?=
 =?us-ascii?Q?YusVtWKm+Bb6FDm1A78XjpKToaBytpgvvJToXY7cUeEpGlkHvq68dKlKaX8Z?=
 =?us-ascii?Q?67jkDhl0AsWhBKsxvWgwfMYbEQrEaCdTO4udU4YUHNTzC0OnOtJVgCBcgOHp?=
 =?us-ascii?Q?hsX3ghHngqz1Xl7QzE/cAQsC1aL9XgYZxA32GfqAc5HudqReKU+pCt09CiZ6?=
 =?us-ascii?Q?1X59hkemd1FpCZXmpqxsN0EMFkXBPRgWWi9OYggKpzDT1eaUYVULxui0APgI?=
 =?us-ascii?Q?OLCe684m+qiZilA9vKaOLJYwf3EniuYq2tdRG7j8EL9B3DPsviIqY+cUOban?=
 =?us-ascii?Q?3xodHf7nGlo2rq74lysAO/FBoPRjaNh+cUryIiHd0BmzRdsc1OAdC/zb9pUP?=
 =?us-ascii?Q?cNhY9pigvqOG+RuijUWxuGOP80a/hpvI6JH+I+Xn71rpS/XRTsiHflFLUn8c?=
 =?us-ascii?Q?e+AXNH5T5VNWZBetEfEvFKK35962JsFp1MqYEbt5LBceZYfhV7cYBTxlGSyN?=
 =?us-ascii?Q?2tQHDpK7ANxVGPWZX3OyBw1bU8SZ1wqILv2IH9+1X/8YXl3NvJ27UubXhnWy?=
 =?us-ascii?Q?IjzraEa2e+PU2gQTf6Mb3lGkvOEg1+d0BkC8WCcgjtY6v2xaTwN5EHtEqujS?=
 =?us-ascii?Q?0gngwyCJH2SdNndjgYLkgE6vvlkdtRAr9MFm4KhsI94+u/HJLQJ90HxBtG1k?=
 =?us-ascii?Q?VmzgKlQTfYTY8GDccL2gHIBprYKLlScpzzsY4VAdF5J5dpbVRZV+mZS3VWAc?=
 =?us-ascii?Q?lSzi17qTkD818w/E6ok3Ef0OBiOBAcUtJsQ1gAUMmK+cmzsoa/+nPY+9qirf?=
 =?us-ascii?Q?ai78hPl+TBVlSWfEfGu8vHKXq5UAsYKjZ12t2kwuZj5ATu1QBppIBSQ8xmE5?=
 =?us-ascii?Q?Y8sbpuQxtc+BfUCIJy5+cnmcFwmbMcuLCeS4ipfVrC6/h5QnNJAKnZLSlk0/?=
 =?us-ascii?Q?Saev40z7hwBh6B/Y0Uq7ntePN8v0XeYcS2IaYe4CfXjk3FgVTez2h9nDOhlo?=
 =?us-ascii?Q?57p/j8LpWEare/6i1zt028TjFvLbTO6GoP4QYZ6c2xJUfVhD/fQL4CUHNTi/?=
 =?us-ascii?Q?BxGSbXRtJKay96OWpUp1CfiAXLnaxKBe306u3S3yLFAdKj3Mw6W9JV4OizKa?=
 =?us-ascii?Q?uyzuuEaoFpezDiF53zdSg/yBerPurjS702G7sZSBLRR5LXdXgY09iCrX5AdQ?=
 =?us-ascii?Q?IuAfRjiVYlUWOg48CnsCl3gHIx1GlbGP1Yfk5BLldC8hOnaycLjo4te5dfdq?=
 =?us-ascii?Q?UdHKXnsp3eylRz/j2EVuT5DXmFs0LTwtLe6vUHSUw6wPrX/WTujK3pFeAAeF?=
 =?us-ascii?Q?Pw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bde4d9-c748-4051-f680-08dcce8706d1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:17:31.0900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ml31wcoHF0C5uZWnZcjU4C4gtN6Dtwu13ljsGdjNSPyYoa0e9inrk7XmtvuWkT8OlLn4Vot+yrtaRAoVvSQa4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB8499
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 15:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204270

The contents of the COPYING file included in the current source code
package match those of GPL-3.0-only license, which seems to have been
the case since 2008 commit
http://git.savannah.gnu.org/gitweb/?p=3Ddejagnu.git;a=3Dcommitdiff;h=3D9beb=
e7b9bfb9b02e5e4d86ad74e8ce3eb32a36b9;hp=3D50fbdd118dba066e201c73a8b0155381c=
d65a32d
("* COPYING: Update to GPL version 3.")

(From OE-Core rev: 26b71cfb7815a096c5962629801cc3bc85147284)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb b/meta/recipes-=
devtools/dejagnu/dejagnu_1.6.3.bb
index 895f6d3b36..c6002d5e45 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "GNU unit testing framework, written in Expect =
and Tcl"
 DESCRIPTION =3D "DejaGnu is a framework for testing other programs. Its pu=
rpose \
 is to provide a single front end for all tests."
 HOMEPAGE =3D "https://www.gnu.org/software/dejagnu/"
-LICENSE =3D "GPL-2.0-only"
+LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
 SECTION =3D "devel"
=20
--=20
2.39.2


