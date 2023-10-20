Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5824AC0032E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:45:58 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.40])
 by mx.groups.io with SMTP id smtpd.web10.53239.1697805955384323293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 05:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=NHn1WSeW;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.8.40, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIdWNSOKGxBFkLnvEc1UjAC4cgQg/EYz0MNPk3bVenDf6bXQ2NKkLRMTaekaMiEc/TvaBrRuipvMQfQ9sKxf1Yl15x+CUefhhwYaezvxeb06H0UACAxgtqai9QZAiCv6GX6hF3+NWR6AqtAJ0pn6V69g5TXTZdfUn6jOOzPs64ath/85hnWZsy6oPDmOIqR5TmCGGhtm0kjyPvLJp5bGJ+paCqQ3K78d0ZeGBkfxJS2fYV21oFOacQWSJU6WhdQIg3UFtRQBqScUKakNABCjiFd0F5rqJn4ZDSayFMWqEqLAjSE7hFG9XdOkRt2hqcqizfMs1bJ+QW8pp80Pk5LMgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HfaFG1HZbfu/xXcgVfe+Lj2DrxJoDIOB+IIqgOK968=;
 b=UIvyO6PKjmE8vvziEyxbjtidwHWwwHIbbDYppvGs0bkHb5DUohigFUvdtdnx7ic0HdgLsdZpN0i0Q4tsjoq3/p6WpOHuPjNpiEmPQVDTGJAS9MEoWyt7Z22LmUkzeKIVH4JG/UpEehfNGUTvCQwa2JQAXFQrkor+K3/o3ByCVKoCJvDQJYxfAqc2FHlhoktb+RT1+hqGIE9PogXs6L2fwJ+zHAaR2mAk96MyCiZC6jDcPtVFRwPRxfl7uD5dLDPjfOxQad33rv0tlftzIhlmJYfoUk3iC/8nce2su2zB5vrsknevYOT/KGf9CBJ427pqqjAFUgJ2w6jJN/b+b1HVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HfaFG1HZbfu/xXcgVfe+Lj2DrxJoDIOB+IIqgOK968=;
 b=NHn1WSeWTDq+ql8MogIJlQNgIi3kcvbxJChaE1/QVZcCPEzHo4qtfHzumsz1JMGf1N1YnDcso5qLNn2kCmx+MFw24uMYfjbnvMWuy/a+NWEnN1gI5wYZSAfqi1tocWYS4G7QjRlBbmRL1o0zT6l5725d9hQ1tDhsDAqkP6+aswjuU796kUVyOV78WTjPwh3d2CueKnVItoYJjqMhRRfQQGs0OtDg0Fq9TLHqsoEeMbGzNfr9dzJA6NOYQFL4rKeOid8JZpNQf5ZPPCBS1zTrsmfxClNR8e+lnlRFkwX22WjMy7mxqWda1d+/jUTDOP3ZOBewMGrw9vuKjTBGpTK4vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB7515.eurprd06.prod.outlook.com (2603:10a6:10:260::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Fri, 20 Oct
 2023 12:45:52 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::cf3a:acd1:fc53:af3c]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::cf3a:acd1:fc53:af3c%5]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 12:45:52 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 4/4] package_rpm.bbclass: Support compression override
