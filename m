Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF275C07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 14:50:36 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.34285.1701183031500007036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 06:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K4t/CqHD;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c874286f4dso65638121fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 06:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701183029; x=1701787829; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tudDygOtWMcN3UTVNXjArhkYEehcJFSRcA7jfpRkRY=;
        b=K4t/CqHDooAoeFaZs0jXl0qeCOWw/PfM43ktu/9SLMZN1W2ZzrN/unZXIDJY4K43vF
         8dfD9HepuECAw8f8m7ykvGF2uqSl7OdaWsjdJhYZautVlCHTh4+AS3MyXKZx50gRy3kQ
         P1hnpdlWWSA7hqihGE9dhDgHc+zprotPmTOnX2db2fmHs2kCcZqWCUQb8yON8zBFjdNn
         eBjgfiGDa2d1lXk0ruDHD2mCNg7OBnk5fmkKyrgjlrg1lNpiHknecyn6rWI66CMvbmg2
         Cxfmri03pJqM7ROPYgSzbXkRue2CjRHmYuQmfFOJMS74sdXjkl/z4qqb7p6rV5K1JV41
         1Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183029; x=1701787829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tudDygOtWMcN3UTVNXjArhkYEehcJFSRcA7jfpRkRY=;
        b=BNX/T+7E7UjLmE+aY5+xl1On1nJrM8mt2K51l/T0elFluyyEyZ0CkneJWhMKy7Q780
         F+nqjWAZXR7myhy5adnFaOtEuUt8EoGG0CueR2wThOgIo8c1hDQQVIWiJPJ5ssuyFmUM
         Yz3k4uW7Qq7hg104/cBDjd2ZjOdVz80hkh5cfYxirg2f+6cR0aBrB5Srzj/kToFapfwa
         GuKu8+uG8jlMIuzUwV1wIW+LZKwyEgQ8j/wXA23zNDrSxFv7JXCAq6/2QSPZSkZ4drbm
         dVky4PHHnKWsBAorq7JoPRTEPNazOvIC05RsXOpBR3YkM64AW6DxKQKvS7Sz4gokwgwU
         7CcQ==
X-Gm-Message-State: AOJu0YxUHTlOohumsNcYP3yI6KnqMmnHcLOp7qKwkwEMPMHs1q2keN5K
	E4WsKTZJYmo40q+xh5Tc8e10BsFoRNAAow3sWPg=
X-Google-Smtp-Source: AGHT+IG6epADYOvTcniGF+YEubgkXY1PfuXXr+g+Jb1wNHtU/4alTs5M7I2iZ62JS5ZuDkpsk6zmW6Y3Hf8MCqGzJ7A=
X-Received: by 2002:a2e:8e93:0:b0:2bf:f861:f523 with SMTP id
 z19-20020a2e8e93000000b002bff861f523mr5331492ljk.4.1701183029094; Tue, 28 Nov
 2023 06:50:29 -0800 (PST)
MIME-Version: 1.0
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
 <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com> <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
 <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com> <ab819301dbf2bf4a669dfdbd937b21f0c7ec719c.camel@linuxfoundation.org>
 <d1479bd9-163c-4958-b1e2-6eb066fbe41a@gmail.com>
In-Reply-To: <d1479bd9-163c-4958-b1e2-6eb066fbe41a@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Nov 2023 15:50:17 +0100
Message-ID: <CANNYZj_--bt3Nw96O8QDSb8hyr5-BoSmkmOC0_BMAb-vsL8UJA@mail.gmail.com>
Subject: Re: [OE-core] bitbake-server does not exit after build ends
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Martin Jansa <martin.jansa@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191379

On Tue, 28 Nov 2023 at 11:31, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
> The warning only occurs if os.fork() is called when
> there are already Python threads.
>
> I guess the general performance uplift in Python 3.12
> can trigger a pre-existing issue in bitbake more easily.
>
> It is entirely possible that the threads bitbake creates do not
> exist yet with Python 3.11 and earlier at the time of executing
> os.fork(). =C2=AF\_(=E3=83=84)_/=C2=AF

I think you might be too quick to jump to conclusions here. I've fixed
the async issue I've been observing (backporting
https://github.com/python/cpython/commit/2e5d4e24ebcd671915427b6fd35a5b0eea=
412c4a
), and when running bitbake with 3.12 from buildtools-tarball,
everything works fine, and I'm not seeing any leftover processes. Poky
revision is current master:
https://git.yoctoproject.org/poky/commit/?h=3Dmaster&id=3D3e50e45917831d9da=
2d86e69fb908a1a78483b62

Alex

