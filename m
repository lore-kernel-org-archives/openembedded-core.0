Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web12.2871.1602109468703663268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 15:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qRChygIM;
 spf=pass (domain: konsulko.com, ip: 209.85.210.67, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f67.google.com with SMTP id t15so3817066otk.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 15:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lPwos6xl1Z5miUv/OB2/Hs22yfsC8EjtdcCY7Cr64Eg=;
        b=qRChygIMMntuFeezoWp2X6CWS/FWbMUY/HnK0kyeDG8hJEQ2EWs5oN2Nfbb+foRzZ/
         ckiCWunQZ9b2vhWi14NhBw+t68SEXyv5mjPQuJyu4wmH+5+zHS9vi6s8GxjP7sh3NuWM
         h0/SJr6qprDlpabxcwhAbRS5mTUP/qPPJOmTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lPwos6xl1Z5miUv/OB2/Hs22yfsC8EjtdcCY7Cr64Eg=;
        b=prn5GvAs9xk3VBG5yRBxiL0pbZaYHkbjTO8ViuqyOldLZFmwi7Ce9Jfa7vX631L7R6
         0c1afQtyvGQ5+Z17OEBkL/1ul6eiBEYfLRLwd3Q6qx/yFAgHpfVJDQwhZ7eSJb2tLEpD
         0JUtv0zcIiSOdWx0pxkVKvYD1cPnWxOk5F/hSjGkNCR03naJVN3Uf/swPdz2IrLVhMYT
         eeUrk+nTUQlIXJtxPPLuRaNL1awPOfiXOyqjX/QvKNcjwLibB2iJRIIztXI7j6Vjd9l6
         KSsL7f8HHpzoGCl99Noe38jWJh+cfSWAjqEpTTYdBnhYZ9YmaIcdoVfmb/Qv8t/Nokyo
         toNg==
X-Gm-Message-State: AOAM532ZYozsgjFSPS3ic/qQHfFa4uHHmsX9JvjxpGCs+MiOe02uuq6q
	GnYBvXEtgb61Af+Sc+44M+dS/h6pj240Ou97omcdBg==
X-Google-Smtp-Source: ABdhPJzSw5WIi2NlLLinWAZdl/dWlyGReE2oLSeXBYwEAvUKHeDInM4Gp8CJ7d2uydC0tXXXRjU3CJPojdoTadH0rQ8=
X-Received: by 2002:a9d:a24:: with SMTP id 33mr2849498otg.305.1602109467986;
 Wed, 07 Oct 2020 15:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201007203838.19096-1-kamensky@cisco.com> <20201007203838.19096-2-kamensky@cisco.com>
 <CAM9ZRVst-JLA3aOa+U2Sd1Cqj8ARsAyVhCu0Yhhk5we+FKsmdQ@mail.gmail.com> <b4f13cc3-8698-9186-3d99-2f7017ab9756@gmail.com>
In-Reply-To: <b4f13cc3-8698-9186-3d99-2f7017ab9756@gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 7 Oct 2020 23:24:17 +0100
Message-ID: <CAM9ZRVtvGrK2CH3CTB171Od_+OCMOHROgSixbZOpdKDpgNe13Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
To: Khem Raj <raj.khem@gmail.com>
Cc: kamensky@cisco.com, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2020 at 23:15, Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 10/7/20 1:46 PM, Paul Barker wrote:
> > On Wed, 7 Oct 2020 at 21:39, Victor Kamensky via
> > lists.openembedded.org <kamensky=cisco.com@lists.openembedded.org>
> > wrote:
> >>
> >> In Yocto Project PR 13992 it was reported that qemumips
> >> in autobuilder runs almost twice slower then qemumips64 and
> >> some times hit time out.
> >>
> >> Upon investigations of qemu-system with perf, gdb, and
> >> SystemTap and comparing qemumips and qemumips64 machines
> >> behavior it was noticed that qemu soft mmu code behaves
> >> quite different and in case if qemumips tlbwr instruction
> >> called 16 times more oftern. It happens that in qemumips64
> >> case qemu runs with cpu type that contains 64 TLB, but in case
> >> of qemumips qemu runs with cpu type that contains only
> >> 16 TLBs.
> >>
> >> The idea of proposed qemu patch is to introduce fictitious
> >> 34Kf-64tlb cpu type that defined exactly as 34Kf but has
> >> 64 TLBs, instead of original 16 TLBs.
> >>
> >> Testing of core-image-full-cmdline:do_testimage with
> >> 34Kf-64tlb shows 40% or so test execution real time
> >> improvement.
> >>
> >> Note for future porters of the patch: easiest way to update
> >> the patch and be in sync with 34Kf definition is to copy
> >> 34Kf machine definition and apply the following changes to
> >> it (just change 15 to 63 of CP0C1_MMU bits value)
> >>
> >> [kamensky@coreos-lnx2 qemu]$ diff ~/34Kf.c ~/34Kf-64tlb.c
> >> 2c2
> >> <         .name = "34Kf",
> >>>          .name = "34Kf-64tlb",
> >> 6c6
> >> <         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0C1_MMU) |
> >>>          .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |
> >>
> >> Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
> >
> > Forgive my ignorance as to the range of MIPS processors available but
> > does any real MIPS CPU have 64 TLBs? If such a CPU model exists
> > shouldn't we be using this instead of inventing a new model?
> >
> > I'm a bit worried that targeting a unique, fictitious CPU model will
> > lead to us wasting time debugging obscure failures that other projects
> > have never seen and that would never occur on real hardware.
> >
>
> there are many assumptions in various qemu machine emulations, this wont
> be the only one, so I am less worried about that.

I think between Khem, Victor and Richard's responses my concerns have
been answered.

Thanks for the contribution and analysis Victor.

-- 
Paul Barker
Konsulko Group
