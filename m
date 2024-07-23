Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4172EC3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 10:51:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.41355.1721731865301737412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 03:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PbUNABVZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-427edcc207cso6013865e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721731863; x=1722336663; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xttD4WSL90EcD/DeafZZXh3PIAi48qj8gOaa4vQ7tZ0=;
        b=PbUNABVZMxRIFPrLt8G6A/EDJeu7AzfTW+uOV6RXPGX2+h6O+u9O7q0eEY4Wzm7RBH
         HoBNJgjkxysVD9cSfhLZIvHkOBjlrt3eV0KDBho4B69NmY9WobfmzsnVHgIVUyk0qBF9
         XSeTykKlBKL1W6GpHrFsM+v59T5kfrMv/gUWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721731863; x=1722336663;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xttD4WSL90EcD/DeafZZXh3PIAi48qj8gOaa4vQ7tZ0=;
        b=diU62m1VWEZD2EElcJyQyQE1oRvNVpe3XYhsUcHXD4VqYV0zpoVPJ86/yx/o3vsv1D
         NC/J5yVSS0QVxyCHYeiQJEwj4VeKS9VLb5IUTQkGrLBx2p00N0v+Wzb8GVGWi8jPoe0k
         c3L1JGLxBHdg39gKSq8kdfLGaONPkOItuMunghMBbTQc1ic2Sg7w7qhAB3k0fxd2oLlw
         LXArqOMj0MnnWgCGP6jXEDR/DhxTalRz8ktnIw/SRM0SZ9W8IHxbn1/ly1NKlndzrWOw
         JSagZ6qTOCspOKjZqp57/f2b/0wsrAG1XFW5h/XUSB78cb9Pl5/COczugw0VB5uTTJou
         e73w==
X-Forwarded-Encrypted: i=1; AJvYcCV3kx2yFrsjXkDQKT6rAV5k3kqBUGTu6Wxu1EvSERyQWc+9EBErB6kYQ1jz6A40pC3b6ytzGJUIqbKwqRaSjN+RQi+r1IgF91ZQgko1okScHS3U/SbA/29I
X-Gm-Message-State: AOJu0Yws3xD8juue4Vxe/ikw2mUHOf+GHk+seo5MqTAgwpkhbk4vSaI+
	cEzuKRWx/caX8b+P05PZ54VP2e1AII/a03+ucvhFwEYPNWCIpEZBvTNJOHZJZ7c=
X-Google-Smtp-Source: AGHT+IFEDtnLXm+xIySIbaGD9SCcCuuvr5qilpRcZNLloXIc4rh/NO3ZQ/t6X262/aAzaEzQMDCk9Q==
X-Received: by 2002:a05:600c:138a:b0:426:6f3e:feef with SMTP id 5b1f17b1804b1-427ed0599a8mr22106425e9.29.1721731863206;
        Tue, 23 Jul 2024 03:51:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dcbe:ae7b:e03d:272d? ([2001:8b0:aba:5f3c:dcbe:ae7b:e03d:272d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a8d8a8sm198699475e9.36.2024.07.23.03.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 03:51:02 -0700 (PDT)
Message-ID: <3ce8cc9108715bb23b6550b841a07511e0dc786e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6 0/2] image-bootfiles: new class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: marcus.folkesson@gmail.com, openembedded-core@lists.openembedded.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, kweihmann@outlook.com
Date: Tue, 23 Jul 2024 11:51:02 +0100
In-Reply-To: <20240710085310.147425-1-marcus.folkesson@gmail.com>
References: <20240710085310.147425-1-marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 10:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202335

On Wed, 2024-07-10 at 10:53 +0200, Marcus Folkesson via lists.openembedded.=
org wrote:
> The image-bootfiles class is used to put all files listed in
> IMAGE_BOOT_FILES into the root filesystem.
>=20
> IMAGE_BOOT_FILES is used by the bootimg-partition wic plugin to put the
> files into a boot partition.=20
> Be able to list files as "boot files" in e.g. your .conf or image files
> instead of install those in every recipe is a good thing.
>=20
> It is not always desired to have a separate boot partition for boot
> files. Sometimes it could be good to have them as a part of the root
> filesystem.
>=20
> For example, if a double copy strategy is used for update the system,
> then you probably want to update both the boot files and root filesystem
> at the same time as there may be dependencies.
>=20
> v2:
> =C2=A0=C2=A0=C2=A0 - Removed the documentation from the patch series (wil=
l be submitted later)
> =C2=A0=C2=A0=C2=A0 - Break out the parts in bootimg-partition that is use=
d by
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image-bootfiles to a common library
> =C2=A0=C2=A0=C2=A0 - Make the destination directory in root filesystem co=
nfigurable
> v3:
> =C2=A0=C2=A0=C2=A0 - See changelog in patches
>=20
> v4:
> =C2=A0=C2=A0=C2=A0 - See changelog in patches
>=20
> v5:
> =C2=A0=C2=A0=C2=A0 - See changelog in patches
>=20
> v6:
> =C2=A0=C2=A0=C2=A0 - See changelog in patches
>=20
> Marcus Folkesson (2):
> =C2=A0 bootimg-partition: break out code to a common library.
> =C2=A0 image-bootfiles.bbclass: new class, copy boot files to root filesy=
stem

During review we've been in two minds about these changes. It is a
fairly specific use case. In general if you wanted these files in the
rootfs, you'd never have set the variable in the first place. Setting
the variable, then using a class to put them back where they were
originally seems a strange thing to want to do and I'm not sure we want
core support for it.

That said, I understand how someone can get into that situation.

We have therefore merged the first patch which allows a standalone
class but we don't really want to take the class itself. This is partly
also partly as there wouldn't usage/testing in core.

If there becomes a large number of users of it over time, we can
reconsider that decision but right now, I don't think it make sense.

Cheers,

Richard

