Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2B0C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 10:00:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10801.1675936826313461154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 02:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=R7mI9WKz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=140437523d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3197ulSu008064
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Feb 2023 02:00:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ZIrG2Jl2C2hHgNHGn/mOZNXJ06L+TWC8sOO6fNjm0mM=;
 b=R7mI9WKzhmNTmlRWbKUKAepPoGu1eLngqLADJe5KVvBK4OvuWPkinD/X7Sq9O/4AWuPB
 JTJ+tOkYw/sbbjqZU423Xh8a/3VZ+8cf3Xz3QA2Rv028eJXN/x1QxDPBlR03W1YTbxo2
 RsA+vWbVhK3umZ678uaC250278/BKNw1+0VU2IMTSWSNZt4dWaDGGsLj4xRSIg7rf5Hv
 LWG/RCew4npGmdkQ0a3MX539f+TJbQqbUNg0+1xjXCGJbfRTLjnE/1N2zIZ3J6XclIha
 uRjDOkGMlmwmFjYO7K4eKXG7fAQ+EC7RzKd8BUdrdoVU9dGAAAUkto2weE3eiQbE/EWH TQ== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhqrrmupk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 02:00:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bl94+5uq1Ml2i8kWzp5NVs7XFHekYdLCHr25B+aL7KLkZUVzsJL6r7/tiaGVYxE2bxyYkkJopGLsPqJzdv1aqi3eAoHau2n0c/JGQO6PBzv1D0i81oguDmkyUCPqFhsCnzF9YBZf6tdxoYyORQ/kW/V/MhXuTXi6dRqg5zffUJ6NoMigLTqFSE5OXJpnkzYfeLTNZEuSH2Bc3yN87ung0Pz5Ok4CdaR/XYajtx/HmXo1c8qHRa5yNyTncbtKPS1R0Egz7Lh8EueeFqFtEVNgruTormD21ccMR8qSkiKWBtcJ6J3N2OnwclTrA43KeB7hiAbBNUQOpci/KPPV57ZDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIrG2Jl2C2hHgNHGn/mOZNXJ06L+TWC8sOO6fNjm0mM=;
 b=lxj86+ppo9/lB3aQO68JwQ2GWOY6A8tzPl++7yHFWGCiUooH4RQKHah7YMPpGaqa9CsCzoNHpr4mPff6F5qjHTurFYNfxVxHC8GrngdBKRiPQoncv9KLRaTIY7z7rqE/zCuSXGzEDkSkj0yJsK/7qtXxetJPyRCqfbwFL2RcDOsqilimJMRZ0XFBdSXvxJyxclY7VtY+IYJjfiobSCeA3nF9XPOpyxR9cgRkJ+kIMgw8CUsA8pSne9qBiTLq/n6WH2tSi2/fsqDa+0sSe0+jOxFk0i6ix+VIOXgQwRyW/wMrAzM/eiF4Hn8JOdSj2RQNs6hj8pACqfKXiiKjfDB5Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 10:00:21 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 10:00:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: unify wordsize.h between arm and aarch64
