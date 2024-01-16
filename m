Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AD7C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 16:56:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21565.1705424176055033280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 08:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hw141XVs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17456644bb=william.lyu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40GEU515029112
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:56:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=MZXc31RrkRENDMwD1Y
	1JFhVKYg3MG+Dc12sFBTCA/7s=; b=hw141XVsXFbJIFFl89lRi3C9VAGdKGiXTk
	iHCPC+7nuXb3a7jkdFilGiNEZF40wMZz3Ke8UQAtsi1z/OveWpz1Vdo8hIDR1G/s
	VxB5tZd6LyCjWe7hSRVlVacqe+/jTPmwF67DvnQwJ6GtbuptP8PSOFKJatqxmw6t
	pgclt/dFN0Vwcuasao8vKTfJaR5SbOFFC2G7g3mGvNMm2E/E2cNqW6Fj8RHChiKF
	aMmzFZsSKLD8/Pm8Ldb9+VFwmZaOPRYSjEOk7g3mc55eXU5TSCs9DSNmBCIznpIm
	7bnUYESKwsu+43FzW0hY5/Aof+679CdbF4T4smhXd7dhl3VIFzjg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vktwkk34t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLs90jsZSGIV+5KOMXxHsZ41DnD8uQLZiNmYIlAYnhn31Fsat6zx9I8eB590v1HIcC2NuyBYBu+V4VCgTmRnFUtLNxobTQ3HFnI6RxPlahx4XcraFlO3WCokOWO3Irmrve/MkQT4/VDtMj2Ym/JMkvW+1p0vfD60tqflqdb/Eg2H1bfhphIdJCVoWBIC/XqA8BYaqdKdZDTyAEyQR19oW9qfLAqQ1Ab+7kO7I/0tt0Gpdzvp03X8Le7mY3ItMnEd+3sjB24GewjmDc9s38MsLXsIF/KvjecR6f4nWWJNT0Fe5qRT1k7enS/9vxDYqAI4/oj7hYEScpUkTKuDYyMAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZXc31RrkRENDMwD1Y1JFhVKYg3MG+Dc12sFBTCA/7s=;
 b=AugD4+MuqsgBKSp6RNg85DYbt8nfz0Jl99YaAUfOfZciQ8gxK63dfvSQX8ztFr+E7P4ITT6FWIgRidfqkuymMN5YMun+vvs2GvOJEkC9hSmXU4Kq7gfXI0npkjFRpUfLJUX/dMveXBefHFwy7a6+x165NZ7JRo49G/eOorF8gEk4LR7hjJ4JeavBoLB9g9oelnx6QssYO5flJkJQ9sNbAESnuW9u2lTYBJ62gfZpvAR5Nmwl3AVyL9l7wfkg4S7lT+BGpM12UQW7wc5cuGRr66HNPtcL0JmKUR36ZSjkwXF0ls2MTbU6fHtgg6JR3bcdlBU3CGzt0aHGtuyBM8E/4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 by DS0PR11MB6544.namprd11.prod.outlook.com (2603:10b6:8:d0::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.23; Tue, 16 Jan 2024 16:56:11 +0000
Received: from CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df]) by CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df%3]) with mapi id 15.20.7181.019; Tue, 16 Jan 2024
 16:56:11 +0000
