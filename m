Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
 by mx.groups.io with SMTP id smtpd.web11.7028.1612346116593953443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 01:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=T221Hf+9;
 spf=pass (domain: pr.hu, ip: 87.242.0.7, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1l7EsS-0002gl-VK; Wed, 03 Feb 2021 10:55:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4IHKlc7Kgep2FsnC5RyJR0HBCfCn2vc9KOiBnxApJjY=; b=T221Hf+92ZSjsXxjKsFAMNoOxl
	M99oyJvWnjRYMw+BSHNIU7oV790aDHV47plRQJVIRZ+ZD482yN8+oswHJZQ1WQZuje1xPlMKD7J0D
	UCO3yGLIYFLbyyjHjskn7Re83HGxqAKgJhWAxkZmdslRE+0suNe8gbXXGun/xL9h7pFLRrd/0kJkk
	bW7iUi58QvTBFF9keLEIx+p4fJj7JGnlBdJkqXgWXPuiR2ZltJvOITF27W3dPrgrrKg7rT3uXX1ME
	HcgxF82kZKmS3bmDpLyVJNay9384SkF+/G5x8IRRoLHtt5p2Oe4GrgFN9H2D3s7c9sjs8GD8prrHu
	JjnV6/og==;
Received: from [87.242.23.58] (helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1l7EsO-0000Dz-Im; Wed, 03 Feb 2021 10:55:10 +0100
Subject: Re: [OE-core] [PATCH 0/2] Fix issue with npm shrinkwrap fetcher
To: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Jean-Marie Lemetayer <jeanmarie.lemetayer@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 sandra.tobajas@savoirfairelinux.com
References: <20210114071235.2210763-1-kamel.bouhara@bootlin.com>
 <CAAdc0hwtbSPoTmBoG60e-5UL+BBTEkmoQi8r+BdzOu5Eek_Pmw@mail.gmail.com>
 <YABmBpmfl8WIK/Jf@kb-xps>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <390151a7-070e-4d1f-2ffe-4051e04e1ab1@pr.hu>
Date: Wed, 3 Feb 2021 10:55:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YABmBpmfl8WIK/Jf@kb-xps>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 87.242.23.58 (deferred)
X-Spam-Score: -1.0 (-)
X-Scan-Signature: eb9db077cc4a4b750a7870bc5b8b6cca
X-Spam-Tracer: backend.mail.pr.hu -1.0 20210203095510Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2021. 01. 14. 16:40 keltezéssel, Kamel Bouhara írta:
> On Thu, Jan 14, 2021 at 03:25:50PM +0100, Jean-Marie Lemetayer wrote:
>> Hi Kamel,
>>
> 
> Hi Jean-Marie,
> 
>> Thanks for your work. I should have fixed this a long time ago but I
>> didn't have the time :(
>>
> 
> Well its never too late !
> 
>> There is actually an open bug for this issue:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13901
>> I think you can add the reference to your commit messages. And close
>> it if merged.

Please backport this series to Gatesgarth as soon
as possible because it's a problem there, too.
The series applies cleanly.

It fixes some of the issues I see with
https://www.npmjs.com/package/nanomsg which
still fails for a different reason.

Thanks in advance,
Zoltán

>>
> 
> OK, let's see if there are other comments then I shall resent with
> proper commit messages.
> 
>> Please add some tests to ensure that:
>>   1. devtool / recipetool do not create empty shrinkwrap file
>>   2. the npmsw fetcher allows empty shrinkwrap file
>>   3. the npm class allows empty shrinkwrap
> 
> Actually the fix is only to check wether or not the dependencies are
> listed and if not we make sure the npm fetcher will not look for them.
> 
> So the empty shrinkwrap file is still created and allowed.
> 
> I've already done some test in both case with and w/o dependencies.
> 
>>
>> See:
>> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=22dd46cc34629d0750177fddff2e1c178c854340
>> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=44b2ab8d5eb4fd1fc9a157fce37aaa7b7a7065e5
>> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=f6728edb7e022b27223d28bd80ce40c2f2374a13
>>
>> Also Sandra has already worked on it, but it didn't get merged. I
>> don't know why.
>>
>> See:
>> https://lists.openembedded.org/g/bitbake-devel/topic/76459311#11643
>> https://lists.openembedded.org/g/bitbake-devel/message/11648
>>
> 
> I see, yet I went a bit further ensuring the npm recipes will not call
> the npmsw fetcher when no dependencies are given.
> 
> Thanks for you comments.
> 
> Cheers,
> Kamel
> 
>> BR
>> Jean-Marie
>>
>> On Thu, Jan 14, 2021 at 8:13 AM Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:
>>>
>>> Hello all,
>>>
>>> This small patch series aims to fix the following build issue faced
>>> with some npm packages:
>>>
>>> DEBUG: Executing python function do_fetch
>>> DEBUG: Executing python function base_do_fetch
>>> DEBUG: Python function base_do_fetch finished
>>> DEBUG: Python function do_fetch finished
>>> ERROR: Failure expanding variable TUNE_FEATURES_tune-armv7at-neon, expression was ${TUNE_FEATURES_tune-armv7at} neon which triggered exception RecursionError: maximum recursion depth exceeded while calling a Python object
>>>
>>> After struggling a lot, I figured out that this only happen for npm
>>> packages not having dependencies listed in their shrinkwrap file (e.g. bcryptjs).
>>>
>>> Yet I still didn't got how is the json parsing impacting
>>> the python context here ?
>>>
>>> Please feel free to comment.
>>>
>>> Thanks.
>>>
>>> Kamel Bouhara (2):
>>>    npm.bbclass: make shrinkwrap file optional
>>>    recipetool: create: only add npmsw url if required
>>>
>>>   meta/classes/npm.bbclass             | 31 +++++++++++++++++++++----------
>>>   scripts/lib/recipetool/create_npm.py |  6 +++++-
>>>   2 files changed, 26 insertions(+), 11 deletions(-)
>>>
>>> --
>>> 2.11.0
>>>
>>>
>>>
>>>
> 
> --
> Kamel Bouhara, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
> 
> 
> 
> 
> 

