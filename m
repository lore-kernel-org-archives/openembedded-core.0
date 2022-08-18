Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E40DC25B08
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 03:13:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.38339.1660792401056976879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 20:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cGJjYmL1;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=522945b752=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27I3DKac025210
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 03:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Y/Wld0mqzw2Q6RmiurGkzqbC1SxyRp/Tv5GDf4uyJ1s=;
 b=cGJjYmL1bbRrG/xqgYxBoURvU9DlVSPh6bOd4mMMikv2KJm/2WcgQ9/MLkRQ8xL52uX5
 YhciGlmJHjbXHn3AJE3kVE2NgnS96u9zrkL+8JAN2/nO28xXAoWhOwgQEqtgMvgo8JXV
 6BDO4N7Wx6EIsv3WqXsBrlDYtKjYvxf9/SkSooGSDceofSkZwadbU7tORBmR1vVDMdA9
 7y6RN152HDsz0QXWHuemUCKyGmC3rJh86TXNRaNiCkJrj9Q4EQJqvnT1wfTJQefxYCEB
 oWZY0T9WS1sB+QM37yLfKhTHuiaImRPc2pKpcvTTXHMWZfy7mRE/36jKIsDPu5KjcCGu WA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160v329-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 03:13:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P84qd0k37uooaUQOrJNmR0Se8bOPW6sTXRDjsxLmPerqOtsI4Qat3goUNNdrJHModiCgZVTc2xCstNjyTprJb6ByUEZsTcoYBNVISkMFjPjdDqKoae9TEVLW7tTABjJqCOv7P8roglteV2PUDSvvEBfZK0OuFuMD/wOy5YqmkcOrWiMswkBiRti31XOLI4W+PeEn9crGiW6NaIAwPGWNoUfqahv5oBcBMpdA+QSQT1oU4gre07DLymycLpu1EQEVLwc3gELJzuZDQHsRU28g2JBYWLBKk3wV+0QWeyQS+vcpeEeSMe6wpPyjghwqmjwJtjuRBfOWsBD3Y4OPXj8vmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/Wld0mqzw2Q6RmiurGkzqbC1SxyRp/Tv5GDf4uyJ1s=;
 b=J3l1GYhq7BGRXQZAHgEVgoN6Fq8MyCvoOzU+mtfMNaMMTrM4CnWRsDZUEaKeTK74lllQAu17N91Dx/j6EwklBN3lne8SrVxd5ZO1zIMAHPIaTDcO0AmvRxxTE7cvSnpZ1TMOstTuff6DseD5bZL5bQcDFij82FYADztSBsVVUyi0oizn1MrsRIbCYqtBPbV7lp9TPhFYQOjsLdKjcsTiR5s9DgB+ophoH7AJ/0QNLhxhRe4NfKknWtx2RXdrTej/dW906T3XxVx8VnrPgFlt0/8ZWNX1MYYKFLPdGndEYE1fjHlqxykO7ECYhxB+HxyIQEtaHU447Zs1nQ/1aRXcYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN6PR11MB3923.namprd11.prod.outlook.com (2603:10b6:405:78::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 18 Aug
 2022 03:13:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7874:564a:5570:ca99]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7874:564a:5570:ca99%6]) with mapi id 15.20.5525.019; Thu, 18 Aug 2022
 03:13:16 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-hypothesis: revert back to 6.46.11