Date: Thu,  9 Feb 2023 18:00:11 +0800
Message-Id: <20230209100011.2101196-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::16) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dec38e9-98e8-4c79-c454-08db0a84744c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nbSGhAa6DGz0aBaU7c7xBPtnk2UqxkqmwH/4a8U4GbSHRcdXZZmd4GJ6JNddaOgMMwhK9Pe24adAt8lHYQl17mYy5+UaEcES0h+1uX4wgK6UC/gRZE5YTaM6LuzGt5Vy9Tan9moo1Mb0yPGVoolINh+l5iU2ZKZJvoc2OnhNnunKhCAFjsieKX4pgrUF1/Yw+hNgTVi+4e7T6z47tYFwchRE63Jzw2kEJmLYjPFeSxKMMSp6wRguOMeJyuBqYjYZATJ9MS/q+z4/4HUPBimEsFifOGGHnVLNaTWifZzcTP/p3AamslIk5BAvjYDFOutV+R/PDc+XhG8ViQUgnBfeIdmsFWy2NmAm4am1aNd3GyDDjZ3EgURzx1/azjU/+/8LnU79loh4o12aMwzYHkgnRzgP6db/7PgodF5EU16lxS+8DOuFW78qsJnb6VYluRSSMduvAMNeCfc4Vvrqz3pHmLQKHPtBALV3bqmvmvkXx9GrxjvJp9r6ff6v+R0+J3DtFs6qaLzFL/cU9bWUHEa9hd/q240rtTtl6Cbm86eLzrCaKNfB5ks9FH3QSIE3tYVURG8ZH+djMCvxYeHffTQ54wfsVxIZdonIwLn5618mtJHScZDr9r1ySM34HbyymXk6nNSSDU0Lj2Euh4v1wbIO+edM0UiU7Hae7sIcSu5dRmCWnQFLm72pkMXKKfBSwcA8wvK95TasEzfBKQXPIljhKpEWwLUit0ukBnuh19DJ84qp6bpAI6vcsHvofW7OjjjJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(366004)(346002)(39850400004)(451199018)(316002)(38100700002)(38350700002)(36756003)(2906002)(86362001)(8676002)(6916009)(83380400001)(66476007)(66946007)(66556008)(41300700001)(8936002)(44832011)(6666004)(52116002)(478600001)(2616005)(6486002)(5660300002)(26005)(6512007)(186003)(6506007)(1076003)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XgJo0rjRJzADvNfy0l/Jauea/tEwHdsQTW8jso8bLoEnRdyYM7hCvTP9VObk?=
 =?us-ascii?Q?t2bKyBGZnHLj3YrcgJEe/b1/BhZe6Air4a6i85LfgqvGYZ9SplMzJB8fppl+?=
 =?us-ascii?Q?a9DB91I2AcOeFsMd7Xlb3QgwY0eMpfJYWrgYA+qp4ou/CmE3nhn4BfI8uIx1?=
 =?us-ascii?Q?L6ztH2sxjbl+XDTq+gS/hfY512TvvQ1Ie5NdVDqJADqr0dFtd1fhSb1LS0Cp?=
 =?us-ascii?Q?31rBdYGdVE8oP4cvaK1494ssLUCKucENE29jpRqS7sWE4ltjt23Pcqr3+WAq?=
 =?us-ascii?Q?VH7eM+UY7yszGsw0uPfnSjIwzIgkfVObsshMQ0AePQOcf12ShoViQxfBvlPi?=
 =?us-ascii?Q?If6QDKnG4uf/v3qezjeWjWeVInzb5j5e1YUVung3MBmPfTmWFUFt2N5K/xcX?=
 =?us-ascii?Q?LKgUHIMtVrdUhiqKJDh+1B69xYx5iDeyvEntCHi9/+HX6mKaWwFVsn2dTvvw?=
 =?us-ascii?Q?z3R9KBkae8oS1YdaVz0udFDRn8oN97Kok+IGVhepAxdRBgcuxH/ByKvD46Sw?=
 =?us-ascii?Q?IE5FW3KGnT9qlJlYP0raqrCyFE1eSlt+dABmmtvAQHisTq8Sncnz4IurI1lj?=
 =?us-ascii?Q?Q+rIn8+d6kZ8kYhC11bnAckTs1YR+cQBWl/y1i7ZRL/xF2cxDZcXWuY5SMxT?=
 =?us-ascii?Q?+dt96++ZjAr1mpIPZWbHFLGj1DapZeBUmtXDYKVkzyftTvFn0jo/XsJuyj0i?=
 =?us-ascii?Q?CxR+Dcz3OQ/KC9MlFg7X6imB7zT9QLb7KBq3Nr2SaqDjhleZ91rkFytj035c?=
 =?us-ascii?Q?hypiCUP6Ak7vtU7ev8m3tQVpIF8erngBuYAlXs/SwhCdMLvYZNdyZ1p1Ke6Z?=
 =?us-ascii?Q?fuuOZU2rejEPpk+zhvtAEvTFxCtZ2qm538IC1QAIoZfCOFK/KBhchXiCcBVx?=
 =?us-ascii?Q?ul9JiKFR0/K82VJ3T+dRGa3Gtdn31j6gVpkUet/aCLyFQBEBazil8Xhohv2p?=
 =?us-ascii?Q?jerFr4MT/Qi/k9YPLZTXIX6IlvTbUfq9xPOKczCNmcp430ZsJX5vdUjeR2l8?=
 =?us-ascii?Q?/7rlz5voZgBWmmon/PCOiMSFEYS1/R5R/a/+zY6f4XYrdhGaUg1BU2C2dSZn?=
 =?us-ascii?Q?aTnCNT1PUGfFu6huN50cYDfLfYEkhvyXZJUrNiq8H5uHv7U14d4fUnrJZlH2?=
 =?us-ascii?Q?Et7k2q9zUM/fxFMckjJbADlpaEW8ny2RCfV79fhxuJotplLKyZxO1gAatQjW?=
 =?us-ascii?Q?iY8zuNGQJeoXiylbfYGt8Ma28oO9CcwxjZA9E0z1ojrCtt2ryf57Xp9QqIgh?=
 =?us-ascii?Q?LtaE66eTqOGFxHh7S1JhBBoZgjlaqroUUr2VHFTccgh54v91oBYEuF8kEHgk?=
 =?us-ascii?Q?eC70bmtjb76TqW8pf+C9oLcZD/zwJxcmEG2J/sGqnweo38cks1o4sdTzXe0W?=
 =?us-ascii?Q?TNazS/v43x5MHhXVQr7hy+2pc8n4V6hduqLj25pBbOZ7v/n1qzrg+qg+nFMq?=
 =?us-ascii?Q?yKTS1ACyvCs/FmU88Jvu/46kUfaWwSw6vyG5OZnFTuTTZbp/EGowUAay1txB?=
 =?us-ascii?Q?uXz/qd7AWEhaRkkO4SmrXHlNU4vs6femMhJmikR3BvOypCaErzcGYNB77f8x?=
 =?us-ascii?Q?h4uVTgdauf5Wht+LnDvrZyVNU4eblWPNwFJPY7RwZBelcjGEz/7W45U+VjEO?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dec38e9-98e8-4c79-c454-08db0a84744c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:00:20.8861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ay9v93GtkP/BOerfcAfL4mV/SCgO87Usjl9Rsl7fEAp6BVpQg5f3FW8iLk+4AaEW7EPfSW6/rMjxE9dBdkf7fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
