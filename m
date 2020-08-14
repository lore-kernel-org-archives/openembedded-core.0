Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.19389.1597416457694837530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 07:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dpls5Uzb;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id 184so8155237wmb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 07:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OXViDxGP88DbVd8zTGIYCWnGpmDX0UMK82ymbDZGo64=;
        b=dpls5Uzbjo/g0L8RPQI7+8g51i4gUV8dSLYrFdAGKeTQiZS6aYrdpiPsW/ZR3bHDKV
         ALryy2OdheKTt3OyqKn5Y4E9wQrDuaN+1KPh7wtQ/k2Vaixi2ooaQGL94/Jt2Y3z3Jyj
         FbDQ2tljXuZUpZuMyrKG+C47tthQuvAp4QeXXzXzdGnCuQ/W1rPlTzJ5shGqWw9mLPer
         UKJW1Sc4/6g4Eox11jKtb44E2Pc3N3DUgaqbd2iL3sqsOljWVJbLyC3TK8EWO1lz6MsB
         RtXgrCHSruEnP2EM7QB1aijQ9AAcqccOqlouyfPw+h4Hj8onN16cemk6b45o8Vk3QM3o
         PmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OXViDxGP88DbVd8zTGIYCWnGpmDX0UMK82ymbDZGo64=;
        b=jTTVis8me/ED+wDv6HZg/7dVWdp75G0jSNYpu+Ad0WUrRoRRS9tAlEGL01NUNKsMvO
         w62AA9VQ1nAPw1ykRZDzzfkvJB1ewSH6wt/O/kjo9ugmWkpmVJNVekzndUBdB+BpNrXw
         oWov9JfNN0F1gRMqtaOV5NX4dSMQKlp7JvYvFVYOj8ao24yCPGUTLFo2Xtf0M+i4grhm
         X7bOiw2FZdGCEx6oReNWA7R1xOwStzOLFY76V0dcpmMv8K6vew605pfxBAMfEIRufJjb
         xXBUreTtHY5LvIPS/PWUmZBx2T2llsCFCfww80gg5PT4j2I9L1Jy9hnSis3kf5iEm5jC
         gIkg==
X-Gm-Message-State: AOAM533s1jgbSXbaERl0TBYW5JNeDy9OM9qzPZ6abiXONu0ZvbeX7FjW
	tey4+hSq5Z7XaRnWGEgm8ArIVrBs3iFUaVfZ3us=
X-Google-Smtp-Source: ABdhPJw1bvTRL0hKcCCCibOcb3PSvbMWtKxr8SmNwfZ6+LZv0VQcLn97q1IHV8txPnY4HOAlUu2Qe7hMdLxfLoyy7pI=
X-Received: by 2002:a7b:cb4d:: with SMTP id v13mr3028133wmj.56.1597416456150;
 Fri, 14 Aug 2020 07:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAJdd5Ga76MMFdjqU3tZ1-3RFYv-b5Fak0nSC+bmGjp70uhGtLg@mail.gmail.com>
 <CAOSpxdbngZFJcrMLxqRWgjoRxdQX+uza812GB4ZJt0CNPWQZZA@mail.gmail.com>
In-Reply-To: <CAOSpxdbngZFJcrMLxqRWgjoRxdQX+uza812GB4ZJt0CNPWQZZA@mail.gmail.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Fri, 14 Aug 2020 09:47:25 -0500
Message-ID: <CAJdd5GaYYup3XE5aA31EVMATb435GwpTt_V3uaOC72d=fgxEug@mail.gmail.com>
Subject: Re: Perl Storable.pm in non-arch directory (Bug #13946)
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 14, 2020 at 9:09 AM Steve Sakoman <steve@sakoman.com> wrote:
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

That is an excellent question! Can we capture the build output from
one of the builder that passed?

>
> Steve
>
>
> > [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1245
> > [2] https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1229
> > [3] https://github.com/Perl/perl5/commit/95173f94fe0c1b2b943af60e1f6c6e4c47b8a975#diff-03144331fb08a8b04b003b1a49659547L16
