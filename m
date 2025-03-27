Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70041C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 06:22:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43811.1743056526434005291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 23:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5181519be0=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5wYHU005249
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 23:22:06 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hvqkd9k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 23:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgIi/FHlIMkWkDhgXSnuoemXiF5hkgFqrvc4H7p4263bp31e3Dei79wEhgep8t6gtdk9ZztOeSaTZvu7t4MnOPvhNVON4yHSCVn+lgk/Ur8+dQIghfYAhyJ8H/xsYCvfn9rmdmKeB5eeHaonn7xd9Jbvaqtvxx/zqunAgc2jFcwUzb2Br9u+c367TgVyaptC+kBxCjNjIV/eREVoRsaf0maL3/5WUjjCFRT+ilcK92xa7IuBoa2WoFakXEt5bcWP8gCbZdkD281K5vsYA6D31ZmHZzBHtGPGgtgK7vbp+CuqJ8TtAD+G4yh6wDx2KfA6dsydRXTOBhRwZwnZHKInHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azuDI7LGgIpnwOy77zEEPcXbDVSXrv6wKDvbgBAb6h4=;
 b=nSw+6ZT94JeDmbUYuIDcmvp1GEV9QQgMtJbB9p7My8xhfKcYQ7I63Z0UkeUSPzVMkUuMt3IuEEPJ0lbBlSyDwivp4IRzvuaRtgqgz5tT1Jd7agqCExPQpTQv5IT05jUBGO/7klxexqxhZfDQ3vMqbcIBcQ1Jmuw1g5mL6YM63jnQs0ErC/SL+uH4sqHvTAP16O1YY1D25Vyh76fUbKzjORGXUASp3WrWYB+8qPKWsf6PhY9Z6m5Yg5NTn9QVonuEHUYLS4p97wK7BnIZeNQmJM7gp6CjnWSQVkkExp9su4gWJa3ruKl6Vflwa5IorO/zF+KVgTEHYPZw+zFZz15hqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA1PR11MB7869.namprd11.prod.outlook.com (2603:10b6:208:3f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 06:22:03 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 06:22:02 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Subject: [RFC PATCH 0/3] Add a mechanism to check runtime and recipe version mismatch
Date: Thu, 27 Mar 2025 14:21:41 +0800
Message-Id: <cover.1743052694.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::19) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|IA1PR11MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 159f51d5-4177-4d01-ce69-08dd6cf7af8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2dVNSvStoirYnqxoBTq+JWliFTFbY+koUDFGecbZ2Rwa7p8HdRzmf3M27tV+?=
 =?us-ascii?Q?vYILmjac9XsIZ6pSX8R2TfaBhp1D99n7/G88g662PPBR+TmD5PTybuek2WU6?=
 =?us-ascii?Q?hzgkq4Q4tZzg0YTVKGPcr+OOs6Fqbhs/oEzh/tuIkKcx2pKoGbJVqr9Q0dUZ?=
 =?us-ascii?Q?0EqDBDdSzIyY3VZNw9gYGavk6b3U1h2+lzkkyqUZlQjhx7/Qkjdn4LBzZva9?=
 =?us-ascii?Q?BeT+Qo2KMj7H2WqMCKvcUf0WQMqtVhZRq+36dDtkBPejP2RDvU+rLH7OVhrp?=
 =?us-ascii?Q?Gi+QwFMx485aesJVcD021E4AUy+eMGRqBnSP7UixqFezf9SZrxcusARG2JJ3?=
 =?us-ascii?Q?DwuYvPVdp73q6fjNltc63/hYQSL50ecqkLLLI38JMB+LIA3mOiOYVjfCb3gn?=
 =?us-ascii?Q?LYHTyEEG5FtXtWQIe0XMf/HmGvNWhvaWukVX843BEFy4K2ux+auCSrsNEeHN?=
 =?us-ascii?Q?29N14NO9Rz/Hn9jnPMTQyXNwBXmvzxs1j4Ar5EMYt1T0kV3YzWaJAJ9VumRO?=
 =?us-ascii?Q?arg5DVR424TL1gd9or56iHmmPHd2Y7odcx27/LE3UHFxL7PnAj+rg+qUornN?=
 =?us-ascii?Q?r9adhCyhhHqp9G5eSxO4yL0lQyxyaKU+Pxhq8rqZ4JKBUEfm7tDEwV6rDcS0?=
 =?us-ascii?Q?zSWxxVj/kkOt/dGI0BROj6j9BAd07ihp47Uhz+t2RFJ9PEEXYrfFFLKn785F?=
 =?us-ascii?Q?bvOqkdF2aQmFj4QOMzxqWJHscMt+A+z+4NeZL6tdDpzo1cIMlqHGjOwEOTiW?=
 =?us-ascii?Q?hZ52bXTB/+dzxwBrY2Im08vEe15M2qAMcutP6807khXGgewqt8pVzxPwh2fO?=
 =?us-ascii?Q?GDyBGAHKrAMRfmGqWISR0JyNTjr5TxIPwoAfnSpzoEXMs33DvewPX0W9MvLz?=
 =?us-ascii?Q?ZCs/EM0fAfSQChcJLHOFjtsKAOtbExbDipy8yquvrMBJHHxdytB1xDc072GN?=
 =?us-ascii?Q?mGsmV8XNVQhtedmchIUuEOIC9C4842zdEpDErRUhwgYVjlJRbBzkN2hhHUmB?=
 =?us-ascii?Q?P5PEQpr9c9G9V+/wM3e2XqhB80o/y8g/GgzyFFvrqgSLv/dIBAlniI1ZG0K7?=
 =?us-ascii?Q?lsKeuEd+EozZoksO4K+jAsrTPPiyiqiiFomQQ4Dv2xwa8VU0vrApx94I32LR?=
 =?us-ascii?Q?Q/odfpm5sf020R08kzsqIPv1RpBarN3tBHzlVEB4cBk22zLo0QMI9h0qUYDv?=
 =?us-ascii?Q?sneddEiFT3OVXCnw9p9FRB4j6x8/KXcuTpsfzDDgDzNgxGiQR/8Q1YWV+Xv7?=
 =?us-ascii?Q?1vIU6mFNZ4nWx8vxRDIAp9hKAkBRuJ9J2AL/HqtNW2C+vd9NxWoA1t9p2RgD?=
 =?us-ascii?Q?I/XkX/eEZf6z5+qsYewoHQYGdpQkKSJ5WC//xzl10N/OOcwUTBz0eInrAvnp?=
 =?us-ascii?Q?hg8d4mqiPfqMJY0V2UShPdgrMQf5cRLBM8hvbRuMiy286w6gPA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Rz+IGJAtwHwGoAFaHEJNOV+lYWKmtrbCrPCyosdc1T9qcS6f5Ysh2kZQVyUM?=
 =?us-ascii?Q?Dwfw0WcA7C73vgJNlRBdxKZuiqN0aChFNQsirRbcKtLB87UdHZf+nx4tDeFU?=
 =?us-ascii?Q?oWB/fTrfqYEWl/dEPmQy51miFWW5jvGUGejyCjfLYUfuBzTk50FxNJKLsp4L?=
 =?us-ascii?Q?910DnSx3EBwMKwJomkrXEN9VEKflqzIF5IQKIl+hYwXQT6DxHJv9xeTns6gt?=
 =?us-ascii?Q?N+P0JAYPIdlZIWc13PW6kh+SJB18zmmR0qU+lfjqgcZ37CeAjUHsOIpWUmvz?=
 =?us-ascii?Q?0S2LZt5/qRDqLsHk6WyZePl4pNMlgIPhkGY54xcReBazDZW0Ki48ew8BVtdO?=
 =?us-ascii?Q?u94p/lRBNZJELIyFscmzCee89akZijnkwOdLlAiDTn7F4UDYMApqleciFKhK?=
 =?us-ascii?Q?MDTGhQwDlYimrnc+KnjfVjc4/7EMSKvs7gk7u9pdLP7aplltqq+/POz9rl6L?=
 =?us-ascii?Q?JmK9p0HCzNwwlvllI05I3K8AyWbOmLYS8NiBQK5c8eRWfip4folRX5Yp3UQ8?=
 =?us-ascii?Q?9NpKdyvcjtGMka62NlxtXtVWekzrbEeSFzs/dng4QfL8Kq1m1fucZ6buB8q/?=
 =?us-ascii?Q?bwMQ+7FEMwONcrKGq9KbHJpsfmwDIBKxfTSlTHbQ3+8F7/kQzYwp7NTEiynC?=
 =?us-ascii?Q?2EEYpjHPxriOS8ku6XjqAef0bq2DBWvsYk/885qvsVhKDS6p/4ze3BeJI9hW?=
 =?us-ascii?Q?UOGu1LD86E2rC4KQPtdYR8EFi6fpRQ+pEJsKks06Mx/j9h9TtV6hYfBc5GXi?=
 =?us-ascii?Q?qX30TOCRp18DzhJdoyiSp5qTGKrPDvhpSS6Btxro68giImUCfBM/TtMNuD37?=
 =?us-ascii?Q?w/2Ly7s4+iD+Jv0FxvvbXsThSXODQy4u+FQ77xnDQaYt4GEVihtVAHawtpFB?=
 =?us-ascii?Q?/4JcQaTo/QZi/wCCFXwbZ0tj+/gnPppRFSjdZYovm8Ssvkfysrf84WhFgHk/?=
 =?us-ascii?Q?vQmkq66i4GisU/io8ShFaapCcwcOA6QmIwQxbclAFK7MV2qr/i+GaLVWt/jh?=
 =?us-ascii?Q?F+PXeszPrQZC3aXwZ8toavtpPBxoTYdqWiMz8ydLpEdYtJ1pBYq4shx31uZM?=
 =?us-ascii?Q?aQ2+slmwTwWAyJDUtcTwQA4+b3RFKyJewlfZh7m/eWFQyNSUVhARCAk4ToK/?=
 =?us-ascii?Q?lOYcqKnANieKT54HbXClpzIyFKeMnCZp+wQeoQmzlnCSIEngLWDttsrhfAGB?=
 =?us-ascii?Q?fUNiMYB8E0Cjb7Yy5idKR8mF3jsKtHjwzoRobElKmp+INiBjB9drM/Oblecg?=
 =?us-ascii?Q?hvhK645233EIXyxdaffVRCIOUeZnIc7YTKWuABpEd7NQIgiqp952K/28ntQL?=
 =?us-ascii?Q?u/o1T89jR5Aw3Lti2DmYeZ5x7MmIpPCmU3+sPnMocudwb2J7yR7BI4kVw5o/?=
 =?us-ascii?Q?AGcwsKvsBqQ1UqFgDSV4k5YFHejjIdtdO3pbu2kqs76IWdBl4A9JIMAmK5LW?=
 =?us-ascii?Q?wtjQjf1byj1d6caxbqcS2cVxy/If7In+h4obNpH4+36ryDLKcVbne3TkyWvo?=
 =?us-ascii?Q?QhDLxL4xFVz+/5/65BnqrdOeB3AH5ixHzeKWpDRzrrNdpdLMKS0U6+YZiQzB?=
 =?us-ascii?Q?auo8Y9UszCGE7WVScRqLlUhKSBBzHud5ZtiF8yaD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 159f51d5-4177-4d01-ce69-08dd6cf7af8f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 06:22:02.3766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoRs2ab2x9mXIEb65255faTSO8IL+0lkP0MdxskA9wmpTgvzhzkh19qSkXpYW+YpwymxdYKMPe3Y5XwNmEveXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7869
