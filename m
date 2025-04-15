Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F40C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 09:51:52 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.16095.1744710709444422240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 02:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wVLbEwnc;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54b1095625dso5779654e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 02:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744710707; x=1745315507; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xG5IvUzCUnIUJSWUu0CdQnrjTVBtAg8qqQP3xF90m8U=;
        b=wVLbEwncnMPEkgg4w5ropThFnqsRgHXYNQXWQJ09VFOhwYbjaxm8IqFpsHnGtN1Y3L
         uPkXqtE8HWBgLQ33MS37U3NwHftRiG/+AFRNuu6Gzf/YdU//5bAXxgvLgjpP4qEAUYFV
         2849T7YHJswRVhu9ne1jhlycen6BJyh248bJHTGhgodwIa0snRJgigR3thJR2AJannwQ
         4IZOpM1ckwmuOny3zYGaxEyoBwz4xo9wkghNj8hAUaA8v9bK2F8KW7uCtcuEC0cAEX1u
         CWEBbKQvNWSWEW7lLSluOZg8RaoCj4blb2erorra07cGNqzzqSJI+CKF5FlUXeL2P1fG
         5y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710707; x=1745315507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xG5IvUzCUnIUJSWUu0CdQnrjTVBtAg8qqQP3xF90m8U=;
        b=YWIro/FBGjUgQ8geL39Qfvovhz3DxKqfmESvBkK5A5agl9zLMFdZB55JTbWLXMq5cw
         QSrle+Uzu7NU/F0uoUuP9Mx8zsxFy4hgrbtZk9HBx5uYOHeVCXShcV6Fr1VniG5Xm3PZ
         5VxuKfFx78Om5j3P+ZxOD9rZf5D1ICcH1DUkEE6OJHzmbDblqcSqCu76UBfi+reqm+VT
         ukRQ7zY8sdpXr/H5f7sUsBmXfTntQqwZNoDAaPOWITswLTI3EXhqQ2COQgWKON2tMjJ0
         7HCOmk1FS6OVAB6X6Mua98c//YRpd649LbragBhBSGTXrIzl39T2Px5CFlohELc192vI
         AqDg==
X-Gm-Message-State: AOJu0YzeRJ5G/vYusSXJHaQnuS2J5jT4yEaGbwoaT6wrdMy84ucnw8KS
	SdqnfnwAcL+IElBwFqMFahPQ5WUpVuG930oxRJcTIgwKKEdhClYsNnTUzEHkjoM=
X-Gm-Gg: ASbGncu3H47ComnVcGwq9q92Wq/JR6VdhfgC7X+r7pYQ+IySY6YuPdmrkMxXITqpQUz
	JPs2KqAM8wg1xfseaHPPUSl+L9lg645NqpIos8v8BVsLWoW2MfkK6u3rN4RbpyW4t8Coe7leLXb
	DoMVoc9iABzd+Il4Yds3fNNZHyzy3LGSHfUBvbhcWNyGdRUQrEL1iDGmoEG8ZVvyNN0IsFCCZke
	7mkCI7pgj2zLZtDFii9hudLLI9VSQ6q4XEeI6L9fPuxpWJ6Sq0uM+QP8YX//dw6RFJYdEkYUBxU
	vo49vGKob6/g2egoJAkEW8R64XuhGml/FMoO4Cvgctxleq3E1V2UfYfeROGZ6kR5Uj18NvniSA=
	=
X-Google-Smtp-Source: AGHT+IHNFzwrhZwDUJgKUaYN5Ai2ZbaDB3AX34UnnOZcPbofHLLseiPC/tm+JPen+NuSvF3+2S2rig==
X-Received: by 2002:a05:6512:3981:b0:549:5b54:2c68 with SMTP id 2adb3069b0e04-54d45291f18mr4865947e87.22.1744710707468;
        Tue, 15 Apr 2025 02:51:47 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5026d5sm1375424e87.155.2025.04.15.02.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:51:47 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:51:45 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, mike.looijmans@topic.nl
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
Message-ID: <Z_4sMeEiHjZ8ydfs@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org>
 <8ae24df9-f1ae-44a9-a4f3-7d8aa273a335@topic.nl>
 <Z_jy0-3v8qVSyll8@nuoska>
 <960572ae-f816-4d55-b935-8e11e2dad89f@topic.nl>
 <CAB3asfhjnUAm-sB=Q4mk9whXUMdgaBZk0kwiwYKKyPJ0ydnU2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB3asfhjnUAm-sB=Q4mk9whXUMdgaBZk0kwiwYKKyPJ0ydnU2w@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 09:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214835

Hi,

On Mon, Apr 14, 2025 at 06:28:13PM +0200, Adrian Freihofer wrote:
> Hi Mikko
> 
> Would it be possible to provide some numbers on the impact on the size of
> the binaries and the additional dependencies that could be added to the
> image with or without efi enabled?
> I think the patch would be a very good compromise if the impact is
> negligible, but otherwise the question is probably still valid.

