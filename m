Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A86C433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 10:33:57 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.92.68.40])
 by mx.groups.io with SMTP id smtpd.web12.4789.1639737236587700657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 02:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=hOBZ5GMu;
 spf=pass (domain: outlook.com, ip: 40.92.68.40,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAL5bnq2BzHB6ZO5JLwtg6pTMKrG/v6GEP2W3ZVchmBt4bnuKJXxtEQ58/3QTEnSDP2o/EkveVqIZz1Fu6dOBcPvhLIcMmrD3zp8oZR4BL8pyo1q4zyKlEgXRi+hMFXzKzFeXuD0V6wr9nSMzPQmEy5/59fzVcArILh+0C2a70r/QLahDToGyI26V5aievt+o13gCu4LutQRjL2CdTsB0K3cCuXEcMEo5NaV9/u8lwE85wzp5zfys0hhOT70U3ABryqp/T8/+yNKbFox4gWWFmbgNRWCQQLF9OYNWaCm5bcCKHUbU/vc+gCQ67aaJzRsevk/7J8dJZdJ339KGtrsOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKnOrqcg1Hqjae4VFQRLMY1YO6nN8DlF7NxNp9PAZZQ=;
 b=UcmCCmr8BICNaLcKqtX2wVT6nzAb5/+s7eKlu9ofWqCmmmK72/SwrhfV1ZetWyMEyBth6zptfn4A0OO0T+rl2FpyosCP7G9vN3lpkM+EHLVfcJ2tPQM+XoSEPpIXg4OMI1X4VJXn94n8WLHjlZTM0g2vmv27Ozln+X7S7TRHh7lOHOclieMLh93/tbF99jQUUzXcTlEwGdcSx8ZuUPMHl6+V2pCKXcCylQLh0wMUUnieER4mKlYLl7jRLIGiM2d3RHAqjX2LIG/UnFx0CCrthZfGWM2U+aiD3Mhy6YpHwGydyO1+yLs5tJZyG783tCaXxmVk1PAAkJkK0GiAc5WdGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKnOrqcg1Hqjae4VFQRLMY1YO6nN8DlF7NxNp9PAZZQ=;
 b=hOBZ5GMuTT1tKq9MqBx768Pd0Aw6g7D2tuYdFCaD2eOcxc445BQupIfE3PssbYB+E0dtEigGujt4rTOy5kZgfebD8kqF9ARkchvwe82+9mGqldslbcHxksVROZuNLkSB5t2CiyqgQLUVdCfZ032Re5hsJ8Np06D5HAPYIDkmmzm18A75vHSdcRkEMMWW09ZfoSA5ZshjJ5CEigGnLfarIy1zw1TGapiaQ6sNS8Vrl2A7B2boxIde8nO02/goSS888f+Uf48CwDPzmS9+dTCluopdZ0rZULjKYedzhrxMeb030nUAPfumIOpfJhkVs6QWHdb6NzkOwaKLXcoGY9CPbg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4163.eurprd09.prod.outlook.com (2603:10a6:208:196::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 10:33:54 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:33:54 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 00/32] Add Inappropriate reasoining
Date: Fri, 17 Dec 2021 11:33:34 +0100
Message-ID: 
 <AM9PR09MB4642EA7B0E4EB08DE02FCE3AA8789@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [hQb3A1LT6JDeiLj9V/SLVsw/yr9BjRpdHkBtuNoxkoqRvofc9QsnMSEatqHvtnZl]
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: <cover.1639737091.git.kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e46284ee-16e0-45d2-1767-08d9c148b8e5
X-MS-Exchange-SLBlob-MailProps: 
	3UeWkQkuiJMapIaE3yskuNrNSV986tZKNrLJtfZuGOVLhEpJY2PV67X/Jp7uwkwDOyvu1WghFR/h7VEe1UlhbQsUZRCQ2IRV0/x598LyY6u6JkVONpuFrcfIw2AcsLPFjB7e0rI77P/9YyuNqGRO6yVsz+OmkDjwxelsy1X4l4aLR3eqfDLu1CBKlNad5nUgVD2IXAldm2LZHxTWCV/28C+iQ+sZPpgm+Ep3UTbpEUtOCrxRsWhoD2hyJ4cbrIRPbRlPlwJBgRAilejCQ4Y75pPGASkJ8ZQ+NNuwcOGvq79xqV9lRwM63ia4fT4Ro7I9XsSVqVvWZ10tsiib8plVPIU7lzcPHh5Qlhh3hh9U9LP06Bqpyikf89EA1a0tfe477oCwpbhoNXh+GuPa6rz0qY3YPtuumU7VjbWY3Lt2cu53ur3ivdAn6Th2UX6aMRmQ4qjMg9NGoBm8enxgmViRi/x0xe7sXVGCjDAW2yD3BB8cndCKNHmhad3UZO+Y5pa5rJQr6SoHhtPOZFuQ3CXVgjd3kF8ShFdkNWCBWC119DjOJTIt9lvPoOSXLvmcLW3nRV9AMyyrey7BV80cb2nLFl4GPmcOSe9drsRZxD2JvtMhn5lzS+ETs5mSNPaBO4xAnySZG50Zb+r+TNq18ZoPOdCtFCVH8JV/llelsWNtIojLm57/mpRBxGv5i7XfvIguo7Fo6Dbj3ozbCNoHper1FEs0A4VT18+WIsFKTMriQIwGBNHY3+zuiw==
X-MS-TrafficTypeDiagnostic: AM0PR09MB4163:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NNmTbEJwMwwh/mk9K2P21quTjGl9ei/uZAGz1duOr3CPWUZe9fR30ebOlwNd4/AN02+CnnW90nq7Rnc1SC2FwkPoL9gT+bEpwv4kfPYm53ithw1KF7wUbVRVXyXlx/5mE6zAhOfPWwp/fU0q8Mh1e0KSQpmt6RloH6A4F56kjrnR5jfX8arGcIVBlkxzcRCgv/1JtjYKU/LCUdcCl0nWaCCH/AvaOcMKy0eDdwqF2ejNCQKzDHmoPL3XFGW4vWqhIz0yRb100OAFsZEvLOdMltMBdd3tQFywpmDPfk8eM2APPbQC4jXMUNlEWGRw2zJq/46GBnq3/QNW1uG8g3L0X4CdcAtSSDYOF+C7ii8E19xA6qzfMBW7SxJbLYjYerDb3o6JmGF+Lf0+yJvBQAVZ89RdHuWKbuTn1xSxhj2NUMf2PQ1QKiKQvLoffDnsB2fcFmh06cy6jqfiRG9UTBItuKUOI3xbZx5n9K5U4QOLWy3lJlcGZV+RMDTp5NAPGcxaAHtp0jxMa9vRF24KLYuulz82v90KcmFMDDqjPjDGIjONL7n1UB6dGCnYpdgVY7Xx9cXBV7XrQ1Da2DrXa5yrQlM+hZFmRis+YJPkcwtcGtd3AdxbcQhCzzuz1HFaevQg
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a5o6EnqhWuZZazZGZeJtPSwGEoRNMZAy8jrNm5Ea2jVdQSOB84EKmMCCb1Qu?=
 =?us-ascii?Q?v8C08AviXBSl+lK2mcETw75rHn9LTrNpF3+MuvTt9J6a9SAZNYGzY5W2k89B?=
 =?us-ascii?Q?LqMPtRB7W6Yv1VXAm7+jBWJ1wKLOWP5S/Pdnst+jeSUYWa0zILk81zfdWwnK?=
 =?us-ascii?Q?mt+wlIx26UAGqUYU+NyB8zFt8KIH7L711xL5injwOO+hWNiEm4kOGMR7dh6Z?=
 =?us-ascii?Q?IJoD1GSTwzL31GelY4akiDKt2Jgkqjs+I48m8xv9ybax+NbalIMfRUWcdoNi?=
 =?us-ascii?Q?tVlubokAxZqvtTDgoHU/Toalu+obsUq0bsE2NUUSo/EqUbHAQQaGua4kFj7d?=
 =?us-ascii?Q?ScohefYCKkpRDGfFQrkMCJrbh2Ortkw9+kBwYYQqNejVTjpT5IbptEstF0Ox?=
 =?us-ascii?Q?3kzih6FrefwJM3vAsY1PBNeMHrh4/pMgGmUaz5CMDL+66gcWUIPCT1h2mtQU?=
 =?us-ascii?Q?1/ci84+lQL1VPE/AsPHzMmDvScMKqEBnCO7mtpR4IPjmnVKSSLNLFbiDdiJm?=
 =?us-ascii?Q?PiTsvifPG0g99wTaKWUsKR3vvwMlAERSuArgNa9liKN8XrRG+qXZ4rcYB5wj?=
 =?us-ascii?Q?NYQwDWl+wulUAkrb7Udu1rW3B0ZSLQFQ34jR6oKunWhmWvVMggOzsys7kTBl?=
 =?us-ascii?Q?4rLbBhXQReS0oMX9i5B/2Yi4LFfZI0CgIcGZR02tl9yjvt/NKdcX2AdG5fcL?=
 =?us-ascii?Q?16YAnXgQwo7JI0V5imsr8bi81ngPuvKn+pV+8hIJXaAmCQJclqMdZn972uBF?=
 =?us-ascii?Q?vmAsBY+9E8p2xPe6vgvRwYU632WnAYkAW+APMQcVCke17cTT4UOy528NW58e?=
 =?us-ascii?Q?4FuhVkAAb3KHi7wVY2fsRet/rp9qMCwz6c5//4lPaPdziVxBw90g/y+rnycL?=
 =?us-ascii?Q?CNHyJRio737X3O1LSb4nfDrZFlLPG7b/XDmn3vuJAU0acjSS0eDUDLA5hI2+?=
 =?us-ascii?Q?fpJmMpb18DmMCXl2FJpEtsIXEroQjdseeUCvoAZdfdMfVrupYWv9aF2NroOF?=
 =?us-ascii?Q?M8MoV6LRG4e3S31GMk40yEryHg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e46284ee-16e0-45d2-1767-08d9c148b8e5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 10:33:53.9234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4163
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 10:33:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159820

Add reasoning to Inappropriate to all patches that are missing=20
missing that entirely

To all maintainers please double check my proposals

The following changes since commit 31bc9cab25692fd0b07dbd994afd93802e93d6bf=
:

  bitbake: fetch: npm: Use temporary file for empty user config (2021-12-14=
 22:47:04 +0000)

are available in the Git repository at:

  git://github.com/priv-kweihmann/poky inapp-add-min
  https://github.com/priv-kweihmann/poky/tree/inapp-add-min

Konrad Weihmann (32):
  connman: fix patch Inappropriate
  glib: fix patch Inappropriate
  ldconfig: fix patch Inappropriate
  readline: fix patch Inappropriate
  util-linux: fix patch Inappropriate
  autoconf: fix patch Inappropriate
  automake: fix patch Inappropriate
  binutils: fix patch Inappropriate
  e2fsprogs: fix patch Inappropriate
  flex: fix patch Inappropriate
  gcc: fix patch Inappropriate
  gdb: fix patch Inappropriate
  libtool: fix patch Inappropriate
  rsync: fix patch Inappropriate
  strace: fix patch Inappropriate
  tcf-agent: fix patch Inappropriate
  valgrind: fix patch Inappropriate
  xmlto: fix patch Inappropriate
  bc: fix patch Inappropriate
  ethtool: fix patch Inappropriate
  gawk: fix patch Inappropriate
  textinfo: fix patch Inappropriate
  gobject-intro: fix patch Inappropriate
  gtk-doc: fix patch Inappropriate
  libxcb: fix patch Inappropriate
  pcmanfm: fix patch Inappropriate
  boost: fix patch Inappropriate
  ca-certifactes: fix patch Inappropriate
  gmp: fix patch Inappropriate
  libtasn1: fix patch Inappropriate
  libffi: fix patch Inappropriate
  serf: fix patch Inappropriate

 .../connman/connman/no-version-scripts.patch                    | 2 +-
 ...1-Remove-the-warning-about-deprecated-paths-in-schemas.patch | 2 +-
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch      | 2 +-
 .../glibc/ldconfig-native-2.12.1/no-aux-cache.patch             | 2 +-
 meta/recipes-core/readline/readline-8.1/norpath.patch           | 2 +-
 .../util-linux/util-linux/avoid_parallel_tests.patch            | 2 +-
 meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch     | 2 +-
 meta/recipes-devtools/autoconf/autoconf/no-man.patch            | 2 +-
 meta/recipes-devtools/automake/automake/performance.patch       | 2 +-
 ...2-binutils-cross-Do-not-generate-linker-script-directo.patch | 2 +-
 .../binutils/binutils/0015-sync-with-OE-libtool-changes.patch   | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch           | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch   | 2 +-
 meta/recipes-devtools/flex/flex/disable-tests.patch             | 2 +-
 .../gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch | 2 +-
 meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch | 2 +-
 .../libtool/libtool/dont-depend-on-help2man.patch               | 2 +-
 meta/recipes-devtools/libtool/libtool/multilib.patch            | 2 +-
 meta/recipes-devtools/libtool/libtool/nohardcodepaths.patch     | 2 +-
 meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch     | 2 +-
 meta/recipes-devtools/strace/strace/Makefile-ptest.patch        | 2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch         | 2 +-
 .../valgrind-make-ld-XXX.so-strlen-intercept-optional.patch     | 2 +-
 .../configure.in-drop-the-test-of-xmllint-and-xsltproc.patch    | 2 +-
 meta/recipes-extended/bc/bc/no-gen-libmath.patch                | 2 +-
 .../recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch | 2 +-
 meta/recipes-extended/gawk/gawk/test-time.patch                 | 2 +-
 .../texinfo/texinfo/dont-depend-on-help2man.patch               | 2 +-
 ...01-Relocate-the-repository-directory-for-native-builds.patch | 2 +-
 meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch        | 2 +-
 meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch       | 2 +-
 meta/recipes-sato/pcmanfm/files/no-desktop.patch                | 2 +-
 ...1-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch | 2 +-
 ...1-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch | 2 +-
 ...1-Append-the-user-provided-flags-to-the-auto-detected-.patch | 2 +-
 .../gnutls/libtasn1/dont-depend-on-help2man.patch               | 2 +-
 meta/recipes-support/libffi/libffi/not-win32.patch              | 2 +-
 meta/recipes-support/serf/serf/env.patch                        | 2 +-
 meta/recipes-support/serf/serf/norpath.patch                    | 2 +-
 39 files changed, 39 insertions(+), 39 deletions(-)

--=20
2.25.1


