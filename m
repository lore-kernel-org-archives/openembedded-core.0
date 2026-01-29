Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C79C1D358FD
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19157.1769704783437492483
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r5C6nSWU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T81DTu2931491
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jUXONzz4P67x5nLEqTEWIiU6UVB9l/81Cl93tXcdHLc=; b=
	r5C6nSWU7dtllu1pCPWTKYzFTd2gfLqyULlrCRG+Ig5/uCihUAJs75pkfvkoBxbT
	MeItbXJS0tzRm4T25aIPMJVz1KKiGR52QAQiL6GSB6/NcMZCMMtUKe+SsiVl/zWm
	/6nkvWG0XsJVEE0dbE/jA0KxT8MpNmDM4jSv88Qyofx35OjhR0pnIUNSve4NsPox
	SeW6V697ubqL3tQtwaxvgYtc/W6l1LKRWX/21qklCF9ElJ/ZQ7woQ4ln+mrN2MF4
	28wTo9JyCgZssU7IhyNSPkAR9wunSyxxUyXr1UN7Z9Pd3irgWGRMiBUuvt6wmRWT
	V45Uh6Fwi8nzMlRsKN5YqQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012002.outbound.protection.outlook.com [40.107.200.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwjgsw8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 16:39:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnwTbzu5YMoqBvtLjOTN5eJz3VcJFpbj0vAfHXHiAWMrx17f0MVInSvhlyrtgUkeBsfYCG4yYnLoUGpnrrVlrHylQbPe+owaPX66eHGlrUycxwfhnmcqIpTiRqdSM/KA1nfyXX6OcxaMGo7wylMZ/ATj6WltATl2eSq7ZZI7gjK4my7SGKnXcULaQMHA9Wjh7vAW0msVwHvHK+wdDQNSm2sqb/cqVwYEpSc2dKhptLKQhVWp2NNtixBcu12icwfOaHpYw4/T8sH4OsIbxs3OmE5l7THV4/wCKvCu6nW9fb24tCkuHH2Ng/jZ8NJjsz5DGMCsEaQ/P11LR1rG+A8kPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUXONzz4P67x5nLEqTEWIiU6UVB9l/81Cl93tXcdHLc=;
 b=IMp/LXTBsV+nJn0Bvyx7Aws0POfQpYP5vBKRJquAMYn4uDVmO8sf6RHePlnEKaTbwyuaR1goTpcPCka+V7n673ABxAo3W1IzWkfAalzsmWeBAReNTQT+I/GvrTFUfLXd8qHJE3f12KYZTc2B8wEblKw8HriOZnjyo3Lvg3fZ1+7KitThHLuiTzjkD2gZzYNXOdlkDjxFK7b8Sw5oNC6REu5uSAPjvMC4yDFAQXoxxXarBPRjpRVQJ0HIHGxZiqHZdWQMWUycdcd8HFVL2Ast0NjXDC4ITTRa109UzY8/6EbmF9YMhZiTgwR86DhkSwohbB8GVx5Cg37c4GdNYsBM5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 16:39:39 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:39 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 09/15] selftest/cases/runtime_test: Add test for Linux Rust sample
