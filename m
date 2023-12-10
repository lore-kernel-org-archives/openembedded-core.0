Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09666C4167B
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 20:35:20 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.62663.1702240513259824091
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 12:35:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H/SUE7qb;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ca0d14976aso49929581fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 12:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702240511; x=1702845311; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rJzLC8wnzvtDTDhIn06k8Ut2Z6B2n86/OKDBNioLuNU=;
        b=H/SUE7qbC1m/21u8o8KiJYGgJgZupqtSaGxvJIcKMWhZbTk0zfy/6m9fe1jt1n39Mh
         N3ZZyohDTGUbDt5OEmRiT4pi3RGmDJ0uaKX9pxCbLlVgtrUho1KxKDbM3RMY6Vp6WeCs
         9NSCV61Y7yiuzkZ77SCYA5eldVgJYGV9IjBJYannZACWIbeqQdAFDjzDZ9O1kDtdgzv4
         FUY6LRJ3VhnS4J+3UmnMmhUvwxkjd8X6Ijw41+McHB/RWw58bsd4a1vYtlcZsse09EM0
         ur/YmdHT+NBiPJfjYhCIcW2oUxg36NWhfhwrNQ+ztmSG54xWw+kw3P9nw8G58p/82RDR
         ErUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702240511; x=1702845311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJzLC8wnzvtDTDhIn06k8Ut2Z6B2n86/OKDBNioLuNU=;
        b=Z62vwlpH+IvraPGUOL+X5BDhfZzBU9byLaeeuBaNI1roDsSN02ylgHJKoHisA0QGCw
         F0/FAz7ZcxfF+Yct8hyfne3GjjX6a/eGFzpWoNm8dbQ6IRhEBUJVg8BG+XWwJy97Fdq7
         qgMrk7r7N5+704tLu6nDW9NE2WEC2hIyOGbGbuVZAI+QqzmRn91UJlgedJABz0cdro6Z
         jCXFyRl/m2jok0/UlnU13fkHikaZpSMgN7oaRNuWg3xpCK6Pzvn/5ENcfU5aYCk56Ko8
         DDA8STlRzgol2K4fd7tkQ+romkQbXctqPqI9pcS8Wiz/8pogmi9ue9Yop64yP/M8GW6J
         Cr9g==
X-Gm-Message-State: AOJu0YwX+PK6cYGVkCXa4cMUMUNr7e6dKo4Bfz6crwJ3h2bdrfKd+ADh
	88+vkvAGedsSNr+EtnwIIsrL1+JtoZtYYQ5kzH4EBD7C
X-Google-Smtp-Source: AGHT+IE/HcGzbi6GlMZ4ksArVCG9GKR1GGsilZxyp+lO1sTBnNLCGokIChquscF/rZonU3fJ2u7uhlG5l9pKGyzT7p0=
X-Received: by 2002:a2e:a26e:0:b0:2cc:2077:d850 with SMTP id
 k14-20020a2ea26e000000b002cc2077d850mr277619ljm.56.1702240511166; Sun, 10 Dec
 2023 12:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20231210191046.4785-1-alex.kiernan@gmail.com>
In-Reply-To: <20231210191046.4785-1-alex.kiernan@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 10 Dec 2023 21:34:59 +0100
Message-ID: <CANNYZj-Z9apFWXOw6J63fQn+CRn-dLUEEer-oW7nieVHJ+M0pQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/2] cargo-update-recipe-crates: Use CARGO_LOCK_PATH
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 20:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192126

 I have to say, I struggle to see this as an improvement, and I want
to object to it.

Why set the path manually, if the code to find where Cargo.lock is
just works, and handles the situations where upstreams move it around
in source trees?

Also, is the assumption that there's only one Cargo.lock valid? I'm
not so sure. Note that the code was specifically written to pull in
items from multiple files.

Have you tested this change on all recipes in core and meta-oe that
use the class?

Alex

On Sun, 10 Dec 2023 at 20:10, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Rather than searching for Cargo.lock, just use CARGO_LOCK_PATH, since we
> have to know where the lock file is, else cargo_common_do_patch_paths
> will fail. There should only ever be one lock file associated with a
> project, so trying to aggregate across all of them makes no sense.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  .../cargo-update-recipe-crates.bbclass        | 30 +++++--------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
>
> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> index 8980137d02cf..59415ee8cb45 100644
> --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> @@ -4,6 +4,8 @@
>  # SPDX-License-Identifier: MIT
>  #
>
> +inherit cargo_common
> +
>  ##
>  ## Purpose:
>  ## This class is used to update the list of crates in SRC_URI
> @@ -18,9 +20,6 @@ do_update_crates[depends] = "python3-native:do_populate_sysroot"
>  do_update_crates[nostamp] = "1"
>  do_update_crates[doc] = "Update the recipe by reading Cargo.lock and write in ${THISDIR}/${BPN}-crates.inc"
>
> -# The directory where to search for Cargo.lock files
> -CARGO_LOCK_SRC_DIR ??= "${S}"
> -
>  do_update_crates() {
>      TARGET_FILE="${THISDIR}/${BPN}-crates.inc"
>
> @@ -28,8 +27,7 @@ do_update_crates() {
>
>  def get_crates(f):
>      import tomllib
> -    c_list = '# from %s' % os.path.relpath(f, '${CARGO_LOCK_SRC_DIR}')
> -    c_list += '\nSRC_URI += " \\\'
> +    c_list = 'SRC_URI += " \\\'
>      crates = tomllib.load(open(f, 'rb'))
>
>      # Build a list with crates info that have crates.io in the source
> @@ -55,23 +53,11 @@ def get_crates(f):
>  import os
>  crates = "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
>  found = False
> -for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
> -    # ignore git and patches directories
> -    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.pc')):
> -        continue
> -    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.git')):
> -        continue
> -    for file in files:
> -        if file == 'Cargo.lock':
> -            try:
> -                cargo_lock_path = os.path.join(root, file)
> -                crates += get_crates(os.path.join(root, file))
> -            except Exception as e:
> -                raise ValueError("Cannot parse '%s'" % cargo_lock_path) from e
> -            else:
> -                found = True
> -if not found:
> -    raise ValueError("Unable to find any Cargo.lock in ${CARGO_LOCK_SRC_DIR}")
> +try:
> +    cargo_lock_path = '${CARGO_LOCK_PATH}'
> +    crates += get_crates(cargo_lock_path)
> +except Exception as e:
> +    raise ValueError("Cannot parse '%s'" % cargo_lock_path) from e
>  open("${TARGET_FILE}", 'w').write(crates)
>  EOF
>
> --
> 2.39.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192116): https://lists.openembedded.org/g/openembedded-core/message/192116
> Mute This Topic: https://lists.openembedded.org/mt/103094777/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

