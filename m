Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F70BC6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 09:23:33 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.15697.1678699412533903249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 02:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q4FT8w4B;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id v10so4731105iox.8
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 02:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678699411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5FQ0SjONP5GIB8UvfObpE87dPKiZXeOdVvcMgZJJBU=;
        b=q4FT8w4B1/EAX3FPuxy5qhYzDeKarYLs+bw2VNqGXzlhOQCyDdl0nboMv8KQK0ae8v
         MMMOLRX7SHCw3fxuXf7yg6Y9tInMDDVlmFaF/VuE+B4bhCv4j+aO2E5kWITD5LSOOXMJ
         M8/BNL0HglbgKeoBK6A+G1+J3Zf3JTl1tvdZBDqBgszUTiIkyolBJ7wD7SH6SJ4O2BFI
         yMqhoAPDJ9yQyu+zo6RWjZksAdK2iKU1htPPfZ9FQqp73gtiCE7Udu9ocmDoLwjpvLrx
         sYHJ0MzVwXg6TqHMLnJ2jqIJMowt0wpzSPQxxOqe8qtRBwxzlac7aY69WDiZBHIKFz/p
         SH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678699411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5FQ0SjONP5GIB8UvfObpE87dPKiZXeOdVvcMgZJJBU=;
        b=YxgER9z3iM9bz4Mp+pf0TuSyboHvmzfpGlnD4QQVIHqIUtqWdScxAFalOGI88elZ9U
         +sq3+03BC1CKlUP9CjTf95D5QskOIX85W0fJwwDlymWXGqQnHEzZyJ/1Q7NP42feik9Q
         IHVS8wWbEf2IixlCYjghpJel94Iy/xviLp+bsTeocxQRMK5WWzo4kF8R8vvss6H23Kp2
         6a5rwb66GuYZbSuRMTLxO6b5adebA1agIemkRjwmGUSF/A0I80oeK596aXnL15Z2Z2Xl
         xYkEiB7VbEmuEsJKaHV9Gw1eG3q7KZRphf4/WQgchep/EQxKdbEyRaofktWwQcc58K46
         eI7A==
X-Gm-Message-State: AO0yUKX1bo3AtX1/uHeVVotqxC86t4QhJ8agCt4RsrDBcCIhkdZ/EsXB
	gUnel9/qBWhjV8leze/1u40R7GG6dTEylovAzTw=
X-Google-Smtp-Source: AK7set/5kx8x97YiLKSxExIJuVIiHvW3g4iQJ+0j6QRU/1pHCXFyOl+WpMNTe0jo6VS4vyAqOSyiEoVzidbgGwivDuQ=
X-Received: by 2002:a02:a98f:0:b0:3c5:1490:5775 with SMTP id
 q15-20020a02a98f000000b003c514905775mr16911111jam.1.1678699411748; Mon, 13
 Mar 2023 02:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com> <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
In-Reply-To: <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 13 Mar 2023 09:22:53 +0000
Message-ID: <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 09:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178421

ISTR I tried this and ran into a different set of different problems.

On Mon, Mar 13, 2023 at 9:20=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Note that we're all rust neophytes, and rust support in yocto is still
> evolving towards maturity. If you can see better ways to do things,
> patches would be most welcome - but 'no network access except in
> bitbake fetchers' is a core rule.
>
> Alex
>
> On Mon, 13 Mar 2023 at 10:14, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > I understand there should not be a fetch during build step , I'll try
> > to find why .
> > In the mean time, if this is a strong rule, shouldn't we invoke "cargo
> > build" with  --offline option ?
> >
> > On Mon, 13 Mar 2023 at 09:38, Alexander Kanavin <alex.kanavin@gmail.com=
> wrote:
> > >
> > > On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Martinsons
> > > <frederic.martinsons@gmail.com> wrote:
> > > > But the compile step tried to git clone anyway and so it failed lik=
e I
> > > > showed in my first email.
> > >
> > > You need to figure out why this happens, because it should not. We
> > > have plenty of recipes that list crates in SRC_URI in oe-core, so you
> > > could start by studying how they work.
> > >
> > > Accessing network anywhere except do_fetch is not allowed for
> > > reproducibility and license compliance reasons (both break if that
> > > happens).
> > >
> > > 'cargo bitbake' is a 3rd party project with questionable maintenance
> > > status that we do not support. The official way is to use
> > > cargo-update-recipe-crates class.
> > >
> > > Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178420): https://lists.openembedded.org/g/openembedde=
d-core/message/178420
> Mute This Topic: https://lists.openembedded.org/mt/97555635/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

