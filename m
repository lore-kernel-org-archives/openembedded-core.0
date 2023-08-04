Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D863C001DE
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 06:57:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6259.1691132272644906313
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 23:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rQ6y2yP9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=758018d6cc=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3746U2ur022363
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Aug 2023 06:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=GH/vHMxMckN/cX2Zhb
	4NSkqJdizSeDvc9TgWtuq1XAM=; b=rQ6y2yP9IToFa7Ohrn372Z+SJyq4579p9o
	fry2xUzZnuE4V9DFE5dqf/+B/1wI7z+putpMYXYtX3L2wwAo+qDH6bXc4liy3Brj
	wVCmVQjjcPNs0gkOB8fkHWTCUhiwJ3uMO3c0Ynm7ATlbPs1K2+p+I/OLZ8am8q+5
	IuIG5seyTZxcsGf22N5aRWgR/hnylE2/BlpiR2RnWoyCxKga2Y3XyrLkOxKugPB4
	wqw/1VHALQ2oHHRxnFCIIYvhg2iPyLWxdYLz/BsOkvxH+G0GR/Fbh5L8lqOEA+GF
	Bphces3d9qSJ8fyRH1eWOAGdoYURsiYzbPj48oXG8sShbXJxxNfw==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4sr65keu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 06:57:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeXXvFysRAB4ffjN6pS8956DJywgMj9KV1mxp5vVsY4NU5Wcnjxo2zoJSM74wElJ2+/zJJGTVWW4Op5Y/nN+KzftuQvqtx7c7RmaSbdlsWwS/A4TtKoBwOxGwfnhFx0zR4ZSBfn6MF9cO08jC7BfZaAuj9GoeaVaDj8+abVJL3v/d5y2OHGsX466i1OL53QrcQwHKvdPGXqexRDUZuz2Dw9Z7CL5fdl6YD0wTRp/oQXo61GPpZgsqNlkmhtWkzfVZAnrI/j1VC4hGDoZloPoNlabA0TPvyki6xcIMW7OPwhQ5uWaJik14XovuJEc9Iq0SuPoVoypzAifUoX6FpkqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GH/vHMxMckN/cX2Zhb4NSkqJdizSeDvc9TgWtuq1XAM=;
 b=LxMSvLRs7EToPMI4DmvOz204+Gik7R9I1dA6KnkG0/b0UZxHQjXGCrDQFlTKBqlnVa0TYtmCRlA3rDv/993xJ4fxB4AX9OLGeVrQEGr2b1aQNTBa16hmA87TU8Civ/fJgys7OIzgYglhadGn4txUeDzgCTG4x7c+Yr/yfzYWxXAMAGpl/srxpZWCW5UA7cZkbYPquNGSyx+kBK2czeaxOmrn7DAQWY9JiWnoIS1fMgh6p9EbGq7wE7ei5Oha+5SsOa06Bt2SV1rkm/Yf8kBKfUTbNWVbltNX9mAhJxnm8nF2xclTjNgvwsCzM/Di6zS9UfG+2b2T7lv1pjd0722qjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 06:57:50 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:57:49 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v2 1/3] oeqa/selftest/binutils: Add elapsed time for binutils test report.
