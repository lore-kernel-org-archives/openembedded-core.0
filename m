Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE3AC38142
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 02:30:23 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.36135.1674613813263306887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 18:30:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=UP2OEddD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id f3so12538038pgc.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 18:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Se78Zr/dD8cemqdSQCNe2xjsCYm6SfliDh4Hu05P3fk=;
        b=UP2OEddDFHPV8eBSXPlmWzGOlECO4XYEg4I2MDNojzMViowxNjnBbHOODpBOv2IZOK
         UxZEN+/z761BVBg3SyYg+CNZ+A2+uonAZXjDt0j7uh14tJFZVF8OKl6+DketQABGBG0L
         pJ6/Sb4bNGuSOR6ESSVojes3iCnSA4H4+UvTCxStstzJGMV+2h+TTYPajZ65I1EsQD9f
         AQmUOawRYdh5kJG5l3zcce4BP9t48cl1qRWTmziHgYVyOLM0IRdsRvO1RSR+CR/NJxIF
         stRMEpFQ+WEwmGfTHmR6tFjkT2WJLjyCBvmCYiQqIu9b7WoA+k6vvkdOAW5Afi2PrZcQ
         GjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Se78Zr/dD8cemqdSQCNe2xjsCYm6SfliDh4Hu05P3fk=;
        b=jUZ6D4/IY040JLZlmORApB8fRKHinTnXmTAvh7bSPjxT3miZh0OysCZjyq9/LyhRUS
         fe56lXxM8PDHusdOr/PEVf/eo7s13A6VhSnkI7xDaGwN/oT3GFnivssBFB0o1UX2Ekb8
         AFkJDvldPeGiCidCuWH2B+3IiNR5pWPWKMUnMUfEN8kubQaArNTjIn7USA76CtiPspf2
         dBMVzeVggxIJYgQ+5X3JjpwfOj6D1brWhIvGUhmcU5zbZ3kVpuUgwws02Yi9W3Qr3d5V
         uDesY61Ow8q26MMEax0rUw7MCkd0jzvBoKAtKRKyZtSrEflWF0UkZXcZ6VFMzTwqdDzH
         AEHw==
X-Gm-Message-State: AFqh2kqwort0fSlLmxgNKNVN+rISDu/h9qGj7+5MCnta55jGnrYfyUOd
	1w8bp5BbsJ6NneDt9l1p3O4bKrHLdUwujuuQmPE=
X-Google-Smtp-Source: AMrXdXtMXqgPg2IRu0qyx3VHwATRgIelBoZUDUaasWU1+WDknlJCyQTNsPLoOYadRNGpknJwhKG9wg==
X-Received: by 2002:aa7:8611:0:b0:582:df2e:595d with SMTP id p17-20020aa78611000000b00582df2e595dmr29553947pfn.4.1674613812126;
        Tue, 24 Jan 2023 18:30:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g2-20020aa79f02000000b0058bbe1240easm2267798pfr.190.2023.01.24.18.30.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 18:30:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/42] Pull request (cover letter only)
Date: Tue, 24 Jan 2023 16:30:07 -1000
Message-Id: <cover.1674613569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 02:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176337

