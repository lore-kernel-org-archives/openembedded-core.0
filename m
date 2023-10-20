Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB88CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 14:50:19 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.56217.1697813412074391714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 07:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=AOnpLEZz;
 spf=pass (domain: baylibre.com, ip: 209.85.208.52, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53dd3f169d8so1302573a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 07:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697813410; x=1698418210; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEXUMk/Ean9P+tv9Vn/aI4SfymJ6fnqL1BsY1N8feT4=;
        b=AOnpLEZzEI7RsyF4bpgaBK4lMt4qMMphT5goT1MHg7v9m1WiNhfc70MIeVM2lOIk+a
         jCuHnzP+WgA+2VbrqcU78yXaxcEvbmGeeTWYkzBgwqAkfp+u5AZidt7BJt6ZJhqVEyyC
         UZ0g8fXxmOnBEN5z6PStMmw20Zg4tT5TJzgPxNWyLk5FLwGd5bNSBwqZKKo6tmsKJsoY
         +/hOW9zdj6r/f7YNpseSkyRSteNb+RRHICOYd8WjOiCyi8qwd717hxtjc9JTQsHDlMt6
         8lVMbdPe8I4AMaUmUu0L+3yMVHCQzESquxTgdfque1NMlIRLAYibOB+hG8FxxSD8JS8C
         m7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697813410; x=1698418210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEXUMk/Ean9P+tv9Vn/aI4SfymJ6fnqL1BsY1N8feT4=;
        b=Z8JsuIZXdc5PIdb762IAS36GSNSLY0xVjD1EtWB1OZ5avZJbH+poHza3FvN5JiNW2K
         Z/DbuYFc7uYUYE1yKm5kCUmU11wyCjvi4ZrlzD4upknJtmcKWaofSgAJxVZayAo8jzz2
         gWFKFX9wJton5KHSo6FWaRUVInh8IwC9q1MSRJS3AkQQ24aDtYjMqG+r3cQqVHDEnwRU
         eBZS3xMatVyOSuDkpqCQ4QT+bjQvpDDMsq9FZ1Zb0bU+23hfXNRosILTPE8I+jeunAoT
         mPGaCGJlMgv62Rcfx5gQjAVaSdVWyJusZ32hdr17wHDDLaU3iTC0keei7FL9Mn19g2Uf
         RyjA==
X-Gm-Message-State: AOJu0Yy4xIVqRxj4Vv7U5ZUlAnwBoBIb/Y2H/iHag9+Wwo8XBEYWwpoi
	Xv4zCS8FFDo0+mKTtQfwHiP9oCDRSNSl4MU9ZoroBw==
X-Google-Smtp-Source: AGHT+IE2PoJlnrJEOLInj8Goluz/XpbtAvsSpycBt06lhLyjIAKQLZa2pkw23jYhIYlmZncX4KVK3mSFJSu/ukabWhA=
X-Received: by 2002:a50:d719:0:b0:53e:1815:ed0f with SMTP id
 t25-20020a50d719000000b0053e1815ed0fmr1666389edi.31.1697813410335; Fri, 20
 Oct 2023 07:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231019073653.1280730-1-jstephan@baylibre.com>
 <20231019073653.1280730-4-jstephan@baylibre.com> <202310191349040c7271da@mail.local>
 <CAEHHSvb3xuimjwfStOW84f-L8DJNaV_53dKHK8F4fHSX_OD2FQ@mail.gmail.com>
 <202310191834102ba91f1a@mail.local> <CAEHHSvbfrH_2AtZP38wKxEWfwiQA6LCbswsKsOtv_R-HvCyihw@mail.gmail.com>
 <3661b1f8da785de4dc6465a2a1a238229aa66247.camel@linuxfoundation.org>
In-Reply-To: <3661b1f8da785de4dc6465a2a1a238229aa66247.camel@linuxfoundation.org>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 20 Oct 2023 16:49:59 +0200
Message-ID: <CAEHHSvaF6Lt_Q7SmKggawN2JG+smG3Qdjp3V8Fa1izFmEdCCkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 4/4] scripts:recipetool:create_buildsys_python:
 add PEP517 support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 14:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189543

