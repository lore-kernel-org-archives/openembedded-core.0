Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0138CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 23:26:06 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32148.1781825160489573578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 16:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WGDeRqfa;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-462342ac290so1724378f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 16:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781825159; x=1782429959; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aO/NQgbAoteKwLGKurZPEkOrn+FFr1ENKJEfl8Lym3k=;
        b=WGDeRqfaowIKOw+vo2UInlO7FiupYx46/sp4cre1JCZ74SunG1vMBEHK6SIci1C0uf
         71p7UU+lTk3j9wvbO1lzR9Mlo1kfUhTnVA1u3j4/6+dVrw5ZOAktcPagYeJhblTUI6EB
         qSRYeCPoP3qvhtUJ6OYrLnlUcH6WS5k6CIh9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781825159; x=1782429959;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aO/NQgbAoteKwLGKurZPEkOrn+FFr1ENKJEfl8Lym3k=;
        b=WperaDgzfODp8CAy2HCWBp+1pXNe45be7rHYuLtUWaSn9FiYa73l7Km6OqQuq1hrf0
         wU+Y/fC5cWb2RPl/FV+oAnLJbFqZS9YqEmA77UkKxTRubRWxDm2/jjEIsyBanw1uA3zn
         mTP9vBF1bHsU0jNV058kzfE9iJbgx5sd77orCuScgM5a6lcP7BJY0C6NYFnSfhZbIHTa
         t+BULTg9k4G6ZL+7PG5SDINxmr5kimSS3FZ15l4ot/Jr3PHK3Hb2mWDVnR8IdwAxBBgX
         5f8F7rOeD7N26Y4p1fV6HBT9Zs7zQXRFgGsL8LWQ1es5UCezhXE3uBjF4z1yY7h/PhPx
         GeYw==
X-Forwarded-Encrypted: i=1; AFNElJ/b4L/9Kjw1KyUo675ZcTh32AQzr/az35QFuY1JFf/6CKZPHkk6/uzk8EyxiuWVWb6IcxC0slendJBQ2/cuarhVEw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6l9YRGz2XS5Z9g5GQh7ENIdJSrQqk38rastToAzlEeVOf3F0o
	a2vTzKLV9RADTQr/AqfAQj2qR6kequpnUc5WfYTvUSdmb/fG4u3V8Y1w99vmQ9h9bor5KTzESLz
	81Df8
X-Gm-Gg: AfdE7cmEfgdfpgLc5Wo8R8vyZFJ8lK13h3gc1e9XFqZlssNdy7cANiGqfUa+VUEujZ5
	j7kjRl7xJGp00tGqHdWVco6OFmlGk1NYtWjV7r4riiqWRL3WV98jGHAgI1EfzF7GL6U8Y2MuUWF
	LeWD7Jp0Gvvgr9hQRaBqaDc6HzbyUufw9UFZ6jPxXDLOLmcIaCpHNcXNz7lwVabsmTDZzhkUBrf
	4GkLdT6Nbab6Q39TFqz7lbPsdKuI9eGcHhdvpWHhJjVHR3fCpI3K9Y68+6r5Cbspu47kpyZCLUq
	YD03GjSWBaAks9am8DI/Emzvq/WGoS8OmnVMuuADKQttFhh0cYKaBSM9TSKMyzsirYT7+UyIBgx
	kUW2nQ14Rso5QFEdkfUXOR/XYTM9hbgg0xG9XMD1OCicXHSYA5eizyFP/fhgwXwV0ANeuPOSYEZ
	LwaXed0L43mmKnc9T+LwZxEGIiskEBrEjey/0RoZXPlX0DOjiC9qyLrw7i1/6Q5R8D4MAUkXkZL
	7K2HWtKth0pGdxD
