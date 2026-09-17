Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14282C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 11:44:07 +0000 (UTC)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37282.1789645439666785410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 04:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EdMxITkk;
 spf=pass (domain: gmail.com, ip: 74.125.230.205, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76bcb1fso6961311cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 04:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789645438; cv=none;
        d=google.com; s=arc-20260327;
        b=YIXxG7UmOAj6013IllsdLPZH1vnfBluV2jrpJE/HTMEKSiJ7MAlv2b3lv8/ImYYI2t
         GbivY5S0PtWxWXLQ3qlgV3Bo+TA5ETqQH54Nbc3C0Eydpfv5FIhVoSFkCwVYLwXlBLKK
         eT8TgJOK0632xhDI8MlYn+HBldNNn91YpWnahwcIY24+Z6yV+wxhiZMJkJ25MbwPx9Xx
         G9GWB7b3LTc8Du1R5WMv4Xw3rT4aAT0rThXDnK4LT2uGqppLIboBLKUb54Kh2yTo2yfx
         +77jr8YLuwmdJC/+bPS8c08AmOr6hMNkoZmIsdMiPbYhGhs972Ur35UIgCbL1q463If8
         vdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OELIlhURI09ZTPp+p7b2alwht4wO28W2Tkq1tWrVZNA=;
        fh=VOVZu8FjXojtP/2iv884q8pvwCQeeuFgwI9OY1sYm5U=;
        b=AgvGWJTcPLyJBfiKdHCx1O+IZt3wj+qIvD07khoCHf6NQs9kqB5QLPYiJhCgUIpMXu
         kQA+kUy1gh5yHmcqxoYGt3Rp73j4D5BIQAMrQehpp7/TZ05aUPi90DS9hqmkfEE8FH6E
         DoE08wU9EkRm1obkJQw/2KfkUgPWZOIVDgZmiCOkDus2/hrI0j+KntEPgfJ7J3hhc0Na
         ImlodyNsjrsusm2Cq4gUAA9gdwOWu0kHf0WeBtxqklyz+GnzzgLhICLSxq/kJuWad28l
         Xg6DHgScidq4F6Q6NkN4HPBEF0Bzkq/CjwTMl4veTR+zWzMkRDXeG4ikbpszamByD9JW
         XHww==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789645438; x=1790250238; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OELIlhURI09ZTPp+p7b2alwht4wO28W2Tkq1tWrVZNA=;
        b=EdMxITkks2na+XG9QPJcdax0N9YdYtgJVKA7tKO906PNUbj7vQbt1rf624l2pWu+U9
         /7Ll8QQPJSGqBWN7lvQLnIJGW+eBcDVX0Os4XhYh2WHr7oBGe1dg/kblSrSOlv5p+4oV
         YEh+lIoMTvDqo6JxTaHNR2smnUdr5F4wNnV6e/T2QZm2xA2lybjHjMjB60xr0qcUogmc
         4nhyhkCkdXM4fumsnnvRgaBpR96Kcg2oMuZNrCTKf6h5UTszkGwjUBB6IsBAwCsCeUwe
         /8oSGe13jou0L6bygcQLgGooxGBhH1VHOh99MNwjTQA/mbxV3KwEPjGRf5WWckbCAcGk
         ldyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645438; x=1790250238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OELIlhURI09ZTPp+p7b2alwht4wO28W2Tkq1tWrVZNA=;
        b=SPwb6S0CC9y3Nfh5nuDukR/XPW/CDeUNlD745Xj+d19NYhhueTxNS9miw/C4VgXom8
         9a/1NUImBflrg/jHU+3fM/MugqOttTPWgN+/FOkFY6EcW8R1hACHNBKahsy3WKUmggWN
         fMnEX2k/0KoV9Fmvebg8f+F+Xfl6MH2k3LGxi/VOjnbgv176y0c0x5koyUDH/YnVGulj
         J9P8IH7yVpCnFIVxegy5znhRui5AfnkmkVhx7lQyGQLiUtgxt+PkuE67Mhf3Ggjy+jo7
         q5WTisHJwDBlM1Nes6gi90dKDyITlXYUsjk6iUNtUA1nN4yDkBvDu4gMYbtcvU0Mtppy
         KJ1g==
X-Gm-Message-State: AFuF++mRvgKvqbqSREKWbl/uYGrqS7BxLwwy17HYTggDltrwBJcisCIF
	lvWV4LUZD0HUk3abwyu+OlrMzSXSyscQKy67VxQJh3lRbdlsufpzr1eBVo98G0NpyNo6mya0BUJ
	dhAxMXTy23K8ckPUddzyOm9sL32kQzt0=
X-Gm-Gg: AYBFou3Cp2aiK5abh/KuFrOHK7pnVSEoamJWL5sSBvVfJ2WjYdqP4Axnva86fJ9jxj9
	4kYR5PjFQBaFQbDlFlq2acD7pz4uuw/+4aYfNs4drl1PikJj1dkujZJYczNK0iNe54UDKfhuzX5
	eDQnPHkr/wCpiAZSvVW7y3XfvlrB1j4bwex8XEgz4PeCdNjCeslFkcSy9aoZq+5ZnO6wsbRxZBJ
	8mFQYp1Sq/xQcK/FHyo7f4/i7nztbVtPrvAG3tSU+GlrIYJSPmUypRVR5GjjOPdOgBhPpNFzdMa
	GtMvA/fPmMIczY11977XPtcaidfk2U+eq3JbFYbzXLus4lGifGgCr+uboqYPc6AfEoW7DQxpHw2
	ROmBO1YnfLNxu+Q==
X-Received: by 2002:ac8:7c44:0:b0:530:256c:3718 with SMTP id
 d75a77b69052e-5327f1a8f7cmr107400381cf.38.1789645438503; Thu, 17 Sep 2026
 04:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260914120925.1153614-1-alex.kanavin@gmail.com>
 <20260914120925.1153614-4-alex.kanavin@gmail.com> <3594263F-7B54-4C7D-A145-A98E23B6567B@arm.com>
In-Reply-To: <3594263F-7B54-4C7D-A145-A98E23B6567B@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Sep 2026 13:43:45 +0200
X-Gm-Features: AcwNN1WQYSS5jZQ5VRUaSe7liemIIK-gMwZMY8GgmgBnw517Dpxv0jQTGq0ZPPk
Message-ID: <CANNYZj_WB_n3qbh1XTWm3NGTzXFhvwG9rCh+RnNeK43326jk+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] libfyaml: correct upstream version check
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 11:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246057

On Thu, 17 Sept 2026 at 13:02, Ross Burton <Ross.Burton@arm.com> wrote:
> > -GITHUB_BASE_URI =3D "https://github.com/pantoniou/libfyaml"
> > -SRC_URI =3D "${GITHUB_BASE_URI}/releases/download/v${PV}/libfyaml-${PV=
}.tar.gz \
> > +GITHUB_BASE_URI =3D "https://github.com/pantoniou/libfyaml/releases"
> > +UPSTREAM_CHECK_REGEX ?=3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
> > +SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libfyaml-${PV}.tar.gz =
\
>
> Isn=E2=80=99t that UPSTREAM_CHECK_REGEX the same as the value in github-r=
eleases.bbclass?

The regex in the class doesn't have a $ at the end which pulls in
alphas betas and pre's. Maybe this could simply +=3D a $ to it instead?

Alex

