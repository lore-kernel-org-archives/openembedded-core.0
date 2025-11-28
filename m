Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986E0CFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:16:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10229.1764310571390521296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:16:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TO9eJI4u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3427347a84=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS4oo1C1913412
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:16:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=uHrBXTXgbbCJ0LsfDkei
	GjtxWdfq1vKX5NWlaVNhGN4=; b=TO9eJI4uqBBO3aOAdmECm+LJofVhy0XbUqqo
	Z17m2xD5rWCWq9Ektfax3OAv3hObr8SKBad520iYERqpdUwBGw0QvTIXwMwEB+sB
	nD7hOsLwQhjcbFMrZ9QnEF7cJv7LBPO5zRwp9ngwjc1kyZuICCf0DxOYRUJeWjep
	99v+NUqXhFCKGG9a98Gr0c5CAuM3llu3/qqjksP/bEKJrp7hBxRiGs+LQzwJasGf
	LYH0SJNMgV869qs80C+FO4Seli5UwKJ6ghBbW88rrhY1InCa8EKySk0cmwXhIu2J
	OvMEJp0u2lmFZhaocJziIQsUkfzOIvvAYTtKDH2B8+otDbhSGg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4akdjje8jp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wksBVmg1oP0UFlBA3qNEwZUP9dp5ZpeIOHGrBJJcFWrUNIVoWKjPA31m5FTzODSN+b3syueQd9mX2WXZ9Zf41Du4vbJ7FXcv30klGTKCKRn3QJrNlGObkpUhLHdqDeW7eTrw4ZarCs1CIRpfogfqcz0E78PEwHybW5GiDf2Qs1dA6ogzJPZN3CLZ0ITI8vWkPBiPv6Wkcy3s5tOqErNKK/YbgH+tWJql0G2W3u+6MhOzg6sjyez1A4m1oBi8yYXJtXA/SIHsU8uWPzgvM3dlv4YqseUx9iKAAmAR/x1zr9c8mo0RzC+TuDVpovZkzIV42umHH3EPR9/ryJsAaGTMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHrBXTXgbbCJ0LsfDkeiGjtxWdfq1vKX5NWlaVNhGN4=;
 b=Dfr4r/eZI2W+rLh+IIhzvtM1YMzxNwAbVmw5fr2xYPmB3bgZtHkXmeh22zdjNyqzUNWXYdTOaSjP5VnqUcrZQvDhqpc175lRk8TWOFIGX+N6a8owltW/tgUo7lqbqKcoz4KRKCvsCY5hrfLxf4bLVlgBBJP7UO/4DAoWYV9E+5E3HtlJBl7kp1XlFRYfeVq/qAvDP9JDF0Au12LI/NgdfiRQwGbFnPTQHm+AgNgUZrmw19AzdtGLpwN4v9zQzATvUDL2mC+eAgRmS27q+3flQAX4mSTzXXfHykMT32oel5mVaIlUgr3pFtk65MDOF78fAaAEntNkxvrY+zF/gqG//w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 06:16:08 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%7]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 06:16:08 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][RESEND][PATCH] package_manager/oe-pkgdata-util: fix complementary package installation
