Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED00EA8531
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 15:09:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40612.1772982557273535633
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 08:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F5j539gR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75278c0199=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628EQ7ge606391
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 15:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fnjQBPlLS2pgRienvnXCWVvmttkhE8a8A/t7oa9hXgo=; b=
	F5j539gRDm+21ZypgNe6Cvn9gbc2ZBIF/EADrXAaPxZW+bibuiLIZsIch7Sn6SBZ
	4eVLjSnz/xktS4826n1j4gspVrzEvQkBsVj0mhFVeCrsGfoMBvoZlZAGXbJ4yhIu
	EySj97LVgKi0Rx4TqU4I4WPshjC7+zGV3W/S7o93Of5+bMVv021DVWuZ+9GPcod6
	QVLZQmHXosrbnGj6cncdmHyhabA8u0j/+gzEg6zMSBIbUJOhjFAgV/7EhxRkA1I2
	ajpAitVa6GZMQcAJFfTlxtWjh5/QRKiC1mc4bmvcegnMqTXcghv1w/4SRuhNb99V
	HkoXLCe41nIeHveWBdxRQg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97v948x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:09:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXTgaP6jDNrF/KrECT2mm4GrCrBMoCRCs1KKxItrVblOonk1Mhlzn9pOK7wJ0gl905akWRqrgcoCc9c8eDuX32ZXDI9edVrnslYf00EZGjCgLlLPBr9IXQiblwqcBy9YQElROwpZtc4eD7z4tPMHOBvRmJe3E6UDiE1e3JEFjHlE329F50nYlVifYwhduzW5uDv5uTh0tgnXlkcifVDuz3P9s/YV7yxDR2yu8B+KagNt1kojkaMLdA0umXMXGNoVGMgW5dCG9y/fJk8bvIs71dW3RHeJzO5wLQKohenkD3okQ6uiIJkJTL8rCvBIWeggUyvYgUTXC2KQa+Zp6p6mHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnjQBPlLS2pgRienvnXCWVvmttkhE8a8A/t7oa9hXgo=;
 b=Kr2J0wD8tvUR2N/jzvcceJplpsdt/AzE4P7j42fvBArQxRWJCmm+mFklXHh3O91Un5QHGhQhIgG4nVbtiqKKBRUYbU5uRJMsczs0u+meFJH0eaf5oHauKV23MPrcodg0JR8KbjUX8ItrebCsPW8fLPRKmxmU56W0JekouNsRQlrHLODzkCPp2HV50pcGyz7zJgHjTvUtkiYCC3gTLE/ETa+DdWtntINbylbthxZxDwbDEfRCMi5Gwm+/yOeUz0h9sDNMHs9ti+Bx1acMLw9yz8R2rYtpKxWhga5y96yvqOr2nd1UoAFCtcPzAFWowrOR1SBgUiH5+8wJxGK/3EX2Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.8; Sun, 8 Mar 2026 15:09:13 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 15:09:13 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v2 2/7] gettext: Upgrade 0.26 -> 1.0
