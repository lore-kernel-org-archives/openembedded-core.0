Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.1765.1600189170468249811
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 09:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 08FGxQsZ007932
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 11:59:28 -0500
Subject: Re: [OE-core] [meta-oe][PATCH 0/5] ARMv8 Tune reorg
To: openembedded-core@lists.openembedded.org
References: <20200914151359.11240-1-jon.mason@arm.com>
 <CA+chaQfAL+mvyG7smtku8za+6fvubybjjpOfu+g6dGfrJSoWJA@mail.gmail.com>
 <CAPoiz9wQ684w=CDhKpQdcLG5K-4fmJ=dF_-Oi39PqsHbxeX9Rw@mail.gmail.com>
 <20200915143849.v2s2davmicoeull3@jama>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <39b1207e-f26b-0047-7eb0-b3ad8465d8b6@kernel.crashing.org>
Date: Tue, 15 Sep 2020 11:59:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915143849.v2s2davmicoeull3@jama>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/15/20 9:38 AM, Martin Jansa wrote:
> On Mon, Sep 14, 2020 at 06:54:14PM -0400, Jon Mason wrote:
>> On Mon, Sep 14, 2020 at 11:32 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>>>
>>>> This reduces the number of files from 12 to 2 for ARMv8a, and that is excluding the 13 I am adding in this series that would otherwise be unique files.
>>>
>>> I don't have a strong opinion on this anymore, but is the number of the include files the issue here?
>>
>> This is the reason why I'm doing it.  Arm needs to support all the
>> cortex-a and cortex-m cores.  This would make the majority of the tune
>> files for only Arm cores.  We could move them into
>> meta/conf/machine/include/arm and not make the level down directory so
>> messy, but I think this is cleaner.
>>
>>> I think the issue is the number of possible combinations and using the same TUNE_PKGARCH for different tunes (unlike 32bit arm tune files which use different). Bundling all these combinations in fewer include files doesn't IMHO improve it.
>>
>> The multitude of combinations and redundancy code entries makes it
>> very error prone.  By putting them all in the same file, it makes it
>> much easier to see the differences in entries and catch errors.
> 
> It does make it easier? In my experience it's more difficult to compare

For some of my usecases, it makes it significantly easier.

I need to build multilib configurations that have a variety of tunes in them.
Before I had to include 5-7 different .inc files, and then ignore the warning
about the same files being included multiple times.

With this approach, I can include just one file, the proper superset of them
all, and then do my multilib configurations together.

(Yes, I realize this isn't the typical Linux use-case, but this seems to be
fairly common to do things like this when working with baremetal configurations
or trying to use the Yocto Project to build toolchains that are shared with others.)

> very similar long sections in different parts of the same file, than
> comparing very similar files with diff.
> When working on
> https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune-test
> https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune2-test
> https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune3
> https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/optdefaulttune
> long time ago, I found it really convenient to compare all cortex*.inc
> files just by replacing the number with some placeholder and comparing
> the resulting files (which were in most cases identical) - doing the
> same inside single file just makes it more complicated, probably by
> first splitting the various sections back to separate files again.
> 
>> Longer term, I'd like to see something that removes the redundancies
>> completely, but it will take some work.
> 
> So now all BSPs need to adapt (by changing from the more specific .inc
> file corresponding to the actual CPU in MACHINE they implement to
> generic family .inc while setting one of the possible DEFAULTTUNE,
> instead of leaving the default from .inc file), but all this only
> for the dubious benefit of having fewer .inc files in oe-core, right?

I suggested how a transition could be done, but this was rejected in favor of
make people move their BSPs to the new format.

--Mark

