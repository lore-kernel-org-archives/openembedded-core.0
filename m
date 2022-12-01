Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769A9C47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:27:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.44764.1669904847658381290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gDu305Cr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id a9so1781661pld.7
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoCsFunVbrTzP8oSIoNC6rS7WJInxsLuMUVb3YCEz5s=;
        b=gDu305CrmgV62aTqlG5kLRaUwTHU72qsrfBW0Mkl6pVUNaaKnTSQ4M0sveVc6Vmdxe
         i8vQGwqmnPWONto58yutygfJo2PVP/IttyCjXj1EQmdiTOySwcX35dGiQpYdYPYgQeSN
         SkSvM4tP7OAsCCX6JMaJWo2BQRPNcyevrGzuQHbjPkpywMRA8rP6ITYSksFK7lHrOveA
         py/dhGbqXV2ZRni3sVawB4IRJJGaJMnsG1wztRdilYzufBt2sb+X/HbIDim9RWl+3x7h
         mMDy8f8Q89Sln13b7nKX3C110a18X3UIDs4wr3trNHKMpELBJdqv7RPMMq7v6fGlPdOy
         Dzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoCsFunVbrTzP8oSIoNC6rS7WJInxsLuMUVb3YCEz5s=;
        b=AVH8sc61VGM0WwGDbkt8EOciPLihrsXI+o/XfXa+xNUHXQg/NKZKyz5GJT2HxluNsG
         Ey9LfDDpWsJlA4YxWzYq1RPRdOZ9avUzQ6nO3/gVam+aFkjrkz4ZoNuWvJagpjMg2Ao6
         M713oFbkxyDCOwmAb3aBubvOlr6tW6liPyUMausjqd7TYKzi74BTDn1wWvfDjok3GgSb
         oqrAL4WQcL/2uQbRfT4TLMbLBDUm7hDajWckS5LXhJ/hbxZmHg7pffUgl30aKDAGlJcP
         ArZWTbIhgnw23RUY+c+at4mwdhboibZjdkjxubgg8jWZW14l7nf3LWVcYfVhPEsr40TA
         pl4Q==
X-Gm-Message-State: ANoB5pmwj1FDnE8FHBTmQW39dfwOMLl9uSQ+Q949C0PAn7HeglboIfR5
	Xy5Wl0hTuHLHzsPJ+4Bfh3D+QJb3Myp0GEQKMYg=
X-Google-Smtp-Source: AA0mqf7GaPQxf8lDVBocowEMuOWqbSyOOEWVv+4wqfdYPbGbMvAiAlDLWv9c2++zNRT/P0eulcaFTQ==
X-Received: by 2002:a17:90a:7885:b0:217:e32e:e931 with SMTP id x5-20020a17090a788500b00217e32ee931mr76234178pjk.146.1669904846416;
        Thu, 01 Dec 2022 06:27:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.27.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:27:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/23] Patch review
Date: Thu,  1 Dec 2022 04:26:54 -1000
Message-Id: <cover.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174086

Please review this set of patches for kirkstone and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4562

