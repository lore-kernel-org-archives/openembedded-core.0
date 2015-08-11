Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB007695E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 13:06:29 +0000 (UTC)
Received: by ykdt205 with SMTP id t205so85277730ykd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 06:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=01But+HzXd9ztoaKCzSrvdsdsGnarWmPO4zaT/EH7Mc=;
	b=SqLqWE2wO6tZAC1VRSDrFSWm25d+4E1MKqjHxHk0ADwziJRLBjX1CmUZFcnTpsxWD1
	FphJQXLl14jMYpaMknVoiMv36K9Z5J55ohd9JKYIYRXasqrQLQ55wsfOsYjlXkbCGe7Q
	Zr4MddApH+HL1yklVDseCvw2gGHIWzcq3HaAEj47IP52Hn+VrPycDAAlGYPEzcxe2vsd
	hc3bVXRolVNdel2+eZ1QG8uyfX11UvqEAWWcZYe/8CA1ZpWBHBNt8OGbwU40fKtGbqkA
	bgdOfqGB5uQFGbLq78l0dHyqOcjx34Ha36wu3PAh1eYmW2KSUlhvChBVmqd/znfhlnym
	mbdw==
MIME-Version: 1.0
X-Received: by 10.170.99.196 with SMTP id q187mr27257350yka.123.1439298388791; 
	Tue, 11 Aug 2015 06:06:28 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Tue, 11 Aug 2015 06:06:28 -0700 (PDT)
In-Reply-To: <CAP9ODKqqG=gsUdoswgSMz6TpDYBXqeekFnS+FC3YhRveRUy0QA@mail.gmail.com>
References: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
	<CADkTA4NL2Lz08PzmNhW1d9MiQhezDkmo5FwxpgG851Mc7Wffzw@mail.gmail.com>
	<CAP9ODKqqG=gsUdoswgSMz6TpDYBXqeekFnS+FC3YhRveRUy0QA@mail.gmail.com>
Date: Tue, 11 Aug 2015 09:06:28 -0400
Message-ID: <CADkTA4NT0YO_25Wz9+KfmdBZEkH=HFE+G2Ljyt1og-bgCu35pA@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Aug 2015 13:06:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2015 at 8:47 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Tue, Aug 11, 2015 at 12:23 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Mon, Aug 10, 2015 at 11:21 AM, Stefan M=C3=BCller-Klieser
>> <s.mueller-klieser@phytec.de> wrote:
>>> commit 02d0a003d60326 [kernel.bbclass: Fix race condition] has surfaced
>>> a bug in the generation of the shared_workdir. The task
>>> do_compile_kernelmodules adds the exported symbols of the kernel module=
s
>>> to the Module.symvers. By creating the shared_workdir before the module=
s
>>> are compiled, the symbols of the modules are missing in the
>>> shared_workdir. Subsequent external module builds will not include the
>>> ABI CRC of functions exported in modules. Modprobe will fail to load th=
e
>>> external module if CONFIG_MODVERSIONS is enabled.\
>>
>> Have you seen our bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D8127 ?
>>
>> It's new .. so probably not.
>>
>> The significant issue with this, is that we are now forcing anyone
>> that needs the
>> shared workdir artifacts to build kernel modules.
>>
>> That's performance issue for many workflows.
>>
>> I had some changes where I was working to short cut parts of the process=
, but
>> they turned out to miss a few corner cases.
>>
>> We need to do more thinking on this one, before we can bring in a change=
 like
>> this .. since avoiding that overhead is something valuable.
>
> I agree that performance is important but correctness seems more
> valuable for me. I think the optimization can come as a subsequent
> patch ...

Let's disagree on this point.

There's time to get this right. We have a bug to track it, so we wont'
release with
the active bug, and this only hits a very tiny set of users.

So we are going to step back and try and fix this right.

Bruce

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

