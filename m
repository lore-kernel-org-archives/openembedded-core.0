Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A280CC001E0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 15:52:07 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.59])
 by mx.groups.io with SMTP id smtpd.web10.81799.1697903524830546583
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 08:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=cVF348va;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.247.59, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOCuPSFJQKkeWKk/ZEsifPtm8XhbsNCNg8/zQGQQv9uA5CNeoeO8Qx4X8/ZuIxnyrt88+SEnhgtnLmHcW69s++FTxd2dxTcFzbu/DTUPZq91jJ2R7vcvNXUeD4jT1/I2NiKQzWVDFMxeg3ZgGXszY7WMEp+UeKLl0r9E2icjzExX7Hv6R7WIznTqpOePLQhSryRJYETPKtpkNBXCbJqdWiPJf/Pnw85Q6WowYSYaci8ybR5NTnso/b3Yy9UJNn+tu6EoDM+TfbDtMu4pUZYMuhOHEtiNXLsft1czMqqyxDFyc+GWYKD+Eo1E0/RTA18QtMCLlsSxet+qz3yzrW7Myw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4rRdyxXUetJjpXW/YfchKrxYJmq/37lgSdBesvFC6U=;
 b=kHLWXsA9kJ4hk0NbOneoZZZJZ7vA3keL+2wqa8k8OhQagO9Cjqj8HXLo0yhJPqYtUyq/bzybFXIvg2uR0QxH6+NxdFTpiS0Jmc0K6MjHrMWuSbKnQeKRy1biHvOi4hBCeCKT8SQ2kubh+Gybe0fmdiCzRH3EbranCNLFHiAtPxpCQlKleWtrUOwaZx2IUyzvWkFDwmSR9ZJX7boYbA4+2iHGiY9L7E8yq98d2mm0somchzvOrmJVfZDzaPAgGAXUArVp7V6kL8FdNydFGvJluWegeenkXYBwJuZ/cAGzIUxan81XcC5l/e7xDF+Krp6AkbbgmE7xoBATnuR/poA5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4rRdyxXUetJjpXW/YfchKrxYJmq/37lgSdBesvFC6U=;
 b=cVF348va2/XHR5rxsdWmnGYvnqB8lRwbMW3fccX6bcqIbTmYlO1laV+xhoIk6UB43m0NxkJw5wQBgS6ePMG0b7wPRN+LdhrWJbbbIfLoZ3IwdXBBlYHbMm6RTbSrxjIf9mEL2tcNEjtFcYxOjAVHDMC7VGehkgTm+ODOi68KRI58V8nT59y8dOVf9Cb5HbzLnUX5hSgv+BC1UlGK4hxD6FvlG8uQ9k7HLwv7qDk9wMi6I6PnjiTUuHKIoUakE/UF5oRHHM63VGikTER5303nGTlds8jCQIf2mL8VY/8WMTcsAx4fridB84CQD/cUl2fuvhA5dWySX4Ay9hxnzcxxyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB6892.eurprd06.prod.outlook.com (2603:10a6:102:8a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Sat, 21 Oct
 2023 15:52:02 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9%4]) with mapi id 15.20.6907.025; Sat, 21 Oct 2023
 15:52:02 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCHv2 4/4] package_rpm.bbclass: Allow compression mode override
