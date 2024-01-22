Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664F7C47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 15:50:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.77559.1705938616801641499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 07:50:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=j75Qxnyi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1751b0870e=william.lyu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M4l3c0023935
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 07:50:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=T3QrJ27Sz9b9lYiWfB
	vltIEyIgmnibEl6RZf7VsWbeE=; b=j75Qxnyi+xH3jJI6DJfj+BtogZ9da2jOE5
	q90hnX9KuJ3Cul+D0SCNwwsaTtMEQjhCzl8sr8YJC3TxhuOZrs/gXuHMpIfIKTUl
	aQpgeNgnFKef3nTT1RAD0uo2S7zppxb3osOBbAM+rln/4GgnuXnlMlpdkKr1ggnw
	Yle4V2BIyQxjzDXO63locaP9msm5NDSlNct2tnWVZVqcBxppZe/ZeRvl0HTAR1Hn
	Ftg211V7VdqADSxXh7ZFvE8MDNEdBktNWhv4mTfDVOjG9YFTAwvRRTHIOOWsKyUi
	zq8GmkxpEj8O9l5FNo7J3rmpy+nZHt8c4TFe5IlHpshX1J0wh9wg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrejksqxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 07:50:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcfdglJIo4H/5iswYOD8rhL+74ooX8B/Fx8pT+PFp0WOHLSVgufY2hANlBaai06oYVDlBJCm0KtAfBq7Expc9DhOrMN8fnLJ5fybUqUcd5jkOyzJtRxjNAuOBd7md5Y/FyH25dzCb3x5NzAN2snuIhghit/OCBdYIlSgNBk129PKbEVa0lNdIpFad05/wu1Ft/IcgGHQJ4cQJBv50KfakjLdJ4uODwe1Wnm5bowlQozufsbXHGnsbSuqJo+JCzWe0zD15UJX5T6IGwYu2JSowdsVRHMELptmnOHO5WHG6adQrcbmq16apwgjZj4ioHICoUXum7V+ZpKpJcKWEdR+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3QrJ27Sz9b9lYiWfBvltIEyIgmnibEl6RZf7VsWbeE=;
 b=G2S78/xiK2cUo1FWb5l2KTf9/YOVluEJaIPkGjH4CYOCnG7oTE13nSEdSvrvZyp7bpYopkDe/rupOXfzzM97MSnEDiWNNgelKItsKzzPQU2c5Uit8THEbj+ntc3orR6F/zORPGKzhUeZnbtqcpJuNhpw1MhgPo03iBJjsBq4Gs1/HCzAippa2ZEuRaMnZANvw/IuYaF/jTu5eTCkn+ICttP2CIF7zF3u6M6pGH09hhX6UL1OFx+W0r0rTn81IbaZH70H/9IDvcQlv7HZApPNeQiAoFcMi0rPS16QkNk6AYbil4kbYj50kLgLVMY4rbmMmmYxXKu+clygFZQJ4mKWOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 by DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Mon, 22 Jan
 2024 15:50:10 +0000
