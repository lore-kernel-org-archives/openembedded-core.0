Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phytec.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 40911767F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 14:25:45 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id F200FA0020D;
	Tue, 11 Aug 2015 16:27:36 +0200 (CEST)
Received: from [172.16.10.21] ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015081116254474-138984 ;
	Tue, 11 Aug 2015 16:25:44 +0200 
Message-ID: <55CA05E8.9030605@phytec.de>
Date: Tue, 11 Aug 2015 16:25:44 +0200
From: =?UTF-8?B?U3RlZmFuIE3DvGxsZXItS2xpZXNlcg==?=
	<s.mueller-klieser@phytec.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>	<CADkTA4NL2Lz08PzmNhW1d9MiQhezDkmo5FwxpgG851Mc7Wffzw@mail.gmail.com>	<CAP9ODKqqG=gsUdoswgSMz6TpDYBXqeekFnS+FC3YhRveRUy0QA@mail.gmail.com>	<CADkTA4NT0YO_25Wz9+KfmdBZEkH=HFE+G2Ljyt1og-bgCu35pA@mail.gmail.com>
	<CADkTA4O_Jf9fA1STu9ek9oYvWqehq9bKS83Pxn6KVj0495eyrw@mail.gmail.com>
In-Reply-To: <CADkTA4O_Jf9fA1STu9ek9oYvWqehq9bKS83Pxn6KVj0495eyrw@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 11.08.2015 16:25:44,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 11.08.2015 16:25:44
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 11 Aug 2015 14:25:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.08.2015 15:11, Bruce Ashfield wrote:
> On Tue, Aug 11, 2015 at 9:06 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Tue, Aug 11, 2015 at 8:47 AM, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>> On Tue, Aug 11, 2015 at 12:23 AM, Bruce Ashfield
>>> <bruce.ashfield@gmail.com> wrote:
>>>> On Mon, Aug 10, 2015 at 11:21 AM, Stefan M=C3=BCller-Klieser
>>>> <s.mueller-klieser@phytec.de> wrote:
>>>>> commit 02d0a003d60326 [kernel.bbclass: Fix race condition] has surfac=
ed
>>>>> a bug in the generation of the shared=5Fworkdir. The task
>>>>> do=5Fcompile=5Fkernelmodules adds the exported symbols of the kernel =
modules
>>>>> to the Module.symvers. By creating the shared=5Fworkdir before the mo=
dules
>>>>> are compiled, the symbols of the modules are missing in the
>>>>> shared=5Fworkdir. Subsequent external module builds will not include =
the
>>>>> ABI CRC of functions exported in modules. Modprobe will fail to load =
the
>>>>> external module if CONFIG=5FMODVERSIONS is enabled.\
>>>>
>>>> Have you seen our bug: https://bugzilla.yoctoproject.org/show=5Fbug.cg=
i?id=3D8127 ?
>>>>
>>>> It's new .. so probably not.
I did not. Thanks.

>>>>
>>>> The significant issue with this, is that we are now forcing anyone
>>>> that needs the
>>>> shared workdir artifacts to build kernel modules.
That's by design. The artifacts are modified by the module build.

>>>>
>>>> That's performance issue for many workflows.
>>>>
>>>> I had some changes where I was working to short cut parts of the proce=
ss, but
>>>> they turned out to miss a few corner cases.
>>>>
>>>> We need to do more thinking on this one, before we can bring in a chan=
ge like
>>>> this .. since avoiding that overhead is something valuable.
So you are saying a fast build is more important than a correct build?=20
That's quite a bold statement.

>>>
>>> I agree that performance is important but correctness seems more
>>> valuable for me. I think the optimization can come as a subsequent
>>> patch ...
>>
>> Let's disagree on this point.
>>
>> There's time to get this right. We have a bug to track it, so we wont'
>> release with
>> the active bug, and this only hits a very tiny set of users.
>>
>> So we are going to step back and try and fix this right.
Well, if you really want to do this then there should at least be a=20
module-interdepend.bbclass not using the shared workdir and depending on=20
the modules build. Fido and master are broken at the moment.

Regards,

Stefan

>
> I hit send too soon. I have a suggestion in the bug already, so it isn't =
like
> we are talking about letting this sit for weeks.
>
> History shows that we are very unlikely to loop back and fix the performa=
nce
> of perf or other builds once the change goes in. So in the absence of
> other concrete suggestions, looking into some other small changes is a go=
od
> use of time.
>
> Cheers,
>
> Bruce
>
>
>>
>> Bruce
>>
>>>
>>> --
>>> Otavio Salvador                             O.S. Systems
>>> http://www.ossystems.com.br        http://code.ossystems.com.br
>>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>
>
>

