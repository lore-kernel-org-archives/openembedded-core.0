Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE591CCA468
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 12:39:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24440.1759235961402040747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 05:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=d6TvOq/7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2368802316=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58U3gsvm1970652
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=GnC+M23MZburqrAJ0SS+for17eT6B1mRI2DSwtSuUI4=; b=
	d6TvOq/7TthbOr/YppRvtTbGCQmhWnRfWeq2mEPRnKkEizPaNsZgB0va6FlZCRob
	lwarVw3NkjPSbm8NSibD17ZQRf6/05vRZXikx2K01yUmkCU5kXkTvvg1KJ98V4lo
	g66yE0yoQS5lLZ/sQkEtzx8asoroF9vDaioc72kEWKh+j11G5hDAfEyocQV6GX+k
	Obgl360vOj1IWTz3J9sHIRMIQdwqXCZYb1qkQbGjYHtFsQTMU3hgixh8Q83GShMw
	Cm9E+xfrgDcnBida0HlwYUHOtVbTFfd4xObfdxUS8H89oDS/XbwuZPIR3UsOWuZw
	TWspubuWSB2laythFRspwA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49e6w7kc7r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:39:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqqAgCJDJkA8B/vto5VyqgZF82VBg/yAr+VOrBRHaHIGWVTt4fABof6HUlDzECOK/4eWruREcwvlipIv3s/9cDneogbAnUOCRh4AFHRkq9ZHhfor7G0mAZTy8b4iVFj6/w5HedgAV2y2b9Kfg8l0HQcZxSZ4Q1oUXJQmQusVBw1H+6+7KJ6OKMZIrUE9fOWF1nKRAWc0lXRSrnN5bDIrn58HCXtMN46s5oCsVze2mNWThkSjrP8ZhFQr3vdYHlBqMw+u2vLHuDrh7YLo1ITiUD6TkuXDKyigSWbSQhtFD0KdqJzfDMQe6CS+Bm2pJC8tJsUAL0UcOjIVpGZEcAhudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnC+M23MZburqrAJ0SS+for17eT6B1mRI2DSwtSuUI4=;
 b=VPIDGBCF6nizaR3lxPRhU+h6Str0hgHIJ/65/0e42o5ApISr176bA4cpPIDxWRqOrQaEiTsTHmMQt2NGw7vnrUStlfZPxaHgOBuO6cxDcwaUf79oeDpngiOWLqtqCO9tGQQU/yofh75GLdV/VDMQeFD+VXXaLaGeNWrSQWCCTksSOh4nIgdJXCan2Q0y15dXQTa7skCH1cX4IdbjhW7z9Tsw7AKYMQ7tu7lfJPWJEBgtEC75ilQRP3nemjsnob7Rkpx2QfOFI2CBsHjPpenbWFAVD4LJCMxeNfcSjhw65hoEkl4GXmPJZHqV4OersSjwk4OJCmu1Wv7NLY9ckLs9yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 12:39:18 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 12:39:18 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 2/2] Revert "binutils: Add missing perl modules to RDEPENDS for nativsdk variant"
