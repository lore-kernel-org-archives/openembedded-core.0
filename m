Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.224.1585242259042009552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 10:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ONCS7Flb;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id t17so5973782qtn.12
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 10:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vzFJMR/7hVHKzuKEis8pqUNTrv48g2TB4lV4kdHw7FA=;
        b=ONCS7Flb5ELJbzxSbXOM81Bv6hA5AhvmLqGkqtryjq0ieGLDPqsTo38fokOHGY0UgG
         vPi7XW0/peebMxtCqX9Zl7teTv3I1umXntMIARwLU6egXLAznxCTVYPpTyjw4XCYj557
         SNIgLG5JqVNcpIhUrNT/z7O3g/XcszmjdNsCBEczDgfnWDhPD53TfPYscBkyywl2LGfo
         aTOKhdKEQk1V6LuX/GJhFNVe5RvGHKyODKAI3jAL0k/DsfAR7btbazPjlbq7nI5Yn3C3
         lGJsrTTZ9rRVebU8cyfbkSjC/f4rpb0HmWvzBfbzWX6P8KyhC0ZR/QZNPJArwoFEEYCa
         AEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vzFJMR/7hVHKzuKEis8pqUNTrv48g2TB4lV4kdHw7FA=;
        b=W7W4J15cT4P+QRJdjvfiYbMHrZj4tu1+pg6Y5DNAsG1Q4JV1ExiwJwczzElIH+GxXe
         XeXk6onbzDRnQlMJx1JXKB7ld55lD0oKcUd4iOAHeJItrhmo0C7miKMR5UBjYrLtCdcI
         dmn0dUH+lLsiuhdHGQ9Ed2oiL5JVRaFz/Ht5BgrQOFgoHZjaP+FaNCZs9G/02vTy/7cv
         36JxtuQe3v3qtqBfrXwLar41LTfrpKz3mYvcFOo34ag0beXRF99NwiHjcEQKdDwSZcPr
         KBFW99/8FDhosvOnsOZhaCyAvckBq9AyWMhkw/yRJbFPWiFFyu5qthXYfVyeohlFBdm9
         rRHw==
X-Gm-Message-State: ANhLgQ1s2RvsUbnV7PI/rBYkMjP8CacbPUERFT3tW1aKMoKwaq2+ZLhF
	smNJsBLuVJRutL3H76X6ykF3is4YisB9AMR5NeE=
X-Google-Smtp-Source: ADFU+vvDiBKfqoegO6gScQVsizxOGxwr4+sAsXk1yPQOTJGr/tGm/wAH/x5ykZWq+nJYgo2pxfJQg5/iUNhf0YVXk9A=
X-Received: by 2002:ac8:17f9:: with SMTP id r54mr9277543qtk.285.1585242257865;
 Thu, 26 Mar 2020 10:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200325231637.802324-1-raj.khem@gmail.com> <9c14fe5a594e1edd4cb678340ec27859ba9df864.camel@linuxfoundation.org>
In-Reply-To: <9c14fe5a594e1edd4cb678340ec27859ba9df864.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 26 Mar 2020 10:03:49 -0700
Message-ID: <CAMKF1srYNHp7hNBzuTcgxHDAnA7rsu=53Qs8YyaE+tCxfd26Rg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Pregenerate autoconf files
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 5:45 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-03-25 at 16:16 -0700, Khem Raj wrote:
> > libtool patch will result in configure file regeneration, instead of
> > doing that at build time, do it in patch itself, this avoids running
> > autoconf before configure step.
> >
> > Since binutils needs specific version of autoconf ( which is 2.69 )
> > this will break on systems using newer or older verisons of autoconf
> > in current state.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-devtools/binutils/binutils.inc   |     8 +-
> >  .../binutils/0007-Use-libtool-2.4.patch       | 26583 ++++++++++++
> > ----
> >  2 files changed, 20352 insertions(+), 6239 deletions(-)
>
> Whilst I appreciate the intent here, our policy is to autoreconf most
> things in general. This allows us to more easily support newer
> architectures and platforms.
>
> There is a significant build speed benefit from not autoreconf'ing
> things but where do we draw the line?
>

in general this is fine but binutils, gcc , glibc can not be treated
in general category
since they have dependencies on specific versions of autotools
unfortunately, it currently
works for binutils because our version of autoconf matches with what
binutils expects
as of now, but this will skew if this changes in future. In nutshell,
the auto-fu in these
packages is quite involved and has hard dependencies on specific
versions of tools
needed to reconfig them.

> I'm also worried about patches which touch both configure and
> configure.ac since the timestamp changes can cause things to autoreconf
> even when we're trying to avoid that. As such this is actually quite a
> risky change given past bad experiences :(

We were not fully reconfiguring binutils even now, because of other
autotool sversion mimatches
only autoconf was being run which does not change the case if
configure was say regenerated
as you say.

>
> I'm not completely against it but I am worried.
>

perhaps addresses some of your concerns.

> Cheers,
>
> Richard
>
