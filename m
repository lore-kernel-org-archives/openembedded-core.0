Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D6FC28B23
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 02:20:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2259.1741314045237619425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 18:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51615a5685=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5271bBpe008610
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Mar 2025 02:20:44 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux2ryt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 02:20:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpTGYheVxfNN99rVn6VUIcpWk88Eyj8MBukTrmwcwwu0OMDVVGLkjd/FTVQpSuyUZ2bQCZHvzjbuATyb6eTy/cXwYtj299yOQfZTjjxJFv7zAjk7Lu8EXEBgN0mpHJ3u/VFldPWgjHm8oNKgDu+J/VV15FFzFzIzFYEhGyehf2cTBGzuts/YNByYPJHy8CqyGwfbvDdXP4kG1HDu8C5FfOhAXk9Bgc1kJfur7ZTMWaKwblR3isYxIMemisk4BAbLDUteqcuYXB+L+USzxJQkiTbi0jKBvSP6knoP4Bn2KcleQknMRQSVtbdOoWk/UEL3yqOC08iR0dC4K6Jf1NZwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlsOnKoYyWfwvQ530WHsprp2DDZR+b3d7BLHsAvCbGQ=;
 b=gqr7pLF1JwF8JMGJBFSjnQogPKxlVLJcJz/005IvmNXoSW/BVaSHUM1jlNlC86brnPJ4OS5rRTJ6JJk+UCSd/pjr3csyaa7mDzejv527kaWDRn+2jUl8pdmS+xYw4sYitFYkPDSya0hXDOyL+GzAssUwXru8jimasiUFJ5NYabWkbY2le86ofCdLVo25twM6jCe0ucUw1qsOL1CxAarivaACQe3Y1tl96oNSothlK0zEbayP9clslwlNQwObZBiO47tZENWzGZB9XcWXmHQ+i4ILDzxrs4TDUVVwT8O5PI5NHy6WYcoeBy0JoVK7Y6hSLJrrEqyerZvc3o9m+nFcUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 IA1PR11MB7319.namprd11.prod.outlook.com (2603:10b6:208:425::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.17; Fri, 7 Mar 2025 02:20:40 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 02:20:40 +0000
From: jinfeng.wang.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 2/2] tzcode-native: Fix compiler setting from 2023d version
Date: Fri,  7 Mar 2025 10:20:18 +0800
Message-Id: <20250307022018.726675-2-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307022018.726675-1-jinfeng.wang.cn@windriver.com>
References: <20250307022018.726675-1-jinfeng.wang.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::12) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|IA1PR11MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ad4f6c-1c12-4c21-0a33-08dd5d1ea80b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jRLgeiYWl8C0aVh+KCpSJohPs13ovYwj8O1AiU2Zf6DYBM7bVNCEhMPqkezn?=
 =?us-ascii?Q?kwLo56+Vzz5oTeqFwzJQoojZNHULyvp1YTGD9O//E5bx4f+lSWLcy/s00mQM?=
 =?us-ascii?Q?hSViJyP5/RaBePa32jOmK87KPNFyGK0ZjrgeHeHtQz5xTR1gA5I+Afq6Z99R?=
 =?us-ascii?Q?kHRoWFYDdUQc1tsJrWtJxuz8oD7DTeXkdkRRxn9R562u8ItypShY9Pycx5+i?=
 =?us-ascii?Q?gAZz4TW4pdLE/Mtr9G3DFn+oT3nlUhG23jUFZxejfC3lL5jyuIC42JvdUFHY?=
 =?us-ascii?Q?d/H3GtmDM8NK3xB+UXv4U3DosMTf/Q3qgXqAlUN2Ea54O9nFCzHLjUIpscs9?=
 =?us-ascii?Q?bpjtUlH7HCxLK4NRFMCbjmSvxcHzWnWED5Rq1gK5Tb87Ie9M2GbVPHypiykE?=
 =?us-ascii?Q?HX+3Lv90sQHW8ALK9QL7b07Chc997YYNLYQTCiAKDtGvGBeY4IsjazutCeyU?=
 =?us-ascii?Q?YFinbNsSfQbfdDQfaliRpuy4nL3uR93VbIt7lV2+klOACRyFDcDfy7vLMHFU?=
 =?us-ascii?Q?yTeGUWvNYzmDcFN/CPshAoIFEHXFxm4f4EZgDD8onwMfPfSeJXR+SM3n0DsI?=
 =?us-ascii?Q?v55Q+tmaufuMQYxJ03LbizC0lxo+J889BC7GJuU69PcV+rqUrA6VLd63w88Y?=
 =?us-ascii?Q?n+pofcHnrDYMtym71vpVvWuvoJayi5WW3vW70sebuYFu4/JTACuekRtKdEeU?=
 =?us-ascii?Q?lnuZIsjeyD5VkqR1Jwn9PFe1Fl1cFQ1AJkQJn3++8YwLeScnqik6yPmIVkt7?=
 =?us-ascii?Q?sGd0yMvVdVg665da1yEoky20/bg+1535uvXZYXMF1K0oo+3R9nCMMKXTSg90?=
 =?us-ascii?Q?cUl+4b6nXHdeEgfBAbWlajE7PNP/obZjg+WJYp3UjyYnWU6JMP+am88sHrNl?=
 =?us-ascii?Q?l3qFvelO4AKbS3HYgHxb/M8+x+rS5+fLwPS/fSnc8PUjPn7I+gXpU8PMf/H0?=
 =?us-ascii?Q?a3Y1RIyZHqJEZ9Rksnb4503DKJp6jOhx7OR7e12s1Opj8+xut7JcxQ43NSLd?=
 =?us-ascii?Q?Y61LCARzmyAynJrzS632e2ZkCOTzgn9L7zK4+fcxwZuri4KGMwGxEvPOyb4w?=
 =?us-ascii?Q?qKe+47MMSOTncJWFcx/WFsKIuBHvkY7i0PudJs9Coy+kBjjHGjvZn52j7cbh?=
 =?us-ascii?Q?kTBa3AQ1MFkKLis41eAVg06MIrKd5gqY2GBJUh4R6JWPOiTTWsbZvae+enmf?=
 =?us-ascii?Q?f7z1YPtIb1FSDWhRygjbYWy9M3RHQRqDRWkwfk1DfM84kxh2Jpqe1pRNlNAU?=
 =?us-ascii?Q?w/HD0bIXgQzauQc03nRr1sHXdD40wDiNfmJzymnScps+L49Ho9aDygGL9Pop?=
 =?us-ascii?Q?msg9HaiQlD0AuZOPup9hKzpxS+IgdWF4WpLCdONz5/GGc8JlRPlq+QmfQtbh?=
 =?us-ascii?Q?B63Plr0cIfSMebqL/pOvY8mtTnveBPbKvGVjRWxvJPgnagUF1c793i4IoUOy?=
 =?us-ascii?Q?J/7sEC8J5QwnJZ4wiJLIkVyS+aibykOh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lgn+L97S9XXsZSELaDkgK9H5U5P223RE3ZymwASHLPXRaSn5kRzA/tRvUGET?=
 =?us-ascii?Q?8O0sdzZfP7wDHf0JNFhzbWDFfQYjsViA2g67QPrXEWtIQaBibT2rdfvHfUjL?=
 =?us-ascii?Q?IPDYeqG62OtvQGWT74jKTCovGfP1/AxAyRBmFxmmTPqReGE9YgOj2aRiu3N1?=
 =?us-ascii?Q?HEJRvcKAyJ/fKI+sGW+6tZ5fwxsLiEGBeD8zRrIcfdPFEV6mOOuX3qz2MZbe?=
 =?us-ascii?Q?gsrHg5ymR/1VdB9D+rT2fa1CxvKb9ADtaBRg7RwtllNZI1kT0NR+UYa6xjMU?=
 =?us-ascii?Q?5P6W9f0aJtDThCKQez7krQbJdo2VB49D9nF4llTMG06rhZvOiD1qpDoof+gf?=
 =?us-ascii?Q?EK3XXh6CK5DtOz3Fe3YPaRy0K6R4a2hcatM79NZY3hY/R8GWwGb9XvJFhM6A?=
 =?us-ascii?Q?nQbzb0vZ38rxsfzomgss2ssF0MJCO04BrjGjezPCkD+1e4OeN9odFiqBmbV7?=
 =?us-ascii?Q?QA+YoS0WW2mykNZr0204UAJToVXNCeaWnMIlKseGmjzLhapY2JOWlyY0BGws?=
 =?us-ascii?Q?KFoetYUoZ1iP9ui/SYvdnKbchRyvVaIfFYHE1iMCoIanKbwu5Zr+/qNJ8PPO?=
 =?us-ascii?Q?ttUJAT0bTzY3vxkByY6egc5PpQdISV8x6v02GAnH1VYY6yNkw7thkpSKUCnP?=
 =?us-ascii?Q?Qokz+MVa+kixBqDz+0T7gZEJTiP3uMA7Plj0kifnzhpydrg/R96lrvw7Eyew?=
 =?us-ascii?Q?rCQAO4NQ91YIGD5Z5uRsEiAdiViXalIhXlmH15G5SRgeswZMpZvh3xG5xQG+?=
 =?us-ascii?Q?3iSICI145IKncsFzaTYHlj78xt+yzNqkmJeOg4P3CrwXUEkJ8AprjZ31km6O?=
 =?us-ascii?Q?y/QOJfvIcBqtcucHkSBjl3mjUAzRLBusulOMus2qgqzAd5CyZETRGiRMRY9F?=
 =?us-ascii?Q?Pbfy3j+j0q5Mp6dndmaGKCDC32SBKZ3Y6fFa3/T+gDtU/gzmv0C4G2w6uq+z?=
 =?us-ascii?Q?TXmvCINEBIEBqAVAudNiMT63K8Eer/l/ywYtoYyGy5Ti4JaQRCWeliBPd5A7?=
 =?us-ascii?Q?ChsGJKG8C43tb/IXekgmsSxdQlZYmX/On31Wzsyz/l9cXzfjE3g3Lorqt6RR?=
 =?us-ascii?Q?gOVrnY+MDMVy906HhT2qLqcX8oKcnHJqOSwL2PnV8GnhcRTTg3a7BvquQEUA?=
 =?us-ascii?Q?QNb25CjekaK6Rq6fzl+OcrqYMU9Is+9bs5VJM6C/HXlec4MHogxNQlPRGcdi?=
 =?us-ascii?Q?dWKLYL3ZCTIN+49melN3eNUJrhCO2dJUQVNVpeQMRSX6uWcqUsq+Qm8ZDp8n?=
 =?us-ascii?Q?te918+lRpmn6TSVYcC7HScTTdSvi9ROmHSMon1ugDAAa8Keth7f6jOustXOy?=
 =?us-ascii?Q?eDhdGX7Gvo/4wtGsECZLhbQ8YPzwNIsqiajB2rLoBM6PzB9md1m/vEqBzW3x?=
 =?us-ascii?Q?6c75M2/l9+9d0q1rUCo39Z+dAcIaNdvhPC2248AY8Jdieulycuqye9nymEs/?=
 =?us-ascii?Q?wqRMt6ggnZ8vU58RbdjNRjWYoZukhUe95uBraE9eOFoVDnFQzmdQsCiqcYWf?=
 =?us-ascii?Q?RNHvU0iqT1aFVotx+2LmpEaLJqhshjKCnc7zZbhgxfhvDeMfwCTLpHFIpsGE?=
 =?us-ascii?Q?FIcoJ0CwRPNHegifH3ZKVQaqRwqr0gVShSZRDXIHjZeJy/o2kftBu4xF+1Bd?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ad4f6c-1c12-4c21-0a33-08dd5d1ea80b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 02:20:40.8973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGyGZAepd3R4K8iKCmz6lNMgbq7yp0YMg/HPgSPCkfmC6xDdpNd+qeBbUGW7KRoX2dDo26H1mnNI+W8to1NGLNU2+bcopeEOm0xBiPgXpgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7319
