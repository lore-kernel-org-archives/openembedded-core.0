Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFA9C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 09:00:59 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.6590.1721120448890195871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 02:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XXkNFsBt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-36816ff695dso1432963f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 02:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721120447; x=1721725247; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SdXowb9vBWvdX1LRb9niulXrCWhB5dVEubSXSp9nL0U=;
        b=XXkNFsBt1/MqFj+OsK3jh24qD3Zjx51Iu5RuiLyLHk+t+KwsPETdBPRNOhwPpLLMbV
         pVwFi0CegnnWNpMyKPguKXn8OwHkIP6nI9jzMGggB473c3atqfQUHOSqtIGecu5YzOOl
         mA2S3Sshi6jdxXnyx/qkKA+00itNyQNRbihIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721120447; x=1721725247;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SdXowb9vBWvdX1LRb9niulXrCWhB5dVEubSXSp9nL0U=;
        b=AOFieoG6euJFU06Fxh7+UtJBdnQVH55oCRThBe2tLXqxH99Jn8JU8FWWvykF0CP4W2
         ZjLv91W99H7CxF0SROkHFW1XgDhjNnGI0diqGYowyEb/igeQQLNFq6J1tw10da01171U
         3tiUzZF1meEKUREnLfqGMrXUJxLc+wr3I9+5h5syIwfhczcvZ/nFZWmD+6DBZqM1s5Cv
         HHcV5xX00gOcJnycyH0Tl4jqdJL9NpCRGbSDFImvA9Vnu1y7IJjNOKJGkqix5jQ4lox6
         wd0qDsjH/qKrqVW3wc+XA9ZIKD9HNsT35zsHSyU/CGyu0FS6UyYiWSvxbKdE4/R36Ll7
         QCYA==
X-Gm-Message-State: AOJu0Yxp7eT4bdhXH+XJ/dtpCMOJ1HA9/rgxQVWppTtEsqaOHaPYNAGr
	0ktEyJFypaUvhd+e+QO4NnEiYOcMr4HpbEZqJmUkap1/37Ql1f7M9PQUuEwKTsQ1E9HNv2Y/Z/i
	b
X-Google-Smtp-Source: AGHT+IH7hEPHZrIoz1igPVDWdEcD0e+NwxXa/yOLRCuGVJcnpZqgtMsBv/2rfnctFbudAPUfdjn/dA==
X-Received: by 2002:adf:f9c5:0:b0:367:f2ea:13e4 with SMTP id ffacd0b85a97d-3682613a229mr865095f8f.32.1721120447285;
        Tue, 16 Jul 2024 02:00:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:86a0:3ee3:878:91c7? ([2001:8b0:aba:5f3c:86a0:3ee3:878:91c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e81f0dsm114666125e9.12.2024.07.16.02.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:00:46 -0700 (PDT)
Message-ID: <c669ae7c3316ad33931bc9c40bb9c49e8af1895e.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] package: Add support for INSANE_SKIP for
 incompatible-license
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, reatmon@ti.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2024 10:00:46 +0100
In-Reply-To: <CANNYZj9DXbuFwHLHZa2p8asasehxkDaGYoH+PuMWEbfiHFx20g@mail.gmail.com>
References: <20240715190738.32206-1-reatmon@ti.com>
	 <CANNYZj9DXbuFwHLHZa2p8asasehxkDaGYoH+PuMWEbfiHFx20g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202087

On Tue, 2024-07-16 at 09:57 +0200, Alexander Kanavin via
lists.openembedded.org wrote:
> On Mon, 15 Jul 2024 at 21:07, Ryan Eatmon via lists.openembedded.org
> <reatmon=3Dti.com@lists.openembedded.org> wrote:
> >=20
> > With the move to make more warnings into errors it is inevitable
> > that we
> > will need more hooks to skip the errors on a recipe by recipe
> > basis.
> > This patch just adds INSANE_SKIP support for the incompatible-
> > license check.
>=20
> I do not think this is a good idea. This was a warning before, the
> warning was never fixed, and now, instead of addressing the issue,
> the
> error should be suppressed so that it's *never* going to be fixed?
>=20
> You can still revert to a warning if you so wish, but in general,
> global INCOMPATIBLE_LICENSE is essentialy deprecated in favour a
> per-image one, is there a reason you are still using that?

The ERROR_QA change is going to take a bit of adjustment for people.
There are some things in there which recipes will need to tweak for
various reasons (e.g. pre-built binaries). After much thought, I (and
others) concluded it was better to have recipes marked up with the
issues rather than have it as some "random" warning in the build people
ignored. I therefore think it is the right move but we need to support
people in marking up the recipes (and ultimately ideally fixing some of
the issues).

With regard to the patch, I think the key question is whether we want
to add INSANE_SKIP support to every call site (potentially) or whether
there is some better function abstraction we can use.

The implementation in do_package_qa is:

        skip =3D set((d.getVar('INSANE_SKIP') or "").split() +
                   (d.getVar('INSANE_SKIP:' + package) or "").split())

which shows the first issue with this patch - INSANE_SKIP itself isn't
looked at (for a recipe wide disable).

So I think we need a new common function alongside oe.qa.handle_error()
which adds the pkg option and checks accordingly?

Cheers,

Richard

