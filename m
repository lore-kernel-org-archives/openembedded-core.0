Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E646EE49B7
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 14:20:54 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.22909.1726064445255366235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 07:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=brjYWsp/;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso26096511fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726064443; x=1726669243; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTHSsO7gXssasK0f1CGyObA0DqJGz4BqwWsKM2mn02s=;
        b=brjYWsp/OP2M4QfXpgTZm1WuFsTA3oVJeogV5sMx2rgtlsR5msUSE65AlA+r8wjBSF
         0jlI9noNR0S/caP5MMl0IGcahvklyzDY+ncoZ673Dic6bgTeZXI8+E6WRxvS+BqGGNbu
         lkdAGzLfVXFBI4JTQhGSaeAa59ZclTXeEm5vRWYkahbn3Qnm8lgx8EM/UnoA67nJLE0I
         4gK5KEcMCDhTfsPhtt1FNjGZEeQsJ9z8WSpwYYiSuANAvdIslrOL40taV1jd/qKriLf8
         ADLNmc3dl/W699KT5UuMyuWTn24EHBHZ/b9ksrQYAz3ehzhTkBCrgMDsQf8bgReMxyUe
         oZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726064443; x=1726669243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTHSsO7gXssasK0f1CGyObA0DqJGz4BqwWsKM2mn02s=;
        b=nCOepEJtryHoBnUbesTWUxJ3iaLvOK/5DGCuIXga2oJGWxQKXAKJKuY0uk5rUmGxcF
         c3u9xU+PUgQwAHAAc/4Tw3P+/kdjORTVQcLmLDqFbItttwg4S/2A1QehJgytYoVnY00p
         Tdla5Zhe0JGS75reuNbNqzZWn2CUjKSSeggEeaAhHPtqyWOyJbNSNPcldbQfAsKZ5U7c
         ddWE87trdlIkSS5Zq0LKu2M1OgIia0AXV1EuWiATvJOahkuDpBMtDIkRt01IaOETOEsA
         edlcHsP32Ugkyag92Yc5kZKoDtMXKJLv4nDg1wgyMdTTrBYQZuvsGsnYaFhyVczn9DH0
         EtxQ==
X-Gm-Message-State: AOJu0YyJ+T5F/av4O96fn9wfPQuJyIqgOZHy4dBQYH3th5n6bgE1wvvH
	Y+GkHzFOAF/bzo2/MNocgKoPCI5/zvVBVdkvOhTbnOnZHAKG1t706TpKOaAvjO0Lde+L1v4MG6F
	Tp5X6gWAFXaFYQHwbauRgKcReAas=
X-Google-Smtp-Source: AGHT+IHjpCzUB6TcW0Ry1NNcPn00oDcdFE9LnazcYDFD+sGVsEzw6oL8975DnSvZkij2diYSF87SeAXWx3Bhylp/iso=
X-Received: by 2002:a2e:bc29:0:b0:2f7:5d53:7198 with SMTP id
 38308e7fff4ca-2f77b73af4cmr21239991fa.7.1726064443010; Wed, 11 Sep 2024
 07:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240910184143.2820792-1-ejo@pengutronix.de> <20240910184143.2820792-2-ejo@pengutronix.de>
 <CANNYZj92yih_U+qQ=Ow8sOV6BZ2vWZFXmwajzT6e=bHe=ej6gQ@mail.gmail.com>
 <2ff3be0dce3a39f59ba7d0dc2dc78fc43a54bcee.camel@pengutronix.de>
 <CANNYZj-0LGjTFq8+wfQbjzn=NPnf60abWHLzMq=Aw+XUhsQc0g@mail.gmail.com> <f08eca9e902f391e26312b7cdbdb98be85f50661.camel@pengutronix.de>
In-Reply-To: <f08eca9e902f391e26312b7cdbdb98be85f50661.camel@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Sep 2024 16:20:31 +0200
Message-ID: <CANNYZj_jvG9_5fgNJshHhKsWFOYvuM0BzXTBC6L-97y_bUAmaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 1/7] barebox: add initial support
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 14:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204388

On Wed, 11 Sept 2024 at 14:27, Enrico J=C3=B6rns <ejo@pengutronix.de> wrote=
:

> But a commonly used one in the context of bootloaders I guess:
>
> https://github.com/search?q=3D%22require+recipes-bsp%2Fu-boot%2Fu-boot.in=
c%22&type=3Dcode

Sadly yes. The reason I don't like it is that changing anything in
u-boot.inc in oe-core may break multiple BSP layers, and angry people
will come shouting at the person who made the change, even though that
file is actually private to the original recipe.

> What are the better options here?
> Inheriting the .bb? Making a .bbclass?

Making a .bbclass, putting stuff like COMPATIBLE_MACHINE into a
.bbappend, or a hard recipe fork that doesn't attempt to reuse the
.inc from another layer.

Alex

