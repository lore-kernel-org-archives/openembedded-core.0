Return-Path: <alexis.cellier@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9CBC282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 16:21:16 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.57706.1741018867836010136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 08:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ne/NGmGZ;
 spf=pass (domain: smile.fr, ip: 209.85.208.42, mailfrom: alexis.cellier@smile.fr)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e52c1c3599so2903529a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 08:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741018866; x=1741623666; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsLlXQZU4ScfXucw7VnqVTZwjOp5AWddMsOYn70W6PI=;
        b=Ne/NGmGZL7QeektR3ndyE/uCkiIFPEg7FCVRVKA+FtcADAmyxvO781wpp2xkEdC6AM
         WgBNd/Z4O/uithSTkPXSe2a94RcEGguM0C+1iH4Llp4UZaw1Lw11ZSCVExEc79T3kXIX
         I4yGhMXAT5GgIUcN+SPwsgtBBGABe9UT5jQTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741018866; x=1741623666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsLlXQZU4ScfXucw7VnqVTZwjOp5AWddMsOYn70W6PI=;
        b=Ir+OH/cFAPLMQWlxFuVns40hGaycsMoSZXhaP3YYTxLkuEYPR5h0LFlCBRz1Cl+BSK
         t+rXR4Pcxl9shU1WEi5tJytyC+ju5B9v4Y58OCVCqoMC2n40OJsP+hYyjvAzoNhsJZED
         UJSqiSfR/VfFdLc2i+yKM72J3JP71PmafhR0s8ZvSTmM2yiKfUBfAiuOLSgA9h3onKm5
         NDLw6O9Z2IB74zNvQCZUgoMHmoNfDb5431QvkFW2Cu0b3D1Ti93gPRtIkPJxdHF7ZIyl
         XSDue91Ywzpdm3Htah90wXMGB3Zia+9jtkFa2sZ/Hit3fyfbfc+N9QPc3EpedMs9sUM3
         TCyA==
X-Gm-Message-State: AOJu0YzHKTwFpYIWQ9PO7dpB+AFCHNTldZmC5D5k0OdaSKYDl76m1Kiu
	EHhH12g6Fq7SutgUI1+EcqkdX7AWJJuKdQuVsb5lIoFaybe4xEmIyHFvCVY2puvRmQ5Hj/lMxek
	dkXpe//hTjBS2xHUjWJov+8f+yNCjWJ61GseHEw==
X-Gm-Gg: ASbGncthhW0GjYrD5qcYQcPZ6SPRoxDcEkZtdkL7Fshy2OrYKRywzsXlv28aT5AJOwA
	bddivcWYNJ8sthicGBPl+oNJwjdR12ZgQFqPNmIJfa4W2Qt2k8xJSLyZYCn9CqgbHwtkwtrvgHb
	vCcqtDyeropnkJ+k90kwqLVjxoMMQ=
X-Google-Smtp-Source: AGHT+IEEXdYCppvM34ig3TWCjGLtzrRbLJg6JIYXvon08U5+lLO1rpMo9gwl/pRM4wYSZ0qCF1WRKsDofVf+9L0oBgg=
X-Received: by 2002:a17:907:c0f:b0:ac1:e53c:d149 with SMTP id
 a640c23a62f3a-ac1e53cdc73mr189639166b.13.1741018866061; Mon, 03 Mar 2025
 08:21:06 -0800 (PST)
MIME-Version: 1.0
References: <20250303134038.102355-1-alexis.cellier@smile.fr>
 <CAOSpxdayD11HBG8t2CCNgGF1PkEMH=pagm2tfh7hfk3HhRjU6Q@mail.gmail.com>
 <CAEs58j5dRQEoNkA8MXcAV+qqvaCNDUQqxdkfNW8yOqHkBrspmw@mail.gmail.com> <CAOSpxda01D6H2fmpUfJPVKOShPnp7JhP7YCw5isXq_kRu3dVtA@mail.gmail.com>
In-Reply-To: <CAOSpxda01D6H2fmpUfJPVKOShPnp7JhP7YCw5isXq_kRu3dVtA@mail.gmail.com>
From: Alexis CELLIER <alexis.cellier@smile.fr>
Date: Mon, 3 Mar 2025 17:20:55 +0100
X-Gm-Features: AQ5f1JpOX1Wdl8EOwNPJwE3E763dteEKr4MMClmdEj5lz2yr1joNRNxrbroSjeY
Message-ID: <CAEs58j6aTeBZkb2Yx_RpY81+P7Bk68-pTCyeV6kHB-eusXWRuQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] systemd: add libpcre2 as RRECOMMENDS
 if pcre2 is enabled
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 16:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212219

On Mon, Mar 3, 2025 at 4:52=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:
>
> On Mon, Mar 3, 2025 at 7:21=E2=80=AFAM Alexis CELLIER <alexis.cellier@smi=
le.fr> wrote:
> >
> > Hi,
> >
> > > Is this also an issue on master?  If so, this needs to be accepted
> > > there first before I can take it for the stable branches.
> >
> > No, this is not an issue on master.
> > On master, systemd (v257) has a tool to generate those "weak"
> > dependencies, based on "notes" in the code, that is used (see file:
> > `meta/recipes-core/systemd/dlopen-deps.inc`).
> > On scarthgap, systemd (v255) already uses dlopen, but this tool and
> > "notes" are not in the code yet. So we cannot backport what has be
> > done on master.
>
> Thanks for the explanation.  Will styhead need this patch?

On styhead, systemd (v256.5) already has the tool and notes. So we
should backport what has been done on master.

--=20
Alexis Cellier
Smile ECS Developer

