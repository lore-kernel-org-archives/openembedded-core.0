Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FC9C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 13:17:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.30257.1750079820593085463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 06:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LDsF+8Lw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4531e146a24so27807995e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 06:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750079819; x=1750684619; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFGPMk9d9KBtdavDjn2jBe2lOf9kiNYSSZqvxQCFJpg=;
        b=LDsF+8LwP7GZ8Za+p3Imbw5QAgVTxWEIKRavLdPgoo9APfu1GkaJ6CwvpQetXiLCkL
         CC1oZ3wpvlnHBw7RUcm9QHcETCk/FIXvI0u1oNIvELFNFl/c7b6ibmz7Czgtc9qkzoBz
         xbYeV5CbmyenD49qerBi6+ewKCgJUb+BK6Gz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079819; x=1750684619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kFGPMk9d9KBtdavDjn2jBe2lOf9kiNYSSZqvxQCFJpg=;
        b=gPJz5rIFFV0W76x6hpXoIuVDO1tW16C8iV3niI7ofTNrfRuElI2mbI2u/e4Lsstele
         PhnemaaCjGNCjOpVJ6NGQhT9tpv4yvKNNdZLuY9kkp3NOvb43JaPtrTF/ywZbPILFjIq
         gq4qvRIpIx1ogubrGNA1Z841NVNeXgrJ5FhdC1Z3xKMKNWzX64Vgxj8EItf0IjdOxmLO
         1I5XgU1C+JfKuvfJogDQwhbVX+BgsZND/ILHDOFug/v8g3g7LIpp3vT5KokRVg6nW4V0
         pIMbRnsx1Cr7wf1OmY9q3PGRNW/Ic/o+xjIZAK2LoIeU36VwSpXYrAfNr2c3LJSHhWm5
         yjxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPMhfLIkj3ywFHzzkshtvMW7/XR8LQMPMK0WexW7zmIqgqNvamhvv410dY5N7zq7GEiOi6TVq9aYrHs0R2FJGoJg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyMihbT1gNWn5NleJcIzljI6RQsTc0l3qMZeYUizrPQlHpWM9Cu
	MgQ31aUW9RKjzZcZHRTHGg6O20HmhO/yQFFmAPPu6D1I0MtXOw+VCfyDwN4lRdvlMvH2E16ek1+
	fOabCw2g=
X-Gm-Gg: ASbGncszIrv5mHvGPSsoQXpygwgwX7Bds8UFDmmOnxZhNDep9dTM8s0m6LmZql5Ss4y
	7oojmr2CAlOeGf3PJAipSZAvyL+47+3OU660OsPLauUGnF64csFmRJBRA2eV5bwUn3hckCJ7sXJ
	hdAwkT/3xckyPfQAs1LcatjwxMtel+lFRsDicCdyhCNtUX5UTlLyu0psr+OcY/KOGQlM3kUL7kR
	g3Pl1BuVFXyebSnsUVhmOEXOisolIYyyElKh+0/daf/1ZHPGloqpgSozZHBoWXnxjR52+X82kyV
	+BkJHxXlMc1RhwSe7t0gO7Y2iZFwgLP9Il4gatSX5ZNf1IPQZHXMHEkr9Xtl9OzIJ5oqhMCkVz4
	wzwFz9PMYeksptFmTPjrdLByYCn18BK+cowiuvB/mT8frvcN7
X-Google-Smtp-Source: AGHT+IFsZIx3ZMlGDDMHAJ6baM1VVRiLbBnvKRENZTu0snqCp69qbs3DeGGRS6HUg18SCvHfDd0khQ==
X-Received: by 2002:a05:6000:240e:b0:3a5:2875:f986 with SMTP id ffacd0b85a97d-3a572874a1cmr8430358f8f.44.1750079818769;
        Mon, 16 Jun 2025 06:16:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a03:fc99:2a4c:41a2? ([2001:8b0:aba:5f3c:a03:fc99:2a4c:41a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a578f3ba84sm6990094f8f.65.2025.06.16.06.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:16:57 -0700 (PDT)
Message-ID: <308f4e2f2526b5412987367d0530200cc2616c39.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic: Avoid problems with "-" characters in
 plugin names
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 16 Jun 2025 14:16:57 +0100
In-Reply-To: <DAN5WJ6PQEEP.2UZ3G1EW9VOZ2@bootlin.com>
References: <20250613164642.1614047-1-richard.purdie@linuxfoundation.org>
	 <DAN5WJ6PQEEP.2UZ3G1EW9VOZ2@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 13:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218824

On Sun, 2025-06-15 at 16:04 +0200, Mathieu Dubois-Briand wrote:
> On Fri Jun 13, 2025 at 6:46 PM CEST, Richard Purdie via
> lists.openembedded.org wrote:
> > Remap "-" characters in plugin names to "_" so wic plugins
> > can be extended using standard python class inheritance.
> >=20
> > This change means wic files can be incrementally updated over time
> > to the correct name rather than breaking everything. Actual plugin
> > module files will need to be renamed as done in previous patches.
> >=20
> > Also remove a double call to get_plugins() which isn't needed.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
>=20
> Is this patch to be applied with the ones from Anibal?
>=20
> In any cases, with or without them, I have build errors:
>=20
> > ERROR: The 'bootimg_partition' --source specified for /boot doesn't
> > exist.
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/1848
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/1849
>=20
> Or am I missing another patch?

You need a mix of patches, some from Anibal, some from myself. I
believe master-next has the correct mix of them.

Cheers,

Richard

