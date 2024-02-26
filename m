Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC71C48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 14:48:00 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.21839.1708958872982563176
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 06:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eZOjvYgZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-412a45f4766so7853585e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 06:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708958871; x=1709563671; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AOdGmCxmxis0y2dq+cwxbofCHcXJPFwmMc2dq5q7FA=;
        b=eZOjvYgZn3sk4LvyydGu1/7sE5nqZWmF0dCPQL4jQCwOlKAjJlhjW0Q+oymVyBMZ+4
         X8gCfqkNOgwgNNdyip3kbNG/OGlUUWUOfBiyHqAndjwIx7KKQHkirr/4eI7MtZA/OtMs
         T5CyEiHxzXNw/oQmwdgp0FKK/4hJJHvDeXK31NMLmKOqj4nfsewr47UKqqjButR3ifXm
         CoQH8UfWGjk2XBIkeFjH2dZnApiLDKqHnToGDRFPD9W1R6ciwSkz5HZmiYV9JzK8X11I
         Du44FD3DgRWkbNDwLTObiuPtZe4OAXSSeoNJBeRlsSOdZWujAHhdWvN7VKcZUGZVYBbl
         mcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708958871; x=1709563671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AOdGmCxmxis0y2dq+cwxbofCHcXJPFwmMc2dq5q7FA=;
        b=R1rxt4bvYf5aUsG87q+1UCizEq/4byu85wHeB/MtjSXrjCFZ9xOUswpn/WiGw8vLls
         ZERrf/PR+N6zNcnlw/iXPN9wD76UFBLRDxRAnxyZyoRTAn1vK5ED0OZYz5FTiZFTK9y0
         2s0N7z8NnPVjQ9JLoHbSCO/qAD3uyT21wz+Cq29HMvPqLy/SP5F+CO/8FNWsYc2i8BFY
         jAR9A+Ya8rROcp+bZ0S6hmgx1RjP/L3BApwesKjsNriAyv2I7tL3mz7u5nv5JmIYGNrD
         OzFCOdAQ9uNx3WN1/7KMuDwA/pgTiZDbQ66EJQJoBgHnLqltSt78SfPqYN2C5eRESXqP
         a0Bw==
X-Gm-Message-State: AOJu0YwMjkZa4dJyMjj8yDV5ilvO3BXpjvYVLp322g7HnwUmq4gNsFYO
	DMUl3JG6QH8fCViAaVcCRcyUGPImDGe3AocBvkVvhJsLJXE2zNz16basZWvXJLcnrPynV/uUE63
	fd+HczUYfD+vFNV2aSUujVbkfUko=
X-Google-Smtp-Source: AGHT+IGGDPAPUID+LYNR9bFFWJKsvsSp4Zxo2ndnSBgXZY4WLgXC161uI9060dzrePUXIGG8BjveaLjj/Xd4UUTgoOw=
X-Received: by 2002:a5d:694f:0:b0:33d:e140:a81f with SMTP id
 r15-20020a5d694f000000b0033de140a81fmr1104998wrw.56.1708958871355; Mon, 26
 Feb 2024 06:47:51 -0800 (PST)
MIME-Version: 1.0
References: <20240226142855.2687016-1-martin.jansa@gmail.com> <CANNYZj9M9TGYGvEN0sZOpYYQ1-PVk3gnehR_zh_c9Ue4mEv8hQ@mail.gmail.com>
In-Reply-To: <CANNYZj9M9TGYGvEN0sZOpYYQ1-PVk3gnehR_zh_c9Ue4mEv8hQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Feb 2024 15:47:36 +0100
Message-ID: <CA+chaQfK6Pji904PR-Zfn39E9cnEV-Zfa4i5UxoPv98ic2v5-A@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] rpm: add PACKAGECONFIG for openmp and
 disable it by default for native builds
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196213

On Mon, Feb 26, 2024 at 3:39=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This needs to be handled with care. We rely heavily on openmp support in =
rpm to speed up rpm operations; adding an option to turn it off is okay, bu=
t actually turning it off is not.

That's why it was sent only as RFC, do you want me to re-send v2 RFC
with keeping it enabled for native builds or should I wait for more
(unlikely) feedback from others? When explicitly enabled for native it
might start failing on hosts without openmp (where it was autodetected
as disabled until now).

I use package_ipk, so from rpm-native I'm using only the rpmdeps.

This can surely wait for styhead release (as I'm probably the only one
seeing this issue and only with experimental profile).

