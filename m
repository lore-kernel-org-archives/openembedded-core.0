Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78ECCCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 12:34:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13123.1758198877003230537
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 05:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UW348P7/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1356544a94=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I4pf1K2450787
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 12:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=oPqmgQJW+
	AocHUlorOlpT/qR28SLAQc2t0k3m3Yj8AE=; b=UW348P7/656GAooCxTi4oJGRB
	FQMGdYsCIqL5oFCJ0pPZLrRYu835AniNGrp0dhhRxmJeMYZB1w+pGiyrhV6f9dtY
	W/7cfVlWv8ybr5yGvSaqcmBGI78M1PEIdTirsH+0PCQeFbTLzNn5D+xuNvTg/V2U
	yU0o8KvB6XxImRxACzo8kuYy4eBf2zy+y10qS9fqEtpvN9mZbUQdXLeHc+udpj4M
	hi+roE57IlkWxCFMZygMdXz5j002qOpOIbvwi/UwyqPuDR3cXD8V9n6/TFt0bhoY
	5sgHcUJrPK8JaicFT4FkHlaaYqbyANbuVfiUAgNFg3YfyuKerCDAj7rbVK9Aw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011008.outbound.protection.outlook.com [40.107.208.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwst2t6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 12:34:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hS7B87ADK7ecE/NHvpmMdiF5lRFR7RinxTjqewA2PjM53LqJHpA8ZK+tDDvyb7J2OE4hg/Fsxz+7vyvaJdaukHonIQCAYWIQF9qD0KMRmZN1SzjR3G4M/weaJFhKJAmchyymSR7VKidAkLQhS3Xez49gXWsU2prNpuW6wAl56SAKiZ+5PQqftFjl7/N7/Q5mszocDXRvoJObKxH/EByzkvl4wjmaRGNiM2f4JKX1XLKUfZyFGTt4pDeXsvibqFVBBiSvsNbngWr9m4s+hi1dXSHf3skB3YyeW/ubaBzTegxh2DMQx7r58i4JmyrHHgfaiBdzRNZ4ITEw85U4PRcnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPqmgQJW+AocHUlorOlpT/qR28SLAQc2t0k3m3Yj8AE=;
 b=sdklIbvnzPZoXsFOfaxtP/Lgwx7CrXAnSc2ax+u2pSwEiQ1mk+5RmtWjfHFzgVRF3tP9JRpw38s1JCTVuU8eokpHKnxgEBAVSjj9iH3EMhk/S8wWYXmaGbOC7379XlYvvRRUVt8G9BqiLFqeucDti7bi46gKLYO50gColqV6kWRU6uxfoTcIT2SHus90v+QVdfAy4Refnu+a2S+YxzOPxdJyV9J4PvebSSnuWzhjQnwl6UW2qo083xQEiguJuRdHWIQJbj0K0HhJwxYchTUowFix+UBbwKgij7Z/mg6W69EI6idbwmnaehVCYLOeTmcyQu18l0o6SUV1zcUg5NM0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH8PR11MB6563.namprd11.prod.outlook.com (2603:10b6:510:1c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 18 Sep
 2025 12:34:33 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 12:34:32 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] glibc: stable 2.42 branch updates
Date: Thu, 18 Sep 2025 05:33:50 -0700
Message-ID: <20250918123350.3016822-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH8PR11MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c76269-5445-432c-fece-08ddf6afb845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eKH2yjK6IG/s9eFt93ApbgsMVeqIdWqJ3R8J0FlsAcRbbyyWWphKlGgogMjR?=
 =?us-ascii?Q?BanhMH/aaD4MaL1wKaI0sV79XveajRxnRxrOKLnvQpgV3gE9dp1Vsdf2MIzo?=
 =?us-ascii?Q?JUPIZaq2dLdJC1xH2zM4u/DCm+ZMs+Dt3yKEMKoTALVceZR+MDt997/8NQBC?=
 =?us-ascii?Q?0CKNZZ1HAOoMseOT6niludsc8wGy1PaP/zSpGMNJ1pv7v2lioUS2K9/Z3X7G?=
 =?us-ascii?Q?zNCYN/XF4Xda5Gt7Uuycl6Nnn8O76WqOAZNY3SbGgaV0rsmjdpY+Ziy5eA9g?=
 =?us-ascii?Q?i6Iz5r73OgsVYlDQ8jCuAkL/kFJJ5/Rnfq+kKPNJv3hPGFTRoBYlf69zRAgT?=
 =?us-ascii?Q?Pqki1eiodEAFzDXptHBjqAllm+8lHvrldrDo9IcaTIv4pnx2r3odDvVoh4cV?=
 =?us-ascii?Q?wRc57o/jZq/pWbvdxaDTHqgFU4jojDBsm2cH0bB9CqHrcusFpI/cxdrw3pUL?=
 =?us-ascii?Q?33Do7X7j8r/5U89Plx6rIqvTo5xaxCAsHZ160GyP/ZzgW9QhfvFrSv+WPmy3?=
 =?us-ascii?Q?M2AnXDkbNyESxe7cf8ZNCcHR16MHNuaPu+DqHHH+SSllabm3jgKbhnodvBmA?=
 =?us-ascii?Q?3FAPdsmxLjVLCC+m0jKvxyJjaizynYClxnBnjbKqzEvu6Usc5GbblB8Y299k?=
 =?us-ascii?Q?IeTlU6Lu6B7eUfke1qvSPm1Di2P6EpkIxLL/ZWac6ImnlQHl3X/APH9bzEn5?=
 =?us-ascii?Q?tnwwx+ajeIVcsU0OwGn0GR+69eFlwoHkfZUgvdzfuL1Wqp0vzJADn2Z4RMsj?=
 =?us-ascii?Q?mk1WtUKMkBU1KuQOKClY9TU9jEjGAe/X528joCdB/Bs5gUj6DfPjP3aPejo0?=
 =?us-ascii?Q?8KE7pQ8+nMPpsk4dwCwJeDSjYhaLEK7ghH47fXMgI4nm5Y808qbCbpMXsHlG?=
 =?us-ascii?Q?gk/QFl0otCWRI/3x9oQPQwHoOiB+1BcdkZvo4WKEroE83yH/qRo9X9d7YTQE?=
 =?us-ascii?Q?NG/Agxg2O2gDRSIP4LgHRUkO4jAMy20ryq6rjQygBhVhHTbP7lkj2dCz0+9e?=
 =?us-ascii?Q?LABV0bSf7wb4M+4plERni+UMvckyx6GyoboX4SnZve2sYdJfVLslN9eQM5C2?=
 =?us-ascii?Q?PenQMHOLyq8SIqhEDFBzjWE18OAogXCiZo1bIRHO3xZPRKT1cQ8wUS+ph1lZ?=
 =?us-ascii?Q?KZjwEUcRoXLxcAKF9XUaDcOivW5bnSfrWDizQLD73u9p/dT9wF2XF7gaHqFr?=
 =?us-ascii?Q?ZZ5pJrA6LfrV//ye1rEGXH22sjleWnbGg+bfubYgjBVr1Zcrby6irjWFypw9?=
 =?us-ascii?Q?Nw3g1r9ycz1cwcpD5ixRQxNANZpA9uLCMXbQ/V6x/5fzGBiYYkNanUnr6v8y?=
 =?us-ascii?Q?/QloW0UFyaWEH5T+E6LEG0zJCGzlI3l536ytUV1R4MU1Typ+2XSCiV3X0WXn?=
 =?us-ascii?Q?4mEz2OfsfOjMV4noY69U/nRzU6AA6uyOXz0jh9RdO5vAKory4D0KXPJz8gYl?=
 =?us-ascii?Q?IQa31zMfjJW2pu7RdeQsCngb6S6HY7DI01lpMbh5ScOZeEXIpkmktg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HbcCjBL3WmwAOPEFETMNJKlIaww4I22vOSI+9WifkX27CLDWB3gJsY0XDov9?=
 =?us-ascii?Q?ZZDqbxFeOPQIEfm6CVv5Zo8u01uVo3DPfchXWKC7Cm+kI4JHlRW5uG3NO2/e?=
 =?us-ascii?Q?4DcyyI63dU0K7TrOvAk4CLtAbvOf368OuU9oDspvPJxB61YnIodn+81XGwFJ?=
 =?us-ascii?Q?baiT+nzKmlBIPwHi60uNZef4PJrA/7llfHpHGWHWPgvUVJOlUIWHHgLkvReM?=
 =?us-ascii?Q?Q/3M/skeFg+OySAF3yO1oiLRjUfbC0i67UaVK1NHMEjqOK6sAuusBiTMTWc3?=
 =?us-ascii?Q?GqONRyimNsmAsoa4XP8xCbEk3RyQyUNROk6taFIxrmSqtyN8G9UCoCOKe2UB?=
 =?us-ascii?Q?a5AVXds5vHDBJH/2iEja5bfGrL/baS283rYPv7GJ9D+cFwZaiMzfJSkGKDEm?=
 =?us-ascii?Q?cYg+oIzHOwe2MzkEVqbrk72zmsGVIdeTJUmXM4kxJVp5uQT6WnMkRdd8YMvG?=
 =?us-ascii?Q?i6hLd1jRkKiI7dRwFSP8nKG0fgMex0h02w/7G6RP3HsHaBW2ecowzBVNU5nU?=
 =?us-ascii?Q?am3Jwah0O8fu6vZ1PYT62puRFljo5MrjKKsOnn2WuAKpJicUDBiJ+y9THxsC?=
 =?us-ascii?Q?SwrSPnLl0j/sCOII2dNuIwZHE07YD5cFCmMWMt/OEENzFWhnRTAUYBcb+MEV?=
 =?us-ascii?Q?+N2HLKamVo8AJBCyulnrGFKCckLoK55bOcP0eAKAFFk/nBni9KsHSckWv+wc?=
 =?us-ascii?Q?co+r47gMVcferykS49eYKqCW3aeB71+hbmqMeRBmRrLp4IcbmaF9lnBcSaHe?=
 =?us-ascii?Q?RcIzZuSq+J32FLw3yF8bXmjOLuCR6AX4vAtYLe0UeVOfwWSrL6zPd3yBqyZx?=
 =?us-ascii?Q?VMIv1rPKK24+2IbBXeqTpdxa96yXN1rWtTMJqAVmOIxGWokKOpChT/k8IJ8w?=
 =?us-ascii?Q?w/gkGY6C6s/uiN0uMebpYpW9kB3OgEUWEMceJojHldnV1M3adpECnAxfIBya?=
 =?us-ascii?Q?H7/a4d7KiL3NUwHE/hglWE9fverCbAdeBqRvuBWcU19RJHmU1CAihl1TsIdk?=
 =?us-ascii?Q?zPGR3P9Lrr0zggvytE2S9RnwB1ayIgWZ3O+D66A6+5MMeoA9UpfVd5CKf6EV?=
 =?us-ascii?Q?XiEglJweR32oiKzMDEQJKrA8qNTh1t3fha3w5MzSJhTL8w5tSg6r6IfmGEjH?=
 =?us-ascii?Q?w7neOdaDMc65qZuA1HThdC32KARrrCnnJdZkRaPz1zwKYcb8wQeWmLpFh5jR?=
 =?us-ascii?Q?puG9Y8jAAtU5/Tc75wiud0nMh+YgfiTXQsNEBMZ6CR8+5da2OA1GoBHz6mn/?=
 =?us-ascii?Q?lQofuJtm/7D+P3BNsnmWtPgMA+sluvr99oxNCosk133uLFEYoCw6j5Q/Pm5c?=
 =?us-ascii?Q?bBJp0ZWyWjA3KYzkMMHgbnyu8KGSZ5+vIh5iqevdJS2CHdY+h+a8NBtuVckb?=
 =?us-ascii?Q?lo3MFQeFBW1lkGL8uFI1M2EcBMEXzlU5HZR4QVV3J76GAg3OWYxS2NZQ+G1h?=
 =?us-ascii?Q?x5eygIAssODcU23pvcAyQOXhPl00hqaKbBYeM1rxSdCwsCfWqSBcgiilAVxu?=
 =?us-ascii?Q?EegU+AcBDFd8dbp1l8tE5oQGiZ2jTeoufTQ+3fMoh4+9/RAzp3/ythGbE+yM?=
 =?us-ascii?Q?Hs0Sdi8FM0N12aaqKNpG2LobuIj9hsi7mXEdt7pE8QRGlsAec6TgQMm8tfQl?=
 =?us-ascii?Q?JOwkqDdqGRjhQFkUh8k3Gto=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c76269-5445-432c-fece-08ddf6afb845
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 12:34:32.9241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EglEYu9mPKF1mCnYpSY3xcpxjAkr8FfPee2jAVE6CVCKGxkwVrlC1tOhTxRb3IssI9KlJWSgqw/h/66/2HmXtK5fpUVl5fsONsfWxP83V0gCtsxtFdpGbv88GDIwBh9d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6563
X-Proofpoint-GUID: HhrCJabIxXTpdoJQAHxP9lttWjeUjzuF
X-Proofpoint-ORIG-GUID: HhrCJabIxXTpdoJQAHxP9lttWjeUjzuF
X-Authority-Analysis: v=2.4 cv=C5zpyRP+ c=1 sm=1 tr=0 ts=68cbfc5b cx=c_pps
 a=1GamL6rn6SUPLdETXxLFew==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8
 a=Hsqy2Y5UlIJrBaD1AN4A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDExNyBTYWx0ZWRfX29QVn0H1SlzB
 WWJPXqOBaHfnSElworIKjrfBPOkQkpdrqGOMa4EYpu7Cd+NX4h/0G4we8e1m9Ry8qo54wAF6ogf
 BfxVkpOVlUl/CbsuMZ/0SRJAV08qQMxvkc3epdH8CWB/YJF1JkmJ16uSkduasmMFmDuD+e+vjXL
 uk+8D6VgWp+LQhLjsYqrDEVMqkAgclSCEVi9zDnhJHu/eCIbtv3VpaIhpYFX+9pGOTfq/H7iqAB
 5S16mMJP18T6wXWFJXzCIcPVF3UVG0gy2nBhk9bt5WPJdB/NrF0VOCliWcfp5p8bEqsNqol0VeH
 W++GLoL1wZ92Jq0v6uj0KJZSSeCzky1o3uqaFPxAQauYZ4QBgd/V/rmoEvhzCU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 12:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223637

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

git log --oneline d2097651cc57834dbfcaa102ddfacae0d86cfb66..e34453cd6a8c592c325756ff3c7ac0afd3975cb4

e34453cd6a (HEAD, origin/release/2.42/master) AArch64: Fix SVE powf routine [BZ #33299]
e87844ec42 i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
7a8f3c6ee4 x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
3970785beb x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
d0f72b96f2 i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
8dbaecbe92 Use TLS initial-exec model for __libc_tsd_CTYPE_* thread variables [BZ #33234]
d7274d718e malloc: Fix checking for small negative values of tcache_key
a96a82c4a5 malloc: Make sure tcache_key is odd enough
c491dabd8a malloc: Fix MAX_TCACHE_SMALL_SIZE
8a726b6304 malloc: Remove redundant NULL check
c5476b7907 hurd: support: Fix running SGID tests
e5754399b5 Revert "tst-freopen4-main.c: Call support_capture_subprocess with chroot"
c090b0cb1c tst-env-setuid: Delete LD_DEBUG_OUTPUT output
41a77b78cf tst-freopen4-main.c: Call support_capture_subprocess with chroot
9ec7a532ff tst-fopen-threaded.c: Delete temporary file
9d5bf9c17d Delete temporary files in support_subprocess
b38f3f60d5 nptl: Fix SYSCALL_CANCEL for return values larger than INT_MAX (BZ 33245)
5e298d2d93 elf: Handle ld.so with LOAD segment gaps in _dl_find_object (bug 31943)
2fadee5301 elf: Extract rtld_setup_phdr function from dl_main
fd18059c0f stdlib: resolve a double lock init issue after fork [BZ #32994]
bc13db7393 inet-fortified: fix namespace violation (bug 33227)
3ec4dd77f6 NEWS: add new section
bdea6c3719 Replace advisories directory with pointer file

Testing Results:
           Before     After   Diff
PASS         5842      5855     +13
XPASS        4         4         0
FAIL         868       859      -9
XFAIL        16        16        0
UNSUPPORTED  396       396       0

Testcases changes

testcase-name                              before           after

elf/check-dt-x86-64-plt(new)                 -               PASS
elf/check-gnu2-tls(new)                      -               PASS
elf/tst-link-map-contiguous-ldso(new)        -               PASS
elf/tst-link-map-contiguous-libc(new)        -               PASS
malloc/tst-malloc_info-malloc-hugetlb1      FAIL             PASS
nptl/tst-thread-affinity-pthread            FAIL             PASS
resolv/tst-resolv-aliases                   FAIL             PASS
stdio-common/tst-printf-format-d-llong      FAIL             PASS
stdio-common/tst-printf-format-sn-ushort    FAIL             PASS
stdio-common/tst-printf-format-vs-char      FAIL             PASS
stdio-common/tst-printf-format-vd-ullong    FAIL             PASS
string/test-strcmp                          FAIL             PASS
string/tst-cmp                              FAIL             PASS

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 3a89e153bd..a3ce970c29 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.42/master"
 PV = "2.42+git"
-SRCREV_glibc ?= "d2097651cc57834dbfcaa102ddfacae0d86cfb66"
+SRCREV_glibc ?= "e34453cd6a8c592c325756ff3c7ac0afd3975cb4"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.49.0


