Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6CDC38A06
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.78])
 by mx.groups.io with SMTP id smtpd.web10.7358.1649170394660608755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=Afgt9v2w;
 spf=pass (domain: seco.com, ip: 40.107.15.78,
 mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NH2sDIskNctCSmLRShOGxvSr2MbwQGmLZW9X+CMWdMNKnZGc4ZsqnlVOS3a7eIJA9PgAMrHJar26SB9bAo2aO1u1I9rjHiNewgKfNeJXGY8agNjz/zR/1bo8YxARw3OkBhfR8nBvHSXSzsJm/Cgu9cIImFVms3isLryb/NN64iY5j3/069BrqijBmXrBg79Yl/A4KgpoOR1GIsxjEHdNcAPalNuM/8kzZnKIsHlNrFxm9yZKLZhEeFYUmHfDo4ACoFOHv8/4HG5jxY0ajQFsPNoTEN8SONWaGjWiegAzWYWAQij+mt4e4dZ/lkWwSGLslqUNyGupN7uvnQl4bDu43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Pgh6p4SctQjOzHZwjwXJJtINJjpVd86z0bTucu3Ko4=;
 b=JfB0mRafbd85dgBNM7GcMWMpHLO6cm5TWWCH+vAR6atMogxS+Pgdz+77yZnAaXu2psHlrjin4zxtDq7wU6mYBn1OrjM840WZCIwsujM41sMsXlxBmCSXG3c610RRdo8zat4Df5hbBH7p4ogr3wgXPfnVrTppSQffsLNdPDymRRAOFA9UR4PaYmgLQ3q3QbqQAhJ+9FnR5O7YsaiYIysvlhDsOlrnRDoOWYNmErZlrdxW4TiyoSInHYy+qCa3ipq9ss4S+rN6oxJLHR2v3DJZoONRxpKIFU6ADxa7X0DbOISWYDs26Wh9SjivKTcD+xll02FO94cgV+1fxSjNluSxxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Pgh6p4SctQjOzHZwjwXJJtINJjpVd86z0bTucu3Ko4=;
 b=Afgt9v2wp6KXZeh+vOwsMbFPmhEbAVMp49PUrNZC7a/QX/T2mjQXuYAgZqihRt1K20U60mAJSw6BImmJg9/Or0eaeFKJFkL6zx8SzvQEuwhicASr3IxuoCW9LhqKTpGusmEbn+2eGdHeEbQkZfmvjks2lwtD0t4VYfAqaHBWH+Gh9GrvpycipxAKmX9VKp7hHZfvOoL4E3v3OgqduJFMAWZgaynJEVIUOMpnjFgKclL6nn1h4LWyxjHFj0ARAcvcHVxmwfXzINqSrbad7bFf3ckWyC822JLwEcOnWmJSkqj3XWeEPklRtAB3qrZGKBWRHHjiYC3qxq6LGC42Rzu5Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by DU2PR03MB8121.eurprd03.prod.outlook.com (2603:10a6:10:2f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 14:53:11 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::2ca2:213d:e44b:cf71]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::2ca2:213d:e44b:cf71%7]) with mapi id 15.20.5123.030; Tue, 5 Apr 2022
 14:53:11 +0000
