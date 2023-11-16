Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8D6C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 11:01:17 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.4368.1700132476457882889
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 03:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NVJrjCfX;
 spf=pass (domain: linaro.org, ip: 209.85.208.42, mailfrom: erik.schilling@linaro.org)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso1005215a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 03:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700132475; x=1700737275; darn=lists.openembedded.org;
        h=in-reply-to:references:message-id:from:to:cc:subject:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XJrX5F43eqwt9rm6R4qu1KvkOZyEs1JP4rlCQ/aogM=;
        b=NVJrjCfXXpAsnRZgDM4ps/sbrRBkh597pwe576sg/hWN8JhCn0M6F50PVS5iUDZI8b
         kCmv8tK3Q9e4q39/cnOLvLW81RHKR89Vxz65JHxjvKWxUe9eve/R5KBWoDrjY/4Smj4r
         IR3b8ZzU/KE6BO4ZGY7a1ArJzZsCNxkOprv7ITNEEhhh9x61be1v7UW7wdM0XkE5d2YM
         7dg7iq/3wAL0AZlcsvMyWPLeRDrMfYmnDY41+raLrKs3LLHfa5ZFT8KAING2Sxmdi9My
         VUvHsFDnhYGqiYhHUVhkSAPO9b7nVrEdS82+nMdcAZYmvtJhZfb9U9EZhlewhGWpH2dd
         b8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700132475; x=1700737275;
        h=in-reply-to:references:message-id:from:to:cc:subject:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7XJrX5F43eqwt9rm6R4qu1KvkOZyEs1JP4rlCQ/aogM=;
        b=sArTbf8E92BG593bCWoNf+EOt4HYZqY0udDjm+cZw0KTw+WNXhVOivaCFRqbeMVvdZ
         pAVa1+Z+PP551WWtmv6CP9VFBKUiQeo4244ttmIYYP4aK80OW5M6gk0Nx3PJTISVpRrM
         n2QSkban2EL7ID+LqwdTSeW7da2HR7Hz7gxjFJuIQR/GVDZMmJM6/9TcAbMG5x5uvP5F
         sl4zekg8dmlXYX/upuUf8gCug0gyLGv0PrwSb0U/0Vk8NYTw4ko7oyQ0nMXaEd6i/RqG
         kmnLvwVGh5IeVnc35LODYt6vbtVGEIUIS9XOPc432oY/9GsDaw641bo4g6tgPyv9W9k8
         Tcwg==
X-Gm-Message-State: AOJu0YyJMOXc04TO8mDQZdz8btmOX/ySYactfTFFKDKnzPB2cQ9yByns
	v1aspYVk9GNKwM71BnYgpsWPlg==
X-Google-Smtp-Source: AGHT+IFwwh4SasFwaoizsQ+y7P23amV2MPCx0M/ANs+ufSm6uICk1HeyBZffkD1AMBbiPmgQ9r27sA==
X-Received: by 2002:a17:906:6703:b0:9df:867f:f74c with SMTP id a3-20020a170906670300b009df867ff74cmr10910305ejp.65.1700132474883;
        Thu, 16 Nov 2023 03:01:14 -0800 (PST)
Received: from localhost ([2001:9e8:d58f:100::f39])
        by smtp.gmail.com with ESMTPSA id b22-20020a170906d11600b009929ab17be0sm8224472ejz.162.2023.11.16.03.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 03:01:14 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Nov 2023 12:01:13 +0100
Subject: Re: [OE-core] [PATCH] uki: Add support for building Unified Kernel
 Images
Cc: "Mikko Rapeli" <mikko.rapeli@linaro.org>
To: "Michelle Lin" <michelle.linto91@gmail.com>,
 <openembedded-core@lists.openembedded.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
Message-Id: <CX06MBGV7SW1.U1FP0I3KC0RG@ablu-work>
X-Mailer: aerc 0.15.2
References: <20230901233231.1109712-1-michelle.linto91@gmail.com>
In-Reply-To: <20230901233231.1109712-1-michelle.linto91@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190776

On Sat Sep 2, 2023 at 1:32 AM CEST, Michelle Lin wrote:
> Currently, there is not a class to support the building of unified kernel
> images. Adding a uki.bbclass to support the creation of UKIs. This class =
calls
> the systemd Ukify tool, which will combine the kernel/initrd/stub compone=
nts to
> build the UKI. To sign the UKI (i.e. SecureBoot, TPM PCR signing), the ke=
ys/cert
> files are to be specified in a separate configuration file, and the path =
to the
> file is passed to the Ukify tool. UKIs are supported by UEFI and can impr=
ove
> security through predicted TPM PCR states, and reduce the build burden du=
e to
> its single PE binary format.
>
> Signed-off-by: Michelle Lin <michelle.linto91@gmail.com>
> ---
>  meta/classes/uki.bbclass                 | 140 +++++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_254.bb |  23 ++++
>  2 files changed, 163 insertions(+)
>  create mode 100644 meta/classes/uki.bbclass

Thanks a lot for submitting this!

We are very interested into this. Do you have plans to respin this?

Happy to help where possible :).

- Erik

