Received: from mail-lb0-f171.google.com ([209.85.217.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1USTZ1-0002Sx-RJ
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 16:42:47 +0200
Received: by mail-lb0-f171.google.com with SMTP id v10so1674998lbd.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 07:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=8TEEjpXs7F68IkYwSySrIXD5iFNDAQJ6oDSrPztYHwU=;
	b=InxiRKPzCkeuoq/DIEDe9r+G6ykzCzqUVL2OJUuVK+POoPyb/Nu5BYu7AtIwJ+xWcL
	4VVe2nLQ5D5SkkxoNFPqy5OiAKA0nIDXeXn4aTTG4XWDPgAy4DPe8cT0tSzq07u7cekd
	sup1HlQYBXoczarPsBQ5aSsZQO+eHH9H6Sn1Mu6WS6DwH2xZII4DOGJ8O6+gSX6vMAJO
	SuanqH5UVMJh5Mmvh2SEncW3FFOjVE8EXCUcqBUMnzViue0A9hqIK695dAPLq11Gr+Z/
	KtUel3vIfNUnlCW4oxS1XzOuYA9nUC5ZexEulJ8FGzxde2/C2w1M+8D1yR4ajdsk7w6R
	rXFw==
MIME-Version: 1.0
X-Received: by 10.112.61.6 with SMTP id l6mr3690943lbr.57.1366208692051; Wed,
	17 Apr 2013 07:24:52 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Wed, 17 Apr 2013 07:24:51 -0700 (PDT)
In-Reply-To: <516EAC25.40109@mentor.com>
References: <1366200612-22469-1-git-send-email-sergey_matyukevich@mentor.com>
	<CADkTA4Mrw50x2SXjwpug9QA-VgwpQZrAH6OpbU-F+SB2-G0uPw@mail.gmail.com>
	<516EAC25.40109@mentor.com>
Date: Wed, 17 Apr 2013 10:24:51 -0400
Message-ID: <CADkTA4OtauLj35mvDnO7Z3GAZhVebbCB1bzdyy2f=M+Oj2HCBA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Sergey Matyukevich <Sergey_Matyukevich@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] map_kernel_arch: x86 sub-architectures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 14:42:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 17, 2013 at 10:05 AM, Sergey Matyukevich
<Sergey_Matyukevich@mentor.com> wrote:
> Hello,
>
>
>>> Suppose we build software for x86 targets on x86 build hosts. There are
>>> use-cases
>>> when it is not enough to specify x86 as a kernel architecture. It is
>>> necessary
>>
>>
>> What are the details of the use cases ? I've never run into this myself,
>> and
>> almost no parts of the kernel build infrastructure differentiates between
>> x86 and x86_64 .. so I'm curious to know what is breaking.
>
>
> So far we observed this problem in two cases:
> - build systemtap modules for x86_32 target on x86_64 build hosts
> - build virtualbox-guest modules for x86_32 target on x86_64 build hosts

I'm still interested in drilling down on the details. If the build of
those modules
is being influenced by the build host vs the target kernel, that's a form of
host contamination in my book.

i.e. so with this change you are setting TARGET_ARCH more precisely, but
that's going to impact the kernel build itself, and the current x86 is exactly
what other layers and recipes would expect, as does the kernel build.

With the more specific setting, clearly the builds of the modules you mention
make use of it, is it that they are currently seeing 'x86' and defaulting to
64 bit ? I'd expect that they could be patched to look at the staged kernel
source or the .config to determine something similar, and the change would
be more isolated. I'm guessing, since as I said, I haven't run into these myself
and haven't gone to crawl the code yet.

Adding a return value of i386 now is also a interesting, it currently
isn't returned,
and doesn't really mean anything useful to the kernel build anymore.
It's strictly
compatibility. Why doesn't a return of 'x86' work in any case that you are
returning i386 ?

Cheers,

Bruce

>
> Sergey



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


