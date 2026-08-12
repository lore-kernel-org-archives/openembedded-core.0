Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947AFC5DF67
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 23:49:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8328.1786578566644371773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 16:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hDk/3zJP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2684dbd6f8=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNK3IW3503969
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=; b=
	hDk/3zJPRtTQ4Vo31N4ffk0SQHxf3U9Bov41uyfWHFQlxrNVPQqltdoegp6gKpev
	AZGBDNvI8DHc9/xgU4uINk/ZAp4sRh8TkBg0int8aCcWio5rd2VblTfAYtnNmJID
	FhUjHELFf5DjRAkNass4C/b4OCUXyhuy1vdSuHNKa5sOcjfYXWUJMA4K3oF0rO5J
	83qutV8GN4tA+9pQym6R0h9jUulQai5xTVbdDNKpHNFM0Baq/AYXI3BHv5D9KaQ8
	y/t+eK00PlYCqiX0AtgfaHa2VNU2WJLvuH1eRPEvAxlV0IcbEvhA8d5QCkac9DzN
	+gao+8ZXI76u6KxcUPIJSg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021141.outbound.protection.outlook.com [52.101.57.141])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fysguv5q6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 23:49:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJlUb22fDeKFxmR+TynfzS2DcpHw9PjWgTtDCoMa1CiwhRFwooVMhYmlbbBitr+Jms7wf825yVgLuxWZYjF6V/p8YbaD/fPP9iQvwtCPJ12aWGWFnMS9oWSf87EXpNWoe4tOTZAX0+VLBdQ7hWVgEt2ydJGi/XIDV8gsnm0ddLSrmqlyPJ2EsiYkeSDo9DG3SMzxfGTMERgr0lJYl+0eDjkQi91J5bexgq5WQrEId6onAf7F5/ZJMftaXFuYkfDPpFfZFXPHxaF2V6poKbXg4DoBNXV/VqCfTrWsVZhLLIygp3LpLoNRMvKmlSS3/qRHKULxxgWRh9VK40QV1ORSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=;
 b=SQvJ4imhHaFza/xLWWOEjV/NYAo9/+q9lpF2p5WlyJOdMp6yzsY3GhUbhzXW79GDj88Cl6HnS3zOW3zMCjz5b9IBEo49nNmvmzV8nG93pkQUfvPNXFwbLRnyv5PrxHxdldVNNE3rCYP/b6RV41evNxYPgf6Es4bOM/LapkQjJbk7mL4OxSTHnLXkxh4sHMyTrEKGZTI855/diKcZROkHX+ccOufI+EPprWQwtxCrRGYrFPrUP8BujCcJk/Z1TXW3Aw+mcoNrcZVkF4EW4WakrjyNEruvJAlqAlp/es/Ed7idPw+Rpt1fDVDcnC8LaDtAOP3jgCFtKC9q8fgedJ8kew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 23:49:23 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Wed, 12 Aug 2026
 23:49:23 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v14 05/10] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Wed, 12 Aug 2026 16:48:55 -0700
