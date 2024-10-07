Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0202DCFB44C
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 16:44:55 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.58259.1728319485426028054
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 09:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RVg83oFj;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9953bdc341so161008566b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728319484; x=1728924284; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g4xTp+8gG5oD1v+WlkbWvOLI/S7FfWyHtRrXjodFpBw=;
        b=RVg83oFjeronMhMTQLr+tiqKU4dTLjaxF0rCb9q+wkK/nmJM8xpEkxoLRlG1HyaX9q
         VtlVYJrrL8iIORNIanhysNJCd/GemOvWme8jUUuCu+kjzZjMt3fRkLH6qyptz5vr9gxa
         2HGagRt1KYjwA8MmQ1n3LbVtdOTQi1eHyyJGYGpvwwCvCAFwMIQsCv/8Iq+DZImf71Zr
         8OJO9794dAO84vtkEZEdwIjEP8PJutz2Vy/4Pr1PmtP+ZYWk0clmH5pg5NVX0G8ZyRO+
         0FdnZDHfmzaFw+dvXvOuDhB/RSvela8uyfcH6LSV7GVGhUpBSyaw7i8fa7acBFwfmtZW
         xgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728319484; x=1728924284;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g4xTp+8gG5oD1v+WlkbWvOLI/S7FfWyHtRrXjodFpBw=;
        b=AL8NHbevIRVVpkd0UWQ1MBH33r0hALR/PjcDRZImfn4XPHGqxsBtS3wPpuz4StBGUD
         Dukrr1YwOrAxSh6JGI0u3PWYZDAIfNiWUGlr4kF3inna1GtgxBUziWSEmH+8/oNJvsMr
         fWMj+Q/hXSXEbGRHNn5a4TfpuTpIZOaY4+2zfoMT6kTQhDNZ7OXppJVs7Nbrn8ODUAO9
         HbdNWeMQKUVEBtwhCpO1XukLhVlyl+YDu/FHi8RdCN7Oc702g53g/0mmRCLT3uHi7i9H
         JFqNWijVLH3qosz8O9EZPUqrN2PIA+9PJRuGxmPDjvHQNKw3Pczli1Q+QHDaqyzLfkoO
         KYug==
X-Gm-Message-State: AOJu0YxAwLyZIz6dEKJuZlcde5R/79Q8/3bTbTDBHbekZGalERxSy4rC
	QNxcD/xSoRsO6tTwQT+tIiEJjq1BIKUILUTSTK6iCEzzUZAa4kBH
X-Google-Smtp-Source: AGHT+IHqX4OJr6qwAOGboj1coj/fhbmYeeETtV9OCJXqaVw2mn0SJ4GUhUkKWqZe8N3f0VaSMEkFzA==
X-Received: by 2002:a17:907:9693:b0:a99:3d93:c8bc with SMTP id a640c23a62f3a-a993d93cc22mr990588366b.13.1728319483487;
        Mon, 07 Oct 2024 09:44:43 -0700 (PDT)
Received: from [192.168.1.70] (0x57346aa5.static.cust.fastspeed.dk. [87.52.106.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e7b19b8sm398584766b.154.2024.10.07.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 09:44:43 -0700 (PDT)
Message-ID: <d8021629e7cdebf344d0dede6df7b2434d9e8d7f.camel@gmail.com>
Subject: Re: [OE-core] [master][scarthgap][PATCH v2] lib/oe/package-manager:
 return early in install_complementary with empty globs
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Oct 2024 18:44:41 +0200
In-Reply-To: <B2022D2B-92A2-4F5B-87AD-8050522E768D@arm.com>
References: <20240926204001.2245184-1-claus.stovgaard@gmail.com>
	 <409E410E-1DE7-4294-898A-AF1841D6C3A4@arm.com>
	 <e71402304dc8ca3e5e6fca4ad0e3a554b3a58438.camel@gmail.com>
	 <B2022D2B-92A2-4F5B-87AD-8050522E768D@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 16:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205274

On Tue, 2024-10-01 at 09:21 +0000, Ross Burton wrote:
> On 1 Oct 2024, at 08:52, claus.stovgaard@gmail.com=C2=A0wrote:
> >=20
> > On Mon, 2024-09-30 at 12:33 +0000, Ross Burton wrote:
> > > On 26 Sep 2024, at 21:40, Claus Stovgaard via
> > > lists.openembedded.org
> > > <claus.stovgaard=3Dgmail.com@lists.openembedded.org> wrote:
> > > >=20
> > > > Return early when globs is either None or an empty string. If
> > > > globs
> > > > is
> > > > an empty string from the self.d.getVar, we should skip the
> > > > reset of
> > > > install_complementary, as the result from processing with empty
> > > > glob in
> > > > oe-pkgdata-util will always be 0 packages to install.
> > >=20
> > > This isn=E2=80=99t right: if the globs are empty then we can skip the
> > > processing of the globs, but this function also contains the
> > > locale
> > > archive generation which is then skipped.
> > >=20
> >=20
> > Oh yes - you are correct. I focused to much on the top part, and
> > the
> > with loop, so somehow it slipped. Nicely catch.
> >=20
> > I see 3 options.
> >=20
> > 1) drop this patch, and keep doing the extra work.
> >=20
> > 2) invert the condition and move the with loop in under this
> > condition
> >=20
> > 3) split the archiving out in seperate method, and then call it
> > after
> > install_complementary the places where install_complementary is
> > called
> > from. This option is what I belive you refering to below.
> >=20
> > What do you think is the best options?
>=20
> (3) but moving the logic somewhere so callers don=E2=80=99t need to be
> updated would be ideal, if possible.=C2=A0 (2) if not.

I looked to see if I could move the generate_locale_archive logic to
somewhere, where the callers don't need to be updated. I could not find
a place where it would fit, so I will send option 2 as version 3 of the
patch

Regards Claus

>=20
> Ross


