Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6F2CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 14:00:29 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web11.215781.1697551226821735833
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 07:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=FhKSXua0;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.74, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CI6piy2qx3ODK2CjyObAtl4VmMhICL31f0qikF724SQDdHP/9JUEf1knuWiOuG210cW38kKkZAfLif8CEa5TsptmliTnA/rTGaZavb4BqvuLzEyyBXjjZb552Hnqfy+lzBCTr6gyr16SPtDJxtk4r1AJptZKTOA0FKjNaRwF9cyQEp7XGIHFp1EiKUg6Z9Q2705fm/G15BkokhAggiMMKVBuouBez1qpDthcPpotXwwKIV2IVvYUE1BQPhZhgwSR54GBP7U5G8QwDUxNtjD2xvgUaqbti4FWDCEfde/LfcjXXds9GHTO2qsijr9NTwhWGNUQ5i0AVQdIKtLcydk77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlmgknTQMHUBM/shdDGv7eez82wuTVtaqf+VJSIsAQI=;
 b=T8+d5WqM3Km11ID+mvdJ7Q48fJNV91DgW7IMOEWJpIunMHZyZKodX+i/Zw16OvQWnX5D3XI+mcbNsG56P+EApGph3FQzm9zLnKoDH1Aem50m6R4hbX1zy3omzYP9TJzfrO8ydWbsczccng6xuqFMpd65O46T7JS1VXb5BpWrKD7HCjTf8NWrrQo6/yQRZPvkVuhNrHQYrszqMbGHR2KYkN7faQPS8fAdbEDs0u4JvstJym8zhMTB4mOQGD+uV6lH4hQpI7r9e0KtpZrWYObFIh19EIixaLa2aXwayYUItvS+e0AgMum/3PafhN/M1JwovZxmsmAJPOYIxTAqj7i8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlmgknTQMHUBM/shdDGv7eez82wuTVtaqf+VJSIsAQI=;
 b=FhKSXua0KrTvdeyl10I1mDfhXv5eGK+/MXOWqqFHE7RxUB4IfmkRrjixkxMFyuScgwT2oBPSjgyfC0qDeD/35j+5t49ndG4PQayke2XWgG2vUl/gjia2rtaWwMJGIMI+LSt/+OpRIpn0khlNZZZTM+dxjE7TBu8vUy16Hky7B/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PA4PR08MB7596.eurprd08.prod.outlook.com (2603:10a6:102:272::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 14:00:23 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::4d2c:55ba:282e:9a62]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::4d2c:55ba:282e:9a62%5]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 14:00:23 +0000