Date: Tue, 30 Sep 2025 05:39:01 -0700
Message-ID: <20250930123901.949798-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250930123901.949798-1-Harish.Sadineni@windriver.com>
References: <20250930123901.949798-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|DS7PR11MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: ff109445-bac5-4d1b-f89f-08de001e5f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SNX88hEqtgERfjOlJYDKtuyVZ944onPq6XP9RXlkNksPGNUEhQRnsP/2FPG8?=
 =?us-ascii?Q?BueGUPv5LCwncYvYvLV1Y1++ttN8YlpBnhv9WvOkE473Pr9xCAndgW2A+s7J?=
 =?us-ascii?Q?YabFdEge7IKmpDyHunewiz0gDCVJcoAl57yvds77/J2iPvUg4c1SIBx/f/KE?=
 =?us-ascii?Q?WH/wJKUUuzhyTJcI1U+RXEj+0CnWlR5ZzEhGa/6qYnSy7e8TKHZsoOkHKL1C?=
 =?us-ascii?Q?rmQm5Dp566htFd3CIiOS2KM9IBLQr0pw2BKMXase+gS9VU3DQMTzNlgIsdyU?=
 =?us-ascii?Q?N/QmfDCVnyC7IpplOIOgY50scalTPP018Eem6WbuOusvNt2v134p8sHE36qh?=
 =?us-ascii?Q?KT9LVmuVAjmrCkw5xg2D/7j/u3lx8MGQXRvZP5YHV1hLSy1gv8PW2Yzhrnwo?=
 =?us-ascii?Q?2kZy91fLASAD0vxFG2nX5lzKH0R2xCQEPbnspsLfzZ3wELDFZVItuGY4VrCz?=
 =?us-ascii?Q?RegFsS3klcU4z8Lz42Cfkq54DBWXY8r7ChoNH+YBxeOQmslMl9oOvC98DEsz?=
 =?us-ascii?Q?vs+rmjTFuXKS9jsl3FKP1L5p5ZA5yToiHLa49+nDkrTczLj/TxOT+tfUEDzG?=
 =?us-ascii?Q?p43DCj4hu2/VTpIn9NXGjwGiIjDdgJO2AO57lxabh5wfhewT/yHExRfX6B58?=
 =?us-ascii?Q?1AlAXW8n5DCAe2spMzloILU/m2yvJptXB+hJaXbKkk72m1sTwHYnPNERY1rV?=
 =?us-ascii?Q?OEOqhjRhzv8h45Cd+ATxplxRpTwkJQjh0u1wdR692tRUM0R5CcAZxCYLA4wy?=
 =?us-ascii?Q?AUO3onax8cgrrC8u4d3c2YeB4BNOdOpwRkbxlWuGIToEAS9kxzOJPIrfSM2+?=
 =?us-ascii?Q?jXy+2ZcYFgp5JXad9YsQUq9gyBSIVPK23gboXCcHZPx2Ti0OcAdL8oqxfugL?=
 =?us-ascii?Q?3+3J6vfuQszX8zuFkGIUXluLaXMJX0Vlo8P8vrA6flKKNKD9IqhIt1i03KkE?=
 =?us-ascii?Q?XBw9IAhk3InRAepcg3Wfy+R9h+zq4eRZoT7kxfegHnMEO0YdlNvxFH/pix/4?=
 =?us-ascii?Q?BPbAbBdWBC4yq35zs+vRIvWYQ9mneq24tVjJGbCU3NQ4GE8PzgrRJHofmPk2?=
 =?us-ascii?Q?I4riOp6DaQG6pKOSMcqb82ha/SdQROUWMD9bh04iztA6aM40r4tnAbpKuMou?=
 =?us-ascii?Q?kn7UXiX9v5eqd35yRMdqVEx+1prIVwAV3pQ/3dFo1JqYOo4HTze6Dm2K8e3h?=
 =?us-ascii?Q?vLe26+8A+EMHlyJD+/VFTUPW/p2dJsC0esDX+4jgZPWMWKaXy0ASPxIgdTBq?=
 =?us-ascii?Q?Jxvon2Wv5sOa0WhtV3I41yxqEuBhmWSgxwOlYcoL58qdDTHbbsmoRW4fJ+qM?=
 =?us-ascii?Q?Z0fZoBaUI5c6l9ALF5IrlKWGnfMJa5Xs9v4AqNyodQ+zhiQ5BWD5PWvV+fru?=
 =?us-ascii?Q?HI6qH9YuZzbOl6QUKhOJOMZs/B6yKqstX36ijp1ski0ldnfxyfBdH87DpGnS?=
 =?us-ascii?Q?6MCDFqSfHjN8QBDU34dOxkXfiNdYaVZO9C0dph10t/hGXuhrIkEKw/cHIT9s?=
 =?us-ascii?Q?KvvgrAf5WhNKCCBHnDGDUOtt5XKsBOfplyBV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3fNNG3hyznECiz8vV53AJ66cBAxGCzWl8o2TDAVhFPlXNC0MxnNJPq0RFHIQ?=
 =?us-ascii?Q?xCjiYlcfxHZ3laa/RuzZRLGC1Ags2UI2mrG0hQSif3ytK7y1Pi6oiUdtlCVm?=
 =?us-ascii?Q?B6NC21pMD4Gmmj1dm5qZytPg8SSITkpgw97gqexvaCYnQiP3ut/D04zbAeOC?=
 =?us-ascii?Q?Sja9b7JnHogx11mFk6lhOPKGHZyXoeE/K55ba+a7Pe624USjluefqpC7Q49m?=
 =?us-ascii?Q?layS8xagX9mzcwdkt3+9qv6CsOclAWovAB8pHb3qzqgQ6ViSbct8lYCWCvsQ?=
 =?us-ascii?Q?KdEsCzkXUA7DzxKT2neFvkqyZKTmAVV/2KVk7hfLUIDHnNh9MOLlpHsRriPp?=
 =?us-ascii?Q?N1L3YtLY+lugiHT4uW2WPjo0ZyZENNFzaxFZQL8AGRr7XHE+8VcFkhZrgj8t?=
 =?us-ascii?Q?lJJebvSoaE9djDw05dh4do8Cv5QQvdHK8B8OL/F+DBvs0oMaqGivoLRL6Ezd?=
 =?us-ascii?Q?T5qjpnkqYmvcoOKAAysssxXNiz3atbjtw2DiFWqQ74kj/9mxLMbysw73itPo?=
 =?us-ascii?Q?2pVLY76H+U3Cvp3MhL3uKBKljvTdELRf9f58S/Rfqxw/P+nDxRooI0ShX2H9?=
 =?us-ascii?Q?t8s620IfbYdTxJ4u56wUKz3McP02FJSPwMK+1YIsly3R4kkc+h8Ks2qso7H2?=
 =?us-ascii?Q?1nP9hl0WPNhLMEekPa4CqTjjw+8JWxqElF8RJ949ZBkoAM0TmlZlQpDlqMdE?=
 =?us-ascii?Q?h7eYoK+VaqmVO5N5HuKYOBMUQWxMARUecPjuZeQezmEeErbdINcOQo8dEUN9?=
 =?us-ascii?Q?UsoPKdEb2Be0PIPjYS7O2kju/karrGLAXCF3NN8JV7Vln2L+xnn8TZAzPr2H?=
 =?us-ascii?Q?pdxpg5NTEGUqhiyEhmJpyWaIguhgs8F4GDKLuxldt9PtVNDlDy6lrKd6OpSg?=
 =?us-ascii?Q?VJeiewd/7sep3FBQvUoq8RZpezaINVgplqmztGI5v7kytbemgqEa7EKmcgS6?=
 =?us-ascii?Q?OpD1sK0c19DM7fjdE+OmVAZibxeJ5ghTvFYo6UA4S1v1B8+4hGQ8YVJErHaZ?=
 =?us-ascii?Q?WhPIqXEKWU/e9kXFCj8Bh3WxBtdSPu+Yxt3ObGr4tJ5u4n8DgwGhwBQqBtto?=
 =?us-ascii?Q?yIbyrgpTelr0fguSyWkQj6S1AnXYyct1cuIkNm+TPSUP/Kx2MgMsv3KsyVjL?=
 =?us-ascii?Q?Feuawe+DAZPrR1q9bV6m0bhnhYeyhq6nAIWNUFWPwfPjikg7nuB40nmTJKUx?=
 =?us-ascii?Q?2wWsjg4yBis4calQLGiSqXoqySHdt+MS7yOZRWJIg6oSygLywc0x9ZfT3G6W?=
 =?us-ascii?Q?4/ksCJewoCDKZTBmAo7b0MkDwbA/nHSi+3kMLyDzw4QcR8aYEtNYpFUr8JN5?=
 =?us-ascii?Q?OhcFRQFXp5euEME2RdsynqGi+W1ZkdXtT96ob9sYvH11aFw14T4XTvZOwxDU?=
 =?us-ascii?Q?6pF6i+zK4g2ltsp9iTH2R10e5EztOFTrwTwcQPDJbK3d+zTdrEXekiZRxNdZ?=
 =?us-ascii?Q?bNRxKufOzFJsc0V99TNOQZ+wFN8Sf4SJCz/OxQFHfU3NcruEwhfmYRdWytbz?=
 =?us-ascii?Q?g/l0//4d38WPsGQWXQKYJJ9sku38ZWtZ7SMMMPjSq30x81rywpjkuFw05QWk?=
 =?us-ascii?Q?AlrQBwao1O97VpzkjGlRvdqT/VbptXzNb8PxsTryyowiicqoelvgNPX33uFG?=
 =?us-ascii?Q?0g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff109445-bac5-4d1b-f89f-08de001e5f24
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 12:39:18.6090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OG6HGz5i8KAwMXYQYbCIMoyV1AdjYw3eOL4/q/jvgq+d3N0KxTrB6GmE32xICPTVqZ1rpY6cOy+O9Rj9nl3h8IHa5WMd9C5vkWEZpvqzDIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDExMyBTYWx0ZWRfXwPnLZ4/xZbl+
 GchwgYf1ENv8BV1bnoIySc87s8yA0lR1Ma7cQ9xUjvs/+VZVRc9PeIRhVsmO0TUklZpNpTLjzEi
 MRtm6Wljiy+2dg5QDT6dHC4IAth3j3X7gT3cVinJ1GpDqRwRmALqXRE0fRHmEG+QlMVT53Mrl35
 ZoIOgxA6KERfoueDKRfwCZr8JLxe13W9s4lGR81tPrut9fPKeXG704Pd0JFQttgGYy6KSBAEW2E
 UbfUyWQBstEA1J3ZQQLdFsmY9+bfYQAHT+HmijmuWhZ4R0+c+44gSnAL4kVbgpkk3eYWC/j/UvV
 h4HmvjrOV6wMvzacZyupCEIEqZk8FVIuZHHgnyETpffFy2EwGTR3x7P7m5qpxiSOiLloDYembsA
 /vRDVQhlMSXanvIcY940Z2dqpkBMxA==
