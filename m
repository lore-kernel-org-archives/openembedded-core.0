Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D8CC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 13:13:13 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.77])
 by mx.groups.io with SMTP id smtpd.web11.15088.1668690789259676209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 05:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=GlVRlaE0;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.2.77, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHXuEN0eDYp8sPYhqGLQhwBV0czOMwSjNcQ6mmNV3bO7LMPUbehasvNHXI7dT1FoKBdkzxIzhLaiNLE3n7lHTsLxHSzWM1+uRDpYORuBxQ3xvhZ96JRTTUlKaldkB0x8nthYCLKMpBsRPw2NlPlOZQEvtrd9MCecJk5GgYkGodt+cE0zRtXZ8ScM1wnldY1TcGzSEUFV2tWIaFq3603K8WOJvlarZGH7u1sQmGCRnjNABPu/udyUQi7mC0nU1UOo+Z1m902XzB/HkRcc/K5rZssVCZYILr5nyO231GBFM4wRgMImQOmNcOb7IHjjrwCBbiPg+FQrLR6ljNSUxk3DkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kj9JkASiSuAkjUKFnHqP/008amC7lhIbh3FqSTl9OCg=;
 b=BESUh6q15pvfYWf+hE0lVi2VNhbb15stUPnlzXYXJ3n6rRtiTycAIh4U3PHa6dspKJ5HvObjAcmu6bBIUasGGT7ABxbNLUvkcE1+vyc1wg2mpepSxSEErozxLQbE5RsMgTVmxz8DHxErNaNk0tfRbfzUgUb7DhF4qk/rQvkjvNiz95LI1g3XqgtQBzqpAtCzpXkgEsApK2Xupruj+elkPazRzIC+TGRx8XxtGqL0CDXTabd9x76nmTLr0BqD5Bl03UxLKZEcVbcMTps6p0dy4UTA7ekAxXgSERJZ0YrIpeHYEI+MZ5DWiVSnMf5Il9F56W7k1hIDKS1sjH0bude+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kj9JkASiSuAkjUKFnHqP/008amC7lhIbh3FqSTl9OCg=;
 b=GlVRlaE09RlxX4RtbVl96MwBgGQBgVXt7rR0CgbUePDZ0sxau3i3j5Lkv1nASrCGh64nEDaYNlyYEDbHj+nEtRqwVKqDZAjsOXYGd7vNwsSznYiqYyVQoG3oh2f2v5l771+ZkeHoBXe8vmtTYKvtaDu3J22TgBWsOILIyWw60OXUU+yXvDvsC4OzAZnQDckXd2sNKX7FeIsayM0r/mozuCPmXK2ImkVWc+xR7OjFY8JpTPyZVx5ematIg/ygSofylRbxeR1C4RFe4x5HKJz9pEwBGiMFEegVt4DkdLy3v5WYX97959TFnDb7LwEPCDMs5/azvtYJngsXTLC5/gb0vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8962.eurprd04.prod.outlook.com (2603:10a6:20b:42d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 13:13:05 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4%5]) with mapi id 15.20.5813.019; Thu, 17 Nov 2022
 13:13:05 +0000
Message-ID: <5c71519e-8f9e-3402-5f5a-b15d9e4fe384@theobroma-systems.com>
Date: Thu, 17 Nov 2022 14:13:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [OE-core] [PATCH v2 1/2] qemurunner.py: support setting slirp
 host IP address
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
 openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
