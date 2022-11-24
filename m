Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0D9C4332F
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 02:56:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14723.1669258562129873615
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 18:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WvST35zr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8327d198c7=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AO2quT5031691
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 18:56:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=oNtL9Pl7f6dC402Y1yo1bsRjiIqsSR88RzgC4RpKAiA=;
 b=WvST35zrFbhWrSHsm3zWqyKM4mExFyINRardENBisAP6CyiW/hgyEODRl97rUNDkwcB1
 Mul9FVt6lPKqY5U5LU98ob1dbX5TJiZxgLYxjIprr3XoHkD3JA3fCVNga9Vgzk0akOMI
 l/lZebV5s6MEnclrbpkPCsr3rA7J8YGMBgiqKQiMvxYi2rjK7tJVTI+Xsk6DF/fNoIgb
 YAR1qLvGXso5QZziYNYUKeYlshEEszLGURXiESsV6fzWrglc1B0N1MnYoIlxR2b6eGFo
 0UphbAn73axoKqfQo4UQylUS2nC5g0qZV1sxJeXVEx+WG/grc1VyKg0GyuBk6z2pL0Mh Ig== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxua6btx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 18:56:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EehVz2KlK22fpyeFMSMlIb82cChlip+fOxgIw0XPXnH1QNZNOzS7jP+A23OJLgvRka45nUsavKnfZ4nKDfBEc+Wwpsjwi8hcdsoJLOdO98AuEHVCXUle+J1Dik6fNAgl4rY4LtvGiQobIi3KaD2aXSZSSLOfVpBHV2dM1ImcaNb1/YsqCNLJBqREa6kmdPnAk1UfUtGPlmMm6UvQ80bV7nAxo+YtCBxVR+2Fg7doMuSngG+cc41+g+RVeqkZ9F9XeHyj0xxkPQzdf8gMOokozqlwNc8M1MZ0SXAKecOcN6DiiAtiCIpUdJB/wljFAWyfphjDXmgAk5EpbNPlBK0hPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNtL9Pl7f6dC402Y1yo1bsRjiIqsSR88RzgC4RpKAiA=;
 b=OZQQ9xS2SOuQMRh8hOHnCTly+E2zCcWNqGwoaO+TNvKklKgNxY/Eg9IvEedYl9oByOsQoCcXFnz6TUqQpqoFUdIuO3dhQBBKLYrmsMT6FAA/i6xcXvITwMCuSmOy4HPI2+CiLsxwAFojhp7rHBbyn4W79oPIA1MJq2VswOSXik3TUnQZaoEXpO6O1zW0y6UpnTUxdSlgKrrPCpi2HEXUn25x/jqw2roVk+WtO32F3vh4QaAH32o4EyQQ7yV7qMRkHLJBNouHJrAe77/cwoDTP0mzH779Q3w9HbQbtmQJfO0hESbjaRQbmHhvL/35RdxOJSWwkMAEJQ6Nseh2XKVCeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7719.namprd11.prod.outlook.com (2603:10b6:510:2b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.18; Thu, 24 Nov
 2022 02:55:57 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7%9]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 02:55:57 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] selftest: allow '-R' and '-r' be used together
