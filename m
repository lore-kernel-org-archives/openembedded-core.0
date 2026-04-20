Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9F9EA71B9
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 04:24:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12592.1776659081146761770
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2026 21:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N08vvIjc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=857017526f=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K4HjtK2110388
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2026 21:24:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=CQkkCL+uU
	OxeUJVHIBmlyLUEjeAIZcREvWlts5J2axo=; b=N08vvIjcSz17496BgoxJ3RHD0
	Z1RPQ89F23pe4DoAAb+CNMe7kFozrSgoqs9tFmiZKxzY/ml7H/q3dVYJt2XF1eFP
	YKYydizWCZ+9qe5VS23NyCE+jOtHwGTPYzVsahIMey3SXcwV3oRcqf2qKE1GjzyJ
	pbANvfqGYRr/oNnSK9AdLib0xu+r61z5mkF5DWnXcQZGRGI/6Z0rXt4ciCmIhrv/
	WgEUJRVkpDs2e3bMk4DxN0aLvgJJh0Dp4yjS4Q3kNRBuX1SCJwtF5gqpRrsfvEtl
	xFqVx2xXaG4Oysv4tLuHyPI7ZA3baPVMmyuIbHUMemTL7jQGp3rX4qa5wBXRw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dm5809ags-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2026 21:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SR47CIFU8Yez2L5cT9Fwm0ibeF156w5Qp0VUjToSfdZ/Ztpkc+yt0l52JX18NoH6Hl1wYvNH1B45E7NNiKGYbxNUB5cl+tL9jLQEey6lFqXVOusY3GVcDHnhN5A+3Im5yC3hg3vUdzdHHKxktNZyMeVZtZIh0s9EoVl+v9vtKhaL74Y3OIUrX/1lG8K3rpZcW6UVTp9A8GNA0PTtHTtr6HRfJHK5jix4d1+5hYfKdWY7N2T3ok/cnxTZ1IN0Wht0DoDfOWaYugSS6ZPx36fA+Y2dfAPEr89eom9tI5ev5knd6X+u9hprOTWX+pk0S+YSXmoGcLysNc2Uj+PtI26SQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQkkCL+uUOxeUJVHIBmlyLUEjeAIZcREvWlts5J2axo=;
 b=A+Ax1EAgw2ypF70n6oAssaC1TREKtvF8RkMoGBIQ3WgjUJDrZBOguXG066gUJfg4PnoHRCqRStJ+EVRlgV2WW+yE6BW/wTsImC3pwxCojnRPlAn6C6BL8ozsBbc4mzDfIkkG9kd850KMPTOEYe2Z2WS1mb2KtPAIEATboP7C96ubbu4eUMaXCajySBMwu9O83l6qm1bx69Sg5IG0Sbmebbc0+oxPYQlR+V9AaNjoeIMV1c3CFo9UpCD9iGOZdQIRktGULt0rqe6eaNgDxjjy3OFsQoV63L4eMRVSe6GTbSU2Joakro2MR1YHpJAMqShiRkRypeQTuGP9nJ4MpraI9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SAWPR11MB9546.namprd11.prod.outlook.com (2603:10b6:806:4e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 04:24:37 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.20.9846.011; Mon, 20 Apr 2026
 04:24:37 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] binutils: Fix CVE-2025-69646
