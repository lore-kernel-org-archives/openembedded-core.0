Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2CCC61DFB
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 12:59:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8090.1788094780799110891
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 05:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rbd23mZd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3702f0b8a2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UCmQCB811406
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1eV8AcFBqYaj+2dP76c/r+iiYPEmYH3aktephdune/g=; b=
	Rbd23mZdFAqMUBlS4Tq3aS5NsqptopTdNhRxJF/fVRxg39pwZkss+mF889fBBPXf
	Zaq1H4HxLeAZlTtZJm4dUBXUdS/q3hfCSlMe1jvDjrfuv76fYg5rwY5WkQu+TK7D
	agr4n0YfdLdus1KZu0ewhRo/vcaMZ1+y8OnWbPKNRACXk/1wdMbee4y1XgxOFWyv
	D/KQHkpPHK/w5+aBDqfAt6TxJLzvCw5TCXwJ9PAeSDRwF7Dy7E00Kxw8i84kBm4B
	HmQuiOacjwkGFv6RJHaYj97cM0y9V+PAyl0HcPHnjNoP1zdtvswcBFPFQiitey/+
	ZmU6aUuZKP6LZjF6I1WPBw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023082.outbound.protection.outlook.com [40.93.201.82])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbpd7s6qk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 12:59:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNX63TTYuw2UPPRabA9t9mLSEBUZKBOUrRhd1kUzYM+EUvEea6zZ2pUIhP7Sz8J+0xWPeGqQmejCggLYTX35CNXbMOYdSDVvDaD8snFCtiktSfiE6/HBv/fUjGE0Fj2yeVEKkWhaokje2QYHcBfg1eF3ITmZ0aBpCnW8z9uvztduxycq5sZgHzQ+FfmefPcbnXKwNBXjv76PwTirtHMydwcbebb8BbtDedCU9M2mj+9W/Flt9PIov4OERYtOlWIsCUR9Ztq1iy3h7Ppqufh2kqe9kRKA7k0+lRJV4LeY1RqtWizaNn599VTpm2TVnVRyQS5cAhavusahEJ19BzUgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eV8AcFBqYaj+2dP76c/r+iiYPEmYH3aktephdune/g=;
 b=O0uP6O7dlqCSWqMnKXS1sWpFOj41ANgLI0D46aV0zuHPxByA/DBRvokPsTqwwPNRtjhng66jqLYf852YU4BJ6VnuKwwT8QISStJ33f4LKict/3jbojH4PKOzNHV7iABaD4JkvjlVavFyIsTxV1JxPrW6GtXS1R6apwnWm1sTQQNhytfF1w1lZRLQaUKjzPKnZvCsezJQdz1Sv45iHUym5aGVZRs42L+VeUwqTVVtd8qfChx/Zgx/mRGxt1ubjTdA9to8VbZ5gsouLyKhIYoQSDTriKgRZo0q7b4v3zFGval8dMmLjAhX5OxZmgQaDI6AYmqZNAApio2oIE+g+hv7QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 30 Aug
 2026 12:59:37 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 12:59:37 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, randy.macleod@windriver.com,
        sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Subject: [PATCH 09/11] vulkan-samples: Don't turn clang 23's -Wdangling-gsl into an error
