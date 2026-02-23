Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EDBEA4FB3
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 11:50:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33464.1771847451961500458
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 03:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WO2a+mAd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6514e20505=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NBBTTo3172002
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 11:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=A+4iwy9Qu
	7lZrD7Oue0IfBNxlQUOY++AzPnZ+RvDV4U=; b=WO2a+mAdyHmg23bjie6ZfzjOY
	tlwKspDbMCHMAFgW48d9N27/YjtcQJge+Wk9Jmr/3hrYoy/ATXxsDxWyPWsRU7/u
	nRGxnBSI1kk/NUHvNxSVorYD4FkwEyvuX8BdC3UZkLM8FwCZwj9H1tibkkeBmwWp
	ExOsHWHw9iGDuImW67WuaGRhSyRDOMY7dhLL6AFDuurkehYTEIAy5qLVf5kS64jG
	XAKr45Z8v1XzKrvKH1OiiYeQf+1/DOkXvetTZidPASD2hbQlKeRQzePZsVrxMB/Z
	ElEwIg01AJAc18Md/A/mRBVK0kL/qumJLra6mVFo4xGjqHVqJ4DuovqKHCOiA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012019.outbound.protection.outlook.com [52.101.48.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf3p49nrk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 11:50:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioQ9A3SXGcDC+GJ8lbkDR+0kPTNbZamVucl8HTaiisN16n1ItHnIgyQ4WetWIZ9ed/40W3P1VA+4gURf7RYhTpbiQ+qTPzwQIq/UHeX7E3/Aah4YVzfXYbm+QdC/r9aUDdDeySS+CP/qcR88pbuexQG7hhhQPcK/UCWHoaSCcqnA583xCUeMXgaWMnv8uWGp40CQjXvbOzW0lPp3CybF2CNyH6B8WSZAfkrB2hrZ4upqTJV73gz2WFX0PfdYjFKmnNsY/vEKKKjEccF2kCuURGQ4NCbAQAibTwmm0dUO3rXFAu0yzXlMG7BsRAHOlmdjPnDzBgjUHkrBqnGXpSj62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+4iwy9Qu7lZrD7Oue0IfBNxlQUOY++AzPnZ+RvDV4U=;
 b=l6S/P+iG6vGcdAFGLzVoWxToV2dxvE5iMzjkHaT34P4ODi/uNRGP56wRxKDJoQuKWWSNzaK72bvVoot9TQgUzRYSzw04jxYJbeRkRjwq8Pm3aPMNKkET34qrkWl4zlTKNvpshuegYfKMVMXh3EQSJ1JJiqTBdrrj0y2rFBLBC1+U8KtBfDOMNIdJ5YSZl/LgsEm7g8jmvzl9PAq/8c66YkaAFn1uiyuITxlfvmHE1mYGpzbFepiMEVU9JpeYlaIs1FfvABF1OXUnXb045m3YYO1g9p0REATLWXHod0jw8sR3NTxtVIYXK9bGsu4L6fTdU651hZApekk51MKSsZiZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 MN2PR11MB4566.namprd11.prod.outlook.com (2603:10b6:208:24e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 11:50:47 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 11:50:47 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: sunilkumar.dora@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH V3] gdb: Upgrade 16.3 -> 17.1
Date: Mon, 23 Feb 2026 03:50:32 -0800
Message-ID: <20260223115033.18066-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::10) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|MN2PR11MB4566:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba7d2c0-b41f-482a-8914-08de72d1c897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hVm9hPvZSnHGr+/YLIBqCUf41uHmFunIHQcTZhAj3Xh70Y9Vz/QEVjsmWR/F?=
 =?us-ascii?Q?9vzGGuaH9IFnRuhx9l6Tf/i7l9kY2+19qaawepD+RNYXhyUt1R/uAk57ndAX?=
 =?us-ascii?Q?V3gM0oj2Xo/elY/ys4gIoAOp3ZuiG5SLTgV3VfXGWl28vfgYtmbC/6Ek9A2h?=
 =?us-ascii?Q?8Pe/GDMKGpaQ1oIevFZ9hUfAY2wn/C307p65FJrmuJXUgYIzeHPf++ZNAGTl?=
 =?us-ascii?Q?V158DZJd1u9D2tscI74WuqZx6UayvV9cuExdxM53gork6q2WfssfWAdYs0hr?=
 =?us-ascii?Q?8PFvuTZ3UZMMNqgR/dhStuj/zvmwep3nezxWWAN+SNy1DJ3WXFPb2LDQQtYS?=
 =?us-ascii?Q?/lEzbWPsaucrfDUetPlWJdZvzDNTSlVP6+KbOjyczHRTKwdudfeM0YLGenj2?=
 =?us-ascii?Q?HG04X0Q0gj2hwGY70khdw9Ar0iNK2Bk90k12jWGu3YhGZPuw9b7j/nKqJtcg?=
 =?us-ascii?Q?r1iB6Adqv6e5JWnAfSt6b9lqi4QN+1qAdMMKqlp1RwAMWbKt8dfRohNGaqlp?=
 =?us-ascii?Q?fQ5nc/Ia74n1kuLaoRksnbjRa1TZFbhdU6u/NV++q/4kKgWiOHRX7k9ksMRV?=
 =?us-ascii?Q?jW3vkU3Cckdmf56H04zIKnMi54iwkfg8/c3NMH+CWCOjlaMSn80ue3DYd+qE?=
 =?us-ascii?Q?Vltta4eIBPz+M+SpPM0FBxzE2/EwinWnjrILQfwwTGPRQXec9Mg+Iv04PRzh?=
 =?us-ascii?Q?7uz38U6kXhzA3DB6V9gtgYWeVoaDUG2cRAcDCh+y5qqaS7ty12zLAhPWBMuQ?=
 =?us-ascii?Q?A91P7Y3rvInjYB+Qfzh4AUEVBxFJCfxupwlYvzhUAqGfYNH9ytpxvfnYSW/V?=
 =?us-ascii?Q?nMoXIZd64/VpC1zaljhGfDiOdJ57fM/hvV/khoBwgxrwBejj+SAJF7/UjS4h?=
 =?us-ascii?Q?niXDlJqVKqnGHMzpUtWy9oK7iwgkEJ+1ixP66OVKrkGuJHanhATRfM3i5FNZ?=
 =?us-ascii?Q?GWETaQLBuvJzWFltFduZ01ILeJPaB2gRyVfzYZ7Y7p0AMwlEV/psndwaDA9x?=
 =?us-ascii?Q?hGf+YsnsMnIdlmZbhz+pGFWpdpL/UNhT0jDs/lrILsVQVGpUepLG5leu+/Yu?=
 =?us-ascii?Q?8NPlDrOZqrM8cPwbDTVHuZAYw2wrKp/RbY2oL8mUNTCTA7Ny//1Gtjhkmzx/?=
 =?us-ascii?Q?PbJzrIUmyupvewRJlTvwM/PDJugw+9HMBKfaHyH0/vCvistKaQ1GAvw8M0uy?=
 =?us-ascii?Q?w4cZT3SYdd0JjDFJ/cLLtxdJjCEwrIghfFJ2nogsROxF3OBvQt6CHjBc4DY3?=
 =?us-ascii?Q?Q9Pu76lBgBF74vKvDBQnZYWWtXS4jL4AppqtRMlUfmRcQ8s4xNZ+GidEvLsx?=
 =?us-ascii?Q?alsLlI8NDI1ucw221bGFQe9v8jG2aGfrtdtfbIHpG02vStYk3zMO/T/JwZAm?=
 =?us-ascii?Q?5COMXQqICDiYoeKmr8w2qYDQe8GF0MfqZtxyaUb5Jkbm9hG01q9heyMgqD+L?=
 =?us-ascii?Q?lcLsK32ueBzIAsgAykC8V0oYYrS5TJSzje7vJXEQrQH9xOW0sVYygwe/8j38?=
 =?us-ascii?Q?bOhLJHv2ssFQBUt/EG4Bx2amSfz2HSJ63QDjZXAhZTZbjx68bCMYuGR60gN/?=
 =?us-ascii?Q?HX6ZmnRdnEyyJPjX7jrd7I+Uqy257KpYrPAg23xw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AGYrmnqYOORFfbUc/YI/jcQS2HMBeIGJhDu3ZsRLgaIynS+g3VFpFvTRXnkH?=
 =?us-ascii?Q?fVkxjsulOGnc3fNTa0REmyilS68JO6hpxgm2gHyOtee4MODQAQjj7D2v5sJm?=
 =?us-ascii?Q?uI8owsuUDR3dMsI2Oh+uwW0iDkzdzWt4mXMcUgQdgiU4kZfVhFcDemjheGnB?=
 =?us-ascii?Q?euc5g1Bb5JTxOGkx4GHSnd8Y+nnP4RyuIkbscVzREqDfv1sHmTEed83VItFE?=
 =?us-ascii?Q?cNpj0hVDsx3hp76inYbOXtShByr6FSaGkZU38E01aJlFh1RWlFgx2t9Ufh/F?=
 =?us-ascii?Q?u8sSeM7K+oj1Yzqu/wjNTevcZxdnGZ5T8E98c31DH3em8KYyRm37h8ntHb+F?=
 =?us-ascii?Q?s0gGTRDHb91N+ARvfWCTFAL1i9ISkW+MvCi8xtza695nvgxssm+HI8q+n4/4?=
 =?us-ascii?Q?lApkpMTx/j2IvWYZDIIhztkoIONnWXegjN1jeHFbKcbc77bWKajHTcLtC83t?=
 =?us-ascii?Q?oWKvnb92VjwOeNBn9eAW2UhcghcKVFrXJlv8hV+sSN6tvEHG8MjdWyP2jox8?=
 =?us-ascii?Q?Irk8wGH4QTElsh90usVDOV1KUbNDNM2H3y3Oa1FgSr9/DwlRitpgMtP1T0xa?=
 =?us-ascii?Q?H4wv4s07o5mRBmkTGpkkUVzxN+0tK5Sk+XgdDuQa8v3EJC0k7ktgppPXXjdf?=
 =?us-ascii?Q?Z4iZD7T31tVDqLQ03LVIB5r19xZA4sCgpqx0VAiDU8QzWXBOzOinAxLSO7j4?=
 =?us-ascii?Q?J7UCZl1w+tmlvnYdijD7UT1ch1t5LN/utZ9T/7q22wss19PRoVWCx0ywy6NH?=
 =?us-ascii?Q?UjiXlQ4WP9PD15Mih/X2/5++HdRbmd2MExuE13jrfZs7fBDDgtshZipzgboI?=
 =?us-ascii?Q?uVO1Knid3/kiEUfiNz6vqihOtIu+OF/6ige+hclPtTaocKDIZO/B6AwNOGbA?=
 =?us-ascii?Q?BdG0p1zN+bcQMlI6DEwdMkOTspcUKXPrQihf2SIWXd1KESyv3rWyrn8QJvVo?=
 =?us-ascii?Q?GTUYOpmo0gginpGjhLdgK0LqjkuTdafLgM/WiQWUZLL5AKmhTwGAz+fmUbZl?=
 =?us-ascii?Q?eO8PTxf5byT9xVgD/h/5+HFe4ud1mGNqdAccPgMo3BKDfyzUon0+5JgbIPxo?=
 =?us-ascii?Q?QzDbN4vRZfkSIsdyXlXtegAAZ33v4egPFJH1tyDvA43RZjKH1oYa3uMJmQxS?=
 =?us-ascii?Q?EmYllG80XSnmGyDEaLVQo2pLXRtXazCgQqK7WEGVfZoTYWFCYYpTDe9RWfuj?=
 =?us-ascii?Q?c7utYCsyyTwt8vBFI4EQf7JOvFYoD2dBcSzWeDWR30y9VhIILEE2YR/uGpyH?=
 =?us-ascii?Q?HlwEpkmOAM/dXwQ54DURQt3JSdYn1adQnjCUYzp0VUHj4EVYObIMjg0R5P3X?=
 =?us-ascii?Q?pYclp+CLnEteFQMnwOS12P6e69ptG8Gi+a98pBcSwzQZSHKEvAg6BxemYz2m?=
 =?us-ascii?Q?bZunlTEjr50tyX3Jh3baTNCNYdvVsWYVzL+KV9sAmpqLc0TcFBfs8dLF/w7s?=
 =?us-ascii?Q?lT48UjmabTIaigAAJfL9LAd7tHWM2y0r/9nX2jovLtzYL0/j+mYVC0uobbyU?=
 =?us-ascii?Q?zpBZmfm7SSp9eH08ZiJuzzUunE0BeGHLjYUefc5o2Q2BarhSEG7RhNCDiaGu?=
 =?us-ascii?Q?r5Kp7vcYLefTN2G1iUzfXS7XphhotUrIOm33vsj//STabmLqc72au+4rzBX+?=
 =?us-ascii?Q?/tzLjBmf70Ts0K4lpZptKiTBIV35GG87n7Ef3YHSCjp82MkLzBHkuHh2mtDu?=
 =?us-ascii?Q?KpsyowcgE0oUtjrtqSEWsyA8aVB33itfWpPcZ+vnaBQK4Tv30GUJXzE1ewct?=
 =?us-ascii?Q?pTtKG9PAILZ0Ro58eZIIGyVnqO+CVW8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba7d2c0-b41f-482a-8914-08de72d1c897
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 11:50:47.4108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3iU7WplXHQ2vCMhGL810FJOsKy45kEeYB9q4DuPGxV3hNVWDGk7m/6xytKKkloroCz1GjKO/zj9HwthLZUSarH1votqrI05K0V6/+7+9Vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4566
X-Authority-Analysis: v=2.4 cv=V4xwEOni c=1 sm=1 tr=0 ts=699c3f1a cx=c_pps
 a=rwqFklNBBe0PgClOpsUSJg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=CCpqsmhAAAAA:8
 a=XkRKQH6RAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=0Fz_w68Xlc7QMu5B71sA:9 a=A7UyDSRDaq78f8Sb:21 a=ul9cdbp4aOFLsgKbc677:22
 a=1gUyE30hU_ULiMxJiLUW:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwMSBTYWx0ZWRfX4bmRSHBtj1tq
 MHeZRa1mfD0hmSzLceAMYKz+6imRZbj1QyLOzxmA64E8GJvgG+KCK+xq7H1j9t6h7lpvSwZuRob
 7Zs9wweKNttf8SREggq8E3lcBSXOzxd0afHQWyEZK19JzGvL2uzTt9pusK5CRo0DkttEy/pB/+o
 kJiJrZTi8Y8h1axcs17Um3mtfuGIH1w8e3Ph8X2kw0kJnPoknVLPQTL0Upbag3HL44vZg4GlwfW
 USuJ3AYWilvLi0IajpDuolE+Co6zZJqUF56HVDymNICewgYYr8TiArSxS8CyVAGKOCvtzBcUsUG
 //NgX8eV9UF6XMczDTWcH9DT+QlDtp4J9oC/gqAPRrpmfUKTJQZ7eytd1ZREYeZnWI4LyHdtlel
 WA3G85GoFS4vMiwLzA+nY2VrPX9XVVyD5MtGKt61J2A5CTyVC+i6xtJW3ps9sPpG8vpzoy72Zrn
 j9dq1ZZrUHh4YdbV7fA==
