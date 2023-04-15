Return-Path: <paul.gortmaker@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324B1C77B73
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 21:57:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18727.1681595858171100521
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 14:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kpu3klOO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3469c0f688=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33FLvbF2013289
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 14:57:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=i+/VbkQIWHaZ9H4UZ0eUpTjTWYmdalGb3o40u2FwubU=;
 b=kpu3klOOPmIFxj/QVZ5ujdLJze+vN/sSNlROKChXwIItTdt+R8/srGrbATlaYefOfkka
 x2Xoi1ljCwiQi4FGfAW1TqIW15ywLo3rJpO8KH3kfHwNBGP2vZzh7kBucqTc1zEmPFpx
 4hJhYX8PovjMstrmA6cSYIe0uXcDxOa7ypmXBdof0+ItY1fzGCPS2aGsNvrWJj0g3JdU
 zWC/FZkx4UHUYvr67cl6w6VqSoEJlvCeiOsVG90t0EIU0HuhoP+3PK7fWhH1N6Lc/BNB
 W2j9l7ej02HSStY9oQKRDbQMIFO4V0FHYYEhId1SKmI54FGmoLpqvdX1I3SApnp/k2lU Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyq76gnmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 14:57:37 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33FLvbrM013284
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 14:57:37 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyq76gnmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Apr 2023 14:57:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arl6hR6dQIdOnLdUOuPEegEXkCiHYWjPAECz5+DYxvAav2+DWBvjg+PidyHaWFEQ9ROGKe3mHNxr2fRh+NK3BYFKLZZyAGoztN16NpJHxI2eKPLTIXyAXS5ztlI9K7CNFI+JydflmKZKyTR6vsd62t1TAcEcnkMVJoRR/HIgC+qz2Pm89G/SWGvfGtJJ/lvcmsPSRyc4AzV/jMKUv534/sivQV09oeD3pHKwxiXK7kDMrFFswTnpyD6JS5UsTjV+u1v9BMvnt4JDBgDKedUfYWd6+r/uJOk3A53RfB3d58AKB3WDG6DWaezsDfav3sWdwf+erDD5ytEsTNdodr+B5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+/VbkQIWHaZ9H4UZ0eUpTjTWYmdalGb3o40u2FwubU=;
 b=BVaDcukcTJ7JIafgGefGMGXMIGrNIJgPjtapUCCBvkwBswoz5y3G+C6xKtsw277MfxB58NJnEKymRsElCTeXqx/bRFU0vOeVd/2+LYY5hKFyc6ph/x+xFRq0oL9NANyGbl/msLAdvpE4EeTpo6pOwgqAIHFVPlEFoMCmofFaqYOqXI/Wi77TrxO3paeHJPvfPfYZPnZ2Rg6tvDzGLHF2YqROJVQ4tVKby2O/4z5pjQSpyzYB5DZZLDbFOs9rLuzqRMobL1YTSn6ySNzZkeRvvt3eXzc5RGFWsPAU2nFv4IXrPbDKrzU36vlNX5Veyi+ijp6FUdunOyII/WOiD/OCQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by IA1PR11MB6444.namprd11.prod.outlook.com (2603:10b6:208:3a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sat, 15 Apr
 2023 21:57:35 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::61d5:7319:52f0:cc4b]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::61d5:7319:52f0:cc4b%4]) with mapi id 15.20.6277.049; Sat, 15 Apr 2023
 21:57:34 +0000
Date: Sat, 15 Apr 2023 17:57:30 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org,
        openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel: improve initramfs bundle processing
 time
