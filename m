Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDFAC83F17
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 08:45:59 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.57124.1753951549416737229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 01:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M9Ax5T3O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b77b8750acso334588f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1753951547; x=1754556347; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kusDtqvfH77ZqwB24nF/02/2E8zMl6s7/SA2JYsZ5vs=;
        b=M9Ax5T3Of9cGiVuRBsfNlS/DxaZKdgzKRSaa/o/WdLGZLC616QW4ReG3kz0tee34LM
         snuh3DP972xp56PGYo5BDuIyiq2FTXFbxw59SwWbMIGgK83DiEEoNejy1jt1U0ct8GuR
         e4HZ10NgKEKfwdqJCR+9ob27ZrvRoAtWvWnEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753951547; x=1754556347;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kusDtqvfH77ZqwB24nF/02/2E8zMl6s7/SA2JYsZ5vs=;
        b=UhkDg3T969nZc9oM8KkkyKPhKbDOP76S0qE0tWFtlW8IOwsoF0zkn8kvsPGm9l82Fe
         KvYoj3oafNvvVeNnoOdhQ1L440SxC6B76Pc/bHYldO9DSsXf96wvIWGPRBpsliFCAZv1
         u8TvLGROpIXDyZxc9xIT4KCRi92xOlXEAPWmgQAqOXtwAUFB+UPZbDDollEo0eEgCMFM
         HaexBvENAwrAPGhQTXF3wCEqBjckEUmjDE8oQmNSIuTJTKq2O0CsHQo2krTj5z60Q+YD
         35Kagq77XuD6B0V0XWduZpzWbVal1ZZ+9kh1AUQbSqKs/s5O5WvaOS5np7eYPdVAz7Wz
         gC+A==
X-Forwarded-Encrypted: i=1; AJvYcCVq1LLZadRihVibqzxbMzDxeVndYnrDZWnXhP8I6EyDy1vLZJ9xZ1pMzEDYlWZsf0xk+SytObrQ92seZvDE0BxMZg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyTukLsiG3RUocNoT14w/i/XHq5uToi4dv8+Oc7XYTNmTMeLl/L
	LE5TZV8hWdBS/972RwQ4g8OJ8CpX9EAybyjphHFLXRFVa1Rl/RTTvHzVLK/3ywHCnf8=
X-Gm-Gg: ASbGncuGqsmI4+zq7vM++L79a32orFFa/1dse902rYKQAq75wg1+t+wxX/uYPWeDWHD
	aHD7HJ4UMGoLUoYGAf4b+2E64Jo9P5ZeS4EKAaLIkaruxx9gGygLtHwXGd0tNcGnDF8IIYzbpQA
	eEky/k/TmYzz0N+MECV8+ZCh7maNUl9U3SCte1tjxSw4TooxKrv2T0AI7IGjyNkcwLnaeQYWVCl
	PCT69yC67nQ8c3P1Nt+01l2zvpR3syi+EuuYEguWkhloVctRGZ9AgcTebilDYTnbHC1ph+1YP+u
	d3umVx4pc/gMVnwTX8Yr90SuEACQXNPYZqjFX8rSdC3hC8h+sLtWAbtemHqeMUR/vyvb9xYaZ/r
	/7Ykpv2waiNP8+IpBqIBQMY4zs/KV6eYNC1pDiVKn6N4njkDMOOVqnt9y8hUKiTqhXOaZuWfgEM
	KUUxU++pYhVyI=
X-Google-Smtp-Source: AGHT+IHIoPqO8zmcaINXg5MsmTn3A8WM6HGxCs7DoWLDgUqNqkP2m56ZOGUVlFPgSZOwN6oaZHBe9Q==
X-Received: by 2002:a05:6000:220b:b0:3b5:e6bf:f86b with SMTP id ffacd0b85a97d-3b79d45811dmr1034387f8f.11.1753951547446;
        Thu, 31 Jul 2025 01:45:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4bf9:5bfd:d948:4db6? ([2001:8b0:aba:5f3c:4bf9:5bfd:d948:4db6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589f1050c0sm17591265e9.7.2025.07.31.01.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 01:45:46 -0700 (PDT)
Message-ID: <65a430efacbf77fc7de6ae47adb38fa9150c0a0a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] insane: Explicitly fail parsing if QA
 errors were raised
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: philip.lorenz@bmw.de, openembedded-core@lists.openembedded.org
Date: Thu, 31 Jul 2025 09:45:45 +0100
In-Reply-To: <20250728095936.1495441-4-philip.lorenz@bmw.de>
References: <20250728095936.1495441-1-philip.lorenz@bmw.de>
	 <20250728095936.1495441-4-philip.lorenz@bmw.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 08:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221182

On Mon, 2025-07-28 at 11:59 +0200, Philip Lorenz via lists.openembedded.org=
 wrote:
> So far, failing the build when a QA error was raised happened implicitly
> when another (unrelated) caller called `exit_if_errors` (e.g.
> insane.bbclass's anonymous Python function). This is error prone and may
> also lead to inconsistent abortion behaviour when parsing QA errors are
> only raised later.
>=20
> Fix this by introducing an explicit call to `exit_if_errors` once recipe
> parsing has finished.
>=20
> Currently code in the following .bbclasses relies on insane.bbclass to
> call `exit_if_errors`:
> * license.bbclass
> * yocto-check-layer.bbclass
>=20
> Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
> ---
> =C2=A0meta/classes-global/base.bbclass=C2=A0=C2=A0 | 4 ++++
> =C2=A0meta/classes-global/insane.bbclass | 2 --
> =C2=A02 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index 6be1f5c2df2..6fe37755ffa 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -348,6 +348,10 @@ python base_eventhandler() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 profprov =3D d.getVar("PRE=
FERRED_PROVIDER_" + p)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if profprov and pn !=3D pr=
ofprov:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ra=
ise bb.parse.SkipRecipe("PREFERRED_PROVIDER_%s set to %s, not %s" % (p, pro=
fprov, pn))
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Bail out early if parsing r=
aised any QA errors
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe.qa.exit_if_errors(d)
> +
> =C2=A0}
> =C2=A0
> =C2=A0CONFIGURESTAMPFILE =3D "${WORKDIR}/configure.sstate"
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index fed8163c3e0..f0b7f83e51d 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -1627,6 +1627,4 @@ python () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if broken_order:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe.qa.handle_error("native=
-last", "%s: native/nativesdk class is not inherited last, this can result =
in unexpected behaviour. "
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Classes inherited after n=
ative/nativesdk: %s" % (pn, " ".join(broken_order)), d)
> -
> -=C2=A0=C2=A0=C2=A0 oe.qa.exit_if_errors(d)
> =C2=A0}

I can understand why you've sent this patch but I'm not sure it fits
with the overall design we were trying to aim for.

The aim has been for the "QA tests" to be together in insane.bbclass
and moving this call to base.bbclass just means we're accepting we'll
just splatter these QA checks everywhere.

I'd also note that parse time checks are expensive and we really should
be trying to avoid them it at all possible. This is just going to
encourage them :/.

I'd like to understand a bit more about the issues you saw which lead
to this patch...

Cheers,

Richard


