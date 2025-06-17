Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB073C7115A
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 10:09:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15139.1750154970924259913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 03:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8263d137de=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H879X1023515
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790282v6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:29 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55HA9Tob011655
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:29 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2089.outbound.protection.outlook.com [40.107.96.89])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790282v6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 10:09:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qei2KbGwtISDIqLiLBOa02tqgpnTt12axOWvsaKllZJYeo6E2M86fwfNvPegPAX4K5Um3OvXx1aUpq4EfA51koQCmCLRfhJspdjokWTC9PI4WJA0eoP6wxWxViNS8GG/4WvD+opPL6hYXve4BRMwWHNbIJBVSo1fk8og4KUjPsEDFrF2uvA0sClrq/BDyZmBXigmiiRIhpk/eKc/PMlvi7DOYrV1kFieLkhNZyDw0cBhQQmTivhw3FthYADpovzqMHHWQWRxzk9moxMx1gOPpOW9EdqeREwrxzhiTfm2SJzLfmAj7DcCXSBcfPAI9DPcMi7sUAAvv5VpiC6ROlvenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIQTQuFP1qraw9HcAdRZ3E0nKJvjZ9wSguf5EwjdMrI=;
 b=ppMPgE6/vKU3T3SsM8xsmWEsyYAxh08NDtRw9viT9JVyVQslFiKjqqmc5I9aiNVJd76sq2h18XW+NLBxcMcHoU7RsQM5AxPPjHhEFMxWlZqsITQoO46i2wf7IcXB/dhP3SBSAARqbFPrLxmr62SSwafbJs6708hZ7MigQSslnx7pvUBgjAAHEhCGOAamRzoBJaQ4dvEe5mw+8LHSMTU3vJKgJJ1MIESnJs94CqFteDXVnGHucRwXF3ptn5MxyMk2Kofe9RNqkL5roS1+GMA7B53AIVI4124Cixou6MlNyvMhdmZ3DT6L2NzcXx1oEdZBJ/Phcdjv+ko4pVpr4ZyYWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ0PR11MB4880.namprd11.prod.outlook.com (2603:10b6:a03:2af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 10:09:27 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 10:09:27 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        skandigraun@gmail.com, steve@sakoman.com
Subject: [kirkstone][PATCH V3 2/8] glibc: nptl Update comments and indentation for new condvar implementation
Date: Tue, 17 Jun 2025 03:08:49 -0700
Message-ID: <20250617100855.2696492-3-sunilkumar.dora@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3f04aeb8-6ece-4310-01ce-08ddad870ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2d4oGMB6220fbx/vwQUxIgaBwKeW/wPfRZpY74zFcxYmaMpNEZLKhbpEQ8nc?=
 =?us-ascii?Q?ddFTajwltnKyU5ypOHvSUu2g50pSSi3HXmOxlEhpyjxtHcrCc979Tn0XpZ8r?=
 =?us-ascii?Q?BIlyvuS49RI8OXJGH2ejzB1uZt/CWwi0wLHfhtXnk4n3m2YFhgGOU0wvYlRi?=
 =?us-ascii?Q?Nl2WHkgbRgSXK2sZTL9c+QBB93ISCdnu5gIPsd/WYgcjTeg9YW4EIlOjiji3?=
 =?us-ascii?Q?q9svgfbFcvNsAxssdUbTK+kKwLlR5sCQWXtZg4sb2MKV0pd14TeuEKEJkQgO?=
 =?us-ascii?Q?86/1RHTEX+u1Di8ZlUk6k/qkJhRxBbwDsWEI/640TvhL59CTFBbmwY4kwgaR?=
 =?us-ascii?Q?vSFnrgBfjZOLCH8i4rZ3wwzrsm8+LIEBOcauIk2B6m/zaxO76N6Uj3sVOkec?=
 =?us-ascii?Q?snVsfaDQ06kMxubaJmYsUcsb8KQasOKz67loAkW9elFIQfDp6bZ+kJkViCbo?=
 =?us-ascii?Q?C2vEKFJD7H1Y7/yWoBSNlNDHQ2zQIpq5KU5laji2CPwQoEEYeehP/xrhnW2u?=
 =?us-ascii?Q?6xZPsN0crcqvHd/NNxevYd0zZ9ZAJeVf6uJ87GyWbgv9jDLTlhYvkZ47kphP?=
 =?us-ascii?Q?KOuXXxxX+rJBjg21glkjEYl1fouMVBjeO5D89m4eLuD0E1IetBD+b27yfoA9?=
 =?us-ascii?Q?dd8bWwzz4ioHmZTaDtQ7N38oRDgyUu2wj7QIQOPxD5VpsVyjK4sYwNq6rg9H?=
 =?us-ascii?Q?3/C0NktsODytGftBKyOQfCaWbSenmcX9ERuQVATVRQo2hu4+bCLGU7enRTy4?=
 =?us-ascii?Q?f4aYTiOhNz3xtc7BVAZBLfD/ZNsztITqApED0Lf0ocs3GHKm4MnplRr6osuR?=
 =?us-ascii?Q?vdi6P8W5uc7rOI4YsmDiBdOngZ4rM3HsQ0JWyrw1TJJ+d1FzV2L4ioouVASf?=
 =?us-ascii?Q?oKpeE5JtqSkKkxS7W/hd7tF8vnxYlYHjhyViM8xZr94vhSY86eF0u/tiWaUK?=
 =?us-ascii?Q?IFqgZzoScmWMdTQMfnhCCIrSriQ6Lwu/XIZU6KrFD52z0AjajgS+mSbibHeh?=
 =?us-ascii?Q?WUFyFFLX/pYsLfGG5Q7vBQvBPjYucyg7C9g50vLksNeLaSbPibkSWpMxwj61?=
 =?us-ascii?Q?MlMja1zHL5tgbuomY+FtOzADRD9umj6dGqHu0o+FJKIKhQQm1EH5CMEPvC/X?=
 =?us-ascii?Q?hJXIWiVfe5VUKPy0jHKLqZZPjiJYO0eIPHiKiDKmoKWc5MZ4WtJ6HTHtY0fT?=
 =?us-ascii?Q?j5nhKfUv8Uy0oYEmglXTIKw/m/P+SXYS1lIoZfbruYaB0y0hv2jX9SAO2qD5?=
 =?us-ascii?Q?Ry8uh06bmTFVvPKXEHI0HqhNudqWgQ2bA/kVyJV2dTY8gQPn9kDTfzFLVk1h?=
 =?us-ascii?Q?uSrpoBnbv0C7k3fqDnQmB3hF9Iu2R3jO1lHrNhC7EEIZI4NfI/vq2IX2jsGZ?=
 =?us-ascii?Q?CJD0iEd/oRjF4H2WMcaKBS2AQ2eAfOuxZA4usweeBQt+V7epsaI/A+cPvcFr?=
 =?us-ascii?Q?44uFIDPT27EMAcsBjm3WacqtBf7CZbNC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J81L1ja8IHMqtOSxRU4sZ0BKlkgN37BEMn6C845KsSL5EwxM+TML++nnJWD1?=
 =?us-ascii?Q?K79erGuDRKgxuEDVEC7xjJISOJy/5Ef2OyCaLSEfMoDGJzwH8V2BY8xm8xTc?=
 =?us-ascii?Q?7xmkArAvaqEJn4QNCRwTSVwh+IKr4LHhoKf3S62ECrC9L+smuuVQz0t9X4c6?=
 =?us-ascii?Q?yG+hx0Wh/8lo4/VVYxoy3qHbTkpnUO8sWYeKx9TwdcAKvKj6oIXSS4bOcebW?=
 =?us-ascii?Q?+wLJX3/zyUaNo+asSDNInli7+h8OD9Dl+UZ1asOZNJMKkZKibgIlecfO7QjI?=
 =?us-ascii?Q?Vat/DyE/SxAEaoIXLbxK0hhxDhVVkIfVcp04JA5z+GDkiJaEOd7SV/jb/XD/?=
 =?us-ascii?Q?upwa3u5sGQMwc4/7cr7RW1RZOy2Gzqd4S+SG2cmwpI8rdFFhl8a24x6JZHKo?=
 =?us-ascii?Q?1T/cgy5l8b+21hdlkXQdQIbObZSSFevdDl7iQUDHuaF/b1Z3Ei29+Yb0TsHS?=
 =?us-ascii?Q?zaP/5XrNWfEhTvCVxxXccqlzwCfWZawVS7/tewn1XyUfjR+wykMiWTfQqVNw?=
 =?us-ascii?Q?qXnLLz56zSH5gWU4QPWTvnDXlylWWzt8JZGGFZKj7eExpEHB/K6vs0PehFUW?=
 =?us-ascii?Q?7vmKNhe5wNI8Xv1kixHfROhmhh80S5nMa52iASEdwwOBNb8kT4me/Y5l6hfX?=
 =?us-ascii?Q?aOIAkAkLLC87CGKvl5fVWaW4VT9EWjMc9k+/TKrhPNz+g8TTniZy44PolGiu?=
 =?us-ascii?Q?FABTugAmqcahgffyL40uqudl2QOgbsBKiuP6Se3UeBeirAbAH/O4NjUvKH51?=
 =?us-ascii?Q?4NVZZZnwVHWli/C2VtyNknKwbdsY9Ogn7s94ut1EMz1KZJmYvEMIFu827Qr+?=
 =?us-ascii?Q?HX21Rvk2nCFfsj8K0l5TgiGIpRMjDQs5+9ARPCZu1Vkt5EHQuPhIplbvcw/S?=
 =?us-ascii?Q?jvDc0chn+kYSP/9Zu1sCIbnvTACwZbROF+2+Ba2FH9+Jg1/W8f3DhirI1A0y?=
 =?us-ascii?Q?yrxZ6/gBBrZZJWmScYz1JFbFcA/FC+TXCYNcGOGqOTzq0wpH4GH9xAoTVRw3?=
 =?us-ascii?Q?2SOdIVKTwflMIZf4C+AmN7GInL3hAufZieDhlo2hfN2MgziW+sLhBvDc2RA2?=
 =?us-ascii?Q?eC3oWxHJgtbXuU/dt/L/aYPJF6fQTlsMa/Fpo3h2ULIreFM775p1un3rPayO?=
 =?us-ascii?Q?8ndh67t1YPjTrq4LvrzVBJGS1fio8I1MIcmb5bWAA85yUmL0aWJ6RuOFPc8C?=
 =?us-ascii?Q?6QEHsnsEQY2ZH0u15SrNgkjtnqv7ij4zeEAgGnYNnROJLxWJcqOPwq75Dwoi?=
 =?us-ascii?Q?crLFIG9jDhkiasUmMK0Nf3rQFrc+RAL+MoY6PnLl7aCE518cE3Mu8oHtfLz1?=
 =?us-ascii?Q?tdMDvGRI+a3I0YdPigEHOvtk3AZspgzFScQESByV9LSXPOr4GiwpHVVyjKwG?=
 =?us-ascii?Q?slNFVFoGCgBOcE/espuVWVrXReYAxZIdRdC+EHqjzapCgVU/ktKobQbMPtyG?=
 =?us-ascii?Q?ht9iKUMeKat6vQmck6Kzs0cgPZ+pn9/FjdqQrQ0BLQtuqs/MXZ7eH3DcY/fi?=
 =?us-ascii?Q?LfB1+/1j8MGg6CWwReM3V/47cs8+Ba7ku50DS1k3LrI+p92WUontoyPY7PUq?=
 =?us-ascii?Q?pRDLAFnEiGqnP8uVzXLDtFfoSk3jsO0CUBpciTcagRHkRUWWGiBV0QjEII7P?=
 =?us-ascii?Q?Y3Rb/ohcoI2XRGYNbgXIgUU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f04aeb8-6ece-4310-01ce-08ddad870ad2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:09:27.1561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbF0eEKqwkGGMRA7Xf4WGLTKXf2wM3PXyGrQJu54ax78QPtvORStjPhWSX5gJoDtBoo8A6ran2nHbyFL6ILc84cjinRfb8JJN2bCaPxhHJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4880
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4MiBTYWx0ZWRfX1mzzanDDyFL6 eoBRdXGMM08MSSyWXMZj2jO56o578uSKtZRUsSqMbljbWkejV7KBn8geL/3uzZUyJH1X2wViIFW sVQS22l7IUKcCHOkIrDtlXJ7403rHYZguxRaXGfGe33fHbsEpBUyNDqlzzO5PvS6D8CFFaXWavD
 0kgRpTeiKdhaRcIdR+MAZaONfw7z8TNoH7d9Zd/tcMayi6/ZiVQ/J70jVMKjFAHa8/eB93Uxu04 mQ9ieNm6dU38ROjrk+hM76/ZYACoslHDwqFZHBrK706YlE0NiTLaDH8dEfiZpXux1LTTJrvZ7Oq XiQW+oU3KaQ1xIgoLRwE0mjFfEppcMgOV3TWt0RMZmKzdZg4T0FOVc3l97w8W1/YVNGRJqQr9lF
 J8ZK4mS3yHnQRm5yLVEW/WmOsQH8OKadHpU5kgKEyGn/YyYXsK/OdMhdMrm/6Y3X6nqSZfXP
X-Proofpoint-GUID: g_TGsLGZO5VRPM0qn8_ImwxMcXvVCs41
X-Authority-Analysis: v=2.4 cv=ar2yCTZV c=1 sm=1 tr=0 ts=68513ed9 cx=c_pps a=9C35tCqyHM+r0tyiOoHRTA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=uzjaQC1v_Til1Q9DAxIA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sZWn4CyZXbfzv70U4yWWnhuUHe2dAo_p
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
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218871

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=0cc973160c23bb67f895bc887dd6942d29f8fee3]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-2.patch          | 144 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-2.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
new file mode 100644
index 0000000000..cb89431769
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
@@ -0,0 +1,144 @@
+From 6aab1191e35a3da66e8c49d95178a9d77c119a1f Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Mon, 16 Jun 2025 23:17:53 -0700
+Subject: [PATCH] nptl: Update comments and indentation for new condvar
+ implementation
+
+Some comments were wrong after the most recent commit. This fixes that.
+Also fixing indentation where it was using spaces instead of tabs.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=0cc973160c23bb67f895bc887dd6942d29f8fee3]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_common.c |  5 +++--
+ nptl/pthread_cond_wait.c   | 39 +++++++++++++++++++-------------------
+ 2 files changed, 22 insertions(+), 22 deletions(-)
+
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index 8dd7037923..306a207dd6 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -221,8 +221,9 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      * New waiters arriving concurrently with the group switching will all go
+        into G2 until we atomically make the switch.  Waiters existing in G2
+        are not affected.
+-     * Waiters in G1 will be closed out immediately by the advancing of
+-       __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
++     * Waiters in G1 have already received a signal and been woken. If they
++       haven't woken yet, they will be closed out immediately by the advancing
++       of __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
+        which will prevent waiters from blocking using a futex on
+        __g_signals since it provides enough signals for all possible
+        remaining waiters.  As a result, they can each consume a signal
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 1cb3dbf7b0..cee1968756 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -249,7 +249,7 @@ __condvar_cleanup_waiting (void *arg)
+    figure out whether they are in a group that has already been completely
+    signaled (i.e., if the current G1 starts at a later position that the
+    waiter's position).  Waiters cannot determine whether they are currently
+-   in G2 or G1 -- but they do not have too because all they are interested in
++   in G2 or G1 -- but they do not have to because all they are interested in
+    is whether there are available signals, and they always start in G2 (whose
+    group slot they know because of the bit in the waiter sequence.  Signalers
+    will simply fill the right group until it is completely signaled and can
+@@ -412,7 +412,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     }
+ 
+   /* Now wait until a signal is available in our group or it is closed.
+-     Acquire MO so that if we observe a value of zero written after group
++     Acquire MO so that if we observe (signals == lowseq) after group
+      switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+      store and will see the prior update of __g1_start done while switching
+      groups too.  */
+@@ -422,8 +422,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     {
+       while (1)
+ 	{
+-          uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-          unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
++	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+ 	  /* Spin-wait first.
+ 	     Note that spinning first without checking whether a timeout
+@@ -447,21 +447,21 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 
+ 	      /* Reload signals.  See above for MO.  */
+ 	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-              g1_start = __condvar_load_g1_start_relaxed (cond);
+-              lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++	      g1_start = __condvar_load_g1_start_relaxed (cond);
++	      lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 	      spin--;
+ 	    }
+ 
+-          if (seq < (g1_start >> 1))
++	  if (seq < (g1_start >> 1))
+ 	    {
+-              /* If the group is closed already,
++	      /* If the group is closed already,
+ 	         then this waiter originally had enough extra signals to
+ 	         consume, up until the time its group was closed.  */
+ 	       goto done;
+-            }
++	    }
+ 
+ 	  /* If there is an available signal, don't block.
+-             If __g1_start has advanced at all, then we must be in G1
++	     If __g1_start has advanced at all, then we must be in G1
+ 	     by now, perhaps in the process of switching back to an older
+ 	     G2, but in either case we're allowed to consume the available
+ 	     signal and should not block anymore.  */
+@@ -483,22 +483,23 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     sequence.  */
+ 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+ 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-          g1_start = __condvar_load_g1_start_relaxed (cond);
+-          lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++	  g1_start = __condvar_load_g1_start_relaxed (cond);
++	  lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+-          if (seq < (g1_start >> 1))
++	  if (seq < (g1_start >> 1))
+ 	    {
+-              /* group is closed already, so don't block */
++	      /* group is closed already, so don't block */
+ 	      __condvar_dec_grefs (cond, g, private);
+ 	      goto done;
+ 	    }
+ 
+ 	  if ((int)(signals - lowseq) >= 2)
+ 	    {
+-	      /* a signal showed up or G1/G2 switched after we grabbed the refcount */
++	      /* a signal showed up or G1/G2 switched after we grabbed the
++	         refcount */
+ 	      __condvar_dec_grefs (cond, g, private);
+ 	      break;
+-            }
++	    }
+ 
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+@@ -536,10 +537,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+        if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
+ 	 goto done;
+     }
+-  /* Try to grab a signal.  Use acquire MO so that we see an up-to-date value
+-     of __g1_start below (see spinning above for a similar case).  In
+-     particular, if we steal from a more recent group, we will also see a
+-     more recent __g1_start below.  */
++  /* Try to grab a signal.  See above for MO.  (if we do another loop
++     iteration we need to see the correct value of g1_start)  */
+   while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
+ 						&signals, signals - 2));
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 2d23c17a48..b7a9a2e0e3 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -62,6 +62,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0026-PR25847-1.patch \
+           file://0026-PR25847-2.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


