Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D59C78843
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:20 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.18267.1726839559059465151
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zXNK9HwY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718d704704aso1700103b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839558; x=1727444358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nznV6f2YzoiHW1/F1fAZ/YbGNYmMnHKDjd/FYQI+BFs=;
        b=zXNK9HwYIgybwrDmSqU5/UL01TSNuPtCRmi5ZRzeSua5R6gpsvWyU4hr8OqZ47susj
         DkdBDoGEHXEalSAbxI5dts4bK78BqkG/dJRgyjZLuJoFge1DhV0aMizBx4INmPtasH9L
         iorVEg+yP1zo2TQRQ0L+I7203dOV1puJtBlVAF37HXzulMZuU+iq3npRiC0u/LTd0JEr
         5Iad4iThhoGbaxqLEM3rJaRsoKt/IFaTbjSJL8DQqzGN2KUnXU01uLhYhBjn3iSuIeJO
         QlcJwPfRQMa8eLMpwusxK/+stdbf0Mw/EFQKDlhaN1szVOMU/DX8zDbU/BTZGnK039ux
         CeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839558; x=1727444358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nznV6f2YzoiHW1/F1fAZ/YbGNYmMnHKDjd/FYQI+BFs=;
        b=wJ/118mlX7Jfr1mES19522a3/FKSOn33Vgd4wvROQFTJGOrmm3dkjg+w5mP4K2y3wR
         QDkeailkMKnNOsN9Nz9iKhyyj2TUDFzSuqg+t+zr1vpofGAWZCACLbUqCw4eeFZYcK0k
         3cVxyiScblWK+wW+gbTMgYRD/0E6TjOu4IkRR0H9PQZDisZVjLRwDuXfKLQzAGDxq6Xb
         cN681+xE2ZLdDi8KjUnGXZ2AXEGhVjzKam108vTCiWdXOneUYirh+Wg8TqpOAS8sgkg2
         k83hrIWM7mQ7xWw/FMF4yLJMZSta6Q2s3ibxUsX33g8AVGULn2R1CV73LhKKfG+jZ8s1
         sQHw==
X-Gm-Message-State: AOJu0YyseXeTCFK/feXvKRXVP231AnECmHCP2BB9UhoOo1OeKqS+e90u
	cqF7p25Hu1smRZaIWu/bbf9SC6u33WvR7ciSOUDcUNUwZCMRCV2rpMtVyJAkozWZjwKKKo9kRL4
	D
X-Google-Smtp-Source: AGHT+IFn/qGlcV8R2TvZ8AtW+vqZ2mLqilLdK2aGeQ3Qgz10doi5tmiUYRUtS0YcfKhj2W5Xo3MV2A==
X-Received: by 2002:a05:6a00:1794:b0:717:900d:7cbd with SMTP id d2e1a72fcca58-7199c936b0amr4340061b3a.5.1726839557937;
        Fri, 20 Sep 2024 06:39:17 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/16] Patch review
Date: Fri, 20 Sep 2024 06:38:58 -0700
Message-Id: <cover.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204739

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, September 24

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7346

