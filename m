Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA56CCD197
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:44:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18522.1760453084462217219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TE21ff2o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2382047737=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59EAhUfu3483883
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:44:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9vt1BQv9JO38EFlSHTPNTdJKA+JXXgN98DEo30igjsU=; b=
	TE21ff2o6NYCvE4F3c/mFjVdglnZ6YfhcvmgmOTdLcrIysFLc9800VRBoF5wckLE
	NnbKcfU1Xb5CE9xkRE2RvKcWqO2MfAdMRr8GqTsR4FPnjKov04kfoSRHJdP4Vss2
	f5zq/B4NCOlEQALY9+XdldInr7CtFSd0jtu2w3trjl5B+VVP66T0QwAgJei2iBwF
	tt8/5p7a+f1w0rO+0otXKHip58w/WOEN7kByC20MExlUg/omn0QtrUIMqS/4laBP
	EAt2Uomg+fZw9Iju/TR4sesXW+s/sv1Ns1/WxSyQtkk+QYQyh40emoxZqsRV7ZW6
	b4T70NwUDpOLVvN6jewMJA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1k3wa-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmHtc4wdQP6T8zbYxuvvVjxwjnpf4V56miQDi/+kZOTQivqw/eYPMueQPb2bPEmdc6K2zwW5PUHx4ywpLNjsU+kFlKqI8vJW1QTjJjAVIZvgUhV89sod6IoTUZZEmxKpW7YKKUEyIdB56N+sbe0D8Nf40V03byqY+sszV/rb6rg/6TPFt/9Jf1TEs0g5/AL4mTy8DACQMZ0wnmuOIsDKSUJQuAoH9bFkeVtiQuFFIatgN9fKd0nCNvFd+JJZ38ORpx5Ou6sj5PhrO/kJ0zPh0kgrqogvhT8/xk+Nvh3pLWkez60giyVIsVywA9l4JCGp2JE+OjC4ZPkU8J6xhIpCBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vt1BQv9JO38EFlSHTPNTdJKA+JXXgN98DEo30igjsU=;
 b=KFl+n/BH9mY8dcXsPCXAWwybWNemN+K3DSr5e2wGtN5f6eAdsaLv8RM8aiWJEfeSV5a0zZw4+M4+pbMPbxPggRA52X+Ytm9VH7Q7HkgAlx833FkTEJgXtC2zCb8XEa/q+giJSbjU9Wq6NJDlsHduVFUzoatDGSDKiRK0ltdvtUnDU/G2wOAnBv4gWBeNMlVLlf0fKNdIAboOidYQho2al7gyppPv4pNwq83baCeXnHTgsdcCjnwY7Raxdxj9szML7o6ewmrJ5ISg5qaU2mMMFMYPDshXNCf1est02jBd79Ou1eg8+6DB/nC336n27msvmh+I83v7UMRTZCd3+T/X4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Tue, 14 Oct 2025 14:44:36 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:44:36 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [kirkstone][PATCH 06/11] glibc: Remove g_refs from condition variables