Date: Wed, 23 Nov 2022 18:55:28 -0800
Message-Id: <20221124025528.114101-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b27cea-7176-4eab-3a40-08dacdc76854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eDCxmeLf/CtrIt2L914ipTRL0LuFlkSNZcH9wwT02KfVZYuHPX5/gLxQzYJ1Ub2s0E+1HCATNScfFH1EUbM+J0YKiq29+GVj6ANQ6IrCsDYH88BlNm6Q58IST84Rh4l0Kfy0WBxmcOvqFGjEM/1IyT+h/UM/S5qFH1hf/eewPJqDjPTcdt8FnseJ1I6rNxiUFvDwvqAFhh2Hb03aWgdMDZzLDWeRKeJA4evqOXvUzl9wPMjMHu9ll5hamTk2wXHISEabVjjjSbjS4WyG7QjpWhuDKopsdlFIepwDkiPYvPMKMDGPRMeox4CLeBPh7GkQYz+WmsfEprbKXMyn40yo9/en1pSXVzb64A0lEmo/ScHYeacyABGzG7SSMnPqIQpFm8KCHevHw+zaPYGg38gx3Yy3MIFHsMs3j7D7ErSz+/ixjYVIH+mBW7G3oz7Z3OdmKe86XjbZ5nnO+3JnYbJiLkd0zhFeSU/crEISVJvfax6egQVF6v/HLKeybfvkqvt4xlbBNNAcWxxuP8hbTG33YV79JoJG9bJZCWxp7+TYLof/X01Fhij1iJiBPcj7Rqy0ob5SSZajqInIT9RNX0OOVa+jPgjaLPWQJvUbHXPQWcbofBixGnx5M/Na6vo7LHiXH6pxwZMslefYgCWKWhT024j+jvHM54ra+GZqHCJODas74REqM6uyBhsUXwpgKJFjlcUq5urW6zIcKSDoPnpTOg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(396003)(376002)(39850400004)(451199015)(66946007)(66556008)(36756003)(8676002)(8936002)(66476007)(2616005)(186003)(1076003)(83380400001)(86362001)(2906002)(41300700001)(5660300002)(38350700002)(38100700002)(478600001)(6486002)(6916009)(316002)(52116002)(26005)(6506007)(6666004)(6512007)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ocmry6wDj48RmYRN3iOu+IAN575XUaLLSBrH/kFxJHUunbLUMZ1eeV2boxou?=
 =?us-ascii?Q?fz2IjTXhLCctMTkdzF17Q4n6NDgi8FVyKSI3NWJDUeIt7QeGmCCYEpIbhrsy?=
 =?us-ascii?Q?C8a0M9ZNkuJisoaNnL/t0qWY75Jlpqn1BBAGwxaYGOdo3EJQHpgFT7Urjdx7?=
 =?us-ascii?Q?PhoyLUuXK6StBbEbas1HAOqdj/J3E6ToK5Jc7/ptg8tXVblvhE+1Nl3xLK7v?=
 =?us-ascii?Q?r0Z39x/6Y3762Bq7qx9jgzrz+3mQ+qLI15t6mDZj0lYOZweMBBSWCH6IlFR2?=
 =?us-ascii?Q?tyKSiRT26k01mZWxptSNVNiGNXSiTaBk/U8+UEIQoZRyrZkqgUQ8Yy+fcVON?=
 =?us-ascii?Q?lMcSeDDWv+4LU3Qrk+sEVWrz+7zgbbLJnGAQJd8faYQjDWHqVv9biweDSpfz?=
 =?us-ascii?Q?REn9AD4td1nNEVxxcjMWKn1HS85mQswk6Hg2FdVj27C7+eJo8VyelhZ+R7h5?=
 =?us-ascii?Q?wAlDtCHcFarTtMD1uAv10ar8yPI1g6Q81NNx/qPNoCSAmKj2ZbpOBzoDQvGj?=
 =?us-ascii?Q?ANuGI/cBXskXi6AmFO2u89EmwHUTi/TDe0YRfGJ+OpOlprmcRWutl0yJ5SrL?=
 =?us-ascii?Q?8tK0EYUD6FTu7ORKUWM6tn3qAN/W7C8RrGdgbbvgdIK5C3LMWIqFxMtjNiWN?=
 =?us-ascii?Q?sHeozJOYX47WzhZ1mvKfjuNqYMq4LLwdMdGfljrs6ufxUUaQF6CLom2s/A9j?=
 =?us-ascii?Q?gU71gsP42y/MwUi94H038Xao2IFnMnLSNRq1BNbl2gzeInQ5oarFhYVeCnYJ?=
 =?us-ascii?Q?W8nlyHNbbLP0hSDoluFmY3oTjbBXLcxuTMg0N1QBKiuelJn+3z6XShR+Wsxt?=
 =?us-ascii?Q?ZzUua6Zcz4XPYL1K3Y8eSO0lVWW2G5vDAwxsiMvOk7sW4cVz3ze9DdJwD3wX?=
 =?us-ascii?Q?ELfzUnEdG3aKYCmV/MClpx35bfsmH/RZzIOjVw0s+KcAZrecAUZIidKa6byX?=
 =?us-ascii?Q?W9m1yrbHsFsZGPZ3inS+8Y2RmZp2iByFiDsDqJd0wn13aIpNd42mtLF21xMb?=
 =?us-ascii?Q?NAYPda7T9r0Zmr75oVLWqf/7GYGIRQNDVTYA/x1TlpnmgSi53bgKja8El3wd?=
 =?us-ascii?Q?Yqc0B9Cu2k+EZG46d+1YzrmNxvyjrP4lR2O9vG1vvVrdZykdfyBRr77eICJy?=
 =?us-ascii?Q?ym85Lvup7+J+rndURyRsmKWdsl6Vgg6aJamkeWxaCTQLmj7nzQ+hqqqR9KLa?=
 =?us-ascii?Q?ClS7cID752W7BoFQfth6xluuVe/JcSqzs01zia4rioFfjNykwyMrf5uskekk?=
 =?us-ascii?Q?TYTwcvn+4pxjI1sHx9o8ltzGpjRD20QcsqT0LzvQ5vukZ5D1KOM31lM77GeR?=
 =?us-ascii?Q?adf/vGAZvlwzHM6XUMkFrry/QDorFyW+nfEBSNP1lNqn9aBildvyoAloNAjR?=
 =?us-ascii?Q?z6JwMPFDII+oONOuaUnB+eTueuLZS23CjmIFEljqZdEHAUceUhJK+6qa2ASS?=
 =?us-ascii?Q?hFyQQgXjmBuJNvlqziOAU4yIzRFtgS+0bYGw0rfVHr8C+cgMSuFLXyWosDss?=
 =?us-ascii?Q?/linU6TYTZo8l8rJDHaVN2upP+Pz8dLe/aI4xtAR5zZTjSy2zzlL6CuO/x4c?=
 =?us-ascii?Q?H63FoLXSnE1V4pLf37dLm5NM8eG1QNo+tveIylmd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b27cea-7176-4eab-3a40-08dacdc76854
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 02:55:57.1848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fW+pS/gOUnoo8VPVPDDIftBml7E5GuswK8KjaVf7MYCBW+s3OUqUA5o8ZN47/rJihWrvJtZkKZ4kKi0+rcyVKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7719
X-Proofpoint-ORIG-GUID: PU5_LX4mZVJDNMaL9EudOEhympRidKY3
X-Proofpoint-GUID: PU5_LX4mZVJDNMaL9EudOEhympRidKY3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_02,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxlogscore=862
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 02:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173732

