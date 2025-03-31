Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D460C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:05:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.47688.1743411936722535065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6185730dfc=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V5m2PA019767
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:05:36 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p6311x58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:05:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XO+Nt0Xp6s/xx0Szd61YRVHfwsIfN7Ds8vzqJ8yFUtj256Zs3FnOHXL0Rjs0AXTl+vxjKKgPVavpTArOwHv3NOJpHeW7/RYG/Bg17RTbvkV2Cq1LRoJ4egPRiPn/T73xuYuOgQ8fG5+AFrtzMygrav/i8z9rHsNGbHCTcKGxAFekDqB9uqTamaRWiN0EG0zTp1gnFi6X8xCIWzrytUImsPo1VyOg6pMay7SLpGkwfGchXpH1E/UxyXrb2YNXg7gfTCGwXKC7TAO030wICdl+av6afdnYR23HOVAJ8oLzhj32fa643FykqLolDlzxHwgqlt53JvJZ4FEwyOrQIJK4Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeTaFJbYKqu4N1U4FSITHQuMK3JSNU0zbZ8gs3ilKy0=;
 b=ooe6dFu0aYR0YkEB/mE6hVjU8lZvdJMJcmpOim+IlYpF4LzLXh2V/fIFQdoJ6qEDCb8xfCc20QM8jxIwMV3JNmo1kqqnjVOHolp7ZnxwNhDlo4kFxWKrTnxdVHdZnHvBAqDA3g/nbWMKwwQ8VSAgdvn5cZ6GU7B0TVeGAMODEYc/kGp5ALfCSUYSBoz2hbZWjJcylNQyH5HpFxQbCl0HvxpFVi3hxOuZZiEdPUqrY8NR0ldooEFrGwlfJo65YTQC0tPbPk8aygaInGI5+VYBH33lODcSjLHQ9QL8fJDjTUkwxZeFz/HkQwun7xo/fm4yEaD4W0Bb+DGdzbe1mqmymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SN7PR11MB7974.namprd11.prod.outlook.com (2603:10b6:806:2e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 09:05:33 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 09:05:33 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] glibc: Add single-threaded fast path to rand()