Date: Fri, 28 Nov 2025 14:15:21 +0800
Message-Id: <20251128061521.3934350-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0171.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::27) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS0PR11MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8152d6-c3c9-472f-f446-08de2e459151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xRIQz58MlHyOomgXx2DLM2DNnOsnMX/CCopLrqoG74aqTq87e5/9Hz0oYtv6?=
 =?us-ascii?Q?9X9kj75FAiM1lH5G03mPtpd2aC0Byp4F6x0b0mGcSx4QBs7rmCDY4Wp0xHxl?=
 =?us-ascii?Q?diI2eFS33tMq01Oje6Dd+1PfLro6yTrv384eBjBHrVik6x75R7IhwXJwJPWZ?=
 =?us-ascii?Q?+GHqZ1Oenal99yHFrVMFowyBsAJgYK0GeKCmRo9wMZhr5fcXR2Vre3Ol+8r2?=
 =?us-ascii?Q?Q4mS/+z5pSJ6+fZsWKdB4sthvCGieT9/Q+JAKSwOrmkBMasDD7SkSIL9D9HX?=
 =?us-ascii?Q?aHdEueJU+s0hhPD4MdvjaftWt/4OpjJI/65gz5Q/gI6EOecexEps8zG6mxHi?=
 =?us-ascii?Q?8uXZh463iuTXn2uYNoBeN1C8MsqOQaSc0DV/di7/JTtwZT42KpUdX7w68Whc?=
 =?us-ascii?Q?lscOAWx+hZKB+WYXvPYHewoaXB4rF6fKizFdRql1qY/PQwU3f4FeZleUKE+y?=
 =?us-ascii?Q?sp2oWI6SeJeUyGuljJzEqB+M6wnLp2Oox4fHztbW2UK0bky5PqEDiac3PnSl?=
 =?us-ascii?Q?+PT026WzNQEcngz59BfZsC79JD0FOUDThH53jWVevdVmPjelsMCndQvUoW10?=
 =?us-ascii?Q?M/oIEYgioeFxO18OEXrz8VtbmApoq0G0n0NYE4PRwuXR+uG4WalxFNZvgPFV?=
 =?us-ascii?Q?g0jA/bAMagPvZJs6kU5G8dyexYiyno/n24ZV/fxROqqGcaQlhyTw2L6tjx3R?=
 =?us-ascii?Q?O7/Jt60vCxO1Q7iVDCdz6m+Lqx43k0saIUSCKQxBm+bqIKRThlakpVrroDlD?=
 =?us-ascii?Q?7Gt+3V9qcCv0yue+4QVlapBobn3J0GcHcEy41EtXjtX3KF5C7bFyOyH6GrIa?=
 =?us-ascii?Q?vu/PkZ4LYz4134qStAVpp1NaWf7y/P/SAqy/5vms1BBJoU2iRcylBuGXO6AC?=
 =?us-ascii?Q?VhPM/fmzueVMy2C9QXjEPxGKnjJhEeDBMMaoqDNP4DfA7w/ad5QGOrN9tSDp?=
 =?us-ascii?Q?Z3JfUaAbARC1Q7eKKQgF3UCk3j4jL0ch2V1xepSbqHEZruc6BhhRhb/kXZYZ?=
 =?us-ascii?Q?tEADDgGJdevvr/daMUjYVUXcC1DHltsF1Qva5C4xu/465elsu72U8jmcv/yF?=
 =?us-ascii?Q?KTRSzkoMiGN8exfVQupLeR96e8aD/LUmbFZwz6RQ94eXHRPtEii21AoyZaG6?=
 =?us-ascii?Q?FiJ5OsV1U59OCKob39wa0zC4QUZgl9hf+8xOryKv2mOjKrQ9AbkOxEcQCViw?=
 =?us-ascii?Q?FDiFp2uj81BcXYdiiLyCBSMSjEBShZNeYZQTt/VRTjE/5m7SXtDhNNFNlq9w?=
 =?us-ascii?Q?m+dNfIILsoUPg3qKNMErqv2jCwjwolqBKB7YSefCZS295fJj+vs6EyXx3Crs?=
 =?us-ascii?Q?01fI8JDaHNGVlYAnhny+T2POEgi5Cq1jogrbqc7yqiu3edkWqokvnmrnql8C?=
 =?us-ascii?Q?Wx4wXqDcs4B4TYx7CrPegEVoxkFfu830+bhun1V/R3BR3qagbvLkZLddETCA?=
 =?us-ascii?Q?pAPqHBaX+CxHXRJo/zyA5wUICMWiP5Ljcqd+8aB17s/vPdQ6JLhJgvcnGgEY?=
 =?us-ascii?Q?+357BavbzuqHA64TZRUZxEM5S7/Ga1PfDUFAXRzhBEol0nk9AS3WjnZjfw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bh2zQ4W4OIdE7+MgB0NEXuKDC/RabNxqvDxMAeUhpjq+AFIxu6x/3oGhnt6A?=
 =?us-ascii?Q?Fyi6g22kfxNOMzwFQnPPb2WOg8Vk/RmO0r1Bj8y9IuMswvfecXqDhHfgIUvL?=
 =?us-ascii?Q?WXIbHclySrMPRzZMoT409Dv5TPaPpHs3srgdOdw2WshILdn9yJLWlxncZRmr?=
 =?us-ascii?Q?djEtCUPjnA6EAZOuppgj6cYQxi53TLwEAsqDqPjwriX8zEZ2QN4v2/RD/0aA?=
 =?us-ascii?Q?ia3MOoAG7Vqv+zkvLaPAofOOAEKWWXc2gaMGSpfKKYFntv07ysE0Na7kTTaW?=
 =?us-ascii?Q?9kbJS2Xrv/1nn4FJDZIPMU9fJ/+X78jQPSAlSHmO9gTHgtZpVSGjTrpm4roQ?=
 =?us-ascii?Q?gPCfoWFw2S4+E4z4+4R/ImtbobxWjmGf9ScZSbJgJ6AbP4/KtkEG8AXA+UyV?=
 =?us-ascii?Q?6lvVmF+YurIGtgS/dZhV0EgIe9oKWbTzK41nVgIgpOFZb0lsaFH98hbLKy2f?=
 =?us-ascii?Q?vZNNWmkPnbqOLfnNU/Rst7IZnXtMB1XGnRUvVdWEQGfErxLcXyfSC9de8kui?=
 =?us-ascii?Q?S9pwvU7mesZmmKXJQbNkD1EHPGfHDelD436b+YvR4Ap2EfVowckvKpClOh5O?=
 =?us-ascii?Q?WRYI5hqbVrdzdcNp53cj+YgvJUGz0yo8w30PGQDLUU4dJtaKpf0AJqQXXwSp?=
 =?us-ascii?Q?QOe2kD50HGGHOF903CwotIdQtN0ScHdcKwEF6Ej8b7d8FdxFyiC8Sc31gn07?=
 =?us-ascii?Q?fH5ZOLOt8TWiEUrVbRWzo109ZFSA7+vC+VIKs8cMX2YM07pBLNkTbF3R6GJa?=
 =?us-ascii?Q?Yi6vasbhuwt3jGcC/VCiDYK30viy7CM3nZRNkVNK9kgB2oXGNm67HOT6HKE8?=
 =?us-ascii?Q?zrrgsw+/pBdtRELRmgfr4W48Mc2qlgwE0V0EJyyOQb9hK3a98Uuv5khZDAPf?=
 =?us-ascii?Q?71FrtDATpbvdVzUbIKZnWeUoVSfj3C2rnxVIQ1L6v2EsaVLy1/+wBKPl+tzG?=
 =?us-ascii?Q?qsO1J206/DJy4+nk5n+ZpBOn5Yb5WS1RXJzU/aoxmLK1aq5B3I2yXj2OIhxh?=
 =?us-ascii?Q?AOQOjbaT//+DKcqJL682HMLXNoO/KlRmqSQg50IsgPY0N8LQyTA4DOzqoPb+?=
 =?us-ascii?Q?xLh1jSdT5/eslkPJrYXSKX5SUDkUI/a2Xl1XxgOy60rIHqeMwUfYBnUQ6G2D?=
 =?us-ascii?Q?NQD/wNAbQLeoEkWZb/Ah8hIv6Qh2TID9NBYy5nl7Gqvclj/LH7mgtbYKVY+T?=
 =?us-ascii?Q?tCd8757saZPT/Y60Sqad/qpZawt2NhI2fZNZc4KrJRLl7ox7EIb1wL/i7PiF?=
 =?us-ascii?Q?mqoYsE/1ru50ly/9VvX2aqNbMTPnpYO0M95e5rnn2PU+wQyamsxYSpSn4y3J?=
 =?us-ascii?Q?navFSi/BVC6sWDlBKOwmIGvdwojEC4ui3sUYcQGF57dlFJ/O2rpWypUClJCr?=
 =?us-ascii?Q?JG4XipvGISsOUFowyEs1wDIM6KrGj3X27fMeZh9Rml1ay63Pq4A+koue6sni?=
 =?us-ascii?Q?37AQeejZ9Cl/NapU4comZ1sN5gx2H4H3HJeE1aL/SqPG53ixNp0sd/0FfWiv?=
 =?us-ascii?Q?svQGsF4vQfmFzorCIkyKz645qGhUR/yT7TO0TvbCCo8DjJDXk6/GKjuv/DUJ?=
 =?us-ascii?Q?J2XxMSHQdYo7/UT04/Z7eouAs4v1t3LNNOEs/62D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8152d6-c3c9-472f-f446-08de2e459151
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 06:16:08.1033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6thUpCVWAlaCnKYGBefAezl1C8Y7JwVGUm+KCZCMrqcswDFBWYL6G0Ln7+mBNft1Ie73N/8XxU7O4ZmdP0fEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8019
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA0MyBTYWx0ZWRfX4at8vAMj+w2v
 duT6xg1XvHqxWHIfgcBHOoxgI5gyoFeg/sslTvcYL9374/GMB5gNbxJBC3FT2y/0WYr/fON2Rq6
 9uZyI/NOKNlzNOfcUYGSH8EQV5wCwLcvPlU8JlN6RyPfZbMmegUBvw6E+Roz8MXEQuwaSOtd7ye
 7iLaDXoMM3NZDCqsRNRmqzYApBolIcsiorrOGRu7x1TxLDxcQxxg/XCDdFSfmaLp2KLb1Nm+5zB
 vJYJpQ+7HBA6/++sUwIdqdDUkYh6ZMLbQFJy6VKzuIkK9BbZsRjf4VPgy7fZ7kqTxfb9jd/0Lkx
 GtwG4Kgv7YEgGx/eK3o3EBXuIweAdU4kp6haOHJ8DEqH0jq68jZmss6iEVO2dDpvlKY6mhlHy3l
 +RyuUcIMutj9Q8g8xb5aKc+H2xdzhA==
