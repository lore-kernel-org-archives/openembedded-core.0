Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBBEC54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 02:20:02 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.82])
 by mx.groups.io with SMTP id smtpd.web10.76439.1673576396637608530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 18:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=Sr6KMN5t;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.102.82, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjwJAxTOhPn1vLQ2t+wjkUZTRjMURVZi4jJXERO11RjcZs6p09KrBcIUSfNGADuZatGRRtPzj0qVrQWRoFc4Awxzc8OBh6NR6kL1x6QC+Ed6Wgum5E2xuqcMrtSV/XSFUdFHMx142+X+XCFtFCziUMLarS512g7iqXCMDjdSBnn6sCFUcMwkDqZVNCibgKXJKQNw7EDh5biT1sFWRu5j7ou6qGL3Asd8Roih9jhxsDCSGPQ29PZOY6l7HWybleIk6RIzQ1o4foUvlhyeIq9EsPFP7Sbm7Q74HseRhVZ09bI2udCcg+JPsaKEMGc+aEDQH+0uUw3rkBdebH//2UdmwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obhD5h5sjNN90PsUSYli7J/VRAjoebFTOGQxGLYGxeg=;
 b=Uk51Q3VEZQhcoeGNQxg0QhmqsKVbrz4uKpmBQKnuSP2qgUv6/C/NKNrySQLqh4wO/F89DmnBZSpk+BbeRCKyPXQffOn3klIa18YfgLerSpkDLAyTyLrOOliwCMdUzynYj8AB7zzXPttunTs+Jn1t1PyMYSk/rQM2zHql3crWR0s5aJIzDDw/TOnGD1shVQAiQZJzaz0ji9he5PhbGle8axWfZcx1sVNcwKkhmw1fw43YNqXWimxuXAKhBoC8C8B2eLRt1BG+/+adTzKB8xwuIQJDQQhmVSYXeg94HCPBXmxT8lqMH1yJHO/cRj4Hzx6o+Bk6igO/FW23TuLKwEfygQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obhD5h5sjNN90PsUSYli7J/VRAjoebFTOGQxGLYGxeg=;
 b=Sr6KMN5t9IWKnylqmEpU2ecslSZYpdBDuyl+8HRGqjByTjNes7wPqZyOlLlMCD+JwsUPNT7xeY6xzlYrXSbfrxSbmvR8Nz/f7dqI7CfMBqx0tXQ4NCq4buvFu4wBmRnmF4ieZiTS+ryvEeTQgsrSdiNshV+LlZVWXetSBwkGs60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by DM8PR12MB5397.namprd12.prod.outlook.com (2603:10b6:8:38::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.19; Fri, 13 Jan 2023 02:19:54 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752%5]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 02:19:54 +0000
Message-ID: <89dd40da-14b3-7535-0177-acce59fa087c@amd.com>
Date: Thu, 12 Jan 2023 19:19:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [OE-Core][langdale][PATCH v2 1/2] kernel-fitimage: Adjust order
 of dtb/dtbo files
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>,
 "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Cc: "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
