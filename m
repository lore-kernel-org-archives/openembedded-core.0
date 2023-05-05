Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B750C77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:05 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.30305.1683300004271431036
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rQQbsx1K;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-528cdc9576cso1299082a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300003; x=1685892003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oq12FL8kth+XSBz+Ctsj5xeTYMnXPcTKBHP1zF7WV4I=;
        b=rQQbsx1KH7+/tyAJrVmMxZgj4xLGCI1FmLkpxjeuhR0/rMVuAJwpeHCzajcyG0Wchf
         AsOujtnNIIWXE7StnO62ehXbHcGY59tKObjs4i7gWeC/sWHPZrcMZCSsNS4BslJsWNeL
         EGaCxxhNnJhtNB8eOaXSKGbVv+StpjofFuhj7hIn/xiWG6GmqyIEox8u89Mj1V+l5X9t
         veFLX6cMsPYvfppwcemunHU2adEVECt98Z59wgOkodmHK4fvQq8bcQfkmvcJPid6qZa2
         5NasE1RqTTNCsGH1I+0fqi9dGBSMrHZbdoS/oH2CkIpkDxH3E4s6pB40IWQDMRTApILq
         R/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300003; x=1685892003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oq12FL8kth+XSBz+Ctsj5xeTYMnXPcTKBHP1zF7WV4I=;
        b=TlH7TKQoPpFZWVbGsiWdhVaAmd2Ysk+NLYazTUC2IOrQeIUkBZ6GUN8ubEj522mYV8
         H5BWEtOyRihxhfNGwfkr1AU+4Ufj+URK/HotWbEDhY8wwe7n94XmzC8fChH/0iDOYgHG
         +aOWxc6QLF8KzFPKuwBIr3ZH39SibyRD/xynJLt6LSbU9A2aiP1fvtLpV19lnMLz07yP
         jVlAiBstAzOFpr7Kdi0jieWgGgKJiV7yAjUFAIS/BtPF9bf/0UwUDN43u0kPj/dorUuj
         tuRA0n9claLTWyrXWQHNFqEfpirmgEdM/EBtNSZVRVDMi70zBYRn4HWY+SU3Uteh0cWK
         Q6eg==
X-Gm-Message-State: AC+VfDzD03LwFAUDKNThLzuR1UhyHMuSU70/DIbDTTp60jCJThhMOwVR
	trDfcJGOsy0P5UU2NN30kP3wFZwKsqY4nxUtW9A=
X-Google-Smtp-Source: ACHHUZ5V9CKvfoXf2xH1040RKEx1kLH3blO0Ks5KLpreJXkhoSJTu5cCqCNrnpTg3XfkxISt91sYGg==
X-Received: by 2002:a05:6a20:d2ce:b0:f2:abec:709 with SMTP id ir14-20020a056a20d2ce00b000f2abec0709mr2005072pzb.18.1683300002072;
        Fri, 05 May 2023 08:20:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/35] Patch review
Date: Fri,  5 May 2023 05:19:11 -1000
Message-Id: <cover.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180920

Please review this set of patches for mickledore and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5265

