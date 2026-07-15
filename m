Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4100CC4450F
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:11 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12682.1784134081377719070
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JpW384MJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-49ff971e903so554799b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134080; x=1784738880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOQDx3C+YlpyQo3jujzfJbQt4Htk4WwGyc/aGJ+M5oc=;
        b=JpW384MJEGNloskI3+FrVmc+YEku/SXLycs7NnccLWcVTyFv6ylYMcZjJmtM/ab3iX
         w8bwYSb5fketjrN0yLBDp4kYldfFPrldUP9rY5WH+aYCTkxNVKoQQuxc1RBDtLIQElXS
         hUyQwPZSSpeiqUX7KGzB/SENRCc9tDPmHmgmdIDR8juUjRfUzrISjMobhglgq306QNb4
         ZfJ5YqeSYH6WJUwDBNT1FJoUKxrMlizpQKXiZE/UXJuIiZkM4fS5kChxa0TfGAmWz4Aj
         Zv91fz3+zPPVLW/pKZQug7kviVvzVpkrgrQCsrlPyUAgMJXrZY0ezf2AiWEc+ggPEKZG
         1uDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134080; x=1784738880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zOQDx3C+YlpyQo3jujzfJbQt4Htk4WwGyc/aGJ+M5oc=;
        b=P3VsgPxhCpxwYmmaIhYlYGJtQIcrS2BUYDmp6zzBx8yZ8cH7zRPjVWhafY7gt7H6zn
         3HsdhdrhO67p54kZRhNmI5J142TOE0STuZw1LgcjhoVXcxlhhFTosVt0qR4mD7Gk5+H6
         WWmE+1alfB6k066wQVSdhWVHV74FMfzorbYOg5W/G8Aylda7GhBzSLhTXpaewLITfv6h
         gJO5DFdj3B0YX3iShXdD/pDCz9nnhHMlmu2PnBjdODFC9c0Xw3MaQUSEncsvhi3TJ7bU
         d5aCRd7CF2S8OYIiZ9rNC0L17Tpj8MRrIJXGIKvgjOq+el1PC2lKVO0F9X/6idM4yE12
         DX1w==
X-Gm-Message-State: AOJu0Yx1HWoJgPQoa2S2RU2AO15f6fIlN2qES1Y185qJ7P0Mlu+uC6DE
	vlz8lDnz6k8mMorSmWm11O/J0H738bSJWud//AtfWsIKr1uhrnYMJFNBBJboeQ==
X-Gm-Gg: AfdE7cnKNUXg+PySRxrmnV8R33gPIwkV+qc1lrkWGUyFfTxWmlOeKsA8Ts8JGJ9AAIa
	jiWa146xMghVcq8m3AtXvyZp7B6Ido9sWpOnCxGP9Ra3tWjQldae9nZvWrCjZWNxpQFKgQu0mTV
	ZG2A48XcCDzTBuZSCF5sUOwrvqtzyvTbOCff7HjIHjKPWxSxzXhp9yI32v09RtyQnoMkq3Mb8nI
	VRYl8n7MmfhVJzCQD3wuQqgGh6p3FlinRZaldauHIsiKZlSF01tFD8ScG5tRHF7qYhC8gXl/WBq
	ncEKFkK6xns/M+U7MVB4kgcyD+hWqQwqav1Zb0OJbwFq+cxwIhGGnUpIYO+8HDqVAIlRjh+KABm
	ymM3jYmFClBY+PR/LApPwzBAta5Bes19Bmq1LUfqNipqwoSGFg0wBH3h7m+grViveBBWW2X1659
	gquP6p8HOZ
X-Received: by 2002:a05:6808:124d:b0:492:7abc:422e with SMTP id 5614622812f47-4a4ac8ad135mr59593b6e.13.1784134077859;
        Wed, 15 Jul 2026 09:47:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:57 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 21/25] Convert licenses to SPDX expressions
Date: Wed, 15 Jul 2026 10:45:17 -0600
Message-ID: <20260715164739.364323-22-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241018

Automatically convert all licenses to valid SPDX license expressions
using convert-spdx-licenses.py

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../python/python3-guessing-game_git.bb       |  2 +-
 .../python3-guessing-game_git.bb.upgraded     |  2 +-
 .../sysdig/sysdig-selftest_0.28.0.bb          |  2 +-
 .../recipes-test/aspell/aspell_0.0.0.1.bb     |  2 +-
 .../license/incompatible-license-alias.bb     |  2 +-
 .../license/incompatible-licenses.bb          |  2 +-
 .../license/incompatible-nonspdx-license.bb   |  2 +-
 meta/recipes-bsp/alsa-state/alsa-state.bb     |  2 +-
 meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb     |  2 +-
 meta/recipes-bsp/usbutils/usbutils_019.bb     |  4 +--
 meta/recipes-connectivity/avahi/avahi_0.9.bb  |  2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |  2 +-
 .../connman/connman-gnome_0.7.bb              |  2 +-
 .../nfs-utils/nfs-utils_2.9.1.bb              |  2 +-
 .../openssh/openssh_10.4p1.bb                 |  2 +-
 meta/recipes-connectivity/ppp/ppp_2.5.3.bb    |  2 +-
 .../slirp/libslirp_4.9.3.bb                   |  2 +-
 .../socat/socat_1.8.1.3.bb                    |  3 +-
 meta/recipes-core/busybox/busybox.inc         |  2 +-
 meta/recipes-core/dbus/dbus-glib_0.114.bb     |  2 +-
 meta/recipes-core/dbus/dbus_1.16.2.bb         |  2 +-
 .../recipes-core/dropbear/dropbear_2026.92.bb |  2 +-
 meta/recipes-core/gettext/gettext_1.0.bb      |  2 +-
 meta/recipes-core/glib-2.0/glib.inc           |  2 +-
 meta/recipes-core/glibc/glibc-common.inc      |  2 +-
 .../initscripts/init-system-helpers_1.69.bb   |  2 +-
 meta/recipes-core/kbd/kbd_2.10.0.bb           |  4 +--
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  2 +-
 meta/recipes-core/musl/bsd-headers.bb         |  2 +-
 meta/recipes-core/musl/musl-locales_git.bb    |  2 +-
 meta/recipes-core/musl/musl-utils.bb          |  2 +-
 meta/recipes-core/newlib/newlib.inc           |  2 +-
 meta/recipes-core/picolibc/picolibc.inc       |  2 +-
 .../sysfsutils/sysfsutils_2.1.1.bb            |  2 +-
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 meta/recipes-core/udev/eudev_3.2.14.bb        |  2 +-
 .../util-linux/util-linux_2.42.2.bb           | 36 +++++++++----------
 .../btrfs-tools/btrfs-tools_7.0.bb            |  2 +-
 meta/recipes-devtools/ccache/ccache_4.13.6.bb |  2 +-
 .../cdrtools/cdrtools-native_3.01.bb          |  2 +-
 meta/recipes-devtools/clang/common.inc        |  2 +-
 meta/recipes-devtools/clang/llvm_git.bb       |  2 +-
 .../clang/nativesdk-clang-glue.bb             |  2 +-
 .../debugedit/debugedit_5.3.bb                |  2 +-
 .../docbook-xml/docbook-xml-dtd4_4.5.bb       |  2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |  2 +-
 .../elfutils/elfutils_0.195.bb                | 10 +++---
 .../erofs-utils/erofs-utils_1.9.2.bb          |  2 +-
 meta/recipes-devtools/expect/expect_5.45.4.bb |  2 +-
 .../fastfloat/fastfloat_8.2.10.bb             |  2 +-
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  2 +-
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  2 +-
 meta/recipes-devtools/gdb/gdb.inc             |  2 +-
 meta/recipes-devtools/git/git_2.55.0.bb       |  2 +-
 .../i2c-tools/i2c-tools_4.4.bb                |  2 +-
 .../libtool/libtool-2.5.4.inc                 |  2 +-
 .../log4cplus/log4cplus_2.2.0.1.bb            |  2 +-
 meta/recipes-devtools/orc/orc_0.4.42.bb       |  2 +-
 .../perl-cross/perlcross_1.6.4.bb             |  2 +-
 .../perl/libmodule-build-perl_0.4234.bb       |  2 +-
 .../perl/libtest-fatal-perl_0.018.bb          |  2 +-
 .../perl/libtest-needs-perl_0.002010.bb       |  2 +-
 .../perl/libtest-warnings-perl_0.038.bb       |  2 +-
 .../recipes-devtools/perl/libxml-perl_0.08.bb |  2 +-
 .../perl/libxml-simple-perl_2.25.bb           |  2 +-
 meta/recipes-devtools/perl/perl_5.42.2.bb     |  2 +-
 .../python/python-pycryptodome.inc            |  2 +-
 .../python/python3-cryptography-vectors.bb    |  2 +-
 .../python/python3-cryptography.bb            |  2 +-
 .../python/python3-docutils_0.23.bb           |  4 +--
 .../python/python3-dtc_1.8.1.bb               |  2 +-
 .../python/python3-idna_3.18.bb               |  2 +-
 .../python/python3-lxml_6.1.1.bb              |  2 +-
 .../python/python3-maturin_1.14.1.bb          |  2 +-
 .../python/python3-numpy_2.5.0.bb             |  2 +-
 .../python/python3-packaging_26.2.bb          |  2 +-
 .../python/python3-pip_26.1.2.bb              |  2 +-
 .../python/python3-poetry-core_2.4.1.bb       |  2 +-
 .../python/python3-pycairo_1.29.0.bb          |  2 +-
 .../python/python3-roman-numerals_4.1.0.bb    |  2 +-
 .../python/python3-sphinx-rtd-theme_3.1.0.bb  |  2 +-
 .../python/python3-sphinx_9.1.0.bb            |  2 +-
 .../python/python3-subunit_1.4.4.bb           |  2 +-
 .../python/python3-uv-build_0.11.28.bb        |  2 +-
 .../qemu/python3-qemu-qmp_0.0.6.bb            |  2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 .../rpm-sequoia/rpm-sequoia_1.10.2.bb         |  2 +-
 meta/recipes-devtools/ruby/ruby_4.0.5.bb      |  2 +-
 meta/recipes-devtools/rust/cargo_1.96.1.bb    |  2 +-
 .../recipes-devtools/rust/libstd-rs_1.96.1.bb |  2 +-
 meta/recipes-devtools/rust/rust_1.96.1.bb     |  2 +-
 meta/recipes-devtools/strace/strace_7.1.bb    |  2 +-
 .../subversion/subversion_1.14.5.bb           |  2 +-
 meta/recipes-devtools/swig/swig_4.4.1.bb      |  2 +-
 .../systemd-bootchart_235.bb                  |  2 +-
 .../tcf-agent/tcf-agent_1.11.0.bb             |  2 +-
 meta/recipes-devtools/tcltk/tcl_9.0.4.bb      |  2 +-
 meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb   |  2 +-
 .../valgrind/valgrind_3.27.1.bb               |  2 +-
 .../acpica/acpica_20260408.bb                 |  2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  4 +--
 meta/recipes-extended/cronie/cronie_1.7.2.bb  |  2 +-
 meta/recipes-extended/gawk/gawk_5.4.1.bb      |  2 +-
 meta/recipes-extended/hdparm/hdparm_9.65.bb   |  6 ++--
 .../iputils/iputils_20250605.bb               |  2 +-
 .../jansson/jansson_2.15.1.bb                 |  2 +-
 meta/recipes-extended/less/less_704.bb        |  2 +-
 meta/recipes-extended/libidn/libidn2_2.3.8.bb |  4 +--
 meta/recipes-extended/ltp/ltp_20260529.bb     |  2 +-
 meta/recipes-extended/man-db/man-db_2.13.1.bb |  2 +-
 .../man-pages/man-pages_6.18.bb               |  2 +-
 meta/recipes-extended/mdadm/mdadm_4.6.bb      |  2 +-
 meta/recipes-extended/pam/libpam_1.7.2.bb     |  2 +-
 .../perl/libconvert-asn1-perl_0.34.bb         |  2 +-
 .../perl/libtimedate-perl_2.30.bb             |  2 +-
 .../perl/libxml-namespacesupport-perl_1.12.bb |  2 +-
 .../perl/libxml-sax-base-perl_1.09.bb         |  2 +-
 .../perl/libxml-sax-perl_1.02.bb              |  2 +-
 meta/recipes-extended/pigz/pigz_2.8.bb        |  2 +-
 meta/recipes-extended/procps/procps_4.0.6.bb  |  2 +-
 meta/recipes-extended/quota/quota_4.11.bb     |  2 +-
 .../shadow/shadow-sysroot_4.6.bb              |  2 +-
 meta/recipes-extended/sudo/sudo.inc           |  2 +-
 meta/recipes-extended/timezone/timezone.inc   |  2 +-
 meta/recipes-extended/zstd/zstd_1.5.7.bb      |  2 +-
 .../gi-docgen/gi-docgen_2026.1.bb             |  2 +-
 .../gnome/adwaita-icon-theme_50.0.bb          |  2 +-
 .../gobject-introspection_1.86.0.bb           |  2 +-
 meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb      |  2 +-
 meta/recipes-gnome/gtk+/gtk4_4.22.4.bb        |  2 +-
 meta/recipes-graphics/cairo/cairo_1.18.4.bb   | 12 +++----
 .../cantarell-fonts_0.303.1.bb                |  2 +-
 .../fontconfig/fontconfig_2.18.2.bb           |  2 +-
 .../freetype/freetype_2.14.3.bb               |  2 +-
 .../glslang/glslang_1.4.350.1.bb              |  2 +-
 .../jpeg/libjpeg-turbo_3.2.0.bb               |  2 +-
 .../libmatchbox/libmatchbox_1.14.bb           |  2 +-
 .../libsdl2/libsdl2_2.32.10.bb                |  2 +-
 .../recipes-graphics/mesa/mesa-demos_9.0.0.bb |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |  2 +-
 .../spir/spirv-headers_1.4.350.1.bb           |  2 +-
 .../vulkan/vulkan-headers_1.4.350.1.bb        |  2 +-
 .../vulkan-validation-layers_1.4.350.1.bb     |  2 +-
 .../xorg-font/encodings_1.1.0.bb              |  2 +-
 .../xorg-font/font-util_1.4.2.bb              |  2 +-
 .../xorg-font/xorg-minimal-fonts.bb           |  2 +-
 .../xorg-lib/libx11-compose-data_1.8.12.bb    |  2 +-
 .../xorg-lib/libx11_1.8.13.bb                 |  2 +-
 .../xorg-lib/libxfont2_2.0.8.bb               |  2 +-
 .../xorg-lib/libxfont_1.5.4.bb                |  2 +-
 meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb |  2 +-
 .../xorg-lib/libxkbcommon_1.13.2.bb           |  2 +-
 .../recipes-graphics/xorg-lib/libxmu_1.3.1.bb |  2 +-
 meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb |  2 +-
 .../xorg-lib/pixman_0.46.4.bb                 |  2 +-
 .../xorg-lib/xkeyboard-config_2.48.bb         |  2 +-
 .../xorg-xserver/xserver-xorg.inc             |  2 +-
 .../xwayland/xwayland_24.1.13.bb              |  2 +-
 meta/recipes-kernel/dtc/dtc_1.8.1.bb          |  2 +-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 meta/recipes-kernel/kmod/kmod_34.2.bb         |  2 +-
 .../libtraceevent/libtraceevent_1.9.0.bb      |  2 +-
 .../linux/linux-yocto-fitimage.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 +-
 .../recipes-kernel/lttng/babeltrace2_2.1.2.bb |  2 +-
 .../lttng/lttng-modules_2.15.2.bb             |  2 +-
 .../lttng/lttng-tools_2.15.1.bb               |  2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb |  2 +-
 .../alsa/alsa-lib_1.2.16.1.bb                 |  2 +-
 .../alsa/alsa-plugins_1.2.12.bb               |  2 +-
 .../alsa/alsa-tools_1.2.15.bb                 |  2 +-
 .../recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb |  2 +-
 .../gstreamer1.0-plugins-bad_1.28.4.bb        |  2 +-
 .../gstreamer1.0-plugins-ugly_1.28.4.bb       |  2 +-
 meta/recipes-multimedia/libtiff/tiff_4.7.2.bb |  2 +-
 .../pulseaudio/pulseaudio.inc                 |  2 +-
 meta/recipes-multimedia/sbc/sbc_2.2.bb        |  2 +-
 meta/recipes-rt/rt-tests/rt-tests_git.bb      |  2 +-
 .../matchbox-desktop/matchbox-desktop_2.3.bb  |  2 +-
 meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb    |  2 +-
 .../sato-screenshot/sato-screenshot_0.3.bb    |  2 +-
 meta/recipes-sato/webkit/webkitgtk_2.52.5.bb  |  2 +-
 .../recipes-support/aspell/aspell_0.60.8.2.bb |  2 +-
 meta/recipes-support/attr/acl_2.4.0.bb        |  2 +-
 meta/recipes-support/attr/attr_2.6.0.bb       |  2 +-
 meta/recipes-support/boost/boost-1.91.0.inc   |  2 +-
 .../ca-certificates_20260601.bb               |  2 +-
 .../debianutils/debianutils_5.23.2.bb         |  2 +-
 meta/recipes-support/gmp/gmp_6.3.0.bb         |  2 +-
 meta/recipes-support/gnupg/gnupg_2.5.20.bb    |  2 +-
 meta/recipes-support/gnutls/gnutls_3.8.13.bb  |  2 +-
 .../recipes-support/gnutls/libtasn1_4.21.0.bb |  2 +-
 meta/recipes-support/gpgme/gpgme_2.1.2.bb     |  4 +--
 meta/recipes-support/hwdata/hwdata_0.409.bb   |  2 +-
 meta/recipes-support/icu/icu_78.3.bb          |  2 +-
 .../libassuan/libassuan_3.0.2.bb              |  2 +-
 .../libatomic-ops/libatomic-ops_7.10.0.bb     |  2 +-
 meta/recipes-support/libbsd/libbsd_0.12.2.bb  |  2 +-
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  2 +-
 .../libevent/libevent_2.1.13.bb               |  2 +-
 meta/recipes-support/libfm/libfm_1.3.2.bb     |  2 +-
 .../libgcrypt/libgcrypt_1.12.2.bb             |  6 ++--
 .../libgpg-error/libgpg-error_1.61.bb         |  2 +-
 meta/recipes-support/libical/libical_4.0.3.bb |  2 +-
 .../libjitterentropy_3.6.3.bb                 |  2 +-
 meta/recipes-support/libksba/libksba_1.8.0.bb |  4 +--
 meta/recipes-support/libmd/libmd_1.2.0.bb     |  2 +-
 .../recipes-support/libpcre/libpcre2_10.47.bb |  2 +-
 .../libunistring/libunistring_1.4.2.bb        |  2 +-
 .../recipes-support/liburcu/liburcu_0.15.6.bb |  2 +-
 meta/recipes-support/lz4/lz4_1.10.0.bb        |  2 +-
 meta/recipes-support/nettle/nettle_4.0.bb     |  2 +-
 .../recipes-support/numactl/numactl_2.0.19.bb |  2 +-
 meta/recipes-support/re2c/re2c_4.5.1.bb       |  2 +-
 meta/recipes-support/taglib/taglib_2.3.bb     |  2 +-
 meta/recipes-support/utfcpp/utfcpp_4.1.1.bb   |  4 +--
 meta/recipes-support/vte/vte_0.84.0.bb        |  2 +-
 meta/recipes-support/xxhash/xxhash_0.8.3.bb   |  2 +-
 218 files changed, 257 insertions(+), 256 deletions(-)