References: <20230108172535.2366114-1-sandeep.gundlupet-raju@amd.com>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20230108172535.2366114-1-sandeep.gundlupet-raju@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::26) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|DM8PR12MB5397:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a704bb-5938-4963-b674-08daf50ca89a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kHPFbtvflqsHqRjlrHOWcCTkZx/v+4xUvbhkKNjjFRBPzlNUM9AqzmltIfehKDDv10klstZZHE2ZQoyO/7kYmFHc0blgFewT7UP+N6Yw04qOqZsNPcMu4Mb95s24UTK8WYk/mtknAKnbvVn5WhwNHTOcy9au3d/qjtKUE1voysP6codn1LxqXIkHv04WXBAY0+qBQ4DwyKoJakvQGuzh2qsGhfwsne6cM2g67lYIG/sw7OPpK50OKH0gt8AmnRNF48l4DopLV2e1zTpaiPF+6I59esyiBLt16a3CEGmeAEIovPUnL5+DllEcdfEEhbTRnsP8n2dOsrpnTS/41R8zEqU6D8TdtjES8TN0paiR5PNwfATEV7/ayv/wNg1IanBhSBrDucvAh0ave2ilCf+ZP2gcSCN0HMtG6j/NxfDwcDOlaIEEKPW+uPQxwbHdowDPIKl9hM6rKBlJgsghkXbddKiYdSe6J0cw+SF66HedblI+eAgH9BFOps9tFxdllMP79D7Y4s72eCiogjNbgoIggKqTrbvrR93X9oBQ38Jv7pOowmPsHUX7qLJcTWRKNtlKRjYEt6jf+zRwg8NCOtPbvwKQcuarxk8p/egEzOgbPlInz7s8D8YrXPBtP9wSw3NfX9rI8XkUWAA6LI1gKhM3rC5JCpExxgxbvJmky+c/esXQs/qazNuopEAKdnraHGJjuILLT8iUMZcHjZ4fDPHCoRPzxUgr4qC4jajI2Ayd9JI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199015)(6512007)(6486002)(31686004)(478600001)(186003)(26005)(110136005)(66476007)(66946007)(66556008)(316002)(53546011)(2616005)(6666004)(6506007)(4326008)(8676002)(86362001)(38100700002)(8936002)(5660300002)(41300700001)(83380400001)(31696002)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDlJdVE1SlJWL001aHpaRkE0cmpreEkvaE56c2REdE82L3NFUWlnelBOeGtp?=
 =?utf-8?B?dEt3U1dqRitUUi9NeDFCRHJNNlAvY0NXL2s4dWYxR0dvTUg4dDdKWlp2SXBE?=
 =?utf-8?B?YWx0WUZkR2ZWUTZhV1F5cGpZTkFtMnF0NWxZblljNEROcjdGbHZjRXhVMFdM?=
 =?utf-8?B?aHZwSzdCZ1FYTmlvYkw5RE5IclJPaXVpeVdnaVVUcFh5bC9URENzemsvL2F3?=
 =?utf-8?B?c3RDQ3JocGFQckVzL1ExemI1N0pIYkNiWDhwSUNjRWtXYlBhUVoreHAzN3lF?=
 =?utf-8?B?WmJjZlVyZFVBZlZVNkw2NkRvQ2hGRlRhNlpkK0JPZkU3Ukl4aGlXSkR1dnY1?=
 =?utf-8?B?Q2tqNDR3ZmljK28relBkTDgzSjI3TlFSd2dxa0dybSttWFNxQzFEOUtPRXoz?=
 =?utf-8?B?WXpkeGh6MTNGV3B6Z3BGaWxsdmZFQ3JMa3hxSFVVSmJ4MXMyN1hnZHVMZW5V?=
 =?utf-8?B?cGJOcUw5ZGt3ZU9HVzMwWjNDTWZCVkVoaUtvNW0vdGFXVXkrbUZiakx3QWJw?=
 =?utf-8?B?OFkwR3JXc05pbXdqNExoYmxlWlh3Z2c2UnJlQWJnbmFzYkFQcFdkNVRSZzZk?=
 =?utf-8?B?TWxrTlo2Zk1kbGRyNlVwVkNVclV5U1ZJNUU3Rm5JNkY3c1YrSERpdGR5MUo3?=
 =?utf-8?B?NkQ4NElQeWcxL0p2eGQ3S0JrZk9Sa3FVMk9YeVNCNExsVDZjRlBMVThZcGF0?=
 =?utf-8?B?Z2dKenBXOHg3b3FuTmZTaUxtWEptUGQxR0h2M0NqN2hQaGJvY3AraFRoQ1VZ?=
 =?utf-8?B?VU5RZzlTZkNxampEaE91UHdQMWdsblU0Yi85Zys5N21mMk9tU1p0RGovSTFB?=
 =?utf-8?B?Sk1IWGJwTWtlbUVQOFN3T2FSc3ZTYlhHcEljR0hERmlQeGNNc2FWQ1FDYUVj?=
 =?utf-8?B?VXJRRjZRVFdvYUpvOWZLUEZPVlpoN1Z2NG5RdFlDbUpNRzliWURQSHMvOWEr?=
 =?utf-8?B?MjlpREh5TGNZZjBJUWFmL0RINlB6d0liai91NkZGOWNMOHl5N2xkR3JCV2t4?=
 =?utf-8?B?REN0SkxPdDhCZkJuTlpLZXhhRktxdFJQaXEvK3p3RzI3SFBrMnNJd0h5MXcy?=
 =?utf-8?B?Y2U1UmtaSU1BTnZNUlNPNy9jb0oxbXFUQzA5VGxJQnBSVkhpU1M4WHBiNHVD?=
 =?utf-8?B?YU9TTkdFTjVPWkcycS9jblRsbzFjVTlDLytyQ3dPdEZldEU1MFBBeWN3NlNZ?=
 =?utf-8?B?NHk4bi81SGJRSU01WTE2bGJzaWVRQkZ2ZDlkdU5yamszclNvd2kybEtTbFlr?=
 =?utf-8?B?bVc2N0h5SysvWHB6NzJ3MjU2NHVWLzZRak5LMHJYOUNUbU1KaU1ScEEzZEdT?=
 =?utf-8?B?Z2JUR0pmY2ZnRy9OcFFNcGMwaUljckhzWnp6KzB0NitLN0wwUlpPcTFFNS9V?=
 =?utf-8?B?TmVSd1JNOC9qWFc5bkFZb1dKT1lTV3JhOCsxNjJIbndCZmlBa0s4LzJuRUYz?=
 =?utf-8?B?bDRKbnFaM2k4VEFSRkpGcEsrVUtiUHNPWDZoY2tweDNPK3lFbDVXWlRpOE94?=
 =?utf-8?B?OE1MRStJOVM4ZjQxYlgxMlBJOGc4dUVYZGNBQXhJcndwdDF5aFBXeHBHRHFI?=
 =?utf-8?B?V0RNMlM5VjFWdmwrVE92RW5FY2dIWUg1ajFBUUlUMWlHbGpzNXIvam5XWFV2?=
 =?utf-8?B?M0RBRXhGa2RKMjhJci9BMjFhdE9UZVlFWmEzWGRQREJMVUlZOW9qY1hEUHRt?=
 =?utf-8?B?MFhDNjBwUHRuZGNDQjk5Q0ZQdE9UMnBJalpHM3NBNE1ObklKQ25FdEYvTk9i?=
 =?utf-8?B?TEhJb0xNalhsUkRjYmlpTm9GVTMzdUVLMlNqQzZJWDBmdEJMMVNuR0JtTktz?=
 =?utf-8?B?UWhkMEFTalhHaGdGNVhvQ3hWV00xZmxNbU1NT2ZaL1ZEallkTUdMVzhKUzRy?=
 =?utf-8?B?S3ZQRGhhRG9KNFFEY21iSVJJN2RzTzNwTnZnSXBlWTB5NkF6MTBoc3FkS3Za?=
 =?utf-8?B?N2Jmem0xTHdIMnJoQnFiNk9oanJrdzVPSTNlRVZUNmZPZEovcmdQZ0JyQlNQ?=
 =?utf-8?B?bFZ3SXo2ejlNUEo0T0IrNWtEbGpURDRjekl2WVp0SEN1ei9tcVZVVkRwa1F5?=
 =?utf-8?B?WEJWd09NaGV5djd2NDl3bFlKOUR5anJnTzdyZmRQV09XOHFBT2hOTlVtaWxZ?=
 =?utf-8?Q?V/sZMoK58VT2vEOJZ4VywwDE9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a704bb-5938-4963-b674-08daf50ca89a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 02:19:54.6890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejANPoDpFz5kEmcXy2vCT3CxK4eWxkHHAx1aovE4jPKAY021o+l6ym8Hay0qVWORIBMSxJu7Vheg7De4B8e7aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5397
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 02:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175809

