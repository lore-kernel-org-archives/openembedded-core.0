Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39453C001DB
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 06:53:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6204.1691131977016841058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 23:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kdQQEb0B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=758018d6cc=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3746TjK2022112
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Aug 2023 06:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=V26T1YdxwU0T1KqWJC
	6I4fZpdXmZ6bUOtpFnlNgxs2A=; b=kdQQEb0BMXT2X+jd6h8idxgNzfKSB3popt
	hrR+l2LJwQIX1nDAa7RuVyD3KcyqJKoVXpckqxIGcXN+w9LFtHzU9eFzBwz8KTPn
	VfL7Vr/neW8GhtcK81haUfe1yGfWZrknXL0VC9/m978NSlnay0HsZXv1tcR3NdwW
	9LhpfxKTGzaKzG2v/BRX9BKvt9j1ruoGdHOwcExjehBASwWNTe40D4ZDKa7W4M9x
	mHH9OwkCsa6bib+ixKPDx9wAJS4GoxvqY310EJpw1PxLHN+WGTxIQ8+UfczGKBIy
	2TUGms3XtW8N158OZINPnfQ8H5OGylQGu6VdiMKNVLZZFmy30Cqw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4sr65kbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 06:52:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdO3RES87XHQsLSN+eWgzs43PWBMQSiNwM624MgVeQvQ8MQG20IeoXfrjsSCLHX8ZvOCEc//jY9uJ+Ar4TetbwVjJEHqrvOz1s1FtFgkLEgp+8bSfAT5bulcpvBXZU6T0FXKWOzvVXvBkuitSvN0dHNtQpu1Owe+viDq5qsz8F9ixCkVIEeYmHyJFoMzeaOp97qtO+DbuEqn1BPJNpNj4kjcXikmWeUzXs3K0ErIvUknhx7XfSoKXMFeHcYI5kCjbk3izLB3jR666Sy5gNi239M68NGYFkreCgD39YC7KPiI87FjS8ME5N1rLh3tlrAf32Ai4dcrisx8Og+clFKxFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V26T1YdxwU0T1KqWJC6I4fZpdXmZ6bUOtpFnlNgxs2A=;
 b=SgwtrWpA5lxvxA8hrw8rqYoKQzSv76D4Nhm20yVzNq0+Ks+4+sfJFSZViyA//sQKCsG7M1qRhldn/rg6AOwwiQr9V7v3mhayDsbKr1ZhLwXYNo4wK5QV2Z+Ov5FbljG274fT4cxGiEeKG4h7pQo+9xrcSDQV1tdVieVI3wuD2JhbDBQGMgQeUiuqJSTs+UN7d8DYV0EbOTmNIs2hcLXVCUa0iCXRQjQ5DctQuCQfndHCW8CtecYNm/nRoVtCCeq1q48fAKroGP2BhmuXSMoQqEoqyPeJFFOdxRcY+07ODFiI0Bqdbm19qm02/xTyuDqN2Qr9RjkCA3s7AGnnPua6pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 06:52:52 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:52:51 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Yash.Shinde@windriver.com
