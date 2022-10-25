Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD87C04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 09:14:18 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.4945.1666689250948240812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 02:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ad14ZbWy;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id o12so20832071lfq.9
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 02:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzrYCZP8BY+R5nLPfqg9GWlttnTO+wEpD+uVLVjmElU=;
        b=Ad14ZbWyqgsU8jsrS8jLq8nH50QEDFvOd7KmZVQ0w8+EGloo7nNpVd1bx8oRRn0ANW
         4Vgo0cGryY+GQZfS4kgH5r6taaitnC9ew5MwOoLvaOSHLR2hXIlBekdpkL9lNtfTtVhN
         uv9DRoMDzVAc+LhUj1QEY9HWiEw0/9tWOHgtvviQ/vNMkzCCV3u6UOI8twHZWuQAcwS9
         v/QxKQCTo5GpFWmNtp28e/dsc4pPowjO6zT656azpOeCy7FQHenmnnWidz1fWrl6xzbJ
         l6sf4qUYxfI1VoJqN9tL/f/SVmmq/xfRVh4ybzftijR95ZP9va25egtcnJicUqFH7XX7
         pr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzrYCZP8BY+R5nLPfqg9GWlttnTO+wEpD+uVLVjmElU=;
        b=OZ8PEKdHv2sD1aXhLA3cwE7S2ECHSFkiBrp3eAvCNtxxqNMIbO+OiRCP5FCj+GUrbU
         XA+lAE3zUlbK8tIWRK7sjz680EN5+7W9bfg6kg5ltu1EkyiLTAP/tlb3qb0NRBoQsx/w
         hNDh61Nv9vECp7m7iO7tmrWnmot9tRPUqjD7K6IzyOVRH7HbbsyvYVv8jWw0pXn4Diud
         VH5U2hdvXpTP0IBnHviU9T+sxvDh6uRCc1OeOFGa++Oa0uJ2NHkuPQRG489pATn6F3eT
         75csz186qQYBpaKWo4iwH0giYWggRf2nYycL46NmOtPHedrOVB7IpakPrAHMlIRfUONd
         vjYA==
X-Gm-Message-State: ACrzQf0Yv06o9CIPc8JHoQIGIXL3alGQl5/GqHpx3bo9qdznzaeG6+g0
	8dgN9GsAz0UIbhj0VBqh1mm4HnsKmhhqvlztZ/Q=
X-Google-Smtp-Source: AMsMyM6rmtZRNuDSFQKxwRD5F1K8I+OiO9CPcupAc0qXS1IHkJ92xA9OBwhlhNyw2xBL2Jk9V/o2pK+OT22GsfznUTg=
X-Received: by 2002:a19:c50d:0:b0:4a9:2a57:e236 with SMTP id
 w13-20020a19c50d000000b004a92a57e236mr5207547lfe.263.1666689248762; Tue, 25
 Oct 2022 02:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221011111028.590084-1-leon.anavi@konsulko.com> <e7a8f4c5-0c97-61b2-1167-99456ac26d28@konsulko.com>
In-Reply-To: <e7a8f4c5-0c97-61b2-1167-99456ac26d28@konsulko.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Oct 2022 11:13:57 +0200
Message-ID: <CANNYZj985DCm7qgXv=sG3EUHs=ex1MW94=XKE+ur_eg+rvAEag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-manifest.json: Move urllib to netclient
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 09:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172124

Patch merging is on hold now, please do read the weekly status update
emails when in doubt.

Alex


On Tue, 25 Oct 2022 at 10:41, Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Hi,
>
> It has been 2 weeks since I submitted this patch for openembedded-core.
> I am wondering if it will be merged in master/master-next. Please let me
> know if any changes are needed. Is the patch OK?
>
> Thanks,
> Leon
>
> On 11.10.22 =D0=B3. 14:10 =D1=87., Leon Anavi wrote:
> > Move urllib from core to netclient because it imports base64.
> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >   .../python/python3/python3-manifest.json               | 10 +++++----=
-
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json=
 b/meta/recipes-devtools/python/python3/python3-manifest.json
> > index 2205cf2d2d..02c918d6e5 100644
> > --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> > +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> > @@ -315,8 +315,6 @@
> >               "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
> >               "${libdir}/python${PYTHON_MAJMIN}/types.py",
> >               "${libdir}/python${PYTHON_MAJMIN}/typing.py",
> > -            "${libdir}/python${PYTHON_MAJMIN}/urllib",
> > -            "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
> >               "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
> >               "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
> >               "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
> > @@ -402,9 +400,7 @@
> >               "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
> >               "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/a=
bc.*.pyc",
> >               "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/m=
achinery.*.pyc",
> > -            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/ut=
il.*.pyc",
> > -            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
> > -            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__/parse=
.*.pyc"
> > +            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/ut=
il.*.pyc"
> >           ]
> >       },
> >       "crypt": {
> > @@ -876,6 +872,8 @@
> >               "${libdir}/python${PYTHON_MAJMIN}/secrets.py",
> >               "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
> >               "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
> > +            "${libdir}/python${PYTHON_MAJMIN}/urllib",
> > +            "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
> >               "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
> >           ],
> >           "cached": [
> > @@ -888,6 +886,8 @@
> >               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/secrets.*.p=
yc",
> >               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.p=
yc",
> >               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/telnetlib.*=
.pyc",
> > +            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
> > +            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__/parse=
.*.pyc",
> >               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
> >           ]
> >       },
>
> --
> Leon Anavi
> Software Engineer
> konsulko.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172123): https://lists.openembedded.org/g/openembedde=
d-core/message/172123
> Mute This Topic: https://lists.openembedded.org/mt/94256015/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

