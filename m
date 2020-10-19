Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web12.110.1603122532493715546
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 08:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W/myoB3W;
 spf=pass (domain: gmail.com, ip: 209.85.219.196, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f196.google.com with SMTP id c129so4966624yba.8
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 08:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jAqI18hK4uFyGXCgAWo9HLRXmu6mKT5GW4MglN6kG7M=;
        b=W/myoB3WuNwEoLyYal+HGMYAxdOmrgKKH+Eoxdd+4JG9FpHhlXCBy1UhsOzjwydTZZ
         28ekVT9SOIeQBOo2E16/g+jOecrkcz0FxwGX7+eEhVOPKrKh/gpRvQdqR5uQONYqt/9e
         8yC4tPkIoeu66SCnukOJ6URl4Hf7wE1wmJwCCYuvmd3DSplaF5vdcJp6PkiZ5CM109VP
         xpf2Znh9pVVXhfA7209+ACFgOb4ID7wkBauI/JR1t5bYGEnHGqBOODdw/sT2x4wtCpR1
         JkF4ONuvxcioI22JDrdlG08q2iIdpgywzmbbLsCYmF8O/sZTu1B45/LEQjU8JTSjx6QG
         77Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jAqI18hK4uFyGXCgAWo9HLRXmu6mKT5GW4MglN6kG7M=;
        b=YfgtqGuBlYM9Q0f7isVUmk/NTOppOPe+SfmntZZUv8QVT5ekFXA0Y9cwbCxN6EY+J5
         1dmdLfeMTW7Ko+h7tgOBqLcUp4Jw92tyA/H5nz4g++xKB0BxhYt0v0oeELz95sneIUc9
         oAht8QAM6fjBQ7sYSMoKIJVXaNuKOiJqd7bFTmRUmhiXdXDcpSf5dTGDwt9he+Jnb2bv
         WHCk4dzLQFrTTaK/mzmsqsXPvnRbAg4JA/85+oJ5jvAfZ0PKXzShy96vembuS7rmZKrR
         BcqaJkhAUfdDzLtet5OiDe3wUUqwJ3Z9TxlLFPfqLfMTqiBqqqT/6eoycJChD6PFrB5L
         i6NA==
X-Gm-Message-State: AOAM5338P9eRCH5dXX7zwlt4S7bwMdk7yYJcst9V55PjqhWJPcdK046/
	G2IjZ1wTRnPHj9oaj05zi7nsFJPhJtd6YyPF9AQ=
X-Google-Smtp-Source: ABdhPJyVFbzRtR5uqpAHh7z0vpwp1NonQqpLIIIcNbCZTrAgp9LQ29phUB13AoSE1cogT+ZfDETPZswGzIOjOZYmfn0=
X-Received: by 2002:a25:cec7:: with SMTP id x190mr345120ybe.513.1603122531561;
 Mon, 19 Oct 2020 08:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602771116.git.steve@sakoman.com> <464f9f50bce368fb5109a5d7cc06cc25b0bfbe6a.1602771116.git.steve@sakoman.com>
 <ce3f803cce21cd9ca80c4701c3ede32a8c2ee10c.camel@linuxfoundation.org>
In-Reply-To: <ce3f803cce21cd9ca80c4701c3ede32a8c2ee10c.camel@linuxfoundation.org>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 19 Oct 2020 05:48:40 -1000
Message-ID: <CAGDS+nkAJRozTjLXuDMB_EQq6L5-25HnGG-XumDYS86FC83k=g@mail.gmail.com>
Subject: Re: [OE-core][dunfell 7/8] qemu: add 34Kf-64tlb fictitious cpu type
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 18, 2020 at 4:27 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-10-15 at 04:15 -1000, Steve Sakoman wrote:
> > From: Victor Kamensky <kamensky@cisco.com>
> >
> > In Yocto Project PR 13992 it was reported that qemumips
> > in autobuilder runs almost twice slower then qemumips64 and
> > some times hit time out.
> >
> > Upon investigations of qemu-system with perf, gdb, and
> > SystemTap and comparing qemumips and qemumips64 machines
> > behavior it was noticed that qemu soft mmu code behaves
> > quite different and in case if qemumips tlbwr instruction
> > called 16 times more oftern. It happens that in qemumips64
> > case qemu runs with cpu type that contains 64 TLB, but in case
> > of qemumips qemu runs with cpu type that contains only
> > 16 TLBs.
> >
> > The idea of proposed qemu patch is to introduce fictitious
> > 34Kf-64tlb cpu type that defined exactly as 34Kf but has
> > 64 TLBs, instead of original 16 TLBs.
> >
> > Testing of core-image-full-cmdline:do_testimage with
> > 34Kf-64tlb shows 40% or so test execution real time
> > improvement.
> >
> > Note for future porters of the patch: easiest way to update
> > the patch and be in sync with 34Kf definition is to copy
> > 34Kf machine definition and apply the following changes to
> > it (just change 15 to 63 of CP0C1_MMU bits value)
>
> There is discussion upstream about just changing the tlb to 64 for this
> machine. I'd suggest we hold off this for dunfell until its resolved
> there.

OK, I'll remove these two patches from the pull request.

Steve
