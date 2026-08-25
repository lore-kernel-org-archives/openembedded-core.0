Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B2DC61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12586.1787621611837447426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=d6rHaUmx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P09qJF214504
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 18:33:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=; b=
	d6rHaUmxdJ17rdv92czhSGJvRv5Z1Z7C86SPQUxlK75PaByJA1fYCy4ECiHG6djy
	AYL+7D1g7rB8W/0pmxrmN1e7ZnCi507Grk+2aA7SuOKHuY5KEY60p5p4yWuSCFK0
	LSUcF8UDWbPxU2CduAreOmP8sIu8KYqmmN1u8IN4at8H5xopMYS0pOezd2Y47A3b
	8OUfJeFzQbtMV60aQVv5sQWh69dyZ/614wzkQ5iMyLjDmqbo07BAfnhK/klYj08Y
	NzIr133EQLsjoT/ktr/JCB/VwYUT5jvn+jJSM/Jv5FaK9S0aTCdreS5xcwHOvleC
	G7qhZW37lCCASHNtplmOZA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022106.outbound.protection.outlook.com [52.101.53.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gkfyx-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 18:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkxrAydHubMqACo0DGuiXudN1RyPJTxbZQ1SXa2fx74DEt8LTt1H8Hj6/bB4XygP7SLIwZsY5PQefpZq1IbYLFYrkhTYzlgSQsJlV0oCp+xn5H9YhjrMifQyRVKCr/DVLOiiJEkL7f9usjWLx0O41xB3+PLI5KwfxPnd4LcBnwrazSSiYSF60Zaacvx6pY+db/BpaJLtNEL7TP7jNDAzMKECoS91KxmT1MEkpu5YSli4R9RSR2ms85AOgmSBv32MEC0kcuz11nwiLdYpRevL1Up4lB30hYlUI0Xy0mfGcqFQBUVH5QStQYWRGeZh6FW8g3+dXW3PaZ82X2YgUDgfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=;
 b=DcGbfefxTnVArXkk/Nfb7Ou/q0jBHL8bF75bsI8EZNUa33egwdbXFEaRJ+5f1hUXFlbTqaO/xawQs2ULsOVvo9U+tpojwAo0F68xTJtUugoPezHml2qJnoVhhoQBN4ErCSmDCCtrA1D25o0YhdWQrZbLF7uGH9WQl8LMVUa2o/4eL/MXC1rhxeYTifH5Yn9tq368DOrb1d3lyamiXzCnC1Eks/SzjLYLzjiL/EGMnym+Lyk6sdXxWUiY7h6b1ZGQS1VnqLsvST43aqr2xCIa94r6XkDLr/GqjXp+3W9v1IgJ8ohzGouUqP5ydXeWLqhMwfADWkpA5/c8x/ZlSE6DPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:26 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:26 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 02/14] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Mon, 24 Aug 2026 18:33:00 -0700
