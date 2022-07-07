Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8BBC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 01:26:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.611.1657157186640358226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 18:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=f846zozh;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=418740a135=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2671JZcK004181
	for <openembedded-core@lists.openembedded.org>;
 Wed, 6 Jul 2022 18:26:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=iYUD2eQ9j1yK4Tu1NikLvoWv2mhuX8M/Id+yhsBrpDU=;
 b=f846zozhtmc+yyv4RVyFaE8iMqg0v/1pzDdd04cifL3p4rHUgYtuqp5NRS8mueB46Vk+
 YXQqSEpnKtJCKmS9/RnQ4b0XC1gwHSSCBFC7MMYOLu2HSMSZmbLKT0B5IKOG6gtRnEyL
 HKGrNlvxnJyqOXeL4ck000BBF7YGNSuMunpwN5szmFLNZoYrtda2Np8qgYaCPJHr/4rz
 UdJWJy3NJCGOSZO1gM+1iCAJMCCtsPi1elEkRDUgYEJH9TzmhtsJzda1lR4HGOEYZxJ6
 lyIKmF7FYyvq28rOIZG1zunRPABTHnxo6nx7M53C+V8awaVhbhzvXbU/NDofvbq/sBVb QQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h4uf3h1yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 18:26:26 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2671QPBf019312
	for <openembedded-core@lists.openembedded.org>;
 Wed, 6 Jul 2022 18:26:25 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h4uf3h1yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Jul 2022 18:26:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8ZmM6nyVtP97ES94mJS3AIMYyyiUayYzMAAIuxJyYnxKkhZyXl4zmk1wINmmfbZEpGtLGCbmoGJMjDhHCI+m0uOT63u6kKyLo17BqQRX9mH7RyoeIUJO5AMD1u5mP4cZZZzb3w4ZMuC1QrV6xkZQd5Nxlus68o/PdRpdd5Qpy0L14fkS7t8mibt5sBQKQ299lYgRCEKmEgXKMX3xctgLFqlDeXCsO3kIizu3CTgioKe72Lpo4/6nRPBDq8mqSU2Qg8Gwre3NKLpUZ15X5gFANIFPDuvAjlbEHWfw2XzMA4Dxat96j4OmdzT1I7gd1YihzXJKyjv4khoni7uLeVt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYUD2eQ9j1yK4Tu1NikLvoWv2mhuX8M/Id+yhsBrpDU=;
 b=HjY5wzL0V6lM2t/yLVx4GQcwb+9itXp12fQYbseZ1z8gHGGimw2A9oWY+mKvWJLfFskB2/65a7nz4mYJ/c95P9s9GaFZD2zVCLHX+HaUdccrTbbDBZBI38wHo4AkUNR14VL3SU2KH72PYa9x6WuxHUTV6I5CLdM9MCfdpkhNwdm7mNAJmEP2n66X0QsPG4+uAy6etNhyN4B7t7R46j02y51BcC8ZxIxkkO1vDqX+bY0N8kz7/eSfPQ9aAqRAjxArSRltlhOKzhoXLuwMYhBWae6JM0osfYJ/gFmR7Yy0SoZnWiyHz8/axezf1orj88FPHfcoXr+yMVGGhN17Pph34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2537.namprd11.prod.outlook.com (2603:10b6:5:cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 7 Jul
 2022 01:26:22 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d84b:7432:aca3:bbff]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d84b:7432:aca3:bbff%7]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 01:26:22 +0000
Message-ID: <57bbb930-8343-5aa2-e4a4-d7aa92997e2a@windriver.com>
Date: Wed, 6 Jul 2022 21:26:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [poky] [PATCH] perl: Fix perms to avoid patch fails
Content-Language: en-CA
To: "K." <kayo@illumium.org>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20220617071314.3362109-1-kayo@illumium.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220617071314.3362109-1-kayo@illumium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0035.prod.exchangelabs.com (2603:10b6:a02:80::48)
 To DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00c75be8-9f27-464a-4afa-08da5fb7b3b9
