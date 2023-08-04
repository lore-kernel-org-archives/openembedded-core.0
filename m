Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D824C04A6A
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 06:58:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6240.1691132302411713586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 23:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r9THCTTx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=758018d6cc=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3746TjKK022112
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Aug 2023 06:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=oDyQCPp1aSm/I8rZ2dEtv01MlBGR1ec9O0mjEZJDCe8=; b=
	r9THCTTxFx1+5zqIGzZfDTuBoNs0ugB6z8zDL/8T/pjaDMk8QAOAxDN7aACsmfhr
	9JSrPeFYYly/YEyjSCi9bczRfL4zBk3/hUf4qq/BoiN22jawK0RvJgJ8mrK64bdI
	qzG3/evDqNVX3Jd8x4ygo5iSxpU4lzKOioLxu+bRYlv4tQ5D8Qk19sHwuSqLJSdM
	oWGcPPTXudg4e1uqmxub4scEtCKYhuPVyBRCzNBZJdapzpaEQQpSGw527QrARk3z
	TNEnlwL4EqduqLMcnamHWScYj3mi+r2pJ9tzAu1yHv/3LDvRNryO525J9nOZ0EP9
	zzp4F2ntmalM9xrHFZL+Jg==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4sr65kfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 06:58:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qj14Ilp0sXa0WC4ati1tXJeFmG0eJf5xqBLhuuU3B3ZUEx483u043IAfW6IJNxWc8XlUO69iDeeH2iU0zyJhAG2iBRs/9XPBt5U3+G3BPHwJIkRwg2nfBuyguMEegHU3aH+YpJPt7WLj9e7cEyk+fn4aAFR0EkAWQ0fYX1cD4lARtCpZJyVf9s1GUES0JeEinX+GHZsR+DbCqFxVBFxEdW0YPfkI8CiyAK1WT+04hwhmnttzUL9tt9nzoYgD7bi0lIQ24YKZ98dwFzgVtULGCgxA+htEn4LX4BLrGlJyUfOch/umtv3M0qJk8LlKJ4j7Ro3ixZeK7u27YmDIHPdG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDyQCPp1aSm/I8rZ2dEtv01MlBGR1ec9O0mjEZJDCe8=;
 b=mI15P4IJ0gM6ftMetADYAnwoN2/UnjE7ZzL0gmim9VlGOYEqzjIsGAxSpg3Agjl88tOW7VCntrshCiiJnRKAyJp0woVJu44PWpwjyT55B0PqmJnmJDDVfZj+aJzw5UvUXhLa99kXF6QR6a1xPN365qq/VQPGRHFB01ynnUDNIy7kQx2ZIQ80QLort2Ld1Bd5qy9yTHsty545ROsDuZQMurtpQH9dXNhz+GvLSkgDJVTfnoksTb+7Y6jSmGptkC2Nx877GTigmEJDIzYQhiGb8tlS3ktawxsjzuUQ/Ntbld2MXMkCICjX3NNxS1hTWKdTW3t7G9mnqzMsCqJ+tATHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 06:58:19 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::d383:a84c:6dee:47e3%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:58:19 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v2 2/3] oeqa/selftest/gcc: Add elapsed time for gcc test report.
