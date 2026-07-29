Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33938C55168
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 23:52:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.726.1785369120808497021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 16:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hUagQ9IG;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2670ca2d30=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TNo3Tb2695291
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 16:51:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=; b=
	hUagQ9IG+RNzJg2lrN+mLdM5oKwGRVxHvomUoUAdm/ow2eGclOOqPf6SIBR7xUJM
	rwFfTLn4XMVQ08ejSSCn9R/1s9hAeQZeZVLGy5WFZiqnmWTjJWu9jWT0mgqtJBeY
	C5Fr/lGdg/V9W6BoyZODMATkF6zexzXSGTOKmZ/scr7bZZ4LKGONsxGXwsGZEJ5D
	EIdRRftE93ECSlkYltQ5O/q7GEIcIDxS15+fx8u/DuhV2JF2wwOr9I4G2QhGhHQi
	/3oKeCjisHLPAjoXUKDnq/3BEQx40mu/BxM6o9AmTR5bAgTe/c9w/ITdyw/Z3bji
	y+pdlojCZNUhBQWCuazCcQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010046.outbound.protection.outlook.com [52.101.201.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fqugmg035-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 16:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpKzbEz3r1COpie0EMptFzWhD9OYhxsR3O3H1BHBqySRcBz6AEyFRoiHE97RwwnEKgJGHC519G+49WtgSrk8gSlauzEWi2qGzmz14+gCcy4EIryFhH6qyP4sSa7e83UbCm8sIaH7YvHlDAo9XrQ/QozmIKC/MpgUInYZQ9Vnx4ACrsfyscPOmehU2Qi2Br/oTF41UBsLWec7N8jfxz+tSg0WFG5I2CbPIdHGc1/Y5XjOC334Jh99MGbMReZH/VamUeW+RwsC/Tj8Mzpp+8LRBkyseHHrhvKFvn48dVbimnc2teWpgCmQq/dfxjZ3McfCzWeEpijZFTXkwhWrWBUALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=;
 b=AJXc3uMmSpskD31tp3FW/NJEN/FGy/fpzAqffI44sVQceGfkL84dyA3kQdRhzO/Que7Fp7IkE7MrAfAf5vYtzkXFWMwZNL3qp93o1t3onu4WQsJ+104Wn2RZBVVuqBagLLISHxgAtnUk0zUI/UYeyRt52Sa6uAf1vnTHM1uCDn9Hd3Yjv4OLtVJDBM6T1K9cgXArwBxA68mDKhbJs0t00oyd7EnUTJe3q5ljraOKI1un3biTv4LQAKVBLCZggg4Ev+VoZwiHsUTAewGiKI1mGdngLje96Qmasg8qMMLLJ3CC6/SDXMLstd4AS0ANVQftIghEc5RHd2wzNF9I1Ph9EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN0PR11MB6183.namprd11.prod.outlook.com (2603:10b6:208:3c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 23:51:56 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 23:51:56 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v11 3/9] lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or musl
Date: Wed, 29 Jul 2026 16:51:34 -0700
Message-ID: <20260729235141.1067679-4-sumanth.gavini@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: bf1c6f1c-6dc3-4d15-bbe4-08deedcc5f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|52116014|38350700014|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1xiIXRr2tqGYhMd/SI0mJTQ9ugQjIIOCqAXJiHV/GSH9TflZKBv6Gf2JpSV9diSzOAlR5NEtcUyPPDC29YvR5XisxFK0RARs0ZjbDZrSxP2JZ39KRBI9SfZQj8k/F9KIrsSj3+YwkQEp85LCM+aeu0IscT8Wb1ZuSnqARsN69q+fBLxFU1N+G5zS11cegmEywYv4mG03UJvxFNbpy9UhjGpfjLC9RMfRAyCKnN2oeIM1VxUwGSpujFSfymm7gP/cbkSwZMBBfBBAh8kdezjFHq9NcZ+dj63iJe0AIvTWXVPTqGRufg6bEWu4uT/NUzf2eSClXOxw+OBuLJ/egsWKYKDCF4gJWPphatJOihihYH5xAtctbQNQQfWXi9+/jgyMJBxLUdmLeWLas/iY7BLXZEgv20Y78ZcjdwTOsxLNcI0KeaJhPosJU2BDfYlFgNKBxQ2f/anmTGm+O26NwMD7oAPqmn3ztHOjHFb9almrEeqr2gwewsvMyESnf+96EYnEQWkmPHKncNGFp+5m00FQvtOayNtI7FoNWpT0wYrkuezCd2BTeiWWVBI6Z+Fa7elcgE4lro9PyfqcNiJjT94ZsXApmnYxegn+QZnKZ/HLoo+Tkshy6eiT95MG/O1iKlpg8JSj9ON23i0ZM7NRo3vkGPTodjUrr73HonANpsp1H2xbb42uVyrv83RqKXVo0dqpT4SPIrjsSyoixJvnoyvpy7daSRTA3SW8T+tU3ojirXs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(52116014)(38350700014)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Iq+R1gIc6ZM5bFw19b0kNHq85gpU9oOI2ezWUxLrybRkVQOPCR8hklhZcd0l?=
 =?us-ascii?Q?c1CX4K5ZX724qwI4gtBXEf/sCEEkKRN9J6vOkrqIQLJT8sq2DBcXzABJE9LS?=
 =?us-ascii?Q?hlLUarNojko2jnxkdARNQGhNTm4KCoh4DZebspCgDwl4CtVzQxyiPkusVZQb?=
 =?us-ascii?Q?iC+1LHyGosRagX4uDxDuw+glFO74GDYkWNqinLTtZ8Ywv6HIJX/GnWacgpna?=
 =?us-ascii?Q?lLOSNj6CSVkYmSvoHoXd7YLb0GRoQwGFnCbV94jEHz+wGdgic4YXmu3eXAAN?=
 =?us-ascii?Q?gFJcjrYLNdcuM9ESDquXDXDnMdTtiLFJxsoScCTY077sx/ivEtD20myeeO82?=
 =?us-ascii?Q?GiqYyZx/S1gSxuzS+UEss5YRshmxBdfPvX4ONNH16/ktUHo5aO/nrkIed76U?=
 =?us-ascii?Q?kMOHBL//vl7EhILJ7RHLrpxeqQWFR9I8oSZ/9lnVfi6fJBHTOeD6EZ2QiOeD?=
 =?us-ascii?Q?zBUB2Ae0LeYGmgv6dvx7dl9+MZrHmWgWwAxj1Y5zBohen8fdtRG2TqVlZpos?=
 =?us-ascii?Q?hdW25NljJ44QgERGJJAf7T7Ekky8WrB7R48yFQhwqv1jli1oJNPfEGcjnQCn?=
 =?us-ascii?Q?+n0u+S+08lqk8FbDXg7CxfldQo8VYqMBwc5KzFOIe7RrPIN4dH8wrWuv/enB?=
 =?us-ascii?Q?m6QPuJuHlha9I58pFJqqsy5hwK7nbycDF8UjOcJ6TpujO2Yq/ajcrFpyJRcp?=
 =?us-ascii?Q?khGttnYCj70O7NziZXhWo8yR63lCVcu1dI0ro4UjUmz8dyQMBNObVmyq7fFp?=
 =?us-ascii?Q?SWWIrc5CYouqnEOb7u/o4bskvZp8hEJxaCq28bKXnqtvBgqCC/8dOyzS1mkN?=
 =?us-ascii?Q?WYyTYDQY3Gr89paAdGrdT5LIFvUTb9XBR5BWCLdcS+bKXdXnp/I6aYxoDYbf?=
 =?us-ascii?Q?GPHyAtH8C5PeakHvixJnXEpueixtpaRBYJ3MCqklDhF38+RMMw5ih/9JpAoQ?=
 =?us-ascii?Q?Q90MOe0OiJMII4YbthXQgpavQB89Fjehhc4ebttbSNDimunW0H/aI7cKz9P7?=
 =?us-ascii?Q?A1aV4m7NzqDl5TQRolsAUvO/8AVBq5dARyt0xrGjDuNwhG2pJN7emLPvTOQN?=
 =?us-ascii?Q?o6yisM1k79EkTlD9czem3aBJSAaaI05E4dWy0ndq63UQeDoMj5N4dckbaTJ9?=
 =?us-ascii?Q?0rpGlwLNPRIv0KHFAiZAksyMdm/6jVhdABLU3FK3Tv+ON6558Vn++3pFsuds?=
 =?us-ascii?Q?F/yLLslhaIbaPX4kj/lGAlNsMs5O9Gk5Lo8Tx7mmGd9czQJpOAm/aI3K9nu+?=
 =?us-ascii?Q?svH2905V814uucEA2J/gyFGejdDsg8gKBtOsttPv2Lqa8fcIIqMzImwkDNld?=
 =?us-ascii?Q?GQFtDy6Zgj8uzmX1pe7iWLoocRkPXEv1uoGAzZ2yZCZl6JL7oz/Lg27VhwhI?=
 =?us-ascii?Q?3ctEkmRLivLjQfuHsKb8Q6qx0u4tnFOQENfib+YCTUSSqcPfuvEZkKeyJlV4?=
 =?us-ascii?Q?YTjkVlF+sOYcrZDHgIELaPyLX2YVP20ZI1rBkEak0Le5/O/WBp7jnzjqiTGr?=
 =?us-ascii?Q?yO519WW1FghM773YMcoY8wDPMXw+pAV59X6AY8eDSklnogm5gdTuy2HBBhLm?=
 =?us-ascii?Q?NHWyEKJm/7gjWbpLFM36wLXMPHHZzlhlxGAr3EWEw3WDS5RI6rqYw+MtCcg9?=
 =?us-ascii?Q?B+bd5FdDEPAUidtMQa+y4hcZpWItxsiGHM0TUwjUOepPoNVI99UGI6Pqd2gp?=
 =?us-ascii?Q?C3pKSk5zS63bUPuUlvFC/EhACPn3T/SsIlZzVEvG5CcneXTvNpsEc05R0J2g?=
 =?us-ascii?Q?52uKkAufVuEIKu1fJxks8xbrLMqp6v0=3D?=
X-Exchange-RoutingPolicyChecked: 
	RxWzjuBG8MlupGcfthYZuiEb5NHsPboTzXOS7IvPRAlsqyMM5CPV9YAEsKsJqtj8UMDsqHVZIg2azLpU4K9+VUxT1mF9ikwriKa5XRG759KxZB3d1fcoj/KlSMuXrQ60dwwolvb5kdeZwPUQ02CqlPkduFLdlzN7MB/u6q8tVWgKyZn6GJ2ZGgZmcAvBjm6YtNz/RKv85jomdB6BcVRIXyGzTo0di3y/Tori6cYmujIMNlSIUlrhPPoJesw6vOw1cVhzBbZwDQX06ZNTgYnrzGK3Wufsl/+7If4TzzqoDiOkyrOc8JYteED4aMcly3BAXV6q0+nwdr/za9AcV2cXlg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1c6f1c-6dc3-4d15-bbe4-08deedcc5f94
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 23:51:56.6965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +V7Zaq7/xQj66+MN9p/KeGHpTmFKvdjSRYErPzeaVmQ2naFvAqsMtyKJy9KWWFvcs5h9j45+AD+XEECzrEFZ9YXK7RiYw0veSrDESoPpGtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6183
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: GiZInAgbdNJ_mZqpI4JdHd3FnVqYJV4f
X-Proofpoint-ORIG-GUID: wgddIc139HBZV1yUUhXwMsKMlFCTFSbd
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a6a921f cx=c_pps
 a=Sm015RFco05wDkMfClhrzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=YcdC0ctDMGJcGoIPl8kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfXxaunMb/WBV/s
 ef00+/5b5VNqdd+vPaHaaHylea6bs3pIYBOLVHtfFs6KV8QOqltM4fxzjdFbQ8RboNB+bJCajrt
 Zdn4nu3+7HBJ8Dir4MpLISZW63N3Q61gQMRqufbeJMCI0u9wGrRf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfXzB2d3nSpXXMx
 N7ZzkTWvGHqn4cHLYiKvgkeMXvdskz50Yr48a0eKyf3HN1B9q0/9eufZmZNoBg2KKeWEAqEY98q
 JGUzbsZ3yV5WUc7Wi6Oc3nMr0O+1DYTDimAwbw3O+hEVTVjdEWqrOZJ82A/nBVCSbMp+jNAjIiO
 Dq1XNqNJmaIpinygNXakOOYzR6Fm4cci6SbArBBnnjWJUr3JGZSdZWNWrS6hffmL0iDq2EwXp73
 sONm0D6Yh7cHkbWTHNcbevYtXzRgrBWq+St1Vxm2sgHpEduojvY6Vq7bMfwv/gF6PdWFPjptVg0
 t+e6InBiDgdAjiPWVLyi6cQAfauXq+DcLIOaRsu5AJceV36DHgFaAraveA/tzfQVBD+JlsMc4UM
 ibx/HMohOMBgkfJekj3kfhs78O01Y22XQwSYc6QMdHYZgPmp+IzdxxxaRBHDA4q69VNoQpMttNH
 SdELyu8wTETDFVr8H+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 23:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242300

Fixed:
$ bitbake core-image-full-cmdline:do_testimage
%post(busybox-1.38.0-r0.x86_64_v3): execv(/bin/sh) pid 679
error: failed to exec scriptlet interpreter /bin/sh: No such file or directory

It is because busybox and libc6 depends on each other, busybox' elf files
depends on libc6, and libc6's postin depends on busybox' /bin/sh, the do_rootfs
works well is because dnf-native has set RPM_NO_CHROOT_FOR_SCRIPTS=1, but it
would be failed without it.

In rpm 4.20.1, it let the installed files' Requires win, so it installed
busybox firstly, but in rpm 6.0.1, it let the postin's Requires win since
postin would run immediately after the files are installed, this does make
sense, so it installed busybox (which provides /bin/sh required by libc6'
postin) firstly, then we got the errors. I couldn't find which commit made this
change because a lot of files and functions are refactored during 4.20.1 and
6.0.0 (not .1), I also tried bisect, but failed because a lot of do_patch or
do_configure/do_compile failures for each build.

For libc6's the postin is:

  #!/bin/sh
  if [ x"$D" = "x" ]; then
      if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
  fi

This doesn't make sense for libc6 since there is no /bin/sh or ldconfig when
libc6 is not ready yet, so just not add ldconfig_postinst_fragment for glibc
to fix the problem.

And also remove the workarounds in oeqa/runtime/cases/dnf.py, they are not
needed any more since the loop dependency is fixed.

Similar to musl.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py                    | 3 ++-
 meta/recipes-core/glibc/glibc-package.inc | 5 +++++
 meta/recipes-core/musl/musl_git.bb        | 4 ++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d047e41a78..8ccd89a190 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1853,7 +1853,8 @@ def process_shlibs(pkgfiles, d):
                     if s[0] not in shlib_provider:
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (pkg, pkgver)
-        if needs_ldconfig:
+        if needs_ldconfig and \
+                not bb.utils.to_boolean(d.getVar('SKIP_LDCONFIG_POSTINST_FRAGMENT:%s' % pkg)):
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 3d721d8f69..bea841b047 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -298,6 +298,11 @@ pkg_postinst:nscd () {
 		fi
 	fi
 }
+
+# Avoid loop dependencies between /bin/sh and libc.so.6
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 CONFFILES:nscd = "${sysconfdir}/nscd.conf"
 
 SYSTEMD_PACKAGES = "nscd"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3aec643c40..057113bf16 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -80,4 +80,8 @@ LEAD_SONAME = "libc.so"
 INSANE_SKIP:${PN}-dev = "staticdev"
 INSANE_SKIP:${PN} = "libdir"
 
+# Avoid loop dependencies between /bin/sh and libc.so
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 UPSTREAM_CHECK_COMMITS = "1"