Date: Thu, 29 Jan 2026 08:39:04 -0800
Message-ID: <20260129163910.2612040-10-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f16edbe-630b-43cb-16ed-08de5f54feff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nTqXxPPZoPUbaLbv8yXmqaGkI82BeFAmKKHOBeZTHxcaundA0rs2AHsXKSVU?=
 =?us-ascii?Q?fRaXByBcsT8Qakr8OT8zOVLh2uqfW/m2NLc4+VXtxjcRghLD0lh3RhIiYgI5?=
 =?us-ascii?Q?tn5BS32cyleGMTeTDg5v32V0n1Rk7SwePdfCJl7iFvQ0XaZ8McyqODxfUUNE?=
 =?us-ascii?Q?e34GAcsRxGB70J5LMnqXgZa2stP56fkw6Y/lWXvJqnaZuPLYy/oD3IMv4StT?=
 =?us-ascii?Q?/KEhypb54Mqs1ZlxlgT2CeHrEH4GJ4tE4aXtUfKNRS8jXUSx8QVEW9kkXyhr?=
 =?us-ascii?Q?AqacbAG9nTlbUvYGeD66p3BVI4jWea+FoGp3IAs1dnZA8saSg2BGxBhoE/Ej?=
 =?us-ascii?Q?npBv8d/SOA5NCY9mvpVPTc2AY71LiitrSmY/s5s30beoO+QWiRid0TJ0xT3e?=
 =?us-ascii?Q?bfTY5CNJmvjbng1LzEPJcjkIZfBuz100ryENgGbC54FUE9qzYz4qu/NS/icu?=
 =?us-ascii?Q?rRPzFYBgsXEUVXZGLAD/Z2aI/m5OI9t8ck7m4udthYvoSeavrbs5k1X9t5P/?=
 =?us-ascii?Q?3sXdwGgyTnIsB9keJeugoEE6d7aiPEpfsjfKeQ5IyGFcSXNzn8lpIkEiYdaJ?=
 =?us-ascii?Q?C/5DOkt7Y8UpOsNspjCFNjsiOxCYIY0kIvS2F74PCFVcOEL0XkCRfLPRy7EW?=
 =?us-ascii?Q?keeIBk0v/VjerdB/FNa+xXShTcxyhpMs0h0LmkZXk3EZXkYyjzAzAR9eMiGU?=
 =?us-ascii?Q?awTKtEuw49xWpRIWLC1tfQJu2wW/OgmwzrpN8d4Cmy/qShrxQ+XzC9O4eoTA?=
 =?us-ascii?Q?xHFGYIJOszlW87OzPcpklIDkkU0wVHxjCm6qzIkMnW6RpAFhbsY81VahErEj?=
 =?us-ascii?Q?zrsxcc4ZCscdZG1fw4pkcRdykYRANOadRB8wBENU16XPj8oJU9cpRmq2lY4C?=
 =?us-ascii?Q?4op63isaJ37Hd6D/yltbt0mqVvRGmhT7PTXmImgL0OfoZ/SGtfwjfh30aWuj?=
 =?us-ascii?Q?B7K2NbS+SYKQepVQwE62YCOEC7mdoDj0x2AAOkqTMIO21KEaoJZbxBS7RJ4s?=
 =?us-ascii?Q?zg4TYdsimkEMzJypPW4A/hh1lWc11R/N8Ba767XPXUmt+ZgO2Lv4wndPMK3v?=
 =?us-ascii?Q?S6jIOdEXWoJteKDHvrDj4dkD905pmMOytzMw56YkYGI7oqiK/Xd4NLjDLjan?=
 =?us-ascii?Q?ysSeHPXZ7hDEk3HlVhAlmjcnD65gIIIpadCTHgtGDmpFdL5bQeeEQmeLrzhx?=
 =?us-ascii?Q?dLG8q3fBhZe5/9UUKkVpNnWzbUEsCYOOWfQWOgScDaLKyoq3cJveKKqj/LiE?=
 =?us-ascii?Q?5/eA0gKe7RzbPIfBhWPBGNoiT3Efv1fMkWY/NLCsqFAGjHsdDDmZdR7edvbx?=
 =?us-ascii?Q?SDqjWN1ddCLdoKVJSyPI0/XsqASppc2xsPpIGX+xhiWcd4rmXOEDod0bDv72?=
 =?us-ascii?Q?TpW3ZhZNrTRhnZBTbkKZnBBcinOaJFsiATzV5BkPAFvjSGcEAI6DJmg31h4P?=
 =?us-ascii?Q?udWoOA/Kg7sx1XP6KGwgUWvU9UoeqNuJSyKxP1QRZFuf8+Hckwvm5uaJ4UkY?=
 =?us-ascii?Q?85NKw7b4z44fInH9trCW4OAC6Ta2Rpnt2dcosHH8+/IrhdQpFSibnNStIqeo?=
 =?us-ascii?Q?WjqIXELEhmcYAP9IFkoaZchTq89TEpPN1WMy6AtrlpNKyENWfO/s1ueR7ck/?=
 =?us-ascii?Q?Si9cMidi5dplUpSo3Ffaitg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u3D5Y+S6urRjrN1wmr+8VeiYei4h4yyay/Q6AKjMUalXzZ/YDX47bKxfTHTO?=
 =?us-ascii?Q?WJCmT8Ri7qPWkE21fqN5hynCSUJLe9P9zi6XMvEvFAPCYC2XiERAvTyOjscv?=
 =?us-ascii?Q?iHnH+TiJgG8PZqVrb7iHSqEyd+2ad7PznInyDjDuPr6CutmWgvlP4dYxI3xR?=
 =?us-ascii?Q?r0qbtv4iTdXhSV7qeteMM5UvjAFUH9LiM7OUwSCbaiWJ1Y0PJsUK2sEYVgz4?=
 =?us-ascii?Q?QqCBgXVSRtFEmMhMkcZng2nxR81im/QmbdRElEeX6pfToQe3iYQI1V7SKwjJ?=
 =?us-ascii?Q?5Ru45lt8Sn3vqQ8J4+y8vWjQMLGdqnY7VD+ycefUtNEtDA2z4M6xjSdpzHb3?=
 =?us-ascii?Q?qmepgwLeXUGThpcBST+td+hZdaRcXGiyP2MB9g9SNyNfyJ0/nYHQGpGHin+c?=
 =?us-ascii?Q?DfyLy6BNbnAykSkaCXn5AQKYCjzi2zzYsKx6J6LoqFbmA9XGILc+tqHnigmN?=
 =?us-ascii?Q?PojxKiUWyobXL+Qr5kYbgvCZW4Ifs7NYiq3ovdBMRchh289ikf13PtEaMyD5?=
 =?us-ascii?Q?ptjTUEiwtKjNBnzDHrxZsaNZS+tW2dWD+XnKMbbp3ZBSobwH+nJgPotazcjq?=
 =?us-ascii?Q?8oQLOjb/9tJOIqPx04Qm/5W1t7CyP3Z9utS2CJYZY6XujRo/xFo3fHqPQ0U0?=
 =?us-ascii?Q?XZkGpuv3q/E/hZ4OPgeHQ1VVG/3NYvU3LqE19kqGvNLv9VbU47f/nBWHX/mi?=
 =?us-ascii?Q?vC6D8mg+6ibsk+Wp2TkZUVVvzecw7khGZkNZYSE12u2nGkxagoB+G7MIqm+p?=
 =?us-ascii?Q?U5kreesKxMDTZ+ga4jkt5/6Z8HvjIiVQtjYSJmCMWbRUNOM+DdIub0p4e851?=
 =?us-ascii?Q?VlQMpujEL5yefbOVF/vCGog2hlGC2IG34GlaHMrINmXEvL09sXy2XPwKOtvf?=
 =?us-ascii?Q?XaLwdehwZVNdmMLSwi4ydNC+Afp7o8fcp1+1gH7CK0PRXywV94gjdGaWMkna?=
 =?us-ascii?Q?o5/ntq1gP+KfFPTuznu88pBZ/cwu8qeVV0jpw+5xqE5sfXp6/j6scH6P95tf?=
 =?us-ascii?Q?jJxroXNJDmVdwsZWVkttX0h0hy5TgTYdXsf0jlAkSqzKM8c8X+qE4FAc7v/j?=
 =?us-ascii?Q?Q4o33Tf7UK7Y/wJJ59O3Q/RTKXOV81tPRLOJYevsEz7F9iY4eeBWoATnst81?=
 =?us-ascii?Q?wuT3EanpppDvK+W1iq9XZlNgf0HjSd2z1d/FhhXCBOrEd3ygVPMzeQAKtfLv?=
 =?us-ascii?Q?bR0+5yfxZaGAB9pgCY/+KjqSGvYSfzBAz0wuF0g3li2kdgotWc37f33F8fPH?=
 =?us-ascii?Q?k8yYq2yqdFmq2zQhDEOe0HHjKgh39vIvcnWvRhoVpqweG00S3j5Wg0fzl6/2?=
 =?us-ascii?Q?kffPJKtKO0wYZsqFf6XewuSZ5pF5qFSCXQLF+XtCWEKEDNzGwuoqWvq1sOb4?=
 =?us-ascii?Q?VQ8tmlnZ0c3b43a5OaNwiLla31p3g1k4KBvl1tgvgG8fyoFKeXgO3OEdoNiO?=
 =?us-ascii?Q?DtbJ31oShkQVdNqXql81iHML1LEQGOK0Bgz3wjgf2yGSyuKK572gHbv/2Jnr?=
 =?us-ascii?Q?K0RS2wTI/G/EaCyMWhmHTFZw/4rMEcEdXqiKfkk0YAxTVY/ImefeReSVcBZK?=
 =?us-ascii?Q?H2OarzTRWlu0XblqTA5kisOdLM9g+87yAsrbQ4wi4EsK999TEdBSmfJFsFWR?=
 =?us-ascii?Q?SnprF55eb44pExB5IFT+yj8jod7Kra3GQlAJxoRLBpyWfoTW60SijD0nkWyi?=
 =?us-ascii?Q?l004PiWA/9y6GMyOsy26gVJok+60npBu0UkWim+lOP1X/UKhUda0a/WOU+MW?=
 =?us-ascii?Q?ebBfNfK0Nn7FLkxGJorR9T2BOm/NsWU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f16edbe-630b-43cb-16ed-08de5f54feff
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:39.4092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LV65ToxsVUJwF5ahmoJ0DobL5FRLaw78jzD5DC+6b/lDSH0b+10Bdyj3k97pv8GZmz5anGjx59IgGHlxGcJhfDe5Hbm3ymU/n+mRiQ7/lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfXwdbEyAhyOyPQ
 nasDOI6HVPWMESuFVpOonSuHKkF3jd5t8HCIR8xHxs2xtP1D1DXnm6nQRZWyt9PLXgHmFPXwYKN
 hN+tVVAmJdXverueU1VuOG1lMDVL8Sh7ZnuRVfcAaN7blOhiXdHWGOgqSlAGedIEMPrXwBHzGIx
 q+L2bcu89A2HctGIiqReEw+AIoc9gH221EYdPDdqkA7wB+DcSwat5gfirZh1ODJ6fV1h7vrlmHp
 ANyCvwyvCipfeYGNFLZXCr8yTI4LV8ymzKB7LOAdx4jBpdtpl1cagnVSoyWxu9aFPxBTZZIRog5
 O8SU/OC/T/Jr0tHT0KxrDJoYkCJYbEbmejrecUWTe1nxccP8dFkP0/s9byQ2k4b8100My/VO11+
 cnKO2wxZJuMTaMU6kwPI5kx8mLb+mGeaFDOCpFniwd4nJplmzzNjm9XD1Dxwt0bM+naT0P+JG8I
 N+H2lD16d8K1I4pSUvw==
