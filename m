Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717DFC44521
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:01:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12990.1784293291606470375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lqMUUvFG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1658a50258=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCJ6FU1111860
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:01:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=eoxnxSg8MuDdzpQJZiR+yFWJ5SbGM760uLk86SCxd3E=; b=
	lqMUUvFG7miRiLfnutVj3mmcbLW5nyBs2Rxkb7PsBLd3jGaxA2Kvi6Dts+HW1KcP
	J5vKiZmNm1g2RL18y9oAGBwcr1Aj1yzgtGI+MVsp4IaH0a4ZGXhCfDVW5rvIaOS3
	Qtv0J8lvbeLcL+K7hac2rRiCbBSz9Qt1TDSFKxvYekZsJutaaL4uusKO0+RtJSmD
	peUJFcpnhBwrm8X3bqOnapmnfjAADCAEvgIWGoXpwxA8sZLqBa+4msuh2SaqBIVw
	t3jXQWfvk5gYeSgIBrvRbkOXOUJfeeSHLs4dLiWJEOz1i4cUIpMK5ZzweFvCtWYh
	1j3sYiLZdgrbaTyTJ9z4RA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ffgn58b4j-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwtTUHSXz+J1/rgjTHdlFeiY71y2tD81O32GzEOgALrU9jbqfOYOXhhV1TiMX+8DJ8ttjVgLqwjzL2Gp+snv92VE4wwYyQYz4WvP82Ez60xsx5vN3oOYKOIeaJnOSPNq8EzKmfQ03likIipgV6vt/lTm8DN2csDpI9yIzehUGTf5dOLxMGS87FmB50aQf59ZPGoa7MQ0Ga2fr5dRkQzIhbzes1+YrLPU31qgAZ3YGIBtRlPPJ5KickpOYPqcahw+vEFXcxPIdtkIs7Bn5UrPyvIWFXRoTtZ/HNo00NHgyAOVvBjb8D5k6/Wr4A7UmCMkayVFxvqML6Ywj7Gk7a48yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoxnxSg8MuDdzpQJZiR+yFWJ5SbGM760uLk86SCxd3E=;
 b=tLVRXh/aKbq3AR4KBcPjXQ6Ejvv2klWDtL7ttWmsU79aM+Nh5az9U1b8N6z7QAf6vy7onilfoNW2V7XQ8XPixfnm9q/ayg6HFsR9hxafoCbCPssMHdA/nOSZ30VzRhygua/2qjNeXTA7HH5Pht0upKXyTn+s6UvyrB/xN/pmBx7qlsieDRERw34/B5gZN3CUMhAh4x7AuFejtZTjbZjq2zw2jtB2K57mZ4zvP1JEm4v2sW69Iq7QOO2V6QsrHTgNaxOFrxXnAQAR1vy76QwyEC3EUcD2l+i0inUgBRGKN3GA7cU3BZSv9VNB5Z0/RIY9X+HIX9jX/27nk7QnL9KfyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7852.namprd11.prod.outlook.com (2603:10b6:8:fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 13:01:29 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 13:01:29 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 3/4] packagegroups: add nativesdk-packagegroup-sdk-host-clang
