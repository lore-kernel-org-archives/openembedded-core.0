Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF800C77B7C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 21:55:54 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web10.7055.1684965345074701061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 14:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=Jyt1vB3J;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=4508f95ec1=charlie.johnston@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OAol0L026297
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 16:55:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : content-type : mime-version; s=PPS11062020;
 bh=U6YymEthn+aHFlAc+6GcX7ZClWrKwAijMlgEHyCBLsA=;
 b=Jyt1vB3JaJY52oDtZOwjkLz+kLgh2v7SsGoibcquBpGspu/PN5kBMPZejo9D74dxLGUI
 WpqqFrhya4KpmGJKCOea+naN4/4cr6WSoEFpRCP0uJz/1QnbDlBb5wMBjHV519DeUH11
 W324MgyvoObn8Uhk8QbMVfnw3yOHbYYRsDK+OtDf/WpfiWlpUsoB2lekb8vXYooWfSCC
 vEOHmGuDt9DzV1XXoHhhhfE6dYY1sOS41tpyvOlVqsunU8gzAGyK0S83wyS6XXHNGjhr
 kSol9LPHnB7REgmw1hfQ6bZtXP5F60ZpPjW/HGD1Gt0/qo7SRkfOMXebJPCqBykMTJr/ fg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3qpv16801a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 16:55:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJvCNblbi0aDeD/NLbDnXT2E6Hfz4pHe2Uai6rxIfvtTycAMgBYgMJmCMEgA/HhH1soBk4B9zPYOld5oUywLUODbf8YQkr9ow5kpnCM0MhpYid6HMGSIMxV8C1g+l9PMu7STzKuyc0z7nZMiMhIN5CQhJRUd6j3Y8BGemlZe5pDdGtHCAoGSAbvFog+X03PuvQUB+TG8VMYxB0seXShjajuqxG+hc+JJmxKvscVtc6sW3T6kKO2fMIDWbWnxVb559aqan8Rdf0M1lZkw4NLtJ4uZ3aLjTAQ6USps/G5Du1UndVfgafRBb9T7eshu9DGIEj/0QrIxWo9DNXpt6p5M7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6YymEthn+aHFlAc+6GcX7ZClWrKwAijMlgEHyCBLsA=;
 b=DK+sWF8JLM/07jfmNC/+0UwFPVqas2AMiaewIWfMw/q7gTmC2hleqkj1oldh4V2zos72Xq1m6xhWA/0EczrCRRVviZ4Vg76cErcP2Rp01cTYxg7rrpX1YywdVJMp2lQbX61P9zlPE4RGMJJBV+preLxcd/U91IFuX/Y1P/z8topCFC4VSThakgTSMAjw79kGbbvPR0nlCmss5jRJYNMLFTk4AvyT85QiOCWDOuy2sPsxXEOfQP4aubJUp5uB89iO/8FEpuPHMWZZ0Q9ygdzocoBEu1RMyKhk0LNSUjeL1RUWE0umX3GoBiBfQUaA+AMkxQs096ZdgiTlG4ydyVKOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6YymEthn+aHFlAc+6GcX7ZClWrKwAijMlgEHyCBLsA=;
 b=owv1hj5Rhqv4dttP5SEy4xRUeWKFXwI5+YXrgDkfv5cUx5Xi1aOz4ajzvM3dcvlCP4Sz9pqdThrEiDXRJfJ0syeMgd9DSeBWl9bBJ/g7ywShYOeN9Efhiddg8/lBL4T1F7+DSjZqQoWff2GGywJx+xSIl7WmjraLUUtsQmNB++g=
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by BN0PR04MB7917.namprd04.prod.outlook.com (2603:10b6:408:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 21:55:42 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::def9:8ab1:4cc1:bfc1]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::def9:8ab1:4cc1:bfc1%4]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 21:55:42 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH 2/2] classes: Add new packagefeed class.
Date: Wed, 24 May 2023 16:55:26 -0500
Message-Id: <20230524215526.323283-2-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524215526.323283-1-charlie.johnston@ni.com>
References: <20230524215526.323283-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0004.namprd18.prod.outlook.com
 (2603:10b6:806:f3::13) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|BN0PR04MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: da860515-66e8-418f-4093-08db5ca19e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	01Q+KQdwQnb5hJCIiaQN6rd7hJi1L7B4fO0rWGOpUXjalvD3ADbgnBoffXn0/+vhRAEVUF5mny+9geSnYTDiepqQzjfLvBt1aR5gGGrc71wZzEC+nKmBi36/pjWm/0zU9QceHdopCV9oKoMMTELfqcTI/nJAR5tMkedZedeElc/VBFmxi4g1+go5Av70caTNdx+X/e2c245eR5mrbjgkbbtNMnYvGvCI3/c3NzvfoLzHzQYwoV+gZLuG4kYKoXsG4/CpSpPoVRYgdtlyQOJJdIVy5nBq4BNk68L+/QAk3xrwImcFrwtRzYZnq2RMigU7jHSg+sCb7U8L0ltxl3UegF64le0I8yN6911HejZTh0JxWz5BBfc9MWNFmpQgjCmGDD/UDHztXbe2l/XycMarPHHvUGwRYi6skloQ65EqjerrQo5uY6PrMPHQNKh9XMaoZAVTaeqtBQJU2JQu2eY7MMC0zrnFiB7aSvsooc9i8nH7lIr+p1RpqD6Bzc3H47j5SCDLOGWN7DAvooZN8VmIHDlu5BpwyNNABHuQCku31FqsdhrjbnmR1z5cf529HQn0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199021)(4326008)(6916009)(66556008)(66946007)(66476007)(478600001)(86362001)(41300700001)(6486002)(6666004)(316002)(8936002)(5660300002)(8676002)(26005)(44832011)(6506007)(38100700002)(1076003)(186003)(6512007)(2906002)(4744005)(36756003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/AfnZJNnEQ3ldpd0HG1EA2ynDdgSL/eqV2cUsERAUISYDkBi/NVDa/OBBfpX?=
 =?us-ascii?Q?c7Fz/Vz3vILo2/AuGHLJseEsJo6rJcqiVs6NT7WyQhDGoq+0UnOtBQ5sSvQG?=
 =?us-ascii?Q?qtlzcUnN9/1K0lPyQfsH21AvDTPhf5iK1cdYqCWOKaTy0tF1op0DPRWCQuns?=
 =?us-ascii?Q?s6omYAM5iwkUblGc9rbXC7ESHUwpSFbwMqYLUyPimqUEwZMSBf9emdBdRdpV?=
 =?us-ascii?Q?1VrE1w8GawTxHdj6IHB9dflGqQB+4nQFtSb8nX+UZ2beQkIfHqSv5dtsnqbr?=
 =?us-ascii?Q?HblGMYhlBuAiei9g5TYLZU5IuQ7sgyvUPStNveBM40/c6NLFR6E8DDn1u9n8?=
 =?us-ascii?Q?12uXSped5MFWTtB1eTuunVCz3BLl4aVCj4eBkjZOVA2vls2bOTh8JCNAUFZ4?=
 =?us-ascii?Q?HOL5+zQ9hHz7D4gyK+hEze42UtzkeUpknX13mikM0pWac2Am+6t2R/Lhovh6?=
 =?us-ascii?Q?Xx9e4hEY6FV6cYgqh0RmUEJvG4HPXyKus7V7H4+cUxKJa9xWidU6+JF7JhKr?=
 =?us-ascii?Q?8km/cd6K5NoiVvG6tK3v3tHzXqICoOQDOD6kDJBgETlV+KCYzg6XxWXGcAC/?=
 =?us-ascii?Q?VEWbAECE5IFruD+dXzxxGriR/8IEnIjPCHZniUxhJbxXCShDnTmHxYUoNDUY?=
 =?us-ascii?Q?7rbLiXI5M0WJGSyvBI9rw/86QE7Q6Fuqg7T+NvYv+5JX4lJo/2xWHxiKwMs5?=
 =?us-ascii?Q?HfUHUrnhsAKcjp2Aeuf/TXr2BK0BrTpPLHBjUToqYmREPnEpXI5daCWsDNEH?=
 =?us-ascii?Q?u2ZW5ANHm8zAHGXJr+kz8MIFZgobi0CbuMVVyp6vQUeRLm33DYolfFRp+Q87?=
 =?us-ascii?Q?/baiZvrbB0J5PBBsc+fuXuqWJHn/oKxa8dzK9m46DqPSasKSQ263H7YK6anI?=
 =?us-ascii?Q?efMMPd8XbTZYW53K8H5lbKp+svOCPE4Is3er5C5JqdL38tMT3XQ/ENGKuFxz?=
 =?us-ascii?Q?x64TKjhiQMT7U582lFI4sV63/TcWUSWKtfdYCKAUWz/FTy7i8xzofmjtv2RM?=
 =?us-ascii?Q?TcW91uwKJbw3lK7QU3Joa6Gt458Y8oohXcyOXo0Bf34PnTaN1CKjwwsSIakG?=
 =?us-ascii?Q?AP65TcnTL63xb/Lb/CbfMZFlmssf6MoD1H1sJ5AnMAieTtzFkHRfuQeXboFo?=
 =?us-ascii?Q?pH9xdxYUneeVPqsZKcJng7/MLR2fRKvRmzt4qZjEY1oeGRG6QFmUWoR7YgO5?=
 =?us-ascii?Q?zTR9MTHow0KyKFKQPnzRJ8gy2qN/I5tC1kYZx4b4b7vSnXpKGHRz/oXgALSJ?=
 =?us-ascii?Q?Kxzpqye6oOiDMLBS9Mg5ZqN6IFcnAR7p2I6k7zxx5ywMHIYeEMICzEazlXsY?=
 =?us-ascii?Q?SHxmk3jCO6VT6rEm1bXUoV4Mg/IjE4JGYsdkXWUetfBSmy88m4pGhwbfR4jM?=
 =?us-ascii?Q?AbVAwfilcngrIG3ol8AeM6fRYXtAudUH7pcyWlRUS2EaRDoxFoCNMKQobCkd?=
 =?us-ascii?Q?q72QVE76s08cSXYgTvydPMGWqVbVPOJh4WLVvcRsDuNA1Q9/cY3l2sYP4WOi?=
 =?us-ascii?Q?Bu1qEQclcDVQ0EC+7HNC1ATjL4ZhAQXxnAHj3NA8yPc87Qgy7puBDDxPxtna?=
 =?us-ascii?Q?DnSPMbjazFcC3e/cDvrjD0vdOFp8yMgfxAGXFex2Hzh5svxjINLU6L8gRNiq?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da860515-66e8-418f-4093-08db5ca19e62
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 21:55:42.1126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eY+YMWV4l+Ttu39Rmpis77X87bQssL509i1vMkqsKsJeUut5R8Ular114DLJTxrDRgUS5bEcvW51QGc6CMqOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB7917
X-Proofpoint-ORIG-GUID: 1r5FBua7DbyUm8atemHTBRQnAQOHNWAR
X-Proofpoint-GUID: 1r5FBua7DbyUm8atemHTBRQnAQOHNWAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_15,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 adultscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=667 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305240184
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 21:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181693

Added a new packagefeed class that contains both a
packagegroup and the package index builds. This allows a
one-line bitbake for a packagegroup that defines a feed
without explicitly needing to run the package-index recipe.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/classes/packagefeed.bbclass | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta/classes/packagefeed.bbclass

diff --git a/meta/classes/packagefeed.bbclass b/meta/classes/packagefeed.bbclass
new file mode 100644
index 0000000000..b83ac54f21
--- /dev/null
+++ b/meta/classes/packagefeed.bbclass
@@ -0,0 +1,5 @@
+#
+#   Special case of packagegroup that includes package index builds.
+#
+
+inherit packagegroup package_index
-- 
2.30.2


