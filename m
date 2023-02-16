Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3772EC61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 15:35:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13030.1676561745170287260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 07:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MnWOh2Bm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1411f8ddce=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31GCj93f001962
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 07:35:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=HY2lCchitF3tQPPytPiBM/oQRrLPCjpPOHDMscbpWag=;
 b=MnWOh2BmgfKZz+i/c+yNWLchRjrDLWXzjEaWu5KBqy96A+DYZ/FsZ13i4/7+yJ0wRirw
 VtEl3Ae9my27vq1nr6fPYChGALrnRry4Ndz+eegvJWwvsZqz3okasoyTUsC93NvDzijJ
 veKW+DXkPZkeKfjpiCMqRjyp82HnYWcoE53YOEgtca58eMYbqwpl8SPiPJxDLAhQks5z
 V2DkrMEFyegsztLGJ0qUcQXGoJgNJu6o26q4Rni5isZPcTSTPNya7Mlnv/Avsoy2ACUi
 45vaCuQzXlOjw78MAKBQLaG/6CpUOovYBVlJ9Pr6knft59g+0ngPUzHav6MoIZ9qOeHE 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsbxarhtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 07:35:44 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31GFYupw031714
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 07:35:44 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsbxarhta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 07:35:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXD6tadxFjdKXuyguFFY2xHcK0PX7KHuGN7QHteU8B4f6RXFLG4BUZcsYppcjokVJz4xhjbXxLI9SAUUy91pW0UPn6mNe89ekRuHOyKhOejrFVBuGyAatlKiqi8PNLBz5xKyQNfclRtaTNy1IL8f2TDGX/eyRSbAs46PIdRKzjAY65UnBH789zIZ1d3yy8QgKCUxDZJedVBUz8SDdI/ll6d0vhmkeY1dVjiuPgXgKAX3ZGXPrc5jsmsu2VAq62wR2/8AqQlpfhQJq0ghhIjlIX6nrLNlQloUfa5G/MsbIUirvcAk2Tm6dbBAroJMgocRLxF7Xl9PGZxAVmzyQ5vvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HY2lCchitF3tQPPytPiBM/oQRrLPCjpPOHDMscbpWag=;
 b=EC82i51h5o8oXu2GGL+cU5CWKnY/5hqSMFNsAScW0mceRkqikwxMOZkvmAoaoUat4/UPNwHjQx+qw/9PFJfha4D1VFgZBU/HRlN4Zm1SL1sCk0pyeyBuaJdGsxSMTNfkfHL4McwcpQsmIM6a7II23bzzoUWHQjzfKfv+QyZ2GFkacwRozEIN5SeYIRJlNIJK1+yOHUULKvs1ZVGZN4zhdH0PJsY+7S0UBUWSjpOtMILP4xtQcjL6GJD4Z8a3hqXxRciTWKMQi1Rg9Z2AKufjPnxNnmBkpvcrHgMG5HWe7qlrUGbIYsHwoCN//k0qJedmGtjbyxqL+l1XQtAW9bvqfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 by SJ2PR11MB7600.namprd11.prod.outlook.com (2603:10b6:a03:4cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 15:35:36 +0000
Received: from MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::524b:83cf:5482:246e]) by MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::524b:83cf:5482:246e%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 15:35:36 +0000
Message-ID: <343d6e1d-962d-b1b2-0ea7-b10c0850b8b8@windriver.com>
Date: Thu, 16 Feb 2023 07:35:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] create-spdx: Add check for variable contents along with
 quotes
Content-Language: en-US
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230216003023.4153138-1-saul.wold@windriver.com>
 <CAJdd5GaYwcjawUy35PAkhKwHbTFP6kpOFmY==tfNZG6Yw6n4cA@mail.gmail.com>
