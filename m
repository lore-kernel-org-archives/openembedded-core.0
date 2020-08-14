Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.1309.1597426487130605243
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 10:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XuWSBVv1;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id p25so9085806qkp.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 10:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tFino2R42ukF4MU4IrkZnODp5l/rZMV22fCc02/UhCk=;
        b=XuWSBVv1jpiag+0QjfHGIqq0SZFWRVfgPGpyWA+jcrvQR02uLkgJep8Zez93umyJ2W
         gXtf1APD1X7rgrWMR5EvGQkxpD6ZCodcGvxyod5AB3dbATiJ//ZK6hYGgp4DFkr4gs4M
         ZTdMkma3rq2FSRYczcVX7q3E2z9bU4gZsF4E+DguzPVP3Vt2MOHa4+18QaJCB1oNI1gM
         oTGVcKgdzH2EdHXfnBr3j2SgUUSZrwfhHeGPi4ptelwNN9srT9Gc4/Y7vedALram7Iir
         Dmp3Geo+cbN27rzffsY+5cpQNxrSVh2LEJeNLRfQ5d928eK/kAGq7Wma6LltoPbICC2C
         q74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tFino2R42ukF4MU4IrkZnODp5l/rZMV22fCc02/UhCk=;
        b=pmm8PLuXwuofOmqQNHN9ajhC2rIBspLPTl9NP0tzf/Iuokqn2JmLNeF0kKr50z6QB/
         VsYmrpw5Q39M7xs1m5GB4crkB+kPj5SVKsRjM73Q4N/rxVBntesuWrOMquJtdVgJlTDH
         saFXKANrtseaH0zAIVW0tRDWnMvaao5PKyISCC4kOew7mqJEs/wLLAZifI4OEaIq0Hyn
         rcU1VDo8dXIeETK4Us+Hnyq5hxRoCW3qe5CtpZnss5pq2uweK56i7CnTHP6fGFjj7o2t
         10Nl3t1dEqzAslRgXflnHU+2zoRmHkswJ5WMoZJwuvoxpjt1I6HLcQdrE7LkjkvDaVmH
         SNIQ==
X-Gm-Message-State: AOAM531GsNQAhf9duuiFUnZFiKd8/rRELBqoyaprYcchVmnakKtesTI5
	Su00G4MrV1yNl0zcufEGGUbGBq0vwEv6wghYjN8=
X-Google-Smtp-Source: ABdhPJyXLpkvbb9BDKQfyA/eYnyT1RuQp5pZffUvbaoXSsek8+DrFmKaAk/tOZJ5jRfQZ1OWW+2Pvh/W0LhXVHtg5F8=
X-Received: by 2002:a05:620a:565:: with SMTP id p5mr3067074qkp.215.1597426486036;
 Fri, 14 Aug 2020 10:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAJdd5Ga76MMFdjqU3tZ1-3RFYv-b5Fak0nSC+bmGjp70uhGtLg@mail.gmail.com>
 <CAOSpxdbngZFJcrMLxqRWgjoRxdQX+uza812GB4ZJt0CNPWQZZA@mail.gmail.com>
In-Reply-To: <CAOSpxdbngZFJcrMLxqRWgjoRxdQX+uza812GB4ZJt0CNPWQZZA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 14 Aug 2020 10:34:19 -0700
Message-ID: <CAMKF1spC6en=3emAbmDwODmYh1HJ32VLHMbV8hZwGA30YB08hg@mail.gmail.com>
Subject: Re: [OE-core] Perl Storable.pm in non-arch directory (Bug #13946)
To: Steve Sakoman <steve@sakoman.com>
Cc: Joshua Watt <jpewhacker@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 14, 2020 at 7:09 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Thu, Aug 13, 2020 at 3:20 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > I spent some time digging into the build failures that Steve
> > encountered ([1], [2]) when pulling in my patch to make the build fail
> > if Storable.pm wasn't place in an arch specific directory. As it turns
> > out, this may be a false alarm. I dug into the perl code and it
> > appears that this change [3] (introduced for 5.31.3) moved the
> > installation of Storable.pm from the base directory to the arch
> > specific one. By my reading of the code and empirical evidence of
> > diffing the build output, this happens because Storable.pm is no
> > longer explicitly listed to be installed as
> > '$(INST_ARCHLIB)/Storable.pm', and thus defaults to the arch-specific
> > directory. Practically speaking, I believe this means that dunfell
> > (with perl 5.30) should always have Storable.pm in the base lib
> > directory, whereas master (with perl 5.32) should always have
> > Storable.pm in the arch specific directory. I don't have any
> > conclusions about what this means about our intermittent bug, but at a
> > minimum I suspect my patch is not appropriate for dunfell.
>
> This makes sense.  But what puzzles me is that while Fedora and
> Centos builds triggered the directory test failure, Ubuntu and Debian
> builds did not.
>
> Any theories?

since you asked for theories here is one :). The perl patch seems to
be sensitive to flock

defined(HAS_FLOCK) || defined(FCNTL_CAN_LOCK) && defined(HAS_LOCKF)

And its happening on redhat like systems, I wonder if perl-native is
being built without flock on
them whereas its being detected properly on debian-like systems.
>
> Steve
>
>
> > [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1245
> > [2] https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1229
> > [3] https://github.com/Perl/perl5/commit/95173f94fe0c1b2b943af60e1f6c6e4c47b8a975#diff-03144331fb08a8b04b003b1a49659547L16
> 
