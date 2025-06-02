Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DDAC61CE8
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 19:25:57 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.143])
 by mx.groups.io with SMTP id smtpd.web10.4079.1748892354782854588
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 12:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=dr5z88Sb;
 spf=pass (domain: navimatix.de, ip: 52.101.69.143, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdY0+2E57aiqFp/Kw10Ui9lsIXhfy7q02eqbWtVZMPSHpRLsL46v3I7WBeKChDUiKXj6PfFvQ2BQ4oF7Z8lPivt6UPl/rGPjZr2HSJcujNUewHY5IRFa8VP1Ol81qHWuZ1+/+UihYcT5uLZfDNs81HFq2IccoB++w477LDR+DN/Uj91TDf8PNM4rVJabFx8z0nRbD9ibJLgXbaJteXeMmluBHlKdLA0MKdNfs2svzjqbulvehV0DTR76RxN+UvA2JAjPiJsc+V3fsklLGT7884iOzVDvelZAC3KBrXqRxQRdOcDDzW2R65mGQRzG9fQ7oup1+VwdaLObwa7RBq567g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMVwKCDt/CoZ3K0YU8yt2ay4e8NFiB6rinsGthlNZHE=;
 b=R5zmb4cSBcaP/2rHFe38pf7BKI4jmnS7Is2fGMXJJHFMlwpwZ0Ga2t0vLmTKMp83SCd7Tb8bsp9WPzRXfdriwCKDVP2R0UxBlZeaS/ivCiUgoDY1mlVlcF2DnyZIrArBAKemW3sP6vGcbe3G1xnb+dDiaf1P7WX/SZiz8d9slyxlWRq3KiYn8QUczAnJGD5XZZ7yWyA/P1E4UG3M8eGJW/XEtDn72pKqNwP1Xk7AXr3YI/3GtoNeqDGGTDPsbs9djHBknW0sXhxaN+Al0AxausNQsjSxtEj1XFwN2njl9/AclfR86Ls9u/vGMe92tdtLd9hQAu7SSRPnT+EdsPbY/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMVwKCDt/CoZ3K0YU8yt2ay4e8NFiB6rinsGthlNZHE=;
 b=dr5z88SbsMNoMeAVBKkMQzvzUQ/m++sM5bvj/4hsXLMo9oKopm0H1qAATYhERSyfcOO+Tz4Myzlxs6j9vhETjRQGx6TQAnFpiy1k+ucRBrmF4rZ3PRljNWaVLwZKLoiBfRwghcy7OMFpSq1ILGVBz+JCYO8CplkvUvYueDMhnWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DB9PR01MB10331.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:45b::6) by DB9PR01MB9510.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:362::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 19:25:46 +0000
Received: from DB9PR01MB10331.eurprd01.prod.exchangelabs.com
 ([fe80::ca5b:d13c:9d56:316c]) by
 DB9PR01MB10331.eurprd01.prod.exchangelabs.com ([fe80::ca5b:d13c:9d56:316c%4])
 with mapi id 15.20.8769.025; Mon, 2 Jun 2025 19:25:46 +0000
Date: Mon, 2 Jun 2025 21:25:32 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, martin.jansa@gmail.com, 
	richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Martin Jansa <martin.jansa@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [meta-oe][kirkstone][PATCH] kernel.bbclass: add original package
 name to RPROVIDES for -image and -base