Message-ID: <68f2963c-8c25-a005-4635-0baf5e13817e@weidmueller.com>
Date: Tue, 17 Oct 2023 16:00:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-Core][PATCH v2 4/4] recipetool: Add handler to create go
 recipes
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Vyacheslav Yurkov <uvv.mail@gmail.com>, Martin Jansa
 <martin.jansa@gmail.com>, Lukas Funke <lukas.funke@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
 <20231017132647.352938-5-lukas.funke-oss@weidmueller.com>
 <f07f4dd38c52c4dfca42723ead5d97ef8015a994.camel@linuxfoundation.org>
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
In-Reply-To: <f07f4dd38c52c4dfca42723ead5d97ef8015a994.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::12) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PA4PR08MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: bddd0897-3472-42d6-7e05-08dbcf19686c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	REzx+851ZSFkmRzH5emiGRcabCKvnDLh7H97bV8OW8ZEb7nXRirUjnss57+dEOQjav+ENluNuPK91I3VvAygmAEeo0bq5AhFKgjlGp/J+BNdliKYABceqGsHysJT9+Nnm3dWlbR4vrRxXdkPJjWf3GpTp47hfH/QHPC2hjMG1Qqa8qfDdb0NCAS7cQpGgOcjgSotPkzak5MtOrHymhmP3yhWnvnGFJvv6q52hG/QlLx109KrEjB4SdhUD1C3kKwuk+K59IVTrN56T4LHyPc+ocg1ADLEQoavPpbw2+oUijNUU5ZInmyJ32wy8PPv5C2C1vGKpGIgqiMk5CIkHSdOJM92x9qOZYtWBFTJ4c2HuMXPKqGqstnRQUiD3NVf0v7SnJ/LXWyqYnFIaiIFK8FXPWnf8x5OEsZX1N9uiRwNTv+C/p/Uut0kpkNC/yO/HXbfyUYVzsjZ+pWYPi3+cfaPPO+bikMwdebdThk4l+utBrhw2GbIjCG0U9xvAl4nP/LPYDPgg+iW4hFRx0RudvaPu0nVygDcc3U3Wpz3Ia/l7ipbvtLafB/0BOnfs2m2dqbOF7knWmQkC97p9ndrCj9+9rFYz/Mmdf5yDjAeycVMEyo2ZSnbuKyUapnE4GNH/FtAkKjKedsQbXiZ5caXqUcknmG4BsNbr5ubbZrswlUmvgySqEE0Bx+r9mq0dXjimALn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(346002)(136003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66476007)(2616005)(26005)(107886003)(6512007)(54906003)(66556008)(66946007)(8936002)(8676002)(4326008)(316002)(5660300002)(52116002)(53546011)(6506007)(2906002)(478600001)(6486002)(38100700002)(41300700001)(4001150100001)(38350700005)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2JseHdpWTVkVTc5N1BuWXROM1BCS0dLaGRFSjY1Wm5VY3AxTklPY0JjcDhW?=
 =?utf-8?B?MzQ3MHBtd2xEb1NHVTdHU2hVM1laOW1yRFlLQWttWHNGVVN3MlcrL2REQm5h?=
 =?utf-8?B?aHFkTDRjckR2WFFsU2d0T2p6em9tbjQ2bS93TmtuZUdwR09aYXI1ZTNseTdK?=
 =?utf-8?B?MDZvYmFZUUwzc1p2b2F1a1AxTExVQkRraEtMMDFNRmtrUVZ3STBTQ1BseVFl?=
 =?utf-8?B?VkFzdjhDSHZ1VXpHMWplb0xLdmZVMGd4MytHTXFmSVZIZ0JyaEJzK0hYdnFx?=
 =?utf-8?B?Um5IRkhIYjcwUXk5RndtWlQrOXVUdWNuQk05SEY2QjZnRnluU0ZGYzJYU1ZK?=
 =?utf-8?B?T1I1dGFpTUtnSE9PdmVsR0o0QUhVQ3FXWldSNnhHZE00UG11NmZkWmNFR3F3?=
 =?utf-8?B?aG1LeW5RcVVUUFMxZ2d3MzQwb3hGQ1BBUjd1TmVUVGVqblRnNjl4MlBORHFu?=
 =?utf-8?B?SkU4aHVNV3RhOGtwMnFLMzhFMys5TEpMMFpLZU96d2cvNFBoN2RDQWN4d1lB?=
 =?utf-8?B?ZC9BRUxCUHFWbDFqZ21qWGc0Zm5qSnhYUU96Q2lwbGJsTDVmeTdkdUVhZG9W?=
 =?utf-8?B?a3RDYjNqSHNQRjlueGgyeG1nYWlpdzNnOGEyRFZacGxFYlZWZXdOZ291cWJX?=
 =?utf-8?B?b2M2K1hVQUFKK1F2Vm8xVld0QjRMU3dtbzNJa0xLNC9ZL2Q2MHQzaUUzK1ND?=
 =?utf-8?B?NlR4b2VmdVNBcU5jZHlldUc3dm1MRVFkUzhVOElpT3FhTGVxa2pUTjZCTHY0?=
 =?utf-8?B?UGhmdEZsRHV3WFU3NEVnR3gvOG5PaW1nbHpmTGk3SUk1MitKZDhvVi8xQTcy?=
 =?utf-8?B?dGhJSXJsTnFsVldsS3AvYk1BTUtDcVd5VUhuWGx3dXk1NHcvNks5bzZqdnNW?=
 =?utf-8?B?SE9IV1phVC9NYi9hcVlmNmlLZWJheEZpbTlnMEpwQmVZa1pJc1BER3dYVEE1?=
 =?utf-8?B?NUNhaW5vRXk0SHlYeHQ0WFh0ZFNlWkF1K1VwWElSS1JPam9rYnl5OHA5WjYw?=
 =?utf-8?B?Qnd1WmU1RjNaVjFnVUNpUnUzZktsSlM0RmN4SUhaaHRrWHZ2SmttRHVkWWpK?=
 =?utf-8?B?VkhMQmhPeWRLMVVqRGJCa3VET3ZCUVJneHV6emtZZzUremI5SkNYTXJvTFc4?=
 =?utf-8?B?OFV0TzdLdGlLV2FVczdWUFA1UTRTU3h5NEpxZ3ZCSGxzTENmSTBNTzlFdjVv?=
 =?utf-8?B?dlhWYmR1eVpUWmEvRmIrb2pENGdEcTYyWWQ3cUJ1ZG41eHp0VHpub0xPdTZs?=
 =?utf-8?B?T2s5YllMSDBrN2x6L3E4TS9yUXFQalRmVGN5WktVVE9LSmo1QndNNUxQVWxQ?=
 =?utf-8?B?TFhLQ0VTeDJNQTMxdHJFUG5sSlpUeno4Z1BObGNFRWJGZ1NQTWI2UUsrRngx?=
 =?utf-8?B?SlhMZmdkNEFUQ0hnMUV6Sm9yZ2JWb25sdEZWRyt2WGV1SStlZkVrTU1BWWtF?=
 =?utf-8?B?NFE0OE1ab3FYVVF2bmdQZlNQaWhpU1AxM21IMEV4bStoQk9odExOVGpnYUVY?=
 =?utf-8?B?bFdwU25JLzJGekFPaG8zWVNZbWtIdDNHelhUMitWdmlhNGVTVGdzcEtTYko0?=
 =?utf-8?B?ZEREQlFOd1V6TXFiZkQxYkZKNzVsc284VjB2blZtR1U1ZjA5NFJHU2U5UG9t?=
 =?utf-8?B?L0xidXEwQTU2YzhVY3U0Y052MEVjYUw2M3BEZkJEVzZLMGd4NzlDSFJJY05M?=
 =?utf-8?B?SGFvR2pLa2M3UlF6Mk9Wei9lU3V2K0lyY1VJSDFkTUcycHBKZ0EzeHhtKzBl?=
 =?utf-8?B?dE9RSkhTdzRnck0yaW1qVzh6WnBJNGFWSXVFT3dkYWF2MkVVc0pwbE1zK1V3?=
 =?utf-8?B?c2V5ZFRQTDcybjdMMmtCbENsYy8rQlB4WWdMOVY2UmdqenhNMGFzcVArZUhG?=
 =?utf-8?B?REZwa0JPYm9Rc0EzQm1FZytwMjlHYmVEQnFEbmZvN2cvWXhSdmdDc2t1eTFO?=
 =?utf-8?B?Z0JWSjBoaDFUN2RlWE9pWFVSeGIvbG1BLzJNVUQ0aFVHamZrZFZkRFpyOGxU?=
 =?utf-8?B?T3pzWWJjTHJTQzlRVGNrV2szUHJ3QzE1a0pIaXJrS3pPUTczUU4vZVJSSnV1?=
 =?utf-8?B?a0lDQnRNTXJhVzlRM093MGxHT21vUlFxT3QzejE5NjVmRktvOEtkTVpFczVP?=
 =?utf-8?B?cEhZZHA0cFdzWks1L05QV3J3VENPaWRMd3BXMjdkajI5MjZKQXN6ejJEWWhE?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bddd0897-3472-42d6-7e05-08dbcf19686c
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 14:00:23.7115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJS1dHHkn2xFfI/p7JMBDXId7OMa5mG1lu2AEgFRgWQ9HcddbHgZZw0y8q0INr45nyqgxUvLD0xyrzSBrj+rfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7596
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 14:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189336

