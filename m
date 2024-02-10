Return-Path: <paul.gortmaker@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E516C4829C
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 22:38:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.25615.1707604733056890767
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 14:38:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JisgJLOv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2770c70da1=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41AMcqDs017699;
	Sat, 10 Feb 2024 14:38:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=PPS06212021; bh=xl8jWN+XW+D8xhij5aF
	0HNU3RvJ0QR/MDT88y7bjKho=; b=JisgJLOvKTZUxEQQ11VhtM3puubJdyuprTW
	bwjrFBFft/O6+DuajypD5m1VxQRvtkCyEybrq/EHTl5/z1Q8W4vT990wydcbUcDl
	BxcdxUa6I9IbwSX0VbDaRffjY8crFY83lUjWRYIO8r5rJUE9x5mcpyEEuqasmhU/
	k21wQs7dKQKPAAIlogKRU+zV8vXf8XlnWxriMvj5yhhqFZ0qTXviSfMXzeAPSsSF
	ByI0FQ4vwlWqDGS514BpMwYPFWSPDS33FS/pJe6+kBJKMXJPwp3mn320cgNcuB6O
	FoIFaXbkFwXET8L7q1IaFGWCyVZVp10x6XbKqiqCVfj3WQas5eA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w65a4rd4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 14:38:52 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41AMcq6k017694;
	Sat, 10 Feb 2024 14:38:52 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w65a4rd4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Feb 2024 14:38:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PL+2Pe5grsuf8PwEhetvVsFMWCe4glLEEsz5yli8p66oiNQ71XapuFzJkWm4vWvJ056vpNDOZ8ruE0AhnFLgKZDFOREl58w5SJqVouLXzdbGKTG0GU2Q+5uzMCalQdM0TYOWwyW8XPfap4n9I541gWKN81wzC+DRf2PlWoSvJljjQAF0J0qP1904H58lZpCO3dHtpv2F/5slry3mzdAB2bYrdRZshwUU57gHQQcVl+yE8ZMzn27U2acetkHC1m3OCI5JLw/lkbJPKtNjDOhIVq5JYVFlHQbjIlX5YQ3PQfRHhB4+RFROz74HYwSmGVT5dbGCgl+pUefIIkUSRnaa9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xl8jWN+XW+D8xhij5aF0HNU3RvJ0QR/MDT88y7bjKho=;
 b=Sc2E/8iWkVswuRGp1YzQDVPe55eGZgKi+pQkU1dQ13/Fbqw2K1lpMI3ncS1C4jvZGuXpCa4GSwiIoGgY29GxvAf2xTQnKy0oPWKRw7fxUWAd/Q7Zo9qpM9LIQIHrKrCLbCerYO4QgkGVlsquVGfEkFGTWySTX25l0fl+JhKtqEa9IGeQg+cklLNhb+TzPGDYJCY7EQoheRyFSIayr5/htgnmZ5BvMlVKJ1u35THVTHMg9B89uMQwW8AfwMUg9NzuFpV19BT0oRNDsEuTGDBDPWmsABnl/O40IpKIIlXvOD0siQwfssZjFrot+HcIybX/TQjlBCI9VucSw55hK/vMvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN7PR11MB2802.namprd11.prod.outlook.com (2603:10b6:406:b7::25)
 by DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Sat, 10 Feb
 2024 22:38:48 +0000
Received: from BN7PR11MB2802.namprd11.prod.outlook.com
 ([fe80::44ed:4856:6ae:a30d]) by BN7PR11MB2802.namprd11.prod.outlook.com
 ([fe80::44ed:4856:6ae:a30d%4]) with mapi id 15.20.7270.025; Sat, 10 Feb 2024
 22:38:47 +0000
