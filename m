Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0627D25046
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:12:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29044.1768205537704893545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sp01DN61;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5472523fd3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C3vSNB3802000
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=P3La7EdfFqsLjBq4Ai0CNVDVMDraDQ3iFFpS/9p/u98=; b=sp01DN61j1NT
	gKOUNeQXQnu/ySYOmz/UVBvfLrePR4q4xeZD0mUx0FJGffe7ux/LEPtfbuCUkehC
	xWsDnejOtaBa/HzfnaMgragChB73uJDqZVYvOojTremcB9RQqrhAYGFE3ACVolt8
	xBr/BlinCevP669oSPPj9/ICzjNSBwvj0LckN64SY6435ELT37L2dcQx3erwgcdh
	1O0szFojGjYbECX6/kNGRgPRSep6tN82ks3wYL/3DSqYP9WYMk6xZPkB/br5JkZq
	bzOzQykFd6FMCPWw/cyRN8O+Hsn0Y7p6sjMrKjY+EGsVKHEjM+GvsamNIXha7tO/
	P0OOFaD8hQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbythjbw-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:12:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvdjO7Fvw0xBuCfilZ5UKaH7SkSUHHcf3OtePv59rykaLBA9lQGYKOeLHiDP4u88F4bzJe0GI2olm7ocCyFtBnyKLrlQC2O+tk060LWVRhRnbvZm0TkmvYDwk1C13FKZM+vzxuA8JESbxm6HzkBPr86u/pvhutjmhOg5ucR8N2YfRYda8L8YLFISSu6uc1YysrrZ0pYt0+Anz/Tvo6dw3SVLxcsQIeY3D4HALDPsYzoPZxXrC44mdS/aD9je2KuT+q+49BWtFwEHVKMsIMOpbgfNsNh/876hfzqs2OZ+8uRMtCH+w+U/sieUH0dJon2rtvjE3Tl0scAqnV/Hz8ceNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3La7EdfFqsLjBq4Ai0CNVDVMDraDQ3iFFpS/9p/u98=;
 b=vwg2tL/giKnL4lCWz6nH2R2uOczybPkMs2FIdV7Y8VImSymxbeGNxc1W7pBaY5K7plsMipaAjw6Thc3hwY8dK/m1AaDBwVUt0RuQQxKa8nbIskwNqJfDvbbD+Z86C1dfT7LFwAEmMT3ZnZEj8LcTYkKlWQ9fk2AKii8DvluYLM9nDcb7XK+IbZnxjHpMYovXckkF9zd6qccWvBpG2KfNAwcqj5+BOVMKQVSqHZgt8F5LfQSRlf2LAZygSzU4koezoHBjEmvtAjSgEDqpFRn76ZQchdlSkdxrJCpmnHftOQ86v9C8GToNaZHokC+LQyROCTNi1F4UVvJkdLpm8DMnHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB8372.namprd11.prod.outlook.com (2603:10b6:a03:539::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:12:15 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 08:12:15 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3 V3] kea: remove keactrl from package
