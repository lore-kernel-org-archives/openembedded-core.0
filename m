Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4360276967
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 13:11:19 +0000 (UTC)
Received: by ykdt205 with SMTP id t205so85409091ykd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 06:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=qp9ryFE7C9L2hgIgbdmqcSYgUszLKBttPR2Z6LPBDlM=;
	b=enqzDOVRUlezsGX8sD2kh5S6Fr3+nD6F5/7fzka4zdmvIekGTKCY1gQ8BYu2c9nDm2
	wQb+ejevT4/AE6sYVFBIyIU+/1uiWBXIJWEdupMwvx2RGKP2JgWVOHjlWYDzVXJNsT8x
	+f4UeWFWQRZoSn6iPIoSDpZFD8nsNUKir1sYUgUiCJgrm3EwixYbIbgw6T4OHJ+/43BC
	iL40UllPgqhKpClYIjGERFS9NLAVjgP1aGyOx+lEWJHihz/qYEiwv9XT9/ntbPcIIQy8
	1FqVHa94ljOH7OKYOCAwQsKmnVwQZodb26EpCjPmqgGqsiUue4V0bzFDIYEGYGOQwSGB
	WkrA==
MIME-Version: 1.0
X-Received: by 10.129.73.82 with SMTP id w79mr22444819ywa.16.1439298680113;
	Tue, 11 Aug 2015 06:11:20 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Tue, 11 Aug 2015 06:11:20 -0700 (PDT)
In-Reply-To: <CADkTA4NT0YO_25Wz9+KfmdBZEkH=HFE+G2Ljyt1og-bgCu35pA@mail.gmail.com>
References: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
	<CADkTA4NL2Lz08PzmNhW1d9MiQhezDkmo5FwxpgG851Mc7Wffzw@mail.gmail.com>
	<CAP9ODKqqG=gsUdoswgSMz6TpDYBXqeekFnS+FC3YhRveRUy0QA@mail.gmail.com>
	<CADkTA4NT0YO_25Wz9+KfmdBZEkH=HFE+G2Ljyt1og-bgCu35pA@mail.gmail.com>
Date: Tue, 11 Aug 2015 09:11:20 -0400
Message-ID: <CADkTA4O_Jf9fA1STu9ek9oYvWqehq9bKS83Pxn6KVj0495eyrw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
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
X-List-Received-Date: Tue, 11 Aug 2015 13:11:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2015 at 9:06 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Tue, Aug 11, 2015 at 8:47 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Tue, Aug 11, 2015 at 12:23 AM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>>> On Mon, Aug 10, 2015 at 11:21 AM, Stefan M=C3=BCller-Klieser
>>> <s.mueller-klieser@phytec.de> wrote:
>>>> commit 02d0a003d60326 [kernel.bbclass: Fix race condition] has surface=
d
>>>> a bug in the generation of the shared_workdir. The task
>>>> do_compile_kernelmodules adds the exported symbols of the kernel modul=
es
>>>> to the Module.symvers. By creating the shared_workdir before the modul=
es
>>>> are compiled, the symbols of the modules are missing in the
>>>> shared_workdir. Subsequent external module builds will not include the
>>>> ABI CRC of functions exported in modules. Modprobe will fail to load t=
he
>>>> external module if CONFIG_MODVERSIONS is enabled.\
>>>
>>> Have you seen our bug: https://bugzilla.yoctoproject.org/show_bug.cgi?i=
d=3D8127 ?
>>>
>>> It's new .. so probably not.
>>>
>>> The significant issue with this, is that we are now forcing anyone
>>> that needs the
>>> shared workdir artifacts to build kernel modules.
>>>
>>> That's performance issue for many workflows.
>>>
>>> I had some changes where I was working to short cut parts of the proces=
s, but
>>> they turned out to miss a few corner cases.
>>>
>>> We need to do more thinking on this one, before we can bring in a chang=
e like
>>> this .. since avoiding that overhead is something valuable.
>>
>> I agree that performance is important but correctness seems more
>> valuable for me. I think the optimization can come as a subsequent
>> patch ...
>
> Let's disagree on this point.
>
> There's time to get this right. We have a bug to track it, so we wont'
> release with
> the active bug, and this only hits a very tiny set of users.
>
> So we are going to step back and try and fix this right.

I hit send too soon. I have a suggestion in the bug already, so it isn't li=
ke
we are talking about letting this sit for weeks.

History shows that we are very unlikely to loop back and fix the performanc=
e
of perf or other builds once the change goes in. So in the absence of
other concrete suggestions, looking into some other small changes is a good
use of time.

Cheers,

Bruce


>
> Bruce
>
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