The following changes since commit 4760fac939a6204e3cb7dcd3699cd9a2508f9dee:

  devtool: process local files only for the main branch (2023-01-12 04:56:26 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alex Kiernan (1):
  classes: image: Set empty weak default IMAGE_LINGUAS

Alexander Kanavin (5):
  libksba: update 1.6.2 -> 1.6.3
  linux-firmware: upgrade 20221109 -> 20221214
  xwayland: upgrade 22.1.5 -> 22.1.7
  xserver-xorg: upgrade 21.1.4 -> 21.1.6
  selftest/virgl: use pkg-config from the host

Antonin Godard (2):
  busybox: always start do_compile with orig config files
  busybox: rm temporary files if do_compile was interrupted

Benoît Mauduit (1):
  lib/oe/reproducible: Use git log without gpg signature

Bhabu Bindu (1):
  qemu: Fix CVE-2022-4144

Bruce Ashfield (5):
  linux-yocto/5.15: ltp and squashfs fixes
  linux-yocto/5.15: fix perf build with clang
  linux-yocto/5.15: libbpf: Fix build warning on ref_ctr_off
  linux-yocto/5.15: update to v5.15.84
  linux-yocto/5.15: powerpc: Fix reschedule bug in KUAP-unlocked user
    copy

Chen Qi (2):
  dhcpcd: backport two patches to fix runtime error
  libseccomp: fix typo in DESCRIPTION

Daniel Gomez (1):
  gtk-icon-cache: Fix GTKIC_CMD if-else condition

He Zhe (1):
  lttng-modules: update 2.13.7 -> 2.13.8

Hitendra Prajapati (1):
  go: fix CVE-2022-41717 Excessive memory use in got server

Jan Kircher (1):
  toolchain-scripts: compatibility with unbound variable protection

Jermain Horsman (1):
  cve-check: write the cve manifest to IMGDEPLOYDIR

KARN JYE LAU (1):
  freetype:update mirror site.

Khem Raj (1):
  tiff: Add packageconfig knob for webp

Marta Rybczynska (1):
  cve-update-db-native: avoid incomplete updates

Martin Jansa (1):
  ffmpeg: refresh patches to apply cleanly

Narpat Mali (4):
  python3-setuptools: fix for CVE-2022-40897
  python3-wheel: fix for CVE-2022-40898
  python3-git: fix for CVE-2022-24439
  ffmpeg: fix for CVE-2022-3341

Pavel Zhukov (1):
  gcc: Refactor linker patches and fix linker on arm with usrmerge

Petr Kubizňák (1):
  harfbuzz: remove bindir only if it exists

Quentin Schulz (1):
  cairo: fix CVE patches assigned wrong CVE number

Randy MacLeod (1):
  vim: upgrade 9.0.0947 -> 9.0.1211

Ross Burton (1):
  cve-update-db-native: show IP on failure

Sandeep Gundlupet Raju (2):
  kernel-fitimage: Adjust order of dtb/dtbo files
  kernel-fitimage: Allow user to select dtb when multiple dtb exists

Saul Wold (1):
  at: Change when files are copied

Steve Sakoman (1):
  Revert "libksba: fix CVE-2022-47629"

Vivek Kumbhar (1):
  openssl: fix CVE-2022-3996 double locking leads to denial of service

Yash Shinde (1):
  glibc: stable 2.35 branch updates.

Yogita Urade (1):
  libksba: fix CVE-2022-47629

 meta/classes/cve-check.bbclass                |   6 +-
 meta/classes/gtk-icon-cache.bbclass           |   2 +-
 meta/classes/image.bbclass                    |   3 +-
 meta/classes/kernel-fitimage.bbclass          |  21 +-
 meta/classes/toolchain-scripts.bbclass        |   2 +-
 meta/lib/oe/reproducible.py                   |   3 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +-
 .../dhcpcd/dhcpcd_9.4.1.bb                    |   2 +
 ...low-getrandom-sysctl-for-newer-glibc.patch |  30 ++
 ...sep-Allow-newfstatat-syscall-as-well.patch |  31 ++
 .../openssl/openssl/CVE-2022-3996.patch       |  43 ++
 .../openssl/openssl_3.0.7.bb                  |   1 +
 meta/recipes-core/busybox/busybox.inc         |  26 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../recipes-core/meta/cve-update-db-native.bb |  88 +++-
 meta/recipes-devtools/gcc/gcc-11.3.inc        |   1 -
 ...rm-add-armv9-a-architecture-to-march.patch |  89 ++--
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 269 +++++++---
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  10 +-
 ...019-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  25 -
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2022-41717.patch           |  89 ++++
 ...-git-CVE-2022-24439-fix-from-PR-1518.patch |  97 ++++
 ...-git-CVE-2022-24439-fix-from-PR-1521.patch | 488 ++++++++++++++++++
 .../python/python3-git_3.1.27.bb              |   4 +
 ...-of-whitespace-to-search-backtrack.-.patch |  31 ++
 .../python/python3-setuptools_59.5.0.bb       |   1 +
 ...tential-DoS-attack-via-WHEEL_INFO_RE.patch |  32 ++
 .../python/python3-wheel_0.37.1.bb            |   4 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-4144.patch             |  99 ++++
 meta/recipes-extended/at/at_3.2.5.bb          |   6 +-
 .../cairo/cairo/CVE-2019-6461.patch           |  46 +-
 .../cairo/cairo/CVE-2019-6462.patch           |  46 +-
 .../freetype/freetype_2.11.1.bb               |   2 +-
 .../harfbuzz/harfbuzz_4.0.1.bb                |   6 +-
 ...possible-memleaks-in-XkbGetKbdByName.patch |  63 ---
 ...ntedString-against-request-length-at.patch |  38 --
 ...-xorg_21.1.4.bb => xserver-xorg_21.1.6.bb} |   4 +-
 ...{xwayland_22.1.5.bb => xwayland_22.1.7.bb} |   2 +-
 ...20221109.bb => linux-firmware_20221214.bb} |   4 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 ...ules_2.13.7.bb => lttng-modules_2.13.8.bb} |   2 +-
 ...c-stop-accessing-out-of-bounds-frame.patch |  19 +-
 ...c-stop-accessing-out-of-bounds-frame.patch |   7 +-
 ...-vp3-Add-missing-check-for-av_malloc.patch |  12 +-
 ...ec-Add-check-for-avformat_new_stream.patch |  67 +++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |   3 +-
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   1 +
 .../libksba/ksba-add-pkgconfig-support.patch  |   6 +-
 .../{libksba_1.6.2.bb => libksba_1.6.3.bb}    |   2 +-
 .../libseccomp/libseccomp_2.5.3.bb            |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 55 files changed, 1479 insertions(+), 404 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1518.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
 create mode 100644 meta/recipes-devtools/python/python3-wheel/0001-Fixed-potential-DoS-attack-via-WHEEL_INFO_RE.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.4.bb => xserver-xorg_21.1.6.bb} (80%)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.5.bb => xwayland_22.1.7.bb} (95%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221109.bb => linux-firmware_20221214.bb} (99%)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.7.bb => lttng-modules_2.13.8.bb} (94%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
 rename meta/recipes-support/libksba/{libksba_1.6.2.bb => libksba_1.6.3.bb} (94%)

-- 
2.25.1


