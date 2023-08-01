Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2ABC001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 12:48:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11963.1690894091428106300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 05:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o5h85PZX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=757716bf71=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 371CP2oC008339
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Aug 2023 05:48:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=554b7Offuxltk1mDnvH3QZl3TwvcPGLwef2sD4VG8ko=; b=
	o5h85PZXXXWHfZUZU5avL5bNcs46zPyX9MpS0b2A2mvofMSfxZyOIDaFUHWwa503
	OPl/BUlk6L7i8XU0gr5HVpWmPsrzdCUSwMSlhq2RbBILdCvewJmuLoJUYrp2iwyo
	+hIGtpA/ty120/vBZrnX8I8n1iqS0ilbOeY4KsTkG6MnBGvBDkhL/+2LN/k+wdIA
	OVgvQwHbzw/3AcKEVAP7ugENJ3llDpHT13PyLfuJwQsMrCdCWNToof3D8K7d6HZZ
	xIagtLhPHrKzRrDCQKwb6CHEZQv+tn/WKnZWTN8BNlBWSJZtA+X/rIqtEly2MdrX
	mrKJizOhv0q6QxR17p8xvQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqs1wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 05:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZC2wRC7+BKLm99z+Z1T0c0XE5FpU2fuG/ZziQHsU8zM0sU15Q0kDPpCDUDv7mlNICtiwbGP8V00bzWv1Xk0+x0vfZsLqZHuFYFX3CpnODDFeXTHzH6/D+LgP6oOI+9khiUzgMaZ5EYianj0Jl5hsXqeWRqrUOPZgLLkIp25hw5xEd2/Gg5viIqsDmk9UxWeFEMW0vFQycw/3a8Sfu1hiyzxDnVBPeFR11CTCX2wKQHLEiNs3bPEheZ0OAH8w5zRXNz10XssXBN7osg2Ak6dPAbYDLvSuWHB/ZeM327Gdyh2wEDrnOuYfUuhFeOL10ET4rqJNx0uEStTMKfjTWRpaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=554b7Offuxltk1mDnvH3QZl3TwvcPGLwef2sD4VG8ko=;
 b=TO8cyCIVu6t/ORpJQJ1O82nJVfHoB8vVvYQCsBlxbS8vQ20beZ048oOI+48TcMSuN6f4tYbFCymPEbf9IeEL4JefhzVrmdrcexC74zlSE/hjbtCnH1rsb9940l4eFfjCXp9xlVwSfykbjvWJhekCpJ8cCPDgrEKBwBvmiaYkTjZIP3jxPqC1gIBwcly1lfFwsAmJvW5bM4GVIxy5rfgyHxO+IqLQawC3cZgRgyKLtG0eX0jfybqEgQ/gbz+oNSmF/4dT/UmU7aAtD7y8yc1/XN+rt1HVrY+gMARd/vVka35JuYkscHS4COxbTH39WdsH53Salzo1hOeQNNTUboJBow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ0PR11MB6622.namprd11.prod.outlook.com (2603:10b6:a03:478::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 12:48:08 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3%7]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 12:48:08 +0000
