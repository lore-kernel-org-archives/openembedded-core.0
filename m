Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A995C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 15:26:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.75084.1673278001055348669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 07:26:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QNwXn12X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0373e3613c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309DIlBY013975
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jan 2023 15:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=LJnO6N25qBZPQIhwAb4sGquoBib4BP4eteIDCwrXntk=;
 b=QNwXn12XCB0i8GRgbeWL3dZRfsxH8VH7xpmrlVZVwtVuDtbdcNzoGfdnAOI0Ne4vhv3P
 kIgd4Kn+cVjYWIR9S6DUlUMsyqycJ19tILJZxsWhF0ueb4X+zpY8Z1j3fGzf6yVQAwpB
 Zn0Cj+6LGdJEXVnOx62SpxexW+rJa2RlcjtqPLHWjdN0VE6/HYQRMJI8z1bZLoCRw7dX
 K6+UfkPdNWJQDFhBU82uJqA89HnWGo0ef11rQLRyinW7uQkLSQCpxjSnFebKOgTneOKo
 iLyNsyY64DCvxs0j3U/k2BxR2qsAhoHX5h4scIVqa/4RuUnSyzXW99FgQsVLQF8PG/WE zg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mxwy2j1d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 15:26:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CY3uQzeiErpoYlYwxIMqQd88cDzAMitwWKLzWIdD5wU27IVF84TvZzAeap9Gz67ejS5oCLpK5uIHkiIRlyWTdyov6/sK/toqr/F1rJs9jGeN6AIiUIp0mvIFr6uvj1KonpVe4Lkf59aSkrFLaS9Bu4wjLMCFfSTgcT/8ic3iA77eh12ajKygagPAqtacy84OzfdM5scBiDds7RtnrHwm473eYDA9wZeInaUBKG32Q/uBB3CHY+CIRhHTeYSpo9FmE3pTn1b6LoP9W2oyP/BmIhtkFYoQnhJQns3p8v9YBMixqmISYi/MBn7tl+6x7GlR3yhs+8VthLEIRuECFWlmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJnO6N25qBZPQIhwAb4sGquoBib4BP4eteIDCwrXntk=;
 b=mCklmyHV6K3R8qIWwYZP7ob6Q+ZNOF8G3zHhSey42oeeUoG/BUAyK11T5S5RS35u7oVrEKfDJ6Uw9EqyNpbm+Z+i2TeKGEheG6IjllhPIusFIYE9fr+5OYDRgO+vOJzPm8soyIMfv8uHKYF28LqWMgEo46HQ2969EurjKuRHZDKHtJZFoq3A9VgXNMaUYmydJewV+W0klrlRp3/IhIvZb8O4oQ3hiNEkfcM+q5avlMsMgtvXeaYQMRhn/lwcjd3LY7EDh9KxHSr7bHbtEROSyoiwgHvElD9je/9ljoYts05TpgaYam3Ey0Na3NNciGaGz15LuxSDuUhZmvvJ6ceufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CY8PR11MB6844.namprd11.prod.outlook.com (2603:10b6:930:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 15:26:36 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 15:26:36 +0000
Message-ID: <0c102ec1-316e-0c3e-b88c-5946b0144049@windriver.com>
Date: Mon, 9 Jan 2023 10:26:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: libstd-rs: Build in the release mode to avoid error Issue:
 LINCD-7172
Content-Language: en-CA
To: Yash Shinde <Yash.Shinde@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20230109134019.995743-1-Yash.Shinde@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230109134019.995743-1-Yash.Shinde@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CY8PR11MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: 69bd786d-6c54-4a6d-b3c2-08daf255e50d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PXk5dKUfjETbAP7Eo2Jbq8ZBOA4ob9NLbPC1FYBZYVElTCt5mCDB1185N4dDUMfqjo63RfCGO9+akEfwoXIUrJxnyQz/zqyh2idm6l638tStpdmCD1oJwHa2BmmBgJQaKiDRcf0PVIB/CfkIhcfKLk/TBGQ+xOwAINvNz1mEURCo5WFvTotGOgmcI7zBEYa9Qam75KTPCEtq3Qv78i9JTq90b9TpYYAJlhEFB0YYqbW9aRkaj7R9Mv5qxTOfh+Ozk/BBWK5i/3yhdinM0eeMRZRHluZ8B0/DqWFOjrHxe8hqjJy4jSxLk+WrG0uwydo1DB8YVEF8rHerACP5tuNs0l+G52j+K49Gh26E2vRKBPnChDZLIbHbiMbpQ794B7WdiCqBsDt5QuTbdi5wQCLxRyQdpQbPHfBVizTXxOxLc2BruT0aVpzekHcALcJsPnMEgrb4jKF8H2dP7vkX4IHmdx3ht/KFGgl3pfwz7ZVlonbDzzpH9oEd7iAUZxf52tPLufV31OmAHxhg+Kn1bE138Tv2iO4g6u5iNCi3ox7zT2yLkz4i7JANUsLknPdNoiqfN2VkyFSqUp33dvOUBRUPdJCoX3WTA6xrxqJQewmJQs81yTbdsLiAgUtw5pl00psBuC3JHHdX34iwJxLr5qwtLffxYejcGKuY2Z01Z68/G/Gm93zQZ6pFVXQvOLXmnnwokZH+5Rsl+Znck8ZmDYCM4eCDFPvMrytSKotZz4WYxkLhMEUh3dQuAg3qF+2xo9YgXNv4d82xm32OmHu9vKlw8pkhgA7zP0gc1oVfPaCplpI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(39850400004)(346002)(136003)(451199015)(31686004)(41300700001)(4326008)(8676002)(66476007)(66556008)(66946007)(5660300002)(8936002)(83380400001)(316002)(31696002)(86362001)(53546011)(6506007)(107886003)(6666004)(38100700002)(6486002)(478600001)(966005)(36756003)(2616005)(2906002)(6512007)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TWlGN0cyNDNPVU1BMUQvTnh2NTV5UG1mcng4blBvWDRRTnBMWDEyOXBnTGtW?=
 =?utf-8?B?SDYrMWZjRTNBQkZVU3RKdzVIa2hoRW8xdi9EZXJiNy9nRjl2OThsZndCSHBB?=
 =?utf-8?B?SzNHOE9uYzV5V2VVRktyMzBSVEZtY0NndExXR1BDRGViTzgxcXlwdVhrZGlQ?=
 =?utf-8?B?Rm1TRXVwY0g3TnVaOTVETzZ5Qi9ITDBrdDEwVnVDZXAxOVFEcHlNcFBqK1BU?=
 =?utf-8?B?dFRRK1RSb2pNdSt5L1JsM3JpeHJGcTFXSExVdXE1SlJkTDZQRGRiTDIwQzdM?=
 =?utf-8?B?UTM5U2lZcldhY1BaYTM0ZVUwOHNzMEE5dUR5OHVOcUdVS0k0S0Q4RHQ3R3Vw?=
 =?utf-8?B?cnhxV0VJZkhnNm9Jd0duN05IdUszR2N5Vys3b2tVZEM5U2ZEeE9JVmx3YnFo?=
 =?utf-8?B?dnhtblJVc3RJRzNqZUJoamVhTGFLRGphd094b2syYVVwNTFESTUwaFNOY1Ra?=
 =?utf-8?B?QnlkZTc4emY2S3lNSjVnTCtnRGMvTk9hWlZMR1ZPdTd1bDRtUUpGVUlFOW1I?=
 =?utf-8?B?MzVUNmRRZWZuL3I2UjlQSDlEbEtYYk93c3IwWTlrekN4QVBUTmN6d0h3d3FV?=
 =?utf-8?B?TENKb1VRNDJKSEtVdXVCRTlXU2lvY0FOb2c2VkxRZTY5Y1gvdnF1TlY2Vytw?=
 =?utf-8?B?SUxVdGQrZ2RpYnNkZEVtWGtrcldja3Vaait3ZlJZV1dUV3dTTE53cUM3N0tC?=
 =?utf-8?B?ek9TSmNadi9PWnhWeDVDeDVtTUNTVERTeWJHVFliWmlTcmxneDFPVUt3aEUz?=
 =?utf-8?B?eEY1TktFdnZlSTZPbDAzaW5NVERjUVdpTFVDcDJQNUNad0pYNXgySUhTS0tw?=
 =?utf-8?B?c2RmVEdIUWxmdVMyZDhFY0JMd1Y0Z3FhSGJkS2NTeStTSDFIKy9jdEt4cGdK?=
 =?utf-8?B?czdBQ3pUVVlDZHl1SUt0L2J4V2sxeHRMaE1UbXV4Q09lS0RFaGFoM3k0eGQ3?=
 =?utf-8?B?NkdWTG1nWUZlY2xnc1NyYjZJRWRmb2JHbkM4cDh3V3lHM1RPcXVsZk5NUHoy?=
 =?utf-8?B?dVR0ckdFZ0d4VXRTTWQyMVZoUm4vWkpCWlNXS2pyVEJIRUpKd0o5c3dCVXhr?=
 =?utf-8?B?ZVk4N3NlWXFyVUVWWllOQmlJOHFpQzRBcjlCeWU4S2pPTDV2VEh1L1d1c1JC?=
 =?utf-8?B?aS81ZFlQejJkZjVXUXJpWklVMW9BZnQ1bWdFR0d6NUVKVUhkUjhBNGROeC9K?=
 =?utf-8?B?OFpXT0VmNlhpM1ZYSm9uWEYwRDdmYUZYKzB1MjlVS3BZWXVOR09nZ1NPdmM4?=
 =?utf-8?B?YUdPbnVHNnFiakpuVDJqUzBQVEpoMXBiMzlTT2VJU3ZTYXRBTUUwckpRY3pv?=
 =?utf-8?B?cnF0dVk1QTZBQXZlMURrUTVPODdCb0JJT3pXT21CWGFCbEJhNHJsMXVpdWlG?=
 =?utf-8?B?VjMyMkJXT3FEbFl2cHVJenZqY2liZGp2K0ptcXh0c0lONFJEZUxubndIZ0Y3?=
 =?utf-8?B?b0JNOXdLWjZGUmc3T0M0bnFudGNVcXlJdlJua3NBWEt0QlZESzdjT0E1bE5s?=
 =?utf-8?B?ZjZaWFFhdlhnSXltVUI5ZVhaejJrOGtvbzJLL2dsQ3pBcEtOdlJpQ3lib3h2?=
 =?utf-8?B?ZDVSYzlwUk5uQ2o3NC85YTlkc0tMMUVqRC9xdmd4N2swNW9GRjZ5VHNzaita?=
 =?utf-8?B?WGM3ZXgzZUhjUm5uaE42NTl5RkdvTTVhTWdEZHZwZlRNUVkzMThMNDBEQzZX?=
 =?utf-8?B?UnJnbEhRc0plYmdHWnE4R3lNSFBWMDN0ZzN6ZDMxRjQzQ2p1Y3hxYnlIeXV2?=
 =?utf-8?B?a1c2MllsYUFkak4vNjlZbnJPZVZaQzAwQnNkWE9ZR2s3akdZRStEN3lUR1dY?=
 =?utf-8?B?RGsvcXdVSDB5TjlLSmRoampKd25kdXF6MVFEbnFjME1YOE9aVFphT1BORVcr?=
 =?utf-8?B?UHo0bkZBaDE4RWZ3T1RYbUFjVVlvOXhndGJQNURieHJnOUJocmV4NU5oelQ2?=
 =?utf-8?B?QmVOeXZHRmU0Nit1emw0eUpZbDJ6UzdoS0o3ZU44UjRkUGxjSHpyL21BOWh1?=
 =?utf-8?B?bm1QN252bGtNL01zaUlpOVFQT3E2dGVSNm85VEh0RlllRnJzTDRpdEtwcENj?=
 =?utf-8?B?Szk2TG1Ray8wSjNxY0g3aWx0dXYrM0xXZ2RvYjFGVytuK1FyRDlSK0tNWFRS?=
 =?utf-8?B?OGNlYVVXNUhNYlJ0N2Y2Y0ZHR214UVRjRGF6VkxkUHpBKzJqS1ZzUjZuMW9I?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bd786d-6c54-4a6d-b3c2-08daf255e50d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 15:26:35.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZkmXjcDKD2farLR7eRKYU2JQaC5WivTRxzhNVPL2xJPBtueO/vi3zTtTeyCu9u/RSEXexpL36EwIbZSLEsSV+6X9D8V2qdJ379LtXk4MKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6844
X-Proofpoint-GUID: R0Zdc7WUsCUXqUDjTk0XCMwxyr2kzmEt
X-Proofpoint-ORIG-GUID: R0Zdc7WUsCUXqUDjTk0XCMwxyr2kzmEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_08,2023-01-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 spamscore=0 malwarescore=0 mlxlogscore=973 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 15:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175691

On 2023-01-09 08:40, Yash Shinde wrote:
> When mozjs in firefox is built with DEBUG_BUILD = "1"
> in local.conf, it will fail with the following error:
>     rustc-1.56.0-src/vendor/compiler_builtins/src/int/specialized_div_rem
> /asymmetric.rs:57:
>     more undefined references to `core::panicking::panic' follow
>
> Switch to building libstd-rs in "release" mode as that works
> around the issue and builds mozjs successfully. This is a
> work-around that can be used until the root cause of the debug
> build error is resolved.
>
> (LOCAL REV: NOT UPSTREAM) -- to be sent to oe-core
Drop the line above, it's only used internally for WR Linux.
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>   .../rust/rust/LINCD-11387.patch               | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
>   create mode 100644 meta/recipes-devtools/rust/rust/LINCD-11387.patch
>
> diff --git a/meta/recipes-devtools/rust/rust/LINCD-11387.patch b/meta/recipes-devtools/rust/rust/LINCD-11387.patch
> new file mode 100644
> index 0000000000..3e84aa7232
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust/LINCD-11387.patch
> @@ -0,0 +1,43 @@
> +From 45731fb0f735bc287e56b6fd6c93b56966195647 Mon Sep 17 00:00:00 2001
> +From: naveen gowda <pgowda.cve@gmail.com>
> +Date: Mon, 29 Nov 2021 21:40:27 -0800
> +Subject: libstd-rs: Build in the release mode to avoid error
> +
> +Issue: LINCD-7172
> +
> +When mozjs in firefox is built with DEBUG_BUILD = "1"
> +in local.conf, it will fail with the following error:
> +   rustc-1.56.0-src/vendor/compiler_builtins/src/int/specialized_div_rem
> +/asymmetric.rs:57:
> +   more undefined references to `core::panicking::panic' follow
> +
> +Switch to building libstd-rs in "release" mode as that works
> +around the issue and builds mozjs successfully. This is a
> +work-around that can be used until the root cause of the debug
> +build error is resolved.
> +
> +(LOCAL REV: NOT UPSTREAM) -- to be sent to oe-core

Drop the line above, it's only used internally for WR Linux.


We also need an upstream status.
If you haven't done so already please find and report or
create a new upstream issue to track this problem and include
it as part of the Upstream-Status:

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

-> 
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status

Note that the Upstream-Status is mandatory for oe-core.


../Randy

> +
> +Signed-off-by: naveen gowda <naveen.gowda@windriver.com>
> +Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> +---
> +meta/recipes-devtools/rust/libstd-rs_1.66.0.bb | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
> +index 8802e9790c..c5295187f8 100644
> +--- a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
> ++++ b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
> +@@ -24,9 +24,12 @@ RUSTFLAGS += "-Cembed-bitcode=yes"
> + # Needed so cargo can find libbacktrace
> + RUSTFLAGS += "-L ${STAGING_LIBDIR} -C link-arg=-Wl,-soname,libstd.so"
> +
> ++CARGO_BUILD_FLAGS:append = "${@' --release' if d.getVar('DEBUG_BUILD') == '1' else ''}"
> ++
> + CARGO_FEATURES ?= "panic-unwind backtrace"
> + CARGO_BUILD_FLAGS += "--features '${CARGO_FEATURES}'"
> + CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
> ++BUILD_DIR = "release"
> +
> + do_compile:prepend () {
> +     export CARGO_TARGET_DIR="${B}"


-- 
# Randy MacLeod
# Wind River Linux


