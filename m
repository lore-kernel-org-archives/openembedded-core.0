Return-Path: <paul.gortmaker@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B9AC6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 14:10:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.102616.1680617426911035743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 07:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UX/RdS3N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3458ee9bd5=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 334ASa0L015669
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Apr 2023 07:10:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=tVW97tBYP3dAL5LPxqf7Bbkg9NlfO6hK/lRZosZoax0=;
 b=UX/RdS3Nwdn9oHn18Qk8bgZHqHgfKpGKkihb6Uaf1VUEenvCosNQbxz0bzWiZJJw2SJv
 L6+fO1JyCZ840CP54Ma0mIe0iNTg7xoRx1dl6DWj3t0XoVG7ULVHKRln+tZreWf8mdms
 +8lc7rCFxVfTl8DKuKODwPIzMz8OTB0Wt7EhGhbOgAAFSE45DWGKrIhE9FRBS9lOHXGJ
 1WcVEO3jC1qS++WdmML7URGPjxFkq1GBqgjtEWHdqip52z4Ci7MmPZO4taWySHIMwh3o
 oWPuAaZht7eciXMQqbKJXtVvU3eMq3WVZHBwoWYJO5oV7jY7TcKbS+dzPGE3JHwCE3HC wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppm4p2ya5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 07:10:26 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 334EAPxt030410
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Apr 2023 07:10:25 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppm4p2ya4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 07:10:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xk//IkZsZAHwpZrEweZwXnBKTgd85ywuL8JOyXoQFOKx3X7yHfPbL3hXdl2nBvRkJgNYLxKvW+NBOWNTq08eBTZisDRtb1BhZPsz91nY1wlF8VEbWZ+O9Xxa6Z64klug7iRQ8R/YkWj6AeKx4GGCwBpdsPhLuBwvc5KQnrBnNhYKoqCD6XtSTSSBnmV7ATjav9vy+Unw3fDdHE2z44RfEAEhA+M9jsQALaHUnugNqa9QRvmWKGp0YW3zTWVAUI2NX3GyGz1db0IlJzHSSioQ5j/z9Itm2nSduoI7UWLnCQ/m7X+b5PB0GqoMxlh+R/Mcdk1SCrnFjahKtCKyYwopfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVW97tBYP3dAL5LPxqf7Bbkg9NlfO6hK/lRZosZoax0=;
 b=VAAPWytN78lru+rDsKHBJe87Zyxe6m3qLo5x6e/pqlPGCFPhO59as70qWgJOdZdhPrnvVIc8H+Y2BHkw7Q8misa2zxbZAfc2p74HYZJGlv9mDWqiOqvlEGXqR6P0/mdKssUbx1QCUeCHPQPaXldarmec6B13PqZVl2pbX6Cv3CfzQHBYQ+EuxWMOB771e7oWxLLuQonjauGasCavKpPKkBkn+0ul5CdPqleZhnKooo8Vx82pjy61usoQPMJ4GQHKyymsnqkToF7PXhxpQ8A/nGxNagRh+rnydL+jlf0UnvUxW0yMxCRD1w+WADr1WB+7xpOw3QV1+IkeiyZIoXAiRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.33; Tue, 4 Apr 2023 14:10:23 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::bcec:5446:25e:95a8]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::bcec:5446:25e:95a8%6]) with mapi id 15.20.6254.028; Tue, 4 Apr 2023
 14:10:23 +0000
Date: Tue, 4 Apr 2023 10:10:19 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Qi.Chen@windriver.com
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>,
        Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] mesa-native fails on master
Message-ID: <ZCwvy2ZBt/0R0/S/@windriver.com>
References: <51ba3bfc-caa0-0a31-c295-e59c8416e672@kernel.crashing.org>
 <CO6PR11MB5602C3D93B44F41049BBDCECED939@CO6PR11MB5602.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO6PR11MB5602C3D93B44F41049BBDCECED939@CO6PR11MB5602.namprd11.prod.outlook.com>
