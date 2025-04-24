Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE3DC369D7
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:38:33 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.11953.1745491111135162104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eaQg4XMG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0618746bso5964395e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 03:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745491109; x=1746095909; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dg8kiU/86lq1kQq5qCTZ56Rhb7BGm/p1+Fu5w9xtXY0=;
        b=eaQg4XMGTF2yklkcmJsJZ2NzTAoMYx+SDYV1/zgO+J6QPWBM7bs6qHR9Cx/RqPw+uP
         ZGIwPaY0VuX15RFvdsHoczJ40LfixVlFRmnG0+2SooY+AKPc63m76dtwixS/wslqBjZF
         luhjl/C/o4GNdj0fN3NWnu+R620eE3VHdQBYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491109; x=1746095909;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dg8kiU/86lq1kQq5qCTZ56Rhb7BGm/p1+Fu5w9xtXY0=;
        b=TiRtQ3D/9mvqeEd6sLEposittp7lnhbkM3Yjd+kjL2Z0OBzhrIi3SpHO2SToO4dwbq
         drpFoFfVlnbbwP603Ev0McqFZGZHBx2f/Uruc8tZiS1a5pR9ZNSbdnVeAmb3RKnGK/s3
         VP1PXFyoJtI5EkArmnSAP5+1pNa9HbTadUZFxkJrclI1nzh4b7rh/LhpbnrzZfDH/Ece
         9OF/4LivMR/8btaxg+EWax7mNfYaNcBLIne3gCRZiJVy3pgPQTSJ6kBE96ecIR6UTF37
         nQ3p0Ibf8rrmCarLN8PH5rGgmmCHdlY3GMWP1lHh1PfQn3rQzG4gpJT/K7Ei4L4IhR8k
         zj1g==
X-Forwarded-Encrypted: i=1; AJvYcCXQn05H7OntN7ouFy3YXX14FrdgWQBR0ZEFOqVaGMMnuUw1UimLHlXMTjFhJ1J8MA+BBbDrRFfEzfgolH421i0aaQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZ7umEtNzJZkRjxRHo9kaNOpNjOGly5FHo22FjLyFVNJC2SVqY
	r+yGTy8VePQewZlY37wLDGLn8VJgPaqsxl8OIEGXdYx8WErNXjLguV9pfCb5/UM=
X-Gm-Gg: ASbGnctN3nD3EsqGSqYIB5JsSNBHB2Pm2a77mrqNu+/d4yuCkk5e0yAIfAwpTsK/C3B
	Igm00yMxuVpqM4cs/A4u1KVwYX89p34yAMG+OPeMBBZgwLrww9TQDqfn301S40llGh2mDu2yp01
	ptVi9TklWt+4EeZGsLnPMPyPtKFOmb+JbSOPq2VCeClAlfk6Kl5wR1ySVZhC4ruYXU+qZQK6mvJ
	sCSka87flitslIoN5fyi4bVXDslCwwWeZWJdE4AKsfQTZjncso+VS4ETjX1VajQJ1wnTWV7mCCZ
	BZXsqthDbbSXpchEf9mZWaG2m9IzTZfh1rCC7wNbwVqa1J/sZ30Z9iuHHdWtJg0Cw2vjZ9w9bPt
	ANzNGKAt6X0KDI6ZL49uNQSzIjK3IjA==
X-Google-Smtp-Source: AGHT+IHIRTpPMBbI0yql/yEJSRVvW0bRxW3nbBwv/ev0gTNoOmXNyqsRW4divucTuT+uHEKr5hic6g==
X-Received: by 2002:a5d:47cd:0:b0:391:2fe3:24ec with SMTP id ffacd0b85a97d-3a06cf561c0mr1561301f8f.14.1745491109128;
        Thu, 24 Apr 2025 03:38:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94cb:8780:19ce:62be? ([2001:8b0:aba:5f3c:94cb:8780:19ce:62be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d868asm15309655e9.26.2025.04.24.03.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:28 -0700 (PDT)
Message-ID: <eb42a301807d4974e32c359b715afe7d0ffba069.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa wic.py: clean image build dir before
 rebuild in test_permissions()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Thu, 24 Apr 2025 11:38:27 +0100
In-Reply-To: <20250407110946.47038-1-mikko.rapeli@linaro.org>
References: <20250407110946.47038-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215353

On Mon, 2025-04-07 at 14:09 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> The test builds images using wic and then with bitbake
> and compares results. This fails at least on aarch64
> build machine and multiple target machines due to
> pseudo errors. Fix by cleaning the build recipe
> build directory before rebuild.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/lib/oeqa/selftest/cases/wic.py | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
> index 4f5d43b5ee..55c655cd6d 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -674,6 +674,7 @@ part /etc --source rootfs --fstype=3Dext4 --change-di=
rectory=3Detc
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 config =3D 'IMAGE_FSTYPES +=3D "wic"\nWKS_FILE =3D=
 "%s"\n' % wks_file
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 self.append_config(config)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 bitbake('-c clean core-image-minimal')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 bitbake('core-image-minimal')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 tmpdir =3D os.path.join(get_bb_var('WORKDIR', 'cor=
e-image-minimal'),'build-wic')
> =C2=A0
>=20

Just to follow up on this, I'm reluctant to merge this as it will "live
forever" without people understanding why it is there. We really need
to get to the bottom of the underlying issue.

Cheers,

Richard