Date: Fri, 17 Jul 2026 06:01:08 -0700
Message-ID: <20260717130109.2187282-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717130109.2187282-1-Harish.Sadineni@windriver.com>
References: <20260717130109.2187282-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: eb49013d-ab57-4d21-b25e-08dee40384ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|11063799006|10067099003|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	w4aK91xujn2Tszvn6SM3BJUp5eTiugoXTCKjBiW/gOiaiOI4ScwxDZFNabQZV9sDDPwDmFa8Z6k03mxVsY0GK5m3AsgcO7D1+xOr693bVi1XufN+Gmn8RKnCHl/BrkZEectsTwFbReBij3Mm9brp1T9Uq/qHDc4vZT6WwC8ixLVi94r5J/8VlA02AG8Ee/L/qNTaEpO2SjDWOR4AiK4DgfW9+WwPZLjDAJL5H/jGjZLGCFW8nitDRLPZlkmZRV1toC7C08klQHawvNWAJAMWNHUGeNIEsGOqrcDt+PdG38zBDQFVYI7eqZ3sdL0Ohip+zG1kR5kN06fsWokhU5Blg75FLfA6+3dH60U50xTiP1b+U929kxSv9AdpvCU5FQaDSv/5FHkADsIoIw+pdFwFF+TPQVt0+sfwSmbVNY3eSZ8N34J7JYa0Mzeqy6HO5RaVGUvmiYvJWb6Il/VCjKFEAeFRP/gnaezVTOPMJ6Hfrl3yJcr3A2xd1SyoKxQIHI3vYulqzzpExhY7VdiwuitiRanTtkLFuokfbcl1a2xy/OjBav1NWKL6LStU4AabqH0abWoubxBiw7H4jvb+a0A5hl7O/k1lW6FEn6AAlEE01yJHQymlKNMsIhbGyP8pNdxBQ602ebTIxZfGRuhGAmiU889eW9H5cCmPe898RKtb8uVPUvcJNWnzq/llIrNt/Yx5frHEG/QfrYnkQTusnHrDyJ3ocIxSfv9E+yS6eHgdaCU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ai4S8DdBeV+0XVQbhrSnBJJ0FdYDg86igr7RCwaewSUeMlbUAliZiaII+uT9?=
 =?us-ascii?Q?Kid1OD9Kbddoxbek1HGlK/csyzmSzqzhICgC2fA0oyhwVNu5OAIdYZZHt1sN?=
 =?us-ascii?Q?Gd1zGVSyEuzVT5qmWVummT8Mu90Ui8LQ30V8jyc6Fg354wLkMMRzs5xlmuhC?=
 =?us-ascii?Q?crKRGRIIRLi9g7XERHV4asv6T3DfJrfbfiEDLyMvo+BFqKNwyYysFvigZsz4?=
 =?us-ascii?Q?43Py/MDXSzzpvKr0GAsatBLx6CcVcQr+s2/htBok6O6oTIe7AcMDCsH0pmao?=
 =?us-ascii?Q?sTqXt/a0XSqpACOLbBBbji+YceGhm11Pu8qXcvFLZBsmUCaQ2/Nupi5awOiz?=
 =?us-ascii?Q?JRopNbv2OyzCwCym6udRFEj0CxdaXoEjoj9DLmTQaQucdjSsat/XsXBokOGi?=
 =?us-ascii?Q?Jb98ZxENPo70C2Bk4jSejdjC3Kz+2aGBbNBmXUd0cBau1yKdi1r2nY3wn+hh?=
 =?us-ascii?Q?dk38UEkh/lfpHnDaezVUr6wt+AwgCqiYF6bRJzmwUD5Z1HqcVGRn/wUqnkgA?=
 =?us-ascii?Q?Ki+1rWeerpVi+5XSPlqAo/bhAJ7DNKk7zLKEH8a0cvF0KRGAyoTsLVHlBVEU?=
 =?us-ascii?Q?qwzkVWDJg3oO4A0go16ASKEFM9plq+2ykDkP/7Tee6pdpXdyM19ZfqrM5uW7?=
 =?us-ascii?Q?EqCKc0lEsEBCoH4gw1LNCqIJhrNeLgVKcIYrTssz1q2tYx+58bB+ym5cpcSs?=
 =?us-ascii?Q?OGbQAb3Q5KTGZCoCSYJ7ggLXXK/slmhw/WPEpPp0dfAet9cHRCaeHbWYz2Dd?=
 =?us-ascii?Q?D+tT/zhnylJYxqfFyux+nI48cEOjRSWBUiEhybmbmoTeIAGODaME+kykcAFQ?=
 =?us-ascii?Q?giEYjbdwgi4pf2QMR+eHLGKzo6HwkTrui+NCo2K1+gJG1DYuOnFB238s7RPU?=
 =?us-ascii?Q?QiiOyAdG068d3b31xjkgmRyLsc/DvfQU9cSG7IISoCT4/EkMVmSF6GhXhD2W?=
 =?us-ascii?Q?/2CODaVwH8xccoTe7oz49TYJ37DQV/mzh+myxcq76yB+QFliT9/HO6tcPZ9Q?=
 =?us-ascii?Q?zZBkHYmGeqqS6Y0Q8K7Lzlt7F9KdGFboFPHAp4bOZoSQ+SXzyFYRqjSWsHgp?=
 =?us-ascii?Q?JigsVkz/CJVJ4DnWFXEO/ymkyPSu9WWnQTqocedGQMAfP1rhU9x0twv3PDIH?=
 =?us-ascii?Q?GxV4MTM4LgyRDaF/9Tc++dvBq15W5lGhTO19kWyJukFDR2Kd/rypLhFsU+8i?=
 =?us-ascii?Q?iMV1HOdI4qgSVRTIeqMRLJ/2wtW9DOikDUZb+JL3kXylxrTZN3GaNtX0JgIQ?=
 =?us-ascii?Q?ULavDlVbKQyDdxZ4oebyKlHUKVySmSMkNXYK6V6oIe8KNVURMhht3JhrhukB?=
 =?us-ascii?Q?zXZIE0um20prKCmNBeV67ThFZP4aqDo3TNY7bIirnzHg7BZIgtJ70Km7I5Td?=
 =?us-ascii?Q?SMDfjNKgVHZ28CiLgFv1ORN0JI43pF6qeSD1qECA6ouUxQwSZIGCzvAilVRH?=
 =?us-ascii?Q?LeSL/LnU/k1gLNLqETQ7d9Fj2dBhaWCg9pOB3bDr8yTL57OqquTZfFiZPulj?=
 =?us-ascii?Q?T2+Ebh1sGSuZBeBvYWaqWGc9DzV+3vFC7E0p3xcyqz72cpLBICjLPaPE/qQk?=
 =?us-ascii?Q?lLR+YY8cPZ1sj8UqUGGT46ilDVbiSclU4+QsNmxqhuG3Q7kof4nQ/ncq7oTb?=
 =?us-ascii?Q?lvfppMqoDFtMb8GyI5aomWmYDd0Hs3RAoMUGFLU+DgEH5iN1EVV18ZBgx7zc?=
 =?us-ascii?Q?BPsFG6xYlz3FmQtcnPHAmUKMlvrXfRalksbGvGMi84ej2bvxKQ/Mb4EpxXBY?=
 =?us-ascii?Q?0xQNp5HMhDmJ7Bi168jVuG3Ltk02ebE=3D?=
