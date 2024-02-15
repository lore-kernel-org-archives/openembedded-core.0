Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17680C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 23:02:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.5976.1708038158458087282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 15:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SZggHtX/;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso911265e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 15:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708038157; x=1708642957; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6wguXVT+rsaPmeh23XdGb69T2Tf2uJNKQTglevmuNU=;
        b=SZggHtX/tVd++0U2bK0so8uJENeO5EtnPV39m1R8KOHZ7CRnaRPbwb1ZHWgY1FDF8r
         xHNDFImDLEpag6nfrIv/yJ2KHouLdJcKW+pGLK6DI7bh4K730zx+0AvwpzkfwgPStTqo
         LO5XD1/Oi2Crbi7FSFx6eyUSz/TVSGvoZCBr000w/uQHUbBHYXDQ/Sd0VXHpzAR7RQo/
         AnUc+2EyHd4PhJNbAjzh7HUKOSnKNBYEIQJN4x2blNrOqpgCXJvJcEFIClQRgi3VfN6P
         wAwRmGcE348Jhi93fV8KXnF/aNXRhLYEk7odFZlkUibSlTIArVpWptZXb5A4nVC+7Xlq
         Ocgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708038157; x=1708642957;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y6wguXVT+rsaPmeh23XdGb69T2Tf2uJNKQTglevmuNU=;
        b=dcJpX5k7sIXIgNLdDvvGbGZWBIRJzhhJgU9biaB1agboPr0x7xudHAa1dLoBR069Yx
         L/2Yux/Yd42Et26nEIK+/cc6gHPXW21WZ7EUrw1Wk2H1WW2S2XcvpG9ZaiU3ux2KRE0y
         YfrDD9juo0QYfr57sHhU59Lr2oXnVMAi7xlwyNALiGXiFSWLn9+I3LN9UrV4YrdpgK8A
         kYE4J2F3veMe6stI2DA76/BNDXGv5ZbcSobTrXEqf+FG+gxsB0q0a/C6I46c7Omris/l
         UvH1fvjZdKJ8yL34+6yPARaNseOxOXne5aXctuB8NCVMPF5OetthD3VyCHUEPl1mYWUy
         drCQ==
X-Forwarded-Encrypted: i=1; AJvYcCULWywXNzC/ntwFxi6ieK9zAx/rKRp9T3WnlX0KVggWwxsOWyM6TXk0KxduZcV5yQiBQuJpponwSZCy/5Ji/nK04RWD89Jqg3phB1/XGPc/0ph6vBAy72G1
X-Gm-Message-State: AOJu0Yw0p2PKz1OMOVmXGH6Ira7Jg/DCDI5h4nVhYn/8P81T7CyThS1p
	m+IHYefT4ea+pdhhPXD8Fyc0JTRvyJIk0BkV4Cuj4BzPQG4a3uuCUHBdTty4XzU=
X-Google-Smtp-Source: AGHT+IEjV/12q9ow8lpOS2Q8RPNY8rytLJlUcXikkszMaAQG85lzAncXt2VnQ9NDUuyXAb4FJywadA==
X-Received: by 2002:adf:ed90:0:b0:33d:14a7:c4b with SMTP id c16-20020adfed90000000b0033d14a70c4bmr959755wro.40.1708038156724;
        Thu, 15 Feb 2024 15:02:36 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id g1-20020a056000118100b00337d5cd0d8asm406740wrx.90.2024.02.15.15.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 15:02:36 -0800 (PST)
Message-ID: <be56443580c80e21a38635e8b2316e8d22445726.camel@gmail.com>
Subject: Re: [PATCH 1/6] devtool: ide: Fix topdir exception for fallback mode
From: adrian.freihofer@gmail.com
To: Enguerrand de Ribaucourt
 <enguerrand.de-ribaucourt@savoirfairelinux.com>, 
 openembedded-core@lists.openembedded.org
Date: Fri, 16 Feb 2024 00:02:35 +0100
In-Reply-To: <20240215170422.659073-2-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: 
	<20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
	 <20240215170422.659073-2-enguerrand.de-ribaucourt@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 23:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195728

On Thu, 2024-02-15 at 18:04 +0100, Enguerrand de Ribaucourt wrote:
> An exception was raised because we did not have the topdir attribute
> which was used in fallback mode (non cmake/meson recipes).
>=20
> Already in the merge queue in Adrian's latest patches.
> ---
> =C2=A0scripts/lib/devtool/ide_sdk.py | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/scripts/lib/devtool/ide_sdk.py
> b/scripts/lib/devtool/ide_sdk.py
> index 3986dc1436a..db2e95616be 100755
> --- a/scripts/lib/devtool/ide_sdk.py
> +++ b/scripts/lib/devtool/ide_sdk.py
> @@ -366,6 +366,7 @@ class RecipeModified:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target_arch =3D rec=
ipe_d.getVar('TARGET_ARCH')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.topdir =3D recipe_d=
.getVar('TOPDIR')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.workdir =3D os.path=
.realpath(recipe_d.getVar('WORKDIR'))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.topdir =3D os.path.realp=
ath(recipe_d.getVar('TOPDIR'))

I think this patch is not needed. Two lines above the variable is
already initialized.
Some time ago there was an exception but it is fixes on master-next
already.

> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.__init_exported_var=
iables(recipe_d)
> =C2=A0


