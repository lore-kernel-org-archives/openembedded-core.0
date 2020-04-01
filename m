Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.1389.1585761645969023230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 10:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 031HKe2I014144
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 1 Apr 2020 12:20:41 -0500
Subject: Re: [OE-core] [PATCH 2/5] archiver.bbclass: Make do_deploy_archives a recursive dependency
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: Paul Barker <pbarker@konsulko.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20200309142139.15741-1-pbarker@konsulko.com>
 <20200309142139.15741-3-pbarker@konsulko.com>
 <a6f3718866f85a6208023b253bec26bf6b5d4172.camel@linuxfoundation.org>
 <20200311114028.31344b22@ub1910>
 <1601B99892621331.16702@lists.openembedded.org>
Message-ID: <474ff39d-30bd-cfbd-a144-6ee12aa1ecad@kernel.crashing.org>
Date: Wed, 1 Apr 2020 12:20:38 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1601B99892621331.16702@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/1/20 9:49 AM, Mark Hatle wrote:
> (I know this is an old thread, but I ran into this as well..)
> 
> ...
> 
> On 3/11/20 6:40 AM, Paul Barker wrote:
>> On Tue, 10 Mar 2020 23:18:33 +0000
>> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>>> On Mon, 2020-03-09 at 14:21 +0000, Paul Barker wrote:
>>>> To ensure that archives are captured for all dependencies of a typical
>>>> bitbake build we add do_deploy_archives to the list of recursive
>>>> dependencies of do_build. Without this, archives may be missed for
>>>> recipes such as gcc-source which do not create packages or populate a
>>>> sysroot.
>>>>
>>>> do_deploy_archives is also added to the recursive dependencies of
>>>> do_populate_sdk so that all sources required for an SDK can be captured.
>>>>
>>>> Signed-off-by: Paul Barker <pbarker@konsulko.com>
>>>> ---
>>>>  meta/classes/archiver.bbclass | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
>>>> index fef7ad4f62..c11d36d708 100644
>>>> --- a/meta/classes/archiver.bbclass
>>>> +++ b/meta/classes/archiver.bbclass
>>>> @@ -604,7 +604,9 @@ addtask do_ar_configured after do_unpack_and_patch
>>>>  addtask do_ar_mirror after do_fetch
>>>>  addtask do_dumpdata
>>>>  addtask do_ar_recipe
>>>> -addtask do_deploy_archives before do_build
>>>> +addtask do_deploy_archives
>>>> +do_build[recrdeptask] += "do_deploy_archives"
>>>> +do_populate_sdk[recrdeptask] += "do_deploy_archives"  
>>>
>>> We implemented the --runall option to bitbake to try and avoid having
>>> recrdeptask versions of most tasks. Does that not work here? It should
>>> also work for the SDK I think?
> 
> You can't use a --runall operation on a task target, such as:
> 
> bitbake core-image-minimal -c populate_sdk
> 
> I can't find any way to get all of the archiver sources for the populate_sdk
> target.  The above should resolve this, and as Paul said below it will ensure
> that populate_sdk follows the same behavior as regular image generation as well.
> 
> I'm wondering if do_populate_sdk_ext needs it as well.

I verified, adding do_populate_sdk_ext is not needed.. the do_populate_sdk
appears to capture everything in the eSDK, at least in my configuration.

--Mark

>> If the archiver is enabled, its tasks should be in the dependency tree of
>> whatever you're building so that you don't need to invoke bitbake twice to
>> produce the required artifacts. For images that's the way the archiver has
>> always worked, if it's enabled then you just need to do `bitbake image` to
>> build the image and deploy the source archives. This change just extends that
>> behaviour to cover other things we can build and ensures that we don't miss
>> sources for recipes like gcc-source.
>>
>>
>> 
