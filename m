Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3EAC0015E
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 12:48:41 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.5146.1691239718577939456
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Aug 2023 05:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20221208.gappssmtp.com header.s=20221208 header.b=FPvCv8Dm;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.179, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d07c535377fso3283741276.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 05:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20221208.gappssmtp.com; s=20221208; t=1691239717; x=1691844517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6a/j+rk3nwG+fWkZCrJ+FhRfHZ6m33+0KymKkev3H/g=;
        b=FPvCv8Dms/+huobvbTEVJ9KPzQZHvW6KPjUaI9VPx7RZ1iHUbGUgPV5vlG0zSHnLaM
         qL5UCDtpOqTBR0rF3dB3H3YhRLS0pM2HkRJd9gcWDTuIxy9YLomuyIMK4K/TODFMGLlh
         Uu4aReAx2Qn8955gJJrJux9Gr5Z8ZibE3MzBiC4tmyl9wa8DIUBBDptwvL08DJWxBfwh
         bNBrrlVly7Kq1sgLxggCej7Zcwxh/qFu81SJCQdWWuuGUWgn3RE1BhmkUEVbk/62kcDD
         lJ/0AEeGsnuSJ0EPDBJMUfCRyKuO3c9zgD+cr7RcocG7yTrkFlTKYjLk5GlASSxNFmpX
         /1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691239717; x=1691844517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6a/j+rk3nwG+fWkZCrJ+FhRfHZ6m33+0KymKkev3H/g=;
        b=Lv88I9xx6wdhtW/SM/+32DB1lW22LH5PVW4+dSqJWYY8o322eGr7o4rjhEhLCjapbe
         Q3KngOX6Clj+L108fjUrcL4fEmqad4zi6UDeSubUhkcOujvGGuBBr5w/z5hyWqC/Wa6l
         ntYCUVhQRypjQktNvfjmQtAzEAYDzCWzeK8RcRP38EtLBKiP4cKF2g82nBUsd2VIxpf0
         EacOgUjbGNZtBArVsD8dPEYuVyD9J/IoFOSpG9YXsWlW7YRYhDw4EMt1ItmLVZEftir4
         zT5W9e8HTkXBvuHpSO/z8NGgKVgDKon1/12/y//e3iH17UuwhLnmj8Hdu//yxMwtyTy/
         bOjw==
X-Gm-Message-State: AOJu0Ywyup4IV5Wa+PqDZ09EEEN8xgEqYR52fDeR9+HWAmmUd+hvjngT
	5vrFcJV9v/MwK4JAsDxgmg9OoGeoCL23PYNSfcbOwlNV
X-Google-Smtp-Source: AGHT+IEM2k9panzAgwTURu1qyOHhvc68ysuXbs/Ud6nsfzI/8MBhbTiXYZ4QByV/PIq8SAuWHBGQUw==
X-Received: by 2002:a25:908c:0:b0:ced:44f6:2d6d with SMTP id t12-20020a25908c000000b00ced44f62d6dmr4408818ybl.58.1691239717441;
        Sat, 05 Aug 2023 05:48:37 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id w3-20020a05690202c300b00d13b72fae3esm1233589ybh.2.2023.08.05.05.48.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 05:48:36 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-583b3aa4f41so32808727b3.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 05:48:36 -0700 (PDT)
X-Received: by 2002:a0d:c887:0:b0:583:d100:320d with SMTP id
 k129-20020a0dc887000000b00583d100320dmr4887371ywd.48.1691239716174; Sat, 05
 Aug 2023 05:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230804200438.1651568-1-otavio@ossystems.com.br>
 <20230804200438.1651568-3-otavio@ossystems.com.br> <CAMKF1spzbc6GFMxX+21Zn0RZ=f0pauNKKPBbLZjA4XSQ7eNOVw@mail.gmail.com>
In-Reply-To: <CAMKF1spzbc6GFMxX+21Zn0RZ=f0pauNKKPBbLZjA4XSQ7eNOVw@mail.gmail.com>
Date: Sat, 5 Aug 2023 09:48:24 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoReV2af7jsQHjM2GJch9g4g3Pv=HJffc0aW6+jjQBpGQ@mail.gmail.com>
Message-ID: <CAP9ODKoReV2af7jsQHjM2GJch9g4g3Pv=HJffc0aW6+jjQBpGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] weston-init: mimic systemd behavior when
 running in sysvinit
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>, openembedded-core@lists.openembedded.org, 
	Tom Hochstein <tom.hochstein@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 12:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185552

Em sex., 4 de ago. de 2023 =C3=A0s 20:54, Khem Raj <raj.khem@gmail.com> esc=
reveu:
> On Fri, Aug 4, 2023 at 1:05=E2=80=AFPM Otavio Salvador <otavio@ossystems.=
com.br> wrote:
> > -su -c "XDG_RUNTIME_DIR=3D/run/user/`id -u ${WESTON_USER}` weston $west=
on_args --log=3D/tmp/weston.log" $WESTON_USER
> > +if [ -z "$WAYLAND_DISPLAY" ]; then
> > +       WAYLAND_DISPLAY=3D/run/wayland-0
>
> This can be set automatically by something like
> WAYLAND_DISPLAY=3D`basename /run/user/1000/wayland-[0-9]`
>
> That way it can cover more e.g. my variscite/imx8 SOM I have wayland-1

This uses the same as systemd, so it has the same behavior. However,
it supports users to override it using /etc/default/weston. So it sets
this only if unset.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

