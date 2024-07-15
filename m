Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D12C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 12:44:58 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.37214.1721047495031521458
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 05:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lxvVWIT5;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eedebccfa4so21965491fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 05:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721047493; x=1721652293; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTikPQMrmfdOLRnnq6d4DujmiqRy8Y5nvneP5Nwv5G4=;
        b=lxvVWIT5EOo7F/bplkVBa6tPgcuDgo93jNRdxFLmSt7NWujeXiXCBXWjUsOV3Rc3Bm
         8VEt9sPPTwVxVBkYxPlhRCIGHN1gTHHVwTsg6HUbBFLSbj+e+7A2/Wt2RJa2Iv9i1Ljb
         0aJ3tGRdcYTIJy4dBJJhMNPTUdKuEJKj/R590nAcDZd7I/l7nZkK4FVB1I81G8QbNtur
         T7lU6/FePDIXzUut0rbkTEOWPyjX3ZRKgisResyVNvpwsvMgzz1qltQq+6k1fuF8/n3K
         bV9r6tiSLnEVMfzxu05nkZ/s4dkILVHrIY8KGoXvOv4bIY4qzV4tit44wLLv50/FntO+
         ZeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721047493; x=1721652293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTikPQMrmfdOLRnnq6d4DujmiqRy8Y5nvneP5Nwv5G4=;
        b=d5+0hhU4/j0NF+FPUIcNoHhVP5obQyy6Rlh05cROSGj4w6ZNYrc6uGGbuB/g+F4GIR
         PTmqyyu/2y8pXNh5A9K0CaNCrReRXU+pXoz0JQ6GC/YkPD8nV4iYitu4MG+za1ymjOVD
         pQNUawS+PRLdlODMUgUclJaz3W4iRUpiZ85R/UdRFzE10ccWfDiBIFaFHbnPnHKcI+kR
         Ftb0zoqAhFRfaNE5XKqbubaRLtjykPeALby/5JiIxVrTirE6ZuVXvndlWVDboXDGIBqd
         XzE056Yv3nIrHj6UTplT+iaMulqDvT62vGBeUKp0d62B/5GAcQKsobLNYjGdyMhcCKbv
         xsSw==
X-Forwarded-Encrypted: i=1; AJvYcCUM4ge+p00c6QsTe21nB2hpLplnFKTJK+ObTT2qpY0KCJLXfYfJCO9PEJY6LfBJp7CPiVzVurjfel+OM1dVgQWqHOgdumT4vRVHDQBCqmjUkWUKyY4jVuiY
X-Gm-Message-State: AOJu0YyJTAyXJnEFMmQysk3Kz80V4tPP4tf3rt5Zua4rapny2hxF6XaQ
	skmzVv2JRm2GdFCj3aZ8yGe8w3ou5kXfIVX0DmbSGTgbGP8Ycip+ARBmuLvk80b53wPpHHSZtN+
	ZlX45bzSSGld16WK+wtLyamSyq30=
X-Google-Smtp-Source: AGHT+IE1euQH5MCO2gUKEeXurmF8Eu09Ya0+sDf1cEoDdpWR3iytl9t/UvHuPGBwlH8mFEsoXpVAa1HHhrPKKCoK/qg=
X-Received: by 2002:a2e:87ce:0:b0:2ec:5933:a62c with SMTP id
 38308e7fff4ca-2eeb30e3a18mr140804821fa.22.1721047492957; Mon, 15 Jul 2024
 05:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
 <1720604634-23406-16-git-send-email-wangmy@fujitsu.com> <222DDA84-EC67-42D6-9516-D98CBC624577@arm.com>
In-Reply-To: <222DDA84-EC67-42D6-9516-D98CBC624577@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jul 2024 14:44:41 +0200
Message-ID: <CANNYZj_pD8odEq74Eo44PKkcdgyD3WROrK5z-6UEs9AH9Q8aQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/30] librsvg: upgrade 2.57.3 -> 2.58.1
To: ross.burton@arm.com
Cc: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 12:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201923

On Mon, 15 Jul 2024 at 13:58, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> On 10 Jul 2024, at 10:43, wangmy via lists.openembedded.org <wangmy=3Dfuj=
itsu.com@lists.openembedded.org> wrote:
> >
> > 0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch
> > refreshed for 2.58.1
> >
> > Changelog:
> > - Fix failing test with Pango 1.52.1.
>
> Obviously that=E2=80=99s not the _full_ changelog from 2.57.3.  If you=E2=
=80=99re going to include the changelog, please include all of it.
>
> There=E2=80=99s some non-trivial changes mentioned, like how the entire r=
aster image loading is using a different stack.

I need to add that it's also okay to not include any changelog at all
if obtaining that is too much work (I never do it for instance). It's
obviously a feature upgrade, and changelogs largely help stable branch
maintainers to decide if the update needs to be cherry-picked into
stable.

Alex