X-ClientProxiedBy: YT4PR01CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::22) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: e732083f-abfe-49a2-2539-08db351654cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1uRZU6FMWQWol+iz39OJUhmt1g71+itHgjN+Ul25JUDXvh87cY4NhBi8xv9CrIvzfat9HO0o3RQ7D3dTGKlEFqaijoQ/mW4Y+NXCYrpwHWWkuU70qz3pDDxhscuBZTVAqQXaz99tgZibIKuG2Pl7NkhHXfBXIiVbg+vGmLoxLbLctJxB6nIqvFlvl7/Fm1qR2RC/cOUIwe4L/btbEAbKC0GYCaoYtXZpddBtNd69lyKtmPhcWJqbzKeZRvSvK80E9f4t1WKYeaatCGFwFn1GI6bT78JMIBCBFMlGgh9q+1eQ76gdTRFArtH0+HmxBMWlpHTPejsXwe8otobk6+B5MV0cx2tlLjWGY0yc1j/8Ji6hFTWKWjLbIB5TqkQY1+KG9v7JN0M1xW+2rPrqUW7gqc3mh0Ybns/U8UUPVv55blJu+zSi9459348QmcMWDwOY5wMFQifno2cBQ9ELaDXwoiSB6IkDeQJJE4NEDxbD8k0P7+Py3hVp2rpjD84nzXvcKhzXlu0n4CMNv14ijJVfB1U0JttOY+3+MsGDJ+1z5I/cpWPja4xB3PDOyGKU7FzZY2oZHQPRkoE245CbUVjqwQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(39850400004)(136003)(346002)(451199021)(41300700001)(8936002)(4326008)(34206002)(37006003)(316002)(5660300002)(86362001)(38100700002)(54906003)(66899021)(66946007)(8676002)(6636002)(44832011)(66476007)(66556008)(478600001)(2906002)(26005)(83380400001)(966005)(6486002)(2616005)(186003)(36756003)(6666004)(6506007)(6512007)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lWrY/snnPl7QknZYu2tBt1aIoktBvRQXHEpFFH0AqOrkWPszSMXAJt3a/M/e?=
 =?us-ascii?Q?RMX+ei5DawaM8FdSkLY4KH7eQUnepcPjUenV4qdGA2aEiizPbV5qcbX5Bx5C?=
 =?us-ascii?Q?yc3wlPcM2+CABAeHhk6UEbz37kbVucMplCsusuYkDiF1IEIvzupHlsDdfAgn?=
 =?us-ascii?Q?y/KLgTpaFWvGJqponv6gesWAmHw0/Ai7fMJpz3X4PlBVPCGk4figynSu/SMS?=
 =?us-ascii?Q?bU93U9bSDtcpD6mxXfOHBDFZL6+uwaFwW/M+FkX4Up4fom0qn+H5xvooCi6w?=
 =?us-ascii?Q?GOO5ttTM2Yl0mRO48nt+/e3B7gozPOBG+FL9m9Y6+AqNMcysLUSjGljz/QOd?=
 =?us-ascii?Q?4mFZnMmtfLmrPMIJbBdjt+13Ot9WDGTqRd4yZ6XVJIUa0EZ0UC6b2JEcgB08?=
 =?us-ascii?Q?x88moA9InTDMjc8mGNDs1Zst7DLIjqlkwhDv0Vy+Da1XAqJ3e2wn/h8glzsv?=
 =?us-ascii?Q?WhSi5sJHl4Ga9YkVqi425vYR3czT2GvMcl8JjA45LwV8ngIqGb7l/ffXaB46?=
 =?us-ascii?Q?79BNvOWeVsHqS4RJBgiM0nk9i53WgjALoQFUfDUlLz+JzDAEAhlxS4V7kZOg?=
 =?us-ascii?Q?3/k8uhg7Qa9Woiv/KDOlj6dXzVNscAXUqxAqvgtez9KbzuXKC3PqEJ8NS4ZY?=
 =?us-ascii?Q?d9pg+A3s7G2JN8ZPOmoN8Lb7PsbV372liFXESF9rxrAZGzmq9JHn9mz6cdot?=
 =?us-ascii?Q?aV1n8YmbcTaPTQWUj4L3OYRTA+oem57HYo2cKHtcvExAqlo1loxB0h5VZeyo?=
 =?us-ascii?Q?XZc+0QNcerIMkUwR8pUCbwmzolrU4crDJ9QGXd4JIqSu3i9BsEf+GWuQ7QBN?=
 =?us-ascii?Q?HX0GfzcNmjNxRyVPDDi3tEvCYRS9yF+/M5x7hbB2LtLQdpiUQxcRjdw5vpgv?=
 =?us-ascii?Q?86jax0pjIomVcbE5rnboCJgRcMoUlH8AEQlKvzwzyYlBLtoCPRzgOSkzrasr?=
 =?us-ascii?Q?MQP2C9w5VYB0aUlgZQhqQYyERS5Fvaj+CXgLeyJXSRbh/k4n/OS4sc8Uox92?=
 =?us-ascii?Q?yf9QfCLixb4GT3PSpR4jbkWn7bYovWHRk3vRPKUesaueUjA1/VAK61LST44j?=
 =?us-ascii?Q?NArc5AebyyG+VsIh43v9/erFLewqR2YhR8wJGT97uyzMPrxEXzuCo/aJLf2P?=
 =?us-ascii?Q?LSjCcmQ8oLyf0QEzDwzybrUJbI21+c26xLirCdW7fjAytD8NKaaEEoyIICn9?=
 =?us-ascii?Q?zFW1a0g93KL1I5iKK98U7iLnXFCMAqtMNCafkw1t3Oc/xRkpE/jgx1eJ3Wbm?=
 =?us-ascii?Q?Z/yAy6SzRaUiOhRbNgfYUG+A26PE5RO0n9xcDzJMtJ90vn9WMNvZ8MBUYxgI?=
 =?us-ascii?Q?yFusOGetpq+L5Kn2bksfq1wv6DaGzGt1dPOtWrk3GJf/BBmg5EUC3W99Mlt9?=
 =?us-ascii?Q?NH0ieTiWGYjAEfYMpIIZo5F4X0tpRA2DtqruUXer1wGDAqguudTYEIeGyYMo?=
 =?us-ascii?Q?RxFa5H5VJd6zUyFHBDVnQ66xgItjQ6D+3ZOwz7ut3ZbJ0b/32vplya+lTzWq?=
 =?us-ascii?Q?mXVsonSzS8h+yiOeMIi7rjtstLVwl+8jFCRlRA0Dhqe7zQ6RjVXh/OSrhxYf?=
 =?us-ascii?Q?aXNiOQqk0uusStY6yq+GeXoRaGDRK9CLxo2n2FCMiXytmvga29DOkrfYCTot?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e732083f-abfe-49a2-2539-08db351654cb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:10:23.3227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8+9wuDdZqfR+CnEjfkSMyEjrStAn6xldMlRpd2Eb/VrBQkOpq3g4VRhQZdUDy531tYLf+bPcoprskqGgnUvOtWqxV75aAHi1q+xZzcmSzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
