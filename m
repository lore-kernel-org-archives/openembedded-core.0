Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FD1CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 08:14:03 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2442.1791879242706227840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 01:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nb+JYgmq;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4207ac26so2547533f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 01:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791879241; x=1792484041; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=macQ8qssb539ticHqutg5K8enrIce1S4menn07m0kV0=;
        b=nb+JYgmqIjKDEKLGdqqBlPAPvDbu3mkozDhs4wrJ86IXNtZeOCqOu3sht1A8yisIij
         yFBzYyy2TU+jJ2L6qS2bsjaLmhQXL5AwRyARV4dx2IwpMnuG7Ug6frxjXDTLh1fgq/1o
         F4ECCKYiT3clBApz6pReXtI1K/32ho9g0Mhmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879241; x=1792484041;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=macQ8qssb539ticHqutg5K8enrIce1S4menn07m0kV0=;
        b=Uwlm32mGuioQ4WksWzT/QZ0Q5DDlTd+7gBXHaXsbiqbU6txbaBCxD967GJzmy3hvkP
         Z4w38Xw5IsuykANnaHpv/FLm4Wzb/WfW8d2cn9vzzbYG3IvW6/RYxnzA/Ntgg2lL/lLb
         kof+W9lMWCpj2y9e3xhRSeSQOrvRiE6cZ38RyyHEyboEkpASe0RhUCxj3BLjMlk73ba3
         pHCMrnIC6Vh74H9Rb2dYsTqHGukenc91vwGHm2ewgCQpWhmSxvcQ/NjkLxxaVqd9VE7O
         2iqRlDcSvUjrCOFl2JwqkEZoc1PgsyENRwliTyC/Qc4Z0MvgqNKNSBw6EvPauyPeKxdW
         KiTQ==
X-Gm-Message-State: AFq9FYKjxRPl2beO5qQhUq89ZerFtqiUZga6SFT5bwfUTjMn2FY5qDxE
	HAgBxIZqC4fIr3+/uN22YSb3g2+MMuMzEGegXMM6WvTdHEjz/OEkSAsCiuo+4YsiKs4=
X-Gm-Gg: AYBFou2dGlPQT4G83SnhNPbgf2ZMjwkXi4TbNUFLTr+6NRWGAscjynOEjOgbKAZqslL
	ae09VoAQc8ZjfNU5hXGu4JE6zyIXasxv58wfCA2ZrGcxNzFUjSCbs6VJzriSgye3p2u86hVDy+u
	w4NsCkqNTfAQSjWCYSZfYlq4vqq1EkFscMpqrbhK3wmJ0eDmkBa6jiTzxi5pGLqXn3HreZEHaqt
	5kMDL4usyAmX0zirl/1gIgTptPw4WIKjmz6YHCsH8p9s8BgvdbWX7vS5Pero9X5zu2wMA1elKlX
	255yySbwCrkQbcax6kqfIHMxpdS1xHRH15K+ReEoebX3qjma7xKbqy/HJkyJsN49pj/Y8ynInM7
	QYd6xExAflVlsqExGhbmHnr70OrWrW+d17LRzpdWEGMyuvbMd1jkzFb7fb4csKVECiSCmqBvd4V
	UhjxMyFZrMmn7Rv8LR5euUDluLyevR5ekw/kPbColWluVi5AOMwVRUCS4Jz5kZeFrZeopEnUEG1
	SiQtmAYY7/esQf7RtuD/s/0sbhI21D6rWRrYoTnUCZAs0Obt+CP4ZgHF70=
X-Received: by 2002:a05:6000:4285:b0:48c:4485:3357 with SMTP id ffacd0b85a97d-48dbacf2482mr19556570f8f.57.1791879240677;
        Tue, 13 Oct 2026 01:14:00 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac4fd7sm3778105f8f.40.2026.10.13.01.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:13:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 10:13:58 +0200
Message-Id: <DM3K6E7PN2UH.1JG0TM334KN5N@smile.fr>
Subject: Re: [OE-core] [PATCH] uutils-coreutils: move from meta-openembedded
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, "Paul Barker"
 <paul@pbarker.dev>, "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 <collin.funk1@gmail.com>
To: <alex.kanavin@gmail.com>, "Etienne Cordonnier" <ecordonnier@snap.com>
X-Mailer: aerc 0.20.0
References: <20261010113029.2347847-1-ecordonnier@snap.com>
 <CANNYZj9kcJ+_Q8gEtmLYqKjwLsHogY1o4b8MeZQf6jTgDp3gtg@mail.gmail.com>
 <CAHUKmYZOUvohA9psyEiJ251a9mCnTteUDkdAVU1LEAAFC_PdZw@mail.gmail.com>
 <CANNYZj9y8xONSSQAAjov-5QSeTEkjD_iahpu-bUpn5kzGnbOQQ@mail.gmail.com>
In-Reply-To: <CANNYZj9y8xONSSQAAjov-5QSeTEkjD_iahpu-bUpn5kzGnbOQQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 08:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247707

On Tue Oct 13, 2026 at 9:41 AM CEST, Alexander Kanavin via lists.openembedd=
ed.org wrote:
> Alright. Here's a suggested plan for you:
>
> - add ptest support to the recipe. It must have feature parity with the G=
NU
> recipe.

FYI, on adding ptest, we tried last year but got stuck and dropped it.
See:
* tests.rs: statically defined `CARGO_BIN_EXE_coreutils` causes all integra=
tion tests to fail on Yocto ptest-cargo =C2=B7 Issue #9246
  https://github.com/uutils/coreutils/issues/9246
* tests.rs: Read executable binary location from environment at runtime by =
andstepan =C2=B7 Pull Request #9323
  https://github.com/uutils/coreutils/pull/9323

Andrea does not work with us anymore (sadly), feel free to take over his wo=
rk.

Regards,
--=20
Yoann Congal
Smile ECS


