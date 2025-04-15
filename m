Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB40C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 10:40:13 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.16725.1744713612250897606
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 03:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jCasTYuJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86b9ea43955so2037920241.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 03:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744713611; x=1745318411; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ac/4F87BB9bf5ssXtG5eDvF4SaPumcew9z+V+qF80wY=;
        b=jCasTYuJxiIweYytckKmQmHPQSIRjCAk+i6CZFI4NorD/rpDeVkGxjNVkaTVYiRbom
         66rgG9qFGV4ZT+/RTC+7XyjUcuhFVip7zsyySGPp1ThePtt6vmON8wmlwIeWMSTuCfRW
         NI9bUP0AYYwqiLJsm+b8qzUoYlX59F4MaOvjk27ckiRWJSqz55IScfsHL3kZcQV9iHgh
         56jCBT8PFIGaYQL5JbUIQBxUprto/nXQGVzX+nnIcjgvhp4z1gq4LnoLp7M/81Z3mqBp
         0zUCDwevxyJIkCnnq6Hd7WOQ25LioNblVLUWmvuy8AkfcDsoTnJ52opIeKAGU3nGs2x+
         mHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713611; x=1745318411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ac/4F87BB9bf5ssXtG5eDvF4SaPumcew9z+V+qF80wY=;
        b=Ng4gV77YqAO4ELa5HW4ldyffOGiGj8HWW3gS/VbC5BcT7aBIS+wGIHPVySJ3JuRrrH
         i1wTuDNYjReDnlup/tatx/7aJIi0wPizczeaO/JBb8+bjxkZGu8zKoHomuffX9aAdFUe
         9V7EfFhFdWZGccLFBgWLoc448+A1rZutbYB/kP+2vJpj5DAw4SG5zV9eLAFUfUULH/qD
         uNomFAAeCc3HHdpyghU5PMxVFwF8c4BY9MEuwp4wSJjjX3DbuMmk9gJJklNIm1D1Strc
         l/aZH/IdJlvSR8KRDgNQPdwlkmvivWh6zNyJpvIMq3k93yd1MYPskI5Mh4KXXohfZ29l
         cR3w==
X-Forwarded-Encrypted: i=1; AJvYcCU8r5AtNcfHoc9rFHHQzOlDqfPnI8B0w5ywyFbD6Tvzwm5Kj7kNrDG7shce72c5xSe0Eo6V6l4C6yLXYT/IAHMEQA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx0vn3J2RRmUvZZEkci7zpfQtlHcIRHFVnhOABPrSZ6sVlR6yFW
	PCy1advApCiez14EXiCR8bV5bvxOwXLk8oHuNvzjZcHOyPUy98FF4QzLiLLNT6Jr2PSQ1zBe9XT
	xwSMPvEOGVGRcx1Rmgil/qgqbl3Q=
X-Gm-Gg: ASbGncsVdpGdv6K4uDWJT3aJ7SNlKujF4geUrXpEoU846joBXRjqN21aa88ep8Cn4ac
	HN1NZWXPtp6nTjoIdsAKTA37VGOYFp1TJw0fHEfvB/Vsb51ZgLO8jQcoiEeouoU2O6Q1hwDY/3/
	Pji2uYIGPi1LYrK3qGVwt1y2g7OXqClpYRrQ==
X-Google-Smtp-Source: AGHT+IEwdfA2FEXyWGb5tk5Qnv2DX0jDhdPQMNqG1ByEY4uEQ9cOQ1XrqPeDtuV6IuYH/wtjlmqcyLzJ1e5qzBZay6Y=
X-Received: by 2002:a05:6102:5708:b0:4c3:64bd:93ba with SMTP id
 ada2fe7eead31-4c9e4f13540mr10888175137.11.1744713611196; Tue, 15 Apr 2025
 03:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <8ae24df9-f1ae-44a9-a4f3-7d8aa273a335@topic.nl>
 <Z_jy0-3v8qVSyll8@nuoska> <960572ae-f816-4d55-b935-8e11e2dad89f@topic.nl>
 <CAB3asfhjnUAm-sB=Q4mk9whXUMdgaBZk0kwiwYKKyPJ0ydnU2w@mail.gmail.com> <Z_4sMeEiHjZ8ydfs@nuoska>
