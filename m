Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFB5C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 12:27:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web10.13246.1634041673525414822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 05:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=Ll6RSUpK;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.75,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC8kBmNk7RHc5/c0QHbUG6r6wZbFGw4umvhFCMPTVrds3HZmWBOgnvbNYiJRss77XwSxnC8y9RKkvwQSZ51zfU4INb7gw54enOrLhtIJbcMJQxmOqR5cZswKdL/0rI9PsJStiYNU9Rdidji2QXwb0FV/8dk6CxPsA156fR7hSaLHdKI09DPrFDqrJsTkZE+NxWLKU4H97RqhyuZVALvsWyIqf5SmPnO7ej1xxp2+z/OPrBDox+v9yB3zLZ5yvlB0Oj8fD3LSROKsn1c/9e/R6oFOOnc/d1n4tl/rdSoX7g9BoYihktF41mxqsJV1BXUV3RrwrX/hdUepYGhSb6fB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTc9CJYgeVqFpmXOl6cQofdpdjj9jsoZY0w+MNuSjsA=;
 b=GtXdlhjWNn9gEwgtLz7PDAQW662nvlB3K2wK11NBZ1mXmRojAneQhoK5kKkJG3628fIQvQWKouo1qTdqHEWLVj3Pu0Vba3dA8t/vzkpnKSkzsqMqfMqd3lnBKOA7H6fMQjwyoBVaynH2p28+NstFa3GlLy/p1RRtM3YG0bv/PcXjSlV7o8IxYGfu6Dcz8xo2VXTThKZla+QmdWP8ceR21nARxw7oXTYrFhWn7YiqqivnQfBBge8TDKBYU3Bnq+leQXnQvTNRoEkuaCVLBsLRZL/XF3KgKoJbJIUBTcFrBfMYsvUNEtcjFoonLQXzbqvBmIBBt/k3XB5yrwuGOCu8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTc9CJYgeVqFpmXOl6cQofdpdjj9jsoZY0w+MNuSjsA=;
 b=Ll6RSUpKe9Qyg2ZBHmBFCPZGbO67VnLdknmx6YNvRV4e+mNg/JIPA9pNhnNSolwJY8B9/us9uCVRfEj9iaqAD8P3t+fCbNfjcQG7AfrgINzEOLep1eIi1ulvPs7xx+isgaVNIvhrU82+q+Hd4DoUxopm2SShWXzq7VswRj/f9CA=
Authentication-Results: weidmueller.com; dkim=none (message not signed)
 header.d=none;weidmueller.com; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5801.eurprd08.prod.outlook.com (2603:10a6:102:81::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 12:27:50 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 12:27:50 +0000
Subject: Re: [OE-core] [PATCH 03/12] recipetool: Skip common source files in
 guess_license
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211008074228.8635-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <AM9PR09MB4642A1F4033A48A1FF7EC20CA8B29@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <f0cd4a9480197ec5659fd4023b3650131e8a6c63.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Message-ID: <69caf2bc-80e5-acdd-0a99-c9b85b7de066@weidmueller.com>
Date: Tue, 12 Oct 2021 14:27:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <f0cd4a9480197ec5659fd4023b3650131e8a6c63.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0038.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::15) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (89.247.126.229) by
 AM6P193CA0038.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::15) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend
 Transport; Tue, 12 Oct 2021 12:27:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e642253-93c4-4e66-705e-08d98d7bb478
