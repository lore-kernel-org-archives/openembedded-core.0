Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.231.1626816363056205795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 14:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SiiFD3Bs;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id x17so30173459edd.12
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 14:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7kJgmNPO7AyM5nqL+qfr5wqiDfxxFX2NYmWBvtDBQVA=;
        b=SiiFD3Bsa2eTeQvNWYeHjS34NoQrF2UEMJHDwKnNSEJ0+HCn1EMvlfvVmjrmDs+fmM
         TLXTVCAhhPNf7MVHrenyV/clP7hJZyU4ZXNYQ8hgPynUWlMH6jGpHu/PTuCsoPiY/cOt
         wO+3+sBrbzc7Yhq0evHudxyYnwuDnhxJnRD4Adik+HnDtopu/NJ6hpwQlf7tos0gh9Mc
         hgdUNraUYAVrfKmCwvPekIHKe08/j7DvRBIXyOF2LuTJFUhnDTZUj1+Ywev887jOaz0/
         xRTzZPOxm95VOZkhpGEcWf3OnKbtBZsd8fmmWgVociX9j+izOAlJYZGqc3DCL9BoM6Ab
         k0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7kJgmNPO7AyM5nqL+qfr5wqiDfxxFX2NYmWBvtDBQVA=;
        b=TcY2GsjFMBIFf6wRXFoAiGE0xxvZbbJTXEV8mK8OOMV7d5JmG6o32MS9LZf1M8Ew3U
         wDDc0j+jCWiMy7Wpzs7T2PkzstZGG5w8wocD1MQ31T3LO93RGzOlnvQUrStQhzFy6sMs
         dqBKP0LOmA+g17J6l7ypSI5FJakvOH1LK79LVT5TRp73DkC/OTlPAcWRg8iSLzUqyDl7
         0Vl6ucZaTWf5Wd1UloGppws6XeOqiDdcBt2/lz7/uPbIeh0pdYbygDct23dswSWMVL1p
         G8JyFd5UzeDFS76T1wDBcDNdaqOEaExDw9DwdpVM36sYw6OG6S94GXBu6sY23Yh52i/J
         /ksg==
X-Gm-Message-State: AOAM530l726PJvKRyTFHih1jr1ic0CF6Ix69Ba5q78jygKaH82Hw5U8s
	V4Jcs9OjMmJQZmtPNETmAGgzBXUBlweM6gXTFQs=
X-Google-Smtp-Source: ABdhPJx2ACQ9E4BbkQQ+4er236ybg1T5pxdCk1jVLZmnw6j9G1de9acQsUNoK8Mney5PAx9KEG3L6eg2aS/QL8Q7pnU=
X-Received: by 2002:a05:6402:d63:: with SMTP id ec35mr44234699edb.347.1626816361349;
 Tue, 20 Jul 2021 14:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210720201034.25900-1-paul@pbarker.dev> <16939B6CE19D4E0A.22560@lists.openembedded.org>
In-Reply-To: <16939B6CE19D4E0A.22560@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 20 Jul 2021 17:25:50 -0400
Message-ID: <CADkTA4M7SZ9vgmFM31Ek3YHA27+XV40A_NhJpj0ggLHw9D3WpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: Fix devupstream SRCREV assignment
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Paul Barker <paul@pbarker.dev>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 4:59 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Tue, Jul 20, 2021 at 4:10 PM Paul Barker <paul@pbarker.dev> wrote:
> >
> > Fixes the following error when building linux-yocto-upstream:
> >
> >     Fetcher failure: Unable to find revision 570e7aedcd00e7e8a218e37c3dfb3b1fda83d111
> >     in branch v5.13/base even from upstream
> >
> > The error occurred as the SRCREV_machine assignment earlier in the
> > recipe was being used instead of the mainline commit hash we want to use
> > for linux-yocto-upstream.
> >
>
> Odd that I didn't see this, since I've been using this heavily for a
> week. But I switched builders and I did trigger the same error.
>
> One of my local development layers was clobbering the SRCREV format,
> so my assignment of SRCREV directly (versus machine) was working.
>
> RP: Grab this one directly, I'll have more version bumps that will
> follow in not too long, but there's no sense waiting.

Actually, cancel that.

I just tested 5.13.4, and I'll put Paul's patch in my queue first, so
my SRCREV update will follow it. It's easier if I send them both,
since that way my version bump just applies.

Bruce

>
> Bruce
>
>
> > Signed-off-by: Paul Barker <paul@pbarker.dev>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto_5.13.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
> > index df385f912c..f43e738c69 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
> > @@ -31,7 +31,7 @@ SRCREV_meta ?= "4dcaa4bcd042d398e210b702449dd35fdf9f0078"
> >  # normal PREFERRED_VERSION settings.
> >  BBCLASSEXTEND = "devupstream:target"
> >  DEFAULT_PREFERENCE_class-devupstream = "-1"
> > -SRCREV_class-devupstream ?= "f86aa267e180b23d8d24ee6886bd3bf9a360112e"
> > +SRCREV_machine_class-devupstream ?= "f86aa267e180b23d8d24ee6886bd3bf9a360112e"
> >  PN_class-devupstream = "linux-yocto-upstream"
> >  KBRANCH_class-devupstream = "v5.13/base"
> >
> > --
> > 2.26.2
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