Message-ID: <20260812234900.866436-6-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260812234900.866436-1-sumanth.gavini@windriver.com>
References: <20260812234900.866436-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DM4PR11MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: e651c22f-c90f-44e0-ea11-08def8cc55ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	G77r/xNivRgs7HIUTx68fyfBWiONyQXRtz/wTfd8GHJy0HVgNcVIYOHQzIbFjtYIHbJ7Tr/RhEV6SPhDWe8OonuY/s0gC5cnayIaaD7dNRU5XwO5chSRThJYVdEp9OGJhL2zmNLnPQ2ggSx3P8vSxDX0q7fl6hnQZR8YEb/ixfUo/z9+t0cb+HW2pFSCpV9XTq8J0p1tkS3Ksr63JmvlZKz/k+bZl/8R7jGZ0lsYi1hVQpWfJvlz7ehG2ra2jp08p3qSPGeqKELmapHfgR16H4vOYGmZSxZsLLKhBTAV66qqs6x1DoAHibmQgrOxfI7hgyuEbDhJ8Om5hRKsgSdQq4k7/PZ3vKeYipM36SY/odcpg0k9+J/uEdcow6iOS0ePDhomRX4Yeaq1ZxswBSDpCb13BohEEX0bCS7/EgS6rQ4YF3yBJ73Y+Jq7o1Sf/5ChbvNg7iRe11DLebocUAb9pVYnfMASdj7SkCJw4nvl0EtZ5EYlK2Gynq3HNjpkoIN3zlo4OmLyFaF6/P03eK9j7gYNItNH+YetXRIyiYn/azyr7/b1kUt8xqNOHIA/u3XSmmSUYGLzSUjNxQsj5KDAzcS35twN/YW/FsvU4eVazvS1C1QjksbddqIm4Df5DHoxyYIWuboaRhGhkuZTJ6u2w0MVgwcjQkyADW0iueiO5oCFUuNutRtIvsFab/l0W6LOZCCf6Vj30aJB2MInPY9n2IPeOETuMYgxTLrCbSsCJqQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/XmCdKf13plF4Wf8czAnpSCm8dW2lS7vRvRYPOFkyRUpGFF3CxMtvz6XnSiI?=
 =?us-ascii?Q?kudXxTvxxWJ41meO2BiBvYUh5UPNab5pPlZPipuVAWv7AJvr1iln7L5VpLY0?=
 =?us-ascii?Q?3HMXdO+g2fK9jszCv+7sBnxWKAYPMlZJ+hZng4BU94/Eh0WWWtFq/hCGNlFr?=
 =?us-ascii?Q?1qOjlQwVeO1HZepiLAaY90ndVB+DNgCRprdck71ZZwg/pUmE0Rp16ANGIHgq?=
 =?us-ascii?Q?f4j5+WcWpfxXQbJblZIMVc5ZmlODWL3raS3E41/iJ6KKpPEMN5pVMd3E5d3R?=
 =?us-ascii?Q?VqRrjwQdbwS1gcaADaPCJB6Z994kdm1LkBL3hpQRSCOyrycU3l/oSEmuAT6n?=
 =?us-ascii?Q?yAHrLbMWWrairkK5jGN2KqY9IH5mea2hBwBh54yfnL7V9KlQNw+5c1atoEMa?=
 =?us-ascii?Q?2iZ3ZdmaQcJXd/+/2/UjbqoalFP79K/jCG0v3SnRYAqLOHQwBDYVDAh8e4Zm?=
 =?us-ascii?Q?qEvb9bHOZwAdrbzURn5S7MKiIKnxME0Juq26tjQQMvq6VIDEl5Bscmr0nno0?=
 =?us-ascii?Q?JQRIawSCSRxwYF06JbRdX5Pvg4FjJfl+pgBA1KnVP6GX7/f/FPPHOm9sytjg?=
 =?us-ascii?Q?6K+N1YiAu0el5aIOrzgU141xBc84DmFcFsGgF2dJlhIu9019WCpGofDcj6Bj?=
 =?us-ascii?Q?fwDf66xPVk1lPvs+Cvw0ZfHxh2apU2TKjFpYeZCqPXcwlorr+0vz7l6iqIoF?=
 =?us-ascii?Q?gaRXiAYAjugam/WoP4tOvY2McrcLVuedgoIUzs8RUp45RDsAcrL2bxYSrHL6?=
 =?us-ascii?Q?KGgPAAaXvtD0J3Jp+UIKZcfy1ocrVJs3pvLZamRfomQbopU0G5O0m3Ft5HP8?=
 =?us-ascii?Q?K8xYAF7g4EGfyl8oYzyefI6amWaWsH9GjnnNhkWPta7vrZd62onNmWW3vPEe?=
 =?us-ascii?Q?Qc+5rPG+cZQZxBnkkl+94gpVPjHRsjool/L0z+O0SIILeF/rQly+A5zIOohi?=
 =?us-ascii?Q?NX2zyFvKnM+5w+5LKo7euTDpx+ZBwMe1qIiSHxfFfI986bHG+YphiFzjCV7c?=
 =?us-ascii?Q?DdWc78iuskaDwaW3gRHTa+GLASbqPvqfDhg+Utw3NX7S4yY5d3uR9Dgz7qbQ?=
 =?us-ascii?Q?en0pCAWoOjBdJ4bqgOjpUdDRN8U35CgLVthqAWTJEO/KNg+t6kMwOorHLLXM?=
 =?us-ascii?Q?M2OfDtky9eS1WiTweGOMsXPTOtZOlDGuShTfEIT5SteaFprmTwIFLqP06xyi?=
 =?us-ascii?Q?u/Hj980KDkuvrh1E+I8S93sGPimE8WNOo0jwFJNTvzt/flbUFealAxe6apxg?=
 =?us-ascii?Q?K3rWMeTjDAajejxC6dtuBFaaGbFM1SMI6nBlakiA0CueVRwyGq/zFNrJc3zJ?=
 =?us-ascii?Q?VrxHnsF8Y1y1V9oPsPXWDWAq9wxPu1JG1Nty4952C4zCILgBvpcBJUEhtQhb?=
 =?us-ascii?Q?NRxZfId4Zvxqo8Pd6CCczacFemaAC0dznyTyUcqMiw08OOZeAsOw+sgFh8xg?=
 =?us-ascii?Q?KsEAOZk4zJxXFJ4RGcY9DpNvQTDUga7SCLVJGT+SNvjwAGTSmwB7vgoabKxF?=
 =?us-ascii?Q?hi6vSS0mRPbpKMnER7YowHnPw0TzpTr8l51xDIWY2WPIw/dmep9hcbLT6Xg1?=
 =?us-ascii?Q?d0ygBs7M4qNWvkjYvhbLzW3qZl+E2R9i1IgB2lbGco3UjBfF0p51FhiyWpTm?=
 =?us-ascii?Q?qN2TZ+iaEZmYZn48HJRoJ70oDcS8qEGE/PHSJlblmyz6fkMO9U6IGs6TIgLk?=
 =?us-ascii?Q?5hYh6humGoK29wJnDTbF4XwgYtBH+9yZmmhyNOWK0xoAKqjTwlOIy21Fytle?=
 =?us-ascii?Q?Skqw3Aw64JUPXV5EJpbN7eiz4R9h4o0=3D?=
