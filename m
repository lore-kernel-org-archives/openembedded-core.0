Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D49C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 21:18:44 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.96307.1705353516247363074
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 13:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mnb3EXtG;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-204f50f305cso6106989fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 13:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705353515; x=1705958315; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lO3/+PfY6qnNXOkCeWRgeCF8GUbKIo4LKMKqnH/pCfo=;
        b=Mnb3EXtGj2Zvz5TfMyzcl4YhE3G/U/7JqNQh5WeChoyuRTIz4UO+QD3EYwKIL+K+KW
         Q2IeVFI2oYQu/ub4tyDo6whwcBiVnkeyWTm5lRMeMdVhDiPy/n/AJQXaAiT6Kxilnklc
         zO0Fc63JRhpLTG3UiMCNzeI1x4VMpVOPzoNnDZHHox+asdeDlCNQ3/49iHH1p4SfrKSd
         S60fVOkWuIMvnU6sqGr8sy4Q+BRr/EhI8AJSxO+RsFtUhTPNflBsTn8Wlk3f+OsGInmW
         cIsQ/Ov/QnsG8dBF5UvgG5l2ZRCfDrTIbHnEo5e2NghY3tTDdByk5tsV+BI/rKrg8OJb
         a3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705353515; x=1705958315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lO3/+PfY6qnNXOkCeWRgeCF8GUbKIo4LKMKqnH/pCfo=;
        b=PJAgr7qStmzhgFHeJjgBYfwSIYBKnnBGWdXEHsoCIh7BE9zNnsTpKAJgopLOEFLxDv
         4YpLTT1lBhx3LiyUljuUIgrboaWaSAFM5lfv43mMnx3cHsUdd8FZTEVVkg/HIoncMmFZ
         BWvfngueQCnhbcOqqN1QQEg6G3flFZX8j9ysuyoaw1K7VspRilFfIHKMYT52jVTCAntD
         xBckSI+cFrxq1q8oE5s4c6x42ONRaPvjLHpTvMfSC1IKpoP+9QxNLf0q+wCb7DUbTKq0
         Gn43EL1sAYQ2ye5fWLdsYtaF2v8CWGRY2s+ulOc6EB9TJxe3yE7mQRxJnCtxtH3/Y//2
         ubTw==
X-Gm-Message-State: AOJu0YwsSKiRgRdukD+excxS3bQMB0NxIyFPBfQRgvqyCctQybnyPb03
	Ii/jrrdrVom1HtoBZnmlHFZcVQeSz6NIb98PEY8=
X-Google-Smtp-Source: AGHT+IFW+zWkErrwS9FzTaE/M0O19712mPPs0XnKHmxj4s59BRHT5gYvIQCjwd2sJkyRQInmvn53nkRN6NxEG5jdlT8=
X-Received: by 2002:a05:6870:3913:b0:206:cf8:f0db with SMTP id
 b19-20020a056870391300b002060cf8f0dbmr8185427oap.43.1705353515437; Mon, 15
 Jan 2024 13:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20240109192923.3183219-1-raj.khem@gmail.com> <3B3DBDDB-9E17-431A-B3E8-DC8E072066FC@arm.com>
 <CANNYZj_oydN+0ODz_kCjus74uzF-wUhcZ1nfmYqrRo+BoupB4A@mail.gmail.com>
 <3642B18A-B5F2-40EF-B1A9-303923477117@arm.com> <CAMKF1soNT6kc-jCNsop1qaQVxDphZEO3DNa5AB4jwP=2Rd729w@mail.gmail.com>
 <D8380C51-6614-4A8A-AC51-E702FC039561@arm.com> <CAMKF1sp9qs6Ue2n1S6cJbWu4wJ6MPb-WgnpBaqq-MMYwU9hrDw@mail.gmail.com>
In-Reply-To: <CAMKF1sp9qs6Ue2n1S6cJbWu4wJ6MPb-WgnpBaqq-MMYwU9hrDw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Jan 2024 13:18:09 -0800
Message-ID: <CAMKF1sqaDxgSprt3OWKRKQ123k3DRumP67xknU0iNNOFOzpvNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] glib-networking: Fix ptest failures with
 openssl backend
To: Ross Burton <Ross.Burton@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 21:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193803

On Mon, Jan 15, 2024 at 11:38=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> On Mon, Jan 15, 2024 at 9:06=E2=80=AFAM Ross Burton <Ross.Burton@arm.com>=
 wrote:
> >
> >
> >
> > > On 15 Jan 2024, at 16:53, Khem Raj <raj.khem@gmail.com> wrote:
> > > Where does it say it does not support? On the contrary there are patc=
hes in this area sent recently
> >
> > https://gitlab.gnome.org/GNOME/glib-networking/-/commit/8e1d80c1e0fc52d=
17d08a21946fa4a86ec30e1db
> >
>
> Right, it was 3 years ago and note the mention kind of systems where
> it maybe in use :) and OE is used for such
> distros so it might be useful. The fixes to get openssl support
> improved have happened after this commit.
> Its fine if we do not want to accept patches here and wait upstream to
> support it fully. Because than it's easier to direct
> upstream work correctly. We just have to be clear with these criterias
> in general.

Lets drop this patch.

>
> > Ross

