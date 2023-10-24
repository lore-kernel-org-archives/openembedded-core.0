Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159DFC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 08:51:08 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.13649.1698137459646649013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 01:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XsVmSK+z;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c5210a1515so65339531fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 01:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698137458; x=1698742258; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtBExe4iY06qSULho55Y3RXWmvHfW41FaO/Jh/Henbc=;
        b=XsVmSK+zeD/pbtA9MgraTyxdHaQkTd1l4kj++5a7j2IHzzm5tp6NrOmSuDaDDY7HUA
         amNht4+kWCrRY8DeWiWZuKIe3TkoMJT8aQVP8wUiY8/CEg4zrEuPGn5s9GjExAPF0Q4J
         EkKBDlEG8xJU9ZQMX05l6O3t0O5FHlwRJJbHyKADesVZYITRnJ/0J8rmNmzZHzxaT9da
         wn/4MKBGjICzy+p+bB7bMNOIIR9TrPmLgMxU0/Ka6Ustzz/2CCF8SqIyqugECZEhO3K4
         pY4Nj9o+cZFBhNrehw+8SJ9d1HFPcqpG/i/WmBvu/7jBfFfwMXs0Innf1nFOEV/dWBP2
         rYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698137458; x=1698742258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtBExe4iY06qSULho55Y3RXWmvHfW41FaO/Jh/Henbc=;
        b=mwf+qu0qR9k02KaOAk/fqllQ25N0Hgcxfbcha6Scqz2ktC5q86Z/e+TMS2PT2+Gl7A
         fqj9cnvYNaQnTFfNYOAw3YLal9xGFrTTTj1pZeCQtmAUZyH9zOjLJccWVve6WUPRV/X/
         ky9rEPTGfRAVzL0wBakjqStkslgvnQCkdabhp9V5RHFFdZLPamnVMgw2yYIcijeU5FH5
         tIgEvejXFWy4QzxehPh+QfvAckcpSTOF8gh2HkjOSaICcKlIuLesbnK4jmC9+GSKv5Z7
         9iRslGBuFKzRSzdV/BFCjxPkZlGKmMdgdm2/U5Jhh6gvQRT582j+/RZ80VGIaIyMzIwb
         G8Og==
X-Gm-Message-State: AOJu0Yx6BH98d/Ri4dk8AFctFciAwFm1BGqy/r6QENPqWeEDzxfWjgFC
	8FldfrmzBle15jB73fMDtCFs77Qpp2YGvV57OOU=
X-Google-Smtp-Source: AGHT+IFBozd5cc9LWmdfJEfvSuJhxcSxzzNxByetYqFOyY2ndNZZnN4zNNGy+aAShmk15Vui/xLn46CFG8dZ5GT7eck=
X-Received: by 2002:a05:651c:1416:b0:2c5:19aa:ca83 with SMTP id
 u22-20020a05651c141600b002c519aaca83mr8146595lje.20.1698137457451; Tue, 24
 Oct 2023 01:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9rnOQ8BugHMLMzEGqFdHtHL+SkFmDjLvgNo8adO4VHVw@mail.gmail.com>
 <6763.1698120765303220209@lists.openembedded.org>
In-Reply-To: <6763.1698120765303220209@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Oct 2023 10:50:46 +0200
Message-ID: <CANNYZj_sBnowv-v7XJed+irmv_hfw+QiipycWdaxmY4ZR1MYZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5] kbd:Add ptest support
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 08:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189642

On Tue, 24 Oct 2023 at 06:12, qiutt@fujitsu.com <qiutt@fujitsu.com> wrote:
>
> Hi=EF=BC=8CAlex
>
> As you said, it is not-that-elegant bit of code.
> But DATADIR is used as a part of CPPFLAGS for compiling c files in tests,
> such as libkeymap/libkeymap-test01.c, libkbdfile/libkbdfile-test13.c and =
others.
> sample:
>
> libkeymap/libkeymap-test01.c: f =3D fopen(DATADIR "/data/libkeymap/charse=
t-keymap0.map", "r"); libkeymap/libkeymap-test09.c:   setenv("LOADKEYS_INCL=
UDE_PATH", DATADIR "/data/libkeymap", 1);

I see, thanks. I would suggest that Makefile.am is patched with a
dedicated patch that sets DATADIR to ptest directory on target (you
can mark it Inappropriate), so that the change is robust (sed
expressions are prone to silent regressions, and), and happens before
actual build, so no 'make clean' is needed.

Alex