X-Authority-Analysis: v=2.4 cv=I7hohdgg c=1 sm=1 tr=0 ts=697b8d4e cx=c_pps
 a=fjiyZBo1bxGOeg3e+tCWfg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=p_vdLtrgfc09iYJXKugA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SfgLEBFGtJwyfGmcD2VMLdyCrPNRLTew
X-Proofpoint-ORIG-GUID: xp5ErEtGsQfCkF5-de2hBB-rlofHNCVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230150

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust_mininal sample inside the kernel source
tree is buildable and works properly: check that the module can be
loaded and that it prints correctly.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d58ffa80f5..e8374606a4 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -481,3 +481,28 @@ IMAGE_INSTALL:append = " systemtap-runtime"
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_pid.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_by_pid returned a non 0 status:%s' % result.output)
+
+@OETestTag("runqemu")
+class RustKernel(OESelftestTestCase):
+        @classmethod
+        def setUpClass(cls):
+            super(RustKernel, cls).setUpClass()
+            cls.image = "core-image-minimal"
+
+        def test_kernel_rust_sample(self):
+            import textwrap
+            self.write_config(textwrap.dedent("""
+                DISTRO_FEATURES:append = ' rust-kernel'
+                KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+            """))
+            bitbake(self.image)
+
+            with runqemu(self.image, runqemuparams = "nographic") as qemu:
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_minimal")
+                self.assertEqual(status, 1, "Loading rust_minimal module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
+
-- 
2.49.0


