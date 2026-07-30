Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90A7C54FDF
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 10:40:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8747.1785408017752744719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 03:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AfF3ZqBI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49550ec592cso3707315e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 03:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785408016; x=1786012816; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wj1V+4EawxCvbGTmjPFNd2RnopyxFZD1sFCIEz7UpV4=;
        b=AfF3ZqBIqtxuBN5d0WbLj0aWXV4OTViDqiit+s9aIwqEfOcGC5MwuQ3reyRn/Zhcgt
         gRkT813NmcNLqNSSHjiUG3SzrJBwAPQwG8jhYr4hkROB5W2uSElfdI7D5I2QGtge76n3
         cSybtAUXmNnHstyUrzMCwgyNCDnwr4pauVzYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408016; x=1786012816;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wj1V+4EawxCvbGTmjPFNd2RnopyxFZD1sFCIEz7UpV4=;
        b=mEUHJm3D0KxoQrZkXAulj+U3s0GYh1QVF4p9U46gPfex0YhA6wj236VVlJdJaPdcvn
         d9u8d/HeUW0fQOb9xb1eLFC1Hsy4DGkxKOAqz4E1n3iAnBVuGEVdL4ineUuxhvEmCllg
         bWuITSYk2+b0honCyyl+uCDsxsNRH4/4aSPQbI9RgSxo7LdJKvQ/0AGv5rx9Q/LBw0C6
         Ubn9/o538zOZwU0Fb0i7eDb3rcvBqwdKtVTgXU3jtJytow3XQfb/g7foR8pWa5jdMXbi
         cCtq3U0I7plMLGq1xP3V2BTcgLdfDW6ICeXde/Q1C8kfolUtkxIcx3GdNGRRHxTKEEas
         OTpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPn71UNmtAMdTGiWSZhiZ8oJ1boDw1XBn8yMm3Cl+Eumm+12Ie8FGvuJyWRV1Ju8PYY9LdzOB86AzBtnwqbHy25Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxu9Prvh8XoqwJmLRSIg17Oc+56i42QHcFrnAA6NMlt3rnwkiy5
	X4N61ua29d2ebb+kSuWQYJ1KNhgPlDkybpScr4PBEqj1tnS006BZMYqubIS7wh9S86Y=
X-Gm-Gg: AR+sD11Dtmj+q1wUCpJPmhe+wqE5xpZdGoMpEYI0GJfGGGJKBY+T9QF9L14QstIE9em
	F21IUMXeH8aHQCNyen8LYRDTOrHsFytQu1cMk9H7WEgRlaOMEelh88gISZgItYGP9gu6LyV7zL4
	VBfXwdH7v651NnRQIC4vC0/0Lepx/BXENiUbUiBE+a/tME4wZ+twBv+vS+0f0skdNEkJ5kXTcZG
	1YKtclIzi7+BeTZFAmyzHZaIxOWH/YL+IOor5XyBGZ2y0bHMZn4oa5dzD2bc0aRnx4bs6WOpYAu
	K08EQToy9hzk1N+zL+BCQVzqlgUDe3fUK/qiHqMsTXqVxMOlHgdQt/zq9v3UGhdL2jOcCy8vAza
	wqFoxfCJCv9fNXxDO+maBbLUxiB58J657elN90hGJjU/KvwYdGQHKq0tbVi2d7g3j9zOUKsn5pV
	yn86FpY1ZvN8peqs6ptA1qAvXZN8FeQqhvOO3RNOB7aeIQtlNZx4uu2FP4pwhZlRzWlro7feZxM
	y3FMAzyah05pjDO/7lEt1lXxheE7rlsjKJI4aeEA1izwCw5Ec2f
X-Received: by 2002:a05:600c:4513:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-49801f24221mr21177785e9.16.1785408015914;
        Thu, 30 Jul 2026 03:40:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:75e2:b8ae:3bb9:d96? ([2001:8b0:aba:5f3c:75e2:b8ae:3bb9:d96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010a0ae3sm52377515e9.9.2026.07.30.03.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:40:15 -0700 (PDT)
Message-ID: <76897f53eff588bb67e0e5f0b04dac7be6fa0ac2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 06/10] nativesdk-packagegroup-sdk-host: add
 wic to SDK_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2026 11:40:13 +0100
In-Reply-To: <20260724090146.19924-7-twoerner@gmail.com>
References: <20260724090146.19924-1-twoerner@gmail.com>
	 <20260724090146.19924-7-twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 10:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242336

Hi Trevor,

Firstly, thanks for the patches, this is the right general direction
but we need to get the details right and I think there are a few tweaks
needed to make this as usable as we need it.

In 5/10 you introduce SDK_FEATURES and document it as behaving as
IMAGE_FEATURES, bit as implemented below, it wouldn't.

[cont. below]

On Fri, 2026-07-24 at 05:01 -0400, Trevor Woerner via lists.openembedded.or=
g wrote:
> wic is useful from an installed SDK for assembling or inspecting a wic
> image, but adding it is not free: nativesdk-wic pulls in the tools it
> runs (parted, gptfdisk, dosfstools, mtools, bmaptool, grub, btrfs-tools,
> squashfs-tools, e2fsprogs, util-linux, tar, erofs-utils, and syslinux on
> x86). Most SDKs do not need any of that, so wic should not be in the
> host packagegroup unconditionally.
>=20
> Gate wic in the host packagegroup on the "wic" SDK feature, which is not
> enabled by default. A configuration that wants wic in its SDK adds the
> "wic" feature to SDK_FEATURES and gets a working wic, together with the
> tools it invokes, in the SDK.
>=20
> AI-Generated: codex/claude-opus 4.8 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v4:
> - split out from the v3 "add wic via a new SDK_FEATURES lever" patch:
> =C2=A0 this patch now only wires wic to the "wic" SDK feature
> ---
> =C2=A0.../packagegroups/nativesdk-packagegroup-sdk-host.bb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-h=
ost.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> index 51e48f250b19..c2974a57fe3e 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> @@ -29,6 +29,7 @@ RDEPENDS:${PN} =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 nativesdk-bison \
> =C2=A0=C2=A0=C2=A0=C2=A0 nativesdk-flex \
> =C2=A0=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-integer \
> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('SDK_FEATURES', 'wic', 'nativesd=
k-wic', '', d)} \
> =C2=A0=C2=A0=C2=A0 "

This means that the recipe/package would rebuild every time you change
SDK_FEATURES. IMAGE_FEATURES can be set per image recipe, this would
mean SDK_FEATURES can be set once, globally.

This is why SDK_TOOLCHAIN_LANGS is handled at the class level in
populate_sdk_base.bbclass. It looks for values and pulls in a
packagegroup for a given feature. You can then change the langs on a
per sdk basis.

Instead of the above, you could add:

  ${@bb.utils.contains('SDK_FEATURES', 'wic', 'nativesdk-wic', '', d)}=20

there, probably for TOOLCHAIN_HOST_TASK.

Generally we'd create a packagegroup if there are multiple items being
gated on a config. wic is probably fine, sbom might need a
packagegroup.

Other feedback on the series:

* patch 5/10 should have a subject prefix of bitbake.conf as=C2=A0
  it=C2=A0doesn't=C2=A0touch nativesdk-packagegroup-sdk-host

* We need to migrate SDK_TOOLCHAIN_LANGS to SDK_FEATURES,=C2=A0
  probably=C2=A0using BB_RENAMED_VARIABLES


Are these tweaks you're ok to make?

Cheers,

Richard