X-MS-TrafficTypeDiagnostic: PR3PR08MB5801:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5801BD9B533F9431FCF2D46DD7B69@PR3PR08MB5801.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7JZkkYbC5HrEiwM4v4w4lXjES7yrwaP8XiJSZiNXbidT7vYZ2dEx5NqQ2KiwBo9sd191LhYsc0il1lMMwhrPcj6VQ7GZJzCGPMbw+AXtTx9chfBHzmd3uG77HhRvvrDrJ56GspSoO34ZFrednJnWTlIZ8sBluQH8KJOnbgHplWLLVj98WGQq4s2uLDFx3WUu+MCealiPbue8WjvIiSdWkrTMozpKB7gvcMk/zjwnnzRKN1qQHlJT4Tns2ywZgC8x/gltAQKZjzBTT/Q5hIH7kRhogr2FqhHjYKL3Vvm8GpD07WwA+pxpAtYJ1ur59UlC56wZ2b2bJb6PrTtKaupm2p6XgN1WzdoNQGrw5IvqgYu7+h+f+fVQHwiRUqWBKfDT/sh8tc9YqDMjj7WuRXD83bRhK7tjlp0fR4JckfrDOYKUJbgysXWyGbD43e2R0G93ZES+4ppBc+Y2RQML9zK6SZTGGeYOKXhnL007V6zBnOA0wPEVTwEozjlqY3LiqvZ0TwNEfePO6nTC8OyK/RMfdeVHjEBpITTz468X0/dp1kXemfzpOFzdRNJ4KWrKOyFJhjuRZ4oifBUESTNENqIBRlq9lBTEpJfxdSb6FdeRn7HdShXVnDMETAKJv24iMuKScCrcoPQmkF6N1Glimygaxnh3xzD1Uf5pxRXfJWljDKXAjTO/p9IQLkNaK0KTI63E4TvkpMrMCF9FhNZ5vK2x3cXQVIpVT7pv0Gxrn+V2ESF8fBymj1FC1aK8VYhcGl+6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(36756003)(5660300002)(8676002)(107886003)(66556008)(83380400001)(38350700002)(38100700002)(4326008)(26005)(2906002)(2616005)(66946007)(66476007)(508600001)(6486002)(956004)(53546011)(110136005)(31686004)(186003)(316002)(86362001)(52116002)(16576012)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y04rZ1NwcUU3NTFFck82amlYMlczUEx1U3F3R0J0TU1JVjhVQ2pCbmhYMDFs?=
 =?utf-8?B?THA3Unp1RUZNUGxjbUptNnEwNTZjZThRbnVmYUVRMk9FcVV1aXE3OUNYR2tK?=
 =?utf-8?B?SHdNTGRVRmVyUGxVb3NYNWphdk1mN0c3dC90OHBwelRiVTN2UXU2Z2RXM3Iy?=
 =?utf-8?B?TThNL0hnSGh6VE5BNFpLMTBjeGRaVkFqcFlrT3I2L1E3eFdPODBHcjMxbTRq?=
 =?utf-8?B?TWROYW4yV0o5THA1WHN0QnVUbkRYb1Rwc210eXlpelNYTnJxM0lDYmRsNG1M?=
 =?utf-8?B?c0dubE43VjMvamFLeUhLQWwwYTM2QW9hendKc2MyVlRvT1JWYStuT3FneE1i?=
 =?utf-8?B?K0RFRGlINldXUDBlczZMSW9ZU256YXEwMENHMzNXWVd2c29HUDRNWEtCRTd6?=
 =?utf-8?B?QXZhT2w5ampGKzhBdGJjS0tLdDdYWmlMM044MHdLZFU1eVFCaUViWmZUalJv?=
 =?utf-8?B?YWgwMUM3RGhZQTlqMjY5bXJ1bVNRa056WGZHRW1lbC9WN1drb3dyOTgvVlZU?=
 =?utf-8?B?b3kydm5uMWRkdlFPb2VOVDF5YjNRcCtqQjMwa20vNmtSTUdQNk9MaitzWk5m?=
 =?utf-8?B?eE8vU1hwQzluWkNWYUJrbmkrYStDMXpWbXpnMVFRYVkzVEhTZXdKaytQaGF3?=
 =?utf-8?B?SWE4N09wYWtBMitZV0JPcFpzL2VCWFA3N0NCM3Z5REZhQ25UNGdaRTQzR2tC?=
 =?utf-8?B?Q0VWc2RqbGxGU0NGMzlPZHN6cnFrOUlKMmtxdytiZlNVcFZvU1dxWFRJSTNx?=
 =?utf-8?B?bnJMVmhqODB2YnNIWDFOUkFmaURGdFdrajY0M29oMDdIcGhzd0RVUGhOOXYx?=
 =?utf-8?B?Vk94cmJSSUZLQ1diejladjdRSVhVVW9Yb3VHeS9BNEJFdHRKRmg1RThGZ01G?=
 =?utf-8?B?L2dDeUV6UFc5aC9ZcEMrU3R1dzlYUlA0dlB4NzhnUDFreFpNelhRTzlad3JR?=
 =?utf-8?B?WmttaDhQWWdBZ0hWcGRhRjVpV3hlZ01iaW00SHZFZ2pFcStlam01ZGxKOGZi?=
 =?utf-8?B?RDZCVXNCc3lGRkdieC8xN3Z6TTEwd01pN3l4d2hJSFp5M1R1ZFRaYmtFckN6?=
 =?utf-8?B?eVNlQTRxRS9FZUlGbTZ6NDdvUVV3TEtxdWJvMlFzckhmQ2Q0WTk4S0ZqNE1y?=
 =?utf-8?B?K0hDREM1c0VmcFNXVTBHazdnWXVLQ2pwc21neTN0c1VzcE9OZ2RjWnZmWFZ2?=
 =?utf-8?B?UmVtL2tKVGtUaDM3SkNsTTJvZHdZalRxeFR5d2hRbmZ5KzdMcTRWcVNUbUs5?=
 =?utf-8?B?d3J2dGI5NTBhcUplR0pvUTFkOG9yMW9oVUR5S1RSTm1oWTRXbGl1MjlhcUZL?=
 =?utf-8?B?VU1xNGlYUk50SCs5WUVFQll3NzgwWkF2bUJhK3FFV28ranZMaURGQnBNR0ts?=
 =?utf-8?B?TDJmbThtb2xlMlF3cGQ4Yys4aUtLZ3pjczJtQnZsaE1JcDFkNFJJTU5na3JT?=
 =?utf-8?B?TjA1ZnNaOURPSTV6QjV6c3lYaDBhSFRaUXBRZ2E2MEI4ZXNyNmFCNm1icElr?=
 =?utf-8?B?Q0x0WTNpRllpYUlhSHRucGlGRkJyZW9mOTVUbVZhTVlvUmR1L0pOWWZGUG1j?=
 =?utf-8?B?WnlldFFrOGdwNi9RWEFuU1NUcTY5QnNYVnJ6TVdvQTVaU0Ixc1p4cDZ6K0lt?=
 =?utf-8?B?MFdSZURjemE1Y0JoWjZ6SFVJbFRvaUtFTHVWZVhrbDUrUVdCOVFIbGFUUUVz?=
 =?utf-8?B?Rlh2U2ZPR1J6TXpTNTI3NmF2TTZyQWxza25ZcDdrdVp2V0lZZUJ5OVhSdFIz?=
 =?utf-8?Q?GJ0hO26Zi0Os7jwX+VXD0u7CQKfVkvlTgF3jclH?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8e642253-93c4-4e66-705e-08d98d7bb478
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 12:27:49.9345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 22/V7EtLx5/wiG8J2LZP51IcIU9MlL82xfmTDQUXAiFTkixxQ87eOkGgcwlc8CTv3f9OWzdKEPvz3wAiK2SRdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 12:27:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156876

Hi Richard,

Am 08.10.2021 um 14:26 schrieb Richard Purdie:
> On Fri, 2021-10-08 at 09:45 +0200, Konrad Weihmann wrote:
>>
>> On 08.10.21 09:42, Stefan Herbrechtsmeier wrote:
>>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>>
>>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>> ---
>>>
>>> (no changes since v1)
>>>
>>>    scripts/lib/recipetool/create.py | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
>>> index e88a4253da..83cf25d9b7 100644
>>> --- a/scripts/lib/recipetool/create.py
>>> +++ b/scripts/lib/recipetool/create.py
>>> @@ -1114,6 +1114,8 @@ def guess_license(srctree, d):
>>>        licfiles = []
>>>        for root, dirs, files in os.walk(srctree):
>>>            for fn in files:
>>> +            if fn.endswith(".html") or fn.endswith(".js") or fn.endswith(".json") or fn.endswith(".svg") or fn.endswith(".ts"):
>>
>> Why not
>>
>> _, _ext = os.path.splitext(fn)
>> if _ext in [".html", ".js", ".json", ".svg", ".ts"]:
> 
> you can do fn.endswith((".html", ".js", ".json", ".svg", ".ts"))

Thanks, I will post an updated series next week.

Regards
   Stefan