Subject: [PATCH v2] oeqa/selftest/glibc: Add elapsed time for glibc test report.
Date: Thu,  3 Aug 2023 23:52:36 -0700
Message-Id: <20230804065236.1373506-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CY8PR11MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: cc29d5bd-7825-403f-71e9-08db94b76bd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bR6TeTaLLWvPhP1vaQnE15w42BoEIFVMMpAxIWEAuIuunep2Y0Di162/zBFjZ8yfHpB0EqIdehNzGO4flEYtb8cqffErOQ+TzF7oZIrcSDoKMphcCe++tKeZhDzUKb10Xmjn6kxyGr5tS+92x+1/dXhiSanxRvW5tJT3R4tul4udOSwj7ez4P7b4Bdm+JNnDtbdVX5YKydyf9Gzhe+uUsODIagEGRLVIuGNsGMShHLbbUBxTXWudRw7XCSzK5o0e56BZkI3t+vgUBhdIFald2G/50CmZD0K/ta8bscm5/sb9pakIZAzJ3F1YAM4jnSjcn9bYjEZgx4IMqaH7MD2UUpx3zjT1g97Y1w5DAo3/q+/++qcOaa61Uh5Po4FTkNT6hVXRnT2HqJbzGJTIcIxO5XLnCyOS23KqSXj0BvmWxR4r54ILytNo6XjBIjCsy65sZNVapT4kNhQqsH0SsWmQs0VtvP34vLHCBjlVNsXCi0zyctK5TbusaOtAxvrnyJDyYjGBWQtUT4Zg5+MM9NzqYH+N/g8UAvrr4Rlv4/lTVruH8YXsfNFSxjhrDjoyPcG/3BfpZoS4v5JdJJygdAB4GyEsMJ5nwd9O7NT8qyQwCALaAo57dqUABSGcIZt3RQgA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(366004)(39850400004)(451199021)(1800799003)(186006)(52116002)(1076003)(2616005)(107886003)(6506007)(83380400001)(26005)(8936002)(41300700001)(9686003)(2906002)(6916009)(66946007)(5660300002)(66556008)(66476007)(316002)(4326008)(8676002)(6486002)(6512007)(6666004)(478600001)(38350700002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VIio6l2O0YmK/SuUWd1j2CnXezszzB4yQI1+bGGUC6OX6BFySP5WKkZedQiy?=
 =?us-ascii?Q?1t8gaawQ4TOlW2084E/QEHY5TLrtTymENEQ1eP+t2YIcTxUkxUezAq39TV6Q?=
 =?us-ascii?Q?IRsXzn8FOmTi9ReEVIqPckrIwKafU3KwemUEUF5FTiuW5xrocGtwiqOyc6IP?=
 =?us-ascii?Q?Rq8OCT4BuS1Y58c6A/1AQZsUQ7oWYZwNcRN2+TwZE9A3fZ51vcIUJ+w9qY4N?=
 =?us-ascii?Q?MU6fiFXX8ZEOB+Bx7c51ORzFImcw2jhdlk/HJoSZm40SY5/RHnjjtDbxcIFg?=
 =?us-ascii?Q?IpU/yyODf0lWbPdRdqEzc8XpppZTQJuybEHyVKQCegGfe+uA6fGsOevFXkMi?=
 =?us-ascii?Q?rKwzsgXYvNl803iJINdBzZUvp5DC2StDPFj9S9+YT3tHLFJDn4MufnRdsE/a?=
 =?us-ascii?Q?XHCI/0bPUfEWxl2C2SI2ct6U3+34YM/D4FSCQb00HPU7buciLMkBInL93aCi?=
 =?us-ascii?Q?ePWqrMHhqcv0Yz4BjLf8FNfod5izs187QfKuNzNbOG+nzbUhayFGSlfEdwBT?=
 =?us-ascii?Q?5kF8KPDy4JpHt3r8TCEhWGwlEhn6BvoUE7F7P2ixbxvMWjMeq7sG99ZFBrk6?=
 =?us-ascii?Q?iaxK/86QM8ojBjhjAuIm1mMHQlqJjwXaGU2WD53852Yz3LhAMt+wUoa+UQNA?=
 =?us-ascii?Q?JKpdlp3FOdx3OVEKCqImCACH1Z7VX9DY/woOjPyzsOy5iNl+at0RuauepCk/?=
 =?us-ascii?Q?WEplHpojJ387hIzLIBvcRB/sgKSMjOj/EzCWfwAWcGBVFGO68ZygI9fegvP3?=
 =?us-ascii?Q?6PQy55NSfI+yjS+ptj8V1E31HHcJAPKscvmDoYO4CdSLOaWi76lS4/CyyLmh?=
 =?us-ascii?Q?Apvq+X5kRzizle831rDsO0W78j+UUuDCz/tZMxw0XtLaoAUw5X5vjoTUx9gn?=
 =?us-ascii?Q?6loXPpWuVy6aT1lERK4jIn+s6I5YKJVGxhsD2Cu/bIOxshVIQ4/EUheZEQg8?=
 =?us-ascii?Q?i3XXJY4pAPj9OyWYWvhljh6kqGPg/rH19kK78dXfwQoFpR2Q6WEkwBOhwCOH?=
 =?us-ascii?Q?KpqqwCW4ZrBAB4H8QN2N6AaIuPGOs/TMUpl/vq87D+lkrOASgvP2T51YJDVB?=
 =?us-ascii?Q?qbtg9LbkU2zEhjucyRWn6dW0sSrlEoHhqnjxhu2k9BLbd7gyIk4xOUtJwCsD?=
 =?us-ascii?Q?0fW/WkY9OTFXDoeBeBk0bGZqqMjj+j4OrRgeyw904OOw0Ce0+0zXAIsAw5Uu?=
 =?us-ascii?Q?DWm0ye/0Fvef1NXnnYdO7DFDPbvT8WqV8jcs9svW+OnIhLvQDwaH8Aqbnc2Q?=
 =?us-ascii?Q?mnvYTvcX9MM1VgEYrYsv21rf9l9r6GPm1yIXk58U9Xz1+j2BkKO86Pvdw05k?=
 =?us-ascii?Q?QcCt4Qvm/SFCo/mJCGh/yDXx/Nb5ANYkRs9rqfEG3vuS8bQhRvkGEWOFG38s?=
 =?us-ascii?Q?mTNyqv98WPEyPJsnAzjnpDOuWNpIXzBV5haJiDfYxsOFD4xIH/ocp19uikAA?=
 =?us-ascii?Q?zPIa3wCcCbwa6ABAOyjMwCjwpFbeCN2nEqvw50ijVVkhWJPAok5U6wxd6G3o?=
 =?us-ascii?Q?tb+ZaxYjLptlxall7kBfOVi2CVlZVO3RpH2/IFIn/ltB6FqorOGX4DnkNfry?=
 =?us-ascii?Q?Vf33RiBojUOu0Gd52a4vy8OvIILnensdWqv5GK4lVoVlURFo11uRlnG6xW63?=
 =?us-ascii?Q?YQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc29d5bd-7825-403f-71e9-08db94b76bd2
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:52:51.3539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyUBKZjZveRXzmOgBl1Qwy9TByOQ1AHt78dYR6NkcF8HpnsFslNTItE6TCJJTOvNwv7aXmUxEpcvHLi62Y/cs6WQYxreeuGjPJkw8Zpnx3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
X-Proofpoint-GUID: vpfmrE8Sto-Bj5pXlyxjJ6nObwl06Hh2
X-Proofpoint-ORIG-GUID: vpfmrE8Sto-Bj5pXlyxjJ6nObwl06Hh2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_04,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=342 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308040060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 06:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185506

From: Yash Shinde <Yash.Shinde@windriver.com>

Capture the time taken for glibc test execution and
pass it for inclusion in the test report.

[YOCTO #15165]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 924df6c5a6..bd56b2f6e7 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 import os
+import time
 import contextlib
 from oeqa.core.decorator import OETestTag
 from oeqa.core.case import OEPTestResultTestCase
@@ -31,12 +32,16 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             features.append('EGLIBCPARALLELISM:task-check:pn-glibc-testsuite = "PARALLELMFLAGS="-j1""')
         self.write_config("\n".join(features))
 
+        start_time = time.time()
+
         bitbake("glibc-testsuite -c check")
 
+        end_time = time.time()
+
         builddir = get_bb_var("B", "glibc-testsuite")
 
         ptestsuite = "glibc-user" if ssh is None else "glibc"
-        self.ptest_section(ptestsuite)
+        self.ptest_section(ptestsuite, duration = int(end_time - start_time))
         with open(os.path.join(builddir, "tests.sum"), "r",  errors='replace') as f:
             for test, result in parse_values(f):
                 self.ptest_result(ptestsuite, test, result)
-- 
2.39.0


