Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51CEC28B2F
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 02:18:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5527.1741832292307693607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 19:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5167d38173=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D1oVxu021683
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 02:18:11 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0ga1e9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 02:18:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvmK8d3Ikycok+QZYUrGJ/hq1Uzd2cDqeCM+3g1G+YdMbzSOmEVFXi35AKafGIEWwzC22CBa1hYlDRchD5NCrapUqiOpP+uxbKOaocgsQTCe/bsqKYF5OYJd/8rT8bO9F9qoZI9nE3Hu54yTOQ49wzSnMe7ELoJwYy5SHgL+SXcvBfHcgQiQLyMqfy5+mjelli1UP/lU7tO2JIfEzvA/kxsnzf7DHIGsFcow7lYg11OOiCXW5nEHzH7VWih+4xpeBWEGgu8KSh4++OVJvLL0SLEzclNiqu1zTR0dKm0yrAD15dtBAiIFMrakvuW/U23JbtVW0gYjcfRRANcMxxLsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncMCk4rlsuNofNQCHDKvYZ5tWrHgWwROCsjPupFlsmw=;
 b=GGOybmGDq1JHn1jjYXtIGl1JMQaT3CWIPjPd1yVDnfsDWKuBflsw5qpq7t3FMCPVCvxWY8WmL81tOLlUPlhu0OtSz/ZjEuM0z5ttaj/5aWUxtIBBMXxu9iOGNMPSkOF81hm0mRThd5TkEg9C4w2sx8rvKIi0g2sRJ8STSggjwed/Dvqv7h/CUx0CEF9utr+gkRTq76wXFEwiJlDbwY5eP4KHWrdE13UynbpWSEuNfVypFBze7L9RG2cly+B58pHWtRAQ2rcJdBzF//6degXqOScxRApwRqKJ0+1HUnXKn3SPUoMExsleCDXGi9yFh45FJ5HayEmN75d7rhQDlQo3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by PH7PR11MB6555.namprd11.prod.outlook.com (2603:10b6:510:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 02:18:09 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%2]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 02:18:09 +0000
