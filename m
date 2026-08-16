Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647B6C5DF7C
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:11:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19640.1786921884795397465
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C6Eo0Mmh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26887e2f0c=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GMikgR722970
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=; b=
	C6Eo0MmhlEEBxo8t/eGyFCjI/Br1d3PadUrenbafg7GnqqCVlWcehQKTntMwqXIU
	j+4+95Kqs30w/lgOMQslo/cR6BL7KHQ6bVbrs5ozbfh8pk92mgMIADh0yQwvbMo/
	1BR+VNRxQtt2QrluexXa7qd6S6uP0Znbqpue2fwIbsbpj7htqPMHWe7na+2SEzDo
	x8NnYgloNPURzZQjRL/fWt9PBF3hl+6iYulMoFWL+dr0W0h41U7Jz9Kh4JOId8A0
	3+Omy5VYrNjWdqV1UeSt6MuOlXqgywAhSkxAKxCbcQfCiu0lxCiEyunb3Guq2OIj
	KtC/0d3Po1E2s3RbBLAXTA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023092.outbound.protection.outlook.com [40.107.201.92])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2f33ss4k-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 23:11:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZiqxxLKgAZDXU2VkWofvjWm8iZq7g1bCqfRQQ1FQql2N0W7LhnAhICgezBmQPy6+HaD0Cs93XjsiS+jS6tZNqbRPh4qnIA7/vl6t87nt8ihPgcQmsCZGpqiO1AhEaaJh3UixL8GHrvfGQF7O78DL49lNpmCDv/yvk1RMjJYDy2ytdFIxg8v35Avu/IaqIogaZl3urPq6OietoeqLUQEeIyhbLLTWbTpjXFCG6pEUqSASkgBHSaTI/90+mRrhK4iXptJw67XQmzEVOxZpVr3itFv5HYN3j3E0H0Z1+oJKZ9MvTJfeW0D+irClf9ieQkPmzwKD9LSFwkaghNT+nGblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=;
 b=xoKVHHPom06E4Q21z+4sRllCz9o/6js3qDH1UeprgfeONHMsk+xGRFxadql2B6CCAkfmFxwT6in683G41fYRJVDUPdbF0yGnnFMQ7mjSE5Qb0uXbZWQhnVyuBBOw62DPjIpb2tZkKULD27WdXXsoodLHO8XMyM70WG3NWNwqkP6xoBlLvYjHd44BYj3YZTCvdpV0woxINdbcV0YuSeG/09G7tdJOcxCk91j1tFhpdxVyJf2QwTTNphHi2OoQbCCulP7FzGqVXgvgRh5y3URZdULweRKgYMedduuJYhP6MhOtZDEqM/1ZXBvgCm53jT3S/0orf8sWC8rPvVUEWu823g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 23:11:20 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0315.014; Sun, 16 Aug 2026
 23:11:20 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v15 01/12] package_rpm.bbclass: Drop external dependency generator to support rpm 6
