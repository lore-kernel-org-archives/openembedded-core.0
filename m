Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4505C48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 15:40:19 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.58])
 by mx.groups.io with SMTP id smtpd.web10.25798.1706888410597514202
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 07:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=fPKGxOD9;
 spf=pass (domain: ni.com, ip: 40.107.223.58, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiNo9a/wa1a8k3ogra835Qkx1EZtUsi7TAnYUQ4LUNCUKYKoVa669qyp+/KVszCB91hcZLxxTLXuXk9KeMNT7OSzj/cmLu7NKJ0+bzCScqPKs51EWiE1KVhSpbtnPRVuh594g4KZyuKw5dBfk7Pu26MQwXHV9NEl2WwSDfOYo6BaG8Bi3xUlAPW4qe5qln4mPZCzw/KrJzV6MIi8z/TbiiWYv9msTBAL/wqnWDPnZBmHwMS8rXxwDSNa9QtzSUboIA4yZOZ4JckqD8dKz/vDCF20h6OsguXQXIjvqX9cjciYIVSxk52+02F2Ata0cA15aKsO0DDaU3ENnbeGj7mbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceIZf++LQsVKF2BpaGizTwpcHuEdsI35nab5FqGcvjI=;
 b=FWgZzhq3t/nynRMu7rNwCISmOD2K8tCt7lu5r5GNKz1PxeVAiMt2a5MTdkFKFx4RKP0c/06HTrJiTpIGaizSkTXcHmSMfq1h/FcMQoEAc81o9ebf8/xzVLomzgOqtiHDGqiShEJ2jRFzuVEMwIEMT+G3KSlgj3G9ixyecIUkWLc4hDfqE+VgB+WF97wcaPRjF48onQIn1Qj+7Q5JivAwQmz87lLxeBQaqX1ENpVhEJ9iV7dt7HpnYeDC+jNUDeqcfmFA1JkuhquSeWyDwfnr5VWEaCCkj5Mz3XkKYA2z3R+I1cynrP1lZnx0F2/EMaLEpQx+Zo1TR8E8dsWgKaPTzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceIZf++LQsVKF2BpaGizTwpcHuEdsI35nab5FqGcvjI=;
 b=fPKGxOD9XuOafjPctvga/uuTCv/fDQg5Q62g9TlKbPdqADCjW84IcDsKG3zMh0S+TYKtWD3JCqtL1AV4cGEr4s212XMfWnC7mc9/PBMkupfUXf8qA/GlbzUdYh3n2pFc6hJ/PJ8mrErdxBUgCTUZChllK6Pn4Wuny/9XojyQhp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by PH8PR04MB8710.namprd04.prod.outlook.com (2603:10b6:510:252::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 15:40:05 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163%4]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 15:40:05 +0000
Message-ID: <baca486f-589d-4246-8cbf-d42ee8dcc7ec@ni.com>
Date: Fri, 2 Feb 2024 10:40:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] package_manager: ipk: add
 OPKG_MAKE_INDEX_EXTRA_PARAMS variable