Subject: Re: [PATCH] libpcap: Disable DPDK explicitly
References: <20220210204919.3029824-1-sean.anderson@seco.com>
Cc: Sean Anderson <sean.anderson@seco.com>,
 openembedded-core@lists.openembedded.org
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <389232e6-e489-283c-1132-b9b284b171c2@seco.com>
Date: Tue, 5 Apr 2022 10:53:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20220210204919.3029824-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0070.namprd19.prod.outlook.com
 (2603:10b6:208:19b::47) To VI1PR03MB4973.eurprd03.prod.outlook.com
 (2603:10a6:803:c5::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9463b516-8936-4b0a-3d50-08da1714013a
X-MS-TrafficTypeDiagnostic: DU2PR03MB8121:EE_
X-Microsoft-Antispam-PRVS: 
	<DU2PR03MB81214E1E3724581D3878C23E96E49@DU2PR03MB8121.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tThvTHL71Qx8MMp8oNK6H6qzsEZqn0tzai53v55RBaYqdkXmlfI4Vd0VBHiuymyq5UZIaL7gttaQy2NMFEzgR/BQcP0u4kGeyvVbuxJi4/kvEIAAsU39EvtloPuUxOme6U+Widgp8hpchUR61owTz1yoPHJcHWBMo/OK3AJeFTccaq8TaMxcxQaR1JDPtI1ODNfCF4MCrkNdwfbCYaytX4IzZIEUgTY0rEMfVIIP96g5PLbbC5ynydd8ZkZKNCeFxrpgy5f89+3Tx8Xgma56IT1kl10IaBxu1qKg9yye5LJ/TAtk2YraydfYlnsCax6NrUh4LRO1TmpiJAVlCxZvO6odJZs6E9Bj9YSHHEQR7K0KB+RxPvbt8LUiUA2L/SbwKgwDCyLxFie5qZLO69+GKspD18z+Ldle90/p194YKG/FRHg2qR7LvoCiQH/DngdVo7rnLMI2GyHI/heQ3JBsf1ffhIJMaU6y7VYPjgfm39LyCYd9nSWYYssGcrJDI9q3uoWa0RS1YZmmjyN+ZiKaUkZArJ4PchZawu++WRbfEyQVs9DOGkK0nSTdGTyNOnxmnnDxiy1M34mgPPV4cVXXmM8Fz+07THuzJcIoMZk2ano67GnjoTOwbk7ZzrGWx5gtMJsFnTfF2wrfm1ONGHG1L8qSi3tf1egweVqq/J6OcOol0um9DfT99zstlkXul6k0kfr2ORYdyfX68uhGIYFuZjFXEelPOUjHePgqABc8eMUTxF8qJxaCY8iOW6HcqOq6ow+PTS8fb8jRsl+x6DgDYg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(316002)(31696002)(86362001)(44832011)(38100700002)(38350700002)(8936002)(4326008)(26005)(2616005)(186003)(8676002)(6486002)(109986005)(508600001)(66946007)(53546011)(52116002)(31686004)(6512007)(6506007)(66476007)(66556008)(36756003)(2906002)(83380400001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UmdoUm9Tbzd5RWtzWjFKdmxlaUU2YlhMRy9DZTAvQTA4aWNmVnZsSWVoWVFY?=
 =?utf-8?B?SnJBeG9aSHMybExwVFFZRUZRTVY3VkpKNUFBRS9VdkZrbmI0WHQ3WEE1eVlo?=
 =?utf-8?B?ODQ5SzVXdXljM0UzWmYvTVMxVVNKRzZyTGd2NGEwQlVWU08xTUtMR3FZOUdz?=
 =?utf-8?B?YzJxUzhhZldrQjVKUjY3aDR5VExLQjA1ZzM2L3ZxeEdFWFNFY0lpWmdOSU1T?=
 =?utf-8?B?WVhraDBOaTk3eC9idW9EZDM3WXFwUmRWNWViQUU2TndQejFnNXk4ZDBESm1G?=
 =?utf-8?B?OXg2TXV1bzVYRkVMRVFqNHAwUkZDR1N6VmVkbnJWZHRMWklPeDRaWEhWSUNs?=
 =?utf-8?B?WHhHQUcrZFlEMGJxbGdYaWZSOWpHOG5yNjVNcHN6U1VpcE5ad0RHWW5Fa0Ev?=
 =?utf-8?B?NE5aa3dWdTdvVzNHcFNHdU52WkRZclRNRHV3VVdXelQwU05vYUp5SHJWcE9i?=
 =?utf-8?B?TVhjL3IwdWRMR1JaRTVPU2wzQVlpMHgrRGZHMVF2ZTUzSlAxUnZlOXphVTJ5?=
 =?utf-8?B?aDVDQ0hCTTVKSUFVNEVrVHQwYlptMFE3VEVJVlBIeU9xekRiY2llNmNlN0Q1?=
 =?utf-8?B?V2Z5OEk5dTJ4am44bjR6czJ4Q0RxTDhWWXRpVURkZXBVOEliN0NaMUpTU3k3?=
 =?utf-8?B?MGZ3QlZLQm5sRUVFdzkvNzBNNG8rUWJiZXlCUmYvQlNqUDhhb2lTTWRPaGpz?=
 =?utf-8?B?WEhidTcyOE9WeHZDeVlzeEtrb2ZSYUZMWDE5K1JSS21SdmUvajlRbnJFRGQ1?=
 =?utf-8?B?S0RzRXpRckd4UE9yYWFWZjVrWEFTUDJzSmpPSS9pRGJzc2lnM2hyL2ZtZ3Fo?=
 =?utf-8?B?L3ZPSUlySzMvanVXT0FKM0VYeTdYTXhWUFd6cU9OT2R5VkhjRk1rVmxvcWJl?=
 =?utf-8?B?aVpjK3IxVGdYOWp0SUorNkgzZGFkYzhWSmR0Z3ZBS0V4RUlMRTRQMG13RUxN?=
 =?utf-8?B?REV6dVRqWkpHNjBrZWpTOUVGQjVVdnZ4a1RxM2lHV1ptVi9sZEJRTkg4T052?=
 =?utf-8?B?VUlXMkEvSi94ekFEVWtFK0RPR0kzTlJxKzBBSkxMU3U4bWZjRXFEU3M1VHRn?=
 =?utf-8?B?dDdFYWRMTGlCVjdxRytiSnZtcDRpa1lHd0NTNXdkSjA3OGt2QVhhcnpqcDhv?=
 =?utf-8?B?cENQUzVxQkVaUUxyUVE5OU5qUkNHVHo0dEc5Y1lxdWc0NHdpTmlkNFVxajlw?=
 =?utf-8?B?aGZHVEltZXAyUkdZeDNIdGtNb0ZVOTBlYmRlSkpZNVZiRXdQd2FPd0VZZ0Fv?=
 =?utf-8?B?QURGRk5lbGRuU3gxaG1iNGpkWmhmL01kcVR0cGZ5a2c3Mm1BNzZjY3AzUTFR?=
 =?utf-8?B?L3ZrM044WEJVdVdpOTZCREZsWE5leHU5WVBUaHZ6WVZWQUZiamtsQktEZDBE?=
 =?utf-8?B?VEJrNzRROUtlc2ZOK2M3MHdYV0RJOXpXZDJYbjhqU3habDBpRmpXQmYvWGtH?=
 =?utf-8?B?eEs5Y3pUWi9RaG92MkN0c2c5akREUzIyb2NqREhHVU8yVHRhaFF2aVk5Y3da?=
 =?utf-8?B?SHhFeGF4czgxMitoaGdvUitXamhVOGJ4Z0RrOEJ0alZmMXVXcmdJUm5uMTV3?=
 =?utf-8?B?djdLbnNBazVhTlAwZlQ5YzhWcDhGMlQ5OE5lbmd4c2IxMlZnaHdra2VPYWNl?=
 =?utf-8?B?Z2NMdkFGbEQ4WXI1SThFblNTZVdSZTdGZXpwbFhwa1B5YmsvZzJNL05RRHpJ?=
 =?utf-8?B?dmMwNzcwa1Z6eFFyQVRQZG9MMmY5QTJ6WmdjOFU5MmFFMDRaY1o3dUFQcGxi?=
 =?utf-8?B?TkU5UzBtRmtZUm5tNFQzT0YzbUpJcmRYYkExLzhjZzh2RVZlWDliQmk5VDdx?=
 =?utf-8?B?YW4rTytNTmtHL3Y5TGtHNTRUdG1obDdieUlDcVVMUG55MHVTSEhNR0lnNHdw?=
 =?utf-8?B?d3R5eXJJWUMyMlVZRmd6MFF0SjBvSHJRdzNiT3B3aHBzajBOL0tGa2w1WS9x?=
 =?utf-8?B?Y25SdmpId243LzJLbW05dktNWlo3TmkwZlVkSTY0SE9DdGhEaWFJeURHdENS?=
 =?utf-8?B?dnhvTkdDYzM4RzJmRU5tTHZNQml5M2MrZ3pDd0dvTXZwZlJ5a21nQ09yUnA5?=
 =?utf-8?B?STRhcDJDdXMzeEdwbmFrakFVcndFSzM2WndKQm80emY0dDkxc2N5allkZUt5?=
 =?utf-8?B?T2QxRS9YREpROGFDNUNoalpMRzBLTC92MFA5dktvZkhsVkwwNWFhNXhLOTdI?=
 =?utf-8?B?OGpCSm5VYWRvSWcwZ0NqNDZVQXRISW9Zc2VaQXVsbGhiZDVCNnZCOWFrY3Ay?=
 =?utf-8?B?cGN1UWFoSmNYdXNpRnV0NVBiOUxNMEt6S3lkK3A0SmQzWkFJd1NEbXc5dERY?=
 =?utf-8?B?SmxBS0RVclpWTU50MzRHdSswNTJMOVVCckRoYTBhblY4VlRsaWp4dGp1V2Js?=
 =?utf-8?Q?0nTxx0S4vGDmyRXU=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9463b516-8936-4b0a-3d50-08da1714013a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 14:53:11.4975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 d1mnVf1FJDdIGzD9y2rD2XAgwUnFJ8StPN4ufxmhYJi1+EIaA4tEYqB+wzzA/UucvLalBfYEq0RqgJ3UZs8V8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB8121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164041



On 2/10/22 3:49 PM, Sean Anderson wrote:
> libpcap looks for DPDK in the same way it looks for DAG. This can poison
> the build even if it doesn't find anything. Explicitly disable dpdk.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
>  meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
> index 9a8c46e0ef..dbe2fd8157 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
> +++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
> @@ -19,10 +19,11 @@ BINCONFIG = "${bindir}/pcap-config"
>  
>  # Explicitly disable dag support. We don't have recipe for it and if enabled here,
>  # configure script poisons the include dirs with /usr/local/include even when the
> -# support hasn't been detected.
> +# support hasn't been detected. Do the same thing for DPDK.
>  EXTRA_OECONF = " \
>                   --with-pcap=linux \
>                   --without-dag \
> +                 --without-dpdk \
>                   "
>  EXTRA_AUTORECONF += "--exclude=aclocal"
>  
> 

ping?

--Sean