From: "Saul Wold (local)" <saul.wold@windriver.com>
In-Reply-To: <CAJdd5GaYwcjawUy35PAkhKwHbTFP6kpOFmY==tfNZG6Yw6n4cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0052.namprd07.prod.outlook.com
 (2603:10b6:a03:60::29) To MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6035:EE_|SJ2PR11MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c35772a-f88d-479f-583f-08db103372ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IjIGxea2bdhkFkR5I4oC54ZVQbEpynknswu5JOYJ913ZTx41OOWQ5ADmjisPBPJUYHTww8qE2tXyb9AMNO79lyfiAyMIyhK41/O3JrOlFC9vS/qsLhZezbtJdxns1HoIWbahDNVpQdG0MpkiXsQTVlzNAh8z0T69U0FQN2H8xestgVINappwu4oGP+wWLNG0RKSgdtZdJ2Yv9SZkuWX+RnGL0YoEtpH37Rwb1ggugI+MI+WxiWAGVTeQwnD+rGe+vTsDTXW3c3kHVlWS+loCAAJUY2nfTqAF1ekrVzytePRJazCSyHknM+pzBXu8szYI+2rHTc4vuApZ6sllcjObKiSJ6eNLtA09TXkPg9Fv3etRPtyv6JsveEFsn3EFPzZy8cwt/y5lZ5/9+7gnVHOkDjAdlPd0OHn5QokKII3NSKe3eQUccum0rtaln5uHGzofayq5g4KIs+v6G6SUEj8xOkRhl7hIGn9MDZjQaU0+0fRJqkTv2TXq/2KlPiLschSYuCs5OCECbWshKZNgqRI3MFX6sY8175DAJu42dAQ32A4CLDvS3jQR+Ajd2P/j0jTII7DNcRNtsszlKOP8JVr42ohCz3uaWmigzgvGJR1wfHYDdP44YT6lM7Hk48BlKSAtSYq8dhQAgA2+yhy5O1z+2piMnfmBLdhu7GtXHmh8wVXunpyeekXpnLuSt1sXzxLXwG7ufww1pzr12qRB2pw0+KXK01kHVvXu0miBQCrMEcc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6035.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(396003)(39850400004)(376002)(451199018)(2906002)(38100700002)(316002)(478600001)(4326008)(8936002)(66476007)(52116002)(41300700001)(6916009)(8676002)(6486002)(66556008)(6666004)(5660300002)(66946007)(53546011)(31696002)(186003)(36756003)(86362001)(83380400001)(6512007)(2616005)(31686004)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TnpaU2luSFVWVHhUZVNTcHNocG1tUjIyTlR3bjB1T0xOQWZyNlpZYytyQWVy?=
 =?utf-8?B?My94bmxySFZyM0ozam0zQkU4S2JMeUw3WmRKWVZFelZBTVpPWE9LN2IreWpR?=
 =?utf-8?B?ZnpYNCtNNU5xYXFWUUt4T2NIanRzNzZaMWZmL2lXb0JUYUVSRFhFS0xReS9E?=
 =?utf-8?B?Mkg3b3hNQjArNlZmMmZobW9aWlBSS1hEMzhMdGJjelh2WlRoZSt3V2xOT1pZ?=
 =?utf-8?B?QUFqelJxZ3VVUjdHQXJsYkcyU1lBOWk2dlpTZndpYlp3RjhKRS9GOFhreS9j?=
 =?utf-8?B?QnRiUURMdDF0NEd0SWQ1eTErQ2FGL09JVWVMN1RLRXpLa2o5MVpreDg4TDFy?=
 =?utf-8?B?ZVdIUzhiM1VNNzZHVUxTdXBDRUVnUHNNKzdpTDJpSzNjeGkxQjl4N3h1TCth?=
 =?utf-8?B?ZytRTS9udWNKUTEzMkN1MXUzVmY1ZVNNaVNUOU02b29XZWdaMFZxMDNlbE5X?=
 =?utf-8?B?UEFiL3FyTExOSXNqR3FTUTlzOC8ySlE2Um9JYTdhRlFrcC9neE0vZmZoY28z?=
 =?utf-8?B?aEdOVWdIQW8yalpVNElLcmFYOTRPYlpCWFdiOGVHbE9nc2Q4VEEvYnFEeEFQ?=
 =?utf-8?B?L2dxaWovN083YkF2U1BCWVlvbEU3YWVUazhIUVQ2TEZWYmltRno3YnpvOU82?=
 =?utf-8?B?b2NnNHl3aVNNakpqVllqMUJiS3VmZVkrTDU2MnFiTlhLQzJqSkJScm9TVHB4?=
 =?utf-8?B?WGZOR1ZmbHlTK0VLTXBtZzQyNmJyVWFUOE1rVjRWYWJQN00wT01BSWRHOG5N?=
 =?utf-8?B?ZkZ1RngzT3U2T1hESk0vMjFlQjloaUs0SG1WYTlobW5zWnE1RjVaQ3pMaWJC?=
 =?utf-8?B?Z24yL1hydWROUnUyZElxNDRxWmNnMFRKVm4xZ2VwOEpiQ3BuUE1ERzNSMVV4?=
 =?utf-8?B?eHRrMEpPREhBcklpZC9JcGh2ZmhlVnowMis5SVh1NHdER1JOUmo4R1VuVmps?=
 =?utf-8?B?RkJGRHpUU21CcFg0TWRyWVdtTkF4V3ZBVURJOUlwd2k2RUV1cUpHaWJodHo4?=
 =?utf-8?B?MUEzWWoyMHV3TU1od01jUVpnMlF1bGt3RWcwSTZQbUJEdnQ3VERZWWNzZUs1?=
 =?utf-8?B?ZGpOZUQ5ZTNnUmk5MW0vU1pQZ21wRUova2RKclpQOXhYTG0vTzMxeE1lcExv?=
 =?utf-8?B?WHFsZ2pvandWZCtwRC9DMlRyK1pTWExPU1daRjZMTFQ2d3ZtQWhQSGxkczg0?=
 =?utf-8?B?RVVkWE5qQjlyUkk5RGVmbkExYlZ5ckxBUmhuTmlMMVgxclE3a090U0grcEcr?=
 =?utf-8?B?T09aOGZHN0s3Q0hWa3VIYnhnZ2N6aFN2RGl4WkJ1bkZsUTlzSzk0bU03c25x?=
 =?utf-8?B?THBTcFV5MUxnZmJzYUwwd05nQ291dUFENW9qaEJyU2lZaVNLR0lzaWo0UkZ5?=
 =?utf-8?B?blBjOWlHRXdlbmdxWXRwdXZlellTMjNCbnRVdkp1MmM2akRXT1BlTWsreGhm?=
 =?utf-8?B?ZWNPSlczSGdLMlF2aXY5QjFoTDFpNDJpczRwMm1lWW84SDRJNXVBNkdPdnJP?=
 =?utf-8?B?ckhybWVid2s1cU4rM1MrZzlKYUlScE5QdDZTSU9saUtwVkQxMWppWnlLSml5?=
 =?utf-8?B?WGZSYnp1NHVodEI3TXhybVdjTlRhUjZXT1RlL1ZXM3VxYlFEQmhOcE5wWDNV?=
 =?utf-8?B?Mis2TSt1Q0xiTkRDQjI4WEQydEllNlgvMWdBcGl5aVZXVUxvWU04QkpTald3?=
 =?utf-8?B?TnMvRHUvS2xOUklsYlRaak5Mc1dwamhXWitQajVqU3pvOFJ2Z1BKa2hMUSt1?=
 =?utf-8?B?eHV6SnlTNUtKcm13ZW9ldE01aWJkMmI4eXRMbDdtQldHbms0QmJzRXdweEIv?=
 =?utf-8?B?T1UzKysyTUFPWTdPSytScTB2cTFYL3A1QmZkWlF0MzNaR2ZvNFB0ZnBOQlVy?=
 =?utf-8?B?MTM5cnpuR2Rjb2xzYzlhZmFiU0g1R1MrRjlKcmhmVUpCYU8rVlI5cWFoczRW?=
 =?utf-8?B?Um1BWk1OcE1HRnRsTnY3VC93M1RLVVF5RHBSSTYwTUZPSmVsZmNZOXFjUnlp?=
 =?utf-8?B?eUFibm9lcUU0RmdKNE5MVUpIdnZNUUoyNitSRnN2WlZmZDJGdEZUTkI0S29E?=
 =?utf-8?B?akN5NTBrRGdsN2tVaDNaNFJNWHk1ZTZjVUNQWi8vaXJmTFFxMnZKR1F4ZVRW?=
 =?utf-8?B?RDV4YlZYR0RwQmZobHQzUVBuVXlZdXFROHZCb29iVm0vZVZsTklWZGZTVVc5?=
 =?utf-8?B?T1hVNXk0d3hHcnpVNEdEODc2TklKK0dUUlI3Ym9CUm9CeUtibXEzV2xDdDdx?=
 =?utf-8?B?SGFBWHZwRjE5S3E5MVNPYm9yRS9BPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c35772a-f88d-479f-583f-08db103372ab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 15:35:35.8832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXJjgJLikNTlmBC4uc4zouI05yMx6UY5OR2L4tpVXqfN2AHpBB6TZcX80na3qP/qIwJNUMGm8mAlZ7t/mSmAbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7600
