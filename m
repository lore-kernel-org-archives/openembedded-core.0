Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3336C43334
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 17:01:24 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.527.1654102880749246371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 10:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jnJjlDpd;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id o10so3053798edi.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H21bSZyapEOWcVozOtD88l58kPH0J2CCt85H14c5Bko=;
        b=jnJjlDpdD+Tlo8LA3JGmBOC09bBcjzOkrYdNYgffzpSSGUrMgpYSvm8I8sPThnM7xB
         FncoLp7MAOuYYGI/18YMJ6v+f7xJXZAMJhZ5PrVhCzYkW+mVoNeX1itUZXGnc4XQFoYp
         iFpB8l+PByZxvJ7Aq21zdnFmi90BymoM4CzWMr8wB1B262HsnE1FGkhf0Mz6sz7ZG/oP
         62JyZYZsYwOgqIsWqfp4rpGlGVO27IUSx1cfEid+ltPDp+0bxRe1QuvfXXiU2lnl2TT8
         YlDKCvyGIUiT57JYy8GG+R7N4/w4NHNQVTjz6p/gIrtMgq8mn1rM0UaZYLup30BdFi31
         Emsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H21bSZyapEOWcVozOtD88l58kPH0J2CCt85H14c5Bko=;
        b=PqMTNAt1fQIS8WSlt7ZUbQV8tjKz2Zdqg+QsO3JBCM5n0CPI0yNCctQ79iPW5NN7lO
         FX0AT2614AnftF6duCatLuzRnU4pDBlg1QfUSb5ci8OBboXX/T1V91V1h9urwFXZmK9i
         6w3y+KBzX/gML58ahy7dcCJYzZG32xZ04w0HxkZic4LVzaNq4AqYmyhJJxMNM1Z74oqr
         558CWiyviplKPgEOdigK5Wp7jmutX6ZKs+SOcdsCnAz8Gr6gF1eCYbRbUQXQXXFUYwIW
         8JO79dzm0XTICd4yoZu15VdVZCbfxaDZ3oy5fnvxjiTAe4dUiGfROwKp5wGUPAW6CMBx
         sglw==
X-Gm-Message-State: AOAM531rN+yO6K39ATUnItNCKcAluPtAMfAvSBIdVkbM2P62tILI+Vam
	S6ANEZbzIVPfDr8xg0CfCeWgkYdqAIEHvzSqbaSfXA==
X-Google-Smtp-Source: 
 ABdhPJwunarpw2CLYJXLE2Om60kU2YfNxOpkVR4XDNerpZ+CjP1w5TIF14NyMK4p0OHnYJRggFztjgy1eKCXGCZahAE=
X-Received: by 2002:a05:6402:44e:b0:42a:6266:3f15 with SMTP id
 p14-20020a056402044e00b0042a62663f15mr742166edw.418.1654102879013; Wed, 01
 Jun 2022 10:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220525184852.3999906-1-Martin.Jansa@gmail.com>
 <CAOSpxdY=WZZfZNAEYQRyVG_jmE0=0_6xAH9fDCALMDjm=K9k6g@mail.gmail.com>
 <CA+chaQfSE-oiUxdSJxqCT-GjUP_KGA4dOvcD49xPqwez=ohhFg@mail.gmail.com>
 <CAOSpxdYXrnJRdc_NghthSexaq_R10h0=JBTfqPTP3TR7PbwGLA@mail.gmail.com>
 <3aea71febbe02c97dabec307ace0c4389d45d913.camel@linuxfoundation.org>
 <CAOSpxdYO+QJV64ugouK+Yw8M3VNKv=War5MQRo3JfT6EY8uLjQ@mail.gmail.com>
 <537cde730f1ed3450554e504141612d854ca4766.camel@linuxfoundation.org>
In-Reply-To: 
 <537cde730f1ed3450554e504141612d854ca4766.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 1 Jun 2022 07:01:07 -1000
Message-ID: 
 <CAOSpxdZByfRQ6OiWXWO2HQwmPUiRAihs06JVTGr-rJnzK21iuw@mail.gmail.com>
Subject: Re: [kirkstone][PATCH 1/2] gcc: Upgrade to 11.3 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Martin Jansa <martin.jansa@gmail.com>,
 openembedded-core@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 17:01:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166437