Date: Tue, 14 Oct 2025 07:43:42 -0700
Message-ID: <20251014144347.536537-7-sunilkumar.dora@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: cf9344e2-a7de-430d-84f5-08de0b3031f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ySvbzBYUThI/njTPD3HkBGNiyqvngUQ2h8s2OmEAFZoZH6Ei/nJWIjNqbXta?=
 =?us-ascii?Q?VKlnQL0xFd8Zqp8CtrMjgqsbfUfDWj/pixYBwsfqajCpoA6ofd/iwx1h705D?=
 =?us-ascii?Q?DtEO+bx5CkLD2CuW4A5KDtwHvKg5qh6v0+kT70etVLXGH9B0MGs/wpi9u25O?=
 =?us-ascii?Q?C1u1FR4l6EN6H8XIi+WRk/cYx8hC8JR0QVRLqPolHfF+kyPwOChrTs4VRDCT?=
 =?us-ascii?Q?Xxm4aYlBZIlaoaIDFR4HcuB/5B3oUm+SARGHKgRtRPQjfpTomgOVHvTulILu?=
 =?us-ascii?Q?qyt1v7j25hSnU25icEcQVJrz7C/9zRR0qfPyTpD4uf4Uil2ciTYTg9S8iNVV?=
 =?us-ascii?Q?0yfeX3P68+JQ45j5+n4UGNG/zVGaGEDUawnvIASNbHIPSS7bKJkVw0kAdGs/?=
 =?us-ascii?Q?08FBUFzNNNbHAF3YYJRzwMiY/msfSAz4cCiItwQ2UAY5k2Qys00X8dKCV+Iw?=
 =?us-ascii?Q?L3nNrkRRzpmeR1SG77gRA84HgqFkM8TtFV621gumEmECfAHmUz+369FKAjMx?=
 =?us-ascii?Q?1ItlI+I28RFFDL0pGS10SOYng1qup/ua4O0+zoLgcRh7qCZfeBFOAIwL0r7i?=
 =?us-ascii?Q?7hcD9md/Od24cjArfz3STZX3k3HiA53jcG4AMh11abzH6WQ7gYLSPoUJpc60?=
 =?us-ascii?Q?Pj1pqAQbCm6iqU1k6FjrbLmaGhVfdR0K/LPG1Efcl9s+J8OAaS71MDXaenJL?=
 =?us-ascii?Q?koyM1FzaC0IsYaVYw7B/k6EP36JwYei+nmoSJ/Eevb6KtdldWV40sQ4CxcqQ?=
 =?us-ascii?Q?jEfbZvs//Tv4e6UJyqQRwMsAeh47dCcbah5VxAcFFpRxIWiwbb1FQjmZKino?=
 =?us-ascii?Q?3k0M2f17gDxjInrEWsZJ8JaH3Kyx5VYRwI0pfXfdJ6mo9wdfg7AUuHLWDRWr?=
 =?us-ascii?Q?i0Ioin+Pqt8yAEnzstsR1Z5DZCvcYuTRhYS/PVf4vRCSUr/lKFbHiyOCwpxm?=
 =?us-ascii?Q?cAiWpXDTiCT4+qgDO/VfuR22DoM50Rn9z53frh8YbPx3f5ecZ2g6C05Gwu9C?=
 =?us-ascii?Q?M1DYuULAZJ4h0WNq9G9KzRxrtWJGLQe90XY4VpKDPcKW+mOXcCBfngtVnsEi?=
 =?us-ascii?Q?T8nei6ZdKdQBmxkry4jnNTI0Etz5ccWKzYrU/oohPABgPnPzB/h9TDMpglVj?=
 =?us-ascii?Q?T16yuyyDoaYHPPZoQ+Sfk3Uu0pyx9hvsAsBilnk7mtUifklyvFky9G0ey0IL?=
 =?us-ascii?Q?YQCKc7T/SCDMbkgsFVLevxpKU9nBpUehmOxPjtEglJ2eCF9zcbO5KbQSyMhY?=
 =?us-ascii?Q?552yePiT0oMfeZM7OhsLaMlciI8ktD9kRxfJJqUSTKnHR/3204slE6UFuOhZ?=
 =?us-ascii?Q?YFN9uBZc2u7sjs+pwGjEXcesb4uwwVJ442Q0hFw9hsg8/qAyQ+vBJ1P9vDT8?=
 =?us-ascii?Q?0itkxQBs1tjjvumAgEHfqWdMLgqdFFt68+3YfwMWm5lPgd778goiMOJuCgtw?=
 =?us-ascii?Q?sQOvo5b9ZBsK6+oBN3zHeCqNgbMuHBzOGqSdsvG9S0hRZdXJsdThZg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XHNvcF2OdQ05PN7Ip5xtlrkCnZzIWTs86HSYIFzDPQqXj+U84z328gxQsV84?=
 =?us-ascii?Q?b54jeZ2B9JD9YScoP5G/3CRr67oQpuN9TC2y42Ho/eSfZ7Lc8ejAloGQpadb?=
 =?us-ascii?Q?7n99f39KJ5dOEIAF6UJFavMTRZylyzRLH+isBDba8beIQnHa+WJbu5iqBeZM?=
 =?us-ascii?Q?XmVjFYAzzAgAcNhMeR3o1Ca9arLJKBj+h82l8TmPuYPsp6E+uAX4HSkuk95k?=
 =?us-ascii?Q?yNZWvBSvSYfk2CV+/GQ5spiAmMSTQq032sLGfXToWaTyeznADKkXBRg5p16c?=
 =?us-ascii?Q?OOHEzxeY4KL+7CbzYEFOPs7Q0zk51yHGQW8tq4sLDKxLakVUhwP5iwuth1zk?=
 =?us-ascii?Q?wV4O6VOOVr+rqKPBXsPmDTzPF8hymtqXGtoq54Jv8CpzH9/mN6i02NB8iD7F?=
 =?us-ascii?Q?Sl+nhMP2VgUxN9ZBkJGi/gzfIXfRVjGJG7YJC8WGe0WCtnsvUt3OEjm8Mjrw?=
 =?us-ascii?Q?Bq1/hIRiGzlMYkyItFP/xtulJZlgKjtMm4B8NXkCzpRG6B6+MrddfSyb/RM7?=
 =?us-ascii?Q?QwiLqLU0G4Y0mxE88Eoyo4Um5x2MfrW6hQzpT/tufaviTX3Ll3iHFeBEEoEF?=
 =?us-ascii?Q?T4KfqZ5sz7uCISC5b50Hygr8a09sH2w3IiePDV2U1aSxGoAQSqNr6c8ndrtL?=
 =?us-ascii?Q?0JYYXS39sd7v2nbXeci4nETzNFUQ+rvt88zNrGOuGt4ChmHjM/gWEvRzg3WP?=
 =?us-ascii?Q?sup3jCwxaq6LHbDxVrotZhFqtRsDSec8wl1p3FkwHZffBg8qstTBsbYpimBr?=
 =?us-ascii?Q?/8TvU9/Z8Qff7lvXhG2hPXyruMMmFxBA4lMijAe0F7R2J83eayM9oZaGLd5L?=
 =?us-ascii?Q?AXXlAb/DnL5TBGEGErZ0cjnngRlm96nhrq/nPY0weA1J7idQywHQrkhcvD/L?=
 =?us-ascii?Q?jdvK2waSIe7Jmv3/SR8cJIAJbyEPfHRmwMg9TQipo8F6ll6mZN2pYKj45F71?=
 =?us-ascii?Q?KRbnVVpEc9Lrt38S64qzEA9xnvTWuFyrMqEMxEB8pdYMob7MUvOdXKLwNKMg?=
 =?us-ascii?Q?Pqbcf+614FAwCmquWDlFqnoP5d1qKm4fI/ELPGqPxNtyofM5A1PO9tgRnGZb?=
 =?us-ascii?Q?/TPwX1VnMio9LXC10BaG8HzvzxKn0mweT+3tVdTDks6S6x7luxDqnpfJQ59n?=
 =?us-ascii?Q?0HKWPtH4dW7bLKfD/tXG4iE16+wyWlXp1u112A2FIUr1YVdDfcTgjQcFl3/6?=
 =?us-ascii?Q?d0k0Shn2dwVQGZDdGz+7RDxKlQxa8pLT6Vw3WOcgdiASsKKChsYqWzq13fDY?=
 =?us-ascii?Q?Fx599nSeePHZT9oCctQoz3Lyg0dkJiFqOdDjixILle5Aww/qFIAHxs27latf?=
 =?us-ascii?Q?TqgSbv0qncbe3RANozEV8z4dqWXwRUodI58fO7dT/qk6w57/Q3jmFntJKOGJ?=
 =?us-ascii?Q?YJCRI4qc8yudiBX1IqAEFEM8djMlZaGfFqciyvFIJRRX173H5ft/HtL/w2oa?=
 =?us-ascii?Q?vF8o2zE1+VCTC/cdVqWxw0X+8eZA+5VGrMRneDReYLcjNMeSaOMDVPJlQcrB?=
 =?us-ascii?Q?Q2BJtOsWfIAuWIPXFxnjQWomDjtvTubcv9wuDkouJpI8tfgQOGiAgKEYJSny?=
 =?us-ascii?Q?humSPZgvcEi/fR+tftaFIh/FXejA68Ua/A9dPejsS9PRUC3isrwsKsUEFz8Q?=
 =?us-ascii?Q?IojAhlqrjpmFTx6S79D8GSk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9344e2-a7de-430d-84f5-08de0b3031f6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:44:36.0542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJz+xUTlgBBWUhymSx3yoGxZYm47OF/aqiDRX+PFgtvnwC6Q17+Y7gJ4o7YNxgmHEjXS+Z/R2QXTfo8YsIeZnIvetB6oePVZuvCEdwM+S+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDExMSBTYWx0ZWRfX54hdnOWJI9JN
 Y/WEyEX3YGPe4SaIGPqMjd+BHeM7w7VFLjIapPf0jcDHtVaUMPkrZUXVobZVInBTmA0Y2fobEWg
 0zY0QosknDLx8u9j0wJH+aCABnHYsz7W2XfVHky163yL2gBAYhGHXTQBhJ1n8Bmeo4mSXViyM0F
 8guuEP83efSxfaFSdGN0ZB7HjSwtIgrhQrf3qAUKgHJxDkGYUsKHcxQ5KTfl3SSlSfX9bG5k/cu
 5X4Ly+o6eZ91InrMnXFqCUJeWOyJH9SX1IOnunhuysxS+NUvqu/lPikJ6s+JjUCeBWiZM7D5bS7
 yozMuzVL5pZVlCnf9xVf+a5rS8Q2xvadWEkPLhayP8lTrNUdo18rWaGKp9iIXwjH+usqUU89wOm
 kARcGhgXzsnm5KFBkZhpX5/akpoNzQ==
