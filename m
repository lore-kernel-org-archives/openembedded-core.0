Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DDDD61021
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19189.1769704785078764256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aKmnJJJp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T6pcTu2809558
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aP3o11PQx6ZniR2FJ5U/IO/w6RahnFHYk61cZ8mU8T0=; b=
	aKmnJJJpVdIAnO0hsjWoB092U6UnA8Z81GIfsUtjaSFeP5nMxLGmJQZSaazmLGzQ
	B5LeVoP9G53yzTlUlgv0zvwu9ICvJZAvJ8fe2RdajZsJp9DN0hGsx0HPamNQKkKj
	H6T/joG4EeVfPip3Iq6SvTXdqrh5uACUWeyMeDqRG2EMxwWXHx3rXVJ8bQxuOO+4
	86gg9BMk2p3SsI9GB4PzXopS1E5IU+wtOAe7XA9YDoxRV020DndxS6kLNBZZkmUz
	hkr0J9wMGQHyDIp2FzUNT8YXnpY5mKh6OSRt6TBRp+kFFGgtYfdhJzJ+R7RbdXLo
	IUnLGyeUjXUN7t9pxqqgow==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwjgswc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 16:39:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OX5JBaraF+Xg5Q3itWnmx0ab/iuvWMnLjR2Hs/zYgHhfXMoL2KVEC7eXOAWTrWetN864i7DbLRrzcuPYaO0VuFXulikCFBCa9adTM07GlfGNq2qhewDvDFi3MJGMK++heykW0bIF61Z1J2F+sSZwYApO6p2w/jho+YNNzWWF8cEG4gu3t4erLwM36v2cai+QK49v9M4Awzu5XQWzy/jcfWy0pNzFm7XQWwvEmubZI8aYdVth+LB5MsPuYAtc/bsnhg2ryyDqBNT5U0ycRBQfZBEC9VHFBWkbEGLkTAeBAxsXf6eAvpAzGMNtH3CTyijjWY+VdDGDraj80YvA1vpDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP3o11PQx6ZniR2FJ5U/IO/w6RahnFHYk61cZ8mU8T0=;
 b=obJGtr/MP9jOOKzWHGR0MTlfQXvaIo9U6wwCpqFSGrPlNdCUWTCJmpTZYytPbzqxQjcX8iadHHwaQ3Vcv22sAsxjJzGito39U1E0QPF/+HlKhMBi9QtktisK1ZfYHe6CMoaWnTGb8Q49ETCbsJTB2wgKgDyP/d6kGj9Bkv8GJQ6G/7hnfLYtwfYTIiat8fx2lvNRJvI8Ukj9KbLPr549uIwf5iUN9Z6c96r9Lu6UVkjrm2eYDTnOX3bBCG4iVaRZ5V8M3Hj1Kjhzv/coRhzP/sIf4LDQ9ZiBYzl/I0qQ7pIQoLt+tFK0ZXNgUoRvZoj8frrKab3YEy+5r2xK+8v2Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 16:39:41 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:40 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 10/15] kernel.bbclass: Copy include/config/auto.conf in STAGING_KERNEL_BUILDDIR