X-Proofpoint-GUID: 2YSmTaUBYBwhA23UtpER_jNkuKPidfrl
X-Authority-Analysis: v=2.4 cv=ddB63WXe c=1 sm=1 tr=0 ts=67ca57fc cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=FV4hvYKLAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=uCVDkzanSpbEq_6rURQA:9 a=QUTthWpRh2mZ_rW6G-wW:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 2YSmTaUBYBwhA23UtpER_jNkuKPidfrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_01,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=799 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503070014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 02:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212409

From: Alessio Cascone <alessio.cascone@vimar.com>

Starting from 2023d version, tzcode makefile does not use anymore "cc"
variable for C compiler, due to Makefile refactoring.
Replacing "cc" with "CC" fixes the issue.

(master rev: b3cdfca5ef84ed2054faef9abddef3aeed930e17)

Signed-off-by: Alessio Cascone <alessio.cascone@vimar.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 meta/recipes-extended/timezone/tzcode-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/timezone/tzcode-native.bb b/meta/recipes-extended/timezone/tzcode-native.bb
index d0b23a9d80..dc9f076377 100644
--- a/meta/recipes-extended/timezone/tzcode-native.bb
+++ b/meta/recipes-extended/timezone/tzcode-native.bb
@@ -4,7 +4,7 @@ SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 
 inherit native
 
-EXTRA_OEMAKE += "cc='${CC}'"
+EXTRA_OEMAKE += "CC='${CC}'"
 
 do_install () {
         install -d ${D}${bindir}/
-- 
2.34.1