Date: Sun, 30 Aug 2026 18:28:49 +0530
Message-ID: <20260830125853.1139807-10-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::22) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: ced55db6-9062-4869-39e9-08df06968bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|56012099006|11063799006|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	s6OKfC5M7af/E2XYKnCEAJPotK2Ujs2h0uauIKZEDN6jMEjeLYsrDu685GRccs5R3OuBwRfENqHz681H0M5GH3BnCjBVSmLVaFDGOQcSusECtEXhAxPFq+XBWvbsNr7W39Yte/xgsfZO4QFBM4YdX2e+z1Ig/3JxvxYGhREJMTQEIQkKzpu1os222lmQ0sg/Djc7Lw93Db9vNQ3uAhx3tsd4Nf5h6pQFP+bvp6J/s2L6lmPkKMbDkyMxNJncNkLX7mUb5pwkg7K9iEJeQQRQDtNBeBK2UFJVEw6r5bdrZD3DluBQAo39rvODDjnD38JI1dL/YhSOFWvkpZDzzvUtagYRPRa6A3Tos09Oo6dPna8ZuVStbo5q77gsSnhS25u6KFCEuIWQudfR7CEId9k4FLZvblLpb1Z05o8h+XA7SsnpJX7VhIz5SwyjAaObqZlko0wdr+pSJyX6uWmutzJfraK9Z23NrA1DTX+Fcr/KuYlMqdV+NWtdM+vL4tIX3rQBrhl/JN9+h20GyQLWkQzgCVy41IYtK1OE+DQQVvnaNwDTi/oWSVVaQJsRDVbnYv8UrTrH5mMNwBn9YiWAhD7rhEEbPrGtHVj1IzApu+Rjrcb6kGGGzAq8HeGIAAO/5yW4VjMDCja9kib98Rfj9xt/1hsHaAM0RMKVqkLus5CJD0HorjKJFGPcHaaUVx44Yyc47+iEPPV331ZftQ/MqnFKUdC+0dGQTr2KdBWQ5EaZmR8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MiKERB3ECZNsLsoCxwkvCY2w/pBKuysJhIIr+sK+OPz0ik+q//vG0RxI2/HS?=
 =?us-ascii?Q?d61oseA4/0QJtUt5DE0o71D3foahUYNF3wMzM4bDEMhSvHzOpW0DkDuWPqUV?=
 =?us-ascii?Q?Z3ahaZ5DQQ8SOuqs1ZKR/Tgf9WSwXWApE5efSJ7l4kODOICKPbgbKcbflhnu?=
 =?us-ascii?Q?oW/3cCaD4+dsUVifMjbA13RrUNo2RPZ525hZL3LZT/HXGe38h6zNPEagXf+J?=
 =?us-ascii?Q?fjPawEcNvRInZutf1Ua3vIba4rpzOvTcovvpgXy/ILBVTyauuCrekjELhaIb?=
 =?us-ascii?Q?a/jZoHUb3hrioNG/EUlkVxCxZKgCeQE7jBvoeS0cmrPUmJ6nzzuoL4f4cygx?=
 =?us-ascii?Q?jp5gHyMP0+HfvalU0YQNucNFN184EdngDgRvJum6nDdkMX4qHc+hnk5zNv3K?=
 =?us-ascii?Q?JsNg8iXciTnQDHhqOoJvD0p3oitfR9y97lWG0Ad9x1uPxh6iETnKGGbdvmS0?=
 =?us-ascii?Q?DPh8rNWe47/uVeS2zz0WrQTbdAL9Xkss/f5XVo6ioq9+FgmxKeB/tp6Tvcwa?=
 =?us-ascii?Q?mtLjIdg1ICAfc1qbgJxglRG1f4Qr6lJBIqRFma7DNb1JGkOn+Fw+4xc7+35J?=
 =?us-ascii?Q?NgypDvLO2BHvM+EM7V4I2UfvjzFHtppBgO0Kr4bFs+GJw/fNkrfaaC44B143?=
 =?us-ascii?Q?/TFW4U6SI6vc7El1usarAqwQpROqhRzxtbXDrFn0K53nXKWtxwC3SmlUYwGY?=
 =?us-ascii?Q?GwMi8MiHTCSMrxz8XYHHXnuMatdBl//n2SfViK9HVCkQqdYis9dYI4HikcYO?=
 =?us-ascii?Q?8AkWINTmG8e8vqlDeRtzFkALIOGlhTN67OhRishtKTf7avvc3I6EwD2yJ0Wz?=
 =?us-ascii?Q?JJbpI165WAhMnQsCuFnw84f1h/sEl3a6Ty60r8Y9weuYoOBXUO3zdJsMg3oJ?=
 =?us-ascii?Q?RCn4ZALNbYFIzMCNKH4KCO2RKytRw5+kkRFnvyJ7PSwNy1sSZFxGsor122DE?=
 =?us-ascii?Q?fwMAJ5qUjLsNWPAAGIX8K+4H5VrHg22jsceq2DaaHLF3qucYhsYZqDSFIYUe?=
 =?us-ascii?Q?u8ZdWxA0ML9jJm+rRAPZtr8SNbpLRb24I2CUqBTcc4KnLQvsouJ1aMEIlPzl?=
 =?us-ascii?Q?OzgLcx1ysYm58xNy/FYcL2O6e2haVpLxUYgCm65TYF0D7XaI0OMCOGf7hwmp?=
 =?us-ascii?Q?3OwP+iZsnxq0DHZgBxkjdtFRoWhA7uTT41U454ZRDOSUmWlqtX9grn7QhN1t?=
 =?us-ascii?Q?LhpQlSYFZuenwHnlwDTWgiMAUPrCpxgkSOFAqQwbBq4jP5W6Iw+XbxyHLvrp?=
 =?us-ascii?Q?1CB62X+fXoTGzwtr3TkU3y+ikSMor0VUj4DnU1zaqSPIGF0l+i41WyA0ju5x?=
 =?us-ascii?Q?lmms1p6SPWEZF0da5X2Ix1tB4hWNgjNijr/aQenOk7RJ1/GFnEjTVw218Uxf?=
 =?us-ascii?Q?/Mc0/2nuhpW2FOAZf/ilCNxD4NlyVorUYg/7jN0Dl1AlUHBGFqPJ7xb0ey0f?=
 =?us-ascii?Q?/IodNLh8U1LW87dNWudB6hSQ+lHrSUS6rK+F8bw8wgDllCWpovN1z16Ek3pM?=
 =?us-ascii?Q?DeBtHs0mcjwxyFcRiRy7GXb9EcrqvI5UNQyvbgQQq7X/M4Fx6PwL3RgFM9LQ?=
 =?us-ascii?Q?t77FiezH1gobntbutbl/mcWkQ4qk5u02+YWD+KKGrAkNI832/iCXQp+fN/eh?=
 =?us-ascii?Q?+ZvcuaqCV7BMQwVatRl6d6Y+9LGgdpgnszGnIpfmw73t3nTFvXz6J5bIid72?=
 =?us-ascii?Q?o82XUYUSTa3ZT03fFy52jstQaO72+VElGP21wwMQBBAvUX/1jIJUi7dKk8P3?=
 =?us-ascii?Q?Oi0YgPPAlVSps71W5F7DZ96dAWUKQL0=3D?=
