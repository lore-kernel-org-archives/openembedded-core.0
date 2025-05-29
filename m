Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F96C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 09:20:55 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.16856.1748510448054655958
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 02:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z7kNfj+u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4bdee0bf7so379148f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748510446; x=1749115246; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKJ71OamNPiiaNh23XAgNVmjft1QxQf8Bdy7llDZ87k=;
        b=Z7kNfj+ucVf4oUyvIJ4Xo/O8Em3pnER/aubEM8RG4hiPHnbwhfFP6i7H51tZNhXEuE
         M4V7wch91ct5+dRQji8YXUITMDdzsferasyuO4BqlfouyhI56bmQjIpkZwU+Sevmnxxk
         OslJqmBSojo0qxn7cZOzMDjYU3Cwz/KpLVts4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510446; x=1749115246;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKJ71OamNPiiaNh23XAgNVmjft1QxQf8Bdy7llDZ87k=;
        b=buQmztr/UFqI8EkEuyzuiPggFPWvv3Y/reQGTgyfiF93OG1GQiCkEDaukQvVIk03L7
         RopOF5Ml6AKCXcp9kflc43hdRWTZerDgqSes2ZFic/iDHdVlZMRGgkU3aMTIta1xzUK6
         xH3Fp68tAP33CoCmCtTlmTX4p36lNoMq+kRcmmADhtII4QW3i+q8sSQRidyxNUDDjzZR
         DL5Wo0flXLyFoFpgx1uoJUS1GhfsM9MHgMNeu7VUngpNvK4BU9DzeJmw6LE2Zq7GNZFr
         wCqWboFMXJinhE+T/t16WUNCtIaUKsdyETG0S3Z7yfOv1Z/28fLiDGmkWi+mFdiDBuCs
         /auQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAvLecL1/lTncKbRrWXKWCYG5hDcJLhM+2K+XkB3fAzZ7p/8LwOyMzo2XilWeMRrHz1HKtfv5IxiSazceCTAvGag==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/0X0O5OXmRYqpFo/rWg3GlPffJAJ2g96B8N74Pr3yQmIHF6Zv
	pcF/CMpw14bGWEx6cor0CxgE0O0VNT/TmsGCp4OnC4xg7wCzg6EOIZg2mUuxNUHEGD5IpnKJfht
	sr6ZT5MU=
X-Gm-Gg: ASbGnct1C+UckgdPGOOgA6PXwgX8d4wD/0hx9o/YvPy+9HMMCg0F7dzdTCZv+IEuVW+
	d123f5I0MvlCvwJ3PsouQf4n8NO9KkS7sB9edDPOzqluP/CbsTKMs1Qv+LdNz8s4KjTpq6Y7eL8
	cVYTN70zDgsWJd2WoQT1+TtbDKbPE2yS23FuT1oiSOfX6FbqWUqgkgjf7F4iRkMlryXv7Rsfvwu
	XTL2iH40DTr8qVU9ENxlt7U4WiCxHtbbnTdDXV49VzuFcDEHidhGy9l+QAKq80wGwJqS073qkKT
	4UZUkAA5mGs/zA4RWRPp26+3rIb41UrIHNhHoFK02QceLTRPJ8kP26MQa0lEItz5bzUyePrbUOJ
	Bg4t9fh9myaC34a0+NmEr/83U9LQg/6DA5FBm2qEPwCkORA==
X-Google-Smtp-Source: AGHT+IGmYbneJp+fO0Zw5CmSxJAdgIE/M4Qdk6B+Qr3WMkqUZ+Y2EsZ3vjzKb53bz+4IVaGxYx7BKg==
X-Received: by 2002:a05:6000:2082:b0:3a4:eef5:ae26 with SMTP id ffacd0b85a97d-3a4eef5b06amr1677107f8f.55.1748510445916;
        Thu, 29 May 2025 02:20:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1a5e:81:40ad:9da7? ([2001:8b0:aba:5f3c:1a5e:81:40ad:9da7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009748fsm1379510f8f.80.2025.05.29.02.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 02:20:45 -0700 (PDT)
Message-ID: <a5225b45761850e1a99e7f3c069768f2449fa472.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 05/13] tcf-agent: Fix ranlib call when
 using llvm-ranlib
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2025 10:20:44 +0100
In-Reply-To: <20250522-clang-toolchain-v3-5-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
	 <20250522-clang-toolchain-v3-5-16cfc6d9891b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217402

On Thu, 2025-05-22 at 20:52 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> This ensures that binutils-ranlib or llvm-ranlib
> behaves same as gcc-ranlib
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/reci=
pes-devtools/tcf-agent/tcf-agent_git.bb
> index 235936288ba792c86af4dd1899b2f6585328141f..41706f4b60f1f25233ff91c8f=
112b8122a5c6c30 100644
> --- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> @@ -51,6 +51,11 @@ CFLAGS:append:riscv64 =3D " ${LCL_STOP_SERVICES}"
> =C2=A0CFLAGS:append:riscv32 =3D " ${LCL_STOP_SERVICES}"
> =C2=A0CFLAGS:append:loongarch64 =3D " ${LCL_STOP_SERVICES}"
> =C2=A0
> +# This works with gcc-ranlib wrapper only which expands $@ shell array,
> +# but it will fail if RANLIB was set to <cross>-ranlib or
> +# <cross>-llvm-ranlib has same behaviour
> +RANLIB:append:toolchain-clang =3D " $@"
> +
> =C2=A0do_install() {
> =C2=A0	oe_runmake install INSTALLROOT=3D${D}
> =C2=A0	install -d ${D}${sysconfdir}/init.d/
>=20

The people on the patch review calls are struggling to understand the
issue here. Could you explain this a bit more in the comment so we can
understand it?

Does this imply there is a missing piece on the commandline in the
makefiles (or whatever) of tcf-agent which should really be fixed
instead?

Cheers,

Richard

