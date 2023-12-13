Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB7AC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 20:53:25 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.48535.1702500800535649598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 12:53:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xt+Z0D+2;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-20292b5ca69so3432882fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 12:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702500800; x=1703105600; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRQbzNrqhncnA0KPdytzooxt53u54A44pmBIRECKFt4=;
        b=Xt+Z0D+2+voGgbyfOLgQ/aS6JhzVIuasup3nrx/CPBdfIBsuGgZsIFyolPzrMTfBnu
         ZXN9EoiMFROulWrcbepxEwq0tFVvN+FtUqtODljlxJh86AUxEDYiv9GxCrRWpadYqToQ
         OkAy1bGcuPEbHc5eNBk9FIJqZFMYEhrEqaVjq/aHxAdqLT+B05353IcyvU8bM3ILS8UO
         O4CuxwaoiLXKTUtAzC1aAwqPLVM92T2nRanKXNfm7X6i3Z0YgcbdyM/Q/RspuyMDDfDx
         yLRb9UkeNAwW+yXA8sDZT01vMh/9AYfMfO0PY6oR8GWmHxk3W1uqJwoPT9vjOaRT48zh
         v7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702500800; x=1703105600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRQbzNrqhncnA0KPdytzooxt53u54A44pmBIRECKFt4=;
        b=XDhIYuw1CHr05zrE8McqbGFNGQD9sKNk5hfeQf80rnCpo2ikaRK01rDHBRnzt4G6Sp
         fHtk1aQlw2/JSBBpqzQ+FhFkUiV75D0m2BkK4aXayjITLdQHWc76sOM0UdX2lHZoRD9t
         VhrK+hNvesX5D7HcF23KFJbjYF6LwSgc9KU5TQIZaATJl0uH7Qa0qSYCa9xP6hyAJrOt
         soInFDOlm4ma4t6U8v3x+VKIokefW8WS+YXWQszh9+q2EaOpUgpGg+OkmKz/8nyBeS1W
         /gbV58oOrtnB/0MNO+vdCmvvwdsHmW2VnMzXcBeDP/fCvMGXaKyit/uDaY4Ctp/xk+Rj
         CTPg==
X-Gm-Message-State: AOJu0YxKkduAneIT0cNqZOQnapYOenOvTNs1mEaEATV3x4o3oyvkFBpr
	F9sb1+HNaSkrxKEhSoAq1TWtMmUPeS3T9f95VNa+RWqdOm4=
X-Google-Smtp-Source: AGHT+IFYBcwrwXYj+tVi7+A4acmaKP2Bzauz0RHiehXjE7hm4+6kehT0TqaB9UeRkpAa0R9p6kOC76ixzwzV4aGxc5g=
X-Received: by 2002:a05:6870:9346:b0:1fb:29af:c8b2 with SMTP id
 j6-20020a056870934600b001fb29afc8b2mr10250647oak.7.1702500799626; Wed, 13 Dec
 2023 12:53:19 -0800 (PST)
MIME-Version: 1.0
References: <20231213115748.487216-1-quic_vkraleti@quicinc.com>
In-Reply-To: <20231213115748.487216-1-quic_vkraleti@quicinc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Dec 2023 12:52:53 -0800
Message-ID: <CAMKF1sq=oxDTJzznUOC3aakX3tS+wP5+_JZjXpmadat1j+FA_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] systemd-boot: Add recipe to compile native
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 20:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192321

On Wed, Dec 13, 2023 at 3:58=E2=80=AFAM Viswanath Kraleti
<quic_vkraleti@quicinc.com> wrote:
>
> systemd-boot native recipe provides ukify tool to build
> UKI images for systemd-boot
>
> Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
> ---
>  .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.b=
b
>
> diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/met=
a/recipes-core/systemd/systemd-boot-native_254.4.bb
> new file mode 100644
> index 0000000000..0cdd7e7045
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> @@ -0,0 +1,15 @@
> +require systemd.inc
> +
> +inherit native
> +
> +RRECOMMENDS:${PN} +=3D "python3-pefile-native"
> +
> +COMPATIBLE_HOST =3D "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"

this is a native recipe, so I wonder why do we need COMPATIBLE_HOST

> +
> +do_configure[noexec] =3D "1"
> +do_compile[noexec] =3D "1"

should these tasks be simply deleted using deltask

> +
> +do_install () {
> +       install -d ${D}${bindir}
> +       install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify

you can make it one liner

install -Dm 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify

> +}
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192289): https://lists.openembedded.org/g/openembedde=
d-core/message/192289
> Mute This Topic: https://lists.openembedded.org/mt/103147679/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