X-Proofpoint-GUID: 8qLTB3VcPt_9Zt-6v_qvicEb3mssDPUZ
X-Proofpoint-ORIG-GUID: 8qLTB3VcPt_9Zt-6v_qvicEb3mssDPUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_07,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 mlxlogscore=666 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 10:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176937

There is a redundant change in
0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch that
causes wordsize.h to be different in arm and aarch64. This causes the
build error when enable multilib:

Error: Transaction test error:
  file /usr/include/bits/wordsize.h conflicts between attempted installs of lib32-libc6-dev-2.37-r0.armv7vet2hf_vfp and libc6-dev-2.37-r0.cortexa57

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...y-the-header-between-arm-and-aarch64.patch | 20 ++++++-------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 9ed89c93da..90a6cc2363 100644
--- a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -11,10 +11,10 @@ Upstream-Status: Inappropriate [ OE-Specific ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/aarch64/bits/wordsize.h          |  8 ++++++--
- sysdeps/{aarch64 => arm}/bits/wordsize.h | 10 +++++++---
- 2 files changed, 13 insertions(+), 5 deletions(-)
- copy sysdeps/{aarch64 => arm}/bits/wordsize.h (80%)
+ sysdeps/aarch64/bits/wordsize.h          | 8 ++++++--
+ sysdeps/{aarch64 => arm}/bits/wordsize.h | 8 ++++++--
+ 2 files changed, 12 insertions(+), 4 deletions(-)
+ copy sysdeps/{aarch64 => arm}/bits/wordsize.h (85%)
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
 index 04d4be9519..63876a7830 100644
@@ -40,20 +40,12 @@ index 04d4be9519..63876a7830 100644
  
  #define __WORDSIZE_TIME64_COMPAT32	0
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
-similarity index 80%
+similarity index 85%
 copy from sysdeps/aarch64/bits/wordsize.h
 copy to sysdeps/arm/bits/wordsize.h
-index 04d4be9519..5ef0ed21f3 100644
+index 04d4be9519..63876a7830 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/arm/bits/wordsize.h
-@@ -1,6 +1,6 @@
- /* Determine the wordsize from the preprocessor defines.
- 
--   Copyright (C) 2016-2023 Free Software Foundation, Inc.
-+   Copyright (C) 2016-2022 Free Software Foundation, Inc.
-    This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
 @@ -17,12 +17,16 @@
     License along with the GNU C Library; if not, see
     <https://www.gnu.org/licenses/>.  */
-- 
2.25.1