>>> With 32bit arm include files it was useful to be able to compare various include files to check that they follow the same "structure" (or to add new cortexa* one by copying existing and regex-replace).
>>>
>>> Also AVAILTUNES will now contain all possible tunes from given family (which makes it almost useless for aarch64 tunes). So instead of BSP including .inc file corresponding with the core used in the MACHINE and getting some "sane" default DEFAULTTUNE (plus some other possible options listed in AVAILTUNES) we now force every BSP to set more specific DEFAULTTUNE and then let user figure out what other DEFAULTTUNEs might be compatible with it, e.g. when someone is doing multi MACHINE builds and wants to share TUNE_PKGARCH between them (to save build time, package feed size etc).
>>
>> You can still set a generic default for all the machines of a given
>> family.  By including armv8a.inc, you still get 'DEFAULTTUNE ?=
>> "armv8a-crc"'.  This will allow for a generic for an entire family.
>> I'm not seeing the issue.
> 
> OK, with e.g. raspberrypi4-64.conf from
> https://github.com/agherzan/meta-raspberrypi/blob/a4c8118676ba8002edab29fc81b4e4edd9fad1f1/conf/machine/raspberrypi4-64.conf
> which just
> require conf/machine/include/tune-cortexa72.inc
> 
> Without your patches:
> DEFAULTTUNE="cortexa72"
> TUNE_PKGARCH="cortexa72"
> TUNE_CCARGS=" -mcpu=cortex-a72+crc+crypto"
> AVAILTUNES=" armv4 armv4t armv4b armv4tb armv5 armv5t armv5-vfp
> armv5t-vfp armv5hf-vfp armv5thf-vfp armv5b armv5tb armv5b-vfp
> armv5tb-vfp armv5hfb-vfp armv5thfb-vfp armv5e armv5te armv5e-vfp
> armv5te-vfp armv5ehf-vfp armv5tehf-vfp armv5eb armv5teb armv5eb-vfp
> armv5teb-vfp armv5ehfb-vfp armv5tehfb-vfp armv6-novfp armv6t-novfp armv6
> armv6t armv6hf armv6thf armv6b-novfp armv6tb-novfp armv6b armv6tb
> armv6hfb armv6thfb armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16
> armv7a-vfpv3 armv7at-vfpv3 armv7a-vfpv4d16 armv7at-vfpv4d16 armv7a-neon
> armv7at-neon armv7a-neon-vfpv4 armv7at-neon-vfpv4 armv7ahf armv7athf
> armv7ahf-vfpv3d16 armv7athf-vfpv3d16 armv7ahf-vfpv3 armv7athf-vfpv3
> armv7ahf-vfpv4d16 armv7athf-vfpv4d16 armv7ahf-neon armv7athf-neon
> armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4 armv7ab armv7atb
> armv7ab-vfpv3d16 armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3
> armv7ab-vfpv4d16 armv7atb-vfpv4d16 armv7ab-neon armv7atb-neon
> armv7ab-neon-vfpv4 armv7atb-neon-vfpv4 armv7ahfb armv7athfb
> armv7ahfb-vfpv3d16 armv7athfb-vfpv3d16 armv7ahfb-vfpv3 armv7athfb-vfpv3
> armv7ahfb-vfpv4d16 armv7athfb-vfpv4d16 armv7ahfb-neon armv7athfb-neon
> armv7ahfb-neon-vfpv4 armv7athfb-neon-vfpv4 armv7ve armv7vet
> armv7ve-vfpv3d16 armv7vet-vfpv3d16 armv7ve-vfpv3 armv7vet-vfpv3
> armv7ve-vfpv4d16 armv7vet-vfpv4d16 armv7ve-neon armv7vet-neon
> armv7ve-neon-vfpv4 armv7vet-neon-vfpv4 armv7vehf armv7vethf
> armv7vehf-vfpv3d16 armv7vethf-vfpv3d16 armv7vehf-vfpv3 armv7vethf-vfpv3
> armv7vehf-vfpv4d16 armv7vethf-vfpv4d16 armv7vehf-neon armv7vethf-neon
> armv7vehf-neon-vfpv4 armv7vethf-neon-vfpv4 armv7veb armv7vetb
> armv7veb-vfpv3d16 armv7vetb-vfpv3d16 armv7veb-vfpv3 armv7vetb-vfpv3
> armv7veb-vfpv4d16 armv7vetb-vfpv4d16 armv7veb-neon armv7vetb-neon
> armv7veb-neon-vfpv4 armv7vetb-neon-vfpv4 armv7vehfb armv7vethfb
> armv7vehfb-vfpv3d16 armv7vethfb-vfpv3d16 armv7vehfb-vfpv3
> armv7vethfb-vfpv3 armv7vehfb-vfpv4d16 armv7vethfb-vfpv4d16
> armv7vehfb-neon armv7vethfb-neon armv7vehfb-neon-vfpv4
> armv7vethfb-neon-vfpv4 aarch64 aarch64_be armv8a armv8a-crc
> armv8a-crc-crypto armv8a-crypto cortexa72"
> 
> With your patches:
> ERROR: ParseError at /OE/build/oe-core/meta-raspberrypi/conf/machine/raspberrypi4-64.conf:13: Could not include required file conf/machine/include/tune-cortexa72.inc
> 
> After changing the require to conf/machine/include/arm/arch-armv8a.inc:
> DEFAULTTUNE="armv8a-crc"
> TUNE_PKGARCH="armv8a"
> TUNE_CCARGS=" -march=armv8-a+crc"
> AVAILTUNES=" cortexa32 cortexa32-crypto cortexa34 cortexa34-crypto
> cortexa35 cortexa35-crypto cortexa53 cortexa53-crypto cortexa57
> cortexa57-crypto cortexa72 cortexa73 thunderx thunderx_be
> cortexa57-cortexa53 cortexa72-cortexa53 cortexa72-cortexa53-crypto
> cortexa73-cortexa35 cortexa73-cortexa35-crypto cortexa73-cortexa53
> cortexa73-cortexa53-crypto armv4 armv4t armv4b armv4tb armv5 armv5t
> armv5-vfp armv5t-vfp armv5hf-vfp armv5thf-vfp armv5b armv5tb armv5b-vfp
> armv5tb-vfp armv5hfb-vfp armv5thfb-vfp armv5e armv5te armv5e-vfp
> armv5te-vfp armv5ehf-vfp armv5tehf-vfp armv5eb armv5teb armv5eb-vfp
> armv5teb-vfp armv5ehfb-vfp armv5tehfb-vfp armv6-novfp armv6t-novfp armv6
> armv6t armv6hf armv6thf armv6b-novfp armv6tb-novfp armv6b armv6tb
> armv6hfb armv6thfb armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16
> armv7a-vfpv3 armv7at-vfpv3 armv7a-vfpv4d16 armv7at-vfpv4d16 armv7a-neon
> armv7at-neon armv7a-neon-vfpv4 armv7at-neon-vfpv4 armv7ahf armv7athf
> armv7ahf-vfpv3d16 armv7athf-vfpv3d16 armv7ahf-vfpv3 armv7athf-vfpv3
> armv7ahf-vfpv4d16 armv7athf-vfpv4d16 armv7ahf-neon armv7athf-neon
> armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4 armv7ab armv7atb
> armv7ab-vfpv3d16 armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3
> armv7ab-vfpv4d16 armv7atb-vfpv4d16 armv7ab-neon armv7atb-neon
> armv7ab-neon-vfpv4 armv7atb-neon-vfpv4 armv7ahfb armv7athfb
> armv7ahfb-vfpv3d16 armv7athfb-vfpv3d16 armv7ahfb-vfpv3 armv7athfb-vfpv3
> armv7ahfb-vfpv4d16 armv7athfb-vfpv4d16 armv7ahfb-neon armv7athfb-neon
> armv7ahfb-neon-vfpv4 armv7athfb-neon-vfpv4 armv7ve armv7vet
> armv7ve-vfpv3d16 armv7vet-vfpv3d16 armv7ve-vfpv3 armv7vet-vfpv3
> armv7ve-vfpv4d16 armv7vet-vfpv4d16 armv7ve-neon armv7vet-neon
> armv7ve-neon-vfpv4 armv7vet-neon-vfpv4 armv7vehf armv7vethf
> armv7vehf-vfpv3d16 armv7vethf-vfpv3d16 armv7vehf-vfpv3 armv7vethf-vfpv3
> armv7vehf-vfpv4d16 armv7vethf-vfpv4d16 armv7vehf-neon armv7vethf-neon
> armv7vehf-neon-vfpv4 armv7vethf-neon-vfpv4 armv7veb armv7vetb
> armv7veb-vfpv3d16 armv7vetb-vfpv3d16 armv7veb-vfpv3 armv7vetb-vfpv3
> armv7veb-vfpv4d16 armv7vetb-vfpv4d16 armv7veb-neon armv7vetb-neon
> armv7veb-neon-vfpv4 armv7vetb-neon-vfpv4 armv7vehfb armv7vethfb
> armv7vehfb-vfpv3d16 armv7vethfb-vfpv3d16 armv7vehfb-vfpv3
> armv7vethfb-vfpv3 armv7vehfb-vfpv4d16 armv7vethfb-vfpv4d16
> armv7vehfb-neon armv7vethfb-neon armv7vehfb-neon-vfpv4
> armv7vethfb-neon-vfpv4 aarch64 aarch64_be armv8a armv8a-crc
> armv8a-crc-crypto armv8a-crypto"
> 
> Should really raspberrypi4-64 users see e.g. cortexa73-cortexa35-crypto
> in AVAILTUNES even when it doesn't make sense for their HW?
> 
>>> On Mon, Sep 14, 2020 at 5:14 PM Jon Mason <jdmason@kudzu.us> wrote:
>>>>
>>>> There is a large number of Arm Tune files located in
>>>> meta/conf/machine/include/, and to support the current and upcoming Arm
>>>> cores, more are needed.  Adding more files is simply going to make it
>>>> harder to find the relevant ones for an OE/YP developer/user.  Also,
>>>> there are problems with stale and erroneous configs (see my previous
>>>> series), which will only be exacerbated by having more files.
>>>>
>>>> I am proposing a reorganization of the existing tune files by including
>>>> them in the generic family include file.  For example, the
>>>> tune-cortexa55.inc would be moved into arch-armv8-2a.inc, and
>>>> tune-cortexa57.inc would be moved into arch-armv8a.inc.  This reduces
>>>> the number of files from 12 to 2 for ARMv8a, and that is excluding the
>>>> 13 I am adding in this series that would otherwise be unique files.
>>>>
>>>> To use, simply add
>>>> ...
>>>> DEFAULTTUNE ?= "neoversen1"
>>>> require conf/machine/include/arm/arch-armv8-2a.inc
>>>> ...
>>>>
>>>> Which is arguably what should be done anyway (instead of taking the
>>>> default of the tune include file).
>>>> See the qemuarm64 patch in the series for a working example.
>>>>
>>>> Of course, by removing the existing tune files, current users are going
>>>> to break.  A simple script can be written to use sed (or similar) to
>>>> replace the relevant parts for those users that would be affected (at
>>>> least for those that are in the layer index and update regularly).
>>>>
>>>> Thanks,
>>>> Jon
>>>>
>>>> ---
>>>>
>>>> Originally sent as a RFC in
>>>> https://lists.openembedded.org/g/openembedded-core/message/142324
>>>>
>>>> Given the generally positive feedback, sending as a patch series.
>>>> Keeping the "hard fail" of the file removal (per Richards comment in
>>>> https://lists.openembedded.org/g/openembedded-core/message/142356).
>>>> Only difference of note is the removal of the "arm64: set BASE_LIB to
>>>> lib64", as there needs to be more investigation (see
>>>> https://lists.openembedded.org/g/openembedded-core/message/142414).
>>>>
>>>>
>>>> Jon Mason (5):
>>>>   arch-armv8-2a.inc: Add Cortex-A55 tunings
>>>>   arch-armv8a.inc: Add existing tunings
>>>>   qemuarm64: change tuning
>>>>   arch-armv8a.inc: Add tunes for supported ARMv8a cores
>>>>   arch-armv8-2a.inc: Add tunes for supported ARMv8.2a cores
>>>>
>>>>  .../machine/include/arm/arch-armv8-2a.inc     | 175 ++++++++++++++-
>>>>  meta/conf/machine/include/arm/arch-armv8a.inc | 206 +++++++++++++++++-
>>>>  meta/conf/machine/include/tune-cortexa32.inc  |  18 --
>>>>  meta/conf/machine/include/tune-cortexa35.inc  |  17 --
>>>>  meta/conf/machine/include/tune-cortexa53.inc  |  18 --
>>>>  meta/conf/machine/include/tune-cortexa55.inc  |  13 --
>>>>  .../include/tune-cortexa57-cortexa53.inc      |  15 --
>>>>  meta/conf/machine/include/tune-cortexa57.inc  |  17 --
>>>>  .../include/tune-cortexa72-cortexa53.inc      |  20 --
>>>>  meta/conf/machine/include/tune-cortexa72.inc  |  13 --
>>>>  .../include/tune-cortexa73-cortexa53.inc      |  20 --
>>>>  meta/conf/machine/include/tune-thunderx.inc   |  19 --
>>>>  meta/conf/machine/qemuarm64.conf              |   3 +-
>>>>  13 files changed, 371 insertions(+), 183 deletions(-)
>>>>  delete mode 100644 meta/conf/machine/include/tune-cortexa32.inc
>>>>  delete mode 100644 meta/conf/machine/include/tune-cortexa35.inc
>>>>  delete mode 100644 meta/conf/machine/include/tune-cortexa53.inc
>>>>  delete mode 100644 meta/conf/machine/include/tune-cortexa55.inc
>>>>  delete mode 100644 meta/conf/machine/include/tune-cortexa57-cortexa53.inc
>>>>  delete mode 100644 meta/conf/machine/include/tune-cortexa57.inc
>>>>  delete mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.inc
>>>>  delete mode 100644 meta/conf/machine/include/tune-cortexa72.inc
>>>>  delete mode 100644 meta/conf/machine/include/tune-cortexa73-cortexa53.inc
>>>>  delete mode 100644 meta/conf/machine/include/tune-thunderx.inc
>>>>
>>>> --
>>>> 2.20.1
>>>>
>>>>
>>>>
>>>> 
