Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E0FE784BE
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 15:17:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25835.1766935041952678601
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Dec 2025 07:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vmw6eQzQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso86894635e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Dec 2025 07:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766935040; x=1767539840; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DjgU0g4xQ2EkqOlKK+1oyNfG7+AralmZE13ld5gb2oM=;
        b=Vmw6eQzQHkrRwE89lYfz8Qs7/EU//TyQro3ENldB1mrVmNawpsRhlTCOF1zfbj6MbX
         UteABhqKck5G2jo/KflaI75TBBWwWtMidrvpj7/FTuCZ0MOcMyT5JELl9g2AGzZUkCCA
         ZYLqp/5KEF2a/9BpucHFgRSdZyhEbh1yh5mmZm6kHeMX9n+NuR8JFH6UZzwz8+DyDNRr
         eyLQNn7SXhWTltNDx+3tiUcH2WFyy5iM/sRCaHPN03CiiXgIvJWON61r/9X1yZ0wvlom
         y3WQClryIdfoe36Xm9dcor7JS0ja7PY+54gHEyV2CRQBx0h+bKOh6Aa7rqRQkm93V/VD
         da4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766935040; x=1767539840;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjgU0g4xQ2EkqOlKK+1oyNfG7+AralmZE13ld5gb2oM=;
        b=UJ8KLYr8pUk3Lr+Uyy4vEZSrPDDzplXEdJ6npnt6vGLAowq6x1byr9IUYX+56V12Fg
         PwfqlyLCRVm2pOt2Iw0rZBWfSs8NdeZ6iu+S+Y4V/wBSN47zOFHJ1yCyCoRGpIe99DtN
         E240xcxjQW/A9xXj9ymWa/tpeyb6HOW6MZM+3vD3sxU+4cEFtsEQph7k+xlqIZmclpCU
         wWvSdsPDzJbE9KE0hnuwdygk9i2taV8E1Getew53cH0P929K5tYeGRPgAKijUXT4hgFk
         CZKtYl+4KfBZvjc5V014kYbuVRKL3cuegYKwrp885GXqIV0F3fOVlN4U1Minv4EdpW9v
         BZZw==
X-Gm-Message-State: AOJu0YwVN1g7Je6aGKL47bTkSYBI9V3SDX5+xQfJqH+1ENdVuhrKxIwo
	nvinsY2ujjTpLSqtEZFd9IkhQoPtI320bok7IrividsKfH+ih4Js4l4a
X-Gm-Gg: AY/fxX7j9nABdKqtEQcZNOsojHrCpcQb2HLKkVTTZ4D2anR/baFbPw21pPhQYvXS73W
	XUgs5+PnMcCN5tg0uQDKqGRDrkACN8USs4sP9EiRf8ZymySkKldbKytjABAVchMd2N0a45Be9Lj
	v1U7Zv1+R8mRpm4kxoqG02QoP/9y1Tbf22Y4dTpuLVlVd+sXhdcoL2Pi6t0zeJ0EemX5Ir2s1zE
	A2ClKjGORfcZZ5TFsVGBEfHDi/OBtb7mzyY3L30EDYiIjbDoGodlOqXWbn0TwO3aO5MNvxa79Mz
	W7k0kRN5CXaiA7lOuR7rxrt55lnHVcaYyqyboOjtejp0lW86ESq0B6Pa2IisxbSBXHpnksWHgp4
	5K2vI2S/Q0Fl4m+e1qU/j6WtFg2KPKTa19TGVxb7zkDzDAWKNBXCF4KejwriMqqB26jF32w+GFp
	6uEzB90zSyUMPRJ0OKsghsacWKaHClfFzZt3ofYH1NFdsMz3FPCchG1CxBDiLj
X-Google-Smtp-Source: AGHT+IGm39t9m0eJbtbRS9DRDb8uxSKs0zHKxD2y92VT5KVoBCQ59Ra8KeZceBPCL0ANJCItAIpKZw==
X-Received: by 2002:a05:600c:5249:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-47d19595e32mr369228765e9.21.1766935039840;
        Sun, 28 Dec 2025 07:17:19 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a9687dsm230245035e9.3.2025.12.28.07.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 07:17:19 -0800 (PST)
