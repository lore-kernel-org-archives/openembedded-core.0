Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6D1C636CC
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 08:19:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.25334.1675585183266252801
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Feb 2023 00:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ck9lIKvQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id bk16so7886378wrb.11
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Feb 2023 00:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pXdp7Dy9NxY7DCqAFfu3KX9yiRA/85cHrHQJtmNuSCc=;
        b=ck9lIKvQ676Ex3/MUY9h0aH13dW9B95Lt86/FGnGqgje/jAikHcnXSRJRmNQcrqxuc
         8fm6TmtEiLc1filHY9eQCW8GWim3AUSdso9UstLj179b0cekXtsC6PRHgOVKmSoDqvxC
         +Odt3kCxp9Spog4O5/CJxdzVAXgvV4ARcadYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pXdp7Dy9NxY7DCqAFfu3KX9yiRA/85cHrHQJtmNuSCc=;
        b=3kCc+qvgUpJFiKtXqNaHXcGZxIMtvfSNNe/cVnGa+tY3+3496glqqEjXq+Re8pgq1o
         KkpIAIe+WH4vUecNFlTo9BcMTubDsWa0CgiPIh9I5oX9ogheBiLeGlGV/gp7RxbjHfp5
         U94vWDId5znpU4ll8bwpVaaX/fT2oo+6et8K7ra6b7xsbJ0z4YkPADgZA4sJB2mmhvPB
         o3ZsdR0qeMF+5Qw5L5nCF7ltYjJ1RQsVzvY4n3AKL4Qb3gnpyflQHiQlOLHnS42D3/tN
         VNNnJNWA6KACsuEQAtniiVRY9ExkeEKDI81pFLOrmKkEqjlbcbZ3oJX2bnItrQBATe3+
         5QEA==
X-Gm-Message-State: AO0yUKX2MDaZ0Hp+hv6rn1Y0fBSDpGczXvW4OXM/ydl3Y5YWfJ6YQ0X1
	9/kPMxTMPYWPPrMXxmX/EMRp5w==
X-Google-Smtp-Source: AK7set//o+ZxLd5AiBQDIYUN3GuzCxC1ge1mysmmBS+W0qjQC52tL0WkgbiejjsMkuZoEgpJ3tx21w==
X-Received: by 2002:a5d:40cd:0:b0:2c3:dbb0:7260 with SMTP id b13-20020a5d40cd000000b002c3dbb07260mr4771467wrq.71.1675585181289;
        Sun, 05 Feb 2023 00:19:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:512e:205c:f28a:2b5b? ([2001:8b0:aba:5f3c:512e:205c:f28a:2b5b])
        by smtp.gmail.com with ESMTPSA id v1-20020adf8b41000000b002be505ab59asm6214933wra.97.2023.02.05.00.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 00:19:40 -0800 (PST)
Message-ID: <9694c842607a8277502f2c1023938b6bca14c410.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] libc-locale: Fix on target locale
 generation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 05 Feb 2023 08:19:40 +0000
In-Reply-To: <CAMKF1srgXYOdpErkN9Wjcma3CzbA+Nd6NykdEHCBG-pvS6YTyg@mail.gmail.com>
References: <20230204114133.1178502-1-richard.purdie@linuxfoundation.org>
	 <20230204114133.1178502-2-richard.purdie@linuxfoundation.org>
	 <CAMKF1srgXYOdpErkN9Wjcma3CzbA+Nd6NykdEHCBG-pvS6YTyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Feb 2023 08:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176783

On Sat, 2023-02-04 at 17:07 -0800, Khem Raj wrote:
> On Sat, Feb 4, 2023 at 3:41 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > If on target locale generation is used, it fails at first boot showing
> > errors about a missing directory. Ensure the directory exists.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes-recipe/libc-package.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-re=
cipe/libc-package.bbclass
> > index de3d4223a8c..8a99f73ae72 100644
> > --- a/meta/classes-recipe/libc-package.bbclass
> > +++ b/meta/classes-recipe/libc-package.bbclass
> > @@ -51,6 +51,7 @@ PACKAGE_NO_GCONV ?=3D "0"
> >  OVERRIDES:append =3D ":${TARGET_ARCH}-${TARGET_OS}"
> >=20
> >  locale_base_postinst_ontarget() {
> > +mkdir ${libdir}/locale
>=20
> should it be mkdir -p for when it does exist beforehand ?

I wondered about that, then I wondered about portability with a minimal
busybox and decided libdir likely will exist...

Cheers,

Richard

