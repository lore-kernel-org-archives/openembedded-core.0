Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AA0C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 16:32:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27428.1706113967372147454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 08:32:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O0Bgz8q7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1753a196b2=william.lyu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O6Qal6027734
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 16:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=IMHRzvaQSx1RFua0Es
	8IZHta0ZAPV9no8fQD3YD7Ep4=; b=O0Bgz8q7kEp0G4/esDZjSLDoky1wAEwF1c
	WoeOveGn9TaNybB5YqGyFEA0otn4/xC/YBKx8ERFIMwbdj+YF1rkzxpt4idhdXLN
	gaTQOE5wT5Hvtlqlabm2UyMIWkk4G2SolkrIkYGmc0cv06BJs/Hpwqm+8gzw8PQe
	SyhPtqxayv75T9NGQHBeS6M1KZ9pEF941zhz3VDU4MQtFed/ykDgAXsNObSVotMC
	CvuDKowdN1fjZwHw564WYlkzPWWrLKNjNZtQHySS/LhILHkQv4nHeP6CetH3d6v/
	85UiRSLgcnDQGw3NL8ajy88bDVuBkDtr0uHyn+BNmHeucynACT8g==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vtmfsgy9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 16:32:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkDv9TlgXcHmkZPG2LI0ahh6s4i1LE9tYYL0pn1blb3CJxFgXKMLlXWp9oEp0mEO0AleW2WmoiHi7t0kop0JeXbxFszVzABiHB5oyflJZJwi7okwdGEv2oNTR26WtGIVKuqu3YfzkAkCvCTbBfh56APksCeQTn2aZaeOLKZLeVCq0rpwN2Cm03yBoW/ik6+r9O+ZyeARSIajgjXUqWaAKmYmUOgL3jP84LW1Jxuh3gLe1LyNyKDVmlsEHETC/3jP3xaP0rUd63UWjOCQsqjbsDz5CWjokFi4RPKD11tELB1yqf8IYY94x1sAVMm0BBEJXXxZHZBPp9cSrXa0Uucuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMHRzvaQSx1RFua0Es8IZHta0ZAPV9no8fQD3YD7Ep4=;
 b=niWd5B5yBIWhVfNduEJSeUGFDObRUYRFlu3vaCAddP0Ltme2wozqZn50eHd5COMIs1ThNKfgbssj1hC4dIgLcC8HWJ+in2ZBhU+ob0bshWlqXk3lnL5BobEv4WsjNo94cDEhz6qve5ekfBuxGTUjYoVxXj0cn/NjpKYWqM/6AkpJPM7tEpjbPvoZXlcExobY/WCqLGyMUPy4Ld20z6vUlNcyrm349rkrWQmFoV9XXCJS7aFeHW9VOnYknrohmWbR9+x3Ty7FDDmB+TZEbG2+XAxiWGLCLxtNkIJPc4GJPHGVAVk9B1KYWE8O/ov17xkGg50js1D9s/fzESTNpi6ygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4447.namprd11.prod.outlook.com (2603:10b6:208:194::25)
 by MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 16:32:43 +0000
