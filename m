Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784D7C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 15:52:46 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.56775.1741017157088601620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 07:52:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vclwd9/D;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.178, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e60b04fc3edso3163011276.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 07:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741017156; x=1741621956; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7op98fMuStN4UgbvB42vDEWFgYv48eBG+NTW8ii5Kk8=;
        b=vclwd9/Dyl2uHEnvlDFLNys2b9YQavsjQH3KeQ8220kDijnVW7w8/cgRk23jPBwmvp
         zTZGBqjI8m2ztx/YSfu+EqwW2pp8z8ryRXui6PtLJVw7U+AO/3B8RYQF83Y9Ha0H0UYM
         zMWr88zcs9CAXLz7CK5JorQ5e3JKrgTyTG90Y4jjHvAU97bDdmTFRBLAy4AI8V3HGBzw
         iAIsjQNT3o/694yqklBMJsOLBSzArt1sPGMYMmoqwZksvwOYcbCNzChdCegr9d8mjn+3
         sPKTU/AhS+E1+44UiKbOH6W+DQo7Mg4Wyl2DxjF0UTDaTXliLwk4PSIC+YKQBMVLtrVL
         GwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741017156; x=1741621956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7op98fMuStN4UgbvB42vDEWFgYv48eBG+NTW8ii5Kk8=;
        b=Dwx58IEFAETSq22KHl5+R3wLV8nMjvJ4BLiwyHjK2DPrifNspQ3wbn5t+r2fLZ2A6/
         d6qgVFbBDiyD0va+aKc41JAXoZ9vojCuo9emZRJHSZhr6OagihbTW6WeGDYCUC4ZOJ5a
         9per4xesJM/jUGBFU2PusU9q0Y5nqRrb2n0N9ov3HoIh0qzohQ5NwOdCfqDiq0yjbtnf
         LXYH3tP1t4OaB2MjomTBQ5kjrsnaivpZHFzJxZcqGKS0+rG2i++fD3zYIaC8M/AHs3Mq
         56BWfKpV8uyozRjvtpZZ/4x+0eipOguKgKvqIzkrAQWiYch1cECFYcnM/teM3vhdgKF2
         430g==
X-Gm-Message-State: AOJu0YwFHaP6kE9Eglp4ISkUG+QTDsjn3jQ77zOitt08AvgOFfqUwBpk
	onYaQF4xNja58c8yDpHrChevyfnjJE90iND44h8kZwBvy+6F4RjXG8MQYl95Q1RHIzTz+z+gMZH
	K/xsOslJuVbJWtZQb+Y6tnOedwUwBHpMCOpvrqA==
X-Gm-Gg: ASbGncscXzVryubjLHRtg1SOyqrloMTG3Lk1ipTYfgtA5KC0hYvKgj7Xvm+1DiR74ij
	Kyss/CAXakuLYTuU9axBFO1WCwuWc4rbahSgdTgAY+4p3z8pJWTjNv3Bwujuc63Jh0gXDMyiTiv
	fTvKW7XJRETz2917eUVLPJ0HlViNaDZ+dM9zIiUvC6iq2+E0ZtgMMjgcapFQ==
X-Google-Smtp-Source: AGHT+IEEw1yQdisrFA2WCB0kRrJK3f3J09hEQz7k/LnFvP+Pz9sYYtBw0i12VRJC2dJC/yQUwDo+znrbJzxizvhxH6c=
X-Received: by 2002:a05:6902:2743:b0:e5e:700:92f5 with SMTP id
 3f1490d57ef6-e60b2e8e4f7mr16484581276.2.1741017156118; Mon, 03 Mar 2025
 07:52:36 -0800 (PST)
MIME-Version: 1.0
References: <20250303134038.102355-1-alexis.cellier@smile.fr>
 <CAOSpxdayD11HBG8t2CCNgGF1PkEMH=pagm2tfh7hfk3HhRjU6Q@mail.gmail.com> <CAEs58j5dRQEoNkA8MXcAV+qqvaCNDUQqxdkfNW8yOqHkBrspmw@mail.gmail.com>
In-Reply-To: <CAEs58j5dRQEoNkA8MXcAV+qqvaCNDUQqxdkfNW8yOqHkBrspmw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 3 Mar 2025 07:52:25 -0800
X-Gm-Features: AQ5f1JqDnBmwHQ_IW46bytCPCCrLeqyEHiSGvq_Sd2N-5Vmd21rtQGOc4-Mfs8Y
Message-ID: <CAOSpxda01D6H2fmpUfJPVKOShPnp7JhP7YCw5isXq_kRu3dVtA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] systemd: add libpcre2 as RRECOMMENDS
 if pcre2 is enabled
To: Alexis CELLIER <alexis.cellier@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 15:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212214

On Mon, Mar 3, 2025 at 7:21=E2=80=AFAM Alexis CELLIER <alexis.cellier@smile=
.fr> wrote:
>
> Hi,
>
> > Is this also an issue on master?  If so, this needs to be accepted
> > there first before I can take it for the stable branches.
>
> No, this is not an issue on master.
> On master, systemd (v257) has a tool to generate those "weak"
> dependencies, based on "notes" in the code, that is used (see file:
> `meta/recipes-core/systemd/dlopen-deps.inc`).
> On scarthgap, systemd (v255) already uses dlopen, but this tool and
> "notes" are not in the code yet. So we cannot backport what has be
> done on master.

Thanks for the explanation.  Will styhead need this patch?

Steve

