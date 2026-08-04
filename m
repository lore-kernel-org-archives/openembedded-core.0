Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE263C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:08:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9707.1785816517284382554
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XKbgBsYs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2676761eb7=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6741aXWO2679316
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Aug 2026 21:08:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=; b=
	XKbgBsYsLgQcUQRIkOfaAiS1GehreGrutepTU/UDsPmT2xiiXK9T9oMHYjrhYHWy
	hiH95WHFQro/2xr0y/1msDT9Dixq/9OL7AuLPSfUSGEejuAicvwdYPNwnkccA5ES
	MPCAXlWlUxy/ooX8m63nCU5Su0RjvuK25BlIetupi+ZAW++NbHocaro0CQkHzCTR
	4Jqv2MnyYTULwf2YnZG8GFS0w8R4t2ISHFKKggMF1h6KyhaPixS+2G6uJGy+16KZ
	rUnHb4Z7vlWbFY2HSrm9FdS6n1M/0OA5AFM63DUV7jCGLNaZVsn2XX8nAsSKbp+6
	RqavU6X+bNB+TF62uKw8RQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011064.outbound.protection.outlook.com [52.101.57.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsgah3ae4-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 21:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEfY3eRhNgjvSz+yNOAEkhxps2pvh8Y14UPpVnAdWzZ+OWMe6dk7l99p/SeOgtk3xdy38fylGPCXJEws2nhT/uQieMU3kcrvCpuHL4B23NNT+1crVIRn+TrvdeR2G8j9LVzErP2wNa9bG9S/ApFUdhvAuQti0Ug+Z2KL4UY818PqxDvOkKKdNZoHaRXs1fCP7aAfXCR46iXlynMi82xbORmrP1O8rzyA6tjjtpIsOZJAmgDGw/IhqLnIuiJuT8kuA93WqyAB3yx76N1XsHMjJjKVAZ0mztu1h6Rx9/2FvleyrT90B8Rcm89tqntWWDRBLgD5NW1zqW0rS0oHf0ozKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=;
 b=RYrlW0ILGTRtIR3ysDK5zzda75Sp//jnpPf4Ah/CG1Uq3Wi39lIBqhqXF8PbvT8pvcXtOWqnhrO67+wXIa8URXItxhc2OZog5ddZ4J6b2yGJ+rj2lVYL1TY62wdrpGst/y7xkYnHZpiR7YjvJIZovlTNi+hDL3Fb3yXTjl/F8zz1Q9CFPlYOlx0N+zU+nVrTIPt2/Mb9wC4Az41HksdcMrFMuz/T+NGgOv+EL8KuCps47XGRLaX+65ALM590nm422gt3MeTsWZeqozpxcF880Y/AQO69ePltHBTZXaiNRViUkOKEwmnNVsue1lRbHzWBhtTfPVqxDx+o9T406M46dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 04:08:31 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 04:08:30 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v12 2/8] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Mon,  3 Aug 2026 21:08:09 -0700
Message-ID: <20260804040815.1499699-3-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
References: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: ed4218f4-f45a-4bdf-25b4-08def1de0b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|38350700014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	dMhOEEtS1CEo2IyKLpZbDMaRaKx8YzrslXHcRvUt+OAA0fMHFIJp7Jnky3O6xmTXVDPM6c64MclsiI/0Hb/Qclm2PHi8Xi8gNKXqDZnndCUqT94emp2G6Y8R7FmYSEaIIAHPohkevVgJEWS4VB1ZNBSH7xS/oeeAKs1F1SUWOnksRCI9qv/OSSiE4CzgK5Rbc/10p6B2ATBQBQqJq5GsgX5B2R9VZ2gCM9eW4T2dfKPfLzeshxUXXL3G0GTy3XJXEIzzTV7xiZe2KVV26Vk46V2uCDlyy/CGgUD/06KYYOAroJ1E6w8OIbsAjEnpyfZ54uaSZVBC8L3QcnBlOaxHiPuCFlPcnCGxGykCF2o8lcNtlByOa+jnI+5qjNr52BU9xtW0t54qtPYpC4tO3qjv7gf/ecx/vQ+HdefeoWgXld/DW1+EuQfnq+BTg3ufTz0hgpjRztBnQngrirecaogRggujYlrZTwFn69Dl/6tBJSGGqdVBoA1vYsWhiPv/5/YVTw/R3dlvJ3rBNcLswxphRNIDre4jxb1IMmzOEl+jekMUCYaQNWH6/xg9Ot3n11/Gwv5H5P/7E13md+65/DGl82WfMwkYp9xqSgYuTMBFNASwp6YGQcbMAtlJLvq+S5BxUxd5BPaJTgywu7kByVFxMGuiNMkFHCQBMfgRHnLFRN1qN16X2QIv2r8xGlzDaFoyAFieeZkp9R/3jUvuq9JcO0QztEQX4UZf9yR7RCtSY5c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jfAPWF3dGc2J/F8U1zX93rvR97HDyBKiJA+8YEAoMsVUwjIBcYvcPvhuE2zH?=
 =?us-ascii?Q?HvuWqxYg+ldesWzxSmWQdRjt/LUBPTDR4w/SJtJG3cVMrGlAsueCDujApfA3?=
 =?us-ascii?Q?6f6VEcr0n3bX9PCHVFbC5KXrLMw7+8lWe54bLegevHQwBiMoRt06ZslfkeMH?=
 =?us-ascii?Q?e1dreYKszTjkswTJM6zU3qkml+uK8HSduOJUYSOco4wix5CeLwzb5bL8xx8h?=
 =?us-ascii?Q?kaU1oIhnn2hDqvNub3lF4IIvCJOQXXmZnAUly5oD0bsjO62MT/xxWCcuuhpT?=
 =?us-ascii?Q?QRQIWkVLvo89ibIjl8pY+wphgGSgxDAzsvbQ+SRLzBJe4RxqWGEdLljvGtXs?=
 =?us-ascii?Q?Pa51Ry9rArpypmITIXKl0JBJll9L844zoTaAVq/uHnXOqJfp8hZBKgGdNnk3?=
 =?us-ascii?Q?2SjogLNA+EUd0JfzjCD1rk/Qxs1B4JVjhfu5Nd12wJ4+hkn13f6qEY+kw5+p?=
 =?us-ascii?Q?9VyDWhjWh8qY1bYjySge/+eg+n153yBVUBL03HLApR559G1JPqLhkYIbNY+t?=
 =?us-ascii?Q?J3GjoPz+L/vzGB0AmIQlKU+1QnThdgHtObJlXSNswZzFu+2Zzwcw39w77LGp?=
 =?us-ascii?Q?9o7smDiMbfGL6yKp7RsGc7cWnA5z84R0jjp+GfTpPmWL3dfj8EomxBBPbTuP?=
 =?us-ascii?Q?mfBi0+Iz060IVLucz/FDH8cXrfokm4bpcctmur6KdBUits3bI3QiprHyyH2o?=
 =?us-ascii?Q?1qHlgL/TU3iYVZTDYQJNaOaeIv476KYqMo+Y8ebRltMan8sqRGqaFDXL03ZR?=
 =?us-ascii?Q?JiMD+17HlxlIbpjB8hmgoe4cug9Rig0J8DTNhqcK2PJHOoHWAJD5rWBH2nS3?=
 =?us-ascii?Q?TfwlX/C9CGh6OQxFMC5zMckLSct74ZZcXKCcm4gI5jSED6NV7e2nwwSrN813?=
 =?us-ascii?Q?D6uWWtMOJi0OvI2Kb2DMl4N5vARNzmx6gsOcAlfPo7/1cG51bV3Z9edaQqY0?=
 =?us-ascii?Q?SFs8QYYyOjqifaFaHjKXwC9NWrYuNYEjCHIvd7oMMGzlcgROTL6/7o//a7z3?=
 =?us-ascii?Q?uUjuqI8acz07MvwicnwbDkm7KuuECDdSeHlUJHcdPYq1Xw2/VZhieDJ91j3J?=
 =?us-ascii?Q?sk8MN5kDqYqfmkdGP7EMxrhOVQQ1TVrNb0M8yUVHw6PCJXz896c/3byxGbVA?=
 =?us-ascii?Q?scR1b7yPGMJTelf1J8NbIVJjjKMo3xAyyowjMwamB7FuQZdgd82oxCIECIuM?=
 =?us-ascii?Q?oM9gJF1WUKmOoNliiDp6CG9hAI5yUC5Z6EcSorIzamm4p5FfJLbqQ3+BwUpJ?=
 =?us-ascii?Q?d8T1Rij5Fq7vP+X8WuqcRm6scY6aVq/1uIgKImQwauZuY85NYw7B0hAlvTxa?=
 =?us-ascii?Q?YNtO9hFAVxYvvbwxzQgLCU/WhJ/yTLQn43wodfa2uy1mKvfzhJ4UoC51V8NP?=
 =?us-ascii?Q?lFKAirFNinTGzTjB7zeNGQ5q0o7qO12PaH2ySX7blaVjPHkHOOQ+fKesaFu4?=
 =?us-ascii?Q?9tH5fP99HFk7kCPt8JEf5LqSLWRB7xdtlObdhl8F9edYtnX3kKbnteMEvdtU?=
 =?us-ascii?Q?YoXNIr7YurgvD67dvBG+rnnrHq1ZLDIoJJJQiPVdCD3HaafSwCa9HFmn/SqM?=
 =?us-ascii?Q?LpS1oAv2xP876m7lAZvPf51Z/tZSwkb/2Z68DoJrkouvWuaOsnnllFEQtsEg?=
 =?us-ascii?Q?oOUPNv9scEUYU3pUPLBGDdLuxf0XF75IrVkFOjPmLUmd2P/bG3jwrdF4wwEj?=
 =?us-ascii?Q?leLwPPwopBivRGTVdRlEiuMr/uz15iHxohlbcZ5wCJ20cSKG3qeFXbTwgPGf?=
 =?us-ascii?Q?kP3hMDYYJDn5jPyR4fmtPkCInAZEmkg=3D?=
X-Exchange-RoutingPolicyChecked: 
	pBfzkKAPW9ZA0ZBCR5te2gxVrfwla0D954Y5Dv1mont7d05FEWOpxlNsaQRDZaS3ryQZaIXbZpaP9fBll/az5zqTiKqWMbz8QYbmKHsR3jw9GlqF3DD3JwgUSkUTvdOi7WTFYXnU/IfDJnZ17exnaAtnULHI/BQkxS/w5M60mw6QYhsU8fCFYrs/L9/fZ1Ty7c1PsLSBP3NRMfPGZ3G7J9XleL5RgvNOGqjHnPEqphpE+MfcOWZiZcgOfZK6RXsT+me/CcfVhzXxEOySZsnELzCxOjPRey53kvrzVuG63cjiowS/SME9w2W3Q0OdcVayg4c1/tZvvj6l+8KtgQUVMQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4218f4-f45a-4bdf-25b4-08def1de0b2e
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 04:08:30.7124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQoCFTVsqs/KpF/0BbWlOLJyjeQ41tPDP0N5yekHC4m4uOuHJQh0fhxlijamO3ZbpNLyX6PhJD54PRuo3ZsFTbeS9nkmA3Uu2XX4ZwlhF90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cYTiaHDM c=1 sm=1 tr=0 ts=6a7165c4 cx=c_pps
 a=pvXDubuVmAGz8fO+OL2vfg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=uhQZ5Q_QBcnTBNJc4ooA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX8+otbp7whOgg
 v/jQyArPMKNm7/tRR+EBWl5ooTNbtj6TPsz9pJyOao7jkEUT/3HGGWVvMPzF3s12h+rKoOTaSHb
 /45YX6FCHXBA0MiOmFOrVDdzkFYE9jV/fyisCwlJnuKb3XfcCvWBksIj5KJTwhte0ATYYn2CiRq
 fMiA+S56e2q0NPz2lhmn/nTxn3Gnsi3LK7NQjeh3H1XxNMo9ONAhd/TRidhEsUdODTPpBcub+3S
 LzxDQ4cKiNzJKFa/UCBjzlqTC6bRsbalcs+AnEh5K30fAIZXBlk531x147pcPNBsNyc/i4PDoNc
 Rw/eObTYmz/h1YSLa2buEzC/XL2Pmr2BuTMz17Nf/lC6617FY5AjodWgDWB9/ctLnca27O8oCnU
 P7pH8vT12cCyGsdZxgUnbtcMkV8V2e14cT6V3L3mmu2KSblWNKarZFhwQBRtAXWI1wkxIIAie6e
 YA5xFBS+vkqxn4Vp2mA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX4u/pBu8GsWuW
 5DeUvIYkk4/6oD6vDtxdrCvvjNs7EAEj35s3QFiDzc4h6II2h4mZLVDLXzCsMR3tYV+8S0NmrTU
 oPDuqNmnUE9pxVSZ5DCoW+3iElpfAeeRPAseKFNa4duObpyKR2y3
X-Proofpoint-ORIG-GUID: 2boz60Q4gLBG-gLp-1Dd-7Ez9d7nVaAE
X-Proofpoint-GUID: iVAs6nBcoCNou-3lFCWd3u8xqvoHSr0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242688

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

