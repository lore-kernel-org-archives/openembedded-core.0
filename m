Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C078C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 07:04:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3038.1740467041114133500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 23:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41510be863=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P5iKBw003095
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 23:04:00 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44yeyqjufq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 23:04:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAV9/ApC5QQZ8pPb5BLHW95Ay9r+t1cav95oUNaxpiBFMHcHRwJjRLnrrscX1omFxWTQtv84q5EMhQ9SS2AJrUE6eNva58IkSqUr8OfX58jpya/uayIKkobIDFq0dQZgxisx6dC2z7vQUjsrTR9CMNMHLx+tbz9nAvUz/sxc4YnHBWfzAPv7KMi/cLz85maK4DttAAykQHTCfZolNQrpDVv4ZNnHiGiI2DygP6O4L9Id8AKoqg+D6WokMA0wLDPcL2/dvSPosDFKvLgI5Zybq0pU5O5WAdh2TeGS3JZv1x6GUbeF41ahc+os1P1MGQvLMQFh36NGVFYBPbuqsHA82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78ozKxRltbM7GduUgmvWqOswbtlyj+HCCskV3f8XHI4=;
 b=gBuLB8GpyI3gk15BZcc1BlNugl/CbWf7TqlkaY+/5rIPKEWFjzowjAlL+V6W10fSuaOvk2BIq7NseCB8Z4g/mJf/wqvV2wTirrXwWCterQ6jGoW2CvQg+C9N5BuW7tufmHPDtQ0Q0L6poqg+knfhnoSbLjUbKNyrTYAlTpIdY5FreqQxNjLq7IPISxCHDNLNw7EqznzsykwS6mIXFT6lLgxHJKQkrHRgtz8OGqZPcu2hfJJ5kGWjoDauCSBVkx3pU4oqKG6dnokjNhFRY5KFjUZEadUtXfJpAihmRhg7REHl4cPtaPUjiBeiCLXIy5UTGNc+J+BieeV+g6PXom1HdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 by SJ0PR11MB5135.namprd11.prod.outlook.com (2603:10b6:a03:2db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 07:03:58 +0000
Received: from IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::79e6:58f0:788d:b45]) by IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::79e6:58f0:788d:b45%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 07:03:58 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] nfs-utils: fix rpc.statd path in initscript
Date: Tue, 25 Feb 2025 15:03:41 +0800
Message-Id: <20250225070341.2349532-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To IA1PR11MB6396.namprd11.prod.outlook.com
 (2603:10b6:208:3ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6396:EE_|SJ0PR11MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e83100-1e88-40f2-31f3-08dd556a92e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JTQ4o86C+GppLOmFT+Jh0kv6iFzYbqyv2jfNA5DzhuqLZylZruVXm6F9uXCr?=
 =?us-ascii?Q?Hd3HjE32bqYNOCzG0VeBf6G5PvfOmMnvS+xFR3D23LdR3Jzv791EVdMvxsbX?=
 =?us-ascii?Q?zDGrQ1UPuFJTxifGTipUa8Xe2M9eROqn3GXFRcbrfZRywsCtCdJUZZwpkbN9?=
 =?us-ascii?Q?h96ZEAI2ArAHeBFnU8A0/bXkDIiVYLaDJ21gn1zLG0K+mlUu9Kk1SQ1hNgp2?=
 =?us-ascii?Q?OPTJ6BhHOvohGy0ECQGrFTgeeqcgvwf6Re0oYdxp1MsNJBm5xG8r4QCMLYaU?=
 =?us-ascii?Q?0A5/BZaHLCqfWjTcI6uF8GGtyirvQMfJ3B+gxZUsp9xipTz/J/93PPi8uAuC?=
 =?us-ascii?Q?IbwlNdRmgJYpQalZ/LU13osnUgDwe6y2mApBLsOghd+4LfqyzNLaW2hVuqxb?=
 =?us-ascii?Q?Ujw7lxr8CTImFJfzUcfJWGShw5yCTsfwVD8LGdUOeJszjqcdkf7673iRQYnJ?=
 =?us-ascii?Q?ONWgjm++QMkYvqMOnMyPnoLqIhF8LBuSCFE+UL3PJEwy7UkgsFph2BV97M1G?=
 =?us-ascii?Q?P62x1ZXdkj26u7HPmbKjEMSj2u+EcSHr40RU52PHy9uxDc1fmaOC+DEuqUm0?=
 =?us-ascii?Q?5F+xfi9gWUypMOZ2bTLhA58Jjw0lQOMSCV2uNQYbrINcNLMTYNtbdCF6cZb9?=
 =?us-ascii?Q?vZ4JJLEAW7mmt9qhomxP8JJhmCJwcK0fxQQDUEHXkyq5AH5fDAZYL4pDRZWj?=
 =?us-ascii?Q?yuvNkdjJ0Kw5v4ysIrbNMVyRjTMH2rEWmMHtJKWgXl79vpfp5EB7RNGQCtfY?=
 =?us-ascii?Q?Zvc9leYcfwzOGPgvNIDs9G0ljXHNux6pXiG7M9cLp1QMwnD+Cij9FaM2m92+?=
 =?us-ascii?Q?xJR3WV1GaVoaXhs+Im4TbwiCEzibmtSUM0+cFtW37UNRsUTzNgoldlZzEJlG?=
 =?us-ascii?Q?rOlLpI1ajGVlwMIwOc39cG0VxYftviD2LzTo8AmX2eXbrjiatclajS1hm3/z?=
 =?us-ascii?Q?HZmfyYlpZI9ggkqHnsAcBWMZ6AoPwmaZi2v0fNhJDnWZXsMlemXPXUFElGGu?=
 =?us-ascii?Q?P5rm1p+IvMdmkYjrXZoBiu+kZuchQTjFmKxNQ2mThKnncv0cRLHDiHowGkPf?=
 =?us-ascii?Q?k6wAa9MPHLK2HycrSmyR7a+pAMhGnimopFV9yJdA8EPS8ZXzSx5ANfOH0Oa5?=
 =?us-ascii?Q?sHou5+apB7UWsqDb6p1y1/ZDLOol6S7eG/Tckg0AVbkN6hZ/JaGYYF1FgmON?=
 =?us-ascii?Q?9shB98mV6BE5jxzPyLake3b2MsQSjIrT4r1jCWUPDf2Att+ZGFch/HFBH1jo?=
 =?us-ascii?Q?brw7RZYpj7GKAk4b1bxCXpTezutAtTSO7MlroPjgIXQYtX8JvjnTK0EU1cWe?=
 =?us-ascii?Q?O3I/NAuAzP2xUi6GBg6tpLfE47ddfiGm6FTdJoNOnd311lKzhg/Pu05DAdhS?=
 =?us-ascii?Q?/90xcCqA34ICRRHHiwAvVXxbltrn6rX+KqfB3/Hf6N1KrLJCeI18Wdyps6Xd?=
 =?us-ascii?Q?KWFDjiNr3c9Up0e2aHrHdTv7q5qP6v2Z?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6396.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KaNt51eTTkYCrAMjS0/UfkExmfPzfsHArtCwbB3fOTXMiNKB2hdPqsUrjJVZ?=
 =?us-ascii?Q?i61yIMBP5mtrF5gmh3PBai7M6ii67Bq2EBRbCq9jVvn63W++1zJcdfStLdEM?=
 =?us-ascii?Q?ACuKh3RoYJQJ4cxajGgTF3oQZ1INlXqLJkxd4CBTJOGD/mFqL4ozfkn9vNSq?=
 =?us-ascii?Q?v9KiJsbTNyzjrtgzZuzGzBT39bTAPbpPD+0KhKyBSNCUV2mywQLuEJY+gZnq?=
 =?us-ascii?Q?EWd9EyDGb2I8GaKHuOYCfSe6fjZCeAQFQOEa9yh5HpnQvqjkRUF2nr88zi0H?=
 =?us-ascii?Q?i5IUXrlrZioqS3iPX08w7Hd9Fn65d8eKGqmqFy3eRZcrLZGgbIaVQadIUjZ+?=
 =?us-ascii?Q?fL+I8A4c+GoVLdZPJvVxCs69awEMOsHp2lnW4bEaBsN3yEmC+ExNDtF0SNi0?=
 =?us-ascii?Q?0m1Tk+1Z4Eh0gIjbgXemmVIA+r32glqRRkj4fAUNdLU8DkAn2SY9N9JWp81M?=
 =?us-ascii?Q?y2zhb6TOjVAswPkwaefovb0kjFRYpgH4Kz3DXx/HezuKKmSiGi2f5DW2egrf?=
 =?us-ascii?Q?j7Yx6wdn0nJLtSX12l5PaDDf+4uZBBSr3z0+bUYwwT779cJzno7grAS2HVbF?=
 =?us-ascii?Q?nuBoZ2g8yEOEMmP68WQb/SW0EYelyPQTgQl9YQUqFFLWY2NRhZjMe1xxbvQW?=
 =?us-ascii?Q?LihNKh3r4fjI4KEF66W6pkWeslabDpli6sajCi6cahV//gJdLePAB74sUA3x?=
 =?us-ascii?Q?gIFD6chFjmZ5nfcP/306bTOxmZAcqEGuTDo11saMWjdZazrtbxgwKhqOjz83?=
 =?us-ascii?Q?KMKJaHnN3kDge3ITf4jfMNxdx7mlGPGZJbwdJwSAXyXVURltaFXUtnLbbOa2?=
 =?us-ascii?Q?YM9NNBLVmoWjRf+vqxN8FFQVf65iCV8WjjdeSZ1kcPXmJWCXMvpgeF9Vxh6P?=
 =?us-ascii?Q?QysE9AB638QzfSjpoSPpgELBzl3rdtOpYfjOmva9llHFgTYl2gmvTVXj9lDS?=
 =?us-ascii?Q?7GrEfKb28GlMEy1BiEJ/BfBi5zY1fcemSgMmDH54j1/PGVPc+1616Kuc6fD9?=
 =?us-ascii?Q?EJHGBteSwkMsyb7ysYZ4Wmv4W5g7zeYAVPuroe3S/aKhKTxBPmQpC1Smq4Iv?=
 =?us-ascii?Q?FElXbDBd/ZjDMoaDY0wjVu3LMECDKNemsqiS55ztQ7bxMkvzFzpI52E+zL+e?=
 =?us-ascii?Q?+Cbmf3PUHg0C/uVIbyCf5de/czQhvQ80GSxjXLIho0IJ+o37ACib8twdjSC/?=
 =?us-ascii?Q?wyY3JPQ0i/hn+hjVR1pVqpL7xc7+6k625Gg4LXI+Ehez955m72kSGa+3Fdff?=
 =?us-ascii?Q?DuSX53SbCKIgeJG8hzcJoeVjM8jt9o+LvTaUoxNca8SZ6TED9xel0mEzk5OV?=
 =?us-ascii?Q?IU1vISQpL4qljrnPHL4piKGhll771uLoJ4mxByZyesoDvU6B9AyrKdYoPA0g?=
 =?us-ascii?Q?gPJMtYkRNBonxy+IiyUHdB+C0g0+BsYns25XqxDSoXVPSea39BdyERjixBzg?=
 =?us-ascii?Q?cuniNw62hxori0EAfCznWFjofm+8bL5U+6MkLFvxxi6ZfC0c/4iESzLqQ2J8?=
 =?us-ascii?Q?eqRzsoD+7PWuIb95ltdJLH8zf5tSOEnv6LLODogXVqflho9QBbfwOH12Nf96?=
 =?us-ascii?Q?gDuXmcYun1O4o1/wm1tJ8Dhwpaz7sG4Q9F7BCj6k?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e83100-1e88-40f2-31f3-08dd556a92e0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 07:03:57.9692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FijRPgaxicMkBZ0rQbiyCADPn5YWEJnaZYBMkFNTWnEciTwOW1e6hqML5GR3dyTJHHU+QmSLYuQ3KvINtv9WTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5135
X-Authority-Analysis: v=2.4 cv=AbBLH2XG c=1 sm=1 tr=0 ts=67bd6b60 cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=iQ1z9Wq2T-gowZh5auEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ly2tPKHMhaNaUPE4CRoeaEASSSO6T7Ya
X-Proofpoint-GUID: ly2tPKHMhaNaUPE4CRoeaEASSSO6T7Ya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_02,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=891
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 07:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211865

The location of rpc.statd is /usr/sbin instead of /sbin.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
index 6c7b92bdb1..9b7fd17b41 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
@@ -137,7 +137,7 @@ case "$1" in
 	    fi
 	    start-stop-daemon --start --oknodo --quiet \
 		--pidfile /run/rpc.statd.pid \
-	        --exec /sbin/rpc.statd
+	        --exec /usr/sbin/rpc.statd
 	    RET=$?
 	    if [ $RET != 0 ]; then
 	        echo " failed" $RET
-- 
2.25.1


