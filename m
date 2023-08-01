Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F77C001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 12:48:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11962.1690894088955565224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 05:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Z0gsYSAt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=757716bf71=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 371CSqMv017361
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Aug 2023 05:48:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=epbCUrdJ+W2CsY05cC
	t4Jces2tt1+0tygUoG1vqgB3c=; b=Z0gsYSAt3xnPN6ugfkwAHqY958nynZh5BR
	FUZ8ftsbKmpLgeIXsIksE9N+B03sbEW31ERBLYdZYC5AQN5/B1j1LsH2BQE8BvI5
	NAeIDitKfcNkBqE7ZpOLLYzKdpEtsmbUrCzEe2muDI+Wsw7aIIlUIj/PfbCzFjsr
	mIbeVOkgAZuBBYJuQtntdxWz1vldBOkwzSdsqrn1bpMZIRtkHwS4gsWfoUtGY2AP
	g3QrkinamwaNE3sPnGHCYDFw03iVFnsFqqyut8iC2xj9eIyL7uM2cmKKoUFxBEHg
	IufU5HwFWRz4O8j1Wgm3H/EpZEoWoqAuO8gXx7CCrGCoJPIZAhbA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqs1wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 05:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFQPhAHDlMM3AuzwMh98jHwgpxQO3YKO4W0cnsOsDjxzUJ7FENou0TyL0uPwCQ+geLRGtXs0qfznVq3xooB7Ffswv36wjrXMx9N7ntSNWg0BK/yKFWCD0QWuiGCGlO7/CFYOCL/X4kJOyti3jY+XhB0/k6L6h7l8DjkH3YImolRLIUsl+xEsjQlQ7BCtocwrRhjk1NsDpk/sugQdt+sAmslmKJHecwOjGu5dZou7/byTOWxAmH3db/LMGqGXcEq1T1r4VPwJ0xineGRQLLdiAAL0dpEtUVIPyqQfoWJo2RnYLS9pFzO8R99vAh23azoU64zEJTr4698LDSOkkgtC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epbCUrdJ+W2CsY05cCt4Jces2tt1+0tygUoG1vqgB3c=;
 b=jOb4LZoxzEH6HXum+Taf51L3v6ewYbkJZtf5bq6dOjWR1U6XDAPjw3wn3RYzWgwu977x91myGjbLzwTQ5KnQyMjM8SQQ2wKduaO9aD2dwa7kBRLJ/M1X42+DbLyJjsYit9SnWFHOPOtzikD9EmCoUxE5UQQTekpxU5icCKQ5GYNnOTLOMMKo3BkYd3Xthu+vbZC+kXU5w6uUM7QX/J6G0UHmOUYmpM4Rpoky2I2upr+MsgDjwU7Opb7JktHdcUcgb/3Y2FLQ03XGuJZpxTgTFPiAoBb+EsoH3oUgnflU7Hyv8XvPopQZ0MusX4GCtKKPGwSpswEiYugqx70c3QB/kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ0PR11MB6622.namprd11.prod.outlook.com (2603:10b6:a03:478::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 12:48:06 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3%7]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 12:48:06 +0000
