Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4F6C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 08:30:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.15981.1702024211589671573
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 00:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P/EDqzzC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c09d62b70so21561985e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 00:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702024210; x=1702629010; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vxAvGpDV40zA0+Z7DUC3e44x1pWIRfUBWxBZUpibb5g=;
        b=P/EDqzzCEnpx01D+Zsv+OdAP547SYsgAsXCqkqBy6UwWchbV1uucPHjHmC6+eK3NGh
         Su7EbPX5NN7WKl066hd/7a3RgzTXy4vgoj96wXdvbK10t07Zegns1t28r2W+5VNi5VYY
         vB7MXNVWDSfmDci1SZiiDDoI6+tpCkrUoRn8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702024210; x=1702629010;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vxAvGpDV40zA0+Z7DUC3e44x1pWIRfUBWxBZUpibb5g=;
        b=Pbo5JVWb5J3g2kKJrm7cI/z4ZDY4l22mywkmNaW4O/Dz5wTDzltv4VlBqYdu4YrA76
         hDb+C5AkvMmT2yGsu1cftqB7sFg0j1UHrNd+QEnFJ5M6+uZLS+2+586ZHpOOec6c+9mm
         jbm8H96PK/TRkgfaySQORImna2q3O0Ij1BhHiFc5qwyIp7SgTKmy7ArCYQOPzEzCskh3
         rVDvpUAT6cpgrqaX76IxuIDIpgiGIv9vwE+Wpeay23tg3fy5ooYLIm0oBkydSQPQn1Mi
         HyAtV7jDhYEOqlSOoRQRIRcXSv1R9EeLaUBRuga5CVi0nyfpvAg57Fy9HuFLrpSPIipT
         BqsQ==
X-Gm-Message-State: AOJu0YyCc+quSILZA9h4QCP08TudACAP5gknYBlV0vHmMrPsDe9+hgJz
	yVsLXiLtWzk3tYQHeUph6yPuh1uLCzwyPov5c6s=
X-Google-Smtp-Source: AGHT+IGmGlxhDdCoWFXOeLUPf3j+XX7XAgyYDonzqdseU52cd8R2s7FE8nFCxqep3kMnW+VqHbeYZA==
X-Received: by 2002:a05:600c:755:b0:40b:5e21:c5d6 with SMTP id j21-20020a05600c075500b0040b5e21c5d6mr1546923wmn.164.1702024209990;
        Fri, 08 Dec 2023 00:30:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b? ([2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b0033343804ec9sm1483156wrw.85.2023.12.08.00.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 00:30:09 -0800 (PST)
Message-ID: <c0a82bf2233940732a9086a08905cbf9dbadb86c.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 2/3] cargo: Move
 CARGO_MANIFEST_PATH/CARGO_SRC_DIR to cargo_common
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 08 Dec 2023 08:30:09 +0000
In-Reply-To: <CAO5Uq5Tc0Xqg9_+cefwk66hhBBXOPaLtkNFk0EEOiW2+y=ihPg@mail.gmail.com>
References: <20231207133913.443-1-alex.kiernan@gmail.com>
	 <20231207133913.443-2-alex.kiernan@gmail.com>
	 <58a265ee08706c7d5e0b9c5678dfbe44b63c96cb.camel@linuxfoundation.org>
	 <179ECD325A85AE45.16398@lists.openembedded.org>
	 <CAO5Uq5Tc0Xqg9_+cefwk66hhBBXOPaLtkNFk0EEOiW2+y=ihPg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 08:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192018

On Fri, 2023-12-08 at 08:23 +0000, Alex Kiernan wrote:
> On Fri, Dec 8, 2023 at 8:15=E2=80=AFAM Alex Kiernan via lists.openembedde=
d.org
> <alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
> >=20
> > On Thu, Dec 7, 2023 at 10:40=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >=20
> > > On Thu, 2023-12-07 at 13:39 +0000, Alex Kiernan wrote:
> > > > cargo_common_do_configure uses CARGO_MANIFEST_PATH (which depends o=
n
> > > > CARGO_SRC_DIR), but their definition was in cargo.bbclass.
> > > >=20
> > > > Match the other variables here and change to default values, rather
> > > > than weak defaults.
> > >=20
> > > FWIW "single value" class variables tend to work much better as ??=3D
> > > (which I'd call default value) since than it doesn't matter if the
> > > recipe setting comes before or after the inherit and the inherit
> > > position in the recipe doesn't matter.
> > >=20
> >=20
> > Ah, I guess that makes sense - for "single value" :append/:remove
> > aren't really useful, so leaving the actual assignment as late as
> > possible works?
> >=20
>=20
> And I've just read the bitbake docs and I clearly still don't really
> understand... its +=3D / -=3D rather than append/remove which are the
> things which are important here.
>=20
> > TBH I've never really been very clear what the "right" thing to use is
> > between ?=3D and ??=3D

For something which isn't a single value, you'd need to use +=3D or
append and that gets much more unclear. My comments were only for
single value variables as we don't have a good answer for the rest,
much as I wish we had.

Cheers,

Richard