Date: Sat, 10 Feb 2024 17:38:42 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-arch: Simplify strip support
Message-ID: <Zcf68tBsK+U8Bz83@windriver.com>
References: <20240210142421.3518161-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240210142421.3518161-1-richard.purdie@linuxfoundation.org>
X-ClientProxiedBy: YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::19) To BN7PR11MB2802.namprd11.prod.outlook.com
 (2603:10b6:406:b7::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR11MB2802:EE_|DS0PR11MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 81dedb5c-b0c1-44bf-6ffb-08dc2a890bcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y9O1l8JUguDf3Lb2pl+3nDYisc0KpDl29pbrtugW6x2dg5DuTyD537BzB4OXfFrW7sgdmUQnHE1Asc903iarNsyGdN5CLBkW2r0yAj4oM8muiXvcf6xGSedy2gJ8PPVsmx31aAsEvljWMrIR25lSixIgDpiNZBH01BJ67XwaQ14YCpXgYroj4NIU4kxfo1zHNV4ijoBHtES+yc8tq+0DnTN8Wup8yxtUn9oN4AV4cafEyjQ/sn316b/7FUcLphtAKcM8yCp9Fmsw9tAYk8Yp+rPZbpN2ffh8O7eZowXGzFBzWUMJ2xV8X2cX+gYS/8MyZBe2ttshfC7YDjuzPivvwXFBpPbYvMIxv8mhA6j3EVC8uuMMLwfDdp0nq7rycrZApQi261LFgnMBVE9mxiTySid4pHgxtK2MnTTF2N9UOSk2LTYr8CCDya2dHVWphnlxBg/hVoahk8DSXVb60/VlQ05kFXjH5LsmG/APcHHd3AF9g8Vmgfm46oKUeftdILb3L4IFS/g0JTqDzvtnN7O9NSATq6Qd271cCQUDJ5k7PHN0a9Eehdq7jrqey6eDu0f6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2802.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(39840400004)(136003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(83380400001)(2906002)(6666004)(316002)(6486002)(38100700002)(478600001)(2616005)(66946007)(66476007)(6506007)(6916009)(44832011)(26005)(66556008)(8936002)(6512007)(4326008)(86362001)(36756003)(5660300002)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ev9rjPhbyS0yhKmcjGN8R+iZzjDOw2Tr/O7Vba4SQ9Jdpk+MOJu68lpr+YSy?=
 =?us-ascii?Q?9ID8j9rbRV0o5qH6jOdA5ppcLPMXEf2XPxGhoCeuOW7puBquRr3HZ5zOt4fi?=
 =?us-ascii?Q?JOvSgDM+yc4WZY9XeEt/1Z0qcE1wcMk6PjCUGJ0AmEt7ak9+BOvNwf+jNWuo?=
 =?us-ascii?Q?zx8YVm5NHNM99U6VGm5GYUyZ3hXW4Gwi5mHL+Kg7OSaC0hpEDit9mSEaEn3/?=
 =?us-ascii?Q?driS5dTsEsZRp09suU1lh6F1w6mmVrLDH1x+CPzvFmYSz2kKcyKe9sLkqXEr?=
 =?us-ascii?Q?e4QPXFCTMmBdOmE5LhHZrhECv+e3vM2IQXtYME2JVZYV0WqhopDsyFl8qDmB?=
 =?us-ascii?Q?xOp9Og7d+pJJpTNAAsn8Adqu4poBfLKTovx+0O8gWRAFr8G4ee6Yv3dr6cnV?=
 =?us-ascii?Q?h+rq8lDw5bkObqTv5zlYBjsp5qPOasyggnRYtFPFv/cDqmEroiujd8Y2Ga2L?=
 =?us-ascii?Q?lywaECMxTzz4Uz9+AQb+G4NC7Hjybb5GkPGyC+bYKvdJm6QZBmvtPgi6/KN2?=
 =?us-ascii?Q?/5Mapr5jZG0Gt5f4Wyl6fLCy0bcnr7jdCifqLfJtIdpmc/g2daKeVwGV7npp?=
 =?us-ascii?Q?k51VqWEEOi8IUeiN0GOJWgiNtS3RvElVfxVmANW9BkopQDPS+O2nZN3UN1XI?=
 =?us-ascii?Q?FIIzMQuDG5XUNaHBnValJ1jXPvcWUm4h3PH2cvYXC5y4x9eCAG3WhgYSe+4S?=
 =?us-ascii?Q?qfUDygtnLFf8DCupN9x6X2Ah8tv5rhTauRW5BLW30QyotfT5Zj/MTKf93x+T?=
 =?us-ascii?Q?gH9qqXfQnwmhs0KvT6h2ouAYfOLluvaRXByeB6IZbepNxLGTrPfRFARTxtUB?=
 =?us-ascii?Q?vSMzjUX2/EZi8NjvDT2eV9szVnFwrhzicVcOSn+vjg+HcgnVCNX0FnvBeAIj?=
 =?us-ascii?Q?EPmwrKnSXRYjiTZ0zjgS4vhJrq93VN7g8qCDm4gl6ih1OmzQF8ee+AOdKKx1?=
 =?us-ascii?Q?6XOg/xTTs5mQ+WHggeByxQ1egLQxtQJf/VIdgr4T959isFhLL0TYUoLjJmZp?=
 =?us-ascii?Q?M5hZ/h+LOTHMlZJt1v1ttFsvAkvV6TLmZoUrsUbcrbGEBI7ULUJbHdAsqR51?=
 =?us-ascii?Q?CYv8Omln54JD6UPpKU3qW/fVf/XofGL1IQ59xuRvpbJItcomjc/w4/IYII/0?=
 =?us-ascii?Q?hsK4XFIIRmb31WbRLRgU9lEu8VLwDRq6oXmVuzubW/cV2v1sAcGFi4vupk8G?=
 =?us-ascii?Q?oibe6WbYUcfryvsYjadOrpogvJ786r4eBYB1UjA9yiHJmyVLgpQZlmJN4vtw?=
 =?us-ascii?Q?UgLMaIyJeOVHLEOsNeUqfPlQQUsqegDAiCTeZ8jtCFdInpCzEP3/Xr9mY0Rx?=
 =?us-ascii?Q?pla/5w0BAMYm/SCufu2zXZNJpcXIlqMCFcJzrOHlcFejHL2pL4rBDjX+YgJ6?=
 =?us-ascii?Q?kKR/44OkQiJLENCpWuY8wH8mSobXNjue0NB6aMfTwkUgd0e6ZBIsUjJEKnDs?=
 =?us-ascii?Q?tTNDAOXEaAPZsz/R6jt04Ykusz4t0pPx3dlLjomajqzJQ89Ae6bDabHtCNL2?=
 =?us-ascii?Q?nxXzGx8GWeihETtwcRAqk+o1GAa5dr03/xV+Zg4ijAdgXGapsI3yXDlotpFf?=
 =?us-ascii?Q?ym8t5/W1f4xbaBWeojLRMRuXN3QkYHI4q5jrON4wbTAbOzgzk5oT/VPcT/0a?=
 =?us-ascii?Q?7Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81dedb5c-b0c1-44bf-6ffb-08dc2a890bcc
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2802.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2024 22:38:47.7683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qkbTxTwn48i+Iw0fbhLRxcZyHbj4wuJs+4+9nSwNURKtbSHbr7bUaS8w2daSFl4DdtzEaMOmMCknL4gPHV1/aLzWwuuH2pYqnW+8wPWCUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
X-Proofpoint-ORIG-GUID: ZkUmZHUKfkmG7hisfjL0OznX3RhsW1Yj
X-Proofpoint-GUID: u4-D3hJzrfgErdStKNdyq9uPe4NfUbMm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-10_21,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402100189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 22:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195279

[[PATCH] kernel-arch: Simplify strip support] On 10/02/2024 (Sat 14:24) Richard Purdie wrote:

> I think these options to strip were added to mirror the other kernel commandline
> options. In the strip case, it breaks code such as runstrip() in package.py
> since only a single command with no options is supported.
> 
> For that reason I find it unlikely anyone is using this. Drop the problematic
> variables.

Undid the temp patch from IRC yesterday and tested this on the usecase
that revealed the breakage, and it also seems fine (no surprise).

Guess we get to wait and see if it breaks any other use case....

Paul
--

> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-recipe/kernel-arch.bbclass | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
> index 404f2e70612..b32f6137a2f 100644
> --- a/meta/classes-recipe/kernel-arch.bbclass
> +++ b/meta/classes-recipe/kernel-arch.bbclass
> @@ -70,12 +70,11 @@ TARGET_AR_KERNEL_ARCH ?= ""
>  HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
>  TARGET_OBJCOPY_KERNEL_ARCH ?= ""
>  HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
> -TARGET_STRIP_KERNEL_ARCH ?= ""
> -HOST_STRIP_KERNEL_ARCH ?= "${TARGET_STRIP_KERNEL_ARCH}"
>  
>  KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
>  KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>  KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
>  KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
> -KERNEL_STRIP = "${HOST_PREFIX}strip ${HOST_STRIP_KERNEL_ARCH}"
> +# Code in package.py can't handle options on KERNEL_STRIP
> +KERNEL_STRIP = "${HOST_PREFIX}strip"
>  TOOLCHAIN ?= "gcc"
> -- 
> 2.40.1
> 

