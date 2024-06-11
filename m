Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAF2C27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 13:07:36 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.9090.1718111250291138234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 06:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eXiSwuGa;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-6e57506bb2dso844676a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 06:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718111249; x=1718716049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gPjI3wFJik8bLHzRHM/kXEIluQH+OqYGaoaOZaQKtRY=;
        b=eXiSwuGasuA0A1EwjCKMtglPZ+VVuZR+A/9XpVPJ4DzeB0QXWJDEyj4ZS/uyRX5V4j
         ZYAs0kMM5bMp/Xgy8o4+LVoBSTZLthSVj5JtDG9g6HDsHDDnGPyp1InszyIiDiLVAmTP
         cNRnUD0PPLRmJDRwpiO7h75w3LesqKiNSc5bb87KO60Jq7wJlc0bE0yGf9T+D4HOoPCZ
         snPx0q1z270eAQVEnjRr9r7jGXS8IDM5PrP2ym+tCSCOvzal5IZa/slzTbAo5fvjO0Sf
         mlw9G/1n1PR+PYSs3S4M7dXuSEvGTobzYKgqsWCair60gulx5kpjT8hoKxZv66F3nLSK
         +LOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718111249; x=1718716049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPjI3wFJik8bLHzRHM/kXEIluQH+OqYGaoaOZaQKtRY=;
        b=JiCr5T4sMGx7Cec+Qyne6xAJ9IBL9547cdbf5VaSGVAeweFebbC8VawfdxAAVYsmkB
         +MO2VO4ZoauyKy2bO9bGPVJ5/3qsOFexEMFPb1uUri/5Gdm8XIZCY38Uu38mQFnWquuK
         8ZLZyoWRTWmRNWb38zKKuisz0IXtndd6WEzTF6Hq75LDV905mtHABMun51r5QlK91/Vv
         zHA2bAYhtW/ZoSUNlC8WI/M6b9NZszUuCrYG5kHyWeAZUN+ybENxrsVnFQseiSq9qqAN
         GY/gbVVQ2weEsJJfcAvOMypqAt0mTOUUeuNdFDZyEjBLgzId9eQx3JZAhwLkXMEIxpWu
         4kKg==
X-Gm-Message-State: AOJu0Yyatgq6YsdulzfvTam533bZnGuxPpUIrCU/+Pmm/6VoPkTJY3So
	wMClO6uoeCuwlbQHJTX2tC/3dyswoFdxIX93tuwMmDabQp70zcP9LOZ68tiSzjH7CEVWwUo1PEK
	r
X-Google-Smtp-Source: AGHT+IFGAFt7xR0FTKh+jsRK8Ds/88uAg3yUw1g9ClbS8xI316TZjCy8JaoU/+Q3UgpO7vvpFlQK0g==
X-Received: by 2002:a17:90a:4093:b0:2c1:a068:ba83 with SMTP id 98e67ed59e1d1-2c2bcaeee78mr11334636a91.11.1718111249207;
        Tue, 11 Jun 2024 06:07:29 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c3076dcf04sm4380915a91.48.2024.06.11.06.07.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:07:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/10] Patch review
Date: Tue, 11 Jun 2024 06:07:15 -0700
Message-Id: <cover.1718111104.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 13:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200509

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, June 13.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7024