X-Received: by 2002:a05:6000:4286:b0:446:db72:e8ec with SMTP id ffacd0b85a97d-4656e0e69c2mr78726f8f.23.1781825158681;
        Thu, 18 Jun 2026 16:25:58 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e7e9bab757cf3530.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e7e9:bab7:57cf:3530])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46508a0546fsm2644102f8f.2.2026.06.18.16.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 16:25:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Jun 2026 01:25:58 +0200
Message-Id: <DJCKAX9D2875.AEHB2EDX41QW@smile.fr>
Subject: Re: [OE-core][scarthgap 19/30] linux-yocto/6.6: update to v6.6.129
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1781682189.git.yoann.congal@smile.fr>
 <b6d217f723359c19abb8ca2da9d14c3608a4a51b.1781682189.git.yoann.congal@smile.fr>
In-Reply-To: <b6d217f723359c19abb8ca2da9d14c3608a4a51b.1781682189.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 23:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239115

On Wed Jun 17, 2026 at 9:44 AM CEST, Yoann Congal wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating linux-yocto/6.6 to the latest korg -stable release that comprise=
s
> the following commits:
>
>     4fc00fe35d46 Linux 6.6.129
>     [...]
>     c233e1e81873 serial: imx: change SERIAL_IMX_CONSOLE to bool
For the records, that ^ commit created a warning on AB that I did not
notice[0]. I sent a fix for it[1] and I'm preparing a pull-request
without the kernel upgrade.

[0]: https://autobuilder.yoctoproject.org/valkyrie/?#/builders/60/builds/39=
43
[1]: https://lists.yoctoproject.org/g/linux-yocto/message/16752