Message-ID: <346682dae9a8becb1c5622d1961572588d23908d.1748892295.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::15) To DB9PR01MB10331.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:45b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR01MB10331:EE_|DB9PR01MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2d0705-65e2-46b5-df34-08dda20b4601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GFVxYtq9NpEEclcDloTh+F4bpjCoDuJeY01pxg1UsvanFasg0zwsKU9GYIeR?=
 =?us-ascii?Q?E5VPkm7Jy9GpwpAMmScA6Byrm+gWnrmShr/cBMtkqUJ20Q3c/5GkHTHNL1X5?=
 =?us-ascii?Q?lsyY2rwMCur6nuY47vHLXuvFZNDtR1vNP/JAhLjXUioLqXDu6No81kejeWJ8?=
 =?us-ascii?Q?e+PvJj2YuMBkVAOsUfZJSqQNV44Q8vpdbP2ZP02ZO7+OOg2STNV3zokvrrBB?=
 =?us-ascii?Q?5Sm3zUve0KHn2g+7sB3/cxqKeKdf2hY7xBwrb+UYb4AxhiiHFC2ulDG6YRut?=
 =?us-ascii?Q?q8lRCRQLhAAlo996V+luxd6mvV23qx+ywcwEU2HRLy+ZglA1ailhf8WFXcat?=
 =?us-ascii?Q?P+JtM2SX/EhpjPX0oTV/bae/Zs8Ab0BZK9FbRc5EAPUYN/Lq5ZpQMAucEiIl?=
 =?us-ascii?Q?vlKs6NYZeP8FfgcrGzEgNRAplFfBSl5y4+8deWqMnmgo/BLbfhiHEwzuRO5k?=
 =?us-ascii?Q?bsBMx34EEIfoLOZLDCyVnbwZfbFCUEoBEluOfXJn02+3JUyHZpaCCgfJZR/A?=
 =?us-ascii?Q?nx2+o+8RRLML1EVlxAQHdhuhJFvV+Tly1BYbN0DQPj/fF3z6nlV3MP9EkCCH?=
 =?us-ascii?Q?z15rzDrSfo48/0lg1Ish+zzaIjVY5Xk8HODrBo8who/S9QPbg8/gh5j5abgL?=
 =?us-ascii?Q?nUE6LHB3TX4BtfWa24KbKHnQYiGuV3s971Q9/E3tG9SW9ReUNwXE1n/CxNng?=
 =?us-ascii?Q?/6FBOWCWP+1V9Uh6N2uJduELpfHq9lqZW5naAWgj1lMS5tAcEk/oY4fs/4/7?=
 =?us-ascii?Q?i0tWPtNBDhiabUFU5Y1opSYJONhQADBguA4zDgFELT2dTALE1uY1xpPEyRRY?=
 =?us-ascii?Q?FD5py/xvWBtQpG+8HWXy5tkKSISbwwuq7oj4mG3nMeCBL6xe74SCn41AnnV+?=
 =?us-ascii?Q?5ywc9LNaz8eRMXTrTaUM2mWd0LBtC0FKFST5WdWFksrZxruuZa/SHe0uhVmw?=
 =?us-ascii?Q?SfjoBU1ymDMLJptVqTc8yM1U5Nt8ye4xfCPbuxhQ1thzCmMugoC5NY0nMBWB?=
 =?us-ascii?Q?zUPXt9iBDFkKFNC7yAqUauKFi+htlezBdLFLhjbfcKPQyo8G9W2tjBxXsw1y?=
 =?us-ascii?Q?cElTv+nUWq4l1NgtNGLTp4aJCrWaqMf2wwIrB6npEXNVZmrpPuTarzV1Mpcy?=
 =?us-ascii?Q?9G1WonXTK9CT5MiFbqpfFGGbfNdj2VEChwYOnhg0wD5KWtm6CFpznh4T+dKo?=
 =?us-ascii?Q?l4Iwor1Zx525Wcmj5UX+OJVDTySL/kYcPG2hoiq+ecclPLtT4FNV9nj/2lzS?=
 =?us-ascii?Q?V4gAI8my9/yYxbiAka/ey1TawwKr3otWrVHxPtysTCGSSWIJIlyscI/cOfbs?=
 =?us-ascii?Q?FBZjPFUn70yd7tbs6tgU0OYH6ECKXOm+1EUpfbw2IDNGFX0ed1MPs8zYZzL9?=
 =?us-ascii?Q?V9KHAvlLQZC2JgjRnoHsaiM+TFku?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR01MB10331.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yiXrRDhbxP/JVxFTEgXwtNNFU3P6kpGE6+/nD7/qVHGqf0fG1YFBtx+CXgIE?=
 =?us-ascii?Q?Vmk+4nUS7V4p87mCQutWwl79W3/pZP7hbk/K+fAdhGOv1tUx996ORR9BO7nW?=
 =?us-ascii?Q?AHQjkT6kFXWUshNqaP1OL7f/dcZbPMXA0P+XNWUSWvOGIW5N6spSz7z/kQfi?=
 =?us-ascii?Q?HQnV1prtGMJJaPaN6Wh9I6oZL2tUckaT5n+1ix/2vzpgPVMoZNxkU6hRGmAZ?=
 =?us-ascii?Q?jqRywB6vmcFe3v3ZrUNfUYniKQrHp4kailRsfcmbZe7Frb6W+eB/algGqkMH?=
 =?us-ascii?Q?/JVT+rJjP3qdFO+peCr88KsPQcR+AeASXQu7QiOVPMnVImFP/0YGiUx2TdFE?=
 =?us-ascii?Q?HMnK99K8k2HUfj4Zoecw6QssvLDKnN14Mru9nGWp264/BU+8Bx8RCHjRFXsC?=
 =?us-ascii?Q?HIxWrZrlnMzKUHEVUFjANh8B6EaCevFzyI0oGZ5l9rQcogSpr4Y3zbYqnzxZ?=
 =?us-ascii?Q?5paeIJpIU/7kMR4xBdDqREfV34rO96ds6m8CwPzfGJ+W4DbylP2IVbYaPr2H?=
 =?us-ascii?Q?Ujct7FjKuwlNkTA2za4ozNSKw+p47pP+lubWMCFtvkNwXjxrbc/M5sngBZg2?=
 =?us-ascii?Q?zAu/gPEsHPxbhonc3Tnn/Iw7gFmE9pvjzPb9Bkd4+u6+JwoSrV5Qi+9INVAh?=
 =?us-ascii?Q?b46S4Es78HQ3QCJHzFDFl2HjHuShijN0SiFUMeH+1BSuE7L9ZGoVY6uC1VJ/?=
 =?us-ascii?Q?tstBsMtacHf28i2gpFRd1yUtke3B86tYoQdv9q2/wMYFFUlJv3O475OHFFFF?=
 =?us-ascii?Q?WbBNuzdq4ALVU49FkWvX2u1y5Yx7/KUPExQQPtMGpX9MaUmfhCEYGvKFvuQt?=
 =?us-ascii?Q?azM9m2lPKlp+sH/HlFiceHJPT6Ao3JfWJLUkSYLeM5X9PIzvupEn9v9vqti3?=
 =?us-ascii?Q?IYMMnsXKzrOIl+Ad5MMcPtdITWd2WejeNJtxH2wjCJCien3LVEfXYIevhr+j?=
 =?us-ascii?Q?bIZlt8lLabpQxPBPGj6/zQIf07PSwVphShYmbY8p+SgwZ93DJkj+8kLB69Q+?=
 =?us-ascii?Q?lPlamHGXfUBV9lmjb2HxXlvuT4Kjw+IAO/FDT3y91+jJ7SCzs9jXSs2qy5H7?=
 =?us-ascii?Q?FlKzPHjCk9WZ3hTKK1xF0IKbfGAXNienh23/pl/dpX3q8/U93iWqSJ6HlXx8?=
 =?us-ascii?Q?nMGfOTmzFIaRRN7B1a10UQQffmedxRza9gJdq7EHIgiOj2ymbKWiIV7C76NC?=
 =?us-ascii?Q?E+Ag/jFEiFcbNlcxUWGfTb0GJtLh5CKOpMrltT74tf/RRxk/RJfRFRIZyg+B?=
 =?us-ascii?Q?DntR655BTjqn6/5YckUFkrsJJSiWrJJEhXQlmZm7EadNlsob4oPH/vqNM02Q?=
 =?us-ascii?Q?GaAwlNJ1DNeX2kooxgkJ08aEW0fFnCaMOnVfBWIwZMQlfFFBi3d1HGtp+Fow?=
 =?us-ascii?Q?ESEQ+rI2ghwxnTcQr2PFgynkqEr4Y6Xn9j0ogIS46mGvaeDg53cJRePVi5w+?=
 =?us-ascii?Q?AnbOdya8K6YH6YUOzy0yMC5cvT0K1NZQLWd/ctSNOuw3+R5jdbb/tfCphD0I?=
 =?us-ascii?Q?FSWHQyPBZxHWSFiHyV39tp3gX2dPkjaV14UrSPmTBdMDGm0GzNcD2z0Bh7zh?=
 =?us-ascii?Q?W4ka2n69K+vUnAWri3K5iy1ZLtN8wuGeVgdq6oQilFN0zwd2GalsObj2bjLX?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2d0705-65e2-46b5-df34-08dda20b4601
