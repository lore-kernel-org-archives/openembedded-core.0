Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0172AC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 08:17:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.41644.1723450633924609042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 01:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=895429e4d8=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C70Es9026244
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 01:17:13 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40x7qfh9dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 01:17:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmTOazwBgWLRmZJ6Pyq9TQfrelmr/xwG6J4HMQD5+LSQ0IDfXJ5blRq73mqskjhTJ/xWdajPr83p4z3uKpBe4RcKd73ItkGb5Hu1nZSrjb/EdUmUiB3o3RZxW41wdb/ReKx3WcLXxAS1okSdc2IurFzXEUPdSH3VGG2dwOZ2zVj6mpqmIExHS3rpdr8JpFRpkSy3LXbXodoBvgIA9Md+RW9T/LcQfPICzfdwn9jpxGXoT34UA/gZW0PLixWqdWGBzSLfwdP7PUEyYjpHSRygPucXZvD3wT4Bw5FpXcnlBASVNtnyb7EKS7/66o3Zu/mJZ0tblb5w6C7e5eApBFkqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRhTnQChaaq9WOninTqxJQB7jYLc7Lo00kRR8DGafAI=;
 b=RLU4NWRZXOtUgUx1sUV+1KyJAgM5WOZTg29nnT57MTu7Bu4voJiJpbTJ3HusH6KdcrQTB77/LOGOf+uIolhYuo4mObbUuuXnzTrXkOaTZDxYA4fOQi7oO1LwrVnM2n/D6qHOV3nsceQkrGUB4ZJtziS1yIya07kCu9rScW0g//HiJCIzUx7uv8zCUxjGFnA8pyUVFSa9gzMCUsAPoERKXHV/t8/hsCG0xdFKdJXylQ/GjXOBN6813yh6Hiou4NLNXzj0mV9ib9HGNVJaOa4gFNNImIfz7lcc6gcuzfbuBcr8U+MExW9M/z4uM61gfn1I6FwEJBxbj2KbLCSJ4Eo8IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Mon, 12 Aug
 2024 08:17:10 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 08:17:10 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] json-c: use upstream texts for SUMMARY and DESCRIPTION
