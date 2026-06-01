Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C951CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 06:38:00 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22482.1780295874266688075
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 23:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BwAxLrRY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-46013161068so128606f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 23:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780295872; x=1780900672; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Sq9+frqRndjdS1i6wU9CxcsAUb3bD0i3o7SY9rAMebU=;
        b=BwAxLrRY4F29RYLkZTvrFyPwMCxzhG0kKMqiQWFQS1tXrZaqWITd0d0RaSCgmN4LPb
         MkHyoMATjW1qR7vCMKnaO8uUOqWj/XO/1G2lycXX51iq9aVDrZ1ydzuIRC1giiYBHk8X
         WaIhsOm6LTg3miWyK8bRI9pLDxDbz/MQqi8Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780295872; x=1780900672;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq9+frqRndjdS1i6wU9CxcsAUb3bD0i3o7SY9rAMebU=;
        b=QNjUFXGM8zeR5lN/BoBzo2iOe5lnl/GTChuhGH9MtzMT+DKi053LRNpdMxtebtN2WQ
         b/bX3J57H1SC1zGReD1hLmqfYFVvaem3y6lKoqiJjOqed+wWePoNOl2rwidoNFy9PCDB
         is/6wz4T4RWhExQgnWXwfRbdVZgXZhLhwtYb6TzX6fVN93WQVFaDwg13V8i+aRN1IF2R
         Mk2sYqBvHGk28LWxZlA7xFXGE3U16j2CYXR2hTa1kRAYg7sVMdkYqNOPJ01yOI59/5In
         x2ApU04B0XBYL+WYkZ7auvoPxY2wB0xiaX4dJzyqNRymBpvcLOQFR2lqM8ko3YvmjHoF
         qsBg==
X-Forwarded-Encrypted: i=1; AFNElJ+bTPSH4itwj48LXHoLu6GXskk1L1z5PzljKujL5Nd7K6WiHp+6yyiksJ8cBYVK1/LpDPLxXnUcRnp85t9sWiWyfA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzX/F6qxoy5oMuxXbwCn4qvSY6HeChRNbPym7OFhkOY2AqKqEVe
	+gTCvKxsYYKFPFU534qsHM/5sK+lvt6jM7sM8S7WRDryH6kWP7VfHkN6cRdaDtbmYlI=
X-Gm-Gg: Acq92OGp2h25H1tzo0Xgiaket2vIDR6r6E+VRKQ+kOv0TwlnM1yPfa1K1VNFAKZ1cw1
	fNgEPSQRNYUTMI4OMXloRvA2cj6lj4s+H/lgTaFcYS6Em7awM5pdp2bezJg/9KQnXikheup+NLl
	d0anmb948uqCexKu7Y/0L7Ly+84bufezzeJpETyjOPrq7rhImDAbSKhO50qfyAm/+hcEv+z6bPp
	a+A5I41Y0yxMMZ5DiL+4k5PdcHQJLPT2q+usyhr8T0c4SHy7RIXTCs74gk4o4W1esY5W6ZEM5ut
	PA5SY6l3HA1kVoL2qOj3oNBTtEVLZsUY5ffFT1ClPLefS9Jgo9MlANcq0p8jwL2nTzgpMo/Oinh
	soK8NLSA5A9rumF94bx5pizc8dsNQSC5WSa4EAaEnA8o6FNnABqBdAW/EVpxMYh35NqtwK6Peal
	ayvcsdkTrgFlVpXoBUUDST4w5967s1ZeHil05i+v8nf57oQ61+XkzizPfOJ4UeOeah8tEK8Yi0v
	PInkkS9sBaYZxkwa4Bf6nT+
X-Received: by 2002:a05:6000:41f9:b0:460:ff2:63e5 with SMTP id ffacd0b85a97d-4600ff2650emr6648304f8f.18.1780295872458;
        Sun, 31 May 2026 23:37:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:91e5:137:d314:95b7? ([2001:8b0:aba:5f3c:91e5:137:d314:95b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3587072sm23766460f8f.34.2026.05.31.23.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 23:37:51 -0700 (PDT)
Message-ID: <b756a9add53cba2b685aa30d803526e1d002d8c2.camel@linuxfoundation.org>
Subject: Re: [PATCH] [PATCH v3] gawk: backport randtest stability fix
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Aditya GS <adityags2004@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, joaomarcos.costa@bootlin.com,
 ross.burton@arm.com, 	randy.macleod@windriver.com
Date: Mon, 01 Jun 2026 07:37:50 +0100
In-Reply-To: <20260601062311.638-1-adityags2004@gmail.com>
References: <20260601062311.638-1-adityags2004@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 06:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237812

Hi,

Thanks for the patch. I have a few pieces of feedback, just to help
streamline the patch merging process.

Firstly, I think this might be against scarthgap as it has 5.3.0?
master/wrynose have 5.4.0. It isn't against master, you need to say
which branch it is against in the shortlog/subject, e.g. [scarthgap].
We do also have a backport policy which means this needs to be applied
in master first, then backported to the LTS releases after that.

On Mon, 2026-06-01 at 11:53 +0530, Aditya GS wrote:
> Backport upstream fix to improve stability of randtest.sh by
> retrying when sigma is too small, avoiding intermittent failures.
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16254

The convention for this is:

[YOCTO #16254]

>=20
> Signed-off-by: Aditya GS <adityags2004@gmail.com>
> ---
> =C2=A0.../gawk/files/randtest-fix.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 139 ++++++++++++++++++
> =C2=A0meta/recipes-extended/gawk/gawk_5.3.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
> =C2=A02 files changed, 140 insertions(+)
> =C2=A0create mode 100644 meta/recipes-extended/gawk/files/randtest-fix.pa=
tch
>=20
> diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch b/meta/r=
ecipes-extended/gawk/files/randtest-fix.patch
> new file mode 100644
> index 0000000000..0b813e667e
> --- /dev/null
> +++ b/meta/recipes-extended/gawk/files/randtest-fix.patch
> @@ -0,0 +1,139 @@
> +From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 2001
> +From: "Arnold D. Robbins" <arnold@skeeve.com>
> +Date: Thu, 28 May 2026 09:52:41 -0400
> +Subject: [PATCH] Improve test/randtest.sh.
> +
> +Backport upstream fix to improve stability of randtest.sh by retrying
> +when sigma is too small, avoiding intermittent failures.
> +
> +Upstream-Status: Backport
> +[https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Df2250f4bc8=
64913437619af7a983

Missing closing brace and ideally shouldn't be line wrapped.

> + function abs(abs_input) { return(sqrt(abs_input^2)) ; }
> + '
> +=20
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-exte=
nded/gawk/gawk_5.3.0.bb
> index ac9d8500d6..06184a4b48 100644
> --- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
> @@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] =3D "--with-mpfr,--without-mpfr, mp=
fr"
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-m4-readline-add-missing-includes.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/run-ptest=C2=A0\
> +	=C2=A0=C2=A0 file://randtest-fix.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "

Whitespace mismatch.

Could you send a tweaked version against master please? I would like to
remove one of the intermittent ptest failures!

Thanks,

Richard

