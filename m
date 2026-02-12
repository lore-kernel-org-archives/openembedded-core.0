Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79791EEA845
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:11:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52117.1770919898172504910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mnc7KYYr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C5C16i3049776
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 10:11:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ipUJQlymb7LsVfHv5FEzOss9ZqEz8ZXdGDkGeKekdk=; b=
	mnc7KYYrR4regPw16wM0l41xfVdvRpUsqASJDfJ4jhzquqPyfWM9MQ1yqAvoyVju
	5QBHsuEyHLc6iTYhHpUnTmhiQ/M1QkWfkhRRtEU9pZSnQCpUy9NwiG82wDxJ1o8a
	nYPJ8YAB5DD6/bE2r87WfiD+a5UKGpkz3oUu5zrcicX+7hwniheSaWbx4GNRtSFV
	RfvmMnN2pwvCia1fruJrHHN3BX2cQKK23Hm/qOhn11Bn9olqluJ6UjiuebEPn5ka
	yoCwDkGIHQdYysY7pxWwCV7bEwZJGMPCYrm80I1kHklTrXNUXvjlJzMNfUFMoZej
	m335VM7m3vsmsNydPeEnGA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj66rv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 10:11:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBeYWAt2ytQgJCSUTlB0wLV2llVTiA3AcJUmkPDVxvekMCaQF6Y6G0BU3V5l/4x106SnMt2MmBPEVonnxNUzTlkfUqENS/2wYLZqOXYLk4e8+fk14rQe74a9vEbICcZhQ+JjDx3xEanC9SI/fqvtiW57ZiK31ObPos683RV+4Tbt9o/EYs92r2hv0WdCr0RjVo/C9NFhsPbYaEJSYq/ec+97XJ+cron4ZrYrpAdzzKqZqxqRmvHGwxvRgvXVe4bCGxmMkFQaLviWLh1Lr4mAa2XCQDizxA9F9HuGAESzchiZn4Bgtj0MGR60qv335WcG3Jy1ENrjtG/qvvCx/l0FBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ipUJQlymb7LsVfHv5FEzOss9ZqEz8ZXdGDkGeKekdk=;
 b=rQALscnbBlobkN2PYjOv3JxKlBTwpt5d3v343UfhHuK3JLIE38YVTYjJh9Co949x7gSIc1M/gS9rsa4hHtX6A7oQw1Q1Qs66Zg3u97qQgksloLsslJ44w3Ic3VIPdvwhkBUuQfcHgtH7AjGqggE4E7SkZQ7ctn9FQsPPna4pBsAXT0JcpmyG2ey9BFB14vZX1yopBPerTnZqR0+neFQLjounkFffOlZ+jjVcMaojIgxyLkWlO+ijM7dKl8vKFebOSRlzVOHHvVDA5HBmEFsfeATjJkpORcKCOQP+GKj4nbt2x5A3zobjSa4pNSITZMWv41NGFSxPpXJv5UZqlHgd1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:11:34 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:11:34 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 12/14] meta-skeleton: Add rust-out-of-tree-module recipe
