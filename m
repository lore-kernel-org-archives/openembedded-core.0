Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC46CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 14:13:48 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155240.1781619220126351412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 07:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=XhGmZu/p;
 spf=pass (domain: est.tech, ip: 40.107.130.29, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0I0JQyPlpq7gTF/B5PZGu93RM/3gbWAIbrmiMWw5eWg5Gp7WoRSiG1F6yJawWHrFDWSHmhWUcIM7jvJTEts/6Fz10W9qUeuZm6h4jrxjh5rJAkwQdL7n6kzz5/BOmQf0bpuA8gxardkBZMT8ahtZqKvSJfdT4wGHMV4TrPe09NIxZPo24ujUooSQQN7ZNFX7nfjEpBHUjOa3blUGTQ2hlYh0bMC3SwRG3GJnDtfj9TMdIStM2zYuf12Vlk509T+8wTdigXb8IpwzBGLR73HM4oful5Tjm67Z6u3d2f7YnIW60Mtyr4IjezqJilCTC2/SMARE5jElokSaG8kx9J9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5rxh4fEv+Wcft+rVdqDv3OXWtDR93/qHsIVY47wDEQ=;
 b=DNp6OVniTzkawOpk/FDjn0DBkLlnh+dT9smxI1zXrgITqGEtOyum3n975aTwbpsd+MW8MyACyIzb04iXMEk8eKyPtsA4tkwEBHWT7XsMY+xTloU2oImA4qkNh43e4XTK09WvFeehBmpKV+2p+10w58KHxwx0X1hruyNSWv3XH6zew/99Fc+7FiSPO6/Et738Qae9OgSBNBzHYldKRnwu5TazBxYGkuI/0GOJ4CJOMUAZA4XMdP7ko2YU/Og9Y1Ei9G1Ie1JsTq/X5aOw1pg3Covc+jYJRde2/lg0AWd++Ol1XFEKosmWj693BPd8jqe460NhANH5CeDsPPLrfKWFPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5rxh4fEv+Wcft+rVdqDv3OXWtDR93/qHsIVY47wDEQ=;
 b=XhGmZu/pZob8M8X/RQ7G951505CXr8mtdVLSbLoBg/EgaCfVNB+GV/qxjSRh+9ZTFlslnxX0t8av9iGLsxzDInH8Za0/EYzosjzO3UEamF7i9LAc0+kNIhhNOD9vaswfHOBT2rZt0gMGVGbhlGOxwHycdN7reXeF42pVwBrXbVwfmw/t0ALhDaM1qiKH2VnqXCpybA9eqKQa5iftNPADuExPOyXRJnRTgjMGZHkT8ihjJBRSi8YcxJ/pTlRhCVrKDDi0JPJ/vDfRh2FQWr1SxFPr3tdmHLPxnSZ+xEngGKbh8TNLnW/18DhuMSKolEPGT5iUJQpLsmcTD4R84fot9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 PAXP189MB1925.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:28e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Tue, 16 Jun 2026 14:13:34 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 14:13:34 +0000
Content-Type: multipart/alternative;
 boundary="------------PqOdGzJYEfztAmmFp2bvRQIk"
Message-ID: <a92febe8-330a-4113-9b51-aae77d317cbe@est.tech>
Date: Tue, 16 Jun 2026 16:13:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] package: replace copydebugsources shell
 pipelines with Popen
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20260616082516.1553768-1-anders.heimer@est.tech>
 <20260616082516.1553768-2-anders.heimer@est.tech>
 <d85afa2fdb8aa0d09a8d9e0ec106c201b1630e9e.camel@pbarker.dev>
 <77f24693-adcf-44b8-bf5e-af4a8f1bdee7@runbox.com>
 <0bd08ff5a06dac60d667da9f17df183a0c971e2a.camel@linuxfoundation.org>
