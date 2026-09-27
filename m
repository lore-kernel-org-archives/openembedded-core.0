Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E05C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 15:41:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38633.1790523697059564284
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 08:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c+LfKhL0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3730e607c3=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68REmmBA3671729
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 08:41:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=TKV7gKPPk
	tCaxScKQVCNoFaVn+45p969wVvUOlqCqZ0=; b=c+LfKhL0o4r3xgY1q3j2BsBdi
	dCFh6B+q7l0b7sC92e/k5s92G05rjZV2Ol3VVRv87/rR/AtFm6ezpXoUVNnvfZrR
	b9sb2f9yhaqvuj2pw4g1gMLW2EA4VS4MCTHGVgxgx+CSGD505UzhMH6LAYJmgVoZ
	NI5UHH0CcIlNqoLFBC0oIkLaa24tw581X1MaQjg1Ur3Iddo1DEW5Tv9BI6Sy6Q38
	ICya0zEfctVb9rDXO4Kb2Ro77zzBGU/9c+ytKiUMlrJxNXBoPffEvBnbeXpKes/j
	+4bmQbAuIQJT4zY9WdwsOM7tFhIrM6k2hKbhg0B0vc4Tq33qXEkKXF+Ydb5Yw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020101.outbound.protection.outlook.com [52.101.193.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx9b1s82a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 08:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDG9O5UNxPdOn1UsOQaHTxq+TN0LYN34lPf2DMKefmzWX6kZr7047k7CKD2XgdOX2jDGaE5V3f7emUP2BjpKUzBK1L8+ZWA4tocPIR5Egvb68NkoDqH8s6MRj92O4klL2dchZUNCOv204IMTyol29P47xchYdryVKnAl8uwXHK+00RRSR3K+Oa3CqYs8vfiNrP8wEbRtQ41Hajd/u6YewDScZfciahM5HPc2AF44MWQmdz43JtHo0FmFqtMJo3NvCdrVwAvnBKdQYnF2oarqLrXtWjlsuM++pffPUtpubZFmEuMCRbomT+gIVPxRJY8IBDGypPRr9mOOvcjAUR45Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKV7gKPPktCaxScKQVCNoFaVn+45p969wVvUOlqCqZ0=;
 b=UVBKtPVOCW9b6FJIbTPW1mzhG1XGUr8eSM7sqkt92BitIivx9fXmRx4QlJ17P3Y1SqaxHkQmRLcWoa6MPUg6fsNFvZbWFdbPoL1+/VfKNjZlurZ1DHNDuO+qP9VbAjeWPBe19gVDQCEKKM9iEcO/xrXfkrSGY9gU63bSqy8N3gK0jmddFm8Lbh55Ix3LZjD20EE1+ZKggbAJUG/maa9J7Ykz1lKsLz+3l9vSs14SfqlsPgrC5Vk2QwXkcgG+aGrVCHWTkbTr4sRsDN/CwZ4fST2++er84nTSDA1Cpm0a1MwR2/7cqd9Fmfvgq2QVtgmWjr2Q9BP6e4b0LxMDYa1Q1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SA3PR11MB9511.namprd11.prod.outlook.com (2603:10b6:806:47e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Sun, 27 Sep
 2026 15:41:33 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0451.022; Sun, 27 Sep 2026
 15:41:33 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: sunilkumar.dora@windriver.com, ross.burton@arm.com,
        richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH] ruby: strip the build machine triplet from rbconfig.rb
Date: Sun, 27 Sep 2026 08:41:19 -0700
Message-ID: <20260927154119.1129073-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SA3PR11MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: d12a2a33-49dd-4add-0dc4-08df1cadce6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|10067099003|11063799006|6133799003|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	YIXE6vuT16d2TAB/BPgw/F7SpvgutqiG3ek8YfrFTTgdE+BMsNmvdkq2sFnJACQ9jcjXI/3WJ3Wrr85rsagFWlS9EA6R7ft+3EEvZMWmGeH8iIa0hMW1rBC+gUGalGrhrXKpWEJOkLxg4H1CQwPFvDEpUp0x0jqGXVSRA5HsgtZsmjRWi8tGkTTu55gXuQvrgoOGBkkX/y0H0dmM+MCKj4gXJCE4/m1zkWy4t39e5t7qDGF5DFIKV8sWSVtWDh+JXxEa20hzcwlCDSCVPLMtVM0LkBIK00pL//6Ye6pElbYDJqlLl821M8+aemKDhLQCrwQNvN2K6cZL707nnxN67VCeqR/tYpG0D4CEmKDoxtLGpptLQFUtIz1Qr8phN+ovz1ILXc3SZuOYLw+DfTu5qrHHYsBImTzdbBk7TI+o010ceVFnqejSGbfOvGIsxGED9RZ9NpFWx5N//Sp88DIcPTFGcnp4wpOrOMH2dNiIMQwvaN1RwfZdt8xpHdt5kmjhY1G13tPGmvh0izKIjhJ3MMUG/JJz1EL0PaIZFgcekTFKnNZ6Aq5LBygfmnIeS7inRT6lDJKjrEKsgJpo65HWqV15PHkBNjc203H+T/ADQoO3supLqC3RumcLeMl0zGt5fCBjU0elIk7WLSkCj4b8Bve2fWwzeb17QMxsYH0ppRmrMs8iq20wyZKJO4kgyJpdQ6qzP9/FYIbmnjUkpH/rFHWjvChQgRFWwPRtEzaA7K0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(10067099003)(11063799006)(6133799003)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LdXA/GRTKNPGTKG5AaHh/+nLKMn1zjySKDLwVEu3ntB8vuUoNVV5xBIeGzvq?=
 =?us-ascii?Q?FKMW1Lf3/nJb5LFDaVYORp5Qo7WzdZYSnRKbrCosu7aKnhU0xQ0JeUvNKxfO?=
 =?us-ascii?Q?hs+03e+4JZ76Z5yjoXZ/+5jucHthYrvDX1NnNrxxVoIhNPl6dE8ui66E5Mu+?=
 =?us-ascii?Q?FtoE4t0rzgFicQmlAnNj6ei+gWo90X+bDBU+JBPU/sKVwqPxf2DV+I7sMPRu?=
 =?us-ascii?Q?4RN0nBL8oZdAdtBlSipzt3vEcuKf7nqQvWaDV8Vhew2RB2MeNJaTGclrqH+N?=
 =?us-ascii?Q?ekFbLpSfKXSfs2QpNv9mzD346RD6l0bUOlp9nIlUtmHqAtcXNQfkVg05SPCT?=
 =?us-ascii?Q?lddq04YMxPPyv3bfIGds+7x93hoWO69WPIkdoxc71NIILlMm5fwEJsSydeqB?=
 =?us-ascii?Q?3wpNKF4q6XNq7D5UfvLL0IIBc86SD41kCp602RIJzCPwUKXz0vcekN7MTUjX?=
 =?us-ascii?Q?jmbaZF+QVaM5aVR14ZfEaxTjiPKTSWRTaVlAg9HQOFgR3Ei3AU4QQ9ZPG4Ph?=
 =?us-ascii?Q?WEBvpMeokm4npK6xvHKX5cKZD4NePhd/FBo9NmipRfDyoLqXORUQwAAxC5lQ?=
 =?us-ascii?Q?BY9YB/KDi8sJ7oHLhYt2RN3EhuTbldFbrcQ6tx82uyMwUbl2c+izoLWVqQ7b?=
 =?us-ascii?Q?bP146RLDrJQZospwCe1JelhkU0c2pkUHZ8+y/ayV6iHr3KiIZv6aG6aLvgqP?=
 =?us-ascii?Q?0LIqzrmZuTOfrPzA6cmXao6vmZ7WNnpVbt8AySZMcAqWlc6PbtlKfKle92fl?=
 =?us-ascii?Q?4mqWSU4/z5H6Ej/x6nSSMzGJL4LQ2VxyBi7JO3aBDnxqU8aolC5wryPF48PS?=
 =?us-ascii?Q?H+g3SW401GD9akacIfeyfBVwS1VXT0T+sFGcpM1e/7W/OWETD4Gy1I+DDTJr?=
 =?us-ascii?Q?NXVz6c14QZOgea9GH75eTzz8KtFSj2Na7Viq4+js66QE9J+rQc6n8D72eJ9O?=
 =?us-ascii?Q?KwDdn7Rd6bk4nNYnD2w9XMgSfo+wDgmZkJD0obt6/E4EXZdE1vbZ6baWGLF2?=
 =?us-ascii?Q?+8OMIT6wLCPA2RJJV76IZFiHI/M2FDHa42lpyj3KLYRzf+gOCa5uqWcNrlJp?=
 =?us-ascii?Q?3ECfzCO8wtz8pljZz4rmknXYpo43wCifiYS/EoqEPbOEiN3dTypOmDwsnt5o?=
 =?us-ascii?Q?avYYQY0SfWTeEyFwjbeF3vfB5Hee6z9u11TTWaox04BOBF4F8PL2zI3AMrPS?=
 =?us-ascii?Q?bOTqrxfea/gguBZKehEV3U+7xBk/ZX3bgOkX/OK6gjZ1ShJobOzVZqRgUv6W?=
 =?us-ascii?Q?8hRvG4KpuxkwaQzIFlxYCHb1smYs8inbeZFShL6VZqJ72N/cHM1juvwuqfRC?=
 =?us-ascii?Q?d4wLmxuHdBVvK86p5cGS41ccbx+Zo5OzwPsLjFiueuyo7oVF5cPYuH8o78kP?=
 =?us-ascii?Q?oSrSqoN4ZSi7guRJXUV80wa8FXO1+hyvu+DBUEUi6mYLCVZ3CiaUcln20dpw?=
 =?us-ascii?Q?Qc2QsU1Co0ZxKuVk8id4/2G4fZOEcAEFend/LQpFFNZNpq0HV2M2SMO45fSH?=
 =?us-ascii?Q?vFEvfsuuCMPax7Qi/AkdimuI+5gXca2s1PcDXu4gNArcAmM+zmDWOfVHcbBM?=
 =?us-ascii?Q?QYTdsoSf14NxLAaUjsGet4kJG7/gux9WU4kFxBnNZ/pzlsaHczlf0VktfaaK?=
 =?us-ascii?Q?IvR6bBSJeDwYRtqUCD1eYbvdoMaKMBGrxq2TKD123wOtoCfHb1UUw8D8EZ7j?=
 =?us-ascii?Q?dZ61adpBp2Oum6cLNBvHIr1yJWHHRHgj5vsNhpGQ9YOkhmnwMiGo25v2vJ26?=
 =?us-ascii?Q?/whLf3ucWbKNPB785vxZsZkVdbDzYM8=3D?=
X-Exchange-RoutingPolicyChecked: 
	wiUTBYVQF7T4oI1oDEbOtxRPmQgn962mpfZw9dERzH9mec8s9KSPTdOtgkW6EeGq52YV/bAxQGg/n2+fSCqfOJlzwty21PDWConl/N/r4zvecJnhzHfLRTX8pgD++K5AtHfjRHv/VQFN5k6LqbohE4LruN8glZhVh+ojBz9LyaV26mnr1W9LcWH2frnowFv+NDwk1iVMA0mMItU3/0dbqfgDOWg/ARJqVtm6moPcDC+1hp6g9iIfIFWuWdzO7yxB4YWqHz+jRkOcEmW6VdR2C+BVi912PYVrHI9Pp8yKhN3dZzYLCdVGxr+v4AzYubxhp/nlZqZNoEQ/k7sXeRUNNg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d12a2a33-49dd-4add-0dc4-08df1cadce6d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 15:41:33.0235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zO/GHlgECwPAXC5Ao96s6vwrrusOIzXhW1wDZ+3a99ws/Nbs4lyWCA0R4s/mWmvsksQaZdGdsKg89bVejQRxEjvWPmD2gSDVVEGQre4xMwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9511
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA2MiBTYWx0ZWRfX5f8GeROuD3YC
 kA1If1z+RyLvU0h0FocpC5qkX44TwGZEWImiajlzGSoVGISjdFE5zAyJO9ZVAn9f9G1qXQ6vANf
 67rqljO8Izlud4D871lu/DN7NRCuZiguBq1w+8Q3tsTV6sOxkIeStE50ma0r2cNQMJUxXAoDYLZ
 ZW2ztJgxLaCZMxCZVdCiDOUSFmcUg8PKDlOpf3FNWB9Pz8jnlS0H7FGwAL5u7pxO8Bj4v/vBSEx
 HsBj3qdRHz40zMqFBRi9Yxn9vTA3EhhZdNwxf0MfWNy3842NGbLj50SNOYBtyXBCLVgAH/B5myt
 ShzvTo9+eXW9Ow3vfryO0myeOcPBUpCiXfjE21HDVwCrdnXFcVqE09fM/0jaLGL1UqnoBmfPdKf
 EhoSwaq1XrcuFBtTlTfnmccCF5z2vJ47L5sLtMGQAh8O23j+FVnU7Cl2GE7TWfZjzySRvlBHCel
 VdlO+gdsk06clCKGWTw==
X-Authority-Analysis: v=2.4 cv=bvrZl0ai c=1 sm=1 tr=0 ts=6ab93930 cx=c_pps
 a=IAlGFxvWO5AZskdmYTP3vQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=HSA07h31KwFpea_0oPoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: D96sMY_-Ctkm1aK2ZnJc_fpkRECNOML8
X-Proofpoint-GUID: Fe0DUsW0lrctOwHaRGMRFXbVFckelMwO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA2MiBTYWx0ZWRfXyb6Amy2++2lK
 lwROqvKDw42DkzrV0OMM6XY2aYlDXCNjYipn4ucDtj6wapVgRlz3zPA7fjl5U4j8cnhoaW+jCzy
 vniWOcE1iCwC52suUnX1+MH0/qLBe1GYQzE+ZMkur00e9sjBAKOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609270062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 15:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246689

From: Sunil Dora <sunilkumar.dora@windriver.com>

rbconfig.rb records the configure arguments and the autoconf build
triplet (CONFIG["build"], "build_cpu", "build_vendor", "build_alias").
These describe the machine ruby was built on, so the package differs
between the x86_64 and aarch64 autobuilder workers. Drop the two
configure_args tokens and blank the four CONFIG values in
ruby_scrub_rbconfig, which already cleans build paths out of this file.
build_os is left alone: it is the same on every host and mkmf.rb reads it.

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-devtools/ruby/ruby_4.0.7.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby_4.0.7.bb b/meta/recipes-devtools/ruby/ruby_4.0.7.bb
index 324de86f8c..d8dcde5fbb 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.7.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.7.bb
@@ -91,6 +91,15 @@ ruby_scrub_rbconfig () {
            -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
         $rbconfig_rb
 
+    # Remove the build host triplet (build_os is the same on every host)
+    sed -i -e "s|'--build=${BUILD_SYS}' ||g" \
+           -e "s|'build_alias=${BUILD_SYS}' ||g" \
+           -e 's|^\([[:space:]]*CONFIG\["build_vendor"\] = \).*|\1""|' \
+           -e 's|^\([[:space:]]*CONFIG\["build_cpu"\] = \).*|\1""|' \
+           -e 's|^\([[:space:]]*CONFIG\["build"\] = \).*|\1""|' \
+           -e 's|^\([[:space:]]*CONFIG\["build_alias"\] = \).*|\1""|' \
+        $rbconfig_rb
+
     sed -i -e 's|${DEBUG_PREFIX_MAP}||g' \
         ${D}${libdir}/pkgconfig/*.pc
 
-- 
2.49.0


