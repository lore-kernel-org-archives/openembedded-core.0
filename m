Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1C126768B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 15:10:30 +0000 (UTC)
Received: by ykeo23 with SMTP id o23so168791263yke.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Nnj1YrJzBjcf9cKApC0HqO50dlmELpf1d+EhRUXSkrU=;
	b=Tf1XfAV+WFdVc6nRDPHczDYaBGl9wiT1vSG8sIMgVUuVutwOlT94S87Y0JUeLjQQ/T
	SgAXHUZSVI55We72IXoM0QrEOE3zsPV8bVskbADrOMHwGG65NVd6WzSRZ/x6YwoaAnVZ
	7eG34uAIBj+xCudndemKeMzYJGJVjfhI9F+swZ5SZHt0gjESF+MXbuXme1Fup7tyP6b9
	2GGQ1WKgEKLwHsRII3jyEb+ZlvaAToB9HR/KvSYXX+FPW0T1VMc+9jV5xn+RwhPTaobd
	Zm2n1oVjwtH0d0kEz0tAxMAN54jJwHZkgrCmp6SOJ4g5hQ4QecGV8BcLdWMavcWoUytD
	aUkA==
MIME-Version: 1.0
X-Received: by 10.170.180.65 with SMTP id w62mr8306877ykd.60.1439305830389;
	Tue, 11 Aug 2015 08:10:30 -0700 (PDT)
Received: by 10.13.216.216 with HTTP; Tue, 11 Aug 2015 08:10:30 -0700 (PDT)
In-Reply-To: <55CA05E8.9030605@phytec.de>
References: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
	<CADkTA4NL2Lz08PzmNhW1d9MiQhezDkmo5FwxpgG851Mc7Wffzw@mail.gmail.com>
	<CAP9ODKqqG=gsUdoswgSMz6TpDYBXqeekFnS+FC3YhRveRUy0QA@mail.gmail.com>
	<CADkTA4NT0YO_25Wz9+KfmdBZEkH=HFE+G2Ljyt1og-bgCu35pA@mail.gmail.com>
	<CADkTA4O_Jf9fA1STu9ek9oYvWqehq9bKS83Pxn6KVj0495eyrw@mail.gmail.com>
	<55CA05E8.9030605@phytec.de>
Date: Tue, 11 Aug 2015 11:10:30 -0400
Message-ID: <CADkTA4M=Ep37z_ouEWC1hHsirWL8FQZrpHzDPka2Wt-qxhOcBg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?UTF-8?Q?Stefan_M=C3=BCller=2DKlieser?= <s.mueller-klieser@phytec.de>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Fix do_shared_workdir task ordering
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
X-List-Received-Date: Tue, 11 Aug 2015 15:10:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2015 at 10:25 AM, Stefan M=C3=BCller-Klieser
<s.mueller-klieser@phytec.de> wrote:
> On 11.08.2015 15:11, Bruce Ashfield wrote:
>>
>> On Tue, Aug 11, 2015 at 9:06 AM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>>>
>>> On Tue, Aug 11, 2015 at 8:47 AM, Otavio Salvador
>>> <otavio.salvador@ossystems.com.br> wrote:
>>>>
>>>> On Tue, Aug 11, 2015 at 12:23 AM, Bruce Ashfield
>>>> <bruce.ashfield@gmail.com> wrote:
>>>>>
>>>>> On Mon, Aug 10, 2015 at 11:21 AM, Stefan M=C3=BCller-Klieser
>>>>> <s.mueller-klieser@phytec.de> wrote:
>>>>>>
>>>>>> commit 02d0a003d60326 [kernel.bbclass: Fix race condition] has
>>>>>> surfaced
>>>>>> a bug in the generation of the shared_workdir. The task
>>>>>> do_compile_kernelmodules adds the exported symbols of the kernel
>>>>>> modules
>>>>>> to the Module.symvers. By creating the shared_workdir before the
>>>>>> modules
>>>>>> are compiled, the symbols of the modules are missing in the
>>>>>> shared_workdir. Subsequent external module builds will not include t=
he
>>>>>> ABI CRC of functions exported in modules. Modprobe will fail to load
>>>>>> the
>>>>>> external module if CONFIG_MODVERSIONS is enabled.\
>>>>>
>>>>>
>>>>> Have you seen our bug:
>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8127 ?
>>>>>
>>>>> It's new .. so probably not.
>
> I did not. Thanks.
>
>>>>>
>>>>> The significant issue with this, is that we are now forcing anyone
>>>>> that needs the
>>>>> shared workdir artifacts to build kernel modules.
>
> That's by design. The artifacts are modified by the module build.

As was the generating of shared workdir being before the module build ..
but yes, we are aware of how and why the kernel build generates those
artifacts.

>
>>>>>
>>>>> That's performance issue for many workflows.
>>>>>
>>>>> I had some changes where I was working to short cut parts of the
>>>>> process, but
>>>>> they turned out to miss a few corner cases.
>>>>>
>>>>> We need to do more thinking on this one, before we can bring in a
>>>>> change like
>>>>> this .. since avoiding that overhead is something valuable.
>
> So you are saying a fast build is more important than a correct build?
> That's quite a bold statement.

That's not what I said.

>
>>>>
>>>> I agree that performance is important but correctness seems more
>>>> valuable for me. I think the optimization can come as a subsequent
>>>> patch ...
>>>
>>>
>>> Let's disagree on this point.
>>>
>>> There's time to get this right. We have a bug to track it, so we wont'
>>> release with
>>> the active bug, and this only hits a very tiny set of users.
>>>
>>> So we are going to step back and try and fix this right.
>
> Well, if you really want to do this then there should at least be a
> module-interdepend.bbclass not using the shared workdir and depending on =
the
> modules build. Fido and master are broken at the moment.

There's multiple ways to consider here and not a single right way.  But if
you have an idea, send patch for review, or update the bug I referenced,
that way we can consider them as well.

I'm not saying this isn't a bug or issue, I'm saying that it hits a certain=
 set
of builds (and not all), so fixing this in a way that doesn't break the oth=
er
design goals of the kernel build is important as well. I end up getting
the bugs, and having to fix performance issues ... so I'm sensitive to all
the use cases.

We've been back and forth on the shared artefacts generation, with a lot
of unintended side effects. Any changes in this area have to soak and be
looked at by as many eyes as possible.

RP may grab this as is, and that's also fine with me, I'm just on the recor=
d
pointing out the side effects, so when someone notices incremental builds,
or sstate, or updates taking longer .. we can point to the reason why.

Bruce

>
> Regards,
>
> Stefan
>
>
>>
>> I hit send too soon. I have a suggestion in the bug already, so it isn't
>> like
>> we are talking about letting this sit for weeks.
>>
>> History shows that we are very unlikely to loop back and fix the
>> performance
>> of perf or other builds once the change goes in. So in the absence of
>> other concrete suggestions, looking into some other small changes is a
>> good
>> use of time.
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>>
>>> Bruce
>>>
>>>>
>>>> --
>>>> Otavio Salvador                             O.S. Systems
>>>> http://www.ossystems.com.br        http://code.ossystems.com.br
>>>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>>>
>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>
>>
>>
>>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