Date: Sun, 16 Aug 2026 16:10:53 -0700
Message-ID: <20260816231104.3871015-2-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: de09aa05-fd80-44a9-d678-08defbebaeb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|376014|366016|38350700014|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	z0mik86OujjWovbaMdHqBJvjCulKYdK7yoGMs42E3LBFuNElYbfyQgNJIp5qXqbYayGKtSgCZrmMpJPkmgt4B6ghYxyHdk1n67GLfEQ2rQhKPh2mmueXAe5258RLibhPEm339iQ95ffAUSDVe9E3UmDqFgNOOAscbNhfvZ8QiHaWfaiNsekQrSSriXsn7uSrfObLJs2jFqqFvSsYqJZDna04Sisx+oRHOCLrnhEkmFC1i0owal/ab1xFxh9lyUGwnz/3Q5LTq8dUHPL9AuAmhWbFv/j1+13CL3JE6NVK5tcK2uNKCS8O55aQCc82dfJOvKzecBNEtvbpF3HgrflCKWE7+XeqbMLExifIHLwG5KhnSQxNZQqoc+KX5ikAIT/VbNpXdeqHnWZQOVvL8ayb3C1ik74SKuq1kSILnJUtWGSCxcK03VyWQq28RTgrmsiZWnDocGxkKKzmuem5gXH5/av6iRRyXyFbEzVQZxhXk5xEe3vVPF/695VK3kcO1jBAhWSE2H2qjJuU7mOeIO5hc4C4kxiCKqupurVPRK7GedaoD9gf+dG4uC1/+bHdp2liqOVHbeXK9eSYhej/IMTP4uQk6WJLNUYTpqAPZ6reOHh9YG7aSP6xYI8xj1pe9BrTvY4vWXHXkXIKCm8dnbq5xqF7TpC9soGvnyXKsuhO9I6wDYxMwMRby5LqqHuHwZqvW6xZbQGnNRRNY5qJHaVKIKEM02djIPfkt/kuKr5yDR8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(376014)(366016)(38350700014)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w20/fLtXNj9rZ3rJYRjMUvXlA8DazhqdVSqPmu1MKTNC11a/y4baPMYyqfPD?=
 =?us-ascii?Q?/jQhFBs/s8Vf3ClttQiNLtaqatga4zwpFYd184OFmvriYtkQXOC00bmnZloy?=
 =?us-ascii?Q?yp7CfpPzWXAv7H8SGVYFGYfWlr7M7mQpNn5MEi21UEta7e9yx0RvAIyTSX8/?=
 =?us-ascii?Q?jjYDY+KljF2YCYRb6Qx7BYOVIKaP9K0TaufGWeV8/sJO8DcBjAzrm+y+MFtr?=
 =?us-ascii?Q?EI0WoBE87e9CgNPJQTdYetH63piBnBgeQ2wG5rpi31jMF9B+XPc4IbX2hdhe?=
 =?us-ascii?Q?eUfuLuo8Rwf2DeQMdcLzvbg3+/IVTYvCnudap++yj2Ih8u19k31Cdr5ezfAh?=
 =?us-ascii?Q?5A56nRzJ1cFVIfdmZB0f7TWC8di4FfH58FfR4AtWW1yDavIXJr12qEGKcMUf?=
 =?us-ascii?Q?NanOAA+WuaKxANiMpDCJmM2/VXUxnivCOTzjPI34i6xG+hw1wFoIEwGc55Aw?=
 =?us-ascii?Q?uga0Ubx2c9eOxHSts2I0Im/X0Kxq3RYrpyfuQnj5ETKSRzSB1azGub6jwapZ?=
 =?us-ascii?Q?ssA8qKw/ne6a++oYZKOH5pko4c6+ks/wF3UKlZL+T9V6Ka9yMcdpcNVXCoFW?=
 =?us-ascii?Q?YK0/Yo37mItbJb0a6MV9Mb0nOzxoxAUhvBsjtoegbF2lwtJPD2JI9n4E9Fn3?=
 =?us-ascii?Q?ZlTLKYBV7dGl2OYYOh1De+3etgafyAT7ziUFg2PVVdUccfFG49caElSKjU8F?=
 =?us-ascii?Q?d7Gq3LsNR8LGdblTk+8z3qkd03+qWnh5Di9zaMWFM/zeRwVA22F+y+DPj1DN?=
 =?us-ascii?Q?EWxhi1zg52kp/sWbsnMVdGEoJ7AWUs4M11VuZIlT7xkS/MKJhg09d2+uPoER?=
 =?us-ascii?Q?ys5lOYlOT3XyjmPpdOdDERw2Q/4678Q02ImQhwtyQMlB1cR8jUfxdF0uTWDE?=
 =?us-ascii?Q?tz4aquEWNEmXDTlfszncwdNZ28V+rifZqotRWvhOGMWt6BwM/L+5LEbyOzKG?=
 =?us-ascii?Q?Z9rWFih1HiRBUb6vfM1O3OWWygH31dnac6PFmBu5iW9bt547Vu05YvsjYIwp?=
 =?us-ascii?Q?uhFhdyFeweNviBgWBw4l02P6q8rUvFe92azjYMvWHGudWFoj8kj2elfdpfvh?=
 =?us-ascii?Q?7Sn8LqP4oVBbW39NeFBa+pcSpUpAqpQ9z5e6EaeNLE3tRabA4TdNDGHSYqWk?=
 =?us-ascii?Q?pDA8/5jf3L2PWO96tCXhwtMGDk/h43LKLc01R5MZrusNoRTn330gNSq+3dpN?=
 =?us-ascii?Q?7DS8eS/XaAMX9nV1X6ZriZVIoSbAU+dlJUBs+d8jo+nVAVY/UGDDeN/wg6JJ?=
 =?us-ascii?Q?/av2lPQG2nGJY4m0AyKY62xbdiPnDPHajEEmEfBmfYfsakGfio9LQctohuEX?=
 =?us-ascii?Q?6rP4/iZ47dBvx6sJE0QoKcV+BNY4eOEh0iPlefS7jrHb4ROsBrcA1du0SOr2?=
 =?us-ascii?Q?TEyMn+BAfEt95+vf2wdqvTzpnRc3sbGHw3S/WhZL/EZJhbn3eRICgIxuCKtP?=
 =?us-ascii?Q?EjgvT8Bt57cHFPYZxrdVq6UP9PfVIHB9r/9jPZm82fxyohv7tEt5ubyzs720?=
 =?us-ascii?Q?09Bo/h2vt+bLso3tKagfuJ9ET6nMssarcvh4/i0Gbh8PulPdpY2Fs4UvZS9+?=
 =?us-ascii?Q?7kgxvMejemPVleJJwvAIYcFpMEEpcFpBppN4Kl0pwtW9NBkl+oVMhL5wr3MO?=
 =?us-ascii?Q?HXKq3DnLGRsQdeSmyi+DCnmByK8OQbWsClC+PpjYPB2IYD9kGRrZvJDBIzgA?=
 =?us-ascii?Q?HTgMcshYnQHj2D+m2/aQPUq+kR2dzNM0+RBxKBAloiWi5lADf+OhS2TmlwfG?=
 =?us-ascii?Q?tuBd8oqEnzM/9SuMPY9GqCqucj0Maug=3D?=
