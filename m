Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5356EC43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 18:25:28 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3726.1782757526977997719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 11:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VCZYaCRt;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51a0188b92fso38627751cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 11:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782757526; cv=none;
        d=google.com; s=arc-20260327;
        b=E9BX5OuQZzxerSfq5PmJDu5MXfGd/6pV1boBF9xwKAev0GdsxOrGh1blogiLepDj7J
         yCntE5u9/nGLBPnSgn07q7x2SnS/BsqcUVAjHTQNquCbavjMT0xHvN+2obLB8r9k2e63
         ajWzi6rjUPs1Xj0P+TEj4hUResFh5jP509Ibv4wATCIgnThdU7QQmrLZDna3RMQhuvmr
         h1gFSNBqDHouPT5b7b/DBgUk0pU6wD/s+pWkfGneM48QYEGJnE0OqlEtqSdzY9BWARxp
         CA5xzJKPv/cpv91W+3Jj3QE9MkBdwj+gCJqDxy7d/5qTg6Q5FlXKYjhVZF9cxGwf3hOk
         GGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XWvJN1mbaUculcN4pTRS2Oar0Vc6gEBPBD43sneIN78=;
        fh=qds4od0Q/l1bhg3DLbaT7yLvRH4rFZmhXU4YTeXgFFY=;
        b=WgzWz11kgiQpLR4ImUQ5X+ngDjAWCfgR/ZFJO2K3D2yut5737ub91jl7y7ZSegrapm
         sGQTxLkDaxriiq++aGB00gI/I7s/NGXLGV9Joj1Zdp6D+/tnSWopbkHzrYCuoYN1KyaS
         HyWC+exfV9H0hknvzHXtADBvc9PrSqwSDaYzZ+WPQzSFZepiQr8FbbGxGK4Vzm9DZzpq
         q+5R8gXJdejJCy/ojs1RdtN3AJtK4iLmqeAd6TqbIg16m3uBPuJEz9xpyOTqlRdIb5bZ
         ZtOGLsB9UAwBfvp4idp2GoXZdZBueDUc5jzqRHzw9nRIOGlhwtDgt+AgljV2+lNKpXhM
         7BcQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757526; x=1783362326; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWvJN1mbaUculcN4pTRS2Oar0Vc6gEBPBD43sneIN78=;
        b=VCZYaCRtHMV/x5Pb1GTq6t2xvAdKqgHGh5ReS0RVGwXNrdFMaxSR363F9Sed8e5HPF
         tpgWQI14yRa6/4FMK1E1HtaSCbFdvMJFM3zq382jzqXfOQMZ9jZ70zHuHD59N83Vk9ek
         ZW/RTe9ATaD6nHGmtKvLJmxaUfD3fUedmBg4Mrnvl+uVRyXD54YsLtCPI1XBguW/cA+v
         Wtqj6P8Ut0ZuMIyXQ5Nt3GWspuMphIwsygWqP189MtcCmU+9fQIHNcRpyDF1VFXqyOe6
         ea3QCKz1T1iFXzQExocZECQzjYYRMbaAsiiCLekA/5ZeHM7Axe+EUQAJ2OoPfvZGHf16
         HTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757526; x=1783362326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XWvJN1mbaUculcN4pTRS2Oar0Vc6gEBPBD43sneIN78=;
        b=EFwo1n257qW/LZPWPEDC5fJxh6LTZISDFJW2GnJ275nbBhtBWYJqixNv7EpltjHKSo
         IB5MNlXShvmAvltQtifGrviN5kmJCpoeSX3ww7ctm9yIbtikQrknfUKW7OCM+szScXnK
         A30e+IoEZkv7RVG+Bf47p+H8vQY34VesdVYgxaYHVX3Booi3iq53DG+SXA7JbtwZ4N6P
         GFiBgq3cqCpfRpRj/WwS4FoU1P8r+jFrBeqUgxXylnDDMgRUqasI9X+sKoBaEOh+hM2+
         Riv0OOcNtrynkFiZWr0BrJYeY3uIi9hQ4wghuFjncZ4LYDkGG6KJnKeBHnArblWGqaW6
         mL4w==
