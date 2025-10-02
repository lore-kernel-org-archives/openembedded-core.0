Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576C5CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 17:23:59 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.web10.14581.1759425835554354451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 10:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UVBLjokT;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-635380a4a67so1466750d50.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 10:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425835; x=1760030635; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kXk/HRhxK4dmJFhXFce3gWvRYsoKqENY8Lsy1ahR4M=;
        b=UVBLjokT2N9lV33oOkZHG+iGMflgfAKMhQB2rXGTzZ9nB46Bol2TrvG4mpBA13Du2q
         PuEl/ZCPsnA5pSf9rgAbxujHVK1sUShGzQjgHFUpLK2y9BSzb2VLiW/QNj+6Wlugl0EF
         di6cMZSKWgt9h5vGbSbjUP9OO8d/xBR0fnzzlcsZWeTplRMs6kldBormdo+A0pvFa/CR
         eevPRQQ4EuA0mTMwO7RwXpXQm+kf4NNPkVlc7nZOxbJA5PZPOqZ2J524qaLK6/tJXHmW
         QguIlOj9fb/D8/9tEretE+7XhfOILUt9k7Y+m8l53G/UGqf230VpRSUlkI3VhnKPpCME
         6Owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425835; x=1760030635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kXk/HRhxK4dmJFhXFce3gWvRYsoKqENY8Lsy1ahR4M=;
        b=dPjazl6/aEEY6aZad5Rv+Ac9aRTaBQ5TQBXSta+TlvCcH3hi7+33gN5eYEJuShxjy1
         kGNODQvyHiPDgY0LkkHzCd0ZSwFAoaCb/PdLa6Rms3guuIt3kYF2UcehuVoq01a1h9Zc
         bznkbzAEqWvfYJiYK6m7oeZSOPNnmzOAprcLIBn/xhoFzYsjY6C2bFoFIwKLiOvytur7
         Qq/IvWpy37wJgl+hOSv7pKkuavFVHLV+/rpuzZEeJ2QkPSeJVvOqVi7CspgvqNnI+HHZ
         v8uzgxiiWH2DEaVfQqqJBQmXtfgWBBo7HFLneypcCHsUS9kvjKRayDuBNlVSqSWjGkte
         GhEA==
X-Gm-Message-State: AOJu0YzciGRclb8aZJOkAoR/ap+DcugT94ZYw+8Mb1bvRk6DXxMPSVTc
	lECF4Dj3iyWlPiS+bsbXJsqtGcb+V9BXpSibgBbEv1duRVq6zuVVlUHa0sCgPcZRVrbq+Ybs2pm
	L7bPm0zum6SUxnrjyYm09HFNT5U8CKBE=
X-Gm-Gg: ASbGnctEvqkWdHTX7XvJcmxwkj0mATF78dDrAhTG9lB94A5RtcDZRQ6k6hxGE9FDBfr
	k4kWPKSL3VtfYYAuMs81vbJZPOS3oLNrdjJyTx0KvwrcW4CUAKYrfvIXq/xgO2y6JPxzh07OzHJ
	C1Y/GTp5zILrPbiWK6Pk3bAHNI12eQdc8Mx8QxoDlm6C38fUEQx7sCH/tcO1TBTzK5EknVNi87X
	YSBrn3PRWQE4caW0J+bRv90Zag60v8SrzZDV6tuGay4YnzA2dK+aYTu0wI7Ki+N6/DNhqV9wUzy
	RyIy1PZd5w7nMMM6JzLdxcef78/fjdUU+WvmlVgEOgo2RLEkjFNJt1Oiu0FkLBtY+kJs3ezq7pS
	YzKQlhw==
X-Google-Smtp-Source: AGHT+IHl/BJXYJgAsu8QNOmOG7kp3Sg5TowJqU3r7RPlMRGMDgLOcYlab9Q10XdWAn521QVoKvWYs5HtyCBpa4izUsI=
X-Received: by 2002:a53:cc0d:0:b0:63b:5b6e:2967 with SMTP id
 956f58d0204a3-63b9a0823bdmr52992d50.5.1759425834512; Thu, 02 Oct 2025
 10:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251002000810.226673-1-denis@denix.org> <20251002000810.226673-3-denis@denix.org>
 <CAMKF1spcHAvNJtsStzG0OgigTKkU_QHgApdY1m5Q+Zf4aecTRg@mail.gmail.com> <20251002140404.GC3125@denix.org>