To: openembedded-core@lists.openembedded.org
References: <20240202132434.1787053-1-martin.jansa@gmail.com>
Content-Language: en-US
Cc: martin.jansa@gmail.com
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <20240202132434.1787053-1-martin.jansa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: QR1P297CA0014.MEXP297.PROD.OUTLOOK.COM
 (2603:10b6:3d0:3::20) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|PH8PR04MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3b3426-31f2-494f-e2d8-08dc240539fd
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hrDlnuYqgblO0G6H/2V7K2LcsbfFn7H+nbz5EdNlwEb7f/bqptulkEorQwo50MDM/FtIktNhwLlnZxr1501Ji93BiHcnkhiIRP/mTMUMBaMSL/JUtWGuRuIbd6htaBXUjxVWAId0wn6J3ok3XW+Wn9TkvWKSROMDZXg71XcLaAuqfcWd2ugpTTqYBmB8rG3CqJnQYbxs6Jxk3szk4tuNV3qWchUMQp8Ni7o2SmwqCrxVzmSMd2FRmQiKgxLhO+REwOy1dFYDId+Wuom+KKGf8PDzs1Q27Y/RiktytmT07G936LYHIcRnvCNNvQRJS5W7M5LOvCRkhG5tlpMLE+aKHZmf/uGvIu85IS8olMg8/DJ/l6u7R0CbINHMVIgD95JNBMZEa6o8NZsZK91pDrFmbY5JzZLnwc5OaXWpFpjpEdE3Cxx6ukPdL1WfIzNDkaedBBhhV1PQJy88n3DwDwYrFDVauJmeTw7dG9sxmA+UuGzXOqvshxbFE5XjYyLzcL4EmVV+AIo888XBlePkGqrDnL27Rw1l4az6OCiQCd2o4t3l1RL12rSpLCN6Hc2WVZAuGVQvNjZz5xg44TQQ4gh71ruyYkZIWiQwn9GNoGdqUBkaPe6dIDf05xw/YgDZy1CqIgaOJbyfdVR57zeDis0pIg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(366004)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(66899024)(31686004)(2906002)(478600001)(44832011)(5660300002)(83380400001)(41300700001)(966005)(66556008)(66946007)(66476007)(316002)(6916009)(6512007)(36756003)(4326008)(6506007)(86362001)(36916002)(53546011)(8676002)(6486002)(8936002)(31696002)(6666004)(2616005)(38100700002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFowdUVvME1XY3U5ZHlvWUpRSjRwR3Z5TGJPZXY2M0JqZlo2OHdoNU9YekRZ?=
 =?utf-8?B?Ni9odXVrNm9JZWozNTFMQWJmeG44b2c5TGhZbGQwTE5ENkJuS2drdFpTUkls?=
 =?utf-8?B?Y09qTFNnOHNzKzlGRkpnbk5iclQyOFIwUU1GaUlwcnJRbER4eS9YYWZNTUVF?=
 =?utf-8?B?VVVPV1NjQWRTSjl0aU5tWmI4cm5TS3ZYWWJERWNHTGIxQlE1WEx4NDY0c0Rr?=
 =?utf-8?B?VXY4Y3NxYmtQZ0xPZ29mc0NMQ3oxNUtMZS80NStXd2Q1aTBFTldwS1dnL1d5?=
 =?utf-8?B?aTNaQVNjcjc3SUhIV2pETFFzMzhkV1JIVHBYYmRCdXcxcVpLaWlzZ2VTODRk?=
 =?utf-8?B?QjBrR3dva2oyR3RWZVNFUGFTRWtrc1lrYnlmTDNjWUtqVENiY1ZYN01RNGs1?=
 =?utf-8?B?b2dYZjJVbGY4K0VRclk0ZExKaW5BenQ5c2RJK3FUUWhHZmhnbHJsU0M4VGJp?=
 =?utf-8?B?Nmg0d1VMbHVwSXcyNXlKNVVsNUtZeGV0OVVSWjV5aG52dDhJVllhbUhjdXow?=
 =?utf-8?B?YjlLU2tXRDlrVGk2YzVEOHJzOG53RnduWWNLaTVSUTZISy9KcFZ1U0JjSE1j?=
 =?utf-8?B?T1NrcjJUM2NCZitJWFo3V2U3R2haUENHS1JsWG5rYXQxem1hbWlSV0g2TXo4?=
 =?utf-8?B?aXFiQVVRTTEreU0vaXZPZmZQSGx3L0g2ZklnMTFIYXo4dnpFMnpJTi9SZ243?=
 =?utf-8?B?ZThyUVJUVUFLVDdFQW5BY3RCS1Y2WnF3eU9iY1JNdG5xZ28rUmoyUTdZaFB2?=
 =?utf-8?B?TW5ReEE1MUtpZ3FPZ012SmxsYUFoWmtIL2VTbXZmd2Z1QVZhS2tLWmdSOExW?=
 =?utf-8?B?SXdmVitLNzZTY1pxVU5yMHh0b0ZMS3UxUFVIZnNxM1VOSDhBM3ZJdWRuZTBZ?=
 =?utf-8?B?RUdoakVzOG5HT2g5dGx4ajIzZ1hKTUxFUnk0b0JZN2FvQ3UzNkFpKzdLS0tn?=
 =?utf-8?B?ODBtVDNFdW1EWEFSQ1NIYUlacjZCd1VpaDF6bitaK3FMNzY2elkvUVF5OUdW?=
 =?utf-8?B?cHFQZUNRNVVac0dRQlZHeWx1cVR2aksyQ2Q0YjM2OFFsWWIvK01uNjVQUjJG?=
 =?utf-8?B?S3BjU25PUG1BQVpScEJXa255NkRhODhkczJaTi9tMXFsZGVmaStLNFQvTkdz?=
 =?utf-8?B?aVNZRjdMMkEvRnQ2bTlCclVmTEZFcnFkNEhBV2grZzJzbXcybzlYa3NReWR2?=
 =?utf-8?B?TlhnZVlrbVV3RGljUWpmN0tSODlVaE44c1lvZytSbXR6N1ZBTEdXNG1Kc3pI?=
 =?utf-8?B?UlRVZTBjZmhjMXcySzNTVjNmMlM0NDNqM2UzcTgvT2xPMi9WdGZhSHVkWXhD?=
 =?utf-8?B?V21NSGpTNHVLQzNWeXUxWVlkYndoblk2blYwZmlBWHQrcUdZVjdUTXVLSWJi?=
 =?utf-8?B?b2FWazBBTEgxVlFYZVZnTDhvK0gvWmF3aTB5WjBNbm9JeTRxR3F6ZDB0elI5?=
 =?utf-8?B?QTNiMzlPVTZGM1RZZU1wS25RRkE2akUrWHByaDdMWGkvc0tPK2Y0VlB1Sm1r?=
 =?utf-8?B?d1FPY0tHblJGOGUrbER3L1JoNytqK1ZHWDFFQ3lqR2thTWlHWVI3TlJvNnk2?=
 =?utf-8?B?ckxXbWNEeFRLVzBSTU00bzRpZUc3U01qSmpzSENuTnB2WTR1dFYvMkJyVXZq?=
 =?utf-8?B?Z1B2cVNOT21CL09kZFpqZnZqOEVucEZJa1lxOHpOVnV1cjFnSURnSjFqbnh3?=
 =?utf-8?B?NnBBWDlxY1lwQ2NTVk5KeHRPQUFMQTNEQ2w2d2NqVyszZ05mY2VKQ2pPT3Jq?=
 =?utf-8?B?cktwbWZVSlYwTTFBUFdtTVRmaTFXUnMxLzZNMGJsLzBhYTN0VEdxbDk3SDR0?=
 =?utf-8?B?RzExS2tBTjRWajhaLzliU3hCbnVseGxPZkgrdHFwcitVdGRQL3FmRWFzRFhL?=
 =?utf-8?B?aW1nUk84NnJJMmhDbVpMM0RDN3JMLzV4Q0dBb0pUWkFDeTZnWTAyRVpVdVlV?=
 =?utf-8?B?NHBaY2RBbGxQZlJzalFmQmZYbSsyaUw5dGJ5dW1tYTBpbGFkSHNpQzNyY0Fx?=
 =?utf-8?B?NXlVem9SN3VaVG9ucmRzMys1MFhBVG5MbnhFMmcyNnhMaVNMUWRtVVM5OCt6?=
 =?utf-8?B?bkZOWlRWeFY4bUNpMjZBc1BqTW5RYlAxaXM4Z3FnT3VkOEI0WkhqeXVTZG5C?=
 =?utf-8?Q?Kkg67+PySVXqsEsnVdtMCdm0/?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3b3426-31f2-494f-e2d8-08dc240539fd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 15:40:05.4827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DqzwIqTwIciE09LjpRanzJQOAyA6meks1Rksw0w0xKooSh32dAA99VGE0DMbwhkhf/WeLIAZBV4uC07uCsGFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR04MB8710
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 15:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194803

ACK from me.

It's a little strange that we wouldn't just have a 
PACKAGE_FEED_PRESERVE_USER_FIELDS variable. But I understand that 
wouldn't work as well for how the RPM version of this parameter is defined.

On 2/2/24 08:24, Martin Jansa via lists.openembedded.org wrote:
> * can be used to pass e.g. -f param to preserve user-defined fields
>    in the index as added in:
>    https://git.yoctoproject.org/opkg-utils/commit/opkg-make-index?id=13f6281d24e17199e0fef6c2984419372ea0f86f
>
> * otherwise it will show a lot of messages like:
>    "Lost field Author <value>"
>    for every package in the feed
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>   meta/lib/oe/package_manager/ipk/__init__.py | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
> index 8fcbad56aa..c35c90ce42 100644
> --- a/meta/lib/oe/package_manager/ipk/__init__.py
> +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> @@ -16,6 +16,7 @@ class OpkgIndexer(Indexer):
>                        ]
>   
>           opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
> +        opkg_index_cmd_extra_params = self.d.getVar('OPKG_MAKE_INDEX_EXTRA_PARAMS')
>           if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
>               signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
>           else:
> @@ -41,8 +42,8 @@ class OpkgIndexer(Indexer):
>                   if not os.path.exists(pkgs_file):
>                       open(pkgs_file, "w").close()
>   
> -                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s' %
> -                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
> +                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s %s' %
> +                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))
>   
>                   index_sign_files.add(pkgs_file)
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194795): https://lists.openembedded.org/g/openembedded-core/message/194795
> Mute This Topic: https://lists.openembedded.org/mt/104118971/3616788
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.stewart@ni.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