Date: Sun,  8 Mar 2026 08:07:16 -0700
Message-ID: <20260308150834.2508331-2-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LV3PR11MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: e2abdd27-cafe-4356-fb03-08de7d24a84b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	IalrMd+kSQQ2FJMXU1F3wzjmTmaYCSmcyuzpRSVpUsq4Yy8cZf9d4rmpYsCNAZcXdgAl2TXUv94dFbbC0/0jzqsOYsSxtJRtKX4zjPp/sJ+cW7b45nd1VI7hQyNqa1eyj9AQ2LzyYhO/1MsLsY3vzsjqOvq06zU/k2JODQwxyWlpDx9hco4MBLQRLHMaQ71MZKWdD0TnwZmkZGlynEmw7zc/LYQRWQ8lIrdoih9vD7rgSQIdLjoAJrgEVDUibbjR0dXiyLKuDFs8kyRYjiCcd+y6+ZG/9Teh9P/ztxBoxc3hOUd9/PXk+A3MEvnpMFLFhlueNDRqz1iflpmyYKPPiTL0ZXb0gfvb3/wiGRl5HuJ1pg/wfW5iqALjLalvGmuS9j+f0UzmfhQxac/udBjG1hvFHxzfg2PCWzGGGkhISsDDXQdwqgMcB1i84ABotFtKnHSYX+L0iEKlO7tl6aRB0NL6pbfQV03+bFIwgPjQhALzCO3QvWrdSboNnKlSHRQzoySDj3B96BMs6Jb4vLuexqFW85r0c/9ugNPwuR0+JpMZ1sMyqbmVnTOG4CkoaGkOodqnPsa9l28ZKR1hYnkc/ytLKjOaVkmMtuxfaWGeTx0KxkcBDPXOn8SVwR5ZvHgId0gr5SS9PsLtKR5x/Sfdi4rLW+XeI44nOZPA7bPT/YxZqVQj1eR2MFqC9W9DIcfWLZ/bl6iVF5l4U4LKweceFajzFl5Eoag6O7SxSDyEb2vQCOF55U+AXFDsUbS0370TrZ6vpLFKxeH+/igX8vY68GfudUf2mjmQ4EaICAH0z/s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VJG10nK1Ft3WMULf5TJl3DZUwwWdKPF2K3RL8egMxayiInb9nWGKzrXgotj2?=
 =?us-ascii?Q?eSS/+qjcmnWB7WSjDHtvkPHXcpTG4AorgThx2rt0HrFa9ZRrZnrReZqJDFYY?=
 =?us-ascii?Q?fveGqL/MWCdbL4eMrXklBPNYfSIlW4tzS/FJgTYeo9mwZ9+0Bp8T8LOX2FP0?=
 =?us-ascii?Q?pBIwhruUr4uC6Bflp2R0JINkUK2NTd80Fxr7Z5JY1g1d8zy1I31guCK8/+uo?=
 =?us-ascii?Q?qyIfVFPYfUkybCB8H4omtyzpucSBDOmwM9IhYQ7CKIZ9PGSm5m//XzFJoQor?=
 =?us-ascii?Q?njtC7Fs7Hklo1Qmm6tLsZ+Jr860bjsmM7RiyWI18f+CcxgQy3uGhh/4Pfato?=
 =?us-ascii?Q?zsCwuJCauiJ4JwwY7OqumsOWk4+Pjft3/0pWRejNnMDDcPL66znDjpIqBOUU?=
 =?us-ascii?Q?0cpEkN6rdRtIoBvezYlTyxambsrzWg9VRwHUEl0MmDuhz3jr4xZt+MsVHG52?=
 =?us-ascii?Q?FME9vMgEqQUSsnCaTinH/FuzbizROtNxXJ/WiBh47bbIR21bdKUA1jSJafQG?=
 =?us-ascii?Q?IunWwHwsnvqLykW7I1qk47AC7j2vQzvgTLXWpAi2CgjjXkeQIvG+9rxTet+C?=
 =?us-ascii?Q?wEu1RSmfm5ybEEkNo9Wn4U8KAhHlwXc/HeHCweJB2s4Mquw6Xe5MZ+sJZChh?=
 =?us-ascii?Q?1+gDwUze6zT4dnUIuPUCiIHMBx1zEFO/dp9UFdrsEBr3s9D4FVceU5Ipx7LR?=
 =?us-ascii?Q?tMimYdkBkUwqGkuUmfRF/j+T4Va/6TawYImI5cg1kOtiXxOOqDb3UM6xgcK0?=
 =?us-ascii?Q?92RIKpuj/NCcFe78HiBXCMgMJGtZzs7WWU/FE9/6tFT9753ekrCougQeUSsv?=
 =?us-ascii?Q?4Tl0IJROPYl6Kh7TaUTUcpjSgTg+Mc/QzXYao6lHTzC4Ir6hOdgDjdVuaBQm?=
 =?us-ascii?Q?kF+jtgdfqTloKZ1fAS7nXsycsCRMyImFImP/kDSnJyi/rcJiU40EiMastGCl?=
 =?us-ascii?Q?HXmMc8qwEqmxfUnp7trfkefYCYZuB+6IVq7s3tGblkhB542BrJXosD34wUIh?=
 =?us-ascii?Q?BAx1AQZ6SX3RRmpBJeSjzAIzRTgn6Y/CMaXBrH2tnz7hpKtObRiwGcxY5Ycb?=
 =?us-ascii?Q?Wkki8r802X+0Hg1rTAGSdumt+y7Vbj/HSBHxvz/TBn3zPMPxEg49G3gtQORf?=
 =?us-ascii?Q?JDJNIbpBQLea6kL77GxHx5aSyPFHPCq9mvB7RnYsAI60xx237GHcO5rorWg6?=
 =?us-ascii?Q?+ivxHNzeAX6EkJWo5/Bj2nXSQOx8MuY9wr7axjSWPsfhWAxUcfNV526tkzQ+?=
 =?us-ascii?Q?3MrcOZYGwovxEMlUtm0fuF42mJ7BQsrIuaJNa5ZgL1RBpfciDcgclSalzAe/?=
 =?us-ascii?Q?vib49NUX+SWphxsPoUIm/tF0by1A2W5JLdVNfbSAlfOX8Yh9Pt4tFH7CGUEj?=
 =?us-ascii?Q?avQ3rdjP2liEizRZ6NE0QahTmWqu4k0cUlBvQfmC+Kd8VQBfb9HnOFk4134T?=
 =?us-ascii?Q?KUd2hYHTPf4uPd1RezzApr/HwehqzIeXlpYafJf0pyZ2qHhfBiJQnSrvY9Ps?=
 =?us-ascii?Q?KfqJRDACxBAepQdWh5HW356gM+dE8olpVXTAErL96DLmh2zM9Uhxa0FDxZzH?=
 =?us-ascii?Q?HKHDMRuraXiEa0f5+/BkJtrm0mNfQhRoAqkgQIs7ViTd1rBUvsFxtgT0iF+v?=
 =?us-ascii?Q?dL9U0kDURwuFhtSKMj1qkuHprFwdAXvsPahGiggAj8DtrUmjDCLHjG7ndolA?=
 =?us-ascii?Q?o/Fm8DnJseSFMiThU3U67xPPXHxGbhszxcfFj92oEJWkcl3QdJOfeVV17xlQ?=
 =?us-ascii?Q?6yX4O2xIkVCVNelXpTCYaGjLkLF0pOs=3D?=