From: William.Lyu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] perl: Add option to prevent COMPLEMENTARY_GLOB from ignoring perl-modules
Date: Tue, 16 Jan 2024 08:56:01 -0800
Message-ID: <20240116165602.2053194-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::34) To CY5PR11MB6342.namprd11.prod.outlook.com
 (2603:10b6:930:3d::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6342:EE_|DS0PR11MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 082897da-5e83-4cfa-d90b-08dc16b40acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R+gNeeP+2IFhp9Gi77sxdLiyKxLnaMhcVJ1ZyVscQwi89qhHXODUTGYN6so7c68IgQCrbij3/itORDzLf+U+Wmc5y9qPqM04ToVCAlqE4HT8m8j0ebt+/cIHDGWX5pYMoc/LizRcmatKjeDV+cW4wM4wnTIjeeL/16a423CwDVbiiHCrfOi88axxgNivP3Xj0hbw2dW9PiOS6e+XEIdWnj+S1+jJxGLDToNYsvL7hpdC8nfzdxNr22cNc1nhgUheMozAvD4N/GkebGn2NN0bBhWUa6VNXyMRKW7NndMHVZjOkuLCJ6aNwgzzlP+F7kVonjJU+v6p0EsStUQKn5vvibh6/zI5Fqf8A7l69BNWTbbJOns+8Pxe4b7H7l7z51Sy4oKyXgQe9fdO/0+dfIuWnV/PoWadejDZJnhuqfw8cSQ0osD0GmUqDzU2gJFCzNSB0ViNohvxzeRt4WPpUzxmQiIW4pPV/FTX43Se8xwh+hqF4umf5FKpQXUrq1ywDyAWwO2/h5s2Db1hGKTaqMWb/4u40mKrouxUeyjPa+UyvaS/e2uc2GxbpLN/OQ7R/QA1wDsb2zvh5OK5PFX3ZwYnVPtHL3FmEkWAmDtAgp3Qr21R2xV8dUzUhG2KjQt03DpK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39850400004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6666004)(478600001)(6512007)(5660300002)(9686003)(41300700001)(86362001)(8676002)(6506007)(52116002)(2616005)(8936002)(6486002)(66476007)(66556008)(316002)(38100700002)(1076003)(26005)(66946007)(36756003)(38350700005)(6916009)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u+X7L8kmP17G25UqYnAA0uyA+Z319NKm3/2BDDd7WyFjRKQg+mrpdyOYaFKb?=
 =?us-ascii?Q?mIRyAKULMOOPN3FYlIrYcpFulAObqikJV3hs+3rFCn85XY+7TGG9JSgAcZ8W?=
 =?us-ascii?Q?dwjVXqO/whFlmpDnvF0Qe/qGm8ftJQWsjeikXqRR0cAK7whGv7WF+FRbzCnc?=
 =?us-ascii?Q?VTp/W7nnF77ja875krcXmYYGmQCoQKbMSmSPn8Y4d3AOqQ+RoqruPB5IRGc1?=
 =?us-ascii?Q?UyQfoHaK0kEVUD9nA5Dy7vW67X4S8FyCs8SVGVv8JhHsKTIqb6RLq9dKqDt5?=
 =?us-ascii?Q?5VBLC5W6z6A8wYhUcBe0RMpMy6RkzXBpcr1/ch3Rr9YYMfkcj43QaDGLyUNS?=
 =?us-ascii?Q?3pnh3f7ch1s41pBbkZ6qT9+g/oGhsOBerox9TwCMMIriQIDK/sq/zi4qgCB8?=
 =?us-ascii?Q?5h584l4Y91HGutag5q4XUbAyixMTm+ugwlab1xy+uKqnK79qCKwoFGq4E6q5?=
 =?us-ascii?Q?URX63gapRYy1C9cFYTbQFw83tM88qjjqAQ0O3CkMYlBDE++LCIbK8exb63S5?=
 =?us-ascii?Q?gLGbjpXm/kKrG2ddQMZMkaTLCkk//uM4mIYxwaG5v7TQGv0EdVoc4ZIV96wd?=
 =?us-ascii?Q?ibtVDMhsl8zAptY78rjS8KMB3/tEtp3R/YGw0BM8xLZb1jKpRxnU+W05JZPx?=
 =?us-ascii?Q?NGKOwzW4n//iW+x/Kwrf/UNpUXfvEiNClwy7LDjIrXSmSfi7ohGbVCAu7jvG?=
 =?us-ascii?Q?goTQ2yO5mIg7cWLbJlX+Wd0d8nppzuLGqf5tOUQXmcQ/x19h9y6KtbtAx+xg?=
 =?us-ascii?Q?F1Psn+L10zQc8QPgHj4poyTVNQ5JEMmYZIQuTXzJ2u+QlB0flChG64EPuaPi?=
 =?us-ascii?Q?tiaWV7JsZXvUaBfAGJ02uPqZCHpSu9wtcXtrNKGJTZjvbEOhwCRQY+LGmNzs?=
 =?us-ascii?Q?V6VVrJVbHWcVqlDipPd6eoPTgktR9EXWToi/mnVjenkWJR4z4m5YSwQdFCZV?=
 =?us-ascii?Q?syS4eWrjP5z7InSybSDUKu1au+3q+7lvHDAkXwDjtRnrHFqIH5K1FmhJg8KU?=
 =?us-ascii?Q?MpYuiGto/1QZMkHDqTBJzqr0T8ild9+Zce9iSW5uS8H1+pQeVRwkEcxTL0Q5?=
 =?us-ascii?Q?dsKjyKxP3GPIjZGudBr2IhZWxjtIsQFLzrdZogMm550x0EjOSw7m3KJPl4FF?=
 =?us-ascii?Q?niGcJ4OAq3UKAUI7Yt/4/b6pIeFlzPfk5REhq1kMB5xcUTVHUM2NrHDWn573?=
 =?us-ascii?Q?96GZNLabTmyUMMNVu48XEhQ3s4ycsAFoJCmU435Bkyxva6AIv0g5ea1YB70O?=
 =?us-ascii?Q?haQ4oCsduQQY6+oWUeyxLFOMl8O376dqFuOXXGesFqLoekCZRUVABCsVVToa?=
 =?us-ascii?Q?syxtDrmIxH5a1tVEsXGqf/PYVylp5uSwOKUEcX2jIJe26EoNlKgC7m/rTEMQ?=
 =?us-ascii?Q?8BKEsh09MPRyEluTmy0ak9qiXiIHGLLW8Qn5jQCNwsKwM8srTp/eo1PO4ySV?=
 =?us-ascii?Q?VC5//wuQmS2VCRBUiF2f/FHSwq57D2N6BgNsmFtLQFWJani65K3FhrBF3a0K?=
 =?us-ascii?Q?BRkhueD/9j04b0xxJnGRQ6n57kB+saFM3uzasyXiaugM6pu83v/ONo3XbkyA?=
 =?us-ascii?Q?7KXogYorJ/3kpXmKD8JfKhtp+ekjaX5LDfS34Hd0hcyn+j1Qu+3nHbiFdOJs?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082897da-5e83-4cfa-d90b-08dc16b40acc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 16:56:11.1633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XySGqCRtueXitlwC6gcL4DGjU83rPZ9lFQTeceqki4z3dv5B2HcPVVDc2OmONGG5BqfQkymo6oVF7V8JAl299/XG0GU7jMA8mtC5Hl+zago=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6544