X-Proofpoint-ORIG-GUID: eFUKgAVUPgsqmb3gAB0uNHmTKwXFXTWE
X-Authority-Analysis: v=2.4 cv=Wq8m8Nfv c=1 sm=1 tr=0 ts=69293e2a cx=c_pps
 a=1puOLNWm8QjqX9uS9MZT0g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=1011AmDLJHh65kVMvewA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: eFUKgAVUPgsqmb3gAB0uNHmTKwXFXTWE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:16:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226883

From: Chen Qi <Qi.Chen@windriver.com>

We currently have a problem regarding complementary package installation,
that is, if 'oe-pkgdata-util glob' maps out packages that are not in
the oe-rootfs-repo, we will get error like below:

  No match for argument: lib32-glibc-locale-en-gb
  Error: Unable to find a match: lib32-glibc-locale-en-gb

Here are the steps to reproduce the issue:
1. Add the following lines to local.conf:
   require conf/multilib.conf
   MULTILIBS ?= "multilib:lib32"
   DEFAULTTUNE:virtclass-multilib-lib32 ?= "core2-32"
   IMAGE_INSTALL:append = " lib32-sysstat"
2. bitbake lib32-glibc-locale && bitbake core-image-full-cmdline

This problem appears because:
1) At do_rootfs time, we first contruct a repo with a filtering
   mechanism to ensure we don't pull in unneeded packages.[1]