X-Exchange-RoutingPolicyChecked: 
	bwYHy+uwsnBz6ENfhsXrq4moB9BxW3lXMFFhQ14BtRY4+xFTKVlsDqQfG0LytQ327tGli0dBWwZCUXaqJe8x3e0JQeeee1mTumioQCBlLaciNaula6GcEUkizQdEyAfZje937vdpWdyhbiG5DSPWMu1EthFI9wt9Z8jo1Bgc4D1FBSGyFeY5zXDU+AYV7czyvorLH3MEWHeTvvvl8fzPQ4QyOY13HjuyjbukNzB4qlc416UsK6G41PWLbay1kIZhfCQwjbspmpbUzU9N8gCnefFqrfNsjkZws2cPaJHvyv1vVSqW9dG6BVk4v5jl+U1/Ib+H0Hj810LY+948NdJNGA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2abdd27-cafe-4356-fb03-08de7d24a84b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 15:09:13.0216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEWuswE//NXP4ExHiEDrpzLaWX0e1AUZARpqv4JNbq3fpw9kX8O6wGlEBNc3nQKO2yh4QhirY8P5yoZhH3ICftsRIqRxXrA4l6EGZJ8OwPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-Proofpoint-ORIG-GUID: elLVuVFgbBsX3TKdbVUVhtNMAqh02U7q
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69ad911c cx=c_pps
 a=F7X/6K5kN+zqVHn88SdM/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=SUx4uDOeosYRpSGunnoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzOSBTYWx0ZWRfXy8exfWk5jxa3
 wUsR8zct84Kaj9xOJvegIneS0P5NPValHPDOlk58hC3tJjxlN34yKzazcNqPRsr1hfDqpBqkSxS
 msk1nImtn0GQrznBW4OaJ/LT5opvaiHbaFtxU/9q9ZHcIQntSzuc9CwAsWpbsaMtsgtAXjPgtHx
 3KCVDSJIAI1wgspeS4br9s1dSh+ty6TZT2AlPrhkc08sHwVCNZfM9cgV/hzK00i/+dgmCDD/saY
 BvZLkc2emGAQ1+oSO1gOlracQWJRbampZY1fgJ5shN3QTGAe/rmaTR1RaVmWNLHKSwbQPfLZa7+
 0FIQHSdq3PdyQMEpqyAlv0+TS6GIne7+0mSjSnqFuXZRdWJRj7TTZTAA1WImJO++O2PKp4WB56o
 iRlMGH+oYLiqryeIAoMYXEIlEK2uP/CrjrqJlfG33CzaZsS9To2lf8SRigPcfx6pFG36JeonKMr
 7yB4o/xKSrNTAqIcP3A==
X-Proofpoint-GUID: elLVuVFgbBsX3TKdbVUVhtNMAqh02U7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232654

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ..._0.26.bb => gettext-minimal-native_1.0.bb} |  3 ++-
 meta/recipes-core/gettext/gettext-sources.inc |  2 +-
 .../gettext/gettext/use-pkgconfig.patch       | 25 +++++++++++--------
 .../{gettext_0.26.bb => gettext_1.0.bb}       |  0
 4 files changed, 18 insertions(+), 12 deletions(-)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.26.bb => gettext-minimal-native_1.0.bb} (88%)
 rename meta/recipes-core/gettext/{gettext_0.26.bb => gettext_1.0.bb} (100%)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
