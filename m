Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AC0C43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 20:40:14 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2798.1783888811233465107
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 13:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qAS+LU0u;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cea3004256so16163725ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 13:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783888811; cv=none;
        d=google.com; s=arc-20260327;
        b=b5a7ShURCtIeOBXLuC6ynWMP6cqqbvhh87Wyb4mq6CepZfx2/Cd9Xv37u6g2XXlouA
         b3MjyFLtOiHo7r9/J7PjRv1alfEIVBShkwgHqcGMC1VaaibaKUDs7zgI2q98tXWDGImZ
         YSmwkvbPtQ4LRAA955Y/698yxF7UA2qHlPnJM6N7pZ2lPtTPtg5WIRQF2SeDuUf24rjo
         hU/0Dzg5VNuo7ddKcxVCT+31qp2LTzdlcC0lI7pLt6CsI+3TcUhv3aFbW+vHHj2OKP7o
         3jugXaLhWMEcgwuBGPiu0Sq5vJyoUjwi/SWheqL9UbnyUt72i6vN/x7B9MOT8k1ZsFqY
         2tiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=THa5Yuinp1C1QCCswZ8sn27qiojZgbRgaQ8m6dIQirg=;
        fh=SrdVmXV3Gv+oXMI0jnDvLEYyknNQCmG10Cxh/inks0w=;
        b=FzRj0vK1lLO+osIo24aV5Ux1pxOfXEN0STfVG0mji31dxT9Ru90U68Lmr2ZKGXoXaq
         nshqw+p/kjmU0eWVd+7jarF8V+Q1pDjyumoUeqthpFC9o3gsHG+230oIOcN1GAddNHBV
         4H3Cd8bY6NYL/9XC0VS7LhI6itQyxPGVI0z2TdzuorjgD0HfSXML5SIzC+geiGkT/PwZ
         SadnGHZ+LiCGKfiqxh6ZIHrGX7WQhpHJYTGjvFTqFjG+9lv7sOXSjcPjHI7dW1iGMiCq
         T6+ka8BG8h64XCrqJz66fFlB3CV39VdPUYzgWymh8OyoGC89SD0J5JSsZJKV1TGMrsjs
         aTmw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783888811; x=1784493611; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THa5Yuinp1C1QCCswZ8sn27qiojZgbRgaQ8m6dIQirg=;
        b=qAS+LU0uAFbNLujY0O18Pi3XPPpX9FyW1KwOOQ7JgiZ5K2o5DrrXHbSkcczfvL/XcM
         vh9AzjV0Z3jzcOQA2NvUmYGkl6lQCPU7G5J07mL5BLQN2dQvYktlx8rNMeOliGD9Skos
         /Z1NjmfXmk0qTdnwe8ZvgtmVQw6fZ2K8vK0qJW+PE20uddAx81ItNnqESj9KyUvLNSyr
         6MQmHoIFZqvIyVtAZSmJEDkKloMpD1tfPmAlDeqLt0+bESxm8kfu/wIeNdPAsxIohmd6
         FkfhfRD5rn3h1lfPytEzIuTfMbpHOM72rqZTIrTS0kyZtPn47b6yvDbPDxiK5M699GEt
         Q7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783888811; x=1784493611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THa5Yuinp1C1QCCswZ8sn27qiojZgbRgaQ8m6dIQirg=;
        b=NROy4xDNdoust5paOYTE4LlWapqynq3+zR9fZq4OwEaUzIoFKNknoyUJGqf/ksR5M3
         4V8XmH8bKrWecwg/qUTFgrMoD/Xsjy6jKwiqBRT/S67dHQHF9wwjG9I5YkyOg+i02Qo5
         /Y3ztzh7mcqPq3ZsPF94aGYf2Pgj52IsNznqoC39fWsmj4vq+K10yUdSj1DE8e7IbpB0
         BN8KM6WLOksy9S1LpeUMctSDnSUjuvMXiWRfDI2iSJWU8pnGGh9imvX1E5MBmg84hgp0
         eJ8MEuvDtanqH14RjaJ6yPN4SoFTxBell4de5/P6g1j0D/78I/PV7ImEni0vJVrl5vzb
         ZEnw==
X-Gm-Message-State: AOJu0YxbCO/oIq/PfBObdFtC+tmjhSEtYoGInTKrxdHy3reRefRrWcSz
	kGHW8KDnTYnU4Cds07lZyB2cinh2LsN8+OYw076mexsRRNQItlSPl0ZXQ7k/IPyPJiRLPlIkpH1
	CaeuAcRQ5ABJr3V5ZZJDx145HEszE38A=