The following changes since commit a3f5ac9f9fee2c8e10fec7c3f758e49513fef724:

  git: set --with-gitconfig=/etc/gitconfig for -native builds (2024-05-31 14:02:17 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Deepthi Hemraj (1):
  gcc : upgrade to v13.3

Lei Maohui (1):
  run-postinsts.service: Removed --no-reload to fix reload warning when
    users execute systemctl in the first boot.

Mark Hatle (1):
  binutils: Fix aarch64 disassembly abort

Martin Hundeb?ll (1):
  classes: image_types: quote variable assignment needed by dash

Robert Joslyn (1):
  libgloss: Do not apply non-existent patch

Ross Burton (1):
  gdk-pixbuf: upgrade 2.42.11 -> 2.42.12

Siddharth (1):
  openssl: Upgrade 3.2.1 -> 3.2.2

Soumya Sambu (2):
  util-linux: Fix CVE-2024-28085
  git: upgrade 2.44.0 -> 2.44.1

Wang Mingyu (1):
  gdk-pixbuf: upgrade 2.42.10 -> 2.42.11

 meta/classes-recipe/image_types.bbclass       |    2 +-
 meta/conf/distro/include/maintainers.inc      |    2 +-
 .../openssl/openssl/CVE-2024-2511.patch       |  120 -
 .../openssl/openssl/CVE-2024-4603.patch       |  179 -
 .../openssl/openssl/bti.patch                 |   58 -
 .../{openssl_3.2.1.bb => openssl_3.2.2.bb}    |    5 +-
 meta/recipes-core/newlib/libgloss_git.bb      |    1 -
 meta/recipes-core/util-linux/util-linux.inc   |    2 +
 .../util-linux/CVE-2024-28085-0001.patch      |   36 +
 .../util-linux/CVE-2024-28085-0002.patch      |   34 +
 .../binutils/binutils-2.42.inc                |    1 +
 ...sserts-from-operand-qualifier-decode.patch |  382 ++
 .../gcc/{gcc-13.2.inc => gcc-13.3.inc}        |    9 +-
 ...ian_13.2.bb => gcc-cross-canadian_13.3.bb} |    0
 .../{gcc-cross_13.2.bb => gcc-cross_13.3.bb}  |    0
 ...-crosssdk_13.2.bb => gcc-crosssdk_13.3.bb} |    0
 ...cc-runtime_13.2.bb => gcc-runtime_13.3.bb} |    0
 ...itizers_13.2.bb => gcc-sanitizers_13.3.bb} |    0
 ...{gcc-source_13.2.bb => gcc-source_13.3.bb} |    0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |    9 +-
 ...ch64-Fix-loose-ldpstp-check-PR111411.patch |  117 -
 .../gcc/gcc/CVE-2023-4039.patch               | 3093 -----------------
 .../gcc/gcc/CVE-2024-0151.patch               |  315 --
 .../gcc/{gcc_13.2.bb => gcc_13.3.bb}          |    0
 ...initial_13.2.bb => libgcc-initial_13.3.bb} |    0
 .../gcc/{libgcc_13.2.bb => libgcc_13.3.bb}    |    0
 ...ibgfortran_13.2.bb => libgfortran_13.3.bb} |    0
 .../git/{git_2.44.0.bb => git_2.44.1.bb}      |    2 +-
 .../run-postinsts/run-postinsts.service       |    2 +-
 ...w-a-subset-of-tests-in-cross-compile.patch |   10 +-
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch  |    7 +-
 ...ixbuf_2.42.10.bb => gdk-pixbuf_2.42.12.bb} |    2 +-
 32 files changed, 479 insertions(+), 3909 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-2511.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/bti.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.2.1.bb => openssl_3.2.2.bb} (97%)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0001.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0002.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch
 rename meta/recipes-devtools/gcc/{gcc-13.2.inc => gcc-13.3.inc} (94%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_13.2.bb => gcc-cross-canadian_13.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_13.2.bb => gcc-cross_13.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_13.2.bb => gcc-crosssdk_13.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_13.2.bb => gcc-runtime_13.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_13.2.bb => gcc-sanitizers_13.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_13.2.bb => gcc-source_13.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch
 rename meta/recipes-devtools/gcc/{gcc_13.2.bb => gcc_13.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_13.2.bb => libgcc-initial_13.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_13.2.bb => libgcc_13.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_13.2.bb => libgfortran_13.3.bb} (100%)
 rename meta/recipes-devtools/git/{git_2.44.0.bb => git_2.44.1.bb} (98%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.10.bb => gdk-pixbuf_2.42.12.bb} (98%)

-- 
2.34.1


