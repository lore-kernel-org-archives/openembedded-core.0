Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60895C001DF
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 14:47:39 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.12993.1691160454408033475
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 07:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bxnjfb3O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fe1d462762so20632005e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 07:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691160453; x=1691765253;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QRVbCj4EAJQWA2FcQQ//ibG2qEs98PWOgvK4ztpNNuI=;
        b=Bxnjfb3Of+QR6mvhXi5NCr4yMgp5jzeNTBGFGvqDTnkzF5UvOv0XSOHcb/xVjU+iXs
         7eLwbwKBUYYcAvwGNpeoxRpapCHUShwHPXBXCz8TKEIh9+KJU+uENVT6vxaIwmq+spgC
         MlKi2/74piu6teCV1OG2bMIepSUA7TnluNyRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691160453; x=1691765253;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRVbCj4EAJQWA2FcQQ//ibG2qEs98PWOgvK4ztpNNuI=;
        b=HG9wTLkdM2AN7CnjcyTy9iBq8+mVI7WTS34q3XvDaEuG8GDyV6G9UH6eTSzk9gGRPT
         S/iL2MWlnxdO5+UWBwy3s5ipqQ2rI2uL2WME3m8gl3tBjQzC1QBZ2YlATef8u78bkgIR
         1YEslj9oX8Qy7cR4MfMJPjAHlfz5U4vDe69Wng89TD//FhZKaJNgUWZqVP5xRadoyIEG
         bisdYshOIHtmhp6r/jjQtlhXprdc/o2aKzz9RILJJpphGa071qUR/Zq1AV9ktIM8c3/M
         hE3TYPQ6aDiIxXyCCI0uoetQEWcTuTWVo0YlN1uTWHh4AKvQKuyhq86cx1atvusWVQfc
         v+5g==
X-Gm-Message-State: AOJu0YwDs4yvLRNUG8+8MBtLZcVMxw4o/QT9wk7vKtbv6Yw8dWsi6UPi
	DximBil2STMThpmIvkWqZbz2JA==
X-Google-Smtp-Source: AGHT+IHXwxwfhFZQkFaRwwe79OwxjA/U0khmnG4SOGGdj+kMFTE6SLuC1HxXbiVDNxrdj5E6yoyS0A==
X-Received: by 2002:a7b:cbd6:0:b0:3fc:5a3:367c with SMTP id n22-20020a7bcbd6000000b003fc05a3367cmr1683126wmi.32.1691160452739;
        Fri, 04 Aug 2023 07:47:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a3d5:6a38:64fe:7f6c? ([2001:8b0:aba:5f3c:a3d5:6a38:64fe:7f6c])
        by smtp.gmail.com with ESMTPSA id x12-20020adfec0c000000b0031274a184d5sm2678919wrn.109.2023.08.04.07.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:47:32 -0700 (PDT)
Message-ID: <aeed5cf0689586cedccac7d9be2b36d5f5d6c8ad.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] externalsrc: fix dependency chain issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Suti <peter.suti@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 04 Aug 2023 15:47:31 +0100
In-Reply-To: <CACMGZgazaZR1z4opzxwNNug-97DanqC6qciEzS+noshjQcsTeg@mail.gmail.com>
References: <20230731093415.261532-1-peter.suti@streamunlimited.com>
	 <fe958ac3d572d910e9f4eb861b18c4df40381a1e.camel@linuxfoundation.org>
	 <CACMGZgbCCj9jsTTxjVCZoU=1LPxmca5Gei_tKDgpKhxb+X2wog@mail.gmail.com>
	 <aecc7e66bc7cbc16c365c2432d4e850b938bc7e3.camel@linuxfoundation.org>
	 <CACMGZgbYY1HbmjLOq=FO2c-K+vJYb36Yay6sz48PrCtkFUWjmA@mail.gmail.com>
	 <fdc2b7c450443e11836df189b5a6c584c6024d54.camel@linuxfoundation.org>
	 <CACMGZgazaZR1z4opzxwNNug-97DanqC6qciEzS+noshjQcsTeg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 14:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185524

On Wed, 2023-08-02 at 11:26 +0200, Peter Suti wrote:
> On Mon, Jul 31, 2023 at 2:33=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > I did look at the bug and it sounds like if you clean a recipe, builds
> > of other recipes which depend upon it then fail?
>=20
> Well not just in this case specifically, it is reproducible when doing
> a clean build.
> But this is the easiest most convenient way to reproduce because most
> of the sstate can be reused.

Do you have a way to reproduce this using recipes in OE-Core?

For example, I tried adding this to the cairo recipe:

EXTERNALSRC =3D "/xxx/cairo-1.16.0"
inherit externalsrc

and then building cairo, cleaning cairo, building pango (which depends
on cairo). I couldn't see any failure.

> > We need to understand what is happening with both the sstate manifests
> > and the stamp files to fully understand this bug.
> >=20
> > do_prepare_recipe_sysroot of this recipe that depends on the
> > externalsrc one should trigger it's do_populate_sysroot. The question
> > is whether the do_clean removed the do_populate_sysroot stamp file for
> > that recipe or not? It sounds like it did remove the sstate manifest.
>=20
> I have checked the manifest and stamp creation and as far as I can
> tell that part is correct.
>=20
> > The more I look at this, the more I think changing the deltask is just
> > masking the issue and there is some other problem at play here which we
> > need to address directly.
>=20
> I agree, I have dug a bit further and the issue seems to come from runque=
ue.py.
> It seems that the current implementation depends heavily on the
> presence of _setscene tasks to build the dependency graph. Altering
> this behavior would indeed require significant effort and potentially
> lead to unforeseen consequences.
>=20
> > Unfortunately it took me half an hour just to be able to read through
> > the pieces of this and get far enough I could write a coherent answer
> > to your question. It is a struggle to reply to everything in this level
> > of detail, much as I'd like to :/.
>=20
> I'd like to thank you for the time you have invested in this issue! I
> appreciate the help.
> I understand that my proposed solution might not be ideal, but fixing
> the underlying issue in runqueue would be a real challenge.
> If upstream is not interested in this patch, I can also understand that.

It isn't that we're not interested, we just need to make sure something
else doesn't break. A test case to reproduce the issue you're seeing
would help a lot. Ultimately we should perhaps add something to the
tests in meta/lib/oeqa/ to cover the issue.

Cheers,

Richard


