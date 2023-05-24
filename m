Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C758FC77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 21:55:54 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.7171.1684965344856024469
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 14:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=uXwCXVFt;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=4508f95ec1=charlie.johnston@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OHpw51020809
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 16:55:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=LnErWfckwhaMjIatHwrfAICDXG1kDDsh1cQh8QunJIM=;
 b=uXwCXVFtT+OKYK/qDQwb8xyZJQLBCSdbcsRGuMk5QdzmZC1KzInTVzGtBSEEkpiTu+mw
 jiH0h8iPPQDthTOdEiQuMPxJpE/hmER7NiKT22POZUXtIAhTUdS7u2TMOfKIxkPru/vU
 5FuAHZxUoFI34PWhLigkxyly2oKvI8CN7oCStk1NU172hTvYHu+Vs2jotqkTNFbc66JR
 e4UAgf26TyYoxekLNeUbPLQhVyjvN6T2ArhQ8XQIrY4Iy22LAYDEd0VaCzqQtF/+uizW
 h0wbA6Pk1BfcGC4JA/pvmt7HDCkrhfyxNc7AMT36K7DRpFZXRLzYAZ5NYiMQUbJr7btw Ng== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3qpt818s0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 16:55:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHyNAj1Rt5dVNItruijr7b6QS/Fzfc+cvgXAqHp+0MuMknLDra9+2uUIw4fqpPXR2ipk49DXNYXsjmxseHj1spC7F7hwy2lu10P90zb4YR52QrbEleA8fOZGQg40IJP9SdXVXVzbfUlPvlSnOav6Blnod2k1/kGDpq5Y4IE+9V4UkzG2jbFx65OQCaxc/dJMnVQederwduVB41/2dtEATN6P0Xc9qUJWuyo/ABUJB7G0kEx3QVSIPTj6/7ydKqjR/Af02RLGqxc9drCnA7eO4jasv9cyyIf3klaSAYnRXDslQLi2qQHwfyHSu84yj6oEBLPxCfS9jIaSWCF8BhTqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnErWfckwhaMjIatHwrfAICDXG1kDDsh1cQh8QunJIM=;
 b=iKrEaidLAlGVn1mzf1SvT9LM/hPMmweXDKyERy0JGyKnga6QdK5HrWxI4TNQu6u435ZI385JVi6U/TxlN9gyA1rGRSXBKgXC0e/AZrHMtLfa92PxO5sGMNOYjjtL8UNNoN6xHXdyR7xPzJ2mjXzbQAKsgbX/d4vPxrFVcXiuCW8ZMCCAo9m0fd7iRGtMiwViIQJ4pgn+9IyJsy8swbqE6JnlaepcUFSwDrMLATtigM5+XWTuPNVb1ou5/E2Yd6lheOjoF4AinSJx8vM5ld18cyJKJ3vPUIq8f8yBBEeT9MWTyaS4WK3bWk20KrJb/d8boy9VF31rklfVZRRPii/Knw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnErWfckwhaMjIatHwrfAICDXG1kDDsh1cQh8QunJIM=;
 b=KLsnaVbFb0rHOt9/qokAl42XWShKaP5xa+IbaRh45srw9ZWGYepFj9z5bHkDWp8iSvyKPC/hgKKhD/rFrQtUzqoLdLKmiq8+xIPj20XcRICR3ZOkhD7gAmILArryoeT9847THZuDi+htKb+jfphzlRx7FSlORJGuJSowCWK/INw=
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by BN0PR04MB7917.namprd04.prod.outlook.com (2603:10b6:408:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 21:55:39 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::def9:8ab1:4cc1:bfc1]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::def9:8ab1:4cc1:bfc1%4]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 21:55:39 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH 1/2] package-index: Convert package-index into a bbclass.
Date: Wed, 24 May 2023 16:55:25 -0500
Message-Id: <20230524215526.323283-1-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0157.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::12) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|BN0PR04MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 641f90ad-eb41-4f9e-ea11-08db5ca19c7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DwCaNxTWU4J01fD2xirpKhD/8Lb6lqCPqxXQe8y6WzZy9AjJM9jtjfygQnsJnANjNIC1pmeoaDtXR/sQHXy+qF+WpTaMih4lME42EYxYYiLQ9EiNfHMfX2XlDSqsWScwa87r7oJ4nL8M0hrUQ/kGjvsucIzvJDRhBU5DRZFebxlpVvgWxD3K9IBeFf4MNjTQhFrAT48FpMFh1EP6P2BJA2RMPUZ8Nn1TZmIPMt9uBEpQ59B/5L/Tz2yliVorvvLVdVuc23tbPQnA4bsRAQiqg2IEDRCuRn+HKe9j//9LGZxit+48+VGUOgMP8Q0nlkcI/jNamCjHHNk9ITGmcECU2rURcuCPYJZXQ6nOFTHD+DR+wRsoKZJHCRWZNv0nUK8fz/CUZN0PHCrme3QqEbACNJJeS/Js17fBz62sI7Va6FqmZ4Z7WB9pwBtdVjuhh4CCL9M1ApFkSCBX5ddV5exphykJj8HdJjXPuPjO5p7PVHiuJE5QTyBUtWRohhxFt9ROfbQxHfDrPghhLzgEVKXSUdUU6O071y9t6KGodBSOWgf1bH5e7Lm+8tfi01doZbfc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199021)(4326008)(6916009)(66556008)(66946007)(66476007)(478600001)(86362001)(41300700001)(6486002)(6666004)(316002)(8936002)(5660300002)(83380400001)(8676002)(26005)(44832011)(6506007)(38100700002)(1076003)(186003)(6512007)(2906002)(36756003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GzQiEm51UF6zsk9KzVHK22gDLuCjw9Osg+FwzMTrNsbnqOFhEWkqMX96Z3ju?=
 =?us-ascii?Q?ToOJOvV36PC5aP82jSAdLS4xe4eluNFbTV4PnoUcf7EHXqeuUQYuijNBciMk?=
 =?us-ascii?Q?RMMygbgujnFaH0eB1Gcd3LBWRjlW3mGlvqD1DR6Q7bSFmY2uPuGwAIv+tydA?=
 =?us-ascii?Q?A1J0J5x1JMiVXpMkI0KOIPoJDsn3qZN70xhbemc7NbpbK5UkGPFMYzNRryXu?=
 =?us-ascii?Q?Q7W7TB/Ajp10F5Ol8seNyGhISAVJ3u2S4btJn0xmCTJzO56gb/gGg1hKgRNK?=
 =?us-ascii?Q?Zfc4N1d+fAuLo0awKHOkK6vMY7DG3zdiS8I0iYxEdqT3Nq1QIhUZ/2E3Ptf5?=
 =?us-ascii?Q?cowcC84BAVl4el2Vtxx4f+J+XNt4mZ1WDcNM48O3mCdVV3R24ff7qIMqut9n?=
 =?us-ascii?Q?OrjrRxHcCvYoOMsD/AvmBSit8r4ibBME4HFBp99vrXAMf66k+SlwOb5at7RH?=
 =?us-ascii?Q?5K2mtvh0EhiePb/941Xkf5bqkuj4kFUfyJLZb9jDTedEeqN5dkMkfjfrDbis?=
 =?us-ascii?Q?2kq//b8sg06kEC03BBeUY8hCflGS7r3kvVZQ89WmB6hSEVuX+IENM47VtjXL?=
 =?us-ascii?Q?Bc6jCGMGGm7Xb+eXIp9TL6BgwY0+vc/TWRx7OmGQ86s8lNmJYS8nP9/EYIeO?=
 =?us-ascii?Q?urTVb7JR6qHyzkHk7BU2osIi/PZmTNla/TMvB+QUxNTpGjJmr3ed3Frh35lv?=
 =?us-ascii?Q?Evy2wznn8T9pxa1fKie/gTz3qwkMU4UAe59mv4hPa5yFJDXn7cthdSzoijdc?=
 =?us-ascii?Q?VkiIpVgBR6rg5nGic8OwRvsh3HW7BQxnhI99BTmPjBRzNTfsgOnyPo4UWS3d?=
 =?us-ascii?Q?4obpNTOjpMaD8qelPD90rwac+jiNnKOHHEXvIIj1/Y1FS7Q4KrijErMSrBIn?=
 =?us-ascii?Q?yf8Bzi+GSvea9YZejKNq2OIK3wTwt6o+h3TRp9jiiSHkCeZ6jb68GqLk18ES?=
 =?us-ascii?Q?98xNIoEhhtNPtYOU8hfj2GoDH5LV6lcb9s/LtRRAAyzBh0qz3Q8w5NUvmWN9?=
 =?us-ascii?Q?93D3Mp0qTTXSD9GqPFZ7FtzPMA5Tfw7bHqAUlqIArTnbriPIGzuuEhTk5EMb?=
 =?us-ascii?Q?AFUbJ09mJUsKgy0H4lpEEXcui448WX2xluqRDi3HuyRWKRaNN4qLkPTN05vv?=
 =?us-ascii?Q?irvpfN5K8xdDcgwVmh2CJ9U4Vl9mzq16mlUgmnb8AExzcADFpm7cCjtPDZUc?=
 =?us-ascii?Q?2lZ9Tfx84wB2BaG3pZjQ0HRQaXba0ataiB1Dren931z5tisOlip9wrMDmlEA?=
 =?us-ascii?Q?ctoi6MBKrDcz0DabG2PYaeIASO5IDfv1tzVFMYnapehwVfpdYE5Jz92pvony?=
 =?us-ascii?Q?DxqW38NyD/Y1RrHqBwDkOD/+OnpVtDBSJVB428lWqVyhl4KXTN2UgoI3oB0G?=
 =?us-ascii?Q?kSgXHIW07LNf3dpqj1GRLfslqB4Us4usRl2l8w6YbldRIU5fLU+c8EEQGwnR?=
 =?us-ascii?Q?yz4oOV7IqPdnSEXzM71g7SHjyDQSJvP41JAO0sAUJbo9G8G0fbpPCs3Wdtpr?=
 =?us-ascii?Q?esBYhIZaBQiGlRpYHLRrLwj0e6c9a708poY4BQ4+n9Yo1i5cyXV4JKizYvEu?=
 =?us-ascii?Q?g+uzMA7AJ7DrZuWZzoU46doWa3KPXAAuIwhcoPtbxMyIqt9jEf7T2L7CcsCa?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 641f90ad-eb41-4f9e-ea11-08db5ca19c7b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 21:55:39.0106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WL1Xm5lqsgLN9EN18WkuvqNVzB8HCQz9ZtbKmhO6yA1dAT3dLufCWKNHnZXktp1WzleaWVjIcwoKRSeOBBi5gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB7917
