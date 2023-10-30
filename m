Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B833AC00142
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 15:02:52 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.151350.1698678171134141849
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 08:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EBykA7JF;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-507a3b8b113so6599832e87.0;
        Mon, 30 Oct 2023 08:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698678169; x=1699282969; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aD/npE6YpdxzX2sMb44p0Q8mPbM8r0ckzFg/agtclX8=;
        b=EBykA7JF5D9vmrL9outwHlXfT5ogOza0zqAJEKKWPsjkDL8KV8qqWeTa/R6xfvg6qf
         nrRTyjO//iu3Abej68VrL9NsyLS94koAsPKFlMaBdKMJ5SHaNPSqmoYltTteKgHETod3
         RBopucWglZV3R85Ji5k+SCij+MWsCcGdJWymFNsAfmpVoAi88uDsKo6mSAPPM1cDb0mY
         URo1GrjekhGvL1v2vF6B7sYrpn4cNKIzf34Dmu42uT6O+4mR4rvbJxBcJNeF0fN+Ynqn
         QIDxrJhCZXHW8Jqq+P3MTpqLGlQlHDN504qidvlqgAcWJT8fYIx1TDCQLnNfLKlPsx5p
         39jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698678169; x=1699282969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aD/npE6YpdxzX2sMb44p0Q8mPbM8r0ckzFg/agtclX8=;
        b=v2nImeJHJnYD3fhaFz0HinZ0Jh2eBXMPvDSDkcT32t2oQMSyacHQ1o38vDRrw/WCxx
         bG0blk3UKhDbKPz2OnCg1Rv5MXIT14chNVdsj4N3aWF9eBsSUIKESRyKuMIPqXBR4Wkk
         JtMNGyNtMVLv5h07DoUNekswIwwsMWhPdtkFhIb4kjXaK0Mpvrufx//BCHxCZqTMAAwC
         dtTgpiUdlByQwycpnA5Yy86hVpHwlGhgSjQbus3MVIhlgj/AVnwT6FVoMr4RRFvU7oxd
         WaIKovBNeMu98PbiJlqacIoNXmaHfaOKvUvuqoOYszsZ70snNyJgxDDMejmfd2SSi65K
         l04g==
X-Gm-Message-State: AOJu0YyS932OAJF46kDFK1XGgGS1KhGutZqaPJLSbSLb0K316Q7vVpYC
	89wtG1rpicImH7WO/sgn28c1gBiGmKqwF0yZYRc=
X-Google-Smtp-Source: AGHT+IGpWBfo9VTqSvJhX7Re8PfbqWPh8b9CxepTaVDSeJQ0d3086mFR//wSxcx5HM+SoSkccoCE86XFWAZNMwsloYo=
X-Received: by 2002:a05:6512:39d4:b0:507:b084:d6bb with SMTP id
 k20-20020a05651239d400b00507b084d6bbmr10210581lfu.43.1698678169021; Mon, 30
 Oct 2023 08:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj-JhGnGFRxaF0+Q_5Sqq76kAg1pSBBMka_xefuhMv6-vQ@mail.gmail.com> <ea84079102bca429a6ae521d218118952a79f111.camel@linuxfoundation.org>
In-Reply-To: <ea84079102bca429a6ae521d218118952a79f111.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Oct 2023 16:02:37 +0100
Message-ID: <CANNYZj-SYgOpxFeGXHpWCteyDduXp0eBxnX2YSYHGKRPEzJfvg@mail.gmail.com>
Subject: Re: Core workflow: sstate for all, bblock/bbunlock, tools for why is
 sstate not being reused?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 15:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189798

On Mon, 30 Oct 2023 at 15:07, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > a) esdk sets a number of variables from its initialization script that
> > aid with cross-compiling components directly (e.g. the core use case
> > of SDKs). Normal mode doesn't do that, but recently added
> > meta-ide-support will generate a similar initialization script that
> > will set up the same environment from the normal mode. There are tests
> > and documentation for it.
>
> In that case, this one is something we can document as how to make the
> functionality available in the normal build.

This has been documented in the sdk manual:
https://docs.yoctoproject.org/sdk-manual/extensible.html#two-ways-to-install-the-extensible-sdk
https://docs.yoctoproject.org/sdk-manual/extensible.html#installing-additional-items-into-the-extensible-sdk

Actually, I have on purpose presented both options in the manual as
'esdk', the standalone installer option is simply locked down more
(task signatures and tooling wise) than the direct yocto build.

So here's what could be done:

- esdk tools become symlinks in poky/scripts/esdk-tools/. esdk
environment script puts that in PATH, rather than some custom
esdk-specific location (the code to generate that can then be
dropped).

- esdk tweaks to local.conf move into a dedicated include file, which
can be static and under version control, except for perhaps
METADATA_REVISION:poky = "4a1e0b9625729e422fcf24e632ee2a3c79f986d5" -
I need to check why is it there and how that is used.

Something else perhaps?

Alex