Date: Sun, 19 Apr 2026 21:24:09 -0700
Message-ID: <20260420042409.1727728-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:217::18) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SAWPR11MB9546:EE_
X-MS-Office365-Filtering-Correlation-Id: b42acb88-2ea4-4e70-7f04-08de9e94bbc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|56012099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	DlijLU1uZM21f7wIff7Z4rN6wJ4zAsBDYEn2+SXgjE+UEFJahntdVfHp+4aF5Y7cIaamEyDph0WRio3PQnZNJYPAGh5nF39oU+bFO8MXCi4RAh5T0QUBr3+aYicfFkw0SnBjaKutUefofmyPnBnDnshOXRPesLwzuT9/1oIz3ajbAp9S325hUy28aWdgQh4owXW93+yqb0GMKLWRBlqN5ZCGW4kkBtA/VNcdb8KbaOgqA4NGwp/VVtjVZ1AaTAHoWFIFVsgNBz6H6WC5Qgkybwsx4swOida2yik+SEj9dPQPLe2x7P8g6nb9B552LVodV0iCQyAwTh3MCGWggZDXr5yfzRvnAXXw4ZsCNLKNFNG183VUlNNU+8ghyW4l7PqLE7/OUxniU7pDqko6+FOV8vGzRD2gqFJONFuXUrdaB6ItzJBjjRakrkjZ/7BfLE1wCJtLwonpLhS29m6rKuTxazl52w0AA+j36jI6R3wIMeAuyoooP+JakSlyp6w85QnvfL0Eo4/mvSzvOhHcUb4rBFkSuH1zBHYouj+/PyTNVR0x1vswGQv47E7xCJ8W7gtK3bBlwPoCj4VoE3wP49qkqEMm4OJy4M6OV+IzZlTfKNR0ADr3nNlCAuTybuWzO1Wy5nVTt+xLxHI730Am88Qvcu3m+/gRmObH2B6ZFCg40Zqy1eTu/Wwt0kXhGfMB5rxtbihP0WQBYv/wym+d540Mgw0H7Huoax1CitZu2/G5E70rLQHC2itQp7PWCfOh0NoONbn5UFatkdG5En/oy9EKOgaP4p2s2Hak5skfQMFi6Yw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sxwqEQ85KG2Hi22sE8r09xAwhaDMh42hR654UnrKWu1Leg+jw0eOKM0ssU54?=
 =?us-ascii?Q?d87KYAovWjqSLG6Aln8OsS/dRatgMmcV7zfix1iQ4eZbqOfpSh/q0RVdm233?=
 =?us-ascii?Q?waUcCbznBwqsyUjs6vBp5JuZH9mrKXoyhdNaHmF6hOq/5UuK/OS5ru40JFOQ?=
 =?us-ascii?Q?LkixgYSpP2FLfAwW1WhzlgexuF40aD5TQ7KXGMs3G/cvSmSXLxAIOJe2MkrU?=
 =?us-ascii?Q?FJC8yFhmYHh1UPTuAEWJYHVgzcX9C3gRbCtrPnx2PXpWgYSHx2FOz0T7JDzB?=
 =?us-ascii?Q?bzLDTy3rAndbbPGH9KKCtae32cAyBtZHmp8r4CYYLRZF7XOpuyS84XxPT9+v?=
 =?us-ascii?Q?UJspNBOZy9CQmFJyOCcVkLpbMFTdx1pzFxhz0TnqdVSE4fmmokMcvnWCgpzC?=
 =?us-ascii?Q?bIKMxJpMxPHlgmGrh5QNwhSQkhCAZZjbPQemebJkbTN7GxoUKxnPpAR0XAAW?=
 =?us-ascii?Q?hnR687+xvNKQszQWRYanexayJTJ+vBdXIdILIaD2g8ZdkVRaAx+WRv4zHCDv?=
 =?us-ascii?Q?maH6vK8txrrFUJ8n8ZQcAoONdrm60LRgwmieoW2Az0+kKlzaLrXrO/2ggdTx?=
 =?us-ascii?Q?WLl/fPYvD2ncYTJCw+bqT/KS6T/H/l+0n2jRtHCLN9QhKM37GITfFtM+b+3n?=
 =?us-ascii?Q?RZzlzsX2CsEUDX5aBnq2r89yYjqyDFnfcjn7T/DoTbNHVagMYsAE9XY/xlGy?=
 =?us-ascii?Q?kx0+8FIbpMPMXW5h4AQ15MNW5EG1kIgF4blwjbKto4wTuGjR+H2z2lamZiTv?=
 =?us-ascii?Q?ygXEAMNb6zW+Ue3Ixcu/9pfMo6DRyKv8Xcz6UeHAoXc7nQ1SersPVsBwfT9e?=
 =?us-ascii?Q?962+QS4+iDe2K3xse6Fefp7ChLnpQJnR2zpCvi1MMrJvUcIbBZK4w5OXJQKx?=
 =?us-ascii?Q?AjbdSkN1g2uB7J+irAiAlmnwTOuGemo84PtuQyCbt7+IX9INxHqIbne8FpB5?=
 =?us-ascii?Q?XKBFqxYnSvAeY24+r7SngRIaz8KDMD+c7OTOJlH0ahEONbXfImCUnondVNDZ?=
 =?us-ascii?Q?GGmk878+dtqCyMfEhxNh+CSdQjvrUK8xrYGWGDJGO3NN4Ix+NWZOrwUMz6ee?=
 =?us-ascii?Q?Ktk+kmiPeUKnwhGX2Zv1RuaWnlQySZKPLGALJA2Zv2JRrnbMcFnfxe989dE2?=
 =?us-ascii?Q?bl3HajH3Gd/DB28+MsC2iJ0D+7oRz91IT7iid3dUtSh9vJx6NykQHkU6GEKk?=
 =?us-ascii?Q?aldpG3E16qux0I9Fu9FCM1wYUtPKDIucrayKWN9ZAyP2Rs+oWmNifdNmApWF?=
 =?us-ascii?Q?RNtlRIlahgOkha5/BjZylimUMvwpENr26B/A218P/K/D6nWUC4WKawPHXlem?=
 =?us-ascii?Q?NIfe5D3LJGKEZnMrsED+Tf5YO1flbjuolaONwnUwu7mT6KRkdZ1ynX/yEmXV?=
 =?us-ascii?Q?ozqOUXqA7Gc8xvd6wryC9DcCFhInnG4xB0d8rdhFQB11CZyMb6lrhgfMZKgL?=
 =?us-ascii?Q?Ou7Jp6yzeVzxmwLGdiqmf5l/o0/cqUJBgh8UzkMBBQNF1++iheBTW28UT4fx?=
 =?us-ascii?Q?60Oag1c1DELV3eL50C2noFYNsRm3snJ4hxhqa7k3doIXpLBI1aSqpa2Eigyd?=
 =?us-ascii?Q?czDseS/8C6vdk7HrebH4/QMpsNvu4rq0gP5ux7pj2qMhGHOhKj5z0WlU8p14?=
 =?us-ascii?Q?d2lPFyXF0jwjEuoYrUEV+XXfMpnpsw7Dmv9yNBpJ6QYim6IxbGqug4tj1jrY?=
 =?us-ascii?Q?+LGilncv9eAjLr41z1WVfZ7M8q5iWIkyeP+/4g6n0QvuploUw1fSC1+hB4/o?=
 =?us-ascii?Q?YoP9694+51lrmlBQElHXOpy4AU7NAXo=3D?=
