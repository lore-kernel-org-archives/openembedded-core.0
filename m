Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54ED4C61D97
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 09:34:40 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web11.13425.1674984869678458479
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jan 2023 01:34:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=XQG8HvbO;
 spf=pass (domain: vaisala.com, ip: 40.107.21.48, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuExrRCQ5rM40lZE7oFSKSDs1nIcF4V6ENwX9+hHIzNZdnVmbyYEKOE79z82NEWNwcCxqsf1xynY6vYxK0zneSaHzZ1ItEYf52Z13MxdSFJv4LE7lP6O1bTKaLXS2V6a0s5Z3B1MC94XTtcm5YsnLqLNAinKDJ4PiIieyqfQxOST2O1echGAegNb+QfeSXL4fjV8Y73d23aFxvAuuieahYW9GbSgUyCmAulfbgb58Qbk9xP0IPnHVLckucGRyB2EFv6WGQI1wqeZoMLTtqAyADdA+msVMr060jQyrBeu9/5fad+Z/bQdgMIZdt0Xt8V9sURw4kApLilTIzZC5Qf+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kLRRMi5wtDKhyREz29kWfIOzdttp9eafA6G0KLp8dk=;
 b=kQdR6EaqispWQVky7s5CIr+B5Co54Se0YenIZoK7GJyfRvmNYj/AdHhQMDB8+8PEKK/Q53TcTi9VwZeKVs25xAHVMEMwU0N13pCBEGWXnFXN9NOft4ED9S8FSTtpxtShTyTLzBgo2OyE7EuT0BqXdKFMnjQBv+baNJpcsJhDGc+RFvyfIBd4c2MZpUMyvzt1SN+qqVyyreb7vA+Piwda2/jTVsJivPDf9hAp/H9KMAql7sjcsL6BY7ZsKCpVXFI1wCu7kVjsXPmHRXkk+wGPmi493tZ+2LfIRGEBXd1nKhZOkrrCGG7NaOdhbWyfLO3BhnA61UmPOBVx0dXT9xik7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kLRRMi5wtDKhyREz29kWfIOzdttp9eafA6G0KLp8dk=;
 b=XQG8HvbO1RTb/t50WtFARFe9b06ZdJIPPneOCHGgqX7GICnu2TLd8hy+M15ZjEle+fW/FsBvWDqDgVNEAVSGDnIkbsDfqB1qOo9XVz0Ln6DgF+WR0WPjBcWHz3RXzAb0zWom5d1zAeWRbHcWxWiQCu+hyDImPBTmIdEtkQkSXwWEWZYopoPZyOXRjdyB/biLSOIfnmzv9X2iz7prGgL6dxc0ZPgVoxXEsCfnl6fAnnJUxh52VQ4fQdifBmbKn58aT+huKD+LICTuSzluMm/f4JYEY2xlyVx/Y7uwh4gYdWdZYfDWBSWW9Nkg61oCyZZbDQaxWHXFNps+8dGpBuSrIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by VE1PR06MB6240.eurprd06.prod.outlook.com (2603:10a6:803:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Sun, 29 Jan
 2023 09:34:25 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049%4]) with mapi id 15.20.6043.028; Sun, 29 Jan 2023
 09:34:25 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] Fix missing leading whitespace with ':append'
