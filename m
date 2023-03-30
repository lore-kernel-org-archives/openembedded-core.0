Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB07C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 10:13:51 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.21462.1680171229475393231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 03:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DlMLjlR5;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id e21so19040162ljn.7
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 03:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680171227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L+yl5AFGW0kNIRp3spNAfT7lbO9eqrgfj7e5p5XBI1Y=;
        b=DlMLjlR5Zn3/z3nVGyORzHd8A3Z1GvAWoofhI5Cdfd0WegbopNK0iQ3SYci1NAXr9c
         OsfHNMTKD9M1xp+vMPqN0qmgdSyj68hLIMzYEfIh+2n7qwYsTqtv62+1n5UkFndQqbv8
         vewcVUenhNOUjyrcL64A3D9ktdLuKZumcy4kWQFc1k3qUju3lTszZlWGvcHp4e8ROfPV
         ToEeO9vqr/P8DzQBXX3cPGklIxOjhOEUa+74lCbHSnWATmpWOgmfC87QMQjwED3J2FWi
         E3pO+ET6yyCSABVYPuU2ah+lsiZSzL0HG7dc3kYk1+98Y7qaSglredRa0Nxc9gT2sKI3
         TmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680171227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+yl5AFGW0kNIRp3spNAfT7lbO9eqrgfj7e5p5XBI1Y=;
        b=KMBQWEiScC+qIiVzzFXeTkg6UyNHawy7aQP+l83j3qt9t7oBheY5WyvpINvMIkEb+O
         Ffcyn47AhYvRmi+6QV7YaBVSLuGiIHN1If7EnbkPUV9UrhLGoi3BDkLxUI+ob0/de9wo
         h3vjHcJRqcspvtgg82zZuGzAZcq/rOvUPtTkc25SA3+VT2tGrHF6uRO0IFKDFzM2xVGQ
         sv4kpZNzZapG3GPJ8E4iOHsqGmN3ec53QIZ8qJnYpN9NWrMjwNgvKmbncfRHIB1C6Sp3
         i2fKSdYovtrD1pqd3ZaqqDyVOGi1TI2mjoRO9zNBegCBgibI+4NX7aroH6rS5mTPoHEi
         Fxfg==
X-Gm-Message-State: AAQBX9dGEV2dyJEnyWo08mjAbD4MfYAgUhH0YdzBUy3mUwle/InYiEBI
	HdEuKoIDBjvFBxMcZ+ylMYpC7ngj3B+/3NZbfeI=
X-Google-Smtp-Source: AKy350aDiV5CQAVDf8w9AM3Z3DgnBMrzGiG5Wz+z3sH77YJL/+5gX8ZU1rHPEnhloq34JB90Xut2Wi5txQ2efQmVI0c=
X-Received: by 2002:a2e:8697:0:b0:295:acea:5875 with SMTP id
 l23-20020a2e8697000000b00295acea5875mr1789854lji.2.1680171227421; Thu, 30 Mar
 2023 03:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230328214351.3666478-1-raj.khem@gmail.com> <CANNYZj8zb4PnnhFUpPKsmcWRHJjjv7ATWzi61EU+YuaJrNLGvg@mail.gmail.com>
 <CAMKF1spkAdAHgzRzKwsL_i6_a9NqsnP4Wybsw5=2zkpOmTq8PA@mail.gmail.com>
 <CANNYZj8PNKJLz+r9XTUbEan2c-MY3db7iiNzxeOpA0-ATtLUBw@mail.gmail.com> <f0482727-b55f-3a79-7bf0-e3f61ec04c86@gmail.com>
In-Reply-To: <f0482727-b55f-3a79-7bf0-e3f61ec04c86@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Mar 2023 12:13:36 +0200
Message-ID: <CANNYZj-owhEy9yTWorYE7JgiJrF_z4=Lx5Gc3GfGjN1SsjFLoA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Fix build on 32bit platforms without
 64bit atomics
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 10:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179312

On Wed, 29 Mar 2023 at 21:11, Khem Raj <raj.khem@gmail.com> wrote:
> > I did - upstream suggested a workaround that was submitted here (in an
> > already closed merge request), but they didn't definitively say
> > whether they would reject a ticket (or a patch) to solve the problem
> > properly, so I think it's worth to at least open a ticket.
> >
>
> that is still under discussion. Hopefully they are amenable for such
> accommodation

But then the patch is Pending, and not Inappropriate, and should be
marked as such.

Upstream now suggested it could be submitted, so please do.

Alex