Received: from CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::ffe3:8cda:9fea:f8b3]) by CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::ffe3:8cda:9fea:f8b3%2]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 15:50:09 +0000
From: William.Lyu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl: Fix perl-module-* being ignored via COMPLEMENTARY_GLOB
Date: Mon, 22 Jan 2024 07:49:18 -0800
Message-ID: <20240122154919.42591-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6342:EE_|DS0PR11MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 394ab878-863e-4df4-0702-08dc1b61cfa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N8ZsLRcdU7ks0FTezuWe/ZFaBtYVAZtaPVxhUEYgHCbLQOHFyKIdiEnatyRlOHVUMi3QvNNufDVlr/5z8XpSoOs1xXz2JvDmhf+UEoOsnT90G8wCxfZWyRFJgranGixiG5JWJEq++PcMApEJc8rZMk9BbQsz4DkGrmLGCKkqLOI/FPek2ude82u4K0foRxRyHt8ddlbAC4F0WWhOvcPGP9cQGEjzMy4PH0wLStcWunD3rKTwzjPy1/mLfxJ0ALzs9xqn2pwMI6/RTHh1J2NJOdos9c0cDKCajHojE4Jog5kvjA3xuVbWoC0LHgMcEVyT+8m9icU3A7EfEthrixji2pgWQTNv9fNoaAyg1dIZmoqER8fNpVUxuEt2vjHgge6eNclPKBP3HvxS92LfF5SeovLS/o4dT0lOZIeAXZ6WyKKuIGlDwEXHapVTFFQDKbQ82ZSGQ9eq4raIrmwi2PTE5/dv462/rc5Eodu9f/Uz3Sksd6BU27QLx3qLYxVjCNmSQSaLRaM/1SP1lrsW95DY7qdhmOYm8gg4dRZYc7lFFgUQadB8Kr3tAziNwXqOPtsAnN1xIag54fx0EOU0uJ/P/uA1zffJvM5LKz6paqq2jXgLY/KDBSBYagHJ/WgPLisp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(396003)(376002)(346002)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(1076003)(9686003)(6512007)(6666004)(52116002)(83380400001)(6506007)(26005)(36756003)(2616005)(38350700005)(38100700002)(86362001)(2906002)(66476007)(6486002)(66946007)(41300700001)(66556008)(316002)(478600001)(5660300002)(8676002)(8936002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?09GSh3O6FNLFA/KLFqD9h4mbkfNiLAy5CljmyclH54C+ik9JFC0xLA3mIJMa?=
 =?us-ascii?Q?RpBEeH8ewUZyGl2NMmFS6eO9fL+mCC788FewqffLdU2cliqpyDnSsJTakSQV?=
 =?us-ascii?Q?gy3myljToFyC+C3ob5rMlWZAH/QGuRVjUPBeLAwZPrL930FwA46spv9LK/ij?=
 =?us-ascii?Q?m/HoWHXss1OiC8G2d87aMNALEwBynLxA7AE30STq8QAE7zYphlw0BQJZyadi?=
 =?us-ascii?Q?Qbg54S6ifFj1gowC87iluzIfiYuTP/Zm9oxN19dpi2m9MN+2MOxbsndw9RBN?=
 =?us-ascii?Q?cFbIJexGg7xcbHIbXDx2GuRu+Ce94qh0BOCghj85/vC/I9RTXFlksWoioTem?=
 =?us-ascii?Q?L4UXKnmoXk7cBu04J9X5pRnVftE5OQTYLd1Fh8Zc/DVpnA4YCv4WwQQf3dtg?=
 =?us-ascii?Q?fPfbbg1hA8wF9bo5OrTo4lmghO6r+748+GyjXjC8VTOsmqafExmaGi+Okm+t?=
 =?us-ascii?Q?6rootcw+g8RNIXB9vdiGPZWGEwDoQ9bpgbPZDD2czXHPL2mkGMCsmk+J4gNR?=
 =?us-ascii?Q?sIlN+ITB18gQksHCJ6qoxXCcqX/n98nVSAYhAKfdG47CMxNrAO1HkyP8qw44?=
 =?us-ascii?Q?+mw75bbTHQrRgc71sccAMFhoYwgDzhH4RyhXQBC3CdDbjbUjoesD+Ajhj0Jy?=
 =?us-ascii?Q?coQ7+syKgV0Nq7HE6iaHxqMGDtH8Pn5SJaEWOOpOTeDMhbwS2IoCZuEykjwO?=
 =?us-ascii?Q?ttgMpS0/4Kv6h5xqq5UgCI98VBP+1lJT/mXsNYrqRyAwONH6qCkppil3GWhK?=
 =?us-ascii?Q?jN0jZ0GCzA0V4+0CiqXgK+P4bmEwDN08JW9cMZ7PnD5G9eZlwNseagUuVg7+?=
 =?us-ascii?Q?/+eZV2KqaGUpxfbJ0h9BGWzGbXSCiTvkIiWyqKyKp3RzMie+DO3xc0zMcux4?=
 =?us-ascii?Q?os7aMJs5noaZVcl6Dv5V1bAbJUwSsvnuxzEsvrDlBfiSof626KShugkV5YDU?=
 =?us-ascii?Q?iq3B4jALn1N9Cbg2ugEnCoutuK5GzNm6LRwDckuvpGiaRpPd3K3c5Dy8x67K?=
 =?us-ascii?Q?GMNHhujTH7JYNLQYevldgQ3yjKfQX3wZxJnM8SqBae/DA6+dYfN0fzgpW1D8?=
 =?us-ascii?Q?i5vxEGFFB4eRUawwk+GYN+o6jUad6lmBIXtFffVtpXJfwEIsVf9Qven8kup1?=
 =?us-ascii?Q?EGEbh2i8VZdESosF68mb7MVllbnFgimAZhHPC4tbg2ksW7p4i95SrpwHtXwp?=
 =?us-ascii?Q?I9zuCpGTQL29L32bWagGNEQkWmExV5Jx5O3AqwlmJ8w4wPmjZ3k33Tme7XuL?=
 =?us-ascii?Q?fsD/7lKrHHlaT/waVOGHP+WhPSzW9lr8iewi+T3Rk2GNgBljjls4V3VITofj?=
 =?us-ascii?Q?2VMALDGPmUw9kpBvIWZwHRivewJIX6a0UjZwt96Y83PFfIqFPRYiB8iGkMKb?=
 =?us-ascii?Q?lSKT5xUlVlW4jLmVXuBqKoiQOAsmj/sc2ZJVKO2+ZWGAxk8owKuVeAJDbtIr?=
 =?us-ascii?Q?4VCgu3as2NPiAa5O8E7SX+pi4HxryI/y4Aa7aCAe22PhUA+wnTD7gehWOPbp?=
 =?us-ascii?Q?yfHBMkvHN5SqrbWpXQMWordWxpcxsLFUtMo1LWFnmXFqr0gNo2FW5y1DnfS0?=
 =?us-ascii?Q?7yOTgU1rA2e2MB4yNekCm7vn+gsMzC97c38I15Yievv9fuXTqMCfD53jOeOZ?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394ab878-863e-4df4-0702-08dc1b61cfa0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 15:50:08.9882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4J9383x4GrbY6iX/f+ZyP4ioadTGaoIBszid0NHezePvjsjzBPCxvHHISOeNhg0CoM1IiT2+8LHldkdIW5K5uE1Gmztv2bauh2fJ00Eprrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7766
X-Proofpoint-ORIG-GUID: W3i_Jkan2wvisHTQA4rGZSVBvvuuTmv6
X-Proofpoint-GUID: W3i_Jkan2wvisHTQA4rGZSVBvvuuTmv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_06,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=786 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401220108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 15:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194178

From: William Lyu <William.Lyu@windriver.com>

When perl-modules is added via COMPLEMENTARY_GLOB, all perl-module-*
packages recommended by perl-modules are ignored due to the defined
behavior of COMPLEMENTARY_GLOB.

This patch changes the relationship between perl-modules and all of its
perl-module-* from RRECOMMENDS to RDEPENDS. This makes sense as
perl-modules should represent the collection of all optional
perl-module-* packages. After this patch, perl-modules itself is being
RRECOMMENDED instead of the individual perl-module-* packages
perl-modules represents.

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.38.2.bb | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.38.2.bb b/meta/recipes-devtools/perl/perl_5.38.2.bb
index a9d684cfc5..5037816f89 100644
--- a/meta/recipes-devtools/perl/perl_5.38.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.2.bb
@@ -306,8 +306,8 @@ ALTERNATIVE_PRIORITY = "40"
 ALTERNATIVE:${PN}-doc = "Thread.3"
 ALTERNATIVE_LINK_NAME[Thread.3] = "${mandir}/man3/Thread.3"
 
-# Create a perl-modules package recommending all the other perl
-# packages (actually the non modules packages and not created too)
+# Create a perl-modules package that represents the collection of all the
+# other perl packages (actually the non modules packages and not created too).
 ALLOW_EMPTY:${PN}-modules = "1"
 PACKAGES += "${PN}-modules "
 
@@ -322,11 +322,16 @@ python split_perl_packages () {
     do_split_packages(d, libdir, r'.*linux/([^\/].*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, r'(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|.*linux\/)[^\/]).*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
 
-    # perl-modules should recommend every perl module, and only the
+    # perl-modules should runtime-depend on every perl module, and only the
     # modules. Don't attempt to use the result of do_split_packages() as some
     # modules are manually split (eg. perl-module-unicore).
     packages = filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGES').split())
-    d.setVar(d.expand("RRECOMMENDS:${PN}-modules"), ' '.join(packages))
+    d.setVar(d.expand("RDEPENDS:${PN}-modules"), ' '.join(packages))
+
+    # As perl-modules depends on all other, potentially non-existent, perl
+    # packages, we allow these packages to be empty to prevent build errors.
+    for pkg in d.getVar(d.expand("RDEPENDS:${PN}-modules")).split():
+        d.setVar(d.expand("ALLOW_EMPTY:" + pkg), "1")
 
     # Read the pre-generated dependency file, and use it to set module dependecies
     for line in open(d.expand("${WORKDIR}") + '/perl-rdepends.txt').readlines():
@@ -352,7 +357,8 @@ python() {
         d.setVar("PACKAGES_DYNAMIC", "^nativesdk-perl-module-.*")
 }
 
-RDEPENDS:${PN}-misc += "perl perl-modules"
+RDEPENDS:${PN}-misc += "perl"
+RRECOMMENDS:${PN}-misc += "perl-modules"
 RDEPENDS:${PN}-pod += "perl"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