Date: Sun, 29 Jan 2023 09:32:59 +0000
Message-ID: <20230129093259.167743-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|VE1PR06MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: 6785e0ec-b910-42d1-03e9-08db01dc02c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3V8RhR7uH7xtTaf2+0tyEJpa339sGwK+lPFH99FZX9AusZbg8QrkbLHrbW66YLAU4bBxnmYEpqPzo7MJkCNbN4BOQWD7QHgZlcKwy/9Z/ZCqgvuHjSwCboJ+MxqyKc0AZmm+n1ajFhsVDA3id67SewAMvLQrbXRIJ7efUEExQ9mMuO/5eC6XVmBxw24OaTZkTh+CwYn7DEnnTXklTnfyjnVMMAUSQEg04wIOzYSfQRgat0jK8DPmVstctHrlWXgXCLk7d2NVc3htn6pcQbRZXEj2RQJMG8dHtU5UKVhfnoEg5UujOrt5aK1sFGRQBBDZd/TGUQI9iCTEX4boM+c47CGA5kVEMJTXwqVTEnFk0R9DJ18sxdEH6m7LypFTWs0TaRvxx9DYIrXWo/1huo4ymtT90kXAhxv3BROXNcV+DO2pMmm0DclyFYdOufS6qSajKLIb/484/M+fmVysgbvadSWF1FxGFpRw9TxiP+xvmqci0W9EQdpt2cQzUEW5RuCj76Ms4Np0wmVhCWQrnuLWm3YclXFEPhTZv5dwnXNHB+HzKPU0FUwho8buq4dR3BS+FAdSJkuZxp/C7RpH4UMumh3eEsi8i44OvPjafkJKhTLzjPnBLzWhGeWvpUOXz3DToGKcpSTJ6gUKTisxMJeQjPDzNaDDf+yGnsUunyp+zc4sXUnzf5VAvW/n3qmSMuALuCf0PlsbhIFxG9RBd3ONeQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(366004)(346002)(376002)(39840400004)(451199018)(5660300002)(44832011)(36756003)(86362001)(38100700002)(38350700002)(2906002)(2616005)(52116002)(6486002)(6512007)(478600001)(186003)(6506007)(26005)(1076003)(83380400001)(54906003)(66476007)(66556008)(8676002)(66946007)(6666004)(6916009)(316002)(41300700001)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?477L2VRAXGYndS0qQ3XrTg5bGT3F/jwhxKjZZfUUm31ipjK6xBfIWEoAwMza?=
 =?us-ascii?Q?yy99ViOpLXuA/qdllN3YCafCJ9Ob2RnTFPsLaWsStOhgzbNDC05sVlFxeI7x?=
 =?us-ascii?Q?Zo6g1HgZI44wODDNAvukmLg0YT1CyXIrBTSu9S0hVTyL4SGBazWYv4n/Ld5/?=
 =?us-ascii?Q?F3qly2dPvSjp8tt3EbkriTErtFwi0Gzlev9pwTNrtRFIGOK7RHogLOuifySn?=
 =?us-ascii?Q?l8nl/ay9HACBrAMCILOv2c/lmmpRCWbCNE2LRw2U4/jQS76nuqERwji8juR6?=
 =?us-ascii?Q?XWPrDTBEPPRffPtcgy9y1afz0H+Q3A/GFCyFSAo3E/0Ls1iXxi5mnaxsNkO+?=
 =?us-ascii?Q?i6w5bf9+SCPcill4rUygL42EjiUWQHMiqIHLqnYT45Lp4yHZZhoCWOpGwjtf?=
 =?us-ascii?Q?GKj5KJ80qRb6uXJA9vJhDQHOoqS669tnYrSAnRpY7mOS0P4ZbffYmvOYge7Z?=
 =?us-ascii?Q?CUsOXTWyXFplHb4aap3S9N1FVgPnoDMwJ6oCZweOSJqjdAakJhdj1CZTPv/Q?=
 =?us-ascii?Q?M9hWKS/ozqDv5rCB39/erYkYuieRB+ooT+NsZw70X8zanqSzLOo+gP6Cb7qs?=
 =?us-ascii?Q?pDT2r6fNu93/gPq2OvZ3hQtT92jalf+pVh8L2/UoTomaGS7eJ5DBlD0eS4x4?=
 =?us-ascii?Q?QeO75T7SifnqfbLmIJtXOjzgThl070iJM+IOi9nbyZc9MwomT9ww3mQdjcVR?=
 =?us-ascii?Q?vNBeD+4Q5lDViW8PCeHgtknuuVVauTica7zo1UyNxBbCuUnRZqbU5Lfv6434?=
 =?us-ascii?Q?z9tMkEvMSf2TRdfobH2463Aj5n+dEff5gphlL1+DmQyGTctzn/knZOUzykhI?=
 =?us-ascii?Q?yhSS7nPeJyFkJaz2yDDMCsDFUNgLe3NKjJmp+X3xmIJvnx40B/rBiCQT/lEP?=
 =?us-ascii?Q?vRd7Xsxc9yXM4d7OdF+37IThtHfLmhi3e7Oz7Y1Ku4p+b+475XN5hWgjUc4x?=
 =?us-ascii?Q?sp4w90n2aw58IGc7euIsxbe0l2VQyVTGMbH/Z7XI0Z3EPFugaIsjGqp40jcm?=
 =?us-ascii?Q?lEzoHU2/ZrXJICNmyFK8ir9rGvFivliB2CkXzOvf2Q7yfDF6Ns6qCc3I68Pj?=
 =?us-ascii?Q?mEdZ66R1wKeMJPYtkT/XqJ5GfbakWHpKGrPiJWcl22nF8Y+vpTmi/NDXgJ+/?=
 =?us-ascii?Q?Jq5PukwuyyUJBj+1d3TBIii38apx+YMLgP+7TW36OxOV9po1j6Wo3ryP0+JT?=
 =?us-ascii?Q?BZycjEfdm+gTaJPWG/aD028azxt5DWACLukoeiFtF7BQeJgjpSSUVMM3lVXx?=
 =?us-ascii?Q?9clq+BKubw5VPJfEh4T5DpHMDJPQiRT8OihMhG2qr0ahaKQJ61+32v2Wgylu?=
 =?us-ascii?Q?0HuH2CI+jMrk6DfuZgS0REIVy5hifnv6uIlJXD+0jMhTAOpGgYaj7L4S71NW?=
 =?us-ascii?Q?+k/ebW9DVOxp/Q09ZSQFa+7yDap0mLyH3uhuXbDaT5q0QSva/CC1IW7bXovp?=
 =?us-ascii?Q?HQcnewn87TxGT5LsqTETOYrGE69FwrFIUBmRlwiJiC8A2uu3E+37q7Lwen9h?=
 =?us-ascii?Q?8wlek/Pdnc+E7JsW9qQtKnz5W54103aFYWnVYoXXZam7+wQhbG+QEnwygMT9?=
 =?us-ascii?Q?GORypE2GjUZ3EQKtXcdN8gbSO4/a6YJ6t5B5c6FV0ADAfIUNfEIjnVptZz8o?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6785e0ec-b910-42d1-03e9-08db01dc02c5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 09:34:25.5830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcFrlOxjAkldWRVi814GFHTvujnx5dN3P9uoJAqm8/6cRomrzDz+YCss1SyehY8Vp6Y/JvCjkum1GU8tTye0cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6240
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 09:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176470

