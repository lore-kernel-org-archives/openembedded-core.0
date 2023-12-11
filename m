Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C94EC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 09:44:02 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.4815.1702287837359560091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 01:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b3WHxHB9;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50bf26b677dso3972994e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 01:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702287835; x=1702892635; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPA6gyY21WUmB4KXV31dZD42ZzsoH0hbGp4Ha0qcQhU=;
        b=b3WHxHB95tprkifofBbHDvPGDpVgyyP8rG/3X9Yp42EbmhDehQOwqAtIjU6fDNAJ9X
         WtZfsWB2fyZ2zTMmZvSVvcL14w9scBLoskwAYWS0lYiwXW6BVqer3NIkG/lAwX5OGj6r
         GCMvl0UUB1SxJoD3IH9MR9uhXYiOQj8iQ789ma+/n+7ZHf8sqa0jpitJ28jw96KUdi2C
         97NeG1oQ+Bc8o83/7MwLfzM3Qv9aafkDeMhrM5HPOhkwuxd03UVVIbJehPferwRS/uES
         vNkXRTQ5rH8pkM8PLmtbZRaiAmRhQJuR50ZL2Q/W0l/pM0pkRkr+T7f3rgKjq0VBiZNv
         63HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702287835; x=1702892635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPA6gyY21WUmB4KXV31dZD42ZzsoH0hbGp4Ha0qcQhU=;
        b=pgnLMUElNQ1ZYsyXC4aZWECVDrjf1OsycnArGplwwpVGtLvHO4ELdtNh60aAKLzzj+
         YLm7mV6bdkmWpUVtcxrGNjK97sDI0PXULQnAHIGhIpwcTPCUk/V1K70G6vSHrPvu59mm
         MvGNgIeIW1VOLsLAAX2ejUgvjsIbGsmH6mKRArhOWKX9iT6n9Ok+o/bul9kmUk11aTZn
         2cRXx6ghkRgtGWRHhOVYMu+O5OvEX0yZfnyo7IeXwwshH5Bubxv5iwSUJNwcuEsomLIj
         BMvhG3+xouSQXHeZNDdOBNs4Oc1PhL4ZVYoso19DPJo0MZM8wevoUN0JxdqI3JJ1gRO3
         WfEg==
X-Gm-Message-State: AOJu0YxBYW6NrPABo7UuRBIqWRaJqhc7cEaPtGTim6mJa6bBzbjopa+M
	pz2jkLw6s6uLwhZfK9kFVN+j7PDmX4f2KISyty8=
X-Google-Smtp-Source: AGHT+IGOQkwsVxm8ywReqyvlVZVX4VOui43acR6rRiY2txhrMZWXpauDWu+7dVuhOfIBBNxdw2n15edd3Hlfb4oc7pk=
X-Received: by 2002:ac2:4c95:0:b0:50b:fcdf:f562 with SMTP id
 d21-20020ac24c95000000b0050bfcdff562mr869193lfl.185.1702287835096; Mon, 11
 Dec 2023 01:43:55 -0800 (PST)
MIME-Version: 1.0
References: <20231210191046.4785-1-alex.kiernan@gmail.com> <CANNYZj-Z9apFWXOw6J63fQn+CRn-dLUEEer-oW7nieVHJ+M0pQ@mail.gmail.com>
 <CAO5Uq5SPRKNTSACY6X7+8FcswTNMkg2JEL5ub7oBJfSWoNCDow@mail.gmail.com> <CANNYZj_6KHT0=WDhcUqL7tEY0kZmhkU4wvRKGRp_cHcgN-Q=QA@mail.gmail.com>
In-Reply-To: <CANNYZj_6KHT0=WDhcUqL7tEY0kZmhkU4wvRKGRp_cHcgN-Q=QA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 11 Dec 2023 09:43:43 +0000
Message-ID: <CAO5Uq5Q=MJVhmo7cWBm23C05RnLW6eNCQXTo_=4zoDgmb9vLKg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/2] cargo-update-recipe-crates: Use CARGO_LOCK_PATH
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Frederic Martinsons <frederic.martinsons@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 09:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192152

On Mon, Dec 11, 2023 at 9:28=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 11 Dec 2023 at 10:09, Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
> > In a single project there are (potentially) multiple Cargo.toml, but
> > just one Cargo.lock. If there's multiple Cargo.lock files in a repo,
> > that implies multiple projects which I don't think we've any way of
> > building from a single recipe.
>
> I'm thinking of projects like librsvg, python3-bcrypt or
> python3-cryptography where the build is orchestrated by meson,
> autoconf or setuptools, and where we don't run cargo directly and
> leave it to those tools. They may have single Cargo.lock now, but will
> that hold? Also, that Cargo.lock is not necessarily in the root of
> ${S}, so you'd have to set the location manually, instead of not
> having to worry about it. Is CARGO_LOCK_PATH or its parent variables
> already set correctly for all of them? I see this is not done from
> python3-cryptography; shouldn't the build error out, if
> cargo_common_do_patch_paths requires the location? Something doesn't
> compute fully here.
>

That's exactly the one I was going to look at next, as I agree
something doesn't add up there.

--=20
Alex Kiernan

