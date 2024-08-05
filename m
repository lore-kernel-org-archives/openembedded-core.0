Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1ECC3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 16:40:28 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.12644.1722876027049037564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 09:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LPnvfm0B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3687f91af40so6376434f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 09:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722876025; x=1723480825; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QwZl0boAzUR/Ovi60X3GLPINVwlSmCRH8RsCQAj8haA=;
        b=LPnvfm0BEN8Rtom1pYl6WCRhZiHIRpIvY7D60YzQbeRXKfsLXpFLf+CY2jyiIFr/W9
         gG8ixgJ3TvRndpnO6FrFu8KkPyqMLplhQX20gCzE9KHo7BTmMv/P9SS3VYKhB4XfBcDe
         hdaucoEWhYQxzA7EJj923yacsTHzA8FwQMgbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722876025; x=1723480825;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwZl0boAzUR/Ovi60X3GLPINVwlSmCRH8RsCQAj8haA=;
        b=qwtJlDqQx/Ljm5owK2NLS7l2y+ngUAMQnObc8tXhO/ciZrZyUR/0zLtT7mJQgeCNN6
         uXPxavI1XNzTwJR9hRbI+ROkBEvsRuOUJ12tjCMWAkt41zSX0Q49tCvT8KVpG5rKGE3M
         CI76J+HrO5EC74bCOR0KeuwJ9gvEZ1J7idzqDQwGaX29nUxqMoxs8+QC8z7ekUDsyYTY
         pekt0ZFAP4qTk+mI/TgxK7lYWyaS1ztCBXz+BOZGG6sC5b/tHs7nxSKxAtmwgqrxalYJ
         LxOSnVgNlld2wc6xJEaL54kResf6A1/Og7D3SpJT2uMp3hoTF6/VYhjIvpw2SZUZU1gm
         rsGw==
X-Gm-Message-State: AOJu0Yz80FN+mTXIHRMfJlNEUT8vRGP/9StOKozfSYnfrtRuQGvHFxWB
	b1a4hUq/6VH4+4CJzK0OxxlGSwBFsfNikMAiIixu7hiG4In0C6XFtDstHvNXd6M=
X-Google-Smtp-Source: AGHT+IHX9PJsj8cQIoZRGbLbNO8CX3D6ybISHoAGQfxWwgS2GJZHuW77QuMDRb+lY1DENv1Ikynrzg==
X-Received: by 2002:adf:a782:0:b0:362:5816:f134 with SMTP id ffacd0b85a97d-36bbc0cdac7mr8820711f8f.13.1722876025286;
        Mon, 05 Aug 2024 09:40:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e8f5:87f4:f4e7:7ee7? ([2001:8b0:aba:5f3c:e8f5:87f4:f4e7:7ee7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd26f913sm10356809f8f.111.2024.08.05.09.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 09:40:24 -0700 (PDT)
Message-ID: <153f71725fc8d9fafe9da91d0af0262cb8af878f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] cve_check: Use a local copy of the
 database during builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 05 Aug 2024 17:40:24 +0100
In-Reply-To: <CAApg2=RLDhjfF31BOdE-hFAKqJswWi5X2YM-J_b6YHSGEoo3_g@mail.gmail.com>
References: <20240804130936.1339847-1-richard.purdie@linuxfoundation.org>
	 <CAApg2=TWFeTC5SML6mGhwo3dXBA_PyoJykxGfjqa=1b=JwFNfA@mail.gmail.com>
	 <0162f8e09fb05ba123eab2987ecdf52b9340dd65.camel@linuxfoundation.org>
	 <CAApg2=RLDhjfF31BOdE-hFAKqJswWi5X2YM-J_b6YHSGEoo3_g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 16:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203006

On Mon, 2024-08-05 at 18:16 +0200, Marta Rybczynska wrote:
> On Mon, Aug 5, 2024 at 5:50=E2=80=AFPM Richard Purdie <richard.purdie@lin=
uxfoundation.org> wrote:
> > On Mon, 2024-08-05 at 17:41 +0200, Marta Rybczynska wrote:
> > > On Sun, Aug 4, 2024 at 3:09=E2=80=AFPM Richard Purdie via lists.opene=
mbedded.org <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> w=
rote:
> > > >=20
> >=20
> > > Do you plan to keep it for longer or is it for testing only? If for
> > > longer, I would likely keep old variable names for cve-update-nvd2-
> > > native.bb
> > >=20
> > > Did it help with the corruption issue?
> >=20
> > It is really hard to say as it is an intermittent issue. I ended up
> > merging it earlier on today, partly as I wanted to get it wider
> > exposure for testing to see whether it really does help or not. It will
> > take time to see whether it recurs.
> >=20
> > Regardless, operating on a local copy of the database rather than a
> > shared copy in DL_DIR should help performance and avoid some sets of
> > potential NFS issues.
> >=20
> > Which variable names did you want to keep? I kept the wider
> > class/public names the same and only changed things within the recipe
> > to try and ensure fewer compatibility issues. Happy to look at a
> > different version of the patch/approach on top of mine.
> >=20
>=20
>=20
> My approach was basically the same, but I kept the DL_DIR for the initial
> download for compatibility reasons. If it actually helps, I will send an
> update of variable names. Let's wait a day, what do you think?

My version keeps the initial download in DL_DIR?

Cheers,

Richard

