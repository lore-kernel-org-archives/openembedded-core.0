Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C160CCD1BF
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:27:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17684.1761218825526044108
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gBRCraT1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23915c5530=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59N5KWeJ1326006
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=hMWoQSruJPw9rgAw5avHo+TubgN1/uXnfifY8i4GAM8=; b=
	gBRCraT1PeGQSGQZHQSIHo03soiOJZDkwqo+C0ai80sMcZwQroEngNapXH4vyk+N
	UOE/78Hi0/G2rEWgRK7k4bz9L7jIKQQEX2G5NnVi7mUXulS3ePeHVgvrGLRoyvHt
	sEG/5wwJfLFXSxWNQPivJ+28GNNOyAeKorlf/OLYqp9ycUf2I92je0uCvgUBL3Z5
	aeWxFI2EyX3gG/v9U5jUEhuGaAkZ7x9Hl8TkFzDMf3sRl5jstH45NSJaNddMRYV3
	1sGa/Wf7PzWhYkA7h80iRKlciPYyxYXGWjJa0nqwakeTxKyR7mHLzFyTDFnxjH3X
	yk1F2e+NjMZ2O/xGkTJE5w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49wrpxbv0p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h753PC80B7bDLMYSi6J+csKgRmwkiVhyIicgAuOwDE4/XEsHwePyyV7fZ52brzhix8v2DrUi5iBEQDJdh64yH5Ztb318qu9RAI8eCWW87cqR83Xg8QcX3WaZPoq4ADEKK2/cBvHoXnwJjGiJfqsxTY/SJ9U7+a9MlH77+2bbQuhUlSGl7pFgTzYMgAmihnI0o7sdMquG2EYlbRtiUM8O52F/qleuNV5/3QrkQO6n2FQAlPUYSrAzLPzOtE1pGCaidsAYggSj6nnPm7Nh1CugvTSjT+ipwsGWPahJsq9NkBDeEWDrjK8prxCGX2XibL+cWD1Me3VI7LSAI7WO8oORCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMWoQSruJPw9rgAw5avHo+TubgN1/uXnfifY8i4GAM8=;
 b=qHJk7fzM3ffa/RTtX1boco5FIY0QZ4OLDE29v8qWG8t8IELZkqnr4pxq8kGi9WHl15ovTyDerUwo9OubYtKd5oq/sXdnl6ZSts8+0Pqo3Vs/lpGGd9UQW/Q2aeu1ECOXCYqSVGpffbkkCsIt/lW+v9okY+TTrqN0xTxTORr/RVmsDocPO7XMhP/l/JBprj4PguAPqtS+BXnh2GZmpKaHDS4dMl39E7Lz4s2Um7VQBMtsgo+rpuCz8CqiltKWK6SqMHupgylAxn/M3PmKEx98+OmL9B2AISDrCfiMCawBEwZeoJq9dWAfNR8W9vz5E2odOOKWVtYlVA1lSUNNqg6J0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPF8B3F23403.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::842) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 11:27:02 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 11:27:02 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [RFC PATCH 2/7] linux-yocto: add clang-native and bindgen-cli-native to DEPENDS
