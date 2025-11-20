Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E1FCF9C46
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:27:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36760.1763652431106934895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 07:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qitGFt0V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKC7Swi2707645
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9BDXHt2bsA4L6nYWybTJZnV4CIB571q9JgJaGZpfFnE=; b=
	qitGFt0V4EubiTbGFTP3834DnSqeywZLSqjnPoZlilz+fw+svkk2kBi07c3P0C1X
	fdHSaDKvJRNrYST3fFP8d/PLA8MDl2RemmnEoRaMRzGmbSc88foaFLEyJdiMzYXQ
	wwoXFxmR2kGAeTDX4i7niYWPf6x3T1NsGXRf4Ps6UOUOT2cTegcSNC5d+VnTGGC1
	ydNSkaMMWAmF5ZDZvp/FU2mrO19ovsQ3LAfKJ3ofy7TBDuVIthN23N3jA9jj9444
	yb2/AsuYQsgMh6Prunyr0fE0jfMBYMf9kBZIvz9Ga2yEOmUpc+UirS4IyQsCD7xI
	er36Y04wKlxwrBbCY9vx2g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ahrs3rrnn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 15:27:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2zbRLRfVsnOM+x+ZccVeZCMT2SdrIscDQNp9LZL5wAALVUj6W4DNt1C4Up35ax9pj88UzvBBaauwPmQVI4gMGDeqgHBf0NkNV//VAyvgcQ0qZdeOFirhy52CuTbuDxXe+7baI8GzSNtad5lgshUFqxDaCQl2yVDnJU8p6yqbPJge+edlLNrlrj/kd1Rv6ORqWKZfylJm0D3qqZ2RCXHfjmFuhjRRHaiysROZ1/n+9+wJMrRQ+QJdnE/j4lkwHhuSLBB7KtIchRs/czUujdTEGrdgOC5DLR9s1/fHTFtguIFSQRpRNCztSzB3+LMPiEhds47KY/QKzTthxNLH2uWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BDXHt2bsA4L6nYWybTJZnV4CIB571q9JgJaGZpfFnE=;
 b=kkvccOlKoD1Kgo5ppk6e204guzQY7HEgIQw+YX9QJbM5luqXPlXdRzFxq24jJvUYdl6lzy76NwSFX0nRqcJMY8/zMq3zElWQkWrmQWKJlnt8fs7xtuzt8CoxoKv/zAgYmxbkQHLHOTtvXBUWR/aTcI1PY9LhHqtQsZKSB1/6Xq8DLAu5SOiNzHqayAKnSzDcbLfVtDL+GQMyV1jdowsg3wsGUVrxzCwPjgRqlScVSHYAqZUBFwl5luT5vdAX5Zp4d4W2l4cfB8thMmLJTTg2kCHUEnAWZpXtSvInoFrRj5K3WkjDY55/CMIaPi4KqzUfpuqg6JaTXWbVGpPO02wiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:27:07 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:27:07 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v4 09/11] kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
