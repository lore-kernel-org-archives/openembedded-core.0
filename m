Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76120C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:27:22 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.11808.1678807636076047490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 08:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nqanWONf;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id m4so7513561lfj.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678807634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49SoIS/z8T21U/MsGNJ5JEopYxx+aPQjpgj8W8Axv0g=;
        b=nqanWONffcphS7T7VGkic1UvplDI8Iuie/OmFW7K6LX6PlTIwXWXuTU5u2FBJPwRT6
         YbFQqvpO/41gizL9kYDOIIs0rvZobJMJlancSKxY5U/85S9KGu4l5dc+ZuqgLPTAh3Wp
         Tw5CMzngsLNfoHNM/fvdgH2yexY8KDygoClGuKgtjQqmH7n9J6QMoB1yZ8eQ5zHLYdXm
         dxZleqJSHLWz8wWreF9We/rOtHSyUvuTLObsgFm4Q9OCFGIyUfcXO6MpKlqIQpPfI2Po
         W6brUQk5oUxanEBQgG57QEAOWpWd+WQ1SmVVdc9sWvLb/SciFf1ZV5L9KKjnk7K4sdeO
         iq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678807634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49SoIS/z8T21U/MsGNJ5JEopYxx+aPQjpgj8W8Axv0g=;
        b=O/UvC2ChOZ8x3EKQgxbqcivPVWQq65tRiFk5wnYnV66+7CYHSnK5R88S2/uk3P8+Az
         h6K2Emy3eQK5XOAHaIOi94+7CX9n+/kt7TQ8JtoAkAJr02+iInX6SGDOTP+mbr6btyK8
         r3co/OYnl/PeKq+9qsjwULVO4QDaKPziMRjAatshCcqCcgbG0SFp68vQJUJVSPXBUzH7
         8bdWViahEh+xKukhvdGfSZ/11XFHLTaq9umdHHbtt6zpcij8eDTjP9xzrY8CvBFgdH8Y
         VLsic64Muu9ySn1KHrWeFW6jDiNk0hzvE0kC+7n8mxANkvOzSIgWsTLgml+rhUTxsjeB
         sYSQ==
X-Gm-Message-State: AO0yUKVpRdVQcHX/a5U6ksKPCzsrhj+KH0jhCksPyH7yZt0BMnwJCwMk
	AwzeM+F/6Y+ZCxYMiJLxqFGPpB462dU3LVMedc0=
X-Google-Smtp-Source: AK7set+VqGPb/q03Bx4t5N0iJWctFGhR7jQfhIpPo1x8qWctZLpXs95C87awAsVWkmQBu89m0EPfsfb0glXDVecg6Ag=
X-Received: by 2002:ac2:562b:0:b0:4e8:426d:123f with SMTP id
 b11-20020ac2562b000000b004e8426d123fmr880430lff.11.1678807634136; Tue, 14 Mar
 2023 08:27:14 -0700 (PDT)
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
 <CANNYZj9nxUwbJ6yQbnDZMtraM+Fv05LFkUQ8gKEkSbk1_70w+Q@mail.gmail.com>
 <CA+cAkerXmysSTdZyXzkQvURo9vpdtSxz1M5rBCcZBg5k7TV65g@mail.gmail.com>
 <CAO5Uq5SY6DQV7yMgaXraP3TR6=1f-2KbcDNSXdTYZJ6B359Tww@mail.gmail.com> <CA+cAkerdO8P=2DTL+qGj=ZF71LO-aWxn+qN+EMkT2TemokAhxg@mail.gmail.com>
In-Reply-To: <CA+cAkerdO8P=2DTL+qGj=ZF71LO-aWxn+qN+EMkT2TemokAhxg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Mar 2023 16:27:02 +0100
Message-ID: <CANNYZj8AJ=BzxVobr0xq5pQrYA70=SFft0PKdnSJ=YL+NHAVdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 15:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178508

On Tue, 14 Mar 2023 at 16:10, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:

> Understood, I searched how to add checksum support in crate fetcher but I=
 don't know enough of bitbake to be effective.

You can check how for example http:// fetcher does it by utilizing
verify_checksum() from lib/bb/fetch2/__init__.py in
lib/bb/fetch2/wget.py.

Something like that should happen in crate.py as well.

Alex

