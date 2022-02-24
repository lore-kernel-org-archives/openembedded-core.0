Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBBEC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 07:41:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.7541.1645688480555970972
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 23:41:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VwVShwQd;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9054982802=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21O7We0m014214
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 23:41:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=EoLRDcGOcuuOFZyoW0D/vgsv9TI605TQLZUTvBCH2co=;
 b=VwVShwQdavqE5Io2djdzSl9Ew7fx9BBB+GXrPAn9JXs28mv85KHtXYWbNftsUAZ6aSP0
 xJMCu8skh4DctMnYl6cVysJ5DyQbKXjfzXhz5gEBhvy30aHe4dMifU2DLVB/Dnlsms/m
 OuXTsmUAmDd2GpLTS8bWgjksUa06LC4p3Dda/Q3OaGvYub557MLUtNiznfGFJD3W7J1z
 /x5Hsj42jZydMKZG2AdmdeZnF4WozoR5rr8dfBMZX1LA0iF/DkL7m2V84EmTkVc83wXd
 wE2/YhFtppPY+TepXtMoIsFlFsbyKOeZopgJWdC9mdKSNHzxAYrnFEpxYvzTdw7xZbTf vQ==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ecj2kteu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 23:41:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3LXl58oNRq8l9sRjakDglKP+zV8kjmE7UTZpMuSikYiuDGS6M8OZBOev7ePSpKCAwKmvnIMzof+03bYN9SfDQneVNOh37TFnwy8x3CQoxPaqQB9udUDc8YRC/5Jm5OMqURC/7X1U6gvO6uzldYhk64dcJBwBiZw3j5XPwelHbRNDX2Pw8RXvRRWi6Q+6GtxD9x9amN7fhTx0DXXwSH2kui86DJOMG+Ez6vxotLhkn1uZyxu1AZ63SlICm54dXArtajryxa5krX8yxvzcKkvxvChxXdUgmiPEE9o8YueKjwiKSqUdqNTJyxk46WzGokgF0DCkvg0zCW9IcE+bIKlRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoLRDcGOcuuOFZyoW0D/vgsv9TI605TQLZUTvBCH2co=;
 b=aD/umpJuhi8YfO++JUdReFbRUMAuHhawwVnWyn8m/KLYwYLNLshodgxIJ+aX3HoCQjeqyHVwBzNVLDfzM0MNiLgeMAj2PQ7cwdLaTEqYz5dV+qJ1fbaJInxbEMg9zxhNp2wTBCnjI0zWzORD5LKkluCJS3bQLywMqHRZD3G/zaLLWQZYJ9wCwyHNIqx6fyaxw7ipbauM+DqCN//5PQFDuH2onOxFnq7LOov/cxM9W1E9Zt4mD1cpiXA0BtnKMCrIWotW2j7rlG9JrAjI7a7V+QTuHJQwq+7m7qBD7EMImFDlhsLfFc84ReIGueOqsGSSycpFcVzhyqD7kK+vlKHPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BN6PR1101MB2321.namprd11.prod.outlook.com (2603:10b6:404:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 07:41:17 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::7dee:4199:b4c8:c79a]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::7dee:4199:b4c8:c79a%4]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 07:41:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] glibc: unify wordsize.h between arm and aarch64