Message-ID: <20260825013312.2695028-3-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ac333b-b43e-4344-f686-08df0248dbef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|22082099003|18002099003|11063799006|56012099006|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info: 
	7Aoxo82OutD905/EZESpBxbNeZ21lFZMX9o+ISWI/ucjQ8i5Lq+KTjB1b6ldD53XbU0f5yTzwMw8UMUjLhW8/Y/dssTfyV6Tla0JtocLL0scysr6zomLehs636uvhMfzfBTHatC1oVvl9ayHeQ3ZBl+xtvTFKxs8aGuBqFVazC7gOidCVytu/mzvCyvkkWWCu6fv3ToZpyR5NvqAgsyHkMwogYS1v3rnut0k7VmJ/RbA9Ea8sXev6XWm5S2ytedREGHFwOdCwjTW++17rgOilAnSOsDvonIRGPd4qVHCrCgdH+MEGm7FGNJBgMEHaPY1J0GKtkHrEJ9Fe02cnHeQEzWJ8Lymx4EnbC2sRTdxJhRSogUFlwqL3XWKYGCRqsyTTFAbCbwezurGRmWPEEdhDF50FLLeTAju00M/3D0dECgp8QI2rv7o/GED3dxXNz07N/gRZDTHjcRac/Jio5N8oQwAUGfqXxEjILHSzLZwnUKF8JkGqjhEl/6oUG0Redqb0iiKr1Ly3vudSZyLwV/HXjLeOFHQ9IuK7g/S4ea6jtKMxHyR5jnarH6zSZUY3VLd3be/NO0tXzfKmuaOxAGv5fxmMr+ky6BsxZlAz+zctxB8sP8mnk/jfwPl3cujnKYPdtErhlSOyNgDzhyAGng3Es9C2743vUBSyUFFN8Hu7Vpli5OCPG/iE85f5pBBwkv4FiNqAgPZEKhwbisKdf4uy9XM4qz5ie4rR5i4Tgy/jHQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zr4meB4bXnYZZ0HDLEdIJrlF6qiRwHcXA2Ed1PmIEb8DbuSKQNKt/9anOs/9?=
 =?us-ascii?Q?PUCeY8g53iiFhST3VE0UdPaf86Q9ypbdqlbFKMERRbLAAnZmTclCkXTGW/PJ?=
 =?us-ascii?Q?hMyGQrVPSLEkKrtULbAGtmPR5BS4Q0XKmjxOtMTFlzIFzYyjqI45LmCxSUtK?=
 =?us-ascii?Q?JawNwVeR1s5UPuRkQwRCBR17DnKUPJawTW6RgLAi0nc2qIFrckjWz3MKAtk4?=
 =?us-ascii?Q?bxEnTtwfDUIufgaY1IuFouc5Hn4lyuwgULmh83q7VfwzDlB69CcRmQUki8Jn?=
 =?us-ascii?Q?7qXbAa3FSJR8FZRLdKUYDXsY4Y1IZaNLQdDf3wJg/AiRwsgz031HhbsxRSmF?=
 =?us-ascii?Q?c7K7iCaaZ0CoOPgS9Jfjb5oggYjrPDoy1U+lw71Z1Dzdp0MySjCl1d6Y7lYu?=
 =?us-ascii?Q?VVd/qVC6lyUropSPU60Ka/r48LIxVngX9k7ozh2Dd942tmvAfC6QCjk+n4f2?=
 =?us-ascii?Q?lUxC9WYHCN6qhEAJvAJ0UhAcJ2eqGKo8i7pJkTZJ/uRlC9sm5mmHUppUfVbO?=
 =?us-ascii?Q?pECr8pnBr2OFmmU/jzcXW32R4TLU8Cy+IxoixRHYZDyu5A6N69ILXzVpzeTA?=
 =?us-ascii?Q?WNJ/x3EX2IZewWpiGWWsUjfuWeLEAyS6wpjzod/EeO2TDi0v0dOZO6IwI8uC?=
 =?us-ascii?Q?xeiwTrS4Hk4xgi45Bv7Pa8MZoojJhnHO25GhQJMkdmz80hZg06/mjUIwDvV7?=
 =?us-ascii?Q?nJ/+7CPo8EfYhLOzNthwf4MyRt9jpI0mgVDCdxAtAvLIpmgk63jDbJnBnMiu?=
 =?us-ascii?Q?iJl1olF5xy8I1/sHWxitvVKYHJMl2bjQzSIqFnSwoUy35jBtivDliBl8rEqO?=
 =?us-ascii?Q?unkZ+hiXCdTT9SzQgtH2E7pj/0keY5N5sFx1jDUDBto/ajpfR0msRwYL6xz0?=
 =?us-ascii?Q?W5Z1tXjPq1pS3I9tm7eMS6X7LA8t4lq/lzrzgYJz7j7tOXc3ETO012oZJgka?=
 =?us-ascii?Q?Jv6gZo3dpWGcuGscSK7TXTYfdQ6pfY6oyCPmpM0iIXwysuNyEZ4bvVNDMbJE?=
 =?us-ascii?Q?OjXpk0Xk+5XNs6xAVUHhh9OKcnP970QHwYmkKIjBRnwgPEhlE+jq3czQTuFO?=
 =?us-ascii?Q?dfIi4EREE76zpgqv0kGlErj+1cuZcnpF7rCF/C5S3iWrU0Gl68x8vl46JDn1?=
 =?us-ascii?Q?SDEcBxbfbJvJTyH1S8igoRLxiBrDR7slV0oM6VuSQjyMNYk3fgYYj3rojWio?=
 =?us-ascii?Q?mUvwv5vNvPuS953jSrchkswjdJndu2zxMtoayZForX9Nvt1t3EQ+xoG3alu7?=
 =?us-ascii?Q?fq6SEi0hfAQqoTIQiQwFQkK7w6aje5LnxFfq+nFLUukxlEMtRLq5/v1mrUiS?=
 =?us-ascii?Q?7/cKHFTXKNjg+Ifwl+3K0RZ4y89Gas/h+DRBhLMowRLUQ+6vt/67a7VzsFLp?=
 =?us-ascii?Q?A5QOO5WX3o8L3QyE/VVys+jCaxpSIXKzai0gtnj0HCvnKZEQsOmBEFXpxQoh?=
 =?us-ascii?Q?6nV4d8AAzP6lTL7s0pTl+mlRWdLqdhogQhkPfhi3uuyD5bt3nH3fisWLDXL5?=
 =?us-ascii?Q?I0HlUH/hIWyBdOzzw39fsJM6zw4pjZZr7T+ObIgR4Z1DiXcsHTYkNt4UvKpQ?=
 =?us-ascii?Q?DplK6QwJKAAj1WQgN4c9ubN8ISTlEjmaqxcT7QNGJV01ZvA2uRegcKjAVfKO?=
 =?us-ascii?Q?cpvKR/BXBqTCOjIjMpj40+Gj3vh2QDlEsb4+PRjPacPi11dSGnQSf15GzxBM?=
 =?us-ascii?Q?SxD21CSAtDyrNnHJwVJVQcOyEb4o4ZRCfdtET/bLx71YTnHawF/9JjCLeHxK?=
 =?us-ascii?Q?x/GNOGIAUiIZ0eLfLAClcS0t9zBUV1Q=3D?=
