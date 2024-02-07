Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FA6C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 12:39:51 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.19392.1707309588794628113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 04:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PweK5LDr;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d0a0873404so6295691fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 04:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707309587; x=1707914387; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iU0NIt5iMmbUBxPHZpmUX5e6vM9IAPnOs85C3te6e+0=;
        b=PweK5LDrrnuXDAhrCv9xiIjTgm/2g28Tg46ArN/MoywZMC9z5dHlSgxI07C9j+HRFa
         cqSZJpSm77hgkZwJX76sSb0gEux8ZBqIFzdRnJwCu51+ASDf7vMsp6lRDApKctLSeKIk
         Km3er9VJrT+fEdrIE/AwBIJe3uYTz3q7s5LcQjtNtkm6E3LlZxKaNwAzG1y/0XodJrho
         VFw5mjX3R8ZcF2IGcNyN8JBx3PHTx5AhF7pIoaBgI8vc7R7cXm0TjHS1OKwhGoTZrgiY
         Se/EGD7cA9iNZFBjBdL2hnrUATbClPGYpr9UGrU9R5Ws/yWv6IApp52YJu0KuCvCIcMy
         X4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707309587; x=1707914387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iU0NIt5iMmbUBxPHZpmUX5e6vM9IAPnOs85C3te6e+0=;
        b=oyRQPU4/b0k4kjEMVQAUKnEycQbhsl2M+nhKPQzlN7xP8eM82X1tTRSm1pjwUTyzCS
         lhxQRIkeLXpHy0RM5ufsBkgMpO9nqGyGXSlKq17l+nXUs4+Da9tejTfn6XzbE3aEJaAx
         /asG+DCmMvd8XwOcWwY0fOH5fQRMzk41s1VN4JW54wP1yBh17oUsXvmNrrkTGLunLMIV
         C/ZMSwE8wcCrvDlls0+kpVSm/oVDh1Id3XPNqOpsLMvTzBzT+yi0y3PTeEcafPRpLKLU
         gxbEXlsAXFK3GXEbUGpLC/t8kOPAhVbQ1RND7XOkd4eVtfYhOgMLcCK7El7SxS8MTsGC
         1v9w==
X-Gm-Message-State: AOJu0YyfzmXhMMEPYTzzwfd4M+9EbXmScRtn597YjeqFl8vow9U3cSeW
	OQN4Cqavj6VT0ELvQX8dQCqhlCy79vWEUPNkZePf7llh0SR+oGcerlNAmWVA2q7ISh0YQm0TF8K
	lIcu/eMsKN3RlbqOxRpAanABQXoc=
X-Google-Smtp-Source: AGHT+IGGyAgEB+wf02yQ0P5IqWN0I0c22eo/ogYEyi4oztH4WyFHrccLJpCy7b7swzn/7ogcLRdRatnqRcmS5Z7ljNk=
X-Received: by 2002:a2e:9310:0:b0:2d0:a469:8a43 with SMTP id
 e16-20020a2e9310000000b002d0a4698a43mr3821027ljh.18.1707309586814; Wed, 07
 Feb 2024 04:39:46 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8MynJANdJMLC8b-xNzbuc31mVM1oC_6x8TiTsWGkcDXg@mail.gmail.com>
 <4379.1707308449560146942@lists.openembedded.org>
In-Reply-To: <4379.1707308449560146942@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Feb 2024 13:39:35 +0100
Message-ID: <CANNYZj-Uar5ZUCQjw4TLKZv_0+RQsbdOA1Z+u6zPZdfpVwSYzg@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] busybox: Use ISO 13400 timings in zcip
To: akash hadke <akash.hadke27@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 12:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195057

On Wed, 7 Feb 2024 at 13:20, akash hadke <akash.hadke27@gmail.com> wrote:
> I thought of having this patch in yocto as it is improving the AutoIP allocation time on the system which uses busybox with zcip.
> But if you think this is not a good option to have this patch in yocto we can wait till busybox upstream accepts it.

Basically, you need to justify the usefulness of the patch to the
general yocto community; specific use cases are better dealt with via
bbappends in product/domain layers.

Carrying patches has a maintenance cost: someone needs to understand
what it does, and how to rebase it correctly on version updates. We
can't be experts in all matters that components deal with, and this is
one of the more esoteric areas.

It becomes especially difficult if upstream rejects the patch: should
we remove it as well? Would that break someone's builds badly? Are we
expected to maintain the patch until the end of time? Backports are
far better than merely 'Submitted' patches for that reason.

Alex

