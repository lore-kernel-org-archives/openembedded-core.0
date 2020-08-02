Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.4369.1596347339753790774
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2020 22:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b8ouscWv;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id 2so28459369qkf.10
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2020 22:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XcxHKMv1NWMTysYqkU8i3vdz5T7rrK34KbedueqJguo=;
        b=b8ouscWvRJPbzpDzKPw9xCT7d8oD58zovD+kTzNm7kgJ+v7CdfFTOF8Ro/jxTx1wfH
         g1N9sSfaBwJtEAhVH9q28cTLxXRXuNFLr8ryMMPmetsmcKrCQTPGr85HkYtyca0N2FHO
         Rr74Htb3epA12IsMMvYrgByt+Se38VgRFW+zOn+hBdmbBVXFulPZtXe9fj/OhtXXz5wv
         P2QmAvaF46XLQkXYQAKvFQXihRqpCa9H6+MKlDmf8kqqnuzywq9enO4jE7C89KSAhfff
         EQKKKaiUfKG29BnMnT/TFJ7Jnki6W4J9GowW46u0kwnYTpuu/2VK70/xk7xqdEcuZRSV
         JVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XcxHKMv1NWMTysYqkU8i3vdz5T7rrK34KbedueqJguo=;
        b=XydJ5Cm323ZAk4u7khyII8BZLjIWTH3YR4zDkuZt0DRXIvRtXFFNt3Yg9lQg0XRFYl
         pPDBXEdzbLWOZZyeQukZhpFjx0Y3EV4Zj+liYX2/M4BwkJde18Of5cleD+oyO+IoQdPB
         jeO6YGVjzXNBWkh/Gm8hEGsz3Gdx5pCxHc4/SIQJi/JkvzCTJ/PnsrzRGgOSJoLGhdCn
         z3678tRzxVD3LOu6hozJQdRKIRyOITqSTxz7BTVM6ipby/giSNmqcie1eZSjBNSRlBYj
         x1wDdhRc5H+T5h1VDHqYblsn3VV1UnQTGnqdDNooXKlPxMrBlgCBkBsNpNS6GZy0rT6u
         qnpw==
X-Gm-Message-State: AOAM530WJUplbi9Jq39RxMsFaseYeF9QZMhp/OJBxk2Ax1pj7BleU7gO
	B/hfR7K09ZgRudYfOtOiWQl2FZgdgFmn/17HlsU=
X-Google-Smtp-Source: ABdhPJxFEG2Xk8iE7+pa+7hoZfDJ1HmJ+mKvket2OAUe1EKuM0SsFmKvqq3gPHDcZvY7ASKDSQ4/wG6jhcgITUEVW4g=
X-Received: by 2002:a05:620a:565:: with SMTP id p5mr11496418qkp.215.1596347338895;
 Sat, 01 Aug 2020 22:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200730075343.2118722-1-raj.khem@gmail.com> <b239d09f8e3d55103fb5aef84b2aebf5b13a8817.camel@linuxfoundation.org>
In-Reply-To: <b239d09f8e3d55103fb5aef84b2aebf5b13a8817.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 1 Aug 2020 22:48:33 -0700
Message-ID: <CAMKF1sop58PPx6M8Xc4GrfvS9AvOHrVe_GwgEDk8_2-3FXDZ6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.35 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 1, 2020 at 3:12 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-07-30 at 00:53 -0700, Khem Raj wrote:
> > assembler supports dwarf-5 format line numbers
> > linker has -M -MP gcc-like option
> >
> > for detailed release notes see [1]
> >
> > [1] https://lists.gnu.org/archive/html/info-gnu/2020-07/msg00008.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> This patch looks to be the cause of the perf failures you mentioned to
> me on irc:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1225
>

I looked into the error a bit, it seems we need to backport a kernel
patch [1] to get this fixed

Bruce, Can you please schedule this backport and perhaps send kernel
updates for master which this patch
in

[1] https://github.com/torvalds/linux/commit/39efdd94e314336f4acbac4c07e0f37bdc3bef71

Thanks
-Khem