similarity index 88%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
index b5c32d0786..28392a26b5 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
@@ -44,5 +44,6 @@ do_install () {
 	cp ${S}/gettext-runtime/po/Makefile.in.in ${D}${datadir}/gettext/po/
 	cp ${S}/gettext-runtime/po/remove-potcdate.sed ${D}${datadir}/gettext/po/
 	# The gettext recipe also installs the same Makevars.template at the same place, rename it
-	cp ${S}/gettext-tools/po/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal
+	# cp ${S}/gettext-tools/po/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal
+	cp ${S}/gettext-tools/wizard/po-templates/traditional/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal 
 }
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index 2ddf47334d..02ad72fc9f 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,3 +1,3 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz"
-SRC_URI[sha256sum] = "39acf4b0371e9b110b60005562aace5b3631fed9b1bb9ecccfc7f56e58bb1d7f"
+SRC_URI[sha256sum] = "85d99b79c981a404874c02e0342176cf75c7698e2b51fe41031cf6526d974f1a"
diff --git a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
index 2b9fef1e94..031a44d4dd 100644
--- a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
@@ -27,7 +27,7 @@ diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/libxml.
 index c7160d7..8e46cc7 100644
 --- a/gettext-tools/gnulib-m4/libxml.m4
 +++ b/gettext-tools/gnulib-m4/libxml.m4
-@@ -14,6 +14,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
+@@ -15,6 +15,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
  dnl   forces the use of the included or an external libxml.
  AC_DEFUN([gl_LIBXML],
  [
@@ -35,7 +35,7 @@ index c7160d7..8e46cc7 100644
    AC_REQUIRE([AM_ICONV_LINK])
  
    ifelse([$1], , [
-@@ -31,106 +32,10 @@ AC_DEFUN([gl_LIBXML],
+@@ -33,106 +34,10 @@ AC_DEFUN([gl_LIBXML],
    INCXML=
    ifelse([$1], [yes], , [
      if test "$gl_cv_libxml_use_included" != yes; then
@@ -399,7 +399,7 @@ diff --git a/gettext-tools/gnulib-m4/selinux-selinux-h.m4 b/gettext-tools/gnulib
 index e2613fa..2a733a7 100644
 --- a/gettext-tools/gnulib-m4/selinux-selinux-h.m4
 +++ b/gettext-tools/gnulib-m4/selinux-selinux-h.m4
-@@ -71,6 +71,7 @@ AC_DEFUN([gl_LIBSELINUX],
+@@ -71,6 +71,7 @@
  [
    AC_REQUIRE([AC_CANONICAL_HOST])
    AC_REQUIRE([AC_CANONICAL_BUILD])
@@ -407,24 +407,29 @@ index e2613fa..2a733a7 100644
  
    AC_ARG_WITH([selinux],
      AS_HELP_STRING([[--without-selinux]], [do not use SELinux, even on systems with SELinux]),
-@@ -79,19 +80,8 @@ AC_DEFUN([gl_LIBSELINUX],
+@@ -79,24 +80,8 @@
    LIB_SELINUX=
    if test "$with_selinux" != no; then
      gl_saved_LIBS=$LIBS
--    AC_SEARCH_LIBS([setfilecon], [selinux],
--                   [test "$ac_cv_search_setfilecon" = "none required" ||
--                    LIB_SELINUX=$ac_cv_search_setfilecon])
+-    dnl On Android, in Termux, prefer libandroid-selinux.so, because it
+-    dnl defines many more API functions than /system/lib/libselinux.so.
+-    AC_SEARCH_LIBS([getfilecon_raw], [android-selinux selinux],
+-                   [test "$ac_cv_search_getfilecon_raw" = "none required" ||
+-                    LIB_SELINUX=$ac_cv_search_getfilecon_raw])
 +    PKG_CHECK_MODULES([SELINUX], [libselinux], [LIB_SELINUX=$SELINUX_LIBS])
      LIBS=$gl_saved_LIBS
    fi
    AC_SUBST([LIB_SELINUX])
 -
 -  # Warn if SELinux is found but libselinux is absent;
--  if test "$ac_cv_search_setfilecon" = no; then
--    if test "$host" = "$build" && test -d /selinux; then
+-  if test "$ac_cv_search_getfilecon_raw" = no; then
+-    if test "$host" = "$build" \
+-       && { test -d /sys/fs/selinux || test -d /selinux; }; then
 -      AC_MSG_WARN([This system supports SELinux but libselinux is missing.])
 -      AC_MSG_WARN([AC_PACKAGE_NAME will be compiled without SELinux support.])
 -    fi
--    with_selinux=no
+-    if test "$with_selinux" = maybe; then
+-      with_selinux=no
+-    fi
 -  fi
  ])
diff --git a/meta/recipes-core/gettext/gettext_0.26.bb b/meta/recipes-core/gettext/gettext_1.0.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext_0.26.bb
rename to meta/recipes-core/gettext/gettext_1.0.bb
-- 
2.49.0


