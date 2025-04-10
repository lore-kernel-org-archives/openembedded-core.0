Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F864C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 06:15:28 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.28160.1744265725059115276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 23:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UjHclW2Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so1731165e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 23:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744265723; x=1744870523; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDuNA/b7DvLF6ZqSDBn4eCCOWtHspUOA2iQ+oHRRMo4=;
        b=UjHclW2QvWqb12Mj4mNzqNmnc/ZAMBO65qkc7FPdn8bCAWqqwEf4ABXy81+/n9wEf2
         Dmf46JjQjVYWpzPWccLpHHf3WepcSunxqZ86fT+DiGLp/Oa1zVg6lzLSkXtZv6cmRbMZ
         QSwfDIz8H28js1mh6IW48sOxvt2u+hUP7LZN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265723; x=1744870523;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZDuNA/b7DvLF6ZqSDBn4eCCOWtHspUOA2iQ+oHRRMo4=;
        b=dcLFkdWnFClzF3IYSieBNotLuMd2AAq9eZPhkaaLdReidxDQ1e7mBTOiz3xwo0a+WU
         /X35BnTIMxnTp0yXYoxfsgw7PsSCbe6Xl/syMafGZ9zGiqyWhXG41NgN7P6gAMn8cWEJ
         ekMOaMgezmEckLmAMoj48f/h4eTcbFPqJ4UFLVqPnSqHu9lzz3Gghtk1V6GDGT74xarD
         86wi1kfMuDPILQHhneKhCyMngL2Ah/jdjkDzV+OovHguyN5U/Owxx34Z9crlFswubUfQ
         Vi7bpQLUFPngOYa3P5nbiJjAgIBsLk7F/AX/048Uo8ww7zXOPfNNHsrMqv8PNOGfhW7K
         SVkg==
X-Forwarded-Encrypted: i=1; AJvYcCXz5XHQ9SXFFQNAE3DJZCT/4wv1Y+v7yGWuJQPw+rmMQ0dvCoRY/Vp3jGibGs26I8rpv72isqdIb6ztf4GKF/MDwg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxB2C2cnW4jdGovKvqtEn3gDsBseygs4F6pI7AfMtSM0qt+/GcG
	2aZbPRsEzCR855EvwsLBdooq1OgRyGsR6SjpcqGqs9R9tO+/QM14aK0aFQpEBVY=
X-Gm-Gg: ASbGnct4aVrDf537VfJIRG+FWZgO7jOkCtruG211PA0In7AP9IFUs+A5I2BFLckRvxW
	v+M+Z8tuQgQJJLWfHkDqasar6Bypo5BzKy1/DFKmTldGPqINYdm6ZRRO68aRQu4Hq4nIxUFO/Km
	WK+7TIuvXtOWn/6mEiZ57h2Vk5g3eFUq8FM1En514uc1WmruigeUKKlDDO7oBhK7DmUnD/29zCg
	BqQhEIeaiqw/SXGTXER1nKmpC1WYSelN8qW6AIWjnEroVmK7MR59lMcTtfxstFvWpvaY16/gMCF
	Obz8KVr6nePDOni/uP1KegOAzff88D6x0jzJRWv2P8iMNs4MGDEuKFiGCAE7TTvNiaWwQkyicAk
	BAXLG3O2gLJxE/mes2EqD68wGvrcNpA==
X-Google-Smtp-Source: AGHT+IGeY3KQcmwO6MY5GQXUhs/umUbEt8mhJ1JemQCVecClCsAK1L3ZaGNV0oFbIx+EoOA7bESdww==
X-Received: by 2002:a05:600c:3591:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-43f2d98b857mr17132155e9.31.1744265723116;
        Wed, 09 Apr 2025 23:15:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:48b8:26f1:fe26:d411? ([2001:8b0:aba:5f3c:48b8:26f1:fe26:d411])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572c4esm40207445e9.26.2025.04.09.23.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:15:22 -0700 (PDT)
Message-ID: <35ee8bfe577addc9e6ae978588b5a071be82b478.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/2] classes/recipes: remove unnecessary qemu
 inherit and qemu-native dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2025 07:15:20 +0100
In-Reply-To: <20250410040825.1283228-1-Qi.Chen@windriver.com>
References: <20250410040825.1283228-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 06:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214618

On Wed, 2025-04-09 at 21:08 -0700, Chen Qi via lists.openembedded.org wrote=
:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Some classes/recipes inherit qemu.bbclass but does not actually use anyth=
ing
> from it. Besides, putting qemu-native in PACKAGE_WRITE_DEPS is not needed=
 because
> the process of generating package does not need qemu-native.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
> =C2=A0meta/classes-recipe/fontcache.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ---
> =C2=A0meta/classes-recipe/gio-module-cache.bbclass=C2=A0=C2=A0=C2=A0 | 3 =
---
> =C2=A0meta/classes-recipe/gtk-immodules-cache.bbclass | 4 ----
> =C2=A0meta/classes-recipe/manpages.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 --
> =C2=A0meta/classes-recipe/pixbufcache.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 5 +----
> =C2=A0meta/recipes-core/systemd/systemd_257.4.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 3 +--
> =C2=A0meta/recipes-core/udev/eudev_3.2.14.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A07 files changed, 3 insertions(+), 19 deletions(-)
>=20
> diff --git a/meta/classes-recipe/fontcache.bbclass b/meta/classes-recipe/=
fontcache.bbclass
> index 6f4978369d..6082af08f3 100644
> --- a/meta/classes-recipe/fontcache.bbclass
> +++ b/meta/classes-recipe/fontcache.bbclass
> @@ -9,9 +9,6 @@
> =C2=A0# packages.
> =C2=A0#
> =C2=A0
> -PACKAGE_WRITE_DEPS +=3D "qemu-native"
> -inherit qemu
> -
> =C2=A0FONT_PACKAGES ??=3D "${PN}"
> =C2=A0FONT_PACKAGES:class-native =3D ""
> =C2=A0FONT_EXTRA_RDEPENDS ?=3D "${MLPREFIX}fontconfig-utils"

I picked one of these to validate this as I didn't quite believe we didn't =
use qemu there.
fontconfig.bbclass has:

fontcache_common() {
if [ -n "$D" ] ; then
	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=3D${ML=
PREFIX} binprefix=3D${MLPREFIX} \

in it's postinstall script. Then in scripts/postinst-
intercepts/update_font_cache we have:

PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $D=
${libexecdir}/${binprefix}fc-cache --sysroot=3D$D --system-only ${fontconfi=
gcacheparams}

so I'm afraid it does use qemu and you can't simply drop the class
inherit or dependency as it is used.

Cheers,

Richard


