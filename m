Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.7006.1592867363138980520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 16:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HrN0P0YZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id g7so8800535qvx.11
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 16:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G02WKMh4Fg5r0k0UT/u01uK2UssST7LXZ4M2YyzOcBY=;
        b=HrN0P0YZN04gIqJLIeP2xF57ebh61OfcEfSior8a365PdGz/nOfAI14NX/mJ0i0Lod
         M6xENIsiB4oxrxY9ULjQvNqLkEf+VCzw2M8hGhan5b6gdg6lVrHO40GWaG6zUFJX3xPd
         /nNZZgbDYvO30qFtEJSqeRPLn6okmtYwaYhKXJZWxU8lL7uI9eF51tXX+FBHppOlmhVZ
         BOiawO8eJvUJVj3fl+EmvyNhpokffkKzwz8wobJcKscGahNG8tQai2YPlvRey9ZFE96I
         U+i1CDtEtAFbb1LkFjcBtgQ/nui4BU0pNC1jZ5qFJqYoPUTKjTs7rhrQz/ea7lphkdY9
         Vkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G02WKMh4Fg5r0k0UT/u01uK2UssST7LXZ4M2YyzOcBY=;
        b=iNF1XTGp3mkqHJdo5AKo+RfNLfhu48svjqMT5RCis+xkGGoln0uxOQM0czw2cUNh3N
         hJRj4dQWLiBUCsI6RQtRmd/cFf8WQWCXRvKufvEoATmA8SftnYeWLGsuh/RgQYVd9pIc
         pTelvJNWOf1vwYKz4ndlg5U/Tr+z+wOrBqrYaeHL9O166HC8LPcB6OHqMubqWexnJtoj
         m4G9P+2Uj5oq0Di8B5/hD5OtbilWvjAzAsjNm94eIwh1GVQvpB6pDBBAb7kqIWVnFH1e
         aEdqj/rd3e8ZgMvUoTF3Mq2cf7CXiBNh4PPLj9hqjoVMpPW/7wNVwDIg4Ii88oMzc7uA
         6OmQ==
X-Gm-Message-State: AOAM530zQRm/D3RIVZu/OFn647xyKhgfK2Rd7/zzjmVoZkoFZMrG97hm
	YtYbsndWQJyCUzR+Z8aI8SSYBHXv+EA38SEF3zU=
X-Google-Smtp-Source: ABdhPJzC+7E01rdvb8w2XMrgGXl7uWM4SHujbo3Kh177roFUjFnGDh53IgBCaqqbtcrN1rBae97yHY4y4IUDLqKSvwg=
X-Received: by 2002:ad4:482c:: with SMTP id h12mr3994698qvy.146.1592867362095;
 Mon, 22 Jun 2020 16:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200622200230.54899-1-raj.khem@gmail.com> <CAGDS+nk=0yWsYZW3RTbBQXPYVpFE-tCVjWQcgRH2NwNQbiWK4g@mail.gmail.com>
In-Reply-To: <CAGDS+nk=0yWsYZW3RTbBQXPYVpFE-tCVjWQcgRH2NwNQbiWK4g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 22 Jun 2020 16:08:55 -0700
Message-ID: <CAMKF1soDpeNOhcbx0Q2C2nYxWB_x_VN9mCGdCCooKWMdGWuRww@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 1/4] go-mod.bbclass: Add class for `go mod` support
To: Steve Sakoman <sakoman@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio.salvador@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 22, 2020 at 1:13 PM Steve Sakoman <sakoman@gmail.com> wrote:
>
> This set of patches is contained in the series I sent out for review
> this morning :-)

ah even better, Feel free to ignore this series then

>
> Steve
>
> On Mon, Jun 22, 2020 at 10:02 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > From: Otavio Salvador <otavio.salvador@gmail.com>
> >
> > When using Go Modules, the the current working directory MUST be at or
> > below the location of the 'go.mod' file when the go tool is used, and
> > there is no way to tell it to look elsewhere.  It will automatically
> > look upwards for the file, but not downwards.
> >
> > To support this use case, we provide the `GO_WORKDIR` variable, which
> > defaults to `GO_IMPORT` but allows for easy override.
> >
> > [YOCTO #13883]
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/go-mod.bbclass | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 meta/classes/go-mod.bbclass
> >
> > diff --git a/meta/classes/go-mod.bbclass b/meta/classes/go-mod.bbclass
> > new file mode 100644
> > index 0000000000..5871d02506
> > --- /dev/null
> > +++ b/meta/classes/go-mod.bbclass
> > @@ -0,0 +1,20 @@
> > +# Handle Go Modules support
> > +#
> > +# When using Go Modules, the the current working directory MUST be at or below
> > +# the location of the 'go.mod' file when the go tool is used, and there is no
> > +# way to tell it to look elsewhere.  It will automatically look upwards for the
> > +# file, but not downwards.
> > +#
> > +# To support this use case, we provide the `GO_WORKDIR` variable, which defaults
> > +# to `GO_IMPORT` but allows for easy override.
> > +#
> > +# Copyright 2020 (C) O.S. Systems Software LTDA.
> > +
> > +# The '-modcacherw' option ensures we have write access to the cached objects so
> > +# we avoid errors during clean task as well as when removing the TMPDIR.
> > +export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -modcacherw"
> > +
> > +inherit go
> > +
> > +GO_WORKDIR ?= "${GO_IMPORT}"
> > +do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
> > --
> > 2.27.0
> >
> > 
