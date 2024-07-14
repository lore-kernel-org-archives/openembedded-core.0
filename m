Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B665CC3DA49
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:08 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.15269.1720960742971707632
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f8mAgkI7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fb72eb3143so23781285ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960742; x=1721565542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t+FUuQYkWAqrbF6QEqexuCEXLO0c3ZbrN0oaLOsmwME=;
        b=f8mAgkI7dME5SzgjGq3NB2ejLVOCE5uaFCMWx+jZEoFVVJZZr2XN32D+g/rek++q3z
         JlxxZfrPtY9IRblcoSZboio01lYS97wN6oAsOlUtMgBVFGpYb135ekGvUV5W+WKmg1tH
         KtaOghaGEY9Ym1VSyJsl1r516rAY9Wv73FMfqD4QKUI2N0gwcasD3wW2MMExUCd/g3k/
         KxfoiPufWndtZwGHG12L/AhUkHArApxsJ/x9D1wHNS7zscBMDNIVPhoOQe5eeMv0xbkr
         BAfMhaHo2lEcODTUAja0qsU0CzDt2D5iSRa9ooaW04OIwOyAWt5TiZMiY7dfrHkWb1w0
         Arqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960742; x=1721565542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+FUuQYkWAqrbF6QEqexuCEXLO0c3ZbrN0oaLOsmwME=;
        b=E0z3n5Lo6aCo3vkF7Akz8INdH5av7tZpSYUKs+HNUKQY0w14cEwv3jpEkZLto95i89
         gvI3MHr2De4cjGqFjBV2pap8koQ4NmOAIwq3Jyf2mtQWw+WtHPmQYQn3yt1IRaFe8kT5
         JPgh93Iy//13NNAB0tHaYFjvgIRKDbD8ftRW8fAxoK65JvcLgrd4dzOZrjdi98FtYXJ8
         iYxkRhqk44RBh3AiawwqEJ3tcu3xTXZ51ojczSA2VhHpHolVpnsQyLJU7qBH6hDi2xzo
         Jk7jnITk1Qbeb/TctutR7iYEWDB2g9/XnO1FcpMO6mVaD2BLu6MFLn1W3VXSBSa59Tqq
         qtsg==
X-Gm-Message-State: AOJu0YwOkE+si8E1zS45wUedIRuWI665t+18GufHVyMhNEkGnHSGhGaZ
	azD6XmQ+O0WmrfNCSv8l38kdBKni7wXcsCfnwTxgORgsS5IF+zDPXeLurfejHaOkBBeUTGSbP1H
	V4jE=
X-Google-Smtp-Source: AGHT+IEIVfliDlO84n3iwIYnS+PAJ5g5tBzFw+CPX1ilAI7ypa1NAjyKPBEjO7t+hGswTr3gW0kx5w==
X-Received: by 2002:a17:902:684b:b0:1fb:5f9c:a86c with SMTP id d9443c01a7336-1fc0b4b3c89mr39272225ad.3.1720960741921;
        Sun, 14 Jul 2024 05:39:01 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/27] Patch review
Date: Sun, 14 Jul 2024 05:38:29 -0700
Message-Id: <cover.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201859

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, July 16

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7136

