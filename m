Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC8FCD5BBD
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 13:24:55 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.8475.1695129892818431241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 06:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DDdRBm3R;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b9338e4695so90491201fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 06:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695129891; x=1695734691; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRT5qw4wzOAML6/gY/kS+vfgRzaMq3gJjPP+Ilx9XkI=;
        b=DDdRBm3Rsiae7Fnw7d9KzWKWUqw2HLMm1IXpB9BTUGr5aX2tL5Uq3/VkP0kS9QNQum
         AfVXzUzc6OTwFaGJbBOSU4GJOJBABAJg6lzMC8KAaf4bd4BAIT5gHgUvK/WTky4xCui7
         AhPrMCbkNA6GHcoKkptnClbrkzFLV8GFC/CLHgFlgYE/7BGFNPjQlQMe3DdXGr6tcBwl
         UZyxF5jeBpB8ncru27QDOj0EyzozwIccyHKMR7dc11RJgVA8pBwRfnTvDetnmRiX1D9k
         t5Dxb//uxbkvxo1nh4FA1guyQUuCMAkWkJz7dYn2ZJxsEEFH0AX7sGMTYjuT1qriugsE
         awUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695129891; x=1695734691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRT5qw4wzOAML6/gY/kS+vfgRzaMq3gJjPP+Ilx9XkI=;
        b=GS2h7y31NjKMKuGOV9TpQ5zzfhNu6hdHWuBdNe340SBAWAOoopJBfmZ6RIdOxmpwjz
         My0LN8ZKca5Bc0JIaaPIZWCUVgEYz37AqTxULYrj0FkYcSB8vm7p7RbDw5E+jZJom6HI
         I9+tBjk75+aYTG2rzjNa2EB/UyO6yebR+ESYrLcptXNWqEJaFdsxNmH3AIJUuvAdPpOB
         gzy1077clk/rNfnvTx/MSpwA0ooEyBNQCKBQ2Q5pyRUPgj4yjuUHd0aQZ4DJBaVvxlAV
         SbbowRUVXctJjKk7b9y/AFlFbnm1FLZ6UgXAg+puT8ESINWcxAzjVoj/nRB37LnZYyoN
         8GAw==
X-Gm-Message-State: AOJu0YyUh/E6YMpE8q/rn/qeoVzXA7gV62RqCDrPbOlLEDQfCz3TNwfi
	CRzh8s0h84bP43Sb7rw345t81oHivbIykW0Lei8ZI8+C
X-Google-Smtp-Source: AGHT+IE91mxbAiOWAFCMNM7Me/wLU21wpxwfAEXLN2I0kwXajLwxMnAPLhfvmeymIo52bAUxptvxCqv6TlPM9+iafqE=
X-Received: by 2002:a05:651c:610:b0:2c0:18e0:708a with SMTP id
 k16-20020a05651c061000b002c018e0708amr3164145lje.46.1695129890622; Tue, 19
 Sep 2023 06:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230919114941.1819808-1-f_l_k@t-online.de> <CANNYZj_+k_AjWNXMK-uPFpH3uNL_aYFeCkXw=+3UCUKnmnGMcg@mail.gmail.com>
 <9RH81S.9NI7WQZ7L6QX@t-online.de> <CANNYZj967eyFsoO2uuQ0U185MFe9Dk9NXwDMWdp3Z-FYrPQkfA@mail.gmail.com>
 <AJI81S.IWBE7P5X9A4J@t-online.de>
In-Reply-To: <AJI81S.IWBE7P5X9A4J@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Sep 2023 15:24:39 +0200
Message-ID: <CANNYZj80ZynQRYNyGHH944fVLzpEDrkX55j2t57YtnYp3o6pPA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] vte: upgrade 2.72.2 -> 2.74.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 13:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187867

Yes. gtk4 is the current version of gtk, so when support for that can
be enabled, it should be.

Alex

On Tue, 19 Sept 2023 at 15:23, Markus Volk <f_l_k@t-online.de> wrote:
>
> would it be desirable to additionally activate gtk4 in vte to support gno=
me-console?
>
> On Tue, Sep 19 2023 at 03:20:59 PM +02:00:00, Alexander Kanavin <alex.kan=
avin@gmail.com> wrote:
>
> Having gpl3-only recipes in core is not a problem. Ability to build basic=
 images without gpl3 items is tested, since that kind of thing is important=
 to certain industries, but otherwise there are no hard feelings towards gp=
l3. It is open source, and products do ship with gpl3, with all gpl3 licens=
e obligations fulfilled. Alex On Tue, 19 Sept 2023 at 15:06, Markus Volk <f=
_l_k@t-online.de> wrote:
>
> On Tue, Sep 19 2023 at 02:02:48 PM +02:00:00, Alexander Kanavin <alex.kan=
avin@gmail.com> wrote: we need to find a different terminal (rxvt or indeed=
 gnome-terminal). gnome-console is a simple thing. but it is necessary to b=
uild vte with gtk4 support (by the way, the default of vte is to build gtk3=
 and gtk4 support). Maybe the problem with both gnome-console and gnome-ter=
minal is that they are GPL-3.0-only. SUMMARY =3D "GNOME Console" LICENSE =
=3D "GPL-3.0-only" LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f0e2cd40e051=
89ec81232da84bd6e1a" GNOMEBASEBUILDCLASS =3D "meson" inherit gtk-icon-cache=
 gnomebase pkgconfig meson gsettings gnome-help upstream-version-is-even DE=
PENDS =3D " \ desktop-file-utils-native \ gtk4-native \ gtk4 \ libadwaita \=
 vte \ libgtop \ pcre2 \ gsettings-desktop-schemas \ " SRC_URI[archive.sha2=
56sum] =3D "24cbd5680e525c2c0c57ad8d8c1ad199ef5b45b1ff1c80be22a37848e46e93a=
c" FILES:${PN} +=3D "${datadir}" RRECOMMENDS:${PN} +=3D "gsettings-desktop-=
schemas hicolor-icon-theme"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#187865): https://lists.openemb=
edded.org/g/openembedded-core/message/187865 Mute This Topic: https://lists=
.openembedded.org/mt/101454079/3618223 Group Owner: openembedded-core+owner=
@lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/opene=
mbedded-core/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-

