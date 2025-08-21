Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D07CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 08:41:00 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.4504.1755765658257262103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 01:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hMU0TJwZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-70d7c7e96bdso3876636d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 01:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755765657; x=1756370457; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iAAKq6gJemz1PfvcBTWe0/7A29u6xl+qGecvwg+zlOI=;
        b=hMU0TJwZCiIhom3k97jCG1YamFiG8OtLdAHerGrF1ZiI+4IX8aCqF3rgkZCDezUQbI
         GDGw/4fZa3KNybQBfd+aYqOrq+xNKA+mSZ7Wym/A/pEGrzY31QntlU6uqNdegz44WEl1
         a+XAUcRuoFu2tuqido633R0wvjK/TaocFoApN6VpYyUTRtsVu3k1Vqayi1MZWnu6u7Jl
         coqPDG9U0MA4ZAMsfgnigXElQiTIujvqpj8e24dWT/Dg4ubGsk7dxW2mgo+HeLhXJPGD
         IXH9mPB0R63cD0+3lIfQ09HrzvhdBXcEoSpQ/B1+JYY7SY/XZEVSuemUnLFOwYbgwHvw
         pgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765657; x=1756370457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAAKq6gJemz1PfvcBTWe0/7A29u6xl+qGecvwg+zlOI=;
        b=qdEPk8Pzd2Toy9k/D6PCUlrrkSDV4RnGGpep3IqlyNn0P0OqR+yhohNHVK6Ye25G14
         eWk2sKVIzvF9mXqkidczhg7Tq5dUFisoBVcdT3xUc++CCxfsieE++BC2wS55c/VHRsIf
         49MZ3PWHLluzPeFtBH49ZVwSSbBnTQ9hlLRMGlhR/ZW1RtXl3A2p+xNCeFOop/eEYsHF
         4xsNbmlWUY17xJXmpR//JhapUoV/2PVTwQ6V3NmtnO8br5O7LWEUEh39JFO1TPtkBRkn
         hCHxiyhX462hYaLxb5tRJ4rEYAJAWMFaqME2jLThma9jrso35jMRZojGclAfLY38lcAD
         4IoQ==
X-Gm-Message-State: AOJu0YwlxDeyPxpUg5SbZDTP3CvpigUQAPgtgbKt+0skXkpu/0H+ZVhj
	KXGXxjBY8Pt1+2P81iT6/PYq77YPbfjX5qpF5I1ShJwlOpyqm7wmCuDzw4v8xWwXJWSdRW3J4X5
	XMFjXJrI8lPfNKnHhF0DtB3Wq0Las0xo=
X-Gm-Gg: ASbGncvZ7DOHNQ7fk06pNjQzxQdXnF2zEAcKLoT3ID5Wy01GWpKAuCXQjLTTQx+iiKe
	X+NUtrK+jCQ/cGl1UVX+ramE+WYP7y/ik88q8sSuzbCF03xPIyzKqtp+528kP7AAhLlwOaS8XNv
	iSG3U1nTmgOVu53q4ipZVSNENR5wFj0nr7fRsDYKPL0zKCCP6dSemeD9kdUE3qM7TwuHr8mi16j
	HoU98B3YHCdKptVoNMBUzpXH6iEHIMD8D1VgquLDi6Q5//qE2V7
X-Google-Smtp-Source: AGHT+IGUmSAF3DdSVMFQJ7lFfKFaQ8hWWlae7m9onaatXv+WTu8X3CNEKSZotsrWoIKImhgCJoGA2L/TIv5mmf720b0=
X-Received: by 2002:a05:6214:76a:b0:70d:7f6d:ae44 with SMTP id
 6a1803df08f44-70d88fdec52mr17473716d6.39.1755765657237; Thu, 21 Aug 2025
 01:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250819221357.997067-1-a-christidis@ti.com> <CANNYZj91HOj3joAHdT0Z_JSxxgMmCeXaLb7NOJXsHqAqVZ+eVg@mail.gmail.com>
 <4bad79a6-56d8-42ee-b5ba-441a13cdb535@ti.com>
In-Reply-To: <4bad79a6-56d8-42ee-b5ba-441a13cdb535@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Aug 2025 10:40:46 +0200
X-Gm-Features: Ac12FXylooOStdZ8vEKOhWYLngWqLRPLwwX3lddBMVxZIKQd6UGLAa4I5dsOoNA
Message-ID: <CANNYZj-tWgqq6bgW7vUQi9Z_ACojg8_8kM+e1=tRrz640FQu2A@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] libsdl2: Add PACKAGECONFIG option for tests
To: Antonios Christidis <a-christidis@ti.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, rs@ti.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222223

On Thu, 21 Aug 2025 at 00:09, Antonios Christidis <a-christidis@ti.com> wrote:
> Thank you for the feedback. This is my first time working with ptest so
> I have some implementation questions:
>
> Texas Instrument does all of its testing without ptest, so what if the
> recipe creates a PN-tests package ?
>
> In the above scenario, the recipe checks if PACKAGECONFIG includes tests
> and DISTRO_FEATURES doesn't include ptest, if so create a package called
> PN-tests.
> Use the do_install:append task I have included in the 1st version of
> patch. Use FILES variable to package the right binaries.

Putting tests in PN-tests package is always okay, and there is no need
to make it conditional. If nothing can be packaged, then the package
will not be created.

> Now, I still want to introduce support for ptest, if that is the case
> there should be a path to not create a PN-tests package and instead
> create a PN-ptest package.

No. Instead, you add run-ptest script and inherit ptest class, then
add RDEPENDS:${PN}-ptest = "$PN-tests" (so ptest package pulls in the
tests), and set PACKAGECONFIG so that tests option is enabled subject
to ptest distro feature (there are examples for all of this in
oe-core).

> I'll do that by introducing a do_install_ptest task, where files are
> installed under PTEST_PATH variable as expected, and then packaged
> automatically under PN-ptest package.

There is no need to do that, see above. I would still suggest you make
a patch for upstream's cmake files that installs the tests directly,
perhaps subject to an option (e.g. SDL_INSTALL_TESTS). Note that
libsdl2 is deprecated, and all development work is on libsdl3, it's
just that we don't have uses for libsdl3 in core yet.

> I'll also add a conditional within PACKAGECONFIG ??= , to add "tests"
> automatically if DISTRO_FEATURES includes ptest.

Correct.

Alex

