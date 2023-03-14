Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DEBC7618A
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 14:59:42 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.11184.1678805974845447990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 07:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VvE0mbVx;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id o12so533473iow.6
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 07:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678805974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IJYyHwGf6YbqK5U/IVaYnP3j9BXNCQyodhRl/rEwFY=;
        b=VvE0mbVxuUW/L+9WEZq1EZifhY0byXmRpsgPoravXJcI8vlE2nZfDzBtJ6otRXIuA1
         EFXAFzp+Qq78rRcpN5VFBoilec9lFlkFJPaBdaZ/4JNF/e4+jWG5fxls2kEpBvfwAyCA
         Y3cGxIGrFxq1ldktUjGzv3eTA22AksakleSE9jxuyMZa+rPmF3B7U/z4BaASOqTU0MI6
         p7ynOqBNz4YgdO+ERP6RKieyzhbA+erORGe2A6VzK0qURoatHM6O6Nll8ujLIq1oxzXF
         NHJr6cg9DpQINzqnhPCNycDw+PhaTsSGvUVyTuKKPbeZbLtvh9Zw+7HWrgTHWlwhM7K9
         2hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678805974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IJYyHwGf6YbqK5U/IVaYnP3j9BXNCQyodhRl/rEwFY=;
        b=yd9T+3feQTzvgsV097U0Ph7+zGgvp/mvpjb/RA+U6iIRxqFXdrxEU+NKHsmkhs4I8v
         4eql4BzPR2RBhoq3ku0P+rpNUdlVnVCywqW57v9+bYLpRYXcNaICH87kwXI2EORPEW8f
         B5MMDNOlE6cXfrDKP2xr5THxAtJERSF5bDeKgX/yWIetRercZvbnS//6kXrpGNkqY6VY
         lJtK4tLTkUJAk7ByrVBw/YIMW1i9uSmuQuYSqNGToizh5G4lWAsiM/3TNTM132SStdLx
         w1VlbI6UXkSFkXK1LMObEmDCyzM40T9nRFMhi4o+U/Ct89bOkJY7oy0hScic76kwjjPN
         PnsQ==
X-Gm-Message-State: AO0yUKWvZPDK/yFaPWL+gOVWkdm0EihVnAAo3xLZbfFYlIxmYA9FdPgQ
	wMnJ5vI2EyR6cQulQjODIS0RnBk+v7XmuJuPJPE=
X-Google-Smtp-Source: AK7set9v3Q1JHCV6QCAnwoGmX8Du80DWG4qYtsknkVW2quY1njcLoMKH8bfQxb7I9PfrYzb7JXhUt3G3lsLLMgWXVQg=
X-Received: by 2002:a6b:dc0c:0:b0:743:5fb0:2ca8 with SMTP id
 s12-20020a6bdc0c000000b007435fb02ca8mr17178645ioc.4.1678805974043; Tue, 14
 Mar 2023 07:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
 <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
 <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
 <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com>
 <CAO5Uq5QnyWqi5_CaX7sHTrewVRhvT_SKdXTY7PvKe4dPryCQ6w@mail.gmail.com>
 <CA+cAkeowE7BUYie9rdFPpJ972DHK+d3WGXLKFPAKcYcVYy_AXA@mail.gmail.com>
 <CANNYZj_xAGD8x9=axLxDuEpaJF2K2yLUVH6VO1j0i5tKSvPi=g@mail.gmail.com>
 <CA+cAkeoP7ScYgbRG3eV1RR5R9bqEXm1b3cw7_gASG4uhJw=WfQ@mail.gmail.com>
 <CA+cAkerKf8yyHraJxWOyAQp91tVkgs08LSX4f3Navu1qJ+tV6w@mail.gmail.com>
 <CANNYZj9nxUwbJ6yQbnDZMtraM+Fv05LFkUQ8gKEkSbk1_70w+Q@mail.gmail.com> <CA+cAkerXmysSTdZyXzkQvURo9vpdtSxz1M5rBCcZBg5k7TV65g@mail.gmail.com>
In-Reply-To: <CA+cAkerXmysSTdZyXzkQvURo9vpdtSxz1M5rBCcZBg5k7TV65g@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 14 Mar 2023 14:59:22 +0000
Message-ID: <CAO5Uq5SY6DQV7yMgaXraP3TR6=1f-2KbcDNSXdTYZJ6B359Tww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 14:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178497

On Tue, Mar 14, 2023 at 12:58=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> On Tue, 14 Mar 2023 at 11:35, Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
> >
> > --offline seems like the right thing to add, if it produces better erro=
rs.
> >
> > Generating Cargo.lock on the other hand is not right. We rely on rust
> > checking the source tree against the checksums in Cargo.lock (to
> > prevent supply chain attacks), and this would completely subvert that.
> > There could be better diagnostics around missing Cargo.lock, and steps
> > to address the issue, but such steps must be manually taken (even
> > though they could be codified in a special task, similar to how
> > generating list of crates in SRC_URI is a task).
> >
> > Alex
> >
>
> Ok I see what you mean, generating the Cargo.lock in a dedicated task
> inside  meta/classes-recipe/cargo-update-recipe-crates.bbclass
> or maybe a dedicated meta/classes-recipe/cargo-generate-lockfile.bbclass =
?

I'm really not sure we want Cargo.lock generation as part of the OE
workflow - Cargo.lock should be part of your checked in sources for
non-library projects.


--
Alex Kiernan