Date: Thu, 20 Nov 2025 07:26:47 -0800
Message-ID: <20251120152649.1128685-10-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
References: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: d433b364-547d-4c65-b346-08de28494408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Qd777NlWfrMiDhOQ2uO2a73YFbrrsg6t9jR3FqLIDC5wCUKQgnJ08DOppYSc?=
 =?us-ascii?Q?WYdk9pYAhtw9BUSdujZMsaUkTPSkYsjnz1EP54snT90RI0RdH/JQkd3+sSqA?=
 =?us-ascii?Q?30DrIeOmpEd1EzeH7Rqi/v/8HDJIaURCMLmRrzAKautLLQU8OGhcINo2rsJn?=
 =?us-ascii?Q?ZRjHykIUh4u+AJq8POoEx9lEJcWCuxUXetzxmu3fBk/a1x4DWn8MSATDDM8u?=
 =?us-ascii?Q?taPjoGYyd0e0n5bqWa5Bp8waWxIPep3qlI+aNurtOUE/ZHKbgQnk3x/BsITI?=
 =?us-ascii?Q?Rf20deqKVvTqzKl1/zkfsusUKx4NZqagvOag1IWMuuIvMCjt6rGEyMn7GU9+?=
 =?us-ascii?Q?lO1iusl6lNxU0yf3aCY5jRrmwmwZcrvNGbrEfxUPFMCovyXwfzF7T5s4ljjH?=
 =?us-ascii?Q?FZpuEB+AxfcxC6oXi2ZwhJYJEAmGUve87BBYi4b4UCoLjVHzDegQVnv5r+Ix?=
 =?us-ascii?Q?/aItyycS24ly97ubVuSfn1sJYupLBlpVIofW5rGV9LUwxVqZPlQ4ytqB3Gf9?=
 =?us-ascii?Q?/KJr4s8Rb50XBGMqa6PdZAP0X5J/Nxn2X7wqsxRAj6fzZr4Sens8ejxf8tMD?=
 =?us-ascii?Q?swdhwaunj6H+51LIi3hYZJSspXYm8+Rk7voIo3s7RTSFi+rNvS8YzSydkWQv?=
 =?us-ascii?Q?I5bZ1AcaoyVnzwfF6oVLbzSnBtUpldunuwaMvAxgiJKy/7jEhVVXWGV7rSr9?=
 =?us-ascii?Q?tHzGn67WGnZeRh3xzMRdo0Q2DbZ6lkLB3egmdvz6VUh5QD6dNRv8b1kxE1Lx?=
 =?us-ascii?Q?KFn6GFUcwtyJDsm3Lr3Y942cg59RDASxd0H+QvPFrDI/2ZfVMcN8TzmsHDoz?=
 =?us-ascii?Q?fDWoHYiE80iAnKgBg0qJMJy9msmBeoNlRpVxDasjzmEPE3vr1HpBt3pnNbpT?=
 =?us-ascii?Q?MsUiUXGBmJyk2+iUQEl1I8yP8HpejdXYgITHjv00MlZTulONW0HdKW0BGteX?=
 =?us-ascii?Q?2pxFzQz/b9vx+2c0DKlgTPVQtWjgUbMT/V40TeWBOBmKcIy7fzPLWsDZzv6O?=
 =?us-ascii?Q?AtLjjnm4Q1N4LvPXJtAkZcd+mUsdKA1l55ZngbJttDczu3XGDkQl6AAWDira?=
 =?us-ascii?Q?RaVuGw1rkMpGwjXUpkqhZG92IXkmP01D3EOTsWnm+kuLlgsmdJxdAMCYv+CM?=
 =?us-ascii?Q?Y3MStiPqhUG+fANiT0YmSIthFqOBdePnOgmDWhvH49WgkT8OLWWiuE68Qjb1?=
 =?us-ascii?Q?S7WP8bX4Z6cHZlcA6shqLb4UQVgA7X4gHcDTMuGwBg6CBMkFd7j8mLQhC/nX?=
 =?us-ascii?Q?yQDz0iI6/cpreG6ESIoq6DdsWaPE7wkjAtPfslyrItyOcMeYJPVIbaeVpaFh?=
 =?us-ascii?Q?RQ+VGLKTQLIyyM/FCX7S27iOAh0Suwbiy/5dPMOmQNrF+y1JlKs+RD9xwh1I?=
 =?us-ascii?Q?FG7DSFt32zIxka9KlBbHzlsr9IOtG02YgBhpyoiOfUt1epVsAMZROBX9kEpJ?=
 =?us-ascii?Q?hfVRpQpOVQyD3P5XnTz4WDUXNV9HZ8OvFkZo1XV+b8vp5UVq8yipofwh5Mq9?=
 =?us-ascii?Q?Q/Bxp+QbefSqkyBKia5yIInm9ZU0gtFk51MA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NEVZyMAgLfqG3+GS3FiB/PQ0vZaCvr8fehqLw2U18Q2RV37Q5VzjIF27iqaX?=
 =?us-ascii?Q?dKTb53VR+VuXR2Yh074DRseA7Ye+SiJMK4SZGyclJu8FPZpfUKW/Bife4olS?=
 =?us-ascii?Q?OQE4jAP6erji3DpQ3D4QNFontmi9Yx9tb8ie3QbG+0m5jDTr9oSVMJN7jQmj?=
 =?us-ascii?Q?KBQcHdh8HOKnrwq5NQRnBqVuCwHK4mATZtd2e+L/6hrQVsx6yahadElBV54g?=
 =?us-ascii?Q?iyW8bLnjO70rCSvwmBFrf9f5UkIjTuL9G0qDVCUkO504GpQP/JZGiRKxnqRZ?=
 =?us-ascii?Q?T95RitG4iyoPvvkOYkKhFqtYuzx9uVOsNxofy2B3gn83W6Glo/zx/IVabDHq?=
 =?us-ascii?Q?5zLiVnFJLwR8BFPXslhNJwYkThbvPfQ5O8yWp1uvL3GcrdZp1XY7PaSFOe7d?=
 =?us-ascii?Q?n896tdyV9wLzNYFGQGATjnti9WakNQkhW3mnWOWcdhfcjDxWtFkqf8cIUG3v?=
 =?us-ascii?Q?KBW4Jo9U4tsZLKeTzubKITRdY/o8auY/ivMR/MGNRafzeAUYKrgQqYWFcBJa?=
 =?us-ascii?Q?WD8pEBV9RmkETN5yt1KpgVaRyn8XmFkiuVrvssLk9pcOeF/0CMe8K6I9G6Kj?=
 =?us-ascii?Q?tJXJ21lj57r3jIceV0EvRloh4BLYpDf+8u/BRhb+YxFcTH7eMdnD2PqW4a8P?=
 =?us-ascii?Q?6O/7nIB2FeTT8955xhZg/oWUbfLj6AgNq1xks65hX38Kiv16YF9gQFXZdVo5?=
 =?us-ascii?Q?CURQ6c6fLotVHe6s9D/HSBFEIJPnYL5pb2I3q+e8VNWRGa7jukXmdSG2LBWe?=
 =?us-ascii?Q?Ti5a3OWC3QKGID3nnsPG/Ck/U1I2gI6GyKtjRXw3EiVgOAWrZrz98GzQFBNL?=
 =?us-ascii?Q?sFH48aX7SQbUctnoZYnVa2aqXgO8/L37g4hbXiSaXBc42LMFM51rTdCS+eDz?=
 =?us-ascii?Q?H0dBV1mIee+mQIQT/cPkeCb5Q7fEnSKfd4k2tVzKQW6RRM88PXkSLuWGDCVb?=
 =?us-ascii?Q?eKBXj1qJNESf4660Jwa8byq33xwRmdrqW50eK4xBc/v1bbZIrZ7AgaAlXl3a?=
 =?us-ascii?Q?5VLqLtSMZIcSUQ+ACbRuSmV4M/xMLsG0ySrMslECKWl6d31EdruXrMwPAi52?=
 =?us-ascii?Q?aJh5oud9SFCRqIWm9WWptO/xzMFWgGqcspJwd/QVEVpPGuDiA02K+wM0muBB?=
 =?us-ascii?Q?tcot67y7FHwdlpkDUqDvjTxQFLMDtCSEGmx46QgtizQ4wb+7kRr/QveMfDrc?=
 =?us-ascii?Q?XaI2VJwHshWKKFkmDzGOslwSKBpIJNU20PHwFuFt4GJxpru5g80YhlwwU58g?=
 =?us-ascii?Q?HgL9/PLyDe+PENg4djKvsmH8RFRTrxc7KCmfSnB8Ou5xUAWki3GWF6mGj91z?=
 =?us-ascii?Q?cdPrTF8CBE9rqtLgHuCwJTM2iNQ04Yy0E55KO5Z31dk6DT5blGezv9kcfUUd?=
 =?us-ascii?Q?beJSRBfwLzLTP5nkAIIP/tijB0udHV0VseAk2EV6KZShagF+uYMMUfmGsoTn?=
 =?us-ascii?Q?x/FiOVJHW7QdKHQ3A4yNuahYlHOQvhLrgjB/3WQ9oZ8P46T86lVr3ZJk2G8i?=
 =?us-ascii?Q?zdANNjChVpOIW++5OWKD5wqrGStuUzk8GfLFC67cSkxFxivBTAVEKzhUH4V/?=
 =?us-ascii?Q?On0+9vstTAye0ZKsB5wpLgkQJw8JJafaKA1x6as+xMq3000fNwst1RYMgY4J?=
 =?us-ascii?Q?pxFeI6vmzBHRYULjo64kabc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d433b364-547d-4c65-b346-08de28494408
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:27:07.3208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQk6FUVe2QxQs8E9gmx25kpdJhOHxOTsV9Ck1EIPuh+jYYBopizha6l4gr17oJJs/9DFAUYIUThYCCdHoJRSZUEZZCJcrgFd76yZSe6gLWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfX7CKh/aKKjdxc
 6ZfOpIjNKwxUJ18S7gcH+6g6XxKo1xf6Y4Fob9JwPdCk6msMxGZi9L/vM7U88EhC7GI+PUWCSnO
 3BjDyFb3MF+ibvX+V+hdTziiksyyUqoCYcEmUzQjTayp3oPU3enZxReXf8TkV+Z3RDymfVO8soP
 sOPMmfU18am6M1QJx7/GjZ1mCUU2sM5w+8Oaof5y3L5bSZs+68YnmlKzB1uAPiGqJturf3Se3SR
 o/wqgPK2ZgYZYBsdaYoYBkXBd/0fqIW2HVuqLwy3x8n9mv31ZmknBOtcNnqgjkCOY/Im8Yo+oko
 y2QYHh9Adf1eHJNOrTjfyIbBIy+3HHJxt39CAs3N91G82bFfPyGXdjT82l++T/Nn0uOuVDaUt4y
 LC8doNwmIeALPkhGT9p4RNoimbPRRQ==
