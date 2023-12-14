Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B317FC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 11:30:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19868.1702553405442064265
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 03:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=k3DlPB6f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0712d23c2b=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE5PFPx032110
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 11:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=+t//Bhbvx12wfGL/+A
	ayq1Vd4QalA84B1IHw2heW5aE=; b=k3DlPB6fWj21CbO3uwOFIoyDar07nsaCBr
	UdctzTk2EufrfHJdMeB9+jJUApPVz8Hw5FzqzK9nxTQBDrPjkykBfynVE5QSEbMJ
	SZjBMWW6bcq2xWJja0cyN3KOscTDY6kcvVoXmSbCcNrbYobGDAffHo1OtPpFi43e
	2Zofku93RQ8AN7ZlEgJXjKHyqCrce95eL4OXjnbpU1bqbDLnh6g+6C3Q1pnAIB7q
	QrXiP37dC2pX7pZuCdDg0+uhYrJxQ8EKjye2gmzwBQBqN8w1MYtjj91nScb6YVcz
	fVqWDckdxK92RnciWyk5HjpIL7SDxOqAmze+CYHBZnC9CXvsz7zQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyrcqrc16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 11:30:04 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BEBU4j9017644
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 11:30:04 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyrcqrc14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 11:30:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRX3GCK7Y04TXS8WB1epFnHLAX3Ic9djyGBahwA6J7c/O2qey6DsbswBNIZjVpQk3nRwdEKxI536SJ7YZkbpzd3AchxbKMk4N+mqicORxiSp37n1FBw1w4FWIduZlaa3zulbjc0h6WiXrQC0rR6PnY83jZD2GhKPB+mI2vVux7/maJqmNCS8org8uLcSiIjuFsAChoLghmFyVAm7FSvddcDtmdabP2Qd/U7O9ixKuIDI1Zvfti2J7S71I+BtNK70VfpRPy9fy8IrUewp+2Xj27CkHK1hr4t3BpPwcfLxTuv6crEE/cq727g9Qoljof28l/1UzXAhzOFOVv9Jha9zzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+t//Bhbvx12wfGL/+Aayq1Vd4QalA84B1IHw2heW5aE=;
 b=k4DWCqjbh4I+PapKWoAAcnyWnjS1SQeIbfvWZ+tR1HX6iEa1auWLURyiMR2CmNAS4zWbfK0UVniWAhjX5CK2f4XS3nz1siFcSOmnmcu3SKhr3zQ3c7xydUdgADHk/ToylwQuQHgek2QAEZUwH3WacgLF9f5Spl2PPMt+1/P/PIAEpp9MVQqwrVg2wem67s22oYE3Z5pm9lyE4z3xioPWTS590L7hHRPcYgrdEb8lPpLRWCORssA3jbzAGtgK/+Qj74CqN5Ae2xCbUzLPQaZM0xnEr2qnEJLmIEQKLvXSvMl4HC4T7pRL0buvn5k6D/AlT5KnY28HVs9zu45u9cF/Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 11:30:02 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40%3]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 11:30:01 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, umesh.kallapa@windriver.com,
        steve@sakoman.com
