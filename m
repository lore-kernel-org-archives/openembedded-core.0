Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E9CC55165
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 23:52:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.705.1785369118849141225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 16:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ic9HqpbQ;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2670ca2d30=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TNYiUD2488052
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 23:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=; b=
	ic9HqpbQeFwEnNYeF7WqsN08odcWWtFRG/16DizghSy2UiOI4DM0SytSDA6sSxR/
	ALDRBIpNJD5fYq3ShC8fjnG9aaBHXch7mFdKXtsmXBNIFSEIMdIA14mt1JOnAIIU
	T7NcVL9pBdyPTJKgJkCbT8U0jvc0JZ1iwL8x+5ME9Tzhgdp2oQFHuVvbg1NQX+4b
	TWxJScqSYLFvES4OWzPAFqTXVdBAosvwwDhGi/qfq0Qhqh1CVllJp4UIHxGgSCrJ
	KNN3Wi84xqIz69ZAIrMdmCrQMN7h2a2HwAek60TyFuPK67K5FAOXsnhCUXP2BHfU
	uMgpjeRtTdbnaQG29X8utg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010059.outbound.protection.outlook.com [52.101.201.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fqtbsr2ae-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 23:51:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2jhCkQ1tK+F1DUfZlmr0u/S++0yvp/4FoQzCFE5hWd9iWBQL3GJtSNoSjBOev9u+JaLfBrhM6HJt/4obBYsHJSV3S9ZZBFIY9TQN4UWWHZDE+38S7I7O4zZt7VO/4/RlTy5a3ipYv2yebHXXRnOf2QG0h9IvDVV80UYePLiBRP8aA7H5QFwhrzJ3HznROY0+dmbOTLiawYx8BNIZg+gabiZJHJBViX20W8UGHuW2RzzexMfdHXzvb6MIoBI/6KKd0r7RerTT1R2yBYeOKssiCNJLKNjZIWnZ350UXEfMvErD261fo0qPai5kRh997GQykrG6a+XA73eyEIZfo5Vjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=;
 b=HE78pU3y++O2JWvdbHoi8bNyBzb5cuxraQGeia4bgNMloncuZKb4z12YTi6rR5NOZiBUNKF9B0NPb0tdIAdN3oS+ArV44Sy8UtRbH2/+xlWnzGA/Q6X7R/ox6nB0ZN10Zy6l7z47TuH+GGEypCFF525dykWcHHC9O8+Cl/Q9CMmFwDa/bxuBcVuEyJX374WFd2f0rKKq2MfCDJk1y+Swujj2vZQQWsvCZ7RvVai2s4gIlrM9t1KgiPq4V67PmCm30jr3jKxcfLhcTNau7bpwN4kcNmJgQJD4669cCKiXEITreYz7Y2tE9/5DwUyNbk8a3lJIbyLdwnq7eavZpldY3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN0PR11MB6183.namprd11.prod.outlook.com (2603:10b6:208:3c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 23:51:54 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 23:51:54 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v11 1/9] package_rpm.bbclass: Drop external dependency generator to support rpm 6
Date: Wed, 29 Jul 2026 16:51:32 -0700
Message-ID: <20260729235141.1067679-2-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
References: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::30) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN0PR11MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2153fe-1213-4ecf-eb72-08deedcc5e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|52116014|38350700014|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	CRuRvK3CP0mbrfmGqyzqoWxArFquiZ+Bw9I8HgE8WTzTVm/p7p+ot7hZFE9Q7TpFBmqBk/v8u0BUjj1HClXXG2ttpXYGvTlgZ+xGgHYS8lSYPpyy7PeZHOxF3PBjdaG/kv+uDHm0RuM1gjO7pXoVAlYNhvMxArZcEMzU42fKe4aDR6+8TgRnIUKsTZDqBy76XKp69lE7GBYVkX1oV4C1TVg1CciRPPMDCcW9l+0Cw0Pb1m8ZHERCLRhZ4PcBfgedddlrUtwGvWZP/Yw4vsiqNfaYmP/Tl7CmHAyXVKMb/vVKYBJH3lEA02cXx1UtF5x2jQwOL8xBCrloVzdRiwgr3/tRKfuN+detlu5xVd15tFKmwPADzP+6F4kKHaSm+mjlieTf3FttoQc6ROa25ouQmBJQDMCV0A4BMneAbEmKSzweNVd5ANqnAeHkDlloVf3WqJ3Ruv5zlUxNEr1PUiYKJN2TxfowQ8uxLtuRLJyOC1VcVu0i67B5nfEIuKiCts0+wy7V/x5TjTVwjp09g9LZ2Fqb4krKUpPRiLvAFBWeFwRu5fkQIT5JJYFXGAFyvlXcmFWGuBKtGRNs8q34y2tDBN9beh81si0VacQSn65z/rdRyELzz/8Qw//3NtmzrXbGmFYBg/L+eVtot9xrdPybAMXzHvcdj/L9X4JkPHeKB+Pr7MKScVeqx29YhD0MMxZ8a9uE5nJAkKvlhbtIQ/rDY5MLZ9iqhCzLHCdEGdfllLI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(52116014)(38350700014)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E8V+HQke4jSYzIKd45K674wHDFT0SMflTJaEP66JUcYMWQGyuYg73GMJFLN+?=
 =?us-ascii?Q?CTLv5Xx3E780G9u7uuxORSEm3rzUjylV+ncueXEttYZx9lUG9ySL2UaX+BiQ?=
 =?us-ascii?Q?JmVPgXDq26QM1x95kbPXuP6Kbla6JPzz3Q6IfNac7yZmNzutSruTmN0gt/s3?=
 =?us-ascii?Q?MSv5ob43xUBnULculCtMAMLREjbPAsbq6VnMmdIFWyioIl3+a6k0vJ1/bPDe?=
 =?us-ascii?Q?gLSOLLmZHK++PwirvoM7gcwVvk28iGJRbcdmJ2eFTknDvitX7zpck6ed18/O?=
 =?us-ascii?Q?aN9Um34RW4OAVSvBR8swmkLEAwpnaw/OlFsHOePgirY3c0UYCBEhpG/wMLPV?=
 =?us-ascii?Q?2qCeOLlqaBj1Ksetclw/WTeqN63tiJD9Mpe7BZq850lkJx6g2mf0no1DcqOO?=
 =?us-ascii?Q?XxM35Hue6r+vC22fXxiHeVXiIvJVSJCoEA4C5uwhGT/nIEYOnO6jEjsUxNhj?=
 =?us-ascii?Q?cGOrA+WEozx0Eo5Hdv3xIjGaxeZRGUej3i8tPYgXNHuPRfLnhEE0PyDX5SKJ?=
 =?us-ascii?Q?D9QpC3bKuuTvtePeb53++dsuYHclHRR2Qg0LXc6S73Gupteau73xsCiu2rQ5?=
 =?us-ascii?Q?65eYIcDgwNz5I/XKqXQsN9z63THauK1eucrk6JtilS/qmTB3LcYvOdgINOOD?=
 =?us-ascii?Q?7W8knLMtN7KRgb17Xj5BK4PPq772iekKN6isSUQqWc8vssgefAP3bgdB3V3P?=
 =?us-ascii?Q?K/exF2Ue7raLBlZGn/Ub2yGCssSFKGKcvIWlDG7bqZi9yOPBUo/duCSVFzxO?=
 =?us-ascii?Q?xvp80cb/qaVbCiidzIX5qd9DpXeudASTlCFkDEsvgcUMXALyH1AeZx4ZqJpf?=
 =?us-ascii?Q?IFMuNFsdEDsmuN2kakSamntN8eI8E5UF8RxcCCGOLFTXXqMvSjQQ8L53rjFo?=
 =?us-ascii?Q?ilx1pE4TGhkIRfGtIERwXhPpLeSt8K3q5me2pvF+6BTviphnR4c6218qGCEb?=
 =?us-ascii?Q?nGDndDJihZpQ9kiT11oKNbom1rOo7cuabIdOIwcJUcfCTlWq/EkISs2rVfTO?=
 =?us-ascii?Q?RqxdvKWYbh1IsDTqCV3sZUUW93g2s3vj7XuxghJOS1w6euH0uF2GIwJ2Mntr?=
 =?us-ascii?Q?vei/+y+EHFaCA7ExsQ7WvO5Qe1pCFCbKzOUny0BU5uJAxnj1ql0jMDfyr2sN?=
 =?us-ascii?Q?o7KXVmgk5wNiwwLxFyBpSnt5eJKEh4Qim8QQptJUvd8JLixYhvPlzY4iAwoo?=
 =?us-ascii?Q?G3a7pOhMmvyDS05eM9suqx+WwawIifbEOnJp8rnrdSNKXWUQaT3qqVEtncYS?=
 =?us-ascii?Q?lSXyBKVT9goRPd2WO5ibAw6q/6kq3kHpdgfbsg8aZ3utGq+fF7cJ4NcIIwIP?=
 =?us-ascii?Q?cer0cB18lEhcWg2P8zrxkgayCWSGqfKAQZ/Q3Is1d1nkYM5qfITLQIevJFAw?=
 =?us-ascii?Q?OY4yL1xThihifWYch2f8ND0bkiyy4xm5IQNCzSlacijM2tWKPLo0PqZSUMDX?=
 =?us-ascii?Q?UECbXZxF9XPR6KrBaBhD021UXOMhDpsuj/N4f2tz4NX+QBWHMdZmJVeB7CBW?=
 =?us-ascii?Q?T91rkNJeh/9S0vuWQpFtI7A2YJGIT3w20OVUpiwfMGfcNYJO0yf2Vzp7/nqz?=
 =?us-ascii?Q?QRhB6SqqK39WfbncKA5tdHIuPOsTYqpbxM0TtfhcYNvMjE1l10pY/79ZWwex?=
 =?us-ascii?Q?m7G5lz6WeeEQumWi5wZlnlxz+/1iBRqKd5JhGOLQ88ksbOyUVg6vSM7IvWnv?=
 =?us-ascii?Q?rxl+sYv/XAKjOx79W6YdCdyJ6uWhZIBnI8hPImm/iYmVIPqGRWUGBl9F3XyZ?=
 =?us-ascii?Q?RAeOluB4FyK2HImhZbSLhpVxMuVgS7M=3D?=