Date: Mon, 12 Jan 2026 16:11:58 +0800
Message-Id: <20260112081158.782266-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112081158.782266-1-yi.zhao@windriver.com>
References: <20260112081158.782266-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 06165709-e2dc-4107-a0c1-08de51b24be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Fmj4KpM3ANvMPgOJvE7bpa8z8RFUGnqZVF9EeyzpQl1aP9jhPmImZ8QSIC42?=
 =?us-ascii?Q?R3ajVvbJ08xfg/bViX1ELKwrMOkinVy6hAtOFkvQ3Zw1J0Ed3yk7tkJaZz/d?=
 =?us-ascii?Q?B+tvYZlnVJxXXI6+GNyp8sltYNl6NCZvOxP9t0ZlvaHCm/gKmkqYvhwcO1QM?=
 =?us-ascii?Q?sADXoqWp56CdvmJWI2Ce7h8dlcS/sq0DrozTEO5wAXu5XZfnYcYfdSFHZVI6?=
 =?us-ascii?Q?qxlJYPZxZaIMG21ACN7pQuqTSAY+n0LmVGssz4As6hDe2udyyYTggJ+prK4G?=
 =?us-ascii?Q?MpS2cNoMUoOljJLrf5FlkV41R2QrcMGBNa0pROv+Wv+qhp0U003wrqO5J5BM?=
 =?us-ascii?Q?5OHxYCiSNDVptiHsMB+MYiTrkPuENPsz/UriBrEduCeleEXF6KKTy7MoyI3Q?=
 =?us-ascii?Q?vsiOCWVA/T+duLIuZFnEIekIaf/qkTeAgLeEMIftFVeNtWQLfm2jeuxMmd0D?=
 =?us-ascii?Q?xPI49aFUtPeWI8SaYMyvrZs7bfD+j4dtRcbQ/BQWtmfHcYsm1YsqNoup3IBU?=
 =?us-ascii?Q?MzeYXr52vt5YZbHFeEVmxfKqZzv8Xtqyllsv/pyKKaNtvZa2Obv+6rBbBbZj?=
 =?us-ascii?Q?RIQRh3cHkodDkbuwlAUTohf05O5BDM65qussveaH0dCOHqP4aCtxn4Q5x6SR?=
 =?us-ascii?Q?tqu/dfyF10Lpevva80PZ6WjUsgDzM2ZurCMYyCm7IRU81mQYd39cyOT9VXSM?=
 =?us-ascii?Q?QNQ2yWkUjQ0r8WGEZEJFDi5K0kekGLZgwLaydenAJ4Arf1iH8CGoFf8/Ck7P?=
 =?us-ascii?Q?DjQklO9Wjif2cvG8ULfImfHZshH6zALYJFsyvVPgOi+tOHwbwqY8ZjYSd15G?=
 =?us-ascii?Q?wBCHf0RxjaVJEu0JoPTjweCwLCl0/bZvo2pN7tT4qQMRlDVl2SvjG79fQYSq?=
 =?us-ascii?Q?2QQm3kTeW52sp1TNr+m/x+GePJVY7WoM4kAE1Ck7XNtW9hvouxkzKyuIQIoB?=
 =?us-ascii?Q?Yz+RzEj/Ygbu15Bv1T7M2K9+KAahFKSzhCxLvTctXLtil/E2rAPFda6Hr0qI?=
 =?us-ascii?Q?1BU++DkQ6GQoicNKzdMrAocniSGxW87Jyh5SJVrA4QeGIAAoh2I+53IBXWiz?=
 =?us-ascii?Q?TjdQoHBdvN4QiOAwMlgRMqI6qQ5vb1NU3gbAJNLUGO1CPzgsnGAvBoAlJ0k3?=
 =?us-ascii?Q?GL6LZoCxu3PViA/6jbMkoiFF4e92sgUquc7+Asopy3Ipw3jevUVSGeKH1RkQ?=
 =?us-ascii?Q?J6xm4TAVfJ2wXT6LtA7/fmpaUSV5Q58few3a/itcIALM5APz3uT4lih17FCV?=
 =?us-ascii?Q?zR03iEgYQXkQ7RSYJt5hZZtF3AzwttvMBmVonSIe5y+pvtu/53FEg8WgDII0?=
 =?us-ascii?Q?Pl9tHv+2Z6bL43AGNwP5AxUI0Ph/4cmuQodOopyKigksxoEj38oblvl6p5Ne?=
 =?us-ascii?Q?U/j3A3TmOhbQlS1z4xf0pssBnn1hxzfIrqKez7o8VZnPcVT4hZxeyedPlzRR?=
 =?us-ascii?Q?5ogMxyUMLh08c/ozkyoc9mfCPU835OZcwUITV4JajTGeIkzECsxx2Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m+EI9Uz3qppM+jQW3mtpYJJvPVHwN3662rm4GTNIqs84hLQ8R5WJVa64slO4?=
 =?us-ascii?Q?TxY1WD6ZHU2YRVfd+8m2/B0NRYu4d3qZ20/+Y02MZu00gh+0fEtQrc1Wbv/6?=
 =?us-ascii?Q?jFNFYAyXVG3QFLY0NzVUM1vC9JTnzPP/xIAmUoe7Ok8O/cwlZ1nbZzIwNF+a?=
 =?us-ascii?Q?ToB1/isgXyZ7J3QM4Ts8+fIpx2HOd2cMWhefkyXLiSz+Fae8nFjA+AmJVo0V?=
 =?us-ascii?Q?ccey2PZHVTPM9PkueR70mQw3GyCxv9ReiLaESXhWghS+T1BY96tgWf9HHp0F?=
 =?us-ascii?Q?3ihYr6POB9/JczWiKp56rrTFi6nSFX1E4hpNBxWqx2+cVR2Qwqglano58DEQ?=
 =?us-ascii?Q?E7t/JlRngEocB76JgcQue3o9Yx9ybh/jlHilFskjsxMxvkBmn3/7XkfEawiF?=
 =?us-ascii?Q?PPvpaf0YEe0bTSqu/BPMyiLvttR5qDt8sS3EeyTTqSp64fH8LRWmU5Jc3IKr?=
 =?us-ascii?Q?aStbbvSuMExTYOsOsvQ/TphajVB3Ul1V8cbz/h1lDn2VdDR4xgM+LKPpOwF8?=
 =?us-ascii?Q?7Jrt957f/0wcIUHvrGKE/g5eZA1FGzwIJJgh3xIz4gIj90z3HNH8SQQB+v7c?=
 =?us-ascii?Q?le93FNnjduHRT/Jb5F0zqE/okCTrap2i4+8LEPcRLK7UczHDrq3hISZqBfhC?=
 =?us-ascii?Q?EPZoTXdYx4s/ZDB5EoIhSAyDqlqxGCyQg5ZzTSvQi3pfkQ2reI7+mQX2bgmY?=
 =?us-ascii?Q?GcRn9txrZODX6lrTjUNV0041O2ck6U8XHP9i4i6n/F/p9hN+SL5RcGYxhrHH?=
 =?us-ascii?Q?zN6pSUCgi5iaFKly53O3IYSwRP/2Ax5shX40EgybS/ynxTgyhEy85kXsUNTG?=
 =?us-ascii?Q?jpyZO4kvGIlT7Yvl/F4NN2gqpZdY4PRWJ5aYRPSwUEGQDg7yov2872J/gAOC?=
 =?us-ascii?Q?VlMwpc350IHe6Jntl94/DrYcoGJlNG6mRp0rOQoGZhstJN3uaHQGSYEOkPmZ?=
 =?us-ascii?Q?N0olMKhdVJJ1E6NBE4V3y2bEB14PnvkgJczYSab9WHmLB0zbsq0Ql33EhoS5?=
 =?us-ascii?Q?nUqpxlfL575HyS5J3TmUUBhhWIhN94RCIyINjMH5+GdN5r1/z1nJt8c/3gUa?=
 =?us-ascii?Q?KLDXmhxORZDfrX3bkJRGw5zppJD+wO1L5zfLmd1s/ETrSE4TUdv7C3+0G27O?=
 =?us-ascii?Q?ebCXTWUQczeZVeJCzFHaUGnQRAoN7poaDq340vyQHAh/cJeCHs+h+Xmh6dPd?=
 =?us-ascii?Q?b8fN6ZcorbW0X62r4BTyrB/tyqm4gQ2T6WdWtefmkrdk70kiqgQLIPz9Noyc?=
 =?us-ascii?Q?KOJo4XS6g12NE+pDDU8h8CGnMbnPxelZlW+jdYB1oLvhpHEPr9A/op7xbPzl?=
 =?us-ascii?Q?WUlu1p9hcjALaD3J9NRcrah5ekz7TnF2NnLasxbMMgaYAeeoa1+HCN94pHBw?=
 =?us-ascii?Q?p4B1UjzEqeECP6NTjtLIoZ6f9URc+i6U4ZdYmqMVTPZwt/pCd8V2x4Orzd0l?=
 =?us-ascii?Q?BCcKLqfmnj8rcVE2w8DZyWePILK6sgouJ9H90uTOCSqKWcpt5pweQg92hKoH?=
 =?us-ascii?Q?01+wf5txPRosHOTOrR6Ep9jdQQpTvNEaVNAH00CoysExQqVnfAJcEv4LVhse?=
 =?us-ascii?Q?Pa0X1Ef/UrsohT+cwxykl0GRdilBu/RNkeXPP7g4ZFRRZo73EOXl6JqzK0Uf?=
 =?us-ascii?Q?LYSbiYh3+IZ5DcaT9HM0N3OglzqXXbXe1lpIn7dbnJKLrH1wVT+3YFW/7YNe?=
 =?us-ascii?Q?er8DYgn2Cxm0cPVLC4zNAyw5s+0oIc2Re1SiN7WAX2Ukmg+Aq6mybETghg98?=
 =?us-ascii?Q?pWXzL6RHxA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06165709-e2dc-4107-a0c1-08de51b24be7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:12:15.4075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfTKa9KEF27U7RrpaU3FOLDoHygrZu0pCfQtKXs6rN2XI+2jCgCHl6kijl4au4lYB7+4hBim9Ooj70zzU8sFUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8372