The impact is small:

 * python3-pyelftools-native is added to build dependencies

 * At runtime the efivars partition is now automatically mounted read-only by
   systemd to /sys/firmware/efi/efivars and can be used to query various firmware
   and EFI bootloader (grub, systemd-boot) details

 * Since "efi" is now default, other layers can stop enabling it:

   https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-core/systemd/systemd-efi.inc
   https://git.yoctoproject.org/meta-security/tree/meta-tpm/recipes-core/systemd/systemd_%25.bbappend#n5
   https://github.com/Wind-River/meta-secure-core/blob/master/meta-efi-secure-boot/recipes-core/systemd/systemd-efi-secure-boot.inc

 * /usr/lib/systemd/libsystemd-shared-257.so size increases 32 bytes from
   4012152 to 4012184 bytes, 0.0008%

 * systemd package size increase from 9857529 to 10226508, 3.7%, with
   added files:

+drwxr-xr-x root       root             4096 ./usr/lib/systemd/boot
+drwxr-xr-x root       root             4096 ./usr/lib/systemd/boot/efi
+-rw-r--r-- root       root             6144 ./usr/lib/systemd/boot/efi/addonaa64.efi.stub
+-rw-r--r-- root       root           101376 ./usr/lib/systemd/boot/efi/linuxaa64.efi.stub
+-rw-r--r-- root       root           120832 ./usr/lib/systemd/boot/efi/systemd-bootaa64.efi
+-rwxr-xr-x -          -               67656 ./usr/lib/systemd/systemd-bless-boot
+-rwxr-xr-x -          -               67456 ./usr/lib/systemd/system-generators/systemd-bless-boot-generator
+lrwxrwxrwx -          -                  25 ./usr/lib/systemd/system/sockets.target.wants/systemd-bootctl.socket -> ../systemd-bootctl.socket
+lrwxrwxrwx -          -                  35 ./usr/lib/systemd/system/sysinit.target.wants/systemd-boot-random-seed.service -> ../systemd-boot-random-seed.service
+lrwxrwxrwx -          -                  34 ./usr/lib/systemd/system/sysinit.target.wants/systemd-hibernate-clear.service -> ../systemd-hibernate-clear.service
+-rw-r--r-- -          -                 690 ./usr/lib/systemd/system/systemd-bless-boot.service
+-rw-r--r-- -          -                 532 ./usr/lib/systemd/system/systemd-bootctl@.service
+-rw-r--r-- -          -                 596 ./usr/lib/systemd/system/systemd-bootctl.socket
+-rw-r--r-- -          -                1029 ./usr/lib/systemd/system/systemd-boot-random-seed.service
+-rw-r--r-- -          -                 733 ./usr/lib/systemd/system/systemd-boot-update.service
+-rw-r--r-- -          -                 782 ./usr/lib/systemd/system/systemd-hibernate-clear.service
+-rw-r--r-- -          -                 779 ./usr/lib/tmpfiles.d/20-systemd-stub.conf

  This shows a bug in the config between systemd and systemd-boot, the EFI binaries are
  provided by both. Sadly systemd-boot doesn't work so well and doesn't install all
  the services etc which systemd does with "efi" and bootloader enabled. Not sure
  if the overlap should be fixed or ignored. Using meson to install systemd-boot
  binaries does fix deployment of the EFI binaries but does not install the
  random-seed etc services. With this workaround to avoid the EFI file duplication
  in systemd recipe:

--- a/meta/recipes-core/systemd/systemd_257.5.bb
+++ b/meta/recipes-core/systemd/systemd_257.5.bb
@@ -149,7 +149,7 @@ PACKAGECONFIG[default-compression-lz4] = "-Dlz4=true -Ddefault-compression=lz4,,
 PACKAGECONFIG[default-compression-xz] = "-Dxz=true -Ddefault-compression=xz,,xz"
 PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zstd,,zstd"
 PACKAGECONFIG[dbus] = "-Ddbus=enabled,-Ddbus=disabled,dbus"
-PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=enabled,-Defi=false -Dbootloader=disabled,python3-pyelftools-native"
+PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=disabled,-Defi=false -Dbootloader=disabled,python3-pyelftools-native systemd-boot"

  size without "efi" is 9857529 bytes and with "efi" 9859196, or size increase
  of 0.016% which is tiny. To stay closer to systemd upstream, I don't think
  removing the duplication is worth the effort for now. systemd-boot
  recipe could maybe be replaced by systemd recipe and a systemd-boot binary
  package. Otherwise the configurations don't match. FWIW, it tried following
  changes to systemd-boot:

--- a/meta/recipes-core/systemd/systemd-boot_257.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_257.5.bb
@@ -24,6 +24,7 @@ EOF
 MESON_CROSS_FILE:append = " --cross-file ${WORKDIR}/meson-${PN}.cross"
 
 MESON_TARGET = "systemd-boot"
+MESON_INSTALL_TAGS = "systemd-boot"

 EXTRA_OEMESON += "-Defi=true \
                   -Dbootloader=true \
@@ -43,7 +44,7 @@ python __anonymous () {
     d.setVar("SYSTEMD_BOOT_IMAGE_PREFIX", prefix)
 }
 
-FILES:${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
+FILES:${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE} ${libdir}"

 RDEPENDS:${PN} += "virtual-systemd-bootconf"
 
@@ -53,6 +54,7 @@ COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*|riscv.*)-linux"
 COMPATIBLE_HOST:x86-x32 = "null"

 do_install() {
+       meson_do_install
        install -d ${D}${EFI_FILES_PATH}
        install ${B}/src/boot/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}
 }

Cheers,

-Mikko