Hi Richard,

On 17.10.2023 15:53, Richard Purdie wrote:
> On Tue, 2023-10-17 at 15:26 +0200, Lukas Funke wrote:
>> From: Lukas Funke <lukas.funke@weidmueller.com>
>>
>> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
>> ---
>>   scripts/lib/recipetool/create_go.py | 730 ++++++++++++++++++++++++++++
>>   1 file changed, 730 insertions(+)
>>   create mode 100644 scripts/lib/recipetool/create_go.py
>>
>> diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/create_go.py
>> new file mode 100644
>> index 0000000000..e0254f111b
>> --- /dev/null
>> +++ b/scripts/lib/recipetool/create_go.py
>> @@ -0,0 +1,730 @@
>> +# Recipe creation tool - go support plugin
>> +#
>> +# Copyright (C) 2023 Weidmueller GmbH & Co KG
>> +# Author: Lukas Funke <lukas.funke@weidmueller.com>
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# Copyright (c) 2009 The Go Authors. All rights reserved.
>> +#
>> +#  SPDX-License-Identifier: BSD-3-Clause
>> +#
> 
> Can you clarify what this license information means please? Two
> different license identifier lines seems rather confusing and
> problematic.
> 
> I've not looked into the rest of the patches yet, this just caught my
> eye.

Some of the ideas/code was ported from the original golang code to 
python here. Thus, I had to copy the license information as well (I 
guess?). If this is wrong or could be written in another way please 
provide an example how it's done.

Best regards,
Lukas

> 
> Cheers,
> 
> Richard
> 


