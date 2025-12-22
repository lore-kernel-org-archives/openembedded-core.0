Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882FFE6ADF0
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:43:38 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88311.1766436217002375912
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:43:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YsWkyJZy;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88a2e3bd3cdso54744366d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436216; x=1767041016; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2s6klGKy7Stzj+Fj3DHFrH2NBPEeVoyOH/CznYQE5jI=;
        b=YsWkyJZyfwVmKEy1TAbeHEXNWO6sek4NuC+SRHXd+Bl+cdFdJPRlID48cKVrFlT/9+
         eFKAfiG5OflDuVM8RDHHBuIKWtCgPSDghcR8Ejf6C32VWDZsOwNOyXX8TBadlR6cqnCF
         p9sh9Y5aCW1pI6csnRM763vjPQbf6eslzkoWbydlt89VbCtRfmXW57Z9bl2G6DpOwftT
         Qwjvoo3qt093gmK9Tup9rJh80nruOUvOJWEHNxL+LVYHXxialMvrE+MxFhQJAQH3QsRm
         EE9Hqff4LF2HNzbOFYrBZML0HmRoyfxQ4GKPTszQhTUko0Z6gqKfTsLC4vPlWkVLMN6z
         Q+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436216; x=1767041016;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2s6klGKy7Stzj+Fj3DHFrH2NBPEeVoyOH/CznYQE5jI=;
        b=OBlrz9t1HnLuRNdAnymvo6PGS/FSofNlYJoPhjfGPyAQ/VIkwoW4774AU2lX2tiIMp
         w5zHneiT44Cd7PnCVpgaUuAbXE4nJ41ib0RMiudwimeQ47oT3924TDk8lwd+H7/SiKBS
         JtpILU0oXyQviLUZrCM5GwyNi7veo5Ktyx9ROZ4wNjV4/Nwx8tkiHHfCNjUMNgA3Ab6L
         TIS6mOholWEQAYj7kQ85OeEg9ah+aLQjdgEoNYJ47xwG/hKLMap75Q/h82cuwj5IdCMW
         ukGwh8SlLzDuRX5q4nEhQuLs6duvviOnKcd5mA0X/dD5KFtCVO7hSwbZyjPnX69pl/c6
         hTow==
X-Gm-Message-State: AOJu0YwRc8XavG4pZD3/lz3zQB1VW1W9lZh3kQulR3Tvbemb9Gc5RRAF
	5znVG9Pjjgb90X+XtxUgPavHVcZ0i/QESAxq7F7Tt4MlckE6bhjfEmgMWXgFS3ipsVMkw/A4Tae
	JXIqw9rZlhI0RoJuPZOKAE5zntfoG2GOusyIs
X-Gm-Gg: AY/fxX6bMoEt0XkeKQhM8CQ1A5o3fPKqVi1BAzkC8L9VBx+jhCzNKDaTiJaNvwqAEcr
	t3lju0TawKaqVSVZ5mzQ9ylS4NWiw8J1UWTL2H/LghDNnc9zNKmE+4MAJOSmopUNRDuTtKIPPgj
	OMovD37bu/oPcIv9zDraeZVvNd7vp4Rfn7xMgS0R7NorDdtCZ6jlCmQgEWJKyquuQqilxlAm5Le
	hRlXnMPHz1rrj6iLhDLfkH1ABT2n3eUNwVI7tu1Dqis/STobZsuvlt1HqkxQCBwpmrXLQ==
X-Google-Smtp-Source: AGHT+IELgtYQd4FvHtJYO6EUI1DAujsCa6Ms1hZlP5Csxg3UTvY00Hy0bhr7mMKnkH8+/KHB4OL73jrYU8zkkUjj+/s=
X-Received: by 2002:a05:6214:27e9:b0:88a:525a:8dbf with SMTP id
 6a1803df08f44-88c50bdc165mr248349506d6.15.1766436215905; Mon, 22 Dec 2025
 12:43:35 -0800 (PST)
MIME-Version: 1.0
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Dec 2025 21:43:25 +0100
X-Gm-Features: AQt7F2qd55JQxIZqPc1RlAr_VaJthCigRdt2wTFfJgVHB6w7mDDCCaBlp3khueA
Message-ID: <CANNYZj8+GHDz27vR81fE2p=gmm7oyNZnjgLyMGoNHugMc9jtww@mail.gmail.com>
Subject: recipe version updates in oe-core: what was left out and why. Help appreciated!
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228425

Hello all,

I've just sent a 114-piece recipe update set for oe-core (only the
first 99 made it through, the rest will be sent once I am unblocked),
and I wanted to summarize what was left out and why.

If you can pick these up and complete them, that would be awesome.

1. perl 5.40 -> 5.42 (with associated perlcross 1.6.2 -> 1.6.3 update)

There's an earlier patchset that was left unfinished (see the messages
for the issues):
https://lists.openembedded.org/g/openembedded-core/topic/116577571

2. rpm 4.0.2 -> 6.0.1

Major rpm upgrades typically hit all sorts of failing corner cases in
testing, I left it out to send the rest ASAP.

3. epiphany 48.5 -> 49.2

Needs a recipe for 'blueprint-compiler':
https://gitlab.gnome.org/GNOME/blueprint-compiler

4. webkitgtk 2.50.0 -> 2.50.4

Fails in qemux86-musl:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2907

Patch available in
https://git.openembedded.org/openembedded-core-contrib/log/?h=akanavin/package-version-updates-later

5. libnl 3.11.0 -> 3.12.0

Ptests fail due to missing kernel modules, noted in
https://github.com/thom311/libnl/issues/448

Patch available in
https://git.openembedded.org/openembedded-core-contrib/log/?h=akanavin/package-version-updates-later

6. appstream 1.0.6 -> 1.1.1

Needs libfyaml https://github.com/pantoniou/libfyaml

Appstream itself is needed by libadwaita, which is needed by epiphany.
We could perhaps try to make either optional.

7. openssl 3.5.4 -> 3.6.0

This one is held until after upcoming yocto wrynose LTS, due to
openssl 3.5 itself being LTS and 3.6 not so:
https://openssl-library.org/roadmap/index.html

Cheers,
Alex