2) oe-pkgdata-util uses the pkgdata without filtering.

In order to avoid any hardcoding that might grow in the future[2], we need
to give 'oe-pkgdata-util glob' some filtering ability.

So this patch does the following things:
1) Add a new option, '-a/--allpkgs', to 'oe-pkgdata-util glob'.
   This gives it a filtering mechanism. As it's an option, people who use
   'oe-pkgdata-util glob' command could use it as before.
2) Add to package_manager 'list_all' function implementations which
   list all available functions in our filtered repo.

[1] https://git.openembedded.org/openembedded-core/commit/?id=85e72e129362db896b0d368077033e4a2e373cf9
[2] https://lists.openembedded.org/g/openembedded-core/message/221449

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/package_manager/__init__.py     | 78 ++++++++++++---------
 meta/lib/oe/package_manager/deb/__init__.py | 26 +++++++
 meta/lib/oe/package_manager/ipk/__init__.py | 20 ++++++
 meta/lib/oe/package_manager/rpm/__init__.py |  8 +++
 scripts/oe-pkgdata-util                     | 14 ++++
 5 files changed, 111 insertions(+), 35 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 88bc5ab195..b9a4218939 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -32,7 +32,7 @@ def create_index(arg):
 
 def opkg_query(cmd_output):
     """
-    This method parse the output from the package managerand return
+    This method parse the output from the package manager and return
     a dictionary with the information of the packages. This is used
     when the packages are in deb or ipk format.
     """
@@ -369,40 +369,48 @@ class PackageManager(object, metaclass=ABCMeta):
         if globs:
             # we need to write the list of installed packages to a file because the
             # oe-pkgdata-util reads it from a file
