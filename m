Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EE35E7E659
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 02:30:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x632U0Ex026196
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 19:30:01 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 2 Jul 2019 19:30:00 -0700
To: Matt Madison <matt@madison.systems>
References: <20190628075701.78128-1-mingli.yu@windriver.com>
	<9b5dca23cf1d8a90466bc084236599487726f4b6.camel@linuxfoundation.org>
	<5D196A07.7040304@windriver.com>
	<CAGgRHJqeFE75tXJ7qB4gyxkZaWsLmFozY+1YoJLUPXzG9Q+fOA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5D1C1421.2070507@windriver.com>
Date: Wed, 3 Jul 2019 10:34:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAGgRHJqeFE75tXJ7qB4gyxkZaWsLmFozY+1YoJLUPXzG9Q+fOA@mail.gmail.com>
X-Originating-IP: [128.224.162.170]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-dep: disable PTEST_ENABLED
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
X-List-Received-Date: Wed, 03 Jul 2019 02:30:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年07月01日 19:59, Matt Madison wrote:
> On Sun, Jun 30, 2019 at 6:59 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>>
>>
>> On 2019年06月28日 19:02, Richard Purdie wrote:
>>> On Fri, 2019-06-28 at 00:57 -0700, mingli.yu@windriver.com wrote:
>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>
>>>> The run-ptest logic for go-dep actually runs the
>>>> /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose
>>>> source file is
>>>> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go.
>>>>
>>>> That dep_test.go starts by rebuilding the dep program
>>>> from source, then runs the tests using that copy of the
>>>> program, so it's assuming that we're still in a development
>>>> environment where we can run a full go build.
>>>>
>>>> Considering it not being designed for a cross-build setup,
>>>> so disable PTEST_ENABLED.
>>>>
>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> ---
>>>>    meta/recipes-devtools/go/go-dep_0.5.0.bb | 5 +++--
>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/go/go-dep_0.5.0.bb b/meta/recipes-
>>>> devtools/go/go-dep_0.5.0.bb
>>>> index a4d631f8ea..e9fc12fa5a 100644
>>>> --- a/meta/recipes-devtools/go/go-dep_0.5.0.bb
>>>> +++ b/meta/recipes-devtools/go/go-dep_0.5.0.bb
>>>> @@ -21,5 +21,6 @@ BBCLASSEXTEND = "native nativesdk"
>>>>
>>>>    # For compiling ptest on mips and mips64, the current go-dep version
>>>> fails with the go 1.11 toolchain.
>>>>    # error message: vet config not found
>>>> -PTEST_ENABLED_mips = "0"
>>>> -PTEST_ENABLED_mips64 = "0"
>>>> +# disable PTEST_ENABLED as the run-ptest script for go-dep actually
>>>> runs the /usr/lib64/go-
>>>> dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose source file is
>>>> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go not
>>>> being designed for a cross-build setup.
>>>> +PTEST_ENABLED = "0"
>>>> +PTEST_ENABLED = "0"
>>>
>>> Setting it twice looks wrong.
>>
>> Sorry, it should be my typo.
>>
>>>
>>> If we're disabling it, why would we inherit the ptest class at all as
>>> its not going to work anywhere?
>>>
>>> Upstream not considering cross test usecases isn't a reason to disable
>>> a test, we have many tests enabled where upstream haven't considered a
>>> cross use case, we just tend to patch as needed and start a discussion
>>> with them.
>>>
>>> It sounds like its actually a network access problem from the image
>>> you're running into anyway?
>>
>> Hi RP,
>>
>> Have discussed the ptest more with Matt in the maillist and also tried
>> to add the patch under the guide from Matt to make the
>> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go work with
>> cross-setup env. But seems it still doesn't work.
>>
>> Hi Matt,
>> What's your opinion?
>
> I was able to get the test to work in my setup, with the addition of
> that patch and manually setting GOCACHE in my environment. As Richard

Thanks Matt's information!

If so, could you help to contribute your worked patch to oe-core?

I still got all cases failed even with the patch which to make 
https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go 
correspondingly usable for cross-setup.

> mentioned, from the failures you were getting, it looked like a
> network access issue in your setup. I'm not sure why GOCACHE needs to
> be set, when 'go env' shows the correct (non-'off') default; that
> might be another issue in dep that needs to be addressed.
>
> It would be good to have at least one non-trivial ptest for a go
> package, and since OE-Core doesn't have much beyond the toolchain
> itself, go-dep, and glide, getting this to work would provide some
> much-needed coverage. Running go-dep or glide - both build tools - on
> a target seems like a fairly rare use case, though.

BTW, I noticed even go doesn't have ptest support.

>
> As for Richard's initial question, go.bbclass inherits ptest to enable
> the mapping of go's built-in test builds automatically. In hindsight,
> maybe this wasn't the best choice, and it was overly optimistic to
> think that because go supports separate compilation and execution of
> tests, that packages would generally support that by default.

How about to remove inherits ptest logic in go.bbclass and let the 
inherit ptest logic in each recipe if someone cares about go-dep ptest.

Thanks,

>
> -Matt
>
>> Thanks,
>>
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>

