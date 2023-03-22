Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9FCC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 04:33:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35588.1679459588782488630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 21:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2445878147=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M4LZvI000983
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 04:33:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqsmr4rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 04:33:07 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32M4X74G019280
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 04:33:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqsmr4ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 04:33:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnFNEmYmegD5UirGoZaLYjE9KQaWl4zL4y7saE4B8A7ZdKwXvSACgQ9VsdN3eUM3cpJvkcn6lBiyz2XYTKm85TS+zYCFNidBL1nCVeUtm1OZxX+nsBMfJ6b5/ZVHTqzbn3v15MrmDuvkywFEJL+GSoOHnGnEwA99rnOuQBqJ6w+k+Zaw63fEjjpAmYSyruGiQPzb7mXbEsOb2YRP8FOIOZQVu2iXHU2OglmgkyQ/DJDnzMeDhO+7IwjWvSQBz0RUlTcry1pxO/OYSamJ0YkNxm6L4wY77CZ4ohNVcQ0b8qkNAgGdCbDKTjM7gkfR7iplcCNbE3aSYPiYZvFyAs/9tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+3BSxJN5LZufcX2besJPyeMbuwXb26+az81WsSX9rA=;
 b=g7zO8ujM6LW99d/+pDy9coYBd+QbjHbU3EMfdxyvRMST2vpAqn4RjVSorJVRpedVAjZv5OG4GSmFyoHcR0VyMYe6QQJ64kzxwW0ii9Bx4uGFm1BGkre2bbFwCKCatSc5lWDwNXOyDSykAl5ggxRaI5Qm9rDlb3YXFTofEzX/w+8qqtcWxhk8qeuX44lJRRfrOxr7lu11hCryBxL4pgep9tIfzvFSxZXZcIfJZBS3hkK7eGJ92woZdAxhtrWYf2fU4zNwqcPeWwc3OJWp1YALXbEUm/UXYv162p30j4QI/f705ls1WV89DDTdu/+la68tzkUwBm7vUQchiZs+UxS8TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by IA0PR11MB7209.namprd11.prod.outlook.com (2603:10b6:208:441::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 04:33:05 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 04:33:05 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: alexandre.belloni@bootlin.com, alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v3] rng-tools: splitting the rng-tools systemd/sysvinit serivce as a package