From: Yash Shinde <Yash.Shinde@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 1/3] oeqa/selftest/binutils: Add elapsed time for binutils test report.
Date: Tue,  1 Aug 2023 05:47:14 -0700
Message-Id: <20230801124716.3472253-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SJ0PR11MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aef50c1-93b4-4d0f-0b1f-08db928d8d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+JNt6VnVPh01tHtg71cY533r8MWqjzi3vG/0WaXKHD0H5aJHDH7KavT+uo9rS6iZdE5CcBQCUzUxu86r8f11tDukZ8NZd5vqC6tW83XtmEVkuiiW8xouTlwtFeS3WhbL9ozQpS6vjSaMBXxM32zVjjFmU8VOm1m221qKiraok6j9jvsR8kIbZ+2Uf8Jpe1QsiZkNzHNTo0ZtpRtyP7wgVdkOH3QxQKPUlAFqJRw0C+2vzikADFLyvcUaUMTH1VGkn+ferJ/QTz5WWu4ESeOm8sXRIi3D1iGjyorkblnbOe1M7X7+2gVukgc8vfc7q1uqeFQWues+G78hLEGIXMAt0ccLM1NFYjVoiwHpDfGOD0NEt01WwoZ3B2jRtZl3f8PiPmUM28nXgSTiZE0dZTXAqHCRyjh0nJD2EuwdQOA1TuG2ZfVZdUbd57d8sllfsdA53PFHIucVOLPLsqIlpQePe9JqpZq2eZRQv/bMklpvTBD8OxuT8B1sqv2C95o1kJsYq8KVQV+U2ATiVzJ/zP6k28GLAztdHru2pfWFU6QpAuPS/6OfEs1kFvf9HzsExlCT+uAKqmWwDEIHybDz7MfTOPFx3tFYdw83+V9a2tQr/hYQ2skzLDM4DVuxeh4TQ5/D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(396003)(366004)(376002)(136003)(451199021)(2906002)(107886003)(6916009)(4326008)(2616005)(83380400001)(186003)(86362001)(316002)(478600001)(41300700001)(38350700002)(38100700002)(6512007)(5660300002)(66556008)(66476007)(66946007)(6506007)(1076003)(26005)(8676002)(6666004)(8936002)(36756003)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Lh+khgi8w52UP8Q+QPHUnWYckHoOf4aUsPBDdB47dnDwO47FHBFDJu4SID3Q?=
 =?us-ascii?Q?vL0ZADnrIedudu+CT4FMWj76YSUV7F9Jn990Y4GCoMRJ33LKRpiWLK935w7B?=
 =?us-ascii?Q?PDLXYQJz+tmhVRdw8ufvZx9YEEMgmexrM3uJSTx1EBZZu60RVLcloVwZGneq?=
 =?us-ascii?Q?L4AjZKeFarBNspT/dgzyNb3Ptsh6CDX4p8jJrAC6geOOEp6hKeMvLRWxq8f4?=
 =?us-ascii?Q?wEnuO/EXz7/jf+Yjf6+0Owx9V3U//NoRWmxFl9xnfvQUnHVX7kBpwJ7AojQe?=
 =?us-ascii?Q?zhJHpiUJAcXViRbumiwOy1YOHHxOPIQ5NhWWQxZTZGEu3N9YESLEFHt3Qwka?=
 =?us-ascii?Q?SX0WqbXxrv+w/mPL6veuWEqOrokfI3PBZE/tEKTK6KObVkqkejg9EKhR8OWB?=
 =?us-ascii?Q?TksFjmtqTxaxPOj40q3wzgJ8946K5HYeU6rQ5/KdTrLRDqGj7HpZVtFqriCJ?=
 =?us-ascii?Q?TfDm+epil4drz3VQstCp9cfdVeRitMtWtoM/OUayMQfa/Epkwsh7Z9wHe2EW?=
 =?us-ascii?Q?x9NgRdGaExHSQOlBWEbm5Yz1MEAslu5D41eoBha2PPWxSaCcoaIk6ywzAeuf?=
 =?us-ascii?Q?Vix5RHE7fPrt52qcazYjm+fa13zC00UYOCCbYCrkBYmTD9Fty2Nd2x59/CSs?=
 =?us-ascii?Q?PMjeUX5Mai7AMudHs0k3/MRwMDB5ZklLJdm4LpYdn0H+P3YelOn7qNZNW6gk?=
 =?us-ascii?Q?7WS809lTZnnKOQ2Z6BGTRUhTih52s9QCgg4lqSSzAzts9Zz7/DbBIeCryaDm?=
 =?us-ascii?Q?XrVHlYBxWABrnBE1sUUknDDjX0L1TKOz3zf3RM+mIlLhLRHP64ypsH9pPFqq?=
 =?us-ascii?Q?Sl6Lktg749tGrBG6VH138+maURYmIi7b1LdsvTWdBtDQbYOHVr3lDTi7ouaC?=
 =?us-ascii?Q?XDBq8ysW/jr7EF4m/wauR+Yg360GDZwbReafNPylpsB9xEbbzFdPeK+fPQ6/?=
 =?us-ascii?Q?UT+0SBVx0F9qV/LjI/JN95wt+5voq0WcHD1UT2/3WAN95OWr15APxaiXokrW?=
 =?us-ascii?Q?kOT1RezBRxRB7MDI5C3CYyFE5BQcXrtrJWuRm9mdVDHuDMkIknZlwvxhzdJI?=
 =?us-ascii?Q?pBZ6Cgm78vGki56fH22JZkIoPZT5HGpXPr919/wuj4fNwe6VwqKSni1Yyfsb?=
 =?us-ascii?Q?VphDBZSIAoW/2J2NlI/GfYvtXOIT9PAVzGov0UaNXVRm3y+BZ9KfZMbma46L?=
 =?us-ascii?Q?pRU5sF2q3+wNrBf2ur0GRO2SYcIxbqpMG3tPzFUEaeP1WGHDWxV7+b9QfvY4?=
 =?us-ascii?Q?HVN63YrZ+LLCpUoL6DMTHRBmVA6V9rIvYoOOf+u+//EBkmFg4lDY4kae6EpS?=
 =?us-ascii?Q?VceAMl9I2SPHINQp4vWC/zEouSwZw9zVyWulzKVU5Jfn09NN0zGoLlVx6ZRs?=
 =?us-ascii?Q?uIhfjasUD1deXFVZz5godmdGR/dJArXfzRaB/OmoAftxvUaMDZP+pWa6b6iT?=
 =?us-ascii?Q?LqHRvgNCXTuoV9/3htrt2zzPQq3im288Js1m6VtOYoLevYF0WAlqf7fTn8vR?=
 =?us-ascii?Q?Z9dX+snS0MP1df/GAWSRWlS5zUl/kdVs4X4TECpDek97DJW3F2EmyC5ZKcg3?=
 =?us-ascii?Q?s9gjACpwL+0y41DSPr0xQHJ9N/t3LMaWVEInW7r62c3BcoMagUgwjBMx0fT0?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aef50c1-93b4-4d0f-0b1f-08db928d8d05
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 12:48:05.9257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHHaoUqKv2fWtNc7wJw9RpH+Bjr6elZecrQNoROmRli4rzZ0mb8FxgIX6GuJvjWPlcmRLj/MfwJzyDyaY2KFPlZwar1EwJTNfHSGQq14tSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6622
X-Proofpoint-ORIG-GUID: PTlrnlRbwa59CRpt2VenLeaTHun1GA_k
X-Proofpoint-GUID: PTlrnlRbwa59CRpt2VenLeaTHun1GA_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_08,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=382 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308010115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 12:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185240

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