X-MS-TrafficTypeDiagnostic: DM6PR11MB2537:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lBEvG19gm9LAy+CAdgBokFAw2SQf9lyLNR/y11Q1Mw386M0Ldz2KsyG2yylNsh5tZrSNFVcBWZ5i5apVdi64oTvzeXqNl42inzxhYZ/d9yjKyV0QMxnsemI6NKiOtPR9XWDe77EFDncoeYp83mJJ9G/Izs1ULc9EcF2Alfx3oobIPhqEjnjv9tLFf8kfaHUd40Gw+YT2pdr6+w84QyDQZ3gJRdoAntnPUQ6Ugk3OjpaMz4x9ZDcB0UmiVN74ZGSr/T2iFg3CNdc9Vws9750db5srwk/wQu1QKu9UcEf4rWfLWPkpK6Zwvs2Z3PRBm+MM2MLBZQ5itPpfjbaKNoPnxnjh37X0/IKppEjwl4UVnMpoQtkGl7e6J+X10anSimK4A52RjnW3Eo8t1Al/lAsFDsKMDVduXeUWhlEGrFNeTJn7q2NeROILkh02nY7GqAEEOh3NWtj5FMP4JyQcPkc8OS5PthoVkFdVUqACRI3LsurcVAWrXsQSRcuHYT0iHhLOuoe0ZnZWXYfO9AnksUjUrvbDkn+shS6x4EM3UBNz6msVhaPWyiGbRGnOZcWzUNCnlLqIFRc3XQZNzkPwU0e7Tv2ObfyIWr85FJQzZMyk8zLLoK79b1pGLRd02PzZHlSLmxxi66amfQ2xgiqGE8voWlish/5fHbNvB4nJssDVeIoHLc7OflKKIe8Ppl4bSf0j5ui4NBtS8rHz7I+XyUqfnWcpoT4pBUfc7vxkeqP6l9NXV9zd7GUYQiENIW6WSWI56AmtXyb6s1+yVgZhDXHeiuRc4reCbTGQTK1e7/Yc4Wm3dCqVfng+sVbbAy0Rj6Er5gNmb4XsmYKHslZCr5JnT4E0s3sNCWc5Wi6vj7oB/oqVP3BxioCKIk1ELx8FU/MT9q2n02WY3vEoES5GYvJZZpnOCpZ547BnMaMuH1gDPyKmTLVbZztvMIzvRVvlwBwS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(136003)(396003)(376002)(39850400004)(36756003)(110136005)(2906002)(41300700001)(316002)(6506007)(53546011)(52116002)(83380400001)(31696002)(6666004)(31686004)(186003)(8676002)(38100700002)(26005)(2616005)(38350700002)(966005)(66946007)(8936002)(478600001)(66476007)(6486002)(86362001)(66556008)(5660300002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ckxWNVZHSGFPUDRhMDZuSElrLys0Zmp6Q2hFQjRBZDY3aWJBWEo1aitFNHJY?=
 =?utf-8?B?VlVrbmswNUg3Ky9pREIvcENEUW9xYWZncDZOM256M0JHc1FGdXJ3dHZSbmV4?=
 =?utf-8?B?ZTFrVkczeWtwTGZYcVhBQlFZSFdGMXAwSWpyUk5GWDhLM3pUdTVZQ0tyOWsv?=
 =?utf-8?B?THlpazNJMTVJMmp5bDRqUWsvSVBnZEhMYW9SUWorZUFIWjhCbjJEOGJsOWVC?=
 =?utf-8?B?MU5iYWQ5UG1EelNuNXdJZmw3Ty9xVHBicTlKZnZsM29IOFp3ZDdUSU1hc05P?=
 =?utf-8?B?cmtmMGliT1BkSFhCdFIxYWxEZG9rY21CUlpvczhoVFRrSHhxV3g5QVZHMnBW?=
 =?utf-8?B?TGt6OHF6eGYyZnI0NkRJWU5uQVE3a0Q5SGJ4Yi96WG90dGlhOUdYVVBxUUsz?=
 =?utf-8?B?b0xDdjZpT0phKzRySTBTeGZnS3gydmNmV1g4Z2c4cm41QkFZOW81Skc4ZHlW?=
 =?utf-8?B?Nmt0dUc4cXFNYVVjSWttc0ppc2VJenoxbGxuMi92L2c2eFphbzdXZ3R0a0dU?=
 =?utf-8?B?Nm5RSUVtMXFqMi9VTVhyVUdMbHhZdXVqc0IvTVpGeXBYRmI2SWVrTXozbk5J?=
 =?utf-8?B?MFVPaTBESVdDUitEeEpaVVRpSHRwdWZyQUNiMzdNeGxOL25md3ZtYTRzRnZ6?=
 =?utf-8?B?eXI2cXJzeUxpWTdGWFNkOGpWZjhFSG1NWklvNnRXSTdmaGNTbzhPZjYrMlFV?=
 =?utf-8?B?NjlHY3o3VTdXNzEzOVpUZWQrdHNBWmkxZE9ucTNzYmdsZmdxcGFlUW5BYmY4?=
 =?utf-8?B?TzRIZDV3VkllRjVwT2RDbmJtNjhUV24vSmNQQ01JN3lBRjZtOTBDOHoxNjY4?=
 =?utf-8?B?S2g2RGhmZVFMUVNSNWFkVTZuWUdYVWZoNmhqa3l3Wmd5eG9EZ3hQTUZFTkkx?=
 =?utf-8?B?M2ZWTE5ETEF2TzVlMjR2dmFJdWgyRDRYclVtZFRlR05ZdHJrSDNWV3JrQmUz?=
 =?utf-8?B?UnFWa0t0aytoQ1ZmN3lDYjZaRWJnRnRxbm9Sa3Y2TDkzVzJUcXN4ZEtDeDVw?=
 =?utf-8?B?OXBHMnlQR2owYTNsZkNMWDUrWUN6UWgrdDF5Z1JadzIyR1M1aTZrTldKVUdI?=
 =?utf-8?B?VEYxSW0wSkcwblFiaHVIN2F0b20vd0RYTm5QV25nNjgxYmZoRDRLcWRSRTF0?=
 =?utf-8?B?L1FRcTFPYWdxcG1hbkxtbkNkaTkzY1VnVlZwQkozU0QvK2pYNkV2SHJKZDBQ?=
 =?utf-8?B?a3VRUDMvTDlqa2VwOWxnaHRKSHJTbXNHdUw0ZW1PR0JTV2d1NS9zUG5EeUQ4?=
 =?utf-8?B?TzI5NlcwVmV3WGdzb2Q2TnE5cThBckJTZ0IzMFBLK2NlMWRhbUJUemI1d1hz?=
 =?utf-8?B?MkRaRHNHQ2VvcTY3MVpIWS9KMWNJdWdUN2VUVU9DR2pWcEN3ZFpPSE1kbDhC?=
 =?utf-8?B?U3F3YzJOeHErSkdVQ1R5TnFsOU9VTkFTUTYyWVlkMHk5WHdHYy9KK1NCVjNG?=
 =?utf-8?B?S1lxbTBJOFJlS2lNYVZ4cmRBYzZpa0RDb1hxdmFlTzk2Z3NqcFdRc0ZhamRr?=
 =?utf-8?B?MzMreENTaUhXOTI5WERVU2F0cCtGQ2FnRExIa3QvWmlCcTZYSGNsRy9rd3lj?=
 =?utf-8?B?cS9tbTJWRVcrRHJTNUJnTm1MbXNwZmUxMllER2l6UWdWZG8zZEZRVEJmSThP?=
 =?utf-8?B?Uit2dkdwOEl4MHNjS3VjOVJhTjJoOHF4eHBHQWM5SDVNTkhOTkdQamJST3hq?=
 =?utf-8?B?ZjVZQ0hvcGtvZGpZdlErS2JEbG1JRTJsa3lBV2w2aCtrRURHRm9xa0sxZTht?=
 =?utf-8?B?UDZIUk9qbTJnWXZNMm14dENmd0o1VUpBQXBoZ0NnL2Y3U1oraUpJL3djK2s4?=
 =?utf-8?B?VGN0T1ZTOVZJeDVnZnNpWURsT09YSkRFSy96Smg2aFpWMGhtc05Fd0lIR3Fr?=
 =?utf-8?B?QVNHcVlKV21TMGdQWjR5OHpzZVV4dm9HaWhSRWhZYzJoOHlNVjllSFhzNzVB?=
 =?utf-8?B?UFRMMjZrNEl3YUxGS01qZ0pUY0haTFFLOEVEZlFoM1FOdWJlazZzS1ZieFpY?=
 =?utf-8?B?K3EyWlV1NHV0Wk1Ob0RKekxRTWlhL0NJa2lmam1TUjl0bDUzZTRlcGFEaFNi?=
 =?utf-8?B?VGtraGtkMlZmMUE0ZlJlc1VHenl1YTRObVNMNzVIS0JVY3VPbkRIdFhYeUsv?=
 =?utf-8?B?TXVTVHhFWTlhRnhEUDdxZHRiZG5qaFRMMDJDOEJQSmxJRW5kdldhR2I3aThm?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 00c75be8-9f27-464a-4afa-08da5fb7b3b9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 01:26:22.7296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ksge8d/K6ZYMmTYReHFMKI6CEiwCi625257Nxn1Q3StZhaJfQ56Vl3Nv0FRX+iAQZ/LZc7S0skWiVWWfbg8W75KM9ePbS/DatTkpOn8XP8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2537
X-Proofpoint-GUID: XpLljd9-4t-km_g_2FHWLmbS78HvVZvj
X-Proofpoint-ORIG-GUID: HOS4ASGnRX4Q3IjCGooSx4ajn7vII3Kv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_14,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207070004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 01:26:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167754

Hi K,

Add oe-core list and move poky to BCC to ensure follow to the main 
oe-core code review list.

On 2022-06-17 03:13, K. wrote:
> Fix missing write permissions to avoid problems with applying patches in particular on compressed filesystems:
>
> ERROR: perl-5.34.1-r0 do_patch: Applying patch '0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch' on target directory '/home/kayo/devel/elpitech/poc/openbmc/build/evb-ast2600/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/perl/5.34.1-r0/perl-5.34.1'
> CmdError('quilt --quiltrc /home/kayo/devel/elpitech/poc/openbmc/build/evb-ast2600/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/perl/5.34.1-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
> File cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm is read-only; trying to patch anyway
> patching file cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> Hunk #1 succeeded at 1147 (offset 37 lines).
> Hunk #2 succeeded at 2086 (offset 77 lines).
> patch: setting attribute btrfs.compression for btrfs.compression: Permission denied
> Patch 0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch does not apply (enforce with -f)
>
> Signed-off-by: K <kayo@illumium.org>
> ---
>   meta/recipes-devtools/perl/perl_5.36.0.bb | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-devtools/perl/perl_5.36.0.bb
> index 4456cdbcfb..6374717ab0 100644
> --- a/meta/recipes-devtools/perl/perl_5.36.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
> @@ -45,6 +45,13 @@ PACKAGECONFIG[gdbm] = ",-Ui_gdbm,gdbm"
>   # Don't generate comments in enc2xs output files. They are not reproducible
>   export ENC2XS_NO_COMMENTS = "1"
>   
> +# Fix missing write permissions to avoid troubles
> +# with applying patches on compressed filesystems
> +do_fix_perms() {
> +    find ${S} -type f ! -perm -u=w -exec chmod u+w {} \;
> +}

I've never done a build on btrfs let alone on a compressed btrfs volume.
This does seem like it should affect many patches and not just the perl 
ones.

Any idea why only perl was affected and why it only shows up on that FS 
type?
This seems like a work-around rather than a proper fix to me so far.

../Randy


> +addtask do_fix_perms after do_unpack before do_patch
> +
>   do_configure:prepend() {
>       cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
>   }
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#12822): https://lists.yoctoproject.org/g/poky/message/12822
> Mute This Topic: https://lists.yoctoproject.org/mt/91816797/3616765
> Group Owner: poky+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/poky/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux


