Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D181C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 00:46:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11729.1787618781828452278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 17:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gpv8Z+XR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P0VY0g343615
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=csRGpSn15BLRLyg2wG90rkvxxOal3/d2IS4AIcVjFNQ=; b=
	gpv8Z+XRYhfZxN6oqz0XROIRXLSF36EebJkTEvlWzy+M13jLQquJAswr0hdBLBM/
	aMPR9vzRJ1ukUWqA8A4dxrr57yYezIhSV0oxMM8JeBLTdSJ0axzsdc3lrBzpw0O4
	C2Zje4+jz5WtK06qWTmLoZYaW1YE9F5k1P3E/quTB7ESjfvifElKD/4TCdqPGRxW
	CFO5wJ9o5t+Gk/idN70i7PdDUs4cqOZgn9f4QmFNdB32HrWTTHofCayjJftC1s52
	ovZI3YMg4SzxEUNgmGLieVrmBcg/ijZFLdZRctsJJcfD59adOuuC308Drh8Wp5Ha
	v443PrFt1wj47Re0YBuw3Q==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020122.outbound.protection.outlook.com [52.101.46.122])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7100kr8c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 00:46:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpRQ9mq47E9/LHGBasnA+1jSpymSgqiHpheyMFH9FzpbAqFQPyrs1iuRSnRACbWWeQR+IbYEvVstLmYhTKXLIOrrOIvTj1s5aZuS3UjDt8CQ7yTyJIlyy9K3D6Lom3ikUBb/Qhtp3fQNeo4vCfuc49/qkc1xIkU9fN+O3y1CSeQPVQ4Ku0SBEQHmOH4ZP+y/yrH3My5lej+ufYJ/UFk4g55OoheRzNCH/we7Vs6NIsa15q4rDvC+HSug49SqauhRB9ofMnDJtveMIg7bVlvm/keFzD07fVtQGI/nYAbeeV8wuU4LV+rD/9I8jJlFY2GywrDnTzAXTCOVscYGOj8dmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csRGpSn15BLRLyg2wG90rkvxxOal3/d2IS4AIcVjFNQ=;
 b=sKLDljC24t5Acq/yXW50wjZ4ephRy14G6o4ALNmdMIkUoTaTAj8eh/9hT577JDoR5PeKHCAdASdIKmb3wsdD3os4746ou8iktqragxCmC+VsQJPoN5a3ZN1IjVgsCFwdnFiMtMkksSX1ZKCXMxZgjMU+tsusqf4RvZFQTf56i7V9hxW+rNApjf9QcoqUxLUe1R74+ripHvetMCLDcv5PT03pg5b7hPyBnfktrYEKKero03T5qzhEkkK1vH3xOvAnQUObugECTbmgxukRJgA0irSzy4D8XYjmvUWs0AEDgrDkq6sbGpbKZDMi09gDpbICmbnpB3HrxIBTRnIOLqkCjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DSSPR11MB9642.namprd11.prod.outlook.com (2603:10b6:8:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:46:18 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:46:18 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v16 10/14] libarchive: Disable RPM filter auto-bidding and update huge_rpm test
