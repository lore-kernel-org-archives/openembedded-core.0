Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF42CC47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 08:34:10 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.49808.1704357245878775729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 00:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HpDQEUiy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40d8e7a50c1so2735565e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 00:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704357244; x=1704962044; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hK2W5lfI4KJhHB4OEGLEmhmwXtLNKzBeDtC1a4i1vnw=;
        b=HpDQEUiygmZZ7H/UAgzxVGJMbfyyHKCXaiJF9/wvx4tIquAVzubqoCXMxmi1FIDFtt
         tKaZbGmeKnr4Hz4SGwCnB27jkAwOLVbbhotvjq9R3kBDGU7ScZLuR6tZZbUsv/+Z6O+t
         FcSwmzfR5i950bGit9JjCzk1uggHK6mQDvor8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704357244; x=1704962044;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hK2W5lfI4KJhHB4OEGLEmhmwXtLNKzBeDtC1a4i1vnw=;
        b=AQXuVrO9+FItd0Z8MEzMGBtFYsOrJezJlWGulYGbb6nzs6bZJuk44GOB5bT5ME4Ybz
         LTmEd1CgwySlJbsdDbA8fL3qwnz23g0W1Eoe8tjjDBa1jZrbtFbdc1pCYzSf/+c3CGcu
         won/tWmT0RLgK/FLboQY6mDqExT+631nSfox7eDr537KF9Qbo3+IAA4PUl3ZwSWfdtv+
         4AnX1whxOuPpQtSu4cSDBdQQ28Tds6G/ll1O0KC+QEPcWFh5K5Msg4XLtGZ3yySnxj3I
         4+pKgilpUAsW8ZSXEKbv38QzXtjDbIunmWAYR0hDhNYdjHa9SCUwKFz4HATgCLAfCvSd
         piIw==
X-Gm-Message-State: AOJu0YzhgALCg1s4yqvwXq333m/c9WkZ//x3MQC+DmvWDHpaLVrm58Ce
	i76icBMwrIaS9dRXbAtToXjcBqy46OB+Sg==
X-Google-Smtp-Source: AGHT+IEIC+g5yNlzT9fQMzBBuN00fWbMZw+xnmUxLKTwtWSdvJgTlYbL2TjN9zWunj6NIq/CMkMehA==
X-Received: by 2002:a05:600c:4e86:b0:40d:855c:ccef with SMTP id f6-20020a05600c4e8600b0040d855cccefmr131487wmq.22.1704357244287;
        Thu, 04 Jan 2024 00:34:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c49:db55:5c5b:1a5b? ([2001:8b0:aba:5f3c:7c49:db55:5c5b:1a5b])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b0040d839e7bb3sm4925814wmo.19.2024.01.04.00.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 00:34:03 -0800 (PST)
Message-ID: <65e32ccde52a50ae80b01b524a28909b59e2ea1a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] runqemu: match .rootfs. in image names
 instead of -image-
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, Martin Jansa
	 <martin.jansa@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 04 Jan 2024 08:34:03 +0000
In-Reply-To: <ZZZjQw77Qd1KSSUN@nuoska>
References: <20240103101615.1874481-1-mikko.rapeli@linaro.org>
	 <CA+chaQcd4MKK_KMdmpEqCtMLZVGx_MCP3y5sVhteKdzDQnNPKg@mail.gmail.com>
	 <17A712B42F330FC5.10454@lists.openembedded.org> <ZZZjQw77Qd1KSSUN@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 08:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193307

On Thu, 2024-01-04 at 09:50 +0200, Mikko Rapeli wrote:
> Hi,
>=20
> On Thu, Jan 04, 2024 at 08:59:03AM +0200, Mikko Rapeli via lists.openembe=
dded.org wrote:
> > Hi,
> >=20
> > On Wed, Jan 03, 2024 at 03:54:02PM +0100, Martin Jansa wrote:
> > > On Wed, Jan 3, 2024 at 11:16=E2=80=AFAM Mikko Rapeli <mikko.rapeli@li=
naro.org>
> > > wrote:
> > >=20
> > > > Don't expect image file names to include "-image-" but
> > > > expect them to have the ".rootfs." postfix which is the
> > > > default.
> > > >=20
> > >=20
> > > It's the current default, but whole runqemu won't work when someone c=
hanges:
> > >=20
> > > meta/classes-recipe/image-artifact-names.bbclass:IMAGE_NAME_SUFFIX ??=
=3D
> > > ".rootfs"
> > >=20
> > > So you should probably read IMAGE_NAME_SUFFIX variable first, but the=
 most
> > > likely change someone will have in local.conf would be to drop this s=
uffix
> > > and set this to empty and then the check for empty string in basename=
 won't
> > > be very useful as well.
> >=20
> > So drop this file name check completely? Fine for me. I'll send an upda=
te.
>=20
> As you said too, this doesn't work. runqemu has a bunch of heuristics to =
detect different
> kinds of file arguments which break too easily. Test for .rootfs. in file=
 name is IMO
> better than than -image- in recipe/file name, but also not perfect. Using=
 IMAGE_NAME_SUFFIX
> would be nice but the indirection with qemuboot.conf makes this hard too,=
 and if that variable
> is set to empty then a lot of things break again on runqemu side heuristi=
cs, gah...
>=20
> I have a dm-verity image recipe and a separate recipe which bakes that in=
to a .wic image
> file which I'd like to test with oeqa, testimage.bbclass and qemu.
>=20
> It's either this patch or I rename all image recipes to have -image in th=
eir names.

You could change the check to check for -image- or .rootfs. ?=C2=A0

Not perfect either but might be good enough...

Cheers,

Richard