References: <20221114155038.3654499-1-mikko.rapeli@linaro.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221114155038.3654499-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::7) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f51593-37e5-4473-6d48-08dac89d753c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HV1dTjOewuX0MvrrESfKOJiiSgNj+W6ivYVvPcFoovvfFeXQ7KvQ9tkB+/97iL6MW+5H7NJOasrlSZETbH/OAaj+UUzfQWcpSjSxJNf+dhgm/VOcmsMJkY+kkxdphoGjBcJqjONbbVAcIQ3PKRRYhrgNeQG1A3XlTZrH1yadS929Yh7IUzFYffVL7MPfUP6TfowZFsYhtRguSNZWnFKjZ6jiGdcnm5F/vHRRtrGHuK9CNn1m17mbuGzsVFV5ubrOwiLRxN1Lh8webVFpuKMCkoP3gZ/WLggNbYM/Zx1RxQKz0MTtGapw3z5GrIkrDTuScuEqgp+JiSeEZZo+GeZVxcS9guBYz1efKH6rH5XUzkqTpJatqsJZ/t9TZ+c0ldqQKyIQekVpD5VrX+zNho65EdGHb2NiEvkMgrFV51pKVIMweQUyh7OlV7lqJohyqyexKr7j8e15sW58f4FRra2ZNI3c5HyLAmOH/4byxdx4Uk2rLFjocH6TQZPy2ey0AZFThG62JRWdPofcagm3MIZoAdD9AB9GXLGVRToPMO219o65HgNTkiRphPcb4JpHuCoCjdWZATDApHWxeiKnLTl1Zj7NWlEJrsSMHMsiIrbegLSL7UJpeV11w9xDWq9ztk0ZjfCc2l376pwYZFUXqJKoLKUVElU5EDWTabx3Ou9dph1k5r07MVJUayrkx/X1VkmIXZZkUh5XxDc7rtY6Jdd4zzpHrRU4gSwlXtqGIv8z8PAykX1B2RQXCLa9mrlSBGCS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(136003)(376002)(366004)(39850400004)(451199015)(38100700002)(31686004)(316002)(36756003)(4326008)(2616005)(66476007)(66556008)(8676002)(6512007)(41300700001)(6486002)(966005)(66946007)(5660300002)(44832011)(31696002)(8936002)(86362001)(2906002)(6506007)(83380400001)(6666004)(478600001)(26005)(53546011)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ekJzWHE4QTlJRXAxcEI0bWszcjZvRHIrK1psQTBVeFhqUHZUVldHTWZNbUdM?=
 =?utf-8?B?SDIzVGdqNFM5N1Ftb0x4VVpVYmRhblRhNVJYYkp4dldoOFpVVlhMUDVYQUFU?=
 =?utf-8?B?V3lwTmNOK1EySlJlbWRoZ2FuZlptaXZiVjZVUTBlZmw4c3JTVXRVZ1ZlU2xk?=
 =?utf-8?B?RkQ1RnoyODBPcXVBbysyZTlXeDBIYVpxb1ZIbGtjbVBySWoyOHJnbTdFVTJF?=
 =?utf-8?B?QWVuUFFwRWNrMEZvZzJ6QXNnZ29hajFPV1A4Vm05cW5QRlhmVnZlK1FLbVFL?=
 =?utf-8?B?cmw3bkxwalJBRWdmTFlYOVlvazdidTBKcXQvV2ZhYmc0a0ZnQUZ0UFNRcEFK?=
 =?utf-8?B?T3ZrQkwzZzlQNERjdndaV3pQYlp6N0JWeTkxSVRMNWNDVTdGZG00ZWtUTUtR?=
 =?utf-8?B?d3YxSGhPanZzb2NQRk5wZzl3ZUdheUROQ2NhV2RaZ1pXdFkvaVNRN0Rscmhz?=
 =?utf-8?B?aXE0T1FGc2pzcFBtKzJTVjlUOXcxWW8zblRXL0VJMk9Wdjd0blYxUnd5YjdN?=
 =?utf-8?B?KzBEcTFiNG82VFJ5TXhjVjBaWnY4aENIQVlrYTRCSWxYUWtQcmgvWU9wVGxJ?=
 =?utf-8?B?cHFMWnZNZ0RtdWNRaFkwSjFLc1hLZXdGdzJFbUVZQUpMME03UE1ud2pnK0V4?=
 =?utf-8?B?VlZTd3cyaWVZYmQyeW02SVk4N0hzWHh2RjJYckJzVG1IbzRqWGIwT3RmbEw2?=
 =?utf-8?B?RUNKVkFGdFNzQUVHdmFtK05uRkZiMSsxZ1hwallDQnZiUUg4YzA2TE5jekd2?=
 =?utf-8?B?WVpBY1pzRFdCeUJrUXhvcDFrelZiT0U2S0RPa0UwSC9lYUw2c2FjWXNwZ0xj?=
 =?utf-8?B?c3M1clpyMTczOXB0YU93QTRaT1p1dm10VTVDMmtkK2U1cTFGQ1Z1M05SMnVz?=
 =?utf-8?B?VlNtaHQ3OXQ1eHVRSnRtZWVUQm5wV3RvZnR4SFpybDNjdTNYb2NQRjJ4L2Zu?=
 =?utf-8?B?ZVVMZW5pZkJCcG9tTWJqNmpkT1FUK1JFdmVyRXhYV1RENkhySlBBc0EvNXEx?=
 =?utf-8?B?dUc0M1hraWxBdmhLNk9TMW9OTzR0RkJFNFVBa3VRaW9iajl4VFdkRVFCelNH?=
 =?utf-8?B?UCtieko5bzVKYjFUcHRxUU56R3ZKeWc0N2dnaXRYbVh4UWV1QWM5dEwyMm4w?=
 =?utf-8?B?czZlUHd1aWFCUUdmWFY1cDBnNzR5NXZ5dGJvYjBYSXB0VVExRzlVSlNhQk9x?=
 =?utf-8?B?ZDd1V0VyNHdZV2h6ak9yRnRCQWpFbFRKK0dySkRsY2JLcGdOOWdJSXV2QXlJ?=
 =?utf-8?B?WTQ2SlNScHF2UU9zOW5oT2xjdGw2cFp4QTN1T05nTDZxZUxEYWpqbTF2REFS?=
 =?utf-8?B?ZHBGTC82TDQ1Q1I1dFdxQkNuWWs3b281MUFLRmtqdUw4cGovYnMrUTVkSVhi?=
 =?utf-8?B?dnREd3lkWkttMnloeE1CTFJZZkhObWFKV1VGMThpb1BhZTNzSy9Va3hiRHMz?=
 =?utf-8?B?aUpFTU94K0h2ZFMwSzIya3g0QUQ5UitlcDVCWUsvZXU2aEhQWks1MWhudW9B?=
 =?utf-8?B?TVZwVkhtQkRmZnZFeGtqVHJLNWNDM1ZqRHgvSktSa1hGMU9HWnM1UHBWbEF0?=
 =?utf-8?B?N01SNFBLbmhEb3JGQXJld3E3cG9rMVRCNUJnOXplL21UaksrbDVYaGtDQkFL?=
 =?utf-8?B?LzB3dDQ3WTZ0RnNvRDYvTW5VclRYeFRNQ1pUdDVza05VUmo5cG1tZWVvdTJh?=
 =?utf-8?B?dktJUExLVVEwRFJTb2VtU1hMWG9ENGVwZUc0djlHZithK0hkSGwzQkl3ckhp?=
 =?utf-8?B?SGs5d2N4bXpIVWtRTHViaHNhdmk5YlpjWXdLWnA3WG8wejl2Q0tCS2ZUWEJK?=
 =?utf-8?B?RTU0elo3UDRvQ3hZZUVWd3h2MmdEYzB2MGlkbDg4aXlVQjc3NytpODA5b2NN?=
 =?utf-8?B?WUtMYk5VWmsvZjFuZXBJbmw1cDQ4cG95WFBzRnY5alZqSTlKQTg4WjdxNkpO?=
 =?utf-8?B?Mk1YS2NuRzlCRUxaT29PdytTTEtDWm0xdlR4WHFRMHk2dkg1Qm14cTN5T0Er?=
 =?utf-8?B?ZEZnUTFnblovalM5amFGc1ltK0ZzSzVGdWw4MFBhMmlqamtwMXdwWVJyK1M1?=
 =?utf-8?B?SjBSekxuOVFId21xTDZGV2ZlRFR6UXRXU1l5U1ZkNmlvY29LVDlhWDh4MFlW?=
 =?utf-8?B?M2tLLzRBSzhlQXZWWmNkVzRVUVBlbzhoWlZjZ0k3Q3RYbko4dFozMUltVU5O?=
 =?utf-8?Q?tKSceBVUZs7/a6yIDLJtAX0=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f51593-37e5-4473-6d48-08dac89d753c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 13:13:04.8514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJh5hhuVX1t6EPrv61lACHikIDFd+X1kom4aWMb46JPt39zUaMWSHqJk0Iil4WI2msiIdEkiK3bFA1Ncr7b23NNGOpG3DbGC/9KLUETR5conlOBghTv+6/+iwiNDB+bS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8962
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 13:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173420

