Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED58C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 07:14:30 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.12819.1713856469909861597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 00:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vl2ITuG0;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d8a2cbe1baso67758341fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 00:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713856468; x=1714461268; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Afm4L00lPQe9QCRpXDpbdyg3toHUgCkJg5lY8lrcCvI=;
        b=Vl2ITuG0shJEdwHr/IYAA8OONSowCMyERY49O5XY2Bgye0PNoom40AIgQi5R8YFZ2t
         iyYK7Ff1bFc3VnoQZFR/0tqytNM39BTfOVrLOVUQtfzAMdlVPTzBhb3ouXdWR+TCoEdz
         vCOQA/PynqsKCKZnRWYBSVQeHgx1+iAaLSF6+fChSkFON2c0JcCxCW0r7qaP/IayLvM/
         8zyqMtSa0Ooe0wwSg9bHXAMMtG5f5cKkCrjMn0T+Csd1jdCAr8jrz3dPJFwXqn1NjwSW
         IFNEpSP6qfpmI8i1LbXpuqBQU379C3Fi6wmKnTNbucrb5OkPIebQv07oE+PziMmQKfgN
         qzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713856468; x=1714461268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Afm4L00lPQe9QCRpXDpbdyg3toHUgCkJg5lY8lrcCvI=;
        b=toRkBJEMBmZpXRTsGLlQytbcGUBw2XX2uYC+CSJeyXey6WYJtJoLE3eSwa5TzZlUo8
         hFCBu6bltigJQcWuK2bPy4aTDd/58tNUF7nZhHWlUNA4BcArctLvfmToyUeTJMwVaQDI
         6TYS0MZWCh4bHBE9mY6yci7wUL3aeVXRItc93PclDzvigRXe+tN2iBGjwC4ONg96LtLB
         Q2+LJcbzNPX8s/YauFp4c2/BshZ9aJV87cUbBVQv4Qub9rukPshWTrnwOTldz/YF7GLg
         idzT/PYt2V6GuQFHV0oiVjN7fpS1zfZUZckfsMi/24PRMNMSPyjwc8EEgEJy/DgLkq7+
         +t9A==
X-Gm-Message-State: AOJu0YyLBNjI4FxU8NjhBYzOsMemUyCrfnNkIXpbND41ZZ19QlVLgWxQ
	wBDFS8DpR50FC5B7IfTRw8tHr0KT13y1eeqiNsMiI5f8XP2lhSymwRSAmDPF5B7YM+I/UzH5c0W
	yhbjwtD5j4tPUsTCtBBcSTeWSljs=
X-Google-Smtp-Source: AGHT+IG9EkpwBazHv15dH8LtD//6pt8L1UrWYdxQOv5elekhMcnJXHUKZU3Poh9Fq7y5FVcOlDC5p7VD9/Lk3HsMtCw=
X-Received: by 2002:a2e:890a:0:b0:2dd:d2db:1981 with SMTP id
 d10-20020a2e890a000000b002ddd2db1981mr2655298lji.53.1713856467849; Tue, 23
 Apr 2024 00:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240422143921.3187890-1-joseph.mills@cnhind.com> <20240422143921.3187890-2-joseph.mills@cnhind.com>
In-Reply-To: <20240422143921.3187890-2-joseph.mills@cnhind.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Apr 2024 09:14:16 +0200
Message-ID: <CANNYZj__rD=2aVQ2US1ymon7z5p+ruDEbKaH-X44Mo5=uSyxEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] [mesa] Update do_install as needed per
 upstream changes
To: joseph.mills@cnhind.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 07:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198605

On Mon, 22 Apr 2024 at 16:50, Joseph Mills via lists.openembedded.org
<joseph.mills=cnhind.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Joseph Mills <joseph.mills@cnhind.com>
>
> Developer's Certificate of Origin 1.1
...

Please remove the text of the DCO from the commit message, it is
entirely unnecessary.

Commit title should be 'mesa: correct sed expression in do_install to
match upstream changes'.

>  #because we cannot rely on the fact that all apps will use pkgconfig,
> -#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> +#make eglplatform.h independent of USE_X11
>  do_install:append() {
>    # sed can't find EGL/eglplatform.h as it doesn't get installed when glvnd enabled.
>    # So, check if EGL/eglplatform.h exists before running sed.
>    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
> -      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +      sed -i -e 's/^#elif defined(USE_X11)$/#elif ${@bb.utils.contains('PACKAGECONFIG', 'x11', '1', '0', d)}/' ${D}${includedir}/EGL/eglplatform.h

Is there a way to make this into a proper source code patch that can
be applied in a way that would fail when upstream changes the code?
Sed expressions are notoriously unreliable, and this can well again
quietly regress.

What is this patching really needed for, and why do we need to do it
after the fact? Is there some issue that needs to be resolved
upstream? I'm honestly tempted to drop this rather horrible snippet
altogether, and force people to resolve it properly.

Alex