Message-ID: <ZDsdys3tDF3Re4vG@windriver.com>
References: <20230414192919.1887564-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414192919.1887564-1-bruce.ashfield@gmail.com>
X-ClientProxiedBy: YT4PR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::10) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|IA1PR11MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7cb744-b6aa-462f-f219-08db3dfc6b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rQDurYzKQtzJpNFhH9wYYm9ce7VOBYrif3u8L8hKcAKCwHrlaKMDHob28ToajQsdOiYYevwQGibk61X8Jodh7MqLGx/YZHMiW+XWxyur0oKF9G5hCVAWtrJpl4y1UYkJK9430+vnEECpAkE0A074z69Gzlihatp0iQVtfSP/OMvHZoXxlDSC6KMBn0hb/faV+pp8vqrnOrYROyb8CnNt5ZY+2ncZDwkNOoJeftiecZ9Wk3s9rszLQubztCdHDRv+YJq8Vr9At2BbYYeKQP99i+rkoZqsRLQgXruBbARKcaEIh10GsmSkVaoiZEbSO9d8v/qSinde2f8Q4nL8N5WHfD0NdCGES26u0lx0podHw4C0RvSi8r7ugNXC2AEaw4to33tJoq4yVNMNwha+JaGY31YwwLJeO63GugoVbJevKTr0pLiBuoSveA/kpQf6bF38pY6AOh4a5dUwfciJckKSnK/QpmH6fhXIHxXF9V7PcBkkhqFHDeX1nrrG8qav2KfhKHsbdj9tQ1+NZA4S4f0CJpZRrVf1GNoooH1rJeN+miNdMzzIJ+5aaK9jOFWRGvRHbHpnHiTUoWXqI0x7r67tCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39840400004)(346002)(366004)(451199021)(478600001)(44832011)(5660300002)(8676002)(8936002)(66476007)(6916009)(66556008)(4326008)(66946007)(316002)(36756003)(966005)(2906002)(83380400001)(38100700002)(2616005)(186003)(86362001)(6506007)(41300700001)(6512007)(26005)(6486002)(6666004)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bwCWZbwAkAvBHaXKuxfNl3lclSB6jTEUE6K3xF8rnL1qXX4GjFxI48VeIUSw?=
 =?us-ascii?Q?x9cy2rq4/0J8GbzWtyB1Ybbi3kkDdkqEySv2RfbqktFimIYdVDyRBVNscIrS?=
 =?us-ascii?Q?e0EXdAmW4hUmR8cqLCE6X1pCVs9vy7axFesFfywxSlZC0nSoM2Y9DesllV9i?=
 =?us-ascii?Q?YNYAjkcEMdNAF4ygpvvlJcU4Mnnzv0onbeUMV0VzbM4XLSqafu/BoDKLVh7N?=
 =?us-ascii?Q?PrfM6TFmbGsi9qXo09oQxzMkw5Myc3bczhWPaEmkw0SdUSSKWOeabySQ5ux2?=
 =?us-ascii?Q?UpQnQf322brDDcjbbmCc4Unir0ZZzfk7R0U/D3DBlB51vPuuYvmrC6BxRAS+?=
 =?us-ascii?Q?d272DfGBPqM8MOsn7n7NfJpSmp0HLkSKllMz+TK5QuEJf3bXRys0R8takiY5?=
 =?us-ascii?Q?UdGjm8T0gyiNQ++giFqVR7d9LzBI2FKmQiyCAlPlv1cI8edIsDW4+LjTU88T?=
 =?us-ascii?Q?SVyppZGBOGhDjMJrvEPbg66ih8bt+E1EyT5K4b+vKZim8FeiR8wJC97WKlKb?=
 =?us-ascii?Q?nco1tDLEDIKYdayPVY4tYSleR9N0oNel9L7JaPfUmTd0M/vB5eJeNjIykezX?=
 =?us-ascii?Q?LAQUHbLJLLWpFfEG64y22eGnS+sdgEzoK1N0moZhp8Q0D1Rhd0nPb3flVizy?=
 =?us-ascii?Q?0soeP50G5nr1WVTczBbvvXXHEf2hUpTzkZgIq/IoJ5Vo5w/KmP9K0KfpDsjz?=
 =?us-ascii?Q?E5g7wZpALecqanPGI8nw3RfLf6Zo1PMYNCYuVoep6ob7Yjbfexu/MTBpaSMb?=
 =?us-ascii?Q?C/s4dVjwgwNF8P+Iq/1MzEj1Q1urY6JML6nCIQJ7b1R7I6qoKrJupfUOXe4d?=
 =?us-ascii?Q?aNIWqKTzVe7cVUifhdVf7syMIzEp8KpsBto48QF76+IyY8qShF/6Je0LJkql?=
 =?us-ascii?Q?XqeoO6mt0xxrz3MzsTpjU45sy18hcGVN0N2fFRYh95fXjfZRtS9mjFIK756B?=
 =?us-ascii?Q?6rQwgeBSNaxm6xT8IfHZVj8Mb40KFPF335jYxyw5S1r5E5J8VZX5mM9TMRGw?=
 =?us-ascii?Q?9eZvZB5sH0P98+etaWv6uoQTcLwMyfgt6fqJ4W+QNorWvfKnpYpqxDYt57dk?=
 =?us-ascii?Q?oHTdrFQW4A+dw33tkzs6q2Wzp4wPM70CAANrFDIIijHbU9YKxo42Xyzspa6E?=
 =?us-ascii?Q?LMJfSscwUIpO02NctSF/fk/FMut5ggszLGti7Es2cI819NfPI7IGavsQVPy+?=
 =?us-ascii?Q?fcJYSocae/THdXOTBhj1pG6CWhFFDdQ7ch8d+zUjdrroclbz/AYZN8CymT5H?=
 =?us-ascii?Q?KubgU68GhL1BJTKgzkmNnbESRDcbo9hwWJprFvKSrBuNlGxK3355dOxno11A?=
 =?us-ascii?Q?4nbYJytYuNhqgjV4cV9HdHDwbZ04koSkQ+C/XSx5l/H8oQK5EwXK1Hcp4a6g?=
 =?us-ascii?Q?uMdl/UQPCQ51IgfOJeHnvAjO11Ut4r3s1KHfI0a5WnCjxhSBR/5qToyfPc+e?=
 =?us-ascii?Q?6Y2PVhqzlvKOATLhX9pq/0WTXxfndB+gJPQA7Ux1xPoTPbCge15A3HWvBpod?=
 =?us-ascii?Q?RUwIfdD8OoWLHjhzpGH1EiTR1dZ31MKnSiR1VC4iOQmfBk8yulLMGydAORDU?=
 =?us-ascii?Q?KUL6QRw+49StgJD2fqZnrZr092IgANl13HVjqrq7EkEwQVKOYhTcfkcuT3sW?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7cb744-b6aa-462f-f219-08db3dfc6b11
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2023 21:57:34.5198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRUir+7rXE4+y4HllmnBlIUQwYEOBZntJ/+7DvnzkgDEg8RLzFRc+0PG6eY/a5k5827ygFgjpG66Nej5DYf74pcD+ynSBk6TWXP7QCAYjWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6444
X-Proofpoint-ORIG-GUID: UM-ruayCnU45PLO2eLeATgTqEedc8MEw
X-Proofpoint-GUID: q0cxvUN1rhgIv4smoWFTUvcEvPBRwgMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-15_10,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=708 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304150205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 21:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180112