Hi Mikko,

On 11/14/22 16:50, Mikko Rapeli wrote:
> By default host side IP address is not set and qemu listens
> on all IP addresses on the host machine which is not a good
> idea when images have root login enabled without password.
> It make sense to listen only on localhost IP address 127.0.0.1 using
> config change like:
> 
> QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp:127.0.0.1:2222-:22"
> 
> This config works for qemu itself, but breaks runqemu which tries to
> parse the host side port number from qemu process command line arguments.
> So change the runqemu side hostfwd parsing for port number to ignore
> the host IP address field.
> 
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   meta/lib/oeqa/utils/qemurunner.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> v2: improved commit message
> 
> v1: https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/topic/95016024*173234__;Iw!!OOPJP91ZZw!lmurd9F5r43EHopuJkrpTJZMlC93fI8sXSNgnxmfVSRyTvP6unwa8Wn4-wxgjS9UM6EQUnGK5X8gzyVSyfm3WExF4pLQQuHl0L_BlQ$
> 
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> index e602399232..f175f8a1de 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -401,7 +401,8 @@ class QemuRunner:
>                   cmdline = re_control_char.sub(' ', cmdline)
>               try:
>                   if self.use_slirp:
> -                    tcp_ports = cmdline.split("hostfwd=tcp::")[1]
> +                    tcp_ports = cmdline.split("hostfwd=tcp:")[1]
> +                    tcp_ports = tcp_ports.split(":")[1]
>                       host_port = tcp_ports[:tcp_ports.find('-')]
>                       self.ip = "localhost:%s" % host_port

Wondering if we shouldn't also update the self.ip here to display the 
actual ip to use? I assume we just need to extract it from the first 
tcp_ports. I think it should just be tcp_ports.split(":")[0] ? and just 
need to check if it's empty/None in which case we set it to localhost?

What do you think?

Cheers,
Quentin