X-Exchange-RoutingPolicyChecked: 
	dxdSio7yHV7XPoJQGAykghqqaygQL8gvq6/3D8Dp7+ptH75uisAPdqvSrCOWfLhEvRqNpCcfeW4FHoq4sAMWTn/wIcl/dDkoZgGtO3sHyuFL5ZJ0hoL0dZWEJDrsLooNSFXf9qSxdH1ksh8cgfu+OrTtRKDMlyYeLwMfi/+oPQPdFE0NrOzNNR9pbI8Bxkdvzhje6q7UyGE/XC9UYwDO2U1XxFn50qwiixjsQK224x0llAqcv+aH7s2o9hHh75ywbrsJ5KhDw1WPIVRBa+koIQJ53frSb1TCWJO2Ni+GRRKSmRG/OqCTjQLgKYBqOSheiC7DlCXcXJ7URv/JhcXpyA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced55db6-9062-4869-39e9-08df06968bf7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 12:59:37.4510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+t+ggklVVJKnF+vHUuuLPyZ7t7/435CnNe9ExnyfbPb2DjopvsMkKTkRiMDXAlGhzvBNaI95Sd9lxJ37Dvm/rmfx0+goydpHfZP7QvZfqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Ie63n2qa c=1 sm=1 tr=0 ts=6a94293b cx=c_pps
 a=ulKS55DWmiSHHqtbYmVMKg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=h7iI3qiOO4R9HEqWkpAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX9sg8RCfpzqfF
 +rV0smNDMErSQ+C1nm4C/z9OiXI+FMBDGWAHICHYI9feQ4cBV8boXyXcsvyiFcqCoKhROSi/cVG
 viS9gDGPL6AX7i/rad6nZ8R9yhva3Zr5IBCnTFqYPJEpdK1DWjyyKPzQekDCcKRJhQsiqf/6+hO
 q3ze3EHRO667w0GT3dz/YgOTTiQ9okm+94Bd96g5U2ERulZ7Ros97VWiaw9EReWnDIqXScyg59A
 szLSwIgA1CGKf91NQxhqmOUJmc6u3ibkirFc/86nSbAaGmokr8ws1nrsKmiaNLfXLAReUjixcRx
 H4P8w3Z08fP43+28NdDatlx+vQOtg2kdIXn/jinGvoYzfcdENbBRoM+fma+Kd80NPLDxwNi6M8r
 ebWI2JRvyOsfwLRj5sjakHDAKvPPPwZ7svXwT+Nv8r+6gzwr8pqD0qm+jq1JAYxdB+6SZzAb2lY
 FrWr8pUj6v7JRQHP+Uw==
