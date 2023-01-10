Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83111C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 09:24:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.100034.1673342654657721936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 01:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Qk9xNwiL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03748902d1=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A7Q5gL012844
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 01:24:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=R8M9VEpf/7aR8uWNeMxlCHngVDm1ytPhK2f1y2Xh8bk=;
 b=Qk9xNwiLskkjqBTCPKidnx65RUnRnm8269zhOvVJaRzs7tqBnVTAVyGEVSbAJqj2j6i9
 tdOEq8CSZoDGt9aBD9yj6LSv45+E5V53ggo+0NqBH7xCS2zB8ExMs4nLPyh0xY/Ka0ru
 gQ/nm0twb5VxTVjRlbrPegVJ2owiduL6QA/TZh1wp8BYT8FrOVWMGEUs6xPSegDzsbPp
 +5PENz+i1jl0hpXBLROTbneAuWiBxWXu3DZgns65yMBsrIC1qsqJ4QpBsbmQKFuH+r0Z
 pstwrtmjfeMQRdAzTh4pRNsnYVbJYAjWB7q66OugZyg7lTg7e6Tbxqc72ljrzVnX01lp JQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3my94s29sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 01:24:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZZNgzbTe+NDzbTGfbq2cbQmbkwa5XXTX3JdFw009L1oNpfTAqdr5NatO8XHDtLgNZHSZdvsyAqDGhJlpkxaQRZ4mr7HWL/4GTtGcMDT33UOG1ZTUHcJVYl49txDmeaUP8Vx+mgAKXBJo25atiMev9dn5wxMD02CGw59Eovso4OK2/ipZS7L+tqu8HOO3IEAKHDx5GTqPpScVybnzsVrV8e5lZD0dEXlcSxegrgPc6ilwn343r6AiKjUXSruLt0zs7wuBJlGEmvTt222RBqOOzopZ0HULwduDv3lPjtyE4giUaPK5RbABePEeaSokDA4llnWlbHdwMxNSGJ9p2GBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8M9VEpf/7aR8uWNeMxlCHngVDm1ytPhK2f1y2Xh8bk=;
 b=Hstrbu89Y15TDerhP/xfD3cJw869v/aqGLKKltgndX5nmwK6Aih8EEPrAbOopMsreunJbL87DD6iI0sn3RG8hDCFqGh6vvsiRrNzkiLEuDX4lRX2+BINvlESNOSIBScGOdP0ywqvhPL7RO2pt4LUZvFeWIGBgxpH+tVqrUhHrxdSVcN5/xZjVQjlFPJGztoznb0x7d1dgnQ9NGkq7nMZAybFyFYZhS9yipKTCCdMisRffIRbg7m1F+EzDNqq1y8TD/tqCCBKsgPHb3DlujIVkudD+JnuS4G/bk5E/72kKZpmViuLpJlY4++S0DE7QSGhiXkwS89yLw44xJmlQyUrtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 09:24:10 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%9]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 09:24:09 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libseccomp: fix typo in DESCRIPTION