X-Gm-Gg: AfdE7ckTUtv+LLSaW2ePRIYCe7uGpT6sYWEoRbaoPVUe+E1nmJiT2LWqpU/XmquIGoh
	ijiLjqvIuqhTxAc09UUZW/oFtSe2+rQ5uGcHvjTOmneJUZzbFIYCnDpEcpOG8RswsiaLNr5W9Hr
	uns5Xb1zQ5lOQcC/Dm7NDHyhSTuZNW0dp4m2dhqzrrYG8iEPVA5W1r+uPs4TW1C7w17t8u8ja/Q
	Qv2oHignEmKd6nnLQ4t3bOnc5tFyn/gW3SdNWFyTD3a5sHJ8ae39I9tiv0PVRaiM/1SZSx0GU6W
	eYEQA8XtmIP9XdSt/VeQZvyt/aul3kiJQ5bHTVS+MMTC05vYVuRfr2A1W7x2RTCWFqkOqkla6D/
	sZT6bLem0W5+rvOE=
X-Received: by 2002:a17:902:d98b:b0:2ca:75b1:e1e5 with SMTP id
 d9443c01a7336-2ce9e79f444mr66222895ad.4.1783888810501; Sun, 12 Jul 2026
 13:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260712184307.3259642-1-vince@underview.tech>
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 12 Jul 2026 16:39:58 -0400
X-Gm-Features: AVVi8CeTW7R1rnrX7BECFgg_dLnw5M6mHD_hDmJmlYpY7rS_-93WCw-t3eTWjSo
Message-ID: <CADkTA4NiK9hp-12OrhOVMPfVZG3paH8bCqc8SwAtzXVX=tDWjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 01/27] bitbake: globally define KERNEL_PACKAGE_NAME
To: vince@underview.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 20:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240818

On Sun, Jul 12, 2026 at 2:43=E2=80=AFPM Vincent Davis Jr via
lists.openembedded.org <vince=3Dunderview.tech@lists.openembedded.org>
wrote:
>
> A number of recipes rely on hard coded
> kernel prefix set by KERNEL_PACKAGE_NAME
> when including modules. This leads to build
> time failures such as.
>
> ERROR: Nothing RPROVIDES 'kernel-module-*'
>
> Commit globally defines variable so that
> recipes aren't reliant on hardcoded 'kernel'
> prefix.
>
> Commit also updates variables
>
> STAGING_KERNEL_DIR
> STAGING_KERNEL_BUILDDIR
>
> STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR get
> changed from default defined in bitbake.conf in
> the kernel.bbclass. The reason was to set these
> variables to directories under WORKDIR in alternate
> kernel recipes (I.e. where KERNEL_PACKAGE_NAME !=3D kernel)
> so that they may build in parallel with the default
> kernel without clobbering. The issue is that the variables
> only get changed in kernel recipes. So, other recipes
> such as perf and make-mod-scripts don't know the
> location of virtual/kernel WORKDIR.
>
> Solution is to include KERNEL_PACKAGE_NAME in
> STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR
> so recipes like perf and make-mod-scripts can
> find virtual/kernel source and solve the
> clobbering of build artifacts issue.

These descriptions cover what you've changed, and
how they are cooredinated .. but you haven't explained *why*

What problem does this solve? This introduces
complexity throughout the code base, so there has to be an
appropriately significant use case to justify it.

and "We are changing the kernel package name" is not a sufficient justifica=
tion.
a reason, that is obviously something you are doing.

Bruce

>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  meta/conf/bitbake.conf | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index bdf37d0da2..569b83a138 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -479,6 +479,9 @@ SDKPATHINSTALL =3D "/usr/local/${SDK_NAME_PREFIX}-${S=
DK_ARCH}"
>  # Kernel info.
>  ##################################################################
>
> +# Globally define base string for kernel packages
> +KERNEL_PACKAGE_NAME ??=3D "kernel"
> +
>  OLDEST_KERNEL =3D "5.15"
>
>  # SDK_OLDEST_KERNEL can't be set using overrides since there are
> @@ -490,8 +493,8 @@ SDK_OLDEST_KERNEL =3D "3.2.0"
>  # they are staged.
>  KERNEL_SRC_PATH =3D "/usr/src/kernel"
>
> -STAGING_KERNEL_DIR =3D "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
> -STAGING_KERNEL_BUILDDIR =3D "${TMPDIR}/work-shared/${MACHINE}/kernel-bui=
ld-artifacts"
> +STAGING_KERNEL_DIR =3D "${TMPDIR}/work-shared/${MACHINE}/${KERNEL_PACKAG=
E_NAME}/kernel-source"
> +STAGING_KERNEL_BUILDDIR =3D "${TMPDIR}/work-shared/${MACHINE}/${KERNEL_P=
ACKAGE_NAME}/kernel-build-artifacts"
>
>  ##################################################################
>  # Specific image creation and rootfs population info.
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240791): https://lists.openembedded.org/g/openembedde=
d-core/message/240791
> Mute This Topic: https://lists.openembedded.org/mt/120238087/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