Date: Thu,  3 Aug 2023 23:57:33 -0700
Message-Id: <20230804065735.1916458-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:510:174::14) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CY8PR11MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d79ab12-e0e3-46fd-f15e-08db94b81db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/Yx84EeRGYznUtiCz+R5HRnQ3X5fDeefxIq0HxxCkt/8T9JdZ9Jx/vVGcD5At1bKjDXEv4FqU/Gr5s9PrLJqaIveue1sm+emzb9276gyBW0Exw4B/xr11ofZ4uVro372p8UE9KrPYHAZC/5AdjL+4D04UOJVEy+7XjRKp3cYQlQbxngpyL8Af7BU9E63jqfAUaChd42MmqGP9IiA/sncSnAQ1O4+kNfNuIxLjuJclTnk8YU6M94qxATI+kO8d/JETNpIKS2ytG8Aa4EY8SNYVQeJNFydgq8JyL/Fc7VB9GOCgQOnGK4ontYkxEFAZZSoqsCaMW49gdKSkykO8hjdvwO3ib+1/VMgUE7i4JsI/5k2XHrCO4lGWSKam9rrfvomp87RWt8PCdTlu20srzTatg5C/JeCGQkd7v9bz5mIsYF3Q30dxby5ThuNcnpMd4TE/h/43YpuW+LS7TR0VeK43DrwQ2O30trB9NqyIMYdukUSzTTq0vvNM9ulaQOoQDZ7RBVwJt8gOChOSqt7ne+D2cSORtdJL2RhFybDe9kKMqDwPedByWMnltzxnlKisJF+OxcfsdbTDezBcWZHhtHxoh5Nq8Ns/aYy3vHJlQLJoz0DlwLe9+KB2s8VspmfkXEl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(366004)(39850400004)(451199021)(1800799003)(186006)(52116002)(1076003)(2616005)(107886003)(6506007)(83380400001)(26005)(8936002)(41300700001)(9686003)(2906002)(6916009)(66946007)(5660300002)(66556008)(66476007)(316002)(4326008)(8676002)(6486002)(6512007)(6666004)(478600001)(38350700002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X8DjRHP1Jr/X343T2/qO4cVLeoEe09iKiXCUkjudD527CFYtYE0b+dbi5mOH?=
 =?us-ascii?Q?B1nv5yorsDT8GM5iVab7+rBp9meSmLk47N0J88f+P41mZBWPre7+2CJQXjF4?=
 =?us-ascii?Q?Ni7FaJvym2/yTh7F0amQyITCMTJmwGYBkxq4pBMcfgRJbs6WpT74S4wLcoZe?=
 =?us-ascii?Q?AZ5nQP1RvCkn/VMMguP7aadWi87jlm0kOU10Jdcaj8YV7zBK21Ai8UfeLT48?=
 =?us-ascii?Q?OkuBMz62yDP5gty+EdpsL99II7ygxoFZDGAtkZYo/13thSUeMhj+ocVGGvKV?=
 =?us-ascii?Q?RXXyYt8PEusX2XNkKclrUv4S/+YSlV0WvdgIOzLjtxbOKu1HOgeZpYKJH3Id?=
 =?us-ascii?Q?Q/G39Nweu+aticXM/O47QT5X0i+ahzWnLHShAxZCmItxUSQz3fojBe99f0Nt?=
 =?us-ascii?Q?xzYUwhbXamvYvcHlJSpnjUOAaiAQg4QNtd5aNVqWpMKGGCp/WzylPSkdtjVY?=
 =?us-ascii?Q?qMtJUAbH1b/NDgMiLftFiz7xq7SDsTOmKHPFG31fckBAjdvfpuzccIgPEfLW?=
 =?us-ascii?Q?DeL5fUVo4kxtxdZyy/sxyvwFKqZ7Yg+SST38wGdbszY1mL/ueJtNS+7Ea/+6?=
 =?us-ascii?Q?+D43TylYpTmnYikLIkanb7XYxzEa+BkG1+J5sxDKMpS9T2V+6YwemkNARVPI?=
 =?us-ascii?Q?OymsDixPUnJzwbDbFTxZ9xMS0l/n3H7U/QH9lPQT8L/Xb986mjCRX7JJmEz/?=
 =?us-ascii?Q?1xLwll+ZNOdmyEiwF9fNqzDNTiFyXFMXlxZsdZzQ44iTFp8kfUEM+nkL8oX6?=
 =?us-ascii?Q?ojWl8tBbHDbnrPKX5SVkMlxwVpG2TwJ1qgg4yNYHenWvj+BLbiEQV6nMegrE?=
 =?us-ascii?Q?qWc3MWaj6H4aUhUxAW5Aw5MYszu6vZCRZWgqmx5VOzns+JHREEhoP4YZKfuF?=
 =?us-ascii?Q?FNGKZDWTK663QMoHaI6ybvf+npX4wvyFccfGMbqrPSSY92DLWjL8jIfTT8Ca?=
 =?us-ascii?Q?7u70OAyFA4tzvKPe+Yk4WsFP/GivjGtnsOHlygFkPcdXAnponHIp6iPBt1Jf?=
 =?us-ascii?Q?FgdwtifsXqqjC55A/vnEb7uMek2VTC+YgcZ4OedYmq3w7nRlKygn9eLNkiFY?=
 =?us-ascii?Q?aBXNCixTzYe1rNduOQ98ol6VvYT2Zguh8OUHCNLkAheOenmslbT9GwRsIGks?=
 =?us-ascii?Q?ZG/ZPSTYxHgVjHp63jlscnow5vQ72EDw3C2lmIYxlg/CVl7LuEdF+sGEK9BK?=
 =?us-ascii?Q?Y1T/CWtexadO4ZYbgc8Qfo2ur0i6ZgzUt/IG1ysBE1i9WQkyUSPuOTOx+qGA?=
 =?us-ascii?Q?b/yuGbruwr+bQVMsCDuJJoxJGR63zQi3Bv9Z1dIekMRDITqVr10so+pw/qLE?=
 =?us-ascii?Q?j6quZZ2N3gImMS0U+EUnCYkieeAS7e8kSjYjNEuzFH4A6o9s5YQpXn1J3gV9?=
 =?us-ascii?Q?4x8kkmlBofr+5i3qd7aPgwSX+qaKfuw7NhakdJZdrR94k8+vEWk5Gu4AVKPO?=
 =?us-ascii?Q?Vq2pNQZvkz468n1lMKlnIljlt+J5l0vKr3eQ+4hDaT7zg34qFtRe1WFBdTxY?=
 =?us-ascii?Q?To8SANCj+TmwCzM7u1dgkm4AgMf3WNrUhnL4AV/EjKbR/wxFjmpgpe/99N1o?=
 =?us-ascii?Q?SNXdUOS0hXeKJFtfPhUrqVExj2qLXTtP9MBM90XnvPgeK9LM41lAIwGIQ1nv?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d79ab12-e0e3-46fd-f15e-08db94b81db2
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:57:49.7487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bcNqnehpc4ADie8sfGet201oK1rORpk2YO6AaR98e4+qRGT0x12tm5pnypntuu9cpnx2WqtepcdS0+xSu7m7wjdeInTwq3X+hxDLpI/qJHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
X-Proofpoint-GUID: eN4rI_BE3yUHRr7JcX3QGXOOcoEFc7vO
X-Proofpoint-ORIG-GUID: eN4rI_BE3yUHRr7JcX3QGXOOcoEFc7vO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_04,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=426 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308040060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 06:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185507

From: Yash Shinde <Yash.Shinde@windriver.com>

Capture the time taken for binutils test execution and
pass it for inclusion in the test report.

[YOCTO #15165]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/binutils.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/selftest/cases/binutils.py
index bf6fdca0d9..1688eabe4e 100644
--- a/meta/lib/oeqa/selftest/cases/binutils.py
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 import os
+import time
 from oeqa.core.decorator import OETestTag
 from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
@@ -36,15 +37,19 @@ class BinutilsCrossSelfTest(OESelftestTestCase, OEPTestResultTestCase):
         bb_vars = get_bb_vars(["B", "TARGET_SYS", "T"], recipe)
         builddir, target_sys, tdir = bb_vars["B"], bb_vars["TARGET_SYS"], bb_vars["T"]
 
+        start_time = time.time()
+
         bitbake("{0} -c check".format(recipe))
 
+        end_time = time.time()
+
         sumspath = os.path.join(builddir, suite, "{0}.sum".format(suite))
         if not os.path.exists(sumspath):
             sumspath = os.path.join(builddir, suite, "testsuite", "{0}.sum".format(suite))
         logpath = os.path.splitext(sumspath)[0] + ".log"
 
         ptestsuite = "binutils-{}".format(suite) if suite != "binutils" else suite
-        self.ptest_section(ptestsuite, logfile = logpath)
+        self.ptest_section(ptestsuite, duration = int(end_time - start_time), logfile = logpath)
         with open(sumspath, "r") as f:
             for test, result in parse_values(f):
                 self.ptest_result(ptestsuite, test, result)
-- 
2.39.0


