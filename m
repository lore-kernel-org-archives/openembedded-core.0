Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8B4E7D0AA
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 20:35:33 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.6559.1695328527664671490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 13:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bGS/QEMP;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso24233031fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 13:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695328526; x=1695933326; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHD76D+6tGdz6jljVYFolviubP0zdDz9osjFHzdtGjE=;
        b=bGS/QEMP+dgh8C3MXEeJSE+RRWNrycaM93P+AhFIIcQ0cKxmUeHFNVe4hCXmXunBj0
         MkkAiZWd7qHe4/3uV6+LVcUpcgZdWzwVqfj4Om3W3MnH14U0UABLOW3E2uHk2sIBEpDf
         CwN6Bq2GkfdgSavm2KS71Dzn/wbww6aSUbtk8vVnaW9sL2ghmf5faago/hugAvUuylK9
         BOXospcVi7y2AnowmSzOLzhc4MLXMHoX5lJGU23lmoDFaJxtrVRGMk8/2Ef1ouVlea+C
         cNaLu3Tkb04f/Lg+P2M9AElghNS8lfxAeTNhHC/L2qH5YMZ04O/aIgphZ0zRcNgd1L5f
         4gtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695328526; x=1695933326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHD76D+6tGdz6jljVYFolviubP0zdDz9osjFHzdtGjE=;
        b=j8Ht91czmvs5shy0+5OyKM7bRV3lPAIEfVONoNGvR2gZZigHsc3Oz9EpEEU5qRjudj
         ESI3LGR/wUUDAnNtCSFwV5+MXUqKCmpTv/xluwLLi/95vpjNsqOxvJfDV1fS78anVbC5
         dxSiLlsAy8u1QdSeawftwB4w8v6gjzUWIp2xi5eDXTTPRaeBOdKtG5wNMgNmnq6hIff4
         +xi1H/LE8V0Z5OT/vD2wVK15NeIrGjnVUPRWFnsKkCqSD9Ss6DyV6Ehnf/gxTkFJm84n
         +IA6Kt2wDRIQ+zQdzWfjijV5GI2x9nrqTS05Oi/ndqsJYBU5wGVYFfl0FVH2RuLjGCWe
         z0hg==
X-Gm-Message-State: AOJu0YwzREFrFlf/tr+/EmEvy6MDgVBa2qzR0T+3l8eIGv4GyUYwIbWX
	kcyUVyZBflggSAiZ2GiMFjMQp7zm9GjdbqHdbsc=
X-Google-Smtp-Source: AGHT+IFsWwi8vhtwVavGv6RbA8tpock3K3FuWh7EKHfU8FGvfqrs8Pslqyjknuxeg+IZHt+mrCVivnE2dW0oLQtMd2o=
X-Received: by 2002:a2e:918e:0:b0:2bc:d5ad:2758 with SMTP id
 f14-20020a2e918e000000b002bcd5ad2758mr6026051ljg.5.1695328525485; Thu, 21 Sep
 2023 13:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230921064727.1260198-1-kai.kang@windriver.com>
 <CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
 <f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com> <VGUB1S.EQNLFG4U297D@t-online.de>
 <CANNYZj-Hv9fRO4rVW4h_R3DdHiNPYQUeQuRcvVdKaBMoYrVqmg@mail.gmail.com>
 <3SXB1S.VJD0PU0SDSPS1@t-online.de> <CANNYZj_zWqLUdoO7PNWJU139y4T6icZeaFOfxUFVK1D-PzihBQ@mail.gmail.com>
 <V3DC1S.GMOO9XQMVAE72@t-online.de> <CANNYZj-JBgC0NQGcjhV_h-EETBp0i59AhvpGVc8fHyxvU3bbxg@mail.gmail.com>
 <EPEC1S.ET9N9UD2HEU43@t-online.de> <CANNYZj9qZX1yH4aH922Xb8fiM2U_Q57R8UQJiVfS73xn1BvJ3A@mail.gmail.com>
 <BDRC1S.9ON3267ENA9Q@t-online.de>
In-Reply-To: <BDRC1S.9ON3267ENA9Q@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Sep 2023 22:35:13 +0200
Message-ID: <CANNYZj-7ZFnGg914eZ3rVd5TcpNwdPADgY8Ph5-A=fftsYr3AA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] adwaita-icon-theme: 43 -> 45.0
To: Markus Volk <f_l_k@t-online.de>
Cc: Kai Kang <kai.kang@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 20:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188024

On Thu, 21 Sept 2023 at 22:25, Markus Volk <f_l_k@t-online.de> wrote:
>
> The refmanual says about allarch:
> Unlike some distro recipes (e.g. Debian), OpenEmbedded recipes that produ=
ce packages that depend on tunings through use of the RDEPENDS and TUNE_PKG=
ARCH variables, should never be configured for all architectures using alla=
rch. This is the case even if the recipes do not produce architecture-speci=
fic output.
>
> gtk-icon-cache.bbclass adds RDEPENDS and that probably makes the package =
incompatible with allarch
> 'gtk_update_icon_cache' is run in meson automatically:
> https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/blob/master/meson.bui=
ld?ref_type=3Dheads#L89
>
> I patched meson to not run gtk_update_icon_cache and the test also passed=
.
> But this brings me back to my first idea, that it might be the right thin=
g to do to remove inherit allarch?

No. We are not dropping allarch. The recipe output is not architecture
specific, and doesn't change depending on target, regardless of what
host executables it needs at build time or whether or not it has
target-specific things in RDEPENDS. There are plenty of other allarch
recipes such as ca-certificates which use both build time native
dependencies and run time dependencies which work fine and pass the
test, and this is not special in any way.

Please read again what I said about task signatures because the
problem with allarch compatibility is there.

Alex