X-Exchange-RoutingPolicyChecked: 
	DW9WjwjRkhKoc/aJxsCQInBmFaY5nGKSMl30fQpmdPMxsR/XR7IdSuOWrRIq/5EWiwqC75AK/VTAGpQRbaLTkv4qhZznP9TDrYUE00880dg0Xc9DqKs84PvwmipWf+qZ7mjVqdqBSR4m3cbeLw7188bJfCIwMwOfN92Go1Uei1TkJ0PKQjH2/oLP09bVEN/kXX/alFTeeJqFrne+z1t7IfUVDXJwohI1MzkSbQvTVDVuCJImAZVdDTdDEsE7EbqRafcJmRxgGX0YXJslXrAoyhdPcUwg/5k20jQtfa98o1rMPBAOUuBEULbTTH+J5O72NDEWXHzMztHf3x4NInGKzw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de09aa05-fd80-44a9-d678-08defbebaeb1
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 23:11:20.0750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MKPscJqBdr53a9fng5FaJBUtKiffdkP2r1JqtPvX/ybINXJug2lKkEI7Dcux+3SoY+JX2WoJeFw6EdaVR7r2axLVoWV4A2iwT8neSmR8bQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX0qEOvvjIcfgw
 9U45d7S395fakrH+YbND3MvIqMaARCU63E8FLVgVV/Vv/+TXB7LH5cIxa99k5QybZAc1SsI6wwq
 2cI8gkW4C4TRQT5IHQAkng0zuc8A7q4uzk8MJKTtTuVwoqW+UkjUsjsPEQFuZId7FsmjkypKzg1
 dTeS5SFxhEsxcccVN38UjkLEZ0kNZtr/HjqoTr3TZzCAPmVXVhNFLHTRUos2/Criuh/8lOrgrn8
 nuroJIjCha8Rubtrdo/bv2zR62iLlM2pR4422A3bLVM92kVEAnTmTdgkeQdw9nDfHwkmq2tisAY
 xcCujatf+HH3J4phsKKJHbA6ePZrPnJIEnVm8Yy6qiLHCb7QlCJN3C7bH0KIQJKj0HdqPKvCYl7
 CUMqSFOr3Od2YvM4Q9nOu4tXQ2kqYhppe77vrZf+lEh4joTsanJUODikMS+lPTp0MdQ3UrDgHRh
 ZO7jSPMneL5a5AiP4pw==
X-Authority-Analysis: v=2.4 cv=JYuMa0KV c=1 sm=1 tr=0 ts=6a82439b cx=c_pps
 a=HDWlEWCLQVEuMJptrEg8xw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=gH8vcDOTmKDoYkm8A40A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QSRaB0sMeb_4gCKGv_pW7C6ripbwdVzo
X-Proofpoint-GUID: 679PpbZi9_5CGGQyq0FpYe-MDHmHYdup
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX9v+E2qdvNPBn
 ptClU4ly98/D8kwVrFY+TJB0uvokdvDqZ1gRFqqMuS8HoxR0H30uX9Ve2ddbKOmNkXUfUdWXMgP
 gEO3NwQhbIGVswmjJ1aCqb9HXteeYGuKtD8A97lQjM1VhM6rl4JR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243567

The rpm 6 doesn't support external dependency generator. Oe-core used it for
per file dependency which was saved into pn.requires and pn.provides,but that
hasn't been used any more since 2012 (rev:
be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
updates in the past 13 years, so just drop it to support rpm 6.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 84 +------------------------
 1 file changed, 3 insertions(+), 81 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 9eacd91cbc..f286d3a0e2 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -14,10 +14,6 @@ RPMBUILD_COMPMODE ?= "${@'w%dT%d.zstdio' % (int(d.getVar('ZSTD_COMPRESSION_LEVEL
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-# Maintaining the perfile dependencies has significant overhead when writing the
-# packages. When set, this value merges them for efficiency.
-MERGEPERFILEDEPS = "1"
-
 # Filter dependencies based on a provided function.
 def filter_deps(var, f):
     import collections
