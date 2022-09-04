Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B13C6FA82
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 22:01:28 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.18078.1662328884812089066
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 15:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bZj/Rrka;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id n17so9071180wrm.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 15:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=/nOtE13Xq+zUvLPYMSNg5Zpvaau/hD7advdjlWg8MVY=;
        b=bZj/RrkaFFMZ4JMcMfEEDY5M8v2bHyvQi/YAlJYo9huR2kL8HPTJvBOHqH6RkxDjKe
         kXJnQd2RDA2nH8Gwqi3tBGehjGvMZKXcLNTzHL9YUBa40Ma8wnqAwEFlfjU2UhJZktrM
         vH1j6XE2SDAGaH53GH8KQ0jEjMTkl0C4jmlng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=/nOtE13Xq+zUvLPYMSNg5Zpvaau/hD7advdjlWg8MVY=;
        b=VCIjICV0ERkEiaYeHvD3I4vjotJeT9Dvt8gk0p8m65BJKtHE4c4lAGr6ncw30qav6L
         EN3MruGpBIkyMofLzXqUwdx4Tcf/sLdQ+6znBKPmnuP7yTtjhM2kp9BSFJNOQlzbDu+u
         pNQByIzApdIXdxYJnqwLrpHqidcUwKqOaaNv00XD107XPGpv5MA8daSgDCQgHjtLk+Sr
         bPiGZ1npvN+ebnOUxs3Eu4yUIwLK+G+ntigN0uGmmWXWYo8dadTs5fax/+DmNmmPJKU5
         SjZTVnMsMJxjhbAUOdLYMpblLLddbGtvQxIljniJjzGfp3FANjErOZzq0PAA5DFqeIzO
         Z7Kg==
X-Gm-Message-State: ACgBeo2F+A8n9+NGVfWa3rwMOhNGevjuRJWkSdYvyasw+V4G2gVX9Qdd
	2zzvXlDiGaba3/FTfZclmnR42g==
X-Google-Smtp-Source: 
 AA6agR4BozMUg0cp2oyRzjZ05bk3JUz1MVm5tzz8SdfkizgGkNlMNtaA7/rSM5NsPm2iw9H8vPswlA==
X-Received: by 2002:adf:d0c9:0:b0:225:8c08:288d with SMTP id
 z9-20020adfd0c9000000b002258c08288dmr23092540wrh.213.1662328883131;
        Sun, 04 Sep 2022 15:01:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:df52:563:aee3:2030?
 ([2001:8b0:aba:5f3c:df52:563:aee3:2030])
        by smtp.gmail.com with ESMTPSA id
 bd17-20020a05600c1f1100b003a540fef440sm16108031wmb.1.2022.09.04.15.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 15:01:22 -0700 (PDT)
Message-ID: 
 <a4f110ea41a9653e8fe894fabc7bf5a180bca30f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust-cross-canadian: Fix for the linker
 issues caused by using the shell
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
	shivams@gmail.com
Date: Sun, 04 Sep 2022 23:01:21 +0100
In-Reply-To: <1711C5DF821D6301.14041@lists.openembedded.org>
References: <20220904180946.1954417-1-sundeep.kokkonda@gmail.com>
	 <1711C5DF821D6301.14041@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 22:01:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170297

On Sun, 2022-09-04 at 22:34 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Sun, 2022-09-04 at 23:39 +0530, Sundeep KOKKONDA wrote:
> > [Yocto #14892]
> > This is a fix for YOCTO #14878 patch. When sheband is more than 128 cha=
racters the default shell /bin/sh is used to execute the linker instead of =
SDK shell, which causes problems with LD_LIBRARY_PATH.
> > With this patch shell usage is avoided.
> >=20
> > Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> > ---
> >  .../rust/files/target-rust-ccld.c             | 39 +++++++++++++++++++
> >  .../rust/rust-cross-canadian.inc              | 11 +++---
> >  2 files changed, 44 insertions(+), 6 deletions(-)
> >  create mode 100644 meta/recipes-devtools/rust/files/target-rust-ccld.c
> >=20
> > diff --git a/meta/recipes-devtools/rust/files/target-rust-ccld.c b/meta=
/recipes-devtools/rust/files/target-rust-ccld.c
> > new file mode 100644
> > index 0000000000..13f06b38f8
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rust/files/target-rust-ccld.c
> > @@ -0,0 +1,39 @@
> > +/*
> > +*
> > +* Copyright (C) 2022      Wind River Systems
> > +*
> > +* SPDX-License-Identifier: GPL-2.0-only
> > +*
> > +*/
> > +
> > +#include <string.h>
> > +#include <stdlib.h>
> > +#include <unistd.h>
> > +
> > +int main (int argc, char *argv[])
> > +{
> > +        int i=3D0;
> > +        char cc[1024];
> > +        char *cmd[1024];
> > +        char *ccargs[2][1024];
>=20
> I'm a bit concerned about the fixed lengths coded here. What if there
> are more than 2 arguments in CC/LD? What if one of the arguments (or
> the variable) is longer than 1024?
>=20
> > +
> > +        strcpy(cc,getenv("LD"));
>=20
> The original code this replaces uses CC?
>=20
>=20
> > +        char * pch;
> > +        pch =3D strtok (cc," ");
> > +        while (pch !=3D NULL)
> > +        {
> > +                strcpy(ccargs+i,pch);
> > +                printf ("%s\n",ccargs+i);
> > +                pch =3D strtok (NULL, " ");
> > +                i++;
> > +        }
> > +
> > +        strcpy(cmd,ccargs+0);
> > +
> > +        unsetenv("LD_LIBRARY_PATH");
> > +        execv(cmd,argv);
> > +
>=20
> Where is ccargs used here (other than the first entry)?

This was getting over complicated. I'm going to try a different version
of this in master-next which calls the shell wrapper from a C program
which just unsets LD_LIBRARY_PATH. See master-next.

Cheers,

Richard


