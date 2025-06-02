Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473F6C5B555
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 21:12:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.6565.1748898754180688431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 14:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LOdwLt35;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d3f72391so26854155e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 14:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748898752; x=1749503552; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG9SiXI3uVBPPY9LliUvIUwDlYv60hT0SqlrnS2Klnw=;
        b=LOdwLt35kElX7A/NhvgkNqligp0aN73qFF50P8mRwIKLBjK3Odr6odTvlMMZvxiSQ8
         4df+gwzXI1dqr8+CLQS0g8+EG4ZDsaXwamXU3MyvwMHoY6WlNv2/tH0t6yK0udbm85iW
         foPI3TuLOl5zbQzmfJZqCjXtiQUIEfJHdhwyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748898752; x=1749503552;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CG9SiXI3uVBPPY9LliUvIUwDlYv60hT0SqlrnS2Klnw=;
        b=mfqMfBUX+eUiD3BtIfDsrrjE3Hmi+G44Doy/WgLWq0BoxiShsG/dgZ15/jfUw6PKmB
         +4lFkieOLoWV/clfosjPlTStQtsibHCJ3SpJovVqwABq+nws7wkSLDjYEEVHuJTBOjtA
         a/hd60H6Ehz5am5niOtcMhBXOdT4donW3ZH/oU0zFYk+X+krU1XaCxUMheneSXIHrxte
         kJLdV/Wk5qylH+X8xlKMx+CZz6tBEciWZqB7z1sRP5JkHFl2zvnUQTiWIDY8n7zJXxBg
         3/g0f9sLh1RV+uvD/Bb2SK85+0nP/f/sEaJalovpAVqW6yLrrbdxYWMTESwDWr0+763/
         I+Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVzfXiVAToyEvlIlk0clq/O6p+mzpD89U4hYPfQpobTx6a1rqitbyn2GWdS+ea45Co/ZsrKQqYJMJA1xTrtL8LiyA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwVmCGwEraLO1RlJD7K0qDfOKxzw0/y/frGSMOTSleOzPD6pp6A
	eFNY7dGrel+UVhd1zXmVWGWZpiFRc/hrrnhPdgL6T3Tpm6O0jyvRxQECAiMsAKHPi34=
X-Gm-Gg: ASbGncu4gm9Jp0YtpiiUaT/TV8PwVV1dYFshhdv6bGvRJQS+cTWGa+K2gsF8RqTM7iS
	PW3g2WytaExtmbazoHAKY7kzzr0/w69CTBc/X68bmePpCL2ZnO5gm5sn3P0hIR1pDskAV0vdc6l
	yhvyYGQxkw9rMWvHAgkP2lxv1XRq0LD8JnkS6vIHtKsjtCvtj0bBe/xKOjF+zDeEGWPVeEmaJLP
	ZB7QwLJnORu12eonkJ8hEuGLw4LyjwPyVM+ZJOsqrEB2/hRZuGt8UjaHNqSZBmnPXuh80rlSc9t
	HfO5Wlbdpvd7uNmvSk4uTsyjh8G8jhoe4W+Fc19a8dxBSUwalTUzVtGt9bg5fPVEZlVNyg4Syu1
	wD8LOrGNxTGi/NAT0f0kqXa/TvOVsLdv9LvsSjiUq
X-Google-Smtp-Source: AGHT+IEce8K1stwdf2D0qyqaEIY6IvAHfhvfN1Aq7WZZAE7htIFIC5tByFjnrKB9z6y6WVPVF7MLcA==
X-Received: by 2002:a05:600c:604b:b0:43c:e7ae:4bc9 with SMTP id 5b1f17b1804b1-451e3046d2cmr7596595e9.1.1748898752619;
        Mon, 02 Jun 2025 14:12:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f190:efe6:7bd4:a92a? ([2001:8b0:aba:5f3c:f190:efe6:7bd4:a92a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d800671csm137033785e9.30.2025.06.02.14.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 14:12:31 -0700 (PDT)
Message-ID: <55a42d0d521b79f23d687800ae97f0df2152d7c3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] m4: Backport a patch to build with
 --disable-nls
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Date: Mon, 02 Jun 2025 22:12:30 +0100
In-Reply-To: <20250602205614.781885-1-pkj@axis.com>
References: <20250602205614.781885-1-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 21:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217733

On Mon, 2025-06-02 at 22:56 +0200, Peter Kjellerstedt via lists.openembedde=
d.org wrote:
> Building with USE_NLS =3D "no" results in the following errors:
>=20
> =C2=A0 lib/spawn-pipe.c: In function 'create_pipe':
> =C2=A0 lib/spawn-pipe.c:218:7: error: format not a string literal and no
> =C2=A0 format arguments [-Werror=3Dformat-security]
> =C2=A0=C2=A0=C2=A0 218 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error (EXIT_=
FAILURE, errno, _("cannot create pipe"));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^~~~~
> =C2=A0 lib/spawn-pipe.c:221:7: error: format not a string literal and no
> =C2=A0 format arguments [-Werror=3Dformat-security]
> =C2=A0=C2=A0=C2=A0 221 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error (EXIT_=
FAILURE, errno, _("cannot create pipe"));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^~~~~
> =C2=A0 lib/clean-temp.c: In function 'create_temp_dir':
> =C2=A0 lib/clean-temp.c:234:7: error: format not a string literal and no
> =C2=A0 format arguments [-Werror=3Dformat-security]
> =C2=A0=C2=A0=C2=A0 234 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error (0, er=
rno,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^~~~~
>=20
> Backport a patch from gnulib to avoid the problem.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

I thought we disabled nls for native recipes so I'm wondering why we
don't see this failure with m4-native? Perhaps we don't have -
Werror=3Dformat-security in that case?

Cheers,

Richard