Content-Language: en-US
From: Anders Heimer <anders.heimer@est.tech>
In-Reply-To: <0bd08ff5a06dac60d667da9f17df183a0c971e2a.camel@linuxfoundation.org>
X-ClientProxiedBy: DU7P190CA0004.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::33) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|PAXP189MB1925:EE_
X-MS-Office365-Filtering-Correlation-Id: e65dc068-845d-42b5-92aa-08decbb173a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|8096899003|56012099006|5023799004|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	dIxQpxUdtTfIKTYyMZ9TlAqOTaT/orSfqsQuC/Fhh3rOcDSXvhV2Usev9kmjjsrc2DTMYMy++zISGuyV/RYErheMzpw2tcOgycv0G+dGd4GNNfiYoTPiYVjB3WZSTBEvwBGlz6piyD1x5dj72teZSuslbrGZRNyVUhGl+eDDNlFe8kEhzj6lJBhck8NqScXvZD0Xeol/an7NNGkOUEhRFNHXR9d/zUibKGqiW+fcSR1iFsWlezoJq6cXXDMRlKy9KN2v2+SlLlnh3WJawG2nNXD8cwAcv1xH67m8DvQpAjXQlLvpABxeNPfOJV3ACGbqzV1GD/nxnVoW3i4r2azDnsP+XD5noucVwBXh+da+bgkG+HhC7wRtZfanrNDDz3T3YSUukN9XQnig9AjI3vQL2OeWOEoFxfz39LLd5skF4hzT9Ps58nxiv67sKefuczabzssXUNR76eWlh7U8gQeL/iKyTfu9bUqzTUZdEcfkUp+w9+OQdsLwT7ZtzaiiQtm0ot5VTZc9dhFYhtnZ/cl68u6qYBhYnC7wU3hFM0f5QPTKuYoe/KodPMrSCKKwOgig9gGzWMomRHBfMmn2mFMFgzgghmDgoDZEmXf925VpOaDX0PCOy+ZPKqKYrhCL5YkgD6kBiuNBj+8maIFHK9ziXxKLLAVudRfn/2vy5jPczZQtiItPbS7qyzS9XWaoNjTQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(8096899003)(56012099006)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U29wUnFxQ2ZNRGFacDhaeFFRV0RLQzdFYWNTOEZjRHY2WHBiSnFKQlF0aXFZ?=
 =?utf-8?B?YmNsdDRhS05hWEhqYURVOFBhK0JBNjFiWXAybmdQaDRIYmVCZDJFTVN5aWl3?=
 =?utf-8?B?eERKV3RiVjNFMlZqME1GalUxamxFWUo3b0NCMWtEbW84NFRUMVllZE80eFdJ?=
 =?utf-8?B?UnlLdCtpSy9kRkJadm15bGVnMDc5MmUxQlYyZ0VWV0tWYTBuS2VPTDlTb0NV?=
 =?utf-8?B?NHNHN2tqQ3V6S0JESmgwVUVsNHVBclQrM0xtQnhqNEVPNTFrNUZCNGVvbE5w?=
 =?utf-8?B?U21jQWRMVzBPcHpCdGN1UHllSGdJRFVEWmExaVRyNU05b3NnM1RRUjBlTDY5?=
 =?utf-8?B?YVVSSk4xR0lBbVVMTXFrY2srNUY5M3Flb0t3NEJoZjlpODF0MW5rc2ZBNkZt?=
 =?utf-8?B?bnRQSlJYVEhwZnBCbE1HZllvUTBNSDRnbVVIelV6SzFkYXBuN1pzWXRydi9I?=
 =?utf-8?B?MHJ1S09KN2IrN2prYkxCbmxWY05FVHBJVko2bzM2MmwwM0xMbGIwQS9kN1Y1?=
 =?utf-8?B?UlVqQ1cxU1RPNVRUMTJDWklud0pxQUtWWW9pOEUrYy9aWEN0Z3lmS2M5aUYv?=
 =?utf-8?B?MGovY0NpcDlXUWFKREdmY0hueGhWNHVRbUUva1o5eDdwc0ZPajRjaEppRnFj?=
 =?utf-8?B?Y3kyRUdtbmI4Q3ZCZ243YW1pbS8xenNhalFvUVhRMUE1dkN0Z3FCR3BoMjBN?=
 =?utf-8?B?SStEeUZrSWJ6MVBkamhHUGdtWjl4d0JMa3FrNHNDQ0x0SWJkQjFCVFdocjJn?=
 =?utf-8?B?UXZkdFowcTFQTklJcTRYa3BLbW5HVzdSdyt4dmhuQlRIYXY1WWdJeUxoVEsr?=
 =?utf-8?B?bktZSjZtYUJkdmdyK0JuQjlLMy9ORHJHR2dEZmRiNTFFUzlMdFFwYWM0WDZM?=
 =?utf-8?B?R2Y3R1l6MERCbHdua3Y2cm9aa01ENWJEOVM1bVlHejRvTSszUGMvNFNzeHNE?=
 =?utf-8?B?aWNkVXJlVUhZRGV5dkdrUGI0U2JMYmJWUGF6WkFjR0VzRi82eldLZ0R0bkF3?=
 =?utf-8?B?M3c2VDFYWEg2WkdCTGxxdk92elZPbHE0dzZzanpHRVplM25Kak5ZT2xVbmFY?=
 =?utf-8?B?dWFpTHNyZ3FvLzY1L0RRRVRweDQ2bitkZlpoYVY4VnZ0ajRjMXVML2Jmc21J?=
 =?utf-8?B?VU0xT2hWR3dHdE9vMHpGNWVBM0QrZ2NMN2JVdlovbG42RWR2MUZmcG9TbGpH?=
 =?utf-8?B?REQyTFdIeXJtSVovOW9nRUtreXo1SDRMdHlOZ2thQW9WQkJtay9RS0hxbXZZ?=
 =?utf-8?B?M1h5UWluclVsNmNkeGtyT1ZKSW85RHI5V2hVNG85cEhUWEp4RWplVGdiTEI3?=
 =?utf-8?B?NEhJYUVkdVhXUFNvUXhuQkZqUkw2eXY2QnYrcFZtUGRLaWw2SWU1bjIrV1pX?=
 =?utf-8?B?aU9Ra2FDMk5kSytsNTBFUnUxRFNlVS93UXdUdHRUN1hUTHYwcUZUbUhYa3p4?=
 =?utf-8?B?aE9nR0JLaENvTUFaclJSNzZ0OHNjelUvZzVBTDFlZGExNUVwSXhkSnpjYlp5?=
 =?utf-8?B?NzJhVlhIT20rMFhoV1hjcGRQYThJVDB4YTJudUJ1SWphdU5FSmthdVlrMXBT?=
 =?utf-8?B?TlNFS1huOWdCVEMzRHhuMS80Q3d5elFkd0F4MUhWWWg4ZU8xN3lVT1BodFRs?=
 =?utf-8?B?WmI4SmxMbWNuajdBa25oaVhoNGpob1pJQitFWjhxdm9pUkZEUThsdGtCYkNI?=
 =?utf-8?B?V0hTUG5BQ3dtYkd2dFU1TmtVcSs3dFFkTy9PTW9nL3VDL05lQjczUjZQWVdx?=
 =?utf-8?B?N2R1TnNRUmVTNk80VitBbjZtbUQ5aUp1TDQ2ZVkwaXF0YmpkZmI3TzdPOTQv?=
 =?utf-8?B?R2hIR1ZGbGdjNysyTVJVb2tHZ3E0NjlBQ1ljdzg1NXVKMW1WWGVxazN5S1Jq?=
 =?utf-8?B?UlNMY1VWNUVFemtJdHdYOUtHWjBhdGZBL1F6eWR2UTZyWG9ReTR3QTNrMkQv?=
 =?utf-8?B?cGZid2RmNDd0UVhaZ0lMb2d4bUcwdm12VGtBWm1TY3c2b0piakxqNERrSFNo?=
 =?utf-8?B?VG1OdDMrQ3lrTHhUSWRMRWpYNEJXUHNuclNteFA3UTlyM1Z2TEVuM2NkZ1Bq?=
 =?utf-8?B?cXRvWGhaKzRqVWFEU2RPWEQ2aVBOUU1la04rZWExc1VTUFhaOWtWTTl3OG1F?=
 =?utf-8?B?Q1dvVndQY2RIN1JpRnBXRG9qaGZpWmcwWXluRFFHOFZUT3ZiTGNNRUpUU1Uw?=
 =?utf-8?B?ZEJ6NUNiTXkyWUdZcFYxbkZUVS9mQXNTeW9obnFHcE52R240elJMSTByWTkr?=
 =?utf-8?B?NnpPRjlSR01tcWxtcDZyMHJRUEd0MEdBbEZ5d2FPdTUrODBTMytDZjZJc2xi?=
 =?utf-8?B?REQxakduM2hsdEFVNlNaR2ZKVXdBck1GeFdpNE4wdFc0UTJjK3dFZz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e65dc068-845d-42b5-92aa-08decbb173a9
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 14:13:34.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQzUes2lLTbOrGeUdEOuTUl7xWsmGKD7wjz9k1zCk2Kw5VGUV5ZcD35Igq84dE3jo2CMWhcmLc120dLQoX/ENA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1925
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 14:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238903

