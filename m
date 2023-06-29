Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186F1EB64DC
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 14:19:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9426.1688048342752505008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 07:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lYWoHcSc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6544a6758f=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35TCAmEI005056
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 07:19:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=HHZ0454GHTS8fWNcsdmKoL+AeSTFImQXfzxxpuoLXMM=; b=
	lYWoHcSc/iKjoex8HwGebY1aEr3ONpj58kV5Jpca9EVtHlP/skb+1+d8wdsk0jU6
	rf3ClXehk1U+vz8GUvhVT3OIu8FIbj6Lr3NfUAocvtlvHvvXO9Iv607tGtA5AHL6
	0yOOUns6WykS5Gi8YzuD1Aj6eOR0ISHd0Z/xwBLXXcZ8ji8VgacXrQgD1917a81B
	mgON1Tdm/Hg7tNkaeuGJhaud789um6VYsHXsyePoThY6HazDYuzp3f11fNQieT60
	0OdIzHJVmvLbiVteWR+QWX/UZrPAuC8VKFHuZvk0gk8g79e5FxOeoGqgQoDcvgLh
	pE8/Ov9Y1lgF8pPfJL1lbw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb44ec-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 07:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfikX2VAuFoIR8zqBgammb1nkbXWiXkWBAWR17UqHauYU7bZHyz6pa/tm+s/cSpKh5oRdTZ532blVGt43wnjqnuv9t9hR+3lSIu8u9rDtSmaEMmWIMzJoUVvngve+o6fEHjSwmPhXmoHvhpLF4r+5G88XmyoqMFCiC/wXlFbFTnLdTDNUxsRduaVIGMBOEZXgzgPC/65GcgO22eOFVe2Yyw3x3aGkGzUUTlgcMSlL3s9Tyy+0V54rutw/ioVJoq522MVuSxDMO0Trt/U+iMRaHcRXjE7D8Ub5zMSGjibu6+4KBnLuDfPNybwGIo1u3NlCeMjyaxRUQ3yyx/5OORMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHZ0454GHTS8fWNcsdmKoL+AeSTFImQXfzxxpuoLXMM=;
 b=KdNVeBG8TAZTq9LZkhBRPxfQ4BlOQiAzPnOtMz0SD7gDx87PxGDZxHfE8oFbg20baR9+25vmq5wiImAMcNgLSvtR5SyIdUJwmIfkJuNHIMNXXRxfGTZmyygq8rfJX05xOJ4scigJ7KeVfkwMFFWnNwICxeMACBjwbvq09SpOZDQhcCU/zYUOYP+Wicx+qypDm/1t8iidRyyN/f8AQhaYfnUuRKcEYF63VcADdwH6aDgc+2d5kwWJXyWR/Po3dUjUHdkIOVdOJ28tMe9Q9WTtTiv//fPKcLFc77dzRMUoWVeS2xdfe0+3uoDots3txDpkl7ckPXVuh9L0UqH+npaONg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by IA0PR11MB7306.namprd11.prod.outlook.com (2603:10b6:208:438::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 14:18:57 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949%4]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 14:18:57 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] mdadm: fix 07revert-inplace ptest
