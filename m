Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D91CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:44:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18452.1760453065065813835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=K/typhVS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2382047737=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59E6ipvB2161760
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:44:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=oq6EBanvw/3heNB7k09hxftpg21/XfjaRwym+Io6I3k=; b=
	K/typhVSPide4/UumGe7HL/sHYu1zroR9SpVdjfe4qIL9WKX9mOBcihxPE0Oe1Yq
	ZaOkFyGQz+vgVmr2fTU/og15UZIbdLZWo11MeNt7CIXJ2qXI2PM+MTTbHjw8NfmF
	WPiZ/tcsS28RWrEfPeYi1AVV9CEeTaKvgsN7Oo6SJRoF4wzRzBAGvFH26IL9q6nq
	v3pykqDnN72Auy0AQPG/Bsj1kZwO5SBZOQj0Z3+MdOTIA67LI8IUy8yYfSd+C0Js
	4TP3KAyEpPs9EoyFP+pZfKIRukU3vVtGNVk+ANq6rM6Y1w+OKLsRFdZiPOmvPIXh
	GKs2q8MGrTquD1ibwzFCwA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011048.outbound.protection.outlook.com [40.107.208.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdtxyw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGtledjzSdV0x2tYfIFqZaiVcXQ/A1XMoBZo5HfRPSvwN2pMxo9xkQ6zPF+j5w1XyK9uedjhUC9vaXToEfF38lwAcCWQ1/vW+v4NLUjuoDVUgX2VSpqC/OMKuwqlL2oKw18PAbU5+emMpuuSycniYtblrHOpxvxHRVTxl6kXChc0Qboj0L1S8TSyMfkF6OPrS99D7+NKKNjRqKNkkpbX3sYgizdopWct4p3g8pKA673aaQLVI3waAIUu1PdFRXnBPK3TmLbkAVwmwdlz7lnWfro5VLo5iuU7aDJ7PLXbvQzYKl5Nx6zqc3v9iS4pVBfRQh7WhoV1FfCR8iS+vDlHkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oq6EBanvw/3heNB7k09hxftpg21/XfjaRwym+Io6I3k=;
 b=OXhq9jwEkw+LpKvTW2V0fvfgwiZR1IjP6qsbaayaBp8QGn5dBCjrWynECzAloVaxaopt4lBY6SSCbXSH3IM3c2SYMpmLns1RA+Y4jqZb/YiNCp81KhmGAjVsvrUc8pDgl+ow2WlBkAqEYfWP2a3RcMug5hbLBtykg2rMMOkGeFQ2wQADnBCDPCazud1nQLwLXAg9CpPZuaYFNRrT2/J8qr0AovA3PBZLOz+KRliYqywrunhu/RxyqmtY0NkF9PH/rNsd24QgXV90Sxyomv89vpjhLYQ8h639jN2wbBvtHJsk/IytbGxsYWBeLe39/jLKcPHY6DgDntf6zlIlr3BHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Tue, 14 Oct 2025 14:44:22 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:44:22 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [kirkstone][PATCH 01/11] glibc: Remove partial BZ#25847 backport patches
Date: Tue, 14 Oct 2025 07:43:37 -0700
Message-ID: <20251014144347.536537-2-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
References: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To CH3PR11MB7896.namprd11.prod.outlook.com
 (2603:10b6:610:131::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DM4PR11MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 0101e778-3b11-4826-195e-08de0b3029da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TqdoHtddMwhMo/UbsvKu09tuCYa34es2paaKJK5Ws6efDrw0/CpO0pPTEI1f?=
 =?us-ascii?Q?3qdH9x0NLedv+zOt+pTqPnupcp/u+8whieLlOB7X3ZlEazxEkzjWjNGGVoZy?=
 =?us-ascii?Q?fgP8igQM8sJyyqtTmox+D/k6M1d8GbCxLJaA8MFcFr1XZ88gdKkSysi9eVNt?=
 =?us-ascii?Q?Uyb1FzS7ch0FBvfKc5twAw5Ax1tI/PDZqjaCPK1NkcF+NgGluUjqz4mMVqiV?=
 =?us-ascii?Q?ffe6dAUwqp9wRBTEnxIOyWzYyltrKnJtwve6zY4NeWm/otOa2acRtSH6FrRj?=
 =?us-ascii?Q?RTsjLelbvtKoqNd5d3IqMeKmiswVlMRl+8bi8VZoNCHRL7RG/Y5nYI8JeW0X?=
 =?us-ascii?Q?Sa7ZD9+mVONjOkmysMHsQ47W4AXFm185zl5QWySFPiinTXsxXMhgCoRkXuoL?=
 =?us-ascii?Q?bZulAc8XApu2WAsCJirDBcULmRBaP4lkrVrRg4X57SLaVpicSRXPCZazLg4f?=
 =?us-ascii?Q?7+FWA5Cgao0zI5WGFp8emiH9QTzkObHQpdL6X5JQVVGNU+En1dAPuvsmtZWd?=
 =?us-ascii?Q?exFZ8v1r/07oAXZA7PX+hAxuTgj5HLjy2oTZrtRJsDR0smNXfixWteP3d64T?=
 =?us-ascii?Q?yYdvdh3r5/NoUgEt/XJbJDP8YT/bJC7RsI7PAU9nLF5RcR0wBqeWYiXmN0JT?=
 =?us-ascii?Q?S0Zwt4CZVlG+ZGJTlisrmlLyqy41HzNVsyUVxaE4SGReKPnOWksvFAlbfW9p?=
 =?us-ascii?Q?Wt5s51Xwn5ETYmdVwiiQYJ22wgC0OsNcOVEYh72JCjGJukklldPF3r0loqvt?=
 =?us-ascii?Q?ZyBoe/KvEfjLFVJJxysvvuxYIkZqCPGLXew0g85bin68RT9K8ou7LtSKV2Kx?=
 =?us-ascii?Q?D5yf5l30nyC2bh3iGrK5VMq3NJZM0aYTleNHhPfHTiP16NnJpGJk7b5yl+eY?=
 =?us-ascii?Q?W6RQQedVpf+Wh2uflCJPzXuFApoyXCKg5xtzbF364/4q3qfUx6ZZWGBRJeXh?=
 =?us-ascii?Q?5QH7gpDMpVfq3X/p4F9X0KxHLeRs6O5P3gqZQmkP3I8RS11IOX74GGMwoshe?=
 =?us-ascii?Q?/ywqgBTSg/Pk2O5rRtsiqyoqp2K0+ZyNBOD4jQluak4tl/okvldUlVEsQ+UG?=
 =?us-ascii?Q?UNBvNZslpTZK9yXjguHKeo8MfozSAd6u14HWDtJAz2Il/mfLfJxWQZAi95Qs?=
 =?us-ascii?Q?0mx7WRm89qYWCAX1aLNHzRmYaq5bCAXipiPb9KRtp8jFsUwyS8BQIbPgyPmQ?=
 =?us-ascii?Q?hHYa6/x4Xv/ngOtSt4R+1B4ITKURwKZEWHDMSYsPtYLZ1HGi9iUmc3Eo6903?=
 =?us-ascii?Q?HJaw+0rQ9z6jxMhhPl+iFuQ1Jd1Oy6ZpMKQJ92yfbSFVadwQno4cX2G9YdHc?=
 =?us-ascii?Q?9kSZb26DYcLQ3EkqyWwBi6ZsNyY05iyV92mSHH9h0UK71jvMrymBjBo1c+Wf?=
 =?us-ascii?Q?OtA5IeVh4/0R/L3QHd/opBUxZNAFdWKBr73MaOvn/RZHVGABBSTvGLWsXkuG?=
 =?us-ascii?Q?z/SmMcAX0hLQRB8PSE6vhnpAdtY++ptIPKX6VSKHV8dD/7xNBm8Duw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AZxk/bNl0BU1I5fnj35Mc9K+yvcqp7aK7msbR3VHhPhuTOm3lp9ol5kPrsGM?=
 =?us-ascii?Q?6iiYgnYhNu1k31pmxzDDb6/oMFcIZ8ZJ0MVb+wSc+P85FlpoV+5K0QxiOUun?=
 =?us-ascii?Q?RFMk9FAqT73BcUCDl8+RLexj3aDTJU6c5mfS+un9Dklx5tNQZOf1L9Mfz9AE?=
 =?us-ascii?Q?/yjL0TuqqLCOgUCUa+kx7c+SunHG0/HayLuef0naF8cJYB8/iKZhpNPUS3Bt?=
 =?us-ascii?Q?tEqQt6/REoyVqXQEth5wrKRVpVxrIyp4ArcsbVl5lCpmeR5l4Zbzy94ZrJ9O?=
 =?us-ascii?Q?395eLupIm7NQk/dtK+gCgG8ijzoTNdV0aNncN7pM0SUEv3EqIPz+1Sgak9cA?=
 =?us-ascii?Q?RQMfT+XJYSPpliBzZJvrexekh8nGRoj7AtAbRs4CMAuJiJILjjwUaFKkGPSQ?=
 =?us-ascii?Q?3k7RVXjyl8hxIIaB6CJVxOmIsXDr2ojcmjgFJClobAc/tjGCq7/2e9hz29UN?=
 =?us-ascii?Q?rUpQjs1uvrqyhJVPr+IDSWK2I33M4rVEkSU2QX8ShunWF9Px9NQ39q6hugR3?=
 =?us-ascii?Q?T7dKNJZaCoW+ftDNVESo9D+EnUlV+kZRWHAxjZwyvvpyvzCAUTG3CJ+VM5hP?=
 =?us-ascii?Q?PhCJGgV777N87NNFOoL3jUpbHpJFpsUGYZBJ6cpzn0JrEIHoKYR8a2Rhc1e0?=
 =?us-ascii?Q?wL5LrwWngmwBwORfdIQADvTEZiXyQjN+DCrVF/FfTnOfauzlcWA8gAxGDp5M?=
 =?us-ascii?Q?U6Rvbn8ZxmLJ6t3xl62ZjpHrfuRuoNZ/8bKe3AMXfTPR8Q1p7GvkisfttDcE?=
 =?us-ascii?Q?4+w0+ueGr906vUcrgNou80ZPu0hF7qLPkAFTGqEo8KqlZ9efUm7g7HIToODL?=
 =?us-ascii?Q?R+7hCXTjdV2D5mMu8TN4qqLwyW8bBuYXyoapt/5XAYT9hmQimmHM4os84UUM?=
 =?us-ascii?Q?zWI6Zdk1x7uQG8XO98xIlWbwsC2/LLmuHp5h3HrdQJPepD3bCFaZHVGC/lvd?=
 =?us-ascii?Q?CexirLM+phbjsZXt8Ztm7fRHUzq27glLDogZnXYjryndntVKyRrozTdrcF1D?=
 =?us-ascii?Q?iwWVOwbZT2RpT3ZIcGN4NS0gS1A9byPmvRZfcOwgimWG6I/VFi4SNA/YZdOf?=
 =?us-ascii?Q?1x3l2Y3wCwU7zhmLimrPn4kAUmC43ohFuL/SvVWztAx3Nqj8s4ssps8pRFeK?=
 =?us-ascii?Q?R442Sow5Rf4oJ7cm6gNpoeX6jf1znauMVw0pIlFFO75g/JYFvXHIUb2Z5Kbx?=
 =?us-ascii?Q?An5l3LYqeDAeOM5SBag7qMG7/335YuGMkrphDVjOwt88NAlYGjVlZHO8imZE?=
 =?us-ascii?Q?37z8uKJRmgDqAHlI85T5nvaFbR2xWAoaewNAbqnOU/yatuMFSpV5X5vIDYv2?=
 =?us-ascii?Q?uL07kc38wjlp4Q0P0QAfMey0fc+I6ByQ7W8VBZVJh4kIBXw866PTyXn5vW51?=
 =?us-ascii?Q?HC+s/1EgjFNOg/ra+s3iKCH85hxqW0y1AErP3jvox9vMManuNWSClIODwZwP?=
 =?us-ascii?Q?JFvMcYc3WuD7lon9+GBfrpVOVM7tDlS3xgcFczNwsh2yOVnuXCBbbAXsUyHI?=
 =?us-ascii?Q?iBjlGT8vmJC0RTwV8KHnq5ulEMtUIKPWeduJ6A4uDnmzl3822Lwg3S9PrfPn?=
 =?us-ascii?Q?mySwHnJngl+CQxa4i/5s0waiosrWFu3sLbFBrgDBSXGYHTVjob6OyaFsZYQY?=
 =?us-ascii?Q?1w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0101e778-3b11-4826-195e-08de0b3029da
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:44:22.7219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnYs+k/RkLTqI7RYPSe63jgoBVSTz5GlZcivqPEeLtzG9VEv7LVOB7IL8RpWO3+reh5vyZYoUXQBD8cwBIwWeMbYoTTeGS+2ZUcli/hxhys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDExMSBTYWx0ZWRfX6BAsmP7eAO2T
 A6rCqN/Xs2N3KUGQXrxMbYiyd6CwfUL+JPsSV/m7FhE4HzuDrPIaWXObmA97DuoAF0KoRfjfFWD
 Be0yA8ko7xf82v9ZUWczTlRZuwWnCR+rmcaR5NYP0+A9sasYonobcvViOajiHXpLDXg9Jfx3CKI
 VldZ33J3y8Ae0RThWQSvuaEKAbFF6RDHk3wt9hMk7XJq9mmQ3aSuHv2poItXapELwM9lI6JE+jj
 DHgJMzg1luRjCRvpxUQ091ECB+dOCKxtYpdZRtGjMmKMXB1oI2GOqpOnsdFlc3Y6ojxOa8kRY/A
 bMv0DG4Iub/fyqmSFrpeBqqeV80m6gxCYCHlljmp5BEnNTni068naZvLRVvFVwfWy+H3wIKhobm
 2hyM3whvufcPOQZLU08FzG/Ai0oxWA==
X-Proofpoint-GUID: 46uB2MbE8esROVbAisx0QThJopd_4x1h
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68ee61c8 cx=c_pps
 a=9FihqjIFmhICW6KbYStfAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=AHBuqsJtKLcTM1Vxm4AA:9
 a=KZ1sBYSHuZW9YS6h:21 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 46uB2MbE8esROVbAisx0QThJopd_4x1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510140111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224822

From: Sunil Dora <sunilkumar.dora@windriver.com>

To facilitate a clean backport of the full 10-commit series
addressing the pthread condition variable lost wakeup issue
(BZ#25847) in glibc 2.35, remove the existing 8 patches that
were applied as a partial backport.

The previous partial backport excluded commit:
c36fc50781995e6758cae2b6927839d0157f213c ("nptl: Remove
g_refs from condition variables") based on guidance from
glibc maintainer Florian Weimer(#comment #74)

This exclusion was recommended for stable branches to
avoid altering the layout of pthread_cond_t, which could
introduce ABI incompatibilities. Additionally, the dependent
commit dbc5a50d12eff4cb3f782129029d04b8a76f58e7 was not needed
in the partial backport.

To align with upstream mainline, per maintainer Carlos O'Donell
(comment #75), apply the complete 10-commit series for consistency.

By removing these patches first, we ensure the subsequent
application of the full 10 commits results in cleaner, more
reviewable changes without intermixed conflicts or overlaps.

Removed patches and corresponding upstream commits:
- 0026-PR25847-1.patch: 1db84775f831a1494993ce9c118deaf9537cc50a
- 0026-PR25847-2.patch: 0cc973160c23bb67f895bc887dd6942d29f8fee3
- 0026-PR25847-3.patch: b42cc6af11062c260c7dfa91f1c89891366fed3e
- 0026-PR25847-4.patch: 4f7b051f8ee3feff1b53b27a906f245afaa9cee1
- 0026-PR25847-5.patch: 929a4764ac90382616b6a21f099192b2475da674
- 0026-PR25847-6.patch: ee6c14ed59d480720721aaacc5fb03213dc153da
- 0026-PR25847-7.patch: 4b79e27a5073c02f6bff9aa8f4791230a0ab1867
- 0026-PR25847-8.patch: 91bb902f58264a2fd50fbce8f39a9a290dd23706

Bug reference: https://sourceware.org/bugzilla/show_bug.cgi?id=25847
This change prepares the branch for the full backport in follow-up commits.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-1.patch          | 455 ------------------
 .../glibc/glibc/0026-PR25847-2.patch          | 144 ------
 .../glibc/glibc/0026-PR25847-3.patch          |  77 ---
 .../glibc/glibc/0026-PR25847-4.patch          | 117 -----
 .../glibc/glibc/0026-PR25847-5.patch          | 105 ----
 .../glibc/glibc/0026-PR25847-6.patch          | 169 -------
 .../glibc/glibc/0026-PR25847-7.patch          | 160 ------
 .../glibc/glibc/0026-PR25847-8.patch          | 192 --------
 meta/recipes-core/glibc/glibc_2.35.bb         |   8 -
 9 files changed, 1427 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-8.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
deleted file mode 100644
index 44a2b6772c..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
+++ /dev/null
@@ -1,455 +0,0 @@
-From 31d9848830e496f57d4182b518467c4c63bfd4bd Mon Sep 17 00:00:00 2001
-From: Frank Barrus <frankbarrus_sw@shaggy.cc>
-Date: Mon, 16 Jun 2025 22:37:54 -0700
-Subject: [PATCH] pthreads NPTL: lost wakeup fix 2
-
-This fixes the lost wakeup (from a bug in signal stealing) with a change
-in the usage of g_signals[] in the condition variable internal state.
-It also completely eliminates the concept and handling of signal stealing,
-as well as the need for signalers to block to wait for waiters to wake
-up every time there is a G1/G2 switch.  This greatly reduces the average
-and maximum latency for pthread_cond_signal.
-
-The g_signals[] field now contains a signal count that is relative to
-the current g1_start value.  Since it is a 32-bit field, and the LSB is
-still reserved (though not currently used anymore), it has a 31-bit value
-that corresponds to the low 31 bits of the sequence number in g1_start.
-(since g1_start also has an LSB flag, this means bits 31:1 in g_signals
-correspond to bits 31:1 in g1_start, plus the current signal count)
-
-By making the signal count relative to g1_start, there is no longer
-any ambiguity or A/B/A issue, and thus any checks before blocking,
-including the futex call itself, are guaranteed not to block if the G1/G2
-switch occurs, even if the signal count remains the same.  This allows
-initially safely blocking in G2 until the switch to G1 occurs, and
-then transitioning from G1 to a new G1 or G2, and always being able to
-distinguish the state change.  This removes the race condition and A/B/A
-problems that otherwise ocurred if a late (pre-empted) waiter were to
-resume just as the futex call attempted to block on g_signal since
-otherwise there was no last opportunity to re-check things like whether
-the current G1 group was already closed.
-
-By fixing these issues, the signal stealing code can be eliminated,
-since there is no concept of signal stealing anymore.  The code to block
-for all waiters to exit g_refs can also be removed, since any waiters
-that are still in the g_refs region can be guaranteed to safely wake
-up and exit.  If there are still any left at this time, they are all
-sent one final futex wakeup to ensure that they are not blocked any
-longer, but there is no need for the signaller to block and wait for
-them to wake up and exit the g_refs region.
-
-The signal count is then effectively "zeroed" but since it is now
-relative to g1_start, this is done by advancing it to a new value that
-can be observed by any pending blocking waiters.  Any late waiters can
-always tell the difference, and can thus just cleanly exit if they are
-in a stale G1 or G2.  They can never steal a signal from the current
-G1 if they are not in the current G1, since the signal value that has
-to match in the cmpxchg has the low 31 bits of the g1_start value
-contained in it, and that's first checked, and then it won't match if
-there's a G1/G2 change.
-
-Note: the 31-bit sequence number used in g_signals is designed to
-handle wrap-around when checking the signal count, but if the entire
-31-bit wraparound (2 billion signals) occurs while there is still a
-late waiter that has not yet resumed, and it happens to then match
-the current g1_start low bits, and the pre-emption occurs after the
-normal "closed group" checks (which are 64-bit) but then hits the
-futex syscall and signal consuming code, then an A/B/A issue could
-still result and cause an incorrect assumption about whether it
-should block.  This particular scenario seems unlikely in practice.
-Note that once awake from the futex, the waiter would notice the
-closed group before consuming the signal (since that's still a 64-bit
-check that would not be aliased in the wrap-around in g_signals),
-so the biggest impact would be blocking on the futex until the next
-full wakeup from a G1/G2 switch.
-
-The following commits have been cherry-picked from Glibc master branch:
-Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
-
-Upstream-Status: Backport
-[https://sourceware.org/git/?p=glibc.git;a=commit;h=1db84775f831a1494993ce9c118deaf9537cc50a]
-
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- nptl/pthread_cond_common.c | 106 +++++++++------------------
- nptl/pthread_cond_wait.c   | 144 ++++++++++++-------------------------
- 2 files changed, 81 insertions(+), 169 deletions(-)
-
-diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
-index fb035f72c3..8dd7037923 100644
---- a/nptl/pthread_cond_common.c
-+++ b/nptl/pthread_cond_common.c
-@@ -201,7 +201,6 @@ static bool __attribute__ ((unused))
- __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
-     unsigned int *g1index, int private)
- {
--  const unsigned int maxspin = 0;
-   unsigned int g1 = *g1index;
- 
-   /* If there is no waiter in G2, we don't do anything.  The expression may
-@@ -222,85 +221,46 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
-      * New waiters arriving concurrently with the group switching will all go
-        into G2 until we atomically make the switch.  Waiters existing in G2
-        are not affected.
--     * Waiters in G1 will be closed out immediately by setting a flag in
--       __g_signals, which will prevent waiters from blocking using a futex on
--       __g_signals and also notifies them that the group is closed.  As a
--       result, they will eventually remove their group reference, allowing us
--       to close switch group roles.  */
--
--  /* First, set the closed flag on __g_signals.  This tells waiters that are
--     about to wait that they shouldn't do that anymore.  This basically
--     serves as an advance notificaton of the upcoming change to __g1_start;
--     waiters interpret it as if __g1_start was larger than their waiter
--     sequence position.  This allows us to change __g1_start after waiting
--     for all existing waiters with group references to leave, which in turn
--     makes recovery after stealing a signal simpler because it then can be
--     skipped if __g1_start indicates that the group is closed (otherwise,
--     we would have to recover always because waiters don't know how big their
--     groups are).  Relaxed MO is fine.  */
--  atomic_fetch_or_relaxed (cond->__data.__g_signals + g1, 1);
--
--  /* Wait until there are no group references anymore.  The fetch-or operation
--     injects us into the modification order of __g_refs; release MO ensures
--     that waiters incrementing __g_refs after our fetch-or see the previous
--     changes to __g_signals and to __g1_start that had to happen before we can
--     switch this G1 and alias with an older group (we have two groups, so
--     aliasing requires switching group roles twice).  Note that nobody else
--     can have set the wake-request flag, so we do not have to act upon it.
--
--     Also note that it is harmless if older waiters or waiters from this G1
--     get a group reference after we have quiesced the group because it will
--     remain closed for them either because of the closed flag in __g_signals
--     or the later update to __g1_start.  New waiters will never arrive here
--     but instead continue to go into the still current G2.  */
--  unsigned r = atomic_fetch_or_release (cond->__data.__g_refs + g1, 0);
--  while ((r >> 1) > 0)
--    {
--      for (unsigned int spin = maxspin; ((r >> 1) > 0) && (spin > 0); spin--)
--	{
--	  /* TODO Back off.  */
--	  r = atomic_load_relaxed (cond->__data.__g_refs + g1);
--	}
--      if ((r >> 1) > 0)
--	{
--	  /* There is still a waiter after spinning.  Set the wake-request
--	     flag and block.  Relaxed MO is fine because this is just about
--	     this futex word.
--
--	     Update r to include the set wake-request flag so that the upcoming
--	     futex_wait only blocks if the flag is still set (otherwise, we'd
--	     violate the basic client-side futex protocol).  */
--	  r = atomic_fetch_or_relaxed (cond->__data.__g_refs + g1, 1) | 1;
--
--	  if ((r >> 1) > 0)
--	    futex_wait_simple (cond->__data.__g_refs + g1, r, private);
--	  /* Reload here so we eventually see the most recent value even if we
--	     do not spin.   */
--	  r = atomic_load_relaxed (cond->__data.__g_refs + g1);
--	}
--    }
--  /* Acquire MO so that we synchronize with the release operation that waiters
--     use to decrement __g_refs and thus happen after the waiters we waited
--     for.  */
--  atomic_thread_fence_acquire ();
-+     * Waiters in G1 will be closed out immediately by the advancing of
-+       __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
-+       which will prevent waiters from blocking using a futex on
-+       __g_signals since it provides enough signals for all possible
-+       remaining waiters.  As a result, they can each consume a signal
-+       and they will eventually remove their group reference.  */
- 
-   /* Update __g1_start, which finishes closing this group.  The value we add
-      will never be negative because old_orig_size can only be zero when we
-      switch groups the first time after a condvar was initialized, in which
--     case G1 will be at index 1 and we will add a value of 1.  See above for
--     why this takes place after waiting for quiescence of the group.
-+     case G1 will be at index 1 and we will add a value of 1.
-      Relaxed MO is fine because the change comes with no additional
-      constraints that others would have to observe.  */
-   __condvar_add_g1_start_relaxed (cond,
-       (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
- 
--  /* Now reopen the group, thus enabling waiters to again block using the
--     futex controlled by __g_signals.  Release MO so that observers that see
--     no signals (and thus can block) also see the write __g1_start and thus
--     that this is now a new group (see __pthread_cond_wait_common for the
--     matching acquire MO loads).  */
--  atomic_store_release (cond->__data.__g_signals + g1, 0);
--
-+  unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
-+
-+  /* If any waiters still hold group references (and thus could be blocked),
-+     then wake them all up now and prevent any running ones from blocking.
-+     This is effectively a catch-all for any possible current or future
-+     bugs that can allow the group size to reach 0 before all G1 waiters
-+     have been awakened or at least given signals to consume, or any
-+     other case that can leave blocked (or about to block) older waiters..  */
-+  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) > 0)
-+   {
-+    /* First advance signals to the end of the group (i.e. enough signals
-+       for the entire G1 group) to ensure that waiters which have not
-+       yet blocked in the futex will not block.
-+       Note that in the vast majority of cases, this should never
-+       actually be necessary, since __g_signals will have enough
-+       signals for the remaining g_refs waiters.  As an optimization,
-+       we could check this first before proceeding, although that
-+       could still leave the potential for futex lost wakeup bugs
-+       if the signal count was non-zero but the futex wakeup
-+       was somehow lost.  */
-+    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
-+
-+    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
-+   }
-   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
-      No old waiter can neither grab a signal nor acquire a reference without
-      noticing that __g1_start is larger.
-@@ -311,6 +271,10 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
-   g1 ^= 1;
-   *g1index ^= 1;
- 
-+  /* Now advance the new G1 g_signals to the new lowseq, giving it
-+     an effective signal count of 0 to start.  */
-+  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
-+
-   /* These values are just observed by signalers, and thus protected by the
-      lock.  */
-   unsigned int orig_size = wseq - (old_g1_start + old_orig_size);
-diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
-index 20c348a503..1cb3dbf7b0 100644
---- a/nptl/pthread_cond_wait.c
-+++ b/nptl/pthread_cond_wait.c
-@@ -238,9 +238,7 @@ __condvar_cleanup_waiting (void *arg)
-    signaled), and a reference count.
- 
-    The group reference count is used to maintain the number of waiters that
--   are using the group's futex.  Before a group can change its role, the
--   reference count must show that no waiters are using the futex anymore; this
--   prevents ABA issues on the futex word.
-+   are using the group's futex.
- 
-    To represent which intervals in the waiter sequence the groups cover (and
-    thus also which group slot contains G1 or G2), we use a 64b counter to
-@@ -300,11 +298,12 @@ __condvar_cleanup_waiting (void *arg)
-        last reference.
-      * Reference count used by waiters concurrently with signalers that have
-        acquired the condvar-internal lock.
--   __g_signals: The number of signals that can still be consumed.
-+   __g_signals: The number of signals that can still be consumed, relative to
-+     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bits
-+     31 to 1 of g1_start with the signal count added)
-      * Used as a futex word by waiters.  Used concurrently by waiters and
-        signalers.
--     * LSB is true iff this group has been completely signaled (i.e., it is
--       closed).
-+     * LSB is currently reserved and 0.
-    __g_size: Waiters remaining in this group (i.e., which have not been
-      signaled yet.
-      * Accessed by signalers and waiters that cancel waiting (both do so only
-@@ -328,18 +327,6 @@ __condvar_cleanup_waiting (void *arg)
-    sufficient because if a waiter can see a sufficiently large value, it could
-    have also consume a signal in the waiters group.
- 
--   Waiters try to grab a signal from __g_signals without holding a reference
--   count, which can lead to stealing a signal from a more recent group after
--   their own group was already closed.  They cannot always detect whether they
--   in fact did because they do not know when they stole, but they can
--   conservatively add a signal back to the group they stole from; if they
--   did so unnecessarily, all that happens is a spurious wake-up.  To make this
--   even less likely, __g1_start contains the index of the current g2 too,
--   which allows waiters to check if there aliasing on the group slots; if
--   there wasn't, they didn't steal from the current G1, which means that the
--   G1 they stole from must have been already closed and they do not need to
--   fix anything.
--
-    It is essential that the last field in pthread_cond_t is __g_signals[1]:
-    The previous condvar used a pointer-sized field in pthread_cond_t, so a
-    PTHREAD_COND_INITIALIZER from that condvar implementation might only
-@@ -435,6 +422,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
-     {
-       while (1)
- 	{
-+          uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
-+          unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
-+
- 	  /* Spin-wait first.
- 	     Note that spinning first without checking whether a timeout
- 	     passed might lead to what looks like a spurious wake-up even
-@@ -446,35 +436,45 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
- 	     having to compare against the current time seems to be the right
- 	     choice from a performance perspective for most use cases.  */
- 	  unsigned int spin = maxspin;
--	  while (signals == 0 && spin > 0)
-+	  while (spin > 0 && ((int)(signals - lowseq) < 2))
- 	    {
- 	      /* Check that we are not spinning on a group that's already
- 		 closed.  */
--	      if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
--		goto done;
-+	      if (seq < (g1_start >> 1))
-+		break;
- 
- 	      /* TODO Back off.  */
- 
- 	      /* Reload signals.  See above for MO.  */
- 	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
-+              g1_start = __condvar_load_g1_start_relaxed (cond);
-+              lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
- 	      spin--;
- 	    }
- 
--	  /* If our group will be closed as indicated by the flag on signals,
--	     don't bother grabbing a signal.  */
--	  if (signals & 1)
--	    goto done;
--
--	  /* If there is an available signal, don't block.  */
--	  if (signals != 0)
-+          if (seq < (g1_start >> 1))
-+	    {
-+              /* If the group is closed already,
-+	         then this waiter originally had enough extra signals to
-+	         consume, up until the time its group was closed.  */
-+	       goto done;
-+            }
-+
-+	  /* If there is an available signal, don't block.
-+             If __g1_start has advanced at all, then we must be in G1
-+	     by now, perhaps in the process of switching back to an older
-+	     G2, but in either case we're allowed to consume the available
-+	     signal and should not block anymore.  */
-+	  if ((int)(signals - lowseq) >= 2)
- 	    break;
- 
- 	  /* No signals available after spinning, so prepare to block.
- 	     We first acquire a group reference and use acquire MO for that so
- 	     that we synchronize with the dummy read-modify-write in
- 	     __condvar_quiesce_and_switch_g1 if we read from that.  In turn,
--	     in this case this will make us see the closed flag on __g_signals
--	     that designates a concurrent attempt to reuse the group's slot.
-+	     in this case this will make us see the advancement of __g_signals
-+	     to the upcoming new g1_start that occurs with a concurrent
-+	     attempt to reuse the group's slot.
- 	     We use acquire MO for the __g_signals check to make the
- 	     __g1_start check work (see spinning above).
- 	     Note that the group reference acquisition will not mask the
-@@ -482,15 +482,24 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
- 	     an atomic read-modify-write operation and thus extend the release
- 	     sequence.  */
- 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
--	  if (((atomic_load_acquire (cond->__data.__g_signals + g) & 1) != 0)
--	      || (seq < (__condvar_load_g1_start_relaxed (cond) >> 1)))
-+	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
-+          g1_start = __condvar_load_g1_start_relaxed (cond);
-+          lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
-+
-+          if (seq < (g1_start >> 1))
- 	    {
--	      /* Our group is closed.  Wake up any signalers that might be
--		 waiting.  */
-+              /* group is closed already, so don't block */
- 	      __condvar_dec_grefs (cond, g, private);
- 	      goto done;
- 	    }
- 
-+	  if ((int)(signals - lowseq) >= 2)
-+	    {
-+	      /* a signal showed up or G1/G2 switched after we grabbed the refcount */
-+	      __condvar_dec_grefs (cond, g, private);
-+	      break;
-+            }
-+
- 	  // Now block.
- 	  struct _pthread_cleanup_buffer buffer;
- 	  struct _condvar_cleanup_buffer cbuffer;
-@@ -501,7 +510,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
- 	  __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
- 
- 	  err = __futex_abstimed_wait_cancelable64 (
--	    cond->__data.__g_signals + g, 0, clockid, abstime, private);
-+	    cond->__data.__g_signals + g, signals, clockid, abstime, private);
- 
- 	  __pthread_cleanup_pop (&buffer, 0);
- 
-@@ -524,6 +533,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
- 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
- 	}
- 
-+       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
-+	 goto done;
-     }
-   /* Try to grab a signal.  Use acquire MO so that we see an up-to-date value
-      of __g1_start below (see spinning above for a similar case).  In
-@@ -532,69 +543,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
-   while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
- 						&signals, signals - 2));
- 
--  /* We consumed a signal but we could have consumed from a more recent group
--     that aliased with ours due to being in the same group slot.  If this
--     might be the case our group must be closed as visible through
--     __g1_start.  */
--  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
--  if (seq < (g1_start >> 1))
--    {
--      /* We potentially stole a signal from a more recent group but we do not
--	 know which group we really consumed from.
--	 We do not care about groups older than current G1 because they are
--	 closed; we could have stolen from these, but then we just add a
--	 spurious wake-up for the current groups.
--	 We will never steal a signal from current G2 that was really intended
--	 for G2 because G2 never receives signals (until it becomes G1).  We
--	 could have stolen a signal from G2 that was conservatively added by a
--	 previous waiter that also thought it stole a signal -- but given that
--	 that signal was added unnecessarily, it's not a problem if we steal
--	 it.
--	 Thus, the remaining case is that we could have stolen from the current
--	 G1, where "current" means the __g1_start value we observed.  However,
--	 if the current G1 does not have the same slot index as we do, we did
--	 not steal from it and do not need to undo that.  This is the reason
--	 for putting a bit with G2's index into__g1_start as well.  */
--      if (((g1_start & 1) ^ 1) == g)
--	{
--	  /* We have to conservatively undo our potential mistake of stealing
--	     a signal.  We can stop trying to do that when the current G1
--	     changes because other spinning waiters will notice this too and
--	     __condvar_quiesce_and_switch_g1 has checked that there are no
--	     futex waiters anymore before switching G1.
--	     Relaxed MO is fine for the __g1_start load because we need to
--	     merely be able to observe this fact and not have to observe
--	     something else as well.
--	     ??? Would it help to spin for a little while to see whether the
--	     current G1 gets closed?  This might be worthwhile if the group is
--	     small or close to being closed.  */
--	  unsigned int s = atomic_load_relaxed (cond->__data.__g_signals + g);
--	  while (__condvar_load_g1_start_relaxed (cond) == g1_start)
--	    {
--	      /* Try to add a signal.  We don't need to acquire the lock
--		 because at worst we can cause a spurious wake-up.  If the
--		 group is in the process of being closed (LSB is true), this
--		 has an effect similar to us adding a signal.  */
--	      if (((s & 1) != 0)
--		  || atomic_compare_exchange_weak_relaxed
--		       (cond->__data.__g_signals + g, &s, s + 2))
--		{
--		  /* If we added a signal, we also need to add a wake-up on
--		     the futex.  We also need to do that if we skipped adding
--		     a signal because the group is being closed because
--		     while __condvar_quiesce_and_switch_g1 could have closed
--		     the group, it might stil be waiting for futex waiters to
--		     leave (and one of those waiters might be the one we stole
--		     the signal from, which cause it to block using the
--		     futex).  */
--		  futex_wake (cond->__data.__g_signals + g, 1, private);
--		  break;
--		}
--	      /* TODO Back off.  */
--	    }
--	}
--    }
--
-  done:
- 
-   /* Confirm that we have been woken.  We do that before acquiring the mutex
--- 
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
deleted file mode 100644
index cb89431769..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From 6aab1191e35a3da66e8c49d95178a9d77c119a1f Mon Sep 17 00:00:00 2001
-From: Malte Skarupke <malteskarupke@fastmail.fm>
-Date: Mon, 16 Jun 2025 23:17:53 -0700
-Subject: [PATCH] nptl: Update comments and indentation for new condvar
- implementation
-
-Some comments were wrong after the most recent commit. This fixes that.
-Also fixing indentation where it was using spaces instead of tabs.
-
-The following commits have been cherry-picked from Glibc master branch:
-Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
-
-Upstream-Status: Backport
-[https://sourceware.org/git/?p=glibc.git;a=commit;h=0cc973160c23bb67f895bc887dd6942d29f8fee3]
-
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- nptl/pthread_cond_common.c |  5 +++--
- nptl/pthread_cond_wait.c   | 39 +++++++++++++++++++-------------------
- 2 files changed, 22 insertions(+), 22 deletions(-)
-
-diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
-index 8dd7037923..306a207dd6 100644
---- a/nptl/pthread_cond_common.c
-+++ b/nptl/pthread_cond_common.c
-@@ -221,8 +221,9 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
-      * New waiters arriving concurrently with the group switching will all go
-        into G2 until we atomically make the switch.  Waiters existing in G2
-        are not affected.
--     * Waiters in G1 will be closed out immediately by the advancing of
--       __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
-+     * Waiters in G1 have already received a signal and been woken. If they
-+       haven't woken yet, they will be closed out immediately by the advancing
-+       of __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
-        which will prevent waiters from blocking using a futex on
-        __g_signals since it provides enough signals for all possible
-        remaining waiters.  As a result, they can each consume a signal
-diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
-index 1cb3dbf7b0..cee1968756 100644
---- a/nptl/pthread_cond_wait.c
-+++ b/nptl/pthread_cond_wait.c
-@@ -249,7 +249,7 @@ __condvar_cleanup_waiting (void *arg)
-    figure out whether they are in a group that has already been completely
-    signaled (i.e., if the current G1 starts at a later position that the
-    waiter's position).  Waiters cannot determine whether they are currently
--   in G2 or G1 -- but they do not have too because all they are interested in
-+   in G2 or G1 -- but they do not have to because all they are interested in
-    is whether there are available signals, and they always start in G2 (whose
-    group slot they know because of the bit in the waiter sequence.  Signalers
-    will simply fill the right group until it is completely signaled and can
-@@ -412,7 +412,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
-     }
- 
-   /* Now wait until a signal is available in our group or it is closed.
--     Acquire MO so that if we observe a value of zero written after group
-+     Acquire MO so that if we observe (signals == lowseq) after group
-      switching in __condvar_quiesce_and_switch_g1, we synchronize with that
-      store and will see the prior update of __g1_start done while switching
-      groups too.  */
-@@ -422,8 +422,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
-     {
-       while (1)
- 	{
--          uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
--          unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
-+	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
-+	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
- 
- 	  /* Spin-wait first.
- 	     Note that spinning first without checking whether a timeout
-@@ -447,21 +447,21 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
- 
- 	      /* Reload signals.  See above for MO.  */
- 	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
--              g1_start = __condvar_load_g1_start_relaxed (cond);
--              lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
-+	      g1_start = __condvar_load_g1_start_relaxed (cond);
-+	      lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
- 	      spin--;
- 	    }
- 
--          if (seq < (g1_start >> 1))
-+	  if (seq < (g1_start >> 1))
- 	    {
--              /* If the group is closed already,
-+	      /* If the group is closed already,
- 	         then this waiter originally had enough extra signals to
- 	         consume, up until the time its group was closed.  */
- 	       goto done;
--            }
-+	    }
- 
- 	  /* If there is an available signal, don't block.
--             If __g1_start has advanced at all, then we must be in G1
-+	     If __g1_start has advanced at all, then we must be in G1
- 	     by now, perhaps in the process of switching back to an older
- 	     G2, but in either case we're allowed to consume the available
- 	     signal and should not block anymore.  */
-@@ -483,22 +483,23 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
- 	     sequence.  */
- 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
- 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
--          g1_start = __condvar_load_g1_start_relaxed (cond);
--          lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
-+	  g1_start = __condvar_load_g1_start_relaxed (cond);
-+	  lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
- 
--          if (seq < (g1_start >> 1))
-+	  if (seq < (g1_start >> 1))
- 	    {
--              /* group is closed already, so don't block */
-+	      /* group is closed already, so don't block */
- 	      __condvar_dec_grefs (cond, g, private);
- 	      goto done;
- 	    }
- 
- 	  if ((int)(signals - lowseq) >= 2)
- 	    {
--	      /* a signal showed up or G1/G2 switched after we grabbed the refcount */
-+	      /* a signal showed up or G1/G2 switched after we grabbed the
-+	         refcount */
- 	      __condvar_dec_grefs (cond, g, private);
- 	      break;
--            }
-+	    }
- 
- 	  // Now block.
- 	  struct _pthread_cleanup_buffer buffer;
-@@ -536,10 +537,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
-        if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
- 	 goto done;
-     }
--  /* Try to grab a signal.  Use acquire MO so that we see an up-to-date value
--     of __g1_start below (see spinning above for a similar case).  In
--     particular, if we steal from a more recent group, we will also see a
--     more recent __g1_start below.  */
-+  /* Try to grab a signal.  See above for MO.  (if we do another loop
-+     iteration we need to see the correct value of g1_start)  */
-   while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
- 						&signals, signals - 2));
- 
--- 
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
deleted file mode 100644
index 4cfcca846c..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 28a5082045429fdc5a4744d45fdc5b5202528eaa Mon Sep 17 00:00:00 2001
-From: Malte Skarupke <malteskarupke@fastmail.fm>
-Date: Mon, 16 Jun 2025 23:29:49 -0700
-Subject: [PATCH] nptl: Remove unnecessary catch-all-wake in condvar group
- switch
-
-This wake is unnecessary. We only switch groups after every sleeper in a group
-has been woken. Sure, they may take a while to actually wake up and may still
-hold a reference, but waking them a second time doesn't speed that up. Instead
-this just makes the code more complicated and may hide problems.
-
-In particular this safety wake wouldn't even have helped with the bug that was
-fixed by Barrus' patch: The bug there was that pthread_cond_signal would not
-switch g1 when it should, so we wouldn't even have entered this code path.
-
-The following commits have been cherry-picked from Glibc master branch:
-Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
-
-Upstream-Status: Backport
-[https://sourceware.org/git/?p=glibc.git;a=commit;h=b42cc6af11062c260c7dfa91f1c89891366fed3e]
-
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- nptl/pthread_cond_common.c | 30 +-----------------------------
- 1 file changed, 1 insertion(+), 29 deletions(-)
-
-diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
-index 306a207dd6..f976a533a1 100644
---- a/nptl/pthread_cond_common.c
-+++ b/nptl/pthread_cond_common.c
-@@ -221,13 +221,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
-      * New waiters arriving concurrently with the group switching will all go
-        into G2 until we atomically make the switch.  Waiters existing in G2
-        are not affected.
--     * Waiters in G1 have already received a signal and been woken. If they
--       haven't woken yet, they will be closed out immediately by the advancing
--       of __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
--       which will prevent waiters from blocking using a futex on
--       __g_signals since it provides enough signals for all possible
--       remaining waiters.  As a result, they can each consume a signal
--       and they will eventually remove their group reference.  */
-+     * Waiters in G1 have already received a signal and been woken.  */
- 
-   /* Update __g1_start, which finishes closing this group.  The value we add
-      will never be negative because old_orig_size can only be zero when we
-@@ -240,28 +234,6 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
- 
-   unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
- 
--  /* If any waiters still hold group references (and thus could be blocked),
--     then wake them all up now and prevent any running ones from blocking.
--     This is effectively a catch-all for any possible current or future
--     bugs that can allow the group size to reach 0 before all G1 waiters
--     have been awakened or at least given signals to consume, or any
--     other case that can leave blocked (or about to block) older waiters..  */
--  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) > 0)
--   {
--    /* First advance signals to the end of the group (i.e. enough signals
--       for the entire G1 group) to ensure that waiters which have not
--       yet blocked in the futex will not block.
--       Note that in the vast majority of cases, this should never
--       actually be necessary, since __g_signals will have enough
--       signals for the remaining g_refs waiters.  As an optimization,
--       we could check this first before proceeding, although that
--       could still leave the potential for futex lost wakeup bugs
--       if the signal count was non-zero but the futex wakeup
--       was somehow lost.  */
--    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
--
--    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
--   }
-   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
-      No old waiter can neither grab a signal nor acquire a reference without
-      noticing that __g1_start is larger.
--- 
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
deleted file mode 100644
index f8674d62ae..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 16b9af737c77b153fca4f36cbdbe94f7416c0b42 Mon Sep 17 00:00:00 2001
-From: Malte Skarupke <malteskarupke@fastmail.fm>
-Date: Mon, 16 Jun 2025 23:38:40 -0700
-Subject: [PATCH] nptl: Remove unnecessary quadruple check in pthread_cond_wait
-
-pthread_cond_wait was checking whether it was in a closed group no less than
-four times. Checking once is enough. Here are the four checks:
-
-1. While spin-waiting. This was dead code: maxspin is set to 0 and has been
-   for years.
-2. Before deciding to go to sleep, and before incrementing grefs: I kept this
-3. After incrementing grefs. There is no reason to think that the group would
-   close while we do an atomic increment. Obviously it could close at any
-   point, but that doesn't mean we have to recheck after every step. This
-   check was equally good as check 2, except it has to do more work.
-4. When we find ourselves in a group that has a signal. We only get here after
-   we check that we're not in a closed group. There is no need to check again.
-   The check would only have helped in cases where the compare_exchange in the
-   next line would also have failed. Relying on the compare_exchange is fine.
-
-Removing the duplicate checks clarifies the code.
-
-The following commits have been cherry-picked from Glibc master branch:
-Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
-
-Upstream-Status: Backport
-[https://sourceware.org/git/?p=glibc.git;a=commit;h=4f7b051f8ee3feff1b53b27a906f245afaa9cee1]
-
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- nptl/pthread_cond_wait.c | 49 ----------------------------------------
- 1 file changed, 49 deletions(-)
-
-diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
-index cee1968756..47e834cade 100644
---- a/nptl/pthread_cond_wait.c
-+++ b/nptl/pthread_cond_wait.c
-@@ -366,7 +366,6 @@ static __always_inline int
- __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
-     clockid_t clockid, const struct __timespec64 *abstime)
- {
--  const int maxspin = 0;
-   int err;
-   int result = 0;
- 
-@@ -425,33 +424,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
- 	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
- 	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
- 
--	  /* Spin-wait first.
--	     Note that spinning first without checking whether a timeout
--	     passed might lead to what looks like a spurious wake-up even
--	     though we should return ETIMEDOUT (e.g., if the caller provides
--	     an absolute timeout that is clearly in the past).  However,
--	     (1) spurious wake-ups are allowed, (2) it seems unlikely that a
--	     user will (ab)use pthread_cond_wait as a check for whether a
--	     point in time is in the past, and (3) spinning first without
--	     having to compare against the current time seems to be the right
--	     choice from a performance perspective for most use cases.  */
--	  unsigned int spin = maxspin;
--	  while (spin > 0 && ((int)(signals - lowseq) < 2))
--	    {
--	      /* Check that we are not spinning on a group that's already
--		 closed.  */
--	      if (seq < (g1_start >> 1))
--		break;
--
--	      /* TODO Back off.  */
--
--	      /* Reload signals.  See above for MO.  */
--	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
--	      g1_start = __condvar_load_g1_start_relaxed (cond);
--	      lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
--	      spin--;
--	    }
--
- 	  if (seq < (g1_start >> 1))
- 	    {
- 	      /* If the group is closed already,
-@@ -482,24 +454,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
- 	     an atomic read-modify-write operation and thus extend the release
- 	     sequence.  */
- 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
--	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
--	  g1_start = __condvar_load_g1_start_relaxed (cond);
--	  lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
--
--	  if (seq < (g1_start >> 1))
--	    {
--	      /* group is closed already, so don't block */
--	      __condvar_dec_grefs (cond, g, private);
--	      goto done;
--	    }
--
--	  if ((int)(signals - lowseq) >= 2)
--	    {
--	      /* a signal showed up or G1/G2 switched after we grabbed the
--	         refcount */
--	      __condvar_dec_grefs (cond, g, private);
--	      break;
--	    }
- 
- 	  // Now block.
- 	  struct _pthread_cleanup_buffer buffer;
-@@ -533,9 +487,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
- 	  /* Reload signals.  See above for MO.  */
- 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
- 	}
--
--       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
--	 goto done;
-     }
-   /* Try to grab a signal.  See above for MO.  (if we do another loop
-      iteration we need to see the correct value of g1_start)  */
--- 
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
deleted file mode 100644
index 16fe6f8460..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From d9ffb50dc55f77e584a5d0275eea758c7a6b04e3 Mon Sep 17 00:00:00 2001
-From: Malte Skarupke <malteskarupke@fastmail.fm>
-Date: Mon, 16 Jun 2025 23:53:35 -0700
-Subject: [PATCH] nptl: Use a single loop in pthread_cond_wait instaed of a
- nested loop
-
-The loop was a little more complicated than necessary. There was only one
-break statement out of the inner loop, and the outer loop was nearly empty.
-So just remove the outer loop, moving its code to the one break statement in
-the inner loop. This allows us to replace all gotos with break statements.
-
-The following commits have been cherry-picked from Glibc master branch:
-Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
-
-Upstream-Status: Backport
-[https://sourceware.org/git/?p=glibc.git;a=commit;h=929a4764ac90382616b6a21f099192b2475da674]
-
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- nptl/pthread_cond_wait.c | 41 +++++++++++++++++++---------------------
- 1 file changed, 19 insertions(+), 22 deletions(-)
-
-diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
-index 47e834cade..5c86880105 100644
---- a/nptl/pthread_cond_wait.c
-+++ b/nptl/pthread_cond_wait.c
-@@ -410,17 +410,15 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
-       return err;
-     }
- 
--  /* Now wait until a signal is available in our group or it is closed.
--     Acquire MO so that if we observe (signals == lowseq) after group
--     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
--     store and will see the prior update of __g1_start done while switching
--     groups too.  */
--  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
--
--  do
--    {
-+
-       while (1)
- 	{
-+	  /* Now wait until a signal is available in our group or it is closed.
-+	     Acquire MO so that if we observe (signals == lowseq) after group
-+	     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
-+	     store and will see the prior update of __g1_start done while switching
-+	     groups too.  */
-+	  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
- 	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
- 	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
- 
-@@ -429,7 +427,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
- 	      /* If the group is closed already,
- 	         then this waiter originally had enough extra signals to
- 	         consume, up until the time its group was closed.  */
--	       goto done;
-+	       break;
- 	    }
- 
- 	  /* If there is an available signal, don't block.
-@@ -438,8 +436,16 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
- 	     G2, but in either case we're allowed to consume the available
- 	     signal and should not block anymore.  */
- 	  if ((int)(signals - lowseq) >= 2)
--	    break;
--
-+           {
-+             /* Try to grab a signal.  See above for MO.  (if we do another loop
-+                iteration we need to see the correct value of g1_start)  */
-+                     if (atomic_compare_exchange_weak_acquire (
-+                               cond->__data.__g_signals + g,
-+                       &signals, signals - 2))
-+                       break;
-+                     else
-+                       continue;
-+           }
- 	  /* No signals available after spinning, so prepare to block.
- 	     We first acquire a group reference and use acquire MO for that so
- 	     that we synchronize with the dummy read-modify-write in
-@@ -479,21 +485,12 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
- 		 the lock during cancellation is not possible.  */
- 	      __condvar_cancel_waiting (cond, seq, g, private);
- 	      result = err;
--	      goto done;
-+	      break;
- 	    }
- 	  else
- 	    __condvar_dec_grefs (cond, g, private);
- 
--	  /* Reload signals.  See above for MO.  */
--	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
- 	}
--    }
--  /* Try to grab a signal.  See above for MO.  (if we do another loop
--     iteration we need to see the correct value of g1_start)  */
--  while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
--						&signals, signals - 2));
--
-- done:
- 
-   /* Confirm that we have been woken.  We do that before acquiring the mutex
-      to allow for execution of pthread_cond_destroy while having acquired the
--- 
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
deleted file mode 100644
index cf87e21ddd..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From a2faee6d0dac6e5232255da9afda4d9ed6cfb6e5 Mon Sep 17 00:00:00 2001
-From: Malte Skarupke <malteskarupke@fastmail.fm>
-Date: Tue, 17 Jun 2025 01:37:12 -0700
-Subject: [PATCH] nptl: Fix indentation
-
-In my previous change I turned a nested loop into a simple loop. I'm doing
-the resulting indentation changes in a separate commit to make the diff on
-the previous commit easier to review.
-
-The following commits have been cherry-picked from Glibc master branch:
-Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
-
-Upstream-Status: Backport
-[https://sourceware.org/git/?p=glibc.git;a=commit;h=ee6c14ed59d480720721aaacc5fb03213dc153da]
-
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- nptl/pthread_cond_wait.c | 132 ++++++++++++++++-----------------------
- 1 file changed, 54 insertions(+), 78 deletions(-)
-
-diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
-index 5c86880105..104ebd48ca 100644
---- a/nptl/pthread_cond_wait.c
-+++ b/nptl/pthread_cond_wait.c
-@@ -410,87 +410,63 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
-       return err;
-     }
- 
--
--      while (1)
--	{
--	  /* Now wait until a signal is available in our group or it is closed.
--	     Acquire MO so that if we observe (signals == lowseq) after group
--	     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
--	     store and will see the prior update of __g1_start done while switching
--	     groups too.  */
--	  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
--	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
--	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
--
--	  if (seq < (g1_start >> 1))
--	    {
--	      /* If the group is closed already,
--	         then this waiter originally had enough extra signals to
--	         consume, up until the time its group was closed.  */
--	       break;
--	    }
--
--	  /* If there is an available signal, don't block.
--	     If __g1_start has advanced at all, then we must be in G1
--	     by now, perhaps in the process of switching back to an older
--	     G2, but in either case we're allowed to consume the available
--	     signal and should not block anymore.  */
--	  if ((int)(signals - lowseq) >= 2)
--           {
--             /* Try to grab a signal.  See above for MO.  (if we do another loop
--                iteration we need to see the correct value of g1_start)  */
--                     if (atomic_compare_exchange_weak_acquire (
--                               cond->__data.__g_signals + g,
-+  while (1)
-+    {
-+      /* Now wait until a signal is available in our group or it is closed.
-+         Acquire MO so that if we observe (signals == lowseq) after group
-+         switching in __condvar_quiesce_and_switch_g1, we synchronize with that
-+         store and will see the prior update of __g1_start done while switching
-+         groups too.  */
-+      unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
-+      uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
-+      unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
-+
-+      if (seq < (g1_start >> 1))
-+        {
-+          /* If the group is closed already,
-+             then this waiter originally had enough extra signals to
-+             consume, up until the time its group was closed.  */
-+           break;
-+        }
-+
-+      /* If there is an available signal, don't block.
-+         If __g1_start has advanced at all, then we must be in G1
-+         by now, perhaps in the process of switching back to an older
-+         G2, but in either case we're allowed to consume the available
-+         signal and should not block anymore.  */
-+      if ((int)(signals - lowseq) >= 2)
-+        {
-+         /* Try to grab a signal.  See above for MO.  (if we do another loop
-+            iteration we need to see the correct value of g1_start)  */
-+           if (atomic_compare_exchange_weak_acquire (
-+                       cond->__data.__g_signals + g,
-                        &signals, signals - 2))
--                       break;
--                     else
--                       continue;
--           }
--	  /* No signals available after spinning, so prepare to block.
--	     We first acquire a group reference and use acquire MO for that so
--	     that we synchronize with the dummy read-modify-write in
--	     __condvar_quiesce_and_switch_g1 if we read from that.  In turn,
--	     in this case this will make us see the advancement of __g_signals
--	     to the upcoming new g1_start that occurs with a concurrent
--	     attempt to reuse the group's slot.
--	     We use acquire MO for the __g_signals check to make the
--	     __g1_start check work (see spinning above).
--	     Note that the group reference acquisition will not mask the
--	     release MO when decrementing the reference count because we use
--	     an atomic read-modify-write operation and thus extend the release
--	     sequence.  */
--	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
--
--	  // Now block.
--	  struct _pthread_cleanup_buffer buffer;
--	  struct _condvar_cleanup_buffer cbuffer;
--	  cbuffer.wseq = wseq;
--	  cbuffer.cond = cond;
--	  cbuffer.mutex = mutex;
--	  cbuffer.private = private;
--	  __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
--
--	  err = __futex_abstimed_wait_cancelable64 (
--	    cond->__data.__g_signals + g, signals, clockid, abstime, private);
--
--	  __pthread_cleanup_pop (&buffer, 0);
--
--	  if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
--	    {
--	      __condvar_dec_grefs (cond, g, private);
--	      /* If we timed out, we effectively cancel waiting.  Note that
--		 we have decremented __g_refs before cancellation, so that a
--		 deadlock between waiting for quiescence of our group in
--		 __condvar_quiesce_and_switch_g1 and us trying to acquire
--		 the lock during cancellation is not possible.  */
--	      __condvar_cancel_waiting (cond, seq, g, private);
--	      result = err;
- 	      break;
--	    }
--	  else
--	    __condvar_dec_grefs (cond, g, private);
--
-+	   else
-+	      continue;
- 	}
-+      // Now block.
-+      struct _pthread_cleanup_buffer buffer;
-+      struct _condvar_cleanup_buffer cbuffer;
-+      cbuffer.wseq = wseq;
-+      cbuffer.cond = cond;
-+      cbuffer.mutex = mutex;
-+      cbuffer.private = private;
-+      __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
-+
-+      err = __futex_abstimed_wait_cancelable64 (
-+        cond->__data.__g_signals + g, signals, clockid, abstime, private);
-+
-+      __pthread_cleanup_pop (&buffer, 0);
-+
-+      if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
-+        {
-+          /* If we timed out, we effectively cancel waiting.  */
-+          __condvar_cancel_waiting (cond, seq, g, private);
-+          result = err;
-+          break;
-+        }
-+    }
- 
-   /* Confirm that we have been woken.  We do that before acquiring the mutex
-      to allow for execution of pthread_cond_destroy while having acquired the
--- 
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
deleted file mode 100644
index a9e9cc7c48..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-From 2a601ac9041e2ca645acad2c174b1c545cfceafe Mon Sep 17 00:00:00 2001
-From: Malte Skarupke <malteskarupke@fastmail.fm>
-Date: Tue, 17 Jun 2025 01:53:25 -0700
-Subject: [PATCH] nptl: rename __condvar_quiesce_and_switch_g1
-
-This function no longer waits for threads to leave g1, so rename it to
-__condvar_switch_g1
-
-The following commits have been cherry-picked from Glibc master branch:
-Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
-
-Upstream-Status: Backport
-[https://sourceware.org/git/?p=glibc.git;a=commit;h=4b79e27a5073c02f6bff9aa8f4791230a0ab1867]
-
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- nptl/pthread_cond_broadcast.c |  4 ++--
- nptl/pthread_cond_common.c    | 26 ++++++++++++--------------
- nptl/pthread_cond_signal.c    | 17 ++++++++---------
- nptl/pthread_cond_wait.c      |  9 ++++-----
- 4 files changed, 26 insertions(+), 30 deletions(-)
-
-diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast.c
-index 5ae141ac81..a07435589a 100644
---- a/nptl/pthread_cond_broadcast.c
-+++ b/nptl/pthread_cond_broadcast.c
-@@ -60,7 +60,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
- 				cond->__data.__g_size[g1] << 1);
-       cond->__data.__g_size[g1] = 0;
- 
--      /* We need to wake G1 waiters before we quiesce G1 below.  */
-+      /* We need to wake G1 waiters before we switch G1 below.  */
-       /* TODO Only set it if there are indeed futex waiters.  We could
- 	 also try to move this out of the critical section in cases when
- 	 G2 is empty (and we don't need to quiesce).  */
-@@ -69,7 +69,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
- 
-   /* G1 is complete.  Step (2) is next unless there are no waiters in G2, in
-      which case we can stop.  */
--  if (__condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
-+  if (__condvar_switch_g1 (cond, wseq, &g1, private))
-     {
-       /* Step (3): Send signals to all waiters in the old G2 / new G1.  */
-       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
-diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
-index f976a533a1..3baac4dabc 100644
---- a/nptl/pthread_cond_common.c
-+++ b/nptl/pthread_cond_common.c
-@@ -189,16 +189,15 @@ __condvar_get_private (int flags)
-     return FUTEX_SHARED;
- }
- 
--/* This closes G1 (whose index is in G1INDEX), waits for all futex waiters to
--   leave G1, converts G1 into a fresh G2, and then switches group roles so that
--   the former G2 becomes the new G1 ending at the current __wseq value when we
--   eventually make the switch (WSEQ is just an observation of __wseq by the
--   signaler).
-+/* This closes G1 (whose index is in G1INDEX), converts G1 into a fresh G2,
-+   and then switches group roles so that the former G2 becomes the new G1
-+   ending at the current __wseq value when we eventually make the switch
-+   (WSEQ is just an observation of __wseq by the signaler).
-    If G2 is empty, it will not switch groups because then it would create an
-    empty G1 which would require switching groups again on the next signal.
-    Returns false iff groups were not switched because G2 was empty.  */
- static bool __attribute__ ((unused))
--__condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
-+__condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
-     unsigned int *g1index, int private)
- {
-   unsigned int g1 = *g1index;
-@@ -214,8 +213,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
- 	  + cond->__data.__g_size[g1 ^ 1]) == 0)
- 	return false;
- 
--  /* Now try to close and quiesce G1.  We have to consider the following kinds
--     of waiters:
-+  /* We have to consider the following kinds of waiters:
-      * Waiters from less recent groups than G1 are not affected because
-        nothing will change for them apart from __g1_start getting larger.
-      * New waiters arriving concurrently with the group switching will all go
-@@ -223,12 +221,12 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
-        are not affected.
-      * Waiters in G1 have already received a signal and been woken.  */
- 
--  /* Update __g1_start, which finishes closing this group.  The value we add
--     will never be negative because old_orig_size can only be zero when we
--     switch groups the first time after a condvar was initialized, in which
--     case G1 will be at index 1 and we will add a value of 1.
--     Relaxed MO is fine because the change comes with no additional
--     constraints that others would have to observe.  */
-+  /* Update __g1_start, which closes this group.  The value we add will never
-+     be negative because old_orig_size can only be zero when we switch groups
-+     the first time after a condvar was initialized, in which case G1 will be
-+     at index 1 and we will add a value of 1. Relaxed MO is fine because the
-+     change comes with no additional constraints that others would have to
-+     observe.  */
-   __condvar_add_g1_start_relaxed (cond,
-       (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
- 
-diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
-index 14800ba00b..a9bc10dcca 100644
---- a/nptl/pthread_cond_signal.c
-+++ b/nptl/pthread_cond_signal.c
-@@ -69,18 +69,17 @@ ___pthread_cond_signal (pthread_cond_t *cond)
-   bool do_futex_wake = false;
- 
-   /* If G1 is still receiving signals, we put the signal there.  If not, we
--     check if G2 has waiters, and if so, quiesce and switch G1 to the former
--     G2; if this results in a new G1 with waiters (G2 might have cancellations
--     already, see __condvar_quiesce_and_switch_g1), we put the signal in the
--     new G1.  */
-+     check if G2 has waiters, and if so, switch G1 to the former G2; if this
-+     results in a new G1 with waiters (G2 might have cancellations already,
-+     see __condvar_switch_g1), we put the signal in the new G1. */
-   if ((cond->__data.__g_size[g1] != 0)
--      || __condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
-+      || __condvar_switch_g1 (cond, wseq, &g1, private))
-     {
-       /* Add a signal.  Relaxed MO is fine because signaling does not need to
--	 establish a happens-before relation (see above).  We do not mask the
--	 release-MO store when initializing a group in
--	 __condvar_quiesce_and_switch_g1 because we use an atomic
--	 read-modify-write and thus extend that store's release sequence.  */
-+         establish a happens-before relation (see above).  We do not mask the
-+         release-MO store when initializing a group in __condvar_switch_g1
-+         because we use an atomic read-modify-write and thus extend that
-+         store's release sequence.  */
-       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
-       cond->__data.__g_size[g1]--;
-       /* TODO Only set it if there are indeed futex waiters.  */
-diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
-index 104ebd48ca..bb46f3605d 100644
---- a/nptl/pthread_cond_wait.c
-+++ b/nptl/pthread_cond_wait.c
-@@ -382,8 +382,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
-      because we do not need to establish any happens-before relation with
-      signalers (see __pthread_cond_signal); modification order alone
-      establishes a total order of waiters/signals.  We do need acquire MO
--     to synchronize with group reinitialization in
--     __condvar_quiesce_and_switch_g1.  */
-+     to synchronize with group reinitialization in __condvar_switch_g1.  */
-   uint64_t wseq = __condvar_fetch_add_wseq_acquire (cond, 2);
-   /* Find our group's index.  We always go into what was G2 when we acquired
-      our position.  */
-@@ -414,9 +413,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
-     {
-       /* Now wait until a signal is available in our group or it is closed.
-          Acquire MO so that if we observe (signals == lowseq) after group
--         switching in __condvar_quiesce_and_switch_g1, we synchronize with that
--         store and will see the prior update of __g1_start done while switching
--         groups too.  */
-+         switching in __condvar_switch_g1, we synchronize with that store and
-+         will see the prior update of __g1_start done while switching groups
-+         too.  */
-       unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
-       uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
-       unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
--- 
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
deleted file mode 100644
index 8ea0c784ef..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-From fc074de88796eb2036fbe9bade638e00adfd5cb2 Mon Sep 17 00:00:00 2001
-From: Malte Skarupke <malteskarupke@fastmail.fm>
-Date: Tue, 17 Jun 2025 02:08:36 -0700
-Subject: [PATCH] nptl: Use all of g1_start and g_signals
-
-The LSB of g_signals was unused. The LSB of g1_start was used to indicate
-which group is G2. This was used to always go to sleep in pthread_cond_wait
-if a waiter is in G2. A comment earlier in the file says that this is not
-correct to do:
-
- "Waiters cannot determine whether they are currently in G2 or G1 -- but they
-  do not have to because all they are interested in is whether there are
-  available signals"
-
-I either would have had to update the comment, or get rid of the check. I
-chose to get rid of the check. In fact I don't quite know why it was there.
-There will never be available signals for group G2, so we didn't need the
-special case. Even if there were, this would just be a spurious wake. This
-might have caught some cases where the count has wrapped around, but it
-wouldn't reliably do that, (and even if it did, why would you want to force a
-sleep in that case?) and we don't support that many concurrent waiters
-anyway. Getting rid of it allows us to use one more bit, making us more
-robust to wraparound.
-
-The following commits have been cherry-picked from Glibc master branch:
-Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
-
-Upstream-Status: Backport
-[https://sourceware.org/git/?p=glibc.git;a=commit;h=91bb902f58264a2fd50fbce8f39a9a290dd23706]
-
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- nptl/pthread_cond_broadcast.c |  4 ++--
- nptl/pthread_cond_common.c    | 26 ++++++++++----------------
- nptl/pthread_cond_signal.c    |  2 +-
- nptl/pthread_cond_wait.c      | 14 +++++---------
- 4 files changed, 18 insertions(+), 28 deletions(-)
-
-diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast.c
-index a07435589a..ef0943cdc5 100644
---- a/nptl/pthread_cond_broadcast.c
-+++ b/nptl/pthread_cond_broadcast.c
-@@ -57,7 +57,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
-     {
-       /* Add as many signals as the remaining size of the group.  */
-       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
--				cond->__data.__g_size[g1] << 1);
-+				cond->__data.__g_size[g1]);
-       cond->__data.__g_size[g1] = 0;
- 
-       /* We need to wake G1 waiters before we switch G1 below.  */
-@@ -73,7 +73,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
-     {
-       /* Step (3): Send signals to all waiters in the old G2 / new G1.  */
-       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
--				cond->__data.__g_size[g1] << 1);
-+				cond->__data.__g_size[g1]);
-       cond->__data.__g_size[g1] = 0;
-       /* TODO Only set it if there are indeed futex waiters.  */
-       do_futex_wake = true;
-diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
-index 3baac4dabc..e48f914321 100644
---- a/nptl/pthread_cond_common.c
-+++ b/nptl/pthread_cond_common.c
-@@ -208,9 +208,9 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
-      behavior.
-      Note that this works correctly for a zero-initialized condvar too.  */
-   unsigned int old_orig_size = __condvar_get_orig_size (cond);
--  uint64_t old_g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
--  if (((unsigned) (wseq - old_g1_start - old_orig_size)
--	  + cond->__data.__g_size[g1 ^ 1]) == 0)
-+  uint64_t old_g1_start = __condvar_load_g1_start_relaxed (cond);
-+  uint64_t new_g1_start = old_g1_start + old_orig_size;
-+  if (((unsigned) (wseq - new_g1_start) + cond->__data.__g_size[g1 ^ 1]) == 0)
- 	return false;
- 
-   /* We have to consider the following kinds of waiters:
-@@ -221,16 +221,10 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
-        are not affected.
-      * Waiters in G1 have already received a signal and been woken.  */
- 
--  /* Update __g1_start, which closes this group.  The value we add will never
--     be negative because old_orig_size can only be zero when we switch groups
--     the first time after a condvar was initialized, in which case G1 will be
--     at index 1 and we will add a value of 1. Relaxed MO is fine because the
--     change comes with no additional constraints that others would have to
--     observe.  */
--  __condvar_add_g1_start_relaxed (cond,
--      (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
--
--  unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
-+  /* Update __g1_start, which closes this group.  Relaxed MO is fine because
-+     the change comes with no additional constraints that others would have
-+     to observe.  */
-+  __condvar_add_g1_start_relaxed (cond, old_orig_size);
- 
-   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
-      No old waiter can neither grab a signal nor acquire a reference without
-@@ -242,13 +236,13 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
-   g1 ^= 1;
-   *g1index ^= 1;
- 
--  /* Now advance the new G1 g_signals to the new lowseq, giving it
-+  /* Now advance the new G1 g_signals to the new g1_start, giving it
-      an effective signal count of 0 to start.  */
--  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
-+  atomic_store_release (cond->__data.__g_signals + g1, (unsigned)new_g1_start);
- 
-   /* These values are just observed by signalers, and thus protected by the
-      lock.  */
--  unsigned int orig_size = wseq - (old_g1_start + old_orig_size);
-+  unsigned int orig_size = wseq - new_g1_start;
-   __condvar_set_orig_size (cond, orig_size);
-   /* Use and addition to not loose track of cancellations in what was
-      previously G2.  */
-diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
-index a9bc10dcca..07427369aa 100644
---- a/nptl/pthread_cond_signal.c
-+++ b/nptl/pthread_cond_signal.c
-@@ -80,7 +80,7 @@ ___pthread_cond_signal (pthread_cond_t *cond)
-          release-MO store when initializing a group in __condvar_switch_g1
-          because we use an atomic read-modify-write and thus extend that
-          store's release sequence.  */
--      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
-+      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 1);
-       cond->__data.__g_size[g1]--;
-       /* TODO Only set it if there are indeed futex waiters.  */
-       do_futex_wake = true;
-diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
-index bb46f3605d..430cbe8a35 100644
---- a/nptl/pthread_cond_wait.c
-+++ b/nptl/pthread_cond_wait.c
-@@ -84,7 +84,7 @@ __condvar_cancel_waiting (pthread_cond_t *cond, uint64_t seq, unsigned int g,
-      not hold a reference on the group.  */
-   __condvar_acquire_lock (cond, private);
- 
--  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
-+  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
-   if (g1_start > seq)
-     {
-       /* Our group is closed, so someone provided enough signals for it.
-@@ -278,7 +278,6 @@ __condvar_cleanup_waiting (void *arg)
-      * Waiters fetch-add while having acquire the mutex associated with the
-        condvar.  Signalers load it and fetch-xor it concurrently.
-    __g1_start: Starting position of G1 (inclusive)
--     * LSB is index of current G2.
-      * Modified by signalers while having acquired the condvar-internal lock
-        and observed concurrently by waiters.
-    __g1_orig_size: Initial size of G1
-@@ -299,11 +298,9 @@ __condvar_cleanup_waiting (void *arg)
-      * Reference count used by waiters concurrently with signalers that have
-        acquired the condvar-internal lock.
-    __g_signals: The number of signals that can still be consumed, relative to
--     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bits
--     31 to 1 of g1_start with the signal count added)
-+     the current g1_start.  (i.e. g1_start with the signal count added)
-      * Used as a futex word by waiters.  Used concurrently by waiters and
-        signalers.
--     * LSB is currently reserved and 0.
-    __g_size: Waiters remaining in this group (i.e., which have not been
-      signaled yet.
-      * Accessed by signalers and waiters that cancel waiting (both do so only
-@@ -418,9 +415,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
-          too.  */
-       unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
-       uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
--      unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
- 
--      if (seq < (g1_start >> 1))
-+      if (seq < g1_start)
-         {
-           /* If the group is closed already,
-              then this waiter originally had enough extra signals to
-@@ -433,13 +429,13 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
-          by now, perhaps in the process of switching back to an older
-          G2, but in either case we're allowed to consume the available
-          signal and should not block anymore.  */
--      if ((int)(signals - lowseq) >= 2)
-+      if ((int)(signals - (unsigned int)g1_start) > 0)
-         {
-          /* Try to grab a signal.  See above for MO.  (if we do another loop
-             iteration we need to see the correct value of g1_start)  */
-            if (atomic_compare_exchange_weak_acquire (
-                        cond->__data.__g_signals + g,
--                       &signals, signals - 2))
-+                       &signals, signals - 1))
- 	      break;
- 	   else
- 	      continue;
--- 
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 265dcb9129..ca7f630699 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -62,14 +62,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
-           file://0026-PR25847-1.patch \
-           file://0026-PR25847-2.patch \
-           file://0026-PR25847-3.patch \
-           file://0026-PR25847-4.patch \
-           file://0026-PR25847-5.patch \
-           file://0026-PR25847-6.patch \
-           file://0026-PR25847-7.patch \
-           file://0026-PR25847-8.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