Date: Wed, 17 Aug 2022 20:13:05 -0700
Message-Id: <20220818031305.53389-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::30) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 321247ce-f765-463e-a135-08da80c79832
X-MS-TrafficTypeDiagnostic: BN6PR11MB3923:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y/ho3k+mlhevD+3guRA4ul/X7e1PoLVNTtnpUXObouQ8YEAWoXVS5exOEoFxUtxYxfiFbV3ZKWUEl+0soIVk1ovlpJJM5SnyywWy2PXjGcYw4HDh/tIHPHaATy/flp5Brm0F+OgfpBe9/HAV8+0GFT7PgQ+3GYIQYk0kjgxtjRftZqungnPmsBravM2b7gA+/oHrOCoiq8A6SepRXg7IneBbiFIEs5+9CG9OpsjQUdBxOj3M5YARLD7WDJJGcz/se6sXOivFqvwcEALp+Oy+wReg7+WmZU9zW96VUqKf4LWVZvw1Qfd/uKkpJxGn7jvycjPGpydBuvM+LPpTbjiRc5N8V0NrRC1GeVlkmIxRr8s0v+iNKKkpDu6GYfdy2uzmrkm0UB65d2jzn7C1GfXkV/AGrWreIoGS7QhOkO6HUtDrJnuSyLNRA/s5FfmbcShwRSPWYEOk07N2Q7v4h2eD5QlPb+rSLWZwZxV65n8wrz2ocrtBgqqoyiY5qgJPaTcRx4rXcbrdZmV8d6jVChAAGU/JJY69A+DD4LR0g3NtQsDBT1KiJcUTFxywytdMWHSjKVPy4DrIJnLOupmz2+rbBWBCb9SyM6uPvYy6zNdcDakG2mo7PmnEFFzFhVi+bpAzZ0BRwQmCznE1fThY5sy2bwDkLBPcm1zE+qLy3uYqvl0efNXtTn29gRhwtWju8Z14S1p8WNwx0kgjUUlY7W3YPhK3xjzj9V2qTPWg1QoO2KUfO2j3Vq/OPI/1+DBrighNK9KPwoftXKQgi3LO7bfxPJvXkzuML78BkqE1tXVDr18=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39850400004)(136003)(346002)(366004)(83380400001)(1076003)(316002)(2616005)(186003)(66476007)(66556008)(66946007)(8676002)(36756003)(8936002)(6916009)(5660300002)(6506007)(6512007)(6666004)(52116002)(478600001)(86362001)(26005)(6486002)(966005)(41300700001)(38350700002)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P4bLk0hop+ZgQYnLZdJh9wPJfSJ+ESpT5mt4pqde9VP3KMRo9usFpBuo6H5T?=
 =?us-ascii?Q?rXtQuZZ4di75CO2yNC14XSyWlmqYo3TmIwRRKrg5EPOW9lYCb+L4eRoKVvzd?=
 =?us-ascii?Q?hAjLrYZBdQVEdgDGI64aTaJM3WwNg519B/Es1UUNzGqX0GF2uUwSDHxirrcr?=
 =?us-ascii?Q?NecvSQ29nWbtn3otPJYa25it7s+nCgQMEXXDpGc3pT7SU3pPAKurIKhdLCgM?=
 =?us-ascii?Q?XYwtu5NaQjv2blxqPiz59MEtaJAlrBwocvNizaVZwjVcJ9CasozItC2nvZcw?=
 =?us-ascii?Q?zUHBoPdB2lB3rZfduoToz7oZpMnFLlVF1wIK+WQVb440FeRtN+uS/mAu7XTZ?=
 =?us-ascii?Q?4qriwOXfpWx2PMs8W97mHG471h5tRopA6tImN/eC9Kg4RljxSCvcdaaWhi2j?=
 =?us-ascii?Q?WRYHKPI5k616So0y/tuyUMkOJYNEuwAcx3PEZgdyBzykUPscI3Jb4UsjUFys?=
 =?us-ascii?Q?H6QAMqD26U425bzpl1q2SvooPzSHwGKD5War+5+GtdvCIkaYsAtnqFhzP9+y?=
 =?us-ascii?Q?UuUWSmvUM1yt74MKdA6Ym0GcROs2Unt3TGTdGqAW3mVJmZmUlF86eIasax+p?=
 =?us-ascii?Q?RcSRAKkSmdXsN1WoLA2vf2qRMUOqTf9rLRm4raE6edlrOjehX5Eu5sWWGU/7?=
 =?us-ascii?Q?NTqeGaAKqPXq0V2m7gC1TU/GF5DkyRvfck/fBfX9HssqqnvRV630sUG4uyEK?=
 =?us-ascii?Q?IcZVLA2BPcYCvCK8G5PQ52VRtyq3Q6wAPhSpsIbgEdQMMSsMIR+s+k8AGcNy?=
 =?us-ascii?Q?pf9gx5NxiNlHIA+cwq5Isn+/NmBtOtIN7xYrBwkgN2kvo39dQwqUpyp25cne?=
 =?us-ascii?Q?97BsrQLoSa82DgBsyEl1R6QcSMQl/rUVxiQhW8Q0KPP/DMDCiBcfOzQm3fC9?=
 =?us-ascii?Q?3usBvMTpEzdZJVFtlgWJsntsqkHcCzu7AAE2tUcVwLxACepYu//Ja2rop5U7?=
 =?us-ascii?Q?eNvphAxWfLm1Q6M1+LhwwOOWNxDQhHurOFq97hQcNjEcuc3g1xKvkdThb3I4?=
 =?us-ascii?Q?nzUEgF+IfOdJsT2hkZAv8RKMfC02yjg3CfaBZk3DqXtt0PQuRnfHvKWdVM8o?=
 =?us-ascii?Q?NV42Rd701w2XrYEgteMBNX5NtdtmrwDELsMZhoZ8WmjAdBvt1WuYqcdoVmiq?=
 =?us-ascii?Q?nbWvBTLLRwfsvtOgES+5zpcTLv1CGQo7WwGYU8vL5q7o06mv/jH61yu7+mPX?=
 =?us-ascii?Q?pmLLsbW6ENukdrK8VuKaoKRA1cb7GNUQGrSBGAiD3BwcXRDwJ17rfHhdR133?=
 =?us-ascii?Q?YrY7ydUke7WILmV8UXc/811T13x7J1uzLQCgHTkqXyK4rN1AQAGb54Tq1DQs?=
 =?us-ascii?Q?32VrcTV523NffFKfGw85x8JC0hzwEFjXHafupaIq5iAOwa1Z3Lj1avM2d8DJ?=
 =?us-ascii?Q?NaB0REkemG5Oh94fZxd0gGfaMfkB2yFRQiNEWn4hB7S+lNxjj5QNr8YTqHBf?=
 =?us-ascii?Q?tFrsO61hS/MxLMss4kSyVrkjZPNOaC6PFUbjQGVR5+MjHOlnGU6LfQxkGHJm?=
 =?us-ascii?Q?i6PB6SNsIAxbzSIoetWxejukNMGjK5POuCwwCnlBKtBEVeHBRvcBaqht65mC?=
 =?us-ascii?Q?1it65e9f7Z0lGEPcVezSkWU9oA15xYiLMrXqZH8J?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 321247ce-f765-463e-a135-08da80c79832
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 03:13:16.7742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XTIHaPLVojUVAmmirW68iUq/vywUNyK183w7woc4o3Kh46W+2C6QDxkqNlOTlyfZhpUjySmF7ClY7Q8ry6DlSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3923
X-Proofpoint-ORIG-GUID: tSsU_ONqQtDX83HyXlNIPV4bIsHsT9tD
X-Proofpoint-GUID: tSsU_ONqQtDX83HyXlNIPV4bIsHsT9tD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_01,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=576 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 03:13:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169512

