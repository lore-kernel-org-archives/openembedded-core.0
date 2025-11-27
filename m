Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8844DD111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 17:08:48 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23239.1764263318164458088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 09:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QvSNXIAE;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477563e28a3so7791275e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 09:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764263316; x=1764868116; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nbcd28sUkkDg3AlmukhohJB51VUC3/PvRPp11lPbZyg=;
        b=QvSNXIAESlZ7unsjUwgsi4ijnkN/nT8/9RJQqFKxJv6pwP2DARteCJ8Y8ZqWcPHGwu
         ElRAj0/JX5L8rwiPbYiQdvU6ioLFyQKQ8cveSy2IBlaZjeQkEB+g0fXiLloHHVe/OCAi
         kiLFB7ZI37jKOPKNj9Z2/5c2+Rymfr3MW3zznAaydfojhJZaOJZ5mutoRn6ZS3/8abNz
         Zgv84257pyd7oBxo3Z+r+96rmVXq7/7q7b08kJVSVSvP5OSY3tCmkAq2H4+3JhjhUDiX
         vPfLxjJI7V2GglFKMsLsbyw+HJ1WMMzEVEDAzEXgKY+DalGom6eejNiP1Kj8UWDcwCJ8
         rEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764263316; x=1764868116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nbcd28sUkkDg3AlmukhohJB51VUC3/PvRPp11lPbZyg=;
        b=MLFB46mu5vE5O7y7iX2ZMxhiM6eavr9T3F/RNKfWICd/MuOn85yFlClPg7lA5S0lbz
         vDaCwxNek81o/jdfFz2rg6DAQhFopnyM1qP3nUtMb0mzJ1RgTljOby9reyuBUVEmO8f4
         xS9HwC6sbqSVhL6b5G+H8bSH4K9Bk1pktGPcK3lT18kI5vfug4MQ6BQMxlqpGCL76BeC
         HkHeaEDRZ5QvKd+vpEy4stVGdElHonRImBxvT/+IWtN/bSGf+fjNKjSkqmPSHrDtwEkW
         f3S/PNhbkcbafhsEvWMxThouJMXsxAo3VWdPqXLyX2czoZwBK1lM+/1pnxFzu1XBhou8
         uS8w==
X-Forwarded-Encrypted: i=1; AJvYcCXReGIZz0n9GmqlqR3+vbIfUPTmUTvMqSaXOiQPz8IKgnFJPliv5JsFAVS7ZAbJK4WiFom3Zi4oBOkk+aUDhjkzng==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy7RP7E6fQF5WqfG8r0mEOG0l2EHkf3Dd7pBjVKJWAnJQ1dOqlA
	WTbQOp71gqaeTHokI24BYSVFsKAuaVrsaZk0h4buEaNoEmDoUTgs0M+q
X-Gm-Gg: ASbGncv6qru+1dAeplP5VXfNZlp8sxRPpWwGw5F91Qyr/ccUiaPbg23QZgc05janfVN
	+UMUC2YG1oL19R0cevlBjDzDblqWHBRhvC3C0r1jmbm7+IQvMtOM9OTikIpi8Pr2mwQUZsN/mT1
	/YaI1QNQLkEUE9It7cbVcNbTLhvTilFBoq7OTWNlzeqH7KGl/vMn0i3RfZA1Hy8puzNSY6ua5KX
	MdQ2baqSvtj1+HZHZGgund4pnulOnf2B3wXqeHu5VPABI+4Fk7Fqh/TL4M8Lm1Sr07dVirL0t0F
	kG12BqFXXA4RpME4tzq8ZCMou+/BX2Lg7Kqj83TP7TTu7Y9SmkLL9hmjx+xWcF19uXjDM/hOwkO
	owEWLo7lponqUni2W3aVVAQ5Vt6DurjDgPDmW2RzFMtOEMDSEMXJ4qMK9FSirm9CO1dqHTO3fNa
	TStG8I9zNFRKA9YhVMZHk=