X-Exchange-RoutingPolicyChecked: 
	cgWQJNsXyzFSz9xWfG1JoUnIAuMYJ8LVCk6/sa2NoZX/TWJP1M9HavYb7jzaEFHxFSA+1KwmE1NNzxw8FsKgBMzEtHzq+apryCEj3fA5NGizodmy5Lul0tRueEUFWGl4FM4cU0LTguCuwle/DzQv5QleJHirlggEyP4ZKD/3z871Hh6Zdv74kDCfFx9ZJ+Z7xc36GIIX/f2wpyj3EDgxfUU7NsdFEdBKMYIeDU7Btd04LvhrAdWF6IYZO9cx522LRqSyoAxc+JvjFOMQ9kDHPXqg+5A+V2+YIr4upk8FkFrrT7W6yCqGAJc4hB1lUQ+/np+XhIdm4SSd2zlisrHLUg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb49013d-ab57-4d21-b25e-08dee40384ae
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 13:01:29.6633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vpMlIqNCpfXYnj+tpU2MJJ7JwXCDfyptjf378t5dw5mnp4C2Y53y6zK0uL/v5VnkGiJdeytQHRvSvKLMyFxdONqRn7Bh5qY2812WvE79no=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7852
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a5a27ab cx=c_pps
 a=P6W5axN73kUBBlOjEPV+4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=MtlQTh2GuE9gw5VxKJ8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: PxtVZ7YTUspa1BMI7sYZy4gx_EfPrl_N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzMiBTYWx0ZWRfX5G9SsL5M7Lnl
 JGL1y0TpHtmdaAQXzc1snWcUfcXBH7It5sv7PjUymq4kr4dkdqgBO2ijzgP4OcTH4HTXED/ugai
 5o3TbGS7o3Hpac2hYTeanjqLoA1lSniaL2pCKfb/tVWCQJFNC0SDohOjgmFP4/V2lnhSV8C59jO
 9+MrmWxCKMsnFoWKTQJ0jOBBJA4lwces8Yimhd9s1ODVda4qTK1Gs6tbZwAMLeHn+r8mrK78dMP
 HFzvWrFYdSZkKowpJgYsOLkrHgH0UdZ9XovUUY1oK6aHYTkgGkc+wKhDCxNOpHYlLebPt82w/eM
 5TGkOzOOI34liUnuSOZoeYzk771NZ/LUDLNbB6h+gkEGlLA485gBMnCBHOB7WltjEaRfGkdJcCN
 IdDWSu1GWpQrhx9VGzJp9db4Pp7DFBNn9wRrZe2me2h2BEAChZCAMXYiEc72MF2IWivkiqAC1KT
 hLGCipVbq6IHpx0Jqkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzMiBTYWx0ZWRfX/HfSfWUE0Xwh
 c+iZpRo4PS/9no5aVotQqOwTzAwkzhD+SQ5QhSq7rxL3QnTuuWjV79Qng17T2pWSzyaDrEl+TW6
 ecEjm1R3G9fgP/Rsb2nJ1O9Li1E2VeKhS1hcF6rhDY4idYQgjhvo
X-Proofpoint-GUID: PxtVZ7YTUspa1BMI7sYZy4gx_EfPrl_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241178

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add a new nativesdk packagegroup providing the clang, lld, and
llvm-bin dependencies needed to build external/out-of-tree
modules in the SDK using the LLVM/Clang toolchain.

Rust support in the kernel on riscv64 requires the LLVM/Clang
toolchain rather than gcc, so this packagegroup is intended to
be added alongside nativesdk-packagegroup-sdk-rust when the SDK
targets riscv64.

Add this to TOOLCHAIN_HOST_TASK to include it in the SDK.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../nativesdk-packagegroup-sdk-host-clang.bb       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-clang.bb

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-clang.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-clang.bb
new file mode 100644
index 0000000000..d6ee2120cf
--- /dev/null
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-clang.bb
@@ -0,0 +1,14 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "Dependent packages for building external kernel modules using clang"
+
+inherit packagegroup
+inherit_defer nativesdk
+
+RDEPENDS:${PN} = "\
+    nativesdk-clang \
+    nativesdk-lld \
+    nativesdk-llvm-bin \
+"
-- 
2.51.0


