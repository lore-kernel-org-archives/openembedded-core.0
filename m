Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D15BFA3741
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 17:20:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.228.1666891253244713591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 10:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YNdNKw8Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7299a433e6=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29RCcK89003029
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 10:20:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=CFkb5JITIb9H+XVwgIYpUTrZ+QfNWSEKb5TZK1w5474=;
 b=YNdNKw8Q8CQvjAmDqzEouLYD1s05InRk5vi67zQBYNX46eG7o23Nup+9tdKWpRk4lOqh
 NFl2pSh67LEc6ND8+exvruA5iP3F7EAXR8d7QA2V1UuM79uYB7jWNcvZCpA60kZGwNtz
 huFjbTl5Pj60ozlnkFRDIX0xveFbiiXE+tbnxVPGl3MAqYveIQZS+Nd20f45umrjv2iY
 iTE+tm+SypfemrYjh014pErrN1PawSQuu1C0xGiduoAdQl5Hvk+jblukxTkkBAVAfmFy
 xoTZ3c+nWy9o3Jinyr/ePFUNXyM/0jKAI7qOnrOSTjO/JZd6qExmHgAUEN2V19gRmclk vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg0r0p7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 10:20:52 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29RHHRqD028150
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 10:20:52 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg0r0p7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Oct 2022 10:20:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZCXTn8Ite9AhlA0+1j7BzAhS6SE15HhkG2r2SLxmMFm89vE9Jt+ifkcm7zQO2aUYpXGOUhEIzTbGcM1enpiOPzyHiSbBwk7ZNgPfTyNIBm3sz9ujjvtFCWSlELyo23H0yFxmTsNEHknGUA6bolpytsvV7XuiT4UqBz8B9jDJGC7i794T11Kx+yJ9tjKcDb3CVBWEI6VOaRMa/mLXH/xqQA9LLLiOuqz0SsEhDgcbA3JFfwVkWyh0z9cgUsJ/ODh0HCtutaJrp5ZV779KLNuJMVEo/SVYVNZafuEiaorCbW4vuYy4RB5Fsdh5/JtuCx6+5UDhQ0hBJcsECBgDvyIKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFkb5JITIb9H+XVwgIYpUTrZ+QfNWSEKb5TZK1w5474=;
 b=ZlmMVzJmIfBYvnkf7gBVHuGgm2auwrmgvGUcV4D78TN2056vn8Gu5FBliFW0UxBa4cCV7mqwzcCm878VuFiEQx8AbuG/Mn8zwnsa9C9e/Xe8V+232lbrtfkpFQYViw941zhKBUqTBG/9aIJB5jwZCPexTuAnbSbhnt4eEld3vh4O7HZJC0UXsRudJ1JCCx2ggCi4oQgxJvzEVjMiWn69UmGBWTWHWgtX9g/XHSvBYnPj9jFcHEOTih8AfrKJyCCl5FSLkKmbV7L2qLFTIdquqC00sijG2DRu/7g2zuxf9jRRxF8UfRcbOygeZuT3G59AvWPm+/LFc3ZpGp5tRLlfEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Thu, 27 Oct
 2022 17:20:48 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043%6]) with mapi id 15.20.5769.015; Thu, 27 Oct 2022
 17:20:48 +0000
Content-Type: multipart/alternative;
 boundary="------------jca0saRqW8uMG0FDmQ0uraJk"
Message-ID: <be23f9e3-1527-df63-938f-6611de6b242f@windriver.com>
Date: Thu, 27 Oct 2022 13:20:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [OE-core] [kirkstone] glibc: stable 2.35 branch updates.
Content-Language: en-CA
To: Yash Shinde <yashinde145@gmail.com>,
        openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
        shivams@gmail.com, sundeep.kokkonda@gmail.com
