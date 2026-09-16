Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0408C982D1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 05:25:17 +0000 (UTC)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23989.1789588552602814509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 12:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=KImtwvZh;
 spf=pass (domain: baylibre.com, ip: 74.125.230.205, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530fa0716f6so14028091cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789588551; x=1790193351; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sIdcVIA8MRFnQadgQ3C2ArfAlYZ83VH7si/v2wVKAV8=;
        b=KImtwvZhersLhShRTeB3h9ilvQxh/Grk+JK/7ammDPUvezg5fQ3d/RWpoqRBzoJoBf
         plElAL1noigj0cxe0JzAwAIcHNMyZy2coY8Y0D3LTLVuGO4spOugcbDcx0EKXLm5WygP
         xy5LOzjG0HqlGp9aAA/pDzdwjVo5GYej+cEfZyKMOhK6f6yOxn6fjZerPNWbK3emPY+n
         nAwIpePEOJKM6UCOUMJh7y7Ux1RywImivcId0FXc/kZJSptugh0CSf8ZCAE+P8mGhHd6
         u+MXw2qv7qNiCTjE4t6VmL+7pkDIROwjDyD0sX5f/Ht2RS0/ZwVGxogee+9okhn0caUv
         p/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789588551; x=1790193351;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIdcVIA8MRFnQadgQ3C2ArfAlYZ83VH7si/v2wVKAV8=;
        b=fmeVTG5VEBW2yPUJz1NkqW2gr8JFWjEk8is8Dl+GhQ84ZHSU246UFEv4VPiZCz2Lvy
         TqIpoi6RH0Q19SzyxbACNMw/uDsqCJxMQlxqvY37cTCAt9r2u2v+rlCqW91hvO0G90ym
         /ypnJZuzur7uH3Vj3IPS5uMNvkCmorUhGj74xsunNVESSBNQoOyG7FhrvCE58R8ca+uM
         QfRxbMKxYLb9tKV3Z8+YsComNRG6McwCJCRuPUBODQVGw4YRgZ4NdPagHTSNBNfx4pKI
         ZfHcoQEIkweVHhUG9Iyg5t//QNL6GFdOi8HU07NKbHGnWpAPAGK0UE6DmvqQVVvnS/te
         JYlg==
X-Forwarded-Encrypted: i=1; AKwUvByz+l8+rvbJChfAin092hbTgw+d2sZ8ZVS3OLb8vnM/ihdK20Pao9TrTViXtLreKeyASryaFxUcEjzc2U1PIaapDg==@lists.openembedded.org
X-Gm-Message-State: AFuF++kWicE8BLQ1ojfrcSWzJsT+uXwpuiGGQhjqH2LKum8tvcRiPYpd
	UzaIUkbbG/Eu1GA/u0GwZwkKacUMKbuR4QK2wfnZcqc6MUU0gQyZHUDY6IZ6r6uhXS8=
X-Gm-Gg: AYBFou3+pKcRKWcJwaeeqg/7ncDXlfc/4Y6TgAJvIZ08m4TRInNQyHQX4gH5zaROfzh
	nZ/UXHF4hbreLDFLzXCA7de7LNJm7RJtcsxY/AuHBgwGtJI25dYPpl1b0W5t4S8DlRXfiWVW7Vm
	ed9AKBEBvPMyyhIxZHaarmRuUQWKXQY/CLfF0eCzpVtWd48yp3Hs+aWHK+GFZwICebSxhxhmXm8
	JgnKi5p6o8+0fKfhWV22lodz59vXgSihh5Kf22xo2E4Suseue7rpRu/ls1suhZu7BksDMcjRBa4
	vkh0E8d6G3k0o/JNWGy3GDLy7wsYBKGcPIXu3BuwK9PVbpOtVKcMbxTtDwTc3G7jORMH9BPQG7E
	A62j1vgujmTaRVqb9TGQplbTs+tes6kbPts2ZOEFsLAe0uJi3FN4ezlKMhGSp0iM2VglEGWmEGx
	5du/kdkBi7KbUiJBelQ8Uncubmg4pZUREjo01sfCXZb4osBrS3m1Y6p3nu9R68iH6tPT48fbvvI
	XJdF1KaVUW5HpvlO+/5Jd0NG45qVGjW5Q==
X-Received: by 2002:ac8:7e95:0:b0:530:e429:ea81 with SMTP id d75a77b69052e-5327ed752bcmr69884511cf.11.1789588551523;
        Wed, 16 Sep 2026 12:55:51 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53261fda219sm29684201cf.10.2026.09.16.12.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 12:55:50 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 16 Sep 2026 15:55:48 -0400
Message-Id: <DLH071QT0TBB.7KZL5MFA90WQ@baylibre.com>
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <tgamblin@baylibre.com>
Subject: Re: [wrynose][PATCH] qemuriscv.inc: use fw_dynamic.elf as BIOS when KERNEL_DEBUG is enabled
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20260916121517.1513695-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20260916121517.1513695-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 05:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246018

On Wed Sep 16, 2026 at 8:15 AM EDT, Harish.Sadineni wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> QEMU RISC-V hangs (qemu hang-up) when using fw_jump.elf as the
> default BIOS while kernel debugging is enabled. This has been
> observed with the 6.18 kernel (exact version where it was
> introduced is not known).
>
> As a workaround, switch to fw_dynamic.elf when KERNEL_DEBUG is
> enabled, which avoids the hang and works correctly with debug
> builds. The default behaviour is unchanged and continues to use
> fw_jump.elf when KERNEL_DEBUG is not set.

It'd be good to understand exactly why this doesn't work and what changed
upstream. I'm looking into it in a local checkout, but I probably won't hav=
e an
answer for a day or two.

Trevor
>
> [YOCTO #16409]
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/conf/machine/include/riscv/qemuriscv.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
> index bac376ce5a..6e7d4a8adf 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -29,7 +29,10 @@ QB_SMP ?=3D "-smp 4"
>  QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
>  QB_CPU:riscv64 ?=3D "-cpu rva23s64,pmp=3Dtrue"
>  QB_MACHINE =3D "-machine virt"
> -QB_DEFAULT_BIOS =3D "fw_jump.elf"
> +# Workaround: fw_jump.elf causes QEMU RISC-V to hang when KERNEL_DEBUG
> +# is enabled, use fw_dynamic.elf in that case instead.
> +# See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16409 for more=
 details.
> +QB_DEFAULT_BIOS =3D "${@bb.utils.contains('KERNEL_DEBUG', 'True', 'fw_dy=
namic.elf', 'fw_jump.elf', d)}"
>  QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscr=
ipt=3Dno"
>  QB_NETWORK_DEVICE =3D "-device virtio-net-device,netdev=3Dnet0,mac=3D@MA=
C@"
>  QB_ROOTFS_OPT =3D "-drive id=3Ddisk0,file=3D@ROOTFS@,if=3Dnone,format=3D=
raw -device virtio-blk-device,drive=3Ddisk0"



