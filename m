Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04F1105F799
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 10:50:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13095.1773398999596263519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 03:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pzApYemu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7532d94ec9=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D0bDS93761713
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 03:49:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=5SPJN1ahZ
	9q55XlXfJO4xWpa95O4GosTq9iQ5Du+S/U=; b=pzApYemuYMaMkxvdM/SlUBGSG
	m/nX8Km1YosHBSh35Sd3xxou2an3lCWlyUP8bsfsXPEpROt6Q1z25JwJfK05Oyua
	6Vna9caU7a0sNiEGJf5YBmiECfJAqe6OdQMMxu6pZeTQXQrNm71q4MT6LC9IlzHe
	lNiEuLxKDxT+r4ltREMwpIHusHjDFYVorwOg9IsbHZrSlYqQuUoYS8+KmR1uwHcp
	sGY3G/1bZKwvEJI3c3IcOsM8S8qGkGVdw6daKdDrKgw09OGntFgRh453fPp7d08V
	b1W2eFH01NJPR03MNHHFwL+NJNv8W9VRwxt0LwgTHNne9V8zeIcsiywkV4i2w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6ta08a-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 03:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3gbml0BVZjkuexlVypm4v4txUJJzBgGu1Z1CD75VG++bFwKq3A/Y+wZZYMYWwfQW64Y5cda8wXGEhWaUKxqTKZEXA0hwRuUm9kCW+gwvL6NqCWmZPU4pFxF4y1rJ5HuZXkNe73ShzEVhwJdaFqtn6gQjeMPvR6E0QGLDbejujLwDMECIQ8DW47POdANBlXtWoDuaQE6MB+iY8I2EyquUDLmKDM64dxzE4WgIe0zbKoIFNtQ890Vqep+971fgLQhv4bACvADxfxfoDTNGzjmbUy7jVexVHZSobUWgb+7MN9PjsZDoVJkx5m16qZqiOJ6OWeJyqKcyKkOiO7XLGKb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SPJN1ahZ9q55XlXfJO4xWpa95O4GosTq9iQ5Du+S/U=;
 b=ivfIQNfQqrPKJJWuS/4NakreUE+kKZYFukiZ0tKbIx2X/z5+s21/gXsw+XC++zv3yqW15nK5ectphAUUdxfl5/fIdtjm/tPc5xiF1Xg2fiyomo4Puq2OMQJ+bpCEYqaxvSx3z/ZasTAg5IlTMfxgH/Ojw2xzbvVrXKSrcuV3vstYZ73CjQ8c5gB4O9EdC6Z+eoF+fjNH0GjqGFSLnVZPP3MCGtLoegF1AgTN24YCYBzYgq7STakOAuU/TEHld/EW4/Gs4i23CoEIow3MgosDWLueMnQ3RitjbO2xbGRD9b2jwKeqqDoTHwk9uzjJ67npYiKN2GrGWrI9Md1Jm6qSbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH3PR11MB8239.namprd11.prod.outlook.com (2603:10b6:610:156::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 10:49:53 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 10:49:53 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, alex.kanavin@gmail.com
Subject: [PATCH V2 1/2] gstreamer1.0-plugins-good: remove PACKAGECONFIG soup2
Date: Fri, 13 Mar 2026 18:49:07 +0800
Message-Id: <20260313104908.449221-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0116.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::20) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH3PR11MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: ec82ac39-4281-4fdd-3fb0-08de80ee421a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	eBI51n46G2lP2oDls3K0UBwm2GJAbCsTHhesi5yi1mJVJKkdbuUdTcrhVGa9/dI2SqYRu6jnNYXsmV77zPlTnVBZEdHI4gslvXjxv3vyfqifzJmmcwxywQu9dP25FIcQAYoTM812/xbjcVN0S1sGixgauK3t17Wl2Q4qhF4jtjulCPoFT6CQ7Z5L3ROVpgi8KPvthYMKUvw4kleEsJ2NiwKxUc9Ge1fvYGiPDByax0SYjQfUdhliRmme9dPl81QyTiDRT7w+Gxsjh0V6aMXGGn+g18Wir1pJnl9dtIq7ERbsH0jGqSE5bjMl0YQyAp2y1V27pyEwmczlhNA8c58+UYOJsR6yUfqbVt9pAijwlLuepP+bWKXYLrAukHvO80KqygjIUeqjnzsjpWrt3mxKU8x1dLoqCtPpX6+SHbYlbFMyMM3eadpP4PADxyemeWsHAdigTTT7+ro1/do94Sq8WY6rm2wdXNTIRCSNdx2SFKtkRIeU2Ha7G5itmOiCQCVxEYK+K7WHloE0AXXtv2yF1cqJNiGgxotKg/abmcULHrXSmQAmwl6aC5968tj0LpWHgxC+ti2Uw9hu4gle3xek83f6AOIXRlwFMrW9Q6maO1k9olL+qjJwI0SLt3+FlW8iqFr/7iRYpeL8STYDm7CDmp7B66QcdBex6pWtHAqUyl5DycSnlE2p7X+ApfB4UW6uY7GHiAWwYXftJ1Cdv2RtUlT2YtH/1MXmgtV4D9kxAJWpaNFJB77LiAEfplSaqe1Kl0c8vBvV+zScaz7kfoNDL+qsOdkpXErqmRoE2LoL55I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lQ4es6D3ssl6Nk+Rm89XdFgQPfcW1OrSjBP8eH1PTa/AEbLFxVKt2aFh8cQr?=
 =?us-ascii?Q?NbJqNwsuHNdLBO6IutJVmYLp2CglBWMkHwlpzdsfhx2v7xTrHfqq+cRP4sfO?=
 =?us-ascii?Q?rjhvv+TBx/5jPVcA11y3LXfw6EV7yL2UzRX0stNHnJc1V0sSCERmjK4YIgcA?=
 =?us-ascii?Q?OoCD3g/9J5+TahhmAMO1jXdOZRMjETK7JwpKua2PWojdMwevuN2KrhJ6YAly?=
 =?us-ascii?Q?DezVRXOWOxBnpaT/FFqzEEFIHSEy6p9GgUjtbrDS+DJYQGrug3mI+kigjuiy?=
 =?us-ascii?Q?/I2RSelpDw5+ZaGHii2UlSZqBTGn4X06l7T5lqkKoNd6LX53YH2MkeSAO4in?=
 =?us-ascii?Q?ihTa+WF/Wj9cqkuIQgZ6aWVQXbFBV+hzp4WgtiofThNkmqB/IcHUFiVRKl+R?=
 =?us-ascii?Q?a11u8OPJqGkpUZ58TglfLGTyH9pLvHZyQEMNSLVutjRT8OUDmqYPmHVZtKcX?=
 =?us-ascii?Q?rmG+Ox/iYhjMKoK7P0Tr+4YcjtGkTODqrgTTlB4LHPrl93GssXP4yX4MDYb8?=
 =?us-ascii?Q?FYPSM2PovY3WEHl/09cENwc5AVbF31VOx8m5WIS5bTuT56vqkqdiiv3YCRUQ?=
 =?us-ascii?Q?9NJIrQFfCSq5Zhk5Q2nzpler1tBtx/It0BVenIyGK5hyVm1T9+P3Cz1eRB3I?=
 =?us-ascii?Q?/By32kgvWKhGBHzPuGuDZWvy2qdof3FE6FjJLwt4BxmVHkps5X03IV8k89kT?=
 =?us-ascii?Q?LLLKgn94uYCik7vgLAotK+aUv+3rQALiTFlTEsN6oXhr5aZFeBo6sjbMKJAq?=
 =?us-ascii?Q?z1gr8BSb+pp8cYIKd0UKkwiZd7r3J2ZUE7V4bk26s53hS9IoTgwm8yGF5iW/?=
 =?us-ascii?Q?IPLUyIr/bwwfQ48WTbAYFxGMLVzJwkRGaGdDI7Y+wMwwhggAe1tx29WJrzhj?=
 =?us-ascii?Q?qWAj22+BkjJQCgX6zLDT0EJfwve7o4GM/Gf7uK7rwzQdxVcLpM78Emyf+6gP?=
 =?us-ascii?Q?9dUm9AdyGdn1rqJsHtJbPbhhpmazCrWZaSAYrQLLdD+JWSVgOaAM9foYD0Ap?=
 =?us-ascii?Q?OEjDr+b81DAUvi3JtOxc/RSZBJ9p+JrD16ytUI7A1abXAsLy+Max4lBF0rCs?=
 =?us-ascii?Q?98LVLIdH3RyDz12PggwpcsFzFei9fuEgcA4clBKXbc1qBQ9IkiS46UABmU7n?=
 =?us-ascii?Q?x84CZRpXx0g/zCRI95EuZHIIl4Z83+82iAc+QNh3bMZisHPlyq5VSWKA2fMQ?=
 =?us-ascii?Q?Q4x+d1wJQKs1lxf45IMekJtxxlIiH2jJ5sjr3qIgvgSmemRqapz4PlKPOjnA?=
 =?us-ascii?Q?p1I0y9yEeWF8iZWOcaXrXROPY3GXZbmviil+j7AX34wwdrgN9eS4vhiGG4yI?=
 =?us-ascii?Q?DosFpLzkC0xT2XsYS2Q1hdXEDS+ABx9EjZtsbFUsLmJRW7n3yCcibC94Qe2l?=
 =?us-ascii?Q?KZCZesGEc1bBZclfH+bCiUcupiNX0wV/catN5SPd46R+zQG49fXy0CktfG6M?=
 =?us-ascii?Q?ajgb3A3CQyJhRhj0NKOwGGwsoqhVf1+AHRslDODCEAkQzcl++AOd6qZSr86I?=
 =?us-ascii?Q?vTySNT7A87RriUxx8nJPSJAdvwY39YR8skU5/NaJAreOumusplVjCiIg6uFW?=
 =?us-ascii?Q?v+E/N8UO0Aq1VRl8xj6QsN7zPL1K0r8Y9b1RnD3zF+Jz8/p//Fe3hicDYnXm?=
 =?us-ascii?Q?otLuPdUaj+/fwGwiT6vrOJ4p0rCq0dERBGlTTxVwkDNa5WA6rumcFBVUz4pG?=
 =?us-ascii?Q?rAq3BJUdQH+JLu9uzHTcj+jK22QsbOZJLPUYkcr9sPBq5kQ77Z3Rk35l3ZaJ?=
 =?us-ascii?Q?JKgc2NXDtSn7p0MIHWjHDDY3Gltct8Y=3D?=
