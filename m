Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A03FC54FDF
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 10:41:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8777.1785408079345749131
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 03:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KWV+n0hw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-472326ca506so1396301f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785408077; x=1786012877; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JAjOd8Lw1LKUQnHnP2487Jw4uo1HEo4tke7IyOLEATQ=;
        b=KWV+n0hw7qkTFQOuXjBdqylX/k3zFNe/ZKLIjz9QNqhwGH0+kJ226lxli1zYSMc9eB
         1Elu/XJQCMKcxn6NbMNco8EcTuEHqjxEjhaaM/SIZ3eg1GSVWJqa92pk4f0FfUHTuUqk
         VY7/IA6EY8OTb/OSLybTk4gpnmdUClOTY0ty8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408077; x=1786012877;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAjOd8Lw1LKUQnHnP2487Jw4uo1HEo4tke7IyOLEATQ=;
        b=L0CfgGkZP+8lKAiwFCoJMNtFhm+oXf3ErUuoMp6b/Rtc0AMf5QF1+HJAWL/pSnJppX
         RO42OXjhN1AZxJPZZztSlS9EbVkgV4vVS1nrCxw90QdzcoJWxmSJYCVBuX7ij1sF283F
         p83lHLaD8vEVK5yFolbunGpKv3oeqdCKNjOwWb3D9zmUkuJWWZj5L6mXXG3I8slbQDj8
         Lzyk9q5hbEjYl1e2+1WqTrGl/VBt55odJ99oBSquNdy87ylW/SIXG2r8+57Ldkiye6Tp
         hy+2NDnLIwaAOc73X5CeEo8Yn8d8FfBdZSM3zItT47cwawGw0LV+S5QYj1fCTsm5Y9kU
         jVAQ==
X-Forwarded-Encrypted: i=1; AHgh+RorgtjRdlbMCbj0ktEtgeLLLVMTeRa65Mmp8cktH2A+iOgiblhfptCJX1IZm04SxzaXEuivgOJ1wY5qcXzGvBr90Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyeZUklt/GyIxWyETt7ue8t0AO28RhWQj/Bo5xSngGQlXtRXIWC
	jojz+bcmP6UdAxWIX+xVcUCDQ6vOFgv2t4thr9mLd9Uu9VI8nKzQ0aQMz/KLy5RfgszNE8pkUa1
	/27v76LM=
X-Gm-Gg: AR+sD13HM+pjWiQmtM9cOxNN+WLM/MRICRpYCZgIW0ffUfMIGKwiDIFhgVQaJCd/dh2
	38j8SS7j9D/lk/TuLrOWSWmfOQh4v289gD0meqL4+6PN2Nc9NbgAaSiB4BnvilwTvXUPF9RtNmC
	8M6GDlqzA8BeP1Qeu3Eui/RcEYLbKozg0j/FnxB+/iu8/xVkP6vii7ajyQzaftKtPyXa28vVSeE
	1AlqdadGusT5xIkkJCadQL5HMeUX3g22K7C8iT+oazr/f83ofhpGbpAWR4RNKwRe+B5lAwFc2BW
	NKhcUAruZIX4IVPoDIAbqZxnr4f7qMmtgK+3jVzERsaECI/IrxnZb5aE6pw7A/0R3amMRKG+Yy/
	HKYD8J/PvBEfQ803yB7hzuQMlKHkdINlAr5p/IufpJzcPxsPS8HU1fzCJaAHnjyg5O2HOwyrPjZ
	1/6Dx7ZvZGAC/kHxNIHwOZz6YWfT1S0vvaHBX9l0ewTXxy4zU0ocmpfa0f/2Wn1GJqlPD9DFYOx
	vNbB9a7dSEh3citfFldoVoaZSA0FFMcH/6zJbFYhEzODR+/JaA=
X-Received: by 2002:a05:6000:290a:b0:47f:96e6:70a with SMTP id ffacd0b85a97d-47fc806be54mr2614277f8f.0.1785408077433;
        Thu, 30 Jul 2026 03:41:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:75e2:b8ae:3bb9:d96? ([2001:8b0:aba:5f3c:75e2:b8ae:3bb9:d96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fcb9cb612sm74350f8f.20.2026.07.30.03.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:41:16 -0700 (PDT)
Message-ID: <14897601110b73964d7403e143dd1fb4b1107fc7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] populate_sdk_base: add kernel-devsrc via
 SDK_TOOLCHAIN_LANGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Thu, 30 Jul 2026 11:41:15 +0100
In-Reply-To: <20260717121849.2163115-4-Harish.Sadineni@windriver.com>
References: <20260717121849.2163115-1-Harish.Sadineni@windriver.com>
	 <20260717121849.2163115-4-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 10:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242337

On Fri, 2026-07-17 at 05:18 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> Add a new "kernel" value for SDK_TOOLCHAIN_LANGS that pulls
> kernel-devsrc into TOOLCHAIN_TARGET_TASK. This allows kernel
> development headers/sources to be included in the SDK populate_sdk_base:
> add kernel-devsrc via SDK_TOOLCHAIN_LANGS
>=20
> Users who want kernel module development support in their SDK can now
> set SDK_TOOLCHAIN_LANGS =3D "kernel" explicitly.
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/classes-recipe/populate_sdk_base.bbclass | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes=
-recipe/populate_sdk_base.bbclass
> index b427ff2761..1d9faecc16 100644
> --- a/meta/classes-recipe/populate_sdk_base.bbclass
> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> @@ -80,6 +80,7 @@ TOOLCHAIN_TARGET_TASK ?=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@multilib_pkg_extend(d, 'packagegroup-core-sta=
ndalone-sdk-target')} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go'=
, multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rus=
t', multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'kernel',=
 'kernel-devsrc', '', d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 target-sdk-provides-dummy \
> =C2=A0"
> =C2=A0TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?=3D ""

There is a different thread where we are discussing adding
SDK_FEATURES. I think this should become an SDK_FEATURE as part of that
work. It should also probably be called "kernel-src" as "kernel" is a
bit generic and could mean multiple things.

Cheers,

Richard