Date: Thu,  3 Aug 2023 23:57:34 -0700
Message-Id: <20230804065735.1916458-2-Yash.Shinde@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7acd847f-7136-4f07-54c9-08db94b82f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6th0mq8YC3QXH5eM8GyNnD2EFMomzCvSc587PAoNyEtVjt5ZOyvu0kgHTcRixK5Z56dgh/8Nwm/Jlkj2G+J+pYFUw0UVrpmtdNdu0anlFx0YrhGP05ja+SDTcj6Zs4HjBcMOxorxqk1hYTMhxv45dd0EZJ3aFDwyeUQuRYg1PijdTbrLOAfowzbLzbHIZwFaQbwkjUXgbIBANHj2CklVmx3WarpoGZMJYKN1NVXYjuH44cwVeMHtR0FgpphOrDFkSUbYikZjWL7FXzAzjdoEe0b94euNCFO+XryynfYWn5s4922da+IDPP4NCLsezwwq/fz9YwdEwBAtkUyoQIT5p/vsRGLYB1IoXfBtmf53C1TFo/h28l1/dfxOoZkxjpwad82kP3ZbtPitCA3wq783pYrwo+ZSDycXS8TAmFV4TwNpyDfAdk7CGsJB3C+2IF/VfxGBrw0ZpPyDgVg5kr9kodFKwoPRWSltRs/JU8PXPnO6KLSfHZXc5kJU3/nOnkJFT6oqrapN8TjeY+Uv2qyy7xgos0RF30BTSFjpBGzuQSKGVVU9tDu2gaypgq2N4Y6ohJURO9d2EoAVVUnKMN5R2zEKfpjpovDiRUucuhswMWGdHg2XOjsEoeio/IT3i/lY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(366004)(39850400004)(451199021)(1800799003)(186006)(52116002)(1076003)(2616005)(107886003)(6506007)(83380400001)(26005)(8936002)(41300700001)(9686003)(2906002)(6916009)(66946007)(5660300002)(66556008)(66476007)(316002)(4326008)(8676002)(6486002)(6512007)(6666004)(478600001)(38350700002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e0R+cxcnE/TYFCNz2fnfzpC6JTB1eCbPOvfyhRDnb3fNrYIOBFCghU+tKkDS?=
 =?us-ascii?Q?Rej0fldzMbOqlNTqua46f2UsaGha2B5I7Yn6UkDbQFJEbR7e5f1OKnCSyygu?=
 =?us-ascii?Q?ciQy9fUL4L9xDssnKBJoLOPhQhj/5wk73kvZ9KFrSqyuqN3igNKBqAB5Odg2?=
 =?us-ascii?Q?xZ7qqTn1AoK3ob9nerqLZBTy7jK6n4WmoKn1LU9MVP8FYcAPHv7aRwB57/Bl?=
 =?us-ascii?Q?egpRGkOTgXnp5k7eJA5ceRj0FpK/8JyDM7iYk8D0Xz9fu7ZP2hgHjOt72u2w?=
 =?us-ascii?Q?QOahf8FC3EEsy4nm49qoe7FEaVD0RXzUXLUiSiBk8ByhH2taQmOQMcpn8yRY?=
 =?us-ascii?Q?VKcFUFei+9qzZnx6AyQ5fO2A/4KpHrTIblzxWLKm6PUMYi3xzChWT42DK7pL?=
 =?us-ascii?Q?lWVxKGzge485b9+ZZalxxCSFFrqMH48vLlmlX6VtbS9uGGvUc/4QFD4Q9jep?=
 =?us-ascii?Q?iz7Ly49AGvVXME1rBKi1dANMbbdu48nRkFAs8DY3LysUZ/joIxD5BT/qWdmV?=
 =?us-ascii?Q?lMhxlqK329xrWDc/RN5vlqzOPeyfi8VPKXz3TAfKunXFdoROCpns3n38ylQi?=
 =?us-ascii?Q?zcwPcKPgORmj97jBpjwkYnlSYGTJ8z+rBPJ3u740StwyGQ3IFk/qehu32T8h?=
 =?us-ascii?Q?62mwPUhfYUJ0pndw2ZJk0GET9FJipUjNckjuSLsxRnJNS+FX/EU3K6R3eHsx?=
 =?us-ascii?Q?Pz2shMnG2Jb1aqXZaiGA62jDmzW2X2COtQHwPTxDdPfeIDbP5UVMdCStiBGJ?=
 =?us-ascii?Q?NzBvp9K/DHMrzdNVeGsd+D6AOK2XnRvik+RAzb0rQVd+i7ZYvo6LKery6fbY?=
 =?us-ascii?Q?KBmtOqmHxylKoPEfh7KOhQMdmeicJG8zRxbAsLDMaMhp0JCrfH6Nw9n1zsuJ?=
 =?us-ascii?Q?Yu0AjU0GcIdDeyD+JineDge3WVzeIymVAzZijBdJCM+FpCSXYRrECYGz81Du?=
 =?us-ascii?Q?zKdnC9C/ckiETkfyJbHK8ymVlzNMYFyDsTBcEnD9sGrVlF11Ct0d0rnOXgTV?=
 =?us-ascii?Q?K3OFrRyusw5c7E5xGJ1rG8Derxq6U3WMh3B6FK+dAfo2sD5SuL/t75LMpo3n?=
 =?us-ascii?Q?QFhkZci0EX2QsKp14hKwXGE3jo+r7fokmB0WeBhPAHSBmeLA4OxZ9gcsqZus?=
 =?us-ascii?Q?5Wwhw4TSZPs+WDrEm/6vMfLk6CQWHZ4FFkd1VfzOYJhvM7orOXSkW5vyM+YV?=
 =?us-ascii?Q?M39kmXeyQ1ra1UtlOrdkv58BYvymUwrXeW+N8QDQaoWEWHCebC4VujbPsdjw?=
 =?us-ascii?Q?yfLHCi+IZZVT6mo5BewSa1lIfMscp/UDphP5PBqc/88FSj+cX/tvCXsyEkUn?=
 =?us-ascii?Q?WtxB6Dldms2Vay1F26yTmKyfvaOZ6w9eSU/9QSutd8F1WfkNVvB4uP65aQXH?=
 =?us-ascii?Q?04MdgudMk+siBNA7BIErbidtboFqNEugjwAh8D2SrIfYNN1EZMgIGE+enW14?=
 =?us-ascii?Q?tLIyaEoJfV/xyvcmNAXm5TVf51U4uPyRwfISjvERAWBFd1V0rN1YSeqabQq7?=
 =?us-ascii?Q?ovQmceb7g0tOxxzyFyxfClIxVTB+cOUiPLTjJ09tbUFwk39Nmmeg/y2HUEA5?=
 =?us-ascii?Q?aQ7pIHMyvcc0XiyMzgXUZmZ4v+2C4M/KEfMu4rZtGEV5N5q9bP7bQDbupOHX?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7acd847f-7136-4f07-54c9-08db94b82f91
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:58:19.7598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Hg/zbwrJnh5eSybpywm9KGPKi9JTRzHhUUKUci0y6l13P59D1kuA4x+sXoYU1XQi16v6M15kRCJyF3mKI8Q3I2wIZo4l6nVgv3CWsY7wjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
X-Proofpoint-GUID: oQX-05RL7_VWH35nGcBax-rm7ozhX8aI
X-Proofpoint-ORIG-GUID: oQX-05RL7_VWH35nGcBax-rm7ozhX8aI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_04,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=640 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308040060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 06:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185508

From: Yash Shinde <Yash.Shinde@windriver.com>

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


