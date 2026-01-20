Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB65BD26283
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13349.1768933891865528401
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NIR0FHRC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K3qvfF2794329
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=; b=
	NIR0FHRCLBWWsUnOIdeaBnSTWUNyeQ1c7jRHXcyGr2wpwIAqpXAltpIi/nUGQdzX
	K9miZyiyUYw8yd+6tazdM6iu9NLYaC9XM0V/MoQshCMdWMiV2e3Zf5UF5Iyg4m8Y
	csakxO60b1o+nHwBC8pjijIVbLm657sDe3DgGtTQhYwLGdQ83row85fei2nv+NKa
	aRd8Clp6N7TA+OEcb/BK2aNShDm06RcK1FutobIAU7TaSTQL6/zOSGN8GcfAPMmV
	8Sru44ZHNtldzFqgb+2m8YpMUsEJDeoTThmigv5iArnDfwWDafFMCQjTOiUCAXNv
	ERY/E4T2T/rtoJsENDuYIw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013039.outbound.protection.outlook.com [40.93.196.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymukgyd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 18:31:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYcBlXhc5bY16HNY8noKJi6oprLyYVw1S6YgTaKtq00rcvrLR2G9pZLrgY7+Eq6nHYlVRyuKcIlqyern3+cX4JMQrMW47dn0JOv8Y4EnU0Dw7godQs2jysx+QmPnudGlq8KWQ+4llpZ+FI7nd2/HqrL9LfME79OOz0UjGeXla/KAqWNPsfkC4pfqmC9BOfRA0/EgXfjOtgN4c8uYSqRck7NEBtHghGzkmc21j5Km7+I/Sbi4AAaQgEJD5ZHcMK/4lvBYkxJ27KPaZ9W/CaotfkvIXSjs0lVpx/Jodc5guHW3xKoc9dS9yV1JWDE+KLCr4SkO07S+VAD3rTUhtNrn0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=;
 b=vA8E7MOkOD7J+tYje89KMg9VtBi3fam9jB2rCzGVttVd5XaOoJJrGiWcY7GHEHtCfDfQrAxETCnFLoNfabGK9Nt1L1HjYaTDsTEOUTupu3dTkRERszUc1yP9cC0Ev/QxAjgkkhJsTn567VnSLZBRshx5ED4iXLzn5/kmi/WPMd+P4XUe5tagGTGk7YaDn13itwlk0hstTd/hisjg3GrHMq4fqwUehc/bwnyCPv5qkqsoZw8BVQwAWuLQL/XXHuUQB6x0/QGEQfcyxKtMRxbOLntVYZF7xH/4Me9AbiHhfWLx1K3zh0hzQJJ9Hdxd63Ojwdu0m57eGpd1FX+p1bw9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:31:29 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:28 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 07/16] make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