References: <20221025091832.535612-1-yashinde145@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221025091832.535612-1-yashinde145@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::34) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SN7PR11MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 8093d699-57ab-4794-132a-08dab83f96fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7AshfyPyQHjFL9sx3mRPJTYY1bHKmV+JClKs6/Q74spnqAGu0PPg5wfx1Qx8R8M4nJq/t0qGVGqNdqgNGVftF2gkx0EkqMmrW3d6GHqu/o+1U2FuqGRvVydMA3IG9Mz5RtTyg5zqKLsk1Lm+xUYSKkWAWKLhRDzzWcdV/2KZlTYvmyDqpndvF5QX8aAjc7dyVVMzmSo4ZGzXummhFSngYCNB189KNluZ1JA9zwU8e4cW910vFdcg/keBba3XgLzgV9F1RskyJi8mQVxKnqqrnLz5pNcpz24r5XJqQWmRMlLorcNeYbolOpuqffDQbCyqPAB717ffsdDZvfQaT7TliHlI1NC3lg+9RksFplSzrFeBSlWUFSomMSqH+phIZ9AeQ+6s/e3CbLBiMYSkde1/BIMw7BsmIM7Vg/fOSc3Rvc69tM1pt2VnQl6iW3f/fGU12aRcv6Y+KRngUZz+Dh78CH3vPPkZnnAmAKgWrheK0D6Mt4eTknEKIRoLDfxdnRJYe4m5X9gkiZm5806qahoNH8ngBNIbp+K4Km27oVWOvt4THa9D5sRLugHHlq4RIc3lYCYBNYuyGivg0MpepNge/bAlNHlqMH6ipwtMCC4uvc86W/8/H9grshOQqHeUyBeCM52iZ2DFX03s1et7gGmphuS7zftzDIZiLaQSmJ19eWZBVN3mpqtUsFsnisbSXzTN6TBIkwIr2rV1Mpmlqicclx6+VpVwkFpd8aUhOyhsiQsfkpOxwlNi9dJ30bDj/HKdu5J89pU2WqOTaYsZib9P0iIJJA+f4YeSd60lUKxWXJez97kq0jsWP5c+/SF3uChtTR3CwhxBP5DfHqvb7MLjj6iKGPwajEoiLuu0Scy3e23vfANaXScQRMRCx/jg6Cb8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(451199015)(86362001)(15650500001)(83380400001)(2906002)(31696002)(4001150100001)(478600001)(966005)(6486002)(2616005)(186003)(38100700002)(41300700001)(8676002)(66476007)(66556008)(66946007)(4326008)(166002)(316002)(110136005)(8936002)(5660300002)(31686004)(6666004)(53546011)(33964004)(6506007)(66899015)(6512007)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHFyMUZCaTk1Umw5dnNTUmxZWVBJQURFRCtYcW9US3RNOGY3SG9ScU1sNjc4?=
 =?utf-8?B?T0dyNVNNK01pczVHMzdXaHNzK29nOWlHNURwZjVZOGFTeHRjbXB0Y2xhSkts?=
 =?utf-8?B?aGlZNGJrdTJMZnlFTTYydW93emV3NVZ1bzBWWHlJbk9CWTRjTlJBM0JreHBx?=
 =?utf-8?B?dXdQMVBVdW9sNTQzWVhOOEFjQXhWcEtBdjFVQXZRcm56RWFHQnk0eDlSWVps?=
 =?utf-8?B?RW9qZnZsV0JueFNoOExZWHFXTjRWcHNyWEJpQ0RtbFVsOWpTb09LNk5ZUDFK?=
 =?utf-8?B?OGFtVE13Rk9GN0xuNEhmVEhUZDljZjNOOHFUTG1tRmY2QlJ5akQrVjludlNO?=
 =?utf-8?B?RllrQS85eW4zK0I2SmJPNXowWU5OMXJIdGliaVhWOGUxZzRiZU5LT21hOVZt?=
 =?utf-8?B?aU9NdzR4cEt5UUllRGNGYmtERGl5cXhFaWdkblJKV1lhUHlRWXM3ZWFmM1V1?=
 =?utf-8?B?WjJtdGJGM2VXRUpqaUdUOTI4OHhLb2J5d3oxbHF0WHdIaWhtTHowaE9lRTNO?=
 =?utf-8?B?R0VBaHMyamJQMHpTY0cya1NtVXFDU2F5bUFteHFqZ3NQMTBCakVnZFlqczZ2?=
 =?utf-8?B?MTUxTEs1ZjhzTG04dW9EMUtUVHlrdHN3LzNUUElYa21rb3k4TGFtRng0dTRK?=
 =?utf-8?B?NFBWWEw3L0lVb1loQjA5NytzNEF5bitOUkJsNnpTaDVpemtFeFA1M2ZiQndM?=
 =?utf-8?B?ZnRLeFZwMVdXTlRRaTFQZ3grdEV3VzRWREYrb3BQRHVYSmV3UkRrdi9xUW50?=
 =?utf-8?B?VVBEbzZqVlEzaXprR1MycUFGRkZ3Mk9IOUxxb0g5bEt3NURYcWVnbzV6Nisv?=
 =?utf-8?B?KzJ6WE5EK0E4d3MwcU1QZVZ4TWZqYWJkSzZkQlVobkRwYjZ6NnUvTXpjZjdO?=
 =?utf-8?B?QUJhSDFOcGk2OFl4QUFTQnRSL0xEdmtoWjNUYmVCQmxZV2pMdWxiL2tBdm1B?=
 =?utf-8?B?S3pQRDFYVy8zY2NneUh6cjU1ckV3MFplb0syMGlNcDA4VEVRSWJ1STByZ0l4?=
 =?utf-8?B?WjNHOVdWSy92Q1hPbUJtWUZnVklhMHR0YXJ1Uzl4aFZQMXNPUFRRZGN5eEh1?=
 =?utf-8?B?eURlQ2Z1MGhXZjJJSjgrakZYQkhXNmJlK0RxbklBQVErS0hrMVdLYTNscGZY?=
 =?utf-8?B?UzhIZ0hZQThBMXVBNnl0NC9KY2xvd3JMQ1l2VjVrUnpsVlJ0ZDFTWUFpdFhM?=
 =?utf-8?B?NjBYMyt1UGxIWHNZRWU4T3JGLzZ1aFdvMXRKclFYa2VFa2ttcmh3QkszVmkr?=
 =?utf-8?B?d2dzanljR2Q3RTJGU0o3R05YamJTaEJsc2c5bkpxeE5QLzBQRjhjSDFEMUda?=
 =?utf-8?B?ZXYrRzdzK1hVb3FBUUtRbGx6RU9BR2VVb2hNTmtiSHBJR2RmM2dvQTBRUXJS?=
 =?utf-8?B?UUJtYWFvbk1KaHpKL0N2UlVFZFd0YVpTaTRab0xQM2JQVjVBMkh6Z1RJY2NM?=
 =?utf-8?B?SjVIT3ZmQUd0OVRqOTVCamhobkw4NzJkSVphZ3lBRVl1K3dlWG01T0kzRzBl?=
 =?utf-8?B?S0UwdHpJeUQ2S24vUk5DS1NQL0RVdTNWTER0RHpUWHRxclJGSENhNzRwUWJX?=
 =?utf-8?B?OXNLQ3BqamZsRHpmMzF3bXRqeWw0eTgvVWQyZ1ZBdDJFZm8rdTRtN0tydE82?=
 =?utf-8?B?bnRCSE8wcjJZa2I5M3I2N2pZSGpSQ0VRaHlDRGU5eVdnVXpyS2RDWGw3eWll?=
 =?utf-8?B?MXhLck12eTVqMzEyc2ZmMjVCTmtUN0JwRE5jdnFMWXFVN1IrWnIxandFSU9z?=
 =?utf-8?B?QmdWNDVsLzhPUytyMS9aR0VnTllHbml6NEthSzdidWNOSU45R3BrcGJNcHgr?=
 =?utf-8?B?Z0g3bXZYN29LRmUwR1VHRVRoV3FwYlpORjJpSUJMOEFlNXdHaTNoeldOcWp0?=
 =?utf-8?B?Y1RhZld0anlLQUZrS2cyNXhrb1U2U3hlVkFIZ28waFd2UkI3SHJaQmd1NFNZ?=
 =?utf-8?B?OEI4TVI0U0tKL2hRK3VHenpCY1VhaDdhZDVIS1lUUUY2VkVYZE53em9Wbmo4?=
 =?utf-8?B?SHB0enBPaW1oeGhsY3BRMld0WjJJWFVxekxFaVF3TExZTFA5cVg1OXNUVE9F?=
 =?utf-8?B?ZFJteEwvNFJCOE9RUnFMKzIwZnAxcWZrT0hJZWcrU1RMRzRubmRzbDJqOVZS?=
 =?utf-8?B?ZVNER0N4SHFaN3p6S0lxQlNWUFlDWGg2azY4WEo2OXBYUW1qT2ZJZGFRNFFK?=
 =?utf-8?B?dHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8093d699-57ab-4794-132a-08dab83f96fa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 17:20:48.2861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gE17jDkbJxavn37aw6vXBsBsWkpwoxjoexwOBHZ/gO5EfhXgUOiPZTH2gElWNRHqyQtCYlUa+bLpSiA95Jz+nYVOb+jkVtQEowCi3HL+9ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
