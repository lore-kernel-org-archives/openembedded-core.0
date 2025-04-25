Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E670C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 14:55:30 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.8426.1745592921218315024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 07:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Gio/88il;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.176, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e63a159525bso2056279276.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745592920; x=1746197720; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Msgb43XQukonp0PjvSLxzD72kg71ClnuuuvQ8t4Sxb4=;
        b=Gio/88ilayKkMah35WwOvc/b17S20ggtubq2wkTX253CIZmxWsGK+c6M692biXOG0d
         bPXqIbtmFC3E06hu0r/Txo+8CCXPq8eBcptqkna4A0oAD+AIvtu5vbWUgk8AhyVms5gd
         eXh08hqHh7NO+O5j30ig8B8YxbZ4s2h6kLRi047sRuNA8ESYFxrj4Bl6CNT2tUCG+kCc
         er8A9ip1ih+XkivdeijpeZ1pj9qDVG5o+1zvHWTtMQM23DFksTIQMnGZJTBMxfXDHveW
         0Z5qHZKsujaiG+10HsT3qPQvgjSKwhaie28KTUSDrjXhGYYvPThVJeN/GLkEqO2YvXJO
         JWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745592920; x=1746197720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Msgb43XQukonp0PjvSLxzD72kg71ClnuuuvQ8t4Sxb4=;
        b=XK7eJRrO4mhFl0Y49oMxitE475Qd8MotNN/Psjs9YiQFZFFrsYDSkEMLy4tbU0AbrE
         3ubp78FACi4scNB5H0d0/dnR+Ufmbep36aTPQ1t5czLjIgfHGlpBabHVhTw8uC5b0ZOd
         AAD9/3XvnSUg7lBZgMI+HSOYnLKX0LI+AMfIPnH47sbOflrIoF82JpF9ffHP/WIwSeab
         xXWNnimBDP0yRsRYJG4JQE4F9UebaL3Cj2JrRT/Q9oTLAzPRGR/d4X9TWuaIKyc1Z40K
         7J8s2cNjaYdtiRozwvr4F/nQn78hyf9xeDubzKO97W+/WjovdCiz/2N2ouIaAAcObWzt
         5s8g==
X-Forwarded-Encrypted: i=1; AJvYcCVal9VcLkuNsyPUNoOS54rih6Sb+uS08zxxxSJOSleepzBShm+dj4MaPdKqOss9v7CvCs/ly1PFlvWyROKsREHTHQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxhH1KGgalJd8q/DIZAkmjDpF0DO9Tfhgg3GY0I41iUaTq6p3Jo
	43xVI7V+1K6Djn6JyeGBjsxnDndPPCbe+V2FfNTyl7O/knua9mKx1FmltJUjHuMN5qEGb0xiy74
	1khqi7vFwk/l/7iQ86py5a3HvytpHZ8uhbmPVAy9xdDLp2Bbm
X-Gm-Gg: ASbGnctvA6B9x1ukhynY2Q2/g4z6lvER+4gNsqcX7a0fhYLj/sAtpbbINGG1zb8/peN
	dFeJtIP9BSR9IJGflhrXQp9a5946GrAeFF0EkuyXPKRSuJGaUY5Ca+VocmM5QgzveB00OXt5+Fg
	J/Ny1ZTNytBKQnXmv+45UmfmhoyJk0Zin69NUUSj8yYnVGs9+Hlm4Ib6ipx+F5aaEp
X-Google-Smtp-Source: AGHT+IG9+2MLCV2uiBESs75gvdUwbir/OOLy6qCrzYw2zHIyqGxSWpRfmjU3hXWosgPRM4k7fgRCOqGXW0j8MNTYtSE=
X-Received: by 2002:a05:6902:2402:b0:e6d:f320:7833 with SMTP id
 3f1490d57ef6-e73165a1fa9mr3500968276.5.1745592920274; Fri, 25 Apr 2025
 07:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250425121803.767765-1-archana.polampalli@windriver.com>
 <20250425121803.767765-2-archana.polampalli@windriver.com> <D9FQHSM6H94V.3JOM4K3FAOS0I@bootlin.com>
In-Reply-To: <D9FQHSM6H94V.3JOM4K3FAOS0I@bootlin.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 25 Apr 2025 07:55:09 -0700
X-Gm-Features: ATxdqUHtsEYc9JhKx3DCEEAc4DB9J6sEv6pBeWCdHBYvB4G58fXs1HIyU8NEF98
Message-ID: <CAOSpxdaKT7k84F0UeC8PRPPmG3i=gy6bTarYAAQpmMpcshbGCA@mail.gmail.com>
Subject: Re: [oe-core][scarthgap][PATCH 2/3] perlcross: 1.6.1 -> 1.6.2
To: antonin.godard@bootlin.com
Cc: archana.polampalli@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 14:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215478

On Fri, Apr 25, 2025 at 5:55=E2=80=AFAM Antonin Godard via
lists.openembedded.org
<antonin.godard=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hi Archana,
>
> On Fri Apr 25, 2025 at 2:18 PM CEST, Archana via lists.openembedded.org P=
olampalli wrote:
> > From: Archana Polampalli <archana.polampalli@windriver.com>
> >
> > https://github.com/arsv/perl-cross/releases/tag/1.6.2
> >
> > Provide support for Perl 5.38.4
> >
> > Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> > ---
> >  .../perl-cross/{perlcross_1.6.bb =3D> perlcross_1.6.2.bb}         | 2 =
+-
>
> Small thing but the update is from 1.6 to 1.6.2, not 1.6.1 to 1.6.2 as wr=
itten
> in the subject.

I'll fix the shortlog.

Thanks,

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215472): https://lists.openembedded.org/g/openembedde=
d-core/message/215472
> Mute This Topic: https://lists.openembedded.org/mt/112449881/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

