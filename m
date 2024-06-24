Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2B7C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 11:08:11 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.137986.1719227283849237240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 04:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JY7ge/72;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso44930081fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 04:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719227282; x=1719832082; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnAv+ndoeqwFWSCH9VhHbxdSYNKFq6cBqpWzyad5UZI=;
        b=JY7ge/720LU46m7bqzH6Gt+7WbeP0sYcklIlq50THe1/F7IJX1p14bHF/mId/ra7Rr
         JwmEyJNUWaZMNExCoJbgSjKLQWN7/Qf97Mn//4vaOHvSY2o7XAcf2GqLbAaNpUPSp29d
         DNgQmng6jUO5jhYZzrtA8eRgBK2ebpVChXiKMD1ho6ALgr5ALVtPa3gTe2sdC0fO1BMW
         ON+6okBg7ETILPWNPqS0rSK9ptNoN7Cfw8ZQctTg06EQbdYv3hemngH09y0PZxk+YCyG
         wIYw0CMz7bePnSRCAS2O64xvO9wchrPKKLocATuAGIgrr1oWBUNj3xBGTt75mfRKDOr8
         SntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719227282; x=1719832082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnAv+ndoeqwFWSCH9VhHbxdSYNKFq6cBqpWzyad5UZI=;
        b=ehI6RgYkutgFrtMqLuFXJrxjz8Fx210xYd/8wuGqaCh62yZgTuvalkoS4wtKREJYhv
         jMH91kPX0f5qz0XvP6VaCk3oHIVGRsWPuU1yWbmMYyOTs7xPeBXtjuNgaDE4CRc2eqYP
         iq5h2bT9k94+NGOy8v+vCy3qoHL0TqypP7jkFnfUYgTKseofzHY4xoHt9IpijHYBe4M6
         CpNKXMp/Oz5L81GbmXZyUcHFAkNNyEBI2RrBIRYb+k3bQvVlSIBFIQkzBmf8Jn5zT4ge
         piNrLSl3hXfc4haTzHvJLBR0djc6zsn8nkKahXHNUXB9Hrny3lh3S26KxJizcU6dwly4
         A5cg==
X-Gm-Message-State: AOJu0YwrvrWV+j3O5sICQtZIdaJ6R1wxpQnY1gDWCAm27DyO3hnhw8/V
	vXgZxJZtM6cyE9tAk2TtaRq+7tHG8Lw/ejF8kvOZndd919BWS8iy5O2boLnAKwRDye+XYkgrFwa
	0oN5V3Z4CH3+jHkQJihJmKDpERaTySoCR
X-Google-Smtp-Source: AGHT+IH5jypxyZzxOsK6OnEmGBus/hNtL6gUAsFrViBvofTkE6XukMqpSTc/iRRG5gBwnhGXrDSSgH/QRUURngT/RoI=
X-Received: by 2002:a2e:81c2:0:b0:2ec:1890:5e6 with SMTP id
 38308e7fff4ca-2ec594d05aemr28178691fa.39.1719227281779; Mon, 24 Jun 2024
 04:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <QrUS.1719222991270481706.aFEU@lists.openembedded.org>
In-Reply-To: <QrUS.1719222991270481706.aFEU@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Jun 2024 13:07:50 +0200
Message-ID: <CANNYZj9TcPZ3oCiphS5v4X0s9qEHPxPm6EqjkayN-ZT3kWL2nQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.bbclass: Fix broken dev package dependency.
To: sreejith.ravi087@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 11:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201076

On Mon, 24 Jun 2024 at 11:56, Sreejith Ravi via lists.openembedded.org
<sreejith.ravi087=3Dgmail.com@lists.openembedded.org> wrote:
>
> Currently, the process_pkgconfig() would process only the "Requires" key =
field and ignore "Requires.private" while generating the dev dependency cha=
in.
>
> Example: usr/lib/pkgconfig/libical.pc
> ----------
> Libs: -L${libdir} -lical -licalss -licalvcal
> Libs.private: -lpthread
> Requires.private: icu-i18n
> ----------
> Depends field generated for libical-dev
> Depends: glib-2.0-dev, libical (=3D 3.0.7-r0)
> ------------
>
> When trying to resolve the build time dependency with libical package usi=
ng =E2=80=9C-dev=E2=80=9D ipk generated, it will throw the below error.
> -----------
> Package icu-i18n was not found in the pkg-config search path.
> Perhaps you should add the directory containing `icu-i18n.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'icu-i18n', required by 'libical', not found
> -----------
>
> This patch will add the packages listed in "Requires.private" to the depe=
ndency chain.
>
> -------
> Depends field generated with this change for libical-dev
> Depends: glib-2.0-dev, icu-dev, libical (=3D 3.0.7-r0)
> -------

The icu-dev package is already listed in the Recommends section that
is formed from shared libraries libical uses, so you need to install
the recommended packages:

%package -n libical-dev
Summary: iCal and scheduling (RFC 2445, 2446, 2447) library - Development f=
iles
License: LGPL-2.1-only | MPL-2.0
Group: devel
Requires: glib-2.0-dev
Requires: libical
Recommends: glib-2.0-dev
Recommends: glibc-dev
Recommends: gobject-introspection-dev
Recommends: icu-dev
Recommends: libgcc-dev
Recommends: libical =3D 3.0.18-r0
Recommends: libicui18n-dev
Recommends: libicuuc-dev
Recommends: libstdc++-dev
Recommends: libxml2-dev
Recommends: vala-dev

Seems like there's quite a bit more needed for a successful build than
just icu-dev and glib-2.0-dev.

Alex