In-Reply-To: <20251002140404.GC3125@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Oct 2025 10:23:25 -0700
X-Gm-Features: AS18NWCLCGOIs1mdFTtgNzmywkaBk1--2CgktnTdjtxoS8xGEd7f91zJS2blxUA
Message-ID: <CAMKF1sonoReY5oR-eB9-_UmDGeLX_htXS53+rJ3VFL+Fs0wqAw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 3/5] musl: set compatibility a bit more flexible
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org, 
	Denys Dmytriyenko <denys@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 17:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224375

On Thu, Oct 2, 2025 at 7:04=E2=80=AFAM Denys Dmytriyenko <denis@denix.org> =
wrote:
>
> On Wed, Oct 01, 2025 at 07:12:34PM -0700, Khem Raj wrote:
> > On Wed, Oct 1, 2025 at 5:08=E2=80=AFPM Denys Dmytriyenko via
> > lists.openembedded.org <denis=3Ddenix.org@lists.openembedded.org> wrote=
:
> > >
> > > From: Denys Dmytriyenko <denys@konsulko.com>
> > >
> > > Like musl Linux config, baremetal also uses musl as a libc, but
> > > it has a different host triplet set. Hence adjust COMPATIBLE_HOST
> > > to accomodate this use case by checking that musl is a preferred
> > > provider of libc.
> >
> > This sounds a bit odd. Why do we use musl for baremetal targets ?
>
> Was like that for 10 years since the beginning of baremetal support:
> https://git.openembedded.org/openembedded-core/commit/?id=3Dcb010e306a6a8=
56c589db5f41fdcaea4e5035d93
>

A lot has changed since then in terms of toolchain sequences and dependenci=
es
it might be a good time to revise this

>
> > while musl does have FDPIC support but I don't think thats how we
> > use it.
> >
> > >
> > > [YOCTO #15982]
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > > ---
> > >  meta/recipes-core/musl/bsd-headers.bb      | 2 +-
> > >  meta/recipes-core/musl/libssp-nonshared.bb | 3 ++-
> > >  2 files changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/musl/bsd-headers.bb b/meta/recipes-cor=
e/musl/bsd-headers.bb
> > > index ad9ba81e4f..c6a3814a49 100644
> > > --- a/meta/recipes-core/musl/bsd-headers.bb
> > > +++ b/meta/recipes-core/musl/bsd-headers.bb
> > > @@ -25,7 +25,7 @@ do_install() {
> > >  #
> > >  # We will skip parsing for non-musl systems
> > >  #
> > > +COMPATIBLE_HOST =3D "${@oe.utils.conditional('PREFERRED_PROVIDER_vir=
tual/libc', 'musl', '.*', 'null', d)}"
> > >
> > > -COMPATIBLE_HOST =3D ".*-musl.*"
> > >  DEV_PKG_DEPENDENCY =3D ""
> > >  RRECOMMENDS:${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> > > diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipe=
s-core/musl/libssp-nonshared.bb
> > > index 4bcbaef7ea..6f12ff0c9b 100644
> > > --- a/meta/recipes-core/musl/libssp-nonshared.bb
> > > +++ b/meta/recipes-core/musl/libssp-nonshared.bb
> > > @@ -29,7 +29,8 @@ do_install() {
> > >  #
> > >  # We will skip parsing for non-musl systems
> > >  #
> > > -COMPATIBLE_HOST =3D ".*-musl.*"
> > > +COMPATIBLE_HOST =3D "${@oe.utils.conditional('PREFERRED_PROVIDER_vir=
tual/libc', 'musl', '.*', 'null', d)}"
> > > +
> > >  RDEPENDS:${PN}-staticdev =3D ""
> > >  DEV_PKG_DEPENDENCY =3D ""
> > >  RRECOMMENDS:${PN}-dbg =3D "${PN}-staticdev (=3D ${EXTENDPKGV})"
> > > --
> > > 2.25.1

