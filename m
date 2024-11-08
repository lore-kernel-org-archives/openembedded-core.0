Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46292D64062
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 16:25:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16997.1731083150909868438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 08:25:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=104247168c=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8CNF9P019979
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Nov 2024 16:25:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42s6g5gtrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 16:25:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FESN+T2wB+U9VF5Mz74/UxVxED3CmA0G5o7WMcBy3iPFUsDJFntKN4nmGWAyvV/oO3EipErmQBkFKiLcF57VF7P9a9mjapXwBtU+GgNsMmwbt8yeQhIYRfd+Krt+pIqVE+tDPypKVv2wv7+EyXpyp/wjzqa1knekTqw9POBulphARmnHl315D3mm1Bo+ZpP5wznhOaTjTf2Ubr6wTjd2I6LvRocuB3Rn19fwGbMxxf2jhU/3IY1UcDup3zZ2k4vYy9VsOJO3J5RfV2+IEL1WAGWnLxjxBQYrjUIbbN0Q4JDt21neqQuUIHMNcM27cstOPbfjLHkf7bc//Atodu4bng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uR6ZuMFqcpwbtSZ3/3pXirHJ/RPbbtLXI74Nv7dhZ0c=;
 b=WMXNhUkrt7OD42GciUZo2ECbQCW6LAcEiPhjkbCCkxndmo3xvh+RLAuXNqBzaJdaL4uSzB0fYZnwHy/z2oNfvH3Hp5etUeKZId0+lcW6aWyOzHiFQSRopvE3YLkfj+9MBZ3ByEdJkf0mQVWdjkMDkt3ZA031xxW9UjwqFPgrwxNvnAO4abvKDxnq0futWR6CvogH+IiQjqJyKjVEP/B1c+Gi3ZMU1wggh77tbeaDgzAefAitc9Om/XlB8Gdi05gU0Md+dsUdzmkRwBrBiykhGxDATyl1O1NhY08trbFA068hTjpFHmUDyKGEuSdbDOQ0DctEV+G1/XAf9hc5GTqBhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CY8PR11MB7396.namprd11.prod.outlook.com (2603:10b6:930:87::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 16:25:40 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 16:25:40 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] binutils: Add missing perl modules to RDEPENDS for nativesdk variant
