Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934C1E810CC
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 10:54:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14369.1695812063063700175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 03:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NINODpRu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7634b29f18=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38R6rciD028279
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 03:54:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=/BkHYtP5IFkxMqvbhz
	8hcI30HaYm6Y7LHlbeA2JegxI=; b=NINODpRu5abiM+XcqJ0P6mq1M8wQ12FeGc
	j7gSTUp0ddUrCRq2aMF5gFYwVKrB5vSHx/DGg0iL+jzpIf5Mgv5g3oNu3jzLaKnY
	XwuZg8mGhrW8kUo1nJk32QHobD9anUwblWu1Bwc+ukacOuj3EfdBh16hcI5w4rJn
	GagUlhohH1NRHkj8uqE2eq6768Pu93ZloLTVyqY4BXxJphpAf+nWGSDNG98lXpjZ
	KFj3XeJRczcv7ON1FERE/EhzJLi5/zC/xIO0dMP7W9KAhIrPJQCvx0CjAbdhbZ6G
	8YyH2XwyIlpENdVrDKF21OmTzqUa7U7LaiggHkOBmLepu2mMWepA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9ua0knt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 03:54:22 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 38RAofKx017625
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 03:54:22 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9ua0knt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 03:54:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Si99L0Cc3xCkaO7xoj6x8stx0Fwr/MV0GJnlgtD/5eL1/2YxCylrF1nrtUQVAdcXgZBJnUFBLTV1sErCXPt309+aZGvpQl1vC7wxSGexNNHItqWFYoJapJl0tGWt9VPKDYHe10jj/kdKduHaYzYVZPjy4ZxgSSWnWkZ2idHXHn3C477zEsuH+7/PWCjiiZwzk5324O6+t9BJjFGF8oMpt36zao81uvs3b5QTU6ylpkgt2/nrUJzn4nXAYfjXCnkHLch4J/qFOB/kQ8woNx7EAdBI9t/U0uVTugBCin9b2rd8Q7O4ZtRDfRly1jANgNxyvG5PslEcsCgh5K0BpYzTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BkHYtP5IFkxMqvbhz8hcI30HaYm6Y7LHlbeA2JegxI=;
 b=cQoikwoQuGpt5YBMwU3KBhdn18c/QGzMJnz0/DTvBNd/B4op2I8JsIr0Lgp6xQTeXf8U0/wpBo5RznJn9OAz9ahiSMH4hBRBphik4uXmLt8SvqMx1dWqJCFAqG/Ihh4Ut/r4caF91FzcjrIVhvYFX+gIwWwdsLsLWVmZmD0ozmc8nFlvpu0Xohi/Zv3yJNHZRvs28lc8GUv/kYxObVwMbcYqvlmVvsVcjzH/7P2dPsdW9RSILS8AT60ZEkfEGDaKmS3nIA6qRjv7VDyDztxarby6CipDz6qiHVWbAOjXx6e7mReTzlV0GktM4ccaWrhQIAVpuJUGJUU4cXRpOkTpkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by CY8PR11MB7730.namprd11.prod.outlook.com (2603:10b6:930:74::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 10:54:20 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d%3]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 10:54:20 +0000
