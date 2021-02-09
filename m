Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.13738.1612890187430038448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 09:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ALRSUdze;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: mcroce@linux.microsoft.com)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id CD89F2075FF5
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Feb 2021 09:03:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CD89F2075FF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1612890186;
	bh=ykisvCnps0t1Ch9krtWYiym1VsB84/0Otgxyp50lhuo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ALRSUdzezSoCVTcx1iZAo6TtIINZZkWJRwK4LnNhDubEYfF69fnAs12JLfcylRE9w
	 OvzXTrPh57JUWcYSkFmTy/n4UKBE6CGELR76b3C6RHu4MKlNtxVtNmY61tzSrg/yXr
	 EXzDLfGPfFdbRiWGc106ppRgDWbX/dU2JdX/90+8=
Received: by mail-pj1-f49.google.com with SMTP id e9so2030549pjj.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 09:03:06 -0800 (PST)
X-Gm-Message-State: AOAM530c6+gbqZysPkzGUp12lBntzApJJ1YptU8hZXtOayStaq+jh9f5
	f/XQJjBsIYTds6mWv81JYprqBJXLZDF+5XBhA+I=
X-Google-Smtp-Source: ABdhPJz79myI6V/XtySeJYg3JowQbFIU72leuv0YeyoGM7lBb51unJdmX2LhTLMTtXvGK1RN86WVGqdiumSSd8yQkRg=
X-Received: by 2002:a17:90b:104c:: with SMTP id gq12mr4951367pjb.11.1612890185248;
 Tue, 09 Feb 2021 09:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20210208181747.44789-1-mcroce@linux.microsoft.com>
 <CADkTA4P-kS6UdgDmT9J=FtWGy0Tmu28RtDtXHOg0M_J8z41vAQ@mail.gmail.com>
 <CAFnufp0ehmcRbLmZXPyG0s8guwyxHhaFXchATL0JRqTYMVPKNA@mail.gmail.com>
 <CADkTA4OyrJa19z57OJDvo-Si2cjjkO5AH+e9JQ1P5cWtQUKRQw@mail.gmail.com> <CAMKF1sonXQZL0ML=HPmyHdfV=A7fR_XumuhLd7YMBCLJ1JkZ+g@mail.gmail.com>
In-Reply-To: <CAMKF1sonXQZL0ML=HPmyHdfV=A7fR_XumuhLd7YMBCLJ1JkZ+g@mail.gmail.com>
From: "Matteo Croce" <mcroce@linux.microsoft.com>
Date: Tue, 9 Feb 2021 18:02:29 +0100
X-Gmail-Original-Message-ID: <CAFnufp1xNs9_KweTtx62HJdUc37VV1XmZ3=KRv0vYCjJ62kBug@mail.gmail.com>
Message-ID: <CAFnufp1xNs9_KweTtx62HJdUc37VV1XmZ3=KRv0vYCjJ62kBug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-kernel: add libbpf
To: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 5:44 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> fails to build for rpi4 here
>
> https://errors.yoctoproject.org/Errors/Details/570276/
>
> On Mon, Feb 8, 2021 at 1:34 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Mon, Feb 8, 2021 at 4:22 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
> > >
> > > On Mon, Feb 8, 2021 at 9:13 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > >
> > > > On Mon, Feb 8, 2021 at 1:18 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
> > > > >
> > > > > From: Matteo Croce <mcroce@microsoft.com>
> > > > >
> > > > > Add a recipe to build libbpf from https://github.com/libbpf/libbpf
> > > > > The only patch fixes a build issue, and it's already merged upstream.
> > > >
> > > > Thanks for the submission! I have a few comments / questions.
> > > >
> > > > To get this into oe-core, we should be commenting / documenting why it
> > > > should be in core, versus another layer. The standard criteria is that
> > > > there are enough varied users and that the functionality is common
> > > > enough, that it belongs in core.
> > > >
> > >
> > > For sure bcc and bpftrace can use it, and maybe also perf.
> > > In future even iproute2 will use it, as it has been ported to libbpf recently.
> > > Feel free to propose another layer, in case you know a better one.
> >
> > That's not for me to propose . that's for you to sort out.
> >
> > A quick check of the layer index would show that other bpf tools are
> > in meta-oe.
> >
> > >
> > >
> > > > There should also be some sort of oe-selftest for the functionality,
> > > > otherwise, it is hard to detect breakages. Some sort of application
> > > > that uses the library and that can be executed in qemu would be
> > > > enough.
> > > >
> > >
> > > That's doable.
> > >
> > > > What are the kernel requirements ? CONFIG_BPF is selected by other
> > > > kernel configs (it has no menu entry, so it must be), is it that, or
> > > > something else that is the requirement (classic BFP?). If that option
> > > > is now always on, is that true for the reference kernel versions in
> > > > master (5.4 and 5.10).
> > > >
> > >
> > > I'd say BPF_SYSCALL, which is the single entry point for al the eBPF routines.
> >
> > Yes, that's the core support, and a selftest would ensure that the
> > reference kernels can support the package (they can, but we still need
> > the test) and implicitly document that requirement.
> >
> > >
> > > > Finally, does this work across all the supported architectures ? if
> > > > not, we'll need compatibility settings.
> > > >
> > >
> > > I tested it only x86 and aarch64, but it should be arch independent.
> >
> > Then it should be limited to where it has been tested, otherwise, the
> > burden falls to the oe-core maintainer, which we don't want.
> >
> > Bruce
> >
> > >
> > > Thanks!
> > > --
> > > per aspera ad upstream
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > 
> >

Hi,

to let bcc use the libbpf dynamic library, you need to backport some
commits from upstream:

This one which I recently pushed:
https://github.com/iovisor/bcc/commit/6b4222cd41b3f5e833307aeff2b10c6b084d3f4f

And these from Luca:
https://github.com/iovisor/bcc/commit/e46997e9a43d512b6a5d01aae1a4566fd147b7b9
https://github.com/iovisor/bcc/commit/300296a598613912df5dc61f4b327b7102e52011
https://github.com/iovisor/bcc/commit/1cb5026e6f1d8dc7ca115cae579be4c53bec0c9e

And you need to pass to cmake some extra flags.
I have both bcc and bpftraf working with dynamic libbpf, I will share
my changes to the bcc recipes once libbpf is merged.

Regards,
-- 
per aspera ad upstream