diff --git a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb
index 12afec8b1b..a942d7d517 100644
--- a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb
+++ b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Wrap a version of the guessing game from The Rust Book \
 to run in Python using pyo3."
 HOMEPAGE = "https://www.maturin.rs/tutorial"
 SECTION = "devel/python"
-LICENSE = "MIT & Apache-2.0"
+LICENSE = "Apache-2.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
                     file://LICENSE-MIT;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
diff --git a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded
index 194a8efe83..4676c32037 100644
--- a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded
+++ b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded
@@ -3,7 +3,7 @@ DESCRIPTION = "Wrap a version of the guessing game from The Rust Book \
 to run in Python using pyo3."
 HOMEPAGE = "https://www.maturin.rs/tutorial"
 SECTION = "devel/python"
-LICENSE = "MIT & Apache-2.0"
+LICENSE = "Apache-2.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
                     file://LICENSE-MIT;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
diff --git a/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb b/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
index ea9a78dd1b..d30668826e 100644
--- a/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
+++ b/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Sysdig is open source, system-level exploration: capture \
 system state and activity from a running Linux instance, then save, \
 filter and analyze."
 HOMEPAGE = "http://www.sysdig.org/"
-LICENSE = "Apache-2.0 & (MIT | GPL-2.0-only)"
+LICENSE = "Apache-2.0 AND (GPL-2.0-only OR MIT)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8fee3d59797546cffab04f3b88b2d44"
 
 inherit cmake pkgconfig
diff --git a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
index e1e473fe80..9b7e10f6bd 100644
--- a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
+++ b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
@@ -6,7 +6,7 @@ SUMMARY = "GNU Aspell spell-checker"
 SECTION = "console/utils"
 HOMEPAGE = "https://ftp.gnu.org/gnu/aspell/"
 
-LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
+LICENSE = "LGPL-2.0-only OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
diff --git a/meta-selftest/recipes-test/license/incompatible-license-alias.bb b/meta-selftest/recipes-test/license/incompatible-license-alias.bb
index 1af99e7809..45ebbb7407 100644
--- a/meta-selftest/recipes-test/license/incompatible-license-alias.bb
+++ b/meta-selftest/recipes-test/license/incompatible-license-alias.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Recipe with an alias of an SPDX license"
 DESCRIPTION = "Is licensed with an alias of an SPDX license to be used for testing"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/license/incompatible-licenses.bb b/meta-selftest/recipes-test/license/incompatible-licenses.bb
index 47bd8d7c00..2e73ac6407 100644
--- a/meta-selftest/recipes-test/license/incompatible-licenses.bb
+++ b/meta-selftest/recipes-test/license/incompatible-licenses.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Recipe with multiple SPDX licenses"
 DESCRIPTION = "Is licensed with multiple SPDX licenses to be used for testing"
-LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-3.0-only"
+LICENSE = "GPL-2.0-only AND GPL-3.0-only AND LGPL-3.0-only"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
index 128f313e1f..4c9c3bb308 100644
--- a/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
+++ b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Recipe with a non-SPDX license"
 DESCRIPTION = "Is licensed with a non-SPDX license to be used for testing"
-LICENSE = "FooLicense"
+LICENSE = "LicenseRef-FooLicense"
 NO_GENERIC_LICENSE[FooLicense] = "LICENSE"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 9452a1a4ce..8e93c564a6 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -8,7 +8,7 @@ SUMMARY = "Alsa scenario files to enable alsa state restoration"
 HOMEPAGE = "http://www.alsa-project.org/"
 DESCRIPTION = "Alsa Scenario Files - an init script and state files to restore \
 sound state at system boot and save it at system shut down."
-LICENSE = "MIT & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND MIT"
 LIC_FILES_CHKSUM = " \
     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
     file://alsa-state-init;beginline=3;endline=4;md5=3ff7ecbf534d7d503941abe8e268ef50 \
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb
index 0f493b8414..9075487b92 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Libraries for producing EFI binaries"
 HOMEPAGE = "http://sourceforge.net/projects/gnu-efi/"
 DESCRIPTION = "GNU-EFI aims to Develop EFI applications for ARM-64, ARM-32, x86_64, IA-64 (IPF), IA-32 (x86), and MIPS platforms using the GNU toolchain and the EFI development environment."
 SECTION = "devel"
-LICENSE = "GPL-2.0-or-later & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=16;md5=8b0a86085b86eda7a3c7e8a1eb7ec753 \
                     file://gnuefi/crt0-efi-aarch64.S;beginline=4;endline=16;md5=8b0a86085b86eda7a3c7e8a1eb7ec753 \
                     file://inc/efishellintf.h;beginline=13;endline=20;md5=ee14c1530c341a7050837adead6bc9a5 \
diff --git a/meta/recipes-bsp/usbutils/usbutils_019.bb b/meta/recipes-bsp/usbutils/usbutils_019.bb
index 6aa5c5f5c2..164445ac4e 100644
--- a/meta/recipes-bsp/usbutils/usbutils_019.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_019.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Contains the lsusb utility for inspecting the devices connected t
 HOMEPAGE = "http://www.linux-usb.org"
 SECTION = "base"
 
-LICENSE = "GPL-2.0-or-later & (GPL-2.0-only | GPL-3.0-only) & CC0-1.0 & LGPL-2.1-or-later & MIT"
+LICENSE = "CC0-1.0 AND GPL-2.0-or-later AND LGPL-2.1-or-later AND MIT AND (GPL-2.0-only OR GPL-3.0-only)"
 LIC_FILES_CHKSUM = "file://LICENSES/CC0-1.0.txt;md5=cf1af55fc6f5b9a23e12086005298dcd \
 		    file://LICENSES/GPL-2.0-only.txt;md5=c89d4ad08368966d8df5a90ea96bebe4 \
 		    file://LICENSES/GPL-2.0-or-later.txt;md5=c89d4ad08368966d8df5a90ea96bebe4 \
@@ -25,7 +25,7 @@ ALTERNATIVE_PRIORITY = "100"
 # The binaries are mostly GPL-2.0-or-later apart from lsusb.py which is
 # GPL-2.0-only or GPL-3.0-only.
 LICENSE:${PN} = "GPL-2.0-or-later"
-LICENSE:${PN}-python = "GPL-2.0-only | GPL-3.0-only"
+LICENSE:${PN}-python = "GPL-2.0-only OR GPL-3.0-only"
 
 RRECOMMENDS:${PN} = "udev-hwdb"
 
diff --git a/meta/recipes-connectivity/avahi/avahi_0.9.bb b/meta/recipes-connectivity/avahi/avahi_0.9.bb
index 308ddc1822..7cf0eb2b71 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.9.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.9.bb
@@ -11,7 +11,7 @@ SECTION = "network"
 
 # major part is under LGPL-2.1-or-later, but several .dtd, .xsl, initscripts and
 # python scripts are under GPL-2.0-or-later
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d \
                     file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 6a98d769dd..a1f20f4432 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -2,7 +2,7 @@ SUMMARY = "Linux Bluetooth Stack Userland V5"
 DESCRIPTION = "Linux Bluetooth stack V5 userland components.  These include a system configurations, daemons, tools and system libraries."
 HOMEPAGE = "http://www.bluez.org"
 SECTION = "libs"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=0ad83ca0dc37ab08af448777c581e7ac"
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 8bfc1540b3..0c6e823ea2 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GTK+ frontend for the ConnMan network connection manager"
 HOMEPAGE = "http://connman.net/"
 SECTION = "libs/network"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://properties/main.c;beginline=1;endline=20;md5=50c77c81871308b033ab7a1504626afb \
                     file://common/connman-dbus.c;beginline=1;endline=20;md5=de6b485c0e717a0236402d220187717a"
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
index 6f00bee0d8..06e4fcb6e0 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
@@ -4,7 +4,7 @@ NFS server and related tools."
 HOMEPAGE = "http://nfs.sourceforge.net/"
 SECTION = "console/network"
 
-LICENSE = "MIT & GPL-2.0-or-later & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND GPL-2.0-or-later AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
diff --git a/meta/recipes-connectivity/openssh/openssh_10.4p1.bb b/meta/recipes-connectivity/openssh/openssh_10.4p1.bb
index da08a97fca..f8cedb8c8e 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.4p1.bb
@@ -5,7 +5,7 @@ Ssh (Secure Shell) is a program for logging into a remote machine \
 and for executing commands on a remote machine."
 HOMEPAGE = "http://www.openssh.com/"
 SECTION = "console/network"
-LICENSE = "BSD-2-Clause & BSD-3-Clause & ISC & MIT"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND ISC AND MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=78ffb36e5a48c0d8c5648603a3b6c8eb"
 
 DEPENDS = "zlib openssl virtual/crypt"
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.3.bb b/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
index 88217f03b1..3718fabbe8 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap virtual/crypt"
-LICENSE = "BSD-2-Clause & GPL-2.0-or-later & LGPL-2.0-or-later & RSA-MD & MIT"
+LICENSE = "BSD-2-Clause AND GPL-2.0-or-later AND LGPL-2.0-or-later AND MIT AND RSA-MD"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=25;md5=f0463bd67ae70535c709fca554089bd8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
                     file://chat/chat.c;beginline=1;endline=1;md5=234d7d4edd08962c0144e4604050e0b6 \
diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
index 734e59a59b..a13b4b55ab 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A general purpose TCP-IP emulator"
 DESCRIPTION = "A general purpose TCP-IP emulator used by virtual machine hypervisors to provide virtual networking services."
 HOMEPAGE = "https://gitlab.freedesktop.org/slirp/libslirp"
-LICENSE = "BSD-3-Clause & MIT"
+LICENSE = "BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95a9bf4a7e411164fe843697ccda59e \
                     file://LICENSE;md5=cfea6044642fd63b90ce9d79f5db64d9"
 
diff --git a/meta/recipes-connectivity/socat/socat_1.8.1.3.bb b/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
index 636c75b117..e485c7d28d 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
@@ -5,7 +5,8 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
-LICENSE = "GPL-2.0-with-OpenSSL-exception"
+# https://github.com/spdx/license-list-XML/issues/3009
+LICENSE = "LicenseRef-GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=252;endline=282;md5=338c05eadd013872abb1d6e198e10a3f"
 
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index bacbe7616d..6d4c9fb28a 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -8,7 +8,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux', '',
 
 # bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 source
 # the GPL is version 2 only
-LICENSE = "GPL-2.0-only & bzip2-1.0.6"
+LICENSE = "GPL-2.0-only AND bzip2-1.0.6"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb \
                     file://archival/libarchive/bz/LICENSE;md5=28e3301eae987e8cfe19988e98383dae"
 
diff --git a/meta/recipes-core/dbus/dbus-glib_0.114.bb b/meta/recipes-core/dbus/dbus-glib_0.114.bb
index cc15cafe49..c6824d5688 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.114.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.114.bb
@@ -2,7 +2,7 @@ SUMMARY = "High level language (GLib) binding for D-Bus"
 DESCRIPTION = "GLib bindings for the D-Bus message bus that integrate \
 the D-Bus library with the GLib thread abstraction and main loop."
 HOMEPAGE = "https://www.freedesktop.org/Software/dbus"
-LICENSE = "(AFL-2.1 & LGPL-2.0-or-later & MIT) | (GPL-2.0-or-later & LGPL-2.0-or-later & MIT)"
+LICENSE = "AFL-2.1 AND LGPL-2.0-or-later AND MIT OR GPL-2.0-or-later AND LGPL-2.0-or-later AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=267b04646da5ce3ea2df7a38a07c3f0b \
                     file://LICENSES/AFL-2.1.txt;md5=f3ad2f482ec639b440413665cfb9e714 \
                     file://LICENSES/GPL-2.0-or-later.txt;md5=3d26203303a722dedc6bf909d95ba815 \
diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus/dbus_1.16.2.bb
index 7425bd2364..bfb0f22f95 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 
 inherit meson pkgconfig gettext upstream-version-is-even ptest-gnome
 
-LICENSE = "AFL-2.1 | GPL-2.0-or-later"
+LICENSE = "AFL-2.1 OR GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb0ffc69a965797a3d6686baa153ef05 \
                     file://dbus/dbus.h;beginline=6;endline=22;md5=df4251a6c6e15e6a9e3c77b2ac30065d \
                     "
diff --git a/meta/recipes-core/dropbear/dropbear_2026.92.bb b/meta/recipes-core/dropbear/dropbear_2026.92.bb
index 44a4dcde03..4d9a9e10eb 100644
--- a/meta/recipes-core/dropbear/dropbear_2026.92.bb
+++ b/meta/recipes-core/dropbear/dropbear_2026.92.bb
@@ -6,7 +6,7 @@ SECTION = "console/network"
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
 # The 'public-domain' file is headered as MIT
-LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & WTFPL & Unlicense"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND MIT AND Unlicense AND WTFPL"
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=25cf44512b7bc8966a48b6b1a9b7605f \
     file://libtomcrypt/LICENSE;md5=71baacc459522324ef3e2b9e052e8180 \
diff --git a/meta/recipes-core/gettext/gettext_1.0.bb b/meta/recipes-core/gettext/gettext_1.0.bb
index 8a11a55570..696fcc3bb7 100644
--- a/meta/recipes-core/gettext/gettext_1.0.bb
+++ b/meta/recipes-core/gettext/gettext_1.0.bb
@@ -4,7 +4,7 @@ These tools include a set of conventions about how programs should be written to
 naming organization for the message catalogs themselves, a runtime library supporting the retrieval of translated messages, and \
 a few stand-alone programs to massage in various ways the sets of translatable and already translated strings."
 SECTION = "libs"
-LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-3.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
 # without libxml in PACKAGECONFIG vendor copy of the lib will be used
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index d49ae13168..fafb7e3391 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "https://developer.gnome.org/glib/"
 
 # pcre is under BSD;
 # docs/reference/COPYING is with a 'public domain'-like license!
-LICENSE = "LGPL-2.1-or-later & BSD-3-Clause & GCR-docs"
+LICENSE = "BSD-3-Clause AND GCR-docs AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=41890f71f740302b785c27661123bff5 \
                     file://glib/glib.h;beginline=4;endline=17;md5=72f7cc2847407f65d8981ef112e4e630 \
                     file://LICENSES/LGPL-2.1-or-later.txt;md5=41890f71f740302b785c27661123bff5 \
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index 2eedd2950e..4722440447 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "GLIBC (GNU C Library)"
 DESCRIPTION = "The GNU C Library is used as the system C library in most systems with the Linux kernel."
 HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
 SECTION = "libs"
-LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM ?= "file://LICENSES;md5=df6e0948b55669789c30764c5fd9bc41 \
       file://COPYINGv2;md5=570a9b3749dd0463a1778803b12a6dce \
diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.69.bb b/meta/recipes-core/initscripts/init-system-helpers_1.69.bb
index c4843747b7..50fa17befb 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.69.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.69.bb
@@ -13,7 +13,7 @@ specific to systemd at all. Maintainers of other init systems are welcome to \
 include their helpers in this package."
 HOMEPAGE = "https://salsa.debian.org/debian/init-system-helpers"
 SECTION = "base"
-LICENSE = "BSD-3-Clause & GPL-2.0-only"
+LICENSE = "BSD-3-Clause AND GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=c4ec20aa158fa9de26ee1accf78dcaae"
 
 SRCREV = "592518fcedf96c9b763f214a9acbdc1109aaa385"
