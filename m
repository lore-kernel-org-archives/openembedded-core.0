Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6646CCFA05
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 11:14:49 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18133.1762168488379084116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 03:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cO0jzIOJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-791fd6bffbaso53462096d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 03:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762168487; x=1762773287; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5BTYzHCUqbnnC7D2hb4Et9jEjPWWR+yya4JVPsg+qg=;
        b=cO0jzIOJURKGERkTOYlc1ewuxeQpqUBnoikMQ7WbvN+CX3temeL9G705fBEL32ZL/S
         rELy0p3Y3FcHfDx6FbHTQWH1KH3jTobmQwWh6TnAzwJZ0nMQ8egUZO1tyEZyZg+Py6Z2
         FVfJKQnh9BzVOxAi0vC9sgMyWvgWSv2dzzV01xaEHsBFmp1QhEmswDl6uH1+Ds9a++rW
         UtNtyZ9FCuze8j0EKTXcDHArCX4uk9f/ql/iOpAk5lubbhnVoymHlFExUfCfFltK7St+
         QsDgLVkKMoZ9kuHvWAp+UXtq7rnyNN5fW6adZqtPCHVyEXvHhcnDNGfsW1xva/+E+6oF
         xNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762168487; x=1762773287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5BTYzHCUqbnnC7D2hb4Et9jEjPWWR+yya4JVPsg+qg=;
        b=Zg0dChjSC8ByISAj4/3rLwGRBgXsM/yM5bS3Bs1k4nIEIlKF85MURe1Kc5uSStTrwy
         d6VjLHq2NvI9LkzYTViz1xknraj58OFzOj3YIVku0aqI0T3/VFQ0LU3NZlksHtDUp+f/
         P/kZW5b4dXwenLs3bFws4IMswkO0Tm3ZbtwblJrLxfvAgLwsnPVBmWpHe728GXlfXvMI
         Ah4kXvChGTEO5sMNn30yoZ0xzGFyKl5uV2cMQs+h5OAnUZwhaV+Fa4bxImXCJ4MBQFKj
         C6j9KIc/NKV5jRqLkSq5lNXDztfxg3hQus0Gknnm31jcVQrqy30sRY3crpvxmCnJrsBS
         N8Tg==
X-Gm-Message-State: AOJu0Yx94QmJ8kNAL/yaB9pDO1EHXjIEV383ir2FojeuF8CVX8EYZML1
	SnLha75jDIdwyx8rPAQQlmO/8kZmzfcrxyxacPa3NILZ65hmTTM8jMFQKDFmn3gafWe4ItfxFqc
	O7s2lI7GFD4E+XneQzUykvPbq/MgIxJw7mw==
X-Gm-Gg: ASbGnctecrf9Ga6B4xb7lVh7gErTN9j1IXifDz8QQGA1HwOu7pCemIvrZyR7pXfpBEH
	ISrOhLsRJDE4jDP0p6U3wKpILwMm8gCDBNoqBn9n5w2+SJAmk/ZMHK9roqaJlFA/wQJQoEicZTt
	Jm+b8+KUsXNZ4a10buSinIqS4ugm3ibK0oLAWzjS5j8qS6R6Duhz7fQH5dhVJWOSRAeKGlayuPn
	jLHZGQl4T2rtjJvFDphPRNnGlWGkFghudlfrQ/MHkEkHFVo2RpbXvUOIx2skpuTbSP7paW3L6sq
	nIm+BZ23h2Bu1rXg+dc=
X-Google-Smtp-Source: AGHT+IEjCXo6109gWkPmU8yxHz7usfWU5z14IdZEu6fGipaS8qkuEKTh7k5YtkWlFFOvts1gB/LbOx+XzF0bAxYwi94=
X-Received: by 2002:a05:6214:5091:b0:880:4c2f:5075 with SMTP id
 6a1803df08f44-8804c2f5674mr67709836d6.56.1762168487226; Mon, 03 Nov 2025
 03:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20251103072622.1296182-1-joerg.sommer@navimatix.de>
In-Reply-To: <20251103072622.1296182-1-joerg.sommer@navimatix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Nov 2025 12:14:36 +0100
X-Gm-Features: AWmQ_bm15hUt5ELO4Ys8j345NNZbOAPIPgVd3D5VyMaRE8-jWmvRDHLnnuLct2M
Message-ID: <CANNYZj8WLqQax-fq7Po2suau5o3KxhPTF=myrGkjBdHqXWwtkA@mail.gmail.com>
Subject: Re: [OE-core] Convert packages to gnomebase and upgrade
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 11:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225644

Thanks, it's a nice set of cleanups.

Alex

On Mon, 3 Nov 2025 at 08:26, J=C3=B6rg Sommer via lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> This patch set converts these packages to gnomebase:
>
> * vala
> * python3-pygobject
> * libsoup
> * gconf
> * epiphany
> * gdk-pixbuf
> * at-spi2-core
> * glib-2.0
> * gobject-introspection
> * gtk+3
> * gtk4
>
> These packages have newer upstream versions:
>
> * python3-pygobject: Upgrade 3.52.3 -> 3.54.5
> * at-spi2-core: Upgrade 2.56.4 -> 2.58.1
> * glib-2.0: Upgrade 2.86.0 -> 2.86.1
> * gobject-introspection: Upgrade 1.84.0 -> 1.86.0
> * libadwaita: Upgrade 1.7.6 -> 1.8.1
>
> (I'm still working on epiphany and gdk-pixbuf, because they have new
> dependencies, but I will send this as a new request.)
>
> Some minor clean-ups:
>
> * libgudev: Remove UPSTREAM_CHECK_URI; not needed
> * cantarell-fonts: Remove meson, pkgconfig; already in
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225591): https://lists.openembedded.org/g/openembedde=
d-core/message/225591
> Mute This Topic: https://lists.openembedded.org/mt/116094097/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

