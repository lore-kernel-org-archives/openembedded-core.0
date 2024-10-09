Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39839CEE33A
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 17:53:33 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.23535.1728496404419548009
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 10:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OMcMwkCC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42e5e758093so314275e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728496403; x=1729101203; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCXi8BaCVIEwNXV77WFgp3X7VYyP80HB1Yvzw6KSQ/A=;
        b=OMcMwkCCc5gTCNejC8yoFbrs41hTqjvNpRjMC8UiMiM2JaroGqg28iufRk+QtDNMu5
         mIfnVfOpcbJ1zPuTYwPBWk+uIpFESaH2quxY26N9SdxZluF418OyaGk1NQnS4W9TyXGW
         YahC3utGJsIC5LnFym7Ee8NevF0yeTIkn1jd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728496403; x=1729101203;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCXi8BaCVIEwNXV77WFgp3X7VYyP80HB1Yvzw6KSQ/A=;
        b=nxi5oxusFp3HqAsSVowJv9Raz1oexzTXmbw1p6fCQ7aIxzabS2kRBAJl5L9fRlr1I4
         bn/aUfITbfD1TDYktPhzFxnUuaYAND4KxoE6gP1JGrKUadDdR6GbtA1U5Z3EETJ1iOjv
         T+qBSNkGof1Bjv+Ujy2GQitGgvwZNl5dQCFYJbfkQ1mEZ8kcJHX/0PUFAy91FL3xKLlA
         fKv+/iDKtvr8Sk7y+OsJGhZX4pjCOVUjulJDfLXfDO4gh8NqYBV+TzHE4PbWpNyabyJ2
         iMcmeZdTyrH+zqBFVQA25u8RYbDnNEIt/ivn3yj6mnMIbhafeuIfIP95AlV5YbHfKA2X
         sZWA==
X-Forwarded-Encrypted: i=1; AJvYcCVFrfhm7vIrzOW0RdGHfc7Xya4M65xedogFN/O5FycpbsxXNjGKGBy5NxY7nJnE0+PNm9rRV+wyk9TYuAo2cX6J6g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyxMsLnZPEVhm1MEKGmdohy3meuf0yym+CJCtahbpOQol3ZTH0q
	Ci6fax0iF+xIr0ccJHTptSXw/b14saih7nCXA41C+E6oLOPC5/RevTspoZig7SY=
X-Google-Smtp-Source: AGHT+IFoyZhzqhk7dDB5mrToZLeAfb/phm3tcHwia1dTvLB0axAPAWb28t+/Ifrvl4soQprV2yxT7g==
X-Received: by 2002:a05:600c:3551:b0:42c:ba0d:c766 with SMTP id 5b1f17b1804b1-430ccf0418fmr24891875e9.6.1728496402696;
        Wed, 09 Oct 2024 10:53:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fb33:4e5d:4941:5018? ([2001:8b0:aba:5f3c:fb33:4e5d:4941:5018])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf31b76sm27098675e9.7.2024.10.09.10.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 10:53:22 -0700 (PDT)
Message-ID: <28b95168c2a76d9b9bb69b874aba34fe85a03a3b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6 0/8] systemd uki support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Wed, 09 Oct 2024 18:53:20 +0100
In-Reply-To: <20241009112634.402123-1-mikko.rapeli@linaro.org>
References: <20241009112634.402123-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 17:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205366

On Wed, 2024-10-09 at 14:26 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> These changes enable building systemd uki images which combine
> kernel, kernel command line, initrd and possibly signatures to
> a single UEFI binary. This binary can be booted with UEFI firmware
> and systemd-boot. No grub is needed and UEFI firmware and/or
> systemd-boot provide possibilities for boot menus.
> The uki binary can also be signed for UEFI secure boot
> so the secure boot extends from firmware to kernel and initrd.
> Binding secure boot to full userspace is then easier since for example
> kernel command line and initrd contain the support needed to mount
> encrypted dm-verity etc partitions, and/or create partitions on demand
> with systemd-repart using device specific TPM devices for encryption.
>=20
> Tested on qemuarm64-secureboot machine from meta-arm with changes to
> support secure boot. Slightly different configuration tested on
> multiple arm64 System Ready boards with UEFI firmware, real and firmware
> based TPM devices. Tested with ovmf firmware on x86_64 with selftests but
> without secure boot which seems to be harder to setup in ovmf.
>=20
> Sadly I see two wic selftests, wic.Wic2.test_rawcopy_plugin_qemu and
> wic.Wic2.test_expand_mbr_image, failing when executing all wic selftests
> on a build machine with zfs filesystem. Will investigate this further.
> The issue seems to be in mkfs.ext4 producing broken filesystem, and parti=
ally
> in the tests which don't run the correct rootfs file (.ext4 vs .wic).
> Will debug this further and it is IMO unrelated to these changes since
> they reproduce on pure master branch without this series.
>=20
> v6: fixed wic refactoring botch which broken non-uki systemd-boot usage o=
n
> =C2=A0=C2=A0=C2=A0 genericarm64 reported by Ross Burton <Ross.Burton@arm.=
com>, added
> =C2=A0=C2=A0=C2=A0 selftest to cover this wks usage on x86 and aarch64
>=20
> v5: drop patch "image_types_wic.bbclass: set systemd-boot and os-release
> =C2=A0=C2=A0=C2=A0 dependency for all archs" since systemd-boot does not =
support all
> =C2=A0=C2=A0=C2=A0 architectures
>=20
> v4: handle missing runqemu variable from build config, add
> python3-pefile to fast ptest list
>=20
> v3: rebased, fixed and added more sefltests, removed wic plugin side uki
> support
>=20
> v2: https://lists.openembedded.org/g/openembedded-core/message/204090
>=20

This seems to be causing selftest failures unfortunately:

https://valkyrie.yoctoproject.org/#/builders/54/builds/206/steps/14/logs/st=
dio

Cheers,

Richard

