Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C7ACCFA19
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:10:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8994.1762348199622475088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CcJiLO+5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34043e1a29=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A56v8951730731
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 05:09:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=; b=
	CcJiLO+5v/CrNuigUZ+vl0U3ZF2b3JdBcrQrtHWg6WD779iq5Ta6+uMmYlK2pK0E
	agitQ0NL3YOXHnwzVX4H2lBFBh7cYjoqj3X8AejSL3X89fcB+H/dMTS31Whyh8ej
	byJpIQlRgRJpppNRro4HrcPCt3SxKpIRk61WT9btdGLKYAIM5NZPXyZAvOUbn8Eu
	DXPYrBiyAJWNhebsHdnvR/rq/GiVoCepSPgN3djB0DkRLqpdmHbG9KfvpWkb68po
	T8OzUMGokah7wOoR8sekO1ruKikaOVt2hd3ckYN35okKtM2TorU/F+lyrDnzPBFH
	ftwG9TpGnU9d9/K/vUGmkQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7wd7gg0g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 05:09:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZFhuvXk4nkoX3zkgMhfxUhpO1GedOLwGSAvToYU6L0zXrE82EtTZKOgcZob4ngI1ldHB5aUNWKv1WAUHHTEzi9Ht4nn8wLuk4vXE666lK13nKs0UY2+k2ftQCDYpXDA+OWpbiujlVXODASGbXkFUXm8GGMpRmltQiOxa/iKTS1jL68MivSxjMC7dXvTLSPCqb053Zp0E/XHG2vYXUKia/vJtBqYdCJDEOeRM99lx2nBs93E3hD/DPR4heZ4lxjpZemVkgV0yEew2MGXsoHpF/av5T7e/JB804yfSRcSZkQsf3AenkoSEF4aHLpRrJ5q16k6Q+XiSBJ1XC59PHRxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=;
 b=Tgl5OXW5dwJh5zDlzHof/EXJrkubhSYimhoZaN8iJCqhx6zUL9igXhXuWIdpUXmRqyRgQrXHDWmYyvockuCXtfXc3BNO7YhyOpua+7ff+mJglkg1sJL6oqkLZJm9T9U4hOP8hBRXQvwLDMSP4rbFl88mpIwQJxgq6GlB/DfU6A153jwwWGtGChUVmPp53dFTmEyo35bjPF39rHKRVMhLp+/+3opg1vC1EbkaZqsp0yZTSCGH0oSjbSNMipcIwpo6VbSRzTaBEEobLzp5hp48FKPFts+9jwtOmGPlhdRZZfFIyL1j3SGlpwqyCKTlsAOS5m6BGAC0sv1GYF15WiJwGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 5 Nov
 2025 13:09:57 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 13:09:56 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