Date: Tue, 10 Jan 2023 17:23:46 +0800
Message-Id: <20230110092346.30506-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0205.apcprd06.prod.outlook.com
 (2603:1096:4:68::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BN9PR11MB5545:EE_
X-MS-Office365-Filtering-Correlation-Id: 39fe3aa0-3087-4206-54d0-08daf2ec6dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U5TvwngwR0Qcbc93cVK3Rm4OqqVKBgGWvyWsztj4l2I+ypf6uNgQ1YmLpdYDiIwJrvy1pajG7qQpnHxHJG25XiegikudbZl2KtN9rx1kok3g3AVPYaf8p5QOu7NzmrCKsnzYZRtmGPAFhTL8zvBD8DddWz7ufiAoQEW1wnfGWp9LF057TB0UJamcyfZ+6xmNTdcJxVppFIRL+X8pGMQahCQsHoFmNfSvlmCBMvgMA029U4XRNXWVOcQZPFGvoOo96XfEx5YzA/G0oC/uzL0aLkvcr918bhlKR0kDQp9vnOBtccJj+dlxiLPpNr8zNzaGYoccr9CM9X2Z9Ii10CEukm6mb24VgpneRHMbF+BUKoCDNNV/SRnDnSSi9dL7ZjKjdjL/Kd8FAyWpfjwFFZ13athohTV6jNI4L5e1+jilnhh0H9xYBUnnEf34+EGQ6faMSGUNB1VaSvyFZQcQVjulDZXFiirPYpvfPjEGTHW5c5CN/0f3e6898ncVLCWWO4kNfV0A6XHE44NN9eXmCcU0S0tQulDp/zc4A1ESGl9G5k82rQhIAL23utwiwolHgHUTlht01tc4lIjKAcvULQCOvV43LRpUqd01KpcBQVwbI4H5AuNSTJ9McwB7G2icf8GN9OVjpuC1RbpirXqjRT7DRjH/hhIAlf90VxNwgt3Lh3WVlthNVE7JmCRpYiRDo9X0TM7RW52oKEK0czbNnpFaaPpQGNrYkdW0VZU0OgeY2qU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(366004)(376002)(346002)(136003)(451199015)(66476007)(8676002)(6916009)(66946007)(316002)(66556008)(52116002)(4744005)(2906002)(8936002)(5660300002)(41300700001)(86362001)(478600001)(83380400001)(6666004)(6486002)(6506007)(1076003)(38100700002)(26005)(2616005)(6512007)(186003)(38350700002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xZb2hEEUUInMwZfb1hCaTztTOWEJ1Z4KTRFmo/dGK6/sXcxzdncNKTkepbGO?=
 =?us-ascii?Q?Td6f0vDix83XMHdcMgZMngZ4ApLTEJG5yyEVK6R14AI4DOgwAtnWOlj3VvLV?=
 =?us-ascii?Q?ZcSQtYKVJ29gqgrbKUe4Jhe3f/lL92XSDbV+N4bVXnJHkJHe0lYgzcDApZVE?=
 =?us-ascii?Q?2O0l1e8rcO3kRfUF93GpBIgR/QLURaxwdfpmr2anAlUBvnFxlEUPivSEgD0O?=
 =?us-ascii?Q?6nackQQq6Xl+Nm4qW+r82iXhRXwuQkYfUYuFm/F3MI3ttotPK0cka4H4OB06?=
 =?us-ascii?Q?kTjI4/v5t0y90kSNbUZ+gCXFcR4SOORjirf6OMIfROvS1v1WUlEMPLy7fMm4?=
 =?us-ascii?Q?aT2fdmfOCaoWDL5nGEfLURejFwglN3lO3ZT7FPzqcNdHGVCA1Bp6fs8neXZX?=
 =?us-ascii?Q?2q/gAidjitCGy0Ht3Qhv0tci5LzHr0He6aSTH6icBzXJvnsc+dpSyygJ/fn3?=
 =?us-ascii?Q?YzCrX7/5CmtB7e5b/WOFF5dgMKTgJKfgmF/MJ8Rhh2GGJxC2Z/+5Ql2p6d4Y?=
 =?us-ascii?Q?HWilpDMjcppKOv/HzRPdQjWk0M6Y2SeoRCLFBf90qq/1iznRgkv/ILk2Y6Jc?=
 =?us-ascii?Q?IG1uEyRTWZtofnS6YOctCdVNa8OtuIhsvrisfC8seRtBaFVwpEvfBJzU+oHA?=
 =?us-ascii?Q?R+63Fa4zc7w8mMALNIExsoyYtBRGgdCN63+YLKmZthSmUK22Mgb6s7iRHwok?=
 =?us-ascii?Q?UDW1u0lgEp+IyGIjwvLpqYPk0RTcTOtrr9+XXJPLMyT7u+ZbNP9dMlK5i0kP?=
 =?us-ascii?Q?b8SY2NRE2JgG45jNupD3cOOncjN5jbOXHY6IHZwi2mJY79rlXzxuCxJWQ4JA?=
 =?us-ascii?Q?/B61KPy6G3YnGZGOISGq0Z9LAURPWrAfPwf2q/zjXjTOqDaOn0Qeihw3NVo6?=
 =?us-ascii?Q?HQrSa+aaOeP/A83y13vAGpjeRUDNG7xo+C7ij+7hO3T6P5MdKJx3phm30ZnZ?=
 =?us-ascii?Q?5GDz5wZ0FVH+B+CdAAROOvAeUHNxnrOoSlEoX6XcRi6UpU8hKoqijP45aKg2?=
 =?us-ascii?Q?n287BJYaZju4kUJZPnw0DF4fji658L2WAI+b9btz+V+VCW+KCjfCspZmCyA2?=
 =?us-ascii?Q?S6jxldKt4zvzSf1azHDdu5c5H4ZyCtfTPbtPMG/E4DVmkAOIaq3+8Jhys2to?=
 =?us-ascii?Q?XCYMs1b/yRp4M/ip9XxD7KHoH8fpTaB+Wm5Q4oxBekkDSSkfdAdwK5rAQ4cU?=
 =?us-ascii?Q?XLkRW2tPRoXFjp4JU1MUHacdZN9Vr/Sq2GqBAk6vBI5S6190OsrgTbJ8ftam?=
 =?us-ascii?Q?op36/+opGnyuXcC6d2Lt1TI81jhWpSO2zl8SwOunxtiA5lmKnxuFUQD62Mnh?=
 =?us-ascii?Q?2+Q43kQg7Vy6XYAnJswSAKtiW5jDX0zF1/AFW2vFhPc/V13RvqsfWVKN27Od?=
 =?us-ascii?Q?5ZQYrGRBr2BVev5/4RbyMzP101vyAPNTYMXxbUPKDP197FwWT4w8syUhbNL7?=
 =?us-ascii?Q?yYhpBPM/zbHfFAS85/RwAg0HKt8Yj6c6iOqQTYtNHkru8u5TBM7e5OjY0ins?=
 =?us-ascii?Q?V46u01MXBV0tfisdhlJshQ5uGkSZ5ovHDl5ZF8SsazzkXfpAExdFHAW7pST6?=
 =?us-ascii?Q?IE2zEGPffe1aDfE56Bq2AmWx/l6OgwnEJhiRGLla?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fe3aa0-3087-4206-54d0-08daf2ec6dc0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 09:24:09.6996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYWA6D+oT6nDW6fsHTkT3WSGjxOMW8woplIIwfRu8DsKNkDKSCBMesjcWT5G3O3+XUJDEWjC9FVIDId1rWtnCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5545
X-Proofpoint-GUID: wrfy3mr_WHHKvwPoYfyJNMQKb15D9Tiy
X-Proofpoint-ORIG-GUID: wrfy3mr_WHHKvwPoYfyJNMQKb15D9Tiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_02,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=709 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301100055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 09:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175710

Fix typo in DESCRIPTION: and -> an.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/libseccomp/libseccomp_2.5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
index e89b8f7f4b..505c21917b 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "interface to seccomp filtering mechanism"
-DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
+DESCRIPTION = "The libseccomp library provides an easy to use, platform independent, interface to the Linux Kernel's syscall filtering mechanism: seccomp."
 HOMEPAGE = "https://github.com/seccomp/libseccomp"
 SECTION = "security"
 LICENSE = "LGPL-2.1-only"
-- 
2.17.1


