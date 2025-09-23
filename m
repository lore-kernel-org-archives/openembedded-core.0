Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1D2CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 16:22:21 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.1938.1758644533702058857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 09:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eu4eOYMK;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ea5aa2fdac8so5159220276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758644533; x=1759249333; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxJraiZkhJwlmkFhu1G6kBRIIbB0oBKeC/n0GVdriUU=;
        b=eu4eOYMKfhb5nrt0KTLW7t+/GT6AE4BCXO6/6dfe563pG/N78fBiJTZheBeBWs6h/Z
         odD8D3B0wKJ7a0oXq9xPKNvcmhbj9+zPz0lG7BR/Wm6gulPEa3+SojLcWeCmb0kTt8Z0
         NSB8dWOiQSdu/xuYP+3GMHcMGZQtQUv7a28tlHSdJuKCyGYlsdGJlVVhF7Qd+Ap4bCar
         oJHGMiuCMvOwaBj9pR0A+pjHOqcP31Fd8gmiTDXaaW8crJHvva+65xY4wM3QaXy9cjeA
         qtmc0EQj/YV1J7eA5u3vdMTZzzf0pyHvNL8TWp5mXedTGTxJyYYmkEfM/rR12rbvSjur
         Gfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758644533; x=1759249333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxJraiZkhJwlmkFhu1G6kBRIIbB0oBKeC/n0GVdriUU=;
        b=KA70efSE7IJM+kkhxytx3gbkLA4HZo9kvFKS5zb4bxG0bPpGPFrIPoXU2Byl/5VMJT
         C48fNwgKMwfPpvlSqmCOQTSbB0zCnsq2Igvcn+8zXMWGD/kidOvWj0WW9jSBQsAQ9+2y
         Xu9I704vK1yB/mzs7tMcVGP8foT7CtTeLZ9pnzVP/mRXJo+KkO207d7xn4EFiE4IQEQR
         76E3IMNnVqjqqlxnmxjkBhlkRYxoxyP3yV0qm17EHsxCEviwuo0wVhZ/89TkZbZc9huq
         CHFShRxyPJrS6hwnXYEXfJTPNm+1tOSoxobFENEeGeBvy2qF5G8dKT3DHVVWLSGjLexj
         HtrQ==
X-Gm-Message-State: AOJu0YxFIUU/t2GROSCAcLrhhPHnAxhvAkK3kQISFMsz+O04WZH6zno1
	eKGn27z2m2zrxvwVI1DkBmnJmQXtCwQjRNNC6167BS+g1TQw0orXiRdodKzhDhAUVSr87ka2c7O
	E5P7NzYlHtprUniieMqap5cgQZE1jbtrzKtvqfR4=
X-Gm-Gg: ASbGncs/ttaGqD47MI9fp8V6Tp8hIN0W8T8fxxNcTDqVLgYB5FMK7z1Nozq+uDDsO8r
	B3n2tG/0hQsLvlvdV4S9jgW8VnsULbYI+DCFyGxL0Tv0JeqJC+lcDoZlnIoiQVVudvik6ut5Ph3
	ErfDEUosUoSOOKISXQ0lYm+ERDBGXGwyGVFlSs49hO4iZMdDYFuYxAOmM7qcWlNn2G8iDvOCuWe
	j2Toz6i6lyqktb1TqlZ5aB9jXe1CIqmrVBFk/SVgmCP5w7nFd8E3rueiAxLkXnF3yJIlIZWYQ5Y
	jUqXDNg37TnN1JbCpXbxVXA=
X-Google-Smtp-Source: AGHT+IGnpSjjG6GEn7Z37RfXYnVwz29vEqJlMsV8rFD+EoRPl/pHKifSo6OenqnvZFPdacpvP5Hzh1PlBbPb7QOpiKs=
X-Received: by 2002:a05:6902:4408:b0:ea4:1741:10af with SMTP id
 3f1490d57ef6-eb32fda9cf6mr2468859276.29.1758644532696; Tue, 23 Sep 2025
 09:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <a6ccd7f6-effb-4cc3-803e-faf6a9d52b2d@collabora.co.uk>
In-Reply-To: <a6ccd7f6-effb-4cc3-803e-faf6a9d52b2d@collabora.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Sep 2025 09:21:46 -0700
X-Gm-Features: AS18NWBX3Ja8B1yS7qkeuT-YcMKTb5Q1vIBC6FfKzPT7xxpV-Ij_qlpoTvZG724
Message-ID: <CAMKF1srKh7HDCNCuCwJ9BWgyHCtiZkmbLFsGy=_o45JkuiubVA@mail.gmail.com>
Subject: Re: [OE-core] pseudo FTBFS on 32-bit arm{el,hf} on Debian
To: andrew.shadura@collabora.co.uk
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 16:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223903

On Tue, Sep 23, 2025 at 12:23=E2=80=AFAM Andrej Shadura via
lists.openembedded.org
<andrew.shadura=3Dcollabora.co.uk@lists.openembedded.org> wrote:
>
> Hello,
>
> pseudo no longer buildable on armel and armhf in Debian, as well as on
> other non-i386 32-bit architectures. The common thing they share is that
> they have all switched to 64 time recently.
>
> >     pseudo_db.o pseudo_tables.o pseudo_util.o -Wl,-z,relro -lsqlite3 -l=
pthread -ldl -lpthread
> > {standard input}: Assembler messages:
> > {standard input}:26700: Error: symbol `open64' is already defined
> > {standard input}:27909: Error: symbol `openat64' is already defined
> > {standard input}:38225: Error: symbol `__openat64_2' is already defined
> > {standard input}:49933: Error: symbol `creat64' is already defined
> > {standard input}:59933: Error: symbol `__fcntl_time64' is already defin=
ed
> > {standard input}:63000: Error: symbol `fopen64' is already defined
> > {standard input}:64806: Error: symbol `freopen64' is already defined
> > {standard input}:66053: Error: symbol `__fstat64_time64' is already def=
ined
> > {standard input}:67392: Error: symbol `__fstatat64_time64' is already d=
efined
> > {standard input}:69921: Error: symbol `__ftw64_time64' is already defin=
ed
> > {standard input}:78178: Error: symbol `__glob64_time64' is already defi=
ned
> > {standard input}:85034: Error: symbol `__lstat64_time64' is already def=
ined
> > {standard input}:93605: Error: symbol `mkostemp64' is already defined
> > {standard input}:95360: Error: symbol `mkstemp64' is already defined
> > {standard input}:98362: Error: symbol `__nftw64_time64' is already defi=
ned
> > {standard input}:104764: Error: symbol `scandir64' is already defined
> > {standard input}:123344: Error: symbol `__stat64_time64' is already def=
ined
> > {standard input}:130262: Error: symbol `truncate64' is already defined
> > make[1]: *** [Makefile:157: pseudo_wrappers.o] Error 1
>
> Unfortunately, I don=E2=80=99t know how to make pseudo compatible with su=
ch a
> setup. Any hints?
>
> Thanks in advance.
>
> P.S. You can find more logs at <https://bugs.debian.org/1069487>.

Would it be possible to generate a preprocessed file for pseudo_wrappers.c
and post it somewhere ?

>
> --
> Cheers,
>    Andrej
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223867): https://lists.openembedded.org/g/openembedde=
d-core/message/223867
> Mute This Topic: https://lists.openembedded.org/mt/115390427/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

