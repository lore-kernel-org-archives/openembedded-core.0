Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12647D65548
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 10:40:26 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11430.1765968024910382367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 02:40:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fatGPEBj;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88a346c284fso35881216d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 02:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765968024; x=1766572824; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oaw7qpF9ccu8bzQ/YJuyOEbrhgq0+jz3zB+bc5P2KMY=;
        b=fatGPEBjuiHCmMX32MlEJP6e2aSg9OsxgOTId6O/FmPWgblLVrpoqmTh3QWCV4Lg0K
         6kO5BIiOzD2hSsFC9ucLGyZgYG96pTL1Mdx1KwjjbJeJPrkXkX/dYcmdUZj3yC+xi2nj
         1h2jNr1T/Z0KeCGta/0Dr3beH2vCab5aCo4yRGfZl9yOVr2I2kSmiUqq1Cq94iEo4JKa
         p1LlMpR1U4CG+JSv64F486qRo5P8rS5saGVjzzyPtkrhBtjNeaomYjOdV3bTvrW5AKil
         cwee4Xjnc2R1mc0J3WBWlyfZdHiIUGwXnnDGsuHin27CoBAl9YiITAK53T1hhUQZPTvC
         zIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765968024; x=1766572824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oaw7qpF9ccu8bzQ/YJuyOEbrhgq0+jz3zB+bc5P2KMY=;
        b=dg+4axqAnOTgdnVSX7lwffb8DGINIPk3+Hecm2pBdUEyh03deo5ASkobDHM1se3yrS
         lQq0YSEKKrmv8po+iEneGPASq8WLDeXXTa7jrqtpMfiI+xFeBzhCW8N4zM94L973slEm
         3vzcoB2YFI+6B3/i091uZ5qbVRZ1uFtH74oYaxOV1yQkDSoCgOMje2mb9DK3Jxoor3oL
         3XPYwQx8hhWydO//6AcHKh/OyW634k24vBajypLsi4B5ARI9RSngeRwS7QOczBA/Jtls
         i5tamoTMYNn9y0oJCgW21MAzMqVFkKuVGMvvtBp6+M7jdFkCbKojMSAoAqSt92c4MIA0
         x+4g==
X-Gm-Message-State: AOJu0YxYxMP64BJfn0AdC4RN8R4miLVE9kIfTo6CRbQgPKJmRz+g88PC
	g6+2Mo26MXZc0ZmoHv+Rdkf1qvit+NZecJNoJnby3hHcfQAQoAn7cCIHnxgbc0TQ9FSuXHewYdR
	C5oE6cOqhaAw23+SynftnARoomutvmtM=
X-Gm-Gg: AY/fxX5Q2ZYwKsVpd59M7VsS1Rnkf4FFwWTi63xHUKp383u2VNiQsgAKueKHaxSWy62
	D2vYmX2ocmyo+xt8fGTeZ3wnRIlUuwF4XIXgD5J5LUegWEjdstgRFUHdfcRBn/hWcG89FQAo4rb
	ACm4BN5Mdp8cmW4uWwdlnSoOVUJ9A58RXyokCbEcuMf2QeFiKySakYWl4vdyMOZ9lw3gQk535nw
	orRvRm6F3afFDmZwypUdFvAJkJ17HZOqxc6/Wd669rXSOH5iJn9ybw3L7+PaRUk5kfGYur141kY
	MXE2DKW7Q+d5m9Ccy91EQYNFEhUDwg==
X-Google-Smtp-Source: AGHT+IGtkZnYU5FiyQPwIrMk3svWRTmpUPeyQrywbLi4jjq6TVJ+ibrfdz/6e4ND6GtplFelpyk63z5rg4VQz6mFFSc=
X-Received: by 2002:a05:6214:4344:b0:88a:27f1:45b2 with SMTP id
 6a1803df08f44-88a27f15203mr199082656d6.28.1765968023783; Wed, 17 Dec 2025
 02:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20251212091927.3741063-1-m.schwan@phytec.de> <CANNYZj9L7B0tO-qORtFM+2GXLXn2s6YOYo_P9Q3bnfSSBoWQ=A@mail.gmail.com>
 <7a5b8633ba244eb5be8cc14d4133cb271989d6f4.camel@phytec.de>
In-Reply-To: <7a5b8633ba244eb5be8cc14d4133cb271989d6f4.camel@phytec.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Dec 2025 11:40:12 +0100
X-Gm-Features: AQt7F2o6wo2xbWuvD0ekb-GDgLqcigeqx0_l_aqxEHbMa6s7tbpzIK0SZ3MDuyY
Message-ID: <CANNYZj_Tt1P_-xeS7H6k_0N0ehCPbSK9hhTVx+LXzVF4h8CTSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/5] cargo-update-recipe-crates: Make
 do_update_crates() a Python function
To: Martin Schwan <M.Schwan@phytec.de>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 10:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228022

On Wed, 17 Dec 2025 at 09:57, Martin Schwan <M.Schwan@phytec.de> wrote:
> Are there any plans to move to Python 3.11? Python 3.9 is now at its
> EOL for some months. I don't want to open a can of worms, but just like
> to understand the future/intentions in this regard.

There is no specific process or criteria for bumping the minimum
python version, it happens every sometimes - you can probably dig
through git history and read the commit messages for any such version
increases. Doing that should not clash too much with what is in the
set of supported host distributions, e.g. maybe one or two
soon-obsolete distros may not have it, and so installing buildtools
would be required for them going forward, but not more.

Note that sanity.bbclass is not the only place where python version is
checked. There's also a check in meta/scripts/oe-buildenv-internal,
and bitbake/lib/bb/__init__.py

Alex