Mitigate occurences where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

(From OE-Core rev: fcd340ec53ff8352b8cae0eb351810072b025a08)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/core-image.bbclass                 | 2 +-
 meta/classes/populate_sdk_ext.bbclass           | 2 +-
 meta/conf/distro/include/ptest-packagelists.inc | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbcl=
ass
index 740a6c1d3d..803727da0e 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -62,7 +62,7 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh =3D "ssh-serve=
r-dropbear"
 # Do not install openssh complementary packages if either packagegroup-cor=
e-ssh-dropbear or dropbear
 # is installed # to avoid openssh-dropbear conflict
 # see [Yocto #14858] for more information
-PACKAGE_EXCLUDE_COMPLEMENTARY:append =3D "${@bb.utils.contains_any('PACKAG=
E_INSTALL', 'packagegroup-core-ssh-dropbear dropbear', 'openssh', '' , d)}"
+PACKAGE_EXCLUDE_COMPLEMENTARY:append =3D "${@bb.utils.contains_any('PACKAG=
E_INSTALL', 'packagegroup-core-ssh-dropbear dropbear', ' openssh', '' , d)}=
"
=20
 # IMAGE_FEATURES_CONFLICTS_foo =3D 'bar1 bar2'
 # An error exception would be raised if both image features foo and bar1(o=
r bar2) are included
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_=
sdk_ext.bbclass
index e2019f9bbf..0fd30478dc 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -114,7 +114,7 @@ python write_host_sdk_ext_manifest () {
                 f.write("%s %s %s\n" % (info[1], info[2], info[3]))
 }
=20
-SDK_POSTPROCESS_COMMAND:append:task-populate-sdk-ext =3D "write_target_sdk=
_ext_manifest; write_host_sdk_ext_manifest; "   =20
+SDK_POSTPROCESS_COMMAND:append:task-populate-sdk-ext =3D " write_target_sd=
k_ext_manifest; write_host_sdk_ext_manifest; "   =20
=20
 SDK_TITLE:task-populate-sdk-ext =3D "${@d.getVar('DISTRO_NAME') or d.getVa=
r('DISTRO')} Extensible SDK"
=20
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index b51cce4d9e..a65c048984 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -99,7 +99,7 @@ PTESTS_SLOW =3D "\
 "
=20
 PTESTS_SLOW:remove:riscv64 =3D "valgrind-ptest"
-PTESTS_PROBLEMS:append:riscv64 =3D "valgrind-ptest"
+PTESTS_PROBLEMS:append:riscv64 =3D " valgrind-ptest"
=20
 #    ruby-ptest \ # Timeout
 #    lz4-ptest \ # Needs a rewrite
--=20
2.35.1