X-Proofpoint-GUID: m3R4p5kuIuZuCLn6g0BjDtxpxP_ngH5U
X-Proofpoint-ORIG-GUID: eytJqr4AggvTqfE93OIyghxf0Qx8e7dQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_12,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 15:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177295



On 2/16/23 07:25, Joshua Watt wrote:
> On Wed, Feb 15, 2023 at 6:31 PM Saul Wold <saul.wold@windriver.com> wrote:
>>
>> This adds a check to ensure we that if a variable is
>> empty it gets an empty string, this also adds quotes
>> to indicate the variable contents.
>>
>>            "comment": "CUSTOM_SPECIAL=''"
>> or
>>            "comment": "CUSTOM_SPECIAL= 'variable contents'"
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>>   meta/classes/create-spdx-2.2.bbclass | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
>> index 28a42e009f6..8b18ada40a4 100644
>> --- a/meta/classes/create-spdx-2.2.bbclass
>> +++ b/meta/classes/create-spdx-2.2.bbclass
>> @@ -484,7 +484,10 @@ python do_create_spdx() {
>>
>>       if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
>>           for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
>> -            recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var)))
>> +            if d.getVar(var):
>> +                recipe.annotations.append(create_annotation(d, var + "= '" + d.getVar(var) + "'"))
> 
> Why the extra space after the = ?
> 
Right, probably should remove that.

> Does the variable need some escaping in case it already has a single
> quote in it?
>
Was thinking about consistency with the empty case below, but I guess we 
need to think not just of a "stray" single quote in the string, but also 
a stray double quote (").

I guess we can just remove the single quotes completely for both cases.

Sau!


>> +            else:
>> +                recipe.annotations.append(create_annotation(d, var + "=''"))
>>
>>       # Some CVEs may be patched during the build process without incrementing the version number,
>>       # so querying for CVEs based on the CPE id can lead to false positives. To account for this,
>> --
>> 2.25.1
>>

