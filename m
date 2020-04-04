Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web11.6694.1586035931797093907
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 14:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QpdTMRGe;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id u11so7339304vsg.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2020 14:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jaaXGY7YDgknqDMmXWQacb5KUaLg4WQQWBt/6Bsou3s=;
        b=QpdTMRGe+WnoesOOWgJP/m8yWI/Ew2wxAo0CZpwAc5wQuEJAQ+eOVSiNLGVbuJZr/b
         5bK5+pAh5J4q+RAQoxY4bRX0GXseTDagD3NTaLRWm1+wgFl6sJiCD71KVW9Ndogf5JUT
         a9KhlASY2uzYDInZTJVPbFX4sYqm7nI+IBxA0Owew0Blt5zADyhfAdHXY8aapgM/xiDl
         2qB+boEYpykDvFz2wbhxbDsxC9UzS7h1Q+C0SNgrbdKEEvs4ZR74DHAbu9GIr/G07brS
         dYhT7FUBY/dv7ba6dpTsUwz3yJtBuYpenQPB9exF3n9o46bxq7sdO4W7pqDWcwdx8u1D
         13zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jaaXGY7YDgknqDMmXWQacb5KUaLg4WQQWBt/6Bsou3s=;
        b=qgBxPKxJluJ3fzHkaHGFaxURLpV2+7aGBNIFE1ToLkKbse+WIuV4HPQvJJbnf9Ff6L
         ib8RR7HxHZ3wWHvljzBP7haXrSy6MueaCVjA3/MeLHQfheaLHHNKerkta9EEgJfh+6F4
         nQduBYd7lT9Q5P+DY3ntyt5J7H5XqUxuSxT7evl2nHsbvRmZq+eEBOktd1L947BB6Jyp
         FcjlGUt4cIUQAQsFdny+Lj4KgnHcDlOy8itOzAIROToAT3FCyHf8A+n8VYgp2YimPGLo
         efWDXalRDgectYMkLXY3KBS/iwv7sjgyeu+Fx5Lo+2hwOv0Y4aTebN0F2RvH7DhKFjVe
         x8iQ==
X-Gm-Message-State: AGi0Pub4CqhxzJz5TWy/ROSvc7zDlQExMRuGdHy/IznFWiDTJarc2Fpv
	mZaietYwdpGiK3zbWRzphtDMPczHm1eEdwodCEk=
X-Google-Smtp-Source: APiQypLqJ774Il8OrC49ThjGniXrbQLopeXgkjAXGgE3IRtPo0yYfoICmVfIqgS9Sj5HABBbuOZw4RWP9hNX/A2ShN4=
X-Received: by 2002:a67:10c6:: with SMTP id 189mr11401633vsq.130.1586035930602;
 Sat, 04 Apr 2020 14:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200403215938.175657-1-richard.purdie@linuxfoundation.org>
 <CAJ86T=XabPQEn6xFeCwU9MLTPx50N86o6-HAyAAgu1r6UYWwCQ@mail.gmail.com> <df6f9b54bb244e0f3e893f0db330649eb6bdfbcb.camel@linuxfoundation.org>
In-Reply-To: <df6f9b54bb244e0f3e893f0db330649eb6bdfbcb.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Sat, 4 Apr 2020 14:32:03 -0700
Message-ID: <CAJ86T=WehmnH33uDH0ZUHqAoRZaSpM_t5QCE2_p3a4obKF1ajg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pseudo: Force seccomp to return success when in fact doing nothing
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 4, 2020 at 3:17 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2020-04-03 at 15:39 -0700, Andre McCurdy wrote:
> > On Fri, Apr 3, 2020 at 2:59 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > ++      /* gcc magic to attempt to just pass these args to syscall.
> > > we have to
> >
> > Comment needs updating - you are calling prctl() here, not syscall().
> >
> > > ++       * guess about the number of args; the docs discuss calling
> > > conventions
> > > ++       * up to 4, so let's try that?
> >
> > The args for prctl() are option plus 4 additional arguments, so a
> > total of 5, not 4.
>
> Thanks, fixed.

It's perhaps also worth noting that it's only necessary to use
__builtin_apply_args() + __builtin_apply() when the data types of the
arguments passed to a function are not known (that was to original
argument for using them in the wrapper for syscall()). Together these
two work by saving a copy of all registers which could be used to pass
arguments (both integer and floating point) together with a chunk of
the stack used to pass arguments. Using them should be safe, but they
are gcc specific and not very efficient.

For prctl() however the data type of the arguments is known. They are
all unsigned long:

  http://man7.org/linux/man-pages/man2/prctl.2.html

Therefore a wrapper for prctl() can simply extract option + 4
additional unsigned long vargs arguments from the caller and pass them
along to the real prcrtl(). See the implementation of prctl() in musl:

  https://git.musl-libc.org/cgit/musl/tree/src/linux/prctl.c

Also, since prctl() is Linux specific, it looks like this patch will
make pseudo Linux specific. Is that OK? If so maybe worth making an
official statement that OE is only supported for Linux hosts?