On Wed, Jun 1, 2022 at 6:32 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-06-01 at 06:21 -1000, Steve Sakoman wrote:
> > On Wed, Jun 1, 2022 at 6:10 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2022-06-01 at 05:29 -1000, Steve Sakoman wrote:
> > >
> > >
> > > Keep in mind that the test uses sstate to compare against so even that
> > > isn't a guarantee of identifying the issue.
> > >
> > > Did you try the strings comparison I suggested? Do you have the file
> > > section tables comparison (diff) I could look at?
> >
> > Are you referring to the section header info from objdump -h ?
> >
> > If so I've attached the a/b info, they are quite compact.
>
> Yes, I couldn't remember the option to objdump offhand. The diff looks
> like:
>
> --- /tmp/headersa.txt   2022-06-01 17:22:57.272277627 +0100
> +++ /tmp/headersb.txt   2022-06-01 17:22:43.972218408 +0100
> @@ -1,5 +1,5 @@
>
> -a/usr/lib/libwebkit2gtk-4.0.so.37.56.5:     file format elf64-x86-64
> +b/usr/lib/libwebkit2gtk-4.0.so.37.56.5:     file format elf64-x86-64
>
>  Sections:
>  Idx Name          Size      VMA               LMA               File off  Algn
> @@ -63,15 +63,15 @@
>                    CONTENTS, READONLY, DEBUGGING, OCTETS
>   29 .debug_abbrev 00c6ce64  0000000000000000  0000000000000000  921c9968  2**0
>                    CONTENTS, READONLY, DEBUGGING, OCTETS
> - 30 .debug_line   09025ee1  0000000000000000  0000000000000000  92e367cc  2**0
> + 30 .debug_line   09025ede  0000000000000000  0000000000000000  92e367cc  2**0
>                    CONTENTS, READONLY, DEBUGGING, OCTETS
> - 31 .debug_str    1820ba50  0000000000000000  0000000000000000  9be5c6ad  2**0
> + 31 .debug_str    1820ba50  0000000000000000  0000000000000000  9be5c6aa  2**0
>                    CONTENTS, READONLY, DEBUGGING, OCTETS
> - 32 .debug_line_str 0005d9f4  0000000000000000  0000000000000000  b40680fd  2**0
> + 32 .debug_line_str 0005d9f4  0000000000000000  0000000000000000  b40680fa  2**0
>                    CONTENTS, READONLY, DEBUGGING, OCTETS
> - 33 .debug_loclists 13d74aa2  0000000000000000  0000000000000000  b40c5af1  2**0
> + 33 .debug_loclists 13d74aa0  0000000000000000  0000000000000000  b40c5aee  2**0
>                    CONTENTS, READONLY, DEBUGGING, OCTETS
> - 34 .debug_rnglists 034c6c08  0000000000000000  0000000000000000  c7e3a593  2**0
> + 34 .debug_rnglists 034c6bf6  0000000000000000  0000000000000000  c7e3a58e  2**0
>                    CONTENTS, READONLY, DEBUGGING, OCTETS
> - 35 .gnu_debuglink 00000024  0000000000000000  0000000000000000  cb30119c  2**2
> + 35 .gnu_debuglink 00000024  0000000000000000  0000000000000000  cb301184  2**2
>                    CONTENTS, READONLY
>
> I'm a bit puzzled since usually the debug symbols are moved off to the
> -dbg package and yet they seem combined here with the library. What the
> above seems to say is that the debug_line, loclists and rnglists
> sections changed size, the rest changed offset (and we ignore
> gnu_debuglink since that is a checksum which would depend on the other
> bits).
>
> That would imply that some piece of code used to compile webkit has
> different line numbering on one system compared to another but
> generates identical code. You should be able to parse the debuginfo to
> get a filename and linenumber out of it but I can't remember how, I
> think I learnt to read dwarfish last time I did this :/.

I did a dump of the debug sections with objdump -g and got absolutely
huge output files that crashed all of the diff programs I tried.

I guess the next step is to split those files into smaller chunks and
diff those :-(

Have I mentioned how much I hate webkit-gtk?

Steve

