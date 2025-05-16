Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A16BC3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 15:55:56 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.16930.1747410946870499665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 08:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=InoEd6c+;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0ad744811so16974156d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 08:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747410946; x=1748015746; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qfVTbYoXwjAs2cz2zrsI3L1aEQTpGepDDARZoJ7IXyY=;
        b=InoEd6c+GxQNXycwXbi9MGjBpSaNjdCHm8zLeQKWmLRsNBhqtubvebm4c/2kRq8Suo
         eQZDvMu6/nVQAmWcI8rxrP0hHdsRcFlnMImlYqYsL/Ocb4/GyzsT2if12MatvxabzDWY
         QuZRWi2/O46an9F8CEY7U/EOMrqStOfhwJ9xwA9mDa6mlKVsiqTQIzq7pvHol8q7/Jtn
         BpqOc90/1Wz5rEgkEg2ylVd5NAHWLFKqgakxcXTnas1142VqqFTJMmKeeWPQtj2D2TYm
         Y6czXU02Al5vs0JmMx41O9xUVWrS9bg5da9hDDrpb8Zm89KhX8tAKaBXyaH3JqYzHX2L
         2GuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747410946; x=1748015746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfVTbYoXwjAs2cz2zrsI3L1aEQTpGepDDARZoJ7IXyY=;
        b=FAhcIIrjwCF8jjNVafZ7TU6QRuQR1/rUfJQtw6s6NBrNCcVXrnIWl25kfhg4wegywV
         MJQabPBBDtv3yAyFY55a+oWXXgBKil1NliYo7PYgppHlxKmqfQktUWHB6msmfCSzXkRU
         xMKRzxAlpPKMA7qlj1xU7OwtAn/X3o2FP4/M/skxIYPLx4eNPJeaK/D+mnyXCTCba2gr
         wWFJiNxUs4cEZvrRy2w9myS2rZj1eXDUwz/sKEEa0gvrBj+s/w5w1nA6PlwfX4uYbCXF
         8e8/jJJxCCLJrj/OOWSqkiwzGu7alIUneTHkuqk7EzqSEdS/AKyK/QqIxsyXCt6c1+4D
         OCTQ==
X-Gm-Message-State: AOJu0YwU/54FogNT4Hr82NrxLwExN06QcAlUcEaKA3aFvYWOS2sWowsx
	LMtnFRIbKKbgUf/sMnfbtHnUkeUFXQ8tRg7/p1I8jrwhSMIacJw/RHERTi/tTPFXPMiXs7hgbDU
	gobzspLINRuFx2zEzNLS/m6VtLxRQY2o=
X-Gm-Gg: ASbGncuWyoffH0BgW/UaJVXk32NR80+4nKcEOoxrOKwCkTM6r+Mo8aqJoxfopglc3Eq
	2zIEzR8ANS5LugpkRZRxklMZCsW2DUSoKvNzu/n+AVr+TeVzmNknYq7kR621qCg0Dzx+B4NZZNH
	qXdlddVm5kWwfW8bz8YICuPXvYIB+jnUT9
X-Google-Smtp-Source: AGHT+IF8JeT/g2YLF5TDMZ83JSa//AwTqJxUNEIGL3+lOD0gkec1EsVvlPQgJomXmM/xXQjxwwe+jFotM5j8aoI60/s=
X-Received: by 2002:ad4:5cca:0:b0:6e6:4969:f005 with SMTP id
 6a1803df08f44-6f8b08ff966mr59086776d6.30.1747410945709; Fri, 16 May 2025
 08:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-0xoyMB9dujwM8O547Bx8OF+gTz_+rrE-brWG+F8Tjxg@mail.gmail.com>
 <13420.1747408046210278509@lists.openembedded.org>
In-Reply-To: <13420.1747408046210278509@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 16 May 2025 17:55:32 +0200
X-Gm-Features: AX0GCFtmnI2eHb1QSLtsbME4izelkEsE26eOGy3jZKgpNSPXWLkAeApNIr7i8iI
Message-ID: <CANNYZj8WRTH0He_BcxPt4q5VeHHkG8qyTFHfKL-_LGiuYstxVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cargo.bbclass: allow to avoid appending PACKAGECONFIG_CONFARGS
To: anton.antonov@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 15:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216757

On Fri, 16 May 2025 at 17:07, Anton Antonov via lists.openembedded.org
<anton.antonov=arm.com@lists.openembedded.org> wrote:
>    This change also breaks recipes where cargo is used as the top build system but PACKAGECONFIG_CONFARGS should not be included into cargo parameters. See, for example:
> https://git.yoctoproject.org/meta-security/tree/meta-parsec/recipes-parsec/parsec-service/parsec-service_1.4.1.bb
>
>   What is the reason for this change? If a recipe needs to use PACKAGECONFIG for cargo parameters then the recipe can update CARGO_BUILD_FLAGS accordingly.
> With this change I don't have an option to not include  PACKAGECONFIG_CONFARGS into parameters. Can it be reverted?

The reason is that the standard usage of PACKAGECONFIG definitions is
to define and directly supply arguments to the top level build tool.
This is how autotools, cmake, meson and other classes work, and this
simply makes cargo class consistent them. If you need to supply these
arguments some other way, then you can follow for example mesa.inc and
define empty PACKAGECONFIGS:

PACKAGECONFIG[amd] = ""
PACKAGECONFIG[svga] = ""
PACKAGECONFIG[virgl] = ""

And then use them to form a custom variable, which you can use as you see fit:

GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG',
'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd',
',r600', '', d)}"
GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG',
'virgl', ',virgl', '', d)}"


Alex