In-Reply-To: <Z_4sMeEiHjZ8ydfs@nuoska>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 15 Apr 2025 11:39:59 +0100
X-Gm-Features: ATxdqUFNfwB3qGqkF_GEe9Oz6zeSk3gsPAmXI8nhq8YYHx2KbNwiwsbwd6LNH-M
Message-ID: <CANPvuRnST0DB_f1MtDe=jMuqXdvDSWMJTNY4WYm4ypcbw9CVmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: mikko.rapeli@linaro.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>, openembedded-core@lists.openembedded.org, 
	mike.looijmans@topic.nl
Content-Type: multipart/alternative; boundary="00000000000007c07a0632cecbc5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 10:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214837

--00000000000007c07a0632cecbc5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mikko Rapeli via lists.openembedded.org <mikko.rapeli=3D
linaro.org@lists.openembedded.org> escreveu (ter=C3=A7a, 15/04/2025 =C3=A0(=
s) 10:51):

> Hi,
>
> On Mon, Apr 14, 2025 at 06:28:13PM +0200, Adrian Freihofer wrote:
> > Hi Mikko
> >
> > Would it be possible to provide some numbers on the impact on the size =
of
> > the binaries and the additional dependencies that could be added to the
> > image with or without efi enabled?
> > I think the patch would be a very good compromise if the impact is
> > negligible, but otherwise the question is probably still valid.
>
> The impact is small:
>
>  * python3-pyelftools-native is added to build dependencies
>
>  * At runtime the efivars partition is now automatically mounted read-onl=
y
> by
>    systemd to /sys/firmware/efi/efivars and can be used to query various
> firmware
>    and EFI bootloader (grub, systemd-boot) details
>
>  * Since "efi" is now default, other layers can stop enabling it:
>
>
> https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-core/systemd/=
systemd-efi.inc
>
> https://git.yoctoproject.org/meta-security/tree/meta-tpm/recipes-core/sys=
temd/systemd_%25.bbappend#n5
>
> https://github.com/Wind-River/meta-secure-core/blob/master/meta-efi-secur=
e-boot/recipes-core/systemd/systemd-efi-secure-boot.inc
>
>  * /usr/lib/systemd/libsystemd-shared-257.so size increases 32 bytes from
>    4012152 to 4012184 bytes, 0.0008%
>
>  * systemd package size increase from 9857529 to 10226508, 3.7%, with
>    added files:
>
> +drwxr-xr-x root       root             4096 ./usr/lib/systemd/boot
> +drwxr-xr-x root       root             4096 ./usr/lib/systemd/boot/efi
> +-rw-r--r-- root       root             6144
> ./usr/lib/systemd/boot/efi/addonaa64.efi.stub
> +-rw-r--r-- root       root           101376
> ./usr/lib/systemd/boot/efi/linuxaa64.efi.stub
> +-rw-r--r-- root       root           120832
> ./usr/lib/systemd/boot/efi/systemd-bootaa64.efi
> +-rwxr-xr-x -          -               67656
> ./usr/lib/systemd/systemd-bless-boot
> +-rwxr-xr-x -          -               67456
> ./usr/lib/systemd/system-generators/systemd-bless-boot-generator
> +lrwxrwxrwx -          -                  25
> ./usr/lib/systemd/system/sockets.target.wants/systemd-bootctl.socket ->
> ../systemd-bootctl.socket
> +lrwxrwxrwx -          -                  35
> ./usr/lib/systemd/system/sysinit.target.wants/systemd-boot-random-seed.se=
rvice
> -> ../systemd-boot-random-seed.service
> +lrwxrwxrwx -          -                  34
> ./usr/lib/systemd/system/sysinit.target.wants/systemd-hibernate-clear.ser=
vice
> -> ../systemd-hibernate-clear.service
> +-rw-r--r-- -          -                 690
> ./usr/lib/systemd/system/systemd-bless-boot.service
> +-rw-r--r-- -          -                 532
> ./usr/lib/systemd/system/systemd-bootctl@.service
> +-rw-r--r-- -          -                 596
> ./usr/lib/systemd/system/systemd-bootctl.socket
> +-rw-r--r-- -          -                1029
> ./usr/lib/systemd/system/systemd-boot-random-seed.service
> +-rw-r--r-- -          -                 733
> ./usr/lib/systemd/system/systemd-boot-update.service
> +-rw-r--r-- -          -                 782
> ./usr/lib/systemd/system/systemd-hibernate-clear.service
> +-rw-r--r-- -          -                 779
> ./usr/lib/tmpfiles.d/20-systemd-stub.conf
>
>   This shows a bug in the config between systemd and systemd-boot, the EF=
I
> binaries are
>   provided by both. Sadly systemd-boot doesn't work so well and doesn't
> install all
>   the services etc which systemd does with "efi" and bootloader enabled.
> Not sure
>   if the overlap should be fixed or ignored. Using meson to install
> systemd-boot
>   binaries does fix deployment of the EFI binaries but does not install t=
he
>   random-seed etc services. With this workaround to avoid the EFI file
> duplication
>   in systemd recipe:
>
> --- a/meta/recipes-core/systemd/systemd_257.5.bb
> +++ b/meta/recipes-core/systemd/systemd_257.5.bb
> @@ -149,7 +149,7 @@ PACKAGECONFIG[default-compression-lz4] =3D "-Dlz4=3Dt=
rue
> -Ddefault-compression=3Dlz4,,
>  PACKAGECONFIG[default-compression-xz] =3D "-Dxz=3Dtrue
> -Ddefault-compression=3Dxz,,xz"
>  PACKAGECONFIG[default-compression-zstd] =3D "-Dzstd=3Dtrue
> -Ddefault-compression=3Dzstd,,zstd"
>  PACKAGECONFIG[dbus] =3D "-Ddbus=3Denabled,-Ddbus=3Ddisabled,dbus"
> -PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Denabled,-Defi=3Dfals=
e
> -Dbootloader=3Ddisabled,python3-pyelftools-native"
> +PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Ddisabled,-Defi=3Dfal=
se
> -Dbootloader=3Ddisabled,python3-pyelftools-native systemd-boot"
>

