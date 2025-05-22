Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D08C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 18:42:11 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.17895.1747896711086861406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 23:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AAX5Pc73;
 spf=pass (domain: linaro.org, ip: 209.85.128.170, mailfrom: ilias.apalodimas@linaro.org)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70de8897628so18599067b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 23:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747896710; x=1748501510; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vzDsHsfdIpWItEIQPXS+PIT52bNwumpeSA75ZE21Hoo=;
        b=AAX5Pc731BbKV1aWg85NaMePSZgZXg7uVkrNLPu+fpwnil7ntTcJNR9lhn7kIv8NM+
         CznztSJhQHV7e4SfErMamJ8Kl+1djhBbo/fv59kKWn77R4myAG4kUD1avXsmBYIkWpyo
         JgdwA+ieIoWlyJ2VQf4mSBHnb67HqjjBIDrNzuUZYDCs/F4lC56q762tNJPp38vuWacy
         KEbGdjpnJpwlM4ji3TTNkGLJUzKWfDzujtlR2DWmgn8OFXyNeiZU7l8E27UEE1dILhoF
         PMy7WBSywoHc/YlyCx+RX79UxBbA7K1QMgfJ8oG5dsDsvAip9SY6uqzUvhkifklNhLe5
         H7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747896710; x=1748501510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzDsHsfdIpWItEIQPXS+PIT52bNwumpeSA75ZE21Hoo=;
        b=lS3GXStviS6Hs1ClixhUqtumF3Nth2F7VNVj4avfn6m9SYwOnujGR4rltAub9Z9bNr
         7LSHE8fZ/P7rMAAvZmwDyEOpjT5+o0o8zHcbvscQ/zADc6uqCbZD+sZVx49roDkpC009
         8JigrUHjwiOqDrK097rMsSEE6F0C0aWZhtV4wE2ioSw1chqR8YdN1A01gkwHCRwzUvQx
         x8uSzHugOnwimkrbvUPNjaeYYGkSij3zS2pbXBfVbM+u/F/QejmBrHD90aD69B6Ur8YP
         Ou2QiCOzDmWC5JZkiwASIqT26j0yafiWi83xWSWgm7M+touPi5wPD+8BwQt1lR5ngCv4
         wQRg==
X-Gm-Message-State: AOJu0Yxy4lDth5BmI6TWfGK+aUZ3uQCZqI1YkALuYmcaukeLxymzJM4d
	o8s8aWv0wOQPL8Qnlo2B2+OBhn1qFwSvtABGgQzny6SEzpq+Z4pzphicUNCt+frqV5avLxMu1ZY
	uMDQFc2+1U0vwcHYrQ1YYCa2k56Ww5hVxIisYISuLzByILc3CiXy0zdI=
X-Gm-Gg: ASbGncvMI4dASnsdfxnnHct++GECEDBOzoLDv9IgHDfEOPFZr2bXswLephar9oqU1Th
	6Ami4mYT3CLPajgsu7eJTzmSBC5Gc3Fh+ZwviiXHY9yt8gH/SlfB9mcIJJ4XqLZ8l0h5GlaiA+Q
	Upr6uNC82xEW4/Q7dcNy0gy1xAa4iQHMS/aw==
X-Google-Smtp-Source: AGHT+IFfuXp2SfdUy7OH+p4kH1bIQWXewtK1qypnalSNfW4WrgQ6H/QAqua8ZsZlLmXnvWg0RK2NfktbgUHQF4PaLX4=
X-Received: by 2002:a05:690c:39c:b0:6fb:1e5a:fcdd with SMTP id
 00721157ae682-70caafc5f61mr301867337b3.17.1747896710183; Wed, 21 May 2025
 23:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250521184906.181219-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250521184906.181219-1-mikko.rapeli@linaro.org>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 22 May 2025 09:51:14 +0300
X-Gm-Features: AX0GCFtRIW3ZSsl-sM92ikOUGq8af_73jIPi9Tuw3Y_z1U0rXWVT2_UO-Ifc6O0
Message-ID: <CAC_iWjLC2z7F7w_LELCqK-TDS-Pd41v8EPKj1HY1shwqMa2g7A@mail.gmail.com>
Subject: Re: [PATCH v2] u-boot: disable CONFIG_BLOBLIST on genericarm64 and qemuarm64
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 18:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217145

Hi all,

I am not a yocto expert but this looks reasonable from a u-boot POV.
On Wed, 21 May 2025 at 21:49, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> Booting u-boot on qemu with kvm is currently hanging on aarch64
> build host. Root cause is in u-boot and CONFIG_BLOBLIST can be
> disabled as a workaround.
>
> To reproduce, build on kvm enabled host where "kvm-ok"
> succeeds. For example genericarm64 machine and core-image-base
> should then boot with:
>
> $ runqemu slirp nographic novga snapshot kvm
>
> On qemuarm64, default kvm setup will boot directly to kernel
> and is not affected by this. If build enables u-boot as bios
> then the same issue happens.
>
> Without this config workaround, the boot hangs without
> any messages in qemu output but ctrl-a-c to qemu console
> can shutdown the emulated machine.
>
> This seems to have regressed after u-boot 2025.04 update.
> KVM boot can be detected from speed, for example genericarm64
> boots in 550 ms with KVM and without in over 5 seconds.
>
> Fixes: [YOCTO #15872]
>
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---

[...]

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