X-Proofpoint-GUID: xyRnoxLxUKticxXX3qWXgoSftNPiBrTV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2MyBTYWx0ZWRfX5bLPNcrk9WxZ
 4059wGxuGjY8LT7gM4PHFMVI7RGGFCx5gG9CrIOq/8VSotOfCVN+mXzY+PZQKLsruQam9Ptnq9z
 EgaJoeKtWFzhdeywP8OpoLNo+XiM6MI7KxpoWXG+pBFf71TA+QGJPkT81MDU1u8c819xy8Jxr8/
 xBnGAF3xWakBhzI/z4vgWfmCHw/7VN9kk3lUqe0KRIVdqmfEKFcpBHVq5Km5HkMTCDwE4iqOZ4R
 4pFulnmgtvmmoHDGSC8VZaT7ZTLhoGuVS4NgwpOY32H5XiUHg5P4h/kPZIDxiea5zJSbN5ADhY0
 /3KfGRIuXCWTBMeGgu7CLWZI4IDfyNyDq/LjS/SnnBvk9chvTT3RGMrAGu7tSHEwGusnl44E+BA
 uZzh7sb20jVB/YD4KCDE+59kf6QW1wRRbdM4CXki3WDX0+cHjvNj18wJFT4sh8jkh1+E2TfW+Ao
 6NlH0wOPjRI84tVHPQA==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=6964ace0 cx=c_pps
 a=9cGrGZFDAlRO1ZcMJRSO2Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=SCo1hh1FAAAA:8 a=UXIAUNObAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=7CQSdrXTAAAA:8 a=IpJZQVW2AAAA:8 a=zBe4X2LmVUuRWWPHscMA:9 a=Hti1SrPgC-EA:10
 a=nwb-CePKZZm3gL-ai9HY:22 a=a1s67YnXd6TbAZZNj1wK:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: xyRnoxLxUKticxXX3qWXgoSftNPiBrTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229190