From: Yash Shinde <Yash.Shinde@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 2/3] oeqa/selftest/gcc: Add elapsed time for gcc test report.
Date: Tue,  1 Aug 2023 05:47:15 -0700
Message-Id: <20230801124716.3472253-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230801124716.3472253-1-Yash.Shinde@windriver.com>
References: <20230801124716.3472253-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SJ0PR11MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d5eca7f-44f7-4714-7fc2-08db928d8eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CHxP5AXZumlzV4NCsNUHcDNpbG/2SSFlQ0YFf183KRDXSdYXrm+bLOSaCBKy6wIQbwkwqiPB6QkbRspoVoHBBKELn8QnF8v1DrM/y0mhOEu1r0srROZJ8+I48OdG6bO56xbqmPZ+kKmB1hJP+QXBABXdLVQ1+O0hrr/KhXfGnKxSCin3Fw7m/nM4urMlT1nX80FkHQ+xk1yuchjD7VsCRU0f0bRYX9VPkQFerXimuoXGrF33VZlvJiBvOMlxCHIxI9DGGYQ7oaAeSH21nf6Okoq6ySRuFUSN8mVCGH6GrgyY/cH1lRWYC0ctQQMOP7njT8zYy6djP4J4+8A10OTDYIFiE16QIudqmwX4ZiA6SHgbowVYUDhRjMj49iKOMrDgHGID9WWIetZiGncSnVvE3fw8RDPqIE5soUbhOz8RuPNMm6zvcJq1gwrTs3nqQSPyK1EJq067xBlnydS1MI1Uc3v4D7TyAjd+Jf4NtH1F5CFm50axnUrOY/8p/9xsRuz251V9zbDZriZCQ96Wi1aVzFqLaJgL2LuZHjaCi3s+aAqj9VbQ2ohBp6NGxs8JNtI22OfiEYHahIUlRX9NY4OJvFA5j8cWtY/Q6Y7mnsD7+wP7rABYq/9tiKbG8XVKrzAg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(396003)(366004)(376002)(136003)(451199021)(2906002)(107886003)(6916009)(4326008)(2616005)(83380400001)(186003)(86362001)(316002)(478600001)(41300700001)(38350700002)(38100700002)(6512007)(5660300002)(66556008)(66476007)(66946007)(6506007)(1076003)(26005)(8676002)(6666004)(8936002)(36756003)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4ozz8EJ6hGB2fz8FAaXL+Fzp8B3b7w68GqHn8gVwxjBUCrwSEeDWgV4x1rqs?=
 =?us-ascii?Q?aMiQmGXYdLkjP9qfCv+741qgWyThTtOAvW+LKb6RGW/+QX0A89uvESMqktUS?=
 =?us-ascii?Q?bzDxihK5zDuulkAQ7FqpJBqSWVRQrEHrdewBpUk+JcWk+0sT6WvgGZnIIxOx?=
 =?us-ascii?Q?smW4Jk0eTsYj4P11O4GIpRfRxstNBoGWoZIng+wXGJu5hEQb2eQDy/jRAyFt?=
 =?us-ascii?Q?2lsDl88nRyE3leN9RuYyP/VD7uSKmEhXPJtDGzalxPOccx5c+5mi2j0U+nEG?=
 =?us-ascii?Q?7we30/Y4GpFQOQTi9niIX+VJrJquCwJWHk4Y83QL8/GOJL8944PTjVA4t0+l?=
 =?us-ascii?Q?gbkguhPatnisANHS+NtikPQo2iSLSRhigkXZ47eWMpx7fVGRn9Y5x5r/O1bW?=
 =?us-ascii?Q?5RF2lgvQ1NDP6YdlnjhzUXBXjJh/6yw2kcdPm3+PB8aYDvcsA7gHS3PRV8RI?=
 =?us-ascii?Q?RZT0mxnVbmHES2KCa57eSkZMSz7dW3En2nvD/1NDRLJD2hHLo/dDli4RQPfg?=
 =?us-ascii?Q?IqlB/AxtOVI2KTLwzDMa9nnZTbKusUomcskmmqKXY1bw8AoJWmhPBfnf2K1G?=
 =?us-ascii?Q?TskZLacNyY9gUOsgyPd7OYe+8RUE61mwhPB0lGshsHcvA3L6Mwju0+h71yVC?=
 =?us-ascii?Q?gbHdvk3ESprcKtgz6bhxLYT+YkYDuB/W6j4lVyAYYdVu22psr3jSf089VyR6?=
 =?us-ascii?Q?6VCrBLlm0aw4CAGEy+w5dxdGqxAGTAA1XP3QOKAcw0jqjTc2CHfaMEiGit35?=
 =?us-ascii?Q?TpYn3pOpUSQcih5vYEkLYpkmezXRxUtfs0a878hVjKQtWN7Ocns9e+jKs6sV?=
 =?us-ascii?Q?La18qqy4EpYMbZRpGfINqOG9Jllg/RrTg16Y1RWSNjYnfX5AH1JMMGsJNpk8?=
 =?us-ascii?Q?9W4N1qsnwrmWZFFJCuGVc4uahxvYQW0ppNlRNI8blK97V7SvTEOPl5SbKSQt?=
 =?us-ascii?Q?xrWPcDbvIczt3jr7O3qTC2uX4Ms7TUFGDFC32L5z+/6LO3+3CL80v3CO4Z24?=
 =?us-ascii?Q?GnUozxdSnDbE50zjN3S+jWRiX41qDm5ZdrNQ1yShPXRrc1wjdDxIdFSwFoha?=
 =?us-ascii?Q?w917NUjkOwQJ71qWLH6tRXdasfQd23LamHqhzNiGXJVxgU3Pl2kfmK48BIl2?=
 =?us-ascii?Q?1erMeIvl6Jq48dJI4lQj8Sp20C0lgI1tdv4R+OFgO2RHyganuHinvWiyQEoI?=
 =?us-ascii?Q?xB3irnOAt1aK9f0H9/zev3nVoT+SX5C/WYNdbsLcX0EjiOHBlgXWE+EsvBfL?=
 =?us-ascii?Q?crAjE+zpumVUQST+hOYR21tgicSIdA0MWV0NJIr/oBDV9200JnoJA3SRRpiA?=
 =?us-ascii?Q?/bCC/cEodmxygScbLykfDR/3NJB4PcEYreVFKIqF53GIr+WoQQfVtbNu0QEQ?=
 =?us-ascii?Q?BMaUE882gUvDkaL/IroGSHzwQZ2YmevO5lTvjfFRn+r9Z5RUoD/FxVxCH1G7?=
 =?us-ascii?Q?hNj4bwYkm1Eaeki7afF4cXzKhugwG9X3GcPg90wD0E9KKHo06j0hTZPKh3X4?=
 =?us-ascii?Q?EzGqP/c6l7SIbWPG82pqCD7PYpRdTy+cM5JedSNxq56mdEZ7AgAsvDBmKW64?=
 =?us-ascii?Q?GORCCoffXH4qcpZra6TzKYBz758CThHeWcJNDQpRn0tqFvDDLDqkn96HuBAt?=
 =?us-ascii?Q?FQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5eca7f-44f7-4714-7fc2-08db928d8eb4
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 12:48:08.7230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHidBmIlnG2mWPgOobxjttiAzMTEZxYm07idLXKLTRNBZSPRY1lRmiLeaJwz5mrcrIYOoYUDrPTwBAthY7aUm+tUQTv5SRzVF7z4YrkwUyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6622
X-Proofpoint-ORIG-GUID: pPlXKTTwQoB0dXvWNtAoW6pr9h1FbkyW
X-Proofpoint-GUID: pPlXKTTwQoB0dXvWNtAoW6pr9h1FbkyW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_08,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=597 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308010115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 12:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185241

Capture the time taken for gcc test execution and
pass it for inclusion in the test report.

[YOCTO #15165]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 6b9022e461..89360178fe 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 import os
+import time
 from oeqa.core.decorator import OETestTag
 from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
@@ -43,8 +44,13 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
         self.write_config("\n".join(features))
 
         recipe = "gcc-runtime"
+
+        start_time = time.time()
+
         bitbake("{} -c check".format(recipe))
 
+        end_time = time.time()
+
         bb_vars = get_bb_vars(["B", "TARGET_SYS"], recipe)
         builddir, target_sys = bb_vars["B"], bb_vars["TARGET_SYS"]
 
@@ -58,7 +64,7 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
 
             ptestsuite = "gcc-{}".format(suite) if suite != "gcc" else suite
             ptestsuite = ptestsuite + "-user" if ssh is None else ptestsuite
-            self.ptest_section(ptestsuite, logfile = logpath)
+            self.ptest_section(ptestsuite, duration = int(end_time - start_time), logfile = logpath)
             with open(sumspath, "r") as f:
                 for test, result in parse_values(f):
                     self.ptest_result(ptestsuite, test, result)
-- 
2.39.0