>     65f2c608096d staging: greybus: lights: avoid NULL deref
>     [...]
>     ffba40b67663 RDMA/siw: Fix potential NULL pointer dereference in head=
er processing
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
>  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
>  3 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_6.6.bb
> index 8685e5cbf6d..8250679ed0f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> @@ -14,13 +14,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to linux-yocto-rt to enable it")
>  }
> =20
> -SRCREV_machine ?=3D "c45743dc8dc2ddfbe7bd165997e1f7cf887fa6b7"
> -SRCREV_meta ?=3D "45f69741c733e066ed1a12b6025e347e5cd6063e"
> +SRCREV_machine ?=3D "8751b899ea5af349e8570e8985365290efa5e7d6"
> +SRCREV_meta ?=3D "fdd48963e673d657f0df21b4b1fb6b18dbaa96bc"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine;protocol=3Dhttps \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps"
> =20
> -LINUX_VERSION ?=3D "6.6.127"
> +LINUX_VERSION ?=3D "6.6.129"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/rec=
ipes-kernel/linux/linux-yocto-tiny_6.6.bb
> index d6a9afdf17e..bd4a10b5640 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> @@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
>  # CVE exclusions
>  include recipes-kernel/linux/cve-exclusion_6.6.inc
> =20
> -LINUX_VERSION ?=3D "6.6.127"
> +LINUX_VERSION ?=3D "6.6.129"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> =20
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
> @@ -17,8 +17,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
> =20
> -SRCREV_machine ?=3D "8247922ff493e4fef938ce36562cac9c0cce86aa"
> -SRCREV_meta ?=3D "45f69741c733e066ed1a12b6025e347e5cd6063e"
> +SRCREV_machine ?=3D "d82c6cc64c037058c6bfd630f2d2604a38684c7d"
> +SRCREV_meta ?=3D "fdd48963e673d657f0df21b4b1fb6b18dbaa96bc"
> =20
>  PV =3D "${LINUX_VERSION}+git"
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.6.bb
> index 92ad6afa3a5..58a72979c53 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> @@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?=3D "v6.6/standard/base"
>  KBRANCH:qemuloongarch64  ?=3D "v6.6/standard/base"
>  KBRANCH:qemumips64 ?=3D "v6.6/standard/mti-malta64"
> =20
> -SRCREV_machine:qemuarm ?=3D "aa66687c1abe2afe2ee6c00c36bfaaf3d5d9636c"
> -SRCREV_machine:qemuarm64 ?=3D "cf88783fdb92901d9d228afb7d700c6575742f1b"
> -SRCREV_machine:qemuloongarch64 ?=3D "70af2998be31b72a111de67966b7816b3d5=
4d472"
> -SRCREV_machine:qemumips ?=3D "cbd6f9a670486dcd83ef0f8b90a75b2b7b44b447"
> -SRCREV_machine:qemuppc ?=3D "bce75aa765505d7db3bb1bfefb5d3f524a1a5b64"
> -SRCREV_machine:qemuriscv64 ?=3D "70af2998be31b72a111de67966b7816b3d54d47=
2"
> -SRCREV_machine:qemuriscv32 ?=3D "70af2998be31b72a111de67966b7816b3d54d47=
2"
> -SRCREV_machine:qemux86 ?=3D "70af2998be31b72a111de67966b7816b3d54d472"
> -SRCREV_machine:qemux86-64 ?=3D "70af2998be31b72a111de67966b7816b3d54d472=
"
> -SRCREV_machine:qemumips64 ?=3D "4cc6d51a6f63436a37c3ba4ea2da93c7fd3240b4=
"
> -SRCREV_machine ?=3D "70af2998be31b72a111de67966b7816b3d54d472"
> -SRCREV_meta ?=3D "45f69741c733e066ed1a12b6025e347e5cd6063e"
> +SRCREV_machine:qemuarm ?=3D "539bf858552c12417a449646d0cad5e53e038aa0"
> +SRCREV_machine:qemuarm64 ?=3D "e4153b3c5bff6c503990c35826d84a034d2d7a33"
> +SRCREV_machine:qemuloongarch64 ?=3D "3dbf485808fc7be82368f70f385fead9735=
b5904"
> +SRCREV_machine:qemumips ?=3D "d5da07b097555f20280b2484da875c93f1494d48"
> +SRCREV_machine:qemuppc ?=3D "9434ddc68ebc90e9336d4cc6f642aa82c0da023c"
> +SRCREV_machine:qemuriscv64 ?=3D "3dbf485808fc7be82368f70f385fead9735b590=
4"
> +SRCREV_machine:qemuriscv32 ?=3D "3dbf485808fc7be82368f70f385fead9735b590=
4"
> +SRCREV_machine:qemux86 ?=3D "3dbf485808fc7be82368f70f385fead9735b5904"
> +SRCREV_machine:qemux86-64 ?=3D "3dbf485808fc7be82368f70f385fead9735b5904=
"
> +SRCREV_machine:qemumips64 ?=3D "e6f498c7aa6909c17b90b50267d1577ddc19c0d6=
"
> +SRCREV_machine ?=3D "3dbf485808fc7be82368f70f385fead9735b5904"
> +SRCREV_meta ?=3D "fdd48963e673d657f0df21b4b1fb6b18dbaa96bc"
> =20
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the=
 same
>  # meta SRCREV as the linux-yocto-standard builds. Select your version us=
ing the
>  # normal PREFERRED_VERSION settings.
>  BBCLASSEXTEND =3D "devupstream:target"
> -SRCREV_machine:class-devupstream ?=3D "7a137e9bfa0e1919555d60f9dc0c05a7a=
5ba75d0"
> +SRCREV_machine:class-devupstream ?=3D "4fc00fe35d46b4fc8dac2eb543a0e3d44=
bb15f47"
>  PN:class-devupstream =3D "linux-yocto-upstream"
>  KBRANCH:class-devupstream =3D "v6.6/base"
> =20
> @@ -44,7 +44,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git=
;name=3Dmachine;branch=3D${KBRA
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> -LINUX_VERSION ?=3D "6.6.127"
> +LINUX_VERSION ?=3D "6.6.129"
> =20
>  PV =3D "${LINUX_VERSION}+git"
> =20

--=20
Yoann Congal
Smile ECS