The keactrl script is used to run Kea from installation directory and is
primarily intended for developers[1][2]. It should not be shipped to kea
package. Remove it before packaging. A related patch is also removed.

[1] https://gitlab.isc.org/isc-projects/kea/-/blob/master/src/bin/keactrl/keactrl.in?ref_type=heads#L10
[2] https://kea.readthedocs.io/en/latest/arm/keactrl.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../kea/files/fix_pid_keactrl.patch           | 32 -------------------
 meta/recipes-connectivity/kea/kea_3.0.2.bb    |  7 ++--
 2 files changed, 4 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch

diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
deleted file mode 100644
index af5a21defa..0000000000
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4b1f48612fd1af40fff7b7b0a1d476e551458ab8 Mon Sep 17 00:00:00 2001
-From: Armin kuster <akuster808@gmail.com>
-Date: Wed, 14 Oct 2020 22:48:31 -0700
-Subject: [PATCH] Busybox does not support ps -p so use pgrep
-
-Upstream-Status: Inappropriate [embedded specific]
-Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
-
-Signed-off-by: Armin kuster <akuster808@gmail.com>
-
-Refresh to apply on top of 2.6.1.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- src/bin/keactrl/keactrl.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
-index da108d8..30e4832 100755
---- a/src/bin/keactrl/keactrl.in
-+++ b/src/bin/keactrl/keactrl.in
-@@ -157,8 +157,8 @@ check_running() {
-     # Get the PID from the PID file (if it exists)
-     get_pid_from_file "${proc_name}"
-     if [ "${_pid}" -gt 0 ]; then
--        # Use ps to check if PID is alive
--        if ps -p "${_pid}" 1>/dev/null; then
-+        # Use pgrep and grep to check if PID is alive
-+        if pgrep -v 1 | grep ${_pid} 1>/dev/null; then
-             # No error, so PID IS ALIVE
-             _running=1
-         fi
diff --git a/meta/recipes-connectivity/kea/kea_3.0.2.bb b/meta/recipes-connectivity/kea/kea_3.0.2.bb
index ae1a1a74cf..f46cb1bf80 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.2.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.2.bb
@@ -16,7 +16,6 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://kea-dhcp-ddns-server \
            file://kea.volatiles \
            file://fix-multilib-conflict.patch \
-           file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            file://0001-build-boost-1.89.0-fixes.patch \
            file://0001-meson-use-a-runtime-safe-interpreter-string.patch \
@@ -88,10 +87,12 @@ do_install:append() {
     rm -rf ${D}${datadir}/${BPN}/meson-info
     rm -rf ${D}${runtimedir}
     rm -rf ${D}${localstatedir}
+
+    # Remove keactrl
+    rm -f ${D}${sbindir}/keactrl ${D}${sysconfdir}/kea/keactrl.conf
 }
 
-CONFFILES:${PN} = "${sysconfdir}/kea/keactrl.conf \
-                   ${sysconfdir}/kea/kea-ctrl-agent.conf \
+CONFFILES:${PN} = "${sysconfdir}/kea/kea-ctrl-agent.conf \
                    ${sysconfdir}/kea/kea-dhcp-ddns.conf \
                    ${sysconfdir}/kea/kea-dhcp4.conf \
                    ${sysconfdir}/kea/kea-dhcp6.conf \
-- 
2.34.1


