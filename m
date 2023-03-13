Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B55C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 09:16:33 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.15629.1678698990154961729
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 02:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GTRC/84e;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id f14so4729494iow.5
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678698989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDsKy6067zchSN65NVcwU5ZMMJmqjzM+BUBUE6dD4gI=;
        b=GTRC/84e9XTpPh5JY7Gjia9d3F5sDn/Yt9+wFOyHa+vN8sfZxTR86i86E3h3utWmjk
         H9T0t5GotmOsW6w7Aer9KyVb0bHCV1VjBpkg1fVaY8RzFwTChxLAP2OViPoo1Stqzarc
         Yck0hyvUlFK0VvpMjKB1dfwvMV+ioII8mySbSrmVgXgFzOz/MSAYNYWhxMLVXmwI/ahJ
         J1dv7iO1JSIhHrmcQmd+53E4j7r0/Un5wg+S1nX11cZBxKXM+b8WNfi/lkmuBlKbRPkz
         Fiy1Z7E/nkjMY4aE1oD0RgEqVpJEz1g/EL/Oht+x3aZuaKVKWSsoLZTxy01dnfPIP07A
         Bmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678698989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDsKy6067zchSN65NVcwU5ZMMJmqjzM+BUBUE6dD4gI=;
        b=K10QZeyw0brwcWolzQ728Xa47pQkaVjqwbSr5qMoUtrCRATqUbOpybO1Ctkdyt8AQZ
         8vxs2bXQ4eGWIniydvIXE5AEbJsLQDeF8hcwswxS9thj4J6xzYEkciZSjPrXzXNGZilD
         vNIeCcx7GlxH4FcXFEt2QAkvOub+qvVZyLOFyGgzHldHLk9N3nqPwFQKli0M2DqN3Mbw
         +8a/gRwgBExkM2yXT3z92ADt5T3irAN4aLcevFuHgUirabbLjRW8vLR/MIB6vwL1iZ2A
         SgppcgmxTNkUyW833q75AfQQMcSzwUtC8Rstn6XqcqyQt//Vm0ZBTAP5niwnTO49/fZK
         N/1g==
X-Gm-Message-State: AO0yUKW1ftpwIxuJzV+hlQ+9987GrcPyeRnCpxELyDwLIwkt6Tc3TmGa
	oN6mDNP7SNC2uNwLWPino41xApTPdblNmx8cGTs=
X-Google-Smtp-Source: AK7set8Joo//dblW8QzN1s9H+uFvSOGSxOWAPY5NU29jjFxX2BpDHVb+7HbC6Mv8NCO1gD7uWJX89jKkQhX+1cwwoFE=
X-Received: by 2002:a02:a98f:0:b0:3c5:1490:5775 with SMTP id
 q15-20020a02a98f000000b003c514905775mr16903211jam.1.1678698989372; Mon, 13
 Mar 2023 02:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com> <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
In-Reply-To: <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 13 Mar 2023 09:16:17 +0000
Message-ID: <CAO5Uq5T_W1uyhnuXXxTmuxY47_PeJuE+28dSL=rapWv4K_2eGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 09:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178418

Try with this patch:

https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815.102=
12-2-alex.kiernan@gmail.com/

On Mon, Mar 13, 2023 at 9:14=E2=80=AFAM Frederic Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> I understand there should not be a fetch during build step , I'll try
> to find why .
> In the mean time, if this is a strong rule, shouldn't we invoke "cargo
> build" with  --offline option ?
>
> On Mon, 13 Mar 2023 at 09:38, Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
> >
> > On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Martinsons
> > <frederic.martinsons@gmail.com> wrote:
> > > But the compile step tried to git clone anyway and so it failed like =
I
> > > showed in my first email.
> >
> > You need to figure out why this happens, because it should not. We
> > have plenty of recipes that list crates in SRC_URI in oe-core, so you
> > could start by studying how they work.
> >
> > Accessing network anywhere except do_fetch is not allowed for
> > reproducibility and license compliance reasons (both break if that
> > happens).
> >
> > 'cargo bitbake' is a 3rd party project with questionable maintenance
> > status that we do not support. The official way is to use
> > cargo-update-recipe-crates class.
> >
> > Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178417): https://lists.openembedded.org/g/openembedde=
d-core/message/178417
> Mute This Topic: https://lists.openembedded.org/mt/97555635/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

