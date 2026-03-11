Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEADEFD0659
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 08:25:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16143.1773217539680623182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 01:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rcdL9wA5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7530e974aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B5QN2F2801992
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 01:25:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=3XxWSxdoBBAnZaqF0m+a
	EhB6+yfExv+Cf9WRigE6f/E=; b=rcdL9wA5j3YDW0+s81QpR43D8OPT5kIg4k81
	11JFMUAtK/yjRJMOwDqNQXpBlTLdSyMje0zC6YwJTaGe4qtYuIghXbVn4xOOss6Q
	Gx7CsOE6DqXTPdRjAq1I05jmPETY3il9rADKctq37gVfDBiUBH45bS085DYzO1Mr
	lRoNoNp+TivhzGd5lY5U09NINVzcUMiD47SwJJX6qXAO2nBwPjD7VqhPnDIyNlV7
	0nyUlu74HOT3j6oX7k+flm/L3jXPwiH4aqrY7QlSmahjb5al6ALE9cRZ1u4O7RSX
	iFjjbJrqiGxn2kTSRuZc+yQHmwjXIHgUEOHxb5/FTV2gSWjE0Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010036.outbound.protection.outlook.com [52.101.61.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty3j0am0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 01:25:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g32OY5x9UhAtB5FcGf3QMkt7uQJPJGdglgJPJimxuNMgLgqlIsNSdAZKJXwIqH/C9hfsvGyIE+j6/hQYQskGr7kubCzW+06gYFYu6zsGVMWRYWkNCajJlHBLUJtjOt1CC15vCSxJkOaORLq+CM2/xGbgWz6Ze2a7hiDq91GUJVM+a/sR0zq8IalBm4au5IqSLf/Mq6p0ylJqA/WnWhuPtj3dFbqsS2nSymufvLW4oX/wLQN6IhjIQ2FdCDK5xR7EnCzA0NqMI7vLy+ID3NatX8FliOm745ZugMGHEeDgltQdCo/PaZbYZaKZmRyOjzZ0La/cnMLB/z82fTYNNDKy+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XxWSxdoBBAnZaqF0m+aEhB6+yfExv+Cf9WRigE6f/E=;
 b=AOdzMag839vg1vH1Wqp8BWav4fMjs8tHy9mjmKRE+CEeSDtF70d+0CSOngBk+qK4ufXEE6anbiWEQsm1b2DCKPBshsyp6q9ZJC7lNgoRCjSNQijMXVUEoETOeyVbpQtj7lvvVx6Iz8L8xa5FWolcVGoHYk9/3UuejB3YuK3eEFZCV70kfqqvEBXrP6+jmh88yo/8fmy7Lx71PVWWPfW432BvEDBnf7aO8JZGCSoUqJDEGdBq0cgmjEuo0Ee8PnCTglUlqLIn1Frivb1VRCk17pJSN85nJWZo+flIAp0yrY8ouCXxaSMn+sixaTQxQ+px7sDclvxCP+XvzxYZydMTAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS0PR11MB6350.namprd11.prod.outlook.com (2603:10b6:8:cd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Wed, 11 Mar 2026 08:25:36 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:25:36 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa-tools-native: fix do_compile failure
Date: Wed, 11 Mar 2026 16:25:23 +0800
Message-Id: <20260311082523.711109-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0132.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS0PR11MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: 9547e090-4ffb-4188-9106-08de7f47c534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	6V1C5tAmCtoYk75HOBf3XKGBybjmbTst5aChvTN/LDEYo5M0IH94eGgcmxvIZycpwkWhAGgDO5L+FkV+5/etg9TuHxdaeVrFa8eBoYRaV/ZEro79IoFL3cw5YQ03dfaiHPRaMn0INalL61gEgJ9/RZA8HtNqjI5xULBowrzc4oYBC36bUEwU1teBuyh7SSQSrZEEM0PvOBhmpccVsiiPQIZL1EEUxwgWO+C/20iJXGcz1DeJE7lbGhrUNR5AS/66iTyzxB7sGg7UJzW9q6dQpfzRtYuobIBiJaxBVc+d3Uv//xn14RqemQj2pn4UeZ68rEVQ41NbHah9zHeSay5MvsF5Lxqp4FzjsD1/iwb9NGqhJ/HWF5BBZQZ0xsWteW4Upxbf6Pt+ZwmSF94TFtJakoDkhJ/ejFfjmW0b1eR8QfmZGwyJkxLXw1xuacvEL8zqbQ13rXVkXsEu/1AZz3ErjilN0YTVXUgQMBnuKd8a1THgIiIqDSeDTg73e4jW4UaM5z7i2MMIuoWUHn7fWE8WQCVMGMzK7ZzggIGq92XJZpfy+hRs63TWlSGBgm2glQ9WRNVWcUo4ba/Y8K+CxyJhNRoXpCeDH7oIr029Djnsw2DprRlj98DIs9/dCLWXEYBao5SVOnsa77ZqVz1FHxuGwuIJM9HPl7/h80cGpIf5hRjE+jMX+s7OSfRy/UAOwcfIE9t3Ocvqn1XXLXccUaLK40Y9cT3BJ4SjIWxiGYi+aQEO6IRKbOsM1I0EjIdmXlWG7PVbyqFrVuRNjU4BKNm8ZVPUOY8ic8U0mXAfXpTCfbI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/3xoDPT0jPx2F2vxRQu6tal6NVNQkCp+kb2qAo3qRWPgIyhp5B170m4f3YLF?=
 =?us-ascii?Q?o+GqLijFTQ8gwKy2mMYHU2VCdmtSWCqOr48iGxJI0Eg9zRHjkRBdYms0CsON?=
 =?us-ascii?Q?87ZoR/a3hIzT3AwxoMfo6j2TmFmXNlPMhamKr8oL6DZPjMxRhMmAZi/5at+N?=
 =?us-ascii?Q?rJEgmVmUJGLDxM/vFkza2bMprjsDP2cws6hFqszlQG846XZIUHvPxP2CCNxJ?=
 =?us-ascii?Q?LkMp6+L28veYh5jkSF4AY7wGGl0WuNxQb3E5hfX/yOV7DHydAxxevQAbJjYt?=
 =?us-ascii?Q?PaTxG5hB2dE8em4+gCfiPINj6ztcMX1U6AFc/qLaGb0xWYTwFgx59wBnDbzv?=
 =?us-ascii?Q?W1GFU7ZxqMsd1YaAUVZ1uwigvdRcdOHiW6ixPqYX4lbXwur5B0ozBTHXG+SJ?=
 =?us-ascii?Q?ZBbU2WmFHGB964xBktK2oES3E2HnwNzZvjRKqD1trL0w3dDrtHYTpTfzHyrk?=
 =?us-ascii?Q?GL3ImU7q9GcZ5FxJSaT8e77/PVpsLwRcyNaTsIN7tiu3+I5S7jnYlyG2Kj9R?=
 =?us-ascii?Q?NXDY6lnCAWMzzBV0Wwo+5PHdZOdQbrr9Jf9RMv+nWPP0e8FXS6kXm1D72Au2?=
 =?us-ascii?Q?4vTijvggG0KCK0yQS4Qj1w2J4NwgzLNiupVEt8UOJpjS1TZBgTJSsUpQPjcp?=
 =?us-ascii?Q?B9ylOtLN2ZbPqXjsNcm/hj643C/vmgbgfJU39O+3ZLtYQUBXdLjz1qQkDClr?=
 =?us-ascii?Q?s/oqGpiKV+SvAGmkb7a33KrIA7GaPdP8YdcgZXx3M09u0qBNhhuI5qS4KhrG?=
 =?us-ascii?Q?8QFZ2fmf1jaI0lyBWWvGNAUgrYK87NYq9De4V1zAsTkvIPovGyzAvz08lPLh?=
 =?us-ascii?Q?nx+SsBuk7Wq7AHrDHEwlz6oX7JUkOdM2BkZIprXYQSVz1gBs8DtjLfDuDPau?=
 =?us-ascii?Q?pPdm0Mkv1nmtUNeUCHmfOEt7a23lkV7Vx+n/Izd6sKG3RAe67d9M7beppuDk?=
 =?us-ascii?Q?uMPOWWfE/n/h3kRCHTqsbd0wIyRmF5MC3jbinUEzcupzPPUk55wLg/ZYa3E/?=
 =?us-ascii?Q?kKm6sb7OHXzJhZWZy2vDWd6huOlYptlHqgDvrxQZaTZLcBtyxlyMinPuwoIV?=
 =?us-ascii?Q?ZT5JktkqYbDYRHnYk5MdpHA5EF7K0V+lhi7SGH7ApGycG6ieiHiQzd8EAO1h?=
 =?us-ascii?Q?xGuA0fPm3qSP7XpQ4cgZcYdWJgsmApAogAEbyl8AQ73ZQbcA/nqfNhZjkxxg?=
 =?us-ascii?Q?VzUXPrsKDOCiiDZ4y7i1B2AqnY+ybiab1Fh/C5T4tbymGlDNBvaR39ezLfoE?=
 =?us-ascii?Q?1M3p3bVMjdh6d3jLnE0nUb3gogRB9KtdkSdIJvbyhQnKXOqajRDE3TOX1w1V?=
 =?us-ascii?Q?lUtY7TC4sZnDRIoc7ryHSkptOFE1w12/OYDHDRa9vWkd5GunQ+nbbjMbdZJr?=
 =?us-ascii?Q?SHv5+lx0JBApTEGMIrOfZjs5L1kKqSiDzgwzaU2h9nG9ufqiL0TDNFlZbd6P?=
 =?us-ascii?Q?qsfr1MOpdrXeb61GZ0WJZD3VgRLxGwp0kKBp/kcxBro4g8qhq/3PGPTncIoF?=
 =?us-ascii?Q?lDk7Ol6keV5bWyTZQtA9fnxVPfi9MgN3ycCgDKJjBg5vh9EY0AeHf+YyZAk+?=
 =?us-ascii?Q?avzBCTBZrvW/xEoV0jFed9DQKWuyx/DqmAv4IN1wU+bkJWTxNsl9JoFnL6E/?=
 =?us-ascii?Q?wvTN90T+nBgWSPzIdgYhKKnDya9fyIAIKjv9m96WqYvA/J67fL7dbcO8Dq8t?=
 =?us-ascii?Q?H39CYHHobW9cBVTMBCwOrMF42QFJ2tUDczORuze2fSUVZaMlm9p0tgGPmAZq?=
 =?us-ascii?Q?L+k2+5i/1kFfuz1C54hJboa2twPC+7I=3D?=
X-Exchange-RoutingPolicyChecked: 
	legACvPD5b9fUkaRCKA76Nn9tQDGM5aQxvuIHwvlA61seF96vNYIbdgS1K0RDgLTdRvDu6J1lsJkH4mcNzTlYvw9Pfr5TQeOr2Lsums1SEiR5uXjPMBIOnoJIymkKf0l7oCBT2/cQZjU2OymNhvlfofPxaxiJBCGv4f1zp3et7HOyt9UEJU+pHtRNLKu4LKgLtvynJRfrWetfweTMgtrhDCWjtsiFk4uSPjUxFmSRUm262ULWH7Jpi6BTjSgnP0LLO//aB1pYFLsPTl76EjpR+dO/G4tkbPXFcwjTrx8YJYnVsV3PelBrqjb6e7mcDJRjPEjwPOjAi6iQrAp49oyRQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9547e090-4ffb-4188-9106-08de7f47c534
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:25:36.3936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHWNEEiPnlfRY/SMxjvlIxH9+m9C5RDsALVxnuuJPHXFGzffWdIMs9fvNVQ9fRypqFiLf6CiT6Dd2PNwOsZyU2jHhG0FVQ19rmQ0qMhKndM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6350
X-Proofpoint-GUID: pUYBkJey1x8qDyn4ZZ03UCtaObSkOMtJ
X-Proofpoint-ORIG-GUID: pUYBkJey1x8qDyn4ZZ03UCtaObSkOMtJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3MCBTYWx0ZWRfX3FMe7zrDr4mQ
 hEp17ricWVchf7wtY79SkpGnlREJnZPbBvOAzxbZ/+zI3DiWbm2oCGAGP66eGVYvVQtVo7/J6X2
 wuqPjDNFhYumQ8LIby3KhBnavDLKyqjOIBNss3QgPvSaxVBrDAReyFYrB0gunUpViaAcNwS9087
 sYHoDz2y61NDwzTX6Wa8UhHZy/Khl37eBNx3kii+U9E2hulqcvJ7fHH79ZEHHwAQ1DnB+oHr0u0
 0JMafEip9g47eQOQ5xDUY1MUNv9FBAJLg1P3fCG/MfQM9V0NDGpqPJm987a/EQQqsjyfOYIZvJA
 duADKkKmvYokK7HbYDvxm8RP+bBH8c4B5C90YJ6ok2NifvwDNCWNSalYwIGc4ZsO/bHYNvHBIP4
 7ua0Qysh+bdp6c6wWmUmHaF/pbeu5osrHLIQyBn48lcYSVvzfirvBY3mcG+ZMFmSLJb1KjVXrtq
 DLJXgdAYZfG+IOWnmAA==
X-Authority-Analysis: v=2.4 cv=Qr1THFyd c=1 sm=1 tr=0 ts=69b12703 cx=c_pps
 a=DYOzx0NG23oKzpQZkEOi/Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=uRYC3ThaN7X3c1J63GEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 08:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232841

Fix do_compile failure:
../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal error: xf86drm.h: No such file or directory

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-graphics/mesa/mesa-tools-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
index 50d2f5cbb0..743e3391e9 100644
--- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
+++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
@@ -11,7 +11,7 @@ PACKAGECONFIG += "gallium-llvm"
 # to PACKAGECONFIG like in mesa.inc
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
 
-DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native"
+DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native libdrm-native"
 
 EXTRA_OEMESON += " \
     -Dmesa-clc=enabled -Dinstall-mesa-clc=true -Dmesa-clc-bundle-headers=enabled \
-- 
2.34.1


