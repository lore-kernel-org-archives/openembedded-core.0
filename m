Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SSW8K-0001h8-1p
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 18:22:28 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 May 2012 09:12:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="139139098"
Received: from shamshir.jf.intel.com (HELO [10.24.5.145]) ([10.24.5.145])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2012 09:12:33 -0700
Message-ID: <4FABE8F1.1060909@linux.intel.com>
Date: Thu, 10 May 2012 09:12:33 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1336608479.git.josh@linux.intel.com>
	<CABcZANkTB3_QkBcMycY9Z+pZndz7JmOUAksvsQSSiwhHE7vZnQ@mail.gmail.com>
	<4FAB145D.4080001@linux.intel.com>
	<CABcZANkk1HSS1SeJK-qpALZukc4L8sDKozf-A08NRTDOw+dGKg@mail.gmail.com>
	<4FAB28B5.106@linux.intel.com> <4FAB31B6.1090307@linux.intel.com>
	<4FAB32A2.1020508@linux.intel.com>
	<CAMKF1sq1HM6Khi-G+OGrPFzuiXXuBkjvzWE6q3+DPf828mMHGg@mail.gmail.com>
In-Reply-To: <CAMKF1sq1HM6Khi-G+OGrPFzuiXXuBkjvzWE6q3+DPf828mMHGg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Shared state for all !
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 16:22:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/12 22:16, Khem Raj wrote:
> On Wed, May 9, 2012 at 8:14 PM, Joshua Lock<josh@linux.intel.com>  wrote:
>> On 09/05/12 20:10, Joshua Lock wrote:
>>>
>>> On 09/05/12 19:32, Joshua Lock wrote:
>>>>
>>>> On 09/05/12 19:15, Chris Larson wrote:
>>>>>
>>>>> On Wed, May 9, 2012 at 6:05 PM, Joshua Lock<josh@linux.intel.com>  wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 09/05/12 17:50, Chris Larson wrote:
>>>>>>>
>>>>>>>
>>>>>>> On Wed, May 9, 2012 at 5:22 PM, Joshua Lock<josh@linux.intel.com>
>>>>>>> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> In Yocto #2041[2] Mark reported an issue with reusing shared state
>>>>>>>> as a
>>>>>>>> different user on the same machine.
>>>>>>>>
>>>>>>>> Since the whole purpose of shared state is that it be shared I
>>>>>>>> decided to
>>>>>>>> dig
>>>>>>>> into this issue. I wanted to at least be able to use the shared-state
>>>>>>>> cache of
>>>>>>>> a different user without error, even if all of the objects aren't
>>>>>>>> actually used
>>>>>>>> (i.e. native, at least on the Edison branch I did most of the testing
>>>>>>>> with).
>>>>>>>>
>>>>>>>> This is an RFC mainly because it changes the permissions of created
>>>>>>>> directories,
>>>>>>>> sstate files and siginfo files from what they have traditionally
>>>>>>>> been.
>>>>>>>>
>>>>>>>> There is more of the rhyme an reason in the patch commit headers and
>>>>>>>> comments
>>>>>>>> but tl;dr bb.mkdirhier directories will be 0777 (rwxrwxrwx) with this
>>>>>>>> patch, as
>>>>>>>> will all of the contents of sstate-cache (siginfo and tgz) files.
>>>>>>>>
>>>>>>>> This is actually what one would expect from reading the Python API
>>>>>>>> docs
>>>>>>>> for
>>>>>>>> os.makedirs "The default mode is 0777 (octal)."[1] but not what
>>>>>>>> actually
>>>>>>>> happens
>>>>>>>> on most modern Linux systems thanks to umask.
>>>>>>>>
>>>>>>>> Please review the following changes for suitability for inclusion.
>>>>>>>> If you
>>>>>>>> have
>>>>>>>> any objections or suggestions for improvement, please respond to the
>>>>>>>> patches. If
>>>>>>>> you agree with the changes, please provide your Acked-by.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> 777 seems questionable to me, personally. Generally collaboration
>>>>>>> happens amongst folks within a group, and chmod g+s makes that easier.
>>>>>>> I'd expect 775 to be a more sane value, myself.
>>>>>>
>>>>>>
>>>>>>
>>>>>> Do you mean for bb.mkdirhier calls, the tgz files, the siginfo files or
>>>>>> everything?
>>>>>>
>>>>>> I went with 777 for mkdirhier as that's the default of os.makedirs
>>>>>> before
>>>>>> umask is involved. I would likely have picked rw-rw-r-- (664) if I
>>>>>> weren't
>>>>>> trying to request comments.
>>>>>
>>>>>
>>>>> Gotcha.
>>>>>
>>>>> I'm concerned about the behavior change and potential implications of
>>>>> changing the default behavior of mkdirhier. I'm inclined to say that
>>>>> when you don't pass mode, let it use the current behavior of obeying
>>>>> the umask.
>>>>
>>>>
>>>> An earlier version of the series did this and I'm happy to add that
>>>> behaviour back in.
>>>>
>>>> If we're not going to do that, and want to change the
>>>>>
>>>>> default behavior, then I think 777 is the wrong/questionable default.
>>>>> Beyond that, 777 is certainly the wrong mode to be using for the
>>>>> shared state package in sstate.bbclass.
>>>>
>>>>
>>>> Do you have a strong preference on 664 vs. 775 ?
>>>
>>>
>>> I'm leaning towards 664 (rw-rw-r--) for the files and 775 (rwxrwxr-x)
>>> for directories, these are the defaults for file and directory creation
>>> on Ubuntu 12.04 and Fedora 16.
>>
>>
>> At which point, the obvious "solution" to the bug report is a sanity check
>> whether the user can read and write to the sstate directory.
>
> may be its already taken care of but I will ask anyway, if shared
> state is writable for all
> how is contention resolved when someone tries to update the shared
> state since he/she rebuilt the package for some reason. I think having
> a global shared cache to read from but not update it would be
> something interesting where shared state is updated by say an
> autobuilder and used by developers in their local builds.

SSTATE_MIRRORS does this nicely and since it uses the fetcher code that 
can be a file:// URI or other.

Joshua
-- 
Joshua Lock
         Yocto Project
         Intel Open Source Technology Centre