X-Proofpoint-GUID: y3M8p6P2GgOuerIe9Hx84nc_wFLe_s6l
X-Proofpoint-ORIG-GUID: UL9TEpkc0x-xH2LByDexVtrBiULJaaRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_06,2023-04-04_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304040131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 14:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179691

[Re: [OE-core] mesa-native fails on master] On 04/04/2023 (Tue 02:39) Chen Qi via lists.openembedded.org wrote:

> I just met the same issue. My host is ubuntu18, gcc version is 7.5.0.

Note that ubuntu-18.04 is End-of-Life in another three weeks (unless you
buy additional support) - in case people weren't keeping track.

The ubuntu-20.04 uses gcc-9.4.0 by default.

Paul.
--

> 
> Regards,
> Qi
> 
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Mark Hatle
> Sent: Tuesday, April 4, 2023 10:25 AM
> To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
> Subject: [OE-core] mesa-native fails on master
> 
> It's been a few weeks since I last built master, but starting with today's pull I'm getting errors building mesa-native -- which pretty much kills the whole build.
> 
> I'm on an Ubuntu 18.04 host, and have the 'buildtools-tarball' from the last
> 4.1.3 loaded so I can get to the minimum version of python to run a build.
> 
> (I tried with buildtools-tarball-extended and that DOES appear to work.  If this is expected, you can ignore the rest of this.  But I expected the system to complain before trying to build everything if the compiler wasn't new enough.)
> 
> 
> The error is:
> 
> brw_simd_selection.cpp:205:7: sorry, unimplemented: non-trivial designated initializers not supported
> 
> 
> The host gcc is 7.5.0
> 
> What is strange is I had 2 successful builds, and then it started failing.  All 
> fresh builds.  I've no idea why one was successful and the others failed.  I'm 
> wondering if maybe there is some sort of race in mesa, but lowered my parallel 
> build (-j) to 1 and I'm still getting it.
> 
> 
> Reproducer:
> 
> git clone https://git.yoctoproject.org/poky
> 
> cd poky
> 
> wget 
> http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.3/buildtools/x86_64-buildtools-nativesdk-standalone-4.1.3.sh
> 
> bash x86_64-buildtools-nativesdk-standalone-4.1.3.sh -d buildtools -y
> 
> . ./buildtools/environment-...
> 
> . ./oe-init-build-env
> 
> bitbake mesa-native
> 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179667): https://lists.openembedded.org/g/openembedded-core/message/179667
> Mute This Topic: https://lists.openembedded.org/mt/98052337/6329300
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [paul.gortmaker@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