X-Proofpoint-ORIG-GUID: qkV1lWNxN2PaiQQMKDFjCxXHHx_QDVKR
X-Proofpoint-GUID: qkV1lWNxN2PaiQQMKDFjCxXHHx_QDVKR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_15,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 suspectscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=849 spamscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240184
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 21:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181692

Currently, package-index is a bit strange because it's a
bitbake recipe that implements a task. That task is
already used elsewhere and could be leveraged further
for BUILD_IMAGES_FROM_FEEDS.

This change moves the logic for do_package_index into its
own bbclass and has package-index.bb inherit from there.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/classes/package_index.bbclass      | 21 +++++++++++++++++++++
 meta/recipes-core/meta/package-index.bb | 10 +---------
 2 files changed, 22 insertions(+), 9 deletions(-)
 create mode 100644 meta/classes/package_index.bbclass

diff --git a/meta/classes/package_index.bbclass b/meta/classes/package_index.bbclass
new file mode 100644
index 0000000000..fdd10f6dd0
--- /dev/null
+++ b/meta/classes/package_index.bbclass
@@ -0,0 +1,21 @@
+#
+#   Creates package indices for the IMAGE_PKGTYPE
+#
+
+do_package_index[nostamp] = "1"
+do_package_index[depends] += "${PACKAGEINDEXDEPS}"
+do_package_index[recrdeptask] += 'do_package_write_deb'
+do_package_index[recrdeptask] += 'do_package_write_ipk'
+do_package_index[recrdeptask] += 'do_package_write_rpm'
+
+python do_package_index() {
+    from oe.rootfs import generate_index_files
+    generate_index_files(d)
+}
+
+# Package indexes are required for the dummy SDK architectures
+# to support scenarios where SDK images are built from feeds.
+PACKAGE_ARCHS:append:task-package-index = " sdk-provides-dummy-target"
+SDK_PACKAGE_ARCHS:append:task-package-index = " sdk-provides-dummy-${SDKPKGSUFFIX}"
+
+addtask do_package_index before do_build
diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
index 98c5bcb372..3fc18865b7 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 INHIBIT_DEFAULT_DEPS = "1"
 PACKAGES = ""
 
-inherit nopackages
+inherit nopackages package_index
 
 deltask do_fetch
 deltask do_unpack
@@ -15,12 +15,4 @@ deltask do_install
 deltask do_populate_lic
 deltask do_populate_sysroot
 
-do_package_index[nostamp] = "1"
-do_package_index[depends] += "${PACKAGEINDEXDEPS}"
-
-python do_package_index() {
-    from oe.rootfs import generate_index_files
-    generate_index_files(d)
-}
-addtask do_package_index before do_build
 EXCLUDE_FROM_WORLD = "1"
-- 
2.30.2