X-MS-Exchange-CrossTenant-AuthSource: DB9PR01MB10331.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 19:25:46.0950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1DP9oXVVoNpbdr9foPKM/4CL4I5ltufouNIdkCxoJtSdAXyfwxIz/rrs27cTCtVki8+DvvFGUGnJOY4wflN8zimndiVMTd38XBowKonwW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB9510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 19:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217728

From: Martin Jansa <martin.jansa@gmail.com>

* -image and -base change PKG to:
  PKG:${KERNEL_PACKAGE_NAME}-image =3D "${KERNEL_PACKAGE_NAME}-image-${@leg=
itimize_package_name(d.getVar(KERNEL_VERSION))}"
  PKG:${KERNEL_PACKAGE_NAME}-base =3D "${KERNEL_PACKAGE_NAME}-${@legitimize=
_package_name(d.getVar(KERNEL_VERSION))}"

* but only when debian.bbclass is inheritted they add the original package =
name into RPROVIDES by:
  https://git.openembedded.org/openembedded-core/commit/?id=3D3409c4379559a=
fbb1d1d29045582995147a33bbc

* fixes the build if some packagegroup or something RDEPENDS on kernel-imag=
e or kernel-base
  and the DISTRO doesn't inherit debian.bbclass

* as shown in pkgdata:
  linux-raspberrypi $ egrep "^(PKG:)|(RPRO)" 6.6.36+git-*/pkgdata/runtime/k=