With that change I think you can remove ${D}${nonarch_libdir}/systemd/boot
in systemd as it will be provided also by systemd-boot.
This removal of the efi binaries will make the systemd package size mostly
the same.

Jose


>   size without "efi" is 9857529 bytes and with "efi" 9859196, or size
> increase
>   of 0.016% which is tiny. To stay closer to systemd upstream, I don't
> think
>   removing the duplication is worth the effort for now. systemd-boot
>   recipe could maybe be replaced by systemd recipe and a systemd-boot
> binary
>   package. Otherwise the configurations don't match. FWIW, it tried
> following
>   changes to systemd-boot:
>
> --- a/meta/recipes-core/systemd/systemd-boot_257.5.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_257.5.bb
> @@ -24,6 +24,7 @@ EOF
>  MESON_CROSS_FILE:append =3D " --cross-file ${WORKDIR}/meson-${PN}.cross"
>
>  MESON_TARGET =3D "systemd-boot"
> +MESON_INSTALL_TAGS =3D "systemd-boot"
>
>  EXTRA_OEMESON +=3D "-Defi=3Dtrue \
>                    -Dbootloader=3Dtrue \
> @@ -43,7 +44,7 @@ python __anonymous () {
>      d.setVar("SYSTEMD_BOOT_IMAGE_PREFIX", prefix)
>  }
>
> -FILES:${PN} =3D "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
> +FILES:${PN} =3D "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE} ${libdir}"
>
>  RDEPENDS:${PN} +=3D "virtual-systemd-bootconf"
>
> @@ -53,6 +54,7 @@ COMPATIBLE_HOST =3D
> "(aarch64.*|arm.*|x86_64.*|i.86.*|riscv.*)-linux"
>  COMPATIBLE_HOST:x86-x32 =3D "null"
>
>  do_install() {
> +       meson_do_install
>         install -d ${D}${EFI_FILES_PATH}
>         install ${B}/src/boot/systemd-boot*.efi
> ${D}${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}
>  }
>
> Cheers,
>
> -Mikko
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214835):
> https://lists.openembedded.org/g/openembedded-core/message/214835
> Mute This Topic: https://lists.openembedded.org/mt/112087523/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000007c07a0632cecbc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Mikko Rapeli vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
mikko.rapeli=3D<a href=3D"mailto:linaro.org@lists.openembedded.org">linaro.=
org@lists.openembedded.org</a>&gt; escreveu (ter=C3=A7a, 15/04/2025 =C3=A0(=
s) 10:51):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<b=
r>
<br>
On Mon, Apr 14, 2025 at 06:28:13PM +0200, Adrian Freihofer wrote:<br>
&gt; Hi Mikko<br>
&gt; <br>
&gt; Would it be possible to provide some numbers on the impact on the size=
 of<br>