[[OE-core] [PATCH] kernel: improve initramfs bundle processing time] On 14/04/2023 (Fri 15:29) Bruce Ashfield via lists.openembedded.org wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> This is a partial fix for bugzilla 15059 [https://bugzilla.yoctoproject.org/show_bug.cgi?id=15059]
> 
> It has been noted by several people that when an initramfs is bundled:
> 
>   - a lot of the kernel is rebuilt
>   - it takes a really long time
> 
> When looking at the logs, the second kernel compilation (that performs
> the bundle) is not using the parallel make settings, and builds with
> -j1.
> 
> We are already explicitly passing PARALLEL_MAKE when building kernel
> modules, and by extending that explicit use to the main kernel
> compilation, we ensure that we always get a parallel build.
> 
> Build times chnaged from more than 30 minutes for the bundle, to
> 3 minutes in local testing.

I've seen this a bunch of times in the stuff I'm working on, and the
incremental fix to go from 30m to 3m is super welcome.  Thanks.

> The question of whether or not too much is rebuilding during the
> bundle step is still an open question, but with this tweak, at least
> the build time is back in the realm of acceptable.

Thank you for the incremental fix.  If I can help with the
over-rebuilding aspect, I will.  Let me know.

Paul.
--

> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index aefa0d21bc..e634eabd49 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -382,7 +382,7 @@ kernel_do_compile() {
>  		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
>  	fi
>  	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> -		oe_runmake ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
> +		oe_runmake ${PARALLEL_MAKE} ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
>  	done
>  }
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180005): https://lists.openembedded.org/g/openembedded-core/message/180005
> Mute This Topic: https://lists.openembedded.org/mt/98269754/6329300
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [paul.gortmaker@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


