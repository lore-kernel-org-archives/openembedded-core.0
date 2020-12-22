Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web08.11302.1608645047753356751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 05:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ai2ODWM9;
 spf=pass (domain: konsulko.com, ip: 209.85.161.42, mailfrom: paul.barker@konsulko.com)
Received: by mail-oo1-f42.google.com with SMTP id i18so2972969ooh.5
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 05:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rd07RVAyiVVbhvDW8VJz74ajOUYjej1R5YyXCI7VYaM=;
        b=Ai2ODWM9lsAPW1Zw7otLbL8u3CY0SiKTk1VZ3Zm2Fqfl9XW9GD6tjswXMgYuvSA9oV
         fZXxZdIOl3V/npDQLb5ctQEOx3H+tdYh7WO8VBh488iNIuZV2LnNRx04NXbr9R6Kxhb4
         JO0fiqwRlCDpgxOBccnS/gejCjAP+ZpslEddc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rd07RVAyiVVbhvDW8VJz74ajOUYjej1R5YyXCI7VYaM=;
        b=c+uA4VYsiGzm4lvLZhUGdhRnsFyOZT8kRT1g59or/VMYWKCpkjqc3EZ8nWlssE4k04
         fqnMf+z2gCLv7ObIxI1WjWGUSLCHKtlQ5Q02NHm0jDc671Z9pBL9R/WsDvexFBfd5JSG
         AhQGO526zcQtSSIheQa9VlHj/aIIoPDNbUh34CgMLQDwTNEljhtPhW+QzjNdO+ncxr2B
         9uXmjH/izqdjrQMNG6qhJrRBW40DBOo/QuFTvEkZrF37TWZM/WZ5hHopGOpGiFICnL8H
         Y+n7EtNvQ/Oec5lMpRZ4JqxLv0RPoezIq5KH1LP5gmx4JBr5wp+86ZQhwTV3Nl/34KpZ
         c23g==
X-Gm-Message-State: AOAM532jdMDhvxI01GDkqHxYWbATwSd8LF2ZLF4RcmHnBM2LufIvy4ZN
	GdTbmvHCd6Od3IQ2+7VtyFlbCRadlkljyNOJvydWww==
X-Google-Smtp-Source: ABdhPJzvtZsGUrWP05OtxA3N+5LYUAAxLRQuT2azvoNNPIGjVmRnXlZaZHZxZn6mGR+NdsQKQQZ+A3yeXVhvcmNIcTI=
X-Received: by 2002:a4a:3001:: with SMTP id q1mr14885240oof.88.1608645046847;
 Tue, 22 Dec 2020 05:50:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607007208.git.steve@sakoman.com> <CA+chaQeEFu6++N5J2qkEjU9HZPqjAahuDVGZAcfsma-9zjDLZw@mail.gmail.com>
 <CAOSpxdaJXGM5HMR0yvobzN2sa2cy-+AxLqsa99tD4pn6fiN7+g@mail.gmail.com>
 <CALNvYWMznudnN+_6yCkxcwxhtv=8M=hRC1nNpQP6Ww7ZTedvPg@mail.gmail.com> <45cc5593b9b9bfbdfde689a5f72a678a99eb5d2b.camel@linuxfoundation.org>
In-Reply-To: <45cc5593b9b9bfbdfde689a5f72a678a99eb5d2b.camel@linuxfoundation.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 22 Dec 2020 13:50:36 +0000
Message-ID: <CAM9ZRVvCueC0+9b+Tvwv2pHm+44OGwU18O5zDH2wBUgghW_gjg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/28] Patch review - pseudo file mode corruption fix series
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Erik Boto <erik.boto@gmail.com>, Steve Sakoman <steve@sakoman.com>, 
	Martin Jansa <martin.jansa@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Dec 2020 at 10:03, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-12-22 at 10:08 +0100, Erik Boto wrote:
> > There's a bug affecting wic in combination with --exclude-path /
> > --include-path that would then be backported into the LTS version.
> > See
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14129.
> >
> > Maybe the issue that is being fixed is more serious then the issue
> > being introduced so it's a valid trade-off, I just wanted to mention
> > it so it's known.
>
> I've been suggesting Steve hold off this until we sorted out master,
> having a patch queue ready is helpful though so we don't lose track of
> all the patches.
>
> There were some fixes from Peter/Paul around pseudo which we needed and
> have now merged which leaves the above issue...
>
> Cheers,
>
> Richard

Looking at that bug (#14129) I wonder why "${WORKDIR}/build-wic" was
added to PSEUDO_IGNORE_PATHS in
https://git.openembedded.org/openembedded-core/commit/?id=ad8f5532ffaead9a5ad13e1034fe9e5e1b7979f4.
Is anything likely to explode if we drop that addition?

Thanks,

-- 
Paul Barker
Konsulko Group