For now, there's no easy way to skip some specified tests when
using 'oe-selftest -r'. This is because '-R' and '-r' are in the
mutually exclusive group. Looking at the codes, the codes have already
allowed running specified tests and skipping specified tests at
the same time. So move '-R' out of the mutually exclusive group
and change its help message.

After this change, the following command could be used.
  oe-selftest -r A -R A.B.C

This does introduce a behavior regression.
Previous 'oe-selftest -R xxx' needs to now be changed to
'oe-selftest -a -R xxx'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/context.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 78c7a467e2..c7dd03ce37 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -154,9 +154,6 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         group.add_argument('-a', '--run-all-tests', default=False,
                 action="store_true", dest="run_all_tests",
                 help='Run all (unhidden) tests')
-        group.add_argument('-R', '--skip-tests', required=False, action='store',
-                nargs='+', dest="skips", default=None,
-                help='Run all (unhidden) tests except the ones specified. Format should be <module>[.<class>[.<test_method>]]')
         group.add_argument('-r', '--run-tests', required=False, action='store',
                 nargs='+', dest="run_tests", default=None,
                 help='Select what tests to run (modules, classes or test methods). Format should be: <module>.<class>.<test_method>')
@@ -171,6 +168,9 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 action="store_true", default=False,
                 help='List all available tests.')
 
+        parser.add_argument('-R', '--skip-tests', required=False, action='store',
+                nargs='+', dest="skips", default=None,
+                help='Skip the tests specified. Format should be <module>[.<class>[.<test_method>]]')
         parser.add_argument('-j', '--num-processes', dest='processes', action='store',
                 type=int, help="number of processes to execute in parallel with")
 
-- 
2.37.1