Date: Mon, 24 Aug 2026 17:45:47 -0700
Message-ID: <20260825004555.4111831-11-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
References: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DSSPR11MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a8c3fc-93f0-4364-70b9-08df0242462f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|11063799006|10067099003|12006099003|6133799003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	PwzsAadm/3zZrF7Lvz/NZa6hb8NBTL268mxTJk0XMXjjPuiGkllA8m6zlW/WSmN0lBtbx938xpyEEKg1EvdRFbcWHJvuGihI2CZxjrGEl8lo/y2tkhviCLZRl1Vulpa+wdAOAz2dwTZnL2lz9xEbmwphV4b2Pqz4AycUH2JgWY4lhSWz7UjnZ1Md52aQDme7NQbQJtCqHFTE3h6UP2FqYFu+jUw0GJa4hWFqSYbo2jRLS4Qs/TvMrkY6oZN9plYaUAYrZ/OcsrE17UMneb5hiwWdzW+g2hvRhRLLs6OIFiReRO/3pDHmJACW3gKd49bXfC45M9bEH5laVLnumJt3oChnU0pSX9q6dA6Ja3N9FoYf3KsBuB6VN38cSOov71iVHybapExqKvoO/P4hndKuGJ+3vquETv5/RJRflRnYCteZ/LRI0tkbM77QyzK1g/rED/In2Wz++w/2Nx7WmKcKcIM9faRLOXxCuDykvBtOBPyY3W6r6Lrn6V2d0i+ZM+Ft5mtRSDAsT/PgdPwrzJxZbMvnbwfZyWJTAfNdD1Cqi/m37EdvUiayS+Zo/xN46rSlVBjuPufwUUIwcRczVbBH952FQI/7wugUWK5Rw85BSodZGw3oDK8FlF7wW4jej9A8TDH8x34tL2zYC6KDFPbnlSxe9EtZRGa45oA4uwjTHe8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(11063799006)(10067099003)(12006099003)(6133799003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pzmcrj2JKPW/mLBWa7bvbbJ3hN5yxfdybl13lSQrrcOu3moDSHp1zgufCGU/?=
 =?us-ascii?Q?0S+7WiROWgpd/wQSxo0SYH1l82ItxIJ+zub3pLBJc+NGRVxvHUbPvmdxamM6?=
 =?us-ascii?Q?7ALV4fvhO7mWqvZUkDx1Ri1fIf3Bd3mtRW2BS5bcLlneEBGMLa7VGxNGFQRv?=
 =?us-ascii?Q?WKOFyLabwvgBZ1VilGS5G4pbfb4y+s2ctDsg2AeBwpzeP6k9EBJWIWwzO9MG?=
 =?us-ascii?Q?ggD3oEN1uBxS6aywRKpgycs9hibfwqo7xNeAJ9jWZC+WKMTjP2j/RGqnFAMi?=
 =?us-ascii?Q?yPUyUNTvbvgB9iodrpy+s1hh+yY+OUF9vHwxNTdT1URdEGEkAF5hB7VSK7FE?=
 =?us-ascii?Q?5I6GRv9Bu8kDifusX25tQzl+Its2/z09E9rOCxMxoksHcfB7BSWc0s9M0mXr?=
 =?us-ascii?Q?kCfZT/3uqYNJ9ExmxnZeI2orCHqDyE+8OoUUuasOnZssl7e2pe38gcFvQUJd?=
 =?us-ascii?Q?JIJLSTZfi7yoY/MQRXch0RcXy96gK80aw0VuqtDz6a+dsxiNCSEzV+RGiZDo?=
 =?us-ascii?Q?l4UY6iX/72/wiKksF4D6EEqw9bFDuJ/N4Oefzr8/QiR+fFdVV051rD4f4aYY?=
 =?us-ascii?Q?8FwFK09xviD9NqPldHIzPLNQen1zp3Uk5pqTasrhjo+ImNTAtYqeVpmTnsr3?=
 =?us-ascii?Q?SWKwGNIUxNdWtNV90kq3A8csTPD1KY0Q33SWkX76aqI2Qlg7BrEdCjjb/3sk?=
 =?us-ascii?Q?4VklCClO4jcgmxm2STGfMFY8bOHHuskf2Rmeid4DlL1NM+UaWdLyS1vGycua?=
 =?us-ascii?Q?/7hf/N723kiWF7hIc5kK3QOUcV5nWj48t5QOW2o/nB03vhjjakrPfsXeKt1A?=
 =?us-ascii?Q?fLgq9Bf4nA5UADKrpAx+5oLROyN8s/58rrYszU3l3L1l0Z9gSp05TYV69p7U?=
 =?us-ascii?Q?Xr/UP0Srtb2v6VyStYlbGamZGHCXT3YzagFXIPvOMcaH8fsYj5fCyTNnJkY6?=
 =?us-ascii?Q?QOsEcbuiwvtkxu3D8j8CvIB4108wCOyQxDeTdadWtLKCXWpe8W7rbGfKsfux?=
 =?us-ascii?Q?5cL/QNZjUFGxmF6vKaphkyI9tAP7Rl3ym2Hzv1wftwKrJCaMLT/aKD3xKIN3?=
 =?us-ascii?Q?YWfG5iwxOSikHuqNUM1RVMgH8piJJqB4S9ax/VZwjBvUAyiBLjT+XbkyVf8i?=
 =?us-ascii?Q?yzSyYLGWaKrdYCoOeMu5c5cgejVF5UbS0vyUZjrPAzjjh5X1E1oZxVyEwimf?=
 =?us-ascii?Q?yDeMsaCDH/amGN0lzQtLDRJ5yP+do8bpxWtfluUqev9DkKjlNQNv6BSSBnWB?=
 =?us-ascii?Q?KnKd6gai48+v5+tCS5l/Yoqg2VfZs3ZBPcbAZ25fki4ZeUtp91/SO2Tkpa/3?=
 =?us-ascii?Q?9Dj+R+uh+mqgt72llVdOfkIEYA03h/blSIKQ1uYB1mxSd36vS3nyj740CYRo?=
 =?us-ascii?Q?J3Rvch7elEPeAxjDFK/TU9K/lP2V+SBxyJ0/rsXQ7/VB3Cgnad/kZyeb3L4+?=
 =?us-ascii?Q?gCI1lNgs+Ym81RTNlm8m9feWWUJHwnbyrwD+fDQdzk69pZOlC4adWx64fzq4?=
 =?us-ascii?Q?MphLz/HcVXC/PgD+xzHp87xxIde7kH+D/1MeZyAfh3rD0rhNjT+9qej4ozl0?=
 =?us-ascii?Q?crzYBtmg6GwBFp0OAhSTV/jk3eOkU4tkHxYBkmZwBbGfxncXHRN3cOUFTD+R?=
 =?us-ascii?Q?OG87hu8GcYGfGDfFypL8slfY2yg5si/CAhlTQ12+sYDNabNQjqzNWsfeotAq?=
 =?us-ascii?Q?3kiiVffKc+RnBX2iZRwJjfAD5EJcgJHVIr9KQy76ImnsWgLy5X36S1EZqZS1?=
 =?us-ascii?Q?1Z1l7cfUgS95dRPXRikaWpY9+L4K1QM=3D?=
X-Exchange-RoutingPolicyChecked: 
	fWgjX1syWqeWM1Cs9K+sduAHGhMcg3rEyAp87wpQLAOYTQWwcsMKhlGgYa0Z1ad1BGjaCldEaZauJAd16/bwXhlyJ5+WFdgi8i2vfAh+Z8LJxVjqkNTVj1HohjKUzBt9K2c20c0npV2jaPBzQ3xHsqfiLgd7bUNFdNHzQDIEXtEkdPUajaSSAPEzH/ORD7XU8EKPncoIPzyuV3/n9cHEM5hifn3xM/JWdP69PbfJaLdW+AkMmPAYn95B1C9g6g6mlQiUA5/YZQCDVgGl+p+lcH9MWjxetwY2xJkl+ahtVkrPxU1pjb8OVFZe0oxXPkHzsbLTcIU4dmJQzLsMZ2wLCQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a8c3fc-93f0-4364-70b9-08df0242462f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 00:46:18.0861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9d8KMjjGWHbxzNWfz336MGcg8X5G+nTXnVsjHftw5t1OvpfW+jBI1HEDuXBOaRGjzT1uFyoXBFSM1Nw0BQPXvTSa90WmNJAQekhMxY9xDh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9642
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 3roJsk10FNwUwAZ9IXVOeirtdZlK8VEj
X-Authority-Analysis: v=2.4 cv=UaJhjqSN c=1 sm=1 tr=0 ts=6a8ce5dc cx=c_pps
 a=Ov5XJGn/dQMl/+TwTE/lXw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NzkYBEk6AAAA:8
 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=9_fcTNOi7W61J8-o3-UA:9
 a=DC3Xf0KLC0SIM7_k:21 a=zqED95DPWUTvcrp2mxve:22 a=fYNom5PXsM5enKJDCoVv:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 0fuJS7I1ga6tRbcFA7pgKEB6g6gY7YFc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX/2z75ywfsnb6
 mLdnM6lXEuMQ/MudfzoHM26bd1pSXh7KX5j26ndNpPsiXynoYg3NQak0NRBK2b/WQ9LXvTT9kWq
 x8tM58e9MFmLUakvJKZy9lB2kBG8z8SRZsAGf0UPzM4AKu4osp6M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX2iB2w2lOp1mz
 PWHUWLUw84VpfDQF5fmjIn42ff0JOo0wggvBtMDpiQHDyusBF8UCuLb4D/PtrRoZqG57j6lfmhU
 0w8eV4SLXJQ4Cu8Q8givg2PZTTVmM9e13dSn3GPd6549gu0a1jdhhQTXkzuvFsAxa/31SCaTHj9
 HiWy2/bzTHy+OetLA5R7vobJUgPO7i2N8PXwv04VKVsXFb9pVSo2992okU4XUOu7V979lSr+9S9
 GNlGhOVPVslDks1gAhEgTFUmdYnTjmvM7ctILJG2BE1QdwJpgAepdnz1GLl32hAuFPntv9oWf7J
 /6r3aqdZKimK1rGT505a//dRgEX2hzOPZa3PWRJc3L1Xrcchhywupxz0SS31xjcGL3RMnYGadiB
 kXgYhlealhGi21sS9s9giqLH+hFHvcDhBlwxqpFcWOCcRMvzoCIWksZNMEN70UA3WkRu3TdPvSx
 EJ5p61HlGAECVq0ZgOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244167

 * Add 0005-Disable-RPM-filter-auto-bidding.patch:
   - RPM is now handled by the format reader. Disable the filter's automatic
     bidding (return 0) so it never intercepts RPM files during normal
     archive opening. The filter remains functional when explicitly requested
     via archive_read_append_filter(ARCHIVE_FILTER_RPM).

     This ensures debuginfod and other tools that use
     archive_read_support_format_all() will use the new RPM format reader
     for RPM 6 packages, while maintaining API compatibility.

 * Update 0004-Convert-RPM-reader-into-a-proper-format.patch:
   - Include the test_read_format_huge_rpm.c changes from upstream PR #2846.
     With the filter no longer auto-bidding, the format reader handles the
     truncated test RPM: opens successfully (ARCHIVE_OK), returns ARCHIVE_EOF
     on next_header, and identifies the format as ARCHIVE_FORMAT_RPM.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 .../meta/nativesdk-sdk-provides-dummy.bb      |  1 -
 .../recipes-devtools/pkgconf/pkgconf_3.0.6.bb |  2 +-
 ...vert-RPM-reader-into-a-proper-format.patch | 42 ++++++++++-
 ...0005-Disable-RPM-filter-auto-bidding.patch | 73 +++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |  1 +
 5 files changed, 116 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 6075770bf0..37dad54409 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -11,7 +11,6 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
-    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
index 471433e7b5..0249c87878 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://pkgconf.org"
 BUGTRACKER = "https://github.com/pkgconf/pkgconf/issues"
 SECTION = "devel"
 PROVIDES += "pkgconfig"
-RPROVIDES:${PN} += "pkgconfig"
+RPROVIDES:${PN} += "pkgconfig /usr/bin/pkg-config"
 
 # The pkgconf license seems to be functionally equivalent to BSD-2-Clause or
 # ISC, but has different wording, so needs its own name.
diff --git a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
index 29d12bb539..03a207f33f 100644
--- a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
@@ -11,6 +11,14 @@ Without this patch, debuginfod cannot scan RPM 6 packages:
   libarchive error: cannot open archive from pipe: Unrecognized
   archive format
 
+The test_read_format_huge_rpm test is updated from upstream PR #2846
+to match the format reader behavior: the format reader opens the
+truncated RPM successfully (ARCHIVE_OK), returns ARCHIVE_EOF on
+next_header (no valid entries in the crafted file), and correctly
+identifies the format as ARCHIVE_FORMAT_RPM. This test requires the
+companion 0005 patch (which disables the filter's auto-bidding) so
+that the format reader handles the file instead of the filter.
+
 Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/2846]
 
 Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
@@ -29,7 +37,8 @@ Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
  libarchive/test/test_archive_read_support.c   |    2 +-
  .../test_read_format_cpio_svr4_bzip2_rpm.c    |    4 +-
  .../test_read_format_cpio_svr4_gzip_rpm.c     |    4 +-
- 14 files changed, 1162 insertions(+), 15 deletions(-)
+ libarchive/test/test_read_format_huge_rpm.c   |   13 +-
+ 15 files changed, 1169 insertions(+), 20 deletions(-)
  create mode 100644 libarchive/archive_read_support_format_rpm.c
 
 diff --git a/Makefile.am b/Makefile.am
@@ -1398,3 +1407,34 @@ index 6062c48..11dbbb4 100644
   
  	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
  	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+diff --git a/libarchive/test/test_read_format_huge_rpm.c b/libarchive/test/test_read_format_huge_rpm.c
+index 51208c7..10c7fb7 100644
+--- a/libarchive/test/test_read_format_huge_rpm.c
++++ b/libarchive/test/test_read_format_huge_rpm.c
+@@ -26,6 +26,7 @@
+ 
+ DEFINE_TEST(test_read_format_huge_rpm)
+ {
++	struct archive_entry *ae;
+ 	struct archive *a;
+ 	const char *name = "test_read_format_huge_rpm.rpm";
+ 
+@@ -33,11 +34,13 @@ DEFINE_TEST(test_read_format_huge_rpm)
+         assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
+ 	extract_reference_file(name);
+-	/* This archive is truncated -- if it has data, the bid has screwed up */
+-	assertEqualIntA(a, ARCHIVE_FATAL, archive_read_open_filename(a, name, 2));
+-	assertEqualStringA(a, "Truncated input file "
+-	    "(needed 34359738384 bytes, only 10256 available)",
+-	    archive_error_string(a));
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a, name, 2));
++
++	/* This archive should have no entries -- if it has entries, the bid has screwed up */
++	assertEqualIntA(a, ARCHIVE_EOF, archive_read_next_header(a, &ae));
++
++	/* Verify that the format detection worked. */
++	assertEqualInt(ARCHIVE_FORMAT_RPM, archive_format(a));
+ 
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
diff --git a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
new file mode 100644
index 0000000000..26a0159908
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
@@ -0,0 +1,73 @@
+From 882166d7fa113f0c2108864b8a579d01816e1fce Mon Sep 17 00:00:00 2001
+From: Sumanth Gavini <sumanth.gavini@windriver.com>
+Date: Tue, 11 Aug 2026 12:02:31 -0700
+Subject: [PATCH] libarchive: Disable RPM filter auto-bidding
+
+RPM is now handled by the format reader (archive_read_support_format_rpm).
+Disable the filter's automatic bidding so it never intercepts RPM files
+during normal archive opening. The filter remains functional when
+explicitly requested via archive_read_append_filter(ARCHIVE_FILTER_RPM).
+
+This ensures debuginfod and other tools that use archive_read_support_format_all()
+will use the new RPM format reader for RPM 6 packages, while maintaining
+API compatibility for code that explicitly appends the RPM filter.
+
+Upstream-Status: Inappropriate [OE specific - keep filter for API compat while format reader handles RPM 6]
+
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ libarchive/archive_read_support_filter_rpm.c | 37 ++++----------------
+ 1 file changed, 6 insertions(+), 31 deletions(-)
+
+diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
+index 01bd1bf..8e90da3 100644
+--- a/libarchive/archive_read_support_filter_rpm.c
++++ b/libarchive/archive_read_support_filter_rpm.c
+@@ -79,39 +79,14 @@ static int
+ rpm_bidder_bid(struct archive_read_filter_bidder *b,
+     struct archive_read_filter *f)
+ {
+-	const unsigned char *p;
+-	int bits_checked;
+-
+ 	(void)b; /* UNUSED */
++	(void)f; /* UNUSED */
+ 
+-	p = __archive_read_filter_ahead(f, 8, NULL);
+-	if (p == NULL)
+-		return (0);
+-
+-	bits_checked = 0;
+-	/*
+-	 * Verify Header Magic Bytes : 0XED 0XAB 0XEE 0XDB
+-	 */
+-	if (memcmp(p, "\xED\xAB\xEE\xDB", 4) != 0)
+-		return (0);
+-	bits_checked += 32;
+-	/*
+-	 * Check major version.
+-	 */
+-	if (p[4] != 3 && p[4] != 4)
+-		return (0);
+-	bits_checked += 8;
+-	/*
+-	 * Check package type; binary or source.
+-	 */
+-	if (p[6] != 0)
+-		return (0);
+-	bits_checked += 8;
+-	if (p[7] != 0 && p[7] != 1)
+-		return (0);
+-	bits_checked += 8;
+-
+-	return (bits_checked);
++	/* RPM is now handled by the format reader
++	 * (archive_read_support_format_rpm). Return 0 so the filter never
++	 * wins automatic bidding. The filter still works when explicitly
++	 * appended via archive_read_append_filter(ARCHIVE_FILTER_RPM). */
++	return (0);
+ }
+ 
+ static const struct archive_read_filter_vtable
+-- 
+2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 3b3824e778..2eefa28532 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-append_filter-Verify-that-bidder-and-filter-match.patch \
            file://0003-Remove-bidder-name.patch \
            file://0004-Convert-RPM-reader-into-a-proper-format.patch \
+           file://0005-Disable-RPM-filter-auto-bidding.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 

