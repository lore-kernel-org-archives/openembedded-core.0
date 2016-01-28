Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3A576FF7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 02:58:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0S2wpOJ029521
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 27 Jan 2016 18:58:51 -0800
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jan 2016 18:58:50 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
References: <cover.1453882496.git.hongxu.jia@windriver.com>
	<1453889810.10340.5.camel@linuxfoundation.org>
	<F43BB7C8-5982-46B5-90B1-D11128DEA616@gmail.com>
	<1453932798.10340.11.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56A983DE.6030907@windriver.com>
Date: Thu, 28 Jan 2016 10:58:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453932798.10340.11.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] base/bbclass: use target path to replace build ones in debugging info
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
X-List-Received-Date: Thu, 28 Jan 2016 02:58:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/28/2016 06:13 AM, Richard Purdie wrote:
> On Wed, 2016-01-27 at 14:34 -0500, Khem Raj wrote:
>>> On Jan 27, 2016, at 5:16 AM, Richard Purdie <
>>> richard.purdie@linuxfoundation.org> wrote:
>>>
>>> I like the idea of this a lot, I think it makes sense however why
>>> not

My original trying was just added them here, but the variable parsing
at here is too early, the ${BPN}, ${B} and {S} was assigned with
'defaultpkgname' at this time. Which we have:
...
| -fdebug-prefix-map=/buildarea/raid0/hjia/build-20160127-yocto-buildpath-2/
tmp/work/core2-64-poky-linux/defaultpkgname/1.0-r0/defaultpkgname-1.0=
/usr/src/defaultpkgname
...

>>> just:
>>>
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index e80ee18..284f7fb 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -546,7 +546,14 @@ EXTRA_OEMAKE_prepend_task-install =
>>> "${PARALLEL_MAKEINST}"
>>> ##################################################################
>>> # Optimization flags.
>>> ##################################################################
>>> -DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types"
>>> +DEBUG_FLAGS ?= "-g \
>>> +    -feliminate-unused-debug-types \
>>> +    -fdebug-prefix-map=${B}=/usr/src/${BPN} \
>>> +    -fdebug-prefix-map=${S}=/usr/src/${BPN}
>>> +    -gno-record-gcc-switches \
>> can we leave the switches in ?
> Is there a way we can do some path substitutions on the switches?

With searching the manual, I could not find a gcc option to
do the path substitution on switches in debugging information.

Maybe we could add a patch for gcc to do this. I could try in V2
if there is no side effect.

>
> I think part of the desire here is that the end resulting binaries
> shouldn't depend upon the path in which they were built and leaving
> these in is causing a problem there.

Compile with '-fdebug-prefix-map':
objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
...
| <0><5e>: Abbrev Number: 1 (DW_TAG_compile_unit)
|    <5f>   DW_AT_producer    : (indirect string, offset: 0xbb): GNU C99 5.3.0 -m32
-march=core2 -mtune=core2 -msse3 -mfpmath=sse -mpreferred-stack-boundary=4 -g -O2
-std=gnu99 -fgnu89-inline -fdebug-prefix-map=/buildarea/raid0/hjia/build-20160119-
yocto-buildpath/tmp/work/core2-32-pokymllib32-linux/lib32-glibc/2.22-r0/git=/usr/src/glibc
-feliminate-unused-debug-types -fmerge-all-constants -frounding-math -ftls-model=initial-exec

When we use '-fdebug-prefix-map', the TMPDIR was added to switches. Although
remove the switches is to avoid buildpath QA check, the side effect is 
the other
part of compile options have also been removed.

If we need to leave the switches in, I think we could tweak the 
buildpath QA check,
which allows TMPDIR in '-fdebug-prefix-map=' without warning. I think I 
should
send a V2 to do this for discussion.

Solution1: do some path substitutions on the switches
Solution2: tweak buildpath QA check to allow TMPDIR in '-fdebug-prefix-map='

I will try them in V2.

//Hongxu

> Cheers,
>
> Richard
>
>>> +    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
>>> +    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
>>> +"
>>> # Disabled until the option works properly -feliminate-dwarf2-dups
>>> FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
>>> DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS}
>>> -pipe"
>>>
>>> ?
>>>
>>> Cheers,
>>>
>>> Richard
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


