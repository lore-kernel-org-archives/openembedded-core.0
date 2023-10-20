Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC950C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 14:04:38 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.55324.1697810669943789521
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 07:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JytHzBNh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99357737980so141674166b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697810668; x=1698415468; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t4u+BW/kDtkw5fU7p1b08UJqNkDzCsAxv8WZrcd7ick=;
        b=JytHzBNhR14NsaATxxtHhSrCg3jEwe/61BhLnpCR/BOIR7JhOJdJqrCoNRTAttkl0K
         Vu4SMjq3ndtfuVIh5yFIkxq4uVO1wDckF7/AnOWXLemSmRHnSDZ6BSMyjpp95g1dHnuY
         GadR0Gq2UJh1tzNfvUY3m32VY02cwuu5asgnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697810668; x=1698415468;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t4u+BW/kDtkw5fU7p1b08UJqNkDzCsAxv8WZrcd7ick=;
        b=euG+9KNwTU3gL9JVIlmgaCym7KX3yiae1uhw5UyUjtxt1UtKKaElcMO0BAp1QlfWR9
         RiQmOzqmtSFruDjCbZzpSxkB5YOAkFvoa/dVVzMQg4o/BnOCr4FWSA81VyWYLjF2t+QQ
         PMf3LI3UDZqNitiCxob3dsgZdex6EzlGa/3rSBLwdIe4JwmA7kgE9o547IzpioRi57rw
         saCKuA886mPfoazvmn7/YeE16D2ZxqEYDE/BE+qoQu35hgEkjen4BgxuCgbgkfarHXWX
         GhJJyWBQREYktTX63lhIGPjxM32NaRAJ16noFpfjq+UgsMHw6g3K1MiWd2C4RL28ioZD
         MBeQ==
X-Gm-Message-State: AOJu0YyUwqI39dD1p3+kd2kTLWK/eQZfa44yZ6iHmpqLoVJDWToGJz3H
	fpqcI1jOlsWYmK03e07/IxM8gg==
X-Google-Smtp-Source: AGHT+IF0M668e0DqLKV18KE5DA8sJJk9PVsPcRXH0d4m2jmuRuBbpF4pzI7u+9Uh86ipk1plaCyrwQ==
X-Received: by 2002:a17:907:806:b0:9c3:e158:3168 with SMTP id wv6-20020a170907080600b009c3e1583168mr1551409ejb.30.1697810668133;
        Fri, 20 Oct 2023 07:04:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e461:a77:598a:10d6? ([2001:8b0:aba:5f3c:e461:a77:598a:10d6])
        by smtp.gmail.com with ESMTPSA id pj19-20020a170906d79300b009ad829ed144sm1540280ejb.130.2023.10.20.07.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:04:27 -0700 (PDT)
Message-ID: <3661b1f8da785de4dc6465a2a1a238229aa66247.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 4/4]
 scripts:recipetool:create_buildsys_python: add PEP517 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Julien Stephan <jstephan@baylibre.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 20 Oct 2023 15:04:26 +0100
In-Reply-To: <CAEHHSvbfrH_2AtZP38wKxEWfwiQA6LCbswsKsOtv_R-HvCyihw@mail.gmail.com>
References: <20231019073653.1280730-1-jstephan@baylibre.com>
	 <20231019073653.1280730-4-jstephan@baylibre.com>
	 <202310191349040c7271da@mail.local>
	 <CAEHHSvb3xuimjwfStOW84f-L8DJNaV_53dKHK8F4fHSX_OD2FQ@mail.gmail.com>
	 <202310191834102ba91f1a@mail.local>
	 <CAEHHSvbfrH_2AtZP38wKxEWfwiQA6LCbswsKsOtv_R-HvCyihw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 14:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189537

On Fri, 2023-10-20 at 14:57 +0200, Julien Stephan wrote:
> Le jeu. 19 oct. 2023 =C3=A0 20:34, Alexandre Belloni
> <alexandre.belloni@bootlin.com> a =C3=A9crit :
> >=20
> > On 19/10/2023 20:20:33+0200, Julien Stephan wrote:
> > > Le jeu. 19 oct. 2023 =C3=A0 15:49, Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> a =C3=A9crit :
> > > >=20
> > > > Hello,
> > > >=20
> > > > On 19/10/2023 09:36:53+0200, Julien Stephan wrote:
> > > > > add support for PEP517 [1]
> > > > >=20
> > > > > if a pyproject.toml file is found, use it to create the recipe,
> > > > > otherwise fallback to the old setup.py method.
> > > > >=20
> > > > > [YOCTO #14737]
> > > > >=20
> > > > > [1]: https://peps.python.org/pep-0517/
> > > > >=20
> > > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > > ---
> > > > >  .../lib/recipetool/create_buildsys_python.py  | 234 ++++++++++++=
+++++-
> > > > >  1 file changed, 233 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/s=
cripts/lib/recipetool/create_buildsys_python.py
> > > > > index 69f6f5ca511..0b601d50a4b 100644
> > > > > --- a/scripts/lib/recipetool/create_buildsys_python.py
> > > > > +++ b/scripts/lib/recipetool/create_buildsys_python.py
> > > > > @@ -18,6 +18,7 @@ import os
> > > > >  import re
> > > > >  import sys
> > > > >  import subprocess
> > > > > +import toml
> > > >=20
> > > > This fails on the autobuilders because we don't have the toml modul=
e installed so I guess you need to add a dependency.
> > > >=20
> > >=20
> > > Hello,
> > >=20
> > > Sure I 'll do it. Just to confirm, I should add it here:
> > > https://docs.yoctoproject.org/ref-manual/system-requirements.html#req=
uired-packages-for-the-build-host
> > > ?
> >=20
> > I guess the preferred way would be to depend on python3-toml-native
> > instead of requiring installation on the host.
> >=20
>=20
> Hi Alexandre,
>=20
> How am I supposed to do that for a script? Is that even possible? Am I
> missing something obvious?

As far as I know you're not missing anything obvious. If the toml
dependency was in the target recipe this would be easier but needing
this from recipetool is harder as it is running under the host python.

Adding dependencies for the host is hard as it needs to be added on the
docs, on the autobuilder workers and into our buildtools-extended-
tarballs and generally impacts a lot of people/places.

I think moving the import into the code and having recipe tool error
and ask the user to install the dependency might be the best solution
for now. That does give us a challenge over where/when we can test the
code though.

On the autobuilder we could run recipetool for this test using the
python3native from a recipe sysroot where the toml dependency is
available I guess but that is a bit ugly.

As Tim mentions, with python 3.11 onwards, this problem does go away.
We could also make the test conditional upon the host python version I
guess so it only runs on newer hosts?

Cheers,

Richard

