Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13506C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:45:08 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.116117.1738676706601929378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ap0HjBwX;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.177, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e4419a47887so4849485276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 05:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738676706; x=1739281506; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVxyv3YZax3kvFYzvVMISkTru2BlWpyl/1OKGzk/WmY=;
        b=Ap0HjBwXYSGClyBQEFMwnmsrkLAyBJDTZ+ktxJhLk6oN6EaubSqdKHoSFDLur5G/Av
         Cut9vkZxcw9ILoXfO5cTV7tUJcYJrZsdZvautp6jzo18pw7SUz9Nq+pLbGDAR8mb2VJe
         IgQi1PlDlutRGXm/+BI6VzeU2bPJ6pW98u69e99oveRk53h+s1J7fPM5L47IoClxqYpA
         XJD5FXwOTcgwBH7XOEOmKyoxnY7RmunhmEdNi7ZsmzUDZQnQacIdRYNoEb2Qzg6tM0A8
         Ylla9E3au26wHFP/B+8QiySpjhbOaQYtkUMnt7QPb8c3xHu5sJnIKx/yNcQRKa/2mw3t
         BU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738676706; x=1739281506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVxyv3YZax3kvFYzvVMISkTru2BlWpyl/1OKGzk/WmY=;
        b=QYPoKb4oEHNrYr0WxkSL+8pwNpjw4pULDyiqbz7HFO5x9K1o/1ZL7UFksqXQFjvOHr
         Tx4n2peiuNxLXdRWPEnykFJNGHhnY0zwuq5xanoy7nwRntn6F5Nr+GnkD6bBV66E/YVr
         +FECI26iRy0+g5sUiMzrTF8xCep4kc3aA0r6qvw8d4M+hRTqcrsYxgdT5mlc2Tixy8Bh
         8LkvAOeRxKn3L7AerocUR08Pd5riyOLDCBA4MC9ZyLaTgGY74M1fufvAs3fjy74dLuZs
         Xbv5RcLgqyMj6BUsIe04x7XycaBStLTzJ2p5jhrzYvLnATJHzq/irbP1oQywEKZXyd0W
         XOnQ==
X-Gm-Message-State: AOJu0YxHLIqe3tUly5f4BofLKoPcd/0I9MXDoFAj/0rhgPgg78l4IUUG
	FuB7FceIImfOxJKqRF3PDbSVfwFlmpP2yN9TW+oaj3Kx49KxU3Xp4KScti+znw7ElLvtfPAUBzx
	t+qP8jkk3AZOB+VrQ9vEqJAqLWai6M6LIC5xeOzZJL6wbuXRRUhYGlg==
X-Gm-Gg: ASbGncsWTbVLrJaU2rgLon8RZP0pcwgYLPC5m0+SVdAgLk9pKQN9XRYHNu4CHBrL1be
	QAqtc9hGzn9xW+m8SNKrvNGdv9Gvk6MxwdHaE77S1/0b0IMxm6O9NKEkvMZuiAaIjtgmDrAoC
X-Google-Smtp-Source: AGHT+IGw4KMvpjv/TRKaqvGXNfTpR19FK1SgeJuXpUJuZnvpHjVLxaNHhsYUDs1hB1R038jV8WmJNeX+JetyDZkwdRk=
X-Received: by 2002:a05:690c:4483:b0:6ef:4fba:8137 with SMTP id
 00721157ae682-6f7a832481emr215817507b3.6.1738676705653; Tue, 04 Feb 2025
 05:45:05 -0800 (PST)
MIME-Version: 1.0
References: <20250131191948.396835-1-gudni.m.g@gmail.com> <32276.1738351701259116438@lists.openembedded.org>
In-Reply-To: <32276.1738351701259116438@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 4 Feb 2025 05:44:55 -0800
X-Gm-Features: AWEUYZkvO5_nvzKJHL6H5f4ZaaOBkBoCJmFCZkAf6pA5WCkbAupkUKnVAC8D0QU
Message-ID: <CAOSpxdYfp_rjUkofvCQk6VFbJj8TkCv-eWjb=V5U5TavT++Pfg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] gnupg: upgrade 2.4.4 -> 2.4.5
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210792

This version bump appears to be causing a number of errors in
autobuilder testing:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/939

All are in the toolchain tests, error logs below:

https://errors.yoctoproject.org/Errors/Details/842566/
https://errors.yoctoproject.org/Errors/Details/842563/
https://errors.yoctoproject.org/Errors/Details/842564/
https://errors.yoctoproject.org/Errors/Details/842565/

Steve

On Fri, Jan 31, 2025 at 11:28=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> I tried upgrading to latest stable version (2.4.7) but it fails because 2=
.4.6 broke the "--enable-gpg-is-gpg2 " option. Version 2.4.5 works though.
>
> I found two reports on the mailing list for this bug, but no full patches=
 to backport.
>
> 1. https://lists.gnupg.org/pipermail/gnupg-devel/2024-November/035673.htm=
l this one contains a patch which seems to work though I'm not sure its com=
plete.
> 2. https://lists.gnupg.org/pipermail/gnupg-devel/2024-December/035748.htm=
l another report but no patch.
>
> I tracked down the problem to this commit https://github.com/gpg/gnupg/co=
mmit/685acf650a68871d8effeaa1c2ca01f2c4752266.
>
> ----
>
> The 2.4.5 version was already in master branch so this was a simple cherr=
y-pick.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210494): https://lists.openembedded.org/g/openembedde=
d-core/message/210494
> Mute This Topic: https://lists.openembedded.org/mt/110922127/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