diff --git a/meta/recipes-core/kbd/kbd_2.10.0.bb b/meta/recipes-core/kbd/kbd_2.10.0.bb
index 5a877b9c04..fbdc1c3c19 100644
--- a/meta/recipes-core/kbd/kbd_2.10.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.10.0.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "http://www.kbd-project.org/"
 DESCRIPTION = "The kbd project contains tools for managing Linux console (Linux console, virtual terminals, keyboard, etc.) - mainly, what they do is loading console fonts and keyboard maps."
 
 # consolefonts and keymaps contain also some public domain and author notice licenses
-LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later & GPL-3.0-or-later"
+LICENSE = "GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://data/keymaps/pine/en.map;beginline=2;endline=15;md5=20914a59c0546a7b77ebf959bc88ad5d \
 "
-LICENSE:${PN} = "GPL-2.0-or-later & LGPL-2.0-or-later"
+LICENSE:${PN} = "GPL-2.0-or-later AND LGPL-2.0-or-later"
 LICENSE:${PN}-consolefonts = "GPL-2.0-or-later"
 LICENSE:${PN}-consoletrans = "GPL-2.0-or-later"
 LICENSE:${PN}-keymaps-pine = "GPL-3.0-or-later"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index a86735255f..0a51851bf9 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -2,7 +2,7 @@ SUMMARY = "Extended cryptographic library (from glibc)"
 DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
-LICENSE = "LGPL-2.1-only & 0BSD & BSD-3-Clause"
+LICENSE = "0BSD AND BSD-3-Clause AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSING;md5=b65434749329c34b5d32c2df3f1b4112 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     "
diff --git a/meta/recipes-core/musl/bsd-headers.bb b/meta/recipes-core/musl/bsd-headers.bb
index ad9ba81e4f..3a3d37be7d 100644
--- a/meta/recipes-core/musl/bsd-headers.bb
+++ b/meta/recipes-core/musl/bsd-headers.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 SUMMARY = "BSD compatible headers"
-LICENSE = "BSD-3-Clause & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://sys-queue.h;beginline=1;endline=32;md5=c6352b0f03bb448600456547d334b56f"
 SECTION = "devel"
 
diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-core/musl/musl-locales_git.bb
index f8369509e7..3485b0781e 100644
--- a/meta/recipes-core/musl/musl-locales_git.bb
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -3,7 +3,7 @@
 #
 SUMMARY = "Locales support for musl"
 HOMEPAGE = "https://git.adelielinux.org/adelie/musl-locales/-/wikis/home"
-LICENSE = "MIT & LGPL-3.0-or-later"
+LICENSE = "LGPL-3.0-or-later AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf5713fba707073020b1db2acaa73e78 \
                     file://LICENSE.MIT;md5=a4f1c6864a83ddf4b754cdab7d593523"
 
diff --git a/meta/recipes-core/musl/musl-utils.bb b/meta/recipes-core/musl/musl-utils.bb
index 4b685640c8..9a49820a3c 100644
--- a/meta/recipes-core/musl/musl-utils.bb
+++ b/meta/recipes-core/musl/musl-utils.bb
@@ -3,7 +3,7 @@
 
 SUMMARY = "getconf, getent and iconv implementations for musl"
 HOMEPAGE = "https://git.alpinelinux.org/cgit/aports/tree/main/musl"
-LICENSE = "BSD-2-Clause & GPL-2.0-or-later"
+LICENSE = "BSD-2-Clause AND GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9d08215e611db87b357e8674b4b42564"
 SECTION = "utils"
 
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index 56e9eeb099..4336f1bfdb 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://sourceware.org/newlib/"
 DESCRIPTION = "C library intended for use on embedded systems. It is a conglomeration of several library parts, all under free software licenses that make them easily usable on embedded products."
 SECTION = "libs"
 
-LICENSE = "GPL-2.0-only & LGPL-3.0-only & GPL-3.0-only & LGPL-2.0-only & BSD-2-Clause & BSD-3-Clause & TCL & Apache-2.0-with-LLVM-exception"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND GPL-2.0-only AND GPL-3.0-only AND LGPL-2.0-only AND LGPL-3.0-only AND TCL AND Apache-2.0 WITH LLVM-exception"
 LIC_FILES_CHKSUM = " \
 		file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
diff --git a/meta/recipes-core/picolibc/picolibc.inc b/meta/recipes-core/picolibc/picolibc.inc
index ffbc90b660..750098ca60 100644
--- a/meta/recipes-core/picolibc/picolibc.inc
+++ b/meta/recipes-core/picolibc/picolibc.inc
@@ -5,7 +5,7 @@ SECTION = "libs"
 
 # Newlib based code but GPL related bits removed, test/printf-tests.c and test/testcases.c
 # are GPLv2 and GeneratePicolibcCrossFile.sh is AGPL3 but not part of the artifacts.
-LICENSE = "BSD-2-Clause & BSD-3-Clause"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM = " \
 		file://COPYING.picolibc;md5=e44132dded508048efb22b15ccd40d7d \
 		"
diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
index 5040d8864e..f1975e46a6 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Tools for working with sysfs"
 DESCRIPTION = "Tools for working with the sysfs virtual filesystem.  The tool 'systool' can query devices by bus, class and topology."
 HOMEPAGE = "http://linux-diag.sourceforge.net/Sysfsutils.html"
 
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LICENSE:${PN} = "GPL-2.0-only"
 LICENSE:libsysfs = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dcc19fa9307a50017fca61423a7d9754 \
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index f107c4c5da..efd7826684 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -10,7 +10,7 @@ state, maintains mount and automount points and implements an \
 elaborate transactional dependency-based service control logic. It can \
 work as a drop-in replacement for sysvinit."
 
-LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-or-later"
 LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=c09786363500a9acc29b147e6e72d2c6 \
                     file://LICENSE.LGPL2.1;md5=be0aaf4a380f73f7e00b420a007368f2"
diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/udev/eudev_3.2.14.bb
index a2d222e655..3e4972694a 100644
--- a/meta/recipes-core/udev/eudev_3.2.14.bb
+++ b/meta/recipes-core/udev/eudev_3.2.14.bb
@@ -1,7 +1,7 @@
 SUMMARY = "eudev is a fork of systemd's udev"
 HOMEPAGE = "https://github.com/eudev-project/eudev"
 DESCRIPTION = "eudev is Gentoo's fork of udev, systemd's device file manager for the Linux kernel. It manages device nodes in /dev and handles all user space actions when adding or removing devices."
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LICENSE:libudev = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta/recipes-core/util-linux/util-linux_2.42.2.bb b/meta/recipes-core/util-linux/util-linux_2.42.2.bb
index b3d466dc80..65577e6e6c 100644
--- a/meta/recipes-core/util-linux/util-linux_2.42.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.42.2.bb
@@ -7,37 +7,37 @@ LIBCOMMON_LICENSES = "LGPL-2.1-or-later AND BSD-2-Clause AND BSD-3-Clause AND MI
 # The default license is GPL-2.0-or-later
 DEFAULT_LICENSES = "GPL-2.0-or-later AND ${LIBCOMMON_LICENSES}"
 
-LICENSE = "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT & EUPL-1.2"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND BSD-4-Clause-UC AND EUPL-1.2 AND GPL-1.0-or-later AND GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.1-or-later AND MIT"
 LICENSE:${PN}-bash-completion = "GPL-2.0-or-later"
 LICENSE:${PN}-dev = "${LIBCOMMON_LICENSES}"
 # All dynamic packages use ${DEFAULT_LICENSES} with the following exceptions
-LICENSE:${PN}-cal = "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
-LICENSE:${PN}-col = "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-cal = "BSD-4-Clause-UC AND ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-col = "BSD-4-Clause-UC AND ${LIBCOMMON_LICENSES}"
 LICENSE:${PN}-colcrt = "BSD-4-Clause-UC"
-LICENSE:${PN}-colrm = "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
-LICENSE:${PN}-column = "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
-LICENSE:${PN}-coresched = "EUPL-1.2 & ${LIBCOMMON_LICENSES}"
-LICENSE:${PN}-fdisk = "GPL-1.0-or-later & ${DEFAULT_LICENSES}"
+LICENSE:${PN}-colrm = "BSD-4-Clause-UC AND ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-column = "BSD-4-Clause-UC AND ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-coresched = "EUPL-1.2 AND ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-fdisk = "GPL-1.0-or-later AND ${DEFAULT_LICENSES}"
 LICENSE:${PN}-fsfreeze = "GPL-1.0-or-later"
-LICENSE:${PN}-hexdump = "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
-LICENSE:${PN}-kill = "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-hexdump = "BSD-4-Clause-UC AND ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-kill = "BSD-4-Clause-UC AND ${LIBCOMMON_LICENSES}"
 LICENSE:${PN}-libblkid = "${LIBCOMMON_LICENSES}"
 LICENSE:${PN}-libfdisk = "${LIBCOMMON_LICENSES}"
 LICENSE:${PN}-libmount = "${LIBCOMMON_LICENSES}"
 LICENSE:${PN}-libsmartcols = "${LIBCOMMON_LICENSES}"
-LICENSE:${PN}-logger = "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-logger = "BSD-4-Clause-UC AND ${LIBCOMMON_LICENSES}"
 LICENSE:${PN}-look = "BSD-4-Clause-UC"
-LICENSE:${PN}-lscpu = "GPL-2.0-only & ${DEFAULT_LICENSES}"
-LICENSE:${PN}-mesg = "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
-LICENSE:${PN}-nsenter = "GPL-2.0-only & ${DEFAULT_LICENSES}"
+LICENSE:${PN}-lscpu = "GPL-2.0-only AND ${DEFAULT_LICENSES}"
+LICENSE:${PN}-mesg = "BSD-4-Clause-UC AND ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-nsenter = "GPL-2.0-only AND ${DEFAULT_LICENSES}"
 LICENSE:${PN}-renice = "BSD-4-Clause-UC"
 LICENSE:${PN}-rev = "BSD-4-Clause-UC"
-LICENSE:${PN}-script = "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-script = "BSD-4-Clause-UC AND ${LIBCOMMON_LICENSES}"
 LICENSE:${PN}-ul = "BSD-4-Clause-UC"
-LICENSE:${PN}-vipw = "BSD-4-Clause-UC & ${DEFAULT_LICENSES}"
-LICENSE:${PN}-wall = "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
-LICENSE:${PN}-whereis = "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
-LICENSE:${PN}-write = "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-vipw = "BSD-4-Clause-UC AND ${DEFAULT_LICENSES}"
+LICENSE:${PN}-wall = "BSD-4-Clause-UC AND ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-whereis = "BSD-4-Clause-UC AND ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-write = "BSD-4-Clause-UC AND ${LIBCOMMON_LICENSES}"
 
 LIC_FILES_CHKSUM = "file://README.licensing;md5=55e895a80bdd4ffc65e167a76d2e7569 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
index 72b5575703..912d20cae7 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
@@ -7,7 +7,7 @@ btrfs and an utility (btrfs-convert) to make a btrfs filesystem from an ext3."
 
 HOMEPAGE = "https://btrfs.wiki.kernel.org"
 
-LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067 \
     file://libbtrfsutil/COPYING;md5=4fbd65380cdd255951079008b364516c \
diff --git a/meta/recipes-devtools/ccache/ccache_4.13.6.bb b/meta/recipes-devtools/ccache/ccache_4.13.6.bb
index 789440f761..21bd193c20 100644
--- a/meta/recipes-devtools/ccache/ccache_4.13.6.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.13.6.bb
@@ -6,7 +6,7 @@ Objective-C and Objective-C++."
 HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
-LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
+LICENSE = "BSL-1.0 AND GPL-3.0-or-later AND ISC AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=e89f26e9f97d14068047871bdb2b3118 \
                     file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=663aca6f84e7d67ade228aad32afc0ea \
                     file://src/third_party/win32-compat/win32/mktemp.c;endline=17;md5=d287e9c1f1cd2bb2bd164490e1cf449a \
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index fb7c29e242..231f5cdd28 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -5,7 +5,7 @@ SUMMARY = "A set of tools for CD recording, including cdrecord"
 HOMEPAGE = "http://sourceforge.net/projects/cdrtools/"
 DESCRIPTION = "cdrecord tool is Highly portable CD/DVD/BluRay command line recording software."
 SECTION = "console/utils"
-LICENSE = "GPL-2.0-only & CDDL-1.0 & LGPL-2.1-or-later"
+LICENSE = "CDDL-1.0 AND GPL-2.0-only AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
 DEPENDS += "gnu-config-native"
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 441ea099a9..4e9400757c 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -3,7 +3,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/clang:"
 LIC_FILES_CHKSUM = "file://llvm/LICENSE.TXT;md5=${LLVMMD5SUM} \
                     file://clang/LICENSE.TXT;md5=${CLANGMD5SUM} \
 "
-LICENSE = "Apache-2.0-with-LLVM-exception"
+LICENSE = "Apache-2.0 WITH LLVM-exception"
 
 # Snapshot
 #RELEASE ?= "108df0694cc12fa496f63faa3a8762e7cc1a3b37"
diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 96ea383731..bfdf4cfcd9 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -3,7 +3,7 @@
 
 SUMMARY = "The LLVM Compiler Infrastructure"
 HOMEPAGE = "http://llvm.org"
-LICENSE = "Apache-2.0-with-LLVM-exception"
+LICENSE = "Apache-2.0 WITH LLVM-exception"
 SECTION = "devel"
 
 require common-clang.inc
diff --git a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
index d113b6cd9a..08a637924c 100644
--- a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
+++ b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
@@ -3,7 +3,7 @@
 
 SUMMARY = "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
 HOMEPAGE = "http://clang.llvm.org/"
-LICENSE = "Apache-2.0-with-LLVM-exception"
+LICENSE = "Apache-2.0 WITH LLVM-exception"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
 SECTION = "devel"
 
diff --git a/meta/recipes-devtools/debugedit/debugedit_5.3.bb b/meta/recipes-devtools/debugedit/debugedit_5.3.bb
index 7732dde52a..6b5f2aa99e 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.3.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.3.bb
@@ -4,7 +4,7 @@ debuginfo and source file distributions, collect build-ids and rewrite \
 source paths in DWARF data for debugging, tracing and profiling."
 HOMEPAGE = "https://sourceware.org/debugedit/"
 
-LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND GPL-3.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index ea0861823d..a53159bf1d 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Document type definitions for verification of XML data \
 files against the DocBook rule set."
 HOMEPAGE = "https://docbook.org"
 
-LICENSE = "DocBook"
+LICENSE = "LicenseRef-DocBook"
 NO_GENERIC_LICENSE[DocBook] = "LICENSE-OASIS"
 
 LIC_FILES_CHKSUM = "file://docbook-4.5/docbookx.dtd;beginline=15;endline=30;md5=ab12da76ad94a41d04e1587693ebd9b6 \
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index cce6e5f1ac..e83e8b6afa 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "The Ext2 Filesystem Utilities (e2fsprogs) contain all of the stan
 fixing, configuring , and debugging ext2 filesystems."
 HOMEPAGE = "http://e2fsprogs.sourceforge.net/"
 
-LICENSE = "GPL-2.0-only & LGPL-2.0-only & BSD-3-Clause & MIT"
+LICENSE = "BSD-3-Clause AND GPL-2.0-only AND LGPL-2.0-only AND MIT"
 LICENSE:e2fsprogs-dumpe2fs = "GPL-2.0-only"
 LICENSE:e2fsprogs-e2fsck = "GPL-2.0-only"
 LICENSE:e2fsprogs-mke2fs = "GPL-2.0-only"
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.195.bb b/meta/recipes-devtools/elfutils/elfutils_0.195.bb
index bfc648d69f..2093e1e924 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.195.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.195.bb
@@ -2,7 +2,7 @@ SUMMARY = "Utilities and libraries for handling compiled object files"
 HOMEPAGE = "https://sourceware.org/elfutils"
 DESCRIPTION = "elfutils is a collection of utilities and libraries to read, create and modify ELF binary files, find and handle DWARF debug data, symbols, thread state and stacktraces for processes and core files on GNU/Linux."
 SECTION = "base"
-LICENSE = "( GPL-2.0-or-later | LGPL-3.0-or-later ) & GPL-3.0-or-later"
+LICENSE = "GPL-3.0-or-later AND (GPL-2.0-or-later OR LGPL-3.0-or-later)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://debuginfod/debuginfod-client.c;endline=28;md5=6b7b0a4b25197d7f2e12b2f4aa1c86b8 \
                     "
@@ -120,10 +120,10 @@ PACKAGES =+ "${PN}-binutils libelf libasm libdw libdebuginfod"
 # are GPLv3+."
 LICENSE:${PN}-binutils = "GPL-3.0-or-later"
 LICENSE:${PN} = "GPL-3.0-or-later"
-LICENSE:libelf = "GPL-2.0-or-later | LGPL-3.0-or-later"
-LICENSE:libasm = "GPL-2.0-or-later | LGPL-3.0-or-later"
-LICENSE:libdw = "GPL-2.0-or-later | LGPL-3.0-or-later"
-LICENSE:libdebuginfod = "GPL-2.0-or-later | LGPL-3.0-or-later"
+LICENSE:libelf = "GPL-2.0-or-later OR LGPL-3.0-or-later"
+LICENSE:libasm = "GPL-2.0-or-later OR LGPL-3.0-or-later"
+LICENSE:libdw = "GPL-2.0-or-later OR LGPL-3.0-or-later"
+LICENSE:libdebuginfod = "GPL-2.0-or-later OR LGPL-3.0-or-later"
 
 FILES:${PN} += "${datadir}/fish"
 FILES:${PN}-binutils = "\
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.2.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.2.bb
index 801da3d6c9..3119627adf 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.2.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Tools for erofs filesystems"
-LICENSE = "(GPL-2.0-or-later | MIT) & MIT"
+LICENSE = "MIT AND (GPL-2.0-or-later OR MIT)"
 SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=63afa010baddc7d0905f9c31ac759f51"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index f24dd3b7c8..42b210ad97 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -8,7 +8,7 @@ structures to direct the dialogue. In addition, the user can take control and \
 interact directly when desired, afterward returning control to the script. \
 "
 HOMEPAGE = "http://sourceforge.net/projects/expect/"
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 SECTION = "devel"
 
 LIC_FILES_CHKSUM = "file://license.terms;md5=fbf2de7e9102505b1439db06fc36ce5c"
diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb
index f537bab56c..3a5635bdeb 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb
@@ -1,6 +1,6 @@
 SUMMARY = "fast_float number parsing library: 4x faster than strtod"
 HOMEPAGE = "https://github.com/fastfloat/fast_float"
-LICENSE = "Apache-2.0 & BSL-1.0 & MIT"
+LICENSE = "Apache-2.0 AND BSL-1.0 AND MIT"
 LIC_FILES_CHKSUM = " \
 	file://LICENSE-MIT;md5=32b11d50c7d9788d4270f6a83f3e68eb \
 	file://LICENSE-APACHE;md5=81db248e90379bcfc0582b578b009bc3 \
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index bbaa6f3998..ca040442af 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Flex is a fast lexical analyser generator.  Flex is a tool for ge
 lexical patterns in text."
 HOMEPAGE = "http://sourceforge.net/projects/flex/"
 SECTION = "devel"
-LICENSE = "BSD-3-Clause & LGPL-2.0-or-later"
+LICENSE = "BSD-3-Clause AND LGPL-2.0-or-later"
 LICENSE:${PN}-libfl = "BSD-3-Clause"
 
 DEPENDS = "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native flex-native', '', d)}"
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 6c81d30243..db89a733de 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -1,6 +1,6 @@
 require gcc-configure-common.inc
 
-LICENSE = "NCSA | MIT"
+LICENSE = "MIT OR NCSA"
 
 LIC_FILES_CHKSUM = "\
     file://libsanitizer/LICENSE.TXT;md5=0249c37748936faf5b1efd5789587909 \
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index cbb5885459..52c6fc531e 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -1,4 +1,4 @@
-LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-2.0-only & LGPL-3.0-only"
+LICENSE = "GPL-2.0-only AND GPL-3.0-only AND LGPL-2.0-only AND LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
diff --git a/meta/recipes-devtools/git/git_2.55.0.bb b/meta/recipes-devtools/git/git_2.55.0.bb
index 9198bb06c9..426cc13371 100644
--- a/meta/recipes-devtools/git/git_2.55.0.bb
+++ b/meta/recipes-devtools/git/git_2.55.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Distributed version control system"
 HOMEPAGE = "http://git-scm.com"
 DESCRIPTION = "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."
 SECTION = "console/utils"
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & LGPL-2.1-or-later"
+LICENSE = "BSD-3-Clause AND GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.1-or-later AND MIT"
 DEPENDS = "openssl zlib"
 
 PROVIDES:append:class-native = " git-replacement-native"
diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
index 55d434ed21..2e1a37e0ec 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Set of i2c tools for linux"
 HOMEPAGE = "https://i2c.wiki.kernel.org/index.php/I2C_Tools"
 DESCRIPTION = "The i2c-tools package contains a heterogeneous set of I2C tools for Linux: a bus probing tool, a chip dumper, register-level SMBus access helpers, EEPROM decoding scripts, EEPROM programming tools, and a python module for SMBus access. All versions of Linux are supported, as long as I2C support is included in the kernel."
 SECTION = "base"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta/recipes-devtools/libtool/libtool-2.5.4.inc b/meta/recipes-devtools/libtool/libtool-2.5.4.inc
index 4d9a822de2..c646ed33d6 100644
--- a/meta/recipes-devtools/libtool/libtool-2.5.4.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.5.4.inc
@@ -4,7 +4,7 @@ Libtool hides the complexity of generating special library types \
 (such as shared libraries) behind a consistent interface."
 HOMEPAGE = "http://www.gnu.org/software/libtool/libtool.html"
 SECTION = "devel"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
     file://libltdl/COPYING.LIB;md5=4bf661c1e3793e55c8d1051bc5e0ae21 "
 
diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
index 9ba83d8d64..a10dd175a2 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/log4cplus/log4cplus"
 DESCRIPTION = "log4cplus is a simple to use C++ logging API providing thread-safe, flexible, and arbitrarily granular control over log management and configuration. It is modelled after the Java log4j API."
 BUGTRACKER = "https://github.com/log4cplus/log4cplus/issues"
 
-LICENSE = "Apache-2.0 & BSD-2-Clause"
+LICENSE = "Apache-2.0 AND BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 # Replace dots with underscores to match GitHub's tag format (e.g., 2.2.0.1 -> REL_2_2_0_1)
diff --git a/meta/recipes-devtools/orc/orc_0.4.42.bb b/meta/recipes-devtools/orc/orc_0.4.42.bb
index 55b8db28aa..89e879e1cc 100644
--- a/meta/recipes-devtools/orc/orc_0.4.42.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.42.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Optimised Inner Loop Runtime Compiler"
 HOMEPAGE = "http://gstreamer.freedesktop.org/modules/orc.html"
 DESCRIPTION = "Optimised Inner Loop Runtime Compiler is a Library and set of tools for compiling and executing SIMD assembly language-like programs that operate on arrays of data."
-LICENSE = "BSD-2-Clause & BSD-3-Clause"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
index bb6c1b908a..bc5bb4f4d7 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/arsv/perl-cross"
 DESCRIPTION = "perl-cross provides configure script, top-level Makefile and some auxiliary files for perl, \
 with the primary emphasis on cross-compiling the source."
 SECTION = "devel"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 # README.md is taken from https://github.com/arsv/perl-cross/blob/master/README.md
 # but is not provided inside the release tarballs
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/README.md;md5=252fcce2026b765fee1ad74d2fb07a3b"
diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
index b27a8c15e6..1c01a59f5d 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 HOMEPAGE = "https://metacpan.org/release/Module-Build"
 
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=881;endline=886;md5=3027f56c664545e54678c26b7f1ac19c"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb b/meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb
index a128567ec7..68940567ac 100644
--- a/meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb
+++ b/meta/recipes-devtools/perl/libtest-fatal-perl_0.018.bb
@@ -5,7 +5,7 @@ exception-throwing code with about the same amount of typing."
 HOMEPAGE = "https://github.com/rjbs/Test-Fatal"
 BUGTRACKER = "https://github.com/rjbs/Test-Fatal/issues"
 SECTION = "libs"
-LICENSE = "Artistic-1.0-Perl | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0-Perl OR GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f7fc7d4b26ddae0843b09ba56109e65a"
 
diff --git a/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb b/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb
index 0045e575af..fe437386b6 100644
--- a/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb
+++ b/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb
@@ -6,7 +6,7 @@ that are found but fail to compile will exit with an error rather than skip."
 
 HOMEPAGE = "https://metacpan.org/release/Test-Needs"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 
 CPAN_NAME = "Test-Needs"
 CPAN_AUTHOR = "HAARG"
diff --git a/meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb b/meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb
index 2eccf40999..58f819846f 100644
--- a/meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb
+++ b/meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb
@@ -9,7 +9,7 @@ demonstration.)"
 HOMEPAGE = "https://github.com/karenetheridge/Test-Warnings"
 BUGTRACKER = "https://rt.cpan.org/Public/Dist/Display.html?Name=Test-Warnings"
 SECTION = "libs"
-LICENSE = "Artistic-1.0-Perl | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0-Perl OR GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENCE;md5=f98106ac3cc05d9cbebcdb8fbf7b7815"
 
diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index 728b606ed2..7f92f92436 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -5,7 +5,7 @@ XML::Grove and others."
 HOMEPAGE = "https://metacpan.org/dist/libxml-perl/"
 SUMMARY = "Collection of Perl modules for working with XML"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://README;beginline=33;endline=35;md5=1705549eef7577a3d6ba71123a1f0ce8"
 
diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
index f5fd2d3f0e..d4f0062cc6 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
@@ -6,7 +6,7 @@ on top of an underlying XML parsing module to maintain XML files \
 where the original uses plain Perl or SAX parsers."
 HOMEPAGE = "https://metacpan.org/release/MARKOV/XML-LibXML-Simple-0.93/view/lib/XML/LibXML/Simple.pod"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf206df8c9fe775f1d4c484386491eac"
 DEPENDS += "libxml-parser-perl"
 
diff --git a/meta/recipes-devtools/perl/perl_5.42.2.bb b/meta/recipes-devtools/perl/perl_5.42.2.bb
index f1f026579b..30e707df0a 100644
--- a/meta/recipes-devtools/perl/perl_5.42.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Perl scripting language"
 HOMEPAGE = "http://www.perl.org/"
 DESCRIPTION = "Perl is a highly capable, feature-rich programming language"
 SECTION = "devel"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://Copying;md5=8f7dd0873e59530abbb36503972afcdb \
                     file://Artistic;md5=71a4d5d9acc18c0952a6df2218bb68da \
                     "
diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
index 466da553e7..a0181874cd 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -2,7 +2,7 @@ SUMMARY = "Cryptographic library for Python"
 DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
  cryptographic primitives."
 HOMEPAGE = "http://www.pycryptodome.org"
-LICENSE = "Unlicense & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=29242a70410a4eeff488a28164e7ab93"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index fe4307a4d9..f5dd5757a4 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Test vectors for the cryptography package."
 HOMEPAGE = "https://cryptography.io/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0 | BSD-3-Clause"
+LICENSE = "Apache-2.0 OR BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                     file://LICENSE.APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
                     file://LICENSE.BSD;md5=5ae30ba4123bc4f2fa49aa0b0dce887b"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 4730c34997..aad95dfab8 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Provides cryptographic recipes and primitives to python developers"
 HOMEPAGE = "https://cryptography.io/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0 | BSD-3-Clause"
+LICENSE = "Apache-2.0 OR BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                     file://LICENSE.APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
                     file://LICENSE.BSD;md5=5ae30ba4123bc4f2fa49aa0b0dce887b \
diff --git a/meta/recipes-devtools/python/python3-docutils_0.23.bb b/meta/recipes-devtools/python/python3-docutils_0.23.bb
index 91592d470c..27ed6c5514 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.23.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.23.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
-LICENSE = "CC0-1.0 & BSD-2-Clause & GPL-3.0-only"
+LICENSE = "BSD-2-Clause AND CC0-1.0 AND GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=ce467b04b35c7ac3429b6908fc8b318e"
 
 SRC_URI[sha256sum] = "746f5060322511280a1e50eb76846ed6bf2342984b2ac04dc42caa1a8d78799e"
@@ -11,6 +11,6 @@ inherit pypi python_flit_core
 RDEPENDS:${PN} += "python3-pprint"
 
 # We don't install the emacs lisp, which is the only piece of GPLv3
-LICENSE:${PN} = "CC0-1.0 & BSD-2-Clause"
+LICENSE:${PN} = "BSD-2-Clause AND CC0-1.0"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-dtc_1.8.1.bb b/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
index 314107883f..1576b233eb 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python Library for the Device Tree Compiler"
 HOMEPAGE = "https://devicetree.org/"
 DESCRIPTION = "A python library for the Device Tree Compiler, a tool used to manipulate Device Tree files which contain a data structure for describing hardware."
 SECTION = "bootloader"
-LICENSE = "GPL-2.0-only | BSD-2-Clause"
+LICENSE = "BSD-2-Clause OR GPL-2.0-only"
 
 DEPENDS = "flex-native bison-native swig-native python3-setuptools-scm-native libyaml dtc"
 
diff --git a/meta/recipes-devtools/python/python3-idna_3.18.bb b/meta/recipes-devtools/python/python3-idna_3.18.bb
index 3d5e79d0f7..cac86a8594 100644
--- a/meta/recipes-devtools/python/python3-idna_3.18.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.18.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
-LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
+LICENSE = "BSD-3-Clause AND Python-2.0 AND Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9a6c29079fc90c29d80332f44d2625f2"
 
 SRC_URI[sha256sum] = "ffb385a7e039654cef1ab9ef32c6fafe283c0c0467bba1d9029738ce4a14a848"
diff --git a/meta/recipes-devtools/python/python3-lxml_6.1.1.bb b/meta/recipes-devtools/python/python3-lxml_6.1.1.bb
index 77386ebdd0..4ca7f08b39 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.1.1.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.1.1.bb
@@ -6,7 +6,7 @@ significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
 C14N and much more."
 HOMEPAGE = "https://lxml.de/"
 SECTION = "devel/python"
-LICENSE = "BSD-3-Clause & GPL-2.0-only & MIT & PSF-2.0"
+LICENSE = "BSD-3-Clause AND GPL-2.0-only AND MIT AND PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
                     file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
                     file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
diff --git a/meta/recipes-devtools/python/python3-maturin_1.14.1.bb b/meta/recipes-devtools/python/python3-maturin_1.14.1.bb
index b690a57772..88ba336022 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.14.1.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.14.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Build and publish crates with pyo3, rust-cpython, cffi bindings and rust binaries as python packages"
 HOMEPAGE = "https://github.com/pyo3/maturin"
 SECTION = "devel/python"
-LICENSE = "MIT | Apache-2.0"
+LICENSE = "Apache-2.0 OR MIT"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.0.bb b/meta/recipes-devtools/python/python3-numpy_2.5.0.bb
index 32c1acafdd..43ecdb2c42 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.0.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A sophisticated Numeric Processing Package for Python"
 HOMEPAGE = "https://numpy.org/"
 DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
-LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
+LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT AND PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26080bf81b2662c7119d3ef28ae197fd"
 
 SRCNAME = "numpy"
diff --git a/meta/recipes-devtools/python/python3-packaging_26.2.bb b/meta/recipes-devtools/python/python3-packaging_26.2.bb
index eadd70602a..81ae6f2732 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.2.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Core utilities for Python packages"
 HOMEPAGE = "https://github.com/pypa/packaging"
-LICENSE = "Apache-2.0 | BSD-2-Clause"
+LICENSE = "Apache-2.0 OR BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
 SRC_URI[sha256sum] = "ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661"
diff --git a/meta/recipes-devtools/python/python3-pip_26.1.2.bb b/meta/recipes-devtools/python/python3-pip_26.1.2.bb
index dd1895ed55..9a02409298 100644
--- a/meta/recipes-devtools/python/python3-pip_26.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.1.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The PyPA recommended tool for installing Python packages"
 HOMEPAGE = "https://pypi.org/project/pip"
 SECTION = "devel/python"
-LICENSE = "MIT & Apache-2.0 & MPL-2.0 & LGPL-2.1-only & BSD-3-Clause & PSF-2.0 & BSD-2-Clause"
+LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND LGPL-2.1-only AND MIT AND MPL-2.0 AND PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
                     file://src/pip/_vendor/cachecontrol/LICENSE.txt;md5=6572692148079ebbbd800be4b9f36c6d \
                     file://src/pip/_vendor/certifi/LICENSE;md5=11618cb6a975948679286b1211bd573c \
diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb b/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb
index a428214b87..d063f7e23c 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.4.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/python-poetry/poetry-core"
 BUGTRACKER = "https://github.com/python-poetry/poetry-core"
 CHANGELOG = "https://github.com/python-poetry/poetry-core/blob/master/CHANGELOG.md"
 
-LICENSE = "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & MIT"
+LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM = "\
     file://LICENSE;md5=78c39cfd009863ae44237a7ab1f9cedc \
     file://src/poetry/core/_vendor/fastjsonschema/LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532 \
diff --git a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
index 9b78e4f3d3..2d018e676a 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for the Cairo canvas library"
 HOMEPAGE = "http://cairographics.org/pycairo"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "python-devel"
-LICENSE = "LGPL-2.1-only & MPL-1.1"
+LICENSE = "LGPL-2.1-only AND MPL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f3713ca2c28d9312ad718520b6dc3eee \
                     file://COPYING-LGPL-2.1;md5=fad9b3332be894bab9bc501572864b29 \
                     file://COPYING-MPL-1.1;md5=bfe1f75d606912a4111c90743d6c7325"
diff --git a/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb b/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
index 4cab76a2b1..08af23d765 100644
--- a/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
+++ b/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Manipulate roman numerals"
 HOMEPAGE = "https://github.com/AA-Turner/roman-numerals/"
-LICENSE = "0BSD & CC0-1.0"
+LICENSE = "0BSD AND CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=bfcc8b16e42929aafeb9d414360bc2fd"
 
 SRC_URI[sha256sum] = "1af8b147eb1405d5839e78aeb93131690495fe9da5c91856cb33ad55a7f1e5b2"
diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
index 77fcae2546..927664c5fb 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Sphinx Theme reader"
 HOMEPAGE = "https://github.com/readthedocs/sphinx_rtd_theme"
 SECTION = "devel/python"
-LICENSE = "MIT & OFL-1.1"
+LICENSE = "MIT AND OFL-1.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a1db7d4ef426c2935227264e1d4ae8f9 \
                     file://OFL-License.txt;md5=4534c22e0147eadb6828bd9fe86d4868 \
                     file://Apache-License-2.0.txt;md5=8a75796f0ef19c3f601d69857f5a9a5b"
diff --git a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
index 76f904d708..dcf769724f 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
-LICENSE = "BSD-2-Clause & MIT"
+LICENSE = "BSD-2-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
 SRC_URI[sha256sum] = "7741722357dd75f8190766926071fed3bdc211c74dd2d7d4df5404da95930ddb"
diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.4.bb b/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
index 269b057427..0ff02ef3b8 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Python implementation of subunit test streaming protocol"
 HOMEPAGE = "https://pypi.org/project/python-subunit/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0 | BSD-3-Clause"
+LICENSE = "Apache-2.0 OR BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=1;endline=20;md5=b1121e68d06c8d9ea544fcd895df0d39"
 
 PYPI_PACKAGE = "python-subunit"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.28.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.28.bb
index 08ab097482..9523f573ed 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.28.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.28.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The build backend part of an 'An extremely fast Python package and project manager, written in Rust.'"
 HOMEPAGE = "https://pypi.org/project/uv-build/"
 
-LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
+LICENSE = "Apache-2.0 AND BSD-2-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://LICENSE-MIT;md5=45674e482567aa99fe883d3270b11184 \
                     file://crates/uv-build/LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
diff --git a/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb b/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
index 4b3bbe6670..4092b3e8b7 100644
--- a/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
+++ b/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "An asyncio library for communicating with QEMU Monitor Protocol (
 This library was split out of the QEMU source tree to provide a reference QMP \
 implementation usable both within and outside of the QEMU source tree."
 HOMEPAGE = "https://gitlab.com/qemu-project/python-qemu-qmp"
-LICENSE = "LGPL-2.0-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4cf66a4984120007c9881cc871cf49db"
 
 inherit pypi python_setuptools_build_meta
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0fb77250f8..6fca6bc499 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -5,7 +5,7 @@ of different hardware and device models for the machine, enabling it to run \
 a variety of guest operating systems"
 HOMEPAGE = "http://qemu.org"
 BUGTRACKER = "https://gitlab.com/qemu-project/qemu/-/issues"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 
 DEPENDS += "bison-native meson-native ninja-native"
 
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb
index a6b32bb007..0251b0b92c 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.10.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://sequoia-pgp.org/"
 # The license line is taken verbatim from Fedora's specfile
 # with formatting differences for Yocto. (AND -> &, OR -> |)
 # https://src.fedoraproject.org/rpms/rust-rpm-sequoia/blob/rawhide/f/rust-rpm-sequoia.spec
-LICENSE = "LGPL-2.0-or-later & Apache-2.0 & BSL-1.0 & MIT & Unicode-DFS-2016 & (Apache-2.0 | MIT) & (MIT | Apache-2.0 | Zlib) & (Unlicense | MIT)"
+LICENSE = "Apache-2.0 AND BSL-1.0 AND LGPL-2.0-or-later AND MIT AND Unicode-DFS-2016 AND (Apache-2.0 OR MIT) AND (Apache-2.0 OR MIT OR Zlib) AND (MIT OR Unlicense)"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0ff5ff7747cf7d394079c6ae87f5f0c"
 
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.5.bb b/meta/recipes-devtools/ruby/ruby_4.0.5.bb
index a0981bf622..fef3e351a2 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.5.bb
@@ -6,7 +6,7 @@ It is simple, straight-forward, and extensible. \
 "
 HOMEPAGE = "http://www.ruby-lang.org/"
 SECTION = "devel/ruby"
-LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT | BSL-1.0 | Apache-2.0"
+LICENSE = "Apache-2.0 OR BSD-2-Clause OR BSD-3-Clause OR BSL-1.0 OR GPL-2.0-only OR ISC OR MIT OR Ruby"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7674b1080a488809841b13eb57ffb719 \
                     file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
                     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-devtools/rust/cargo_1.96.1.bb b/meta/recipes-devtools/rust/cargo_1.96.1.bb
index f16688fc76..adc1f0d331 100644
--- a/meta/recipes-devtools/rust/cargo_1.96.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.96.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Cargo, a package manager for Rust."
 HOMEPAGE = "https://crates.io"
-LICENSE = "MIT | Apache-2.0"
+LICENSE = "Apache-2.0 OR MIT"
 SECTION = "devel"
 
 DEPENDS = "openssl zlib curl ca-certificates libssh2"
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb b/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb
index 2a5e977a5e..1ecd6bff3f 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Rust standard libaries"
 HOMEPAGE = "http://www.rust-lang.org"
 SECTION = "devel"
-LICENSE = "(MIT | Apache-2.0) & Unicode-3.0"
+LICENSE = "Unicode-3.0 AND (Apache-2.0 OR MIT)"
 LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
 
 require rust-source.inc
diff --git a/meta/recipes-devtools/rust/rust_1.96.1.bb b/meta/recipes-devtools/rust/rust_1.96.1.bb
index 8b0f1d1459..fa8777826f 100644
--- a/meta/recipes-devtools/rust/rust_1.96.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.96.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Rust compiler and runtime libaries"
 HOMEPAGE = "http://www.rust-lang.org"
 SECTION = "devel"
-LICENSE = "(MIT | Apache-2.0) & Unicode-3.0"
+LICENSE = "Unicode-3.0 AND (Apache-2.0 OR MIT)"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
 
 inherit rust
diff --git a/meta/recipes-devtools/strace/strace_7.1.bb b/meta/recipes-devtools/strace/strace_7.1.bb
index c4ca3a7f27..b5c6543da0 100644
--- a/meta/recipes-devtools/strace/strace_7.1.bb
+++ b/meta/recipes-devtools/strace/strace_7.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "System call tracing tool"
 HOMEPAGE = "http://strace.io"
 DESCRIPTION = "strace is a diagnostic, debugging and instructional userspace utility for Linux. It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
 SECTION = "console/utils"
-LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9259131ce5420f9790214be1c20a83a9"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
index 05f80b3319..f6a5b9950f 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "Subversion (svn) version control system client"
 HOMEPAGE = "http://subversion.apache.org"
 DESCRIPTION = "Subversion is an open source version control system."
 SECTION = "console/network"
-LICENSE = "Apache-2.0 & MIT"
+LICENSE = "Apache-2.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6487ae7094d359fa90fb9c4096e52e2b"
 
 DEPENDS = "apr-util serf sqlite3 file lz4 expat"
diff --git a/meta/recipes-devtools/swig/swig_4.4.1.bb b/meta/recipes-devtools/swig/swig_4.4.1.bb
index f71a92d931..842a7b0945 100644
--- a/meta/recipes-devtools/swig/swig_4.4.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.4.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "SWIG is a compiler that makes it easy to integrate C and C++ \
 code with other languages including Perl, Tcl, Ruby, Python, Java, Guile, \
 Mzscheme, Chicken, OCaml, Pike, and C#."
 HOMEPAGE = "http://swig.sourceforge.net/"
-LICENSE = "BSD-3-Clause & GPL-3.0-only"
+LICENSE = "BSD-3-Clause AND GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
                     file://LICENSE-GPL;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LICENSE-UNIVERSITIES;md5=8ce9dcc8f7c994de4a408b205c72ba08"
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
index 31f3add89f..a8976f8a3e 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "For systemd-bootchart, several proc debug interfaces are required
 below is optional, for additional info: \
   CONFIG_SCHED_DEBUG"
 HOMEPAGE = "https://github.com/systemd/systemd-bootchart"
-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
index 6e9c7fc0ad..b04c7aea06 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://wiki.eclipse.org/TCF"
 DESCRIPTION = "TCF is a vendor-neutral, lightweight, extensible network protocol mainly for communicating with embedded systems (targets)."
 BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 
-LICENSE = "EPL-1.0 | BSD-3-Clause"
+LICENSE = "BSD-3-Clause OR EPL-1.0"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
 SRCREV = "3051a4806ac4b041ec7c49ffc6d07f0014b8480c"
diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.4.bb b/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
index 8cabd77d7f..5b4809ed6b 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Tool Command Language, is an open-source multi-purpose C library
 SECTION = "devel/tcltk"
 
 # http://www.tcl.tk/software/tcltk/license.html
-LICENSE = "TCL & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND TCL"
 LIC_FILES_CHKSUM = "file://license.terms;md5=058f6229798281bbcac4239c788cfa38 \
     file://compat/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
     file://library/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
index 545c1cdc60..0382d4239c 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Tool Command Language, is an open-source multi-purpose C library
 SECTION = "devel/tcltk"
 
 # http://www.tcl.tk/software/tcltk/license.html
-LICENSE = "TCL & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND TCL"
 LIC_FILES_CHKSUM = "file://license.terms;md5=058f6229798281bbcac4239c788cfa38 \
     file://compat/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
     file://library/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.27.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.27.1.bb
index 1b08f2fc5f..829b6c96a8 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.27.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.27.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Valgrind memory debugger and instrumentation framework"
 HOMEPAGE = "http://valgrind.org/"
 DESCRIPTION = "Valgrind is an instrumentation framework for building dynamic analysis tools. There are Valgrind tools that can automatically detect many memory management and threading bugs, and profile your programs in detail."
 BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND GPL-2.0-only AND GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://include/pub_tool_basics.h;beginline=6;endline=29;md5=9ba449d120f6845e6a432073278d6e3a \
                     file://include/valgrind.h;beginline=1;endline=56;md5=993563aaa122558df9c5d743de074d04 \
diff --git a/meta/recipes-extended/acpica/acpica_20260408.bb b/meta/recipes-extended/acpica/acpica_20260408.bb
index 4c65630015..1e6326720f 100644
--- a/meta/recipes-extended/acpica/acpica_20260408.bb
+++ b/meta/recipes-extended/acpica/acpica_20260408.bb
@@ -9,7 +9,7 @@ ACPI tables."
 HOMEPAGE = "https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/overview.html"
 SECTION = "console/tools"
 
-LICENSE = "Intel | BSD-3-Clause | GPL-2.0-only"
+LICENSE = "BSD-3-Clause OR GPL-2.0-only OR Intel"
 LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=4877caee45a613e9706946c3205a6fb9"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 36267e5073..39f0f6749d 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -4,14 +4,14 @@ Huffman coding. Compression is generally considerably better than that achieved
 LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
 HOMEPAGE = "https://sourceware.org/bzip2/"
 SECTION = "console/utils"
-LICENSE = "bzip2-1.0.6 & GPL-3.0-or-later & Apache-2.0 & MS-PL & BSD-3-Clause & Zlib"
+LICENSE = "Apache-2.0 AND BSD-3-Clause AND GPL-3.0-or-later AND MS-PL AND Zlib AND bzip2-1.0.6"
 LICENSE:${PN} = "bzip2-1.0.6"
 LICENSE:${PN}-dev = "bzip2-1.0.6"
 LICENSE:${PN}-dbg = "bzip2-1.0.6"
 LICENSE:${PN}-doc = "bzip2-1.0.6"
 LICENSE:${PN}-src = "bzip2-1.0.6"
 LICENSE:libbz2 = "bzip2-1.0.6"
-LICENSE:${PN}-ptest = "bzip2-1.0.6 & GPL-3.0-or-later & Apache-2.0 & MS-PL & BSD-3-Clause & Zlib"
+LICENSE:${PN}-ptest = "Apache-2.0 AND BSD-3-Clause AND GPL-3.0-or-later AND MS-PL AND Zlib AND bzip2-1.0.6"
 
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664 \
                     file://${UNPACKDIR}/bzip2-tests/commons-compress/LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327 \
diff --git a/meta/recipes-extended/cronie/cronie_1.7.2.bb b/meta/recipes-extended/cronie/cronie_1.7.2.bb
index b250717ab8..d480407bc4 100644
--- a/meta/recipes-extended/cronie/cronie_1.7.2.bb
+++ b/meta/recipes-extended/cronie/cronie_1.7.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/cronie-crond/cronie/"
 BUGTRACKER = "https://bugzilla.redhat.com"
 
 # Internet Systems Consortium License
-LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & GPL-2.0-or-later"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND GPL-2.0-or-later AND ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dd2a592170760e1386c769e1043b3722 \
                     file://src/cron.c;endline=20;md5=b425c334265026177128353a142633b4 \
                     file://src/popen.c;beginline=3;endline=31;md5=edd50742d8def712e9472dba353668a9"
diff --git a/meta/recipes-extended/gawk/gawk_5.4.1.bb b/meta/recipes-extended/gawk/gawk_5.4.1.bb
index 8e8bc34152..56930498e3 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.gnu.org/software/gawk/"
 BUGTRACKER  = "bug-gawk@gnu.org"
 SECTION = "console/utils"
 
-LICENSE = "GPL-3.0-or-later & AGPL-3.0-or-later"
+LICENSE = "AGPL-3.0-or-later AND GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19 \
                     file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19"
diff --git a/meta/recipes-extended/hdparm/hdparm_9.65.bb b/meta/recipes-extended/hdparm/hdparm_9.65.bb
index e541d58fa5..0c84801c43 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.65.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.65.bb
@@ -4,9 +4,9 @@ DESCRIPTION = "hdparm is a Linux shell utility for viewing \
 and manipulating various IDE drive and driver parameters."
 SECTION = "console/utils"
 
-LICENSE = "BSD-2-Clause & GPL-2.0-only & hdparm"
-LICENSE:${PN} = "BSD-2-Clause & hdparm"
-LICENSE:${PN}-dbg = "BSD-2-Clause & hdparm"
+LICENSE = "BSD-2-Clause AND GPL-2.0-only AND hdparm"
+LICENSE:${PN} = "BSD-2-Clause AND hdparm"
+LICENSE:${PN}-dbg = "BSD-2-Clause AND hdparm"
 LICENSE:wiper = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=495d03e50dc6c89d6a30107ab0df5b03 \
diff --git a/meta/recipes-extended/iputils/iputils_20250605.bb b/meta/recipes-extended/iputils/iputils_20250605.bb
index baeda55659..cdebf28ca3 100644
--- a/meta/recipes-extended/iputils/iputils_20250605.bb
+++ b/meta/recipes-extended/iputils/iputils_20250605.bb
@@ -4,7 +4,7 @@ tracepath, tracepath6, ping, ping6 and arping."
 HOMEPAGE = "https://github.com/iputils/iputils"
 SECTION = "console/network"
 
-LICENSE = "BSD-3-Clause & GPL-2.0-or-later"
+LICENSE = "BSD-3-Clause AND GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=627cc07ec86a45951d43e30658bbd819"
 
diff --git a/meta/recipes-extended/jansson/jansson_2.15.1.bb b/meta/recipes-extended/jansson/jansson_2.15.1.bb
index 60bbc5ba6d..517dd6023b 100644
--- a/meta/recipes-extended/jansson/jansson_2.15.1.bb
+++ b/meta/recipes-extended/jansson/jansson_2.15.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON data"
 HOMEPAGE = "http://www.digip.org/jansson/"
 BUGTRACKER = "https://github.com/akheron/jansson/issues"
-LICENSE = "MIT & dtoa"
+LICENSE = "MIT AND dtoa"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9911525d4128bee234ee2d3ccaa2537"
 
 GITHUB_BASE_URI = "https://github.com/akheron/jansson/releases"
diff --git a/meta/recipes-extended/less/less_704.bb b/meta/recipes-extended/less/less_704.bb
index 500a39b327..dc841a9ae6 100644
--- a/meta/recipes-extended/less/less_704.bb
+++ b/meta/recipes-extended/less/less_704.bb
@@ -19,7 +19,7 @@ SECTION = "console/utils"
 # --Mark
 #
 
-LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
+LICENSE = "BSD-2-Clause OR GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://LICENSE;md5=bee5763a5e2bccdcdbd9bfe982ffc82b \
                     "
diff --git a/meta/recipes-extended/libidn/libidn2_2.3.8.bb b/meta/recipes-extended/libidn/libidn2_2.3.8.bb
index a53ac47d66..37703aa929 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.8.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "Internationalized Domain Name support library"
 DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specifications defined by the IETF Internationalized Domain Names (IDN) working group."
 HOMEPAGE = "http://www.gnu.org/software/libidn/"
 SECTION = "libs"
-LICENSE = "(GPL-2.0-or-later | LGPL-3.0-only) & GPL-3.0-or-later & Unicode-DFS-2016"
+LICENSE = "GPL-3.0-or-later AND Unicode-DFS-2016 AND (GPL-2.0-or-later OR LGPL-3.0-only)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://COPYING.LESSERv3;md5=3000208d539ec061b899bce1d9ce9404 \
                     file://COPYINGv2;md5=570a9b3749dd0463a1778803b12a6dce \
@@ -27,7 +27,7 @@ do_install:append() {
 	sed -i -e 's|-L${STAGING_LIBDIR}||' -e 's/  */ /g' ${D}${libdir}/pkgconfig/libidn2.pc
 }
 
-LICENSE:${PN} = "(GPL-2.0-or-later | LGPL-3.0-only) & Unicode-DFS-2016"
+LICENSE:${PN} = "Unicode-DFS-2016 AND (GPL-2.0-or-later OR LGPL-3.0-only)"
 LICENSE:${PN}-bin = "GPL-3.0-or-later"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/ltp/ltp_20260529.bb b/meta/recipes-extended/ltp/ltp_20260529.bb
index e863503200..0fc3946aa4 100644
--- a/meta/recipes-extended/ltp/ltp_20260529.bb
+++ b/meta/recipes-extended/ltp/ltp_20260529.bb
@@ -2,7 +2,7 @@ SUMMARY = "Linux Test Project"
 DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
 HOMEPAGE = "https://linux-test-project.github.io/"
 SECTION = "console/utils"
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
diff --git a/meta/recipes-extended/man-db/man-db_2.13.1.bb b/meta/recipes-extended/man-db/man-db_2.13.1.bb
index f044a47f7d..7fcad2ed4b 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.1.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "An implementation of the standard Unix documentation system accessed using the man command"
 HOMEPAGE = "http://man-db.nongnu.org/"
 DESCRIPTION = "man-db is an implementation of the standard Unix documentation system accessed using the man command. It uses a Berkeley DB database in place of the traditional flat-text whatis databases."
-LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-3.0-or-later"
+LICENSE = "GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://docs/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://docs/COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
diff --git a/meta/recipes-extended/man-pages/man-pages_6.18.bb b/meta/recipes-extended/man-pages/man-pages_6.18.bb
index 3e2eb66156..5d6504b85b 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.18.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.18.bb
@@ -2,7 +2,7 @@ SUMMARY = "Linux man-pages"
 DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C library interfaces that are employed by user programs"
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
-LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND BSD-4-Clause-UC AND GPL-1.0-or-later AND GPL-2.0-only AND GPL-2.0-or-later AND MIT"
 
 LIC_FILES_CHKSUM = "file://README;md5=e4d3c4124726a2b7763489612768c03c \
                     file://LICENSES/BSD-2-Clause.txt;md5=9e16594a228301089d759b4f178db91f \
diff --git a/meta/recipes-extended/mdadm/mdadm_4.6.bb b/meta/recipes-extended/mdadm/mdadm_4.6.bb
index b1d0a27c7f..e289fb9a17 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.6.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.kernel.org/pub/linux/utils/raid/mdadm/"
 DESCRIPTION = "mdadm is a Linux utility used to manage and monitor software RAID devices."
 
 # Some files are GPL-2.0-only while others are GPL-2.0-or-later.
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-only AND GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
diff --git a/meta/recipes-extended/pam/libpam_1.7.2.bb b/meta/recipes-extended/pam/libpam_1.7.2.bb
index 6955a5f2f6..ecaee30d1a 100644
--- a/meta/recipes-extended/pam/libpam_1.7.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.2.bb
@@ -7,7 +7,7 @@ SECTION = "base"
 # PAM is dual licensed under GPL and BSD.
 # /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time
 # libpam-runtime-1.0.1 is GPL-2.0-or-later), by openembedded
-LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
+LICENSE = "BSD-3-Clause OR GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7eb5c1bf854e8881005d673599ee74d3 \
                     file://libpamc/License;md5=a4da476a14c093fdc73be3c3c9ba8fb3 \
                     "
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index c1d83139d7..88f22fff37 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -2,7 +2,7 @@ SUMMARY = "Convert::ASN1 - Perl ASN.1 Encode/Decode library"
 SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/dist/Convert-ASN1/"
 DESCRIPTION = "Convert::ASN1 is a perl library for encoding/decoding data using ASN.1 definitions."
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
diff --git a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index 590b5bd0b8..028630ba90 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://metacpan.org/release/TimeDate"
 DESCRIPTION = "This is the perl5 TimeDate distribution. It requires perl version 5.003 or later."
 SECTION = "libs"
 # You can redistribute it and/or modify it under the same terms as Perl itself.
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=21;md5=576b7cb41e5e821501a01ed66f0f9d9e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/G/GB/GBARR/TimeDate-${PV}.tar.gz"
diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
index 9653cb427b..8306206abe 100644
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "XML::NamespaceSupport offers a simple way to process namespace-ba
                 basic checks. "
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 
 SRCNAME = "XML-NamespaceSupport"
 
diff --git a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
index a4b4116973..499720539c 100644
--- a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
+++ b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
@@ -7,7 +7,7 @@ use this module as a base class so you don't have to, for example, \
 implement the characters() callback."
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 RDEPENDS:${PN} += "perl-module-extutils-makemaker"
 
 LIC_FILES_CHKSUM = "file://dist.ini;endline=5;md5=8f9c9a55340aefaee6e9704c88466446"
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
index 5f982a4c4c..167591145c 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
@@ -9,7 +9,7 @@ come from the Java JAXP specification (SAX part), only without the \
 javaness."
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 DEPENDS += "libxml-namespacesupport-perl-native"
 RDEPENDS:${PN} += "libxml-namespacesupport-perl libxml-sax-base-perl perl-module-file-temp"
 
diff --git a/meta/recipes-extended/pigz/pigz_2.8.bb b/meta/recipes-extended/pigz/pigz_2.8.bb
index fcf0c93e41..9c949097c4 100644
--- a/meta/recipes-extended/pigz/pigz_2.8.bb
+++ b/meta/recipes-extended/pigz/pigz_2.8.bb
@@ -5,7 +5,7 @@ multiple cores to the hilt when compressing data. pigz was written by Mark \
 Adler, and uses the zlib and pthread libraries."
 HOMEPAGE = "http://zlib.net/pigz/"
 SECTION = "console/utils"
-LICENSE = "Zlib & Apache-2.0"
+LICENSE = "Apache-2.0 AND Zlib"
 LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
 
 SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
diff --git a/meta/recipes-extended/procps/procps_4.0.6.bb b/meta/recipes-extended/procps/procps_4.0.6.bb
index a9ec3f39d6..2437be1c3a 100644
--- a/meta/recipes-extended/procps/procps_4.0.6.bb
+++ b/meta/recipes-extended/procps/procps_4.0.6.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Procps contains a set of system utilities that provide system inf
 the /proc filesystem. The package includes the programs ps, top, vmstat, w, kill, and skill."
 HOMEPAGE = "https://gitlab.com/procps-ng/procps"
 SECTION = "base"
-LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4cf66a4984120007c9881cc871cf49db \
                     "
diff --git a/meta/recipes-extended/quota/quota_4.11.bb b/meta/recipes-extended/quota/quota_4.11.bb
index 811056f1f7..de6a7a56e5 100644
--- a/meta/recipes-extended/quota/quota_4.11.bb
+++ b/meta/recipes-extended/quota/quota_4.11.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 HOMEPAGE = "http://sourceforge.net/projects/linuxquota/"
 DESCRIPTION = "Tools and patches for the Linux Diskquota system as part of the Linux kernel"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=18136&atid=118136"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
 
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index d66ef1e6a4..54ef18479e 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "Shadow utils requirements for useradd.bbclass"
 HOMEPAGE = "http://github.com/shadow-maint/shadow"
 BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base utils"
-LICENSE = "BSD-3-Clause | Artistic-1.0"
+LICENSE = "Artistic-1.0 OR BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;endline=1;md5=ceddfb61608e4db87012499555184aed"
 
 DEPENDS = "base-passwd"
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index a23de1fcf7..f80a35539e 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "Sudo (superuser do) allows a system administrator to give certain
 HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
-LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND ISC AND Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2841c822e587db145364ca95e9be2ffa \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 47f9ac2855..8939cd2cb5 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "The Time Zone Database contains code and data that represent \
 the history of local time for many representative locations around the globe."
 HOMEPAGE = "http://www.iana.org/time-zones"
 SECTION = "base"
-LICENSE = "PD & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 PV = "2026c"
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extended/zstd/zstd_1.5.7.bb
index e5088e2d0d..4960ed5b48 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.7.bb
@@ -7,7 +7,7 @@ SECTION = "console/utils"
 
 PROVIDES += "zstd-decompress"
 
-LICENSE = "BSD-3-Clause | GPL-2.0-only"
+LICENSE = "BSD-3-Clause OR GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0 \
                     "
diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb
index 5d3fc40374..7d4e903bfa 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb
@@ -5,7 +5,7 @@ introspection data generated by GObject-based libraries to generate the API \
 reference of these libraries, as well as other ancillary documentation."
 HOMEPAGE = "https://gnome.pages.gitlab.gnome.org/gi-docgen/"
 
-LICENSE = "GPL-3.0-or-later & Apache-2.0"
+LICENSE = "Apache-2.0 AND GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f01202478cfe813c0e7f80b326"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main;tag=${PV}"
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb
index 8d26aae75c..b0dc59353d 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme/issues"
 SECTION = "x11/gnome"
 
-LICENSE = "LGPL-3.0-only | CC-BY-SA-3.0"
+LICENSE = "CC-BY-SA-3.0 OR LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
                     file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
                     file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
index 51cae5fff6..91525f99b7 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
@@ -6,7 +6,7 @@ generation for bindings, API verification and documentation generation."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/gobject-introspection"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gobject-introspection/issues"
 SECTION = "libs"
-LICENSE = "LGPL-2.0-or-later & GPL-2.0-or-later & MIT"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
                     file://tools/compiler.c;endline=20;md5=fc5007fc20022720e6c0b0cdde41fabd \
                     file://giscanner/sourcescanner.c;endline=22;md5=194d6e0c1d00662f32d030ce44de8d39 \
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
index 1fcc08443d..f385901bef 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
@@ -13,7 +13,7 @@ CVE_PRODUCT = "gnome:gtk gtk:gtk+"
 
 DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf gdk-pixbuf-native"
 
-LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "LGPL-2.0-only AND LGPL-2.0-or-later AND LGPL-2.1-or-later"
 
 GNOMEBN = "gtk"
 
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb b/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb
index bb2e041595..1d2e4bf9b8 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
     tiff \
 "
 
-LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "LGPL-2.0-only AND LGPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
     file://gtk/gtk.h;endline=25;md5=61900d77e8d5bc67cf15ad93de9a3490 \
diff --git a/meta/recipes-graphics/cairo/cairo_1.18.4.bb b/meta/recipes-graphics/cairo/cairo_1.18.4.bb
index 0ed81166b5..ae448101d9 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.4.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.4.bb
@@ -10,12 +10,12 @@ HOMEPAGE = "http://cairographics.org"
 BUGTRACKER = "https://gitlab.freedesktop.org/cairo/cairo/-/issues"
 SECTION = "libs"
 
-LICENSE = "(MPL-1.1 | LGPL-2.1-only) & GPL-3.0-or-later"
-LICENSE:${PN} = "MPL-1.1 | LGPL-2.1-only"
-LICENSE:${PN}-dev = "MPL-1.1 | LGPL-2.1-only"
-LICENSE:${PN}-doc = "MPL-1.1 | LGPL-2.1-only"
-LICENSE:${PN}-gobject = "MPL-1.1 | LGPL-2.1-only"
-LICENSE:${PN}-script-interpreter = "MPL-1.1 | LGPL-2.1-only"
+LICENSE = "GPL-3.0-or-later AND (LGPL-2.1-only OR MPL-1.1)"
+LICENSE:${PN} = "LGPL-2.1-only OR MPL-1.1"
+LICENSE:${PN}-dev = "LGPL-2.1-only OR MPL-1.1"
+LICENSE:${PN}-doc = "LGPL-2.1-only OR MPL-1.1"
+LICENSE:${PN}-gobject = "LGPL-2.1-only OR MPL-1.1"
+LICENSE:${PN}-script-interpreter = "LGPL-2.1-only OR MPL-1.1"
 LICENSE:${PN}-perf-utils = "GPL-3.0-or-later"
 # Adapt the licenses for cairo-dbg and cairo-src depending on whether
 # cairo-trace is being built.
diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb
index 6e32d1b861..be961f4d33 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "The Cantarell font typeface is designed as a \
 
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/cantarell-fonts/"
 SECTION = "fonts"
-LICENSE = "OFL-1.1 & Apache-2.0"
+LICENSE = "Apache-2.0 AND OFL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb1ef92b6909969a472a6ea3c4e99cb7"
 
 inherit gnomebase allarch fontcache
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
index d2b6050081..792d44b7f0 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
@@ -11,7 +11,7 @@ rasterize fonts."
 HOMEPAGE = "http://www.fontconfig.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 
-LICENSE = "MIT & PD"
+LICENSE = "MIT AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=00252fd272bf2e722925613ad74cb6c7 \
                     file://src/fcfreetype.c;endline=23;md5=f7c0140c1b0387cf4cf45420b059847c \
                     "
diff --git a/meta/recipes-graphics/freetype/freetype_2.14.3.bb b/meta/recipes-graphics/freetype/freetype_2.14.3.bb
index a7a8585b15..924bcbfc4f 100644
--- a/meta/recipes-graphics/freetype/freetype_2.14.3.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.14.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://freetype.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/groups/freetype/-/issues"
 SECTION = "libs"
 
-LICENSE = "(FTL | GPL-2.0-or-later) & MIT"
+LICENSE = "MIT AND (FTL OR GPL-2.0-or-later)"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=eeb073d5fb86d23c52bb9b84aa256307 \
                     file://docs/FTL.TXT;md5=72d844cd2f3bcaf6a85244b508032be7 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec \
diff --git a/meta/recipes-graphics/glslang/glslang_1.4.350.1.bb b/meta/recipes-graphics/glslang/glslang_1.4.350.1.bb
index bc33931b3c..4d31a19e76 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.350.1.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.350.1.bb
@@ -5,7 +5,7 @@ of the specifications for these languages. It is open and free for anyone to use
 either from a command line or programmatically."
 SECTION = "graphics"
 HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
-LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
+LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT AND GPL-3.0-or-later WITH Bison-exception-2.2"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=50ff9d0fcde2d5b953ebe431c48e34e3"
 
 SRCREV = "275822a6261ee689aadb1da5f09a0ec2f058685c"
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
index 98e2f00a57..8950441976 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Hardware accelerated JPEG compression/decompression library"
 DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and decompression"
 HOMEPAGE = "http://libjpeg-turbo.org/"
 
-LICENSE = "IJG & BSD-3-Clause & Zlib"
+LICENSE = "BSD-3-Clause AND IJG AND Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d21daef3b4b318f77062055059c72934"
 
 DEPENDS:append:x86-64:class-target = " nasm-native"
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
index 9de44d4c95..0712e9ecac 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
@@ -7,7 +7,7 @@ SECTION = "x11/libs"
 HOMEPAGE = "http://matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.com/"
 
-LICENSE = "LGPL-2.0-or-later & HPND"
+LICENSE = "HPND AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87712c91ca9a2c2d475a0604c00f8f54 \
                     file://COPYING.HPND;md5=508defeea3622831e69c4827a31d6db0"
 
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
index 091ce8ed8b..6038d3eb1d 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "http://bugzilla.libsdl.org/"
 
 SECTION = "libs"
 
-LICENSE = "Zlib & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND Zlib"
 LIC_FILES_CHKSUM = "\
     file://LICENSE.txt;md5=cbf0e3161523f9a9315b6b915c5c4457 \
     file://src/hidapi/LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077 \
diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
index e7fb297448..ad17f7632b 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 
-LICENSE = "MIT & PD"
+LICENSE = "MIT AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=5;md5=2c456e2fe0a0a05d31a72e076d404528 \
                     file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
 
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index a020d67bbf..a3203464d1 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Piglit is an open-source test suite for OpenGL and OpenCL \
 implementations."
 HOMEPAGE = "https://gitlab.freedesktop.org/mesa/piglit"
 BUGTRACKER = "https://gitlab.freedesktop.org/mesa/piglit/-/issues"
-LICENSE = "MIT & LGPL-2.0-or-later & GPL-3.0-only & GPL-2.0-or-later & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND GPL-2.0-or-later AND GPL-3.0-only AND LGPL-2.0-or-later AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main \
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb
index c4a7be4045..c4af29652d 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.350.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Machine-readable files for the SPIR-V Registry"
 SECTION = "graphics"
 HOMEPAGE = "https://www.khronos.org/registry/spir-v"
-LICENSE = "MIT & CC-BY-4.0"
+LICENSE = "CC-BY-4.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
 SRCREV = "ad9184e76a66b1001c29db9b0a3e87f646c64de0"
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb
index ff5108e013..f6d797cae7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/vulkan/"
 BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Headers"
 SECTION = "libs"
 
-LICENSE = "Apache-2.0 & MIT"
+LICENSE = "Apache-2.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb
index 367438e1e1..163fe0beea 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://www.khronos.org/vulkan/"
 BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-ValidationLayers"
 SECTION = "libs"
 
-LICENSE = "Apache-2.0 & MIT & BSL-1.0 "
+LICENSE = "Apache-2.0 AND BSL-1.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.350;protocol=https;tag=vulkan-sdk-${PV}"
diff --git a/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb b/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb
index 7432c08ec0..4f240d17a6 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "The encodings that map to specific characters for a \
 number of Xorg and common fonts."
 
 require xorg-font-common.inc
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9da93f2daf2d5572faa2bfaf0dbd9e76"
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb b/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb
index 2b38c10ad3..05f246bf20 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "X.Org font package creation/installation utilities"
 
 require xorg-font-common.inc
 
-LICENSE = "Unicode-TOU & MIT & X11 & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND MIT AND Unicode-TOU AND X11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=756e7412ee04c80f5833cd2f35242f7a \
                     file://ucs2any.c;endline=28;md5=8357dc567fc628bd12696f15b2a33bcb \
                     file://bdftruncate.c;endline=26;md5=4f82ffc101a1b165eae9c6998abff937 \
diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index 97c8be0a07..4e48b92fb2 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/fonts"
 
 # Compiled fonts from https://gitlab.freedesktop.org/xorg/font/misc-misc/
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://../misc/fonts.dir;md5=82a143d94d6a974aafe97132d2d519ab \
                     file://../misc/cursor.pcf.gz;md5=40bc81001fef4c21ca08df4305014a2a"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.12.bb b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.12.bb
index 4bf9f07aba..fc0c602b96 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.12.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "This package provides the compose data files for libx11."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & BSD-1-Clause & HPND & HPND-sell-variant & ISC"
+LICENSE = "BSD-1-Clause AND HPND AND HPND-sell-variant AND ISC AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1d49cdd2b386c5db11ec636d680b7116"
 
 XORG_PN = "libX11"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