Date: Wed, 22 Mar 2023 12:32:48 +0800
Message-Id: <20230322043248.2928739-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0126.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::30) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|IA0PR11MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 08300eb9-6c73-4456-63fa-08db2a8e8762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z+uOAt6aX9tJN4BSyA2i5hvG9z4IYvdI60bgKx+qXW7f4YKZBtmPY6Rp2BngFH46rfzFVjNpCyvC1jcMob4XG490g6/JNwTmpacVhPl4wn203ymP0WM5yM9X9i3bA67yrym+5M+KvuontAllkZnbt+T7/k4RSaAHYcQ7EGygfZbS5gUTg20K7WyQm9w7lT5zjgd0sHI9Wxkvey1g7VMNPkyjUUi6l8YloggTlCpAIjjW8Dsb149coFM12ys4vPOms4YOp8HUh9fRRnuPpqYr1voxYWVZeX+pXIp5FEVFUKS22VA/johhkHPbKhzIWbI80AiNu4Ny9m/20OyKsKDgGe1ysTLbAkz+MbYEl+yWIDBqgNIbaZwgFb0tEnYjPHAGGU2tJYGH4cfjbY5vpVfQI6i4J4VEDoqon8XwtaJmMJM9qRanRR+5xQzB35lz/nUx4MD3gflJCDV7hH/+pzuPMVojKGa3/oU7LpNnAM0VhJPl+20bjfcgE9GwaPJgC2SUHDjuBPuie9UWd7S0v9DRG6Uzoge6pm4UBm2lDwlG8Wk10/JJBSAKz3TXbPH8MsboJu1h6DdpPI49wWykMeew5O85cGhK5PGAb6SRMP18kjNUCUeQWjM4YhG5vNi7qa75AjBZRp7MvDq++v7lN9w2eab4+/hZwlGzWIVPQVXShwpADAKIiRO+SysrOcqqij8A/drkjiKg3jJ+3mB4jQiUIVQRpO6SgjbkvexvghYAG+E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(451199018)(6512007)(6506007)(2616005)(1076003)(26005)(6486002)(6666004)(966005)(8676002)(316002)(186003)(52116002)(83380400001)(66476007)(66946007)(4326008)(478600001)(41300700001)(5660300002)(8936002)(83170400001)(2906002)(44832011)(38350700002)(66556008)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FUPP1nPwl+LPtYgECDC9GszOPjhd8nmQHLys8fjIAxFzdNskyuyBYw9bhTmz?=
 =?us-ascii?Q?ps6jN8q1j9TtvgGCaCXFn1KgR3nkefgqxetJJJ03OJ4Csi3mLISRzD8re83n?=
 =?us-ascii?Q?ypBHe8pRYDj3QflMPHwaKue2JvWniFDnTeimMyEl0cpMzXeu8ICCnr2nMqYx?=
 =?us-ascii?Q?RvWcSvyN10GRVOSdAXCb8Q6WBcEDH63vTtiCqcVCSpyw2oI4Et+WpW6QIwLM?=
 =?us-ascii?Q?CxlP/YiBv0My0VflpO4a8QTh6GN2/19/fkfY7J/jx1FgHpPw5lLbDU8OZqDj?=
 =?us-ascii?Q?vq3u4MKyTQ7HwLbzxUloIa5ZAazunyk3ClHPf26J4CvXCSi3vRCH+tTG+rs4?=
 =?us-ascii?Q?/OUCsGqkD8Yi1btIBN/r2GcQEbn16c3g8D56V4pZ9UoIEPEHGwE1Q2xUyApX?=
 =?us-ascii?Q?ytRjnkd2Brnr7HCPo6yFaSr2/optUNAmpHYxDP5fsjcz2ZLWMbTJA0GGr5Sp?=
 =?us-ascii?Q?udFXzro2HbC+4Sea7WWgx2VGBFN4MIjoGhK8svoIis5mg45F5qkh708XxiaP?=
 =?us-ascii?Q?nn+LCs6l3we343crbz/R4DBE3XiInjnetm3uVuGOqGMUbjWKqB1QpWa8v3g6?=
 =?us-ascii?Q?F/tV+XYfrp6+2xXZmz+H0NWNUgLoVbNEnC8YGn9hXqLZAsScMIq+aoW2ZUgQ?=
 =?us-ascii?Q?76QDmxG6oqb17ukmGHnHr5ttEw3dy3gFIbwWA2wYrWzB4eOijw9jzdzfAcnc?=
 =?us-ascii?Q?mmycrpCMd7zvitq2U2OJbTTUqbiRNVEjSc+gwevEvgqcxK01vqZAZXsPHrtm?=
 =?us-ascii?Q?6XoA5dFXIVRaRDAuVHKqYMuYz4PvbI15OsC2mmYRElNjP9nUqnLYIhonG6Ep?=
 =?us-ascii?Q?Kj/ESeYEOa/CFeq2SApbwehNR2l9zHQ9zROSfOxOcdqUyYaVaHJSUchNSe9M?=
 =?us-ascii?Q?xe9rMYb27Iea50rcqFvIJ6m1tDdxUZoy0j48N93NJbs9UBNwX0QMWotN27fn?=
 =?us-ascii?Q?pSh04Dm00RrePEl0UShP+GQ3CFKQaM9kVmbkTBTinWIIwuwYyOvS0e2dyxaA?=
 =?us-ascii?Q?B8M1J3vC4nfAGdDLewgpxLyoX2nVyL4UMd5GTIsGLhxYqdiCL1qvCFkKITBZ?=
 =?us-ascii?Q?FyzaByTKEOso6AJk4awLZloYAmg36kAlLXU4tmcySwaVIn7yRr6N2HuN8oDg?=
 =?us-ascii?Q?JypPS0Q1bkhUFM99F+Czt80ZTx5z6bSUOBgqwjjbwje79bxNtltQEaGK0Ny6?=
 =?us-ascii?Q?vB34uE08+91xdR/86L5Cf0XnEIcLnjpjZUpc/r19b9xF2uGXnwFXyA+ClE/E?=
 =?us-ascii?Q?BnTPXUmKAc2WE14ZIrGU78By6A4kgaMzLEUepJIrheaaRg+FK9zTa5FEBWAM?=
 =?us-ascii?Q?+97YvtgXYOVsPvUJfZcVG+S03PJrPNpD35+MVQ5ty7LImqXHfrsm7NtmOjU+?=
 =?us-ascii?Q?FutRk4SN/8EHkU1WEM54TOXY5z/SH0OdUzCdXCwLbhqZABuiJ0qUyYrdGPt6?=
 =?us-ascii?Q?lVZ7uSoOrPf3W5mHw91LRhGt6NVOSO5n9VfzA/+3xjWso+hfZOGLdbxC6cc/?=
 =?us-ascii?Q?4ZLYra+vcEzXyULgjjEca9UqjxKL2CfAla1YRs2d/CZbiYnpjidPIPTEQneV?=
 =?us-ascii?Q?uNR6PqDJ4QPuye1Pe4iHV8Cr6HkzXdC85ayoVso4blZRUuNGaEduAJLG6L+W?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08300eb9-6c73-4456-63fa-08db2a8e8762
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 04:33:05.3463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRGYwXaJbNOZPmj5aYJZrWncPjIWyDTQdOIUcJmyM/ZK+vQzmECErMdN9uQEGcvfu7ONlKTkyt6+4bOVu47HWVpC3QP0uerKvZ89dSxvVkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7209
X-Proofpoint-ORIG-GUID: cQDZAgOSL7buuYhMTucw0-MQ0MxYxAnR
X-Proofpoint-GUID: 8iKFoHcjYmWbYVi_Nuxps3pqVqQjz-7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303220032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 04:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178912

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Since we removed the openssh dependency[1] on rng-tools, there are no package requiring
rng-tools in oe-core, meta-oe, meta-virt, and the /dev/random won't block anymore after
linux-5.6[2], one of the reasons for keeping rng-tools build into the image is that it
can be used to test[3], so splitting the rng-tools systemd/systvinit service as a package.
If someone needs rng-tools daemon service, they can enable the rng-tools-service package by
directly.

