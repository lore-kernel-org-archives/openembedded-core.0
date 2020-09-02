Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.62])
 by mx.groups.io with SMTP id smtpd.web10.12714.1599014222929044117
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 19:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XnRMDH00;
 spf=pass (domain: windriver.com, ip: 40.107.220.62, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDeHv4FltcWdz7tZpQlNyC+HsEMgtUz8+woNSMvAzEvod5l3l75OnlH2msVr3rFnDs7gObbbZqeu/pZsN8hXScUIPIhTmz25ZisoDGSiEdCk2Eujz6w7RBF1mtFFX46NyjFoCWlxLtGwnREMIQLxpkZ3h8KgUTum3xfOgfRdk5jyhpnXHn8HVLp2R6srAXXZ2w80Hi8EfeoEnRiAlPjNYZMLsDrYGKjKjqMs0ZYUo8lNhqo44mGSg2FzzB2GbKRUxsamnPdIHKYO5JVGgcJ9HbtFcGv89T/eEorPcTY+yG81q6JmA5L39G8KTmDZ71/E1aVUog88+c7+XFqRh7SdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmy24Hv9Mm0AV6eBkTxUA5Sf6EnY4B0sOol4sp31B+0=;
 b=lGWBiSrjffZ/U7B79feB0aiWzIpuTi8Rvgw4nyi1GdR3sn6GneyQce6PXmBDCW9nDvq5lsNSO8ItDlYFv4PrQWpbBoXsmFg+ZlyM2THkuUjCNVoQz1IlzXnGpKw+vFttbmOPZhobKBMu/5fTnfMBQIhH/Sl+Vx04myfaxEZB+YnObsbOrG94ijYAmyBSCLWugG6uvnlODKiphv2a9Xn55MDPK4lOjTEdVOPdL5YjKeeXPMvr1OcRYCp00HlzvfczRp5XKGXeih/jPFZYviqdXVtmuvpqZw9Sxinsm5KZsto3HyrWNdsaigz/IZqCLyoSsl+jlWQwayc6EkwQdAROQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmy24Hv9Mm0AV6eBkTxUA5Sf6EnY4B0sOol4sp31B+0=;
 b=XnRMDH00yQZNdcs3l1PoaySCckwAxPhOEo0ZOz+RUz2KQnnj6MRqasIqZS1BGMIX3YqNk1vL+6W+ChVnIDRXkIuLcMLLCYNm3gHnVw+nW6e6YDHFK1y/4Td0sW+st9fJuuzglBbfvqPY+O0zubK3PRXjMCNVsVsV/Ns/MyW5ZS0=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3502.namprd11.prod.outlook.com (2603:10b6:805:da::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 2 Sep
 2020 02:37:00 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2d48:250:daff:8270]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2d48:250:daff:8270%5]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 02:36:59 +0000
Subject: Re: [OE-core] [PATCH] libpcre: fix occasionally do_package_write_rpm error
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: "MacLeod, Randy (Wind River)" <randy.macleod@windriver.com>
References: <20200828061434.2943665-1-changqing.li@windriver.com>
 <389322665bc193ed7bace452717e02dd80aa675d.camel@linuxfoundation.org>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <61b74cbe-c228-c206-9155-0e3a0d866e4f@windriver.com>