Message-ID: <8db22a1126b788f871bec4f24b9ecd53ff8739bf.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] fragments: add a 'devtool-ide-sdk' fragment
From: adrian.freihofer@gmail.com
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 28 Dec 2025 16:17:18 +0100
In-Reply-To: <CANNYZj_S_korZ_5ywcBwdSugFqMbWLarUJDHwfs9qGU_bs8WGQ@mail.gmail.com>
References: <20251227172301.1967831-1-adrian.freihofer@siemens.com>
	 <CANNYZj_S_korZ_5ywcBwdSugFqMbWLarUJDHwfs9qGU_bs8WGQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Dec 2025 15:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228586

Hi Alex

Thank you for looking into this.

On Sat, 2025-12-27 at 19:18 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> On Sat, 27 Dec 2025 at 18:23, Adrian Freihofer via
> lists.openembedded.org
> <adrian.freihofer=3Dsiemens.com@lists.openembedded.org> wrote:
> > Add a configuration fragment that enables devtool ide-sdk workflow
> > for development and remote debugging.
> > The configuration is intended to streamline the development
> > workflow
> > where developers can modify recipes with devtool and debug them
> > remotely on target devices using IDEs like VSCode.
>=20
> There are tests for ide-sdk in
> meta/lib/oeqa/selftest/cases/devtool.py, should they be adjusted to
> use the fragment?

Sure, I can change that. But I have already many patches pending
against these tests which I would like to send before adding more
changes. And we need more discussion on that, as you pointed out
bellow.

>=20
> > This also includes the EXTRA_IMAGE_FEATURES from
> > root-login-with-exmpty-password.conf. Ideally there would be a
> > possibility
> > to define fragment dependencies, so that this fragment could just
> > depend on
> > that one instead of duplicating the content here.
>=20
> This is somewhat more worrying. Having the settings bundled into the
> fragment this way quietly opens a big security hole in users'
> configuration, something they did not necessarily consent to. The
> original fragment at least warns the users of the dangers involved,
> this one doesn't.

You are right, insecure development features must be visible and
copying this is not ideal. We need a better solution.

>=20
> I would much rather take an opportunity to set up proper key-based
> authentication or something else better than simply not having a
> password. There was already reluctance to having the original
> empty-password fragment (because it's the easy way out that only
> delays solving the problem properly), and spreading these settings to
> other fragments makes the situation worse.

I think we are aiming for different goals: security versus usability
and reproducibility. All are important. We need to find implementations
where the sstate-cache, packages, MACHINE parts, and DISTRO parts are
secure by default, while still allowing developers to quickly generate
images suitable for development and testing tasks. That's what this
fragment basically does: it converts a secure-by-default image into a
developer image.

The problem: Fragments currently affect all images, not just those
intended for development.

We could introduce new variables:
- INSECURE_IMAGE_FEATURES
- INSECURE_IMAGE_CLASSES

These variables would be used exclusively by development images, such
as oe-selftest-image.

Additionally, we could add a new directory (e.g., classes-insecure)
containing bbclass files that remove security features. Classes in this
directory could set a variable to mark the image as insecure.
Checks could enforce that classes from classes-insecure can only be
added to INSECURE_IMAGE_CLASSES, not to IMAGE_CLASSES.

This approach would allow fragments to append to INSECURE_IMAGE_CLASSES
without risking the security of potentially released images.

However, that's not the right place for this discussion. Maybe the CRA,
meeting series could be. I will send a v2 which does not change the
security related parts. That will allow us to proceed and the user can
enable the existing no password fragment in addition.

Regards,
Adrian

>=20
> Alex
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228579):
> https://lists.openembedded.org/g/openembedded-core/message/228579
> Mute This Topic: https://lists.openembedded.org/mt/116962329/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