Le ven. 20 oct. 2023 =C3=A0 16:04, Richard Purdie
<richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
> On Fri, 2023-10-20 at 14:57 +0200, Julien Stephan wrote:
> > Le jeu. 19 oct. 2023 =C3=A0 20:34, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> a =C3=A9crit :
> > >
> > > On 19/10/2023 20:20:33+0200, Julien Stephan wrote:
> > > > Le jeu. 19 oct. 2023 =C3=A0 15:49, Alexandre Belloni
> > > > <alexandre.belloni@bootlin.com> a =C3=A9crit :
> > > > >
> > > > > Hello,
> > > > >
> > > > > On 19/10/2023 09:36:53+0200, Julien Stephan wrote:
> > > > > > add support for PEP517 [1]
> > > > > >
> > > > > > if a pyproject.toml file is found, use it to create the recipe,
> > > > > > otherwise fallback to the old setup.py method.
> > > > > >
> > > > > > [YOCTO #14737]
> > > > > >
> > > > > > [1]: https://peps.python.org/pep-0517/
> > > > > >
> > > > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > > > ---
> > > > > >  .../lib/recipetool/create_buildsys_python.py  | 234 ++++++++++=
+++++++-
> > > > > >  1 file changed, 233 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/scripts/lib/recipetool/create_buildsys_python.py b=
/scripts/lib/recipetool/create_buildsys_python.py
> > > > > > index 69f6f5ca511..0b601d50a4b 100644
> > > > > > --- a/scripts/lib/recipetool/create_buildsys_python.py
> > > > > > +++ b/scripts/lib/recipetool/create_buildsys_python.py
> > > > > > @@ -18,6 +18,7 @@ import os
> > > > > >  import re
> > > > > >  import sys
> > > > > >  import subprocess
> > > > > > +import toml
> > > > >
> > > > > This fails on the autobuilders because we don't have the toml mod=
ule installed so I guess you need to add a dependency.
> > > > >
> > > >
> > > > Hello,
> > > >
> > > > Sure I 'll do it. Just to confirm, I should add it here:
> > > > https://docs.yoctoproject.org/ref-manual/system-requirements.html#r=
equired-packages-for-the-build-host
> > > > ?
> > >
> > > I guess the preferred way would be to depend on python3-toml-native
> > > instead of requiring installation on the host.
> > >
> >
> > Hi Alexandre,
> >
> > How am I supposed to do that for a script? Is that even possible? Am I
> > missing something obvious?
>
> As far as I know you're not missing anything obvious. If the toml
> dependency was in the target recipe this would be easier but needing
> this from recipetool is harder as it is running under the host python.
>
> Adding dependencies for the host is hard as it needs to be added on the
> docs, on the autobuilder workers and into our buildtools-extended-
> tarballs and generally impacts a lot of people/places.
>
> I think moving the import into the code and having recipe tool error
> and ask the user to install the dependency might be the best solution
> for now. That does give us a challenge over where/when we can test the
> code though.
>
> On the autobuilder we could run recipetool for this test using the
> python3native from a recipe sysroot where the toml dependency is
> available I guess but that is a bit ugly.
>
> As Tim mentions, with python 3.11 onwards, this problem does go away.
> We could also make the test conditional upon the host python version I
> guess so it only runs on newer hosts?
>

Hi Richard,

Thank you for the detailed explanation.
I think I will go and use tomllib and skip the test on systems with
python < 3.11 if that is okay for everyone.

Makes me realize that I didn't add selftest for pep517, I will add
them for the next version of the series.

Have a good week end

Cheers

Julien


> Cheers,
>
> Richard