X-Authority-Analysis: v=2.4 cv=XNkwSRhE c=1 sm=1 tr=0 ts=67e4ee8d cx=c_pps a=FmV7mXqD6UovpQmy5PTGeA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=DxEYq33yoFQCuKJewsIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: vwWpTbXtEaheCOJWtj1eRVaaPds_HYzk
X-Proofpoint-ORIG-GUID: vwWpTbXtEaheCOJWtj1eRVaaPds_HYzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503270040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213705

From: Chen Qi <Qi.Chen@windriver.com>

This RFC add a mechanims to check runtime and recipe version mismatch.
For example, if some tool says its runtime version is 1.0, but its recipe version is 1.1,
we can now detect it at build time.

Let me explain the most important thing in this cover letter: why.

Briefly speaking, there are two major benefits:
1) Make things look better.
2) Detect potential problems.

See more detailed explanations below.

When people use some software they care about, they would type "--version" or something similar
to check its version. And if the output does not match the package version that is installed, or
there's some "bad" words in output such as "unknown", "dirty", "dev", they would raise questions in
their minds: Does the vendor really know what it's building? Am I using stable versions? If they can't
even get versions right, how can I trust them on other things?

So here comes the first reason on adding such a mechanim: we can detect version mismatch, we can then
fix them. This makes things look better. Patch 3/3 is an example fix.

