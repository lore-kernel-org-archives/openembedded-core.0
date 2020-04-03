Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.7109.1585949673630022444
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 14:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WA1Snrpx;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id i186so786026qke.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 14:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yBksuf2coR96DG2NHAEE6udc7iExQHctPh+Ve6kM9q4=;
        b=WA1SnrpxMINYRa2mnucsDyFjP3N3+LhNXDm+fq/pGY21TxPo4xlOgmW5FDgsjqcXg7
         Miwv4cZUu5e5Vx5dHoLwyj6HmYgUDy9ZU3dQWjwC1NFEGV9h3BU+rF7KudR7y6hAKvcM
         hwDOHW59miXuSFktBF3tFHplKRhGX8S67tNqlXTmsPIjMCVRRH1gbdSna6A6wjsm8jj0
         CP12T7gm093XocXssk/b/UwKXEW8CQSL83OFlJ774UgEoql6tW0ZfvYUst9KMXN2s13/
         jQshzRyiKkBpOxnqHBXoQJgSx2YSD+m99LfnUSxXUcTpuCQgReecDFSig5kiZTv4vbQS
         FZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yBksuf2coR96DG2NHAEE6udc7iExQHctPh+Ve6kM9q4=;
        b=iSpba9n4+JJbqwb8wDLIrN936suJkNMcgvVhy9UIhWlzwsihFgREiLTXc5Pk1Vv4If
         tZcFJSEeDtTmZTqIOBu8FZieiaeK7EIv5/o8JIpHejT9hoHalN8wHPyi3kpofgHA2bKS
         4bAVDft6pRtdwd5kZhOKO0xs4HSqSJkBv7dZNYcWNNV0OKbr73J0kp7CWchK16oAiTBW
         MeIbMZNNdbdVbBZ8o17mJVwLDLiShFugw4F2sv4nCpyuLUHTabAIDW3+YlifeY9c/9xS
         Vmjw/Tj571WOeUGLhowXdA1qYIr280V4KrhCWm6rPkuFTOOXB0dD9/8WILg98tXmuCGX
         jrnw==
X-Gm-Message-State: AGi0PuZ1Yr4k5paHs82Bz9T+2b7RCQUU/mk40QTBb8qEJY8wVXRPu7VW
	H/nNPx2RpZjjs3d8i77JjDS5MBMzxdqZGCG2idA=
X-Google-Smtp-Source: APiQypKFrA5Ssioq6kSo7XpXYxs7XqJAsct+95iie7bpDhrecyGPzlz8Fpi3p70yhOMs85zw31IFcOapqduEPiKrg84=
X-Received: by 2002:a37:bd81:: with SMTP id n123mr11119098qkf.431.1585949672525;
 Fri, 03 Apr 2020 14:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200403015350.1002891-1-raj.khem@gmail.com> <dee2e56432928c971eb0f1512f5945d6af846b89.camel@linuxfoundation.org>
 <CAMKF1srEjB5cg57jWM2dVfESrf17M2diBB_5P4Ws3bgZgmhgig@mail.gmail.com> <9eed52a88b813418984822caaa6417d009417cb9.camel@linuxfoundation.org>
In-Reply-To: <9eed52a88b813418984822caaa6417d009417cb9.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 3 Apr 2020 14:34:06 -0700
Message-ID: <CAMKF1soLEpfbCUoT3ap_76fR-y6T3pBtJG52ixR-EAw7YziJ6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icu: Add knobs to generate a subset of ICU data
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Wouter Meek <w.meek@metrological.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 3, 2020 at 10:47 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-04-03 at 08:55 -0700, Khem Raj wrote:
> > On Fri, Apr 3, 2020 at 8:26 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2020-04-02 at 18:53 -0700, Khem Raj wrote:
> > > > Recent versions of ICU (64+) provides a tool for configuring ICU
> > > > locale data file with finer granularity [1]
> > > >
> > > > Default generated size for libicudata.so.66.1 is ~27M, which is
> > > > quite
> > > > large for embedded systems and all of them may not even need all
> > > > locale
> > > > data.
> > > >
> > > > This patch calls the icudata buildtool during configure on the
> > > > icudata
> > > > and utilizes a filter called 'filter.json` ( empty by default) to
> > > > create the data, default behavior should remain same but someone
> > > > can
> > > > add a filter.json in own layer to configure this data, e.g.
> > >
> > > Nice idea, fails on ppc:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/411
> > >
> >
> > yeah looking into it. Are there any other arch failures ?
>
> mips:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1749
> mips64:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1753
> edgerouter:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/414
>

Thanks, I think I understand the problem, its when target endianness
is bigendian
and the host is little-endian, I have sent a v2 which should fix it.
Give v2 a shot.

> Cheers,
>
> Richard
>
> 