X-Exchange-RoutingPolicyChecked: 
	lWsdVU1gaAtSkfst7khoRmgRf8fHRS1wgkzMpbOqD+EcCYnaEOACD0NV1YaIWEgHXQxR0nkP6H8U+UjEAcTQgPclBZOc4nVAvx17iN0SXyyvVSSUy4xE1+q2GuEEYoW01uMK7ksW/eSUDzlB7cuwW7rPssmdYpnwLQR9AifrVcD2RQR+eofFNdQZmTgcOCr0unZL8Q/79DsHqnEe7LfD9z93bu6wQssI6BZTJ3Pj+MZOvjHSyM7kGtwyZ9XsVccmbM6NA41Fjyyp0WTwHDxIKSN60EigpXSNUWo7aq1FUSF1lqrmTRfpENZ3F+6egvVxHZtzRxJkuyTdLU92CHJqSw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e651c22f-c90f-44e0-ea11-08def8cc55ca
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 23:49:23.1910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0CL7iRN9kkdk+wlUprmRHDS4SEvRlvtocY7CzLG4FeQ2iJgaSJmOG6CylaqE1UYKsD7g5mUmFbVHUz2ld/Oc7QBkvybKnXhGqV8ERFowyNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: rwh43GSUfLEpRrEAj6lJ0p-T4dMZ-j8-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX7T6nY5sKwxlQ
 NfJ3ODaERpi0nbPuBIgC1BxeI4iI1VDPWPUt8iodvLkwsg/GV2Owzndofi+BPxFTEWzBP1y7kBH
 ExS4SBX3E8w6+QKDNtSMZj5D2MtZUMFzUmaGgb5sGS3EkFyL9aYn
X-Authority-Analysis: v=2.4 cv=BYroFLt2 c=1 sm=1 tr=0 ts=6a7d0685 cx=c_pps
 a=IXZk8buBm3K+4cvqFqH88A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=lZurfIDJcIjVqGklx3sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfXxLeC9xyTiEa0
 gmDGpEL4OUr6XylUZsgnn6mauNiKkaTOWGzKWoIzFT/T+HA9TFF1GsK29ahwxf1BqgtdoX3Xp9v
 xKKnDH+SuPXxrBUFqpGpRAHq0l/js4f6ND7lpnPQvx+/0apoJKS7k6nTlNCUlDzNsTE9Ww/UmQy
 R/Lzz/1lNtw/6CXEvn4WWzGv1OPY8bDwmdXxDS55xZCVwicqhIEquxMhL1RwX8Hy1PrW4N0fuo0
 1Cd9ta7aMGPHN+Vnub3yW+eK/S9YJNbBt+QpFS0husl0xeP/SsuIW3UVz8oC987MVCGuY/GPnWX
 y5qhC8qS0/oEqgnqfFuUxPW5pGB0rk041zBdGtIkA51AocEuMiSw8zUZ1T0S40gLVmvx3MDeMV6
 EOUkiHA/YtGrXxLhyU3eqpS78hZOB0WCPL3oL8znXU/6o43v5qW1TWfhyScMFvHeLSXW/PoBzWp
 CYGMs/XnWLA0mZULI3g==
X-Proofpoint-ORIG-GUID: RTa4wRF8bDzDaLuTI8pJt1peloLUfMyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243314

The rpm package requires /usr/bin/pkg-config when it has .pc files.
Fixed:
1) target-sdk-provides-dummy.bb:
  - package acl-dev-2.3.2-r0.core2_64 from oe-repo requires
    /usr/bin/pkg-config, but none of the providers can be installed

2) nativesdk-sdk-provides-dummy.bb:
  - package nativesdk-wayland-dev-1.24.0-r0.x86_64_nativesdk from
    oe-repo requires /usr/bin/pkg-config, but none of the providers can be installed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 1 +
 meta/recipes-core/meta/target-sdk-provides-dummy.bb    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 37dad54409..6075770bf0 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -11,6 +11,7 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
+    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 65b87fd97d..ca155d0705 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -54,6 +54,7 @@ DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
+    /usr/bin/pkg-config \
     libperl.so.5 \
     libperl.so.5()(64bit) \
 "