Date: Thu, 12 Feb 2026 10:10:37 -0800
Message-ID: <20260212181039.1826154-8-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc66685-2201-42bb-ecf1-08de6a6227ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X1QbDdzgH5F99frYsk+gC6xf03qSLpcdIFawkwd77r8HuhGv5q8KPr1M4S7I?=
 =?us-ascii?Q?cZSCmnKQrz7lytkSChzMJe7ZC+L8GuULXxOsvliP35rJJW20bHJ4mkjdOB11?=
 =?us-ascii?Q?e6SLK0vLU2yCpqV8yjcf1JYw70DlOGqVdL399UGQ0ipaX6eYBts4rID8TWUn?=
 =?us-ascii?Q?9Fxk9HDZMOOicPFNp9VVlCXAOPh9seZXTh8BtdSl5WzWKCoDlBZZx8nOGm0S?=
 =?us-ascii?Q?qsnWKebQLSaqML0kvr1XyUBZdZgyKSABf/bj9EoeLUYYUY9nOB0Tn9uUNjp4?=
 =?us-ascii?Q?LF95+zjHaM2ATewCXdJxKStqv7H0gDbgaZn7WgCUCUCrcO8DvHuQaH7xzE5B?=
 =?us-ascii?Q?vg4fS2Gu4Ij3612UTuYKUCpVTmbRtWCj9JGnz4n8bk/c8xIIuR+lQdmIZQT4?=
 =?us-ascii?Q?PRd6cksRt6lp1+LYnZWybtjwB0ACcXWZjYuJvzqHkzvtmgv8ClLaTOHfeq8o?=
 =?us-ascii?Q?a34KhYuBXiJm0stUPaHg3YFmlHPCdikCwgTg3EOUo9A8738VKXpITYuY8Sa3?=
 =?us-ascii?Q?ZQo2iBwdvdrVZqdRQufJxgBe7KCR4iAEEC/Mm16Ud5uGpGXQWaNQuOswR8ka?=
 =?us-ascii?Q?4L1jqV2v6LWLf+JPPhoI7+IoqNxK5NVvBSL/NdeZ4KpazWiSPZSkLUOwuW79?=
 =?us-ascii?Q?dbe6Uw0K0VmtOBzhPq7a9EqeL2TJXVsWzd0JrdIEAw0rSuzkuvV9McwaebEF?=
 =?us-ascii?Q?4HIN6ya96Q4DR3g5qOHQHsts1go+ZxtLLPe1oW4j104XChjlLSmF/OkOa5iH?=
 =?us-ascii?Q?8nNsvK6Fzh0NTaeGCEZrjV73P48nyC0v1LzU4y9LogYl9zNEFcbeFaFCVANm?=
 =?us-ascii?Q?jAlfplguCOu1vM19UTqgfDZXPZJUuwvm/hnWW2dmjrYM+AR2JhgREenfpdmH?=
 =?us-ascii?Q?GyW0FnOygoqcWFhA2POTwUBrvBD1IxvsCYfowYjjA+rWzGe62nfA5bl+1VW3?=
 =?us-ascii?Q?f/TIeia13OgcGSBz6O9QT3Sw8usXWddfcsEwF20wz8aKMmpiO03Lpkku0eOj?=
 =?us-ascii?Q?p6EzlE1J9vZxdQfdFaxBRamX16+2xobbY4JZXZo7J6IIoom1b9S4t1S2u3r7?=
 =?us-ascii?Q?E34/z1Fd0D4aDgd6B37EgiadRoHUXERcszAiZRgdcB0UiMXlyIPvlHcFo+jE?=
 =?us-ascii?Q?LcvusPUb/5EpsEPwVDNXEmo42PIixqwFbi+Lh2Zmgw4BvQJd8omjmYJf4DnW?=
 =?us-ascii?Q?I1jylcbVbzf4Py3If/nDdVOD79uHManFnblDWRJ8txD9561LJ2BjygGM3lMB?=
 =?us-ascii?Q?olc3XbqJr/7LQjh0iTau0lOrq9UE1cOl53IhuJQwyTXUuO002y7lcrcq/5Tg?=
 =?us-ascii?Q?wx76g+OCl6v2Lwn09Mh/VcHE+QQ0pO2C8PIPyPWuWupKb6VLmnYpl+NUdK5E?=
 =?us-ascii?Q?8IcV19eAZShrCEq5qR4O19i6TNPsYfBy1BszVrcYxUJ9M8u/Zts9P9x4rde2?=
 =?us-ascii?Q?5Turl2mis9Snt+qnoVUlHhXyFHz0OIBMsxtkVfwYMlQ6MzdplUrkwjY6EwdK?=
 =?us-ascii?Q?xRGdcZr9AckfsF/rruQMbOqseu0D9gFwXCP0xIHHYg916LpIDOQitOw+VDZB?=
 =?us-ascii?Q?rottKg+uHXvS9krg7UrKmHu2Q3GwxUVmFRf95tomQRGuOuOq5UGDSHgnj8mu?=
 =?us-ascii?Q?3COJUf2WhwKVvqfcmTXA4VA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c+401WhjsIF9IuH4smTYMHrtHtA1tS+8O1816EA04wm8Amo6+zMj0QNuRs7b?=
 =?us-ascii?Q?h3cvBY9xv54qSHGvPmCI03+ms989ebNXpW3hXL5Vh63/hf0GYa09xPQB/nvz?=
 =?us-ascii?Q?9gXm7O+N+3kSFFPTIm4zBY1NsX47sX/isJgjE7+alkBYEhYMqELqYWVsNIWR?=
 =?us-ascii?Q?trsHgnvyq0ZGRGCeSb0/txeqywsTJzOO+N82i8HNaBeVSjLgPoFd5uwElSPo?=
 =?us-ascii?Q?+V4qoBS1uGFXsOllG9jdX1uphmVjspWdzIHV/ShHzpjzXorhkvU1fHItXIM1?=
 =?us-ascii?Q?1qeHcq1SIC0G5TmvHCpWnt6PzbdvGg984FAVIVEb9UTS7dim9rtnaduBgxhe?=
 =?us-ascii?Q?/MqDtQc+NziTl0VN2IXsaOxaDiZyx2UY4w55l/g/Rob58yAkbib78cdczriX?=
 =?us-ascii?Q?PsCjrAWIB0YqHbw4jCijCytiLa6Ve2h+iLsVlSPNxfnd/8quBHARx0XUkXI9?=
 =?us-ascii?Q?IDR6yrA+aRbo/F1H4+cFYMPuvhsbsjDzEEXXU8XNzw27NNLAkrZzsXUR6X2p?=
 =?us-ascii?Q?OE69BV+UPOzJuqOhRs0+nLqi6fQ+nKrqaFgsx8y2LfGuH3Sx8Gfoes/sXosd?=
 =?us-ascii?Q?n+i6g3c/HLw6rWvoZl1wU0PTXuXIvFv8F8eUXzZQoJV6JSqQ+tIoYmFl3awt?=
 =?us-ascii?Q?SSoRuHoul/HD345BzZQPArJs8qKzVCeIRL1ipukjDUoxlq+BKm8FLydo/25j?=
 =?us-ascii?Q?r/HtyR02L7Q42K6usifyfrnu3FFHc+b6gMjvsRnMPtXeJfmoOmoW8sM717mC?=
 =?us-ascii?Q?bGt4rXY81Eb3gqpcweIgpxaCgEKqCQNITG95ySo9HYEFKnC7d6VeL+kIbhAy?=
 =?us-ascii?Q?N0gtvcJsoWvly5eJMaYHqqDnUYCFPhxNqc8rMUdXY8yfcIXZ04C8DPJ4hjXQ?=
 =?us-ascii?Q?h8QMymPn013weB8sxFopl9hM5JcsuEz7eaU+lm+Rld4WTI2UQ+XyPDSgG4cB?=
 =?us-ascii?Q?aUHL425igWwt8dYUtgxgf4xZjB4My/mTeZYT7HmgQ2mAaq1Cv+XDrhrot+GW?=
 =?us-ascii?Q?KQRGqWU9cvLKUzlJ4yoyXH5H79ld8ThMvmlNxv1qkAalFaxsjYPc/RlIXoYw?=
 =?us-ascii?Q?O2iC8OQbQfUwvQxRoD/j6tQ6fqclpPGFIQpwygJGa4mD+1HBHX2QDp+6uo38?=
 =?us-ascii?Q?byyHxtuxRYV2R/6fO7TNgDTSGvcuNSFPS0S+naTv/JCGCUo6Lq/+MpPf0nGB?=
 =?us-ascii?Q?Zx64XUBLdfMB3iar2mUMagqSDssERJhyQ6NLoIHZQwW85J/9qx5JPSvEH2UC?=
 =?us-ascii?Q?hKqz3LE1/oXwa9U1AH+5KFv3gj5HAqh4OuPn/MohnTXBqVda25cU+s3nK3dc?=
 =?us-ascii?Q?1CaxWiVIA0n+sRkZc6aVztjlm95hi3D4rfjDJBpfo/2TG5fwMtJ2uxz2u7JR?=
 =?us-ascii?Q?z57okzC5hJRkfu6LGWTsYwZGkR+sNeMfSFfqLa4QpGo4V29y2mfbRJXYte0I?=
 =?us-ascii?Q?mG0FSpCnGi6WIkg3xlRHRoBrVkS/5mQRdWKXBlZmHcqYyTb9GmaIp1O3Pgs5?=
 =?us-ascii?Q?EOJtWRwlEaacteIr9gj1q3wCqJUTcU+tKqdozEZLKIT57S1F9MhNpE5MaAz4?=
 =?us-ascii?Q?/7x6tpnuH17EQrIsG+t/0VKX+gHy16WvYscyZEUPFvtC/c2DPF9JO0590QgR?=
 =?us-ascii?Q?r2c9p+BQOtqRzdEkAdfbjSWLt/FyFvn4P9RCmlOqwDyNol7eR5a/1CZ7/6dX?=
 =?us-ascii?Q?Qe6BagClNEBSeTQfjCeTG0T96530WqIn+j0D4y7zj5xDfSSyL4xC5V7Egcgj?=
 =?us-ascii?Q?VWYx+cgc/yTA5qEcXOSu6MECgtXkBrk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc66685-2201-42bb-ecf1-08de6a6227ec
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:11:34.3752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3H0Z8HGP1ZaxYnMZVFTq4b4AaOeAE8DQp3Lu18L6I39dD2rQbNkBHVP0/LnYzIgDwzKPD0/HauJ8BCj/LHuW6T7aHbHP80Qyqw/HivU2hYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: xIdnza1r8ZxjRfR661gqC5nu-PtjifxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MCBTYWx0ZWRfXxzAMk7BanvRj
 hZgyQvyLPlYZ0UVbB3tU/5PtwhAO3kSAlnC0VArjG1QzgvSOeU62RHEhVxTvhyPSjTo9Dg3IGfc
 EfLu1ylWQBnJP7kdbNWBzSPgmm5nJPb6ida6shSjLZEn9gb5kidHBAhO+YsoQcr9C3dXQsm7S7O
 1QdUjgkc5KLWZ+TyNaqSf5L6ZQ+WoJLA2ZMZguWH4VsY7AyYhIQi4EHUhf+6T/A+iBoWVlsGTLT
 p+igguZvJGl2HSRxrRCrG9nvD9kolgCydrHfe1cTxz2E+zwwnDRCPis5+GwCUFtRSnz3HRhk4W2
 exH9oW26rGbBxSpoDg9Xq7IuYBuIZ6myhgfZqPeSV5P5Trn4dJprojTpb8rx6+314Qd/A3IGfxS
 XB3HqYWl/ejWZrrRp8gj+rvYCEdQ7TkHheAf5yUUAhmLHp0r6A+Jnv6uZ1vecTbffpPkwXkGvtm
 S004ahcjaXOD5TjkpeA==
X-Proofpoint-GUID: sMmn2oIP8i1INsj49iifl0tmZE5V6ZtU
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698e17d9 cx=c_pps
 a=sh1HRyDNv5RGx04/W1QObA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ROIJiIjWYnIpTvY2ysEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231068

From: Yoann Congal <yoann.congal@smile.fr>

Basic template for an out-of-tree Linux kernel module written in Rust.

Mainly to test Rust integration into the kernel.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../rust-out-of-tree-module_git.bb              | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb

diff --git a/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
new file mode 100644
index 0000000000..077780a192
--- /dev/null
+++ b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Basic template for an out-of-tree Linux kernel module written in Rust"
+HOMEPAGE = "https://github.com/Rust-for-Linux/rust-out-of-tree-module"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit module-rust
+
+SRC_URI = "git://github.com/Rust-for-Linux/rust-out-of-tree-module.git;protocol=https;branch=main"
+SRCREV = "00b5a8ee2bf53532d115004d7636b61a54f49802"
+UPSTREAM_CHECK_COMMITS = "1"
+
+EXTRA_OEMAKE = "KDIR=${STAGING_KERNEL_DIR}"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+RPROVIDES:${PN} += "kernel-module-rust-out-of-tree"
-- 
2.49.0


