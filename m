Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.7581.1585298826143148121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 01:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tLxgKq0M;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id l25so10009659qki.7
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nx1D703bZhAmKO/+9uQAVX33xZxIbvtcwBpip6GjCHk=;
        b=tLxgKq0MeL1GPMh0FtSkHdZOra+FzkVXrBxaxtCtX1EqnS2FhX6Ijsgp6LNVyZC4qn
         bP2uSIxYYM5lXwmgWLa+nZi8IcPnfnLAtlF+Mc7s/0m05P9HwDYPiZp1FPbe3dLJOToN
         LDa5VGgr8XXZjhj8TY9x7WsN8hQxN7SnCmxPdev2DORjibHUyhpBQw3BQNvTJx9APefA
         8N5MywGfzmOAPzsm9DrMd/D03lbnJCSS3KtBReniGkYRosuLTG3rNcBJUnzzuDkbTNbO
         2tQdp8hrMLZB703mnujwY0hqT3djl5CuApQdfg+Nzyw+NEkBpQ/qm8X39ciK/oHPlZQ1
         v75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nx1D703bZhAmKO/+9uQAVX33xZxIbvtcwBpip6GjCHk=;
        b=flgHLnZEfnW07E7TCfk9UIPl9IfGGvNSzQ3MaP+PdUpOawctgEQUt5LbutfEVPvRN7
         yGgseH+c04lotLtiVTmX37D2edXGYzB5sb5NoL7R8Avu83cKwHuBZ4Znj+9TGtEhWORe
         2OTE3NUl8K5GGc+1vc3BUBK4xVA1ULV8t8JGChMbXW6wdyq4+dTzqe11EbVu/uL8eQLw
         lOgGIbwHTjPxHH1TnqXNus1w/84eA8zcYyuCxhwX2vQxZ9QczfeeGEBJz6kfHlShVwrE
         lfzMK1kPqohLrtIbUvt06maT7v/VcqKpe7UwQA6qBGJtrOpwePK2i9BRtfPVTlqujP1L
         NA2Q==
X-Gm-Message-State: ANhLgQ3K+mCuLpeT+nDQT7svAxkAIgjXrQiEAZ0GoCv4xJkJ2cllY9Bz
	2bKyj634OIPuTQtJ+HjD6HtzVkCPFeBZ1Ez52wCHHlYs
X-Google-Smtp-Source: ADFU+vtjZDc+vz/ICz0aJwNhRwaxbw3v0rU+xmqODshy83oNmooM1CoDHELS1Nmj9YGKVzh+/rEmPNkMJAyoRQIy5sg=
X-Received: by 2002:a37:a746:: with SMTP id q67mr13262213qke.215.1585298824848;
 Fri, 27 Mar 2020 01:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200326062919.1929050-1-raj.khem@gmail.com> <20200326130754.GA17705@localhost>
 <CAMKF1sptRDswkw=GAsE-S0o-s1WHMFVdh1zO-oXuaSOhzsF5JA@mail.gmail.com> <CAMKF1spivW-WEtRJdBrbg5bvPHb7YBbcriJSdmHgWtCpsawauQ@mail.gmail.com>
In-Reply-To: <CAMKF1spivW-WEtRJdBrbg5bvPHb7YBbcriJSdmHgWtCpsawauQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 27 Mar 2020 01:46:38 -0700
Message-ID: <CAMKF1sq1fQa8tFULTft91miEA_yXd8OEw6B+at73XBQsXAeazw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Backport patch to fix ifuncs on risc-v and gcc10 builds
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 11:30 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Mar 26, 2020 at 10:09 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Mar 26, 2020 at 6:07 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > >...
> > > > + configure    | 2 +-
> > > > + configure.ac | 2 +-
> > > >...
> > >
> > > This shouldn't patch both.
> > >
> >
> > why ?
> >
>
> Yes, there were few more, so I have rather sent a new patch on top
>

well in glibc we do not configure inplace instead we use pre-generated
configure files
and we touch them specifically so they dont get regenerated. So this patch is ok

> > > cu
> > > Adrian
