Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87900CFA452
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 16:58:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.2753.1729702734613655544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 09:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cNEreFfP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so85457375e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 09:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729702733; x=1730307533; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVd+olwtgHi3qiUP4T34tE6te/5NcMpMB31+24prTBE=;
        b=cNEreFfPBLbkhPULp30fwwc+td8vWuo4y0BxojHz6dEdjLgic/OLWOdJ+8goP1pcT7
         VgKUM8JaG6w/df2er4Jhla6TGwche/SaluitCz0yGjY+NPZ+PdV0CogjMPH9EM4Iz4u+
         P6Hb52rno3xvDGrYl3rvWMGE7aMWrzG0BnbbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702733; x=1730307533;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kVd+olwtgHi3qiUP4T34tE6te/5NcMpMB31+24prTBE=;
        b=r+Ta8dB9bGsc08LfOnqgTWab+VogfCDHAGdJzukbVreLkb1EgWj+JFy2e/LrH9odxS
         03nQ96dQh/fATrdSwbu/NxaIrtowWS8GjGKSXsn5/4wQ0V9V0Ptu/9et2Ou91ixPRzLX
         wNMAcZCiyu85ERKPhKZ30OuQPycvrWIcwE5HyPwgfP55PkYPAAeMLgzLPYgg0szENVm0
         8OcWPROrDyQJBy2IxCJBggOiWeCHnYENoblIEgHrsbsZmAiOqvN7RbgQftvi5i+kiuEr
         iMskPE6A2blnD8HLF/f/3uXiJJC5e2DXIk6YBhPzQf5d1g7ucJrrHx85+HX/CDGa/sU3
         Ctzw==
X-Forwarded-Encrypted: i=1; AJvYcCXoOyT7Soh/E1hqpIjnAnwtVwKonmiHcvy3NTgnCUHZWIJVmjkV0QjMJnHxY33Kk9WJLCQB3mZ6g7VZmNaAc2dNMQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwzgnERTaQDr7oBp9t51aDktbf2u4ISzraOQ/zTE++rrec6HD86
	LuHzc0vfJwHK1MkS+v1RnSJJnhp5dAb3C5ayT34ncOkyCw0+I0Rp5UlHWSxYgb4=
X-Google-Smtp-Source: AGHT+IGT9xDFz7PfPe2YxCB4yfa77A1AXpiGjcO0ALpu3ogOQ+6jGAt7DcHPw84QGGejAeLzqOLDiQ==
X-Received: by 2002:a05:600c:3b85:b0:428:d31:ef25 with SMTP id 5b1f17b1804b1-43184201d6emr38116275e9.12.1729702732945;
        Wed, 23 Oct 2024 09:58:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f? ([2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bd22a6sm21935855e9.6.2024.10.23.09.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:58:52 -0700 (PDT)
Message-ID: <ab06bedec727e77a97b360e9d9bd68ed60c5be89.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v10 0/9] systemd uki support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2024 17:58:51 +0100
In-Reply-To: <180122B0064457FF.13420@lists.openembedded.org>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
	 <180122B0064457FF.13420@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 16:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206256

On Wed, 2024-10-23 at 17:44 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2024-10-23 at 15:08 +0300, Mikko Rapeli via
> lists.openembedded.org wrote:
> > These changes enable building systemd uki images which combine
> > kernel, kernel command line, initrd and possibly signatures to
> > a single UEFI binary. This binary can be booted with UEFI firmware
> > and systemd-boot. No grub is needed and UEFI firmware and/or
> > systemd-boot provide possibilities for boot menus.
> > The uki binary can also be signed for UEFI secure boot
> > so the secure boot extends from firmware to kernel and initrd.
> > Binding secure boot to full userspace is then easier since for
> > example
> > kernel command line and initrd contain the support needed to mount
> > encrypted dm-verity etc partitions, and/or create partitions on
> > demand
> > with systemd-repart using device specific TPM devices for
> > encryption.
> >=20
> > Tested on qemuarm64-secureboot machine from meta-arm with changes
> > to
> > support secure boot. Slightly different configuration tested on
> > multiple arm64 System Ready boards with UEFI firmware, real and
> > firmware
> > based TPM devices. Tested with ovmf firmware on x86_64 with
> > selftests but
> > without secure boot which seems to be harder to setup in ovmf.
> >=20
> > Sadly I see two wic selftests, wic.Wic2.test_rawcopy_plugin_qemu
> > and
> > wic.Wic2.test_expand_mbr_image, failing when executing all wic
> > selftests
> > on a build machine with zfs filesystem. Will investigate this
> > further.
> > The issue seems to be in mkfs.ext4 producing broken filesystem, and
> > partially
> > in the tests which don't run the correct rootfs file (.ext4 vs
> > .wic).
> > Will debug this further and it is IMO unrelated to these changes
> > since
> > they reproduce on pure master branch without this series.
> >=20
> > v10: disabled kvm support in new tests since it breaks qemu boot on
> > aarch64
> > =C2=A0=C2=A0=C2=A0=C2=A0 build machine, removed "testimage" from IMAGE_=
CLASS as well
> > since
> > =C2=A0=C2=A0=C2=A0=C2=A0 can end up testing qemu machine during build.
>=20
> I hate to say this but
> wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aarch64 is still
> failing:
>=20

https://valkyrie.yoctoproject.org/#/builders/23/builds/320/steps/14/logs/st=
dio

> wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aarch64
>=20
> :(
>=20
> (I know there is another failure in there too).
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206255):
> https://lists.openembedded.org/g/openembedded-core/message/206255
> Mute This Topic: https://lists.openembedded.org/mt/109169005/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> richard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


