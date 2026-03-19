Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92DF1088E5E
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 01:56:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2149.1773885376690896976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 18:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iIhi6ySu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7538356787=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62INVJd93167751
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 01:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+E9CMHu/xor+2br127l9
	YzXz2VNwu2Rj20659/wK2DM=; b=iIhi6ySu+tCoT8yspqfjSJQtkqnt9MwiXat+
	2uFImx6sXY6k99cI4Di1GPKMbiqay5LP+Q0SqnrGKo26h8NPy/MQaDo1xff7r3ni
	cauDYO9WI05QU6TVMWnRn8HWEUH1rxP4r52WpiBSXbrOfH4NbQ0zgdyfzCqjCsJW
	SyIIv63f1KzpwkdVFvntcy2GgJQydBoeydVOyQ9aYeB+tlylcqT9V48r2TmpBGKi
	ZGwe0smoRQxpryMx/I3c6NBhkaRjaETORwawrv+BaEqGIX0ICD2N8txyv74+DjvC
	Q3CL0GgMaxKDBzAI+9fQ1eW8PbM+rsl1ePsgkh1xgXuaY3Ciug==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012001.outbound.protection.outlook.com [52.101.48.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cxm66bntk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 01:56:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNxICgp9kMZjvaXGIAIdncX7Fk0rylFiWrfrWFKdDXyJThbnUSTT45624NgF1Vy2/uGk8bhvRH1N0M69gGIIffQeFOS4+Axq7x1VO+FaEUdRjgPeIPKxNKo/9Kdwlj0q/zeh/04eyh7XN0e2Jtx/ZC8o3lRmOi1lodTX+oqe3itM/6H4zdew39ZQYf92MCuhMw8wEvjaNNl2YA0s3MKOY7w6GW6K3yMfyljk+/xqPD1r/gTWqIoHIJifXznFSGATp2tMDLxWu8Rlq3A3k5MKMoawi0oFbhh769xOibnO5bgjXydVHKTFk2V/mTZvN7UG0MKGCN+VJk9LfM1zJPXQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+E9CMHu/xor+2br127l9YzXz2VNwu2Rj20659/wK2DM=;
 b=DxGhYOBQoLDch4h1oHlDdWIEMqjwqxoJrj5ipJXap/ooHEt/UswEJNjDeeBDlyoqyYIGIMVbaK/3JhU9xNNNreOjJRbYkXLxor27obXYTHBGbE2NW/6/Zj0GyqP4JAOUOx5MIF8Hec3ESBu4fo9IN12ipZQwX8LiR3JBlfdB1E+SGnMql5P4Mi4ieYmFBr4QJWPsJrOO30fsK9DNdERnGHUOwZZBSU7htk/48OYuucd5cTcmOGCUiS3Bt/f5x51SKhAKDJ0XPaXAhYnWEjlIHi97orWGlQrsJO4G4CwDHXZWSTTWSOObEruQL+eb+Q+drhWdACdEL4XA9ds8bYVTbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH0PR11MB8192.namprd11.prod.outlook.com (2603:10b6:610:191::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 01:56:12 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 01:56:11 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gstreamer1.0-plugins-bad: add ANY_OF_DISTRO_FEATURES
Date: Thu, 19 Mar 2026 09:54:31 +0800
Message-Id: <20260319015431.821325-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH0PR11MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb838f3-ea63-456f-d384-08de855ab1fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	0xBrZhFVKD32sbkNHWuqc8XqwHlNydht2LJ+fTxF5pGRffTgZJcgAOVuPUK9iudgqa4CJUmFXWWsU9PrOgTF8WMPHXTeqrfZ2O3qnV1/5VEFt3TpCgf5HSfXSOtxkwZGa+F/nfsAthAMvcX/bL5XuEzw+qiau3pfacCdQeFhRMkGAQVypJd4q+2K7Ny5FDJaQHF/1ccx5GO3Ad+dwZfgXXrjrGcQOql3fhRHG6obRS/98vASqTehwAUQuF/3HoxXCf8vJVW/Q+rSiaIUb4UFRypS34QNWzYZ57Cm6AN6rzqIippa/YoggiGEY74ThXtcf4ST+TXMs5+ghwhtsHJp54/pJWIUvJmg9tcX0Cxz71rE20vODFy7H+6DU0mrYukx+j3zshEcGTy48zWz8OXYoJrIyfPeydWVdQJUFOuw2r9F+m7n569N/bHFOSEiBd3XMHK6oHOrRwy9cmmVHKrZ5akDjnQrRdGreat6MXjLufzVd2EUGs2OGCguRMuZawUgPixgAYQ+fYuJ+xAVXTvApbtwSGQ3Rc0YFoFKuIlNcA39oo2TPwPYEVu7cQpldCrRCZpSYfp4QNHMGxEZTWg1PvuYk8JgXtFcXSpnBj6oS2vpqBfmuhPejuONPpiXXLnbH110PBSYCSX7YXkXjEWxCi0SvUOJgF7mOMDuDU0+jf4ieM5ZwVKCTDeWoGiWB55XdOLxvi5lGTr4GvrYzFLtVBLi03EDOoKfl1RiEbDHIpWtVzNRg9FVXNwEIrGxvdfZLV27XNuDB1OmEftg1eknLpkPtASGeXrhI3dYFNMUuuk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6wdBfv/FBPrZCzsols5yogg5DUzQyeErzIkA1HxIJMzT4ltTJVGtZuAoHpUm?=
 =?us-ascii?Q?RCGx+YgxuztA/W0IKE7K2nL0gphI6T+ZGzMsD6y/pw4HcVE0TSZVirw/LI7s?=
 =?us-ascii?Q?C0DfQaCYrQHitDlGtpN/5KuokFR1W595neXrgKZZcv5tbxVYp2tOGDgzKngq?=
 =?us-ascii?Q?ixxyH5d6158aM0mEFxeuaET2TfJ1fbLtR6Q1flO/UDENuQIMBcJ4AGrXfVdF?=
 =?us-ascii?Q?ABk0t8a8OmOsfu/sai1t3R14IP6jHYENlo+UTFvXifCEhc8b2b4BL99OjFEo?=
 =?us-ascii?Q?EeRq7l+28tSpW2msAKI4kHT6wQHIUmu1t7ObaA3X4KRB4maIRF3GxDGHSWDn?=
 =?us-ascii?Q?PcT/kbGF2lkPkDQlxWi3aPKlwqQ9XjlakrzZCIWOLzz1kPryXfBCxqtfbYHA?=
 =?us-ascii?Q?C0E1+RClkCJ9Pgf1cnaiOJycFy5VBTLZaxsQJKlMgb5emnqbMkbWLLlano2n?=
 =?us-ascii?Q?Ux0vyeElGanW2LtIAaOMwfO5X8nQ7mpw93b7Pwp8mDVxYdSE0XB2l3VUcyMy?=
 =?us-ascii?Q?TbqN8kQsaFHX7J+i1A614Jj9x0XTKTkifK1pYG8ppej8GtZUjk5JPM5FXlaq?=
 =?us-ascii?Q?JtEDH4za86np6j0VYjesv2YqOBtuRXeTToBykHR4VPwFpGeb1aHmiZIIc1or?=
 =?us-ascii?Q?Z67qyeGSoQ3okVtXJ2m/+gwmwYAGnqM6PwR/Y2BfBW41Q/9U5okZSS7B6Li0?=
 =?us-ascii?Q?1CEG3U461yCJ9U4rIttIxe6TFvfhepIQUKkOQl/GIGAC1f/TMsptnc4syxIB?=
 =?us-ascii?Q?t2xq6lh/ET7rYwTeF3Cnfhjjd/kM7p80FAf3qpeQEt1U9vxRS6k3dLqQynau?=
 =?us-ascii?Q?XOUhTUsMbpibt+8yIWfVreSEjpNVmTeEpxJnlWd7LraFvlhscnPM983Su+L5?=
 =?us-ascii?Q?6s/HZZON5lmDWvJo4m7YfuNNO/9XyIP2AkTqFI6G3bMlr3PSG6uu1uzWnI0c?=
 =?us-ascii?Q?kx60B0YKWNTxIxowxvblP9ASOYm64bsgcc/HjYhZxck9rn2eCnhfPAKtsq1A?=
 =?us-ascii?Q?HdBS84VxAnRnC2vt4jSqiN4pdzq7QM1CEP5z6rJZHJUibf8r8ddfLOj/ujO1?=
 =?us-ascii?Q?7ZweOGopuuO5i9aVOhuOjhaJDZZYkqnYBoC+gdUJqe3hX6t1CPOv4D27R3ft?=
 =?us-ascii?Q?4whaNLYMaoBPfemhQCrjUfRNwkcr6PPNmkUJtRCCCQE6zZ9r1JzU/Ghr2/yx?=
 =?us-ascii?Q?g/gcUnxwmLDq1c6s1KV0XSOrDtivwG4BIZU1XFB/woFxBW3bWxm7KNk5+OcG?=
 =?us-ascii?Q?87R5NFeyQ1rSAg1KE68hNK2AJa3fI+s99Ub8MNUvW9eZf3hpNBFi5WDmIt79?=
 =?us-ascii?Q?1cCrXJZMmFdPpnXZ62KFnBdTEUKN0E5LkhXw7PHQZrl6AxoYtDNLW9ZgpO/K?=
 =?us-ascii?Q?E8OVOrEVaf5E0iYExfP/vnRlkFqAmZC6TkWcnqLFFXRNsTQ5KuFaCR2E30l2?=
 =?us-ascii?Q?VUTxiQDf+5rlU0MpdwZfq8NenEduPxYNPN4szcZtc6bmLDXG9q2D/DkA67zv?=
 =?us-ascii?Q?C9pB820K2naDkMHmtB/OIravBn9LLbgBRDAJesasXGCagcoNaf3d7wmpftJs?=
 =?us-ascii?Q?eMcnAlRJgMjQymuzKjlz9zkaIOMMXDO9ZwR/2ia8m4l2MGwlsM5iaznsKR7R?=
 =?us-ascii?Q?3K+iMhsksvtr2fLFCYBKyP7wmAoMCYgRNzOimCdlxjaTH66DvgG2IgPOVeK/?=
 =?us-ascii?Q?SH9SiMkkqhGbTs4QELgaTJTNJlgufB97axB/DjQMuw4VKBNEFkSp/s65g2RC?=
 =?us-ascii?Q?IHmCoUs8Puio1HwqwDpGiSDngvHAJOo=3D?=
X-Exchange-RoutingPolicyChecked: 
	TfcQzs/kXKdIBruyQgG2n3P28Dv06mCjCBJN2QZ6LZKpTcWf274jNYZOvCzs6UqFUfddkDnDaC8qCuC14Q30B3KIHRO8uVhjL1VosnVhbkFejdbHp3ViX7xbCDmggBoYGfZQgTIH+pOPU8m67jyeLuidKycZzsN2/rKPj1V+iQ2x5Z33Z3p+jmaqhsCdmpcurA6bWAXyYIvTLOVXOgPxpczM3KZl+qyikf+tAiJ/IlMAa3MoWzOau0BR4zzH5RiodDcRpFkemFvfDu/JxZF9nE/XG3qWDc4YuTH4LHR4LWnsB92WWvAXH0T8OdW39kIkzJGG+29B8RfA0IiwfS9qTQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb838f3-ea63-456f-d384-08de855ab1fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 01:56:11.7270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIGBHfTIeLVxqp0k5F2AEfJz5H7rQUTlFRWHo1byLv8Bh1slBUJ5MGPAAXgJD6VFhWdy/qnyaHMCwhqUlHdfXq5GtD/qTvMwgZPQhtuZfW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8192
X-Proofpoint-ORIG-GUID: c8zx1l-F7ZNbxpP2IlsHfP9dDY_Rg0wi
X-Proofpoint-GUID: c8zx1l-F7ZNbxpP2IlsHfP9dDY_Rg0wi
X-Authority-Analysis: v=2.4 cv=fLk0HJae c=1 sm=1 tr=0 ts=69bb57bf cx=c_pps
 a=qHyJGWWDR7+eWeZXJqH6eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=kMG_xlHWQGcNhEGIYbkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAxMyBTYWx0ZWRfXx13NdRe+duWT
 ohuLZIkYqq1tbAJRkwaFMVAsIO8ntk1myj4gsA/CBoh/S44pq71ZEVi/RWJDtKcA7riJJWI+wwH
 woQjC80vlV9CYKzflVI6uSdp6AmakFwgJiopie65Ox1x1f1nW1+TtZdhhbVzdjASaU5QKCGWYXi
 j7a8NTONL6bxyN0Znptb8GzfBNDv8hIQu0CGkCl4ULGlnMjzwJ4/y8L9RyFTqY2YVcKVJK4fVKT
 AvAzMEnScf59vb5Qx+lX5wcWX/LsDDO2GQ99r1TDlSuItnrVhyps1t3OxrAQ8L9v2XBJM0v5dza
 bKxfDCL6RJ1buVNl3AumEplUznGnGh1N7LK1jxPf+vV2BjI4gUuntWcNKbIsPjBxdghaKTpmimG
 B+jVbBJmC2wxijDxKjpJwCiwcgGotQWdbSaV5CUsUudS/u3BrrEDYT5U4VxXSufcGmlFSbBrUTI
 0FgfHy4yEuuHH3WRXKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 01:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233455

When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
do_configure will failed with error:
gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No Windowing system found. vulkansink will not work

set ANY_OF_DISTRO_FEATURES to make gstreamer1.0-plugins-bad build only
when x11 or wayland is enabled.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb              | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
index 4a9cb37dd8..2cb00f180f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
@@ -19,7 +19,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS += "gstreamer1.0-plugins-base"
 
-inherit gobject-introspection
+inherit gobject-introspection features_check
+
+ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'x11 wayland', '', d)}"
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-- 
2.34.1


