Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5ABC0218A
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 04:06:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.80663.1738555589548593533
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Feb 2025 20:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=412918e977=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5133bUWY016771
	for <openembedded-core@lists.openembedded.org>; Sun, 2 Feb 2025 20:06:29 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hfs8h5xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 20:06:28 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51346S08025721
	for <openembedded-core@lists.openembedded.org>; Sun, 2 Feb 2025 20:06:28 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hfs8h5xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Feb 2025 20:06:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkSjEGCfbYRN2XlGO5BXEGpgqdurOr1DoUk5UaECNubrGAq28vf1E5bC+F2GbDBky0CdBRufL3+gfdeItrji8Fg3IcQmuPCkbz7hCxqFbcunVZwQJxrV1jJlio8CftslwA5ErF7RR1JRMP7nvW0NYJ1ajJPlx7jtGOTxEpu/pDphO1bnR+i+hwbziRR9rvWyBfLzShengqH7IrXL7kUrJBuTe6oiGhEQiaP9Yw/rLK0lGKiNfnqdBr1xbKl0uB7L5bEwNGJhZiDLabV+zxvMhxlQooVdpYHtvRS++uebKQABQiLVJBAOLxrUJQ56iS5QIbQ1YQi4n7/E3wrCnPFvXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=up4bqn+qXP6BCAfVhlYrzddDdi2yrrKchZtJu6L1Mp8=;
 b=SoNgCeITC0egCUVQqKLf/1ZfVCkodKdgKD0vSs1p5GkL91ECAN/vFHrghYx64P4kC+1A4/+SPxkspS9+DwrrmOcrmm67j/+z0YuNlFc6vK57PWbyChu9ScT5MvXvB8sJ1sI6obbl49qIH1LJQe0ktJhtn1tAizY7Mt42FC9P2eC+T7JBUAi+Yx6lr0ZbeZGqggqwxyMsp2lkrOw90579nZokGiYQ1ZiRoQ3ckYslyfyZf0dHPv63mGpfCA1p9EavidAITjec1YsmtjK3FbDbKShWJ7MFaolQE44FYZA9mIubUkJXyT3WidII0tuStKcomJPKleQMNWCTEj62zdqiCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MW3PR11MB4700.namprd11.prod.outlook.com (2603:10b6:303:2d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 04:06:24 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 04:06:24 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        steve@sakoman.com
Subject: [scarthgap][PATCH] binutils: stable 2.42 branch update
Date: Sun,  2 Feb 2025 20:06:08 -0800
Message-ID: <20250203040608.2647582-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::19) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MW3PR11MB4700:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e107a3-d041-4135-de07-08dd44081fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?92SCYmWBO060FM0pRmk4HAKYo8oGQUGBbmk7cyB/Se817j8HmX/haJlPgJ2w?=
 =?us-ascii?Q?RVRb3+WyYOAYQNskZxJO3cfh0ZzOhZvii0Dw2UeOFLvVeiHcjLU9qkcuuo4h?=
 =?us-ascii?Q?VQ8sG/ActFxn8tqu1LK8xoJxvs9QNZtaTCLx5CxhwTbqG3lds1e6i68413g7?=
 =?us-ascii?Q?YXIDktdRcFw0HVT60a7fCsa3w+K6EpGCVUUdopisgxXweqE0IY8DKoA4bdZs?=
 =?us-ascii?Q?NBOjyhFB0/44WfC6vHlB+rz0kWy04VX/Z4kcb3j/XCnYgpMGnz2KKezXmfwS?=
 =?us-ascii?Q?DoSASFTG7WWQ0yu+rbz7W3vy7slYnwJmpplUCcsx+2j47+NR7QN5wMyPujCA?=
 =?us-ascii?Q?CoIOA+J0pmaxdv8u0Sl3CrByOE5gJN3jbaWQ2ABYH5DvpA0uOTuARale9Bqq?=
 =?us-ascii?Q?4W3qQAqieYIphZb2srRG1WKumXQGP25sv+SP+d1mdpb+UX5Tzq8yVeDVZNzl?=
 =?us-ascii?Q?4y/i0OtZfflst6eDVyI397Ye6VNZLOqV8R6V0I7Vju750S9QcOuBYGGNTalJ?=
 =?us-ascii?Q?La4zTCZ70tG2qhjt5a/cUnetK8kWhu+MDb/PG7qonS9T0TfbqtwApPIeMsBc?=
 =?us-ascii?Q?ev9EzdXyJJoWYuWh0p3Y3FEYk663VPfl/6fZgTPlytW3UroYIo1I8no7SN+9?=
 =?us-ascii?Q?ctujPp6+V1l1Jjlq02bUrpIDqL+t90Poy4Yvu4uKsNAz5D8TyLor4ZN+xHJz?=
 =?us-ascii?Q?ZCUCKU1dePKbVDG9zz5NodeLZk0JK0NPKAamnwrOVvryd0lIePo+cf4B0IOd?=
 =?us-ascii?Q?oaJLN8JxqWDchhWeZOeC88gHooZTAxw60gLxOyzout4QjIcjCoWXRVievEJN?=
 =?us-ascii?Q?y+aovOihpb7Tp5JMpELXHafSRmyDRCdDWNuYVpNq02WMCRs5t3+bbSMj1DjU?=
 =?us-ascii?Q?Ho9FwLttgkzcipJ/nSBDxkqxpdGU2uqJQh4gBLw6Qb5fDJPfP7tbUkpzvfPi?=
 =?us-ascii?Q?x+EuiVUz7wIcKSJKJbcCSDnVszsHrplhY7GCo6ZAp7hAqN718Lvg+ui/kZej?=
 =?us-ascii?Q?m3chBHxHl17Yjf1qPjgXe5W+lM1eLcsgNP6kXjDiglc7zUDrEAsN+NzjSuXS?=
 =?us-ascii?Q?J0+cdPQbh2UAbePUYbuZUkblbzWm2oQvmIFlTCXT3bwld1WqjHDpZfLDnpXs?=
 =?us-ascii?Q?LYLxZP6BDK4aawkbiGZteS6mNmtTVff7VNn6YnEHBgWDzJw1lHtj9RilST5H?=
 =?us-ascii?Q?VeocwW/vJIlg4SCdVQJmeqiHYkMhBBe6q3HBOe0YnLVAuvVkJlybkvR++VzN?=
 =?us-ascii?Q?oikitU1euaQxYe6i5KcKLXn8z/+ntR3HyZLfevpGQub4TA1Xy7UCk2qWzsVW?=
 =?us-ascii?Q?4MJRV5MfRa5QUDFLbX+OBrMx5l3Cna/X7R8u+hnKgfZJZrVpoJY6eoNWaZXU?=
 =?us-ascii?Q?VRjKfHoz+NIvsek+cC8210FcreLkl9JuZIWWmepcM8l3NZXvb+sWfHyonC86?=
 =?us-ascii?Q?rkg9LzhU6r26IAadtojSuMJKl+67S8I5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?brIBmNBHWpIjntv9spqJaxII427diRS4l/lttZRez1EYRcMMkbnlCq7ETo3Y?=
 =?us-ascii?Q?rT+h733TLZDHhoLCQ4ltDYk3H6pxZAygA/Vcs0G9ZNAnsru7KwaAB8LkazB/?=
 =?us-ascii?Q?JhBBgUKyoygZI22rG6hCXnY9lNYSpW0+EyAYT3w/5IGtQqyVqpgFUmGaZgV9?=
 =?us-ascii?Q?EQgzTw67+NhYgOfz+xkfgjPBE8LKCuNMKZibMyEjUTYjj1+v+AvCwM/tBYww?=
 =?us-ascii?Q?AOBIzCM63MXgDlgTjP5mMEoFWOf9wJFQkRAmhTInSNvD0tjoso+ki7MsQEQw?=
 =?us-ascii?Q?4FqBAQNDG2mXAryfWzvCn0FWmTrdN/uptuaQnZaTXwVweFm4RmU3q4YJGIvT?=
 =?us-ascii?Q?lwBT4Fa0xcCuxptkQ4o7sllJdr0F9QgpfKcdmdCQm3RmvhS5oo/OIymCSeuK?=
 =?us-ascii?Q?nu7uNkiqxdeLpe607f8+d1a3v98ZGuomlzCFJF8B5AGfuOdQpbb9JfRS6aIR?=
 =?us-ascii?Q?VPaccG8AchQ2kzufVe8EkZVc0T3e80nLef0ydtOvF+bq5q8v+X38fLMd7OCy?=
 =?us-ascii?Q?GupqNJgql16KRatahBG0igXOxJ41lYP+kqoNe4sU+w0oP9nuAdi08gX5SEUW?=
 =?us-ascii?Q?gbvhg1T/wEaXFlzk2Ho3hbHqOvTAdBHqinjWyQUnwQ24Mn88yoYleVFpuGnb?=
 =?us-ascii?Q?ooZ1//h/lBip6IEL0M/qcof7/PwrdiN78TriUBIWHJpyfUxtocCw4g+VHORn?=
 =?us-ascii?Q?XFurxKblr+7qY2WeBA4cGOuTPFhxmNc9udH8zY4f2f8wLXMIacgi9Gfmrk0P?=
 =?us-ascii?Q?sZclQaeutmMV3e3chZ6NzthhXELF0sYJcy92m5u9VxaKGfZymHno6X74ws9k?=
 =?us-ascii?Q?om58VA761+D/a4bwaPLPDqyzBD/mfudL+WJE+XvfRM7+DGW23An77HY5tB89?=
 =?us-ascii?Q?3GzH3dnsizg159CghgUh9acN+ohS+68GVOcEW4IVgGlFoepFKBoXyMGr4eYQ?=
 =?us-ascii?Q?qqApR/M3y8V28tcKCktWaCtqikMAIvehJnE1NtVq5OdOP/mcoZS3RVukCIx3?=
 =?us-ascii?Q?vPc0NidI+1+n5qRUqEywD7PwkdkHqRaY4kd5HOnDhnlPpqXZkoUIgEUhidlr?=
 =?us-ascii?Q?Z8I+qoBS0bQwTTEuCsT0ZwB5/gaIY+RhC5XA6YY4rPJV1V0vydfPFXuLJhaB?=
 =?us-ascii?Q?TuzpfdDj4cujhSVKk4qAwj/FpTi2B0gi5rFgiKuVYvD/u2eWxMBQ+0Cp41AN?=
 =?us-ascii?Q?neGXcK++9dcasj1AJGDX0fdJbiYQdPe4fCWINksAWpGaFCmsUXVe+3myv538?=
 =?us-ascii?Q?MJpXfz3jTk2D9l74uSrq/yev4AMw2WoA6SvYOGp80eqmyWTX8W3KVq9SXo1s?=
 =?us-ascii?Q?77fR9pcGBkihBsV0pYvoOP7T02YJLl2bTh31cyqNiq13Z00qnkA5mXGnV0Tk?=
 =?us-ascii?Q?oaoyJ5UtsXa+OkUjVJXPv8eFzxUCTUcD+QsTCYpS9WbMbU95oUO9yuwmw1ov?=
 =?us-ascii?Q?Wzh08SI/BHsZxOWdSITPeceBovDUfOcg3+mAI4OmhsWMWLNe19jc5vCNEZH6?=
 =?us-ascii?Q?fJHBStojyXRVmcFY1nEHkOii0TBBqBfhKI2HUxf27oorHJzj3JJ2PrMmZvWq?=
 =?us-ascii?Q?gRctXPQ2UOunvcqj0p6UKuYeIFv09lbkhA+RLJ96/0UBgFs9Zeali/nHpgYY?=
 =?us-ascii?Q?fv66AKnJZYeMhDG4Bojm1ZQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e107a3-d041-4135-de07-08dd44081fdf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 04:06:24.2720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tPnm5P4mEn+y0TdTCRa9TNckcSB/LLZFXH4vCjW06YQIlfT834HAj0k8Bqst0C13emM0JskwFre47BO4H9y/4Lto+owkrGCsU1+ePheEEbcA0kqCeixul16aXUxOnXb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4700
X-Authority-Analysis: v=2.4 cv=JrcLrN4C c=1 sm=1 tr=0 ts=67a040c4 cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=WyqX61epEs_fYRVEAk8A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: iF8_4xMPqSwD_jVwHNPWUoOwDzNRdMpG
X-Proofpoint-GUID: 2YuLWPjeOKXs1WJXWsjGlRb1WFrYE7xU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=750 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502030033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 04:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210629

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on binutils-2.42 stable branch are updated.
758a2290dbd PR32387 ppc64 TLS optimization bug with -fno-plt code
ed489bf1574 s390: Add arch15 Concurrent-Functions Facility insns
64e8e16a906 s390: Add arch15 instruction names

Tested on qemux86_64.
There were no additional PASS or FAIL after the update

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 41ed39632d..3784d26f48 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "09ba78f051319e8f8861b26fb9340e21ca973c70"
+SRCREV ?= "758a2290dbdf0d6d6c148c6cf25b2bcfd7a5b84f"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0


