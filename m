Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.369.1589836871685177845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 14:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KXU/tlxX;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: andrey.z@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id v12so13444657wrp.12
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 14:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0E46g3qX4r2NO20ZlCjWsnhKlZe/LLQwNVFZhS6mSSQ=;
        b=KXU/tlxXjhZiG06i8S/KjW4ObDwMJSa9fLebWRExpb6NYCNgAbPZAM8OX6vqNP1ePd
         4zSEC0JViy7kM3jF2ge+waWlV8L/xKiDH+TV5xwoqSZUvDlhOo/L9GCWsIE49C82Nwx+
         zKXPH7+36TP0jpvApZvwIBjPNRl3DEApRV0iPu/dyhrXJAHegkNN29gOc3xfJO/ud/xH
         0Vh53T025RJDMJooQ9J0cNXgeG6JnXU/s2t0BXObxSdIQamHkGcewjHU+pzTKlxhMtK8
         XyrnwD5ISxeVqKUNgq8XeVLVaKoTRVnU/uQLW60jWXr+iSyM7e6VijJXvReFDfVN07NS
         EYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0E46g3qX4r2NO20ZlCjWsnhKlZe/LLQwNVFZhS6mSSQ=;
        b=iQmHbmYNAiBp5TaaDdrLk3wmQPEh2O0wEfsGr9HXzx0lk8Airl1WuidJmOdw6yYlZz
         A3014sFb2zi8ozWc8XqqjXznGuUISS4w5vqpoSxxyLfGfvw6PiAFw/h/Q3Pryj9XvuST
         zzueEZeQhp1zBue91NfDySrfJYK5WBUAZdoxKC8RqWTDlOWZfzpvGwoaJhWDMR9xLW4l
         3V+ebRHLpcCpThGYcwiLNGEPfVi9isDexdWOvpICU7oHrnsZBuLmCyCfvdDEls+V/5ls
         kSCNut0v9xpft6ZqkW0HFRvtJ1pud0zCP9sMfGrbkkxMiReR6jX55VfuRdPpia49Bquw
         5hCA==
X-Gm-Message-State: AOAM533QJGcwf2E3v9mesDGOrdgDXIE6gLfv8SH6DLzEJr5WKgeMdN0F
	JC3p/sX/367aWllp2m0GQ8FIV+2VuQ4hB4L2PQU=
X-Google-Smtp-Source: ABdhPJxyB1X+r/M072IkGYwycNvVCl9KQfWF2SWjI2FGBfFR1uj/C1jjDyhQRXIpqCqve1UZo77X9hElB2lQFzjSjmg=
X-Received: by 2002:a05:6000:1241:: with SMTP id j1mr21879289wrx.42.1589836870149;
 Mon, 18 May 2020 14:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200511182812.441561-1-raj.khem@gmail.com> <20200511182812.441561-3-raj.khem@gmail.com>
 <20200514152934.GC21399@localhost> <7111a5b8-12b5-d683-eb39-6661223697ad@gmail.com>
 <20200514181917.GA28774@localhost> <5f87e63e-d827-c615-44b7-0071b1e80694@gmail.com>
 <16103797E38CE61D.31744@lists.openembedded.org>
In-Reply-To: <16103797E38CE61D.31744@lists.openembedded.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Mon, 18 May 2020 23:20:59 +0200
Message-ID: <CAHtQpK5xXm2PxB5_aDAEpdkf4JLo99xddvZxivOicqoJx0UygA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Adrian Bunk <bunk@stusta.de>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 18, 2020 at 9:56 PM Andrey Zhizhikin via
lists.openembedded.org <andrey.z=gmail.com@lists.openembedded.org>
wrote:
>
> On Thu, May 14, 2020 at 8:22 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On 5/14/20 11:19 AM, Adrian Bunk wrote:
> > > On Thu, May 14, 2020 at 10:18:53AM -0700, Khem Raj wrote:
> > >> On 5/14/20 8:29 AM, Adrian Bunk wrote:
> > >>> Disabling -moutline-atomics would also workaround this issue.
> > >>
> > >> I think this is a good suggestion and I do not like to revert gcc patches if
> > >> we can avoid doing that. I will propose a fix to disable outline-atomics for
> > >> valgrind on aarch64
> > >> ...
> > >
> > > Not just for valgrind, globally.
> > >
> >
> > so far just doing for valgrind is enough. I am not averse to enabling it
> > globally but perhaps we need to do some pre-work to decide that, maybe
> > some benchmark numbers.
>
> FYI: I've just seen this issue on the [optee-os] as well, build fails
> with the same "undefined reference to `__getauxval'". Looks like it is
> not only about valgrind...
>
> Any chance anyone had the same problem and proposed fix?

Actually, setting [-mno-outline-atomics] seems to help here, as Adrian
suggested.

I'll see if this could be used further as a fix. Sorry for the noise.

>
> >
> > > The main effect in Yocto distributions is (slightly) slower and larger code.
> > >
> > > cu
> > > Adrian
> > >
> >
>
>
>
> --
> Regards,
> Andrey.
> 



-- 
Regards,
Andrey.