From: bin.lan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v5 0/1] babeltrace2: upgrade 2.0.6 -> 2.1.0
Date: Thu, 13 Mar 2025 10:17:50 +0800
Message-Id: <20250313021751.2313822-1-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|PH7PR11MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: b848c34f-5d29-487a-5b81-08dd61d54c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wV6IqzxwPLiG7YyjY7+gDLzgJh13w/3ZNHhLSGXBGGRAx5/UFoKwFTLz/YyP?=
 =?us-ascii?Q?dH/5UaN6Enp3EzIsx/t3xradsH85qPBvOH/UwSJLRs+QJDZ705sCkDmi7/7v?=
 =?us-ascii?Q?Ek9gcdwhRkBl8rBruvpmqnL/mYIRzyUKAPnMWQX5vx16Ci43WP00MCT5nFuR?=
 =?us-ascii?Q?iOBHyGH8Xzx06y0o11yBf0PCl4+2IQjmr/cRN6ZhC3zJhcXzAio54O7VJKDV?=
 =?us-ascii?Q?BhHie66fknwcSm+/HmSY4VB/TE0145D3nj167jk3K4BwdcTuTqTQUbNBXRQD?=
 =?us-ascii?Q?+vsG0hNwKSoKQ7HICgRIKE4diNebcG2xT/hDU4DAKPrkCRiTqjzhSLSrzVQ6?=
 =?us-ascii?Q?7bax//cmvgCFs2ChCHxHfUluCG4w0hLFjQqSnrIAbEfcaderzz+CKVOVvH60?=
 =?us-ascii?Q?pldw5LKLUoOwmMVgbG65ND1WUM72YaY/b/yrsafe+kihZXUcEOBUeHUg014x?=
 =?us-ascii?Q?WD5weS+WIzkb38jq4tBzjJBHsvmEhIQwW3HYQJ6wW3Cn8ovroI7xWqYsK1aM?=
 =?us-ascii?Q?0My7B5DOtmCselH/dhzM/Sp/ZGWQuGB4CtJTg9F+MnDGX3YTga+50cWinuij?=
 =?us-ascii?Q?aYC8Yx5/kEC+abEleavedluraUoz1e1d6bwm7xksIbJ73IDkCQOkuuokCKjr?=
 =?us-ascii?Q?/phxkVtImaB9jCnfLUsOncUVXiyVmP8ILj54fh9eJMqDnnzckOLM5CNpr6dK?=
 =?us-ascii?Q?hFVt/TjDSgD+Flmu0KcrV8P12zaOGvSqlY8xzQUIBi2t2M5HBb4jcvfC8Y+P?=
 =?us-ascii?Q?4Jj/0xkozCbMnk+9N7Jsym/GmF9O5FXSPILEJ7sFhk7cKr+JFivIqZYTfnWb?=
 =?us-ascii?Q?p8pACxqKqB7gAuim7HYcLj2ZW5/Mv8SgiqBm5leP3fnybj0OJR+noePKo0AQ?=
 =?us-ascii?Q?tKkIYmQqxOoci24mvnpoSwLx49txtg65gMLQddJ6jM5ndwI/d/SxZ58HNko6?=
 =?us-ascii?Q?6AuPw7TyPd98TBP71qd5dGY9Dj4UdW+0ug71b6LLuekHm2aj4oNAxKItisKp?=
 =?us-ascii?Q?Mdv947GDmF+D1QCgS7R+AsmroF57Al1Ft/EqXRTdPvj6SIDc3gc/fqhJPXc9?=
 =?us-ascii?Q?EM4mxEvU8xO5pVLBmduwuafZjrv7c+FezLuHG7p2zieLGbLXb14fN20pVUC9?=
 =?us-ascii?Q?qcOXosMFQUpWwlIPZIFIzRPebfUDd7PbkbSFaBg+rMwbJsWpWFCVO1ADhEGi?=
 =?us-ascii?Q?2cI/+TwStQxbJgN6E6xZiKgkW+8c/+k2RGivLHl+uUkkJ/0/N2kL9c2/c2e5?=
 =?us-ascii?Q?XvuHR+Q57kNDKUH/2yMyKlMQhFCNcdKjAIChIofJzBpbNFVbRrpmjjU/osAz?=
 =?us-ascii?Q?5mXcfkt7884teDfxs/QqWJfFeX4u97MHjsrx7N0SH0qD33OLFT+x1xczkxvX?=
 =?us-ascii?Q?DoYH9yzpxg7EX5U66RUMmnNEup6DkerTV7rfNRHFhwM4/gze9MUhCgvLbuaF?=
 =?us-ascii?Q?UkoAZfBaMm7AetDW1fuokCmXwIgl5S00?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jmBBe8mtEAte7EMH8MJQ8s95aJxHnQj83kgXma3RKT0eIHC0C40lVnnjphhJ?=
 =?us-ascii?Q?uzthcZhTR1EfSpFn3gWZ92OAMHQefNGf7UeP2O32Ezc6IYAvr7Msj4KGHwb1?=
 =?us-ascii?Q?dFnBjmuqnwcGArB2X4L20yDHD/jI0Iw06Lgr3aUV/slpe1FESJVwjShcoGbZ?=
 =?us-ascii?Q?d8+nssjfnZsSNzAyzD2JRySTh+vRhs+xkjDxksOWviQwaLf1l2l16YCk21sB?=
 =?us-ascii?Q?AkY8sYyNtexrv1NhY7d0ErrVAPXkQhNK0ibRs+4Vvk/7xUvW1j3Yk+JpxekI?=
 =?us-ascii?Q?35cuKp2nCZyPaYzadd0rzw6R3saGxqudoVh1rM4z36ZDBOjYEkTnh+6CRV3v?=
 =?us-ascii?Q?2ZP2YA55woS5MQZPZVqIpCOvCewZSbpCGgxQHsUPdlQ4vrFHIiL0qE1CVb2L?=
 =?us-ascii?Q?dWp73xGGBcO0MDqw8WDWGxkKXl4pX7cPTViA/AzD5oK1kEbTpzENCSwPFtyM?=
 =?us-ascii?Q?r7vOT0YqysVH9vzivB4VwNG2FE0fusaJTmhgjuFEByB+TcCqxAZo6WLUbBrG?=
 =?us-ascii?Q?CqxlabG1gg1iviBHeUuooIlsSriOwT1jXoynEh4ZEywe1vRbL4/Fy3b2RpO2?=
 =?us-ascii?Q?nVZp0J5aGpdzyJgyFewknEn3UAvgeFmMAFjG5DcNdCWkdLixcM6Y6fhPtU++?=
 =?us-ascii?Q?UBbIjG1A9km/l3ErPsGx+NTP1Hk9UhPgXzwiK4u+7OpStoRMx7LLzW2um7J/?=
 =?us-ascii?Q?sXS6sBOieEqnXCgezUzHR/LAkoRAuFcJSMUYjX4d9tx2Ns83XPB9vKMVtOGP?=
 =?us-ascii?Q?ei7S8eOU7FAehTvAIirC9wC5VeEyEbxehZKyBd7E5683k4q+HaxlbWyzMnA6?=
 =?us-ascii?Q?KokKaN3l4AnXr7MXrLQdtiW6b15uEMOoBMLXw5rH5oiBS9KVd2+07AdonaGH?=
 =?us-ascii?Q?Rn2pwXfu1vQeCWDdyFawUnbSQKBilKmBeiccdLRobVK1MikZwFl1Yvchm/HN?=
 =?us-ascii?Q?VonWZy6elTMDoqgT5SksKJTJS52d9cbqdw1ycp7LrVIRp5lthKLufHne9WAy?=
 =?us-ascii?Q?ciWhWMIIMOAs8QWF3Fp5+lf4DqU1lbrtPKDl7PeCuKsX8mk3LpAYksKUGJnO?=
 =?us-ascii?Q?vfLdMAWFgAOysKerCvmZ4StmCW0Nlf5iY4UIcyYeW83uGgSqy+7bLAdZ7qfu?=
 =?us-ascii?Q?Z9emSmKOW1sdTpt/MQ2GbTDVkSfnXLrrxUIw7SqbXtPQny7/v+zyI/N6kn0k?=
 =?us-ascii?Q?p33TcYjawnyRLO9Tp2nopdf3WgfvVF5emssEBU8n5xwjTF8FE5eNGOZFeICl?=
 =?us-ascii?Q?vaId+rE0iPirIBlFF/RGKMNn+419hFqr0BsGfEZaiWqwNNWlwXAopIyQ41s6?=
 =?us-ascii?Q?YdlR78euZvOUASiLn47Jnk2ciIowIqTUsalV5zCJ8cTK/KRpTllX212MLyef?=
 =?us-ascii?Q?J4YGCDe6rp0xc3NbPEI854F6fBC9y4xAAlniPnG3l1AXy50UTnDvK8Q9hcbJ?=
 =?us-ascii?Q?cT7mbgzXmzFSIcTg6KwHg72V6gPK6yQ2VvMDhPIgDGKe0ZM6NLlGczHOvn4c?=
 =?us-ascii?Q?LCmE/1duBjALwGKUQWMk1bFTKoNcuBWVMPGNjeI741YVobvHUr57S11ukuhs?=
 =?us-ascii?Q?FLj0lbXJgojIGusnc1Xze50O8O/ZlEx5LAu33dhj7H8y4Ko2+jNIpxYEQdqY?=
 =?us-ascii?Q?/A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b848c34f-5d29-487a-5b81-08dd61d54c02
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 02:18:08.9710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzXK09jECjZWsSck2K2F0o12aK+t50Qt6WpgP4I1qVrcNeUW+yp4Jc2PTuuT6lJ/xZciT0Na5RroZRHEdnmEWT7o0gnFfAeMrB+KgRNUpRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6555
X-Proofpoint-GUID: EI0q4o6Rc0NvBqr3ZnP7QRaC71P6P5a0
X-Proofpoint-ORIG-GUID: EI0q4o6Rc0NvBqr3ZnP7QRaC71P6P5a0
X-Authority-Analysis: v=2.4 cv=ZrXtK87G c=1 sm=1 tr=0 ts=67d24063 cx=c_pps a=GoGv2RwMe+/7w9MjyR+VRg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=t7CeM3EgAAAA:8 a=mI1Z5NRhbHgcbJjFYI8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503130017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 02:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212732