X-Authority-Analysis: v=2.4 cv=Lc0xKzfi c=1 sm=1 tr=0 ts=68dbcf78 cx=c_pps
 a=wCl41NmqrnDcz9wBTMCcbg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=o5ivU6M5laFCUDdvhgEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: GPWSI-QjN7V7tYLPNNs6WuO1juYthb2h
X-Proofpoint-GUID: GPWSI-QjN7V7tYLPNNs6WuO1juYthb2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509300113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224187

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The missing Perl modules are now provided by binutils-cross-canadian.inc.
Including them again for nativesdk-gprofng is redudant, as the modules are
already installed.

This reverts commit a827c8133b99ed9e2aeb3c9933812bc2913a7bd1.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils_2.45.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.45.bb b/meta/recipes-devtools/binutils/binutils_2.45.bb
index 79bcac2025..dce3e39000 100644
--- a/meta/recipes-devtools/binutils/binutils_2.45.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.45.bb
@@ -73,9 +73,5 @@ SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-al
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
 FILES:${PN}:append:class-nativesdk = " ${bindir}"
-RDEPENDS:gprofng:class-nativesdk = " nativesdk-perl-module-bignum \
-                                     nativesdk-perl-module-bigint \
-                                     nativesdk-perl-module-math-bigint \
-"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