X-Exchange-RoutingPolicyChecked: 
	tRU2fjB+TWl1TlYgnLwSiPOSwYTR2qdGLAE/eAOMrNG4V+4k6OSeRVBMGRItorgOi8uFO8ZocT7eBxXwyb3EUpu7BDaFWiZj+Dj5qVeJD8psumDuZqjGdtVJf6OuzAfD2CNgOE83hZ52PC9Zcma4DgFWRJuNIGcj405qSPfae3j97aFwsOxZ9hGBP05H30b32YEKaMQS71CgVmoxJmnmGkKsUTZvqEWYlzA+FmOh44prRtNYt9PSa0xmevORPTzxNEQl7vxMaAqNH3oQodsxBKdCeYh7COp0ou/IBNguEFOwhWXssnYy4f8YDOSpGnRjUp1wO8DuEqE0ne5tbsvfUQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b42acb88-2ea4-4e70-7f04-08de9e94bbc2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 04:24:37.7001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyqPIPIecBAWy8P86uiq+XJifV2Ni+OZlelalYgJKgeMiyyYzxc4rKWqbMF8iez1fq5ZlvWOvfy6atxzzi0fgrdFel5j3+t4BWBjNZ6no5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9546
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzOSBTYWx0ZWRfX14drE1KFba/9
 9MdsjFDhk+2UICdQl11TTJGkfJzTCwvINdRwvEV8n+ceQ/wDkW5I/tL7EL/e1ktgu0i6A/tum/u
 CeW6i1dcc6MZV8+WO0Tx7byryGBxvhVAVQlkC+E9p3dkzFa+1KOO6qzbbrlqYVhMKrNpALKgiJf
 f8rLjRU/wRsyrqrHcRpEy2kLFR/ez0m6PlDy69DvFHizrqBhS0pAXG+AEzx0qSxP+YEn2fhaHuH
 Hcw+5hSbt/rlaSP/Ou3+Sl/u4fg2uX+GUrLuu7V6BgoD9Z+a1HKechDKThcZtH2qY0ck67BD6js
 XJTLS9uGSgYUarKmGv9uRThlunCMqkcI4g0E+cCOIxHMTL6Ioq/5tjVGcCUHLnKXZR1TMEbFdvE
 x7eJRotIXnaUvOtZeqcdiwe8Ma8K1BYIYihID9vSocHUucMk4/t2WEc0LAltpRltplzMX3PU9My
 YLY0BOKq3sct91Ll78g==
