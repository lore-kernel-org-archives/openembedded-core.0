Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A745C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 12:14:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.624.1740552195793671988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 22:43:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4152c34f3e=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q4dwkJ001082
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 06:43:14 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451pu20c7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 06:43:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmBTtUkz/P8AjEGgzoRt060ijurTwXz3ADLxYYbJvgN2WXhR1ap3EloYb5bhfATjPdSC+tCzMVVzdKy7AnkoxO3stEY5dYBcXAogLeoWIsN2nfRSWqEIFDe52kvDmm0At6CzoNC0dGHNq2RiOgLkt9aVKrGjnustWfM2WfhxKukbZS9J8jwecWKczlCjkCa4Qp7uHsyRNsPwwbmfJzxtjGRL2BTX3dFnfGHvNE50v/3gqjqFU6qIX/+iyK0c35J5cfdC33j9SLpOaQixFFC0r1Wx10Mg3ZK9mW/nQDzcQU+MU1wk/lmsrtYBCS85eLuBUjlG4xk2KMOFLpnE80LroQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIieQYNWjmayFp5wqR1IDe1Sc7nCsa/kFT3tnFs4xyQ=;
 b=u+NPGjn3Zc79M9rtmpjHhj756zEEkTesAgWUgqN/fjmuDmHdlebqtw6m60Lq1Zk7Jg+z9WTCftvrATAyvCzWMl2rLc8bnuUy5gDcRyjbmzYlK1mLtrZmColHkT9MRlMy+fOHC4exXlXaXAzH36F7ZOkS78jbRLqEClE7OOOlUvEQl9067+O3pfMZzzBl9MNSu9tAdr9OaJGI5Stcu7Ju+fjcQRMUTimqgLqL8KblPlwKHHfCbHGjk/oyIzPCemdb6PYBdIXF3X/+/BaeKmgSUZkxXjc2VZLRZz772l8ZyNbs6RqmTah+poZ7BiqxYfB0O9Gm6T1zyCDVmH9OGJo2PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DM4PR11MB5359.namprd11.prod.outlook.com (2603:10b6:5:396::21)
 by SN7PR11MB6798.namprd11.prod.outlook.com (2603:10b6:806:262::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Wed, 26 Feb
 2025 06:43:11 +0000
Received: from DM4PR11MB5359.namprd11.prod.outlook.com
 ([fe80::5647:d88b:4841:5f90]) by DM4PR11MB5359.namprd11.prod.outlook.com
 ([fe80::5647:d88b:4841:5f90%4]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 06:43:11 +0000
From: libo.chen.cn@eng.windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] virglrenderer: fix do_fetch error
Date: Wed, 26 Feb 2025 14:42:54 +0800
Message-Id: <20250226064254.207784-1-libo.chen.cn@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:3:18::15) To DM4PR11MB5359.namprd11.prod.outlook.com
 (2603:10b6:5:396::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5359:EE_|SN7PR11MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 46bac8e4-9a3c-4108-a56f-08dd5630d656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Q7n0ALVG63wPv+ategLF/Qah8molPaFiJIMvhIMHAvct2BrOS4Nmd/im9E4q?=
 =?us-ascii?Q?9wym8uWvMewkHi9X/tRwPopQ1plZyOQl+rWT5qoyvgJ4FedNij0+0mGmr1L0?=
 =?us-ascii?Q?SJ0fqbhcG9bKHuyd0MAMI03fAuKn+NLmARSb8z6VAGXNMP78xAw8hoKvUlsP?=
 =?us-ascii?Q?JLfZMZbBaPTR7P6Je3PlcZJS8mahqmWaR0I0//xxZBT5qESkxQ6mtJTWJ7Xj?=
 =?us-ascii?Q?R4qKoF2G5xZEOayUPlqEg693tYe/y2e8zaHx3J0vposZnM03JbbkXg86ofA1?=
 =?us-ascii?Q?VcFVldYy/2DWjNPMAq4tPmrUSXvYb8dph4ExKE+p92JibopRltsP3i3SI2uj?=
 =?us-ascii?Q?xWNBAYMU6Goc66sI7WWEOT0h2QPVFvRrMaPWShjhwORNsjfeNpt8oOmvUvb9?=
 =?us-ascii?Q?ox1iWGMAt9qjj6NiEy/jz4HImPADMa/I54JKC73e6/WZH60xBuNILhWvYUDK?=
 =?us-ascii?Q?37pKNw8JukTfeJS0yT21ZDEMZZU2itpK9eiZpONhGTpvXtdnWdXvyMUVGRjc?=
 =?us-ascii?Q?1BS+3EFsUApNavwIIAm5n4j7UAk7zFZCqF93KBpCrp0udKYzg+QQ7ZsbsD8x?=
 =?us-ascii?Q?UGT5anO54Zf6Dpw9tDOccPQUu85t2lKX8y558L6yPVXPzF3RIKhog4trFBUZ?=
 =?us-ascii?Q?E8bzZPFgZQkNwI4sQYQLNVLSTMjb92Eb0h9oHnuV5YBrDs+8FKaG1kdsxBYh?=
 =?us-ascii?Q?HJ6SRoTRB45YIcVQm1Kg1oi9Rte0ZzMYTyytDtVXMW9BSKwszSTSRLSRiIPd?=
 =?us-ascii?Q?4i6gI7w4OGawsZb3ZHaRMNIkfzkh+WyWAAFbzZ+ysTmeI7vsgiod7GXw69WN?=
 =?us-ascii?Q?tLlgUPjgj+PlXeeetVd/rG+iYY6BrjxBkso6CUmtmjIHqb0mFp35lJdRuGV2?=
 =?us-ascii?Q?4Y6WYYcVTHIiwqfz5gS7ciCS/1wRY+dcX2L7YUZyDyDhlJ+p+zsRvg8YqouA?=
 =?us-ascii?Q?cr4olN6/pWTQw7Ai7vymtAuiYe89tkzPxrYs+pPmqiIK63oqSrlls6O99ptk?=
 =?us-ascii?Q?LkgjfsOsC38PGjrghMP0wRwPSVuYATJnurRHQpFWkyLrWVQxpF6m7LFYR+kL?=
 =?us-ascii?Q?AIX9qZkDMlpb7ch3BVvmOwiW4VT8VlHXQZ8iOI/+YFdf7SKHUWq7YCpjOOy8?=
 =?us-ascii?Q?LCkfgz6WJk1vvQV1KZXm7Uf4ta0WdR5GM7JUgWKWaDGAfA2pWOT2yo3qpRzZ?=
 =?us-ascii?Q?UXVNaA1kcOCBKthAbsXL6/uNSahrepCdSHatJrsUWlgtgLXVLhXYr515nQiX?=
 =?us-ascii?Q?HSoLXjE/QWrMewUEpnroc9t6tuPwjG8nRXlWFlKdyLVRlCpBdCiFbY01xiHO?=
 =?us-ascii?Q?Zmpy0wIwDHjr1scQIbddZBOChB0urUEIfxN6QYaMTQD0lxZGY0Oz7wy551pF?=
 =?us-ascii?Q?xTPcWgU4EZSHi2YzI23FqRV9sumOjvrXa5EKWbAdB25lVQ5s+1S7XzBMk/LT?=
 =?us-ascii?Q?cMPhl7DJYUXTKUdmwCCWKRmFU5yvrju+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5359.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OwFs0pV13PZnnR8i793yUrNft4uzUqf7x5/xRovQi2B39FhsdwpJhJWjxoIV?=
 =?us-ascii?Q?7k+wn81tJSTp0HYdlAG4mqHwtQrfVWuXF+iPBi+sifdkObkwuhd6HuF6CvzP?=
 =?us-ascii?Q?I8jXayU/Pl0Qb5Svl6AdpmwapqoRfyAcxtT6d84AjE7v0cXMu3jfb5B4uNsn?=
 =?us-ascii?Q?oZ+yPHktSeN6vxI4g5BYcCnKyTrw62kE5DXyV+sfQMtbpGemlBhm/24QNpne?=
 =?us-ascii?Q?toJEv8B8NI9+fLTUZ/+mwnYlIe5RQ78r2liyaBWE8uzpCqr8+5EH8wmr5IGa?=
 =?us-ascii?Q?G/0QSzVN3/SCusEEyYF65oVZXzKhJezp+6sNZ1+Shyn8J9tkC+aHNWZGAaK1?=
 =?us-ascii?Q?z096P7B6E82HzEjFyU619Uo+WPqtdoFY2mtnh/uHhGpObZLtodLWRuXT4JTM?=
 =?us-ascii?Q?rlyUt4Yv4hxMo+7rmODZmIQIlwbNQO4GRGatPcFQp96xjYjFiNXWA2Oxu4f8?=
 =?us-ascii?Q?AsfP6AjF77BdJbwHlUqNm0OV9ftC2rV68bbZCHnBRQbo1sbd778sK0XAqiIN?=
 =?us-ascii?Q?4ccoVK4YOmHlfn+x4hzXEaMAYc4QyBnWig8Mnh8G14Z6Swzcy7LhUbBgX3JO?=
 =?us-ascii?Q?Mil5YHNagO/vbQB8kGKqxAAZkwtBYOjr5lvHcENYFilhNGmB4fl0cShiedSV?=
 =?us-ascii?Q?48O92iF34RqcFHfr31IKaru86okVapBj3oUWZQ+HnEOS6kUjseshaioCd91T?=
 =?us-ascii?Q?XyYazHklX8VOXrt80EHHiA0/bUdPufQAb3ZAaAa/0n6Z3WfXRyrc43hvJ0wE?=
 =?us-ascii?Q?jNw5A42xnBXvBIRlMq6hCfSObLqY/I1PipFdBMqsUqNTqEqwIMweoGRijLUT?=
 =?us-ascii?Q?NcZOS9I7DD6tNuCDZh1UdxaY7Nj9c/MBgca9aowViMTikXdx37Uoowv3GW76?=
 =?us-ascii?Q?ueK8OEBdvPiwOTvTdAQ+2LMm1VokFL3VxPNaC0qtsA/vUHnwRQLCn6Dht8j2?=
 =?us-ascii?Q?xaVWiRTE/S7tnJNVvqKhuipyVR68Flv4eF3Sfe+fEtOklIYCh0i4aoy1DVb5?=
 =?us-ascii?Q?kUeB3dKZfTiMf/dOWb6QGOQgh25ZOD+humLxy67PtlvpgPG7gBZi8whJ/tvE?=
 =?us-ascii?Q?iHfvH4fM6lbjjUpyLn656n24Yxuu3CB/71T/8ae/O8NXm0uBHHTrmdysG1Qu?=
 =?us-ascii?Q?OY8RALtnphML5hMhjYJ5TfuQHR75lviqv+8YLIaC/uncFeQPtDA/NO6fnSWk?=
 =?us-ascii?Q?lWhxuo/EjG8gYb7AiHu5qfMiS7RPTGzcFJzNhfQHgJdRWOP/MqZKCXqMvlpH?=
 =?us-ascii?Q?kY9E2+I3qLqhu7pVvPbX/Rvafal3OQgzzw7TBmuPrX1GSJCmS65aZ/5QLc0j?=
 =?us-ascii?Q?TqsipIzyvWIF9BVO2whKnZT+iOGO9nVSfucDM/YvMigaIjTDazDqBrwxQAan?=
 =?us-ascii?Q?YQnwuCAFrM/L+U4qeIjZEjDIVwJDp9AMHIafeWwD6ZJdoAUl8QtZGLudAL9D?=
 =?us-ascii?Q?m3wdxc/LxWnrasX+y5ryxPx7gOAVhGJNyN/KJy9Mo/lGueqq8wXk7qJfJcxx?=
 =?us-ascii?Q?pBCamMTXnZnbOECeCeegRhUEocgY2UPpKSIKMNmnYvGAH3A4hb871zVZ2MUX?=
 =?us-ascii?Q?6A7i1T1OKL81j2cyP4E6rLE9h9hjNdZZzAO2YtoiB882+g/8TV17zDLDkv/7?=
 =?us-ascii?Q?oQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bac8e4-9a3c-4108-a56f-08dd5630d656
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5359.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 06:43:11.4244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgdX2wKTRAQwv5Njbiew4lfu2bhXsnRNkIePeU6l2zE79RF4dAgmNE7So3jgwZb3tpPVA2xYnL9RYufLyD1qHAmA7IqAdkVKJSkioZXdtVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6798
X-Authority-Analysis: v=2.4 cv=K7bYHzWI c=1 sm=1 tr=0 ts=67beb802 cx=c_pps a=yF+kfS/uWKtSACHbTM5LMQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=e5mUnYsNAAAA:8
 a=fp_T6apI3AFn-XqTSNYA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Vxmtnl_E_bksehYqCbjh:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-ORIG-GUID: Jn438yKwV8dqYTmXxXNI2X4C9pqgFow0
X-Proofpoint-GUID: Jn438yKwV8dqYTmXxXNI2X4C9pqgFow0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=750 adultscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502260052
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 12:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211954

From: Libo Chen <libo.chen.cn@windriver.com>

Update SRC_URI to fix the following error:
WARNING: virglrenderer-native-0.9.1-r0 do_fetch: Failed to fetch URL
git://anongit.freedesktop.org/git/virglrenderer;branch=branch-0.9.1,
attempting MIRRORS if available

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
index ad3688e300..8590539e55 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm virtual/egl virtual/libgbm libepoxy"
 SRCREV = "363915595e05fb252e70d6514be2f0c0b5ca312b"
-SRC_URI = "git://anongit.freedesktop.org/git/virglrenderer;branch=branch-0.9.1 \
+SRC_URI = "git://anongit.freedesktop.org/git/virglrenderer;branch=branch-0.9.1;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://cve-2022-0135.patch \
            file://cve-2022-0175.patch \
-- 
2.25.1