X-Proofpoint-GUID: fyUCGmeCbrl_VlMpOo5MrGQ7Bb2XRi_m
X-Proofpoint-ORIG-GUID: fyUCGmeCbrl_VlMpOo5MrGQ7Bb2XRi_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 11:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231664

From: Sunil Dora <sunilkumar.dora@windriver.com>

GDB 17.1 includes the following changes and enhancements:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-17.1-release

 * x86-64 CET shadow stack support
 * Debugging Linux programs that use AArch64 Guarded Control Stacks
 * GDB record feature now supports rv64gc architectures
 * 'info threads' command support for two new options '-stopped' and '-running'
    to limit the list of displayed threads.
 * On Linux and FreeBSD, the addresses shown by the 'info sharedlibrary' command
   are now for the full memory range allocated to the shared library.
 * Linux checkpoints now work with multiple inferiors
 * Improved linker namespace support
 * Warnings and error messages now start with an emoji (warning sign,
   or cross mark) if supported by the host charset. Configurable.
 * Built-in support for TLS on Linux as backup when libthread_db is not
   available. Supported on the x86_64, aarch64, ppc64, s390x, and riscv
   architectures, when compiled with GLIBC or MUSL.
 * New command "set riscv numeric-register-names" to display risc-v
   registers using their numeric names instead of their ABI names.
 * The Alpha target now supports target descriptions.
 * Python API enhancements
 * Support for Python versions older than 3.4 has been removed.

