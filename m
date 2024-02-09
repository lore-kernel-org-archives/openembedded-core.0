Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF88C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 17:50:37 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.18922.1707501028670077451
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 09:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ImHeNUFd;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-21a01c100a3so422516fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 09:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707501028; x=1708105828; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YfXSiUpGbs6T72Rc9day1zpHuii8f03Khgj7QF4lR0=;
        b=ImHeNUFdIdzwMtLjaPTSww2NghL66FTgfmblrCqK76IEmStPwdi/RnERC9keA03l4F
         FOi87ErbYwgswHTMLSWQ20Ne9IVo+ePm63Qc3J6ytVeLztitrghLw2fqMDp4nUyJJUMB
         1sknEMtgNlZRLCLAyKhez2kkrAFeupL/2aPvfq6GXwmAwoeJd0Y5qHATyFXxgWBgGbrJ
         kJdrJ+61Ahmw8qvgWbVYlSTg+MKz8lzKnZvKO7CqxJEvxu/070zRjktgqdufh6qEVtfc
         q8PNSiNDuHfnRVjtooyu6Jc/MysZHgdnVprR4s+rz4zPMRJWvJlMfGaWReCNbw9+sQGn
         p5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501028; x=1708105828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YfXSiUpGbs6T72Rc9day1zpHuii8f03Khgj7QF4lR0=;
        b=awImhHgG7l4WlphrMgP5Z4QGNzg11+ogKq25/vRcj5vnTMyZOI5TIuUtQvW0hUqEPR
         avEl3tmlFr6KAfuOtpmGU2FoQcAG5a1gMSPu99hTDGo3dyna+DlE+nt1x+fNAji+yRjI
         VyD4RG2/9zOFuvLFDfPJYrOQoP5GYzIUiupmEuxn4/A5A62GxsKdfKC8iAGgD9eubQnt
         lxucxF0Un9/B+9wpbEPG/GeUYUbmdPh3+PfeiL4MyoVBGBLIZ7x5W1B38VyP5svZtOdc
         n4UGOGPCu07y/FUb57pyqFvH5rHzMUH1QY/qsSPCLjUAy4JmnGO+x5Zhn3t6cPZYkAbq
         AMzA==
X-Gm-Message-State: AOJu0YwDK8uVZ6KZYSCa6AJaKTxYlzah5KspEQicoYpA5EQJnwNlBG4t
	SuqI0XfVs7xRYlmr7X+KyoyjWzYbGzs5WoQCkXfS2OvjkqqS8XXW7zY3CFAJc2EnH3/fBBvS54j
	vT6ic/eT5aAhxEgYLoIZXQ9875bU=
X-Google-Smtp-Source: AGHT+IEO7NmzfFhzDEQ1z89xs5d05kBQQYE97g4w8BjOysvlG6UZtIABG+/i9nd7P3QpT8bjSHIrG8xXjCiY9+zcTig=
X-Received: by 2002:a05:6871:b0b:b0:214:d3ae:d47c with SMTP id
 fq11-20020a0568710b0b00b00214d3aed47cmr2677346oab.0.1707501027846; Fri, 09
 Feb 2024 09:50:27 -0800 (PST)
MIME-Version: 1.0
References: <20240208185641.2969396-1-alex@linutronix.de> <CAMKF1sr8rx9Mcm40KCFJxu1S5546tQGD=d8ox1Kh74uKScFk1A@mail.gmail.com>
In-Reply-To: <CAMKF1sr8rx9Mcm40KCFJxu1S5546tQGD=d8ox1Kh74uKScFk1A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Feb 2024 09:50:01 -0800
Message-ID: <CAMKF1so3xAO2OMnurrUf+BBE+VKhbxNSzXnDL9zYyB+tguYMyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow: add a packageconfig for logind support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 17:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195239

On Fri, Feb 9, 2024 at 9:24=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Feb 8, 2024 at 10:56=E2=80=AFAM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > This was causing host contamination in particular, where
> > libsystemd was installed on the host.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/recipes-extended/shadow/shadow.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-ext=
ended/shadow/shadow.inc
> > index b8e5e285c45..16b99a0b60e 100644
> > --- a/meta/recipes-extended/shadow/shadow.inc
> > +++ b/meta/recipes-extended/shadow/shadow.inc
> > @@ -74,6 +74,7 @@ PACKAGECONFIG[acl] =3D "--with-acl,--without-acl,acl"
> >  PACKAGECONFIG[audit] =3D "--with-audit,--without-audit,audit"
> >  PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinu=
x libsemanage"
> >  PACKAGECONFIG[libbsd] =3D "--with-libbsd,--without-libbsd,libbsd"
> > +PACKAGECONFIG[logind] =3D "--enable-logind,--disable-logind,systemd"
> >
>
> have we tried it with systemd in distro features ? In my distro
> settings its causing a dependency loop. see
> https://snips.sh/f/GkrM4zsDk1

shadow is added to taget dependencies via useradd bbclass see

https://git.yoctoproject.org/poky/tree/meta/classes/useradd.bbclass#n12

so a simple packageconfig with a dependency on systemd is not going to cut =
it
it will work for non-systemd cases perhaps fine but not systemd based syste=
ms.

>
> >  RDEPENDS:${PN} =3D "shadow-securetty \
> >                    base-passwd \
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#195172): https://lists.openembedded.org/g/openembed=
ded-core/message/195172
> > Mute This Topic: https://lists.openembedded.org/mt/104244839/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