X-Proofpoint-GUID: WqoNKqgkSm-6DVpJsYXqD-T7s1swNOy6
X-Proofpoint-ORIG-GUID: WqoNKqgkSm-6DVpJsYXqD-T7s1swNOy6
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68ee61db cx=c_pps
 a=7v6vjeP3yXOm/Y6ajRpg3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=7OpmKx5D2OvMmZ34HLoA:9 a=xzAyb1i-fe4A:10
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510140111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224826

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=c36fc50781995e6758cae2b6927839d0157f213c
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002278.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-5.patch          | 188 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-5.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
new file mode 100644
index 0000000000..e50e942471
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
@@ -0,0 +1,188 @@
+From f904a81ff8d0469ceaf3220329e716c03fcbd2d3 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 05:59:02 -0700
+Subject: [PATCH] nptl: Remove g_refs from condition variables
+
+This variable used to be needed to wait in group switching until all sleepers
+have confirmed that they have woken. This is no longer needed. Nothing waits
+on this variable so there is no need to track how many threads are currently
+asleep in each group.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+cmmit: c36fc50781995e6758cae2b6927839d0157f213c
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002278.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c                | 52 +------------------------
+ nptl/tst-cond22.c                       | 12 +++---
+ sysdeps/nptl/bits/thread-shared-types.h |  3 +-
+ sysdeps/nptl/pthread.h                  |  2 +-
+ 4 files changed, 9 insertions(+), 60 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 47e834ca..8a9219e0 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -143,23 +143,6 @@ __condvar_cancel_waiting (pthread_cond_t *cond, uint64_t seq, unsigned int g,
+     }
+ }
+ 
+-/* Wake up any signalers that might be waiting.  */
+-static void
+-__condvar_dec_grefs (pthread_cond_t *cond, unsigned int g, int private)
+-{
+-  /* Release MO to synchronize-with the acquire load in
+-     __condvar_quiesce_and_switch_g1.  */
+-  if (atomic_fetch_add_release (cond->__data.__g_refs + g, -2) == 3)
+-    {
+-      /* Clear the wake-up request flag before waking up.  We do not need more
+-	 than relaxed MO and it doesn't matter if we apply this for an aliased
+-	 group because we wake all futex waiters right after clearing the
+-	 flag.  */
+-      atomic_fetch_and_relaxed (cond->__data.__g_refs + g, ~(unsigned int) 1);
+-      futex_wake (cond->__data.__g_refs + g, INT_MAX, private);
+-    }
+-}
+-
+ /* Clean-up for cancellation of waiters waiting for normal signals.  We cancel
+    our registration as a waiter, confirm we have woken up, and re-acquire the
+    mutex.  */
+@@ -171,8 +154,6 @@ __condvar_cleanup_waiting (void *arg)
+   pthread_cond_t *cond = cbuffer->cond;
+   unsigned g = cbuffer->wseq & 1;
+ 
+-  __condvar_dec_grefs (cond, g, cbuffer->private);
+-
+   __condvar_cancel_waiting (cond, cbuffer->wseq >> 1, g, cbuffer->private);
+   /* FIXME With the current cancellation implementation, it is possible that
+      a thread is cancelled after it has returned from a syscall.  This could
+@@ -327,15 +308,6 @@ __condvar_cleanup_waiting (void *arg)
+    sufficient because if a waiter can see a sufficiently large value, it could
+    have also consume a signal in the waiters group.
+ 
+-   It is essential that the last field in pthread_cond_t is __g_signals[1]:
+-   The previous condvar used a pointer-sized field in pthread_cond_t, so a
+-   PTHREAD_COND_INITIALIZER from that condvar implementation might only
+-   initialize 4 bytes to zero instead of the 8 bytes we need (i.e., 44 bytes
+-   in total instead of the 48 we need).  __g_signals[1] is not accessed before
+-   the first group switch (G2 starts at index 0), which will set its value to
+-   zero after a harmless fetch-or whose return value is ignored.  This
+-   effectively completes initialization.
+-
+ 
+    Limitations:
+    * This condvar isn't designed to allow for more than
+@@ -440,21 +412,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  if ((int)(signals - lowseq) >= 2)
+ 	    break;
+ 
+-	  /* No signals available after spinning, so prepare to block.
+-	     We first acquire a group reference and use acquire MO for that so
+-	     that we synchronize with the dummy read-modify-write in
+-	     __condvar_quiesce_and_switch_g1 if we read from that.  In turn,
+-	     in this case this will make us see the advancement of __g_signals
+-	     to the upcoming new g1_start that occurs with a concurrent
+-	     attempt to reuse the group's slot.
+-	     We use acquire MO for the __g_signals check to make the
+-	     __g1_start check work (see spinning above).
+-	     Note that the group reference acquisition will not mask the
+-	     release MO when decrementing the reference count because we use
+-	     an atomic read-modify-write operation and thus extend the release
+-	     sequence.  */
+-	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+-
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+ 	  struct _condvar_cleanup_buffer cbuffer;
+@@ -471,18 +428,11 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 
+ 	  if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
+ 	    {
+-	      __condvar_dec_grefs (cond, g, private);
+-	      /* If we timed out, we effectively cancel waiting.  Note that
+-		 we have decremented __g_refs before cancellation, so that a
+-		 deadlock between waiting for quiescence of our group in
+-		 __condvar_quiesce_and_switch_g1 and us trying to acquire
+-		 the lock during cancellation is not possible.  */
++	      /* If we timed out, we effectively cancel waiting.  */
+ 	      __condvar_cancel_waiting (cond, seq, g, private);
+ 	      result = err;
+ 	      goto done;
+ 	    }
+-	  else
+-	    __condvar_dec_grefs (cond, g, private);
+ 
+ 	  /* Reload signals.  See above for MO.  */
+ 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+diff --git a/nptl/tst-cond22.c b/nptl/tst-cond22.c
+index 1336e9c7..bdcb45c5 100644
+--- a/nptl/tst-cond22.c
++++ b/nptl/tst-cond22.c
+@@ -106,13 +106,13 @@ do_test (void)
+       status = 1;
+     }
+ 
+-  printf ("cond = { 0x%x:%x, 0x%x:%x, %u/%u/%u, %u/%u/%u, %u, %u }\n",
++  printf ("cond = { 0x%x:%x, 0x%x:%x, %u/%u, %u/%u, %u, %u }\n",
+ 	  c.__data.__wseq.__value32.__high,
+ 	  c.__data.__wseq.__value32.__low,
+ 	  c.__data.__g1_start.__value32.__high,
+ 	  c.__data.__g1_start.__value32.__low,
+-	  c.__data.__g_signals[0], c.__data.__g_refs[0], c.__data.__g_size[0],
+-	  c.__data.__g_signals[1], c.__data.__g_refs[1], c.__data.__g_size[1],
++	  c.__data.__g_signals[0], c.__data.__g_size[0],
++	  c.__data.__g_signals[1], c.__data.__g_size[1],
+ 	  c.__data.__g1_orig_size, c.__data.__wrefs);
+ 
+   if (pthread_create (&th, NULL, tf, (void *) 1l) != 0)
+@@ -152,13 +152,13 @@ do_test (void)
+       status = 1;
+     }
+ 
+-  printf ("cond = { 0x%x:%x, 0x%x:%x, %u/%u/%u, %u/%u/%u, %u, %u }\n",
++  printf ("cond = { 0x%x:%x, 0x%x:%x, %u/%u, %u/%u, %u, %u }\n",
+ 	  c.__data.__wseq.__value32.__high,
+ 	  c.__data.__wseq.__value32.__low,
+ 	  c.__data.__g1_start.__value32.__high,
+ 	  c.__data.__g1_start.__value32.__low,
+-	  c.__data.__g_signals[0], c.__data.__g_refs[0], c.__data.__g_size[0],
+-	  c.__data.__g_signals[1], c.__data.__g_refs[1], c.__data.__g_size[1],
++	  c.__data.__g_signals[0], c.__data.__g_size[0],
++	  c.__data.__g_signals[1], c.__data.__g_size[1],
+ 	  c.__data.__g1_orig_size, c.__data.__wrefs);
+ 
+   return status;
+diff --git a/sysdeps/nptl/bits/thread-shared-types.h b/sysdeps/nptl/bits/thread-shared-types.h
+index 5653507e..6f17afa4 100644
+--- a/sysdeps/nptl/bits/thread-shared-types.h
++++ b/sysdeps/nptl/bits/thread-shared-types.h
+@@ -95,8 +95,7 @@ struct __pthread_cond_s
+ {
+   __atomic_wide_counter __wseq;
+   __atomic_wide_counter __g1_start;
+-  unsigned int __g_refs[2] __LOCK_ALIGNMENT;
+-  unsigned int __g_size[2];
++  unsigned int __g_size[2] __LOCK_ALIGNMENT;
+   unsigned int __g1_orig_size;
+   unsigned int __wrefs;
+   unsigned int __g_signals[2];
+diff --git a/sysdeps/nptl/pthread.h b/sysdeps/nptl/pthread.h
+index dedad4ec..bbb36540 100644
+--- a/sysdeps/nptl/pthread.h
++++ b/sysdeps/nptl/pthread.h
+@@ -152,7 +152,7 @@ enum
+ 
+ 
+ /* Conditional variable handling.  */
+-#define PTHREAD_COND_INITIALIZER { { {0}, {0}, {0, 0}, {0, 0}, 0, 0, {0, 0} } }
++#define PTHREAD_COND_INITIALIZER { { {0}, {0}, {0, 0}, 0, 0, {0, 0} } }
+ 
+ 
+ /* Cleanup buffers */
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index f9086c0855..e744260e87 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -66,6 +66,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-2.patch \
            file://0026-PR25847-3.patch \
            file://0026-PR25847-4.patch \
+           file://0026-PR25847-5.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