This package was broken since it was upgraded to 6.48, because
it started using 'exceptiongroup' since then, which is missing
in any meta layer. On target, when importing hypothesis, we meet
the following error:

  Traceback (most recent call last):
  File "/usr/lib64/python3.10/site-packages/hypothesis/internal/compat.py", line 18, in <module>
  BaseExceptionGroup = BaseExceptionGroup
  NameError: name 'BaseExceptionGroup' is not defined. Did you mean: 'BaseException'?
  ModuleNotFoundError: No module named 'exceptiongroup'

The related codes as below:
try:
    BaseExceptionGroup = BaseExceptionGroup
    ExceptionGroup = ExceptionGroup  # pragma: no cover
except NameError:
    from exceptiongroup import (
        BaseExceptionGroup as BaseExceptionGroup,
        ExceptionGroup as ExceptionGroup,
    )

We can see that it tries to use ExceptionGroup and falls back to
use an import from exceptiongroup module.

Looking at the https://github.com/agronholm/exceptiongroup, it says:
"""
This is a backport of the BaseExceptionGroup and ExceptionGroup classes from Python 3.11.
"""

So instead of adding a new recipe for exception group, it might be
better to revert to a working version and wait for python 3.11 to release.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...thon3-hypothesis_6.54.1.bb => python3-hypothesis_6.46.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.54.1.bb => python3-hypothesis_6.46.11.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
index afcd5e64ef..1d9772d4ff 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "de63c34309181875e71d0f5d1c1051c9320a1fe0517ea6733af8cedf818191f4"
+SRC_URI[sha256sum] = "f5c1cf61b24b094355577a6b8fbbb8eb54c1b0216fbc0519af97c46bddf43c42"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.37.1