Reference:
[1] https://git.openembedded.org/openembedded-core/commit/?id=868dfb46d96a27ec9041cb902fb769330277257d
[2] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e32
[3] https://linux.die.net/man/1/rngtest

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
V2 -> V3 changes:
fix missing INITSCRIPT_PACKAGE cause build failed under sysvinit environment

V1 -> V2 changes:
according to the review comments, using FILES/PACKAGES to split the service package instead of adding
a custom variable to disable the rngd daemon.
---
 meta/recipes-support/rng-tools/rng-tools_6.16.bb | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
index 4e664a9145..4dfecb7da1 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
@@ -31,13 +31,22 @@ PACKAGECONFIG[libp11] = "--with-pkcs11,--without-pkcs11,libp11 openssl"
 PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2"
 PACKAGECONFIG[qrypt] = "--with-qrypt,--without-qrypt,curl"
 
-INITSCRIPT_NAME = "rng-tools"
-INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
+INITSCRIPT_PACKAGES = "${PN}-service"
+INITSCRIPT_NAME:${PN}-service = "rng-tools"
+INITSCRIPT_PARAMS:${PN}-service = "start 03 2 3 4 5 . stop 30 0 6 1 ."
 
-SYSTEMD_SERVICE:${PN} = "rng-tools.service"
+SYSTEMD_PACKAGES = "${PN}-service"
+SYSTEMD_SERVICE:${PN}-service = "rng-tools.service"
 
 CFLAGS += " -DJENT_CONF_ENABLE_INTERNAL_TIMER "
 
+PACKAGES =+ "${PN}-service"
+
+FILES:${PN}-service += " \
+    ${sysconfdir}/init.d/rng-tools \
+    ${sysconfdir}/default/rng-tools \
+"
+
 # Refer autogen.sh in rng-tools
 do_configure:prepend() {
     cp ${S}/README.md ${S}/README
-- 
2.34.1


