Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD1AC624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 14:18:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14031.1788358720179162631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 07:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B35rosYB;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so9758685ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 07:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788358719; cv=none;
        d=google.com; s=arc-20260327;
        b=Wi+qIt7Rib0kXRRDZt9y9YiLh8yfwbLw//hsxKSEEnsl3j8fN8QD5IPttRI7yxnR24
         b7gmTgJXZr8jmDYa0CbuIZuCZwuTogtALWStU7wszXDRnBhqTXzuzJK/IRF7A/7lxjoq
         2E1JbuH3xaK0yOkpW0p1+1gyUorjS1Kw0tzjZqLHSw6b90Bj5QzU9cmA2rgQBbkH3sgk
         Uk5iR6BosCtV8ufCvnMFGmQ53zLz3zP5VvFMq0g8SPewi7j5UIrDfpW91ae5dVqwAd5o
         Ug+oud/KDgT8Z08DQdNrUiArRFw+PcA6khn8zOEu7iXF6BzlhVA3swIZeP5qc5ZMPmS2
         Lpcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iBQXy+ATVjhmPx3UgE5AdU0PJD0drX8jjMiAT9Z8jIc=;
        fh=zfh09a0JpEYtbzk0Y29YmzLlDd2jr2AtaQ0bdQKaA0o=;
        b=cjbkCoquYzKyUWFkahWBR5KYL3UtkN+87iP3njuHXzL6IGoRUYSFwsLu96GT+kCbI+
         9DAtrlTnpV73WicX4tZscH9FM+I1StBzkQDos515GFI6RXHcxXim/q/LbZtj1mWIiCKJ
         iuBhX5Idof95H7HY86N7M9dpjC/2ti83F5QExeE0mjhra0dx36hblixVpn4fj4S9a6pB
         iRTdDmdRHzCghkxBS2xxKbbUfhZp4Gn7Ubg3WB0K7Ufg7hv9gKE1ul6/yk68mzFMxwiW
         T7PuAd6hw6uWuql5YxiRf+72jGjeGwPgToV9KpblEIiQwE84VEJig2EmLXB9LXuVEYLg
         dAxw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788358719; x=1788963519; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iBQXy+ATVjhmPx3UgE5AdU0PJD0drX8jjMiAT9Z8jIc=;
        b=B35rosYBTWIp7/az5OT6bC/E+1wvac4TgS6sztdEMUMECpD2OhlYV4o9NvRug2PFvt
         6viBF8O1vrYMtTIXbRXB6GLpYDd81xx4OU8ZPOVUqUvHurtgw4Cj+HclpvgEwdNKObSI
         6WV1Ieh2aSbfGUrbgpUw+M9E6lsAbE1ynmX8nOnMGr9i6MXX82L/RHfITU8MYGbE8Hak
         54ro33tdvX2FPLanm/YQo627YFsk+UEm9tJvN1sGlmvWESEcm0xpdKrVyR+cjRA6dj68
         45FXAJz7ZCVcH2X6MxTnMo5TLbu/4gC3L5JngN3HftERuCZkYq/3vZw6H6z8oJ8X8ovj
         OYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358719; x=1788963519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBQXy+ATVjhmPx3UgE5AdU0PJD0drX8jjMiAT9Z8jIc=;
        b=afejYUZEkVQ3Aio9Axm7YE4TTi80dO/mqENP0fJhWCVy4vSuTpcIz4MW9L6b7ynQOJ
         tuK8fk+rx2sLr50kdn9GALAM0z1bmQox/olTE3jXVapx3Dqt0T4WAciArTCSai4887LT
         kdof5kxAbHU2F4lT4JHilBZ5zhjRKuFUvlXFW6/ZC48VFD0bnvOa0Yfp6/fVAMA0yvbI
         pBX9yr3xUj2yXy7DeoFnxLQtHLMkRpDEN6vBCzLww/KLwLwtq5pYAK/xobvdazinI+LT
         4kONmkEygiM9A/6h/SF4rg5uXQA5payqffKDiU1ejFsP8MkJKhyckvGQCpvH7h0BsNLM
         bJbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI3rf3LgeZfoJhspsRj9opZZIVthijwrw2pSCPoQKPJe4rMuJ6HNS6ephjYzUiEVeSbYZSRxy/rFBXe7/uQVhNxQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++nprC9U36KuXsRPokcNZx8D5iBYYK+cD6XiKK16Asa8Gfr6JvOR
	xgxS/kx9WP+M7jHXpL3LeK3u165/JypkAfEVdynU/DlZ9Z/j3rvu2Sb6E0AG8z7I6lDX8G5uaQY
	LRMhPDFGPT7kAlaPVZC3j5LO/f3pg5Ks=
X-Gm-Gg: AYBFou0RumqheJ5hQz9xa1dlxelL3vzyvqPQsLj3Hhytmfk6CEUUN+/CMwRRsbqhyJT
	PIwCs1f0VVJQ2XTt0ut6k9oJIL9LeblghnK2SpODLN5XCRNKzB/RoLL3cUBiAhD6NqI0d1ViCue
	l9YzCDTDZchu6/Fn38UVF8tCuwDxFEmssw/5PUbLILMD0eE/2lglnLSaCOvmrxV6aI4Q0s5ZMcW
	7rr51yNDVDofp9X9q2q5VlPNu3uMtqIvGfeZTMWz0D6lCpkEJlBz2FyieT59WiJvuoB/mleBTbW
	rKAi7VtEIXkixrFqpbY3pKa5bnF0kdICpo+PyDFhkoWa5fIhLGFlMjaFnRis/rOmx43JGG+gCoL
	QVcVBSM2O6fQpfSr8JpliBU8nZMd//AiLJ2X7sf5w2uS/BzhjBCL1HBJ5AGO7pQZv3NfeSolnHQ
	==
X-Received: by 2002:a17:903:324e:b0:2cc:6018:f030 with SMTP id
 d9443c01a7336-2daec6b11femr83481245ad.14.1788358719263; Wed, 02 Sep 2026
 07:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260902132305.3685228-1-bruce.ashfield@gmail.com> <apgqAmouWiLgb40y@nuoska>
In-Reply-To: <apgqAmouWiLgb40y@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 2 Sep 2026 10:18:26 -0400
X-Gm-Features: AcwNN1U1w0T6mFa4r2uX2tOCtxJBMWDLnXSTeXAY-1aG-tddqFYVUD5_ObHsVA0
Message-ID: <CADkTA4PM1DdzKfU84wiNsg76thD7s5sB-dTZuDRC3Db-zN7p3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7 v2] linux-yocto: consolidated pull request
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 14:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244964

On Wed, Sep 2, 2026 at 9:52=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.or=
g> wrote:
>
> Hi,
>
> On Wed, Sep 02, 2026 at 09:22:57AM -0400, Bruce Ashfield via lists.openem=
bedded.org wrote:
> > meta-yocto (1):
> >   linux-yocto/6.18: update to v6.18.48
>
> Is the meta-yocto side update to v7.2 maybe missing from the series,
> e.g. genericarm64?

It shouldn't have been, it's in my exported patches locally. let me check.

Bruce

>
> Cheers,
>
> -Mikko



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