Date: Thu, 23 Oct 2025 04:25:42 -0700
Message-ID: <20251023112547.4044904-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
References: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPF8B3F23403:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b85d1d0-0416-477b-f11c-08de122716a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HyHuG8ovkaBhUak93CJvjLxPLU+9vyqtHni4wDyUY7FJWSVMNBGxiBfMuZrq?=
 =?us-ascii?Q?z5r+maMeyFTHai92Pd+FFDcVCFrNzcfV8xL0LiigaFVXrSsJHiY97bR8Mkhy?=
 =?us-ascii?Q?3EQ+R8bRjVxLSI1PGJEZayvKe2B1yyKFrsbfKQih48Xff0Yx5BXJg3wRf2Gy?=
 =?us-ascii?Q?PiqUaT3hquWdJ5ZIEHufGF5sV1XB5a0SYamy64mT+5DFWawvTGRJIMxBRGfr?=
 =?us-ascii?Q?zu9QQ6IJM1vcvRPVnU8DDty/8yZIBrh+KYzJArYG1D9SZ/Ow69rmRGXNFYMc?=
 =?us-ascii?Q?GVyzyX/Xt7n1MJ6BLT+qwLhP3D1+HoPEz5P1NMUAjyNsAClIgG255WDl4iJs?=
 =?us-ascii?Q?jXAWCvUNdqmlOu1AVjeEPgKvT+G4Gzf2G6ZLqr0BR5z452HpufxJNVAqQPDx?=
 =?us-ascii?Q?us+Xs7jLUDw0aYffcsJmLnQ9iTKvxSSMgHaN9jtb79ETap2mKGIjh/EmELLF?=
 =?us-ascii?Q?gs5PA5YKmtjvmkDatZvFJaz2tm7kdmwL+kXasx8Mz918uVwgEmG0exXZgrp0?=
 =?us-ascii?Q?Rvkcm7og/jdiQ9CPbtDruAbEnHvloNdxdTBMLAdcj16WJua/VBAlir4cNiIy?=
 =?us-ascii?Q?wCfJXIO4l1r45ap1x3oBgbUZE1s8yXJTAPONudwKV0xCc6AbexZSETQph5S8?=
 =?us-ascii?Q?7X3p+dmPkzA+tFUBoHolcBXQHhF0/403ZP9twiZlTqP46v/bd4CQGRYDe0n8?=
 =?us-ascii?Q?itLvwKJAFz99CMFmacaJncFHhoctZsIbYOmmsmWDw2Lt2eTySDk7Nb3oG5p6?=
 =?us-ascii?Q?o7phnsWXScsrRZPpmdhL/slUytj4xW/YFvtK5ZbqDud0RKpdhwaq4kx1aJDi?=
 =?us-ascii?Q?t3w+GI4Hd1jaKQehAsynzh7eu5a1FmLpYR3tij1TxK6+5sfXZl6F+gSEIfde?=
 =?us-ascii?Q?OSd1BaK4d/norNqwvGgngJGbLk7BdB3pBd05VHyW06EK6jOaVSAwSeN5/SH6?=
 =?us-ascii?Q?pndp037hCGiQ1o+MzcCnEesi1bbGQG5oUxaMbS2rjjza8l4bO41TGDNt+Iev?=
 =?us-ascii?Q?MKdmNO1oytrt/6KsmH0xAKBS1bmnHHFK8f5j1SbD9IJpjeT3Sm3VUzmNSguA?=
 =?us-ascii?Q?8tctJpql+xkEYJwikr49xdju7Ed4X1zRpgCQfQ4EQ8zI96Lpn/YA2nZgeL+R?=
 =?us-ascii?Q?2CXlKSc0h5J69E4250sJ/ZO1E3VuO+eArPTE29pHqaFhmJuz5sRdy8L8qVSW?=
 =?us-ascii?Q?TkIQiG0JcTwNLRmjnb6JFESeDczBpQkjiBuG+UUdHFB6/46H8m8rB+MjcNtD?=
 =?us-ascii?Q?qek0gzzWEKxPpqc2DEzc/WmdqESS6JPmlMGE8dFQxqX+6ObQADhe/pw+nmIW?=
 =?us-ascii?Q?C0K4Q/nuMIXziihPgRNPN8suHryVmXNI7kxncsEHXZ4k5B73r+4xI0Ky2IoR?=
 =?us-ascii?Q?72dh1jyrF+LWdt5kAQMrhWHn8bQ+M8k2NLG9A8QNvBj3/wZVCFYft/JZlapa?=
 =?us-ascii?Q?yTigSQ9jQtx2D4ZVVEM5kqwSkP1EaepLFnY1SmVuyMeAHCyX6HRFC6N12u/x?=
 =?us-ascii?Q?txqMswZwbvIzDg4p3jaEIa+K2Zb/GonMWU2o?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y79nJm4f0WZLr7kJPYrG7xsWlx86FVrq7vOZtQnEafKMmMugneQCyWhmVVFT?=
 =?us-ascii?Q?MaqOFt0G3DOUnDpRHUPBecc53D0NKG8d3JfGAzURHxcq4ssoKpk8PANEYFoJ?=
 =?us-ascii?Q?M6GTXeylFFYIwbq+KrH8XNAq1h+TJiEx12QpBJQfrN93OJZzqWdBjjPmAM7d?=
 =?us-ascii?Q?xtGUW3mGjNfAXTwY/oFOI8UlORzUztdSCTBffk6WZhZhVhKKqWfu3dgo9kFq?=
 =?us-ascii?Q?CUJxpNUCnbFKFkiy86gAFuAsyietdgBN8eR2VE5PyCGI2HCCLYsFtq0spDci?=
 =?us-ascii?Q?aqTYP2ky8YGJKtD4I1uCVkJZXZQZj7QV8c94qmnmmEzq7OOtISIFe8U5pON3?=
 =?us-ascii?Q?swSnH/sPs0LODywg9K5d8VLCrZll3+7Lj1cylvmgKtyrfaRqYaU6viMSjZ+2?=
 =?us-ascii?Q?JRjVhG0t7iphczWObvmkkI3VSikNHeghVmpefIKe+VP58zUHVWYkUxwu/Dbq?=
 =?us-ascii?Q?jMgk3xN12AK1DgqGzKIadSM+L/16cuYOX6O8PitbVQT9LAMpCzE8SF33m083?=
 =?us-ascii?Q?Nw9KE2CtMz1FTSXen6WmYgRlAN472rJpt8j46g4U0Tg1U1Wu+o/Ndtt3EbfU?=
 =?us-ascii?Q?dS4XmAea7hQ7CMX4cJaO7CcgwlGV82RGr9mJuXLzlnxRKwN50W4vQx1u7/Yk?=
 =?us-ascii?Q?xz2PIXVaajv57vyf8PNQ7PRa+7lw3CrV7NwXXcymGYhiDTgDVIMGtXxu2czv?=
 =?us-ascii?Q?66fi+j5eH0sWdbtvFP6mXw4mV1xTvVjRgyL5yNl4a34Pgo3aaeOyvg02wVYo?=
 =?us-ascii?Q?uIvdFKkQrrTChofjE26ypvcl2NsqJPeoy8yUabhN9Dp2Q7b/lQWBOPnDpFgn?=
 =?us-ascii?Q?RtqJgfCv6NqvkB7DGnWhpd+kDp38lwUFmQ87IB6/TovruiL7KvvGFVn3Z5j+?=
 =?us-ascii?Q?G33X+GcfdJwAW+mklpDdpnjcJnATwYXajVf+rqoWcU4lYrg3r0BnLB7vzFzU?=
 =?us-ascii?Q?6Zt7G6068BR89xhgwE+uDbywbQ8Uw0Jx0ntO3i04ep8HZkZCCN9t3Ti4HnkK?=
 =?us-ascii?Q?gmHhXfLYcxPRV5Uqj1ZBC0vXkguvY5DKP2QsR0+hHLDmmiFS01brkdxcuEG/?=
 =?us-ascii?Q?isNE/QZdLiJZ00OBF48MaLYOROne4/ORrJFfNztH9zKx4Vb0ehHVJoAoIxkA?=
 =?us-ascii?Q?peHR7LFbUKFIMB2Im+l3ElF5q9YmWgCkWfejy4wZo24s+mHROqnRmhjjBg91?=
 =?us-ascii?Q?ZkQVzvoe1wQV9usi8Q8B29pt4RWAN1/f3Ri8kj8Mtwwkcc+qCiDkJfOhlxdK?=
 =?us-ascii?Q?FF53Mc6gSteMLbCIDfrJ6a3ROLa5Ek2Mm9XfdAcOpKXncW6JsaregSAqYj/1?=
 =?us-ascii?Q?Amd6wjvMee1oAVP3Piyz4pw3dvGdrABDKUYicND8SVVQK3mZdlO+HHdqMkfh?=
 =?us-ascii?Q?B38BsF060Lxe8YUYJ2onERoT2Qpe3IRqf62fT3B1jddlbf6+P0ZrDKoxHIMh?=
 =?us-ascii?Q?PCYwKCqJNzT7+k0hYq6E5s34z+AHPxfig24c15/DFKOvc/CtL1nzvHKCd/oh?=
 =?us-ascii?Q?YbwC/rHjDdEy8j3fpL1NMFcG7Kq3gwQOeKvpjwpuQvBpAo2HzvVbiEBPMwUJ?=
 =?us-ascii?Q?05szjxn+s30kqQ2MNmMBvSsJyt2y8L3ddeF1Kw6cjbjzobMjH7knt00+QVc5?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b85d1d0-0416-477b-f11c-08de122716a0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 11:27:02.7209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJGruldrQe9igqqwjl6LKMMC/7w4CejLKyFFTLLaSiNG4t0tKR05uckabQ7A43cAH5BYnWCFxEOINdOocexJC2Imce/eF7zJrYod4L+Fhv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8B3F23403
