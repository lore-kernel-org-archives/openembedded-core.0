Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EAFCCD195
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:44:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18521.1760453083414526125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UK/5xD7o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2382047737=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59EAhUft3483883
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:44:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Etp46qnkUGsrm1GRrvVV+mn8zwgzV69BjuN1b93HmVc=; b=
	UK/5xD7o6qI/ELxGmwgfBvcP2IN4qWrfc4ArT6trYDWejD2MFESMRFUCUh5gMFJm
	x+TMbCi4nCY5YiMvwkGwxhXvV5S+qkbZNj3GOVllef417NfGM3MIcfnQrEn3JilB
	ufafoVarjqc1lsbKLpNTC2JVFG91QQ8C1Zrn7Shm14b6jM/6RtqHZp7mLCOm1nFP
	RKdaVgzxv8RMWi++2rUD9FR3OsTmdzPFfdp9FdUZjJYZVnZ2iD0OlxpcdRMFo9nK
	pTSXF2AJjzP3jdlIs9HjHZOvpMUQB0sZKzldNa73hzM3A63/J9WS0l4VBfvoPjoH
	Bazp8/+ChKHaDlMzQXvANA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1k3wa-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwQ6XY+E/SqYORwT6fS5doX+XhyRvr/jKajDSEhydoEW+3X0PeEtlAM/U/VcfavcUQozSri3/ySot6KtqCSaCHyMHtOWU7L+GNAdcSuroQT/wV3CswjiZmdYfLCxNxAlbb4f0LDvbgcd3V04ebgwPE3kLerOocTZZEl3xMr5C3aWYPKR4eVb0e0Jr1H+yEExqSxycc2NUWsICRUO5rgbHA7WNCZm+jt5ChX0m8NCssKJwVT1P8z4e/7C1WJxjZcfCP/CSYQsxO2n+Kh5ZJQjPvf00lv84CwIQP49W0AP7hvPAFa5zJ7ciaWpXDpGlSUaMvsMMQSV71JSgKkF81qRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Etp46qnkUGsrm1GRrvVV+mn8zwgzV69BjuN1b93HmVc=;
 b=wBl5QxdM45hzxIDHF04/xpzq501R/QxMobcj9Ik8pU3bRdaHGg3GzadEaB9Qn5yy5kehdo02VuDKA+w3L2DFhBvYa6J7nm4XbcMErBjh4qw6PYy1CD1P1+uj5lPEZL7o6qzeKSqE+TIu4Fhk2LU/S7DCUJ8P1V34JVQfJI7ljYaWEneL00fSxfMCgTPqCRyXFSoNyUaX5NJc/OAOmPulsAnOKIeziaa0woCEjSJX2U9i/z8P2sm3tCnrpJYgykXJsQj4NMkEzpc+HCRx/RKbzrBc914c4lKcJhaCP1KA1v6yt0S5L9sK3y/sSIEDkLSNJpGfHbj70BfL9JUBkU7Svg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Tue, 14 Oct 2025 14:44:33 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:44:33 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [kirkstone][PATCH 05/11] glibc: nptl Remove unnecessary quadruple check in pthread_cond_wait
