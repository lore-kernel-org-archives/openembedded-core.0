Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2D0C77B7E
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 07:51:09 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.6457.1685173860211140044
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 May 2023 00:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OQUHFemA;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-19f3550bcceso77660fac.0
        for <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 00:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685173859; x=1687765859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bbSc9ryW5OAmYC8jQ3tIp5b0b6yIocZ4t9RC6iTX0s=;
        b=OQUHFemAdypA5nbJzSzIamDtXbhef52gGtSo2zsRqDZIYVfC/jjVVH710dL+Kuu4cd
         KwJa0avaOCFUcZyYj31/+suVKKXZUjfIY06m7LxwlqP6AnCz6sbbm7JZCIGp2gqi0u64
         RL4/CmjUrQ/DrVoUIikvc1ilHocGTsuWFar7FmF43+o8DRMvzd+cNm0/PNduZxiWSiSf
         LkYtDES0+NA0J/Gchq46aCIvcX+ytIcOQKjXuSliDvl5PKvsHUbMFyt1DTXKodnqN2uU
         BnfsyUyPz8P8V3sTw4PVB/v4b1JCfRT0voETrsxgEqB0Y57/N+TtnXBL2U7SV7GKIN4q
         EBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685173859; x=1687765859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bbSc9ryW5OAmYC8jQ3tIp5b0b6yIocZ4t9RC6iTX0s=;
        b=ANfnUFcn3ejUBpZirDAoU6ENpVqi8UVyUmbWby93ReU/bA/IbjeONanmFDEBzzstIG
         fLm+ONLqA02pSEVgQThnUUR3m9EDU6erVEwoqqnbmNgJKzIUlvf6myCBRykgVcXREh1C
         DCg4q7BEYQqmEblWqScXjf3jxhCqc48+Xs1n2mpzOpWSnlddiaHIEXZpMmgIGDlsbEkO
         U9SKB5QXroDlfqhHIoMyD6JS6hX3dd2rrUwxR3CBnfK/busW0+khfUHF9ZAgCYGziNO/
         0uqBfK5OXsaJ5sc8/PMpQxpYpz/dVuYFaBLZNjH9fVsuDWSpJAwPrY7J+1FtwbYLeRqw
         Htlg==
X-Gm-Message-State: AC+VfDz/DgJYRVCJq/oeTyCRUoZNcXK4MJGmsX8TRfFSDSjWWp9Lyu0a
	s8wnS2yQvpEwyD4INWCspvCCOWW4W4hPRHF/fk4=
X-Google-Smtp-Source: ACHHUZ6unEpeFbBRFbMgWXxAargEFYWPy8VCXP4I6kl/R9A8iOsPYAF+wbo+q0qJHbwUbdYO+Vqdy/f7hk25MetR3Y8=
X-Received: by 2002:a05:6870:5403:b0:187:e563:77b9 with SMTP id
 d3-20020a056870540300b00187e56377b9mr2107814oan.45.1685173859265; Sat, 27 May
 2023 00:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230428032030.2047920-1-raj.khem@gmail.com> <c60b519b-6b54-511c-1cae-65ffca65d35f@gmail.com>
In-Reply-To: <c60b519b-6b54-511c-1cae-65ffca65d35f@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 May 2023 00:50:33 -0700
Message-ID: <CAMKF1spX1exkh9PKiWB-YCFHcRo4adXgLPj9K7HWOGpTPHdpWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Add -fcanon-prefix-map to DEBUG_PREFIX_MAP
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 07:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181796

On Fri, May 26, 2023 at 10:27=E2=80=AFPM Jacob Kroon <jacob.kroon@gmail.com=
> wrote:
>
> On 4/28/23 05:20, Khem Raj wrote:
> > This should help canonicalize the relative paths and symlinks
> > during cross compile, -fcanon-prefix-map is newly added in gcc-13+ [1]
> >
> > [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108464#c8
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta/conf/bitbake.conf | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index d94ffe1df9..453bef37a9 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -644,7 +644,8 @@ EXTRA_OEMAKE:prepend:task-install =3D "${PARALLEL_M=
AKEINST} "
> >   # Optimization flags.
> >   ##################################################################
> >   # Beware: applied last to first
> > -DEBUG_PREFIX_MAP ?=3D "-fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN=
}/${EXTENDPE}${PV}-${PR} \
> > +DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
> > + -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P=
R} \
> >    -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \
> >    -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \
> >    -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \
> >
>
> Maybe we can take the opportunity to also cleanup DEBUG_PREFIX_MAP by
> replacing debug/macro/canon with a single -ffile-prefix-map ?

Yes, somewhere I had such a patch and I dropped it from my queue IIRC
it was for clang alone maybe
but it is not a simple replacement, we have to adjust
some recipes to this option,

>
>  From the gcc 13.1.1 manpage:
>
> > -ffile-prefix-map=3Dold=3Dnew
> >            When compiling files residing in directory old, record any r=
eferences to them in the result of the
> >            compilation as if the files resided in directory new instead=
.  Specifying this option is equivalent to
> >            specifying all the individual -f*-prefix-map options.  This =
can be used to make reproducible builds
> >            that are location independent.  Directories referenced by di=
rectives are not affected by these options.
> >            See also -fmacro-prefix-map, -fdebug-prefix-map, -fprofile-p=
refix-map and -fcanon-prefix-map.
>
> Jacob