X-Proofpoint-ORIG-GUID: QoOHOaDHDE7TQ0DZDcgIGV_TQqbehrkC
X-Proofpoint-GUID: MhBF0aviBVlE3-orsDO96qRMTc2UJ0tN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX9Gjs08qL05Cz
 3ndU7ZKNVb8UJtEiMRy8hCicws+dX/SfLhuWceRsxl4igi4pbAYppZPqvq3fdZq25phmfCcirUK
 6q31t2ksCvBVv1WqjzDGs3qKEd/T32DutYWvxWzbSDl8drq+W81U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244651

From: Sunil Dora <sunilkumar.dora@windriver.com>

clang 23's lifetime analysis flags the framework's
postprocessing_computepass.cpp taking .begin() of a temporary, and the
project builds with -Werror:

  framework/rendering/postprocessing_computepass.cpp:154:33: error:
  object backing the pointer will be destroyed at the end of the
  full-expression [-Werror,-Wdangling-gsl]

The warning is a true positive: get_resources() returns a vector by
value, so the code compares iterators from two different temporaries
and later dereferences a dangling one. The affected class is unused
(Vulkan-Samples issue #841) but still compiled everywhere. Reported
upstream with analysis and a proposed fix:
https://github.com/KhronosGroup/Vulkan-Samples/issues/1570

Fixing the framework source is upstream's call; from the recipe, extend
the existing clang workaround flags to keep the warning non-fatal.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 75d7a39eb6..3d965ff22e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -31,6 +31,8 @@ EXTRA_OECMAKE += "-DVKB_WSI_SELECTION=D2D"
 
 # Clang is fussy about incompatible options on aarch64/x86_64
 # x86_64-poky-linux-clang++: error: overriding '-ffp-model=precise' option with '-ffp-contract=fast' [-Werror,-Woverriding-option]
-CXXFLAGS:append:toolchain-clang = " -Wno-error=overriding-option"
+# clang 23's -Wdangling-gsl also flags framework code taking .begin() of a
+# temporary (postprocessing_computepass.cpp); keep it a warning, not an error.
+CXXFLAGS:append:toolchain-clang = " -Wno-error=overriding-option -Wno-error=dangling-gsl"
 
 COMPATIBLE_HOST = "(aarch64|x86_64).*-linux"
-- 
2.43.0


