Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 11D31608A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 14:28:56 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Aug 2013 07:27:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,934,1367996400"; d="scan'208";a="285374921"
Received: from unknown (HELO [10.255.14.105]) ([10.255.14.105])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Aug 2013 07:27:51 -0700
Message-ID: <52161FE7.5070900@linux.intel.com>
Date: Thu, 22 Aug 2013 07:27:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <CAF6bG8cHBD0+5JQfuXNNY0odSU3gs=_Son6zT4RXuH8eBfj=Xg@mail.gmail.com>
	<CAF6bG8f7HR25c6FPS0Lz3WqLqG+3-VxijyOKg64vOdRX95M0Dw@mail.gmail.com>
	<CAF6bG8eV+iLQ0xmuJu=XrOn_eDEUtyp1r2KRx2TYX7xxijRJqQ@mail.gmail.com>
	<1447719.EOHWTkW7bb@helios>
In-Reply-To: <1447719.EOHWTkW7bb@helios>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu-native build regularly failing
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
X-List-Received-Date: Thu, 22 Aug 2013 14:28:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2013 06:03 AM, Paul Eggleton wrote:
> On Thursday 22 August 2013 15:56:39 Marko Lindqvist wrote:
>> On 21 August 2013 19:33, Marko Lindqvist <cazfi74@gmail.com> wrote:
>>> On 21 August 2013 01:15, Marko Lindqvist <cazfi74@gmail.com> wrote:
>>>> On 21 August 2013 00:16, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
>>>>> On Tuesday 20 August 2013 23:26:44 Marko Lindqvist wrote:
>>>>>> On 20 August 2013 16:32, Paul Eggleton <paul.eggleton@linux.intel.com>
>>>>>>
>>>>>> wrote:
>>>>>>> On Tuesday 20 August 2013 15:51:21 Marko Lindqvist wrote:
>>>>>>>> Build of qemu-native regularly fails with:
>>>>>>>> |   LINK  sh4-softmmu/qemu-system-sh4
>>>>>>>> |
>>>>>>>> | /usr/lib/x86_64-linux-gnu/libXext.so.6: undefined reference to
>>>>>>>>
>>>>>>>> `_XEatDataWords'
>>>>>>>>
>>>>>>>> | collect2: error: ld returned 1 exit status
>>>>>>>>
>>>>>>>> This might be some dependency missing, as building first some
>>>>>>>> packets
>>>>>>>> (+ more importantly their dependencies) that do not depend on qemu
>>>>>>>> and
>>>>>>>> only then qemu dependant image success.
>>>>>>>
>>>>>>> Do you have something else causing libxext-native to be built by any
>>>>>>> chance?
>>>>>>
>>>>>>   Yes, it seems to be difference between the tree where build fails and
>>>>>>
>>>>>> the one where build success that former has no libxext-native built.
>>>>>> Further, I tested just building libxext-native before building
>>>>>> qemu-native, and then the build succeded.
>>>>>
>>>>> The problem is we want qemu-native to be buildable both on systems
>>>>> without X11 and systems with X11, so the dependency has to be floating,
>>>>> and this is more or less acceptable for a native recipe - there's only
>>>>> a problem when libxext- native needs to be built. I can't see a lot of
>>>>> value in building libxext- native in any case - what is causing it to
>>>>> be built on your system?
>>>>>
>>>>> Cheers,
>>>>> Paul
>>>>>
>>>>   I'm still running more tests - this seems to be complicated matter.
>>>>
>>>> For one, I just got successful build from empty tree by building
>>>> qemu-native directly. That was build targeted to arm, while failing
>>>> builds have been for x86 (native is amd64). Also, I think (but cannot
>>>> be 100% sure any more) build has succeeded on trees where nothing
>>>> depends on libxext-native but still *something* was needed to be built
>>>> before qemu-native.
>>>>
>>>   It seems libxext-native is not needed. Rather this seems like problem
>>>
>>> with build parallelism.
>>>
>>>   - Sometimes "bitbake qemu-native" to empty tree success at once
>>>   - When it first fails (but other tasks get executed while it tries to
>>>
>>> build), it then success by forcing configure rerun & building  (
>>> "bitbake qemu-native -c configure -f && bitbake qemu-native" )
>>>
>>>   I think next step is to get config.log of the succesful and failed
>>>
>>> build to compare.
>>
>> --- success-qemu/qemu-1.5.0/config-host.h       2013-08-22
>> 15:45:10.323126880 +0300
>> +++ failed-qemu/qemu-1.5.0/config-host.h        2013-08-22
>> 15:32:23.515101072 +0300
>> @@ -26,6 +26,7 @@
>>   #define CONFIG_UUID 1
>>   #define QEMU_VERSION "1.5.0"
>>   #define QEMU_PKGVERSION ""
>> +#define CONFIG_SDL 1
>>   #define CONFIG_CURSES 1
>>   #define CONFIG_ATFILE 1
>>   #define CONFIG_UTIMENSAT 1
>> @@ -55,6 +56,7 @@
>>   #define CONFIG_MADVISE 1
>>   #define CONFIG_POSIX_MADVISE 1
>>   #define CONFIG_SIGEV_THREAD_ID 1
>> +#define CONFIG_GLX 1
>>   #define CONFIG_UNAME_RELEASE ""
>>   #define CONFIG_ZERO_MALLOC 1
>>   #define CONFIG_QOM_CAST_DEBUG 1
>>
>>
>> As this diff is success -> failed, CONFIG_GLX and CONFIG_SDL are
>> defined on first build ending to failure, but not on forced
>> reconfigure that then build succesfully.
>
> You'd probably need to dig into the actual configure check that enables these
> automatically. I was about to suggest maybe libsdl-native was present in the
> failing case, but then the current libsdl recipe in OE-Core doesn't provide
> libsdl-native so that probably isn't it...
>
Something that we did not ask here, is what is your host OS?  We just 
had a very similar issue Fedora 19, since qemu had a floating dependency 
on some X libraries specifically libX11 and libXext and X11 is newer on 
F19, it was causing problems if you happen to have libX11-native built. 
  We just updated libX11 and in our testing it seems to have fix this issue.

Check out the patches.

Sau!

> Cheers,
> Paul
>

