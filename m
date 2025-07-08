Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6830C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 06:08:51 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.12415.1751954925465048369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 23:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d5WD8IhG;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-710fd2d0372so37503537b3.0;
        Mon, 07 Jul 2025 23:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751954924; x=1752559724; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nG7cnONnNUft6gY15xseWrm7dbub7dOrae8h8F7a6QE=;
        b=d5WD8IhG3PgjlFdhhIzK2qhNaNA3xsav5PqrpbpBU+z5USYfam4BBug2a3w2UW5D8u
         Y2uTSXAUZve+94Q6jYa2ioZSJT4GnU85PPRq3BKy+UbiUouBYjtlYWsEuDD/sVmXjyzM
         xkdeV9QUIZX3u7EiEVo+hzffwubg4PTHvXyve03Isj/4k+AoYzAwqt+9F1Blbc5JqyZr
         ikaxFxKxhdzoQXdTcukz3cWIAOdLCXHf8Pc3Lgu3WL0UDXp4uQgYqZ5OHh3tSdW/4nx0
         z6ARjSrIuf5a+/H4QnFFZ9PipC181fhmxXSpnk69b8U3agynzrAllbV9mnG9NxusNjSN
         26Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751954924; x=1752559724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nG7cnONnNUft6gY15xseWrm7dbub7dOrae8h8F7a6QE=;
        b=ee929SnP+8dJBsZb8MKXy/dL88jsqsnrn5B/hnnfYd+sRhffx3QxQ19AEMj667e/UF
         omdeOByfp1gUWAmpkpzfxZZpuF0Vdf4592ji8iQqIEAxtLs2sV1aHjh40LLVC91I5qh0
         hbBsmu/eBKSRg423TtK/jVHHQ6RjguyEdrhTAvEtVdP2kKN6FiSNcsRZuDR2SJwx6f4q
         J8qkC/Mr2q+r6vhABSOtD0sg+T8Us4+Z5PR8ACTYVLc53gr7eTUdvKZZapXNfVQ13wwy
         QBYLFKTYSUAPUlMLicwVz074KsI+T5o3hYGsZKuQT3BzQmQC4rZKATL2FntmJAOszFIQ
         1nqA==
X-Forwarded-Encrypted: i=1; AJvYcCVNkQWQUP9jkLFpUbRHJ7KVS4I1GMHvPPDSRG4Yew3zs0tzzzSIkKuUhE9Xj3sIapS2gdv3cp/st1zUEwMor4Ddkir3Ea5Mag==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxm63xgBjlEwzS0/Ct+okMcjSusOVN+7uEWksgb/nw3ytPt/FzH
	Yqrc0mGqeWi35EZ4qKrLH9UZVHjcqTum2OzkoTMFHNW5vuTdrkajhWLpiUhHBnXh9G3yJ8CQNlz
	BfIgq8ignRavGEGvtXWmJr4VozXBiN2s=
X-Gm-Gg: ASbGncs89R8K8zSHQvqRl5+r8M67QLJx3CFMpc2lC7LzlJcpSPKX72I+POMoWZ4/Ik0
	XwR7vrj2t71ULtBTOyuxGEC6dRI74J3m677IUv7ZFbaQG6kIBshTH7f/53JS/LpsV6RdWWciOmq
	YQRGCuh8Va5PjxEwNTND7IKQiLN3klrMQMh6u+xHMz8UE=
X-Google-Smtp-Source: AGHT+IHBe6U9A0WJnGm62WquH6lAjESJZDLGMFMRCuHCNctfKurjKfWVmQ5O3Q0qY10TbY/rYUkskTtzct9Uebrlv2Q=
X-Received: by 2002:a05:690c:b90:b0:70f:8830:809c with SMTP id
 00721157ae682-717a07b3500mr19062057b3.12.1751954924416; Mon, 07 Jul 2025
 23:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250703132720.3378569-1-Moritz.Haase@bmw.de> <CAMKF1sr80kZEZunuw4mo32TbKXdrGUb853J8sA3EHuvc8suN3g@mail.gmail.com>
 <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
In-Reply-To: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Jul 2025 23:08:17 -0700
X-Gm-Features: Ac12FXx9kLKhxCsggdYQXZclgKbx9YWKj_0MKrY2ehcApi_ciNJaTZQ4Sj5QaOE
Message-ID: <CAMKF1sqvqmRBWf-VUYqZDxO_q0aQtdb1CG9jjZBHboxPvQ=Xxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
To: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, 
	"quentin.schulz@cherry.de" <quentin.schulz@cherry.de>, 
	"antonin.godard@bootlin.com" <antonin.godard@bootlin.com>, 
	"Peter.Marko@siemens.com" <Peter.Marko@siemens.com>, 
	"alperyasinak1=gmail.com@lists.openembedded.org" <alperyasinak1=gmail.com@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 06:08:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220009

On Mon, Jul 7, 2025 at 10:45=E2=80=AFPM Haase Moritz, JD-62 <Moritz.Haase@b=
mw.de> wrote:
>
> Hi,
>
> > While this change is a good one, this does have some implications on
> > the recipes especially from meta-openembedded, there are almost 100
> > which are failing, perhaps some of them are easy and others are not to
> > fix, but this does look invasive in nature. Like oe-core has been
> >fixed, I am afraid we need to fix meta-openembedded layers too. Here
> > is a sample world build logs for qemuarm
> >
> > https://errors.yoctoproject.org/Errors/Build/210889/?page=3D1
>
> I'm happy to support here. I'd agree to what Alper said though: Some way =
of
> coordinating this effort seems to be required. Given the number of affect=
ed
> recipes it'd also be good to have a temporary branch / fork to prepare th=
e
> patches on. Are there some pointers we can follow from previous changes
> of the same kind?

I am collecting the fixed into master-next staging branch already.

>
> One idea I had to possibly speed the process up a bit: For starters, we c=
ould
> try building the "broken" recipes with
>
> -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5
>
> added to
>
> EXTRA_OECMAKE
>
> possibly via a temporary 'cmake-4-enforce-policy-compat' bbclass or some =
similar
> mechanism. That would be faster then checking upstream for CMake-related =
patches
> and adding them to the tree / recipes.
>
> Moritz
>
>