The following changes since commit 5b2ee67e3a5587b4c7d97d2a9bc00022d1eedae3:

  create-spdx: default share_src for shared sources (2022-11-25 08:08:10 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bhabu Bindu (3):
  curl: Fix CVE-2022-32221
  curl: Fix CVE-2022-42916
  curl: Fix CVE-2022-42915

Bruce Ashfield (5):
  linux-yocto/5.15: update to v5.15.74
  linux-yocto/5.15: update to v5.15.76
  linux-yocto/5.15: update to v5.15.78
  linux-yocto/5.15: fix CONFIG_CRYPTO_CCM mismatch warnings
  kern-tools: integrate ZFS speedup patch

Chee Yang Lee (1):
  dropbear: fix CVE-2021-36369

Chen Qi (3):
  kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild
  resolvconf: make it work
  dhcpcd: fix to work with systemd

Dmitry Baryshkov (2):
  linux-firmware: upgrade 20221012 -> 20221109
  linux-firmware: add new fw file to ${PN}-qcom-adreno-a530

Enrico Jörns (1):
  sstatesig: emit more helpful error message when not finding sstate
    manifest

Martin Jansa (2):
  tiff: refresh with devtool
  tiff: add CVE tag to b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch

Polampalli, Archana (1):
  libpam: fix CVE-2022-28321

Qiu, Zheng (1):
  tiff: Security fix for CVE-2022-3970

Ross Burton (1):
  tiff: fix a number of CVEs

Tim Orling (1):
  mirrors.bbclass: update CPAN_MIRROR

Xiangyu Chen (2):
  grub2: backport patch to fix CVE-2022-2601 CVE-2022-3775
  dbus: upgrade 1.14.0 -> 1.14.4

 meta/classes/kernel.bbclass                   |   8 +
 meta/classes/mirrors.bbclass                  |   3 +-
 meta/lib/oe/sstatesig.py                      |   6 +-
 ...erflow-in-grub_font_get_glyph_intern.patch | 115 ++++
 .../grub/files/CVE-2022-2601.patch            |  85 +++
 .../grub/files/CVE-2022-3775.patch            |  95 +++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 .../dhcpcd/dhcpcd_9.4.1.bb                    |   1 +
 ...mprove-the-sitation-of-working-with-.patch |  82 +++
 ...01-avoid-using-m-option-for-readlink.patch |  37 +
 .../resolvconf/resolvconf_1.91.bb             |   9 +-
 ...eswap-Byte-swap-Unix-fd-indexes-if-n.patch |  76 ---
 ...idate-Check-brackets-in-signature-ne.patch | 119 ----
 ...idate-Validate-length-of-arrays-of-f.patch |  61 --
 .../dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb}   |  10 +-
 meta/recipes-core/dropbear/dropbear.inc       |   4 +-
 .../dropbear/dropbear/CVE-2021-36369.patch    | 145 ++++
 .../pam/libpam/CVE-2022-28321-0002.patch      | 205 ++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 ...20221012.bb => linux-firmware_20221109.bb} |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 ...-of-TIFFTAG_INKNAMES-and-related-TIF.patch | 266 ++++++++
 ...-the-FPE-in-tiffcrop-415-427-and-428.patch |   2 +-
 ...rash-when-reading-a-file-with-multip.patch |  14 +-
 ...ue-330-and-some-more-from-320-to-349.patch |  86 ++-
 ...fcrop-S-option-Make-decision-simpler.patch |  36 +
 ...-incompatibility-of-Z-X-Y-z-options-.patch |  59 ++
 ...ines-require-a-larger-buffer-fixes-2.patch | 640 ++++++++++++++++++
 ...al-buffer-overflow-for-ASCII-tags-wh.patch |  13 +-
 ...ue-380-and-382-heap-buffer-overflow-.patch |  14 +-
 ...-for-return-value-of-limitMalloc-392.patch |  15 +-
 ...ag-avoid-calling-memcpy-with-a-null-.patch |  16 +-
 .../0005-fix-the-FPE-in-tiffcrop-393.patch    |  15 +-
 ...x-heap-buffer-overflow-in-tiffcp-278.patch |  15 +-
 ...99c99f987dc32ae110370cfdd7df7975586b.patch |   9 +-
 .../libtiff/tiff/CVE-2022-1354.patch          |   8 +-
 .../libtiff/tiff/CVE-2022-1355.patch          |   8 +-
 .../libtiff/tiff/CVE-2022-2867.patch          |   2 +-
 .../libtiff/tiff/CVE-2022-2869.patch          |   2 +-
 .../libtiff/tiff/CVE-2022-2953.patch          |  30 +-
 .../libtiff/tiff/CVE-2022-34526.patch         |   6 +-
 .../libtiff/tiff/CVE-2022-3970.patch          |  38 ++
 ...ed69a485a9cfb299d9f060eb2a46c54e5903.patch |   7 +-
 ...0712f4c3a5b449f70c57988260a667ddbdef.patch |   9 +-
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   6 +-
 .../curl/curl/CVE-2022-32221.patch            |  28 +
 .../curl/curl/CVE-2022-42915.patch            |  53 ++
 .../curl/curl/CVE-2022-42916.patch            | 136 ++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   3 +
 52 files changed, 2203 insertions(+), 444 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-2601.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-3775.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
 rename meta/recipes-core/dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb} (93%)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2021-36369.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221012.bb => linux-firmware_20221109.bb} (99%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-S-option-Make-decision-simpler.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-subroutines-require-a-larger-buffer-fixes-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32221.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-42915.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-42916.patch

-- 
2.25.1