Date: Thu, 29 Jun 2023 17:18:34 +0300
Message-Id: <20230629141836.3431391-2-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230629141836.3431391-1-ovidiu.panait@windriver.com>
References: <20230629141836.3431391-1-ovidiu.panait@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0041.eurprd03.prod.outlook.com
 (2603:10a6:803:118::30) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|IA0PR11MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8bebd9-852e-4902-c1d0-08db78abc6bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UCMHsnTDUPQ+CsDtUtSYBAg8enFCSDpWM3+e1+OIWRjmr7ZwrkCyilXy8UWK5t0+mdh8JRXyWu4j2Sl99COCVHEH+O+Lz92M/qExFSwhjNzJYJbU3THYmrT6UzihExSvRhwcEGEOVvRJNA1DQNniq9TXl99PF/lL4n0pPg4Q+mNjFPgYWwaFLoP0LxIrvc2j7DBRVjeCjLb5h1ZahXi2AM7TO59iyJpfOSF5wxMQWg0YbJG9pAfyiykQ2YQoBk/CKdGIpbLEwfVmB3gfo79xE13Of1AhCUB7NlsYKFR4llA8XALLo+qzhDhHtZVQqBG+K2hClnTD+3LhGNdTaO3Av2f0niSuzgK56qmD1DbMBxxIa24Nom2qxkTcToAdbCjDXZNzVdXoRebR6ZAIAmRig/p4iDveFY1th8TML7rVj+l20RvHXJolTRQAfhPg8QIjO4Hrk5uNoZ1ZflGfPRmF0zKh/lJElCvO0EYUlfF5Yunz5qT3ZiPOxdDJQXVY4X6HYX3dNeZN9DrkiKdm0+pTW2o5nk1Akh2MwMpaGAwMt0q7Q1x134BC03/jKXWsBYYtgf7UW2h+sNokdBv+r1CEoOL9vJqzmB/kPjUgEQjB8bzJIW3eqZte+L6+/sJ617ss
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39850400004)(366004)(376002)(451199021)(26005)(9686003)(6506007)(5660300002)(2616005)(478600001)(1076003)(52116002)(186003)(6666004)(2906002)(6486002)(83380400001)(86362001)(41300700001)(36756003)(66946007)(8676002)(38100700002)(316002)(8936002)(66476007)(6916009)(66556008)(38350700002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eC0B9VfsS6p2EmNLAcs7g59KrXHWneptt9ycsQm7sKaRH2lp6Ujkf4dkI9I3?=
 =?us-ascii?Q?Lml/2YZtBitCzoEIqV5dT34lw6wFJr2OelFa8HE73BRY96iXt7WL+h0a8gw9?=
 =?us-ascii?Q?QHgVUcye3EcTloWMVM0/Upx2X5zkcWWlaG7N4F8JLzo6kLeg/KrGjTy+FkF6?=
 =?us-ascii?Q?+xqof2Zuq9y3ZyAw2/XxrULYeTJeL2aZXjudOwFo50oAi6UH5/Z6okGTKwZ5?=
 =?us-ascii?Q?4kiouYdzZnqPrtrCCrt43L09mCZEA+kp1nQ2Ceahg2NPeRglCaJQlqP5cQa+?=
 =?us-ascii?Q?oBALfEjQ6IWlj3PG3A82nOLl5u/tVuvKjrPANVRCElZwnyzNeCAp1KoLqEYi?=
 =?us-ascii?Q?6v57NSHOnbKnoypEH8dobcxMX/fY34i+JaaoAjTR459qyXn/4WEZLMlSc3M9?=
 =?us-ascii?Q?dbD4bej4XIBeb0OTs+f9950mGCU0GSUYv/nyhSaXD9HV/5j104QUxUP2l5+E?=
 =?us-ascii?Q?WD5OacUz1nIxnJ1R/FAdeeJW5+ScaN69JfTt2l3nuxnOwUkjNKQBCnhEPwms?=
 =?us-ascii?Q?Gh+HwXD+BfsnSjk/J+PMdwEthInbntwWSkOJ5aMUZ1Q+z7rDSagVgyQRxHC9?=
 =?us-ascii?Q?F4yEeoJj1V3uBE+qlu5YCt+1eSHgl0fx2JMM4qp/+tgs4ZWQaAF9/9/Z8Ims?=
 =?us-ascii?Q?LW8M7mS29/c4WxxzcMpEbTdW0OCW6TZbp7R7lVSXYP5C/IlbHCQI++iZQQM2?=
 =?us-ascii?Q?zvpnLY7V+CIMW6K0QnF7klZUVHdazhngAXt67jhdLcn696jDiIhgF9YYvkE2?=
 =?us-ascii?Q?BxQ1hc0h+qMO9YvYJXwvFUBWCXe9OGYX81DiOEmrIagTZbBRKNhFTDyvN2kx?=
 =?us-ascii?Q?R1hWk5wyor+7DrtYWG+LFyAuhTn7np827Hh/B59NET83/0WKh9fnCNqfJL7/?=
 =?us-ascii?Q?aLifZsbHh1+6grtZOW/GApTwg9OPjU6lMZuh4uhB+A9bLbgnYhTYqK2FuF60?=
 =?us-ascii?Q?RA99PnYuQq2Z8rGgtVt3KIRlIJO7+yC0NaiaJaWMFZNyu97bODpJGx0a5FBL?=
 =?us-ascii?Q?+Jb9jD36bZKYBTbRo5c39fWejzZM3P2ACQMlRCNScHUAkCW/020CrMItAsti?=
 =?us-ascii?Q?CBt0iCJiEHgXntmuNdXN/1DZMC+wsPkfm0OkBbsAFeFlrgfKcYROCzlDqOqc?=
 =?us-ascii?Q?uRvahh7TvZ8hVcZbJzA8CGzcVluOaqyeY/PPokW8YOg/EDRzyHDN35CYBivd?=
 =?us-ascii?Q?Wk1v5oO8TPEdfKYIuKOF5VyMIvoDuY1QfWd/d4LrcWIVla1a+d+cGDjsWm+y?=
 =?us-ascii?Q?ed2rRK4RSfx6p1rAz6XT/tn++Xoq+z3iCpWzTLW3KzQWd4/U08osV4LSE1SS?=
 =?us-ascii?Q?CKVCGdpFwmL46rzmus0/QFNW3KyzMKu6pi+5H6omr4KRBD9WPkwf7H/VYc/n?=
 =?us-ascii?Q?swaVq9mbR3m6pZtPSwPRcgOCvPqs4ehVUS6k8nDyKdTKVoVT66nryUZKWYQg?=
 =?us-ascii?Q?L18yBQEHw7tx43N2RJE55ilso7NNeo3y6YWE0VGLKL1G9gAflfpOhR++JEbo?=
 =?us-ascii?Q?XAMFybTh3545xLDQyGXMLucG96eJrR0E3awCdPx3O0s7FWIlkqMwaSmMK1+Y?=
 =?us-ascii?Q?ENyXA3Zpf2wrZjyqC3mVmNXPGDPdMcAzY70lb3HmpqT82Ugd0p8LM/X5PxRj?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8bebd9-852e-4902-c1d0-08db78abc6bd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:18:57.4730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APlSqYmIGntY+WJ7F823WYNjVhwJz7G2ALlA9tmZ2+KrCmhgl3vZGAiyZR0o7+vDc2G+E1H88vNUt6D1qwBkylHAi5LauwvIxt6j0Mm4F3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7306
X-Proofpoint-GUID: lu5hkO4wcJnOQWlSnYdtIpyoSyEnAWj2
X-Proofpoint-ORIG-GUID: lu5hkO4wcJnOQWlSnYdtIpyoSyEnAWj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_03,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=705 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306290128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 14:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183632

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Testcase 07revert-inplace fails if strace is not installed:
...
strace -o /tmp/str ./mdadm -A /dev/md0 --update=revert-reshape /dev/<...>
tests/07revert-inplace: line 40: strace: command not found

Add strace to mdadm-ptest RDEPENDS to make sure the testcase passes even with
a core-image-minimal build.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 0a122b0b01..a5844b6726 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -101,7 +101,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk"
+RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk strace"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
     kernel-module-loop \
-- 
2.39.1


