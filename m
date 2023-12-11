Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFEFC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 09:10:02 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.4405.1702285800069189633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 01:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cPRMF/8J;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c9f9db9567so47223501fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 01:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702285798; x=1702890598; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUXxXqm+zSjGkUpf7Jt9bj6jpPI7/7S6KVbKmxkbXEs=;
        b=cPRMF/8JuNhEfTTEwunRuNV52FzJ5NjeVVk4SaXd4LVButOkLNjNvZX8oHEBA5ucOz
         g4S7eC8aa1Vu8FtVx3lS7XaSX/xo9QOQ1YodThDSFS0gM2rjI/7MJ0zDUB5R3M5NL3dl
         e1f+2vok2qX538oQdjxV+2fHSHhzugo9vVRQ3s7W+YNEzspaMv6teSmC17cIadl9KLIp
         5zt/zPq9u0gaFrmLWC3V62QH94LTQbutCmWRm7yA4o0A4z+VhsNJDIH5/KMH0b5XbFho
         au1fSj+QXPfGrhhe6Go5T2qTRkXBU3Iak7szbKy04q9q1XGKO8jYYY1sEizATHu50hVM
         wd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702285798; x=1702890598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUXxXqm+zSjGkUpf7Jt9bj6jpPI7/7S6KVbKmxkbXEs=;
        b=b6jkW/CgEKavpvRnjwrD6rJ0DwpZ5VBjD1Y6VViLpvSePnFr0bMb0rUERLSb4pJ+cv
         aFz6pXsNgUspv9tCgB65yv7YRgCWT9rr+OWQkp5gpecz5+3PK5kttlK/gZTNBq2rivez
         uoWNdU4dRwTkwk2mAgv0mjANemz6V+0ZW1SmSp/ov6ZNkh4DclepjNKBCeeKocwRKIoL
         uPZEiBLOzh0C9AGSmUqA4RSIgxDVpMSN97kcfXUWGEGcpoattJr2LHf2qITDpwR0MiBv
         MxY7LHacovWK4ABdyibCpRcccWxS8vuw5L8HpmvbwDvurb1QhVk1HBNlQUfMnz56nLcX
         vuPA==
X-Gm-Message-State: AOJu0YxU0Ls2GJsfNNG9G0kLhNWEtfBmNsV3OHGCHgdPuKn7yboOPywe
	punwxa/1O+g57KHKivuzXuksrKFxl4twxPuZktU=
X-Google-Smtp-Source: AGHT+IGfZHg65H7DcL7z33gTpAXhW+4kYJjus2a6L1YWIbpkBZNYtDNF8neIHrPScZJI92v0OnlnhaC8CHs79tsUQDs=
X-Received: by 2002:a2e:a783:0:b0:2cb:2b39:8646 with SMTP id
 c3-20020a2ea783000000b002cb2b398646mr1531599ljf.16.1702285797826; Mon, 11 Dec
 2023 01:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20231210191046.4785-1-alex.kiernan@gmail.com> <CANNYZj-Z9apFWXOw6J63fQn+CRn-dLUEEer-oW7nieVHJ+M0pQ@mail.gmail.com>
In-Reply-To: <CANNYZj-Z9apFWXOw6J63fQn+CRn-dLUEEer-oW7nieVHJ+M0pQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 11 Dec 2023 09:09:46 +0000
Message-ID: <CAO5Uq5SPRKNTSACY6X7+8FcswTNMkg2JEL5ub7oBJfSWoNCDow@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/2] cargo-update-recipe-crates: Use CARGO_LOCK_PATH
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 09:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192148

On Sun, Dec 10, 2023 at 8:35=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
>  I have to say, I struggle to see this as an improvement, and I want
> to object to it.
>

I have to admit I kinda thought this might be controversial.

> Why set the path manually, if the code to find where Cargo.lock is
> just works, and handles the situations where upstreams move it around
> in source trees?
>

We have to know where Cargo.lock is else cargo_common_do_patch_paths
fails. Searching for it one class and requiring to know where it is
another seems odd to me - my first pass on this change was to just set
CARGO_LOCK_SRC_DIR based on the directory name of CARGO_LOCK_PATH;
I'll resurrect that patch.

> Also, is the assumption that there's only one Cargo.lock valid? I'm
> not so sure. Note that the code was specifically written to pull in
> items from multiple files.
>

In a single project there are (potentially) multiple Cargo.toml, but
just one Cargo.lock. If there's multiple Cargo.lock files in a repo,
that implies multiple projects which I don't think we've any way of
building from a single recipe.

--=20
Alex Kiernan