Date: Thu, 29 Jan 2026 08:39:05 -0800
Message-ID: <20260129163910.2612040-11-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b6c3bf-809e-423a-4c2c-08de5f54ffe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|7142099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HcgJc68mHm1JD9MJzLJyb5g2cmopZ+jo/cWS87rE/nn7+IVS9VV9clZSTtud?=
 =?us-ascii?Q?qvY4yu5oErj/jM/pjThXJsxIWqpsTNOB+R6Gw6FL9xEhrI2F20z7CrTAKC3P?=
 =?us-ascii?Q?tXZdJq1uD+eSDze0hx6Gwq7zKFd8epd2zDnGAfLCljgFGgOusEk/5ORtHWe8?=
 =?us-ascii?Q?PJbr1G5o/kKvXuFPjHeaZZGVw7cJiM7FjAjmBzswWuYYTmUwh4Odh3cziUCT?=
 =?us-ascii?Q?zTRT/YmOLicVckF9C9cJugqJwZQw6DQhR19E7+sMeceOHZ5wJgIaK0al4vEN?=
 =?us-ascii?Q?vAy4H26KzvyEW1nZxiuHlATyFi0u7yFuRyC6tnoMWHM+2iszmEI+wWMI5PFi?=
 =?us-ascii?Q?x+lYY+/rSo7vJJSDFdo48kYmiS/KROl2SMRFtZdq0zwYQATiTg2SYDEeb+Cf?=
 =?us-ascii?Q?dCejWmyfDs3qCTwHabGEaeeAEfsEFbMA/+NgAWEPuAYtLcbdd9z3N9o2h6Yb?=
 =?us-ascii?Q?/Hbv5deJcMtrrMU6XQDesD2ZMo9T0PeAqw7wJCzdFeuBvjJrZhhhieidIqRQ?=
 =?us-ascii?Q?M1GmFUFfQQD6ueQhyBGsyzjf99YZjIuDPJDhA88Hx126Ox7rDWAa4VEKC5DE?=
 =?us-ascii?Q?mXyF8QXNkqFbffaiYi9FP08H+jpe5reD6zmdKv+JTX3mqQGwF0223K9C6Efm?=
 =?us-ascii?Q?4Tfiif5QC+0/J3iCrpvlAMWAGlR12QTpTrHIcATlmOBVCAvLbGfl0opRjDVe?=
 =?us-ascii?Q?hiZx01fAS1y1aHwHyUiG+oWGaX4wsIgs/GNOFwnLWkqHsRpS07S1D4LFN459?=
 =?us-ascii?Q?vHDQfXljDWk5/0h/7m74f2eHMKeGorQBL6KuIddM9UAlh5IsfuabQAruJnuu?=
 =?us-ascii?Q?NznBkXkvlA/pM7SZelHeatSfKehu0wPrVQLPt2cIJtrnGdmhPi58FFIpxTUL?=
 =?us-ascii?Q?mU4iIzrsRFH3l3zTYh6ES1/6KHGGQxba8wW1NHqvhNP+Ul0WrpQFv3eaYCVJ?=
 =?us-ascii?Q?wwMqHM+6oE3S2amcqzXew0pq0wipfmrNtCn2dkGsKR+Y+esguuZU1ihzXRWj?=
 =?us-ascii?Q?rs6U53+KjTcL2kMk7wgr2vtDwzUoxAjspS15Rz5KDqiVrLDrlzsromIAllW8?=
 =?us-ascii?Q?f+pnjTBkR5UWngK2W1f8X3MGVeJdtai6FnTlrlPZgxU/QUOZEKMLinYzf3UD?=
 =?us-ascii?Q?muJ4RQ8NsA//mfaDCtoivLF1LfnSPvV+7NWc8cX9jmavHHde9LtPJfCNgA9s?=
 =?us-ascii?Q?pAdiKrMvaAPR+jy4wQtH8wMTAlCd16QQO4TTayTk38IvcbFFkdsPowSLm37B?=
 =?us-ascii?Q?3F1cNJgCRL8lzHDCdk2ic4L+LmuFyeG0CBQFWconBZ/nLGbqMJeIV5F4sIQ4?=
 =?us-ascii?Q?qcqYZekx2oAVAMuKI3uiEUS6xVPnXkNcy3JSwxapA2qSTdZ76A6VPgTF6Y9r?=
 =?us-ascii?Q?qtuAyO6IpWqNRf9tn+LrWh475w26mhicm8LE1k/FRKF5zAU3vPxw8gHl1Rqw?=
 =?us-ascii?Q?l4zsoZIXOtY7zhJi/82t00DFsD+ZqDPZ74Tx4hol1cZFLVA5TQFeJJaJHS0I?=
 =?us-ascii?Q?19Hoxh7+sglX7GsxMsW4bTyHkcl5uM9IB/hIVqQTDUt+1dIH/vV4k6FofWzg?=
 =?us-ascii?Q?+McBwNtfZKcAwhDqsOY4eFb77lEt9yk5PQFdt9bs+4+Agi0tXEF3wTSQPGtC?=
 =?us-ascii?Q?YZ+gh+qtk6oL6LlrnzodDz8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(7142099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3+Qp7narD+RWb0r5P1WRFiByr2n9Yie23EqmByHRgUxCA81vUQsMWVLnsZuc?=
 =?us-ascii?Q?K00f0S2Rq5QnNCuiPwXufd9QaTZ8DY+ipbjGRAa/JAzcWpgm+s5WqTdPf5ZT?=
 =?us-ascii?Q?Qutcc4pqIYddioKxUMVrmhMj5m/yMXoNQltP7LDtR8ooL8vq3hm3BFBSnYEH?=
 =?us-ascii?Q?PaoTo4Qzg38F4F8pTyQFVBv3e2i99TYXcWka7liTqX04akLyQMb7NBYWAlxG?=
 =?us-ascii?Q?rn9eiJsdhnQOxuzDfFSh4QwoDE8a/u5qKraVIBOq7sC3JkO5fmH6QOlIKxt3?=
 =?us-ascii?Q?fBlI0ggHlkJr/+dHR9WBAhyQmjbk0YBcWqdvuiiz15LEQjPr6AYraDlQchZ5?=
 =?us-ascii?Q?aJjeOOAUn0I/1b2GP8yD1Rb63lm/xMnTgcJznrJ/f90Zei0nUnLYxIBqBrrZ?=
 =?us-ascii?Q?9tCkN6eBKW/u10nTwS3GIpEFJOlkmf3ri5hysCPs4K0/xJ8SOw0y9WXjWk7r?=
 =?us-ascii?Q?09OBo+8WFS15OUyV6mxzS9GL9PTeV6JGGlxxkceCME6W/4fGpvRZf5WBkWjK?=
 =?us-ascii?Q?uVge1ETH32Ej7ZyXjrSbxmeIVc4hTg/Y+OrhilhYnWLWHXlPZ/tYZa0pc8Ke?=
 =?us-ascii?Q?KKk7VjeDG0bhfLVNmSYADNsno31Oy2ADSjnEFPAsx85m1EzjuhBSp2y/seSM?=
 =?us-ascii?Q?s9+0IrUWtnlooSEEUIza+gnb9HBpPfjJM87AgYPFp6OuThRAdQ2CoEYxB1UT?=
 =?us-ascii?Q?FawiyDm1Thxy9j2OA7qEIH30VUQfPuygiISFszLydWoQxnb3Glu5p0kYiy1m?=
 =?us-ascii?Q?GFo5G6XYfTdGVPk/JcPJ9x2vl7E7OY4XleaCcTEf5QxXFNyRCoZJ1MlmR2AT?=
 =?us-ascii?Q?nn08Y1rAAL3GLxa6FKqSSdfPmJjH0yHd+CcSwYJwuZGHfBSHsb621W4TA007?=
 =?us-ascii?Q?pNlB1H27q90gy+e6S7Ph1xf+ZLALyyQPyXWoSzSW7sR1+uuXK1nuxL4OZNId?=
 =?us-ascii?Q?4OgeD/Qq3rlE6IWRS1jFXKOMrMzuYnrCqCu2p1MiEWVec/0aGpFtyUv0uRls?=
 =?us-ascii?Q?W1vcChWY1INXCln18mv1PuB0aBksqV6XfpdZCUaTTS1qlj+IXvHeBvD/kVed?=
 =?us-ascii?Q?SxpcyAkBTVmVhT2a0SG9Q+qb0EJLXHfq4h9aKqK1n7m564za53nRF1QbJQFZ?=
 =?us-ascii?Q?/zMbDhkjTxkwmC7Km6PBjWamQUWkImGTKwYoPx+at/Egwdd5Xrzmi5NKICG6?=
 =?us-ascii?Q?HjK7PlRdV8i1fYQziz/K/jUUcAdpw+00VT3baA+qh63BJkppg8la3e+70Xvc?=
 =?us-ascii?Q?3UCG+h4oo0b3tCAuNn/u/CSuuYaJ4tWu+Ffb2aO+a+qhcWjMFWE7r/geGTn3?=
 =?us-ascii?Q?zD3jqxJwXpG2mCdEBLizlmY9UpHuGUTmaoqr0yrRe9l7Uy469AelLz2e0joG?=
 =?us-ascii?Q?fJ8jjxp1iB6x5kOZJkFCOOrFYLy9/9lwBQdA+cfTvYsduvXPZvU2Ydspr1lX?=
 =?us-ascii?Q?USP2JTcmpWktVlxEYYArYnnyBYbH06yHOv0a+d0A81jH5Ic1nWxDFMzj9HP1?=
 =?us-ascii?Q?FDbghkHHTyh+JdAip1wCHg3iCko6NWeOvtfrZAsqAC+v+firYGTaecO3H4rt?=
 =?us-ascii?Q?ZDEmCyXjTtr7611jNQcBs0C4FoQS/+elZGiXn3sj1sFYS1GWyAkP/iTuxSXv?=
 =?us-ascii?Q?7Tk/1qlKAorsl6gWLrBhG/v6i/0SiJdxYaM5/csnnQBr6MbFl1Dh6k8EeS9K?=
 =?us-ascii?Q?n/yVxu0JVkgfgexjhD9nYlygCLSKY+R+UX0xDfMt5dHhITtgEBQ17qexSsA0?=
 =?us-ascii?Q?O1+LZuhAziaNByT1M2cn9/E0ZhNtN8U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b6c3bf-809e-423a-4c2c-08de5f54ffe1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:40.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCTYWYuLqsJS5rh/eLgOkK8b806A/1CtmEPjb0PpXQqmFH+lKfSBh6MscGDyD+qiAYLG7ZoNbSPk7qRJ2fpiQC1ijdV7c/woGF1AjjtclnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfX0jp7mnLKHb6K
 zz/mlmvh+H+Nw3kHueystCgCCBvoigm11w1c3RpeCI7TKZZFSDUrR/yHKz5p7lmHFZbITb60QXn
 PLqj+cetxSM8KJXnPGjlCdEDcUgjv2gIxROLhGbEcmz+V/190sOrSsEqS6HfEJCAq96j+guxWJ9
 Av7rT201lGVMvs5H9/6fGrwi1QHfa/dejIXrSKLGjYTm7TPLDoqYh9GAHSCUawNt1WFmjFkhB6r
 mVtDLgy17JzZZTQlcD5/MzIIZEZGSiVLkiaYHfK2zDgUJWkRvgzInl6iNlHZUpsRJxk8uRsGHwQ
 Lu6mVLNRLpChANpEe7m5ZgbaSUcds6i+i6HqG/avW7NKAq7L7m5BUgoxhRR+9MGnM0wr08GgOW7
 QQTwjfvZVWFkce1ZTqP3rYVfz9egPcadUYQdNCoWfq/dGDwm7tgRDqHcyNnWlxy+RPbOzXYLPWP
 l73h2qPmc+4pkDKBMcA==
X-Authority-Analysis: v=2.4 cv=I7hohdgg c=1 sm=1 tr=0 ts=697b8d50 cx=c_pps
 a=V3ntuBz9Vw3KuD7vyzUphg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=TeJiQh7uZb9NdfcNB-sA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QjLsYkvHW4krIvyI8WRhVoGBHkzImBpf
X-Proofpoint-ORIG-GUID: KB_rxWPSPJTZA7VfrHKiSUPzsM8yrR2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230152

From: Yoann Congal <yoann.congal@smile.fr>

Linux commit aaed5c7739be ("kbuild: slim down package for building
external modules")[0] states that include/config/auto.conf is also a
file needed for out-of-tree build.

This avoids this error when building an out-of-tree Rust kernel module:
| make -C .../tmp/work-shared/qemux86-64/kernel-source M=$PWD
| make[1]: Entering directory '.../tmp/work-shared/qemux86-64/kernel-source'
| make[2]: Entering directory '.../tmp/work/qemux86_64-poky-linux/rust-out-of-tree-module/git/sources/rust-out-of-tree-module-git'
| .../tmp/work-shared/qemux86-64/kernel-source/Makefile:779: .../tmp/work-shared/qemux86-64/kernel-build-artifacts/include/config/auto.conf: No such file or directory

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaed5c7739be81ebdd6008aedc8befd98c88e67a

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index f989b31c47..30a10b0801 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -570,6 +570,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	cp include/config/auto.conf      $kerneldir/include/config/auto.conf
 	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels
-- 
2.49.0