--------------PqOdGzJYEfztAmmFp2bvRQIk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

On 6/16/26 15:44, Richard Purdie wrote:
> On Tue, 2026-06-16 at 15:35 +0200, Anders Heimer via lists.openembedded.org wrote:
>> On 6/16/26 14:12, Paul Barker wrote:
>>> On Tue, 2026-06-16 at 10:25 +0200, Anders Heimer wrote:
>>>> -        for pmap in prefixmap:
>>>> +        env = os.environ.copy()
>>>> +        env["LC_ALL"] = "C"
>>>> +
>>>> +        for pmap, prefix in prefixmap.items():
>>>> +            dstroot = dvar + prefix
>>>>                # Ignore files from the recipe sysroots (target and native)
>>>> -            cmd =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '((<internal>|<built-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
>>>> +            sort_p = subprocess.Popen(["sort", "-z", "-u", "--", sourcefile], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=env)
>>>> +            egrep_p = subprocess.Popen(["egrep", "-v", "-z", "-e", r"((<internal>|<built-in>)$|/.*recipe-sysroot.*/)"], stdin=sort_p.stdout, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=env)
>>>> +            sort_p.stdout.close()
>>>> +
>>>>                # We need to ignore files that are not actually ours
>>>>                # we do this by only paying attention to items from this package
>>>> -            cmd += "fgrep -zw '%s' | " % prefixmap[pmap]
>>>> +            fgrep_p = subprocess.Popen(["fgrep", "-zw", "-e", prefix], stdin=egrep_p.stdout, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=env)
>>>> +            egrep_p.stdout.close()
>>>> +
>>>>                # Remove prefix in the source paths
>>>> -            cmd += "sed 's#%s/##g' | " % (prefixmap[pmap])
>>>> -            cmd += "(cd '%s' ; cpio -pd0mlLu --no-preserve-owner '%s%s' 2>/dev/null)" % (pmap, dvar, prefixmap[pmap])
>>>> +            sed_p = subprocess.Popen(["sed", "s#%s/##g" % prefix], stdin=fgrep_p.stdout, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=env)
>>>> +            fgrep_p.stdout.close()
>>>> +
>>>> +            cpio_p = subprocess.Popen(["cpio", "-pd0mlLu", "--no-preserve-owner", dstroot], stdin=sed_p.stdout, cwd=pmap, stderr=subprocess.DEVNULL, env=env)
>>>> +            sed_p.stdout.close()
>>>> +
>>>> +            for proc in (cpio_p, sed_p, fgrep_p, egrep_p, sort_p):
>>>> +                proc.wait()
>>> Hi Anders, thanks for the patches!
>>>
>>> If we're reworking this code, I think we should replace the complex
>>> sed/grep/sort pipeline with Python code. We can read into a Python list
>>> and sort/filter using the Python standard library, then pass the results
>>> to cpio.
>> Thank you,  I am very happy to implement this approach instead. I
>> strongly agree with all your comments.
> There are some other things to consider here. This is a fairly
> sensitive area of code from a performance perspective. You could code
> much of this in python using shutil for example however shutil has
> traditionally been up to an order of magnitude slower. As such, this
> code was optimized to be fast, hence the use of cpio.
>
> In many cases I worry less about performance but this is one area it
> does really matter and makes a big difference to build speed overall.
> python can be fast if carefully written but if this used shutil for
> example, it likely won't be.
>
> Cheers,
>
> Richard
Good point. I will avoid replacing the copy step with shutil and keep 
cpio in the path. I can look at whether only the sort/filter part can 
move to Python while still feeding cpio.