Subject: [PATCH RFC v2 1/8] bindgen-cli: extend BBCLASSEXTEND to include nativesdk
Date: Wed,  5 Nov 2025 05:09:35 -0800
Message-ID: <20251105130942.833204-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a1ba68-eb62-4833-a3b2-08de1c6c9e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pcg6kijdGGEDV8FzjfWqgfxlLpAio/KwlqGyAZRkUwvTqirsHQatN5GbJcke?=
 =?us-ascii?Q?RIVNMR4Kxf9DkLG6LrIIAj4SIN0SWSxwkv1iZoMTTyzUhQysFwoQ3r6KIaO3?=
 =?us-ascii?Q?/iQsgeHWoNdFjQ/QZBHQmyGU9EjTPYUi28sLB680wKne0S8d376CZHtyxF+C?=
 =?us-ascii?Q?5fJ8vCZYajk1LMqOGa37lbVo0PjGMVt2TOp6a/9zardU2e6tiV6VGD5NugCJ?=
 =?us-ascii?Q?GniEgf+Wgu61O9KOz38/71MOVgWjeGwUfcMhOvlsy+1DqMFVWA5kNfuEllO2?=
 =?us-ascii?Q?PE2yB8j9Jsbb/YHQkc5N+Mm1ihR6jsTt9ptZtzr2GryLLceujn2TLMKRC2da?=
 =?us-ascii?Q?rhBZYax9dCwFqScYqlCJvxpg3Q8uf5B03zF2SSDVNdTaX2GMq8gcr4P7f872?=
 =?us-ascii?Q?ElERl7IrBpDCz4YevTPBeYDa9EsVNY0dGqw1acFm91luJpPRTiTsaJiLmARD?=
 =?us-ascii?Q?bg/bvvTh3s6mknYAy5ljuwRp1vI9CATuxBQ4qnMA2UNxTdM93BjRD/guvnxf?=
 =?us-ascii?Q?+qNS2T0VUCl0B5PGIWoEC9QD30IrVwsfUtv3rydiYt66ynk1FmcCyxhT9sYq?=
 =?us-ascii?Q?VClv8WU9G28pnlQavSD9VryTDtw9/5yvjFNduYqUJwRiYb0JbO8TmzvvC/+O?=
 =?us-ascii?Q?lVZL7Qvq60I1ptC21cJFaoJi4WK/YpZjjg4UOXWqMhW5xMISTyPbv4LfUWRq?=
 =?us-ascii?Q?SbzWYO13kYyXrAAMq3rdC5f+49DnHWdZEABpRhF4MdCo7Kp1mjWixRjpovYh?=
 =?us-ascii?Q?UhlfxYx4SVvZfOzHUh6XU2Vne1ayLNjvpETt91bFJ3R8fZnUU5+FrXWNaXY+?=
 =?us-ascii?Q?iRJqvE3/NkZRygPDdAdTqfyUzIXmfxUNpkNH69vOa79xoPeCbMpVqCBkjtib?=
 =?us-ascii?Q?DqSZoic768t7cwl0arPuUSIu3956vFzD6gTUMzZaZSXDd6R9Mies+hj+deOy?=
 =?us-ascii?Q?nOkPNf8jR/ebAW1C0eRYPdzIe/l2hHQXXpRayQAayLgl0T/xCcAyFczXcoGq?=
 =?us-ascii?Q?4N9ci1lgjAMMgScawQF/G61WcF7JD4/aAqKLwNvHWKWMpAq5UHMBnTCPuuEg?=
 =?us-ascii?Q?xDnpYoNsH4wFMbOOLVgqOJiALDOH/POuNCwBccoJgJsG3iULF7dm0B2IsIyI?=
 =?us-ascii?Q?/5W/mdiztTQcDRA7CE3F5A0lLmxjag6wPY+c2efuRHxVcFezZy7byMAnJqeN?=
 =?us-ascii?Q?u8BumU3AkDd8ut9Y8XGldoXWFxGR2T8bQbTW/mQuvOk7O+TJNr9AU/k2rJNG?=
 =?us-ascii?Q?bNaKL2QWb9xBdLZgpuW1sEVIg+yLGqXgyu/xKGjfCNa39IFu4FtT90by+/eG?=
 =?us-ascii?Q?wWaLfB8+TCqAMNGYmyMzEDzznOY2tAx6DQld3aOS1wB47rdSbmWSI5vKXVAG?=
 =?us-ascii?Q?iixUEHDGgRb5LwjFtonPyw94MzPmLNUHtMdSOXRgeLjlIU25mCESs97S46bH?=
 =?us-ascii?Q?qguseFxwuXlFx82TKnCUhbSlSB3SVyLkcHLJwK78LVK7XUyMCDKYO0Yw4j9Q?=
 =?us-ascii?Q?D/PNCVy7uk2r/mFGwq8d5SXBcyAUd6uj8yPY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w1Bfvk6P6MYV+60aqGyiShvTelLdiT6+HV7OIVBAUAsek5c5VJgxeYcgzYQr?=
 =?us-ascii?Q?cb+vExnnFwERCpR2DUu0qfGK9M+Vhr8nxrBCUanQNRuOKnLISj3+5yjJuZxs?=
 =?us-ascii?Q?aa6aaWUPHbocQIPXubScE879RoW9KlDOyEQLtiuL/IZfcDtozNHiTlmJCxtm?=
 =?us-ascii?Q?rMixeDRjG87XaKgO4jlE/D3sFOSQ21zOS/XhP+xTqpfMIxwDAB4PZ1evtWY1?=
 =?us-ascii?Q?ZIXEN9q1GbTIbfMAkepgIM0XOv+/gbTWbmIcetsiaTmaMD1di+iz9NfZjUi8?=
 =?us-ascii?Q?HXvC1eKlydAQ/lT6KtY5zcq7mxWynsn3xvZAA9Z5aWKjIuQ/WG8A3ZIzAZPd?=
 =?us-ascii?Q?89pJOvyAzROeWxo1AtQ37cRWOGUOGqBT2xQN6lcKI3RcyPkJFZcIpDgltPGX?=
 =?us-ascii?Q?T9ZDBMTE+rQ913JXYPLRn+ZKOImvhQVjojJVVjuttHzfzMpEor6fTmCEN6ZO?=
 =?us-ascii?Q?aYGLABBPFK+ApIpk1UZ6vsKpOSyC8CQt0AsTYpRd/DBOnZ+EC9n00CsPrEb0?=
 =?us-ascii?Q?+TOGDe9DbwefFiJ83JAPFvfdooHpsacDnfKFhM+fUMagaE8u59dCtIg5nS+d?=
 =?us-ascii?Q?ojxUQH+j86xZJ5yhRjRbVefqg2qF67F9KQHfQ4uOVL5Ct6Ez9pTapXj2twxz?=
 =?us-ascii?Q?8cc8eI3JzXMVOY/g7CDxi1WqH1iRE4paK4YfzOn+8G2psUr5enHKeg9PAdCi?=
 =?us-ascii?Q?SfXmHr5PlRVZNk5aNYrgb7Um0IjJ5xP6kb7TPOooEQcx7JjpbqKtKpdHaqDw?=
 =?us-ascii?Q?mrDbpMvI6gL2KdcTDWBcA7IfEDNiLRCdCRf7bhcn+jtkD4KaR20asMiNDAsz?=
 =?us-ascii?Q?dR+XH6oWsmE1RAfexxnK4Jsrnr7F+KlyeFCEjapAiIoqLNB0ue5dXisPSzC2?=
 =?us-ascii?Q?g5TUYwGbHP5X7tbfV4AqTuXvEg/d5bdFTOGrZP74MxpcMiGV/vrVcDmc037a?=
 =?us-ascii?Q?L6HJBTmV8cIU8WeHfO13ki5PRDcUgBHI4DfDwF0G4R3Kw62D4m52UimF/hqD?=
 =?us-ascii?Q?SmZ96HvXPHHvLrFgISeGxwv7SOpWpJFX4fR/7pQA6dEWts2lmIQxlGn8Vg2t?=
 =?us-ascii?Q?yVBQbM9bDXYQh09u1Wk+nEOOJGX5/vseAaHktlUuGy9VOVj9nMfb+rtWOkU5?=
 =?us-ascii?Q?LvI3hhEXFe92CtypnFvcQSJs+58IlXRpr1Rtm5mEmp3xXBDFPo3D+2T5GScw?=
 =?us-ascii?Q?cICivFT9DXDoTG7FfrcYtCQP0ZR6v/4CKqb/AoRFdZggDWXGO0KM++bL1THP?=
 =?us-ascii?Q?0WKNozkRAVk9BRKp7C5gj/dMWkPwkoQPNkWHu35LgpjPyD3wqtwvPiZeKZHN?=
 =?us-ascii?Q?NChx9Ku6eIKn24DgyOXtPuvAnjaCfS1BL4SjO7ibBg3jmoissxEJTKTmlwj9?=
 =?us-ascii?Q?9LfJDc/htMyvnA+v3i4o1Sszh1ISQYg+fQXVijF9l07Jd0tKDuE0rcuoyorJ?=
 =?us-ascii?Q?xUajVt7tnqe1ELcb1Ux8LloHkK8cDNy/Zn7IxkmizwmhOXN/O9zH0UUmWL5I?=
 =?us-ascii?Q?CLyEC+SPwOyyzHM6gdnsar5SE+Txg3Z+HlmNwiZBgViXlK3AWfSbtzp6gFOs?=
 =?us-ascii?Q?pAwybeFjP6rZ44/1PrKIEMqWj3vaWiWceKqyWeO/8Kzf1WUVVe+thsJO1PU9?=
 =?us-ascii?Q?JQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a1ba68-eb62-4833-a3b2-08de1c6c9e12
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 13:09:56.8643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1b5EOiaEv1h8Lfd1m0Wx9AHcEqoI+GSiYb2ZXqYJw0Sta/hQHui4Y+zNpuLROb5nTJqmtC29wCmuYR1ZxBPFlCaavu9OQF0rqthjK9Rrwe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: mI5jsTmH9BxM9HL_zbjOIRb7OGbF5Ix1
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=690b4ca7 cx=c_pps
 a=wodMs23R9wL6gmOfRTd43Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=giED5mSNaOMbM826fEsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: vI0qAGYubM5U7_bZRaa-BBs3GLuFo7As
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5OSBTYWx0ZWRfX+MJMiPW0hIzt
 rTGTIDyuanRiMr+LrtB/4r7hQl1/p6lguHVzHzEP71g+O7OsTNjbsTUPEsnfZnoZVPPWC2M9sCL
 BaNWzpiAEJcBchzG/gvYPGRa9gJ0L3f1aKwA4ZueBekhDvXYmq3QbsH+Fk3xSpn63S6Y7Wa5b6f
 KmDUqOftXUT1vbC4MBjIXY5aaX4IvLmLpA+unN8s+y+tDRNPI7SM2hH22s97p1LYibgFeTvvfk2
 l0/xractt+UU6nSjhBOc09D+lWiQnErwnfgkw8xzRP5LDLCzVvG4Uc+iHFec5V533gwRbbrzmI9
 bvi+CG6tshrei8zjyJ9QxZ1KYtrvJHXh+dnuj3n0IL9O60QriicpseaW/q6V90ZtfVbUlPd4VSD
 RfaTBEdNCRwDzNt6IPWMak7j1VATcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225757

From: Harish Sadineni <Harish.Sadineni@windriver.com>

To support building Rust bindings in the SDK environment, bindgen needs to
be available for the `nativesdk` class as well.

This is required as part of making Rust available, where bindgen is a common
dependency for generating Rust FFI bindings from C headers during cross-compilation.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
index 2f3ec04e82..72dadfe52f 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
@@ -15,4 +15,4 @@ do_install:append:class-native() {
 	create_wrapper ${D}/${bindir}/bindgen LIBCLANG_PATH="${STAGING_LIBDIR_NATIVE}"
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