X-Authority-Analysis: v=2.4 cv=LLVWhpW9 c=1 sm=1 tr=0 ts=69e5aa88 cx=c_pps
 a=9jnBlOlZf5MLgdYWwawaCQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=3Kybyv1rMBWpeGLoB4EA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ujL3wB9eyH2clc-wqadjjzFQ-Er4nnf0
X-Proofpoint-ORIG-GUID: ujL3wB9eyH2clc-wqadjjzFQ-Er4nnf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 04:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235531

From: Harish Sadineni <Harish.Sadineni@windriver.com>

CVE: CVE-2025-69646

PR 33638
* dwarf.c (display_debug_rnglists_list): Return bool.  Rename
"inital_length" to plain "length".  Verify length is large
enough to read header.  Limit length to rest of section.
Similarly limit offset_entry_count.
(display_debug_ranges): Check display_debug_rnglists_unit_header
return status.  Stop output on error.

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=598704a00cbac5e85c2bedd363357b5bf6fcee33]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/0031-CVE-2025-69646.patch        | 187 ++++++++++++++++++
 2 files changed, 188 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0031-CVE-2025-69646.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 839d31242e..beeb758b64 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -69,5 +69,6 @@ SRC_URI = "\
      file://0028-CVE-2025-11494.patch \
      file://0029-CVE-2025-11839.patch \
      file://0030-CVE-2025-11840.patch \
+     file://0031-CVE-2025-69646.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0031-CVE-2025-69646.patch b/meta/recipes-devtools/binutils/binutils/0031-CVE-2025-69646.patch
new file mode 100644
index 0000000000..42b0b858cc
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0031-CVE-2025-69646.patch
@@ -0,0 +1,187 @@
+From 598704a00cbac5e85c2bedd363357b5bf6fcee33 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 22 Nov 2025 09:22:10 +1030
+Subject: [PATCH] PR 33638, debug_rnglists output
+
+The fuzzed testcase in this PR continuously outputs an error about
+the debug_rnglists header.  Fixed by taking notice of the error and
+stopping output.  The patch also limits the length in all cases, not
+just when a relocation is present, and limits the offset entry count
+read from the header.  I removed the warning and the test for relocs
+because the code can't work reliably with unresolved relocs in the
+length field.
+
+	PR 33638
+	* dwarf.c (display_debug_rnglists_list): Return bool.  Rename
+	"inital_length" to plain "length".  Verify length is large
+	enough to read header.  Limit length to rest of section.
+	Similarly limit offset_entry_count.
+	(display_debug_ranges): Check display_debug_rnglists_unit_header
+	return status.  Stop output on error.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=598704a00cbac5e85c2bedd363357b5bf6fcee33]
+CVE: CVE-2025-69646
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ binutils/dwarf.c | 67 ++++++++++++++++++++++++------------------------
+ 1 file changed, 34 insertions(+), 33 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 615e051b2bf..d718d97c771 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -8206,7 +8206,7 @@ display_debug_rnglists_list (unsigned char * start,
+   return start;
+ }
+ 
+-static int
++static bool
+ display_debug_rnglists_unit_header (struct dwarf_section *  section,
+ 				    uint64_t *              unit_offset,
+ 				    unsigned char *         poffset_size)
+@@ -8214,7 +8214,8 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
+   uint64_t        start_offset = *unit_offset;
+   unsigned char * p = section->start + start_offset;
+   unsigned char * finish = section->start + section->size;
+-  uint64_t        initial_length;
++  unsigned char * hdr;
++  uint64_t        length;
+   unsigned char   segment_selector_size;
+   unsigned int    offset_entry_count;
+   unsigned int    i;
+@@ -8223,66 +8224,59 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
+   unsigned char   offset_size;
+ 
+   /* Get and check the length of the block.  */
+-  SAFE_BYTE_GET_AND_INC (initial_length, p, 4, finish);
++  SAFE_BYTE_GET_AND_INC (length, p, 4, finish);
+ 
+-  if (initial_length == 0xffffffff)
++  if (length == 0xffffffff)
+     {
+       /* This section is 64-bit DWARF 3.  */
+-      SAFE_BYTE_GET_AND_INC (initial_length, p, 8, finish);
++      SAFE_BYTE_GET_AND_INC (length, p, 8, finish);
+       *poffset_size = offset_size = 8;
+     }
+   else
+     *poffset_size = offset_size = 4;
+ 
+-  if (initial_length > (size_t) (finish - p))
+-    {
+-      /* If the length field has a relocation against it, then we should
+-	 not complain if it is inaccurate (and probably negative).
+-	 It is copied from .debug_line handling code.  */
+-      if (reloc_at (section, (p - section->start) - offset_size))
+-	initial_length = finish - p;
+-      else
+-	{
+-	  warn (_("The length field (%#" PRIx64
+-		  ") in the debug_rnglists header is wrong"
+-		  " - the section is too small\n"),
+-		initial_length);
+-	  return 0;
+-	}
+-    }
+-
+-  /* Report the next unit offset to the caller.  */
+-  *unit_offset = (p - section->start) + initial_length;
++  if (length < 8)
++    return false;
+ 
+   /* Get the other fields in the header.  */
++  hdr = p;
+   SAFE_BYTE_GET_AND_INC (version, p, 2, finish);
+   SAFE_BYTE_GET_AND_INC (address_size, p, 1, finish);
+   SAFE_BYTE_GET_AND_INC (segment_selector_size, p, 1, finish);
+   SAFE_BYTE_GET_AND_INC (offset_entry_count, p, 4, finish);
+ 
+   printf (_(" Table at Offset: %#" PRIx64 ":\n"), start_offset);
+-  printf (_("  Length:          %#" PRIx64 "\n"), initial_length);
++  printf (_("  Length:          %#" PRIx64 "\n"), length);
+   printf (_("  DWARF version:   %u\n"), version);
+   printf (_("  Address size:    %u\n"), address_size);
+   printf (_("  Segment size:    %u\n"), segment_selector_size);
+   printf (_("  Offset entries:  %u\n"), offset_entry_count);
+ 
++  if (length > (size_t) (finish - hdr))
++    length = finish - hdr;
++
++  /* Report the next unit offset to the caller.  */
++  *unit_offset = (hdr - section->start) + length;
++
+   /* Check the fields.  */
+   if (segment_selector_size != 0)
+     {
+       warn (_("The %s section contains "
+ 	      "unsupported segment selector size: %d.\n"),
+ 	    section->name, segment_selector_size);
+-      return 0;
++      return false;
+     }
+ 
+   if (version < 5)
+     {
+       warn (_("Only DWARF version 5+ debug_rnglists info "
+ 	      "is currently supported.\n"));
+-      return 0;
++      return false;
+     }
+ 
++  uint64_t max_off_count = (length - 8) / offset_size;
++  if (offset_entry_count > max_off_count)
++    offset_entry_count = max_off_count;
+   if (offset_entry_count != 0)
+     {
+       printf (_("\n   Offsets starting at %#tx:\n"), p - section->start);
+@@ -8296,7 +8290,7 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
+ 	}
+     }
+ 
+-  return 1;
++  return true;
+ }
+ 
+ static bool
+@@ -8327,6 +8321,7 @@ display_debug_ranges (struct dwarf_section *section,
+   uint64_t last_offset = 0;
+   uint64_t next_rnglists_cu_offset = 0;
+   unsigned char offset_size;
++  bool ok_header = true;
+ 
+   if (bytes == 0)
+     {
+@@ -8419,8 +8414,12 @@ display_debug_ranges (struct dwarf_section *section,
+       /* If we've moved on to the next compile unit in the rnglists section - dump the unit header(s).  */
+       if (is_rnglists && next_rnglists_cu_offset < offset)
+ 	{
+-	  while (next_rnglists_cu_offset < offset)
+-	    display_debug_rnglists_unit_header (section, &next_rnglists_cu_offset, &offset_size);
++	  while (ok_header && next_rnglists_cu_offset < offset)
++	    ok_header = display_debug_rnglists_unit_header (section,
++							    &next_rnglists_cu_offset,
++							    &offset_size);
++	  if (!ok_header)
++	    break;
+ 	  printf (_("    Offset   Begin    End\n"));
+ 	}
+ 
+@@ -8461,10 +8460,12 @@ display_debug_ranges (struct dwarf_section *section,
+     }
+ 
+   /* Display trailing empty (or unreferenced) compile units, if any.  */
+-  if (is_rnglists)
++  if (is_rnglists && ok_header)
+     while (next_rnglists_cu_offset < section->size)
+-      display_debug_rnglists_unit_header (section, &next_rnglists_cu_offset, &offset_size);
+-
++      if (!display_debug_rnglists_unit_header (section,
++					       &next_rnglists_cu_offset,
++					       &offset_size))
++	break;
+   putchar ('\n');
+ 
+   free (range_entries);
+-- 
+2.49.0
-- 
2.49.0


