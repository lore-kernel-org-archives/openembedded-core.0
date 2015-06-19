Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFBE73772
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 16:49:10 +0000 (UTC)
Received: by igboe5 with SMTP id oe5so20364451igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 09:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=clhsEDCHoVDPEX+dNjfiKfedoP75nhbXUOK3tlGru4E=;
	b=upycOvs5tmXdEup3130cLujm4DVhbkKZZyFJUwMTxkazRRka6C/DQDz8wOLC421mt9
	k4c81UW9vm3J2DSZbDABK+k5dM+urzMTxQobxEJpmserqa1tf3Pnxzw+tRX+uHWVs4Mv
	CQcz9+XYmYUSRU2boR6xPwtxik37ZYXoSOSrKrGkuMzr7eeUuxnOQO1m8OzKG4cw2vZF
	9wC+EiV23EGjyp/TCRqo12NBL23iTxEYQQiSPdvAwM6laStcnzYESNLORYpZSY4Ti2eq
	Wx/TvpNyRCZJ0SAf4Tz3aKlyTOahUSnaQ65M1b72A2wdARpXCuW2aBoBuPqQ9/7/8rHy
	BGYw==
MIME-Version: 1.0
X-Received: by 10.43.66.5 with SMTP id xo5mr12660486icb.57.1434732551460; Fri,
	19 Jun 2015 09:49:11 -0700 (PDT)
Received: by 10.64.130.201 with HTTP; Fri, 19 Jun 2015 09:49:11 -0700 (PDT)
In-Reply-To: <558420A0.309@windriver.com>
References: <1434633188-3434-1-git-send-email-dbaryshkov@gmail.com>
	<CALT56yOBxbjc=F96unuigiBAR9En9kYKce9ZqWmtkneOGYVQqQ@mail.gmail.com>
	<558420A0.309@windriver.com>
Date: Fri, 19 Jun 2015 19:49:11 +0300
Message-ID: <CALT56yM=BcBdNuwTdBtxoT2GZ_=DxdntsTSjaViE9MZyrGqPqQ@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] arch-mips.inc: don't override TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Fri, 19 Jun 2015 16:49:10 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

2015-06-19 17:01 GMT+03:00 Mark Hatle <mark.hatle@windriver.com>:
> On 6/19/15 4:23 AM, Dmitry Eremin-Solenikov wrote:
>>> On 6/18/15 8:13 AM, Dmitry Eremin-Solenikov wrote:
>>>> Currently MIPS64 N32 is broken. There is internal disagreement
>>>> between TARGET_ARCH (which doesn't contain ABIEXTENSION) and
>>>> TRANSLATED_TARGET_ARCH (which contains ABIEXTENSION). ABI is already
>>>> encoded into the TARGET_OS. ARM tunes in the same situation override
>>>> neither the TARGET_ARCH nor the TRANSLATED_TARGET_ARCH. So let's drop
>>>> this override.
>>>
>>> This series won't work properly, unless I'm reading something incorrectly.
>>>
>>> You won't be able to build/install a tri-lib system after this change, as
>>> something needs to be there to differential between MIPS32 (o32), MIPS64 (n32)
>>> and MIPS64 (n64).
>>>
>>> Currently this is done via the ABIEXTENSION value.
>>
>> Why do you need this differentiation in the TARGET_ARCH? We have TARGET_SYS
>> (triplets) for that, don't we? And the compilers for the N64/N32 (the
>> only thing IIRC
>> that is really dependent on the TARGET_ARCH) should be interchangeable, AFAIU.
>
> The triplet for o32 is:
>
> mips-os-linux
>
> The triplet to n64 is:
>
> mips64-os-linux
>
> The triplet to n32 is:
>
> mips64-os-linux

No. It is mips64-oe-linux-gnun32! Even with my patches.


> thus w/o the ABI extension there is no mechanism to distinguish between n64 and n32.

See, the arch is the same (MIPS64), it should not encode the ABI. The
multiplet differs
(mips64-oe-linux vs. mips64-oe-linux-gnun32) and this also looks correct.

>
>> Can you point me, please, how to create a tri-ABI SDK and/or image?
>
> Configure with a MIPS64 capable machine (yes qemumips64 is adequate).  Then add
> the following to your local.conf:
>
> require conf/multilib.conf
> DEFAULTTUNE = "mips32r2"
>
> MULTILIBS = "multilib:lib32 multilib:lib64"
> DEFAULTTUNE_virtclass-multilib-lib32 = "mips64-n32"
> DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"
>
>
> This will set the default ABI to 'o32', with optional n32 and n64 support.  (You
> can switch around the defaulttune values to change which is default and which is
> optional.  A common config is n32 default, o32 / n64 optional.)

I'll try with this with my patches.

>
>>>
>>> What is currently broken w/ MIPS64 N32?  We put in a number of fixes for this
>>> problem and SDK generation in the YP 1.8 time frame.  Perhaps something has
>>> changed since then or maybe the fixes were not as complete as we thought?
>>
>> Quite simple configuration (MIPS64 N32 image) fails to build.
>>
>>
>> lumag@nexs:~/OE$ MACHINE=qemumips64n32 bitbake core-image-base
>> NOTE: Started PRServer with DBfile:
>> /home/lumag/OE/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46391, PID:
>> 15895
>> Loading cache: 100%
>> |########################################################################################################################|
>> ETA:  00:00:00
>> Loaded 1302 entries from dependency cache.
>> NOTE: Resolving any missing task queue dependencies
>> ERROR: Nothing RPROVIDES 'binutils-cross-canadian-mips64' (but
>> /home/lumag/OE/sources/openembedded-core/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
>> RDEPENDS on or otherwise requires it)
>> NOTE: Runtime target 'binutils-cross-canadian-mips64' is unbuildable,
>> removing...
>
> Looks to me that when binutils was upgraded, the rename of the arch component
> broke in some way.  The arch renaming used by the cross-canadian toolchain
> components SHOULD have changed things to me "mips64-n32" in the n32 case.  This
> is the purpose of the ABIEXTENSION being added to the 'TRANSLATED_TARGET_ARCH'
> in arch-mips.conf.  See commit: 0bcc01121e928d0be7a0550e500425852c63cf98 for
> additional details.
>
> (The commit msg includes the configuration listed above as well.)



-- 
With best wishes
Dmitry