X-Exchange-RoutingPolicyChecked: 
	r5zkcPc7sDIQn7k6lQLMIR9pZkfRqHkWmF2vwo/BnBSfpKcfrcUA4Pgcoj8zDFslm2ypzqEgAnoRft26ySLtI2qebjdkVOFFkngDFxc6xRstZNRhbUYhanrVP3h7tFp5bWkJA1/G1kwedjJN277mu6BKSOCUC1fdxVdtYoYHdL3FqBsJ89LoV/730Bk2+EM2IXSqt9nNiMQokQIX1UISL1yhvoUDaF5KXa7ybBAQlie6UMsBTVulQ8wRpC0wN4U7e2xtJj/1XEtiAIj7fOHs3+aqR1dgb3DzxVCfBbIs/tPiL5F7CExzCWNJmg3TWXj25gCMewli0oeVOAR3Yjn7Dw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ac333b-b43e-4344-f686-08df0248dbef
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:26.2235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijyFb1djHlIJ5B27K3XWi7ScARo5ap1fvlxaoCTJvVUJjHK96AEwfUCZuFGun39AGBbbae16d+E900FhoRS1G0axiRwD5oY6LfJZSU52SFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ycPxJ0sq4nljyTNb7yTyACVXEdIfMqsa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX18dWoUUmPsH5
 W/sEMbX+6oZaA5Cp93PzkYB39BvsMmM/64InpXB3bz0M1Jqm/Um/mkTbWetFBGp4ZIj2NGLfBzo
 JKR+MDjSinG6WUnnPlnr418+8ORVN3+rQ/5fZZyMRDsTF1bN91VKOpB8tJlDj8i4+tadJ3i3an/
 EtYygV6mnmokGBBY+EozblU4pyhBMmO6L3VWrXmI2/kjCXbhqsw7h32hOq6OkQoJF2uw2FzdrlJ
 YWtwEHOIlrVsLSP+lU274KkfnR18WbWjh0f3PBhntVoFxricL6DHXJlBMijOzIAQpe0yO8AZLVr
 lbJwSZrprBrKKmVpkaVl8vgfl5pyzpCXMhIu2Wts+IKeJYp8v4triDMNyK8s0WuNcLUElby+RWH
 zC3HRaA3KaIi/ToSv7fi+3x8QgnWW9fJuh3Yl68EYYtA9/DbgBGWndbHseI+QhZYiLYH8jTUIQu
 eUobxKlSlMQ8lxq9diw==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8cf0eb cx=c_pps
 a=lgz4Zsbfm4nnj/Www8P8jw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=uhQZ5Q_QBcnTBNJc4ooA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: AnoDNr1_wjkww6Js4I_Myc4Ag-zRfZTn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX36RI+849BkLH
 ieh+cKjIrdwehY6DOFCAYEftO1Z7U4IpaEPCxF7sq415XoewlPVtwSIhXO+iuLN0lqxzpSl7ByQ
 5g5rKgxZciumvzjsDbTmL3rCV/6Xn9Mi0TRzsxclGIgD0VhCQLgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244174

The rpmbuild is from rpm-native, the lib and _libdir may be
incorrect for target, for example:

* rpm 4.20.1:
  No pkg-config files can be found for qemux86-64 or qemuarm64

* rpm 6.0.2:
  - qemux86-64: The _lib is lib64, this is incorrect when multilib is not
                enabled, and _libdir is RECIPE_SYSROOT_NATIVE/usr/lib,this
                makes the pkg-config files can't be matched.

  - qemuarm64/qemux86: The _lib is lib64, this is incorrect, but _libdir is
               correct (/usr/lib), so the pkg-config files can be found,
               this also looks wild.

The rpmbuild is like cross build, define the values when run it can fix the
problems for rpm 6.0.2.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index f286d3a0e2..9af4cbdd94 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -585,6 +585,8 @@ python do_package_rpm () {
     cmd = rpmbuild
     cmd = cmd + " --noclean --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
+    cmd = cmd + " --define '_lib ${BASELIB}'"
+    cmd = cmd + " --define '_libdir ${libdir}'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"