Date: Mon, 31 Mar 2025 17:05:17 +0800
Message-Id: <20250331090517.2284874-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=y
X-ClientProxiedBy: SGXP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::34)
 To CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SN7PR11MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c7705d8-23fc-4723-5f06-08dd703331ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aaduaDFpWhegLvFxBs1ZNrz6EJwI87iTNH1ZAiIP6+6G3tcNyKVJsm7YChz7?=
 =?us-ascii?Q?3X+He3C/QOGBlh6XPmtGTbAJYCFkA3BFJ9y7FSCQUd+uqoxRi4jnzpbl3UDi?=
 =?us-ascii?Q?kpQBgPokmrRujMJ8+7ERz9XgpcS3DFQuMbQxzhu7BlltYsjR4vsFGuhD1i+z?=
 =?us-ascii?Q?MClLNWUSsWycbqFDG+prpbSyd6ET9brZl63Xye4Sggfvd6Mr2H/vs9cOyydL?=
 =?us-ascii?Q?HsI00JdF91lDJXRSf6hopyDuPChpHSC0k9zdV1X3GYZnT0Nzsyg7mQbF9eF5?=
 =?us-ascii?Q?LGt+hI/hGu/eiXEtv0qA77xQqjm034g4BPnVE4BCAfTNY21/mqsdPDZrjK5C?=
 =?us-ascii?Q?lcQGEUZrNjdaT9WAjICgPMgJ4DShJibpOd5nKbaO9AGIG2kHq/6iYFX1ijXA?=
 =?us-ascii?Q?pM7xiqIir5dm2Kf6ymxDzLIaWMis6hc7IjedijRc6Wa7TqO8Q6cK/kqqU7x1?=
 =?us-ascii?Q?EiWzfRhV0VpFPP5Cisa3LwAEaNIYCJ/IVvYqq/EcytuF+kLb/1xNciS32Op3?=
 =?us-ascii?Q?ie7r5UtuuE1LsIDVYR3yvUdqBpYJUvcDitgZs1B5Pm0NF+tg82c1tmYCMezI?=
 =?us-ascii?Q?UnAEa0G2pa6ctZHDfLb4/sm/v6GN2EvAMaWBiU8mnkVnyvkJ4h9zfsNbPKsr?=
 =?us-ascii?Q?yswnsD2HGd9w2Z5G0AjasknGaK6r81ARqlL7JpYXPkRN6ibGrXSEIhJF1+Nh?=
 =?us-ascii?Q?RbVp1UYIjpgMtOsVarHNGVHQ3ZHsQ9Xpl8Fspo5VMAOIhRazbRuczqb1h96T?=
 =?us-ascii?Q?zgMZPP5Vp+nGkD03ErhduE5VNSe0iNV7pxm8BRFSjMm9L4Xy+ad53r6pprS2?=
 =?us-ascii?Q?EhKDvYU6gYZSHHqm0XvP/8som0xQRxSGR2Ta8HC/pD9S5BZHgRECvk28MiUE?=
 =?us-ascii?Q?z/uIiEKrJ680E8l4V93rTpbrSDrN+kP2YapAIWh17mk3bFxUJejkNO3tWpku?=
 =?us-ascii?Q?s4q8S6cli8xunOIaf585OJhz6lxOhcEvGmiQFWuhKaOmTQg/08Qi5jZmRcQ1?=
 =?us-ascii?Q?bxg3WorxVAPR+wuoOF0iJDLgziAK9j2FawcxhF5bclZy/mm6N9Jrn5VIln8R?=
 =?us-ascii?Q?EcemgN8jt1LgOt+/8ucSLOExFSrrCizUp2jyYB46iXbnlaLjBAdj8N18Jn/j?=
 =?us-ascii?Q?HXWGIraR8cBu81kTHVjSfkq5j7EzES4N07LYtXTidF8wEw8nNcwGXJq1jgED?=
 =?us-ascii?Q?8sEFZ8cR28mUe13Uh52GL41J3X89du46NWuqBe0EGSpds1B+MwJZtrydpmPC?=
 =?us-ascii?Q?AHxPUVfC5xceTHS9+MoPOh8ETK+clpkZ6llyfK7PkwkDYYl6xW4EpcPNWp1L?=
 =?us-ascii?Q?SPeWcqq/VhV2Ysmdp/DdmIx6sy0GasJMz/C2TefYi0hKAJ/qtg9kbSk2v0Ar?=
 =?us-ascii?Q?7IaudLovqU1OxH5ANrFzpMrPMTtdN81xVq8QO8nwYd15XjNnAZR+vXkKmua7?=
 =?us-ascii?Q?iHPWfp7/PwrcmqWRBuogP0j6pjqWSXqX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E70qIj2ZlJAOnVIvd3pBg5g/vk6hEJyBEDLg/dvdEXTg1PlEQnot6piYk7rx?=
 =?us-ascii?Q?k/bRU1VjyiIom3pF/nYLE9lP9kTOT3Xz9JZlWTMDTpQppL+OS/QuFddf8zY+?=
 =?us-ascii?Q?3mBgibjft41sp09FO1z5VI7tXAwr/BqbIv4AFLmhjmmS43CrxadGi9IY+Lbv?=
 =?us-ascii?Q?1s7QINEkNu17L1n8Wt7w7iYuSKg9k1FWucJpm3Xrv8XEs9oOQFKf0FaY3/51?=
 =?us-ascii?Q?6CqoN7YxNQLybRynbnTcPlrvEwjHvKzUpViXREXs/7qegcOFtMRsgehKYJso?=
 =?us-ascii?Q?tri8LjNwQY4NO6EOndO07vDL3MALI6B+I+SByooiMdqf1YPDxG56C6LerwRM?=
 =?us-ascii?Q?+dPbHsmLVmIZ8UEjMTAZQXepsHTylmyD/jjiyF3ZoOxNJ+QJOtCfIcgN9u23?=
 =?us-ascii?Q?Vn3a4QPTg2UNIJ/uB57ftRFaK5dh2XRGNyXidg1VoJnDX+S7+9PbNSCsqc4B?=
 =?us-ascii?Q?qiJx0/Onm6aNOZtH+c8Cweh1H/l0Eu0N1/3goqhBNBxq41TW1bpT5ik5Mt4m?=
 =?us-ascii?Q?9c1qcPovlSBT6Ie/R0aOzlSdrIscIwgsZxLSWnC56wY3JaziKlEMAh6RwPjq?=
 =?us-ascii?Q?LaVUCxR0+yqfEP920wD7aU0xTl9nYllc54BsPYq66L0L7fjWpCcOn0zGLkrM?=
 =?us-ascii?Q?oBj54DZSfSTTTKZ2aHhS4/PNUtAQ1Oxuj3955f4cTNNkM+/3/X3NIMcL0e44?=
 =?us-ascii?Q?GCQFDrHAt4pLAHUMCje90qTy1VIJZDH8S9E9RbvvhED4iIlcuDQedQFTXDte?=
 =?us-ascii?Q?X6Q+E1dZHP+wlHCSKtNUw0RUalr2HNrhP/G2bYbwkq/B2GeRfHnCMN/tHo1j?=
 =?us-ascii?Q?hjKBDwQucpubhEDwJERo31wmElU83s7ALl84Rb1eWI1yMW8HXG82HoSpsgbx?=
 =?us-ascii?Q?BFWxf1BngKDyiFQ91Yue1ckGzeZuRwqaJzV6RASOfe5VEDdTR0j+Lib58iJq?=
 =?us-ascii?Q?oLQ+3KraHG5MlQC9Uul+udsWWxaJv8qhDmOTitgumcROetXGdOW+SrjQz77R?=
 =?us-ascii?Q?r6m8RdCxKIie0Di3TZzPkUHwQSKF2omwNX6fp00RuQGo8/RB+8JvxdAC8k6x?=
 =?us-ascii?Q?z/dA6JujRDKFcV6R13k/JtDkpR1vG14UmezsyJpBoibx/C8Fa6E3B88kam0N?=
 =?us-ascii?Q?M3mKeMq1e6U3AOGxkGyCjLxuYJkSt1LhyqHybjQU0JIJ7N9i4uZuxMbvwsGj?=
 =?us-ascii?Q?Vj0zlQqNd17MJEXWNz05KcC+cUniIXkpNkB63xCOGAMdC58vpEe7M/TzBxZU?=
 =?us-ascii?Q?/UTzYtjobaXdKEuaEgqiXSZzmlplJTh0a6cNGp6SJFyLCyg2RklqJAp1+qpB?=
 =?us-ascii?Q?fSOp2vbT/dXqXj0F/ng0E+HxA8m3yILvbaLmu7tdnV0722YGBCFgP0Z5Vfj3?=
 =?us-ascii?Q?vWY7bknNZD3bTIVUC1MmavgHMlzCGdCfCgRBHdEf6uXxKuv7oQUOQFq5NjsY?=
 =?us-ascii?Q?161ibvP/exX90pfVSYOR87MHr7FokXCOlAqogVrq+G+gk+K68JKmsxQ0aYbq?=
 =?us-ascii?Q?4NHq3ycEJrcpHHjbSulCkD+e/zoKqJOAfNXIogeUpvdUKqw6v4hH10mWjAGh?=
 =?us-ascii?Q?OTfLBcqgISTezy5mtAOdqsmhxR6sQujl7j/TSuct5Ay9NbRUK+KKBgY2DgB4?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7705d8-23fc-4723-5f06-08dd703331ba
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 09:05:33.8095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VII1FCnv8g6umVaz1DHKXNN3jLOsrrzpK1FsHnqmEFLeu4L4UtGnmMUt53DPUw/vYagyqw9HpF64qCVOFs4A+3caq4r/gyt3yu63jtsF83s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7974
X-Authority-Analysis: v=2.4 cv=C+npyRP+ c=1 sm=1 tr=0 ts=67ea5adf cx=c_pps a=BUR/PSeFfUFfX8a0VQYRdg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=RNnUd5T89QfoQ4j43GIA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=cvBusfyB2V15izCimMoJ:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-ORIG-GUID: JM4ohz2feFufgM8v3icifv8f-cX5Xyg7
X-Proofpoint-GUID: JM4ohz2feFufgM8v3icifv8f-cX5Xyg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=826 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52V5m2PA019767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213954

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Backport a patch [1] to improve performance of rand() and __random()[2]
by adding a single-threaded fast path.

