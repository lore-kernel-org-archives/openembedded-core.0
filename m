Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.81])
 by mx.groups.io with SMTP id smtpd.web09.4517.1620273283920895464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 20:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fNdcI1jZ;
 spf=pass (domain: windriver.com, ip: 40.107.220.81, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9qfzelXoObumXBB1++rdXei+HUMfCKhLo2SoLDFWh0DDvGYEhpNC/nV8NX2y85VZ9/gUNe2bzU4DWBR0J2sR6cLXmle+F2JY3lYGJD5UetKXKE8Dv57sQH+GbN2sOJEC+8jW4Gx7zpfOKUczSRukfrnilMetd4antmQhKUxYrUbr9pjfVGJ7QpcQ7UgC54EnvkU1f4JERENeiQKmnTPMt7If/85NzoTQyr5iILV7FNqzG4LH1VZSk47eA8urSH4c8a78tnsWhG6nhFUE2Un+NpwLW45TVGFzffPLyAHWOM0xV14HSYGvhL4j0sypeP8gpaUoZWNv/IVpj/Q6Xxyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx79BDU9Mkgv2MjsnI4nYs4Hi9vDLuYRp9P24MVj4Wk=;
 b=XbE0LVKj73+cfjFCocQTrit5Qhl7Wc3jFpzf1hib55uKpNOknuCyZ1KwD8LzCy5vFE2Qpp2/bZs3TgOSpakG/jXgJbIjStZVlCzPE3LxpBsyuPeQqlIJktUR3zUJeoE0i1LInuLmcaiz4egudbc35VXaC1MV40REthMs4o+Z+JsfsC7cqyHQfT9g2/lSH8wTDH8T2kCRdv3zlFysCDLxMz/+4fVGArkbPYp8bFoXj8+JTfv4bb4wmBnwawt9BMZ1Hl4k9x5xnHGCBnRPvwj35WhlRPXMPxkRiFoCLtAc0SZ4Yqd9Sy7yR+s57YsW6LflrsuuhvBHJPgWEeBiQnedxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx79BDU9Mkgv2MjsnI4nYs4Hi9vDLuYRp9P24MVj4Wk=;
 b=fNdcI1jZ9yjKM+50ids68FoH+KtRIFwMQk2n8ulMyu6UPxoHUwcKKr5umC6PxQMDTmULY4qL2rf5Y5tovfT1MkhcOniqA8lXIuXi1LppgzxOiGErc9yZkaIhWBJEcza4I1ZGK331vz9fGBIu1vlzJfOrFKY+9FE+NoiRyaB4w0I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4862.namprd11.prod.outlook.com (2603:10b6:a03:2de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 03:54:41 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 03:54:41 +0000
Subject: Re: [OE-core][PATCH] oe-pkgdata-util: ignore SIGPIPE
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210420083756.11588-1-Qi.Chen@windriver.com>
 <1340f9b6c44a0c6b62dc2cbb37474e9d0a4b8253.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <bf9d1d4c-280c-2566-14dc-d3ef75eea6b0@windriver.com>
Date: Thu, 6 May 2021 12:03:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <1340f9b6c44a0c6b62dc2cbb37474e9d0a4b8253.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:a03:338::10) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by SJ0PR03CA0155.namprd03.prod.outlook.com (2603:10b6:a03:338::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4108.24 via Frontend Transport; Thu, 6 May 2021 03:54:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61edd695-caca-48cd-c31b-08d91042ad57
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4862:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4862BB135E48DAB653722C80ED589@SJ0PR11MB4862.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	90HjwcuPfFNoJ0VwFQGhD4z+k2VYvZanlDJsxZGYl0iXTtz51z1qzYY87Vn8U0SvNxy75LD3ColGAeVFmIgxQ/9z29lnaty0wUoQIoVO9gi8mllFxnDkyUFZ/AHx8ybXwECt2QUTG5V7lv8gYHBL2tv5wrRfEGyeAQp1imK/PKQ/PJ1E+YZTofLDAHLZd9kwZikQDPCFuJeZyH5mr0o9PUvtwNrj0oUbWXd0gTSOgz1OKQU9znKplP1X4FBHOdnlfZYiqwhsRVXfDiOo9GWJnO6H36nD1PKVOnSL9UAsLWkjVGhGK5ZAbeptYZwOjt7m5FzegA1/m+9u9eZ5is8XjouWBl8zHEwUUc8j0Ov0Dh1BJZWqxT/tErsDlKRjkCCV//7B1ZGbulTT2c8+MqgJKMpGyuqRs9G//cL92axlz9l8QdcWV7ydKkH7W4XyRMqnnzSX312ZQ+H+e+A0rAVKUeVr/bnVHlF0FasWYrL2E/Jty9EDzuw6BJvhNxAk/HW0qw1Id1Vpm8iWwljzXUHrEyJjStBcHiuTpkIpXMUeczjy4qu9ni1jcQSiiReDmxgiKtHV4pG2qY9ClcU9IrLX31trVUyvKMCweWBjmWOVHriY3Ht5+Lu4z00aUUSoRDvaumm1SpNkcGWF+P6E0GBIo+nGJPi0CbJNlpHh7lj3cKQ7CpgjFMRObpMM5Uu5CXDbuSmoHBIfvRRA4pMU1zE2GOivIf4evUiZ+JWFG8AKMUiQaCfltGYLfYUNo1Q/n+UY2JSelge/LMEe8+/F3jed9ivbJj7LCb2r9mbGWSOZQ8cryJ8yt5mqIrQSvsyX5Gic
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(366004)(136003)(346002)(6486002)(66946007)(8936002)(66556008)(66476007)(316002)(16576012)(6706004)(966005)(83380400001)(31696002)(53546011)(52116002)(478600001)(26005)(8676002)(186003)(6666004)(956004)(2616005)(38350700002)(38100700002)(16526019)(86362001)(31686004)(5660300002)(2906002)(36756003)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cGJnelZlM3czdDQ3T0NObkl5dmhMeTNINHlZWFF2UytUdGtIYm9McUlCSDdj?=
 =?utf-8?B?dCtLNzJlOEJ0c2owYnZySG5PNS9nTWNaT0dSOGh2WFhyNm9hcTl3RHh3TlBx?=
 =?utf-8?B?VEptTm1zYW1IZm1lK1kvcVhIM080Y3k3RWtBQWRDRmV2dHhVRmlpR3RLUkNC?=
 =?utf-8?B?SmQzbHRsT2NQVXcwQUhXb1VzaDh5Z3JtOVQvU2ZodGRpYTdTQnZVWktCUE45?=
 =?utf-8?B?emxOZGVvYTFvSkw0LzAxdGtyQnBjdFVNS2ZRMnpiNGV1Yjh3aUl5dUZpSDFX?=
 =?utf-8?B?bjFzeG9jekxra0oxTTh1T3VRN3Q0VitIYlRQWWlFUkJpcFNvSGZORTlIcDBG?=
 =?utf-8?B?VEVpNTY5VXRVdEZIUWFwM0tnSkp2S3hmTlJiNFNEWVF1WjJjUHFEakxPazkw?=
 =?utf-8?B?dGxMZ3Z5Y2pRUHM2SzFIYjZ4RzRKaTNTSm9NZVNCL1NHVXREUHVxaUJUTWJv?=
 =?utf-8?B?TDIwSnRMc1VvV3I3aXNZSk85OGxUTHgvRUVuQXRna3hoRng1bHRhNEkyS1BC?=
 =?utf-8?B?M21yS3pyQXhSSGFTQzFON1ZjeG1LRStTR0NkZ3ZreXJRSVhBM2xSYzczQUlT?=
 =?utf-8?B?UjZGUFNyaXhCcEJIamNFTENMaEs3UmV5aTNYeE1MN1ZheE0zb0grQkRxNllD?=
 =?utf-8?B?djE0ODNEY3p1Znk3eGlvZjhoQmY0cXJjU1RaVmMvQjVMUGhBV29uWlFvMEx5?=
 =?utf-8?B?cUNMcGJwa2JQZWRBQTVZbWFpNkhKeldldEQ1V3dQMWV1V3V2NVYrNmx2bGc2?=
 =?utf-8?B?SW8rUlk1Q3lBZEVsMjJ0cWhlOHJNMUFzczh3WHJ4TXhtYk9lNitRaEFtSk13?=
 =?utf-8?B?RWd3L1A2THFUY0ZqNVY5UXBmOFVqdHdTNXJqczFvak05MEVJcW52QTh0ek1E?=
 =?utf-8?B?ajhYZUU0N1ZuWi9tVzlVUEJYSmJ5cjRWV3hNSE5hNmxKL0tHL3d4RDl2QVcz?=
 =?utf-8?B?WjZvbGFzcDdtcjB0QnB5QmhVOGlVc1doclVWVzRSSytsWXVZbkxDL0ZST2Uy?=
 =?utf-8?B?Z1B2RmxPSDFVMEhURWpxSkdDWkd4K2k3VDA4bzRnMis1Ukk0RWk4SDEvekV3?=
 =?utf-8?B?MGJFQ0FvYzBERWRzYVhQQlIyWUZKR0FzOWZqbFFrSnk0U3ZadmNNZXFydXVi?=
 =?utf-8?B?bTBVbHNJR2Y0VkNZdFBGNGk0YmhaSk1uR3BCQWMyMGxkdGNsK0VvSmVxNzhu?=
 =?utf-8?B?STAzRzExc3JQSzFrb0hGWlFxbjFXazFwSXJUa0cyOUhhOURyakdLdVJocitY?=
 =?utf-8?B?bmJJVFJDR0xrS1hIcFJpT3VxRmdCd1piRjI5YlRtR1ZFZ0xrTnNLcTRUczZR?=
 =?utf-8?B?aGJML0xaVnV2UkxJcFBOOTJOWHZ2VUltZjhzNCttdGNadlA4MlVaU3JOZzl3?=
 =?utf-8?B?aHlJaGpvbk8zQTJRbEVBTE5GQ0dlWVJBV3JJNDNISVVvUVhBenEvTXdPbzN4?=
 =?utf-8?B?L3ZkZHFrT09VQi93RFhVZkVscHNNejBmV21CM3d5MmZJWkJlNExsYVlKOHcr?=
 =?utf-8?B?b05LYTI2elNFN3JrQzlsZTBvaUs3QnAxTGJpbVdoTWtIMWlVZ3pjRE5zN29j?=
 =?utf-8?B?VzdQKzJaK1RNVkVOR21PUFJVczk0RXBPZU4wb0w0SnF3dUlWWVdlMDF2YlIz?=
 =?utf-8?B?RUx3UmhEU0c0bklYemtvV1NrTmZQZHh3VHpSdW8wRG9XemdVUzQ0blhNUWNq?=
 =?utf-8?B?bkpvUmUyY2oxcno5dFhDSy9ITEZ6Mlc1bUFqTzBUVkpSajBUem9aQnN4TUh3?=
 =?utf-8?Q?vB2P5uL8TPfjVJ4bOFkrnVMCeWZl3oTbpIETQFp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61edd695-caca-48cd-c31b-08d91042ad57
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 03:54:41.2941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSuxYsZAnWjujWvbAp/0VHAUnyYUV6ladwJEGieMw+PVVHKFEK1LmTjbu9Vt4r8NibQ+V9KPy9fu2kfwtN5b+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4862
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/30/2021 09:34 PM, Richard Purdie wrote:
> On Tue, 2021-04-20 at 16:37 +0800, Chen Qi wrote:
>> oe-pkgdata-util sometimes outputs a large amount of data. When used
>> with pipe, it's likely to get the following error.
>>
>>    BrokenPipeError: [Errno 32] Broken pipe
>>
>> The problem could be reproduced by running `oe-pkgdata-util list-pkg | less'.
>> Type 'q' after running the above command, and we get the error.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   scripts/oe-pkgdata-util | 5 +++++
>>   1 file changed, 5 insertions(+)
> This is far from clearcut.
>
> https://mail.python.org/pipermail/python-dev/2018-June/154191.html
>
> Not quite sure what to do about this as there are pros/cons...
>
> Cheers,
>
> Richard

Thanks Richard. I've read the material above and grabbed more knowledge 
on this topic.

At first, I also wanted to use the 'try ... except' clause to handle the 
output of oe-pkgdata-utils. But there are multiple places for the 
output, so I figured it's ugly and not necessary.

People mentioned situations where setting SIG_DFL for SIGPIPE is 
harmful. That's true. But in respect to this oe-pkgutils-data program, 
when setting SIG_DFL for SIGPIPE, what would be the actual problem in 
practice?

So I think https://github.com/python/cpython/pull/6773 is meaningful, 
but it does not apply to all programs.

Anyway, if you think using the 'try...except' clause is better, I could 
do it and send out V2. But I'm still wondering what extra benefit it 
could bring us.

Best Regards,
Chen Qi

>> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
>> index 75dd23efa3..4aeb28879d 100755
>> --- a/scripts/oe-pkgdata-util
>> +++ b/scripts/oe-pkgdata-util
>> @@ -17,6 +17,7 @@ import re
>>   import argparse
>>   import logging
>>   from collections import defaultdict, OrderedDict
>> +from signal import signal, SIGPIPE, SIG_DFL
>>   
>>
>>
>>
>>   scripts_path = os.path.dirname(os.path.realpath(__file__))
>>   lib_path = scripts_path + '/lib'
>> @@ -615,6 +616,10 @@ def main():
>>           logger.error('Unable to find pkgdata directory %s' % args.pkgdata_dir)
>>           sys.exit(1)
>>   
>>
>>
>>
>> +    # It's possible that this program will output large contents, and when used with a pipe in command line,
>> +    # we will get a 'BrokenPipeError: [Errno 32] Broken pipe'. Ignore the SIGPIPE to avoid such error.
>> +    signal(SIGPIPE, SIG_DFL)
>> +
>>       ret = args.func(args)
>>   
>>
>>
>>
>>       return ret
>> 
>>
>
>

