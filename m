Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00E2C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 10:09:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15269.1750154961827394090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 03:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8263d137de=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H3t1EH005586
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790282v5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:20 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55HA9K1a011535
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:20 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2040.outbound.protection.outlook.com [40.107.212.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790282v5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 10:09:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVKX1BXmX0QdAmwYe/WCUAMx75gzZofWlcIXJqAwHM/Qa2FUeQWNaEveDhysHwvlrgyVCY3hOsbtfN51x3Kk8wNgMrxI5CzOkqesrin/kcV5A05LlPafyzruWCdpjKckAtw+2els0PZkFFbjHpSz4DNLE7tSnSIG3sa8001Hrybe2aEu42ISJBgZQ0ADN0fDGHqliVDpTAjPI330Fd+DQHM2Hdplx2ZKIGO4wJjbXFLlSt4MimdTpt6kAdC5BKm04p2hz3mGGj9DSw6y4XbYTm1NRoxfDR06uXZfRgO2WuXhyZ5JqqeVqjQUnNGmKUofVVigvvsPiR44WeteOPOtsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmLyoFBAnq3r03WumrcanBTiQNM4nCC9vUqH0BekecE=;
 b=xtPzY5NWLyO9enVK4LhoL1Bcrex4eJsdSlvtrcvvsB+cY3ovLY5L9yYJCRbBQGvI9xh2tt/+a5MQOFV1+Ye2/IA0h2GiVcrlRqRGG+Y6M1ocaiMFY+drlt37D4jqlhag5filZD9QU7Fp0Ac5oXkedsH8zHtY709e6lVN5N8YQ0S9GenJ4jcz837bcjrj1aHzOAgtT5Vd7sSU3cqi0uZxR+KjgGnfUP1OkZ/5WWQV9esslRTknW8VydcFxpfQev6nZwpGa5mD3VMLJttEVKsZTpuMKRQGwSmh4wbMdnQAnPUwA/HqAFN40xXGB+zbsuW7ftmYSTZ9Xtvb7g2wMBYzZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ0PR11MB4880.namprd11.prod.outlook.com (2603:10b6:a03:2af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 10:09:17 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 10:09:17 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        skandigraun@gmail.com, steve@sakoman.com
Subject: [kirkstone][PATCH V3 1/8] glibc: pthreads NPTL lost wakeup fix 2
Date: Tue, 17 Jun 2025 03:08:48 -0700
Message-ID: <20250617100855.2696492-2-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
References: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ0PR11MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f38377-09d5-4e25-5fb7-08ddad870530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FSwRkXRQju0t3sulXu9n8aRBF3qt96FkmSYp/FLKRidN3Pxzs4Tk7BeMfDcd?=
 =?us-ascii?Q?4RaIw+NGJYUuxizzC2lNt9X+LiZFsTp85q+En36dHmKgIDHKTE9XWygSxNEc?=
 =?us-ascii?Q?b53OlHCVcSv0TwYh0GxHotSe7+YONw5LbxH/xrczK6O8LseciaHdojh3R6N6?=
 =?us-ascii?Q?rskvb7DLb10jAgljNorxgndJ3lzy8+h0O+3Nu7DQ8Zfl/fkXWKfu475whLQb?=
 =?us-ascii?Q?8OvZlMBESgI948WLTkfTKqzkP3f4uTxk9/IuFEh8KE5MIYVHNOrjE0ApKusu?=
 =?us-ascii?Q?0gtLfLHhekmM90+1b8ljT6ybGSBFpwh1IkjvEE9OsCcwawmlk7G7XllA4lu2?=
 =?us-ascii?Q?IEYpA7N0G3BrIjaeVYij8+MVhGqoqihDdMcAfEPwXn70e6627jWvOshqyiZu?=
 =?us-ascii?Q?9/v2XybmCgoIu6yrIFwGflsGxcLy1zJ30SIcEhxArufSzrsTPBruij6To41J?=
 =?us-ascii?Q?tr5flJhZ1XgPy0i+TwtWYbpAVLXZ2WirpQZMehWmtVMYgS/wUnUxzKbVsGFE?=
 =?us-ascii?Q?VmabxfCIGaR/mu2/QboF27Acy29BBsipDlvFPuCHCC+UG4I6xYejv+nFjt5w?=
 =?us-ascii?Q?F14G6CUbyGr3lLm9B5huNoSrK4ngmSlP13fkEmSa/CkSszg4VMPEqH6YiF3+?=
 =?us-ascii?Q?Qg3IRglmhZq5o4pyt4q0et1irgyOMBHGvUCGTcBZaEUSdsaP8gBhmkrBg+fN?=
 =?us-ascii?Q?ygku/auG/axEH5TQfH+Qb9L/mpR1exfvZ7ameL7IhNwlhRPQf4FmoRkw0RjS?=
 =?us-ascii?Q?YMiAlRE+N4CaPJ/GunjLL2uZ8hxBFoe7A90n36+Cnmpm6RZZLvgV5B0nEa3Z?=
 =?us-ascii?Q?SB08C8TwyA1Y9J0j4/ccVvq5i+tJORfpoZh8TA09/xfTdYEwB6buXjibmQ/S?=
 =?us-ascii?Q?A8Tpa75Om0RaFM+BVYfSq7TiB2rNEr2g8SNwpdznPEXPa5dygOb12FtuT1w8?=
 =?us-ascii?Q?6gXXNid1VL6IeHhZ2xBHi/FZqFMBfFjeizj/IidUMunTV7/OKo1lZSI2d2h4?=
 =?us-ascii?Q?FmhYH30jbrEEUoXzQ/4KxZJYNBCtiq24BjKuHG4yaX3Ask7JKIQ2kDsGV1V1?=
 =?us-ascii?Q?2iMiW+/49VPlra9eseUUlLXrK/zLB8qvpFBNitcC0/bhVPbUEtMj2dYwpkrf?=
 =?us-ascii?Q?pKbNmrpOgiML6/uAgizorNz5FjSBfkQkODArEDFoSVuJbGXjnYJ2UEos8Ynf?=
 =?us-ascii?Q?4FZUvTXzCWKRZDjljbMTMFCGX2MgyOTBeHBID13v64ClMyRCtPNvjVxJz3r2?=
 =?us-ascii?Q?ClzyukoGAeO6TpW8WcW7+ha2ggYvwGitg6dbjFuixhGMZKLtiR8cv+Wpigyh?=
 =?us-ascii?Q?+l9eJ7PeXcHr0O16qy/0xcoFHsiQ4U9hzFOIfNmS1EJkf2iKsiZGlcfKyq/j?=
 =?us-ascii?Q?ud84oGJ/Eq1MhpL2I6amRS2xWl0kngeT+gMoE2d2XO/4aG+edgPxqYYjEDdz?=
 =?us-ascii?Q?EsPrL8A1PtenTtYdzkihJ+Vw9Ng0epuY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aKAj4zAUXUWSMYKpsbPUUoBx3fr3924XeGwM/Cdj7f3cEY9jhhl26OfcNPJa?=
 =?us-ascii?Q?pPMzJU+Kyf9yATLpt2IIgTMouoAJ9m7HLu+uv1TsOfRgaIkQ2iSHIh7/oH+5?=
 =?us-ascii?Q?Ow4UPUIE9LRtFo/Jo7Bryct+j1xX8BFAxl10stDfpIVhHfTrJYsM8bnXK+Ow?=
 =?us-ascii?Q?NLhzBpepMTG+gorUDPFKsfz3KL1xnpfgh9wkdUI36NSqUmgOgFd97VB7t/g3?=
 =?us-ascii?Q?8FSzbqrN3uk2c1BSgDy6f45E2QEYEOoFE8po1zeEYFUqcVbb07LD3Jh48gZK?=
 =?us-ascii?Q?qOMN3PVCOi0Onxl/v8jUzdyEbdQrKQ+fiOPfEBhI8qxID/t0/M6gLnqtLnlz?=
 =?us-ascii?Q?XUYfTOFkO8vi1hJm0CEo9un1EB5w7qKRtX9iHOLheXI4VhePf8aOYNnMtD28?=
 =?us-ascii?Q?rk/Wc1joBs7MPZsHLcNdkdsVMWgc5ds/aoYIEFKVAy22SlaKzs5rXjrkBRci?=
 =?us-ascii?Q?CgPPEqAkMgX4boyixAngYtXO9VgTNLGbYdclccfWvVG6vuHVA1mNuHSjp8jy?=
 =?us-ascii?Q?9/Eex3HmaH0tQus3MyqMSF/+CZcX9vIiirhKTU5F19h0a6bD1fOeUrt54nqf?=
 =?us-ascii?Q?EK5znAZCxK7O8dvTFWV+t6tOJohFvifm2FoAqOv1aBQGApgxjnD2HsFJu+ZM?=
 =?us-ascii?Q?nGn/4wlBsd1JmYHMpUoq2zgfHbhFh+JIyDVOigFQGAl5H2ymIAkuKEaTyurX?=
 =?us-ascii?Q?P7cDGbDd6N/7nkYCoDOuIsyaQpt1rNvo4p+OaWbFzAiYchvrxq46D+jAQ8sg?=
 =?us-ascii?Q?HdQCTMoJOflkvIaeysKIKmeAC9MyBYAQLOO4uoQsQj8d4WH4asXbUX1EbjHa?=
 =?us-ascii?Q?7s5EfGClR7k/ppiljkolcVDzVSLyS4qs+G6zQ3lW4qrUKGN9GEvmhXi9879R?=
 =?us-ascii?Q?p17vqyOD8ZNduvy9cTyx0UfZa7rKQoE7Cp0Bgma4YJ1uICWoPFPc80v/JBSj?=
 =?us-ascii?Q?W52x+Du2YKNWM9XsWbA4H7jTIof1KEIZNLJmNPxztnDLheYRaHp0A+RE5OwJ?=
 =?us-ascii?Q?KiOVmyPeKWG5GEgRsDat7Q+uLQT6sKZ7yWzevOub3nuUj4TuWd4AHsuBC5T5?=
 =?us-ascii?Q?QSnw4l+u9eQw9hNF/f1ZRu+zE0RToupFKSUOhTXCBrwTf4h//us0gr5yGQQH?=
 =?us-ascii?Q?6dUxYl3e/jyhk1pB+Js8DVqA+9lZ5MEwGSZacxLImcIc0ma3Gcl4r8AJB9l8?=
 =?us-ascii?Q?rKSnqTVSvvNTMAV8LubrydbXca2lNAwK35ovo+n/c5iFC80yIhoFesXhxkkl?=
 =?us-ascii?Q?YtpRH3H7JL/RkorEZT4ceyT+GV5v7Dh4afFBqC70XfcnSiJL/zq1xRbNhv+a?=
 =?us-ascii?Q?j0fVrxaxtVgMdFX08JftdLRm69sVGccmVeejKVvIy5P8A3qvEFP0lTfSChtm?=
 =?us-ascii?Q?nL+CThAly5K9Zi/B52N87g3q9AnWgkI09MZ1hAMD1gsa/sGL0O0wV5z11lzU?=
 =?us-ascii?Q?vxIaQjAPN9xUvGfi8ViUyNzI9rBmWNjSbCiRUxMAUmDoPPF6NY2aaMFnCrjw?=
 =?us-ascii?Q?Dfh3qhOg8I7EmLI8acGXnT4bCWodoSxO+BdBdFCWhaiCk3PUcIfqgANUSMrF?=
 =?us-ascii?Q?lQ+w2tSg4tuRtm6c3ajwLTYd5ql2/hLg+Yoksm1BTi8z8iXJddGZaOp6r55U?=
 =?us-ascii?Q?yGpXswqKU1o31AVe5b7pNEE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f38377-09d5-4e25-5fb7-08ddad870530
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:09:17.7103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gH1wOjIdEBE9ZmUJdul8IjhxG/29vFX3VjRE/LDzka8EOfR8kAu+secFkP2PdRj0o44JGjw5asUZ/z4OjE+LnxWj0rZ9Sm+XvrKuD7RQUmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4880
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4MiBTYWx0ZWRfXwCNuFxX6uFsD PalQPP50tI+BhT/bi+vGQkK8q3YF9/8W09mF4d5w8h4olcOVzf1fhlMUX2ueSTCEunI5sWZhhWT 3rUpQF4QTk5+TtD+Ta7kgUiubDkVgGlVdIiMeW7hoWC0tSK4DPgrY8qIVVqXwYH30VUYwlE8UmO
 m5lpDWD914NJvMZ02gMfeBGyZPmlwdjWQSfCUxhVw/GVscbM7ofi1+nhzQ+xkt/sY/Vs9H9Ushg vka4r/bDCXN807mG79H4kIw7ExhdoLHUYpH4ZKaJEtYbwefj7MHAKEXyOjXCyfb/Wdw4JUljuHm hKbaLY6N2/BAec+mA7cAyk0xqAGwhucGDjTSu3Lg0vYpFwQsD9Oh1KqvYwl5jRYhoOQ1Qm6p4af
 hCNG6uXAFkQ3n3AGFbRd9PI2pBpnBE1IhOX4Yp6xm7mCDMUtJ9s5LyChdG4uvF33ES2j+2/3
X-Proofpoint-GUID: KK9efdXQXJNJiWSK-oLIKHSC5g35jNTV
X-Authority-Analysis: v=2.4 cv=ar2yCTZV c=1 sm=1 tr=0 ts=68513ed0 cx=c_pps a=h+OmqRWQomUOPjbmtw9pcQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=-y7sjS4E6xoPhqQzj00A:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NULJNSKRxX4mJZ4aFq0KEglPlu_gXMLr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506170082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218870

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=1db84775f831a1494993ce9c118deaf9537cc50a]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-1.patch          | 455 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 456 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-1.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
new file mode 100644
index 0000000000..44a2b6772c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
@@ -0,0 +1,455 @@
+From 31d9848830e496f57d4182b518467c4c63bfd4bd Mon Sep 17 00:00:00 2001
+From: Frank Barrus <frankbarrus_sw@shaggy.cc>
+Date: Mon, 16 Jun 2025 22:37:54 -0700
+Subject: [PATCH] pthreads NPTL: lost wakeup fix 2
+
+This fixes the lost wakeup (from a bug in signal stealing) with a change
+in the usage of g_signals[] in the condition variable internal state.
+It also completely eliminates the concept and handling of signal stealing,
+as well as the need for signalers to block to wait for waiters to wake
+up every time there is a G1/G2 switch.  This greatly reduces the average
+and maximum latency for pthread_cond_signal.
+
+The g_signals[] field now contains a signal count that is relative to
+the current g1_start value.  Since it is a 32-bit field, and the LSB is
+still reserved (though not currently used anymore), it has a 31-bit value
+that corresponds to the low 31 bits of the sequence number in g1_start.
+(since g1_start also has an LSB flag, this means bits 31:1 in g_signals
+correspond to bits 31:1 in g1_start, plus the current signal count)
+
+By making the signal count relative to g1_start, there is no longer
+any ambiguity or A/B/A issue, and thus any checks before blocking,
+including the futex call itself, are guaranteed not to block if the G1/G2
+switch occurs, even if the signal count remains the same.  This allows
+initially safely blocking in G2 until the switch to G1 occurs, and
+then transitioning from G1 to a new G1 or G2, and always being able to
+distinguish the state change.  This removes the race condition and A/B/A
+problems that otherwise ocurred if a late (pre-empted) waiter were to
+resume just as the futex call attempted to block on g_signal since
+otherwise there was no last opportunity to re-check things like whether
+the current G1 group was already closed.
+
+By fixing these issues, the signal stealing code can be eliminated,
+since there is no concept of signal stealing anymore.  The code to block
+for all waiters to exit g_refs can also be removed, since any waiters
+that are still in the g_refs region can be guaranteed to safely wake
+up and exit.  If there are still any left at this time, they are all
+sent one final futex wakeup to ensure that they are not blocked any
+longer, but there is no need for the signaller to block and wait for
+them to wake up and exit the g_refs region.
+
+The signal count is then effectively "zeroed" but since it is now
+relative to g1_start, this is done by advancing it to a new value that
+can be observed by any pending blocking waiters.  Any late waiters can
+always tell the difference, and can thus just cleanly exit if they are
+in a stale G1 or G2.  They can never steal a signal from the current
+G1 if they are not in the current G1, since the signal value that has
+to match in the cmpxchg has the low 31 bits of the g1_start value
+contained in it, and that's first checked, and then it won't match if
+there's a G1/G2 change.
+
+Note: the 31-bit sequence number used in g_signals is designed to
+handle wrap-around when checking the signal count, but if the entire
+31-bit wraparound (2 billion signals) occurs while there is still a
+late waiter that has not yet resumed, and it happens to then match
+the current g1_start low bits, and the pre-emption occurs after the
+normal "closed group" checks (which are 64-bit) but then hits the
+futex syscall and signal consuming code, then an A/B/A issue could
+still result and cause an incorrect assumption about whether it
+should block.  This particular scenario seems unlikely in practice.
+Note that once awake from the futex, the waiter would notice the
+closed group before consuming the signal (since that's still a 64-bit
+check that would not be aliased in the wrap-around in g_signals),
+so the biggest impact would be blocking on the futex until the next
+full wakeup from a G1/G2 switch.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=1db84775f831a1494993ce9c118deaf9537cc50a]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_common.c | 106 +++++++++------------------
+ nptl/pthread_cond_wait.c   | 144 ++++++++++++-------------------------
+ 2 files changed, 81 insertions(+), 169 deletions(-)
+
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index fb035f72c3..8dd7037923 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -201,7 +201,6 @@ static bool __attribute__ ((unused))
+ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+     unsigned int *g1index, int private)
+ {
+-  const unsigned int maxspin = 0;
+   unsigned int g1 = *g1index;
+ 
+   /* If there is no waiter in G2, we don't do anything.  The expression may
+@@ -222,85 +221,46 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      * New waiters arriving concurrently with the group switching will all go
+        into G2 until we atomically make the switch.  Waiters existing in G2
+        are not affected.
+-     * Waiters in G1 will be closed out immediately by setting a flag in
+-       __g_signals, which will prevent waiters from blocking using a futex on
+-       __g_signals and also notifies them that the group is closed.  As a
+-       result, they will eventually remove their group reference, allowing us
+-       to close switch group roles.  */
+-
+-  /* First, set the closed flag on __g_signals.  This tells waiters that are
+-     about to wait that they shouldn't do that anymore.  This basically
+-     serves as an advance notificaton of the upcoming change to __g1_start;
+-     waiters interpret it as if __g1_start was larger than their waiter
+-     sequence position.  This allows us to change __g1_start after waiting
+-     for all existing waiters with group references to leave, which in turn
+-     makes recovery after stealing a signal simpler because it then can be
+-     skipped if __g1_start indicates that the group is closed (otherwise,
+-     we would have to recover always because waiters don't know how big their
+-     groups are).  Relaxed MO is fine.  */
+-  atomic_fetch_or_relaxed (cond->__data.__g_signals + g1, 1);
+-
+-  /* Wait until there are no group references anymore.  The fetch-or operation
+-     injects us into the modification order of __g_refs; release MO ensures
+-     that waiters incrementing __g_refs after our fetch-or see the previous
+-     changes to __g_signals and to __g1_start that had to happen before we can
+-     switch this G1 and alias with an older group (we have two groups, so
+-     aliasing requires switching group roles twice).  Note that nobody else
+-     can have set the wake-request flag, so we do not have to act upon it.
+-
+-     Also note that it is harmless if older waiters or waiters from this G1
+-     get a group reference after we have quiesced the group because it will
+-     remain closed for them either because of the closed flag in __g_signals
+-     or the later update to __g1_start.  New waiters will never arrive here
+-     but instead continue to go into the still current G2.  */
+-  unsigned r = atomic_fetch_or_release (cond->__data.__g_refs + g1, 0);
+-  while ((r >> 1) > 0)
+-    {
+-      for (unsigned int spin = maxspin; ((r >> 1) > 0) && (spin > 0); spin--)
+-	{
+-	  /* TODO Back off.  */
+-	  r = atomic_load_relaxed (cond->__data.__g_refs + g1);
+-	}
+-      if ((r >> 1) > 0)
+-	{
+-	  /* There is still a waiter after spinning.  Set the wake-request
+-	     flag and block.  Relaxed MO is fine because this is just about
+-	     this futex word.
+-
+-	     Update r to include the set wake-request flag so that the upcoming
+-	     futex_wait only blocks if the flag is still set (otherwise, we'd
+-	     violate the basic client-side futex protocol).  */
+-	  r = atomic_fetch_or_relaxed (cond->__data.__g_refs + g1, 1) | 1;
+-
+-	  if ((r >> 1) > 0)
+-	    futex_wait_simple (cond->__data.__g_refs + g1, r, private);
+-	  /* Reload here so we eventually see the most recent value even if we
+-	     do not spin.   */
+-	  r = atomic_load_relaxed (cond->__data.__g_refs + g1);
+-	}
+-    }
+-  /* Acquire MO so that we synchronize with the release operation that waiters
+-     use to decrement __g_refs and thus happen after the waiters we waited
+-     for.  */
+-  atomic_thread_fence_acquire ();
++     * Waiters in G1 will be closed out immediately by the advancing of
++       __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
++       which will prevent waiters from blocking using a futex on
++       __g_signals since it provides enough signals for all possible
++       remaining waiters.  As a result, they can each consume a signal
++       and they will eventually remove their group reference.  */
+ 
+   /* Update __g1_start, which finishes closing this group.  The value we add
+      will never be negative because old_orig_size can only be zero when we
+      switch groups the first time after a condvar was initialized, in which
+-     case G1 will be at index 1 and we will add a value of 1.  See above for
+-     why this takes place after waiting for quiescence of the group.
++     case G1 will be at index 1 and we will add a value of 1.
+      Relaxed MO is fine because the change comes with no additional
+      constraints that others would have to observe.  */
+   __condvar_add_g1_start_relaxed (cond,
+       (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
+ 
+-  /* Now reopen the group, thus enabling waiters to again block using the
+-     futex controlled by __g_signals.  Release MO so that observers that see
+-     no signals (and thus can block) also see the write __g1_start and thus
+-     that this is now a new group (see __pthread_cond_wait_common for the
+-     matching acquire MO loads).  */
+-  atomic_store_release (cond->__data.__g_signals + g1, 0);
+-
++  unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
++
++  /* If any waiters still hold group references (and thus could be blocked),
++     then wake them all up now and prevent any running ones from blocking.
++     This is effectively a catch-all for any possible current or future
++     bugs that can allow the group size to reach 0 before all G1 waiters
++     have been awakened or at least given signals to consume, or any
++     other case that can leave blocked (or about to block) older waiters..  */
++  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) > 0)
++   {
++    /* First advance signals to the end of the group (i.e. enough signals
++       for the entire G1 group) to ensure that waiters which have not
++       yet blocked in the futex will not block.
++       Note that in the vast majority of cases, this should never
++       actually be necessary, since __g_signals will have enough
++       signals for the remaining g_refs waiters.  As an optimization,
++       we could check this first before proceeding, although that
++       could still leave the potential for futex lost wakeup bugs
++       if the signal count was non-zero but the futex wakeup
++       was somehow lost.  */
++    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
++
++    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
++   }
+   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
+      No old waiter can neither grab a signal nor acquire a reference without
+      noticing that __g1_start is larger.
+@@ -311,6 +271,10 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+   g1 ^= 1;
+   *g1index ^= 1;
+ 
++  /* Now advance the new G1 g_signals to the new lowseq, giving it
++     an effective signal count of 0 to start.  */
++  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
++
+   /* These values are just observed by signalers, and thus protected by the
+      lock.  */
+   unsigned int orig_size = wseq - (old_g1_start + old_orig_size);
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 20c348a503..1cb3dbf7b0 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -238,9 +238,7 @@ __condvar_cleanup_waiting (void *arg)
+    signaled), and a reference count.
+ 
+    The group reference count is used to maintain the number of waiters that
+-   are using the group's futex.  Before a group can change its role, the
+-   reference count must show that no waiters are using the futex anymore; this
+-   prevents ABA issues on the futex word.
++   are using the group's futex.
+ 
+    To represent which intervals in the waiter sequence the groups cover (and
+    thus also which group slot contains G1 or G2), we use a 64b counter to
+@@ -300,11 +298,12 @@ __condvar_cleanup_waiting (void *arg)
+        last reference.
+      * Reference count used by waiters concurrently with signalers that have
+        acquired the condvar-internal lock.
+-   __g_signals: The number of signals that can still be consumed.
++   __g_signals: The number of signals that can still be consumed, relative to
++     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bits
++     31 to 1 of g1_start with the signal count added)
+      * Used as a futex word by waiters.  Used concurrently by waiters and
+        signalers.
+-     * LSB is true iff this group has been completely signaled (i.e., it is
+-       closed).
++     * LSB is currently reserved and 0.
+    __g_size: Waiters remaining in this group (i.e., which have not been
+      signaled yet.
+      * Accessed by signalers and waiters that cancel waiting (both do so only
+@@ -328,18 +327,6 @@ __condvar_cleanup_waiting (void *arg)
+    sufficient because if a waiter can see a sufficiently large value, it could
+    have also consume a signal in the waiters group.
+ 
+-   Waiters try to grab a signal from __g_signals without holding a reference
+-   count, which can lead to stealing a signal from a more recent group after
+-   their own group was already closed.  They cannot always detect whether they
+-   in fact did because they do not know when they stole, but they can
+-   conservatively add a signal back to the group they stole from; if they
+-   did so unnecessarily, all that happens is a spurious wake-up.  To make this
+-   even less likely, __g1_start contains the index of the current g2 too,
+-   which allows waiters to check if there aliasing on the group slots; if
+-   there wasn't, they didn't steal from the current G1, which means that the
+-   G1 they stole from must have been already closed and they do not need to
+-   fix anything.
+-
+    It is essential that the last field in pthread_cond_t is __g_signals[1]:
+    The previous condvar used a pointer-sized field in pthread_cond_t, so a
+    PTHREAD_COND_INITIALIZER from that condvar implementation might only
+@@ -435,6 +422,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     {
+       while (1)
+ 	{
++          uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
++          unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++
+ 	  /* Spin-wait first.
+ 	     Note that spinning first without checking whether a timeout
+ 	     passed might lead to what looks like a spurious wake-up even
+@@ -446,35 +436,45 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     having to compare against the current time seems to be the right
+ 	     choice from a performance perspective for most use cases.  */
+ 	  unsigned int spin = maxspin;
+-	  while (signals == 0 && spin > 0)
++	  while (spin > 0 && ((int)(signals - lowseq) < 2))
+ 	    {
+ 	      /* Check that we are not spinning on a group that's already
+ 		 closed.  */
+-	      if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
+-		goto done;
++	      if (seq < (g1_start >> 1))
++		break;
+ 
+ 	      /* TODO Back off.  */
+ 
+ 	      /* Reload signals.  See above for MO.  */
+ 	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
++              g1_start = __condvar_load_g1_start_relaxed (cond);
++              lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 	      spin--;
+ 	    }
+ 
+-	  /* If our group will be closed as indicated by the flag on signals,
+-	     don't bother grabbing a signal.  */
+-	  if (signals & 1)
+-	    goto done;
+-
+-	  /* If there is an available signal, don't block.  */
+-	  if (signals != 0)
++          if (seq < (g1_start >> 1))
++	    {
++              /* If the group is closed already,
++	         then this waiter originally had enough extra signals to
++	         consume, up until the time its group was closed.  */
++	       goto done;
++            }
++
++	  /* If there is an available signal, don't block.
++             If __g1_start has advanced at all, then we must be in G1
++	     by now, perhaps in the process of switching back to an older
++	     G2, but in either case we're allowed to consume the available
++	     signal and should not block anymore.  */
++	  if ((int)(signals - lowseq) >= 2)
+ 	    break;
+ 
+ 	  /* No signals available after spinning, so prepare to block.
+ 	     We first acquire a group reference and use acquire MO for that so
+ 	     that we synchronize with the dummy read-modify-write in
+ 	     __condvar_quiesce_and_switch_g1 if we read from that.  In turn,
+-	     in this case this will make us see the closed flag on __g_signals
+-	     that designates a concurrent attempt to reuse the group's slot.
++	     in this case this will make us see the advancement of __g_signals
++	     to the upcoming new g1_start that occurs with a concurrent
++	     attempt to reuse the group's slot.
+ 	     We use acquire MO for the __g_signals check to make the
+ 	     __g1_start check work (see spinning above).
+ 	     Note that the group reference acquisition will not mask the
+@@ -482,15 +482,24 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     an atomic read-modify-write operation and thus extend the release
+ 	     sequence.  */
+ 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+-	  if (((atomic_load_acquire (cond->__data.__g_signals + g) & 1) != 0)
+-	      || (seq < (__condvar_load_g1_start_relaxed (cond) >> 1)))
++	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
++          g1_start = __condvar_load_g1_start_relaxed (cond);
++          lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++
++          if (seq < (g1_start >> 1))
+ 	    {
+-	      /* Our group is closed.  Wake up any signalers that might be
+-		 waiting.  */
++              /* group is closed already, so don't block */
+ 	      __condvar_dec_grefs (cond, g, private);
+ 	      goto done;
+ 	    }
+ 
++	  if ((int)(signals - lowseq) >= 2)
++	    {
++	      /* a signal showed up or G1/G2 switched after we grabbed the refcount */
++	      __condvar_dec_grefs (cond, g, private);
++	      break;
++            }
++
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+ 	  struct _condvar_cleanup_buffer cbuffer;
+@@ -501,7 +510,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
+ 
+ 	  err = __futex_abstimed_wait_cancelable64 (
+-	    cond->__data.__g_signals + g, 0, clockid, abstime, private);
++	    cond->__data.__g_signals + g, signals, clockid, abstime, private);
+ 
+ 	  __pthread_cleanup_pop (&buffer, 0);
+ 
+@@ -524,6 +533,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	}
+ 
++       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
++	 goto done;
+     }
+   /* Try to grab a signal.  Use acquire MO so that we see an up-to-date value
+      of __g1_start below (see spinning above for a similar case).  In
+@@ -532,69 +543,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+   while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
+ 						&signals, signals - 2));
+ 
+-  /* We consumed a signal but we could have consumed from a more recent group
+-     that aliased with ours due to being in the same group slot.  If this
+-     might be the case our group must be closed as visible through
+-     __g1_start.  */
+-  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-  if (seq < (g1_start >> 1))
+-    {
+-      /* We potentially stole a signal from a more recent group but we do not
+-	 know which group we really consumed from.
+-	 We do not care about groups older than current G1 because they are
+-	 closed; we could have stolen from these, but then we just add a
+-	 spurious wake-up for the current groups.
+-	 We will never steal a signal from current G2 that was really intended
+-	 for G2 because G2 never receives signals (until it becomes G1).  We
+-	 could have stolen a signal from G2 that was conservatively added by a
+-	 previous waiter that also thought it stole a signal -- but given that
+-	 that signal was added unnecessarily, it's not a problem if we steal
+-	 it.
+-	 Thus, the remaining case is that we could have stolen from the current
+-	 G1, where "current" means the __g1_start value we observed.  However,
+-	 if the current G1 does not have the same slot index as we do, we did
+-	 not steal from it and do not need to undo that.  This is the reason
+-	 for putting a bit with G2's index into__g1_start as well.  */
+-      if (((g1_start & 1) ^ 1) == g)
+-	{
+-	  /* We have to conservatively undo our potential mistake of stealing
+-	     a signal.  We can stop trying to do that when the current G1
+-	     changes because other spinning waiters will notice this too and
+-	     __condvar_quiesce_and_switch_g1 has checked that there are no
+-	     futex waiters anymore before switching G1.
+-	     Relaxed MO is fine for the __g1_start load because we need to
+-	     merely be able to observe this fact and not have to observe
+-	     something else as well.
+-	     ??? Would it help to spin for a little while to see whether the
+-	     current G1 gets closed?  This might be worthwhile if the group is
+-	     small or close to being closed.  */
+-	  unsigned int s = atomic_load_relaxed (cond->__data.__g_signals + g);
+-	  while (__condvar_load_g1_start_relaxed (cond) == g1_start)
+-	    {
+-	      /* Try to add a signal.  We don't need to acquire the lock
+-		 because at worst we can cause a spurious wake-up.  If the
+-		 group is in the process of being closed (LSB is true), this
+-		 has an effect similar to us adding a signal.  */
+-	      if (((s & 1) != 0)
+-		  || atomic_compare_exchange_weak_relaxed
+-		       (cond->__data.__g_signals + g, &s, s + 2))
+-		{
+-		  /* If we added a signal, we also need to add a wake-up on
+-		     the futex.  We also need to do that if we skipped adding
+-		     a signal because the group is being closed because
+-		     while __condvar_quiesce_and_switch_g1 could have closed
+-		     the group, it might stil be waiting for futex waiters to
+-		     leave (and one of those waiters might be the one we stole
+-		     the signal from, which cause it to block using the
+-		     futex).  */
+-		  futex_wake (cond->__data.__g_signals + g, 1, private);
+-		  break;
+-		}
+-	      /* TODO Back off.  */
+-	    }
+-	}
+-    }
+-
+  done:
+ 
+   /* Confirm that we have been woken.  We do that before acquiring the mutex
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 9073e04537..2d23c17a48 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -61,6 +61,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
+           file://0026-PR25847-1.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