X-Proofpoint-GUID: SBG3xh4_TzwwSv-L_4GUR0NxWs4hapqh
X-Proofpoint-ORIG-GUID: FUPAOaKxXm_3Ql1uQbm7S71CHefrWTAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 17:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172195

--------------jca0saRqW8uMG0FDmQ0uraJk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-10-25 05:18, Yash Shinde wrote:
> Below commits on glibc-2.35 stable branch are updated.
> 8d125a1f91 (HEAD -> release/2.35/master, origin/release/2.35/master) elf: Do not completely clear reused namespace in dlmopen (bug 29600)
> f8730697d2 nss: Use shared prefix in IPv4 address in tst-reload1
> 135c29bf9c nss: Fix tst-nss-files-hosts-long on single-stack hosts (bug 24816)
> 767c99850b nss: Implement --no-addrconfig option for getent
> bca80a916e nscd: Drop local address tuple variable [BZ #29607]
> 20152a849b x86-64: Require BMI1/BMI2 for AVX2 strrchr and wcsrchr implementations
> 02aa1f4a5b x86-64: Require BMI2 and LZCNT for AVX2 memrchr implementation
> c85a45acac x86-64: Require BMI2 for AVX2 (raw|w)memchr implementations
> 1523fbedff x86-64: Require BMI2 for AVX2 wcs(n)cmp implementations
> 7e1326c43a x86-64: Require BMI2 for AVX2 strncmp implementation
> 6260de8867 x86-64: Require BMI2 for AVX2 strcmp implementation
> 0161ebf15b x86-64: Require BMI2 for AVX2 str(n)casecmp implementations
> 97ff96b0e1 x86: include BMI1 and BMI2 in x86-64-v3 level
> a6d2e2c192 hppa: undef __ASSUME_SET_ROBUST_LIST
> 562e5b2821 hppa: Fix initialization of dp register [BZ 29635]
> e36aeeaf08 nptl: Add backoff mechanism to spinlock loop
> 4f3c6dcd20 sysdeps: Add 'get_fast_jitter' interace in fast-jitter.h
> a7d5383328 m68k: Enforce 4-byte alignment on internal locks (BZ #29537)
> dee4146cec gconv: Use 64-bit interfaces in gconv_parseconfdir (bug 29583)
> 6fea8e6b94 resolv: Fix building tst-resolv-invalid-cname for earlier C standards
> 649213ae27 nss_dns: Rewrite _nss_dns_gethostbyname4_r using current interfaces
> 4a214c7448 resolv: Add new tst-resolv-invalid-cname
> 519e1b0251 nss_dns: In gaih_getanswer_slice, skip strange aliases (bug 12154)
> ee74c14325 nss_dns: Rewrite getanswer_r to match getanswer_ptr (bug 12154, bug 29305)
> 692fc980eb nss_dns: Remove remnants of IPv6 address mapping
> def97e7f71 nss_dns: Rewrite _nss_dns_gethostbyaddr2_r and getanswer_ptr
> 51b6c3c28b nss_dns: Split getanswer_ptr from getanswer_r
> 492d259ebc resolv: Add DNS packet parsing helpers geared towards wire format
> a333ba1d50 resolv: Add internal __ns_name_length_uncompressed function
> d7c22ec359 resolv: Add the __ns_samebinaryname function
> 83b09a8e86 resolv: Add internal __res_binary_hnok function
> 6e56f918a8 resolv: Add tst-resolv-aliases
> fae10fcb3b resolv: Add tst-resolv-byaddr for testing reverse lookup
> d883d02008 elf: Implement force_first handling in _dl_sort_maps_dfs (bug 28937)
> c15c0f1985 elf: Rename _dl_sort_maps parameter from skip to force_first
> ff344711ea scripts/dso-ordering-test.py: Generate program run-time dependencies
> f4687bb416 elf: Fix hwcaps string size overestimation
> 55a636430b Use __ehdr_start rather than _begin in _dl_start_final
> 61e15f6815 elf: Run tst-audit-tlsdesc, tst-audit-tlsdesc-dlopen everywhere

Thanks Yash.

There are more commits that I expected but what can you do!
I think this will go into the 4.0.6 since it's only a few days to 4.0.5 
build.

# YP 4.0.5 build date 2022/10/31
# YP 4.0.5 Release date 2022/11/11
# YP 4.0.6 build date 2022/12/12
# YP 4.0.6 Release date 2022/12/23

Next time, we do the update try to send it 2 weeks before the build date
so on or before Nov 28th.


What test results for this update do you have to show Steve?

Please present the results and put them in context by comparing
them to the previous tests without this update and summarizing
what you think of any new failures.

Thanks,

../Randy


>
> Signed-off-by: Yash Shinde<yashinde145@gmail.com>
> ---
>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index d3cea19f9c..7d7db46c2f 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>   SRCBRANCH ?= "release/2.35/master"
>   PV = "2.35"
> -SRCREV_glibc ?= "f8ad66a4cab14ed294bf50e7a9eddb73da6cf307"
> +SRCREV_glibc ?= "8d125a1f9145ad90c94e438858d6b5b7578686f2"
>   SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
>   
>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172125):https://lists.openembedded.org/g/openembedded-core/message/172125
> Mute This Topic:https://lists.openembedded.org/mt/94554674/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------jca0saRqW8uMG0FDmQ0uraJk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2022-10-25 05:18, Yash Shinde wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221025091832.535612-1-yashinde145@gmail.com">
      <pre class="moz-quote-pre" wrap="">Below commits on glibc-2.35 stable branch are updated.
8d125a1f91 (HEAD -&gt; release/2.35/master, origin/release/2.35/master) elf: Do not completely clear reused namespace in dlmopen (bug 29600)
f8730697d2 nss: Use shared prefix in IPv4 address in tst-reload1
135c29bf9c nss: Fix tst-nss-files-hosts-long on single-stack hosts (bug 24816)
767c99850b nss: Implement --no-addrconfig option for getent
bca80a916e nscd: Drop local address tuple variable [BZ #29607]
20152a849b x86-64: Require BMI1/BMI2 for AVX2 strrchr and wcsrchr implementations
02aa1f4a5b x86-64: Require BMI2 and LZCNT for AVX2 memrchr implementation
c85a45acac x86-64: Require BMI2 for AVX2 (raw|w)memchr implementations
1523fbedff x86-64: Require BMI2 for AVX2 wcs(n)cmp implementations
7e1326c43a x86-64: Require BMI2 for AVX2 strncmp implementation
6260de8867 x86-64: Require BMI2 for AVX2 strcmp implementation
0161ebf15b x86-64: Require BMI2 for AVX2 str(n)casecmp implementations
97ff96b0e1 x86: include BMI1 and BMI2 in x86-64-v3 level
a6d2e2c192 hppa: undef __ASSUME_SET_ROBUST_LIST
562e5b2821 hppa: Fix initialization of dp register [BZ 29635]
e36aeeaf08 nptl: Add backoff mechanism to spinlock loop
4f3c6dcd20 sysdeps: Add 'get_fast_jitter' interace in fast-jitter.h
a7d5383328 m68k: Enforce 4-byte alignment on internal locks (BZ #29537)
dee4146cec gconv: Use 64-bit interfaces in gconv_parseconfdir (bug 29583)
6fea8e6b94 resolv: Fix building tst-resolv-invalid-cname for earlier C standards
649213ae27 nss_dns: Rewrite _nss_dns_gethostbyname4_r using current interfaces
4a214c7448 resolv: Add new tst-resolv-invalid-cname
519e1b0251 nss_dns: In gaih_getanswer_slice, skip strange aliases (bug 12154)
ee74c14325 nss_dns: Rewrite getanswer_r to match getanswer_ptr (bug 12154, bug 29305)
692fc980eb nss_dns: Remove remnants of IPv6 address mapping
def97e7f71 nss_dns: Rewrite _nss_dns_gethostbyaddr2_r and getanswer_ptr
51b6c3c28b nss_dns: Split getanswer_ptr from getanswer_r
492d259ebc resolv: Add DNS packet parsing helpers geared towards wire format
a333ba1d50 resolv: Add internal __ns_name_length_uncompressed function
d7c22ec359 resolv: Add the __ns_samebinaryname function
83b09a8e86 resolv: Add internal __res_binary_hnok function
6e56f918a8 resolv: Add tst-resolv-aliases
fae10fcb3b resolv: Add tst-resolv-byaddr for testing reverse lookup
d883d02008 elf: Implement force_first handling in _dl_sort_maps_dfs (bug 28937)
c15c0f1985 elf: Rename _dl_sort_maps parameter from skip to force_first
ff344711ea scripts/dso-ordering-test.py: Generate program run-time dependencies
f4687bb416 elf: Fix hwcaps string size overestimation
55a636430b Use __ehdr_start rather than _begin in _dl_start_final
61e15f6815 elf: Run tst-audit-tlsdesc, tst-audit-tlsdesc-dlopen everywhere</pre>
    </blockquote>
    <p>Thanks Yash.<br>
    </p>
    <p>There are more commits that I expected but what can you do!<br>
      I think this will go into the 4.0.6 since it's only a few days to
      4.0.5 build.<br>
    </p>
    <p>
      <li style="color:black;margin-top:0in;margin-bottom:0in;mso-list:l6
        level1 lfo11;vertical-align:baseline"><span style="font-family:&quot;Arial&quot;,sans-serif">YP 4.0.5
          build date 2022/10/31</span></li>
      <li style="color:black;margin-top:0in;margin-bottom:0in;mso-list:l6
        level1 lfo11;vertical-align:baseline"><span style="font-family:&quot;Arial&quot;,sans-serif">YP 4.0.5
          Release date 2022/11/11</span></li>
      <li style="color:black;margin-top:0in;margin-bottom:0in;mso-list:l6
        level1 lfo11;vertical-align:baseline"><span style="font-family:&quot;Arial&quot;,sans-serif">YP 4.0.6
          build date 2022/12/12</span></li>
      <li style="color:black;margin-top:0in;margin-bottom:0in;mso-list:l6
        level1 lfo11;vertical-align:baseline"><span style="font-family:&quot;Arial&quot;,sans-serif">YP 4.0.6
          Release date 2022/12/23</span></li>
    </p>
    <p>Next time, we do the update try to send it 2 weeks before the
      build date<br>
      so on or before Nov 28th.</p>
    <p><br>
    </p>
    <p>What test results for this update do you have to show Steve?<br>
    </p>
    <p>Please present the results and put them in context by comparing<br>
      them to the previous tests without this update and summarizing<br>
      what you think of any new failures.<br>
    </p>
    <p>Thanks,<br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20221025091832.535612-1-yashinde145@gmail.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:yashinde145@gmail.com">&lt;yashinde145@gmail.com&gt;</a>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index d3cea19f9c..7d7db46c2f 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= &quot;release/2.35/master&quot;
 PV = &quot;2.35&quot;
-SRCREV_glibc ?= &quot;f8ad66a4cab14ed294bf50e7a9eddb73da6cf307&quot;
+SRCREV_glibc ?= &quot;8d125a1f9145ad90c94e438858d6b5b7578686f2&quot;
 SRCREV_localedef ?= &quot;794da69788cbf9bf57b59a852f9f11307663fa87&quot;
 
 GLIBC_GIT_URI ?= &quot;git://sourceware.org/git/glibc.git&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#172125): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/172125">https://lists.openembedded.org/g/openembedded-core/message/172125</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/94554674/3616765">https://lists.openembedded.org/mt/94554674/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------jca0saRqW8uMG0FDmQ0uraJk--