X-Exchange-RoutingPolicyChecked: 
	lWJ8BEzWtnpCgeCwQKh+52Pp9mgyxuOwQ+dsopVHBPrsmmE0jI8hp93wZm4rf3rZppoLVyU4T/HKti3TRSfeGTW300snv3Q3WA5OnPD+IEZ2NNdZreyijSxAx795CHBcOURJP2iIgFHGZTvBthx0GSXsUPTcrkxgAQIlX8b6P2dk6IBGE7pH5JjJgLZIYtRoYGqnON52zoLgdoy4PHAufnGWx83bIFOkNK1bnzzmIQwjOQKaC+TSDwPrLFPLe4UcBgqyYggH2VQYyNli4wr+I57FuGj5trZLJ5ft8CdBawGWi4pxblXrVcATHZuhkojkxsN0kahDucMxglXfpk51PA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2153fe-1213-4ecf-eb72-08deedcc5e6c
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 23:51:54.7370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSvRum7oE4cIv5pB48RROVN7IT6qlh18Fzck0ZfmDFRWA++WA2fTbgVfBw0RBbEbrqtMHumdc51bTPiThk7lL5cqVi8jXORir5mt8kBx+74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6183
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=JuvBas4C c=1 sm=1 tr=0 ts=6a6a921d cx=c_pps
 a=mPJaQZadrGlgYT55Vo1ogA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=gH8vcDOTmKDoYkm8A40A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfX2DF5bpB6UUCQ
 kIfDqposVkdEMGNDoHQF4vWDIP7+EfmdiEY46VrYpucIBPvl4uzcZMOl/xEDojBGak4zxSCC1Pv
 WtLmOSj87e/BVv2yQ6Lbr6Yqord7V1KYRbvIJIqlc8ka07j7oHSq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfX8Un3rPJN053a
 wystRIM8DvcQdp4xH/LS3NZxy2CouaDUhHVTCGBXmD54kf7i9UzUPWZNsuyeHnNkNCuUeGnJJbf
 WwgnGxCi+wcEI45suQ2aQ3fkQyLUkDIxQEqHqWbdERE1cABSv2aC09AGhQwGHdt8F0yS3LG9xYB
 ZhH15666+6YyP+6U0U6uAyQNVptCwp3VHbdS2mPIGWV4SCragESFnoOdG4heZ3UD5z09IFLMawT
 1Z9BlwJGwxytyGbrRH8DCXkjWG41a1sX5U1wEj7s0kh+vCYL0h7sd6pG4hMVn2cLBQtY6xo4aiQ
 snqWAVAWu3jux5VnWuGywaj+Q8AKCm0qTqTdmZ1AhVZVlRj7nhtL2QTiEN1Mk63F+bSAnGEidF1
 AqRrHEUaZBJXkafJv4Ft4HNP7vxKpCfvZVyUeNqk3Xqcd52anM3Zr2Wb1F6TwCpmLlm00AKyLeA
 S8F3w0+Qqs3spsDCgGg==
X-Proofpoint-ORIG-GUID: NOS-SscT9IPXnB3rOEnr_EfSnRxJpYzs
X-Proofpoint-GUID: xnD34f9xx8DK_DO7TvZU2Ufo-3OrpEnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 23:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242303

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

