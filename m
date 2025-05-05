Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF55EC3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 11:46:36 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.48052.1746445594026587008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 04:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AurE5hi3;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so6727582a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 04:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746445592; x=1747050392; darn=lists.openembedded.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Ro7GFQz98JmpwEDce72eABCPF8hE4P6LqU9x5RGVpg=;
        b=AurE5hi36UUqwTSrQmWTZ6QwPJ9OCL9riNBu5d+ZOW5yY5HgAPyDGDvfwgsqD8T6oG
         mUU73hgALoZeZ+ZXFAEoLRTwQ2np4fMach/YntBQj025CrunTn9TXQ9HoeZ92OgKvcJu
         g3rv8sOT1wXQi2pUNoaHfm2a6rRrODpfVpGrEh2XL1O3OK+cWHb1jbED6kwjKncKHxEJ
         FMjJs0ZJJdPNgM/6WBkio8Au8/3K3xGSdg2OMc3sm2NsYfBJAAUIyx03mHh+C2qIJhwc
         lUc5Apv0rlslQqkca5LCDnGrpigYFDHHGdXocQrAqEL64zRjf272qJE6+gJSYKE6E3lg
         7RIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445592; x=1747050392;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ro7GFQz98JmpwEDce72eABCPF8hE4P6LqU9x5RGVpg=;
        b=wxYu65aYbRllWwbMWZmGa2RfO/It5xqW2Mmal3vzxweriUyzUWZY3e6QlRANDzGSWi
         /q0vVEVdXIG46hq+nE/WRat1VYl2+XWHmUhfSaQVAV7sIEctlzVM4BhlJ86sAavXok0j
         ahEGWs80pNXaL2Vdw0aSoBWz679zmT/6eDBhVYqMw3y+10GtHVRUvqdml5zK1HFiqUHj
         qpCwh8gIgfwnILOzYNW86bmdK5SjpcvRSn7adTV86S2zB143o1x5iUylRATzh8I++2Tx
         vsbw3gZfsF47FRxYYJ0Z+Sc0pDUCicUXWQGFHPPTzCVektE5G+8Lc1ra99MzAJS94SFb
         3JFw==
X-Gm-Message-State: AOJu0Yw/7RYONIN9NJbDnGUrxYfj/jzhQz4VsNa5SIX+3cEZT6gTSP+R
	LMTg0HNwORgx3bHUL6fKacAb0FxKJxKugAeQCJbgsuT5miiPF0XJmw2EIw==
X-Gm-Gg: ASbGncugRAHo2GCElyYSeY3Vschjitnv+T9xr4ETKs9hCc927QF/JJRKEbXh8GlMrPT
	R6Hj/OrVqZZsvY99+vCBT9ipX+0uH/gGwOxG88iulv0NsKZjzT6NLtJsCdMAusdBeO9/2N73M8G
	jccqHWOCKPMwNod39hF8g6NYxmQN5p0YXiC3wprjmGDYsX3v7kaiZZrI27ira35QuOx2hZEmfe6
	g+kg1AlslUa6rltC2UIPkqaRKwrbXgw4LRQh03btz3zlyxZ1qTqkR+IAI03XzHDW2CUPl7iaN1V
	0eHN+57kzLWJzPxy314OoJsKMAmjglO7Y9q2OQy6lUlZ14ml1kULEUX4B+bAe2yvfhj8SNR1yBK
	Gtv3HdvCR/taecM1sxeLEnQ==
X-Google-Smtp-Source: AGHT+IGacbfxIXYiqXjB9sOUM8bBk4CJJ9PnOFTLT9eUf50lqP2gjfVPjTBZwZsNWPY/qnYdMcSVGw==
X-Received: by 2002:a17:907:3d90:b0:ac2:9c7d:e144 with SMTP id a640c23a62f3a-ad1a4acf69cmr641398266b.40.1746445591829;
        Mon, 05 May 2025 04:46:31 -0700 (PDT)
Received: from toolbox (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540751sm475587566b.166.2025.05.05.04.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:46:31 -0700 (PDT)
Date: Mon, 5 May 2025 13:46:30 +0200
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
Message-ID: <aBilFkr4HF-MSBd6@toolbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 11:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216006

Hello

I'm seeing a strange warning resulting in a failed build when building
systemd with tpm2 in DISTRO_FEATURES.

GCS seems to be a new feature supported with GCC 15 and friends
targeting the AARCH64 architecture. Whatever it does ;-).

Ways to reproduce:

Add the needed layers for tpm2, add tpm2 to distro features and build
systemd.
E.g. 
bblayers.conf additions:

  ${TOPDIR}/../meta-security/meta-tpm \
  ${TOPDIR}/../meta-openembedded/meta-oe \
  ${TOPDIR}/../meta-openembedded/meta-python \

local.conf additions:

DISTRO_FEATURES:append = " tpm2"
INIT_MANAGER = "systemd"

MACHINE=qemuarm64 bitbake systemd

Results in:

| FAILED: src/shared/libsystemd-shared-257.so
| aarch64-poky-linux-gcc -mcpu=cortex-a57+crc -mbranch-protection=standard -fstack-protector-strong
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=...systemd/257.5/recipe-sysroot
  -o src/shared/libsystemd-shared-257.so -Wl,--as-needed -Wl,--no-undefined -shared -fPIC
  -Wl,-soname,libsystemd-shared-257.so -Wl,--whole-archive -Wl,--start-group src/shared/libsystemd-shared-257.a
  src/basic/libbasic.a src/libsystemd/libsystemd_static.a -Wl,--no-whole-archive -fstack-protector
  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -ffile-prefix-map=...systemd/257.5/git=/usr/src/debug/systemd/257.5
  -ffile-prefix-map...systemd/257.5/build=/usr/src/debug/systemd/257.5 -ffile-prefix-map=...systemd/257.5/recipe-sysroot=
  -ffile-prefix-map=...systemd/257.5/recipe-sysroot-native= -Wl,-z,relro,-z,now -shared
  -Wl,--version-script=...systemd/257.5/git/src/shared/libshared.sym -pthread ...systemd/257.5/recipe-sysroot/usr/lib/libacl.so
  ...systemd/257.5/recipe-sysroot/usr/lib/libblkid.so ...systemd/257.5/recipe-sysroot/usr/lib/libcap.so
  ...systemd/257.5/recipe-sysroot/usr/lib/libcrypt.so -ldl ...systemd/257.5/recipe-sysroot/usr/lib/libmount.so
  ...systemd/257.5/recipe-sysroot/usr/lib/libssl.so ...systemd/257.5/recipe-sysroot/usr/lib/libcrypto.so -lrt
  ...systemd/257.5/recipe-sysroot/usr/lib/libseccomp.so -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common
  -Wl,--gc-sections -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common -Wl,--gc-sections -lm
  -Wl,--end-group -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common -Wl,--gc-sections
  -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common -Wl,--gc-sections
| ...systemd/257.5/recipe-sysroot/usr/lib/libcrypto.so: warning: GCS is required by -z gcs,
  but this shared library lacks the necessary property note. The dynamic loader might not enable GCS
  or refuse to load the program unless all the shared library dependencies have the GCS marking.
| collect2: error: ld returned 1 exit status


I already found that adding to the systemd recipe

'CFLAGS:append = " -Wl,-z,gcs-report-dynamic=none"'

prevents the build error. However I'm not sure if that would be a good
way forward and if there are other recipes / configurations which would
result in similar build errors.

Any comments? Thanks.

Regards
Max