Received: from MN2PR11MB4447.namprd11.prod.outlook.com
 ([fe80::8206:ec84:da0f:f2d8]) by MN2PR11MB4447.namprd11.prod.outlook.com
 ([fe80::8206:ec84:da0f:f2d8%6]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 16:32:43 +0000
From: William.Lyu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl: Fix perl-module-* being ignored via COMPLEMENTARY_GLOB
Date: Wed, 24 Jan 2024 08:32:34 -0800
Message-ID: <20240124163234.2366869-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To MN2PR11MB4447.namprd11.prod.outlook.com
 (2603:10b6:208:194::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4447:EE_|MW4PR11MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: d638570e-aa6a-4af8-3a82-08dc1cfa16c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cjYoVb3v8DpmtzP5PYwqNzVD1S3IZtJmaUNRjRNu0sOj9fpdVzQapzuWDSVJBDSC5nSWZY9EYFkijy11Cqb/XmEAyXRjQvL+FGx4xZc6HrXDLvbWMOWZr715N2DLw0cKN98geYV3wLBVfinQEbKU5vvSTb6R7ANnM9S7cOJEELZu2YQNHVlmlxn3Pps5vllx2nIQRU/6AVshqgaHqDJ/fOHqyJAEhjeHzuwNvSnVcosBAcoqUjOZFKKUEpN4JUvjnTxnKLkcpz1KG049FGwk+llMsvOMn4BpbhDXdOskb4UXGJbOHBAiNySzfU0X6+8TfOfsZVo74PzP2zrt/HTAkeuYgryws7Jhf8JusRyMRzM2vajICyBGJZ06lD9pVa7UAdZm1V19Aby/kh0iJgmLAPeN9AecIGL5lsmY7NCR8IViM/ssKY5s7IjspEdmfz7bTuwB6f8dBa+uwAAQPFupjBFMuH+b3My+KqymjUrA3cr/L//kZJ5Z20ZTTnBVeovxn7v36oTmI4odsayXn9c1IGDSW4X3G8k8Z/AGj8JEOX6upp5w3NG8uEUSlM6VpUjyS1Js4iIXXwfY/tYfGnhc/9dLpM0auTUtkDFxSvtzj33LCYQ9J3C4sYIYphMkrf/tsRhewCulMV1pepYoaWfRBy70W8aPNLhuOFtswz0M5dE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4447.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(346002)(136003)(376002)(366004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(6512007)(9686003)(1076003)(66476007)(66556008)(478600001)(66946007)(6916009)(2616005)(316002)(5660300002)(52116002)(26005)(6486002)(6506007)(6666004)(83380400001)(41300700001)(2906002)(36756003)(86362001)(38100700002)(38350700005)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TNPE/lh6EfXJIhp+j0ogl/zmCjeuC4hxBxyBLdMi5FbUEpDVRW2fFckN787H?=
 =?us-ascii?Q?20QMGvISJYrT0P41rJiD69XKAMD/Dj+EbYCBoPPKu8WNqxfSh0EC+073j83x?=
 =?us-ascii?Q?52sXRofVac74Pqv4kFi/aLTveN80t0rdGNcCZ0ZVEGZb2OkD2bK5RLzr29XH?=
 =?us-ascii?Q?lU7Bh8EPD5tD0xAOd5eJsodKeH3IpgeosjC1i2OU0McRh0bTzS+sqN/SphN5?=
 =?us-ascii?Q?7y84gVNmMNu0ACL8X4IZI7OufD3N8kCB3TI3idqlWnUnOxw+C9KbwEDbgPeW?=
 =?us-ascii?Q?h2VhGXORKxf65/pE1ibzBCKZ/xR4fic/vBhfmt392beCAkwRtQWTr1BOMMNW?=
 =?us-ascii?Q?f0NQRYp063kI3l7o1GB0QCpp3ylESUaXB68nBDnscTD6ePyzbgfnfuzUYSrH?=
 =?us-ascii?Q?Ou+FWkc36OztymcKDvGGm/AuSCSdSxvq9HMK0XNIxKdHyUTPcW+BeErQ60oD?=
 =?us-ascii?Q?3OWqR28c2RlJh4bvxS2ayi7woEQFuTrQOkemUPdlXbbruBuw+AzWV4G8hj75?=
 =?us-ascii?Q?mCuAui/0u4x/ZxGqXSgMoovkcmieW0etiG7yynXHU8Cqb6fg5KadixfW2m3R?=
 =?us-ascii?Q?JFqrlnvAHsyiIFLrxD0mWq40vbV9rGzCfTF1Ttq3vwzmC4enNJv4EJIOLO9v?=
 =?us-ascii?Q?PNLVJZsQ9p/DwwbKvN1uxSJQDKa1QWT64Fe9pQ7U906CVe57Qt2iZ6N01Uu4?=
 =?us-ascii?Q?BTopphnAIxSkAvRN3wL0RMPsexzRl0YrlsN1aYjap2jynm0cSvNGqNR+a3Ik?=
 =?us-ascii?Q?qWMXFkK+OEzOzivIEY9AaKVHcBHz4FJEJEmLqEKBvpWyYGoeuxi+1QCP4EMT?=
 =?us-ascii?Q?ErMmqqMo3A/tUGtEO/qONWIHHp2oqW9ec4UoUVMV2S/eiMgDBEvPb2F+p5q5?=
 =?us-ascii?Q?5mVoWxEReHIUyJC0Qgj+06Yz1SBb0iiAxydZCU5YUr3XmxIWd8ydeUfBk57X?=
 =?us-ascii?Q?kzBQgNTcr33hc686TEEuLYbeAKEIZFnhQxFy3c0hvja7LgPtyoB3qLXFX7yD?=
 =?us-ascii?Q?73JUF//4rRRI8nFpeo2MXfd3LCIzTdaECedH+Y31ZPYBfxECytCH2j9f3UdX?=
 =?us-ascii?Q?+GZya3AGMikOiye/YGoD52wwZvsBWr7/hH/sfA11e08JmFCiVT73IOL/BQhC?=
 =?us-ascii?Q?kY1ydQzG998aRzkF3SJEIsQwPPlti5Df6Q1VShz6fabKn8f1vr7Tx2I3C+yo?=
 =?us-ascii?Q?xNKwr5xswJaNj5lfTfAENInZwJrwsUPWlnIuGHUQFIJJiLCGhdK6zmOuY8Fu?=
 =?us-ascii?Q?qAaqaBGU7TsM6HFOH5SIcaxIhFXVg+KoXHFKT4ErajskX+jrgZEwrrn7JO9k?=
 =?us-ascii?Q?uqntAwBA4NPE4nXB2ejdeC1skxArRL3IGoL3z8T/iNoc+hPjT8QiR0v0Bckz?=
 =?us-ascii?Q?Uu9xnUIDoes2MXwEuicjpssPjtbJM7couQppWZARknhLRPwtgbXkuKUvY+Er?=
 =?us-ascii?Q?XjgljE3HjCsdhz+U5DGQltZRCrhRZwMr8Nxv+3wiuraDyZWO7+R4bjqEGf1w?=
 =?us-ascii?Q?+feB7YAs8pgf092j78p0IyABxIpLaTLq2/m3h1OQxmdD9o8sQecrnePcKQd3?=
 =?us-ascii?Q?awQcJEFjrMxUZd4RSBeafRN/bQq1bu4AvvjD1sW4ArE0D6dL80qkWEZUmFr5?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d638570e-aa6a-4af8-3a82-08dc1cfa16c8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 16:32:43.1198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIlLyNX27LR1VwPlNY4v6E5tdoowBGBCNqpw4wPgjA64dnBhHmXlkXQSY7sRLE6O28iIDgxf36vW8u0tfzz5C6Q6VdjvQVaZhjZHIlQx/gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
X-Proofpoint-GUID: gkzkekk04kLL-A1JaDVn0UlqBmKeiLiB
X-Proofpoint-ORIG-GUID: gkzkekk04kLL-A1JaDVn0UlqBmKeiLiB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_06,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=843 adultscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 16:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194296

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
 meta/recipes-devtools/perl/perl_5.38.2.bb | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.38.2.bb b/meta/recipes-devtools/perl/perl_5.38.2.bb
index a9d684cfc5..b6c9cda7ae 100644
--- a/meta/recipes-devtools/perl/perl_5.38.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.2.bb
@@ -273,7 +273,7 @@ FILES:${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
                ${libdir}/perl5/${PV}/ExtUtils/typemap \
                "
 RPROVIDES:${PN} += "perl-module-strict perl-module-vars perl-module-config perl-module-warnings \
-                    perl-module-warnings-register"
+                    perl-module-warnings-register perl-module-config-git"
 
 FILES:${PN}-staticdev:append = " ${libdir}/perl5/${PV}/*/CORE/libperl.a"
 
@@ -306,8 +306,8 @@ ALTERNATIVE_PRIORITY = "40"
 ALTERNATIVE:${PN}-doc = "Thread.3"
 ALTERNATIVE_LINK_NAME[Thread.3] = "${mandir}/man3/Thread.3"
 
-# Create a perl-modules package recommending all the other perl
-# packages (actually the non modules packages and not created too)
+# Create a perl-modules package that represents the collection of all the
+# other perl packages (actually the non modules packages and not created too).
 ALLOW_EMPTY:${PN}-modules = "1"
 PACKAGES += "${PN}-modules "
 
@@ -322,11 +322,13 @@ python split_perl_packages () {
     do_split_packages(d, libdir, r'.*linux/([^\/].*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, r'(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|.*linux\/)[^\/]).*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
 
-    # perl-modules should recommend every perl module, and only the
+    # perl-modules should runtime-depend on every perl module, and only the
     # modules. Don't attempt to use the result of do_split_packages() as some
-    # modules are manually split (eg. perl-module-unicore).
-    packages = filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGES').split())
-    d.setVar(d.expand("RRECOMMENDS:${PN}-modules"), ' '.join(packages))
+    # modules are manually split (eg. perl-module-unicore). Also, the split
+    # packages should not include packages defined in RPROVIDES:${PN}.
+    perl_sub_pkgs = d.getVar(d.expand("RPROVIDES:${PN}")).split()
+    packages = filter(lambda p: 'perl-module-' in p and p not in perl_sub_pkgs, d.getVar('PACKAGES').split())
+    d.setVar(d.expand("RDEPENDS:${PN}-modules"), ' '.join(packages))
 
     # Read the pre-generated dependency file, and use it to set module dependecies
     for line in open(d.expand("${WORKDIR}") + '/perl-rdepends.txt').readlines():
@@ -352,7 +354,8 @@ python() {
         d.setVar("PACKAGES_DYNAMIC", "^nativesdk-perl-module-.*")
 }
 
-RDEPENDS:${PN}-misc += "perl perl-modules"
+RDEPENDS:${PN}-misc += "perl"
+RRECOMMENDS:${PN}-misc += "perl-modules"
 RDEPENDS:${PN}-pod += "perl"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


