Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7928FCFA452
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 16:44:36 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.2416.1729701870515866399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 09:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d6y1Wv8a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43158625112so69825565e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 09:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729701869; x=1730306669; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+D7PmAYwi9NOlp8izuPG086KBSw3cQnComLDc5VI6A=;
        b=d6y1Wv8aew21v61tnRa0xjba45jY4Psr8dB5WLyGyfWjCUUhJbiXeMEU1LdKy9vp43
         jPCYj1I7m/rlnSkEduMfCpgT5zFdj2hSvbIAWxF6mgIY9Bm9zS02Vy/41anY+qf3wPNp
         5iTXFAZaS9Ft6PPHMW3ilKuaC+59wYrFqJAx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729701869; x=1730306669;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e+D7PmAYwi9NOlp8izuPG086KBSw3cQnComLDc5VI6A=;
        b=I0QXkrJEZOCJv1gknDcdueQKryHqEawSWYjrk8+uzqWJ0wkHvu6x5EKyvgVOLVmdWQ
         oWpyT/ml7PGLLSeW0QcRPjKQ1Kq4pTgsamL96jsNDqVZMbkXykZL2tcN/psP6BPMm9lY
         d3eg7RP0r8WXfUHsWymHUZcef0gBOruVxmhKElKxz161lHgKwjADXMzZbcDhluaon7rj
         871vSnoCzX5acHsUfta5ftERTb9N9OYB2Nkn1xgD/Gnip7MwKro41PjhX/3shaqZ7O1Z
         qRFqGIVwsR9EvqAi/9RZjPDDihB3ZHMHoCsrqVmO9iE/dV7N87mLpCmAXBFLBp5U7128
         Nxgw==
X-Forwarded-Encrypted: i=1; AJvYcCWH7tnFy3TmJn0TLsbFDHQnwmjwFQ8IdD/tk3GmsI89jL0tP6WaNRR1PZX/11OUlMannTia3PnpBS2gQK1yMWgqCQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwuVoeKmFNP2xTTC/TzBrW9mlMwGLIuhMqw1CWlY48SFkwP5lje
	rJk+bzgbweMrjzw/FtH5ufivd10iKHXpUKvDj0168QcbeX72qDRR9jteKMLWVzI=
X-Google-Smtp-Source: AGHT+IF3OznbJ8C1DWS6OUCK5Nq8xhJuUQin7DiIe/q6Na3Yp6FGUZmESi5yDnHewwD3EmyOYXUadw==
X-Received: by 2002:a05:600c:35d3:b0:431:52f5:f497 with SMTP id 5b1f17b1804b1-43184201d58mr27945605e9.9.1729701868562;
        Wed, 23 Oct 2024 09:44:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f? ([2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c0f4cbsm21117665e9.38.2024.10.23.09.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:44:28 -0700 (PDT)
Message-ID: <1fca6edb5ad86f24bfa9b465746a55dc81bc4513.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v10 0/9] systemd uki support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2024 17:44:27 +0100
In-Reply-To: <20241023120839.437771-1-mikko.rapeli@linaro.org>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 16:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206255

On Wed, 2024-10-23 at 15:08 +0300, Mikko Rapeli via lists.openembedded.org =
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
> v10: disabled kvm support in new tests since it breaks qemu boot on aarch=
64
> =C2=A0=C2=A0=C2=A0=C2=A0 build machine, removed "testimage" from IMAGE_CL=
ASS as well since
> =C2=A0=C2=A0=C2=A0=C2=A0 can end up testing qemu machine during build.

I hate to say this but wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aar=
ch64 is still failing:

wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aarch64

:(

(I know there is another failure in there too).

Cheers,

Richard