Date: Tue, 20 Jan 2026 10:29:38 -0800
Message-ID: <20260120182947.857242-8-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: d60fc94b-c1ad-49d0-1647-08de5852205f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MHEp42iYtK4tFTgcHKc7FjgSfzM/GCZUdVWDK5qhI6UGhwSVi6t1XkeXSIGI?=
 =?us-ascii?Q?anv7UzF564KUo2EsP7+HKPAdKWONLbTkTZ1FBzcmU+SFC5aJzhdstF8ObcCn?=
 =?us-ascii?Q?Hawdk4wsw8X+H2lyk53wIa08TADjbMkq5ZAmXtizuCQT1SmbRMlEcQB/jIR1?=
 =?us-ascii?Q?VVfa2ihlcq1o6HXvgaBe9TvNv2781n60j5LSC+hakRmKwP49Xbd7jqM82ruM?=
 =?us-ascii?Q?9xuojckF2HpXOMVK1Mb4mXt4ojoAb3QVZBsTr1P3a7o5yKAk8+pQW6DNUw9F?=
 =?us-ascii?Q?83BLkGuth3JhlbZNkHkOJMiJqF5RNjOjKn5BMTGxnmoOiUZIeY3DsYmddi+9?=
 =?us-ascii?Q?K3neCrGACtkYhyEDFwEO/uaMsNlOcfzMpgZtmOb/KzeW/lo9ZAAqOizqiGab?=
 =?us-ascii?Q?lo7hCCVmMnM0H14bpclUUXfO66rQhcXfRSe3EnEZTMiAC1/w3Bd9AnmCHzCw?=
 =?us-ascii?Q?6/xjQ0Axb20e8VpVoW0CPD4M9E9MDeRucTMACFS+o8xdnIbh5iCsS1+g8hYD?=
 =?us-ascii?Q?XbGUDQTZ0YvjGpttVaRJApdW6GrWINt/4JovrcOct0e7lgsSUPoO9rve6XRP?=
 =?us-ascii?Q?nIEuspG2uueiXuLkbwJym7Zac57kNsfcQ6AA7MawMfxaQUBRZ7ogCdzX5vSv?=
 =?us-ascii?Q?zQ3NGg81QzdOyPcxS3UR2ctOcXhGh/un1G9yV9FkjVM+vTWI6X4kOf5Hwg8F?=
 =?us-ascii?Q?fqCUkfg6m0NSl5gAGm39XmDNdVO/lJm+Wa26Jfkd9vgZ95FsMsGYJFGVc5TD?=
 =?us-ascii?Q?y0tXawORIMxGS4JdGdKAE1w5o22pq2MnYyFvv62Zzjs5RSktNZsPYxHA5+lW?=
 =?us-ascii?Q?Kii+ZMom2ywPg2/Qf5WM7NNDE5mBOHx/pYAf4aRbiPBTlMQ9NwsRT2dUFtRf?=
 =?us-ascii?Q?n2WbVDmbkDB178oTal5G0L+McEZeWDDnLAbhwndfubnDr2M/ZEZTVWD4FJbc?=
 =?us-ascii?Q?ziDUwFGYFBs6t8XVse/W1IqxmpzkMJb6qi56O0ZTBnJoOfrXjyQo14Pp5vbO?=
 =?us-ascii?Q?VHEPitRMr4at7F7TI2pBE2jTPacP8rKm3Bok7rp0c8gulqwPg4jyzz8RHV3+?=
 =?us-ascii?Q?u3dlzRBY0+NJGuLKZKWVyaq33YUYzFlpeFRgAXbhZkLMm1RRvXNzWbDkuPq+?=
 =?us-ascii?Q?e/NdqQ2/BOKEroofwQdhAhHA1umEzjYvdQHQonXtafNE7rNBnt0IhaF1VG1r?=
 =?us-ascii?Q?nDO9Lkjn4JA79o+3PZEw2F0hHdhGlBKKcmUxTXsg6PpB/urwjYNLJNO+fhcW?=
 =?us-ascii?Q?LFtXqqYRpkmQYmc9PjokRy6cZ/aDFBv54RbTz/XDuFxTfKVuNq495QBd3mRu?=
 =?us-ascii?Q?pDH8yhL3/xs1+3GKsXYBGla6Hmfv/fXCDCLQc2JVK10svVA8kaTXC2JdIJku?=
 =?us-ascii?Q?72Ucd8lPZVuZtvUuyocxKGNXIYlZ8N0jThXZ8YoRgTRDkGN+PbBinHzPk24T?=
 =?us-ascii?Q?gwp+icIJkYxsKZxPVdKZsqe/5hUfLk4uE6qsVTcXlNOj6dDobopGonicfc1c?=
 =?us-ascii?Q?kjzPOJB35x0YjvCLLjvzuHdLpecFp7ruherq2nexVvqn+D5F3j9W61sbm50k?=
 =?us-ascii?Q?Vj9Xzl+PreuX6cj8BHUMsiqnN5qYqp0dyplrak0FPTq0O5mJ/H7QeT6GaF5V?=
 =?us-ascii?Q?RrYTupYm5orAXltlDq7kZMQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z0t21FSxFINecE1yUTPcku7Yl4ryddss+KJcKfhjHQvgqRmPJwEukdcY+Jz+?=
 =?us-ascii?Q?dJE2OFI/qAE/OaZJ8Vk8W3TJaJlJ6m9LA3bcyv86eY+os5LXLkfyRktUvnBE?=
 =?us-ascii?Q?8Bb49CRQZPTYwSa1yG5PRAW0omFzjaR3dYY9jLldFPFI+v/XT8IUS7kKTl7Y?=
 =?us-ascii?Q?S05hhfh+pEhPMq8MqTiKMJ0eQV1dOOQbKl0qky8m1l1me0mKyad60paH1SKQ?=
 =?us-ascii?Q?vq9gUzZW0c8rhtCKQJ/lJPe1xGoOAsPyyb6MK5MK4e1/ItUs0pBh9bEtsICk?=
 =?us-ascii?Q?haFalroy8HAYa2rcX4GZO/7W3zumuy43+sXMDRmcTp56bQu0fILlNwN2m27O?=
 =?us-ascii?Q?wZk2tAKxU4N5HyrVsfQ1tepKmUNbtntk9P2lVaDOFddZ9Ix5kUO6NppoBCE/?=
 =?us-ascii?Q?oQiEzXdBM0DZvuSlsFaOMupodyTdHGE+U60rvD8YOalnabEqeHhT5nD9OPex?=
 =?us-ascii?Q?D2RJTzRRqNGwduadob+0d2Btzshk+p5iJLzUXrzUUNdkzngmTONSGyH8ko3y?=
 =?us-ascii?Q?nWh9igAzZl62166skMBEGAam5Rbv/walXe3Mr1hds5zKiEoI4Zt8TwCo4rJL?=
 =?us-ascii?Q?fDXIH3R5iniWAvG/6EP9xk8hy+azEpDNrtzPWVuasOcZdAMNyP9Qe3JPVt9E?=
 =?us-ascii?Q?P/mxuSEdsmglohC0JUFD4ol2bYP3tUpbYppeno++gbgFjNZ7/gBWAWXK7hbx?=
 =?us-ascii?Q?+sTF8AI0nXzCnu2LASAPS+QbkZ4yRPokkPX+jj67jZrzWbrUgl2+1/bsdUki?=
 =?us-ascii?Q?Qe5yB3GIp4+8jrrqg77NOZcrdEDyUHO5e4ISOYXF50rLGqIwiYgX4VjCmEFN?=
 =?us-ascii?Q?W3tUBCJQNWwuky63RcW48yAdnfi8M98FdLjQGuCVcrLi25hv/5OjdsoT1k1x?=
 =?us-ascii?Q?LmqMRGCZ6p92grHWTKLDwmP5CcF0fTsKT1pxOxJJobeb8DcZqQRJH0ijSQM6?=
 =?us-ascii?Q?MpSJXPYpHSwo6+nn+V62PUEvXni5uoej4hqhBZgCIfO99mZrmHiQxQvzw8Im?=
 =?us-ascii?Q?ijZ9hsR99v9VEvITeFgzGhT+tBdOio2bf81K39AjVN7yqm8aCBlGWVGrXJLo?=
 =?us-ascii?Q?jlBVXpHG2fbDguY5aW0Di56CUWefW+LfkfwO2OHKEc63lIBlVeNF2b+FpT12?=
 =?us-ascii?Q?aptSd74RZCGULne1zi13lnK18FnZxZ2CKp8m/ngJ5Wx3hSqpCooG2RtLsmhW?=
 =?us-ascii?Q?qbHP1Cp9DRbQNAwc+3p8l+AB5JbQAJohUOfcVjt3tTGjiCmDZhnMV5lCuOjd?=
 =?us-ascii?Q?MJakUQVDfGJo/LzAFD3afU67bwCX7YMG5gy6Y/gLgafcJNBZB83vis9/f8B0?=
 =?us-ascii?Q?C2wtZtLF7Jf3v3vIomJCLcompeOcKVJXucwWBtSOGGFiOQOX8VW6JdSKJ8g/?=
 =?us-ascii?Q?a5G2XetuqE+X/v16t7+V3zMWLWkA0XNV/yFWrBHzFdOetj6f5crdwMsjZWro?=
 =?us-ascii?Q?cZax4LVnVCZ69AxUyGwe/SJwmn5weUoDGT0WSchotZuLV5m+5C6ImJocg3Z3?=
 =?us-ascii?Q?g8cezz1SDfZGw0sRLey9eUFac41M59hnzgU8uVnpdJve/CbUip2w3JQuYHtM?=
 =?us-ascii?Q?gqizgJHhVXorpHh/LpG4Frh0b3+v97mT25JlDktiwQIAi7C7kKLUXD90xDxq?=
 =?us-ascii?Q?NSoXeuF2JQ6Q+F7Wxc8/IMJF1f9//fnqrFYix9v6t+MiwnTplRhf+FZv+SGK?=
 =?us-ascii?Q?P7NSnjvmAyG9F9ok3aNtvU3Q47nDquboXC08T3lCgS6nxWg6XOixRyA5poWU?=
 =?us-ascii?Q?HUb0bO8aXFT5WszCF9y85sBy2S6Yx4o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60fc94b-c1ad-49d0-1647-08de5852205f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:28.7971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVZ9FRyPEPqtTSgQ9HoDv2znBMgKj6MKvZpzkOnf57uZVT/vN4ezUOd/faIHDUU0J2UG02dHeZg+TbvKIwz27GNJlh8yG+hVCnL0LP0Qw/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696fca02 cx=c_pps
 a=6Lt9nLqKXikdeYFJc2ep4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=KVLK08duqDOLNOE2CNUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xmzUKzC2QoRdEYU_JJ545IkIJmQwUMIn