Date: Wed, 2 Sep 2020 10:36:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <389322665bc193ed7bace452717e02dd80aa675d.camel@linuxfoundation.org>
X-ClientProxiedBy: YT1PR01CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::32) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0063.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Wed, 2 Sep 2020 02:36:57 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2684cae-b5a5-494d-f03c-08d84ee9110d
X-MS-TrafficTypeDiagnostic: SN6PR11MB3502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB35021DB1ACCBB4F1312DB632822F0@SN6PR11MB3502.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DuAVdlvFdooAhLkcOcdXgyecIODWRRWuGzz7Gnt0T7ieGcZmoD8l4I6OHHD//zNjQXVm9SMfu1BNWcqrojtVfpkXUq0B2SZADdLcMJK8odOqEa6QHiYXkQ1OYSKu3dimnl4K0/S17mddlzYySn6xK2jNoLqXcVPA0lGw4YjZRx4OQ4aUa3EE9XW+H9ORd6ZRqOnENZZrl06Wfy/c8P6JK4hY3pjXBu++9d0+ZDAPd73QSGKYWkoAuceGYJ1nLpGbJAII1+C0R6RdvO7AVuPme7ZtgvLwg2HJGWEvS6dZzx/F3PT+lz6R8CYD4TCDHim8dhGg23opij7A+n3HZmxKSIIBNwuKC1JBchrtWA8jnNHJhcsWQM1smugMiGNn4Wv4YHTk/plkjUygia32otbT5eBArVW0btspiFReyv+R+b2q4RKDJbhHZcY+5i0y452VEal8v2VjL0C1fBd4WjtVUw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39850400004)(346002)(186003)(6486002)(86362001)(966005)(36756003)(31696002)(4326008)(66946007)(16576012)(53546011)(33964004)(478600001)(107886003)(26005)(316002)(956004)(6666004)(5660300002)(2906002)(52116002)(44832011)(66476007)(66556008)(31686004)(8676002)(2616005)(166002)(83380400001)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	fkH9l++q1K1Q4kF4LFRSX+7OE/9ULCV9woWz9Vrxl2U0QAELmRJYxzm2AALP0ySV1QmxKrM9e7/zA47U3PwdQfU+HQhOPS+2lRRgS4lOlUiTfClq6L3ucxCOdR+rLU2w6xkQq7RD5CXAw2eko03gUOG+hZZdwwiYVjfxt3tc+sp9lP8GPGwneThravXYXftqOQ3IuRzSBtmLE7yQsHveFENiX+vyellEkikYmyX3wtMHHqiCOnLY5sFmvoadjyTtSPer8GgRf/BSvPnDgd/C11WHKEvnMEBMUDRI1YlSJncteY11/YN0hmOPALMe3Zk0obqumS02jPU2Oe8yrDO3lEzmnZS+tH1AQkSIbVs5enPP3FegZTyTGjgIlVyp7C5Lq4/6fmKh+7BsgldUzAqt7wemBq2WDPuq40BSoR2VyntNZF9v3ys9jFhJOUIsRvN3h5uLHQXsH/UAMKWHutyQzWpYm7r4a1ejq6AYuiPcmrQCVNh/8njjhxUAzMzqX4zndqDRJLMp8gLcOrGQSF22anK57zSEYUUzD2SeX6UtRLirLDITWPAfsalB3ejfNEq9DLBx35zNi9/a+e4796zltKtu+dncKv+Dn0xQLmNLuFz4iIdhh5kfb7GZLkPbQdNrYMnEZEH3IgQ7QhHcHAuP6g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2684cae-b5a5-494d-f03c-08d84ee9110d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 02:36:59.7955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TU2HbPh3LjK8a+rfMWBrmQZVYMTERGCFpWexF7HD6sH5iepxa0EW6IJEE+tzLl32RsPpPMUnvuzN4fFJljVHoiwLzzwUAoK4ZsvmHLZLeHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3502
Content-Type: multipart/alternative;
 boundary="------------1B8D6E86A386413862909CD0"
Content-Language: en-US

--------------1B8D6E86A386413862909CD0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/1/20 7:08 PM, Richard Purdie wrote:
> On Fri, 2020-08-28 at 14:14 +0800, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Error info:
>> ERROR: libpcre-8.44-r0 do_package_write_rpm: Failure expanding
>> variable
>> SUMMARY_libpcrecpp, expression was ${SUMMARY} - C++ wrapper functions
>> which triggered exception RecursionError: maximum recursion depth
>> exceeded while calling a Python object
>>
>> this error is hard to reproduce, only met one time. Seems expand
>> SUMMARY with reference to SUMMARY cause a dead loop.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> What is worrying me is why we can't reproduce this. It should fail or
> not fail, why do we only sometimes see this?
>
> I'd like to understand the cause as it sounds like a determinism
> problem somewhere.
>
> Is there a sequence we can reproduce it with?

Unfortunately no, we also hard to reproduce this, only met one time on 
08 Jul when build a wrlinux image.

And don't see it for about 2 months.

>
> Cheers,
>
> Richard
>
>
> 

--------------1B8D6E86A386413862909CD0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/1/20 7:08 PM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:389322665bc193ed7bace452717e02dd80aa675d.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Fri, 2020-08-28 at 14:14 +0800, Changqing Li wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Error info:
ERROR: libpcre-8.44-r0 do_package_write_rpm: Failure expanding
variable
SUMMARY_libpcrecpp, expression was ${SUMMARY} - C++ wrapper functions
which triggered exception RecursionError: maximum recursion depth
exceeded while calling a Python object

this error is hard to reproduce, only met one time. Seems expand
SUMMARY with reference to SUMMARY cause a dead loop.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What is worrying me is why we can't reproduce this. It should fail or
not fail, why do we only sometimes see this?

I'd like to understand the cause as it sounds like a determinism
problem somewhere.

Is there a sequence we can reproduce it with?</pre>
    </blockquote>
    <p>Unfortunately no, we also hard to reproduce this, only met one
      time on 08 Jul when build a wrlinux image.</p>
    <p>And don't see it for about 2 months.<br>
    </p>
    <p><span style="color: rgb(23, 43, 77); font-family: -apple-system,
        BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen,
        Ubuntu, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;,
        &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"></span></p>
    <blockquote type="cite" cite="mid:389322665bc193ed7bace452717e02dd80aa675d.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:389322665bc193ed7bace452717e02dd80aa675d.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1B8D6E86A386413862909CD0--