Hi Michael,

Any updates on patch merge?

Thanks,

Sandeep

On 1/8/2023 10:25 AM, sandeep.gundlupet-raju@amd.com wrote:
> From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>
> The dtb files must be before the dtbo files, otherwise the overlays may
> not be applied correctly.
>
>  From Bruce Ashfield:
>
>    We can split between dtbs and dtbos, they just need to be sorted
>    for reproducibility reasons.
>
>    Of course, this was only working by luck previously (before the
>    sort), since it has always been gathering dtbs and dtbo's with
>    find, depending on filesystem ordering for the order in the
>    fitimage).
>
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>
> Changes in v2:
>   - Remove 2 loops and use single loop for dtb and dtbo with same logic.
>
> ---
>   meta/classes-recipe/kernel-fitimage.bbclass | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
> index 8ddebf8dd8..06cdc4f1ec 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -546,10 +546,11 @@ fitimage_assemble() {
>   
>   	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
>   		dtbcount=1
> -		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
> +		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf '%P\n' | sort) \
> +		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' | sort); do
>   			DTB=$(echo "$DTB" | tr '/' '_')
>   
> -			# Skip DTB if we've picked it up previously
> +			# Skip DTB/DTBO if we've picked it up previously
>   			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
>   
>   			DTBS="$DTBS $DTB"