Date: Sat, 21 Oct 2023 15:51:14 +0000
Message-ID: <20231021155114.3979864-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231021155114.3979864-1-niko.mauno@vaisala.com>
References: <20231021155114.3979864-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF000013D2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::f) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec94cb2-fb88-460f-32ff-08dbd24dab05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ACAgrd/jCUtfMopiuHtJHaNyK4CcTs5GXaV2UMzo9ExTPRsYnEM4iM38pRNeSQUNVe3m7tugz6MdUinWXOaECQRxxGsBKzTKerKJ+f42Nkw07IS2XnPNqyi8eDo6/GWLSsgmCPH6imX6MG4l4qlGLtajuZkwaCSUzPk88ampUKjljbRNcJfatac1qjiKxRaxLYe1VMlPZOcpmBR+13ZS8rj9KP+qwDdqk2yUggbZGDcRRwkoIFvPAiw+FeyPamVClYC62tqi4EUJ/jCSBYx/fxxgir5Wvdis0pAZcpjAolRMvNeeaAOBrGHV9AfJOmPEWvAE7UcI83DhEH1fvsWgMEHJr/R/DGoGeiCUNpSn2yqTi7LxWyPFo9nRA+uavBYWwDW+pYFoKiQez1Djn9cQAiRHndo8p3lzcKb2kbujECmp7bxHrtlOF8fq3fmoYYKdCiqqb89Ymim8E87YmmTbjDpCAtdyl/1PaAuamh0edkY4xPYvgNwwNLOcAuFoa332GFt/WhpEX9435CeXJYgywY5WG+y6gTVQzvsa/7a/cAq8a5kVCDQ1P3mf6NlVD6B/EaUG4uREr/VuFYEM2oPhAsTsvpbv0klvNvdts8AYxcL26sIB5ltZuFxzxuVthFYS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39850400004)(346002)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(1076003)(107886003)(9686003)(6506007)(6666004)(6512007)(52116002)(26005)(2616005)(83380400001)(8936002)(41300700001)(5660300002)(8676002)(4326008)(2906002)(478600001)(6486002)(66946007)(6916009)(66556008)(316002)(66476007)(86362001)(38100700002)(36756003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QC6U6odyaPQoTyKKGSFYZYYGCPVynXEoci6xTkAChCIYZleB6cDS/0FJf83q?=
 =?us-ascii?Q?UH49P72tBSV6EHoQBdVq3pz04dlCXpovl8R10+tFewq3ke90f48hJLvqh417?=
 =?us-ascii?Q?JNM4MplZPvIAIyO0jc0mfDhnlikPVjQPB4Vl2ZhbK3kduOdeQSSlySIZ3ls+?=
 =?us-ascii?Q?ujrvQDPfN1EN59Z5vLkHFcy4t8elzdvHs8YRHbVk3EBS5kZluDna6MUSCoMk?=
 =?us-ascii?Q?MKIHQ5zy1wUhqFxYGkUQ3mzRELKOqkv1JiMJPeV7504UNorn4R1VAgvShlia?=
 =?us-ascii?Q?RLYSjoADbnusykQ9Cdor+iyUYtdqdz7s0ww8ovNHe7rM5RRh56hC72so4X1x?=
 =?us-ascii?Q?mgflJDRUKyc6BwbmvRkjDTS6OpXyQrVM4jWz/xrnhHItp/j0gR+dg3typcuX?=
 =?us-ascii?Q?nM4pm+6d3e9ztoNpZXyb2fsDB0D5pQjsr/KwmnQluHMxU2egkdfcK+hOcsbz?=
 =?us-ascii?Q?OgRytnCHpQ9B8j1LakdHBU7Lw2wYeMb3clGuOSV0IcnrTcPUvS6gdppTRxT8?=
 =?us-ascii?Q?qpOUgaZFiztQbgD2EGnD8ux7XJx10dLQUaUKJurhCwHVGKOHDOgGIcnu+JYf?=
 =?us-ascii?Q?mlMemOyFzphOuDMB50ynOeooWYFzKsp/G7gW7QIMwGXGfNkTMjkj6mereU8t?=
 =?us-ascii?Q?Ab4w8+grI/u3PXAeH03rDphSg/e1Aiu3SFGuMuI10H2+KEdMOG/6bUZ1Xiio?=
 =?us-ascii?Q?wGfGEjLRRh2VmgD6QhQlMKouzJKyl56rg9lQ4fiH5MBuOQe0TXTfqnQ7Z0+Y?=
 =?us-ascii?Q?yBfD8dbF/UQAh8HjZ6lM3X55O2DBmZj8awhujOm5Au8GCc/ARGkAu2lOiEDf?=
 =?us-ascii?Q?DrST8Ooq9qOUvQNXSCqthvZIltVp7NfoG+Wx9gnV9ivKrhJQXC6+8ub9xaz1?=
 =?us-ascii?Q?tR7gJpK7z7dppGitEPBgFJkc+Fm8pGHeWbC5GSGIDq+cUX3TfA2hSnQdhIaX?=
 =?us-ascii?Q?GdRTnDOf+bBntYjDLeZgOY23MePHEfV2ZpnxCQDNvrmIXJHg7zqmJ0HNARts?=
 =?us-ascii?Q?PYr/7S6lxU4E6sndb/hpRp4D3Gu3DuO4tzJGfmmJzwIK56FvJBxik4ev0WAZ?=
 =?us-ascii?Q?lXQXz8BzWWmz2tpv/t89t9ybfwYDaycCPC3EeHDqsf0N8IsRD4+06RYQKYJw?=
 =?us-ascii?Q?0QeYpLfic63nIltyNvLh3TIMpjke2MCGx6a6xki1HyYXI0O8LfIYBDQozyU6?=
 =?us-ascii?Q?FZOgiI38cVV3oa/8JEJRuZ/9XiT0pWvw/QJ7GKJk2TLVEf0BOzvZENxfkboF?=
 =?us-ascii?Q?tejPBfDfrB+DJJHJCSI3eSQzh6r0rICrYwuY/zqzbXyFo4kZ5G7mFCfc9ltD?=
 =?us-ascii?Q?N/jQRUDOxIew7CegO5CB1Htp8WvE/hm40lgfacWsz13myWOEvxbD9gj6juwD?=
 =?us-ascii?Q?s45tx8FJj1KBn8yeJF2CEjBE3OygZZ3sSM6DMIzYY72OrgepyTvj4DLbkNPa?=
 =?us-ascii?Q?X0quXX6b+JasQt92jneMnulI5JDQla4FjzehCNTTkdU+ElL5RdmyKDXSfJWo?=
 =?us-ascii?Q?azmDHQvZNEaUuoKyVXmdN8V0EpYwe6y77LPghwd3qkKGCnnzoGQa9lXaxsAj?=
 =?us-ascii?Q?tnWX0nZt7fgfNnj4zUF4btP3GEXj9nmTOaCMm4PZfj1Bw0Y7jOvR4oGY2a/L?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec94cb2-fb88-460f-32ff-08dbd24dab05
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2023 15:52:02.8073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuAq11A9LX9pV9TBHehbbsvaudTd0Rdy9HBIXwF2eXQA/gZnWQHftZNxheT5uFBQOCufUmPqiZhmAmO8q1mQIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6892
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 15:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189597

From: Niko Mauno <niko.mauno@vaisala.com>

Commit 4a4d5f78a6962dda5f63e9891825c80a8a87bf66 ("package_rpm: use zstd
instead of xz") changed the rpm package compressor from 'xz' to 'zstd'
which results in decompression failure with BusyBox-provided 'rpm2cpio'
applet and 'rpm' applet when given the '-i' (Install package) option:

  rpm2cpio: no gzip/bzip2/xz magic

Introduce a variable which makes it possible to use a different
compression mode, making it possible to override the default value for
example like

  RPMBUILD_COMPMODE =3D "${@'w6T%d.xzdio' % int(d.getVar('XZ_THREADS'))}"

to enable rpm decompression without including the full rpm package in
the resulting root filesystem.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-global/package_rpm.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/=
package_rpm.bbclass
index 246106ea4f..5d35962aff 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -10,6 +10,7 @@ IMAGE_PKGTYPE ?=3D "rpm"
=20
 RPM =3D "rpm"
 RPMBUILD =3D "rpmbuild"
+RPMBUILD_COMPMODE ?=3D "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))=
}"
=20
 PKGWRITEDIRRPM =3D "${WORKDIR}/deploy-rpms"
=20
@@ -659,6 +660,7 @@ python do_package_rpm () {
=20
     # Setup the rpmbuild arguments...
     rpmbuild =3D d.getVar('RPMBUILD')
+    rpmbuild_compmode =3D d.getVar('RPMBUILD_COMPMODE')
=20
     # Too many places in dnf stack assume that arch-independent packages a=
re "noarch".
     # Let's not fight against this.
@@ -682,8 +684,8 @@ python do_package_rpm () {
     cmd =3D cmd + " --define '_use_internal_dependency_generator 0'"
     cmd =3D cmd + " --define '_binaries_in_noarch_packages_terminate_build=
 0'"
     cmd =3D cmd + " --define '_build_id_links none'"
-    cmd =3D cmd + " --define '_binary_payload w19T%d.zstdio'" % int(d.getV=
ar("ZSTD_THREADS"))
-    cmd =3D cmd + " --define '_source_payload w19T%d.zstdio'" % int(d.getV=
ar("ZSTD_THREADS"))
+    cmd =3D cmd + " --define '_source_payload %s'" % rpmbuild_compmode
+    cmd =3D cmd + " --define '_binary_payload %s'" % rpmbuild_compmode
     cmd =3D cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
     cmd =3D cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd =3D cmd + " --define '_buildhost reproducible'"
--=20
2.39.2


