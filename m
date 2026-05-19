Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FD4CD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:11:38 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.674.1779232290819743355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems.com.br header.s=os header.b=LBV83t6V;
 spf=pass (domain: ossystems.com.br, ip: 209.85.210.172, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-835c98b659eso3606404b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1779232290; x=1779837090; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78wLtVdwUXhEmKAqG22RnsuP9SnaoYn2UtFbPQEvLiM=;
        b=LBV83t6VdO+pqg13FWx/3tuVw8CEacYNLpUQs4Io88rcVDPaEv8zUUxBJO5tNJLDV5
         BGm8JRghL7J3s2d9fKFBhK94nl+Qcv5mTcqCyF5NeZuZ61sqB9wHKGiggVPS5gsy1Kzw
         OEVV4iWq+fTR7/907mwpr2r+9oA7Wtu49hyRWZtTryjpNVMmp4F3sOr7b92fOgFIPFVz
         xDG8fIwE4B8tWsSFfY00splSN1a4vrai/hEX2iioFvAvsQDmU7bGyXUeTSVtbYv4RNKx
         HZTOiEFAmwaqOq2UPN7OoqMNvDS7bCwlMQHmT05rj6eP8ZUXh9ghHoqHaa3QnhyxrZ5z
         EaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779232290; x=1779837090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=78wLtVdwUXhEmKAqG22RnsuP9SnaoYn2UtFbPQEvLiM=;
        b=rsk69oauHmcm1vx0ghNcCvDDWn4Sp3Oi674bLE0DFbDdHg0Ld9YpbvJqHmY2+PkKLT
         WYvsoTSctCbU+eBTAxXWDVANiYX+R/h7lGizpOFRmXxTjhscb4tgWqriQLYyC53YA+uK
         0rwBhksvZ9uW8YDhnQszsSXuXMI5wphKVJjHK2jy9BGLnBLqYn7ww4ouKVJKv4p0aR7w
         Ue00uWW2ozpVHZiZRd/XHDHxD5mXRWlQ1wdDz0fL02jualybmFA70pc5OrvW+MlGTeF+
         myfGz99G64b+jaKJ7urC05dROjvBG9MNSo1AYdQ3p7LrUlt8ImE4y1qHlYxkNmrfg+dx
         Bqrw==
X-Gm-Message-State: AOJu0YxPTDUf2TfJSKlkt6ZFjdSsC9Avp5CXTwN2CodHLB4oyM8frNDy
	aEa+ZhR9wxDzgNkr6uCuQcNVMXRHAypvDYKtf/AD8hxz/ofjn5YjrubG5M/qHQPpc8CaHW7aUsX
	rsA4s9M8=
X-Gm-Gg: Acq92OEbVvfRLtAIobWJtQaixqE5/gwBmI97U9MH1nyhJgtPTGieUAR33nZDNKj0GZT
	9WLKZ0VmmOVSx34cjmBF+Y1TxLlfsR6a5t9xDxftGi0kYC4R4TRRwjvr5qRW1uleYmZgLPcLMik
	CjY/TtiVYBC3BjwZoFG1y8o8UcXsJl3sIcs71iYXFmpf9U50FgZyoixBe44/IoaEe4agaRggAoM
	3I3L+pA566AvBk719bIIwh8sv//4n9JlFypXpSBMF2c//u9NuvHJiW11PT7B7ww/pDbJU5YDPeG
	S3qhQ4o2vY1Mw4TTkqoM3ATuabkZprpzEl8xzfMqJM+b5azPu4hbRcK4wIXtDcLgPUv707RFghQ
	15xAU+9Ix0Uh95qaatTYEfwSD1mQ1yI2ZRh5WR9r2W8xTKcxeDuwlqNyRJW81Wvv7xZfZHZvYW8
	URuoOVpsX2dj8a/tQj99UluefQBmN7SE9VpXSutda0yyhXjnIDbb6Ya3ih4/Lm2HvxgnX2sl1Qk
	zNg
X-Received: by 2002:a05:6a00:3e22:b0:839:dd77:3501 with SMTP id d2e1a72fcca58-83f33c33546mr21274454b3a.1.1779232289670;
        Tue, 19 May 2026 16:11:29 -0700 (PDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19775ca3sm20276290b3a.14.2026.05.19.16.11.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 16:11:29 -0700 (PDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so4333791a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:11:29 -0700 (PDT)
X-Received: by 2002:a17:90b:574d:b0:36a:9d7:8589 with SMTP id
 98e67ed59e1d1-36a09d78874mr4387780a91.21.1779232288582; Tue, 19 May 2026
 16:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAP9ODKq0E4gjR2R6TXK38v-a3wQa5Yi892BVOB=3YoU+ibM23A@mail.gmail.com>
 <da740047848f706c420629378838229833bc9fe4.camel@linuxfoundation.org>
In-Reply-To: <da740047848f706c420629378838229833bc9fe4.camel@linuxfoundation.org>
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Tue, 19 May 2026 20:11:16 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp1eh1Rj+q5s7Mr+vTZQBny9-Zwxty0qJkJ0gyaYvYX_w@mail.gmail.com>
X-Gm-Features: AVHnY4LMcINYCxvpULSkbWjg2ls31u5qorHCnHyMf2SqXivkWLhE86TomBb7EhQ
Message-ID: <CAP9ODKp1eh1Rj+q5s7Mr+vTZQBny9-Zwxty0qJkJ0gyaYvYX_w@mail.gmail.com>
Subject: Re: [OE-core] Re-visiting: bitbake-setup on PyPI as the recommended
 install path
To: richard.purdie@linuxfoundation.org
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Daiane Angolini <angolini@gmail.com>, Rob Woolley <rob.woolley@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237346

Hi Richard,

Thanks for the quick reply and the context =E2=80=94 fully understood that =
the
LTS feature freeze had to take priority, and we definitely don't want
vendoring and versioning rushed just to hit a date. Getting those
right matters more than getting it out fast.

Em ter., 19 de mai. de 2026 =C3=A0s 08:25, Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> escreveu:
> On Tue, 2026-05-19 at 08:20 -0300, Otavio Salvador wrote:
> > - What's the current status of promoting bitbake-setup out of alpha
> > on PyPI? Are there known blockers (release tooling, packaging,
> > version coupling to BitBake/Yocto releases)?
> > - Is the previously discussed plan still the intended direction, or
> > has thinking shifted?
> > - Would coordinating the PyPI release cadence with BitBake/Yocto
> > releases be feasible, so users could pin to a known good version?
> >
> > Happy to help where I can if there are concrete blockers =E2=80=94 pack=
aging,
> > release automation, documentation, or otherwise.
>
> We still have the intent of doing this and Rob Woolley posted some
> initial patches on the bitbake mailing list. The timing was tricky with
> the LTS feature freeze and we ended up focusing on getting the release
> done.
>
> There are some logical steps such as needing to properly vendor the
> bitbake modules and needing to work out a way to correctly version
> bitbake's library and main scripts so that incompatible version
> combinations error appropriately.
>
> The patches as posted currently aren't right, we're struggling with a
> combination of review feedback and getting to the right patches...

The reason I'm pushing a bit on timing: we're working on the fourth
edition of our BitBake/Yocto book and are wrapping up the initial
chapters to send to the technical reviewers. As mentioned before, we'd
like to use bitbake-setup as the default installation path we
recommend to readers. We're trying to cover the BitBake setup story as
thoroughly as we can, and we genuinely believe pip is the more
user-friendly option for newcomers =E2=80=94 the git clone prerequisite is =
a
real friction point before they've even built anything.

Would it be fair to assume a non-alpha release on PyPI is realistic in
the coming weeks? Even a rough sense would help us. If it's likely,
we'll go ahead and structure the install chapter around `pip install
bitbake-setup`. If the timeline is more open-ended, we'd rather know
now so we can lead with the git clone path and keep the pip method as
a forward-looking note.

And the offer to help stands =E2=80=94 happy to test Rob's patches, review
packaging, contribute documentation, or whatever else would actually
move things along.

Thanks again,

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854

