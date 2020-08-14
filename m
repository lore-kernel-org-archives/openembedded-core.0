Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.18588.1597414182094208474
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 07:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PRiwGuQT;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.65, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f65.google.com with SMTP id t15so6877922edq.13
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vJTlz1qHzxoz5/z8QkZuQqhTR/HCfvtt8a4hgjm1jS0=;
        b=PRiwGuQTfog2Q/Z05AzidSsGW58NP8dLuDOYrjEZbfi29MtExk5cTrO30IlauK2fie
         MD1jXsZ4SkJ4BFazG8k+RE29/d3k6CWDBde71bQRSm5hQVbCXha4WDd8RJFsx3LlGK0C
         4sJEjoboa77/c4O8vmZI3RBroFkibF5ecluX9cMFRnYPvBSlVHjjqYgRCLHtKK8LuIY2
         E6hpEuyKnX8ua6zwXhH603VeVOGfQWsEIZH2kALL2H/jSuO4Gl122y3eUrgkvATP14ZO
         F6SMl30LQFvZdqcKeHWIVvpKQ7q4Z+DcoYcWmBDdrmbb3yj4+9Lm7p+YdtAG6xox6ofB
         h1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vJTlz1qHzxoz5/z8QkZuQqhTR/HCfvtt8a4hgjm1jS0=;
        b=IrI0+yJ0apzCjBz/N4+/QuLpG4RlPRKbMYpvFm5O0ZDoH2WdLzQYJjUtWgHZ6hUgde
         bzDwRhPWyYpyNWP/TS6LJoijTsTnyhCsU8Ki/eQ+cmlVXd5T4oDc6Z87EG+zzOKNHYjY
         Z69nD4t6qxu6AY5SZBF0UKOnXGoBsP1JBozVbH1phaKovSWAHNOiI0GqClosR8LNr8nx
         OZ+IVw9R0c4bdhmcLA4leLbTOzXDiUF8pN0zP7W4nRpedicejPI7DSulDhCUEIX53sMr
         jO2wCZdho1n03YoDDsGEY5Yxj1KZcqLzRkzoQB92ewUQG9RWCJxwDHzlNwps0GQM5O20
         FdSQ==
X-Gm-Message-State: AOAM531sRS1FtJdGcjA6smmXy61WSNzHaF6dACqCGFVDbbdU4szHvLSx
	eiTkaPT77fvkNgg29tyRtSQrG4dLq4IMGntqrzY4wQ==
X-Google-Smtp-Source: ABdhPJwr65/bblDyLuPW4cP7G7aE2AqYu527bDxYqJIHSdKhCfu3kNmheZUvr0GvPVSUsKtHMs1ji3etDABH57mZtgM=
X-Received: by 2002:a05:6402:1a54:: with SMTP id bf20mr2409303edb.217.1597414180507;
 Fri, 14 Aug 2020 07:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAJdd5Ga76MMFdjqU3tZ1-3RFYv-b5Fak0nSC+bmGjp70uhGtLg@mail.gmail.com>
In-Reply-To: <CAJdd5Ga76MMFdjqU3tZ1-3RFYv-b5Fak0nSC+bmGjp70uhGtLg@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 14 Aug 2020 04:09:29 -1000
Message-ID: <CAOSpxdbngZFJcrMLxqRWgjoRxdQX+uza812GB4ZJt0CNPWQZZA@mail.gmail.com>
Subject: Re: Perl Storable.pm in non-arch directory (Bug #13946)
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 13, 2020 at 3:20 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> I spent some time digging into the build failures that Steve
> encountered ([1], [2]) when pulling in my patch to make the build fail
> if Storable.pm wasn't place in an arch specific directory. As it turns
> out, this may be a false alarm. I dug into the perl code and it
> appears that this change [3] (introduced for 5.31.3) moved the
> installation of Storable.pm from the base directory to the arch
> specific one. By my reading of the code and empirical evidence of
> diffing the build output, this happens because Storable.pm is no
> longer explicitly listed to be installed as
> '$(INST_ARCHLIB)/Storable.pm', and thus defaults to the arch-specific
> directory. Practically speaking, I believe this means that dunfell
> (with perl 5.30) should always have Storable.pm in the base lib
> directory, whereas master (with perl 5.32) should always have
> Storable.pm in the arch specific directory. I don't have any
> conclusions about what this means about our intermittent bug, but at a
> minimum I suspect my patch is not appropriate for dunfell.

This makes sense.  But what puzzles me is that while Fedora and
Centos builds triggered the directory test failure, Ubuntu and Debian
builds did not.

Any theories?

Steve


> [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1245
> [2] https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1229
> [3] https://github.com/Perl/perl5/commit/95173f94fe0c1b2b943af60e1f6c6e4c47b8a975#diff-03144331fb08a8b04b003b1a49659547L16