X-Google-Smtp-Source: AGHT+IHz+qMGPWD5yC4UB6i+lm+6XCKYMVBxh3TZzrdxbJLs/bTH9SaNS1PgJkSToKvcsxQWUyfPfQ==
X-Received: by 2002:a05:600c:1e89:b0:477:a1bb:c58e with SMTP id 5b1f17b1804b1-477c04cfddcmr265769685e9.7.1764263316188;
        Thu, 27 Nov 2025 09:08:36 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d607csm4947314f8f.15.2025.11.27.09.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 09:08:35 -0800 (PST)
Message-ID: <2da2af64-1607-49f3-a438-43525b4b8b02@gmail.com>
Date: Thu, 27 Nov 2025 18:08:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v4 2/2] opkg: upgrade 0.8.0 -> 0.9.0
To: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
References: <20251023134656.2059483-1-ecordonnier@snap.com>
 <20251023134656.2059483-2-ecordonnier@snap.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251023134656.2059483-2-ecordonnier@snap.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 17:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226852

I just tried this, but it seems that the ACL switch was toggled during
the CMake transition. With Autotools ACL was disabled by default, but
with CMake it seems to be enabled - and it complains that it can't find
libacl on my machine.

On 10/23/25 15:46, Etienne Cordonnier via lists.openembedded.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> See release notes at
> - http://downloads.yoctoproject.org/releases/opkg/opkg-0.9.0.release-notes
>
> [0.9.0] - 2025-06-27
>
> Semiannual opkg release.
> Bumping the minor version as a result of the project build tooling changing from autotools to cmake.
>
> - Added a Dockerfile container definition (`:docker/`) for a valid developer build environment for opkg.
>   - It's recommended that project contributors use this container to build and test their changes.
> - The AutoTools-based build framework has [been replaced](https://git.yoctoproject.org/opkg/commit/?id=3f6040e321634471ec442fb0e80f140f1437e90b) with a more modern, CMake framework.
>   - Refer to the `docs/CONTRIBUTING.md` documentation for updated build instructions.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  .../opkg/opkg/0002-config.h.in-fix-typo.patch | 27 +++++++++++++++++++
>  meta/recipes-devtools/opkg/opkg/run-ptest     |  2 +-
>  .../opkg/{opkg_0.8.0.bb => opkg_0.9.0.bb}     | 22 ++++++++-------
>  3 files changed, 41 insertions(+), 10 deletions(-)
>  create mode 100644 meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
>  rename meta/recipes-devtools/opkg/{opkg_0.8.0.bb => opkg_0.9.0.bb} (76%)
>
> diff --git a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
> new file mode 100644
> index 00000000000..626bbd01b68
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
> @@ -0,0 +1,27 @@
> +From 5a81faadbc2397d554bc598d535fd2d44cbc8d10 Mon Sep 17 00:00:00 2001
> +From: Etienne Cordonnier <ecordonnier@snap.com>
> +Date: Mon, 20 Oct 2025 18:57:56 +0200
> +Subject: [PATCH] config.h.in: fix typo
> +
> +Upstream-Status: Backport [https://git.yoctoproject.org/opkg/commit/?id=d723a90bfe6409c7ad983ed911225d4aefbfd09e]
> +Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> +---
> + config.h.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config.h.in b/config.h.in
> +index 4fa9842..877b8c7 100644
> +--- a/config.h.in
> ++++ b/config.h.in
> +@@ -2,7 +2,7 @@
> + #cmakedefine01 WITH_XZ
> + #cmakedefine01 WITH_BZIP2
> + #cmakedefine01 WITH_LZ4
> +-#cmakedefine01 WITH_LZSTD
> ++#cmakedefine01 WITH_ZSTD
> + #cmakedefine01 WITH_CURL
> + #cmakedefine01 WITH_SSLCURL
> + #cmakedefine01 WITH_ACL
> +-- 
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest b/meta/recipes-devtools/opkg/opkg/run-ptest
> index 5fb7077eec9..d485a4aace5 100644
> --- a/meta/recipes-devtools/opkg/opkg/run-ptest
> +++ b/meta/recipes-devtools/opkg/opkg/run-ptest
> @@ -2,4 +2,4 @@
>  
>  OPKG_PATH=$(which opkg)
>  
> -make OPKG_PATH=$OPKG_PATH run-tests
> +make -C tests DATADIR=/share SYSCONFDIR=/etc VARDIR=/var OPKG_PATH=$OPKG_PATH
> diff --git a/meta/recipes-devtools/opkg/opkg_0.8.0.bb b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> similarity index 76%
> rename from meta/recipes-devtools/opkg/opkg_0.8.0.bb
> rename to meta/recipes-devtools/opkg/opkg_0.9.0.bb
> index 12e2edf7e3f..ed2f36d636b 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.8.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> @@ -15,34 +15,35 @@ PE = "1"
>  SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
>             file://opkg.conf \
>             file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
> +           file://0002-config.h.in-fix-typo.patch \
>             file://run-ptest \
>             "
>  
> -SRC_URI[sha256sum] = "582a4c9e220cce0b7d08a0915c95db9f24ae43ad372ed5d42d5ec5f6cd413f0c"
> +SRC_URI[sha256sum] = "440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa81a6a85493f0c89d0f5"
>  
>  # This needs to be before ptest inherit, otherwise all ptest files end packaged
>  # in libopkg package if OPKGLIBDIR == libdir, because default
>  # PTEST_PATH ?= "${libdir}/${BPN}/ptest"
>  PACKAGES =+ "libopkg"
>  
> -inherit autotools pkgconfig ptest
> +inherit cmake pkgconfig ptest
>  
>  target_localstatedir := "${localstatedir}"
>  OPKGLIBDIR ??= "${target_localstatedir}/lib"
>  
>  PACKAGECONFIG ??= "libsolv"
>  
> -PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
> +PACKAGECONFIG[gpg] = "-DWITH_GPGME=ON,-DWITH_GPGME=OFF,\
>      gnupg gpgme libgpg-error,\
>      ${@ "gnupg" if ("native" in d.getVar("PN")) else "gnupg-gpg"}\
>      "
> -PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
> -PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
> -PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
> -PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
> +PACKAGECONFIG[curl] = "-DWITH_CURL=ON,-DWITH_CURL=OFF,curl"
> +PACKAGECONFIG[ssl-curl] = "-DWITH_SSLCURL=ON,-DWITH_SSLCURL=OFF,curl openssl"
> +PACKAGECONFIG[sha256] = "-DWITH_SHA256=ON,-DWITH_SHA256=OFF"
> +PACKAGECONFIG[libsolv] = "-DUSE_SOLVER_LIBSOLV=ON,-DUSE_SOLVER_LIBSOLV=OFF,libsolv"
>  
> -EXTRA_OECONF = "--enable-zstd"
> -EXTRA_OECONF:append:class-native = " --localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
> +EXTRA_OECMAKE = "-DWITH_ZSTD=ON"
> +EXTRA_OECMAKE:append:class-native = " -DVARDIR=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} -DSYSCONFDIR=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
>  
>  do_install:append () {
>  	install -d ${D}${sysconfdir}/opkg
> @@ -56,6 +57,9 @@ do_install:append () {
>  }
>  
>  do_install_ptest () {
> +	# the ptest class uses a Makefile for installation, but cmake uses Ninja per default so we need to install ptests manually:
> +	cp -r ${S}/tests ${D}${PTEST_PATH}
> +
>  	sed -i -e '/@echo $^/d' ${D}${PTEST_PATH}/tests/Makefile
>  	sed -i -e '/@PYTHONPATH=. $(PYTHON) $^/a\\t@if [ "$$?" != "0" ];then echo "FAIL:"$^;else echo "PASS:"$^;fi' ${D}${PTEST_PATH}/tests/Makefile
>  }
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225260): https://lists.openembedded.org/g/openembedded-core/message/225260
> Mute This Topic: https://lists.openembedded.org/mt/115910660/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