From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com
Subject: [PATCH V2] binutils: stable 2.41 branch updates.
Date: Wed, 27 Sep 2023 03:54:02 -0700
Message-Id: <20230927105402.2901492-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR15CA0004.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::15) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|CY8PR11MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: 55faac43-5b44-45c3-db2b-08dbbf4819f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ifN/CQthkwm4b5uJOoQ2w91pRSR08xcSDWcDvqaa0LRcNIJOEMP26fBQVdtV1I4pIYNIK+yDoQgHT3VW2WRXvejL5zpngr9M4jMGy524RpwdOOBrlNogn+5uBIC1eSOomBzXP4aK0msLXflPdPviiO9WstPoajTXo08QUzIpoKE9+ic5HpPfa1agMMqgyeHX2pS8bzsPx4uFJgLSBkyeYKI2jrekCCPW/rrWPkCRkrt1NfnXvKHBkgiy0Os4SPpAFDK42y5E5313CjFkRN9xOALektylxb0BHFjrE+7UpQjFvKCQaoBr766BUKZDCR1smTm0thuwhNwNPX2roiknknS7GpsmqYCLxeSSOqr3hzRaT6AOOBct+nUHkVBGV4Vo1WUECeauqaa8ul29qWXtNbVvSNbfZctK4exIUqFIcO/0QkDgQ9ubkguUBDHmgFT3XFN7Y3YZFbKOizOQle8TgPYJ/1XDdCMUIpnQckeHjs7fvZVZ9Gq9JzaynKTu6onhzvpRMqhB6LZEWKXUr7P/VFpPksyX9EITBlcsYdP2/itSuMTQPbkUfS+mhIkjy+h9GUiyq5nl5Y5+lJBw1/rxkjtyThHBawXVnbnB8TfbqrxvnFBb+38CgGnVJLvYWPiD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39850400004)(136003)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(478600001)(6506007)(52116002)(6486002)(6666004)(15650500001)(6512007)(83380400001)(1076003)(26005)(2616005)(41300700001)(66946007)(316002)(66556008)(8936002)(4326008)(8676002)(6916009)(5660300002)(66476007)(36756003)(86362001)(38100700002)(2906002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EwmBberHNFVfhQjp6VzN+dATRHJqpnaVoOssGpbiDCIQmwSNPag13ucPPaFp?=
 =?us-ascii?Q?k2SEYvM4PjHR2kfRoHjRGJ5FJzRXmncK/+LkOSW3eZTL+/6mZZotqD5gGuG1?=
 =?us-ascii?Q?4wl5AxjquMNJ1HymojUqrMXmanepVsEOy95290PmdTscgkg1q00lTLAhlHaA?=
 =?us-ascii?Q?3kTJ9AT9VYkldDNu/PrS+ccEstw/xoKCtPFBvm250J1fmQ1Gjh8kuidzOe++?=
 =?us-ascii?Q?ieYtCFzcZpmik6+rd0cUWx2zJI38p/9INh2ZNrFC3/Wk5RQ1mCIkcKurDtgq?=
 =?us-ascii?Q?am9At5tGl1eo/tPlcK66RA5jauXJ9RRVSwfmbzjIPyCgEI62DtGIgafPUEYW?=
 =?us-ascii?Q?jiGoWbTpoBC1REbIGzfD+C8Xpy2WJffrhQir31T0LjnFOA/gtI+6td+2HAcD?=
 =?us-ascii?Q?jjGKcYRJwUWY89eiLIj77Lr9Noyjf71frZfaz314ReYOJtwZElapJVlkM7+v?=
 =?us-ascii?Q?DTt1p9exd8v5uvaSbxJch/GO2T4rPnKmZ9iJPxFKvCC0k40YWa0Qbsqo7j9Z?=
 =?us-ascii?Q?IjrVbR5ctvBfIPzWxG6x4CY6yc4A7sPvMNTtTQNoZr9MR6IiLcy77uhlUHa0?=
 =?us-ascii?Q?LKa6gYlSH7hYomKfaJ2MIOqOEaLhueMWmv9T/mwT2ouGMvsgieekWckG7Oj+?=
 =?us-ascii?Q?41vKUQaZa+cJH4Lr68szqU8TwBGo3bSFFWcBpner1aGovpwefsq9wXxxJEch?=
 =?us-ascii?Q?ZO6hTnU4VfVNY7o6WOGfFZ+IYpfpzj1J5oL8lwypcFZCHCoT5tXBNx0Aq7Dd?=
 =?us-ascii?Q?f+X7JH5NIDBVJNUkfPOKOZF138J13q/1JHqZUCWx+KCRTgbaFPym3NC534rW?=
 =?us-ascii?Q?u9xdzZqeudQ57IjWMEB3JX05jtnXOI9zV1x4HdNKeufgV7JkR1/guEWMHq2K?=
 =?us-ascii?Q?VgnRfZ4sLp7JTOYgnaC5grl+zrwu56op/Es1OmV6PcagEUJPHtBzutGRR2QN?=
 =?us-ascii?Q?59Zh11AO/oydY/mgD2LqNR8qDnTZUnaey6ItsCWx7trwle9vG7sj+R+W1hAj?=
 =?us-ascii?Q?EcGoDz3qgdM2Ul4p4Q6u7AnSnN1kcRL/H36KSyCbfENV+p/GVYzDgN6M0j9Y?=
 =?us-ascii?Q?dt6qcbBe1GKbLrhhtXFi14TJ8freFRKiPnkrywhK3Z/J8ZMatlJu5cD7xV3g?=
 =?us-ascii?Q?hkz/aJzQkZwQfDQzbF3qhU39lUrFMct8HlZfWWICso4zsJVGXWNdkOrVZ5HT?=
 =?us-ascii?Q?UVNtfnn0lFgoByfAOKVIw+h2mqzWOwZ2zBJrr3wCUIvlMXULqSCmiaqpr5WD?=
 =?us-ascii?Q?DyDZ+lTqUbO+LVyZIlWkB4WE08J4SBaFMAtNI3Mjm6Q1jWzsj0bdjvoOeFgz?=
 =?us-ascii?Q?cCKvtRRSLX2kyAQkFO4zvaF3IrXC7sX8dY9qiYZuf99vBPjS87xAVAcXyUaH?=
 =?us-ascii?Q?9EMFUjxnN/bG+KLf9GPSGiS7kr62uQtjm6EqiFpW75NkYplqCweMlYMPczJm?=
 =?us-ascii?Q?nYUrc8rKjBQjhDKbOlbUABFCdJd2POA3ZWFdhEa6OaHgMvK6yvMky43aULiO?=
 =?us-ascii?Q?0hRy7kMrSlVIDb+VJm7cB3MDsN+KB35x0thDpKsccVofi/YhdtmLkzbQH4wm?=
 =?us-ascii?Q?5ovLfiBFUcP+p8g8Ynvi0Emdxg5sQvv1LbzGG8jaUNSagCiQtblKQ5JHOlgX?=
 =?us-ascii?Q?Bw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55faac43-5b44-45c3-db2b-08dbbf4819f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:54:19.7864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEAriz9L/42nKrKymxqTlsOv0IbUpbSnDXZ+9bkb6a9g5k27ilD7XFKQuqGpMp+bUEt3t+TqZa43MUwvl2Rki7ZkjGXnK4O6+ufqvcyNgpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7730
X-Proofpoint-GUID: JkDFGZu-iEPEmMTTXj4Tw4hQX9B1FPPG
X-Proofpoint-ORIG-GUID: gAF2V5U7OVTwL1NCHiv0TGSwaQZ5wltH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_06,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=592 impostorscore=0
 adultscore=0 mlxscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309270090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188304

Below commits on binutils-2.41 stable branch are updated.
cb4c3555ac4 (HEAD -> binutils-2_41-branch, origin/binutils-2_41-branch) Automatic date update in version.in
6ffa5a420a0 aarch64: Remove unused function
b6f6a3ecd15 x86: restrict prefix use with .insn VEX/XOP/EVEX
60834ae1eb7 PR30794, PowerPC gold: internal error in add_output_section_to_load
951a6945b44 Updated Russian translation for the bfd directory
226f2e6b924 PR30724, cygwin ld performance regression since 014a602b86
8c05bf16a51 PR30697, ppc32 mix of local-dynamic and global-dynamic TLS
31b78cc9917 gas: rework timestamp preservation on doc/asconfig.texi

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.41.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.41.inc b/meta/recipes-devtools/binutils/binutils-2.41.inc
index 7ab2926570..b4934c02a8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.41.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.41.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_41-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "fd3cc73ee4a84df3ace3c0e470250a957e7d3468"
+SRCREV ?= "cb4c3555ac4cf8aaf0935cb6e4b09e6882436d21"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.39.0


