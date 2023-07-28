Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3966BC001E0
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 13:01:37 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.31761.1690549288177194024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 06:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DK4tYP6B;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b93fba1f62so32092741fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 06:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690549286; x=1691154086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5symidEpTelZumyky/C425EsFU0XZ4Xps9ZrGUBdB0=;
        b=DK4tYP6BeMh5l8bSqbXLw7Fmn+hmMFNUUbF0BkeJI+yInUHcQjHNXhBlkan0CJ+rLz
         Op2+3jy1OaH/x7Upb9vv6ENkatVyzlZ5u14ROo3wZzE0cdK3ZILEzs63AfCapPXIWV0o
         ggueP10DhYyCKf1TyomFxXn/q1L8wf8LR7Czz6Bq3fcWoE7L6KoZ+XV/N8DONOV/UEVl
         WoFK3DCwGd8oyUpFnyJV+Z3yDcP0wzsUyCvWCeUR86IZeA64u0xR5EK7rIAaG9CBzcZU
         JegDS7PO6NnsDWJ+QKqQyL7SO8nPXw1XUlSPQedn5K6cOxD4OT+Kx20+bm/JHi4+ffs+
         tBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549286; x=1691154086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5symidEpTelZumyky/C425EsFU0XZ4Xps9ZrGUBdB0=;
        b=DqxKBeH4xeoC5mP8RXcx2dMPba3kJt9N8QbYwSM63hf+dcXnqiVP8ko2vMPf0ntq3M
         W0/EOBBcK78G/xPcQ6BFxPYnVHy3DNsNQVKD/RDRsUfNJxTxt+DI0p8MPUHHbwitQey3
         +6hohAxkDyc1+/n2RqgIsyncU19kF3byEroxr4m9bRFlzu95VCLSR0tbWO5XdwlRiWiD
         iA/IgcJ3ifK3AlZhXPRh5CmyeuOKVmrDsruYwkAKYQEzbkGlsFZyx/xPG2UfQMbix3CK
         TqF8KntHqvTxe66B0RzsIbl516729NQCtJ3EH+XUWU2C0ydDSgB51U58S9ZMn4mwAN1t
         brAQ==
X-Gm-Message-State: ABy/qLao79Jk/mwbINdOXTWncin9XgoZYdBJj29erps5AL4n/ryD+lS4
	iqKmXtqms6/saKVD5QvUxlpMj4T84xL2idOIo2wz/gdj
X-Google-Smtp-Source: APBJJlEx6iyMt45pIlCYM806WM8Xxoeov4kwbtqMPPKD/DGQOZ9iyRqtjoRcXBSqVtdbC9AISD7zxIEr1Jo97N6Qxe0=
X-Received: by 2002:a2e:2c0e:0:b0:2b9:344c:a214 with SMTP id
 s14-20020a2e2c0e000000b002b9344ca214mr1907379ljs.42.1690549286058; Fri, 28
 Jul 2023 06:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230725135719.388231-1-zboszor@gmail.com> <CANNYZj9_AbGN9YsahpHVHA8wqingZaKfv-DD_DPGURt4ezPn5Q@mail.gmail.com>
 <17756CA97DEFC46E.21334@lists.openembedded.org> <dfbfb13e-208b-4a63-b0a6-339452184c9c@gmail.com>
 <CANNYZj-7LvTF9qBuQu_grfX6LAMwQHG6fme8xE2+F-nA=0x7+Q@mail.gmail.com> <a3118854-d350-1029-9288-03967d821b13@gmail.com>
In-Reply-To: <a3118854-d350-1029-9288-03967d821b13@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Jul 2023 15:01:14 +0200
Message-ID: <CANNYZj8DUAnab6Kmcn7HAq9HjRiZbKUw0wPsgtHJWwgB46v3Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm: Allow setting platform macro settings externally
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 13:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185028

On Fri, 28 Jul 2023 at 14:12, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
> Fanfare... my RPM PR was merged.
> https://github.com/rpm-software-management/rpm/pull/2585
>
> Neal slightly modified the INSTALL text, though.
> Should I send an update after v3, or you can work with that?

You can do a partial backport, trimming out the INSTALL modifications.
It's best to otherwise submit the patch exactly as merged, so that it
can be dropped by git rebase in automated version updates (or at least
there's a higher chance of avoiding rebase conflicts that need manual
intervention).

Alex

