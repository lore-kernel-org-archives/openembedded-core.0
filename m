Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DAD10854D2
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 17:22:13 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1559.1773940931976771012
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 10:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ani+TqjC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso730773f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773940930; x=1774545730; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMeUMvnlELCxV91UMJ3eWCiG2nusVDZC8MUfixObbu0=;
        b=Ani+TqjCAArlG9ZnX/lpDDQ9bmRvLhSODQwYvAZBVkNlqj+dj2WSvZCWbXVleFrA/n
         8wjpMbtDgaOkY3MInemFtLwMozgoa3PAxBigqGTKxUEXi1CyJqUskFb8cTKNw+ycjbiK
         kTmm5Aq8rtHH8LmAFJfu4DG+vZJ+Gftok8jOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773940930; x=1774545730;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zMeUMvnlELCxV91UMJ3eWCiG2nusVDZC8MUfixObbu0=;
        b=CsgKi9Em6S2lHTqfDDnz3EYHO/K7+5tZEATj4GuQvqov0mOaIx3jcmhIstGNFe5XXe
         XPng07/h6BVSWVRb4mVGYIEq909wsW1GflhTggkfq4R5gjUXbfG7YlEJZMO5xuyvpLl5
         B5rfcUzj7ctj+Q+aeJTPQ2dZ/HyAkfuPkKD+ic1tq+8uBt7ZiteA2ExO4buyvtzurUlF
         RM3jI7gDvVF1nUsPKXm+S4/qmEWdcUQbzqu5nZUL26f3n2FpKYyvHybLsXaxdD4YA+US
         XQc4qS0DeCzvbF+OUp3MDj+n0rXYC7G1WY1iwZWl7s9bwCJYst9Errs5CAujknhDYumv
         WCtw==
X-Forwarded-Encrypted: i=1; AJvYcCWu6qkzyl/AtRS909Fb8co1Tu/lj8sGYR9FByG2d41z1+aPaotZSKtZnV9PvdfGDOZV2FMoUmnUdfamZHECjs0iEQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzqmuVNW8f9cl/GFj8gM7YcnDA5kREEOzUQz8fj4Kox0w7DLfK7
	gooWiHqHuyvEn0xjLEaiYFrI0cyRgPOcgE5hstSGYw5Jdw+liGtvVIv+OFBFrDeNlOQ=
X-Gm-Gg: ATEYQzydBEU0mYnmV169hYFRAOkQNFXEB5sjZyp+jrDeg6VivN+Es4v4/GB111uZPhl
	PnJtHcxXSoIjDaCcxrClDWtJidxhLNzm+tQF1gMiU/e9CwzO9F7uZRh+stDALZU/LoO9I0vAa9S
	Hn7klgDW2PU2h3HqiY0810eWCgu/Mk9zwoLyTX2Z05+lLh8x0Yb11HBSyhfMQ5cM4aZYwoxx4df
	qlwkN5fMBKx/hd8TaqfD53y++AW/vKEdDkoRbDSPaGHgR0sveto4mOSdD9x7SqSUcaXy390ZyIt
	2NOp3YCkH+M9TVlkz0TFIhUetKTXUoJWY7um/b4wpbEAe4MsGo0CQN4ot39TLKzepkcvvLC28pL
	/k6fA1n3uFUK4spCOHfy7V+MHvrP0VZYu7gn7902OVnGZfxYU0u4Kuogumq1b0hZw7HLB5EMXeJ
	DGJlrqIu358VdAL8pxpo3bU8BBQKFMXxI1i2WdiCKU4GQ3x/gVMNde3pEKYx0Yl0boJxH9C57YZ
	K7bxloY+pOAvKw=
X-Received: by 2002:a05:6000:18a6:b0:439:beee:43b5 with SMTP id ffacd0b85a97d-43b6423d90bmr282195f8f.3.1773940930240;
        Thu, 19 Mar 2026 10:22:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ff93:3918:cd96:9fb9? ([2001:8b0:aba:5f3c:ff93:3918:cd96:9fb9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae37dsm144485f8f.2.2026.03.19.10.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 10:22:09 -0700 (PDT)
Message-ID: <e19c06100adcdf3d6dd18f7fe1e4201ea3cac494.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/3] patchtest: add --error-on-failure option
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: naftaly.ralamboarivony@smile.fr,
 openembedded-core@lists.openembedded.org,  Trevor Gamblin
 <tgamblin@baylibre.com>
Date: Thu, 19 Mar 2026 17:22:08 +0000
In-Reply-To: <20260318161209.54396-1-naftaly.ralamboarivony@smile.fr>
References: <20260318161209.54396-1-naftaly.ralamboarivony@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233544

On Wed, 2026-03-18 at 17:12 +0100, naftaly.ralamboarivony via lists.openemb=
edded.org wrote:
> From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
>=20
> Add a command line option to make patchtest return a non-zero exit
> status when a test fails.
>=20
> This keeps the current default behavior unchanged while allowing calling
> scripts and shells to detect test failures through the process exit
> status when explicitly requested.

Is there anywhere we rely on the current behaviour?

I'm wondering if we shouldn't just change the existing behaviour?

I'm not against an option but adding complexity if we don't need it and
can just change the behaviour might be preferable...

Cheers,

Richard

