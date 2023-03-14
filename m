Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6984C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 12:53:11 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.7760.1678798388301827962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 05:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U2jIme/a;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id f16so15888103ljq.10
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 05:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678798386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qNghP14//YPNcqBSbenJhsgIVHjUm6blFDA4W+WlD4w=;
        b=U2jIme/apxf0INhF3V0OiEmqWkqoBBne2r14KK0iq/Mcxd/QnFUxfPNRbYVgiyRAde
         xgQ3fk4J+82GehcYmkAzDnoYbEIHh4dyGNNbpT+b4neu4XsJzos+yFF1CUKK4WoKa/BM
         DQg9wPrpuJThXwJExlbFbbqOOfKHegDCW258OasEJuoiW1M29Vl0RCmwv2607Ye83sQw
         EG/l8uO/ZU67oxxT4dYWUbTzBHcIZhABzmIsFlhVimJgFQy7k/GCPTmvgptZsH1qzwIs
         +Erk+kWcwp5fmkby/a+KkS//TLmvq/IYCcL0iE+asxMx5z5N3yXr/Ok3Gp+NxuwGJH29
         y2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678798386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNghP14//YPNcqBSbenJhsgIVHjUm6blFDA4W+WlD4w=;
        b=rpFzY8rG9ACwtys8p3C7ifg/64upEMSuUVijoz/U+72GeucZarJ5Yxve2L0YELzwC9
         6KxBQUpywXZ64N+l/O3OJK/+R2ZGCZNe3Wc9cM03jnjKNGUb4KdwfjvQ5NdQD7LV3rgO
         kOU0WUM0eeDf84NRGZFkIWs7NWJG/4gA1oBS8hpmyLsumdK9pktibGTGubWXWzT6Og39
         gBVGMqw89nZzkgKHm3uWLuoy2QDTnqWZ3Ka9W5fw9Y1X03+M8RxdF/LE+mB+GczP6KZY
         RN7n0b/KSNvkhhoncGqve/QBsKLWb9PP3UTE0i+32q4qxShyIEvXEpu38weKFHpA1qJv
         QstQ==
X-Gm-Message-State: AO0yUKWyGZK9I4aaGMNMzCqNPj3LhM+erPpgUp4kQ7ru2jgXGgbTgw4Y
	Kojm9lrYtMUFf9DCAB35/GaaYh6yPUVBtqxPnUA=
X-Google-Smtp-Source: AK7set/l9Vmdg2LLQe0CmzvHg1zktSv22VGoMtzDOAhODDmE1leJhh615RE6G0uEtV9/IadwYqphNZ8lIPzW7tSAJy8=
X-Received: by 2002:a05:651c:ba3:b0:295:a8d1:8a28 with SMTP id
 bg35-20020a05651c0ba300b00295a8d18a28mr11797270ljb.3.1678798386186; Tue, 14
 Mar 2023 05:53:06 -0700 (PDT)
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
 <CA+cAkerKf8yyHraJxWOyAQp91tVkgs08LSX4f3Navu1qJ+tV6w@mail.gmail.com> <CAO5Uq5RSduyH-4Rhxzn=L3yS+V1ogM5GNoakbP-sHB9w0Www2w@mail.gmail.com>
In-Reply-To: <CAO5Uq5RSduyH-4Rhxzn=L3yS+V1ogM5GNoakbP-sHB9w0Www2w@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 14 Mar 2023 13:52:53 +0100
Message-ID: <CA+cAkepTe3cDC_-UBRJmPUMaVa7KzRrtY6+yC3vyedjb6UjYoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 12:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178484

> Cool, will pick that up... the code needs some tests which is where it
> stalled last time.

Any help I can provide to you for having this patch merge ? Are you
talking about unit testing ?

> >  https://doc.rust-lang.org/cargo/faq.html#why-do-binaries-have-cargolock-in-version-control-but-not-libraries
> > It is not for "library" project.
> >
>
> So I'm clear, you're building a library project here?
>
> Could you consume your library into a wrapper project which brings
> Cargo.lock along with it? Other than running tests on it, I'm not sure
> what the value in building a library project is.
>

No, I build a binary but was not aware of the recommendation to add Cargo.lock
in version control (and was not aware that was the missing of this
file which make
cargo execute network operation during build),
I just started using rust  several weeks ago so every day I learn new
things ;)

> > Maybe we can add a "cargo generate-lockfile"
> > (https://doc.rust-lang.org/cargo/commands/cargo-generate-lockfile.html)
> > at the end of do_fetch ?
> > Moreover, I think we should add the `--offline` option to cargo build
> > because the error generated will be more clear:
> >
>
> Let me chuck that across our code base, I was fairly sure I'd seen
> different problems with it, but it may have been whilst I was
> debugging this first time around and am mis-remembering.
>

Alright.