ernel-image
  6.6.36+git-debian/pkgdata/runtime/kernel-image:RPROVIDES:kernel-image:  k=
ernel-image (=3D6.6.36+git@PRSERV_PV_AUTOINC@+733366844f_769634f344)
  6.6.36+git-debian/pkgdata/runtime/kernel-image:PKG:kernel-image: kernel-i=
mage-6.6.36-v8
  6.6.36+git-without-debian/pkgdata/runtime/kernel-image:PKG:kernel-image: =
kernel-image-6.6.36-v8

  linux-raspberrypi $ egrep "^(PKG:)|(RPRO)" 6.6.36+git-*/pkgdata/runtime/k=
ernel-image-image
  6.6.36+git-debian/pkgdata/runtime/kernel-image-image:RPROVIDES:kernel-ima=
ge-image:  kernel-image-image (=3D6.6.36+git@PRSERV_PV_AUTOINC@+733366844f_=
769634f344)
  6.6.36+git-debian/pkgdata/runtime/kernel-image-image:PKG:kernel-image-ima=
ge: kernel-image-image-6.6.36-v8
  6.6.36+git-without-debian/pkgdata/runtime/kernel-image-image:PKG:kernel-i=
mage-image: kernel-image-image-6.6.36-v8

(From OE-Core rev: 05498781657a3f8b38b000f91594ecd78850ce47)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9cb954884bc3905defa1ff533e668dea13e17cba)
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ba28bbc083..74b203b90a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -708,9 +708,10 @@ RDEPENDS:${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_=
NAME}-base (=3D ${EXTENDPKGV})
 # not wanted in images as standard
 RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-image=
 (=3D ${EXTENDPKGV})"
 PKG:${KERNEL_PACKAGE_NAME}-image =3D "${KERNEL_PACKAGE_NAME}-image-${@legi=
timize_package_name(d.getVar('KERNEL_VERSION'))}"
+RPROVIDES:${KERNEL_PACKAGE_NAME}-image +=3D "${KERNEL_PACKAGE_NAME}-image"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-image +=3D "${@oe.utils.conditional('KERNE=
L_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (=3D ${EXTENDPKGV}=
)', '', d)}"
 PKG:${KERNEL_PACKAGE_NAME}-base =3D "${KERNEL_PACKAGE_NAME}-${@legitimize_=
package_name(d.getVar('KERNEL_VERSION'))}"
-RPROVIDES:${KERNEL_PACKAGE_NAME}-base +=3D "${KERNEL_PACKAGE_NAME}-${KERNE=
L_VERSION}"
+RPROVIDES:${KERNEL_PACKAGE_NAME}-base +=3D "${KERNEL_PACKAGE_NAME}-${KERNE=
L_VERSION} ${KERNEL_PACKAGE_NAME}-base"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =3D "1"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base =3D "1"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image =3D "1"
--=20
2.48.1