Date: Fri,  8 Nov 2024 08:24:56 -0800
Message-ID: <20241108162456.297831-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CY8PR11MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4fe634-0226-48f7-4b26-08dd0011fc19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zo4mPy6ihzQTIh5W5hpJk+1GVrgLHqK6CHuMgNXZiu4wK8etPRTS67Ht89gE?=
 =?us-ascii?Q?CQuBudmDk8+8J0txruJbK+uhdGExdA8boismIx1xKRp6X87F9DIWCloQlED6?=
 =?us-ascii?Q?cX+OLs5xjKk5u9WRqm7c88BFYWaTkW0ZC4YwyWdgHiu0mSQ46f6hvVVnPsa/?=
 =?us-ascii?Q?U9vJ5aDqdvqyhd8kGfI0xaOVxpnE67xoDLo/eoJa4ebcQa2HafK3KSQ+/8Rp?=
 =?us-ascii?Q?WPk/TZ2E1yy9uGkj8/ajz0cgn/zpznAbGIvS0ZiSvnQwUGf67z5Rl+yOJELX?=
 =?us-ascii?Q?sjmsTzhIFC6SSqYNAsmU2FJTDiCysLPANvZiq0x0Q4pMvAyWXZaeGU8xcyt7?=
 =?us-ascii?Q?f8A7sZyOVU/lHOqhT8JQ096uXQ+M+q3tKVq/4lbpbhNHsxhJsTb7YK8lv8Tl?=
 =?us-ascii?Q?TiTbJ1Wk84CsaxIvFdlIRledv3YHWOCgr0U4BQZSO+ip3V1IpVoi0Kb6O6TP?=
 =?us-ascii?Q?AlM7yZgb0sBrjRzUizD1w4aB7EXtxKQKJ3HbtZrDKLKQAzW0jqPVIN5w7X8r?=
 =?us-ascii?Q?5EBz+u/X+nwdjlgYfVHSjhmDMI5q56Swqjl80u+9FX1mPFOBThgLHQMvx16w?=
 =?us-ascii?Q?uz8WYfNNNs4q0BuEKheMnKCS+w+XWwx7ZcAeTBGMITydDoq5kwmKWQhMMV+v?=
 =?us-ascii?Q?rQ/8oqXEIxn+Vl1n7i/IZ9b++bxhjcy04zxxo0VDZqdrhvT+GOJoI8dSqTD0?=
 =?us-ascii?Q?YWgnb2Eu8jHp+MlDlfuGZ+BQqgRW/mLqeALZSiG/hYJZ3vrwqgCq/8Mw5lqG?=
 =?us-ascii?Q?8YsGo1MIaZLAU1xIDBBhkwvmku/Xf1WkkrHSelb08ahiEw00ZTwIXL57btMv?=
 =?us-ascii?Q?UcRYA9FJ8o7blC+erRnez9kMexKF7svI+t00idOXNGjyuqLbak1u8qtqOYSC?=
 =?us-ascii?Q?e+eARxIp/AvroFbq/COMnlZzHOP8Vw8W+iu3OhoiP28zDMf3+7AeiRhlto4s?=
 =?us-ascii?Q?RRoxreGgQNbR4ehT0Rf8cYT0W1daTD6Wb6Huv1V5GwdNvJpvZCjH3hsEZauq?=
 =?us-ascii?Q?6U7h4WKs5wkBiwsuFBuAEwrZ8afI5wIX3tLzBgaJhBRv6DIGzAj0t2LDWGTV?=
 =?us-ascii?Q?p0/Tdj9Z+Wskq4T+RThoUPo1X7VmNdV5hDCssbzAYqlBSQYhFGqk6GoRECzJ?=
 =?us-ascii?Q?wFniuxxzXCZbszgrBBRyON6nLAHFkW7SAd4qpPJbgeugyH/wMxlojELhO5Wk?=
 =?us-ascii?Q?F2iJEC6nmtleveZRhmWOFfXawOP97cvdBsZ80jz9Abi8PSPlPC7fLp99yB0Q?=
 =?us-ascii?Q?NY4ixuk3x526P6VXQfGhBE2E0PGbs2QWn8pE9G1cuMHbzQbS1Ox4PfaKc8ER?=
 =?us-ascii?Q?yBhhoxc28mU7oQ8ITJsnXpRwTITFR8EX4EV11ZeAlB0VEoz5Q3yGOXf6nFel?=
 =?us-ascii?Q?fxXWkv0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m0esVs50nqDRDpIRM9NUIKrAI3MemyknpJyCj0/0jO29SlJDSt5urylsxKSW?=
 =?us-ascii?Q?vB1P7oH0d+9HQjO7LKlsncsQgjwp7ElhpbZq2dMEhMVz6lR7hkX7ICQjSZ+5?=
 =?us-ascii?Q?SKipFerWQEgngl72JDeyIKxVpL+l/fScJ0eSPHOFKFZVEG6S0CaZA+5wcfM1?=
 =?us-ascii?Q?moaqPF67x+szg9Zl6rtyBZhwaKlRFIJ39FgnMDuVaNw0iqMVhTmnsVrgjOYn?=
 =?us-ascii?Q?4ZmMu9VjYNYmoCOkoS/vVjUZ+djMOvj3pkBzTXcQwbRLPNUztiZFMzSE9K38?=
 =?us-ascii?Q?5uK/Opx52jfVmIVncgX5Mx9OGmw27cVHXyQs+IgPSAkMEfs7LZM+I6fe2wXc?=
 =?us-ascii?Q?CsqptpjyWAmnGEiDYBE+Gm7FNpHAkxpsgHhvodmL4F8pKTBEOOpJbhWDwVFJ?=
 =?us-ascii?Q?o1ZZxGP9UyIT0+YyY1CTq+91DzUZDFK6/Btd0ekrAdU2bsB9j3DiJuKpyBvg?=
 =?us-ascii?Q?2TKDCHnX3UoVI6UzSUbYYbA8Qi9gc4swOr6+9epnbAJwWGNzYjFLCoRLJ01K?=
 =?us-ascii?Q?UplBocZpKlTPSziimIgfWmi5qh7dROcu77oKLz8XD0vVYEqpZJyTDf+chHHc?=
 =?us-ascii?Q?l9h0dwujwB3LObJQP9iD7C2LuOuNtNGtOb5/BymFF9aPANHlFfzdAZ0Q2I17?=
 =?us-ascii?Q?spIgZq++hRy9yVmDomTQh4zLSx/1N5Do7352bc6Wc/dSeWg8jqH2EmglAkiK?=
 =?us-ascii?Q?O87DW1Bi3QrRxuVLusJKQUzJ8ZmwVQdAocD10k2pQ95IdijhENo8KF5hx6OG?=
 =?us-ascii?Q?KFncf37HUQ3sFmTqZc6WBi8AT0NEysC/4tEqW20k+rj8hTQIUkGFkeA235Dz?=
 =?us-ascii?Q?h5kskNxjvcoOVJfAOZ54Y4lkICuTdhE3tGoe9wKxZ6BP8PU5l4mcknlUNlm9?=
 =?us-ascii?Q?ba9F63+CIEAOW0bQDdWN3tQa42vWJ4HxNHY9m8Ri94Aa2BZGCd1M5zknxSrH?=
 =?us-ascii?Q?j7gLYpqjkigBHofMm/0byCTjJlADHp38n/DbahQfOSRdVV6QEZ1BjlTNLD8Q?=
 =?us-ascii?Q?0UsfSrDaDYVRyx/QUlsbxO+gl4IABLwVoCiJEyYmRgcbzdT+nCLCQ4sU5VxV?=
 =?us-ascii?Q?6uukM/tRBy4e6JUHS/jcZF02xacD29yBd6s6eTUsR3yDRPC/0RMjtfBPauYE?=
 =?us-ascii?Q?V/y2Krg+T3k69d8B6AC68g+qmYkD6bXfopsPvBf/+dBkSS45ptOvkoXw4pwe?=
 =?us-ascii?Q?5msh+HDjpL4JxOrnQ3QHbtHsjrCO9bDwS74ovDPF+Oo+xUitRYNLQoD0xoF7?=
 =?us-ascii?Q?pgNXvN+OK2VNeQsOl2rg5HUGYHUY5YSdX1oK6BSJ0Gt7iMZIl7lKX2p7k7GG?=
 =?us-ascii?Q?yABlmB496NgfhS0Z9+65qn8+CLZrKuC3CDAa5woZsVbOrLvHbuLLwO140xcb?=
 =?us-ascii?Q?Tn/hTN5Wr17Ia+olVd6fMo/CDnYhhwTgT3VxCcTI+xqxVfOJLyoqcFYtE4FT?=
 =?us-ascii?Q?7XYTD/nvFNUIM5Wu29IIdgP4BQMagwGyHfRV8fWZsZ4XHzitzFn/G1C4CiR0?=
 =?us-ascii?Q?32O6+y4sfvf3NMiNJLLHFLu6jF3Mp8b1TpETS1Jm5GJosg91VXA3/BUUnqjb?=
 =?us-ascii?Q?XHeGi4llRAaj3718mkv3EJvd0ivXZyYFyxSFlD6W+84RnPi+baxnOkUvxwvu?=
 =?us-ascii?Q?jJNA4M6sGi9NwZcC+d3rsRI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4fe634-0226-48f7-4b26-08dd0011fc19
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 16:25:40.1711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uu6ShbSwIeSED/XwuUExBIdfK8Vqfryxdwk+x5J0q72Lp1HdCB4dPChpZYDLr5KXKAkYrFyVd5i+kWA9quVxARX5VZj5mi6FlqR+qJPze7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7396
X-Proofpoint-GUID: Ef2l2Ebh9z6MSdhGgVNffAIgYy-rtEVa
X-Authority-Analysis: v=2.4 cv=JoCjr94C c=1 sm=1 tr=0 ts=672e3b8d cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=9kI4mcyhrz4WstpeQEkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ef2l2Ebh9z6MSdhGgVNffAIgYy-rtEVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_14,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=748 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411080137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 16:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206890

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In SDK, missing perl modules causes 'x86_64-pokysdk-linux-gp-display-html --help' to abort with below errors..
  - Can't locate bignum.pm in @INC (you may need to install the feature module).
  - Can't locate Math/BigInt.pm in @INC (you may need to install the Math::BigInt module)

By adding the following perl modules to RDEPENDS fixes the above errors:
  nativesdk-perl-module-bignum
  nativesdk-perl-module-bigint
  nativesdk-perl-module-math-bigint

(patch taken to master branch with following commit id: 05f1099acbbb10b6ce33ea117d313749f7dc4a47)

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils_2.42.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.42.bb b/meta/recipes-devtools/binutils/binutils_2.42.bb
index 2cce40f1ef..8594db9bfb 100644
--- a/meta/recipes-devtools/binutils/binutils_2.42.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.42.bb
@@ -72,5 +72,9 @@ SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-al
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
 FILES:${PN}:append:class-nativesdk = " ${bindir}"
+RDEPENDS:gprofng:class-nativesdk = " nativesdk-perl-module-bignum \
+                                     nativesdk-perl-module-bigint \
+                                     nativesdk-perl-module-math-bigint \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


