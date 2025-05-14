Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1280C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 18:55:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.110661.1747248937865905354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 11:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B66xIKAc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso1360235e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 11:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747248936; x=1747853736; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2vYHiFhq1wn4dhyzuPfKq64a0ClAAMegBKaBN6BOPo=;
        b=B66xIKAcH3u/ELxDj8zwH37g4YdEQy4cOHrYEvfA+1HWn0GoUHczKY2GfWtEZCIVUr
         k8NJy55zkOJ4tON6zkOCRDzSWmVCFhhov6AhxgHcwO1d2REXfqrlc/zeFk9AMP5/RQUM
         TGaqtD1LY/RqIP4lR05KyJOPh9aukB24gcmn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248936; x=1747853736;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2vYHiFhq1wn4dhyzuPfKq64a0ClAAMegBKaBN6BOPo=;
        b=aOGCR/UR6HEgEldzbdygWV/LBlTDHzTv5I6UaD69XssH3vKRLzM9QYuodVK1kysu9I
         gfCd92m0fFoIuksGtt0MwXF0NXJqEGQ0T7zf5Dl+2ABaiBHGuofNh4JUN1yF65wKrT4w
         BQoSUwaWmL8z/jbN34Jl54yJ7N6fzzUYHsLBwaFiedkNZXoVIUUmciv5wu8KQmFHf7oy
         Cq9EBD6g0XkFQQPXdcGEytnP49MqiL+iTPvjkHFS3SK2U0wOdNJWbwmhGggxTFZYdO8A
         M+WhkYHuRoTqduzqypqfVRydCRQVKdlYkNMXmhLHWuOwaGFS5XY0C1fRw/oD3cKlbtRq
         RSEw==
X-Forwarded-Encrypted: i=1; AJvYcCVF+MpzWoKBE3AHstM6khWLnh5fIVqiGa25BW+hn3Z5reqZHon6yTe9YAeU+aIn0oTlxBHOJloVizjv9nL5xY7yEA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/NKb7x9xc769N/Pqky/tCMWb2BnAZxtO2omnmum47Oe/13X+s
	Nx0ehrjbUZC1Mna2ORIxluK2mKwiiOjJ7uhpOuFo93dA6DZzC1GOnJkzxpxdrGs=
X-Gm-Gg: ASbGncu5KzM1MCfgvw/uNTXpJC/1UKr9pTwM9AhawsW2XrwtmwQDQRK8rd0zTxzvBAu
	ct2IyT10oNXIGyAKD3lRAV06xyxGhiUwzdWSnW5bOvm/ZCBuoidxsUxsF6HZSK/5Xsxfnd2uVeI
	N159pknKUkTSb4LSxuLa7qH6/AwQY9LeAl6DUGLXtv1CWBgmsHmNTDxMaJOgdL76LpwHBXRwmAY
	yXvwRBEMnzUjLxgyUTh4BFq+lamykkxLPnAMjb35tpJakxEsAwUzF7O9MHggOww4DNPM/2fIt1o
	zv+ukCJ1UksHJ94/22kidEOxox4Ay5uXDyLOtbeuJJ6a0Pf7ijjrKHmucT7p0nSBwU6VEA6hRsB
	wRv0sLP/LPsG7jWGrAHf61dDQULlPUN5RFXis2Co8hA2SJDNsAWI=
X-Google-Smtp-Source: AGHT+IHtpDeAbl1ErsKpwv4hPsgrrJ9CsXZxwhga3yd+fVpIf9VHISd2qJRG3VfLnBasre25bw33JA==
X-Received: by 2002:a05:600c:83c4:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-442f20b99d9mr44566645e9.3.1747248936263;
        Wed, 14 May 2025 11:55:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34? ([2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e851bsm41584055e9.28.2025.05.14.11.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 11:55:35 -0700 (PDT)
Message-ID: <362164cb5bc93654d4960c1dcdd7953a57b16344.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2 1/2] dropbear: switch url to mirror
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2025 19:55:34 +0100
In-Reply-To: <20250514184610.97465-1-peter.marko@siemens.com>
References: <20250514183336.84167-1-peter.marko@siemens.com>
	 <20250514184610.97465-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 18:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216547

On Wed, 2025-05-14 at 20:46 +0200, Peter Marko via
lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Main download page is currently unavailable, switch to mirror listed
> in
> README file of the dropbear repository and release tarballs.
>=20
> This is to allow upgrade due to CVE, it should be reverted later or
> maybe even not merged and feed the tarball only from Yocto mirror
> until
> the main page is up again.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> =C2=A0meta/recipes-core/dropbear/dropbear_2024.86.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/dropbear/dropbear_2024.86.bb
> b/meta/recipes-core/dropbear/dropbear_2024.86.bb
> index be246a0ccd..3b54542490 100644
> --- a/meta/recipes-core/dropbear/dropbear_2024.86.bb
> +++ b/meta/recipes-core/dropbear/dropbear_2024.86.bb
> @@ -12,7 +12,7 @@ DEPENDS =3D "zlib virtual/crypt"
> =C2=A0RPROVIDES:${PN} =3D "ssh sshd"
> =C2=A0RCONFLICTS:${PN} =3D "openssh-sshd openssh"
> =C2=A0
> -SRC_URI =3D
> "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2=C2=A0\
> +SRC_URI =3D
> "https://dropbear.nl/mirror/releases/dropbear-${PV}.tar.bz2=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-urandom-xauth-changes-to-options.h.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/init=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/dropbearkey.service=C2=A0\
>=20

What you could do is add this url to MIRRORS in the recipe? That way
the system should fall back if the main url doesn't work.

Cheers,

Richard

