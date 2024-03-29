Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30259CD11DD
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 14:55:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.434.1711724129051422152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 07:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Dum8zDMJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48184ae47e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42TDeei0009184
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 07:55:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=0oAWmOZeyc+awFkhjJ
	xK5mG44kFNObe5jzYYP3CGz4M=; b=Dum8zDMJPQE+HALFdaiXyLUTpT2ViWPALe
	IBatU2mVhpK1ZGfKpGxMM5oR9CZsRrGj0Aelcj1pmRPrc82CE8zE/Nlu7JY5FT1S
	9qaTAoqdNhDR9ajx6Goz/R0BD+akcSft+O14wSd+kfG5T3yItDUhgIO2+vd0PshR
	M3kPlL8mmmhQrrdXcJgeRDFbr/InCjToyzPXAnr3VMM7tVbsPi5qsBHG3KD8shmh
	5djRmcHLPSxkBH9j6Q/gWhJkvWiNK2l50iglJepZk06SRkCnSRwd7SY55VPXhx2a
	P6m5xrW/MTcnTXfwlYfpeTSEy7kTMizKT19bMwZ+hWrMU3e/R7fg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1xkgyxj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 07:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izC+66vp2CsMvuC8j1C9UWcndgDoBvv6ODcmmumeO2yAJfq1wZ7nqPmBKK5LUfwN8omEUV9BQ78DFnXrlTtiaaUT0j/rb/u+vDRP75XviB1LJeiLiNIKld3rtjvG5gK/VcgIXdeooAA1nASepnCvDvv66oBdvG+YFLRfpIFNEywMILth5brIOjrShmVpcyooglUQLTveuxBmOhnyO0Un9CjUPBTADly2tj/mXdZPhPqZNNV3kYl2Gq8LrJJ+1kPKOVoRuZ3pVvg/cvr3izzmXDbVR14d+bE6NBFV3X4Eit6zeWOp5E1lThBFRi2cC/lbwV7HfLTpuP3RtywBwWVtUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oAWmOZeyc+awFkhjJxK5mG44kFNObe5jzYYP3CGz4M=;
 b=Pj0UXa9Xw4norQ8lGYYD/Ix5Bfx65OwkcH3p5h3He26AhkVTI2b/rUiG7BDWky/v5B+qNPFd1WOSilvR+ZqanLxw7A7c/0CvtWxsq198ULrAtzuRGdJc6dvl304oga+Mgf9BcWfqKkwoAQAkxz1Jw0wNqJvmQlketUGI3saYMdmop/mniKc7xtJoc7Z+yQwUaub2diRuWzKlQihG1gYd/7ErwcwingAvMAaTChiD8FmQJ17gAdpVnK4D8PqMfUhxDzfohC2T/L2rCigYOyOiRcYu4apO9n0ZucJeU0XCyromg4znB9wOh+QO9UsSNGIoTi8NQlaqozZS5Nlfm75hmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL3PR11MB6385.namprd11.prod.outlook.com (2603:10b6:208:3b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 29 Mar
 2024 14:55:26 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7409.039; Fri, 29 Mar 2024
 14:55:26 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 1/3] binutils-cross-canadian: add gprofng package as runtime dependency