X-Forwarded-Encrypted: i=1; AFNElJ/OwqHcVSmPTZVs1Spt2+8RG6OAL84zkC9wtX+/sO9OYfmCxwbexxBfMW97P6TfNr7wO22P4TBlydST7SKrrS6t4Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwEHW4bKj5C6108vXT//khLmvpfJS22PA5BUtEJXyKxLZJueakQ
	bkwNtIDE7WBRmKZRV8wOXre7nSTrfN5WHP8XuNzgnL/iaQIDHP0qHA6qq7EK+cqQK3Uu7+K2Y07
	b+67KKcI0/pTkAlXXAP51gvO+P+RyoWA=
X-Gm-Gg: AfdE7ckUjnK2Elj0MztWpxYRjTJ7tv47ngJzHYNH2JPE6+u6kzaVHTGPz51eKiI3csl
	qQSn49o/iy5BC/IGVmpbnT1/mjqi33mVnkdgRIQZShmajPaQtFEp6zqyupnwF6teC6w3xO0pEyH
	klrcEgXGncrZMH48iufHXBZ9DPk4jxaiqqjEa0WDvvQ26+X1YIekMpIB4WmDZHmXBro4Ia67CXX
	rk5rysmBgoR3LjEH/SxXIKoAGix+ld3UhU97vkoP18Q2NrAP+2a9T4OZ6co4Balp+fDxfzFig==
X-Received: by 2002:a05:622a:586:b0:51a:8c97:fb94 with SMTP id
 d75a77b69052e-51c10911601mr6171771cf.61.1782757525809; Mon, 29 Jun 2026
 11:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260627154904.338233-1-jan.vermaete@gmail.com> <CAJdd5GZJUmZDyKng2u2qSz+YWkchPZtLMivq-z12C9s9UrD2AQ@mail.gmail.com>
In-Reply-To: <CAJdd5GZJUmZDyKng2u2qSz+YWkchPZtLMivq-z12C9s9UrD2AQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Jun 2026 20:25:14 +0200
X-Gm-Features: AVVi8CfunI-04kQ8YJl04ojqyoA4DmKpY298zi5Lny-SnWpkf2FgxzstStULvx4
Message-ID: <CANNYZj_Tpj9u7ZFkL=DjLpttRcesCdyPDXdWRj20SXBB_coPZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pull-spdx-license.py: add the SPDX licenses exceptions
To: JPEWhacker@gmail.com
Cc: jan.vermaete@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 18:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239820

On Mon, 29 Jun 2026 at 20:18, Joshua Watt via lists.openembedded.org
<JPEWhacker=3Dgmail.com@lists.openembedded.org> wrote:
> Thanks, but we can't actually use the license exceptions this way. The pr=
oblem is that exceptions are only valid after an spdx `WITH` statement (e.g=
. "GPL-3.0 AND OpenSSL-exception" is not valid), which our license expressi=
ons do not support. Also, it's better to keep the licenses and exceptions i=
n separate files so that it's easier to distinguish them when parsing.
>
> Regardless, I have been working on converting all our license expressions=
 to valid SPDX expressions, but it got sidetracked by some SBoM work. Part =
of that was somewhat similar patch to fetch the exceptions. If you would li=
ke to take a look, the branch is contrib/jpew/spdx-licenses. I hope to get =
back to working on that as soon as the SBoM stuff is sorted out.

A related issue is that lack of support for SPDX exceptions holds up
correctly specifying fmt's license terms (which is 'MIT WITH
fmt-exception' if I understood you right):

https://spdx.org/licenses/fmt-exception.html
https://github.com/fmtlib/fmt/blob/main/doc/LICENSE-exception

The current recipe says simply 'MIT'.

Alex

