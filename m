Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063E6D1812C
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 16:07:37 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.901.1728922055800612531
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 09:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LJ+0XJh1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43116f8a3c9so50364725e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 09:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728922054; x=1729526854; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q4C0mZkCB6IT7OEYLv+FGuqnTpJqON8G/vF+JRluHao=;
        b=LJ+0XJh14FVxEsIcycQLpakd0ByiyUlgjZDW6u9K/rBVNKAafZ3Ykr8lxiPGXpDw7F
         vnZnpkYDF5NuC4aozSJM3myzeF/nTbnX0nDujk9VYDIf5w+VFBjKEbgJK0Al2f0kbDLx
         7SK5ucFHRs7tBHfNsYARsn1KrMfLcyRehPbtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728922054; x=1729526854;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4C0mZkCB6IT7OEYLv+FGuqnTpJqON8G/vF+JRluHao=;
        b=VN41fYBb0npjfOiyvvbbem7O63u8P+X1N4zMZvFcUD70NMWFc2ir+VZrzkrj+c/0JD
         SCxxVS3BMeJvRLmkvM3JST/PiD9YQI/cdv0tBYpBbFdO342yNMdbGJL5a78HhzQmbpcX
         jnnY1IL+7DTkiONKqp9e2jMf3Y3k4PaBv4MiAe7cEppAWOhMn8JXhDyJRoYD2zj1q9OQ
         5Mc8jKMg+mVewuvmCPRdi9xQKzMkXS1Jx/0hTO7sVLlm35PpI93zUltVO0GzD0edjmZN
         BXfqW4U6wJlUqDT/5DjbeyO8jpLG2Z+uZAhnCSNzT+9D+/FxZUhGZVzp9oQwp2I0xE52
         9Adg==
X-Gm-Message-State: AOJu0YxgERXsXEkCtwiwHhLoTN1XRYe/eZGV/1eudrJNSxbbtF54t7Y0
	bu/WtV2Q4BMwq8mPlTKkdF3iu9FuH1B47f+aIj86mNJjq/HSN5H0eUIp7/3zVrg=
X-Google-Smtp-Source: AGHT+IHVAAO14NPaKB/sSMOk48upAQrdBDt1EWsFZb7bKe9H06afabexd1JzQaOCZYRwMa08UyTGig==
X-Received: by 2002:adf:fcc3:0:b0:37d:542a:7995 with SMTP id ffacd0b85a97d-37d5ffb63d0mr7570078f8f.34.1728922054017;
        Mon, 14 Oct 2024 09:07:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4468:7613:7612:e2d5? ([2001:8b0:aba:5f3c:4468:7613:7612:e2d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bcf50sm11705743f8f.29.2024.10.14.09.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 09:07:33 -0700 (PDT)
Message-ID: <08e6b15b245d20bcece798cac0ffbaa11c6be13b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check-update-nvd2-native: Incremement
 DL_DIR database location
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Marta Rybczynska
	 <marta.rybczynska@syslinbit.com>, Steve Sakoman <steve@sakoman.com>
Date: Mon, 14 Oct 2024 17:07:32 +0100
In-Reply-To: <17FDF275CE46F21A.4702@lists.openembedded.org>
References: <17FD60BEC9A54A4B.2207@lists.openembedded.org>
	 <8281d9cb51a5e652f99ed998fd71c7b6a84e1e63.camel@linuxfoundation.org>
	 <CAApg2=RmrYULa7KMi6EMdGAhW3-uVA81ggVJg5BGDMSg0M0nLA@mail.gmail.com>
	 <0092cbd5b19661f2c88084cc2c00811c7c2f6563.camel@linuxfoundation.org>
	 <CAApg2=R_F-YUiv23wC_ACZFNe590h+RGxJ4R=-n2uT_LE5rqFg@mail.gmail.com>
	 <17FDF275CE46F21A.4702@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 16:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205785

On Sun, 2024-10-13 at 08:26 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2024-10-11 at 13:24 +0200, Marta Rybczynska wrote:
> >=20
> >=20
> > On Fri, Oct 11, 2024 at 1:19=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Fri, 2024-10-11 at 13:17 +0200, Marta Rybczynska wrote:
> > > >=20
> > > > On Fri, Oct 11, 2024 at 1:02=E2=80=AFPM Richard Purdie via
> > > > lists.openembedded.org
> > > > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org>
> > > > wrote:
> > > > >=20
> > > > > I now do have an example of a corrupted database:
> > > > >=20
> > > > > https://valkyrie.yocto.io/pub/shared-failure-data/nvdcve_2-1.db
> > > > >=20
> > > > > I'm not sure why this is happening but the older releases are
> > > > > all
> > > > > accessing the DB over NFS which makes me nervous. We're
> > > > > seeing a
> > > > > lot of
> > > > > failures on the new cluster, hopefully this will help isolate
> > > > > the
> > > > > problem.
> > > > >=20
> > > >=20
> > > >=20
> > > > The database isn't completely corrupted, it looks like it is
> > > > partial,
> > > > however. What was the error
> > > > that you got in that build? Any or just strange results? I'm
> > > > running
> > > > a verification vs a fresh database.
> > >=20
> > > https://valkyrie.yoctoproject.org/#/builders/23/builds/238/steps/14/l=
ogs/stdio
> > >=20
> > > Exception: sqlite3.DatabaseError: database disk image is
> > > malformed
> > >=20
> > >=20
> >=20
> >=20
> > Managed to get the same error with the sqlite command line.
>=20
>=20
> I merged this patch as it would rule out a lot of things.

It looks like I didn't do this. I will do so, then we can rule out a
few things.

Cheers,

Richard