The following changes since commit d511c41dac048fbdd93a54136e93b0623a18a83d:

  xz: Update LICENSE variable for xz packages (2024-07-08 05:40:28 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (6):
  mesa: remove obsolete
    0001-meson.build-check-for-all-linux-host_os-combinations.patch
  kexec-tools: submit
    0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch upstream
  vorbis: mark patch as Inactive-Upstream
  grub: mark grub-module-explicitly-keeps-symbole-.module_license.patch
    as a workaround
  perl: submit the rest of determinism.patch upstream
  iptables: submit
    0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
    upstream

Changqing Li (2):
  webkitgtk: fix do_configure error on beaglebone-yocto
  webkitgtk: fix do_compile errors on beaglebone-yocto

Enrico Jörns (1):
  wic: engine.py: use raw string for escape sequence

Hitendra Prajapati (1):
  ruby: fix CVE-2024-27281

Jookia (1):
  populate_sdk_ext.bbclass: Fix undefined variable error

Khem Raj (1):
  linux-yocto: Enable team net driver

Niko Mauno (1):
  dnf/mesa: Fix missing leading whitespace with ':append'

Peter Marko (1):
  ncurses: switch to new mirror

Richard Purdie (2):
  selftest/cases/runtime_test: Exclude centos-9 from virgl tests
  cve-exclusion: Drop the version comparision/warning

Robert Kovacsics (1):
  sdk: Fix path length limit to match reserved size

Ross Burton (6):
  cpio: mark CVE-2023-7216 as disputed
  fribidi: upgrade 1.0.13 -> 1.0.14
  gstreamer1.0: skip another known flaky test
  libportal: fix rare build race
  meson: don't use deprecated pkgconfig variable
  curl: skip FTP tests in run-ptest

Wang Mingyu (2):
  ed: upgrade 1.20.1 -> 1.20.2
  llvm: upgrade 18.1.5 -> 18.1.6

Yi Zhao (2):
  libcap-ng: upgrade 0.8.4 -> 0.8.5
  libcap-ng-python: upgrade 0.8.4 -> 0.8.5

 meta/classes-recipe/populate_sdk_ext.bbclass  |  2 +
 meta/files/toolchain-shar-extract.sh          |  4 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  2 +-
 ...icitly-keeps-symbole-.module_license.patch |  2 +-
 meta/recipes-core/meta/uninative-tarball.bb   |  2 +
 meta/recipes-core/ncurses/ncurses.inc         |  2 +-
 meta/recipes-core/ncurses/ncurses_6.4.bb      |  4 +-
 meta/recipes-devtools/dnf/dnf_4.19.0.bb       |  2 +-
 .../llvm/{llvm_18.1.5.bb => llvm_18.1.6.bb}   |  2 +-
 meta/recipes-devtools/meson/meson_1.3.1.bb    |  4 +-
 .../perl/files/determinism.patch              |  6 +-
 .../ruby/ruby/CVE-2024-27281.patch            | 97 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.2.2.bb      |  1 +
 meta/recipes-extended/cpio/cpio_2.15.bb       |  1 +
 .../ed/{ed_1.20.1.bb => ed_1.20.2.bb}         |  2 +-
 ...ption-to-enable-disable-libnfnetlink.patch | 44 +++++----
 ...build-race-when-building-GTK-vapi-fi.patch | 49 ++++++++++
 .../libportal/libportal_0.7.1.bb              |  3 +-
 ...k-for-all-linux-host_os-combinations.patch | 42 --------
 meta/recipes-graphics/mesa/mesa.inc           |  3 +-
 ...Fix-add_buffer_phys_virt-align-issue.patch |  2 +-
 .../linux/cve-exclusion_6.6.inc               | 18 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  2 +
 .../gstreamer/gstreamer1.0/run-ptest          |  9 +-
 .../0001-configure-Check-for-clang.patch      |  2 +-
 ...fic-declarations-in-FELighting.h-unn.patch | 44 +++++++++
 ...icDowncast-adoption-in-platform-code.patch | 65 +++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.44.1.bb  | 14 +--
 meta/recipes-support/curl/curl/run-ptest      |  4 +-
 .../{fribidi_1.0.13.bb => fribidi_1.0.14.bb}  |  2 +-
 ...hon-path-when-invoking-py-compile-54.patch | 34 +++++++
 .../files/fix-issues-with-swig-4-2.patch      | 32 ------
 ...hon_0.8.4.bb => libcap-ng-python_0.8.5.bb} |  0
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  4 +-
 ...{libcap-ng_0.8.4.bb => libcap-ng_0.8.5.bb} |  0
 scripts/lib/wic/engine.py                     |  2 +-
 36 files changed, 369 insertions(+), 139 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_18.1.5.bb => llvm_18.1.6.bb} (98%)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
 rename meta/recipes-extended/ed/{ed_1.20.1.bb => ed_1.20.2.bb} (93%)
 create mode 100644 meta/recipes-gnome/libportal/files/0001-meson.build-fix-build-race-when-building-GTK-vapi-fi.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch
 rename meta/recipes-support/fribidi/{fribidi_1.0.13.bb => fribidi_1.0.14.bb} (89%)
 create mode 100644 meta/recipes-support/libcap-ng/files/0001-Fix-python-path-when-invoking-py-compile-54.patch
 delete mode 100644 meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.8.4.bb => libcap-ng-python_0.8.5.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.8.4.bb => libcap-ng_0.8.5.bb} (100%)

-- 
2.34.1