I had not considered the performance sensitivity here, so I will run 
some benchmarking before proposing any larger change.

Best regards,
Anders


--------------PqOdGzJYEfztAmmFp2bvRQIk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Richard,</p>
    <div class="moz-cite-prefix">On 6/16/26 15:44, Richard Purdie wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:0bd08ff5a06dac60d667da9f17df183a0c971e2a.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">On Tue, 2026-06-16 at 15:35 +0200, Anders Heimer via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 6/16/26 14:12, Paul Barker wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Tue, 2026-06-16 at 10:25 +0200, Anders Heimer wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for pmap in prefixmap:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; env = os.environ.copy()
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; env[&quot;LC_ALL&quot;] = &quot;C&quot;
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for pmap, prefix in prefixmap.items():
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dstroot = dvar + prefix
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Ignore files from the recipe sysroots (target and native)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd =&nbsp; &quot;LC_ALL=C ; sort -z -u '%s' | egrep -v -z '((&lt;internal&gt;|&lt;built-in&gt;)$|/.*recipe-sysroot.*/)' | &quot; % sourcefile
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sort_p = subprocess.Popen([&quot;sort&quot;, &quot;-z&quot;, &quot;-u&quot;, &quot;--&quot;, sourcefile], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=env)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; egrep_p = subprocess.Popen([&quot;egrep&quot;, &quot;-v&quot;, &quot;-z&quot;, &quot;-e&quot;, r&quot;((&lt;internal&gt;|&lt;built-in&gt;)$|/.*recipe-sysroot.*/)&quot;], stdin=sort_p.stdout, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=env)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sort_p.stdout.close()
+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # We need to ignore files that are not actually ours
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # we do this by only paying attention to items from this package
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd += &quot;fgrep -zw '%s' | &quot; % prefixmap[pmap]
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fgrep_p = subprocess.Popen([&quot;fgrep&quot;, &quot;-zw&quot;, &quot;-e&quot;, prefix], stdin=egrep_p.stdout, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=env)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; egrep_p.stdout.close()
+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Remove prefix in the source paths
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd += &quot;sed 's#%s/##g' | &quot; % (prefixmap[pmap])
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd += &quot;(cd '%s' ; cpio -pd0mlLu --no-preserve-owner '%s%s' 2&gt;/dev/null)&quot; % (pmap, dvar, prefixmap[pmap])
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed_p = subprocess.Popen([&quot;sed&quot;, &quot;s#%s/##g&quot; % prefix], stdin=fgrep_p.stdout, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=env)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fgrep_p.stdout.close()
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpio_p = subprocess.Popen([&quot;cpio&quot;, &quot;-pd0mlLu&quot;, &quot;--no-preserve-owner&quot;, dstroot], stdin=sed_p.stdout, cwd=pmap, stderr=subprocess.DEVNULL, env=env)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed_p.stdout.close()
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for proc in (cpio_p, sed_p, fgrep_p, egrep_p, sort_p):
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; proc.wait()
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Hi Anders, thanks for the patches!

If we're reworking this code, I think we should replace the complex
sed/grep/sort pipeline with Python code. We can read into a Python list
and sort/filter using the Python standard library, then pass the results
to cpio.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Thank you,&nbsp; I am very happy to implement this approach instead. I 
strongly agree with all your comments.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
There are some other things to consider here. This is a fairly
sensitive area of code from a performance perspective. You could code
much of this in python using shutil for example however shutil has
traditionally been up to an order of magnitude slower. As such, this
code was optimized to be fast, hence the use of cpio.

In many cases I worry less about performance but this is one area it
does really matter and makes a big difference to build speed overall.
python can be fast if carefully written but if this used shutil for
example, it likely won't be.

Cheers,

Richard
</pre>
    </blockquote>
    <span style="font-family:monospace"><span style="color:#000000;background-color:#ffffff;">Good point. I
        will avoid replacing the copy step with shutil and keep cpio in
        the path. I can look at whether only the sort/filter part&nbsp;</span>can
      move to Python while still feeding cpio.<span style="color:#000000;background-color:#ffffff;">
      </span><br>
      <br>
      <span style="color:#000000;background-color:#ffffff;">I had not
        considered the performance sensitivity here, so I will run some
        benchmarking before proposing any larger change.</span><br>
    </span><br>
    <span style="font-family:monospace"><span style="color:#000000;background-color:#ffffff;">Best regards,</span><span style="color:#000000;background-color:#ffffff;">
      </span><br>
      <span style="color:#000000;background-color:#ffffff;">Anders</span><br>
      <span style="color:#000000;background-color:#ffffff;"></span><br>
      <br>
    </span>
  </body>
</html>

--------------PqOdGzJYEfztAmmFp2bvRQIk--

