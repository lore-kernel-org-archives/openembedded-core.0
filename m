Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BA3C3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:45:26 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.79574.1746546324245232140
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mXxMrFXK;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.170, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7080dd5fe92so49206327b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746546323; x=1747151123; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7jRYI8vLCY/uhAjIBd506tziXUc1x7+hfPSLj20A10=;
        b=mXxMrFXK4DkJGbwK2SX+Uc+KEA3cfXfNJcDbV7CF98exDXBkS1w0gZdW8ikJ76FKfU
         4ngcCuSVZ9lLwfP00Oyoz8U8R6AgpHfPHgaSW7H2YLgQLqvbrHawZ3fYf5iCaD9C1K1d
         6C7AjnJpNyZ5+3j10W+oJc0HMmAhmPyxK11p3jN9SOVHYIagmGRdgGKLjlYTvIYuFNZ0
         cN/K80Lu3w3p6o4JpR3EWWQ4D1JFiXkpSAbXFUeegTCmV1M19fZU3NfRZonmJby0Gqne
         sexyB8s4lmbwWXpJDUNKAS3t45MQMqWZ5UIwCE5PLk9lwqscLX2jITkjGC2uoZGxeJZw
         wPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546323; x=1747151123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7jRYI8vLCY/uhAjIBd506tziXUc1x7+hfPSLj20A10=;
        b=oTzchEXYQ8PiU0k7qaaPyPMLy+qvwmM/8xUdtsnBgTtLc+CGMbaSz9ywTDDD8uAy47
         P1ZE4ZN4yRuOxYp7Fy3GOQ5AD92qqGGOh91t5w35Xr/fSJS4Cjn6U/3UyWD9QXdy6DPd
         HUpsoM3R6YSk1RJYbQYnQJbR1+cEcmtt1pLe1q5/jKKV6Ks2uKCC+7NEmCtL/TwFZiR0
         VUkXdn+R6zbXbcnZn9P8x6WON4HypftWdHSeWdYbQc5NTFkXyYEn6HPZrkBThb8XnTPt
         QQ2S7R3STS3ogdgzDyMS3Oq0bxf0/EE78SXRRuzg2YjQgzBFnHd4F2DvyX+0lNuLBkUT
         rSYA==
X-Gm-Message-State: AOJu0YzPW0O/vhjl4dx+2rw8ZOnV9iYuLPKYnz3bJbV/TKlyjxAOaHr+
	PXS/cRu9mO2EUfWEm3mO/EM4hJzmPkIEOY8XtTo1S9FJBkUlILbefiijvaR2fQPUXFrl32Oyydd
	F9qLAmEMWfAA3UrUyL2JHsanib6laKOD3bzcxmg==
X-Gm-Gg: ASbGncuCnZ7pJ57e62fy/Rovs+Hct31acAlB5NtiMCMtUaZ8r1tzpx9OfaDFrOwWBCk
	+bLOOeSgVpUFMkzJRcts2jMkZzJm97DHsr0QdWRgcgsUYDuUhTYUoMV5C/ZhqYdfs7a/Lk2azWo
	nYcl5VPgpoYee5qc3P4Y475ppZ5SskQovqP2FOYUG0a/B23T9ChMkqIw==
X-Google-Smtp-Source: AGHT+IFsT/KpUlKCHR+MzMbTu6Raw94V9dlL55EL2Z9mehP614qx/y1+DELxQaX/ZLX8vTVVXwLE2mZLvnAHZUk1WRI=
X-Received: by 2002:a05:690c:3509:b0:703:aea2:6bbb with SMTP id
 00721157ae682-708eaf6d843mr168498347b3.31.1746546323217; Tue, 06 May 2025
 08:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1746544207.git.steve@sakoman.com> <a51c54793c32cdb433230db4aa6842e41e32c214.1746544207.git.steve@sakoman.com>
 <504da031-4162-4d70-a210-c0f1073d46ef@gmail.com>
In-Reply-To: <504da031-4162-4d70-a210-c0f1073d46ef@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 6 May 2025 08:45:12 -0700
X-Gm-Features: ATxdqUFVwBK_YdP0OXsw_FymDyNupANhJLKS53bOoTx4fexwOO86x6at03KpyVs
Message-ID: <CAOSpxdYNj3tfKW1vfD-CoFrXnrmzZQLgdpuY94G8EGkV3v6mUg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 6/7] bluez5: make media control a
 PACKAGECONFIG option
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216067

On Tue, May 6, 2025 at 8:19=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:
>
> On 5/6/25 17:13, Steve Sakoman via lists.openembedded.org wrote:
> > From: Jeroen Hofstee <jhofstee@victronenergy.com>
> >
> > When not building with the default PACKAGECONFIG options, the build can=
 fail
> > with:
> >
> > undefined reference to `media_player_controller_create'
> > undefined reference to `media_player_set_status'
> >
> > Otherwise. So disable it when not set and enable it by default.
> >
> > The packageconfig option is the same as in Styhead.
> > https://github.com/openembedded/openembedded-core/commit/ebbdb7cf5c0a3f=
0e6773704d4c4cc570358ec611#diff-9d9284f6f27a81c75dffffd6d601b40c8266ae12e67=
8d0a49c46bdb8356a0e91R52
> >
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> Technicality nitpick, depending on how important it is deemed: this
> patch is missing the original submitter's sign-off.

Good catch!  Thanks for reviewing.  I will add it before merging.

Steve

> > ---
> >  meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes=
-connectivity/bluez5/bluez5.inc
> > index 39e1bf389c..731bfa0e40 100644
> > --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> > +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> > @@ -18,6 +18,7 @@ PACKAGECONFIG ??=3D "obex-profiles \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> >      a2dp-profiles \
> >      avrcp-profiles \
> > +    mcp-profiles \
> >      network-profiles \
> >      hid-profiles \
> >      hog-profiles \
> > @@ -35,6 +36,7 @@ PACKAGECONFIG[nfc] =3D "--enable-nfc,--disable-nfc"
> >  PACKAGECONFIG[sap-profiles] =3D "--enable-sap,--disable-sap"
> >  PACKAGECONFIG[a2dp-profiles] =3D "--enable-a2dp,--disable-a2dp"
> >  PACKAGECONFIG[avrcp-profiles] =3D "--enable-avrcp,--disable-avrcp"
> > +PACKAGECONFIG[mcp-profiles] =3D "--enable-mcp,--disable-mcp"
> >  PACKAGECONFIG[network-profiles] =3D "--enable-network,--disable-networ=
k"
> >  PACKAGECONFIG[hid-profiles] =3D "--enable-hid,--disable-hid"
> >  PACKAGECONFIG[hog-profiles] =3D "--enable-hog,--disable-hog"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#216063): https://lists.openembedded.org/g/openembed=
ded-core/message/216063
> > Mute This Topic: https://lists.openembedded.org/mt/112650828/6084445
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

