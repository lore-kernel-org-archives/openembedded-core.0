Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6B2C41513
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 06:58:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6271.1691132303608576948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 23:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=q5Gq9VlF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=758018d6cc=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3745dhdQ031444
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Aug 2023 06:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=V26T1YdxwU0T1KqWJC6I4fZpdXmZ6bUOtpFnlNgxs2A=; b=
	q5Gq9VlFyT8kPy3/d9UzfceVM69MZRm3pHhu9m5hvDlR+d9J2nAa/MDHrl/OOMBB
	ihsFe5pry5+mPTTlPYxuod5fHu8l3fYWz9xYAP+6hCRF5/hfdhya2Tn8a6/MeMf8
	uiFvtVKWYo1y5GMHP+Qs1d5MnAz0tkt/J9erZcAbPrUaJI0DWFcb6iQ4rnCB9X29
	HVR/d1mB3kRZDMEoNXd4f3tdScyiHoqxeNmDwmlEnG9n+JGGkIHlA08jwh4JzYzG
	hsn6kKjDinze1Xyzh/iuUPXFfQCF0Nj3zignnKIGWetSP7q2k/e5VIZNVwgPPBk6
	pL4Sr5ox3GrQgZm/zs/hdQ==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2048.outbound.protection.outlook.com [104.47.73.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4qyx5n0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 06:58:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgDAoVH+0M5m0QeNwuTLsIYsMPGenbsqzTZdFtG/4MaxaQ4k4xnDnbN0vbkwEnpRFJs9XCKnXgmNBSOwMQiH9LVg78YBRv8hV06dwXnskN4Vbqbt2n1cMzX4JLXkRzp45VJYmgvTidJMAA8XZ0541H6O/TZTnl5y1YlmuaHwlZP/3XO+AX+zS/UledUtRyfzryqs/4tM0wTd4k/hhxpYHIXs1B1Me7I6XTNuWKtVhJW2LFEewA/fxladpy10x2BWfPLlhEw47mcyQcYdv7AjCJAdon3T/VU25FYspJlwGmcXnI0gsD2kLeBlO/A5gY6LmhrxoBU71G3juYEqvu/GhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V26T1YdxwU0T1KqWJC6I4fZpdXmZ6bUOtpFnlNgxs2A=;
 b=eDc4uLYcTXXrhmgGx6olNYUPtxuiyBMq1DL5sjPGBjJN0Y2dedWmjWdE+0CVmafUfmxs0rd9i/EchAndHJR+ufXbgOrgEzgOQf59wpx5rJcWTamEqQr1/7Wz8/uz9xMRUYoQZsNlMpg3bqxEaczA5RIm207fEp/oXjQbtXzkmHz+eblXeMOfDU3eoGs2xEk4kdCrNiMKpLBVh+m1AqOscvt/Ux2jPu2qMje2PtKxBJWv8b8VT6tfMDOJw5fH4d3/SyHNybk8AdiUd8mLZMJMSSgnbVd1K7UoOyc2DPI0oERjOBUyMpPBmPNr5caXZrjcilcNrFlNvBAVmbFWKkU2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 06:58:21 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:58:21 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v2 3/3] oeqa/selftest/glibc: Add elapsed time for glibc test report.
