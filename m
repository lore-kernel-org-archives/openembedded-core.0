Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.935.1612819366863577153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 13:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=IahrwJtQ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: mcroce@linux.microsoft.com)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	by linux.microsoft.com (Postfix) with ESMTPSA id 276572062D4C
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Feb 2021 13:22:46 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 276572062D4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1612819366;
	bh=7GCX2xKaSW70VEFVqyz3vmKbHcVr1LryunNBADqfJ2I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IahrwJtQjBqlO6qD+wu7ARndokrpavmRyxHZSStgWhvdz9BhMfCNiGSTls1/3e4zt
	 nBO4wS5+UkB3tarBhTTO+On8F59CcaXzM9pE8zLFngQg/4tXyGOqhvXx2LnjZ2uhvQ
	 4Ka+mK0slrbdgOCyk4MOOeBu3qLGvDTd9Wp9fnUU=
Received: by mail-pg1-f178.google.com with SMTP id r38so11055068pgk.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 13:22:46 -0800 (PST)
X-Gm-Message-State: AOAM531/35/H619aaf26fasc9lwm9XWjnXsX0LcBmzHgRi5SJDP5AyAG
	UqrRXoRPkUzwv5ZZZI3+FTxhhb2kb4Aqg4SBSFs=
X-Google-Smtp-Source: ABdhPJxX6UczpRV/EnfD4hAA76gQ+OolD7re9GfLZcoIbcYYnKvFpJoLCRxQ7B0pNOGY1lJ0Gjj5rjhK0DDDI9yDU6U=
X-Received: by 2002:aa7:8497:0:b029:1bf:47c6:523a with SMTP id
 u23-20020aa784970000b02901bf47c6523amr19779977pfn.0.1612819365628; Mon, 08
 Feb 2021 13:22:45 -0800 (PST)
MIME-Version: 1.0
References: <20210208181747.44789-1-mcroce@linux.microsoft.com> <CADkTA4P-kS6UdgDmT9J=FtWGy0Tmu28RtDtXHOg0M_J8z41vAQ@mail.gmail.com>
In-Reply-To: <CADkTA4P-kS6UdgDmT9J=FtWGy0Tmu28RtDtXHOg0M_J8z41vAQ@mail.gmail.com>
From: "Matteo Croce" <mcroce@linux.microsoft.com>
Date: Mon, 8 Feb 2021 22:22:09 +0100
X-Gmail-Original-Message-ID: <CAFnufp0ehmcRbLmZXPyG0s8guwyxHhaFXchATL0JRqTYMVPKNA@mail.gmail.com>
Message-ID: <CAFnufp0ehmcRbLmZXPyG0s8guwyxHhaFXchATL0JRqTYMVPKNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-kernel: add libbpf
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 9:13 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Mon, Feb 8, 2021 at 1:18 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >
> > From: Matteo Croce <mcroce@microsoft.com>
> >
> > Add a recipe to build libbpf from https://github.com/libbpf/libbpf
> > The only patch fixes a build issue, and it's already merged upstream.
>
> Thanks for the submission! I have a few comments / questions.
>
> To get this into oe-core, we should be commenting / documenting why it
> should be in core, versus another layer. The standard criteria is that
> there are enough varied users and that the functionality is common
> enough, that it belongs in core.
>

For sure bcc and bpftrace can use it, and maybe also perf.
In future even iproute2 will use it, as it has been ported to libbpf recently.
Feel free to propose another layer, in case you know a better one.


> There should also be some sort of oe-selftest for the functionality,
> otherwise, it is hard to detect breakages. Some sort of application
> that uses the library and that can be executed in qemu would be
> enough.
>

That's doable.

> What are the kernel requirements ? CONFIG_BPF is selected by other
> kernel configs (it has no menu entry, so it must be), is it that, or
> something else that is the requirement (classic BFP?). If that option
> is now always on, is that true for the reference kernel versions in
> master (5.4 and 5.10).
>

I'd say BPF_SYSCALL, which is the single entry point for al the eBPF routines.

> Finally, does this work across all the supported architectures ? if
> not, we'll need compatibility settings.
>

I tested it only x86 and aarch64, but it should be arch independent.

Thanks!
-- 
per aspera ad upstream