&gt; the binaries and the additional dependencies that could be added to th=
e<br>
&gt; image with or without efi enabled?<br>
&gt; I think the patch would be a very good compromise if the impact is<br>
&gt; negligible, but otherwise the question is probably still valid.<br>
<br>
The impact is small:<br>
<br>
=C2=A0* python3-pyelftools-native is added to build dependencies<br>
<br>
=C2=A0* At runtime the efivars partition is now automatically mounted read-=
only by<br>
=C2=A0 =C2=A0systemd to /sys/firmware/efi/efivars and can be used to query =
various firmware<br>
=C2=A0 =C2=A0and EFI bootloader (grub, systemd-boot) details<br>
<br>
=C2=A0* Since &quot;efi&quot; is now default, other layers can stop enablin=
g it:<br>
<br>
=C2=A0 =C2=A0<a href=3D"https://git.yoctoproject.org/meta-arm/tree/meta-arm=
/recipes-core/systemd/systemd-efi.inc" rel=3D"noreferrer" target=3D"_blank"=
>https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-core/systemd/s=
ystemd-efi.inc</a><br>
=C2=A0 =C2=A0<a href=3D"https://git.yoctoproject.org/meta-security/tree/met=
a-tpm/recipes-core/systemd/systemd_%25.bbappend#n5" rel=3D"noreferrer" targ=
et=3D"_blank">https://git.yoctoproject.org/meta-security/tree/meta-tpm/reci=
pes-core/systemd/systemd_%25.bbappend#n5</a><br>
=C2=A0 =C2=A0<a href=3D"https://github.com/Wind-River/meta-secure-core/blob=
/master/meta-efi-secure-boot/recipes-core/systemd/systemd-efi-secure-boot.i=
nc" rel=3D"noreferrer" target=3D"_blank">https://github.com/Wind-River/meta=
-secure-core/blob/master/meta-efi-secure-boot/recipes-core/systemd/systemd-=
efi-secure-boot.inc</a><br>
<br>
=C2=A0* /usr/lib/systemd/libsystemd-shared-257.so size increases 32 bytes f=
rom<br>
=C2=A0 =C2=A04012152 to 4012184 bytes, 0.0008%<br>
<br>
=C2=A0* systemd package size increase from 9857529 to 10226508, 3.7%, with<=
br>
=C2=A0 =C2=A0added files:<br>
<br>
+drwxr-xr-x root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A04096 ./usr/lib/systemd/boot<br>
+drwxr-xr-x root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A04096 ./usr/lib/systemd/boot/efi<br>
+-rw-r--r-- root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A06144 ./usr/lib/systemd/boot/efi/addonaa64.efi.stub<br>
+-rw-r--r-- root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0101376 ./usr/lib/systemd/boot/efi/linuxaa64.efi.stub<br>
+-rw-r--r-- root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0120832 ./usr/lib/systemd/boot/efi/systemd-bootaa64.efi<br>
+-rwxr-xr-x -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A067656 ./usr/lib/systemd/systemd-bless-boot<b=
r>
+-rwxr-xr-x -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A067456 ./usr/lib/systemd/system-generators/sy=
stemd-bless-boot-generator<br>
+lrwxrwxrwx -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 25 ./usr/lib/systemd/system/sockets.=
target.wants/systemd-bootctl.socket -&gt; ../systemd-bootctl.socket<br>
+lrwxrwxrwx -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 35 ./usr/lib/systemd/system/sysinit.=
target.wants/systemd-boot-random-seed.service -&gt; ../systemd-boot-random-=
seed.service<br>
+lrwxrwxrwx -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 34 ./usr/lib/systemd/system/sysinit.=
target.wants/systemd-hibernate-clear.service -&gt; ../systemd-hibernate-cle=
ar.service<br>
+-rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0690 ./usr/lib/systemd/system/systemd-=
bless-boot.service<br>
+-rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0532 ./usr/lib/systemd/system/systemd-=
bootctl@.service<br>
+-rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0596 ./usr/lib/systemd/system/systemd-=
bootctl.socket<br>
+-rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1029 ./usr/lib/systemd/system/systemd-boot-=
random-seed.service<br>
+-rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0733 ./usr/lib/systemd/system/systemd-=
boot-update.service<br>
+-rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0782 ./usr/lib/systemd/system/systemd-=
hibernate-clear.service<br>
+-rw-r--r-- -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0779 ./usr/lib/tmpfiles.d/20-systemd-s=
tub.conf<br>
<br>
=C2=A0 This shows a bug in the config between systemd and systemd-boot, the=
 EFI binaries are<br>