X-Proofpoint-GUID: TttUxuW8xZB_YpkaWCCldu6QuzljTHYz
X-Proofpoint-ORIG-GUID: HmUtyOjrUoo4FqhQIig_y7dL5kYFqYaR
X-Authority-Analysis: v=2.4 cv=f61FxeyM c=1 sm=1 tr=0 ts=691f334d cx=c_pps
 a=mOz+rD6hbbSUvRiPFvEd3g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=1kRfWWIhwYc51yMvilMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226632

From: Yoann Congal <yoann.congal@smile.fr>

Currently, a ccache enabled build fails with:
  |   HOSTRUSTC scripts/generate_rust_target
  |   HOSTCC  scripts/kallsyms
  |   HOSTCC  scripts/sorttable
  |   HOSTCC  scripts/asn1_compiler
  |   TOUCH   include/generated/gcc-plugins.h
  |   DESCEND objtool
  | error: multiple input filenames provided (first two filenames are gcc and
.../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)

when using ccache, value of "HOSTCC=cache gcc" when this value is passing
to rustc, It is thinking gcc is a input file. when ccache is not used "HOSTCC=gcc" is passed.

Disable ccache for kernel build if rust-kernel is enabled to workaround
this.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index c3e1137200..43b440e721 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -34,6 +34,11 @@ RUST_DEBUG_REMAP = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '--re
 KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
 EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
 
+# TODO: rust-kernel enabled kernel fails to build with:
+#  | error: multiple input filenames provided (first two filenames are gcc and .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)
+# Disable ccache for kernel build if rust-kernel is enabled to workaround this.
+CCACHE_DISABLE ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '1', '0', d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
-- 
2.49.0