Date: Tue, 14 Oct 2025 07:43:41 -0700
Message-ID: <20251014144347.536537-6-sunilkumar.dora@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: c680d045-e650-412b-d484-08de0b303018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0ztNHF4CtJYG9jqdB3BfcauV4pQO1uNVTor4qc95BEW7WqAq4hPx7WgAqySQ?=
 =?us-ascii?Q?RDIiQG+OUEHWasLWFehN5qfLMX4eBYTe2fkvSLuaRJPA67QyzExLFITUjZ7r?=
 =?us-ascii?Q?NsjRcyq3zGwwDoum4BmdlsjYQy5NBUhQ4V17nacK1A+w2YylGDfsosvCkB7j?=
 =?us-ascii?Q?S/Ds/pxgEJ/eg+x+jP9fBZHVlOj8U911ZA9xhGf+0B94ai9jbDYmf9xExNHk?=
 =?us-ascii?Q?4wY/+As0iyRRbPIRu4KLsCEW3HKmAsZDYH+gAu7oDbXnY7ZFhrWB9KhLhlTv?=
 =?us-ascii?Q?liR5TKoAsox2COASBM5HzeZ/V2JqaSIClPaJEXwCHejjkUePKHnSrVADdSe/?=
 =?us-ascii?Q?GWLLZec3t/v8DkPT64EWVQp83DLUrWEDuGBBY26MAreW+DEXCpfhII4nBe7C?=
 =?us-ascii?Q?2tTS8tFja8NCwX2TnO4xBJ546qn4ZQdOSq9LCuXZQj5cOF/ya6xtll3/KhCG?=
 =?us-ascii?Q?h71M7M4TWEmmO0FcPhMgHoY/Hr71c8VlgxiqH/3186+GeJRuYDb+/Uk+T9T6?=
 =?us-ascii?Q?LzYaZh7ym/z/Fp/TKSHkqHqp+QrxqcXOY+WaM+g6EYuGDik+DB6OpE3xu+1t?=
 =?us-ascii?Q?414fQt4ywqZtfy7/CKkLD6604NF7RU573WwZFHa+r1GbegWIDw4/v/+Osp+Q?=
 =?us-ascii?Q?3N2tXFg0Qosxc+iRY6xeYfnOUGl9JPQagAbVCTa2XJuBg6fFRuP0UtwtVXem?=
 =?us-ascii?Q?QL6pWzyNmSU60z+UPpSceiKZwdA0SFBkdNm/F8MKP6j3C7dFNKzondTZ94yQ?=
 =?us-ascii?Q?yhxckmM9iU9KpT67aN7Ug6dwUGOcKxEaNtSgK62d7W3r8vHiHmcrFnNLrbRW?=
 =?us-ascii?Q?ljvIb2IPIZHstQIH45iZ1/bfrcWB7qU7ZYPkukuG0D4ucEPBWj9eNvtyrSFE?=
 =?us-ascii?Q?+ebY4vmKTvLUSoFhN7u/KiK+bckjqQ7AYmlDwS37ATHQpNCwp2+0Hw0F9SGy?=
 =?us-ascii?Q?1yIqD2w/7IUDrp2qk2y/DrBvpDYazFLczDSG5NclT6qkVL6eM2KLhT1kCFu+?=
 =?us-ascii?Q?+nckaScgyps1FlL79cBh+IbN2kriYPDa820rkK+WtSY5RIIcpUHQYfRDdJ7o?=
 =?us-ascii?Q?+YvQhuo7ZDCBxqPU3OlZT4uq6DdxFb84JoSYExYMBtSWQRaZ8cwvAhqxURsd?=
 =?us-ascii?Q?DRopPjHMnhd+dzvs51V3e2b8XdH/Lm2bvTAF4TlDGNEpmw/+mi1yfOCA+oj4?=
 =?us-ascii?Q?9onud/3kTM51T48fNEkbfqDDNkSq2qCzzpXfmRqsZfpTdxmcWcARp5JQ9wwE?=
 =?us-ascii?Q?DfkyhegTJ9xrfsEjbRmD2ViFMXxpYdWNqX5hva8HI7R9j5KAdO2Sq3qaJR0E?=
 =?us-ascii?Q?HK8SOEyE2PjNZ37VtpMIUZ2+m2Qib48lR5S5C7noXD0QPYPW8gbM1Zu+2U+I?=
 =?us-ascii?Q?HgXPZMO7WMPPu/BtvTCmXYEFByh0nKIfJcC/uV32uxmITwX4121GmH20nJyl?=
 =?us-ascii?Q?CrzKS30i0nQxXj9u+y1OPNm+2kBOaEZncmdZqByRm7JclkudLAOlUw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?99EU9wGb5dA48PMGt/rtBH39gNF60Go46Tv/dyZgeu7BKjW5kmkR2vwFOGcV?=
 =?us-ascii?Q?9ipvQpv1CRsSk3ZphfhwRjH+hNVTQWzLNCQCW/knZZJ4Gfk7/pesPbHek6kv?=
 =?us-ascii?Q?QHC3iD+lT5MNXm/eX9UuPrHOT1iaQ90uWuvN7n6DOvceBOwz4QqQCwwWXnWs?=
 =?us-ascii?Q?gqNAftajlWl9DTLOENjmcbqT5BgjXLb+NJYslvT1LpCXybSrM6IV9Qm7M0KR?=
 =?us-ascii?Q?2qLtE9To0AQj8ZfeGWZnMKVNV6QW41nZ9AONTrvO6aXzk25PQsQunHMbKTmV?=
 =?us-ascii?Q?m3946syZcdzXZd3wqd8qsnBmcpsNHKiJIOP4slm6JAlZC40K+KXElJ84KH+e?=
 =?us-ascii?Q?0nqHoQN/KuwaUlLNQmHPfERWfdhOyOLXruHJ7v7sWAR8R6aAkfc4ny45Wcck?=
 =?us-ascii?Q?oDr2SPnPLk4w0OqZmiKNffIOQEeAgVOQxi03xnkFxqRxsiQP0Ko6xM7rN9eN?=
 =?us-ascii?Q?xFGe1hciuO1g2a2ecsLXQ1BWScKTFZPxX/pM05kCuV+XE2W8dAG/lV8xbNGA?=
 =?us-ascii?Q?CiZBqtkLhCI5+nkIKpSqCviGJCRHC2zIU7YfbNSsojxxwmE7C5G+l8LVI3F1?=
 =?us-ascii?Q?WXi8d/ORg6d/0QD7jNaBiLlDViqkAf2alPWKv9ly96gz2Hg69/HutwQmd2O3?=
 =?us-ascii?Q?S2BJ2MBYu0tIv023Fyh2Cy9jEzpSOgm0xa/gt8AyeylcPXY6N5BLjGnowmem?=
 =?us-ascii?Q?yGeA3ZwM4hkM3H4u/t7LIflabOY6KOjmGUBW3p1i4szenGjGaM1LpqkkNkXu?=
 =?us-ascii?Q?OskrkdZQaBGU42QzJIAZlvFYbmTKpW/pis3o6B/NkooyR6yFfH3dhS+1ydlx?=
 =?us-ascii?Q?mDSwmWSsWPelevA9qwtdETqKnAUvb3lj9545Tm6osWl6qxGpBXgF2wYiYuig?=
 =?us-ascii?Q?MmZRxmnUYxIotqZl9ocRuxRc2nRXVfxHzBrLLDVWaYAsIck9wBKGhfTLCvtU?=
 =?us-ascii?Q?wBXAQ4fQABniyLXPjONufpn7yaoW3hLkjK0JYgAgBYYTZo6r/ne43NqzOf0M?=
 =?us-ascii?Q?C3ruXQ5YEw77RM9S+bjd0qVnO5b9s8jvlOGB6CJlys0gN0B1Rvmtfgb4KmNh?=
 =?us-ascii?Q?MVuf4KsrTUcmHeOjY58wmIBwiaEdZJbnV1Kz4cEitJYz6SAlkZ7wyY72plSE?=
 =?us-ascii?Q?UCuu515kn6+UlEFh83MX0w+HD6p/ACs10NO0IAJR6jgVoKnfpfpg7n2SBClN?=
 =?us-ascii?Q?cIQnttzLQx4aDESakxiSz/LAaSfBrzYm3NlhcRnS9TFndkCSTgTm4vsgxTeK?=
 =?us-ascii?Q?hpNrEr2EIkTsckd8mJqOLMPVi0oLNRidX1mbHbWMVpcVKdFtWe4L3yCy/IRS?=
 =?us-ascii?Q?WWDfxRl3R3RyHUzrWo4CDUb7YJrPJ85rXMfuCSWAv4JDR9UTv4fyZXDjls8e?=
 =?us-ascii?Q?CVHZNEy97TVgTHltLGXy+JVGzk601osi5/kFd3WkCExGEKlT+Pugk4rH4OYx?=
 =?us-ascii?Q?bupy9T+lYrmpS7fbzFEfVWeP5dPQ8YL+E4YVbMdq5OSqODcxDeaTm+AHYqwd?=
 =?us-ascii?Q?fz3BmQnlGK2aq975lEyijhPalboME27nUgswAV5XxMRoXpJG8Ra/vb53Bbnt?=
 =?us-ascii?Q?eUa8JyGKHnOiCz094LnCU22CKaMPFLr9pkhm330W+ky+vEfEzEhhtM4bdIut?=
 =?us-ascii?Q?cJLvyMt9BSZILlBmdKlZGic=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c680d045-e650-412b-d484-08de0b303018
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:44:33.0190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hz09txHAKaaI/qFQltTICqk1exNdGw0AUK5VqgFnbqIbU/xHmG+c39fZQxy3eKXFdA9F1ELOFZH0SjLlhE3oVFtihg8947IQ2fqM7QwrC34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDExMSBTYWx0ZWRfX9IpCRGVHrmGr
 2XBRZV41xfEIR7sKjfGoYZL9DMweKixUla00wdu+yAgDncFw9q4bMkAT5eyf/QGLxfOg+x8p6A+
 GOyyN5jpbZiTVX+uVfsAZvNOBLr2igCKFn0IDx+HFIJzT1pFECEj4LXwQsT2ANDKPGSKiEnwWJW
 4yShqzV/cbIryRi/I7TYCxM+Tfwj8p4YAJHOWwp7w7GPLw9u+a92IPNQhsPfYKfqJMdoMoRthkA
 tndzh+i76XZ7dnSE58N2eHXyZIHEM3Wc9mYMj3n4RMOACDKE1tvxIKYFcLbhza8b8+J6EanHcSw
 bY7D7mPwuph5WyvuK9NAeyMkUCC2Rkg4A1iPoXsMG5mE1DsgnC9i42tXDbnRuhPtv8ra6whQPuk
 /SHBDFmajRYItN4Igxyw52jC6l2QMg==