index f5c27e0102..c06832e35e 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
@@ -6,7 +6,7 @@ basic functions of the window system."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & BSD-1-Clause & HPND & HPND-sell-variant & ISC"
+LICENSE = "BSD-1-Clause AND HPND AND HPND-sell-variant AND ISC AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f2a1d92c4a50eedcf7c12672b908851"
 
 DEPENDS += "xorgproto \
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb
index 192c41d41c..33cf5816e0 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb
@@ -6,7 +6,7 @@ such as freetype)."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT & BSD-4-Clause-UC & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND BSD-4-Clause-UC AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a5d1388c9d40be70dbad35fa440443f7"
 
 DEPENDS += "freetype xtrans xorgproto libfontenc zlib"
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
index 9ec7cc30f5..f70b4e2ad3 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -6,7 +6,7 @@ such as freetype)."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 
 DEPENDS += "freetype xtrans xorgproto libfontenc zlib"
diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
index d7e778610e..240215379f 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
@@ -7,7 +7,7 @@ input devices other than the core X keyboard and pointer.  It allows \
 client programs to select input from these devices independently from \
 each other and independently from the core devices."
 
-LICENSE = "MIT & MIT"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=17b064789fab936a1c58c4e13d965b0f \
                     file://src/XIGetDevFocus.c;endline=23;md5=cdfb0d435a33ec57ea0d1e8e395b729f"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb
index ac02ad87c8..45e1352761 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
 processes a reduced subset of keymaps as defined by the XKB specification."
 HOMEPAGE = "http://www.xkbcommon.org"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=70eff33050c59f900f5b83275dcf1211"
-LICENSE = "MIT & MIT-open-group & HPND & HPND-sell-variant & X11"
+LICENSE = "HPND AND HPND-sell-variant AND MIT AND MIT-open-group AND X11"
 
 DEPENDS = "flex-native bison-native"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb
index 9f0c65ee94..bd29691826 100644
--- a/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb
@@ -9,7 +9,7 @@ second library, libXmuu."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e79ad4fcc53b9bfe0fc38507a56446b9"
 
 DEPENDS += "libxt libxext"
diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb b/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb
index 97323ad282..5503605e7e 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb
@@ -12,7 +12,7 @@ independent of any particular user interface policy or style."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d6e9ca2c4b2276625afe025b0a2a4d8c"
 
 DEPENDS += "util-linux libxcb libsm virtual/libx11 xorgproto libxdmcp"
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
index 468871f114..d86aa78b9a 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
@@ -15,7 +15,7 @@ UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 PE = "1"
 
-LICENSE = "MIT & HPND-sell-variant"
+LICENSE = "HPND-sell-variant AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=21;md5=4a018dff3e4e25302724c88ff95c2456 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb
index dc0d1e1677..ef3579464d 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb
@@ -9,7 +9,7 @@ systems."
 HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-config"
 
-LICENSE = "MIT & MIT"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=faa756e04053029ddc602caf99e5ef1d"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 782c1f76ca..7c0a24e58b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -1,7 +1,7 @@
 SUMMARY = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
-LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons"
+LICENSE = "Adobe-Display-PostScript AND BSD-3-Clause AND DEC-3-Clause AND HPND AND HPND-Netrek AND HPND-UC AND HPND-sell-MIT-disclaimer-xserver AND HPND-sell-variant AND ICU AND ISC AND MIT AND MIT-open-group AND NTP AND SGI-B-2.0 AND SMLNJ AND X11 AND X11-no-permit-persons"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
index 41bf1687a2..1f32177ec5 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
@@ -6,7 +6,7 @@ the transition from X Window System to Wayland environments, providing \
 a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
-LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons"
+LICENSE = "Adobe-Display-PostScript AND BSD-3-Clause AND DEC-3-Clause AND HPND AND HPND-Netrek AND HPND-UC AND HPND-sell-MIT-disclaimer-xserver AND HPND-sell-variant AND ICU AND ISC AND MIT AND MIT-open-group AND NTP AND SGI-B-2.0 AND SMLNJ AND X11 AND X11-no-permit-persons"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
diff --git a/meta/recipes-kernel/dtc/dtc_1.8.1.bb b/meta/recipes-kernel/dtc/dtc_1.8.1.bb
index 5c3b1d7a6d..e2c7edcc46 100644
--- a/meta/recipes-kernel/dtc/dtc_1.8.1.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.8.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Device Tree Compiler"
 HOMEPAGE = "https://devicetree.org/"
 DESCRIPTION = "The Device Tree Compiler is a toolchain for working with device tree source and binary files."
 SECTION = "bootloader"
-LICENSE = "GPL-2.0-only | BSD-2-Clause"
+LICENSE = "BSD-2-Clause OR GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 2e13e4ca31..cb09800535 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Powerful set of tools or managing Yocto Linux kernel sources \
 and configuration data. You can use these tools to make a single configuration \
 change, apply multiple patches, or work with your own kernel sources."
 HOMEPAGE = "https://www.yoctoproject.org/"
-LICENSE = "GPL-2.0-only & MIT"
+LICENSE = "GPL-2.0-only AND MIT"
 LIC_FILES_CHKSUM = "\
 	file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249624278c3e343e501 \
 	file://Kconfiglib/LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c \
diff --git a/meta/recipes-kernel/kmod/kmod_34.2.bb b/meta/recipes-kernel/kmod/kmod_34.2.bb
index e5923a64cf..892468a87e 100644
--- a/meta/recipes-kernel/kmod/kmod_34.2.bb
+++ b/meta/recipes-kernel/kmod/kmod_34.2.bb
@@ -5,7 +5,7 @@ SUMMARY = "Tools for managing Linux kernel modules"
 DESCRIPTION = "kmod is a set of tools to handle common tasks with Linux kernel modules like \
                insert, remove, list, check properties, resolve dependencies and aliases."
 HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kmod/"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LICENSE:libkmod = "LGPL-2.1-or-later"
 SECTION = "base"
 
diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
index 0dee0ebcc2..a44253a567 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
@@ -3,7 +3,7 @@
 
 SUMMARY = "API to access the kernel tracefs directory"
 HOMEPAGE = "https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
diff --git a/meta/recipes-kernel/linux/linux-yocto-fitimage.bb b/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
index 6ce1960a87..4dcffb6209 100644
--- a/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
@@ -3,7 +3,7 @@ SECTION = "kernel"
 
 # If an initramfs is included in the FIT image more licenses apply.
 # But also the kernel uses more than one license (see Documentation/process/license-rules.rst)
-LICENSE = "GPL-2.0-with-Linux-syscall-note"
+LICENSE = "GPL-2.0-only WITH Linux-syscall-note"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-with-Linux-syscall-note;md5=0bad96c422c41c3a94009dcfe1bff992"
 
 inherit linux-kernel-base kernel-fit-image
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4e230d405a..477eecb0ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Linux kernel"
 SECTION = "kernel"
-LICENSE = "GPL-2.0-with-Linux-syscall-note"
+LICENSE = "GPL-2.0-only WITH Linux-syscall-note"
 HOMEPAGE = "https://www.yoctoproject.org/"
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
index b0cd6efde1..7c151bf729 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
 DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
 HOMEPAGE = "http://babeltrace.org/"
 BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
-LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
+LICENSE = "BSD-2-Clause AND BSD-4-Clause AND CC-BY-SA-4.0 AND GPL-2.0-only AND GPL-3.0-or-later AND LGPL-2.1-only AND MIT AND PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native virtual/libiconv swig-native"
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb
index e281ed2fd8..49f2bc8eb2 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb
@@ -2,7 +2,7 @@ SECTION = "devel"
 SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
 HOMEPAGE = "https://lttng.org/"
-LICENSE = "LGPL-2.1-only & GPL-2.0-only & MIT"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=018e002dbdda3306682e394ddd65fa32"
 
 inherit module
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb
index 9fdb0ede72..9a56d1711b 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb
@@ -5,7 +5,7 @@ to extract program execution details from the Linux operating system \
 and interpret them."
 HOMEPAGE = "https://github.com/lttng/lttng-tools"
 
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=40ef17463fbd6f377db3c47b1cbaded8 \
                     file://LICENSES/GPL-2.0;md5=e68f69a54b44ba526ad7cb963e18fbce \
                     file://LICENSES/LGPL-2.1;md5=9920968d0f2ff585ce61fae30344dd95"
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb
index d731aa2eb0..9f1d0961a1 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The LTTng UST 2.x package contains the userspace tracer library t
 HOMEPAGE = "http://lttng.org/ust"
 BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
 
-LICENSE = "LGPL-2.1-or-later & MIT & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-or-later AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b04e8f34dbcf08198c6618d05e8fe7b"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
index 0c81e3cb3b..1033250204 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
@@ -4,7 +4,7 @@ provides a level of abstraction over the /dev interfaces provided by the kernel
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "libs/multimedia"
-LICENSE = "LGPL-2.1-only & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
index 7db0c4d677..793f6a7eba 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
@@ -16,7 +16,7 @@ CVE_PRODUCT = "alsa"
 # consistent with the libsamplerate license. However, if the licensee has a
 # commercial license for libsamplerate, the samplerate plugin may be used under
 # the terms of LGPL-2.1-only like the rest of the plugins.
-LICENSE = "LGPL-2.1-only & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://COPYING.GPL;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://m4/attributes.m4;endline=33;md5=bb8c6b2a67ac15156961e242fec33e50 \
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
index 1228176fb9..b58f106cec 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
@@ -5,7 +5,7 @@ firmware loaders for pcmcia, USB and the hdsp devices."
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
-LICENSE = "GPL-2.0-only & LGPL-2.0-or-later"
+LICENSE = "GPL-2.0-only AND LGPL-2.0-or-later"
 DEPENDS = "alsa-lib"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
index 38eccbf2ad..26614762e5 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "FFmpeg is the leading multimedia framework, able to decode, encod
 HOMEPAGE = "https://www.ffmpeg.org/"
 SECTION = "libs"
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & ISC & MIT & BSD-2-Clause & BSD-3-Clause & IJG"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND GPL-2.0-or-later AND IJG AND ISC AND LGPL-2.1-or-later AND MIT"
 LICENSE:${PN} = "GPL-2.0-or-later"
 LICENSE:libavcodec = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
 LICENSE:libavdevice = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb
index a406f4783f..4051bcf7f2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "332b7320f30c60f2d5941446d03b9d05e3781f2c2561befbe88718bd77
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
-LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS += "gstreamer1.0-plugins-base"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb
index 4c0811a056..04df81f6d8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly/-/issues
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 
-LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LICENSE_FLAGS = "commercial"
 
 SRC_URI = " \
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
index 3462803cb2..47f1b3f4dc 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Library provides support for the Tag Image File Format \
 (TIFF), a widely used format for storing image data.  This library \
 provide means to easily access and create TIFF image files."
 HOMEPAGE = "http://www.libtiff.org/"
-LICENSE = "libtiff & BSD-4.3TAHOE"
+LICENSE = "BSD-4.3TAHOE AND libtiff"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ab490c3088a0acff254eb2f8c577547"
 
 CVE_PRODUCT = "libtiff"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 30305fa44a..975929918f 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -45,7 +45,7 @@ SECTION = "libs/multimedia"
 # libdbus is a system library that is covered by the "special exception" in
 # GPLv2's section 3, and therefore libdbus's GPL license doesn't affect
 # PulseAudio.
-LICENSE = "LGPL-2.1-or-later & MIT & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND LGPL-2.1-or-later AND MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5cd938de1a7a53ea5adac38cc10c39 \
                     file://GPL;md5=4325afd396febcb659c36b49533135d4 \
diff --git a/meta/recipes-multimedia/sbc/sbc_2.2.bb b/meta/recipes-multimedia/sbc/sbc_2.2.bb
index ace764d5d3..0050144c21 100644
--- a/meta/recipes-multimedia/sbc/sbc_2.2.bb
+++ b/meta/recipes-multimedia/sbc/sbc_2.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "SBC Audio Codec"
 DESCRIPTION = "Bluetooth low-complexity, subband codec (SBC) library."
 HOMEPAGE = "https://www.bluez.org"
 SECTION = "libs"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LICENSE:${PN} = "LGPL-2.1-or-later"
 LICENSE:${PN}-examples = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
diff --git a/meta/recipes-rt/rt-tests/rt-tests_git.bb b/meta/recipes-rt/rt-tests/rt-tests_git.bb
index 1f48e143d4..aea3d82e20 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_git.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://wiki.linuxfoundation.org/realtime/documentation/start"
 DESCRIPTION = "The main aim of the PREEMPT_RT patch is to minimize the amount of kernel code that is non-preemptible Therefore several substitution mechanisms and new mechanisms are implemented."
 SECTION = "tests"
 DEPENDS = "linux-libc-headers virtual/libc numactl"
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-only AND GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 require rt-tests.inc
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
index 85e5300520..69a8c7472f 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A lightweight windows manager for embedded systems. It uses the d
 HOMEPAGE = "http://matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/desktop.c;endline=20;md5=2e488557570c7dee53bfd0567e4273a9 \
                     file://src/main.c;endline=19;md5=5d2234b35efa927ab3ae36ebac52ba59"
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
index 2e463cd7b3..844589d43f 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Fast lightweight tabbed filemanager"
 DESCRIPTION = "A free file manager application and the standard file manager of LXDE."
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
 
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/pcmanfm.h;endline=22;md5=417b3855771a3a87f8ad753d994491f0 \
                     file://src/gseal-gtk-compat.h;endline=21;md5=46922c8691f58d124f9420fe16149ce2"
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index a2af4faed3..27850a8b98 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Ultra-simple screen capture utility, aimed at handheld devices"
 HOMEPAGE = "http://www.o-hand.com"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-only AND GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://main.c;endline=9;md5=023e14d6404d0a961eb97cbd011fc141 \
                     file://screenshot-ui.h;endline=9;md5=638d9ffa83e9325a36df224166ed6ad0"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.52.5.bb
index 1a834733ce..945d7b77cb 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.52.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.52.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "WebKit web rendering engine for the GTK+ platform"
 HOMEPAGE = "https://www.webkitgtk.org/"
 BUGTRACKER = "https://bugs.webkit.org/"
 
-LICENSE = "BSD-2-Clause & LGPL-2.0-or-later"
+LICENSE = "BSD-2-Clause AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
                     file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 \
                     file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
diff --git a/meta/recipes-support/aspell/aspell_0.60.8.2.bb b/meta/recipes-support/aspell/aspell_0.60.8.2.bb
index 5b4fab7c35..60d3376678 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.2.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.2.bb
@@ -10,7 +10,7 @@ SECTION = "console/utils"
 
 HOMEPAGE = "http://aspell.net/"
 
-LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
+LICENSE = "LGPL-2.0-only OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
diff --git a/meta/recipes-support/attr/acl_2.4.0.bb b/meta/recipes-support/attr/acl_2.4.0.bb
index ef9ee492a0..d470989acc 100644
--- a/meta/recipes-support/attr/acl_2.4.0.bb
+++ b/meta/recipes-support/attr/acl_2.4.0.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "http://savannah.nongnu.org/bugs/?group=acl"
 
 SECTION = "libs"
 
-LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LICENSE:${PN} = "GPL-2.0-or-later"
 LICENSE:lib${BPN} = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
diff --git a/meta/recipes-support/attr/attr_2.6.0.bb b/meta/recipes-support/attr/attr_2.6.0.bb
index aa5e7eb98f..4af6c4fac2 100644
--- a/meta/recipes-support/attr/attr_2.6.0.bb
+++ b/meta/recipes-support/attr/attr_2.6.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 DEPENDS = "virtual/libintl"
 
-LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LICENSE:${PN} = "GPL-2.0-or-later"
 LICENSE:lib${BPN} = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
diff --git a/meta/recipes-support/boost/boost-1.91.0.inc b/meta/recipes-support/boost/boost-1.91.0.inc
index ba3f6062f3..dc68d7a336 100644
--- a/meta/recipes-support/boost/boost-1.91.0.inc
+++ b/meta/recipes-support/boost/boost-1.91.0.inc
@@ -4,7 +4,7 @@
 # intended to be widely useful, and are in regular use by
 # thousands of programmers across a broad spectrum of applications.
 HOMEPAGE = "http://www.boost.org/"
-LICENSE = "BSL-1.0 & MIT & Python-2.0"
+LICENSE = "BSL-1.0 AND MIT AND Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
index 1bc64fe34a..90a8568947 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
@@ -4,7 +4,7 @@ SSL-based applications to check for the authenticity of SSL connections. \
 This derived from Debian's CA Certificates."
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
-LICENSE = "GPL-2.0-or-later & MPL-2.0"
+LICENSE = "GPL-2.0-or-later AND MPL-2.0"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=dab7c7cea776d1a1648deb0052c72647"
 
 # This is needed to ensure we can run the postinst at image creation time
diff --git a/meta/recipes-support/debianutils/debianutils_5.23.2.bb b/meta/recipes-support/debianutils/debianutils_5.23.2.bb
index 29581c2b95..06bc4060c9 100644
--- a/meta/recipes-support/debianutils/debianutils_5.23.2.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.23.2.bb
@@ -5,7 +5,7 @@ you may use them directly. "
 HOMEPAGE = "https://packages.debian.org/sid/debianutils"
 BUGTRACKER = "https://bugs.debian.org/cgi-bin/pkgreport.cgi?pkg=debianutils;dist=unstable"
 SECTION = "base"
-LICENSE = "GPL-2.0-only & SMAIL-GPL"
+LICENSE = "GPL-2.0-only AND SMAIL-GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9"
 
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/${PV} \
diff --git a/meta/recipes-support/gmp/gmp_6.3.0.bb b/meta/recipes-support/gmp/gmp_6.3.0.bb
index 8f18bdca1b..579e112fc2 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -1,6 +1,6 @@
 require gmp.inc
 
-LICENSE = "GPL-2.0-or-later | LGPL-3.0-or-later"
+LICENSE = "GPL-2.0-or-later OR LGPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "\
         file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.20.bb b/meta/recipes-support/gnupg/gnupg_2.5.20.bb