Date: Fri, 29 Mar 2024 07:55:05 -0700
Message-ID: <20240329145507.415122-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::25) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL3PR11MB6385:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N5ZlhRU7ONicBcLJrg7YrXHRNi7MJzcrJj9sdZOqBKmFPzRICvySJbrnKxAsvRq/V5zHvuK7i3p7jWLabktkCOZ+MB+JP7nxalr7cJiNuQvXQ8Huv5m/BUop8S3P8cIScdqNd0FfMcI9mU4HtO8A3MOuPBTH7iC7y/mnwhSY+hEDnwjUY3/2x7e/RRevyfcyMIS/YbkTxy4ncWUUy9dLlKwOHI5n3On4td35BMaHk1259Hd/QNTLAH4vDAb7Hfy9jJCK13gcStGInZfloCofNRz9bkCKbwDDdrz4F6W3tkHUaCzesm+K95SY7qRx+UGVnRS0LcTh23x2M6x3F2WZhLxf4FFplwESjHIvGOMhKnfWSDVyFT2ERmJJespaSojxiGnNhsdphnlOJrtP4Xp1EvOozjyK+ntPkMnbxfsmqpUfuNovPVFMYHhCKj8NFyfnCnUgkzySLUmeMHYDiCCnY2UQhVAUfoornzoN/F3YQWRPeikk0imMkd5OztmBkTWHMngVzhXgVMyqRGkRK2E8y1u27SLjJ12BsaoqFe8gqLRq3oJVZbvjgg+VuAa2DA7FK1GHy3ohF9oeqBw48w86O3AdU1ZTb5LF2rKhIZTPFd+kXMg5dbMp+UFMwuKaZVP9+lcye75pcF8/3fg8Inbe883dZrMmfQThcMbwg+95/NuGAxUBU19xuqUDmB8kqmH3gQMAcCZ1B9SCzsV3sSBM6vro5zc1BUzeYieFKiWJTW8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C/fA766m5ly6s0mxlrojMNz2l/tMjf5fKfoOTJ0oaXd1zJtfCKfFu0b+0/dx?=
 =?us-ascii?Q?bQ2YhZPtWc1ch6zREWi5pmitZfbsCuO0shaOnoS+UCWGV6W4ZQMAmQwsvaUM?=
 =?us-ascii?Q?1gD/HxNoaCXTN0qGThSoZnMb2CtRqpuhbp1vppesa2MTbCfqKkoFPXfF7h2y?=
 =?us-ascii?Q?jRbunbW5Yh0tFJf5a3abfehocqfZX15dxJHUl10SaGPzv9MKCQS3SLqlOT2h?=
 =?us-ascii?Q?RpwxJ67bCqWBG61FbG8F771W5EKULIykWuQAnxoNjgXp5K8xwl7jqCm3bBuQ?=
 =?us-ascii?Q?jaKk5RdrVqlk/0h8Ao1xG4uYxdTA5XNlj/cFwabCryDhvHm1gAqlcrSA5kqc?=
 =?us-ascii?Q?7JEUiebA2FMxj4B7ByiVviRKjmDt0SYYhbJtf3wtLMVPgw68H+C9Y0no0qsT?=
 =?us-ascii?Q?p4laUQyCjdZK7cqFyZPjHr9+L/pxTACm1VoA9GwX0bcJqqtUa8R+BfwI6Vej?=
 =?us-ascii?Q?uMz8eYkf2Z1D4wRuld5fsIrrORm7vUWdC3r5dMm2z4D14/s2wfcuhQ/hkA/V?=
 =?us-ascii?Q?kzPsaCPbg9yw0yusH3XH49JwvvC9O6ztUMNGBqaYX+fOLZhkS+2vVPL2hNAq?=
 =?us-ascii?Q?+BFpm1X0UUxNGd/Axng4AjWddet9Z4GCJjBaZ+G3T2VVCGnASciTnJMK8GVs?=
 =?us-ascii?Q?PkgPvbCxaYJrBEkGC3TRyzuZiIE3+FuVw6LoD0RypXZcZ2MUc6q7IpUC95Bv?=
 =?us-ascii?Q?rtMWHnORquxNA5YnJicQ4SiqlxEGjXPZPjK2jdvft/XOixWb4QtGhINPJwuq?=
 =?us-ascii?Q?xmhSVefsHe8qTNrjA6K5P3s8vqb7vB/TTsmzrd2Mit8/y6R0SW1U2+X+ZaJx?=
 =?us-ascii?Q?jHgW5DF2c2x9gAjJsAFmqNdhhttUSyBlNuy2kn09te8T4qPKXFVz/IZwDS9k?=
 =?us-ascii?Q?b7e1pBW0dProATJJp5ZcWsUBgghhylMoLj38XZ3lvisyvYW1EPsPS0osvvtV?=
 =?us-ascii?Q?5Tsn0tWopfrLusfH1qRZQA15fjOtuRHFBMRYitmFtS9HksHFFF4Qjzysi0Qk?=
 =?us-ascii?Q?mAh6tK7+6NP1M16q/npXDeJBO487GZxjhINzVQxwpEGcmaBxaMUcuiwIdlsR?=
 =?us-ascii?Q?AKupajR7G5rd8lVqdowQJbC4TWsULqXFBKVruHb9vvIWZlnE7IkpAo9/yYzB?=
 =?us-ascii?Q?oEszf8sYbFoa4jmwl6lcelPV5g8rpiwIK4EYZVyHrkslD6wXhwfy9ypL0370?=
 =?us-ascii?Q?ZX+afMh34KGzrwW0JdU/QkynW28NZvOAmr6//mXcREgRdKAwfnF38hJZPaqT?=
 =?us-ascii?Q?ifjcCICFRkzCJeV/6l7DWHwVgUf1rYGzXMDS+lE4FuVrCmZ8lTjweH6nAGwW?=
 =?us-ascii?Q?WvKKPIediAkr6TOGjnUjfFNs6MuNn4YV0oMhN0F7wTTh3BuVd+hCi9pff0uC?=
 =?us-ascii?Q?JospRQSruG2mfhEQVEv4WcqCS6HubIJhoiCZet77p0cOP4e7Y6CmqTLGi07y?=
 =?us-ascii?Q?5rujFjk+MRZoJHvkK2JGHygVarGMSHG9oPkdnTv6xNgmqu5tvGwYSrJz5AL4?=
 =?us-ascii?Q?V+pJ6Nat4lQ7U6thQyqVxzyUtYX4Z/qkJU3kwZH7arZeeVqs1vc5J2i5Oaq6?=
 =?us-ascii?Q?dwtqTM3QmqRxjTiUfcFfVhlosZGL3iCgMuK1u6QuQk8bI/OQ2gPxj8v1fcVr?=
 =?us-ascii?Q?8A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09515c3-9af1-4ef3-d92f-08dc50004472
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 14:55:25.9844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iC+NKMPm0RpfO98ThxJy+iWUCpP+exl/nAUTmPcu1TJIJ+ComfqnyGDZRuVBBnvN4cxmr6TtxeLtTk7bk3vR3SIqpUvwaoYcePiGgYhCJww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6385
X-Proofpoint-ORIG-GUID: sbPkCihYWsJUg7i0AcrQIc59FzaNlB_r
X-Proofpoint-GUID: sbPkCihYWsJUg7i0AcrQIc59FzaNlB_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=965 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 14:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197632

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In SDK, while running "x86_64-poky-linux-gp-collect-app ./exe" fails to create 'test.1.er' due to missing gprofng configure file in sysconfdir and aborting with below error while generating the profiling data.
- configuration error: can not find libgp-collector.so. run aborted

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 62ebb3f5bc..7f2699089e 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -30,3 +30,4 @@ do_install () {
 }
 
 BBCLASSEXTEND = ""
+RDEPENDS:${PN} = "nativesdk-gprofng"
-- 
2.43.0