X-Proofpoint-ORIG-GUID: uQn0WYXexsuIoOkhMzjLvFMLWtN6688D
X-Proofpoint-GUID: uQn0WYXexsuIoOkhMzjLvFMLWtN6688D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=607 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401160134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 16:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193867

From: William Lyu <William.Lyu@windriver.com>

When perl-modules is added via COMPLEMENTARY_GLOB, all perl-module-*
packages recommended by perl-modules are ignored due to the defined
behavior of COMPLEMENTARY_GLOB.

This patch creates a new package perl-modules-force-all that RDEPENDS on
the same set of packages perl-modules recommends. If another recipe
always needs the packages recommended by perl-modules, it can add
perl-modules-force-all to RDEPENDS to make sure that the recommended
packages by perl-modules are not ignored by COMPLEMENTARY_GLOB.

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.38.2.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.38.2.bb b/meta/recipes-devtools/perl/perl_5.38.2.bb
index a9d684cfc5..f75c5aa971 100644
--- a/meta/recipes-devtools/perl/perl_5.38.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.2.bb
@@ -311,6 +311,14 @@ ALTERNATIVE_LINK_NAME[Thread.3] = "${mandir}/man3/Thread.3"
 ALLOW_EMPTY:${PN}-modules = "1"
 PACKAGES += "${PN}-modules "
 
+# When perl-modules is added through COMPLEMENTARY_GLOB, as it is recommending
+# packages, all its recommendations will be ignored. So, we create a
+# perl-modules-force-all package depending on the same set of packages as listed
+# in perl-modules to provide a way to guarantee COMPLEMENTARY_GLOB not removing
+# these packages.
+ALLOW_EMPTY:${PN}-modules-force-all = "1"
+PACKAGES += "${PN}-modules-force-all "
+
 PACKAGESPLITFUNCS =+ "split_perl_packages"
 
 python split_perl_packages () {
@@ -328,6 +336,20 @@ python split_perl_packages () {
     packages = filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGES').split())
     d.setVar(d.expand("RRECOMMENDS:${PN}-modules"), ' '.join(packages))
 
+    # perl-modules-force-all provides a way to prevent COMPLEMENTARY_GLOB
+    # from removing the packages specified in perl-modules.
+    # perl-modules-force-all contains the same set of packages as perl-modules.
+    d.setVar(
+        d.expand("RDEPENDS:${PN}-modules-force-all"),
+        d.getVar(d.expand("RRECOMMENDS:${PN}-modules"))
+    )
+
+    # As perl-modules-force-all depends on all other, potentially non-existent,
+    # perl packages, we allow these packages to be empty to prevent build
+    # errors.
+    for pkg in d.getVar(d.expand("RDEPENDS:${PN}-modules-force-all")).split():
+        d.setVar(d.expand("ALLOW_EMPTY:" + pkg), "1")
+
     # Read the pre-generated dependency file, and use it to set module dependecies
     for line in open(d.expand("${WORKDIR}") + '/perl-rdepends.txt').readlines():
         splitline = line.split()
-- 
2.43.0