The following changes since commit c57d1a561db563ed2f521bbac5fc12d4ac8e11a7:

  build-appliance-image: Update to mickledore head revision (2023-04-22 11:11:55 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alex Kiernan (1):
  rust: Upgrade 1.68.1 -> 1.68.2

Arslan Ahmad (1):
  kernel-fitimage: Fix the default dtb config check

Bruce Ashfield (1):
  kernel: improve initramfs bundle processing time

Dmitry Baryshkov (1):
  linux-firmware: upgrade 20230210 -> 20230404

Jan Vermaete (1):
  cve-update-nvd2-native: added the missing http import

Kai Kang (1):
  libnotify: remove dependency dbus

Khem Raj (1):
  cargo: Fix build on musl/riscv

Martin Jansa (1):
  populate_sdk_ext.bbclass: set METADATA_REVISION with an DISTRO
    override

Pawan Badganchi (1):
  tiff: Add fix for CVE-2022-4645

Peter Bergin (1):
  update-alternatives.bbclass: fix old override syntax

Piotr Łobacz (1):
  libarchive: Enable acls, xattr for native as well as target

Richard Purdie (1):
  qemu: Add fix for powerpc instruction fallback issue

Ross Burton (1):
  connman: backport fix for CVE-2023-28488

Steve Sakoman (1):
  Revert "xserver-xorg: backport fix for CVE-2023-1393"

Thomas Roos (1):
  oeqa/utils/metadata.py: Fix running oe-selftest running with no distro
    set

Wang Mingyu (17):
  apr: upgrade 1.7.2 -> 1.7.3
  bind: upgrade 9.18.12 -> 9.18.13
  cracklib: upgrade 2.9.10 -> 2.9.11
  libhandy: upgrade 1.8.1 -> 1.8.2
  libpcap: upgrade 1.10.3 -> 1.10.4
  libsdl2: upgrade 2.26.3 -> 2.26.5
  mpg123: upgrade 1.31.2 -> 1.31.3
  man-pages: upgrade 6.03 -> 6.04
  mtools: upgrade 4.0.42 -> 4.0.43
  pango: upgrade 1.50.13 -> 1.50.14
  ruby: upgrade 3.2.1 -> 3.2.2
  texinfo: upgrade 7.0.2 -> 7.0.3
  wpebackend-fdo: upgrade 1.14.0 -> 1.14.2
  xserver-xorg: upgrade 21.1.7 -> 21.1.8
  xwayland: upgrade 22.1.8 -> 23.1.1
  vala: upgrade 0.56.4 -> 0.56.6
  mesa: upgrade 23.0.0 -> 23.0.2

Yoann Congal (1):
  cve-extra-exclusions: linux-yocto: ignore fixed CVE-2023-1652 &
    CVE-2023-1829

Zhixiong Chi (1):
  libpam: Fix the xtests/tst-pam_motd[1|3] failures

bkylerussell@gmail.com (1):
  kernel-devsrc: depend on python3-core instead of python3

 meta/classes-recipe/kernel-fitimage.bbclass   |  36 ++-
 meta/classes-recipe/kernel.bbclass            |   2 +-
 meta/classes-recipe/populate_sdk_ext.bbclass  |   3 +-
 .../update-alternatives.bbclass               |   4 +-
 .../distro/include/cve-extra-exclusions.inc   |  19 ++
 meta/lib/oeqa/utils/metadata.py               |   6 +-
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.12 => bind-9.18.13}/bind9 |   0
 .../{bind-9.18.12 => bind-9.18.13}/conf.patch |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.12.bb => bind_9.18.13.bb} |   2 +-
 ...ify-and-sanitize-packet-length-first.patch |  63 +++++
 .../connman/connman_1.41.bb                   |   1 +
 .../{libpcap_1.10.3.bb => libpcap_1.10.4.bb}  |   2 +-
 .../meta/cve-update-nvd2-native.bb            |   1 +
 .../{mtools_4.0.42.bb => mtools_4.0.43.bb}    |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 meta/recipes-devtools/qemu/qemu/ppc.patch     |  70 +++++
 .../ruby/{ruby_3.2.1.bb => ruby_3.2.2.bb}     |   2 +-
 .../rust/{cargo_1.68.1.bb => cargo_1.68.2.bb} |   0
 ...efine-SOCK_SEQPACKET-in-common-place.patch |  98 +++++++
 ...ibstd-rs_1.68.1.bb => libstd-rs_1.68.2.bb} |   0
 ....68.1.bb => rust-cross-canadian_1.68.2.bb} |   0
 ...ust-llvm_1.68.1.bb => rust-llvm_1.68.2.bb} |   0
 meta/recipes-devtools/rust/rust-source.inc    |   3 +-
 .../rust/{rust_1.68.1.bb => rust_1.68.2.bb}   |   0
 meta/recipes-devtools/vala/vala_0.56.4.bb     |   3 -
 meta/recipes-devtools/vala/vala_0.56.6.bb     |   3 +
 ...{cracklib_2.9.10.bb => cracklib_2.9.11.bb} |   2 +-
 .../libarchive/libarchive_3.6.2.bb            |   6 +-
 .../{man-pages_6.03.bb => man-pages_6.04.bb}  |   4 +-
 ...rely-on-all-filesystems-providing-a-.patch | 108 +++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 .../{texinfo_7.0.2.bb => texinfo_7.0.3.bb}    |   2 +-
 .../{libhandy_1.8.1.bb => libhandy_1.8.2.bb}  |   2 +-
 .../libnotify/libnotify_0.8.2.bb              |   2 +-
 .../{libsdl2_2.26.3.bb => libsdl2_2.26.5.bb}  |   2 +-
 .../{mesa-gl_23.0.0.bb => mesa-gl_23.0.2.bb}  |   0
 meta/recipes-graphics/mesa/mesa.inc           |   2 +-
 .../mesa/{mesa_23.0.0.bb => mesa_23.0.2.bb}   |   0
 .../{pango_1.50.13.bb => pango_1.50.14.bb}    |   2 +-
 ...posite-Fix-use-after-free-of-the-COW.patch |  46 ---
 ...-xorg_21.1.7.bb => xserver-xorg_21.1.8.bb} |   5 +-
 ...{xwayland_22.1.8.bb => xwayland_23.1.1.bb} |   2 +-
 ...20230210.bb => linux-firmware_20230404.bb} |   6 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   2 +-
 ...-of-TIFFTAG_INKNAMES-and-related-TIF.patch | 267 ++++++++++++++++++
 .../{mpg123_1.31.2.bb => mpg123_1.31.3.bb}    |   2 +-
 ...fdo_1.14.0.bb => wpebackend-fdo_1.14.2.bb} |   2 +-
 .../apr/{apr_1.7.2.bb => apr_1.7.3.bb}        |   2 +-
 55 files changed, 692 insertions(+), 96 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.12.bb => bind_9.18.13.bb} (97%)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-gdhcp-Verify-and-sanitize-packet-length-first.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.3.bb => libpcap_1.10.4.bb} (95%)
 rename meta/recipes-devtools/mtools/{mtools_4.0.42.bb => mtools_4.0.43.bb} (93%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/ppc.patch
 rename meta/recipes-devtools/ruby/{ruby_3.2.1.bb => ruby_3.2.2.bb} (98%)
 rename meta/recipes-devtools/rust/{cargo_1.68.1.bb => cargo_1.68.2.bb} (100%)
 create mode 100644 meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.68.1.bb => libstd-rs_1.68.2.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.68.1.bb => rust-cross-canadian_1.68.2.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.68.1.bb => rust-llvm_1.68.2.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.68.1.bb => rust_1.68.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.4.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.6.bb
 rename meta/recipes-extended/cracklib/{cracklib_2.9.10.bb => cracklib_2.9.11.bb} (94%)
 rename meta/recipes-extended/man-pages/{man-pages_6.03.bb => man-pages_6.04.bb} (92%)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch
 rename meta/recipes-extended/texinfo/{texinfo_7.0.2.bb => texinfo_7.0.3.bb} (97%)
 rename meta/recipes-gnome/libhandy/{libhandy_1.8.1.bb => libhandy_1.8.2.bb} (95%)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.26.3.bb => libsdl2_2.26.5.bb} (97%)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.0.0.bb => mesa-gl_23.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.0.0.bb => mesa_23.0.2.bb} (100%)
 rename meta/recipes-graphics/pango/{pango_1.50.13.bb => pango_1.50.14.bb} (94%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.7.bb => xserver-xorg_21.1.8.bb} (80%)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.8.bb => xwayland_23.1.1.bb} (95%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230210.bb => linux-firmware_20230404.bb} (99%)
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
 rename meta/recipes-multimedia/mpg123/{mpg123_1.31.2.bb => mpg123_1.31.3.bb} (96%)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.14.0.bb => wpebackend-fdo_1.14.2.bb} (90%)
 rename meta/recipes-support/apr/{apr_1.7.2.bb => apr_1.7.3.bb} (98%)

-- 
2.34.1