-            with tempfile.NamedTemporaryFile(mode="w+", prefix="installed-pkgs") as installed_pkgs:
-                pkgs = self.list_installed()
-
-                provided_pkgs = set()
-                for pkg in pkgs.values():
-                    provided_pkgs |= set(pkg.get('provs', []))
-
-                output = oe.utils.format_pkg_list(pkgs, "arch")
-                installed_pkgs.write(output)
-                installed_pkgs.flush()
-
-                cmd = ["oe-pkgdata-util",
-                    "-p", self.d.getVar('PKGDATA_DIR'), "glob", installed_pkgs.name,
-                    globs]
-                exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
-                if exclude:
-                    cmd.extend(['--exclude=' + '|'.join(exclude.split())])
-                try:
-                    bb.note('Running %s' % cmd)
-                    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-                    stdout, stderr = proc.communicate()
-                    if stderr: bb.note(stderr.decode("utf-8"))
-                    complementary_pkgs = stdout.decode("utf-8")
-                    complementary_pkgs = set(complementary_pkgs.split())
-                    skip_pkgs = sorted(complementary_pkgs & provided_pkgs)
-                    install_pkgs = sorted(complementary_pkgs - provided_pkgs)
-                    bb.note("Installing complementary packages ... %s (skipped already provided packages %s)" % (
-                        ' '.join(install_pkgs),
-                        ' '.join(skip_pkgs)))
-                    self.install(install_pkgs, hard_depends_only=True)
-                except subprocess.CalledProcessError as e:
-                    bb.fatal("Could not compute complementary packages list. Command "
-                            "'%s' returned %d:\n%s" %
-                            (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+            with tempfile.NamedTemporaryFile(mode="w+", prefix="all-pkgs") as all_pkgs:
+                with tempfile.NamedTemporaryFile(mode="w+", prefix="installed-pkgs") as installed_pkgs:
+                    pkgs = self.list_installed()
+
+                    provided_pkgs = set()
+                    for pkg in pkgs.values():
+                        provided_pkgs |= set(pkg.get('provs', []))
+
+                    output = oe.utils.format_pkg_list(pkgs, "arch")
+                    installed_pkgs.write(output)
+                    installed_pkgs.flush()
+
+                    cmd = ["oe-pkgdata-util",
+                           "-p", self.d.getVar('PKGDATA_DIR'), "glob",
+                           installed_pkgs.name, globs]
+
+                    if hasattr(self, "list_all"):
+                        output_allpkg = self.list_all()
+                        all_pkgs.write(output_allpkg)
+                        all_pkgs.flush()
+                        cmd.extend(["--allpkgs=%s" % all_pkgs.name])
+
+                    exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
+                    if exclude:
+                        cmd.extend(['--exclude=' + '|'.join(exclude.split())])
+                    try:
+                        bb.note('Running %s' % cmd)
+                        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+                        stdout, stderr = proc.communicate()
+                        if stderr: bb.note(stderr.decode("utf-8"))
+                        complementary_pkgs = stdout.decode("utf-8")
+                        complementary_pkgs = set(complementary_pkgs.split())
+                        skip_pkgs = sorted(complementary_pkgs & provided_pkgs)
+                        install_pkgs = sorted(complementary_pkgs - provided_pkgs)
+                        bb.note("Installing complementary packages ... %s (skipped already provided packages %s)" % (
+                            ' '.join(install_pkgs),
+                            ' '.join(skip_pkgs)))
+                        self.install(install_pkgs, hard_depends_only=True)
+                    except subprocess.CalledProcessError as e:
+                        bb.fatal("Could not compute complementary packages list. Command "
+                                "'%s' returned %d:\n%s" %
+                                (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
         if self.d.getVar('IMAGE_LOCALES_ARCHIVE') == '1':
             target_arch = self.d.getVar('TARGET_ARCH')
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index eb48f3f982..0f74e1322f 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -112,6 +112,29 @@ class PMPkgsList(PkgsList):
 
         return opkg_query(cmd_output)
 
+    def list_all_pkgs(self, apt_conf_file=None):
+        if not apt_conf_file:
+            apt_conf_file = self.d.expand("${APTCONF_TARGET}/apt/apt.conf")
+        os.environ['APT_CONFIG'] = apt_conf_file
+
+        cmd = [bb.utils.which(os.getenv('PATH'), "apt"), "list"]
+
+        try:
+            cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot get the all packages list. Command '%s' "
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+
+        all_pkgs_lines = []
+        for line in cmd_output.splitlines():
+            line_parts = line.split()
+            # the valid lines takes the format of something like "findutils-locale-ga/unknown 4.10.0-r0 amd64"
+            if len(line_parts) != 3:
+                continue
+            line_parts[0] = line_parts[0].split('/')[0]
+            new_line = ' '.join(line_parts)
+            all_pkgs_lines.append(new_line)
+        return "\n".join(all_pkgs_lines)
 
 class DpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None, deb_repo_workdir="oe-rootfs-repo", filterbydependencies=True):
@@ -436,6 +459,9 @@ class DpkgPM(OpkgDpkgPM):
     def list_installed(self):
         return PMPkgsList(self.d, self.target_rootfs).list_pkgs()
 
+    def list_all(self):
+        return PMPkgsList(self.d, self.target_rootfs).list_all_pkgs(apt_conf_file=self.apt_conf_file)
+
     def package_info(self, pkg):
         """
         Returns a dictionary with the package info.
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 4794f31f88..2f330ec4f0 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -90,6 +90,23 @@ class PMPkgsList(PkgsList):
 
         return opkg_query(cmd_output)
 
+    def list_all_pkgs(self, format=None):
+        cmd = "%s %s list" % (self.opkg_cmd, self.opkg_args)
+
+        # opkg returns success even when it printed some
+        # "Collected errors:" report to stderr. Mixing stderr into
+        # stdout then leads to random failures later on when
+        # parsing the output. To avoid this we need to collect both
+        # output streams separately and check for empty stderr.
+        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
+        cmd_output, cmd_stderr = p.communicate()
+        cmd_output = cmd_output.decode("utf-8")
+        cmd_stderr = cmd_stderr.decode("utf-8")
+        if p.returncode or cmd_stderr:
+            bb.fatal("Cannot get all packages list. Command '%s' "
+                     "returned %d and stderr:\n%s" % (cmd, p.returncode, cmd_stderr))
+
+        return cmd_output
 
 class OpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, config_file, archs, task_name='target', ipk_repo_workdir="oe-rootfs-repo", filterbydependencies=True, prepare_index=True):
@@ -364,6 +381,9 @@ class OpkgPM(OpkgDpkgPM):
     def list_installed(self):
         return PMPkgsList(self.d, self.target_rootfs).list_pkgs()
 
+    def list_all(self):
+        return PMPkgsList(self.d, self.target_rootfs).list_all_pkgs()
+
     def dummy_install(self, pkgs):
         """
         The following function dummy installs pkgs and returns the log of output.
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index 20e6cb8744..a51057650a 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -275,6 +275,14 @@ class RpmPM(PackageManager):
                 elif os.path.isfile(source_dir):
                     shutil.copy2(source_dir, target_dir)
 
+    def list_all(self):
+        output = self._invoke_dnf(["repoquery", "--all", "--queryformat", "Packages: %{name} %{arch} %{version}"], print_output = False)
+        all_pkgs_lines = []
+        for line in output.splitlines():
+            if line.startswith("Packages: "):
+                all_pkgs_lines.append(line.replace("Packages: ", ""))
+        return "\n".join(all_pkgs_lines)
+
     def list_installed(self):
         output = self._invoke_dnf(["repoquery", "--installed", "--queryformat", "Package: %{name} %{arch} %{version} %{name}-%{version}-%{release}.%{arch}.rpm\nDependencies:\n%{requires}\nRecommendations:\n%{recommends}\nDependenciesEndHere:\n"],
                                   print_output = False)
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 44ae40549a..5b7cd768a4 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -51,6 +51,15 @@ def glob(args):
 
     skippedpkgs = set()
     mappedpkgs = set()
+    allpkgs = set()
+    if args.allpkgs:
+        with open(args.allpkgs, 'r') as f:
+            for line in f:
+                fields = line.rstrip().split()
+                if not fields:
+                    continue
+                else:
+                    allpkgs.add(fields[0])
     with open(args.pkglistfile, 'r') as f:
         for line in f:
             fields = line.rstrip().split()
@@ -136,6 +145,10 @@ def glob(args):
                         logger.debug("%s is not a valid package!" % (pkg))
                         break
 
+                if args.allpkgs:
+                    if mappedpkg not in allpkgs:
+                        continue
+
                 if mappedpkg:
                     logger.debug("%s (%s) -> %s" % (pkg, g, mappedpkg))
                     mappedpkgs.add(mappedpkg)
@@ -592,6 +605,7 @@ def main():
     parser_glob.add_argument('pkglistfile', help='File listing packages (one package name per line)')
     parser_glob.add_argument('glob', nargs="+", help='Glob expression for package names, e.g. *-dev')
     parser_glob.add_argument('-x', '--exclude', help='Exclude packages matching specified regex from the glob operation')
+    parser_glob.add_argument('-a', '--allpkgs', help='File listing all available packages (one package name per line)')
     parser_glob.set_defaults(func=glob)
 
 
-- 
2.34.1


