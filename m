Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B56FF60721
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 14:09:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w79E7LeW012789
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Aug 2018 07:08:03 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 9 Aug 2018 07:07:48 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Anuj Mittal
	<anuj.mittal@intel.com>, <openembedded-core@lists.openembedded.org>, Paul
	Eggleton <paul.eggleton@linux.intel.com>
References: <20180728085316.13484-1-anuj.mittal@intel.com>
	<9d148729-8b92-e208-ae5d-3432d693affb@windriver.com>
	<ffa3b6563d20aaea5bf4072af343ef0627106e94.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <a86bdf08-3287-da09-984c-1d6c852487d1@windriver.com>
Date: Thu, 9 Aug 2018 10:07:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ffa3b6563d20aaea5bf4072af343ef0627106e94.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] oeqa/selftest: check if rm_work is enabled
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
X-List-Received-Date: Thu, 09 Aug 2018 14:09:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/09/2018 04:54 AM, Richard Purdie wrote:
> On Wed, 2018-08-08 at 13:27 -0400, Randy MacLeod wrote:
>> On 07/28/2018 04:53 AM, Anuj Mittal wrote:
>>> rm_work if enabled leads to some tests failing that rely on
>>> artifacts being present. Check if rm_work.bbclass is included and
>>> show an error and exit if it is.
>>>
>>> Fixes [YOCTO #12694]
>>>
>>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>> ---
>>>    meta/lib/oeqa/selftest/context.py | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta/lib/oeqa/selftest/context.py
>>> b/meta/lib/oeqa/selftest/context.py
>>> index 16812ba96e..3a70f9e77b 100644
>>> --- a/meta/lib/oeqa/selftest/context.py
>>> +++ b/meta/lib/oeqa/selftest/context.py
>>> @@ -187,6 +187,10 @@ class
>>> OESelftestTestContextExecutor(OETestContextExecutor):
>>>                self.tc.logger.error("You have buildhistory enabled
>>> already and this isn't recommended for selftest, please disable it
>>> first.")
>>>                raise OEQAPreRun
>>>    
>>> +        if "rm_work.bbclass" in self.tc.td["BBINCLUDED"]:
>>> +            self.tc.logger.error("You have rm_work enabled which
>>> isn't recommended while running oe-selftest. Please disable it
>>> before continuing.")
>>> +            raise OEQAPreRun
>>> +
>>>            if "PRSERV_HOST" in self.tc.td:
>>>                self.tc.logger.error("Please unset PRSERV_HOST in
>>> order to run oe-selftest")
>>>                raise OEQAPreRun
>>>
>>
>> Enabling rm_work should NOT be an error, and eventually it should not
>> trigger any warnings. OEQA should only test the results of a build
>> not how the build was done.

Uh, oh. I had written this email but then realized that
the parts of oeqa that require that rm_work be disabled
are testing the internals of the build so I swear I didn't
send the email! :)


> 
> I'm torn on this. My thoughts:
> 
> I'd really like the results of oe-selftest to be consistent and
> deterministic. If we expect it to work with and without rm_work we
> really start having to test both, otherwise you can comparatively
> easily find odd failures with one and not the other. I've accidentally
> left it enabled, then puzzled over odd test results for an age on too
> many occasions :(.
> 
> I'm still of the view that rm_work is a horrible hack. Its one I've
> bent over backwards to try and keep working over the years[1] since a
> lot of people use it, that doesn't mean its any less of a hack though
> as when you understand what it does and how it does it, it really is
> horrible.
> ([1]I made 26 out of 47 changes to the class in the past 12 years)

Good to know. It is still useful so I guess it'll stay around until
storage is just incredibly cheap. Aren't we there yet:
    https://jcmit.net/flash2015.htm
If rm_work is such a hack, maybe we should schedule it to be removed.

> 
> If you step back and think about it, the use of rm_work precludes tests
> from poking into WORKDIR or at the very least makes them have to care
> about a lot of very specific task ordering of tasks which may or may
> not be present. It doesn't seem unreasonable for selftests to actually
> look in WORKDIR to ensure builds are doing the correct things.

I agree!

> 
>> I reviewed some of the rm_work related defects:
>>
>> 1. https://bugzilla.yoctoproject.org/show_bug.cgi?id=12647
>>     The warning was intentional based on Paul's comment.
> 
> There were two issues, one rm_work, the other warning piece isn't an
> issue.
> 
>> 2. https://bugzilla.yoctoproject.org/show_bug.cgi?id=12655
>>     The logs seem to only say that the error goes away when
>>     rm_work is NOT enabled. I'd prefer to understand what it is
>>     that's causing the failure and perhaps add to the packages
>>     recipe so that the output passes the OEQA tests.
> 
> The issue is that the test looks for an intermediate file in
> WORKDIR/sysroot-destdir. rm_work removes it before the test can find
> it.
> 
>> 3. https://bugzilla.yoctoproject.org/show_bug.cgi?id=12694
>>     Title was: oe-selftest should warn if rm_work is enabled
>>     but the commit makes it an error.
>>
>> Any disagreement about making it be a warning?
>>
>> rm_work saves lots of storage space so I'm reluctant to make
>> OEQA require that it is NOT used.
> 
> We're not requiring OEQA not use it globally, we're requiring oe-
> selftest not enable it. The other OEQA components (image, SDK, eSDK
> tests) all are unaffected.

Yeah, once I realized that yesterday, I decided not to send
my email (which managed to escape somehow anyway).
> 
> As things stand today several tests break with it. I've no doubt we
> could 'fix' them in some way to avoid the problems but do we require
> any new test author to test with and without rm_work? Do we start
> requiring the autobuilder test both combinations?
> 
> When the user runs oe-selftest, I really want them to get the same
> results as our autobuilder so we're consistent everywhere. We've had
> numerous problems in that regard, e.g. buildhistory enabled/not enabled
> and I think its reasonable for the code to check for things which are
> known to introduce inconsistency? We have made a lot of progress in
> being much more consistent.

I see. That makes sense.

We'll continue with some builds using rm_work and the ones that run
oeqa omitting that feature.

Thanks for the background Richard.

../Randy

> 
> Cheers,
> 
> Richard
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux

