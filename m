Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC426C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 13:23:31 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.8628.1678800209633826887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 06:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p7ZeFQEr;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id 4so8625091ilz.6
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 06:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678800209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWiSYvn3eJsxIaw9TuYZBy76jMF1FtokHb+3hw9Ov0k=;
        b=p7ZeFQErIATXh2ydyoPAuGGIswbrdxkQvFTBuzWM8749KUf+CLOO7FbZHMDXPMgRb2
         e+MEwaKe5byS+Oqt1CXSwF6UOmMHzi43sD9SQmSXKPLk+tLevKUqBt5KR3EUtWIEhJ7W
         fvpYzvZ/4njvuKu7Dv3h/vSbb63rD9f7zPQ6cEJPS8lTWImyb1HsDnhUOyeGX4R25j1C
         cYqAnazFZfkOmj2ZaCpsJoOpcgMNcZPb+mNgg6Ohqq5k2rTi1vZV6UD82W8inkJPl6Pk
         uN4JVFAjb/ONM9uvCmU39FoBVY+Ow9FEmIKvvu26d9vVpGjqcxZIX2VNLn6ppAE6XxuD
         lRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678800209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWiSYvn3eJsxIaw9TuYZBy76jMF1FtokHb+3hw9Ov0k=;
        b=L4/NudGhFulgY0dT89SGgKu6xngsSwTC5UTfjoKLAMpZCuAbKKQtj5GDm/uPatZPK/
         iPWyFJMnrVNKZmhzLBmgE8ssXSfzGreJXpaSB2wGYWieofZXmtG64A+EVl6F0v2sFS5Q
         G9RDOkWOrRZDuO+FSTTEDD+mho/NrubtCLNyhO0a2l9GJa2Et5Xmfq+4KVEJMcswThkG
         HbzV3+y9wo1ayOlzb/bjqpAt5CFyp4/XVgWi7z8evFIT/87ScLTVCNQaUelTzZkXAiQi
         xiuwCMQqpB+1HCuNhGqJceT0j+6x3ErsMuSphRdRy20NYCd68JyYUIawcEsXVBNHeLIQ
         szVQ==
X-Gm-Message-State: AO0yUKVrjJpDpDuri8MSOpHRgw8Xbqcy+IjCAtURaosO+b5o58sVgx3+
	n6wnZCspqk1VBHWKUNfenJP+5AmWb1q9tbj9YEQ=
X-Google-Smtp-Source: AK7set8KS7DUn27LJ1MKlejypzd3W/1r0r7/wjJ5SlFDSw0OWfOFTY7p6PsytK7N8YLbabz5HWWLYIr/WPe/9eUZwLs=
X-Received: by 2002:a92:c88d:0:b0:316:fa49:3705 with SMTP id
 w13-20020a92c88d000000b00316fa493705mr1579409ilo.1.1678800208873; Tue, 14 Mar
 2023 06:23:28 -0700 (PDT)
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
 <174C42B3FC629754.1180@lists.openembedded.org> <CANNYZj-=Wh68FKK0SLcsZYqwheT06q3Ons7B+5EefsT5aKzzig@mail.gmail.com>
 <CA+cAkeqscNnbYZdk21sjuN-5=vbfr65Crt7S5M7TfmjF3-JjOw@mail.gmail.com>
In-Reply-To: <CA+cAkeqscNnbYZdk21sjuN-5=vbfr65Crt7S5M7TfmjF3-JjOw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 14 Mar 2023 13:23:17 +0000
Message-ID: <CAO5Uq5RDYh37pfOV0HUPD_TAzq320Z7w+Z+0AKk5cPEsraDVxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 13:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178490

On Tue, Mar 14, 2023 at 1:00=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> On Tue, 14 Mar 2023 at 12:25, Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
> >
> > The other option is to add checksumming support to crate fetcher in bit=
bake. If all items in src_uri are verified by fetchers directly for integri=
ty from checksums in the recipe, the cargo can generate cargo.lock anytime =
it wants to.
> >
> > Alex
> >
>
> Ok, so If I understand correctly, that would mean a modification
> inside bitbake/lib/bb/fetch2/crate.py to add such support ?
> And if we have that, where the Cargo.lock generation should be made ?
> it can only be during do_fetch step since it will
> require network if a "git" dependencies is to be found in the project man=
ifest.

You'd have to list all the crate checksums in your recipe, so the
crate fetcher could check them.

--
Alex Kiernan

