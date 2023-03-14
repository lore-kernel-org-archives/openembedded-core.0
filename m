Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD39CC6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 13:01:01 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.7921.1678798857222389768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 06:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ikGObFJC;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id t14so15936396ljd.5
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 06:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678798855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xwN/pGFq43/ZK0YrRK0M9vC8UQQtodS/5ibEikclgIw=;
        b=ikGObFJCWdRxqnRIGtndNdDo8eGpLL+AKqkFF3KT12Sjlqj5tkhjiHb+jsLeo6IlTU
         tZsyVl4A96sJyrxKBQ1wuImcYoJ4cA78x/MUr5sLHFvP9Gkoz4v8Hobs7hSbc0SzSlg6
         pzqLuWkEy+XTZLQm4hX2DM/qMmS6Z51/Fr/G10xuPNdxMuaOT0sxA9ABZf8u9fVAX998
         87QNya+e7C4Y6QM9pXgfV/BGIAAFEa45tVwl1qS3VERNd/WDUW6csY3oIYjz5CdCukTu
         C0Gen83mJbILUCrMqXy9hGYZbhdKnyCleXkL4v5um0GqxurtqdVmDT3QF5EK9+bMCk+g
         ZUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678798855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwN/pGFq43/ZK0YrRK0M9vC8UQQtodS/5ibEikclgIw=;
        b=fKW96rbu12ihaKM22AY8xubtVZW8OUX+5f1NXOf6f1BcQa7cO1OoUowEzXwvVhojd8
         DBOfp7tUEu3f4aT12LTwHZtcBItVSCNqLKl/X6oJltpcSlWr3KMVZByV3rFkaxkOOwST
         2tkwJeEt0LM9hvgI9JLlXW/bDz89xKuzOrV96miaez0uzIPKYlzNcxd9oaMZHb0O4uBD
         4TLA6vV0DX1alFKUSJWc1JchWcGlC4lt6h+g+YPvEiOcr8VnNKtu1CDsPjbM4v0bQmTg
         dkIfdIzlpD4JMUUQjxc870C/ESnp03wh/idma+fMfJn/eBBqJyoad+rrz6m0/6ecyiCl
         oA1Q==
X-Gm-Message-State: AO0yUKVlvllPF6K5hjGbIvil1uB7PW4sqFJbgRIEZr4bqzObb+WuG/8O
	2gEHVKCABujlXzCbKmVmBspyPr5Lr6syE97uCK4=
X-Google-Smtp-Source: AK7set+vJQHvs6lixlSYM1rvnGSLnl1zJMytp0L2DYEJsR0A0w8mNHUDc+SHAd8clBeh9bRbdcjWDyECO+dnyyqvno4=
X-Received: by 2002:a2e:b548:0:b0:295:a82e:ec06 with SMTP id
 a8-20020a2eb548000000b00295a82eec06mr11819347ljn.3.1678798855345; Tue, 14 Mar
 2023 06:00:55 -0700 (PDT)
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
In-Reply-To: <CANNYZj-=Wh68FKK0SLcsZYqwheT06q3Ons7B+5EefsT5aKzzig@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 14 Mar 2023 14:00:42 +0100
Message-ID: <CA+cAkeqscNnbYZdk21sjuN-5=vbfr65Crt7S5M7TfmjF3-JjOw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 13:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178488

On Tue, 14 Mar 2023 at 12:25, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> The other option is to add checksumming support to crate fetcher in bitbake. If all items in src_uri are verified by fetchers directly for integrity from checksums in the recipe, the cargo can generate cargo.lock anytime it wants to.
>
> Alex
>

Ok, so If I understand correctly, that would mean a modification
inside bitbake/lib/bb/fetch2/crate.py to add such support ?
And if we have that, where the Cargo.lock generation should be made ?
it can only be during do_fetch step since it will
require network if a "git" dependencies is to be found in the project manifest.