=C2=A0 provided by both. Sadly systemd-boot doesn&#39;t work so well and do=
esn&#39;t install all<br>
=C2=A0 the services etc which systemd does with &quot;efi&quot; and bootloa=
der enabled. Not sure<br>
=C2=A0 if the overlap should be fixed or ignored. Using meson to install sy=
stemd-boot<br>
=C2=A0 binaries does fix deployment of the EFI binaries but does not instal=
l the<br>
=C2=A0 random-seed etc services. With this workaround to avoid the EFI file=
 duplication<br>
=C2=A0 in systemd recipe:<br>
<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_257.5.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_257.5.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_257.5.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_257.5.bb</a><br>
@@ -149,7 +149,7 @@ PACKAGECONFIG[default-compression-lz4] =3D &quot;-Dlz4=
=3Dtrue -Ddefault-compression=3Dlz4,,<br>
=C2=A0PACKAGECONFIG[default-compression-xz] =3D &quot;-Dxz=3Dtrue -Ddefault=
-compression=3Dxz,,xz&quot;<br>
=C2=A0PACKAGECONFIG[default-compression-zstd] =3D &quot;-Dzstd=3Dtrue -Ddef=
ault-compression=3Dzstd,,zstd&quot;<br>
=C2=A0PACKAGECONFIG[dbus] =3D &quot;-Ddbus=3Denabled,-Ddbus=3Ddisabled,dbus=
&quot;<br>
-PACKAGECONFIG[efi] =3D &quot;-Defi=3Dtrue -Dbootloader=3Denabled,-Defi=3Df=
alse -Dbootloader=3Ddisabled,python3-pyelftools-native&quot;<br>
+PACKAGECONFIG[efi] =3D &quot;-Defi=3Dtrue -Dbootloader=3Ddisabled,-Defi=3D=
false -Dbootloader=3Ddisabled,python3-pyelftools-native systemd-boot&quot;<=
br></blockquote><div><br></div><div>With that change I think you can remove=
=C2=A0${D}${nonarch_libdir}/systemd/boot in systemd as it will be provided =
also by systemd-boot.<br>This removal of the efi binaries will make the sys=
temd package size mostly the same.<br><br>Jose<br><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 size without &quot;efi&quot; is 9857529 bytes and with &quot;efi&quo=
t; 9859196, or size increase<br>
=C2=A0 of 0.016% which is tiny. To stay closer to systemd upstream, I don&#=
39;t think<br>
=C2=A0 removing the duplication is worth the effort for now. systemd-boot<b=
r>
=C2=A0 recipe could maybe be replaced by systemd recipe and a systemd-boot =
binary<br>
=C2=A0 package. Otherwise the configurations don&#39;t match. FWIW, it trie=
d following<br>
=C2=A0 changes to systemd-boot:<br>
<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_257.5.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd-boot_257.5.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_257.5.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd-boot_257.5.bb</a><br>
@@ -24,6 +24,7 @@ EOF<br>
=C2=A0MESON_CROSS_FILE:append =3D &quot; --cross-file ${WORKDIR}/meson-${PN=
}.cross&quot;<br>
<br>
=C2=A0MESON_TARGET =3D &quot;systemd-boot&quot;<br>
+MESON_INSTALL_TAGS =3D &quot;systemd-boot&quot;<br>
<br>
=C2=A0EXTRA_OEMESON +=3D &quot;-Defi=3Dtrue \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dboot=
loader=3Dtrue \<br>
@@ -43,7 +44,7 @@ python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0d.setVar(&quot;SYSTEMD_BOOT_IMAGE_PREFIX&quot;, prefix)=
<br>
=C2=A0}<br>
<br>
-FILES:${PN} =3D &quot;${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}&quot;<br>
+FILES:${PN} =3D &quot;${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE} ${libdir}&qu=
ot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;virtual-systemd-bootconf&quot;<br>
<br>
@@ -53,6 +54,7 @@ COMPATIBLE_HOST =3D &quot;(aarch64.*|arm.*|x86_64.*|i.86.=
*|riscv.*)-linux&quot;<br>
=C2=A0COMPATIBLE_HOST:x86-x32 =3D &quot;null&quot;<br>
<br>
=C2=A0do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0meson_do_install<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${EFI_FILES_PATH}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install ${B}/src/boot/systemd-boot*.efi ${D}${E=
FI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}<br>
=C2=A0}<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214835): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214835" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/214835</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112087523/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112087523/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--00000000000007c07a0632cecbc5--