Dropped 0009-Readline-8.3-alpha-release.patch
Added   0009-PR-gdb-33747-gdb-ser-unix-Avoid-musl-build-failure-w.patch

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Co-authored-by: Sundeep Kokkonda <Sundeep.Kokkonda@windriver.com>
---
changes in v3:
 - Added musl build fix patch (PR gdb/33747)
 - musl currently does not expose c_ospeed/c_ispeed or Linux termios2/BOTHER interfaces
 - Ref: [https://www.openwall.com/lists/musl/2026/02/12/1]

changes in v2:
 - gdb: Upgrade 16.3 -> 17.1

 ...ian_16.3.bb => gdb-cross-canadian_17.1.bb} |   0
 .../{gdb-cross_16.3.bb => gdb-cross_17.1.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   4 +-
 ...-ser-unix-Avoid-musl-build-failure-w.patch | 190 ++++++++++++++++++
 .../gdb/0009-Readline-8.3-alpha-release.patch | 164 ---------------
 .../gdb/{gdb_16.3.bb => gdb_17.1.bb}          |   0
 6 files changed, 192 insertions(+), 166 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_16.3.bb => gdb-cross-canadian_17.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_16.3.bb => gdb-cross_17.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-Avoid-musl-build-failure-w.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
 rename meta/recipes-devtools/gdb/{gdb_16.3.bb => gdb_17.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_16.3.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_16.3.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_16.3.bb b/meta/recipes-devtools/gdb/gdb-cross_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_16.3.bb
rename to meta/recipes-devtools/gdb/gdb-cross_17.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index a36f78fe67..08c0e70ccd 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,6 +13,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
-           file://0009-Readline-8.3-alpha-release.patch \
+           file://0009-PR-gdb-33747-gdb-ser-unix-Avoid-musl-build-failure-w.patch \
            "
-SRC_URI[sha256sum] = "bcfcd095528a987917acf9fff3f1672181694926cc18d609c99d0042c00224c5"
+SRC_URI[sha256sum] = "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876"
diff --git a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-Avoid-musl-build-failure-w.patch b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-Avoid-musl-build-failure-w.patch
new file mode 100644
index 0000000000..823fd79f60
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-Avoid-musl-build-failure-w.patch
@@ -0,0 +1,190 @@
+From d3c2bf20ea6afc6a02151d06fa93b4c767986815 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Mon, 23 Feb 2026 00:57:35 -0800
+Subject: [PATCH] PR gdb/33747: gdb/ser-unix: Avoid musl build failure when
+ setting custom baud rates
+
+The Linux custom baud rate implementation accessed the struct termios
+members c_ispeed and c_ospeed directly. These fields are provided by
+glibc but are not exposed by musl, which causes the build to fail on
+musl-based systems.
+
+Adjust set_custom_baudrate_linux to use a capability-based approach.
+The Autoconf check HAVE_NUMERIC_BAUD_RATES determines whether
+B-constants match numeric baud rates. If they do, use the standard
+POSIX cfsetispeed and cfsetospeed interfaces. Otherwise, fall back
+to the Linux-specific termios2 interface (TCGETS2) to support
+arbitrary baud rates.
+
+This preserves existing behavior on glibc systems while restoring
+build compatibility with musl.
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-February/225251.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ gdb/config.in    |  3 +++
+ gdb/configure    | 39 +++++++++++++++++++++++++++++++++++++++
+ gdb/configure.ac | 19 +++++++++++++++++++
+ gdb/ser-unix.c   | 42 ++++++++++++++++++++++++++----------------
+ 4 files changed, 87 insertions(+), 16 deletions(-)
+
+diff --git a/gdb/config.in b/gdb/config.in
+index efc3100cb9e..a6561c03ee6 100644
+--- a/gdb/config.in
++++ b/gdb/config.in
+@@ -343,6 +343,9 @@
+ /* Define to 1 if you have the <nlist.h> header file. */
+ #undef HAVE_NLIST_H
+ 
++/* Define if termios B-constants match their numeric baud rate */
++#undef HAVE_NUMERIC_BAUD_RATES
++
+ /* Define to 1 if you have the `pipe' function. */
+ #undef HAVE_PIPE
+ 
+diff --git a/gdb/configure b/gdb/configure
+index d0bdba6eb36..407104fc420 100755
+--- a/gdb/configure
++++ b/gdb/configure
+@@ -27336,6 +27336,45 @@ if test "$ac_res" != no; then :
+ fi
+ 
+ 
++# Check whether termios B-constants match their numeric baud rate.
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether termios B-constants are numeric" >&5
++$as_echo_n "checking whether termios B-constants are numeric... " >&6; }
++if ${gdb_cv_termios_numeric_baud+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++
++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++#include <termios.h>
++int
++main ()
++{
++
++       #if B9600 != 9600
++       #error B-constants are not numeric symbols
++       #endif
++
++  ;
++  return 0;
++}
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++  gdb_cv_termios_numeric_baud=yes
++else
++  gdb_cv_termios_numeric_baud=no
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_termios_numeric_baud" >&5
++$as_echo "$gdb_cv_termios_numeric_baud" >&6; }
++
++if test "$gdb_cv_termios_numeric_baud" = yes; then
++
++$as_echo "#define HAVE_NUMERIC_BAUD_RATES 1" >>confdefs.h
++
++fi
++
+ 
+ 
+ # Check whether --with-jit-reader-dir was given.
+diff --git a/gdb/configure.ac b/gdb/configure.ac
+index 52924106bca..ac45d22e4bf 100644
+--- a/gdb/configure.ac
++++ b/gdb/configure.ac
+@@ -733,6 +733,25 @@ AC_CONFIG_FILES([jit-reader.h:jit-reader.in])
+ 
+ AC_SEARCH_LIBS(dlopen, dl)
+ 
++# Check whether termios B-constants match their numeric baud rate.
++AC_CACHE_CHECK([whether termios B-constants are numeric],
++  [gdb_cv_termios_numeric_baud], [
++  AC_COMPILE_IFELSE(
++    [AC_LANG_PROGRAM([[#include <termios.h>]],
++      [[
++       #if B9600 != 9600
++       #error B-constants are not numeric symbols
++       #endif
++      ]])],
++    [gdb_cv_termios_numeric_baud=yes],
++    [gdb_cv_termios_numeric_baud=no])
++])
++
++if test "$gdb_cv_termios_numeric_baud" = yes; then
++  AC_DEFINE([HAVE_NUMERIC_BAUD_RATES], [1],
++	    [Define if termios B-constants match their numeric baud rate])
++fi
++
+ GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],
+                 [directory to load the JIT readers from],
+                 [${libdir}/gdb])
+diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
+index 6f2766518be..abd04c898f5 100644
+--- a/gdb/ser-unix.c
++++ b/gdb/ser-unix.c
+@@ -513,31 +513,41 @@ set_baudcode_baudrate (struct serial *scb, int baud_code)
+ static void
+ set_custom_baudrate_linux (int fd, int rate)
+ {
+-#ifdef TCGETS2
+-  struct termios2 tio;
+-  const unsigned long req_get = TCGETS2;
+-  const unsigned long req_set = TCSETS2;
+-#else
++#if defined (HAVE_NUMERIC_BAUD_RATES)
+   struct termios tio;
+-  const unsigned long req_get = TCGETS;
+-  const unsigned long req_set = TCSETS;
+-#endif
+ 
+-  if (ioctl (fd, req_get, &tio) < 0)
++  if (tcgetattr (fd, &tio) < 0)
++    perror_with_name (_("Can not get current baud rate"));
++
++  cfsetispeed (&tio, rate);
++  cfsetospeed (&tio, rate);
++
++  if (tcsetattr (fd, TCSANOW, &tio) < 0)
++    perror_with_name (_("Can not set custom baud rate"));
++
++#elif defined (TCGETS2)
++  /* Use the kernel-level termios2 structure.  */
++  struct termios2 tio2;
++
++  if (ioctl (fd, TCGETS2, &tio2) < 0)
+     perror_with_name (_("Can not get current baud rate"));
+ 
+   /* Clear the current output baud rate and fill a new value.  */
+-  tio.c_cflag &= ~CBAUD;
+-  tio.c_cflag |= BOTHER;
+-  tio.c_ospeed = rate;
++  tio2.c_cflag &= ~CBAUD;
++  tio2.c_cflag |= BOTHER;
++  tio2.c_ospeed = rate;
+ 
+   /* Clear the current input baud rate and fill a new value.  */
+-  tio.c_cflag &= ~(CBAUD << IBSHIFT);
+-  tio.c_cflag |= BOTHER << IBSHIFT;
+-  tio.c_ispeed = rate;
++  tio2.c_cflag &= ~(CBAUD << IBSHIFT);
++  tio2.c_cflag |= BOTHER << IBSHIFT;
++  tio2.c_ispeed = rate;
+ 
+-  if (ioctl (fd, req_set, &tio) < 0)
++  if (ioctl (fd, TCSETS2, &tio2) < 0)
+     perror_with_name (_("Can not set custom baud rate"));
++
++#else
++  perror_with_name (_("Custom baud rate not supported on this platform"));
++#endif
+ }
+ 
+ #elif HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(IOSSIOSPEED)
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch b/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
deleted file mode 100644
index 206b4baaf0..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 8807681557d9f30aac819186369ee62f4f8d1d96 Mon Sep 17 00:00:00 2001
-From: Chet Ramey <chet.ramey@case.edu>
-Date: Mon, 22 Apr 2024 10:41:37 -0400
-Subject: [PATCH] Readline-8.3-alpha release
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/readline.git/commit/tcap.h?h=readline-8.3-testing&id=69e5c5e4c9778bf86c3d1c6b058ddece70854de8]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ...ap-Add-function-parameter-prototypes.patch | 37 ++++++++++
- ...d=cef614441f99b7b6e444ba601d8465a6e88f5a98 | 67 +++++++++++++++++++
- readline/readline/tcap.h                      | 14 ++--
- 3 files changed, 111 insertions(+), 7 deletions(-)
- create mode 100644 readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
- create mode 100644 readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-
-diff --git a/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch b/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
-new file mode 100644
-index 00000000000..f28e31fd0e0
---- /dev/null
-+++ b/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
-@@ -0,0 +1,37 @@
-+From 0c16af6ebf0bf81138c973e5e6a7c4ebf71f2489 Mon Sep 17 00:00:00 2001
-+From: Khem Raj <raj.khem@gmail.com>
-+Date: Wed, 30 Apr 2025 10:41:12 -0700
-+Subject: [PATCH] tcap: Add function parameter prototypes
-+
-+GCC-15 with C23 dilect defaults expects full function signature
-+
-+Signed-off-by: Khem Raj <raj.khem@gmail.com>
-+---
-+ readline/readline/tcap.h | 14 ++++++--------
-+ 1 file changed, 6 insertions(+), 8 deletions(-)
-+
-+diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-+index 859e6ee..2b22ff7 100644
-+--- a/readline/readline/tcap.h
-++++ b/readline/readline/tcap.h
-+@@ -46,14 +46,12 @@ extern char *UP, *BC;
-+ 
-+ extern short ospeed;
-+ 
-+-extern int tgetent ();
-+-extern int tgetflag ();
-+-extern int tgetnum ();
-+-extern char *tgetstr ();
-+-
-+-extern int tputs ();
-+-
-+-extern char *tgoto ();
-++extern int tgetent(char*, const char*);
-++extern int tgetflag(const char*);
-++extern int tgetnum(const char*);
-++extern char *tgetstr(const char*, char**);
-++extern char *tgoto(const char*, int, int);
-++extern int tputs(const char*, int, int (*)(int));
-+ 
-+ #endif /* HAVE_TERMCAP_H */
-+ 
-diff --git a/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98 b/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-new file mode 100644
-index 00000000000..02e665b143b
---- /dev/null
-+++ b/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-@@ -0,0 +1,67 @@
-+From cef614441f99b7b6e444ba601d8465a6e88f5a98 Mon Sep 17 00:00:00 2001
-+From: Chet Ramey <chet.ramey@case.edu>
-+Date: Sun, 14 Jan 2024 15:19:37 -0500
-+Subject: Readline-8.2 patch 8: add missing function prototypes
-+
-+---
-+ bind.c     | 4 +---
-+ patchlevel | 2 +-
-+ rltty.c    | 3 +--
-+ text.c     | 3 +--
-+ 4 files changed, 4 insertions(+), 8 deletions(-)
-+
-+diff --git a/bind.c b/bind.c
-+index 971116a..2596006 100644
-+--- a/bind.c
-++++ b/bind.c
-+@@ -1167,9 +1167,7 @@ _rl_init_file_error (va_alist)
-+ /* **************************************************************** */
-+ 
-+ static int
-+-parse_comparison_op (s, indp)
-+-     const char *s;
-+-     int *indp;
-++parse_comparison_op (const char *s, int *indp)
-+ {
-+   int i, peekc, op;
-+ 
-+diff --git a/patchlevel b/patchlevel
-+index e340b58..6c10f12 100644
-+--- a/patchlevel
-++++ b/patchlevel
-+@@ -1,3 +1,3 @@
-+ # Do not edit -- exists only for use by patch
-+ 
-+-7
-++8
-+diff --git a/rltty.c b/rltty.c
-+index 882a3d4..a4863ac 100644
-+--- a/rltty.c
-++++ b/rltty.c
-+@@ -80,8 +80,7 @@ static int ksrflow;
-+ /* Dummy call to force a backgrounded readline to stop before it tries
-+    to get the tty settings. */
-+ static void
-+-set_winsize (tty)
-+-     int tty;
-++set_winsize (int tty)
-+ {
-+ #if defined (TIOCGWINSZ)
-+   struct winsize w;
-+diff --git a/text.c b/text.c
-+index 91c3f33..30fdaa1 100644
-+--- a/text.c
-++++ b/text.c
-+@@ -1764,8 +1764,7 @@ _rl_char_search (int count, int fdir, int bdir)
-+ 
-+ #if defined (READLINE_CALLBACKS)
-+ static int
-+-_rl_char_search_callback (data)
-+-     _rl_callback_generic_arg *data;
-++_rl_char_search_callback (_rl_callback_generic_arg *data)
-+ {
-+   _rl_callback_func = 0;
-+   _rl_want_redisplay = 1;
-+-- 
-+cgit v1.1
-+
-diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-index 859e6eed5aa..467ea60e903 100644
---- a/readline/readline/tcap.h
-+++ b/readline/readline/tcap.h
-@@ -1,6 +1,6 @@
- /* tcap.h -- termcap library functions and variables. */
- 
--/* Copyright (C) 1996-2015 Free Software Foundation, Inc.
-+/* Copyright (C) 1996-2015,2023 Free Software Foundation, Inc.
- 
-    This file is part of the GNU Readline Library (Readline), a library
-    for reading lines of text with interactive input and history editing.      
-@@ -46,14 +46,14 @@ extern char *UP, *BC;
- 
- extern short ospeed;
- 
--extern int tgetent ();
--extern int tgetflag ();
--extern int tgetnum ();
--extern char *tgetstr ();
-+extern int tgetent (char *, const char *);
-+extern int tgetflag (const char *);
-+extern int tgetnum (const char *);
-+extern char *tgetstr (const char *, char **);
- 
--extern int tputs ();
-+extern int tputs (const char *, int, int (*)(int));
- 
--extern char *tgoto ();
-+extern char *tgoto (const char *, int, int);
- 
- #endif /* HAVE_TERMCAP_H */
- 
diff --git a/meta/recipes-devtools/gdb/gdb_16.3.bb b/meta/recipes-devtools/gdb/gdb_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_16.3.bb
rename to meta/recipes-devtools/gdb/gdb_17.1.bb
-- 
2.49.0