Date: Thu, 24 Feb 2022 15:41:06 +0800
Message-Id: <20220224074107.867356-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bfbecac-77bf-4f98-6a5f-08d9f7690a89
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2321:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR1101MB23216BF161953B40D14D4BB4F93D9@BN6PR1101MB2321.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HpgzWfn8MF179te8WIHq+X/o/a5YPHSLuBEzyARYgb5xP5mpsd68AQKt1RYwPVxHIFPOpdrhIvmJxqjat0KZKzM4af9qy19hKEtHiurK1jXAMy0YhzQfMwQG9HXHPAzDhPcQNoqPY5BKYh2ll3ch+KUc7IjrZ0nWVEmuDm2QvtKfro/YFXl2XBHWxTxsPjn00P5+AXKZSvxuHyjdsh4zXQ9Sk65t7eRl8ST3fRtLrGCt5py5b+DOYtNN0EOVyKjP217zHDi37RP1+kj6YpyvbCLGR3Vjk3bgasIZeEE84gAsZdp3j+oTj5ry3RdobaHCVKw7gEsqBREpMnei5dAtdMj3vHpVe9O5QxsWtseDgtj/JjvJ7OyX8MaM9RsZ4wTvJYxRbnffEq98CUEgo4jp0eyNfEtPf7A6xEcriFF3ekpa8rONKqHIeh4D99nbqIq3RvTiPUcetA9gOaLz4SGsQRlvW13isg9yfdjaKQ/Fjc1TX7ZIPHnzuLhmx/Ii/WBY8QD0BEIFxGPnRgwY+TKDJv0oySLjC2H7Ews+APh3mbEk6RzP/V9BPKL742uVKYM+24Qo6YaTzJNJh86Th7VbYCngLJ8naj0/tjITHv8ko/I35vTsay51u9A7ygRNwiBlv8EEuPA6+b+7y5RKgDODQ1uzIZb+o8nZ9CAiD8KEpKja7iBceEiznex5xOR/UdVPXONWbNr54nzQ6RRdNcA2AkM1C+2gTf4A8g4KwPwfAuuAPWnkcQwwlJRL/2DleT9SBDuDEOAmcLB2y5V/O9kltE7+lyjP3xDCTIS5hne6OOGLaNxE1HXnqgj+2OO7oY//
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(52116002)(6512007)(66946007)(66556008)(66476007)(36756003)(86362001)(5660300002)(8936002)(44832011)(1076003)(38100700002)(508600001)(26005)(6486002)(83380400001)(2616005)(8676002)(186003)(316002)(6666004)(2906002)(6916009)(38350700002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qPDDMay3kLdw7zzfsFDDmlbvDCkYqE/eG2TFkS6ecWSpv2IvIGF0GUYkIHI3?=
 =?us-ascii?Q?ZXy2zQqrldyb4cteivLIdmlWXMrFOn8Q4Qzc7nc4IqAG8YNdlgnjzJ64OsM0?=
 =?us-ascii?Q?um8wcW87P8fwSg2K8gkRynOij7no8GgKN5qyjiLD3vq9y1W+Kdl2zdja2pjx?=
 =?us-ascii?Q?JctTKcSWxYKVAin52OiyhHO5XqqMnR/17FNVHTYuqVLD/APgW74X/vSt3wl1?=
 =?us-ascii?Q?G+EHDcJ2vJzPhJXS7M/6m6/cXVzKZDwSqDDtwIa/ohc61XcMj1AqCM2eMI/i?=
 =?us-ascii?Q?3BiL3p43Fya26L/rIm6kkfWD44IcWonwvYZ1Y45m5J0VsR+EGDdZQ+JOJ3/o?=
 =?us-ascii?Q?GQoPsU895595ri4pto0Z7izIOHWHI6r9d6t/AAmubv3yzm5cWi42HnjgI0OI?=
 =?us-ascii?Q?5d0AAdTPzIXFeIzNFG5LXwzJ4Fz4niftWpgldilVd7oDGQ7aJkpBrYR+PIKp?=
 =?us-ascii?Q?OFi8DKM0qJYRnInT3UUg1PekbUC42jT8iqtzsjvhcxYUiZhfeyHDEUwwGZS9?=
 =?us-ascii?Q?ppC/DWOKq82rLV7hNgyRRzaSicXhx/Ew2/XP0uBnPTpAZ8uLsnk+qIaXfQnp?=
 =?us-ascii?Q?uxtP4mIGRVMRJbewbakZjn4JznUc7EcpzoQYTkvoLyOXuh29SFwTEddAawz/?=
 =?us-ascii?Q?qaH/70ZRGtfjrSbBJR4O0A9iWB7nXU5VzkdOWQMDgf0e1RCQbcGByt2r1eSf?=
 =?us-ascii?Q?2cgSxkeA4KV8RLX0W1Rl4EeprU3/4emiU5Kr9Y3sR0XxAQXrZb26DptNm1KQ?=
 =?us-ascii?Q?1XeDgoJvbIdiBhcZgBHBthzzXGatvZPxIRRoSNjqrFeycHZT7Gi2C1ju5KlG?=
 =?us-ascii?Q?a9n2fU2YBaX0S4x5pbV8saMwhCk3KES0NreQyNswkzSghI5QR6W3FNtBtSPi?=
 =?us-ascii?Q?2drz89hXLM09Qz8QKNwyODmEmWDhB1aXck6Pw2N9+VGtAHrqe5KLAAUAEwUh?=
 =?us-ascii?Q?H/PGqvcw7j6o1qKOubEcduf1xgb6XLrRN/8na6bR41dPliuRwidlkhVaXPCK?=
 =?us-ascii?Q?KOC5XP5BWkwPpur1qvPH3p87W7W8f7V9cLKg3k+m5RqHe2KgqAHx9lLBN7Jb?=
 =?us-ascii?Q?koBgCq0LX+sFNC3yl5aE4Eb2wBnqrs8WgmpT1EcKI6AiVG6wEW44tZlM73SG?=
 =?us-ascii?Q?5dG6UQlOVigOfgKF/w5KuFWaX5n21/fEg6p4QBodiS/FzbPWBJlEHXdjGtFd?=
 =?us-ascii?Q?EnYpBp8zDvK4cdLmwXleJ+Iq5g92aji9JbQvt6fPqspbaAXX0CiihitCcd/0?=
 =?us-ascii?Q?NK1jBxXK00ic2NWI1pSRtw5zFNtys6fdVzvZykHcfoXbs5oj6u0ZB0AT0uJQ?=
 =?us-ascii?Q?NGzUlIwcEEJ3FI2a0CZ3u4EVTn52cQFbIhKMZgBZqiPXpsj6ViusGsEin3/A?=
 =?us-ascii?Q?yDSoqRS7aoFTkDAt/eLhIrbiUYkVFHfWGNz46JHoggX3l9ym2j98rdUAK399?=
 =?us-ascii?Q?Hh4JIASp1Cw6xRl9j5kJz8XWro2OYlss5O7znLIWK0M2XUR5AnAOl5/12lAs?=
 =?us-ascii?Q?W/PEvdbVUqlaCPHjh8INPgH4DXfOgzVDkKEOaBlS7mO9yEM16c/xzgevpmxT?=
 =?us-ascii?Q?h8ICDx+G0Na7mi2lwNzbgZDwJ73TCep9dPMcME9/Hyr2WHBwMS+oCJqO/G62?=
 =?us-ascii?Q?fcWpBk92QrueUphzRqTkeaQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0bfbecac-77bf-4f98-6a5f-08d9f7690a89
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 07:41:17.3164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GnBsxL1geqtJBdz5spjVI5YFHD5g0r7v0HweHADyy61SvhSOYPwA0TtboWSNzz0ZMzYinetEtwgMWgRCHQHw5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2321
X-Proofpoint-GUID: MucMReKUPXwr1aEIfUtAmDMGzp4dAgT5
X-Proofpoint-ORIG-GUID: MucMReKUPXwr1aEIfUtAmDMGzp4dAgT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_09,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=523 malwarescore=0
 clxscore=1011 mlxscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 07:41:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162303

Make sure this header file is same in arm and aarch64.

Fix the conflict error when enable multilib:
Error: Transaction test error:
  file /usr/include/bits/wordsize.h conflicts between attempted installs of lib32-libc6-dev-2.35-r0.armv7vet2hf_vfp and libc6-dev-2.35-r0.cortexa57

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...dsize.h-Unify-the-header-between-arm-and-aarch64.patch | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 63f7749ecb..3b2d638b5f 100644
--- a/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -46,14 +46,6 @@ copy to sysdeps/arm/bits/wordsize.h
 index 4635431f0e..34fcdef1f1 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/arm/bits/wordsize.h
-@@ -1,6 +1,6 @@
- /* Determine the wordsize from the preprocessor defines.
- 
--   Copyright (C) 2016-2022 Free Software Foundation, Inc.
-+   Copyright (C) 2016-2020 Free Software Foundation, Inc.
-    This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
 @@ -17,12 +17,16 @@
     License along with the GNU C Library; if not, see
     <https://www.gnu.org/licenses/>.  */
-- 
2.25.1