Another reason, which might be a more important reason, is that it helps us defect potential problems.
First of all, version information sometimes matters more than just showing user some info. It affects
runtime behavior. A typical example is k8s. If k8s is built with correct version info, it will try to
pull major.minor version compatible images and do its work. But if it's built with a wrong version,
either init fails or it pulls some incompatible images. Secondly, a version mismatch indicates some
potential error. Use sassc an an example. It got a version mismatch because it's not using the header
file generated under build directory. Instead, it uses the default one with the same name in source
directory. Luckily, that header file only contains version info. But this case demonstrates that
a version mismatch actually indicates some error.

During development, I found the errors that version mismatch indicates fall into the following categories:
1) The upstream project made a mistake.
   e.g.,
   libuser got a mismatch because upstream project forgets to update configure.ac/configure files.
2) The recipe made a mistake.
   e.g.,
   python3-pyyaml-include_2.2.bb got a mismatch because it's srcrev actually points to v2.2a1 tag instead
   of the v2.2 tag.
3) Some corner case will raise a mismatch that normal build does not see.
   e.g.,
   If we build libsass from git shallow tarball, we got a mismatch. The "Version" field in .pc file is
   7073 which is wrong. In a normal build, the "Version" field in the .pc file is 3.6.6 which is correct.

With this mechanism added, we can detect such problems and fix them in time.