Subject: [nanbield][PATCH] glibc: stable 2.38 branch updates
Date: Thu, 14 Dec 2023 03:29:40 -0800
Message-ID: <20231214112940.3809874-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::21) To CH2PR11MB4470.namprd11.prod.outlook.com
 (2603:10b6:610:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR11MB4470:EE_|CH3PR11MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: cc02431c-e69b-4c9c-d154-08dbfc9801b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VVQ1RKnfkEQIEGEJp4JChyVAJe5rIU2PVjBk6fLioByj6wbIcmozyyW7/0aogUn13NtPDcWAbxs9NXv7vm6wbzSgqnll4/N5q20x6nk8Na9cfqW/Ni3ayLqsbT9KTKT4wwYAK3Mr2+v0zgLsomvg+ipdzDJL25l0qgUGz7VvrkMeaGghprm4ULhMdWF569B1pScWiLqZ/t9IXiSY3LPk+g7qttihEhl0sepO1omkwZpB0tibvH+V6tnamdcyHF+yqeuqbXJjB3UeItx/DBT7yTDlh7mWsF+QMAWwsw6iyRYNuYje9Wc3eFChgVeQWT8JDl9BSp+TuGh4J4QP605YZjRDRRDIP4Gu8Ent1NiFgaHWfpUtrMY/PtBfcENs3fonjPtC+EyuJvgh/7DT804sIvDGabCU8tF38AG1CsSfJwLf0QN0sVEBieV8R+dTScT3lfBCbrF0bZn2prGmq989NM8Q+zTHGmg9/f7E7gxPR5spU16Dfb9M96PxNdvXE+JZG88khVAlhG6tr93gZIxDfwF9zXv7v9BzM6pw2gY7dmAmIoG7PucDEnkCWR/AhC/M66dy+IHgWda4fnn4zyOhke3pX9EmGMgn7o42WVtSd3D5KWL3/i6Bu/hTkegaIugJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39850400004)(366004)(346002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(26005)(83380400001)(6506007)(52116002)(1076003)(9686003)(2616005)(6512007)(38100700002)(6486002)(4326008)(8936002)(8676002)(41300700001)(15650500001)(2906002)(5660300002)(6666004)(478600001)(316002)(66556008)(66476007)(6916009)(66946007)(36756003)(86362001)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4g98zLRYBH6sAd8VohKw8Ir/+o0DWekerWfSUH1rMHujZ5gn50LfOnck+uaF?=
 =?us-ascii?Q?C+clCXWFwQegWTDlJLw9+kd4AHmYiKbCKSnduoTFgJU4zJovfBP7i/63+kur?=
 =?us-ascii?Q?0udMfD+psuIq7RkbyL2BsrHWK63OJYv4yOPOAs82UDxJAsrrSUooNic5yw98?=
 =?us-ascii?Q?bjuS7nBmFvAMsi+y0Pp78FifliGxEc8t7Lg4thX/GZ/6EAZ5N/StKVwi7QB7?=
 =?us-ascii?Q?+/aY5QBvEqbHljGZ9/3cQnVzsEF4TEDoi7ix4jHP/qktwpHFqd2KUyKynwrl?=
 =?us-ascii?Q?hATdoypV62lp5wdBw99hnpWNiZo0L+V/d7zVFcYPGcbr59rAZhdqJQRrzp6E?=
 =?us-ascii?Q?uc0roTWTXc/pPb1zpWbUJUtJsyKDUUPdAE14Xh7MZ53CmLIICrlHz7IR2lnH?=
 =?us-ascii?Q?tcEum4yMrnI8t90zl3KHTdcFhazjr6AvWRHYDyI/zu8SN8+kHJgEhK5o0P8q?=
 =?us-ascii?Q?cJAE4ndeVP1LadkH5ebpx8aQX/oyWqqXmLQytiw+CPu2BcQaCo9xVZpn2ggR?=
 =?us-ascii?Q?lGY/qwlPsD+vTvfD+1CtQQ75dfZQ8+C3Y5unGVemdbP9/Lswnu0nSK+GFsbz?=
 =?us-ascii?Q?iNCJnr2BOSwQHPf1X0iTJ8S0bCf/6f/1j/n6O9wuO5dKPwJ6ST1WEf9TOyrb?=
 =?us-ascii?Q?vyuQQ4n846Ge3wLEEmxMmiVK6dIcseS6FNc5p8/JB9OACSt1mKYz3xMJtN53?=
 =?us-ascii?Q?n3t8qjfGJdkDno8zyxK4NbhIEjckqOkWaWUOWrQc+v0BB7/jU5Zn0rALUCsp?=
 =?us-ascii?Q?K/sppjw1pdoilCkOJWqmTDn0J4r3KyJkvDdfV2IacicZqCMHWAq7R1fx3qya?=
 =?us-ascii?Q?+KMF0IJfXJ5JAnqVz6dt6xiDcKybpIumM7O5mV3AawMJO4R2K0jo/jCvUYya?=
 =?us-ascii?Q?rrF/dBKaQYiSPeVOq3Ztv2UId3dGz9Rogo3zGU6r+WgcVoR4GcsAY0Qd6xfs?=
 =?us-ascii?Q?HiBlzv5a4M4nhY00mHq90e5p3xZFiUZBFj8TVN815IGEgipg5h1QETMf09JG?=
 =?us-ascii?Q?PwLbzN4eyP+DFRauE5Z5ddWkDmZOWEr1ZuWbUH3kpJ4DyzPNoHx1TujnrJrH?=
 =?us-ascii?Q?yx0sjGC1FfCwFfL6OT6jgRS3zLGG1EP611WFn1jDOrPBHjJJh3/eoD6ZeWV4?=
 =?us-ascii?Q?gbQq15GhFhOXtFyI+hkExSH5+7unJOb8SLPgsLryGZH14myfDq6qUAgVD16w?=
 =?us-ascii?Q?nVGBKYUqhhnjYRTZPYQg+5z5y4VziSMJ+/QfFXVfhYigmkCkGq+BOdzL0Dc3?=
 =?us-ascii?Q?gHnFon5Yr9FZWjbkc6ZKHUenxIUcof9B11EVVsGoPc9up8oq5OcP0ucQxib8?=
 =?us-ascii?Q?eIHVY+FyVhc5a/bnBHbVM561bbZScf4Uh4Q18hw/PRUGFzzSP6zYym9vTygJ?=
 =?us-ascii?Q?6c3Qf1vk75MCTNUbwwY2nzqhJmt1Kz2DPVSq9066nbAnZowbF1ulrcG/hp75?=
 =?us-ascii?Q?Je6xYlWrUf7uO0417kY48aPjc5n60Z/zBGnavhtVBN80ti47Cc7M+2Jbm8Cm?=
 =?us-ascii?Q?ULaEt4mtNQBqLUV0SKZg/cVBu9C/GH4evHh2oiaYKnvT6uaw5q1a+T6WlYN5?=
 =?us-ascii?Q?AEBPn+Hdoz24IoDGq2XV5BYRCrFoveJZrU8ZmdwTUCyYKzrndrbntiBHCRLs?=
 =?us-ascii?Q?DdV3QCvmXgCZG6Fd2rR4fS4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc02431c-e69b-4c9c-d154-08dbfc9801b8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 11:29:59.9670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGyikNe1Bp+DnJRgFLkakf5NNiJFKRgitvAhhxOYmOb7QVTd+ZoS6qBNSPrG8ithXKxDPPXFVpOVPqe/RPgenqr7kkHvweiOzJulnuVydFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
X-Proofpoint-ORIG-GUID: 1amdzdZmfI-A-pJx_lIqlPtow0SXyeYk
X-Proofpoint-GUID: bGalwfujh2vkd25Hwo7JtUiIrUy3LzqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=872 impostorscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 11:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192354

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Below commits on glibc-2.38 stable branch are updated.
44f757a636 LoongArch: Delete excessively allocated memory.
bf5aa419cb elf: Fix wrong break removal from 8ee878592c
63dbbc5c52 sysdeps: sem_open: Clear O_CREAT when semaphore file is expected to exist [BZ #30789]
1e04dcec49 Revert "elf: Move l_init_called_next to old place of l_text_end in link map"
719866ab2f Revert "elf: Always call destructors in reverse constructor order (bug 30785)"
e0b6c9706c Revert "elf: Remove unused l_text_end field from struct link_map"

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 19b98bc11a..0ef4289557 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.38/master"
 PV = "2.38+git"
-SRCREV_glibc ?= "750a45a783906a19591fb8ff6b7841470f1f5701"
+SRCREV_glibc ?= "44f757a6364a546359809d48c76b3debd26e77d4"
 SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.42.0


