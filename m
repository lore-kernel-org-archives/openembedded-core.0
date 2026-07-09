Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F45C44507
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 15:10:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11786.1783609800990290499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 08:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KeSXrxqC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1650c03d73=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669EdOtp2502215
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jul 2026 08:10:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ualJOZbOsTcQ+jLv3yMg4nDJ3RNIz6TvMeZrQQGw0IA=; b=
	KeSXrxqCOOzGyefNLtKqb+SWOPtoTpbEZvXB7z8RqLIdhtiTqCcg7cYohntlaCP8
	pe9MoIf985663rKA52tdoxBbMohTZ7jXoPQs2RTgMwPVlSO+ojjkaGnqJbC3Gb5q
	osySUBALox6npxznwicBcjVKOf5QJRL+qaFOg1H1nq6nbgGPkMiJs4+65aVHylNy
	XqMnrnrDzzXtMxjW7/z3tGssVqUDCO43XlH7lROH5D+zL3AgdlPTJD25et5zhAV0
	4TQxgvKnO/xYDZUZG7NUTKcBSs+BI8++LBPDO8RDCPHoKFPxipC0S68CBp9GTNc1
	YWqsD7xckCF806a4SbGdeA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013056.outbound.protection.outlook.com [40.93.201.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fa1ats47n-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 08:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbgIhN8hPtAHrSsnhdhtTE8mVmuwh/kkAoPAnhT5t1NMm6KX1bjox0bQu2XVskmSpe/MRiywFtrg+Ehylci9uYpj7bIAmd6ichwNz2VFVxxbN4bt0k+nnRqaOGFAf/ddr1ai46/p35eByJjMzIlNv08p5NCkcC9+jyFNpiQFdephoui477Bc1PbHB3GqlY3NX8pHaXqmSHihrkDBodDXFT1iYhwJlgJ6rgpvVwRj3qm03MG9bGKaTFnSeBY2QMcMgnjMKXAp5nT0OE4BQvYYZApbxTbsLgWEM5ID60XBQ8V/5p/Kqoe5JYKMmocmJhYm+HQOkc8JBsRvSJm1a/DeGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ualJOZbOsTcQ+jLv3yMg4nDJ3RNIz6TvMeZrQQGw0IA=;
 b=nkZLwxsNUB7MrR4XEOR6LdanmAIh+PMoJc4awzQs5H86vu+0GyFcv80uHY5NklCI8BSW7Jq0+ymD6qttnV/9jZxZaKtw2PQk/85I2UzmhWCImtVt8CW5kr7gUK0Dvbaq3UWo5nOO3/iqAkYpSTqtpMnt451xTZWgZnEUtlM5jrcwxPE74mTwDbOY/9vcIjVeK5PSZg5Ra5dwImpuOVNKSZcKqsdp1GuGsfAbIoLXWQ+mAsVLX+RYgF8kEu7DHo0FTScwhd86sZYzdMLO77JRWatFi2VwfMnZ+7DxuqVNjAOXe0W6+JMtLLp/5F8sNrTMfxx5+fS+SZ87tolF1jngDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9)
 by PH0PR11MB7166.namprd11.prod.outlook.com (2603:10b6:510:1e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 15:09:57 +0000
Received: from IA1PR11MB7775.namprd11.prod.outlook.com
 ([fe80::9098:ac14:fde7:cfab]) by IA1PR11MB7775.namprd11.prod.outlook.com
 ([fe80::9098:ac14:fde7:cfab%5]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 15:09:57 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [OE-core][scarthgap][PATCH v2 1/2] python3: Simplify ptest exclusion list
Date: Thu,  9 Jul 2026 08:09:29 -0700
Message-ID: <20260709150930.3068900-2-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260709150930.3068900-1-kris.gavvala@windriver.com>
References: <20260709150930.3068900-1-kris.gavvala@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0358.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::33) To IA1PR11MB7775.namprd11.prod.outlook.com
 (2603:10b6:208:3f3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7775:EE_|PH0PR11MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 683a7b73-738d-459a-e39b-08deddcc22fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|22082099003|18002099003|56012099006|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info: 
	Bo12yzN69imBrGFhLr2IqgE5uOnEr+wiLHjzQnvwSd1DRFfrroUZZoSVxX3/O4AIVtfATXVjMFDwRT0X2PXQSj4USI+LsQBsoGfS3jGes4X/7avNfEU9cm1k9L4H3WW4em/YjzY2cpZNKPvL2/4uul53s7u4F5WKdzcM8GQ3z9xTrEm2zpAfaEaT+zSTKrXXH7nswX9nzZiEkPqi/qetrZl3ZPH5B0HUQH4UHI/XEzDPsebqBZ1sQyvQGV0tB21tEGxqy0qL11MVUpDvM4XBTv9WW+WCoFwijm6SvRe3JWVfMMGYzdxivFFmjqIpN89uxw0q0I7KU395n+s1iNfvG814UEqv48NgS6OsdLH0Zz+3qhcp6BHxhE0UJeU/pOy5pSbiRLgUgFD0XIZnFwVaiVYeFHzLtMU/0c/H+O68HElPDAZK0NFkRsBWNpCXG30y0U+eTwlCBOaG5++z3gQDOW84QAlphqOAiY5UGL495MpnYweO7070bymXwOVOlKOP07jHJTZ9nLDmrY2pU/Mvwy5fd57EZr53wnLXfKDldPtl059HmLfkfHpX9L4Ga4b3DdCjpC3ZweI/AQNDVmjCzoQdPjqP8XC26xioD6h0UbuHpjCk+LbZzcvQ5+Isln55PJQ/5fHzifijwN+80gQtzydoo+at1Dqb+LSynuTGoR1C8l5EacM+VE59jnWEutb/iz8VpqRUYbXOqjfmhjXNgn8TxDTDB0Ev5JjFb4/ecz0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7775.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(22082099003)(18002099003)(56012099006)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Gya8/xl7xuF4xr5GovsoGwFcCrkWe8njCZIoNXALdPxJGth/zvkbktYffwpm?=
 =?us-ascii?Q?N8qLgAQVag3rBslN1Ga4p8Eh5bl4ugasi+AcX/ukeCbKQw/TD/ZjJiyI9Nx1?=
 =?us-ascii?Q?Kbv62DuLSY9gz215cw/7F1BlDOK4E7TCRPf4OM1Gg9NVzGubhx967NQ/l64O?=
 =?us-ascii?Q?BFi3u9JqI7CVR/8P9s9V5sNnNbsXe2+0rTKGUxmdcYjziZXE1gRJ2fugZQAb?=
 =?us-ascii?Q?cFKLZwaAWBXof+6wREsC1F49wQj3WRK2KsORJI53KU4XgR5pHhDERAfxdfmR?=
 =?us-ascii?Q?sDcHdhzd+p7lBCNIeeJkGEOjEhH1LlPQITojPBkZn447T9jgPyCUvj+HpfAX?=
 =?us-ascii?Q?sL0wq5bKGI+3zDphA5zFVEODB1XeyN4E6OzPc3hObpNqmAMUCc9sFC/qNVbj?=
 =?us-ascii?Q?ZmEWie4427nZoeHJB2FJbxY0veq9p1GvG3JGEq/YEFzk4KotidRKXuYiPBiO?=
 =?us-ascii?Q?1shsInkYdafr3fM6ItoPiQ8ewBuoxqnAQKQjAsXfX0r5rw5joTMpVIBbjmJh?=
 =?us-ascii?Q?0hSV/gi1sO5Lips78d66Gfefo59PDcny6tstyGtjRi/WJgHM/4PubFK1pnB2?=
 =?us-ascii?Q?37M7q7s42z8xce8HjbUvpr7zVOXCcS4rSbGY+oLAKQphIjyvWvdjnTHN/8bu?=
 =?us-ascii?Q?2uewzBPF894vONGZmBfU8rSs/BSWFsqP7/LYux7C5KiKXdSziTc+sskg8Gns?=
 =?us-ascii?Q?I9f8sGI64sMwYFMvSQEV3qjPm+G8gVB5iui9iZPAffAdDiD+vji6/x22yeOh?=
 =?us-ascii?Q?6DZxPc9i747gnUBuOkH0sIMepEt1gIJUze+PsXhtPLeaDNgbjGSOaSO5Fo11?=
 =?us-ascii?Q?fLT5fWIhisMg2NVgZelw6qVes6EVteIROYynPFqbzT0xSbarWDLQ+RsUuIVD?=
 =?us-ascii?Q?50sYY49nc4NcATqYNUNH2sSVYzXBJVBKzKa4raH1XlOsbGiBMUxpPzp5N30g?=
 =?us-ascii?Q?1UW2OeO9TjZE5Zp/Wdz3tKL0tQBhBdqYDWxq5GeoJjt7hr9BWiH9nlZG+klL?=
 =?us-ascii?Q?DCqJSmNMMJRI3njQk+MJjHO+leYJssB8FRp5uSCxrn8Kv+MLGCLhO1ZJohbg?=
 =?us-ascii?Q?HG61MWdaXOcKhUyXjLl0LYyJZZrSWuJBFfeDmke2ljuBIb/HW8Vr9O8J2Y4n?=
 =?us-ascii?Q?6pG5qeD3clOYrbgEofbVlOVLtNGkCbBjGBWHRZzmnHNK4yyEC+2OTqY0UQsB?=
 =?us-ascii?Q?VmZitrEWRLlbEO7zdyc9fVTEcyvzYI0I9Al0rDhoGsEsWCpY35q8aQT414mg?=
 =?us-ascii?Q?BGxZJcvEQ2rRDRCmwoWGhthb7/AAaTOoXnm8J+ATe+le3ffKO0AuAglnflFb?=
 =?us-ascii?Q?eaEaK9tYe4VirxcutUxbNUt4cfRD2ZJsyOv8mfxB0i/TdRM02nJcs4JhQvSs?=
 =?us-ascii?Q?IewXVuhGGBIuCIQMx+p1d4w9Hn9IYKfD6BQbR3mTW5x6SAsFSeQFTl3OuOz9?=
 =?us-ascii?Q?wRK683N8SH7KlfdIuX2IAeLd46TcQRbO3ZZ55BEE+FaX3g0vm1i2Xu59sAN4?=
 =?us-ascii?Q?d0mLmy2X3eSOjbA5AKQyOJApt2RmGsDb9EckXETq9Q1ul1z1qINk9nedBJSj?=
 =?us-ascii?Q?6OC485sN0xXEEp4Za1A+AccZo1bCOvy9u4zxc212ShkPyKx8EOk5SLmr4Ane?=
 =?us-ascii?Q?AudLRaALN9VmoGb8kW60YwT3kIJimzlevn2WlHFTiCqfvqK6IRL3Faxn7wMq?=
 =?us-ascii?Q?6+ithsdoN8ljUFNc7XvM+V1XRTC0WR07z699F8GEGeeTaT9N3OCToMTiT/sU?=
 =?us-ascii?Q?q7YQ7ZOX0Yp2KYCEMkI+CPeH8da6v/A=3D?=
X-Exchange-RoutingPolicyChecked: 
	WsiodM0Wf2M0DhiFb+oknJJxob6aZI8n3pZcFGxMSGCCgwmRCYfcuJeEjz4Bc4Rh+BDSC6HJK5JaajQU5BSGaGSq9WO3s/Y9wiqCn9s0SjNUB71iJxl7E5Xre2ZjxpelLs6OSUhroXksUj8zSncMv/eXhfIHzh7pTBea7/JS4waz0n0Fas1QnCCWzMFaXjFdZuOqzzNUDkm3GN/JxiBqzs7Tzx4C6mK5sx6C3+3lJ9xYI657ri+lsGJBemlsxIyL0VC+yx/7RDOFtd/f0UkEQOPwmunPPd5lOpl8wzvZd8UwVt5QFBZlJwoMJuILarXfaGsxDg459uctAyLtGpRI7Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683a7b73-738d-459a-e39b-08deddcc22fc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7775.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:09:57.3043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PuGgDfVdJdSSmBuFDXHL4J+H0Rf2yafrR3FdKcjDWKB61sc4nxaPNLSDQSS0qk9VAPKiSwRdW8XibAF0jkEAuzTLJ811QAarRD8IIearKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7166
X-Proofpoint-ORIG-GUID: 743QU-ZPXOusG8fK2ton0ydrwDoiNAYs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0OSBTYWx0ZWRfXyMAwn4ZPV8da
 mmwBau1aAQK1EHCyLDCdBDXG0L58G5orpXLCZIG2ZdezaHo8azbU7sGfi4G4hcEkVS2uyzN2FDP
 HWcnPSEhVgeCv2QeMF3dlzuaSWA4tc2dBhSiJB8BjfbEsWTyeM0lSaXOFObjyi9o/230F+sUx/x
 dw83gKUy34CQK5LNlIJXyrGAIqCjFom78az8YPrx9uV9/MyHhnXUROOrd4AZU9Uqs79QqGKTN7P
 rQzUOvQiL1x8vAQ0fdQKUhnDt1c+K28RiOiw+EQaYV8xkcbdojbCdU1bKDNOlL2OjJxni8oS1VC
 LcrG8mSN1EBkIWM/iONZ+Z6XevAsAFfvYnj+eD23u4aqFJ4CoRRNYtrDLG2C7BcvQCKsxUcRZs/
 A5o6R3mJxgGj85yE8cd59Fxv+BpCewwOaD0KdJ2Z2PWzFMfr084ToWc87OVJo5VOxqY1ahAiLgt
 OQCTLNVkkru55a3BJ9A==
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4fb9c8 cx=c_pps
 a=nYaA4L0hYP7ZHAKl0WLIGg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=P-IC7800AAAA:8
 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=jtjrI0vuuAvj_RrUlpUA:9
 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 743QU-ZPXOusG8fK2ton0ydrwDoiNAYs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0OSBTYWx0ZWRfX8iGjo84iI44g
 yjCY+UDN5CJfhee+E6q23DzMMDOb6uDuD9Yh3U+K07Ag5HK4Cgxf2TpaSa3thno0etzuVFrLJGZ
 MSxUqtml/fZ/27CgFAG7wjpYk896LwFe3VtGTVTAmjWrzIpUg5Gh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 15:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240584

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Makes the exclusion list a bit more readable, avoiding very long sed
expression lines.

[Kris Gavvala]:
this commit was modified to fit scarthgap. the original commit expects
to skip test_timerfd_TFD_TIMER_ABSTIME, test_date_locale2 and test_null_dlsym.
These tests were not being skipped on scarthgap so were removed from the
backport.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
(cherry picked from commit d9a44e7390d7c8f2c2b73572825a6f8ceeb729ac)
---
 meta/recipes-devtools/python/python3_3.12.13.bb | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index 06dbc8e892..b31dd3d743 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -256,8 +256,19 @@ do_install:append:class-nativesdk () {
     create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
-do_install_ptest:append:class-target:libc-musl () {
-    sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="-x test__locale -x test_c_locale_coercion -x test_locale -x test_os test_re -x test__xxsubinterpreters -x test_threading"|' ${D}${PTEST_PATH}/run-ptest
+
+SKIPPED_TESTS:append:class-target:libc-musl = " \
+    -x test__locale \
+    -x test_c_locale_coercion \
+    -x test_locale \
+    -x test_os test_re \
+    -x test__xxsubinterpreters \
+    -x test_threading \
+"
+
+
+do_install_ptest:append () {
+    sed -i -e "s|SKIPPED_TESTS=|SKIPPED_TESTS=\"${SKIPPED_TESTS}\"|" ${D}${PTEST_PATH}/run-ptest
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " provide_target_config_script"
-- 
2.49.0


