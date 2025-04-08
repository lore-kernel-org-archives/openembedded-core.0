Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F90C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 07:51:38 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.69464.1744098697699395783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 00:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YqRYr3c6;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6ecf99dd567so59137376d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744098697; x=1744703497; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VnIKBgUvMpO8gfiqccCAiBbyHoVuCZ/v7knQLhuzcdA=;
        b=YqRYr3c6X1bQ+VjyNc6mLiEg583DfD7s3zykGEtEJH0HBYobsk7MI7kJxAZtn0HW5C
         c+xnVOvWkH+dTPusd0a4As8ZONN1KXhh9D3Khn1/q7Y2z3qdV09vXrB9dgpWLCSU8aVw
         z5TSgD9UXLtohFBTaxj46unJn4aqpLRy2K0orQHDXMIcQ4llMuqH3eT6Jb7R/HeEVVPk
         McjPXUj8cCziVOsloCjhZ3KWGxWDrDTY5YznSZV3NJkN6vIANGmcXg2GcDi9Vkx4NK4r
         vPiw1hXO3DXoohm2CARnj30l84ctRVoVGpZWOVUcLfX1tE/U9Ns91fPJ7qrtfp8ILhmb
         ADYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744098697; x=1744703497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnIKBgUvMpO8gfiqccCAiBbyHoVuCZ/v7knQLhuzcdA=;
        b=gcTGGLn17H/oYMtTPLYWBhBADhK8qrdnxUb2M7VnZnWfxFv5gK5t9BOkMV/QJzcdXq
         EqMjNpeEKIW81ixmXAGH4R+sOnzr3MbzD4xUFMmzrkmQZZoXNTHOSD3uQF7llgn9rEQ/
         Nj0tIzci9TaCViWmEjv0tJcJhZ90BjoQIUqUQHo1ywkYkV5tnwid6HjACIxj1UDSuzm2
         bSDZ7J8GQOxOdZ3T5Jh5bVBhrO/YVTvO0ZsjiGXOtpIASMvT/4gEamY2ruZokxcjnBRm
         RiVOhKjKh3dHtVpVF3NT6T+hrM8fnMpLNG4VsRz+XCdNmf+ch2W0ZnLAhIWWNP9Ie65Q
         MYFQ==
X-Gm-Message-State: AOJu0Ywp7yJvLvQevLSPjvux1+8RgWzE0naWLy3rgR57kluQZMHtZdCS
	OOLg2sOwNAGL3oiD1X2V0+DpXik8kdvu85pCVI/xf9WV9ptw+mrMPKZSfQflRkXol5utQTMVvNr
	4PWvqCRDDSj6k4oKTG5gpW1NtbUc=
X-Gm-Gg: ASbGnctDv6QFJKUvvmPJDHtjK09Xp+BcngFIHhg27kyd+v+S5TZyBcz/1IKVekuXRXJ
	beHr3VEg6Jdf2PT+Q8Q/jU74e0LnR5hV1kAVYlu8oO4D3QOZDHs0DsaER4jUseVZ3iL+MrCaxbD
	dzI0OOuEu7bgJOPOIxYVcutULFZFow1Ef3l0YKhIk62vbtUci829jYDVxt3vr3
X-Google-Smtp-Source: AGHT+IGWP0ndiQieiE29V0Hle9EtvpyRnuAzgTtbgYSRj9g7xE3zSZpo3IYL0uvChUvLNwCsPvxmTzS+VlF6ouKghbU=
X-Received: by 2002:a05:6214:dc2:b0:6e6:6a6e:7596 with SMTP id
 6a1803df08f44-6f064ae2f3bmr232330566d6.39.1744098696685; Tue, 08 Apr 2025
 00:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250404075136.385270-1-mikko.rapeli@linaro.org>
 <CANNYZj8jN5yBoHpYsAPbdMw+vM0CR9Fh9t-6Ddcqr8npDw7_dA@mail.gmail.com> <Z_TFaQPpXL2Al4Zf@nuoska>
In-Reply-To: <Z_TFaQPpXL2Al4Zf@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Apr 2025 09:51:25 +0200
X-Gm-Features: ATxdqUEhm05QGPMwyEXNFj4DA0K_FoCYqf6cRuzP6a1rIH8z67z5CFznVm32eLo
Message-ID: <CANNYZj_NKg+noSUorJp=b_rAULtdp2k2naWk4XQH4f9M4aY0rA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: set git repo branch with SRCBRANCH
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 07:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214511

On Tue, 8 Apr 2025 at 08:42, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:

> SRC_URI contains more than just SCM URIs and I don't want to overwrite
> them. For example all the config snippets and patches. I'm also interested
> if patches no longer apply and/or break builds. So I really just want to change
> the upstream SCMs to different branch.

The next thing someone will want to do is test their u-boot fork, so
we introduce ${BASE_SRC_URI}. And then we get flooded with similar
tweaks all over the place, all of them serving special needs.

Seriously, please no. Make a commit that tweaks the branch name, and
rebase it on top of poky master every sometimes.

Alex

