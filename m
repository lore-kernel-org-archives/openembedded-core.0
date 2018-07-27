Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F01078CA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 03:19:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6R3JeVf017340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Jul 2018 20:19:40 -0700 (PDT)
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 26 Jul 2018 20:19:39 -0700
To: <richard.purdie@linuxfoundation.org>, ChenQi <Qi.Chen@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
	<a8f34da6-a6e8-4419-1258-87262cf6b772@windriver.com>
	<bc64ac66-d4cb-acb3-5e8e-9bf15ce86317@windriver.com>
	<1e41274ab544bfa905bf98a75d6729c492bec19b.camel@linuxfoundation.org>
	<edd66fb0-d295-dbbf-97ca-5a11ac509ded@windriver.com>
	<1b2cb46a-2bea-eed0-c9df-254ffb3c1f99@windriver.com>
	<56d1a5ca98936388dccf918519b87558ea1b6228.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <118ef53a-0cb5-5dd6-113b-2bda36db56f2@windriver.com>
Date: Fri, 27 Jul 2018 11:18:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <56d1a5ca98936388dccf918519b87558ea1b6228.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/6] oeqa: Add selftest parallelisation support
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
X-List-Received-Date: Fri, 27 Jul 2018 03:19:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 07/26/2018 07:11 PM, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2018-07-26 at 17:37 +0800, ChenQi wrote:
>> On 07/26/2018 05:18 PM, Robert Yang wrote:
>>>
>>>
>>> On 07/26/2018 05:10 PM, richard.purdie@linuxfoundation.org wrote:
>>>> On Thu, 2018-07-26 at 14:00 +0800, Robert Yang wrote:
>>>>>
>>>>> On 07/26/2018 11:03 AM, Robert Yang wrote:
>>>>>> Hi RP,
>>>>>>
>>>>>> On 07/17/2018 12:33 AM, Richard Purdie wrote:
>>>>>>> This allows oe-selftest to take a -j option which specifies
>>>>>>> how
>>>>>>> much test
>>>>>>> parallelisation to use. Currently this is "module" based
>>>>>>> with
>>>>>>> each module
>>>>>>> being split and run in a separate build directory. Further
>>>>>>> splitting could
>>>>>>> be done but this seems a good compromise between test setup
>>>>>>> and
>>>>>>> parallelism.
>>>>>>>
>>>>>>> You need python-testtools and python-subunit installed to
>>>>>>> use
>>>>>>> this but only
>>>>>>> when the -j option is specified.
>>>>>>
>>>>>> Should we add python-testtools-native and python-subunit-
>>>>>> native,
>>>>>> please ?
>>>>>>
>>>>>> And add them to TESTIMAGEDEPENDS ?
>>>>>
>>>>> After talked with Qi, this won't work since we use host's
>>>>> python3. So
>>>>> we need install them on host, or use buildtools-tarball.
>>>>
>>>> Correct, this is why the modules are only loaded if you use the
>>>> -j
>>>> option, so the dependency is only needed if you use bitbake -j.
>>>> That at
>>>>    least minimises the cross-section of users affected.
>>>
>>> There might be a bug since we don't use -j in our build farm, but
>>> I
>>> see the no
>>> testtools module error, I will do more investigations on it.
>>>
>>
>> In testsdk.bbclass, we have:
>> processes = d.getVar("TESTIMAGE_NUMBER_THREADS") or
>> d.getVar("BB_NUMBER_THREADS")
>> ....
>>           if processes:
>>               result = tc.runTests(processes=int(processes))
>>           else:
>>               result = tc.runTests()
>>
>> processes will not be None even if we don't set
>> TESTIMAGE_NUMBER_THREADS. I think this is not expected.
> 
> Ah, yes, that was not intentional. We should perhaps put a:
> 
> try:
>      import testools, subunit
> except ImportError:
>      xxx
> 
> in there...

I've sent a patch for it:

testsdk.bbclass: check python module testools and subunit

// Robert

> 
> Cheers,
> 
> Richard
> 
> 
> 