X-Exchange-RoutingPolicyChecked: 
	eYtFH1v9ey51PadgpLxxfI7B+eaUtxLmHViDYZTBRtoamBZBHJybB2l8d0NvMQZWUBxaUwQBLq8vZ2tbhtDWKnJDMItissJEw+xULi42afdhW/bCu8ExM4wiLVh01+C/KwGm6KwzQaR5RJQZl++UffhfHGvUN0ae9V9Evp/waRyZrz6v4H+ilXm9unyJdclaSIGgjJ7znjWEFXgvBIhlO6+1qpRvmra5WXoEohpzdXGMdxXudLqhIjekJN8uPuJoOmCilu6QKwgs0bNBxlQFQagUpMcDraqsQeZ0EOOjpVm9rnTXYW7t8kGYVSqBEEbsNBhaoD6nZ9+qzzug6bRdig==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec82ac39-4281-4fdd-3fb0-08de80ee421a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 10:49:53.4892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1P72UR1IGPhWlmSufo8NgIwTLcUY+EaFEnau0LUhL1jd3iwMQQZ/d1vVYG5FobTvG1xy+gGor6BO0RFJLFLYfxVnHo7pXWAD0MnxgM/y9v4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8239
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 2ej_XcZ9pTEGbkoxlHOhCmn-rHvmHpUy
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=69b3ebd7 cx=c_pps
 a=erT4cWMnywdrD7/NC3b1Og==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=HsotbtpXEzHC3KwKYnoA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Qo7edDJW4xxLndT2nc0UeT8iZdIv6lSB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4NCBTYWx0ZWRfXwt24b8e0Y31i
 yVBC9GIt8OfVpacZSIalhM9HneY876FNHo4+1WYHBmxtYYw6AlYY94EDiAneE+o9P9naB8hm85g
 H78oK6qkbWbMl16WbrP+JWUCng1L/Dwi2fj+pPMUFk1P7QHd9j0VYiBoPXS/CleBCkjzhaZSsUS
 GO+h1E4GeF7mESszenip3ELZuHDwKxn842WLv6lLqL7gB2QZNE2QmW8Zgy/Fn6uQDBqLdvHaLnC
 CEQV4i7j6ahnOd73kPcEBLGJVwYuNcaZYFMUyngaAeifVhLfy9/CNvYd8HBOeQoFdG70wDR0aO5
 cob4Ehtpv08k/gw+nK96Cuzpm5k39Vq3u75ARSYUqr8ul/PXRLyG5cE0VwhtcGUBDfc+MvLvpLg
 10cycwoOqgBPv3ZCzPxLsJdTvjxHV5KBQE5E5wGSDSPYsBjj3JJvSpTzy3fhX8mOs0lMMcwqi04
 RaD1zgx+XKo05u1P5fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 10:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233039