Hope to hear your opinions.

Regards,
Qi


--- Result for oe-core world build (11 mismatches) ---
WARNING: python3-unittest-automake-output-0.2-r0 do_package_check_version_mismatch: Possible runtime versions ['0.1'] do not match recipe version 0.2
WARNING: time-1.9-r0 do_package_check_version_mismatch: Possible runtime versions ['UNKNOWN'] do not match recipe version 1.9
WARNING: pinentry-1.3.1-r0 do_package_check_version_mismatch: Possible runtime versions ['1.3.1-unknown'] do not match recipe version 1.3.1
WARNING: gnupg-2.5.5-r0 do_package_check_version_mismatch: Possible runtime versions ['1.11.0-unknown', '1.6.7-unknown', '2.5.5-unknown'] do not match recipe version 2.5.5
WARNING: dpkg-1.22.11-r0 do_package_check_version_mismatch: Possible runtime versions ['1.22.11-dirty'] do not match recipe version 1.22.11
WARNING: libgpg-error-1.51-r0 do_package_check_version_mismatch: Possible runtime versions ['1.51-unknown'] do not match recipe version 1.51
WARNING: sassc-3.6.2-r0 do_package_check_version_mismatch: Possible runtime versions ['1.1.1', '3.5'] do not match recipe version 3.6.2
WARNING: libassuan-3.0.2-r0 do_package_check_version_mismatch: Possible runtime versions ['3.0.2-unknown'] do not match recipe version 3.0.2
WARNING: libksba-1.6.7-r0 do_package_check_version_mismatch: Possible runtime versions ['1.6.7-unknown'] do not match recipe version 1.6.7
WARNING: libgcrypt-1.11.0-r0 do_package_check_version_mismatch: Possible runtime versions ['1.11.0-unknown'] do not match recipe version 1.11.0
WARNING: glslang-1_1.3.296.0-r0 do_package_check_version_mismatch: Possible runtime versions ['0.97', '15.0.0', '3.20', '4.60'] do not match recipe version 1.3.296.0
----------------------------------------


The following changes since commit 6610cad12a062592956257961a790ec6a3012b8b:

  bitbake: data_smart: Ensure module dependency changes invalidate the base config cache (2025-03-13 21:21:04 +0000)

are available in the Git repository at:

  https://github.com/ChenQi1989/poky version-check
  https://github.com/ChenQi1989/poky/tree/version-check

Chen Qi (3):
  version-check.conf: add mechanism for checking version mismatch
  mc: fix buildpath QA regarding unzip
  time: fix runtime version from UNKNOWN to 1.9

 meta/classes/check-version-mismatch.bbclass   | 399 ++++++++++++++++++
 meta/{classes-recipe => classes}/qemu.bbclass |   0
 meta/conf/version-check.conf                  |  14 +
 meta/recipes-extended/mc/mc_4.8.33.bb         |   1 +
 meta/recipes-extended/time/time_1.9.bb        |   6 +
 5 files changed, 420 insertions(+)
 create mode 100644 meta/classes/check-version-mismatch.bbclass
 rename meta/{classes-recipe => classes}/qemu.bbclass (100%)
 create mode 100644 meta/conf/version-check.conf

-- 
2.34.1