@@ -36,67 +32,6 @@ def filter_nativesdk_deps(srcname, var):
         var = filter_deps(var, lambda dep: not dep.startswith('/') and dep != 'perl' and not dep.startswith('perl('))
     return var
 
-# Construct per file dependencies file
-def write_rpm_perfiledata(srcname, d):
-    import oe.package
-    workdir = d.getVar('WORKDIR')
-    packages = d.getVar('PACKAGES')
-    pkgd = d.getVar('PKGD')
-
-    def dump_filerdeps(varname, outfile, d):
-        outfile.write("#!/usr/bin/env python3\n\n")
-        outfile.write("# Dependency table\n")
-        outfile.write('deps = {\n')
-        for pkg in packages.split():
-            dependsflist_key = 'FILE' + varname + 'FLIST' + ":" + pkg
-            dependsflist = (d.getVar(dependsflist_key) or "")
-            for dfile in dependsflist.split():
-                key = "FILE" + varname + ":" + dfile + ":" + pkg
-                deps = filter_nativesdk_deps(srcname, d.getVar(key) or "")
-                depends_dict = bb.utils.explode_dep_versions(deps)
-                file = oe.package.file_reverse_translate(dfile)
-                outfile.write('"' + pkgd + file + '" : "')
-                for dep in depends_dict:
-                    ver = depends_dict[dep]
-                    if dep and ver:
-                        ver = ver.replace("(", "")
-                        ver = ver.replace(")", "")
-                        outfile.write(dep + " " + ver + " ")
-                    else:
-                        outfile.write(dep + " ")
-                outfile.write('",\n')
-        outfile.write('}\n\n')
-        outfile.write("import sys\n")
-        outfile.write("while 1:\n")
-        outfile.write("\tline = sys.stdin.readline().strip()\n")
-        outfile.write("\tif not line:\n")
-        outfile.write("\t\tsys.exit(0)\n")
-        outfile.write("\tif line in deps:\n")
-        outfile.write("\t\tprint(deps[line] + '\\n')\n")
-
-    # OE-core dependencies a.k.a. RPM requires
-    outdepends = workdir + "/" + srcname + ".requires"
-
-    dependsfile = open(outdepends, 'w')
-
-    dump_filerdeps('RDEPENDS', dependsfile, d)
-
-    dependsfile.close()
-    os.chmod(outdepends, 0o755)
-
-    # OE-core / RPM Provides
-    outprovides = workdir + "/" + srcname + ".provides"
-
-    providesfile = open(outprovides, 'w')
-
-    dump_filerdeps('RPROVIDES', providesfile, d)
-
-    providesfile.close()
-    os.chmod(outprovides, 0o755)
-
-    return (outdepends, outprovides)
-
-
 python write_specfile () {
     import oe.packagedata
     import os,pwd,grp,stat
@@ -311,7 +246,6 @@ python write_specfile () {
     spec_files_top = []
     spec_files_bottom = []
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
     extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA") or "0") == "1"
 
     for pkg in packages.split():
@@ -365,10 +299,9 @@ python write_specfile () {
         splitrpostrm   = localdata.getVar('pkg_postrm')
 
 
-        if not perfiledeps:
-            # Add in summary of per file dependencies
-            splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
-            splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
+        # Add in summary of per file dependencies
+        splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
+        splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
 
         splitrdepends = filter_nativesdk_deps(srcname, splitrdepends)
 
@@ -630,10 +563,6 @@ python do_package_rpm () {
     d.setVar('OUTSPECFILE', outspecfile)
     bb.build.exec_func('write_specfile', d)
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
-    if perfiledeps:
-        outdepends, outprovides = write_rpm_perfiledata(srcname, d)
-
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD')
     rpmbuild_compmode = d.getVar('RPMBUILD_COMPMODE')
@@ -658,7 +587,6 @@ python do_package_rpm () {
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
-    cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
     cmd = cmd + " --define '_smp_ncpus_max 4'"
@@ -668,12 +596,6 @@ python do_package_rpm () {
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
-    if perfiledeps:
-        cmd = cmd + " --define '__find_requires " + outdepends + "'"
-        cmd = cmd + " --define '__find_provides " + outprovides + "'"
-    else:
-        cmd = cmd + " --define '__find_requires %{nil}'"
-        cmd = cmd + " --define '__find_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