* libsoup-2.4 already removed in commit [1], so remove the soup2
PACKAGECONFIG, which may causes depeneds on libsoup-2.4
* provide soup3 option, enable soup3 will enable soup and soup version
  will be auto defected as libsoup3 since we depend on libsoup, disable
soup3 will disable soup.

[1] https://git.openembedded.org/openembedded-core/commit/?id=94ebc5b798aed6eea642c5e2a4df24b386520636

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.26.9.bb          | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
index d77e52d74e..e7ca26406d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
@@ -19,11 +19,9 @@ RPROVIDES:${PN}-pulseaudio += "${PN}-pulse"
 RPROVIDES:${PN}-soup += "${PN}-souphttpsrc"
 RDEPENDS:${PN}-soup += "${MLPREFIX}${@bb.utils.contains('PACKAGECONFIG', 'soup2', 'libsoup-2.4', 'libsoup', d)}"
 
-PACKAGECONFIG_SOUP ?= "soup3"
-
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-    ${PACKAGECONFIG_SOUP} \
+    soup3 \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
     ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'asm', '', d)} \
     bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 speex taglib v4l2 \
@@ -55,8 +53,7 @@ PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
 PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
 PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native qttools-native ${QT5WAYLANDDEPENDS}"
 PACKAGECONFIG[qt6]        = "-Dqt6=enabled,-Dqt6=disabled,qtbase qtdeclarative qtbase-native qttools-native ${QT6WAYLANDDEPENDS}"
-PACKAGECONFIG[soup2]      = "-Dsoup=enabled,,libsoup-2.4,,,soup3"
-PACKAGECONFIG[soup3]      = "-Dsoup=enabled,,libsoup,,,soup2"
+PACKAGECONFIG[soup3]      = "-Dsoup=enabled,-Dsoup=disabled,libsoup"
 PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
 PACKAGECONFIG[rpi]        = "-Drpicamsrc=enabled,-Drpicamsrc=disabled,userland"
 PACKAGECONFIG[taglib]     = "-Dtaglib=enabled,-Dtaglib=disabled,taglib"
-- 
2.34.1