From: Bin Lan <bin.lan.cn@windriver.com>

v3:
Some failed test cases are disabled.
All test cases are passed when running in intel-x86-64 board.

v4:
The Upstream-Status of patches is set to Pending, I will discuss it with Babeltrace2 project.
Add some notes in the commit log to explain the license change significantly.
Add more notes in the commit message to explain the change of babeltrace2_2.1.0.bb.
Remove "INSANE_SKIP:${PN}-ptest += "buildpaths" in this patch by setting the correct environment variables in env.sh.
All test cases are passed when running in intel-x86-64 board.

v5:
0001-Make-manpages-multilib-identical.patch and 0001-tests-set-the-correct-plugin-directory.patch
are submitted to Babeltrace project.
All test cases (no skipped test cases) are passed when running in intel-x86-64 
and qemux86-64 as the following shown:

Testsuite summary for babeltrace2 2.1.0
# TOTAL: 2022
# PASS:  2022
# SKIP:  0
# XFAIL: 0
# FAIL:  0
# XPASS: 0
# ERROR: 0

Bin Lan (1):
  babeltrace2: upgrade 2.0.6 -> 2.1.0

 ...001-Make-manpages-multilib-identical.patch |  12 +-
 ...not-run-test-applications-from-.libs.patch |  28 ----
 ...-fix-test-applications-in-cpp-common.patch | 129 ++++++++++++++++++
 ...sts-set-the-correct-plugin-directory.patch |  30 ++++
 .../lttng/babeltrace2/run-ptest               |   4 +-
 ...eltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} |  35 ++++-
 6 files changed, 198 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} (69%)

-- 
2.34.1