X-Proofpoint-ORIG-GUID: 7txiUSsdy6HU2mCtkraU0xGzrGU6lEC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NCBTYWx0ZWRfX9aVRbjfdBLMs
 MgdNWQDySTfG3KozojkVQ12po3WGnYZTF1nqbPT6b65s0WgpsD5frMynPXOfrDSYtYRu9FCI6AR
 bLsqshm/GIb0WP8Ts9QPro/6Yn5c/0OXFkRxBW47vHUn2Edcxb2uCBbKFVHaxF/k1aownBRMRT8
 x7lZdXbgtzbtr8cWqx8Yg6gCD3E6CPD/Ju8AuAgt+MOa19CZilS2M7up5x37RUzqTxuqWVkhTdG
 PDqtmvZkcAY9qvVZLtqba7NbXxmIsCMRtd8aToigCAiBDjQSQzDmJKmBlwVJ+3oGlz3KufV20kV
 BF9MeRjWGli/GpnRvP5i6UVZGuToumhggtPOhECJVsotm7oLTsaRuhT1ifkXxTAjqONLuj5nlOx
 W92+H1Ao3eAVlEqZgs6JdIaomTNSVervFBHLypV46utUgNf+TJYYxcWQuBhc8ZAAvV+xsqBu1X0
 a615l86xSVtdPNroTHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229774

From: Harish Sadineni <Harish.Sadineni@windriver.com>

when compiling rust-out-of-tree module recipe 'make-mod-scripts' failing
with the following error:

HOSTRUSTC scripts/generate_rust_target
error: Unrecognized option: 'i'

This issue occurs because CFLAGS are being passed to HOSTRUSTC.
Updated the flags in the make-mod-scripts recipe to align with
the flags used by linux-yocto.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 8fcb5e6eb3..874e16e642 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -18,7 +18,7 @@ DEV_PKG_DEPENDENCY = ""
 DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
 KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-- 
2.49.0