Date: Thu,  3 Aug 2023 23:57:35 -0700
Message-Id: <20230804065735.1916458-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230804065735.1916458-1-Yash.Shinde@windriver.com>
References: <20230804065735.1916458-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:510:174::14) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CY8PR11MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 15182b68-3b56-4ae5-3d5b-08db94b83089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MJzYfMupzx/8/PGP0N4eRnN7g5xIgbqNF1gCDftQt7MUmi362wKgSHEXbq0oHYJmit+Zhro0RhFMaijsmKjICU8T9jK+q4ZGbYQSBSKN+9jhcGqMFmdgWewGv2q/068/dODUVR5F46bNWy4U3KP+jLL8wxXiM0ZaCDsAgwxVj5Y1iw6w0gPpBPiq+m7Dd0I+rhmyRscadPAzC+hpW8QTrJKtuMx9yfNPb9jS06IaPU6hxsoRpXcCDWJyxDf+nZC7DtPYSNIzjF8W0hVFq92SDGgmnfyIKv45IgZELXWjw0m/Tsfir9hoRKpo5XzbhSta9A7G6w+yn3aaNmsZ13xni1ZcOJw9xr8Jo2LyOhEHJ6EOLWq819++JXItMzATRv3NRhenPqpD+h84GnlhsYKvRpYzq1xi0ipkYOiUhD/qnPKs1AeEzxP5Qo4EMynXshZQ/gndmrBX8fDfntd6Fexe8UUCCqVsj83LlTVnTydhwcgUy44qUoVZFFt5o4zI0hVBSIQCAmPlBITPbjhzbDa/A37cSlsFEuL7jYsnUOgjXardVV7jant2ZmJE3CEg0gziiqdmYX6TV/nLDQQywc1US7pdlKyCcKQY75AbbSgKELbaxOTbAcjgdZ3CGK1GRMG6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(366004)(39850400004)(451199021)(1800799003)(186006)(52116002)(1076003)(2616005)(107886003)(6506007)(83380400001)(26005)(8936002)(41300700001)(9686003)(2906002)(6916009)(66946007)(5660300002)(66556008)(66476007)(316002)(4326008)(8676002)(6486002)(6512007)(6666004)(478600001)(38350700002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PHSz6hO3q20rRCPOe6c0kDgeUcH28zJ2DeSsIGPQZMM2CazlXVzuVoeuKRoK?=
 =?us-ascii?Q?8d/CeUwGsvGYLrkZfJGF78l7RzeIVC6uWi4tdkUzNdkkO0juSRTSIoVHOXd/?=
 =?us-ascii?Q?8AZMiaYtUYr5c0qN9cu5TaMQ5IplDLG5+k1MV8HUeDqrGyzsM58acrEh/I+G?=
 =?us-ascii?Q?OE+lcb52elNjHRXke7k1c6GK8w5OY41rHHUdLlOBJJKIxzlLkcx2wwMC2avm?=
 =?us-ascii?Q?m/sMgsn6llM1QGOgTMopN9JNXA2F19176aIezS55+et9lPBa3xcmIkSdYCin?=
 =?us-ascii?Q?Xj8Amk92OswRwc9oF+Mi84d5ncJtEk4vT8hiFHtHsdYfs643+RIA6iJzzXpj?=
 =?us-ascii?Q?k9J6vQP9/akbfO/n++bq1BRNQh2faXXmVa1N/REPou+5bRz+/tNP8uVMGr9w?=
 =?us-ascii?Q?gpWnlue+2aYWcy3uoX5Aw+zIuOxtj6Z27qarMpJyzfK6fknySazlfS2q+oAN?=
 =?us-ascii?Q?caTQjxMAacCIm3CcwEiKGFa+FGrQGNvPKXgSsPlXg9PiWgpJO/iSdiPjDL/p?=
 =?us-ascii?Q?UlzhVwQxbt/KghE8VlfUtoWysBr6WhGIGUTDmsfatvoA/CbzHykkMZAgJTAL?=
 =?us-ascii?Q?ufuzr7+EyRzQbfPN5TjZqquiT0VQ/vr+IlG3+BL9n9Bj7OT6cTwE9TdcD8tp?=
 =?us-ascii?Q?VTNd3gt76L4+pbXY04n59RasUd8Om1ZUclhv9EANGeavb22gYVbkl1tHYRYM?=
 =?us-ascii?Q?Sjs8VjdppBYkBUsUzHhb5AM+OPzdGLMBnQzmENnXH/Y1vD3kD/957j465AMd?=
 =?us-ascii?Q?y3d8iCaN5TdL/DpEBxxRGwzcQfbXCKQrD5Ouibqyms6p2t2s8YXu9T8c2D9z?=
 =?us-ascii?Q?Uo7bhEvClQpHpObZ/nTnqNHg6Ia9gez0i+0bm9qPta8DMMoNnk+RcL4LeFYx?=
 =?us-ascii?Q?rjbjHwZYO46N5Q3hNFVMZwLatlPhf0SJZyfOck2sYoo/VbDgevjPc0I/Sss0?=
 =?us-ascii?Q?aLnRBB46AcukRXPYpTyxIcOR9UEw8SgBIznS7p8F9OX1uNbhYidXpM6Vd9w9?=
 =?us-ascii?Q?OCIuPXg6gLZpZbBroPhZFBcajZoxtehbyASVpqI7oN7AwO+vNM4tJhNJ5GUi?=
 =?us-ascii?Q?mZNh/fQCBC5esI1fosLisFSo1aZ+ScbratPtK1SMgNRUa30AoOTkx7HQGxNA?=
 =?us-ascii?Q?O8Z8wY30YmENNvqOYD+0rHKJ24yEIuB1lGro25EXPQiYTp1QMqv7/Q4+miNJ?=
 =?us-ascii?Q?i4DPe2/VI6DMpBFHd0nwqCYIBLxnWI7woyFkYG0hvFZI20Pl1PduGncWwYgi?=
 =?us-ascii?Q?8XKfEo0iSEaS5yrSt2CBLoyynqBzGlZAaoN1gONqnCFoAqD14wSwduzUwc/d?=
 =?us-ascii?Q?+y4RNr7vDx6Llyu5wMdGZYOdTgdsqf9454SISXPFE51gGcBhSyYNBV5IP/sC?=
 =?us-ascii?Q?MN+OW9lfOQYkK4Z3J6r23+0MvlvBualfJQp8fZX+hUm/T775ZdfYwh7BxGAW?=
 =?us-ascii?Q?odMMRn+QC8sh7c2kxc4qU3Bnc+gUliUUPXjGVT73xwVN+32+CwKSqu3Fo+3X?=
 =?us-ascii?Q?3thKVMa7qwMWeyXsrSr9nJWivAvgSV956cX5FMwKOoILxSojCz5SE5lXUgre?=
 =?us-ascii?Q?WILjG/PumPLxtrLriH6r024e/5IC2s1P2lT5NfOVwsGID2lE3DRIYAGzk7V/?=
 =?us-ascii?Q?8g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15182b68-3b56-4ae5-3d5b-08db94b83089
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:58:21.3495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ek7dLfQGGWSH5Huwyz03KKDT6d2sMmozs90C3NpDUWyaFS7bHxRF1J2uYwN5jW9AAw7tTi2a8v+VzvGr7Uy8sk+3joayK3RxtfjDkXeIfAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
X-Proofpoint-GUID: My3jkSOJB1oCmFZWrgrXTGLGWLObK9rj
X-Proofpoint-ORIG-GUID: My3jkSOJB1oCmFZWrgrXTGLGWLObK9rj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_04,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=311 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308040060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 06:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185509

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