index 4146b12824..fc594793cc 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.20.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.20.bb
@@ -5,7 +5,7 @@ and sign your data and communications; it features a versatile key \
 management system, along with access modules for all kinds of public \
 key directories."
 HOMEPAGE = "http://www.gnupg.org/"
-LICENSE = "GPL-3.0-only & LGPL-3.0-only"
+LICENSE = "GPL-3.0-only AND LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=189af8afca6d6075ba6c9e0aa8077626 \
                     file://COPYING.LGPL3;md5=a2b6bf2cb38ee52619e60f30a1fc7257"
 
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.13.bb b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
index 943864d4ba..e360db6fff 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -4,7 +4,7 @@ TLS and DTLS protocols and technologies around them."
 HOMEPAGE = "https://gnutls.org/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 
-LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-3.0-or-later AND LGPL-2.1-or-later"
 LICENSE:${PN} = "LGPL-2.1-or-later"
 LICENSE:${PN}-xx = "LGPL-2.1-or-later"
 LICENSE:${PN}-bin = "GPL-3.0-or-later"
diff --git a/meta/recipes-support/gnutls/libtasn1_4.21.0.bb b/meta/recipes-support/gnutls/libtasn1_4.21.0.bb
index 4570488c4c..236948a861 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.21.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.21.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A highly portable C library that encodes and decodes \
 DER/BER data following an ASN.1 schema. "
 HOMEPAGE = "http://www.gnu.org/software/libtasn1/"
 
-LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-3.0-or-later AND LGPL-2.1-or-later"
 LICENSE:${PN}-bin = "GPL-3.0-or-later"
 LICENSE:${PN} = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
diff --git a/meta/recipes-support/gpgme/gpgme_2.1.2.bb b/meta/recipes-support/gpgme/gpgme_2.1.2.bb
index 328b544212..32db75fdfd 100644
--- a/meta/recipes-support/gpgme/gpgme_2.1.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.1.2.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "GnuPG Made Easy (GPGME) is a library designed to make access to G
 HOMEPAGE = "http://www.gnupg.org/gpgme.html"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
-LICENSE:${PN} = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.1-or-later"
+LICENSE:${PN} = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LICENSE:${PN}-tool = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-support/hwdata/hwdata_0.409.bb b/meta/recipes-support/hwdata/hwdata_0.409.bb
index 543d24dc4e..7117c0857c 100644
--- a/meta/recipes-support/hwdata/hwdata_0.409.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.409.bb
@@ -4,7 +4,7 @@ configuration data, such as the pci.ids and usb.ids databases."
 HOMEPAGE = "https://github.com/vcrhonek/hwdata"
 SECTION = "System/Base"
 
-LICENSE = "GPL-2.0-or-later | X11"
+LICENSE = "GPL-2.0-or-later OR X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
diff --git a/meta/recipes-support/icu/icu_78.3.bb b/meta/recipes-support/icu/icu_78.3.bb
index ad920f3ef4..c057505e3c 100644
--- a/meta/recipes-support/icu/icu_78.3.bb
+++ b/meta/recipes-support/icu/icu_78.3.bb
@@ -5,7 +5,7 @@ internationalization (I18N) and globalization (G11N), giving applications the \
 same results on all platforms."
 HOMEPAGE = "https://icu.unicode.org/"
 
-LICENSE = "ICU & MIT"
+LICENSE = "ICU AND MIT"
 DEPENDS = "icu-native"
 
 CVE_PRODUCT = "international_components_for_unicode"
diff --git a/meta/recipes-support/libassuan/libassuan_3.0.2.bb b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
index 2ae2fa77cb..3c4ce4f1a3 100644
--- a/meta/recipes-support/libassuan/libassuan_3.0.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
@@ -5,7 +5,7 @@ Both, server and client side functions are provided. "
 HOMEPAGE = "http://www.gnupg.org/related_software/libassuan/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
-LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-3.0-or-later AND LGPL-2.1-or-later"
 LICENSE:${PN} = "LGPL-2.1-or-later"
 LICENSE:${PN}-doc = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
index 82adf417a3..6bb25fcec5 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Package provides semi-portable access to hardware-provided atomic
 HOMEPAGE = "https://github.com/bdwgc/libatomic_ops/"
 SECTION = "optional"
 PROVIDES += "libatomics-ops"
-LICENSE = "GPL-2.0-only & MIT"
+LICENSE = "GPL-2.0-only AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE;md5=5700d28353dfa2f191ca9b1bd707865e \
                     "
diff --git a/meta/recipes-support/libbsd/libbsd_0.12.2.bb b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
index 39ecda26af..2ebc3e1003 100644
--- a/meta/recipes-support/libbsd/libbsd_0.12.2.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
@@ -21,7 +21,7 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: ISC
 # License: ISC-Original
 # License: public-domain
-LICENSE = "BSD-3-Clause & ISC & PD"
+LICENSE = "BSD-3-Clause AND ISC AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9b087a0981a1fcad42efbba6d4925a0f"
 
 SECTION = "libs"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 32f37987d9..5c1a7fdfea 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "The libcap-ng library is intended to make programming \
 with POSIX capabilities much easier than the traditional libcap library."
 HOMEPAGE = "https://github.com/stevegrubb/libcap-ng"
 SECTION = "base"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
diff --git a/meta/recipes-support/libevent/libevent_2.1.13.bb b/meta/recipes-support/libevent/libevent_2.1.13.bb
index 431018f0f3..6566e73bbd 100644
--- a/meta/recipes-support/libevent/libevent_2.1.13.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.13.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://libevent.org/"
 BUGTRACKER = "https://github.com/libevent/libevent/issues"
 SECTION = "libs"
 
-LICENSE = "BSD-3-Clause & MIT"
+LICENSE = "BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=17f20574c0b154d12236d5fbe964f549"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/release-${PV}-stable/${BP}-stable.tar.gz \
diff --git a/meta/recipes-support/libfm/libfm_1.3.2.bb b/meta/recipes-support/libfm/libfm_1.3.2.bb
index ab29ce4b40..95f821eee7 100644
--- a/meta/recipes-support/libfm/libfm_1.3.2.bb
+++ b/meta/recipes-support/libfm/libfm_1.3.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "LibFM provides file management functions built on top of Glib/GIO
 giving a convenient higher-level API."
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4641e94ec96f98fabc56ff9cc48be14b \
                     file://src/fm.h;beginline=8;endline=21;md5=ef1f84da64b3c01cca447212f7ef6007 \
                     file://src/base/fm-config.h;beginline=10;endline=23;md5=ef1f84da64b3c01cca447212f7ef6007 \
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
index 1eb6c472a3..697deed607 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
@@ -6,9 +6,9 @@ HOMEPAGE = "http://directory.fsf.org/project/libgcrypt/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 SECTION = "libs"
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause"
-LICENSE:${PN} = "LGPL-2.1-or-later & BSD-3-Clause"
-LICENSE:${PN}-dev = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "BSD-3-Clause AND GPL-2.0-or-later AND LGPL-2.1-or-later"
+LICENSE:${PN} = "BSD-3-Clause AND LGPL-2.1-or-later"
+LICENSE:${PN}-dev = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://COPYING.LIB;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb
index de3918a998..982f6edc63 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Contains common error codes and error handling functions used by
 HOMEPAGE = "http://www.gnupg.org/related_software/libgpg-error/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/gpg-error.h.in;beginline=2;endline=18;md5=f146974b5d59380f15c9f0eaaac4cbec \
diff --git a/meta/recipes-support/libical/libical_4.0.3.bb b/meta/recipes-support/libical/libical_4.0.3.bb
index d7001d4a8c..dff79bcc4f 100644
--- a/meta/recipes-support/libical/libical_4.0.3.bb
+++ b/meta/recipes-support/libical/libical_4.0.3.bb
@@ -5,7 +5,7 @@ calendar clients can communicate with calendar servers so users can store \
 their calendar data and arrange meetings with other users. "
 HOMEPAGE = "https://github.com/libical/libical"
 BUGTRACKER = "https://github.com/libical/libical/issues"
-LICENSE = "LGPL-2.1-only | MPL-2.0"
+LICENSE = "LGPL-2.1-only OR MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6d9294493d031c817783b0400a126c89 \
                     "
 SECTION = "libs"
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
index 36721d201c..776cfe9785 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
@@ -4,7 +4,7 @@ It does not depend on any system resource other than a high-resolution time \
 stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
-LICENSE = "BSD-3-Clause | GPL-2.0-only"
+LICENSE = "BSD-3-Clause OR GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e01027c4ad1fe5a4768f8488c945d491 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
diff --git a/meta/recipes-support/libksba/libksba_1.8.0.bb b/meta/recipes-support/libksba/libksba_1.8.0.bb
index 938bda67f5..553fd336cc 100644
--- a/meta/recipes-support/libksba/libksba_1.8.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.8.0.bb
@@ -5,8 +5,8 @@ the implemented protocols and presents the data in a consistent way. The \
 library does not rely on another cryptographic library but provides \
 hooks for easy integration with Libgcrypt. "
 HOMEPAGE = "http://www.gnupg.org/related_software/libksba/"
-LICENSE = "GPL-3.0-or-later & (GPL-2.0-or-later | LGPL-3.0-or-later)"
-LICENSE:${PN} = "GPL-2.0-or-later | LGPL-3.0-or-later"
+LICENSE = "GPL-3.0-or-later AND (GPL-2.0-or-later OR LGPL-3.0-or-later)"
+LICENSE:${PN} = "GPL-2.0-or-later OR LGPL-3.0-or-later"
 LICENSE:${PN}-doc = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fd541d83f75d038c4e0617b672ed8bda \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-support/libmd/libmd_1.2.0.bb b/meta/recipes-support/libmd/libmd_1.2.0.bb
index 1aee94a054..b630708961 100644
--- a/meta/recipes-support/libmd/libmd_1.2.0.bb
+++ b/meta/recipes-support/libmd/libmd_1.2.0.bb
@@ -5,7 +5,7 @@ libmd (FreeBSD, DragonflyBSD, macOS, Solaris) libraries and \
 lacking on others like GNU systems."
 HOMEPAGE = "https://www.hadrons.org/software/libmd/"
 
-LICENSE = "BSD-3-Clause & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=261bf22602270e2b29c53930d409a3ca"
 
 SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz \
diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index 70079e0b65..35330845d1 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -7,7 +7,7 @@ not the original PCRE 8.x series."
 SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
-LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
                     file://deps/sljit/LICENSE;md5=97268427d235c41c0be238ce8e5fda17 \
                     "
diff --git a/meta/recipes-support/libunistring/libunistring_1.4.2.bb b/meta/recipes-support/libunistring/libunistring_1.4.2.bb
index 8f6cc27193..d3bfe976c9 100644
--- a/meta/recipes-support/libunistring/libunistring_1.4.2.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.4.2.bb
@@ -13,7 +13,7 @@ DESCRIPTION = "Text files are nowadays usually encoded in Unicode, and may\
 
 HOMEPAGE = "http://www.gnu.org/software/libunistring/"
 SECTION = "devel"
-LICENSE = "LGPL-3.0-or-later | GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later OR LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://README;beginline=45;endline=65;md5=3a896a943b4da2c551e6be1af27eff8d \
                     file://doc/libunistring.texi;md5=55cc91e1fe09c7aec78b6dc932202300 \
diff --git a/meta/recipes-support/liburcu/liburcu_0.15.6.bb b/meta/recipes-support/liburcu/liburcu_0.15.6.bb
index 1cb349f55d..140488eaa3 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.6.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.6.bb
@@ -5,7 +5,7 @@ with the number of cores. "
 HOMEPAGE = "http://lttng.org/urcu"
 BUGTRACKER = "http://lttng.org/project/issues"
 
-LICENSE = "LGPL-2.1-or-later & MIT"
+LICENSE = "LGPL-2.1-or-later AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
                     file://include/urcu/urcu.h;beginline=1;endline=18;md5=d35fe8cc2613ca70e0a624ed8bf6fef9 \
                     file://include/urcu/uatomic/x86.h;beginline=1;endline=6;md5=358d69272ba7b5f85e29e342430d440c \
diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/lz4/lz4_1.10.0.bb
index fae5796c2b..61a7237f83 100644
--- a/meta/recipes-support/lz4/lz4_1.10.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 HOMEPAGE = "https://github.com/lz4/lz4"
 
-LICENSE = "BSD-2-Clause | GPL-2.0-or-later"
+LICENSE = "BSD-2-Clause OR GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=5cd5f851b52ec832b10eedb3f01f885a \
                     file://programs/COPYING;md5=492daf447d6db0e5eb344a7922e7ec25 \
                     file://LICENSE;md5=c111c47e301c2ffe8776729b40b44477 \
diff --git a/meta/recipes-support/nettle/nettle_4.0.bb b/meta/recipes-support/nettle/nettle_4.0.bb
index c66677c08a..0e05804057 100644
--- a/meta/recipes-support/nettle/nettle_4.0.bb
+++ b/meta/recipes-support/nettle/nettle_4.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "It tries to solve a problem of providing a common set of \
 cryptographic algorithms for higher-level applications by implementing a \
 context-independent set of cryptographic algorithms"
 SECTION = "libs"
-LICENSE = "LGPL-3.0-or-later | GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later OR LGPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=3000208d539ec061b899bce1d9ce9404 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-support/numactl/numactl_2.0.19.bb b/meta/recipes-support/numactl/numactl_2.0.19.bb
index 38c09199c3..5fd35f1770 100644
--- a/meta/recipes-support/numactl/numactl_2.0.19.bb
+++ b/meta/recipes-support/numactl/numactl_2.0.19.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://oss.sgi.com/projects/libnuma/"
 DESCRIPTION = "Simple NUMA policy support. It consists of a numactl program \
 to run other programs with a specific NUMA policy and a libnuma to do \
 allocations with NUMA policy in applications."
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 SECTION = "apps"
 
 inherit autotools-brokensep ptest
diff --git a/meta/recipes-support/re2c/re2c_4.5.1.bb b/meta/recipes-support/re2c/re2c_4.5.1.bb
index ee3774017f..ad33ef6a0b 100644
--- a/meta/recipes-support/re2c/re2c_4.5.1.bb
+++ b/meta/recipes-support/re2c/re2c_4.5.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A free and open-source lexer generator for C, C++ and Go. It comp
 HOMEPAGE = "http://re2c.org/"
 BUGTRACKER = "https://github.com/skvadrik/re2c/issues"
 SECTION = "devel"
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
diff --git a/meta/recipes-support/taglib/taglib_2.3.bb b/meta/recipes-support/taglib/taglib_2.3.bb
index b29f28702d..26839cdbdb 100644
--- a/meta/recipes-support/taglib/taglib_2.3.bb
+++ b/meta/recipes-support/taglib/taglib_2.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Library for reading and editing the meta-data of popular audio format
 DESCRIPTION = "Platform-independent library (tested on Windows/Linux) for reading and writing metadata in media files, including video, audio, and photo formats. This is a convenient one-stop-shop to present or tag all your media collection, regardless of which format/container these might use. You can read/write the standard or more common tags/properties of a media, or you can also create and retrieve your own custom tags."
 SECTION = "libs/multimedia"
 HOMEPAGE = "http://taglib.github.io/"
-LICENSE = "LGPL-2.1-only | MPL-1.1"
+LICENSE = "LGPL-2.1-only OR MPL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
                     file://taglib/audioproperties.h;beginline=1;endline=24;md5=9df2c7399519b7310568a7c55042ecee"
diff --git a/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb b/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
index 80da59bf90..c2ad0939a1 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = " UTF-8 with C++ in a Portable Way"
 HOMEPAGE = "https://github.com/nemtrif/utfcpp"
 
-LICENSE = "BSL-1.0 & MIT"
+LICENSE = "BSL-1.0 AND MIT"
 LICENSE:${PN} = "BSL-1.0"
-LICENSE:${PN}-ptest = "BSL-1.0 & MIT"
+LICENSE:${PN}-ptest = "BSL-1.0 AND MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
                     file://tests/ftest.h;endline=25;md5=d33c6488d3b003723a5f17ac984db030"
diff --git a/meta/recipes-support/vte/vte_0.84.0.bb b/meta/recipes-support/vte/vte_0.84.0.bb
index 70cc6b3c99..43aa280c56 100644
--- a/meta/recipes-support/vte/vte_0.84.0.bb
+++ b/meta/recipes-support/vte/vte_0.84.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Virtual terminal emulator GTK+ widget library"
 DESCRIPTION = "VTE provides a virtual terminal widget for GTK applications."
 HOMEPAGE = "https://wiki.gnome.org/Apps/Terminal/VTE"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
-LICENSE = "GPL-3.0-only & LGPL-3.0-or-later & MIT"
+LICENSE = "GPL-3.0-only AND LGPL-3.0-or-later AND MIT"
 LICENSE:libvte = "LGPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = " \
diff --git a/meta/recipes-support/xxhash/xxhash_0.8.3.bb b/meta/recipes-support/xxhash/xxhash_0.8.3.bb
index 15436113b1..75b34bb0a2 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.3.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Extremely fast non-cryptographic hash algorithm"
 DESCRIPTION = "xxHash is an extremely fast non-cryptographic hash algorithm, \
 working at speeds close to RAM limits."
 HOMEPAGE = "http://www.xxhash.com/"
-LICENSE = "BSD-2-Clause & GPL-2.0-only"
+LICENSE = "BSD-2-Clause AND GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13be6b481ff5616f77dda971191bb29b \
                     file://cli/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
-- 
2.54.0


