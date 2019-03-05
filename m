Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 385EA7C377
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 08:49:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x258mdXC004835
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Mar 2019 00:49:16 -0800
Received: from [128.224.163.177] (128.224.163.177) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 5 Mar 2019 00:48:47 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20190204181314.22496-1-raj.khem@gmail.com>
	<e0f4b1c8-54f9-63c9-b08b-147243ebe1ce@windriver.com>
	<12b1452d894058e0a03398ae65b0f52deaeb9182.camel@linuxfoundation.org>
	<31ec3ae0-3d38-7725-54ab-f5c3fda864b5@windriver.com>
	<7aff7260ddd7791dde2cd381de46eaf02e937174.camel@linuxfoundation.org>
	<d20e93cc-f628-97d9-d414-ffe91d6d6c53@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5ea5cc26-0b5a-799c-6e32-652328c52dda@windriver.com>
Date: Tue, 5 Mar 2019 16:54:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <d20e93cc-f628-97d9-d414-ffe91d6d6c53@windriver.com>
Subject: Re: [PATCH] send-error-report: Use https instead of http protocol
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2019 08:49:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi RP,

I've sent a patch to fix for python3:

https://lists.yoctoproject.org/pipermail/yocto/2019-March/044387.html

And CC-ed michael.g.wood@intel.com, I assumed that he is the maintainer,
but seems that the email is not valid any more.

I think that we have more work to do with error report web, e.g.:
- The 'Similar' tag on the web isn't correct, it doesn't calculate correctly

- Sometimes, there is an error like:
   File "/buildarea/lyang1/error-report-web/Post/parser.py", line 101, in parse
     num_similar_errors = f.get_similar_fails_count()
UnboundLocalError: local variable 'f' referenced before assignment

- We can make report-error.bbclass to catch more errors such as NoProvider
   errors, Parse errors, and so on.

I'd like to maintain it if it has no maintainers.

// Robert

On 3/4/19 6:33 PM, Robert Yang wrote:
> 
> 
> On 3/4/19 6:26 PM, Richard Purdie wrote:
>> On Mon, 2019-03-04 at 18:02 +0800, Robert Yang wrote:
>>> Hi RP,
>>>
>>> On 3/4/19 5:23 PM, Richard Purdie wrote:
>>>> On Mon, 2019-03-04 at 15:50 +0800, Robert Yang wrote:
>>>>> Hi Khem,
>>>>>
>>>>> We have an internal error web server, this patch breaks it:
>>>>>
>>>>> You're accessing the development server over HTTPS, but it only
>>>>> supports HTTP
>>>>>
>>>>> So I tried to use runsslserver, but it doesn't work either since
>>>>> the
>>>>> host is
>>>>> Ubuntu 14.04 (python 2.7.6):
>>>>>
>>>>> $ python manage.py runsslserver
>>>>>
>>>>> [snip]
>>>>>        ssl_version=ssl.PROTOCOL_TLSv1_2,
>>>>> AttributeError: 'module' object has no attribute
>>>>> 'PROTOCOL_TLSv1_2'
>>>>>
>>>>> This is because python is old.
>>>>>
>>>>> I think that make it default to https would make the server
>>>>> harder to
>>>>> set up,
>>>>> so is it possible to:
>>>>>
>>>>> * Make it default to http, and add an option such as --https (or
>>>>> -- 
>>>>> ssl) for https
>>>>>
>>>>> Or:
>>>>>
>>>>> * Add an option such as --no-ssl to make it use http.
>>>>>
>>>>> I prefer the first one since https server is harder to setup than
>>>>> http in django. I can work on it if no objections.
>>>>
>>>> At this point the project does require python3 so python2 being old
>>>> shouldn't be a reason to be changing this.
>>>
>>> The python3 + error-report-web doesn't work for me:
>>>
>>> $ python3 manage.py runserver ip:8000
>>>
>>> And when I tried to access http://128.224.156.132:8000, it raised
>>> errors:
>>>
>>> error-report-web/Post/views.py", line 16, in <module>
>>>       from parser import Parser
>>> ImportError: cannot import name 'Parser'
>>>
>>> So I use python 2 for it. I thought that it didn't support python3,
>>> or didn't
>>> test well.
>>
>> Fixing it to work with python3 would be the preferred option...
> 
> Sounds good, I will work on it.
> 
> // Robert
> 
>>
>> Cheers,
>>
>> Richard
>>
>>