X-Proofpoint-GUID: 3TG_uGEl5kZMY9P7prWdMNtTLBJqlS0P
X-Proofpoint-ORIG-GUID: 3TG_uGEl5kZMY9P7prWdMNtTLBJqlS0P
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68ee61db cx=c_pps
 a=7v6vjeP3yXOm/Y6ajRpg3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=NpP8qUlCxzQSevXvkUwA:9 a=J_S6sDf7mcgA:10
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224825

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=4f7b051f8ee3feff1b53b27a906f245afaa9cee1
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002276.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-4.patch          | 118 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-4.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
new file mode 100644
index 0000000000..475462c880
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
@@ -0,0 +1,118 @@
+From d714165c8bb3cac420077cfa61e3df87ea7f8b2c Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 05:34:06 -0700
+Subject: [PATCH] nptl: Remove unnecessary quadruple check in pthread_cond_wait
+
+pthread_cond_wait was checking whether it was in a closed group no less than
+four times. Checking once is enough. Here are the four checks:
+
+1. While spin-waiting. This was dead code: maxspin is set to 0 and has been
+   for years.
+2. Before deciding to go to sleep, and before incrementing grefs: I kept this
+3. After incrementing grefs. There is no reason to think that the group would
+   close while we do an atomic increment. Obviously it could close at any
+   point, but that doesn't mean we have to recheck after every step. This
+   check was equally good as check 2, except it has to do more work.
+4. When we find ourselves in a group that has a signal. We only get here after
+   we check that we're not in a closed group. There is no need to check again.
+   The check would only have helped in cases where the compare_exchange in the
+   next line would also have failed. Relying on the compare_exchange is fine.
+
+Removing the duplicate checks clarifies the code.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: 4f7b051f8ee3feff1b53b27a906f245afaa9cee1
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002276.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 49 ----------------------------------------
+ 1 file changed, 49 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index cee19687..47e834ca 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -366,7 +366,6 @@ static __always_inline int
+ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     clockid_t clockid, const struct __timespec64 *abstime)
+ {
+-  const int maxspin = 0;
+   int err;
+   int result = 0;
+ 
+@@ -425,33 +424,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+ 	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+-	  /* Spin-wait first.
+-	     Note that spinning first without checking whether a timeout
+-	     passed might lead to what looks like a spurious wake-up even
+-	     though we should return ETIMEDOUT (e.g., if the caller provides
+-	     an absolute timeout that is clearly in the past).  However,
+-	     (1) spurious wake-ups are allowed, (2) it seems unlikely that a
+-	     user will (ab)use pthread_cond_wait as a check for whether a
+-	     point in time is in the past, and (3) spinning first without
+-	     having to compare against the current time seems to be the right
+-	     choice from a performance perspective for most use cases.  */
+-	  unsigned int spin = maxspin;
+-	  while (spin > 0 && ((int)(signals - lowseq) < 2))
+-	    {
+-	      /* Check that we are not spinning on a group that's already
+-		 closed.  */
+-	      if (seq < (g1_start >> 1))
+-		break;
+-
+-	      /* TODO Back off.  */
+-
+-	      /* Reload signals.  See above for MO.  */
+-	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-	      g1_start = __condvar_load_g1_start_relaxed (cond);
+-	      lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-	      spin--;
+-	    }
+-
+ 	  if (seq < (g1_start >> 1))
+ 	    {
+ 	      /* If the group is closed already,
+@@ -482,24 +454,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     an atomic read-modify-write operation and thus extend the release
+ 	     sequence.  */
+ 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+-	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-	  g1_start = __condvar_load_g1_start_relaxed (cond);
+-	  lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-
+-	  if (seq < (g1_start >> 1))
+-	    {
+-	      /* group is closed already, so don't block */
+-	      __condvar_dec_grefs (cond, g, private);
+-	      goto done;
+-	    }
+-
+-	  if ((int)(signals - lowseq) >= 2)
+-	    {
+-	      /* a signal showed up or G1/G2 switched after we grabbed the
+-	         refcount */
+-	      __condvar_dec_grefs (cond, g, private);
+-	      break;
+-	    }
+ 
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+@@ -533,9 +487,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  /* Reload signals.  See above for MO.  */
+ 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	}
+-
+-       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
+-	 goto done;
+     }
+   /* Try to grab a signal.  See above for MO.  (if we do another loop
+      iteration we need to see the correct value of g1_start)  */
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 0787dfe236..f9086c0855 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -65,6 +65,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-1.patch \
            file://0026-PR25847-2.patch \
            file://0026-PR25847-3.patch \
+           file://0026-PR25847-4.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