X-Authority-Analysis: v=2.4 cv=b9O/I9Gx c=1 sm=1 tr=0 ts=68fa1108 cx=c_pps
 a=Ftf85+eZhIav1RrYVnHJVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=iYieoXCNSSIKS0wovcAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pqUMTlAdkjftk58DFcZLVtePG8FfvJat
X-Proofpoint-ORIG-GUID: pqUMTlAdkjftk58DFcZLVtePG8FfvJat
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwMyBTYWx0ZWRfX8HCnF19KbYxc
 ejYv/MGw/cUcZN7VV84iqX/5thhEl0juIoTpHo0EB3K+hsRcBn2RXonAbCkHs7wpqJr8T6tVNrL
 zvpQLGYDU3/Hjiv4vRBczkji0EAxapjl2vpENkt9+1jK9OzjLiIWFc4MRYFbQrC+tajJjXolnjs
 X+ikmhQzq7hr6Miv/s3D96jJ8c0UFBUBIybYP6og4eyDGEiPWiZQPBwjN/YX5GecmtXwyYXGWWm
 +Bfwh0cvTCjBiyPDb3vZzw1+1KmTUWa7tXCw9luHA+RFoC3/DnRsXcHEZXZL0V1CRZnfhtva4Do
 rHA1pjPiUbWfwczViH+47r2OyGyc3a62OPiqqnV8wnNOc/RwpobEX9vPxJ7Gb10sF6lWsrdRz97
 yngZO+92cVS7ZdTAWUs4rfi0efa+Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225238

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add `clang-native` and `bindgen-cli-native` to `DEPENDS` to support Rust-based kernel 
modules or features that require generating Rust FFI bindings using bindgen during 
the kernel build process

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..31adb1d9ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -81,6 +81,7 @@ KERNEL_DEBUG ?= ""
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+DEPENDS += "clang-native  bindgen-cli-native"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
-- 
2.49.0