Date: Mon, 12 Aug 2024 01:17:00 -0700
Message-Id: <20240812081700.1607477-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0071.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: f57500d8-10fd-4841-062f-08dcbaa72982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?imCDPDpd4xZFCKxT82FFK9KUfTc4ryoi3ee34Dg9CIDOssH8Lwm7q+NWdq80?=
 =?us-ascii?Q?iBhF3Bp4PvBYVGi/+F1z77yQkAopCRo/kvII2iZJIdJ48cidoW15eR0bmcyT?=
 =?us-ascii?Q?4JBFIQwjBJleR3wZ/YQt2nlQQa8RlDXmAnzWhMVcj2LnRnGy2AczU8gvanlH?=
 =?us-ascii?Q?DDjLhkMIn5+u/9se1dI1tvekpn2b1BW5p77ppE9SpoYAFsPpiY/t7CwA2ib8?=
 =?us-ascii?Q?q/kW2Ryg6jCSlhLvmSqBnR7+27R38YyjdtxNO9KWIYtiOhB9+q6ZMy+3Eo/i?=
 =?us-ascii?Q?PqINcjGkCB5SdW8u3IiM7tu/fadBFKqZgncfirqOcgHYgt5OGn2u1HzxD7B8?=
 =?us-ascii?Q?h0SFxXp4wOn1KgLTwJc/tPts9lBdU7rXIrTTIjdkDXKAl5VrLR4x7lP00C3I?=
 =?us-ascii?Q?t1hExQmCdUG0c79ceM02U/W89BDBdxePmtr8BD7E+18BJODYwnDF7MWX37WG?=
 =?us-ascii?Q?y6sdSjTa3GURG35gerLgpKgAzMKXMk/9a2gZThXDo9FMoBA2ig3SQVvqJzAr?=
 =?us-ascii?Q?GvDozeLF5Jatj+zjo5lhCicoqbkNHqyy1GwJXjCIyArMGsoFCNxNXarmqfEC?=
 =?us-ascii?Q?uS9xpYT8+POZw7pkJZa0nELcSERVyjPk72wbvH4mpBTj4SewKCIm5Q+v0mVD?=
 =?us-ascii?Q?FaUGytXSoWwJY8Bctq8GTv8cKW65DPcLdPVWcBZCv9mMkr6VIUiCYgXKpGbt?=
 =?us-ascii?Q?jOjgueiLjEI2we0IKn6Jw+ZwpgKYAf6PDLWHz3aMJz7MyOUfiV5E7QuJhyA3?=
 =?us-ascii?Q?yMVe5D3pQgz1r4n706Y18P99yF1OJHEvVAheyzn/qy9hfWkBR8Im/kfFVNAx?=
 =?us-ascii?Q?jZlENYBbYOvuWTZNC/I0iSm4oByHEudaD8g5ie6xtRoT4MZ5iRbo/zPNlii7?=
 =?us-ascii?Q?0mF7fsxh2rVIVCfRjUOoo+FkZ92QGp510kf7hqTQjM0wb6ao7i/Qr2fXIiSZ?=
 =?us-ascii?Q?EpKbzxGo77v/iY4TChYWilRHrVu/QyP2hJiWjhoQ+iSEFY5u/BoG/74Rz6Y4?=
 =?us-ascii?Q?ud+ZSsrudu5abzkRR1SOfcGu+IcQib16CoYFrn2ajkkhOT3jnjxEzNwLHsie?=
 =?us-ascii?Q?gWjtI0COIMrKQpr43p1gfxGrvSVHPJ2tKRF3yVbG2jKsP0th+bAeYli/WevG?=
 =?us-ascii?Q?j+GSHHq4x51aSHapJglaLtoygNcP+/OOI7qQfl/oYhuU9J/rlmfbie0AIcqj?=
 =?us-ascii?Q?RjR8t8lxb2YvFinFeXMhcPdYnbsnsQ5892n2e0zK8fqmyzyKOxqZCK7eec0s?=
 =?us-ascii?Q?4PkL3iW8UPKjle4jRPncGNw8ot/JYH9HY5FQApSdKPoSlCTwWbiW9D5RRtvh?=
 =?us-ascii?Q?pCLBeqR4go0wGRG6aO1YFujIE/pKIxgqSOjpiDdOiMQXAgnU1PTyAIRk0nSi?=
 =?us-ascii?Q?Aa3CPXQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K6AkhP5xRcFgQ/OODWIiLgi5hPhr6BwEzUHrm/v55e4QIF84XmqduFjcJSrx?=
 =?us-ascii?Q?xTIEAHYEdcLxXcr/PTAQnTAO5VSz3RH492NH5+wiVoIhARQSRJCZQsm3eD53?=
 =?us-ascii?Q?v5J9XrcPL8cM5LQ+twYFas3lU3cPvrNzMIybi8KqtCzKIrCInTiSix+yZM3c?=
 =?us-ascii?Q?knHrQaFHm0SFPbdTXQZtZCk+xJsu2eU1TqC35fT8PRfPEhtOgFL7Msow2lq6?=
 =?us-ascii?Q?0uzi6YBsDaQtInUw0o9x2wh4n6G7c6vAFDy9BdjP+0D/jgVJRoCBr9ehC7jE?=
 =?us-ascii?Q?SjlYCYMFb8I56eOSJvID7Gmc0Rw8d0DX6ShwPty1NDINZRcRBMGV4/Cu4Ynm?=
 =?us-ascii?Q?LaAjFEoz/J8uhuT1T7ueOXBQ2E1VburKOrmNzRQBqlOCyeb6U95E+eE/XRsL?=
 =?us-ascii?Q?Gs7vD+AcJgcGom2Hc8xxSnSb5yEendOGbDIW/ZXiNRArHyT/oKB84IDdve3f?=
 =?us-ascii?Q?ZPekeF5Ri3LtNFp51CcswBjshpKxFolaVGLKvntxAkQ2PQsE9lIrvtCGH79B?=
 =?us-ascii?Q?psHYfgN52BMaKJcGptHXHhClmZbVFikHzBua32FVD665b/vOUyaB3mFNtyqh?=
 =?us-ascii?Q?CvxUftOBHffimWeSzuOG6nSzfXosXdYfrjCIASlDXxmyxLVb0qVkgmrMuYeA?=
 =?us-ascii?Q?XILaMST079OA8xYCUc5ktG/n+foerPpTEp6pA5b9VnQHpnFnVQxU/qB95QyV?=
 =?us-ascii?Q?mBoopAhQ/F48ojEbJZfF5Gn8MP6YdPlsuL2X3gpUrZ67KD1UOID/GldbMlOO?=
 =?us-ascii?Q?b03XYgX1OAzPhD9qFHxzmx1xLzo9xtIiK5TE9p3mQnIqMw7/WnHu49Pli9+w?=
 =?us-ascii?Q?RNstKO0EY4KSjXGGriTsMBTt7x1h5OO1s2jtV2Bz1eEQ0JkM1Xfw3F+hIUAx?=
 =?us-ascii?Q?BGfqf6t83NH39uNE8ZIyEt5YD4iSwzLra0aN4ZZ8WXhT2+xJGaOB5+brqCXU?=
 =?us-ascii?Q?TOu6mhIa9Aq/xcZpGI6uH1w17b9hzildlNsNGmy6vL+/MQA2TGRKQIkJ4SeQ?=
 =?us-ascii?Q?09LwL1a1GevPgBDBVmxPpf3gDWDYtXpKLG/PEtfH+CvhBCui8jY3BtJQITuu?=
 =?us-ascii?Q?WfBaiIljaruylc6Zx17EMHavqoj6YrCm4OW5ShLGO+zsH9SE+D9YCx0xCGai?=
 =?us-ascii?Q?FTKhFNoFXTjDaSIJxIIB7ChHlC/6hlsREHCE256vtcF0Zm6c6p5H+0poPnfq?=
 =?us-ascii?Q?ej6YwVGYSnA6bRj/gnN0TUjiqQYZlY0ktuUN01Sn7V8UoCeWVsvfO+fjGJro?=
 =?us-ascii?Q?cNHG1ypkpQO3xqygwr+bvF3FpEghS+6DbLTbf5hcymAHKMNaZfi4P+nWK0Ix?=
 =?us-ascii?Q?ZzmlYz2CwuRecLNYvuQNr78WZwglHaD1NHaTln1Nn3V2eqg2JEMb2lljIh80?=
 =?us-ascii?Q?58AdSOvRmoQdmA+/YildMYOrE7EukPcTnO/1WIF2cK3AWLZFkBKcLS0k0ocj?=
 =?us-ascii?Q?a3Z8o6+npBVvtP2ti063RSGbe7EkUuhoTqmkR2kXhjsLxaciHGfa6YPfOQP2?=
 =?us-ascii?Q?1jF7zqUJgtNTP2v7THg+c5EGEMx/Pq8xbIA/1DxOp+v7eASxIuE7hmTIj1U9?=
 =?us-ascii?Q?REXoWoyGuvs/eS/2347/BgKzc2XiHvD9IGjIOQl8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f57500d8-10fd-4841-062f-08dcbaa72982
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 08:17:09.9886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBsFLYYjLwV+Cp0t3PVVGq46XY+eyXKsrYWHtQNszxgTzNt60AfgdYpqSfQjReMAbhsT9vwNqBt5G9RFxqfObA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4878
X-Proofpoint-GUID: Uou4p7pDXDCfb-snteikOxI11_S48xgw
X-Proofpoint-ORIG-GUID: Uou4p7pDXDCfb-snteikOxI11_S48xgw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408120061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 08:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203205

From: Chen Qi <Qi.Chen@windriver.com>

Change SUMMARY and DESCRIPTION according to json-c's homepage
https://github.com/json-c/json-c/wiki.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/json-c/json-c_0.17.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.17.bb b/meta/recipes-devtools/json-c/json-c_0.17.bb
index 20bcece768..92ab612175 100644
--- a/meta/recipes-devtools/json-c/json-c_0.17.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.17.bb
@@ -1,5 +1,7 @@
-SUMMARY = "C bindings for apps which will manipulate JSON data"
-DESCRIPTION = "JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C."
+SUMMARY = "A JSON implementation in C"
+DESCRIPTION = "JSON-C implements a reference counting object model that allows \
+you to easily construct JSON objects in C, output them as JSON formatted strings \
+and parse JSON formatted strings back into the C representation of JSON objects."
 HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
-- 
2.25.1