The following changes since commit 343f40b0bc8ef65cc1e2abd6c9c33bb2e08bad3d:

  libedit: Make docs generation deterministic (2024-09-12 14:34:56 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alban Bedel (1):
  bind: Fix build with the `httpstats` package config enabled

Chen Qi (1):
  qemu: back port patches to fix riscv64 build failure

Colin McAllister (2):
  udev-extraconf: Add collect flag to mount
  busybox: Fix cut with "-s" flag

Guðni Már Gilbert (1):
  bluez5: remove redundant patch for MAX_INPUT

Khem Raj (1):
  gcc: Fix spurious '/' in GLIBC_DYNAMIC_LINKER on microblaze

Mark Hatle (1):
  create-sdpx-2.2.bbclass: Switch from exists to isfile checking
    debugsrc

Pedro Ferreira (2):
  buildhistory: Fix intermittent package file list creation
  buildhistory: Restoring files from preserve list

Peter Marko (1):
  python3: Upgrade 3.12.5 -> 3.12.6

Richard Purdie (1):
  buildhistory: Simplify intercept call sites and drop
    SSTATEPOSTINSTFUNC usage

Siddharth Doshi (1):
  openssl: Upgrade 3.2.2 -> 3.2.3

Steve Sakoman (1):
  Revert "wpa-supplicant: Upgrade 2.10 -> 2.11"

Trevor Gamblin (2):
  python3: upgrade 3.12.4 -> 3.12.5
  python3: skip readline limited history tests

Vijay Anusuri (1):
  libpcap: Security fix for CVE-2023-7256 & CVE-2024-8006

 meta/classes-global/sstate.bbclass            |    5 +-
 meta/classes/buildhistory.bbclass             |   71 +-
 meta/classes/create-spdx-2.2.bbclass          |    3 +-
 .../recipes-connectivity/bind/bind_9.18.28.bb |    2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |    1 -
 ...shared-util.c-include-linux-limits.h.patch |   27 -
 .../libpcap/libpcap/CVE-2023-7256-pre1.patch  |   37 +
 .../libpcap/libpcap/CVE-2023-7256.patch       |  365 +++++
 .../libpcap/libpcap/CVE-2024-8006.patch       |   42 +
 .../libpcap/libpcap_1.10.4.bb                 |    7 +-
 ...ke-history-reporting-when-test-fails.patch |    8 +-
 .../openssl/openssl/CVE-2024-5535_1.patch     |  113 --
 .../openssl/openssl/CVE-2024-5535_10.patch    |  203 ---
 .../openssl/openssl/CVE-2024-5535_2.patch     |   43 -
 .../openssl/openssl/CVE-2024-5535_3.patch     |   38 -
 .../openssl/openssl/CVE-2024-5535_4.patch     |   82 --
 .../openssl/openssl/CVE-2024-5535_5.patch     |  176 ---
 .../openssl/openssl/CVE-2024-5535_6.patch     | 1173 -----------------
 .../openssl/openssl/CVE-2024-5535_7.patch     |   43 -
 .../openssl/openssl/CVE-2024-5535_8.patch     |   66 -
 .../openssl/openssl/CVE-2024-5535_9.patch     |  271 ----
 .../{openssl_3.2.2.bb => openssl_3.2.3.bb}    |   14 +-
 ...all-wpa_passphrase-when-not-disabled.patch |   33 +
 ...te-Phase-2-authentication-requiremen.patch |  213 +++
 ...options-for-libwpa_client.so-and-wpa.patch |   73 +
 ...oval-of-wpa_passphrase-on-make-clean.patch |   26 +
 ...plicant_2.11.bb => wpa-supplicant_2.10.bb} |   10 +-
 ...1-cut-Fix-s-flag-to-omit-blank-lines.patch |   66 +
 meta/recipes-core/busybox/busybox_1.36.1.bb   |    1 +
 .../recipes-core/udev/udev-extraconf/mount.sh |    2 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |    6 +-
 ...t_readline-skip-limited-history-test.patch |   38 +
 .../python/python3/CVE-2024-7592.patch        |  143 --
 .../python/python3/CVE-2024-8088.patch        |  128 --
 .../{python3_3.12.4.bb => python3_3.12.6.bb}  |    5 +-
 meta/recipes-devtools/qemu/qemu.inc           |    3 +
 ...kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch |   75 ++
 ...kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch |   73 +
 ...cv-kvm-change-timer-regs-size-to-u64.patch |  107 ++
 39 files changed, 1226 insertions(+), 2566 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_1.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_10.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_2.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_3.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_4.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_5.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_6.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_7.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_8.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_9.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.2.2.bb => openssl_3.2.3.bb} (94%)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-disabled.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.11.bb => wpa-supplicant_2.10.bb} (90%)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-cut-Fix-s-flag-to-omit-blank-lines.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-7592.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-8088.patch
 rename meta/recipes-devtools/python/{python3_3.12.4.bb => python3_3.12.6.bb} (99%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-riscv-kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-target-riscv-kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-target-riscv-kvm-change-timer-regs-size-to-u64.patch

-- 
2.34.1


