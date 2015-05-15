Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA207403A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 16:48:42 +0000 (UTC)
Received: by yhrr66 with SMTP id r66so34192154yhr.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 09:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+me/pgVXNi2c+4WxmRhtVljvn96kVsklb/GR/P4ZrbI=;
	b=tFCQj4EPbVccCfxc9CPyFBSJnph1pyYiYjHbb0t/DeccDK4piJIcwGf6/nnh8IoVPB
	RLe9xAf+m5x76pTxpn5j5hakDU06oR5JzjDW6iSY6MWqV3RVHCOywKGZGKhBynRBX6un
	aEuttPbj/WsvKMhnFqh0VM0qe6ae2yCwEw/ZgyJMVfZlamzfiSM2mD55UQp50aX352NW
	oTnYn2cTKirYWJ8u3siterSZLNDvzNT+xL3fPiFvzSoStkkUM+3HLGWNSkoLmvtgNt28
	+A+Jya649dtFFjyC4X8q8hqdR2sRgXilBWzWKBDHa9GhffRsFYRKfYuUWZi1OnwTHScA
	dL2Q==
MIME-Version: 1.0
X-Received: by 10.236.70.106 with SMTP id o70mr10737003yhd.136.1431708523498; 
	Fri, 15 May 2015 09:48:43 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Fri, 15 May 2015 09:48:43 -0700 (PDT)
In-Reply-To: <555622C1.8070204@gmail.com>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>
	<1431295383.30971.25.camel@linuxfoundation.org>
	<1431414393.30971.109.camel@linuxfoundation.org>
	<1431686433.18723.22.camel@linuxfoundation.org>
	<CAMKF1spbCyde8wGJgu=GgR14M4g4qSbzLob3rbadhUNPw8_g=Q@mail.gmail.com>
	<555622C1.8070204@gmail.com>
Date: Fri, 15 May 2015 12:48:43 -0400
Message-ID: <CADkTA4Pxy46b=dXNbmYLE0O5iA_Gk0DvDm9O+pqGAtnSeA323Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Fri, 15 May 2015 16:48:42 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 15, 2015 at 12:45 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 05/15/2015 09:25 AM, Khem Raj wrote:
>>
>> On Fri, May 15, 2015 at 3:40 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> On Tue, 2015-05-12 at 08:06 +0100, Richard Purdie wrote:
>>>>
>>>> With the gcc patch I've posted applied:
>>>>
>>>>
>>>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=5fd0b7c163f4f3312bea9bd3246a6bd67a8da594&limit=100
>>>>
>>>> so down to 57 errors. There are a few themes:
>>>>
>>>> * linux-yocto 3.14 gcc5 issues
>>>> * meta-fsl-ppc and metafsl-arm gcc5 issues, particularly kernel
>>>> * poky-lsb issues with the security flags and gcc5
>>>> * x32 failed with a race of some kind in glibc, suspect transient
>>>> * gcc-target has a packaging issue which fails builds (have patch)
>>>>
>>>> The good news is that the various ppc issues are fixed including the rpm
>>>> one from this series.
>>>
>>>
>>> Latest run:
>>>
>>>
>>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=a2fbb1b6b6e564b3f9d40550c0b408978f420039&limit=100
>>>
>>> with 37 errors.
>>>
>>> * linux-yocto 3.14 gcc5 issues
>>
>>
>> I guess there are patches around which I pointed out in last email
>> which should be ported
>
>
> I believe they would be:
>
> bebf56a kasan: enable instrumentation of global variables
> 5631b8f compiler/gcc4+: Remove inaccurate comment about 'asm goto'
> miscompiles
> 71458cf kernel: add support for gcc 5

I'm also queueing changes for 3.19 and 3.14, so if you do have any kernel
patches, feel free to fling them in my direction so we don't duplicate that
effort.

Cheers,

Bruce

>
> just for completeness.
>
> I will give it a shot this weekend.
>
> - armin
>
>>
>>> * meta-fsl-ppc and meta-fsl-arm gcc5 issues, particularly kernel
>>
>>
>> same as above mostly.
>>
>>> * poky-lsb issues with the security flags and gcc5 (elfutils,
>>>    coreutils, iptables, openssl on edgerouter)
>>
>>
>> Those are something need fixing per package. I will look into some of
>> those. x86-64 issues are w.r.t one particular relocation
>>
>>> * qemuarm doesn't boot
>>
>>
>> I have booted several arm machines ( bbb, overo tegra ST ) using
>> kernels ranging from 3.8 to 3.14, I believe its linux-yocto issue most
>> probably.
>>
>>> * u-boot with beaglebone
>>
>>
>> This needs patches like this one
>> http://patchwork.openembedded.org/patch/92425/
>>
>>>
>>> linux-yocto 3.14 is the next thing we need to clean up to have the most
>>> impact, qemuarm not booting is the most worrying.
>>>
>>
>> agreed.
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