Date: Fri, 20 Oct 2023 12:44:50 +0000
Message-ID: <20231020124450.9736-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020124450.9736-1-niko.mauno@vaisala.com>
References: <20231020124450.9736-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0033.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::27) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 779ea407-d61d-41ce-186e-08dbd16a7e73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0SLAEA8Gnmq48H6T0Yn6ytU3asR3nFrE0tJBQFLqf81SJiSUvGtcQijHoe+HnWGNJpHRwsi69ECbC6a42lRFHe7zbqjcedKEmwkJbhCwyu/fj9u30OqDWASO7RlPu50oPj58NFE0kBayoqW+254nHYxrMomJtzH86wlypeIDgGfFpqD99G56T4Tym6Tlb88DaE5XzIMHNuW28UZ8WtfQcNBIc+lDTmAlhdFaAj1fkJq2jP1JRzIj51t1B/9oifjiEw6RkvdIiWnOocSqiVOXLcxT8EzpoXck5nH1I/ej6JaZZsCkXfdGJahWm8bdNYWv8qh2uRQOzhZZrbGg/Ubb0tPZl99O5/qxhZTxJGONNFd3Y0l+s0VcBq5z43tmgv6GJ36Av5j9rWF7/3c8F84h2znE8qQeY+frqy34DV7jT8Bz7meGZvHEpWQe9s2CFfTkgbIM4fJJ7bYTFb+cREQNlZaKa9SrKag5+UhNxxw4imya3KORbQMvQKeDTIc8ZJQ1XKIkd4LIzNdmChljCsY8nknyGmEN6MKK3XMtgnW4q/Bq2HQ5fwNhA9cnNUEGa79a3j647G6GVeiCrcXXV0ScskttP6lwD+xWwTouteQzKHSHa+PgkVdPdWJt75TwDtQm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(136003)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(41300700001)(83380400001)(38100700002)(107886003)(9686003)(6512007)(2616005)(36756003)(1076003)(2906002)(5660300002)(6916009)(66476007)(86362001)(8936002)(66946007)(8676002)(4326008)(66556008)(316002)(478600001)(52116002)(6506007)(6486002)(26005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MgO1ThRvEOE1jph8/YhOHPwY8PiFmyHCIdiAqkHLXYujClnP7sjNV/9+ZRR5?=
 =?us-ascii?Q?NN9+bTwgzJP7I2m+N0C8r5jIoKo1Rv8xWScQQE+KrWNNqo4y0I++1gvP53ee?=
 =?us-ascii?Q?eb5bIJwI/ok5piKTA7gnYwGgNqIyFjCvkyMVTwwbW5kgiBr3XPFgRAEYn/4a?=
 =?us-ascii?Q?C6V5BtPgGwc0EFKS+WhXj/zN3d/gNf00rM3PDGbLFFljvIF0u5ceUEL8L+AE?=
 =?us-ascii?Q?jqYqeq1rXbAb08VwxuNihmZzGC7/fh7+T4A5MHSE3hFbRIvyvn/zTI03GwrC?=
 =?us-ascii?Q?IitbgpSVc2F2qZap356QrvHxYq0redw8/EtfhUz+vzjyrJb2g/C5W9/Fd/eH?=
 =?us-ascii?Q?4dX3rOapXEeO7F6t+OVetyimkUsKYoSy8r4h5tGWklO4g29p9eYn73TE2X93?=
 =?us-ascii?Q?2c5uxpJt1uqTnXu8mlbO6P3mr0bnFyJxMj2Gf/7w3hrBgpFNrh2cotKaZoY1?=
 =?us-ascii?Q?Mq7nmj0yzcx7LD12+iAnVamwIF3OWjHBWo8tCAVKFlGf+z+qB8F0GEZzusCj?=
 =?us-ascii?Q?EqI7yymcgXieYjybMqs+Q7PznF0H8q8SnpzJ/x5DGe8IpZkuou66kjIiUsEX?=
 =?us-ascii?Q?5lQ9uzfMfrcqWCtLdWC8KNB3mTkgHA97TD23DAkhguZYq47SzupCwgw2hJuA?=
 =?us-ascii?Q?8Jyg2qyA4cn4c4h49w8RwAMI9cQHtIhUNkfiYooubAPFZe5OWUMlwCZga3KR?=
 =?us-ascii?Q?5Sn24FFT/nxswsG6diplP1LrDd8O6g+dkj96kiJkYOkkfqi0wUtcXEwS4NEI?=
 =?us-ascii?Q?lNNvsvmuB3TuSwCWxNWwDmoyzCVZVUc6MeuyLUC3+mDfN/wz5TuDqqucLucZ?=
 =?us-ascii?Q?Bw1DO2+ULRKySYTdOgW5p3por3/DLW40I0EVhSk1AkB0yesQkkHv30NtuIng?=
 =?us-ascii?Q?mxUcRQMDi58fKSrS6ZyZEKwT+gaGm1Sxc6SlG0Uch9zF3/0xW3ASvEJxpWvn?=
 =?us-ascii?Q?PYMlZQsFui17kZmaP7W0ELykcpgxkrOO8tG12Si2xmIPNRbocYYmMh8dmVTd?=
 =?us-ascii?Q?a3LemzMuziAJfZ/riyOCdWzrCrwhP93kj6huDTzqxAevpRRKUAfc5kyt6qop?=
 =?us-ascii?Q?GkxB+CYq2BH1zs+RqRKJd7RP+FwKOvKOzXTjS9EuH2T4kgRzAPcwfn7aZ7G0?=
 =?us-ascii?Q?KKT4JhZnZ1jH+BeDNI9c3vDAkxAUtdDGpsd89mTMO3lXQGMTamkL/iWMMB7t?=
 =?us-ascii?Q?Lkm2NitUyeCNIXKXhi3i6QJty3IjdxN7xi7vaOCvY/qKWo6g29KeY3B5c7Da?=
 =?us-ascii?Q?U031oQTrtPj120VcG0eMEADVZfQjH1WlvRpuAOIDwi0tUDeJWbHjlNIFeCka?=
 =?us-ascii?Q?eymc+A+Ub4s7rA3G+jYhhZstRVlOJzQU355Z/e/9mPcO6UJLwvEtSoEEBWNe?=
 =?us-ascii?Q?NrgAX2zxAevSdIViMK8L6O7chjQMVdyePdJZRoR8HvaQ6Ydz5NKj9XqGw2jP?=
 =?us-ascii?Q?KJbUx5k8NVj5p0d3MORasbcPNvWp/8B/P9LgnLkUlfXpP7X4DWSDbYH1HWVG?=
 =?us-ascii?Q?xOwYBlp12y1OsuZv2J/f4WnVGLMEEfrrwebpHhGlEeh96tpOAKcrSayBqCrK?=
 =?us-ascii?Q?myi6nC1kTtFCcMYa8QMjaRcQYEZ7CIOrd1t9ORym7FwDgxW19VPgPyUiKKx5?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779ea407-d61d-41ce-186e-08dbd16a7e73
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 12:45:52.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1pZDklHjDGrDB1uTbmK7LvbjULPtqyLOD1pfuVkuRC7XePNfaYhExOXgvfWFkFGEFepxZwH9M5DrMjKWLrfuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7515
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 12:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189523

From: Niko Mauno <niko.mauno@vaisala.com>

Commit 4a4d5f78a6962dda5f63e9891825c80a8a87bf66 ("package_rpm: use zstd
instead of xz") changed the rpm package compressor from 'xz' to 'zstd'
which results in decompression failure with BusyBox-provided 'rpm2cpio'
applet and 'rpm' applet when given the '-i' (Install package) option:

  rpm2cpio: no gzip/bzip2/xz magic

In order to maintain compatibility with BusyBox introduce new variable
which can be overridden like:

  RPM_COMPRESSION =3D "xz"

to enable rpm decompression without including the full rpm package in
the resulting root filesystem.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-global/package_rpm.bbclass | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/=
package_rpm.bbclass
index 246106ea4f..da25b7682c 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -13,6 +13,9 @@ RPMBUILD =3D "rpmbuild"
=20
 PKGWRITEDIRRPM =3D "${WORKDIR}/deploy-rpms"
=20
+# Override variable to use alternative 'xz' or 'none' compression
+RPM_COMPRESSION ?=3D "zstd"
+
 # Maintaining the perfile dependencies has significant overhead when writi=
ng the
 # packages. When set, this value merges them for efficiency.
 MERGEPERFILEDEPS =3D "1"
@@ -659,6 +662,7 @@ python do_package_rpm () {
=20
     # Setup the rpmbuild arguments...
     rpmbuild =3D d.getVar('RPMBUILD')
+    rpmcomp =3D d.getVar('RPM_COMPRESSION')
=20
     # Too many places in dnf stack assume that arch-independent packages a=
re "noarch".
     # Let's not fight against this.
@@ -682,8 +686,16 @@ python do_package_rpm () {
     cmd =3D cmd + " --define '_use_internal_dependency_generator 0'"
     cmd =3D cmd + " --define '_binaries_in_noarch_packages_terminate_build=
 0'"
     cmd =3D cmd + " --define '_build_id_links none'"
-    cmd =3D cmd + " --define '_binary_payload w19T%d.zstdio'" % int(d.getV=
ar("ZSTD_THREADS"))
-    cmd =3D cmd + " --define '_source_payload w19T%d.zstdio'" % int(d.getV=
ar("ZSTD_THREADS"))
+    if rpmcomp =3D=3D "zstd":
+        cmd =3D cmd + " --define '_binary_payload w19T%d.zstdio'" % int(d.=
getVar("ZSTD_THREADS"))
+        cmd =3D cmd + " --define '_source_payload w19T%d.zstdio'" % int(d.=
getVar("ZSTD_THREADS"))
+    elif rpmcomp =3D=3D 'xz':
+        cmd =3D cmd + " --define '_binary_payload w6T%d.xzdio'" % int(d.ge=
tVar("XZ_THREADS"))
+        cmd =3D cmd + " --define '_source_payload w6T%d.xzdio'" % int(d.ge=
tVar("XZ_THREADS"))
+    elif rpmcomp =3D=3D 'none':
+        pass
+    else:
+        bb.fatal('unsupported rpm compression method: "%s"' % rpmcomp)
     cmd =3D cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
     cmd =3D cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd =3D cmd + " --define '_buildhost reproducible'"
--=20
2.39.2