[1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9a=
d7378800d6302bc11467cf2b514f
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D32777
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...dd-single-threaded-fast-path-to-rand.patch | 47 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.41.bb         |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-=
threaded-fast-path-to-rand.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threade=
d-fast-path-to-rand.patch b/meta/recipes-core/glibc/glibc/0001-stdlib-Add=
-single-threaded-fast-path-to-rand.patch
new file mode 100644
index 000000000000..736fc51f3874
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-=
path-to-rand.patch
@@ -0,0 +1,47 @@
+From 4f54b0dfc16dbe0df86afccb90e447df5f7f571e Mon Sep 17 00:00:00 2001
+From: Wilco Dijkstra <wilco.dijkstra@arm.com>
+Date: Mon, 18 Mar 2024 15:18:20 +0000
+Subject: [PATCH] stdlib: Add single-threaded fast path to rand()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Improve performance of rand() and __random() by adding a single-threaded
+fast path.  Bench-random-lock shows about 5x speedup on Neoverse V1.
+
+Upstream-Status: Backport [be0cfd848d9ad7378800d6302bc11467cf2b514f]
+
+Reviewed-by: Adhemerval Zanella=C2=A0 <adhemerval.zanella@linaro.org>
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ stdlib/random.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/stdlib/random.c b/stdlib/random.c
+index 17cc61ba8f55..5d482a857065 100644
+--- a/stdlib/random.c
++++ b/stdlib/random.c
+@@ -51,6 +51,7 @@
+    SUCH DAMAGE.*/
+=20
+ #include <libc-lock.h>
++#include <sys/single_threaded.h>
+ #include <limits.h>
+ #include <stddef.h>
+ #include <stdlib.h>
+@@ -288,6 +289,12 @@ __random (void)
+ {
+   int32_t retval;
+=20
++  if (SINGLE_THREAD_P)
++    {
++      (void) __random_r (&unsafe_state, &retval);
++      return retval;
++    }
++
+   __libc_lock_lock (lock);
+=20
+   (void) __random_r (&unsafe_state, &retval);
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/gl=
ibc/glibc_2.41.bb
index 71b89ac9ffb3..d707e1a6775d 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -53,6 +53,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bi=
nar.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selft=
est.patch \
+           file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patc=
h \
 "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.34.1


