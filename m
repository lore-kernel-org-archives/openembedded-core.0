Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EB3C7115A
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:50:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.26721.1750067413993495222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A/Atd1MH;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so52903005e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750067412; x=1750672212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6rVLMvGTcYsaQqIQI1at87etZ9rbItVLT9xMyuJGnc=;
        b=A/Atd1MH4Rjhw5E295moslNCOqdOxriBSaGNFV/7yWhKYg32vaGMr5TkaNI6grtEv/
         wwhBLtB4YxCe5/5S9IZH3jiDNpkn5L/JybXOtFCqmOIODdFT0KSuQrWQCiartQEBaZBk
         ZOenHO8utPzonnfQi7HC6sAf7SeF2y9N/9Qb0iUsLL+I57inFqkQ17BaaDSnspeAVDod
         KWaBEpG2Dh3tH86jkUWqGXz3obft+e7SA6edkdYEPZu1Ua4ZXeRD4B5OBwTNWg6dWTzI
         671hjPFZICObv7khYe+sLluQynNobptiZCKgOLDtFFBfcEM5WPx2zTwGyRNHh/shtNoU
         YAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067412; x=1750672212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6rVLMvGTcYsaQqIQI1at87etZ9rbItVLT9xMyuJGnc=;
        b=GO+LK7uR5X+aYaO9U3QanQqDCYbUJOw52F82hd65V0tTR9M9guLfGHbZNv8P2lkUPC
         ErorKPoM8CgArHxtnaD4ZtVejjD9oPS/hf0EglFJWSyYI2yWT8myYlCUHmsPLm7Y7ZOJ
         cpvF9gLcfiP8BK7ixGLqoN+JFn+luu9jKOpMMXBNbgdyXI/DApwQpiBNbEcVtQTwAk09
         YeorXm7/c8NrHZEVfIPuKgZJv+i/6upgaKk+axa6EdnjlskpjN9kajaLcQFO/rdBdLaF
         by55KcgKKKASGK8gtZeJROof6aiQ2LHqY+Q4fdHEO5Rm/L/RUlxShTzHcqh2UWNYcLtc
         jq6g==
X-Gm-Message-State: AOJu0YyLioxBFb7PSEm+3P2ZIZ0eESyN7WsP17/sWKsoH1CgDy6e3BlD
	NFk8gmLjsxFMfTRV7k3/Seme54CWg1N2J3T8gDtJWNeWSQDgSBL5FoloPDkM/Q==
X-Gm-Gg: ASbGncsgIA8wII6tXsiaOP6PPgUF4znznk1TClzrw3EpkeJMKMbLyjqZC8vZaH5tuzk
	7a+8kKt0qeinN6lcSZS8MszxEqMRagGRJV3RfNiG03T5ytyfQCX+Ic1/djebaWLk9nCsPq5Z9ny
	VBk6CgEk2hVjW0/WEGKfizaMbf5GnrWAbZjP5gmyciV33Tm8FcEOxR60sxsBfdjlNQ/5LnvUMIn
	RfzlhDd8dVrKkrugpCTDKoLh8pGtUM2UiLje9VFZ8PBcMZbNx5ieXsU4KxXXj9g8nmcSphumkZX
	WpI1QHUjGFF9Bl449DeH4qUM4tbqH0U/vi9y6EsMCt7lBy7DC/pelSYSX7XEmhUPLfbnjaDJK1f
	lINRj8bSEUlu4zvW/YHhh5oc=
X-Google-Smtp-Source: AGHT+IFEuo/1ZkCqU39uwkHR0jxzGiYgnxWs0SnAKBMCHeKf6Zq5zcnTkVHDP9iuDIoYBi1CQ92nRA==
X-Received: by 2002:a05:600c:a42:b0:453:608:a18b with SMTP id 5b1f17b1804b1-4533ca54d23mr92038235e9.9.1750067411250;
        Mon, 16 Jun 2025 02:50:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4533fa7a9a8sm72811805e9.23.2025.06.16.02.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/10] meta: remove consecutive blank lines
Date: Mon, 16 Jun 2025 11:50:00 +0200
Message-Id: <20250616095000.2918921-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616095000.2918921-1-alex.kanavin@gmail.com>
References: <20250616095000.2918921-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218808

From: Alexander Kanavin <alex@linutronix.de>

Some of them were introduced by mass-removal of S = WORKDIR/git assignments;
rather than try to fix up (or redo) just these, I've run this sed command over
the whole tree:

sed -i -z -E 's/([ \t\f\v\r]*\n){3,}/\n\n/g' `find . -name *.bb -o -name *.inc`

The rationale is that more than one empty line is wasting vertical screen space, and
does nothing for readability.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb   | 1 -
 .../recipes-devtools/python/python3-guessing-game_git.bb       | 1 -
 .../python/python3-guessing-game_git.bb.upgraded               | 1 -
 .../recipes-extended/sysdig/sysdig-selftest_0.28.0.bb          | 1 -
 .../recipes-test/devtool/devtool-upgrade-test2_git.bb          | 1 -
 .../recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded | 1 -
 .../recipes-test/git-submodule-test/git-submodule-test.bb      | 1 -
 meta/conf/distro/include/tclibc-picolibc.inc                   | 1 -
 meta/conf/machine/include/mips/tune-mips-24k.inc               | 3 ---
 meta/conf/machine/include/mips/tune-mips-74k.inc               | 1 -
 meta/conf/machine/include/mips/tune-octeon.inc                 | 1 -
 meta/recipes-bsp/efibootmgr/efibootmgr_18.bb                   | 1 -
 meta/recipes-bsp/efivar/efivar_39.bb                           | 1 -
 meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb                      | 1 -
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb                    | 1 -
 meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb                   | 1 -
 meta/recipes-bsp/u-boot/u-boot.inc                             | 1 -
 meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb    | 1 -
 meta/recipes-connectivity/connman/connman-conf.bb              | 1 -
 meta/recipes-connectivity/connman/connman-gnome_0.7.bb         | 1 -
 meta/recipes-connectivity/inetutils/inetutils_2.6.bb           | 1 -
 meta/recipes-connectivity/libuv/libuv_1.51.0.bb                | 1 -
 meta/recipes-connectivity/neard/neard_0.19.bb                  | 1 -
 meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb        | 1 -
 meta/recipes-connectivity/slirp/libslirp_4.9.1.bb              | 1 -
 meta/recipes-core/busybox/busybox-inittab_1.37.0.bb            | 1 -
 meta/recipes-core/dbus-wait/dbus-wait_git.bb                   | 1 -
 meta/recipes-core/dbus/dbus_1.16.2.bb                          | 1 -
 meta/recipes-core/fts/fts_1.2.7.bb                             | 1 -
 meta/recipes-core/gettext/gettext_0.23.1.bb                    | 1 -
 meta/recipes-core/glibc/cross-localedef-native_2.41.bb         | 1 -
 meta/recipes-core/glibc/ldconfig-native_2.12.1.bb              | 1 -
 meta/recipes-core/ifupdown/ifupdown_0.8.44.bb                  | 2 --
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb     | 1 -
 .../initrdscripts/initramfs-module-install-efi_1.0.bb          | 1 -
 .../recipes-core/initrdscripts/initramfs-module-install_1.0.bb | 1 -
 .../initrdscripts/initramfs-module-setup-live_1.0.bb           | 1 -
 meta/recipes-core/initscripts/init-system-helpers_1.68.bb      | 1 -
 meta/recipes-core/libxcrypt/libxcrypt.inc                      | 1 -
 meta/recipes-core/meta/cve-update-db-native.bb                 | 1 -
 meta/recipes-core/meta/meta-toolchain.bb                       | 1 -
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb      | 1 -
 meta/recipes-core/meta/signing-keys.bb                         | 1 -
 meta/recipes-core/meta/uninative-tarball.bb                    | 1 -
 meta/recipes-core/musl/gcompat_git.bb                          | 1 -
 meta/recipes-core/musl/libc-test_git.bb                        | 1 -
 meta/recipes-core/musl/libucontext_1.3.2.bb                    | 1 -
 meta/recipes-core/musl/musl-locales_git.bb                     | 1 -
 meta/recipes-core/musl/musl-obstack.bb                         | 1 -
 meta/recipes-core/musl/musl-utils.bb                           | 1 -
 meta/recipes-core/musl/musl_git.bb                             | 1 -
 meta/recipes-core/ncurses/ncurses.inc                          | 2 --
 meta/recipes-core/newlib/newlib.inc                            | 1 -
 meta/recipes-core/ovmf/ovmf_git.bb                             | 2 --
 meta/recipes-core/packagegroups/packagegroup-base.bb           | 1 -
 .../packagegroups/packagegroup-core-tools-debug.bb             | 1 -
 .../packagegroups/packagegroup-core-tools-profile.bb           | 1 -
 .../packagegroups/packagegroup-core-tools-testapps.bb          | 1 -
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb    | 2 --
 meta/recipes-core/picolibc/picolibc_git.bb                     | 1 -
 meta/recipes-core/psplash/psplash_git.bb                       | 1 -
 meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb               | 1 -
 meta/recipes-core/systemd/systemd-compat-units.bb              | 1 -
 meta/recipes-core/systemd/systemd-machine-units_1.0.bb         | 1 -
 meta/recipes-core/systemd/systemd.inc                          | 1 -
 meta/recipes-core/systemd/systemd_257.5.bb                     | 2 --
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb         | 1 -
 meta/recipes-core/ttyrun/ttyrun_2.37.0.bb                      | 1 -
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb               | 1 -
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb          | 1 -
 meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb          | 1 -
 meta/recipes-devtools/clang/clang_git.bb                       | 1 -
 meta/recipes-devtools/clang/compiler-rt_git.bb                 | 1 -
 meta/recipes-devtools/clang/llvm-project-source.inc            | 1 -
 meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb       | 1 -
 meta/recipes-devtools/dnf/dnf_4.22.0.bb                        | 1 -
 meta/recipes-devtools/dpkg/dpkg.inc                            | 1 -
 meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb         | 1 -
 meta/recipes-devtools/fmt/fmt_11.2.0.bb                        | 1 -
 meta/recipes-devtools/gcc/gcc-configure-common.inc             | 1 -
 meta/recipes-devtools/gcc/gcc-cross-canadian_15.1.bb           | 2 --
 meta/recipes-devtools/gcc/gcc-cross.inc                        | 1 -
 meta/recipes-devtools/gcc/gcc-multilib-config.inc              | 3 ---
 meta/recipes-devtools/gcc/libgcc-common.inc                    | 1 -
 meta/recipes-devtools/gcc/libgcc.inc                           | 1 -
 meta/recipes-devtools/go/go-cross-canadian.inc                 | 1 -
 meta/recipes-devtools/libcomps/libcomps_0.1.21.bb              | 1 -
 meta/recipes-devtools/libdnf/libdnf_0.74.0.bb                  | 1 -
 meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb        | 1 -
 meta/recipes-devtools/librepo/librepo_1.19.0.bb                | 1 -
 meta/recipes-devtools/mmc/mmc-utils_git.bb                     | 1 -
 meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb                   | 1 -
 meta/recipes-devtools/ninja/ninja_1.12.1.bb                    | 1 -
 meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb           | 1 -
 meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb             | 1 -
 meta/recipes-devtools/opkg/opkg_0.7.0.bb                       | 1 -
 meta/recipes-devtools/patchelf/patchelf_0.18.0.bb              | 1 -
 meta/recipes-devtools/perl/perl_5.40.2.bb                      | 1 -
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb               | 1 -
 meta/recipes-devtools/pseudo/pseudo.inc                        | 1 -
 meta/recipes-devtools/python/python3-calver_2025.04.17.bb      | 1 -
 meta/recipes-devtools/python/python3-dtc_1.7.2.bb              | 1 -
 meta/recipes-devtools/python/python3-mako_1.3.10.bb            | 2 --
 meta/recipes-devtools/python/python3-psutil_7.0.0.bb           | 1 -
 .../python/python3-unittest-automake-output_0.2.bb             | 1 -
 meta/recipes-devtools/python/python3_3.13.4.bb                 | 1 -
 meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb        | 2 --
 meta/recipes-devtools/qemu/qemu.inc                            | 1 -
 meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb            | 1 -
 meta/recipes-devtools/repo/repo_2.55.bb                        | 1 -
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb               | 1 -
 meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb         | 2 --
 meta/recipes-devtools/rpm/rpm_4.20.1.bb                        | 1 -
 meta/recipes-devtools/rust/cargo_1.86.0.bb                     | 1 -
 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb     | 1 -
 meta/recipes-devtools/strace/strace_6.15.bb                    | 1 -
 .../systemd-bootchart/systemd-bootchart_235.bb                 | 2 --
 meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb             | 1 -
 meta/recipes-extended/acpica/acpica_20240827.bb                | 1 -
 meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb              | 1 -
 .../baremetal-example/baremetal-helloworld_git.bb              | 2 --
 meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb       | 1 -
 meta/recipes-extended/hdparm/hdparm_9.65.bb                    | 1 -
 meta/recipes-extended/iputils/iputils_20250605.bb              | 1 -
 meta/recipes-extended/libnsl/libnsl2_2.0.1.bb                  | 1 -
 meta/recipes-extended/libnss-nis/libnss-nis.bb                 | 1 -
 meta/recipes-extended/libsolv/libsolv_0.7.32.bb                | 1 -
 meta/recipes-extended/lsof/lsof_4.99.4.bb                      | 1 -
 meta/recipes-extended/ltp/ltp_20250130.bb                      | 1 -
 meta/recipes-extended/mdadm/mdadm_4.4.bb                       | 1 -
 meta/recipes-extended/net-tools/net-tools_2.10.bb              | 1 -
 meta/recipes-extended/procps/procps_4.0.5.bb                   | 1 -
 meta/recipes-extended/psmisc/psmisc_23.7.bb                    | 1 -
 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb             | 1 -
 meta/recipes-extended/scdoc/scdoc_1.11.3.bb                    | 1 -
 meta/recipes-extended/shadow/shadow-securetty_4.6.bb           | 1 -
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb             | 1 -
 meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb               | 1 -
 meta/recipes-extended/which/which_2.21.bb                      | 1 -
 meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb                | 1 -
 meta/recipes-extended/zip/zip_3.0.bb                           | 1 -
 meta/recipes-extended/zstd/zstd_1.5.7.bb                       | 1 -
 meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb               | 1 -
 meta/recipes-gnome/libsecret/libsecret_0.21.6.bb               | 1 -
 meta/recipes-graphics/cairo/cairo_1.18.4.bb                    | 1 -
 meta/recipes-graphics/graphene/graphene_1.10.8.bb              | 1 -
 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb      | 1 -
 meta/recipes-graphics/kmscube/kmscube_git.bb                   | 1 -
 meta/recipes-graphics/libfakekey/libfakekey_git.bb             | 1 -
 meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb          | 1 -
 meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb | 1 -
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb         | 1 -
 meta/recipes-graphics/mesa/mesa.inc                            | 1 -
 meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb     | 1 -
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb   | 1 -
 meta/recipes-graphics/piglit/piglit_git.bb                     | 1 -
 meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb     | 1 -
 .../startup-notification/startup-notification_0.12.bb          | 2 --
 meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb     | 1 -
 meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb       | 1 -
 meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb        | 1 -
 meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb         | 1 -
 .../vulkan/vulkan-utility-libraries_1.4.313.0.bb               | 1 -
 .../vulkan/vulkan-validation-layers_1.4.313.0.bb               | 1 -
 meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb          | 1 -
 meta/recipes-graphics/wayland/weston_14.0.1.bb                 | 1 -
 .../xcursor-transparent-theme/xcursor-transparent-theme_git.bb | 1 -
 .../xinput-calibrator/pointercal-xinput_0.0.bb                 | 1 -
 .../xinput-calibrator/xinput-calibrator_0.8.0.bb               | 1 -
 meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb                | 1 -
 meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb                | 1 -
 meta/recipes-graphics/xorg-lib/xcb-util-keysyms_0.4.1.bb       | 1 -
 meta/recipes-kernel/blktrace/blktrace_1.3.0.bb                 | 1 -
 meta/recipes-kernel/cryptodev/cryptodev.inc                    | 1 -
 meta/recipes-kernel/dtc/dtc_1.7.2.bb                           | 1 -
 .../kernel-signing-keys/kernel-signing-keys-native.bb          | 2 --
 meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb       | 1 -
 meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb  | 3 ---
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc               | 1 -
 meta/recipes-kernel/linux/linux-dummy.bb                       | 2 --
 meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb                 | 1 -
 meta/recipes-kernel/lttng/babeltrace_1.5.11.bb                 | 1 -
 meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb         | 1 -
 meta/recipes-kernel/perf/perf.bb                               | 1 -
 meta/recipes-kernel/powertop/powertop_2.15.bb                  | 1 -
 meta/recipes-kernel/systemtap/systemtap_git.inc                | 1 -
 meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb              | 1 -
 meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb           | 1 -
 meta/recipes-multimedia/x264/x264_git.bb                       | 1 -
 meta/recipes-sato/l3afpad/l3afpad_git.bb                       | 1 -
 .../matchbox-config-gtk/matchbox-config-gtk_0.2.bb             | 1 -
 meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb     | 1 -
 meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb | 2 --
 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb    | 1 -
 meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb   | 1 -
 meta/recipes-sato/puzzles/puzzles_git.bb                       | 1 -
 meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb       | 1 -
 meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb       | 1 -
 meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb     | 1 -
 meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb         | 1 -
 meta/recipes-support/apr/apr-util_1.6.3.bb                     | 1 -
 meta/recipes-support/boost/boost-build-native_1.87.0.bb        | 1 -
 meta/recipes-support/debianutils/debianutils_5.22.bb           | 2 --
 meta/recipes-support/gdbm/gdbm_1.24.bb                         | 1 -
 .../gnome-desktop-testing/gnome-desktop-testing_2021.1.bb      | 1 -
 meta/recipes-support/hwdata/hwdata_0.395.bb                    | 1 -
 meta/recipes-support/iso-codes/iso-codes_4.18.0.bb             | 1 -
 meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb  | 1 -
 meta/recipes-support/libfm/libfm_1.3.2.bb                      | 1 -
 meta/recipes-support/libgit2/libgit2_1.9.0.bb                  | 1 -
 meta/recipes-support/libgpg-error/libgpg-error_1.55.bb         | 1 -
 meta/recipes-support/libseccomp/libseccomp_2.6.0.bb            | 1 -
 meta/recipes-support/liburcu/liburcu_0.15.3.bb                 | 1 -
 meta/recipes-support/lz4/lz4_1.10.0.bb                         | 1 -
 meta/recipes-support/lzo/lzo_2.10.bb                           | 1 -
 meta/recipes-support/numactl/numactl_2.0.19.bb                 | 1 -
 meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb      | 1 -
 meta/recipes-support/rng-tools/rng-tools_6.17.bb               | 1 -
 meta/recipes-support/sass/libsass_3.6.6.bb                     | 1 -
 meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb  | 1 -
 meta/recipes-support/utfcpp/utfcpp_4.0.6.bb                    | 1 -
 meta/recipes-support/vim/vim.inc                               | 1 -
 meta/recipes-support/xxhash/xxhash_0.8.3.bb                    | 1 -
 223 files changed, 245 deletions(-)

diff --git a/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
index e87e8f15b3e..82019e22247 100644
--- a/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
+++ b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
            file://0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch \
            "
 
-
 # xattr support creates an additional compile-time dependency on acl because
 # the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
 # regardless whether acl is enabled or disabled in the distro should be okay.
diff --git a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb
index b600c24daf4..12afec8b1bd 100644
--- a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb
+++ b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://git.yoctoproject.org/guessing-game.git;protocol=https;branch=ma
 PV = "0.1.0"
 SRCREV = "469c9e2230ca4fa9e391c94be6e697733e769500"
 
-
 inherit python_maturin cargo-update-recipe-crates
 
 require ${BPN}-crates.inc
diff --git a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded
index 69339956cc9..194a8efe83d 100644
--- a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded
+++ b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded
@@ -12,7 +12,6 @@ SRC_URI = "git://git.yoctoproject.org/guessing-game.git;protocol=https;branch=ma
 PV = "0.2.0"
 SRCREV = "40cf004c2772ffa20ea803fa3be1528a75be3e98"
 
-
 inherit python_maturin cargo-update-recipe-crates
 
 require ${BPN}-crates.inc
diff --git a/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb b/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
index fc5e0ee3eca..ea9a78dd1bf 100644
--- a/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
+++ b/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
@@ -32,7 +32,6 @@ SRCREV_falco = "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
 
 SRCREV_FORMAT = "sysdig_falco"
 
-
 EXTRA_OECMAKE = "\
                 -DBUILD_DRIVER=OFF \
                 -DMINIMAL_BUILD=ON \
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 24ca32f86f8..66d66e95e29 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
-
 EXCLUDE_FROM_WORLD = "1"
 
 inherit autotools pkgconfig
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
index 63bfed8a7af..d3256ef5df8 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
@@ -14,7 +14,6 @@ SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
-
 EXCLUDE_FROM_WORLD = "1"
 
 inherit autotools pkgconfig
diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
index 055657b239a..1c0886dcbe2 100644
--- a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
+++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
@@ -10,7 +10,6 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
 SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
 
-
 do_test_git_as_user() {
     cd ${S}
     git status
diff --git a/meta/conf/distro/include/tclibc-picolibc.inc b/meta/conf/distro/include/tclibc-picolibc.inc
index 203765dfcb9..2cd26cfd7dc 100644
--- a/meta/conf/distro/include/tclibc-picolibc.inc
+++ b/meta/conf/distro/include/tclibc-picolibc.inc
@@ -37,4 +37,3 @@ TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove = "zlib ncurses"
 SECURITY_CFLAGS:libc-picolibc:qemuriscv32 = "${SECURITY_NOPIE_CFLAGS}"
 SECURITY_CFLAGS:libc-picolibc:qemuriscv64 = "${SECURITY_NOPIE_CFLAGS}"
 
-
diff --git a/meta/conf/machine/include/mips/tune-mips-24k.inc b/meta/conf/machine/include/mips/tune-mips-24k.inc
index ec4e53f63f1..5dc2a8a115d 100644
--- a/meta/conf/machine/include/mips/tune-mips-24k.inc
+++ b/meta/conf/machine/include/mips/tune-mips-24k.inc
@@ -5,13 +5,11 @@ MIPSPKGSFX_MIPS16E ??= ""
 require conf/machine/include/mips/tune-mips32r2.inc
 require conf/machine/include/mips/feature-mips-mips16e.inc
 
-
 TUNEVALID[24kc] = "Enable MIPS 24Kc processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "24kc", " -mtune=24kc", "", d)}"
 TUNEVALID[24kec] = "Enable MIPS 24KEc processor optimizations, including DSP"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "24kec", " -mtune=24kec -mdsp", "", d)}"
 
-
 AVAILTUNES += "mips32r2-24kc   mips32r2-24kec   mips32r2-24kec-m16"
 AVAILTUNES += "mips32r2el-24kc mips32r2el-24kec mips32r2el-24kec-m16"
 
@@ -32,7 +30,6 @@ MIPSPKGSFX_VARIANT:tune-mips32r2-24kec-m16 = "mips32r2-24kec${MIPSPKGSFX_MIPS16E
 PACKAGE_EXTRA_ARCHS:tune-mips32r2-24kec-m16 = "${PACKAGE_EXTRA_ARCHS:tune-mips32r2-24kec} mips32r2-24kec-m16-nf"
 QEMU_EXTRAOPTIONS:tune-mips32r2-24kec-m16-nf = " -cpu 24KEc"
 
-
 # little endian: kc, kc+dsp=kec, kc+dsp+mips16e=kec-m16
 TUNE_FEATURES:tune-mips32r2el-24kc = "${TUNE_FEATURES:tune-mips32r2el-nf} 24kc"
 TUNE_FEATURES:tune-mips32r2el-24kec = "${TUNE_FEATURES:tune-mips32r2el-nf} 24kec"
diff --git a/meta/conf/machine/include/mips/tune-mips-74k.inc b/meta/conf/machine/include/mips/tune-mips-74k.inc
index 0ec90ca0760..e328b3b4901 100644
--- a/meta/conf/machine/include/mips/tune-mips-74k.inc
+++ b/meta/conf/machine/include/mips/tune-mips-74k.inc
@@ -5,7 +5,6 @@ MIPSPKGSFX_MIPS16E ??= ""
 require conf/machine/include/mips/tune-mips32r2.inc
 require conf/machine/include/mips/feature-mips-mips16e.inc
 
-
 TUNEVALID[74kc] = "Enable MIPS 74K with DSPr2 processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "74kc", " -mtune=74kc", "", d)}"
 
diff --git a/meta/conf/machine/include/mips/tune-octeon.inc b/meta/conf/machine/include/mips/tune-octeon.inc
index d4670e3259d..0004190c342 100644
--- a/meta/conf/machine/include/mips/tune-octeon.inc
+++ b/meta/conf/machine/include/mips/tune-octeon.inc
@@ -17,7 +17,6 @@ BASE_LIB:tune-octeon2_64 = "lib64"
 MIPSPKGSFX_VARIANT:tune-octeon2_64 = "octeon2_64"
 PACKAGE_EXTRA_ARCHS:tune-octeon2_64 = "mips64 octeon2_64"
 
-
 TUNEVALID[octeon3] = "Enable optimization related to octeon3 support"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'octeon3', ' -march=octeon3 ', '',d)}"
 
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
index 444cd53fdd1..6f4178216b0 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
@@ -13,7 +13,6 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https;branch=main"
 SRCREV = "c3f9f0534e32158f62c43564036878b93b9e0fd6"
 
-
 inherit pkgconfig
 
 # The directory under the ESP that the default bootloader is found in.  When
diff --git a/meta/recipes-bsp/efivar/efivar_39.bb b/meta/recipes-bsp/efivar/efivar_39.bb
index 7c8e9ac43df..fb6b6b3821a 100644
--- a/meta/recipes-bsp/efivar/efivar_39.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            "
 SRCREV = "c47820c37ac26286559ec004de07d48d05f3308c"
 
-
 inherit pkgconfig
 
 export CCLD_FOR_BUILD = "${BUILD_CCLD}"
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb
index d0be55559b9..10a4ab6800a 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb
@@ -20,7 +20,6 @@ SRC_URI = "git://github.com/ncroxon/gnu-efi;protocol=https;branch=master \
            "
 SRCREV = "00cdfa66e923ab2f6683bb52cab0d0d1a9083b16"
 
-
 # llvm-objcopy fails
 # arm-poky-linux-gnueabi-llvm-objcopy: error: 't8.so': section '.dynstr' cannot be removed because it is referenced by the section '.dynamic'
 OBJCOPY:toolchain-clang = "${HOST_PREFIX}objcopy"
diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index b252ae45d26..8756511c17a 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -6,7 +6,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/pm-pmu.c;beginline=1;endline=22;md5=3c1ddbc54e735fb4a0386e14c78a3147"
 
-
 SRC_URI = "http://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4370c0b"
diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
index ef74967b813..35678e2361f 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
@@ -13,7 +13,6 @@ SECTION = "libs"
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master"
 SRCREV = "5507339628b5caf244e1ff9d58cb3fa534b16beb"
 
-
 inherit cmake lib_package
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 9464736b841..8720bbcda11 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -309,7 +309,6 @@ do_deploy () {
         fi
     fi
 
-
      if [ -n "${SPL_BINARY}" ]
      then
         if [ -n "${UBOOT_CONFIG}" ]
diff --git a/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb b/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
index b37cd51ad19..d45c06357db 100644
--- a/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
+++ b/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/lathiat/nss-mdns;branch=master;protocol=https \
 
 SRCREV = "4b3cfe818bf72d99a02b8ca8b8813cb2d6b40633"
 
-
 inherit autotools pkgconfig
 
 COMPATIBLE_HOST:libc-musl = 'null'
diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index a787232476e..854e1f1f294 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -4,7 +4,6 @@ network interface inside qemu machines."
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
-
 SRC_URI = "file://main.conf \
           "
 
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index ab691b6580e..8bfc1540b3c 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://github.com/connectivity/connman-gnome.git;branch=master;protoco
            file://0001-Port-to-Gtk3.patch \
           "
 
-
 inherit autotools-brokensep gtk-icon-cache pkgconfig features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
index ef453d3bb24..6e03195f2d2 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
@@ -165,7 +165,6 @@ ALTERNATIVE_LINK_NAME[ping]   = "${base_bindir}/ping"
 ALTERNATIVE:${PN}-ping6 = "${@bb.utils.filter('PACKAGECONFIG', 'ping6', d)}"
 ALTERNATIVE_LINK_NAME[ping6]  = "${base_bindir}/ping6"
 
-
 FILES:${PN}-dbg += "${base_bindir}/.debug ${base_sbindir}/.debug ${bindir}/.debug ${sbindir}/.debug"
 FILES:${PN}-ping = "${base_bindir}/ping.${BPN}"
 FILES:${PN}-ping6 = "${base_bindir}/ping6.${BPN}"
diff --git a/meta/recipes-connectivity/libuv/libuv_1.51.0.bb b/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
index ea3a858da46..9ff9cf35e2e 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
@@ -10,7 +10,6 @@ SRCREV = "5152db2cbfeb5582e9c27c5ea1dba2cd9e10759b"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-
 inherit autotools
 
 do_configure() {
diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes-connectivity/neard/neard_0.19.bb
index ab52ab8b6ca..41c7e55f443 100644
--- a/meta/recipes-connectivity/neard/neard_0.19.bb
+++ b/meta/recipes-connectivity/neard/neard_0.19.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=https;bra
 
 SRCREV = "a1dc8a75cba999728e154a0f811ab9dd50c809f7"
 
-
 inherit autotools pkgconfig systemd update-rc.d
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
index b64c694332c..c10c57267ab 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=un
 
 SRCREV = "ab766fa31f7939f6d879123236b4275320b7ff64"
 
-
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/"
diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
index 2c6b5f06dc4..9f7005d7098 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
 SRCREV = "9c744e1e52aa0d9646ed91d789d588696292c21e"
 
-
 DEPENDS = "glib-2.0"
 
 inherit meson pkgconfig
diff --git a/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb
index 3bdec248de4..8b46b5763e2 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb
@@ -48,7 +48,6 @@ EOF
 
 }
 
-
 # SERIAL_CONSOLES is generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index b25ee6b6a35..c6a9abde63d 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -13,5 +13,4 @@ PV = "0.1+git"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 inherit autotools pkgconfig
diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus/dbus_1.16.2.bb
index caff4c079bb..65f7028b4f4 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -148,7 +148,6 @@ do_install:append:class-target() {
 		ln -fs ../dbus.service ${D}${systemd_system_unitdir}/multi-user.target.wants/dbus.service
 	fi
 
-
 	mkdir -p ${D}${localstatedir}/lib/dbus
 
 	chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts_1.2.7.bb
index 399907ab9a8..699dc5ddd39 100644
--- a/meta/recipes-core/fts/fts_1.2.7.bb
+++ b/meta/recipes-core/fts/fts_1.2.7.bb
@@ -12,7 +12,6 @@ SRCREV = "0bde52df588e8969879a2cae51c3a4774ec62472"
 
 SRC_URI = "git://github.com/pullmoll/musl-fts.git;branch=master;protocol=https"
 
-
 inherit autotools pkgconfig
 #
 # We will skip parsing for non-musl systems
diff --git a/meta/recipes-core/gettext/gettext_0.23.1.bb b/meta/recipes-core/gettext/gettext_0.23.1.bb
index cbc3e48890e..c704a3b6d7e 100644
--- a/meta/recipes-core/gettext/gettext_0.23.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.23.1.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'libxml', '',
 # without glib in PACKAGECONFIG vendor copy of the lib will be used
 LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'glib', '', 'file://libtextstyle/lib/glib/ghash.c;md5=e3159f5ac38dfe77af5cc0ee104dab2d;beginline=10;endline=27', d)}"
 
-
 DEPENDS = "gettext-native virtual/libiconv"
 DEPENDS:class-native = "gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.41.bb b/meta/recipes-core/glibc/cross-localedef-native_2.41.bb
index 924020343dd..95acb3fc561 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.41.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.41.bb
@@ -37,7 +37,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
 #
 SRCREV_FORMAT = "glibc_localedef"
 
-
 EXTRA_OECONF = "--with-glibc=${S}"
 
 # We do not need bash to run tzselect script, the default is to use
diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
index cd091d0d87f..1c475eeb8aa 100644
--- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
@@ -19,7 +19,6 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
            file://ldconfig-handle-.dynstr-located-in-separate-segment.patch \
 "
 
-
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${P}:"
 
 inherit native
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb
index 500414eb47e..8a8f4773619 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb
@@ -18,8 +18,6 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=mast
            "
 SRCREV = "7d44f9ce6717a4a496fd46f28c52e12dbf5bafdd"
 
-
-
 inherit ptest update-alternatives
 
 do_compile () {
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index a3e4e2a7e97..2ec03bc34c1 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
-
 inherit allarch
 
 SRC_URI = "file://init \
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index 0115741f4c1..02831498991 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 RDEPENDS:${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
 RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
-
 SRC_URI = "file://init-install-efi.sh"
 
 S = "${UNPACKDIR}"
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
index 96fd8310d27..f44c753da0e 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -9,7 +9,6 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
 COMPATIBLE_HOST:armv7a = 'null'
 COMPATIBLE_HOST:armv7ve = 'null'
 
-
 SRC_URI = "file://init-install.sh"
 
 S = "${UNPACKDIR}"
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
index c2ab107980e..3afbd5d47db 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
@@ -3,7 +3,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS:${PN} = "initramfs-framework-base udev-extraconf"
 
-
 inherit allarch
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/initramfs-framework:"
diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.68.bb b/meta/recipes-core/initscripts/init-system-helpers_1.68.bb
index 03a226de56d..48ac7792d35 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.68.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.68.bb
@@ -20,7 +20,6 @@ SRCREV = "78486a4a2a305170b66ce4d907bedadbaed10daf"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))(?!_exp)"
 
-
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 10705586ec4..77fec832348 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -16,7 +16,6 @@ SRCBRANCH ?= "master"
 
 PROVIDES = "virtual/crypt"
 
-
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS:append:class-nativesdk = " -Wno-error"
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 792252f510c..86cd1a1a211 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -393,7 +393,6 @@ def update_db_fkie(conn, jsondata):
             for node in config["nodes"]:
                 parse_node_and_insert(conn, node, cveId, False)
 
-
 def update_db(d, conn, jsondata):
     if (d.getVar("NVD_DB_VERSION") == "FKIE"):
         return update_db_fkie(conn, jsondata)
diff --git a/meta/recipes-core/meta/meta-toolchain.bb b/meta/recipes-core/meta/meta-toolchain.bb
index 260e03934ec..1b108f0a1c5 100644
--- a/meta/recipes-core/meta/meta-toolchain.bb
+++ b/meta/recipes-core/meta/meta-toolchain.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Meta package for building a installable toolchain"
 LICENSE = "MIT"
 
-
 inherit populate_sdk
diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 2813fbc3977..0ba1ca6e426 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -41,7 +41,6 @@ DUMMYPROVIDES = "\
     /usr/bin/perl \
     "
 
-
 require dummy-sdk-package.inc
 
 inherit nativesdk
diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index 107a39d6581..94f40329111 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -4,7 +4,6 @@
 SUMMARY = "Makes public keys of the signing keys available"
 LICENSE = "MIT"
 
-
 inherit allarch deploy
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 0fd01fdb646..0dbc698ccd2 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -51,7 +51,6 @@ fakeroot create_sdk_files() {
 	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
 }
 
-
 fakeroot archive_sdk() {
 	cd ${SDK_OUTPUT}/${SDKPATH}
 
diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index 460f759899e..6f9710e71a5 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -16,7 +16,6 @@ SRC_URI:append:powerpc = "\
 PV = "1.1.0"
 SRCREV = "b7bfe0b08c52fdc72e0c1d9d4dcb2129f1642bd6"
 
-
 inherit pkgconfig linuxloader siteinfo
 
 DEPENDS += "musl-obstack"
diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index bd639e059b3..71a111cfa43 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -18,7 +18,6 @@ SRC_URI = " \
 
 PV = "0+git"
 
-
 # libc-test 'make' or 'make run' command is designed to build and run tests. It
 # reports both build and test failures. The commands should be run on target.
 do_compile() {
diff --git a/meta/recipes-core/musl/libucontext_1.3.2.bb b/meta/recipes-core/musl/libucontext_1.3.2.bb
index 10ebb6bd316..2362cba5c8a 100644
--- a/meta/recipes-core/musl/libucontext_1.3.2.bb
+++ b/meta/recipes-core/musl/libucontext_1.3.2.bb
@@ -12,7 +12,6 @@ SRCREV = "a0323579ac50b9a9d4033754d089f1fed0f59a00"
 SRC_URI = "git://github.com/kaniini/libucontext;branch=master;protocol=https \
            "
 
-
 COMPATIBLE_HOST = ".*-musl.*"
 
 valid_archs = " \
diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-core/musl/musl-locales_git.bb
index d9e68e98830..c8510596cf7 100644
--- a/meta/recipes-core/musl/musl-locales_git.bb
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://git.adelielinux.org/adelie/musl-locales;protocol=https;branch=m
 PV = "1.0+git"
 SRCREV = "5663f5bfd30bf9e1e0ba3fc5fe2da6725969f30e"
 
-
 DEPENDS = "virtual/libintl gettext-native"
 
 PROVIDES = "virtual/libc-locale"
diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
index 23361400c7c..d8a5ae8d825 100644
--- a/meta/recipes-core/musl/musl-obstack.bb
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -16,6 +16,5 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 inherit autotools pkgconfig
 
-
 COMPATIBLE_HOST = ".*-musl.*"
 
diff --git a/meta/recipes-core/musl/musl-utils.bb b/meta/recipes-core/musl/musl-utils.bb
index 05adeb16192..4b685640c84 100644
--- a/meta/recipes-core/musl/musl-utils.bb
+++ b/meta/recipes-core/musl/musl-utils.bb
@@ -17,7 +17,6 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 inherit autotools
 
-
 PACKAGES =+ "${PN}-iconv"
 
 FILES:${PN}-iconv = "${bindir}/iconv"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 1e1a9cc2624..51e429b093c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch \
           "
 
-
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
 
 DEPENDS = "virtual/cross-binutils \
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 1e9ec38ceac..951f96beb51 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -175,7 +175,6 @@ do_install() {
         oe_runmake -C narrowc ${_install_cfgs} \
                 install.data
 
-
         ! ${ENABLE_WIDEC} || \
             oe_runmake -C widec ${_install_cfgs} ${_install_opts}
 
@@ -263,7 +262,6 @@ python populate_packages:prepend () {
         do_split_packages(d, base_libdir, r'^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
 }
 
-
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index 604bef3e24b..a8794dd1d94 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -34,7 +34,6 @@ TARGET_CC_ARCH:append = " -nostdlib"
 # Keep RISC-V 32 using -mcmodel=medlow (symbols lie between -2GB:2GB)
 TARGET_CFLAGS:append:qemuriscv64 = " -mcmodel=medany"
 
-
 EXTRA_OECONF = " \
                 --build=${BUILD_SYS}  \
                 --target=${TARGET_SYS} \
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 0f0f1e09149..aba611e008d 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -16,7 +16,6 @@ PACKAGECONFIG[debug] = ",,,"
 PACKAGECONFIG[secureboot] = ",,,"
 PACKAGECONFIG[tpm] = "-D TPM_ENABLE=TRUE,-D TPM_ENABLE=FALSE,,"
 
-
 # GCC12 trips on it
 #see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools-turn-off-gcc12-warning.patch
 BUILD_CFLAGS += "-Wno-error=stringop-overflow"
@@ -51,7 +50,6 @@ inherit deploy
 
 PARALLEL_MAKE = ""
 
-
 DEPENDS = "nasm-native acpica-native ovmf-native util-linux-native"
 
 EDK_TOOLS_DIR = "edk2_basetools"
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index cb9d1f07af5..e67b4909864 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -72,7 +72,6 @@ RDEPENDS:packagegroup-base = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf', '',d)} \
     "
 
-
 RRECOMMENDS:packagegroup-base = "\
     kernel-module-nls-utf8 \
     kernel-module-input \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index 56ff1d2b069..f19fd64ec15 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -8,7 +8,6 @@ PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
 inherit packagegroup
 
-
 MTRACE = ""
 MTRACE:libc-glibc = "libc-mtrace"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 4e324caa960..54915e4f0c3 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -4,7 +4,6 @@
 
 SUMMARY = "Profiling tools"
 
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index d7ea8e937f4..25561f6878f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -4,7 +4,6 @@
 
 SUMMARY = "Testing tools/applications"
 
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index df71695a97d..c3862677819 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -107,7 +107,6 @@ RDEPENDS:packagegroup-self-hosted-debug = " \
     ${STRACE} \
     tcf-agent"
 
-
 RDEPENDS:packagegroup-self-hosted-extended = "\
     bzip2 \
     chrpath \
@@ -178,7 +177,6 @@ RDEPENDS:packagegroup-self-hosted-extended = "\
     zstd \
     "
 
-
 RDEPENDS:packagegroup-self-hosted-graphics = "\
     adwaita-icon-theme \
     builder \
diff --git a/meta/recipes-core/picolibc/picolibc_git.bb b/meta/recipes-core/picolibc/picolibc_git.bb
index e6735184cd5..eaa6c8de1ec 100644
--- a/meta/recipes-core/picolibc/picolibc_git.bb
+++ b/meta/recipes-core/picolibc/picolibc_git.bb
@@ -28,7 +28,6 @@ PACKAGECONFIG ??= " specsdir"
 # Install GCC specs on libdir
 PACKAGECONFIG[specsdir] = "-Dspecsdir=${libdir},-Dspecsdir=none"
 
-
 FILES:${PN}-dev:append = " ${libdir}/*.specs ${libdir}/*.ld"
 
 # No rpm package is actually created but -dev depends on it, avoid dnf error
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index ba2e097ec19..3be0e26a0c7 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -62,7 +62,6 @@ python __anonymous() {
             d.appendVar("RDEPENDS:%s" % pn, " %s" % ep)
 }
 
-
 inherit autotools pkgconfig update-rc.d update-alternatives systemd
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} progress-bar fullscreen"
diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
index 5e9532868a9..5040d8864e8 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://github.com/linux-ras/sysfsutils.git;protocol=https;branch=maste
 
 SRCREV = "da2f1f8500c0af6663a56ce2bff07f67e60a92e0"
 
-
 inherit autotools
 
 PACKAGES =+ "libsysfs"
diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 187f0d4626e..d6da34e9b80 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -2,7 +2,6 @@ SUMMARY = "Enhances systemd compatilibity with existing SysVinit scripts"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
 LICENSE = "MIT"
 
-
 PACKAGE_WRITE_DEPS += "systemd-systemctl-native"
 
 S = "${UNPACKDIR}"
diff --git a/meta/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
index 8df7ff7cf1d..a366f199ee1 100644
--- a/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
+++ b/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-
 inherit systemd features_check
 REQUIRED_DISTRO_FEATURES += "usrmerge"
 SYSTEMD_SERVICE:${PN} = ""
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 41b885d905b..c9337d6b74d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -19,5 +19,4 @@ SRCREV = "1c93ed4c72a4513d9cefcd1f89d11a9dc828d06c"
 SRCBRANCH = "v257-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
-
 CVE_PRODUCT = "systemd"
diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-core/systemd/systemd_257.5.bb
index 995b55580e4..5f7f20c4349 100644
--- a/meta/recipes-core/systemd/systemd_257.5.bb
+++ b/meta/recipes-core/systemd/systemd_257.5.bb
@@ -519,7 +519,6 @@ RRECOMMENDS:${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', 'ker
 
 RDEPENDS:${PN}-vconsole-setup = "${@bb.utils.contains('PACKAGECONFIG', 'vconsole', 'kbd kbd-consolefonts kbd-keymaps', '', d)}"
 
-
 FILES:${PN}-journal-gatewayd = "${nonarch_libdir}/systemd/systemd-journal-gatewayd \
                                 ${systemd_system_unitdir}/systemd-journal-gatewayd.service \
                                 ${systemd_system_unitdir}/systemd-journal-gatewayd.socket \
@@ -542,7 +541,6 @@ FILES:${PN}-journal-remote = "${nonarch_libdir}/systemd/systemd-journal-remote \
                              "
 SYSTEMD_SERVICE:${PN}-journal-remote = "systemd-journal-remote.socket"
 
-
 FILES:${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.conf \
                          ${sysconfdir}/dbus-1/system.d/org.freedesktop.machine1.conf \
                          ${sysconfdir}/systemd/system/multi-user.target.wants/machines.target \
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 748e5e6d065..c77266e71ea 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -2,7 +2,6 @@ SUMMARY = "Inittab configuration for SysVinit"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
-
 SRC_URI = "file://inittab \
            file://start_getty"
 
diff --git a/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
index 8c335cafcbe..507ad1b09ea 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
@@ -11,7 +11,6 @@ SRCREV = "793c037ded98cd001075cdb55a9c58e122380256"
 
 CVE_PRODUCT = "s390-tools"
 
-
 EXTRA_OEMAKE = "\
     V=1 \
     CC="${CC}" \
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index b5349152046..124b7d32a2a 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -12,7 +12,6 @@ PV .= "+git"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 inherit allarch
 
 do_compile() {
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 16bf345d1df..922e665028c 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -100,7 +100,6 @@ SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master;protocol=https \
 
 SRCREV = "868a2afab9da34f32c007d773b77253c93104636"
 
-
 inherit systemd update-rc.d python3native update-alternatives
 
 ALTERNATIVE:${PN} = "bootchartd"
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
index 04be9439d88..982d4830b5d 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
@@ -59,7 +59,6 @@ do_configure:prepend() {
 	cp -f $(automake --print-libdir)/install-sh ${S}/config/
 }
 
-
 do_install:append() {
     if [ "${@bb.utils.filter('PACKAGECONFIG', 'python', d)}" ]; then
         oe_runmake 'DESTDIR=${D}' 'PYTHON_SITEPACKAGES_DIR=${PYTHON_SITEPACKAGES_DIR}' install_python
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index f958b724148..52b72b57bd0 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -316,7 +316,6 @@ PROVIDES:append:class-nativesdk = " nativesdk-llvm nativesdk-libclc"
 PACKAGES =+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-python ${PN}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
              libclang lldb lldb-server liblldb llvm-linker-tools"
 
-
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:lldb += "${PN}-lldb-python lldb-server"
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index 7b442183efc..ff6cc29bf32 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -16,7 +16,6 @@ BPN = "compiler-rt"
 
 inherit cmake pkgconfig python3native
 
-
 LIC_FILES_CHKSUM = "file://compiler-rt/LICENSE.TXT;md5=d846d1d65baf322d4c485d6ee54e877a"
 
 LIBCPLUSPLUS = ""
diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/recipes-devtools/clang/llvm-project-source.inc
index 0820dd34927..13e54efbc28 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -66,7 +66,6 @@ python do_preconfigure() {
     cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_VENDORS_CASES#%s#g' -i ${S}/llvm/lib/TargetParser/Triple.cpp" % (case))
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
 
-
     case = ""
     triple = ""
     name = ""
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
index 1d2ad9ebfba..63a717726c0 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
 
 SRCREV = "8c6e6f88df86d1e34ca26d3835d77a2816326414"
 
-
 DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
 DEPENDS:append:class-native = " file-replacement-native"
 
diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
index 7bb0f02d3f9..ae77fda31ce 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
@@ -23,7 +23,6 @@ SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch
 SRCREV = "da9a7066be8e1628d9453428d33685225cd9c90d"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-
 inherit cmake gettext bash-completion setuptools3-base systemd
 
 DEPENDS += "libdnf librepo libcomps"
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 45b67bf168f..f87d0739ada 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -33,7 +33,6 @@ EXTRA_OECONF:append:class-nativesdk = " --disable-update-alternatives DEB_HOST_A
 PACKAGECONFIG = "liblzma"
 PACKAGECONFIG[liblzma] = "--with-liblzma,--without-liblzma, xz"
 
-
 #autotools.bbclass default AUTOTOOLS_AUXDIR is ${S}, we need to under ${S}/build-aux
 AUTOTOOLS_AUXDIR = "${S}/build-aux"
 
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
index 830cf435ce8..2bedd6e16bd 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;b
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
-
 DEPENDS = "util-linux-libuuid"
 
 inherit pkgconfig autotools
diff --git a/meta/recipes-devtools/fmt/fmt_11.2.0.bb b/meta/recipes-devtools/fmt/fmt_11.2.0.bb
index ce63f940255..d0d4cea23e2 100644
--- a/meta/recipes-devtools/fmt/fmt_11.2.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.2.0.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=${PV}\
            file://0001-Workaround-an-ABI-issue-in-spdlog.patch"
 SRCREV = "40626af88bd7df9a5fb80be7b25ac85b122d6c21"
 
-
 inherit cmake
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index e3fb48c0301..50ff0d2e820 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -116,6 +116,5 @@ do_configure () {
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
 
-
 	oe_runconf
 }
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_15.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_15.1.bb
index bf53c5cd787..355757c6568 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_15.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_15.1.bb
@@ -1,5 +1,3 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-cross-canadian.inc
 
-
-
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 54a1d3d85ce..80b85fb0546 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -44,7 +44,6 @@ EXTRA_OECONF_PATHS = "\
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
 
-
 do_configure:prepend () {
 	install -d ${RECIPE_SYSROOT}${target_includedir}
 	touch ${RECIPE_SYSROOT}${target_includedir}/limits.h
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 1a4169f91aa..2afd8f6f2a7 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -59,7 +59,6 @@ python gcc_multilib_setup() {
     if ('%sgcc' % mlprefix) != pn and (not pn.startswith('gcc-cross-canadian')) and pn != "nativesdk-gcc":
         return
 
-
     def write_config(root, files, options, dirnames, osdirnames):
         for ml_conf_file in files:
             with open(root + '/' + ml_conf_file, 'r') as f:
@@ -142,7 +141,6 @@ python gcc_multilib_setup() {
                 with open(root + '/' + ml_conf_file, 'w') as f:
                     f.write(''.join(filelines))
 
-
     gcc_target_config_files = {
         'x86_64'    : ['gcc/config/i386/t-linux64'],
         'i586'      : ['gcc/config/i386/t-linux64'],
@@ -176,7 +174,6 @@ python gcc_multilib_setup() {
     libdirx32 = 'SYSTEMLIBS_DIR'
     libdirn32 = 'SYSTEMLIBS_DIR'
 
-
     target_arch = (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL') if mlprefix
                     else d.getVar('TARGET_ARCH'))
     if pn == "nativesdk-gcc":
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index e3db17d700c..65bcd24bc75 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -104,7 +104,6 @@ fakeroot python do_multilib_install() {
         os.symlink(src, dest)
         return
 
-
     for ml in multilibs.split():
         tune = d.getVar('DEFAULTTUNE:virtclass-multilib-' + ml)
         if not tune:
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 95544753826..a3f0f947f77 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -36,7 +36,6 @@ LICENSE:${PN} = "GPL-3.0-with-GCC-exception"
 LICENSE:${PN}-dev = "GPL-3.0-with-GCC-exception"
 LICENSE:${PN}-dbg = "GPL-3.0-with-GCC-exception"
 
-
 FILES:${PN}-dev = "\
     ${base_libdir}/libgcc*.so \
     ${@oe.utils.conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index ff6c063d69e..39330fc98b0 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -29,7 +29,6 @@ do_compile() {
 }
 do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
-
 make_wrapper() {
 	rm -f ${D}${bindir}/$2
 	cat <<END >${D}${bindir}/$2
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
index ee2fb10a08a..5709f3e69f4 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;p
 
 SRCREV = "2e973ce22698dd64f472180e3a689755268fb06b"
 
-
 inherit cmake setuptools3-base
 
 DEPENDS = "expat libxml2 zlib"
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
index 06be5776f24..6ac518564b4 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
 SRCREV = "91a0bf9aada36a722855051526f012e0b5ab1af9"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
-
 DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc libmodulemd json-c swig-native util-linux"
 
 inherit gtk-doc gobject-introspection cmake pkgconfig setuptools3-base
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
index d6613131bd0..6504414387b 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=
 
 SRCREV = "e7f179eeeb6eee1403f090fc43a3c80bb08b5bfd"
 
-
 inherit meson gobject-introspection pkgconfig manpages
 
 EXTRA_OEMESON = "-Dwith_py3=false -Dwith_docs=false -Drpmio=disabled -Dgobject_overrides_dir_py3=${PYTHON_SITEPACKAGES_DIR}/gi/overrides"
diff --git a/meta/recipes-devtools/librepo/librepo_1.19.0.bb b/meta/recipes-devtools/librepo/librepo_1.19.0.bb
index d985601a28b..ba66c8ef68f 100644
--- a/meta/recipes-devtools/librepo/librepo_1.19.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.19.0.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
 
 SRCREV = "7955987e33ba98dddb3fc2c63bb6dc892e3505fa"
 
-
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
 inherit cmake setuptools3-base pkgconfig
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index fed0ef89161..f3944aebf03 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -15,7 +15,6 @@ UPSTREAM_CHECK_COMMITS = "1"
 DEPENDS = "python3-sphinx-native"
 EXTRA_OEMAKE = "C="
 
-
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn32 = " -D__SANE_USERSPACE_TYPES__"
diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
index 52dcbcce4ab..47f0b01abe0 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
            file://0004-ubifs-utils-extract_files-Include-linux-limits.h.patch \
            file://0001-Improve-check-for-GCC-compiler-version.patch"
 
-
 # xattr support creates an additional compile-time dependency on acl because
 # the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
 # regardless whether acl is enabled or disabled in the distro should be okay.
diff --git a/meta/recipes-devtools/ninja/ninja_1.12.1.bb b/meta/recipes-devtools/ninja/ninja_1.12.1.bb
index 2667c932b0c..5aff82edeca 100644
--- a/meta/recipes-devtools/ninja/ninja_1.12.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.12.1.bb
@@ -11,7 +11,6 @@ SRCREV = "2daa09ba270b0a43e1929d29b073348aa985dfaa"
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
-
 do_configure[noexec] = "1"
 
 do_compile:class-native() {
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
index 9c5cfb837ed..9f1a91e1d38 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=https;branch=master \
            "
 SRCREV = "68a969f0e867ace0d94faf8ebe7c7bb67f59d386"
 
-
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 RDEPENDS:${PN} += "bash"
diff --git a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
index 128baa9a081..9e9e70209e3 100644
--- a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
@@ -19,7 +19,6 @@ do_compile() {
 	done
 }
 
-
 do_install () {
 	install -d ${D}${sysconfdir}/opkg
 	install -m 0644  ${S}/${sysconfdir}/opkg/* ${D}${sysconfdir}/opkg/
diff --git a/meta/recipes-devtools/opkg/opkg_0.7.0.bb b/meta/recipes-devtools/opkg/opkg_0.7.0.bb
index 0a54247c5b3..95480b47164 100644
--- a/meta/recipes-devtools/opkg/opkg_0.7.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.7.0.bb
@@ -68,7 +68,6 @@ def qa_check_solver_deprecation (pn, d):
     if "libsolv" not in pkgconfig:
         oe.qa.handle_error("internal-solver-deprecation", "The opkg internal solver will be deprecated in future opkg releases. Consider enabling \"libsolv\" in PACKAGECONFIG.", d)
 
-
 RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config libarchive"
 RDEPENDS:${PN}:class-native = ""
 RDEPENDS:${PN}:class-nativesdk = ""
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb b/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
index cefc586f2f7..6e86ddbde63 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
 "
 SRCREV = "99c24238981b7b1084313aca8f5c493bb46f302c"
 
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit autotools
diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-devtools/perl/perl_5.40.2.bb
index 95c230060d2..c3bcbf053d9 100644
--- a/meta/recipes-devtools/perl/perl_5.40.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
                     file://Artistic;md5=71a4d5d9acc18c0952a6df2218bb68da \
                     "
 
-
 SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://perl-rdepends.txt \
            file://0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch \
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 1ce4888e578..f537c635ef2 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://gitlab.freedesktop.org/pkg-config/pkg-config.git;branch=master;
            file://0001-Do-not-use-bool-as-a-field-name.patch \
            "
 
-
 inherit autotools
 
 # Because of a faulty test, the current auto mode always evaluates to no,
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 36283ffa74e..22c934977d9 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -124,7 +124,6 @@ do_compile:append:class-native () {
 	fi
 }
 
-
 do_install () {
 	oe_runmake 'DESTDIR=${D}' ${MAKEOPTS} 'LIB=lib/pseudo/lib$(MARK64)' install
 }
diff --git a/meta/recipes-devtools/python/python3-calver_2025.04.17.bb b/meta/recipes-devtools/python/python3-calver_2025.04.17.bb
index fb2fa93173e..85ad18701c6 100644
--- a/meta/recipes-devtools/python/python3-calver_2025.04.17.bb
+++ b/meta/recipes-devtools/python/python3-calver_2025.04.17.bb
@@ -8,7 +8,6 @@ SRCREV = "3b74bdce35f2814eb2b65db39a133d5c849ddea7"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-
 RDEPENDS:${PN}-ptest += " \
     python3-pretend \
 "
diff --git a/meta/recipes-devtools/python/python3-dtc_1.7.2.bb b/meta/recipes-devtools/python/python3-dtc_1.7.2.bb
index 99eb209a9cb..9525c340cd3 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.7.2.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.7.2.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c9
 
 SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
 
-
 PYPA_WHEEL = "${S}/dist/libfdt-1.6.2*.whl"
 
 inherit setuptools3 pkgconfig
diff --git a/meta/recipes-devtools/python/python3-mako_1.3.10.bb b/meta/recipes-devtools/python/python3-mako_1.3.10.bb
index 4facce9233a..2d937dc184e 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.10.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.10.bb
@@ -8,8 +8,6 @@ PYPI_PACKAGE = "mako"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-
-
 SRC_URI[sha256sum] = "99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28"
 
 RDEPENDS:${PN} = "python3-html \
diff --git a/meta/recipes-devtools/python/python3-psutil_7.0.0.bb b/meta/recipes-devtools/python/python3-psutil_7.0.0.bb
index 22ead67ad99..a2af1980837 100644
--- a/meta/recipes-devtools/python/python3-psutil_7.0.0.bb
+++ b/meta/recipes-devtools/python/python3-psutil_7.0.0.bb
@@ -14,7 +14,6 @@ FILES:${PN}-tests += " \
     ${PYTHON_SITEPACKAGES_DIR}/psutil/__pycache__/test* \
 "
 
-
 RDEPENDS:${PN} += " \
     python3-shell \
     python3-threading \
diff --git a/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
index 5121a57868d..216fea2b935 100644
--- a/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://gitlab.com/rossburton/python-unittest-automake-output;protocol=
 
 SRCREV = "aebdfb188e368c690ea55cf6c9c9ffa1a52def65"
 
-
 inherit python_flit_core
 
 RDEPENDS:${PN} += "python3-unittest"
diff --git a/meta/recipes-devtools/python/python3_3.13.4.bb b/meta/recipes-devtools/python/python3_3.13.4.bb
index a5277b3c5ab..5dbbc36e296 100644
--- a/meta/recipes-devtools/python/python3_3.13.4.bb
+++ b/meta/recipes-devtools/python/python3_3.13.4.bb
@@ -65,7 +65,6 @@ ALTERNATIVE:${PN}-dev = "python3-config"
 ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config"
 ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
 
-
 DEPENDS = "\
     autoconf-archive-native \
     bzip2 \
diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index 8dfa2b74d96..35735c1e15a 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -4,10 +4,8 @@ RDEPENDS:${PN} = "nativesdk-qemu nativesdk-unfs3 nativesdk-pseudo \
                   nativesdk-python3-shell nativesdk-python3-fcntl nativesdk-python3-logging \
                 "
 
-
 LIC_FILES_CHKSUM = "file://${COREBASE}/scripts/runqemu;beginline=5;endline=10;md5=ac2b489a58739c7628a2604698db5e7f"
 
-
 SRC_URI = "file://${COREBASE}/scripts/runqemu \
            file://${COREBASE}/scripts/runqemu-addptable2image \
            file://${COREBASE}/scripts/runqemu-gen-tapdevs \
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0aba6d82761..7893df0df24 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -92,7 +92,6 @@ do_install_ptest() {
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm aarch64 i386 loongarch64 mips mipsel mips64 mips64el ppc ppc64 ppc64le riscv32 riscv64 sh4 x86_64"
 
-
 EXTRA_OECONF = " \
     --prefix=${prefix} \
     --bindir=${bindir} \
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 3418979968e..752ff3198db 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -26,7 +26,6 @@ if [ ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False',
 	exit 1
 fi
 
-
 $qemu_binary $qemu_options "\$@"
 EOF
 
diff --git a/meta/recipes-devtools/repo/repo_2.55.bb b/meta/recipes-devtools/repo/repo_2.55.bb
index e77f952f727..354fe0f8e69 100644
--- a/meta/recipes-devtools/repo/repo_2.55.bb
+++ b/meta/recipes-devtools/repo/repo_2.55.bb
@@ -15,7 +15,6 @@ SRCREV = "08815ad3eb245872700201e03c47cb504d1dc3f9"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-
 do_configure:prepend() {
 	sed -Ei "s/REPO_REV\s*=\s*('|\")stable('|\")/REPO_REV = '${SRCREV}'/g" ${S}/repo
 }
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 13ef83fdc7b..658b9ab36aa 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -16,7 +16,6 @@ SRC_URI = " \
 SRCREV = "032b418a6db842f0eab330eb5909e4604e888728"
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 do_compile () {
 	# Remove most policy variants, leave DEFAULT.pol
 	# It speeds up the build and we only need DEFAULT/rpm-sequoia.
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
index 297370f7b51..17d5a747ff0 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
@@ -16,10 +16,8 @@ SRC_URI = "git://github.com/rpm-software-management/rpm-sequoia.git;protocol=htt
 	file://0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch \
 "
 
-
 SRCREV = "0667e04ae7fb8cf0490919978d69883d16400e41"
 
-
 require ${BPN}-crates.inc
 
 CARGO_BUILD_FLAGS += "--no-default-features --features crypto-openssl"
diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
index a1190e8dd1e..dc4cfd4abbe 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
@@ -44,7 +44,6 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.20.x;protoc
 PE = "1"
 SRCREV = "c8dc5ea575a2e9c1488036d12f4b75f6a5a49120"
 
-
 DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd"
 DEPENDS:append:class-native = " file-replacement-native bzip2-replacement-native"
 
diff --git a/meta/recipes-devtools/rust/cargo_1.86.0.bb b/meta/recipes-devtools/rust/cargo_1.86.0.bb
index 150c2d2b801..fc41a19a257 100644
--- a/meta/recipes-devtools/rust/cargo_1.86.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.86.0.bb
@@ -34,7 +34,6 @@ addtask cargo_setup_snapshot after do_unpack before do_configure
 do_cargo_setup_snapshot[dirs] += "${WORKDIR}/${CARGO_SNAPSHOT}"
 do_cargo_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
 
-
 do_compile:prepend () {
 	export RUSTC_BOOTSTRAP="1"
 }
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
index fbcfedbb345..8006f80aeef 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
@@ -12,7 +12,6 @@ SRCREV = "2e87d42ed089dc31990d83eeb07437b9d085d6d1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-
 EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
 
 PACKAGECONFIG ??= "gzip lz4 xz zstd xattr"
diff --git a/meta/recipes-devtools/strace/strace_6.15.bb b/meta/recipes-devtools/strace/strace_6.15.bb
index 2093c92eb31..fdc79bcf851 100644
--- a/meta/recipes-devtools/strace/strace_6.15.bb
+++ b/meta/recipes-devtools/strace/strace_6.15.bb
@@ -17,7 +17,6 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            "
 SRC_URI[sha256sum] = "8552dfab08abc22a0f2048c98fd9541fd4d71b6882507952780dab7c7c512f51"
 
-
 inherit autotools github-releases ptest
 
 # Not yet ported to rv32
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
index 308ecc4be68..31f3add89fa 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
@@ -21,10 +21,8 @@ SRC_URI:append:libc-musl = " \
     file://0001-Define-portable-basename-function.patch \
     "
 
-
 SRCREV = "8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7"
 
-
 DEPENDS = "systemd libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native intltool"
 
 inherit pkgconfig autotools systemd features_check
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
index 5d759837950..1639ae84e94 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
@@ -37,7 +37,6 @@ LCL_STOP_SERVICES = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
     -DSERVICE_Memory=0 -DSERVICE_Registers=0 -DSERVICE_MemoryMap=0 \
     -DSERVICE_StackTrace=0 -DSERVICE_Expressions=0"
 
-
 # These features don't compile for several cases.
 #
 CFLAGS:append:arc = " ${LCL_STOP_SERVICES}"
diff --git a/meta/recipes-extended/acpica/acpica_20240827.bb b/meta/recipes-extended/acpica/acpica_20240827.bb
index 4b61e92141d..f9f9f9f687d 100644
--- a/meta/recipes-extended/acpica/acpica_20240827.bb
+++ b/meta/recipes-extended/acpica/acpica_20240827.bb
@@ -19,7 +19,6 @@ DEPENDS = "m4-native flex-native bison-native"
 SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master"
 SRCREV = "e80cbd7b52de20aa8c75bfba9845e9cb61f2e681"
 
-
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
index 57b56802ed1..848c380363f 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
@@ -14,7 +14,6 @@ SRCREV = "21e33efe96ba9a51d99d1150691dae750afd6ed1"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-
 # Tell xmllint where to find the DocBook XML catalogue, because right now it
 # opens /etc/xml/catalog on the host. Depends on auto-catalogs.patch
 export SGML_CATALOG_FILES = "file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
index 2fdace01b85..80fdf26c053 100644
--- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -10,7 +10,6 @@ PV = "0.1+git"
 SRC_URI = "git://github.com/ahcbb6/baremetal-helloqemu.git;protocol=https;branch=master"
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-
 # The following variables should be set to accomodate each application
 BAREMETAL_BINNAME ?= "hello_baremetal_${MACHINE}"
 IMAGE_LINK_NAME ?= "baremetal-helloworld-image-${MACHINE}"
@@ -22,7 +21,6 @@ IMAGE_NAME_SUFFIX ?= ""
 # firmware from Linux
 inherit baremetal-image
 
-
 # startup code for x86 uses NASM syntax
 DEPENDS:qemux86:append = " nasm-native"
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index cd7087721f1..1cd6bacff9f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -21,7 +21,6 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 def gs_verdir(v):
     return "".join(v.split("."))
 
-
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
diff --git a/meta/recipes-extended/hdparm/hdparm_9.65.bb b/meta/recipes-extended/hdparm/hdparm_9.65.bb
index 34d50054ab5..e541d58fa52 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.65.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.65.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=495d03e50dc6c89d6a30107ab0df5b03 \
                     file://wiper/GPLv2.txt;md5=fcb02dc552a041dee27e4b85c7396067 \
                     file://wiper/wiper.sh;beginline=7;endline=31;md5=b7bc642addc152ea307505bf1a296f09"
 
-
 PACKAGES =+ "wiper"
 
 FILES:wiper = "${bindir}/wiper.sh"
diff --git a/meta/recipes-extended/iputils/iputils_20250605.bb b/meta/recipes-extended/iputils/iputils_20250605.bb
index 39d2fd8bb65..4618fbb29a2 100644
--- a/meta/recipes-extended/iputils/iputils_20250605.bb
+++ b/meta/recipes-extended/iputils/iputils_20250605.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
           "
 SRCREV = "6e1cb146547eb6fbb127ffc8397a9241be0d33c2"
 
-
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>20\d+)"
 
 CVE_STATUS[CVE-2000-1213] = "fixed-version: Fixed in 2000-10-10, but the versioning of iputils breaks the version order."
diff --git a/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb b/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb
index b40ff34dd8d..ff4ae6c2437 100644
--- a/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb
@@ -15,7 +15,6 @@ CVE_PRODUCT = "libnsl_project:libnsl"
 SRC_URI = "git://github.com/thkukuk/libnsl;branch=master;protocol=https"
 SRCREV = "d4b22e54b5e6637a69b26eab5faad2a326c9b182"
 
-
 inherit autotools pkgconfig gettext
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index c04c9b34f1d..2198606de5e 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -20,7 +20,6 @@ SRCREV = "cd0d391af9535b56e612ed227c1b89be269f3d59"
 SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
           "
 
-
 inherit autotools pkgconfig
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.32.bb b/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
index 8b927c02712..e4de28a2a89 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
@@ -16,7 +16,6 @@ SRCREV = "95f64952e3270deb6be30ae4b786cae5c114c807"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-
 inherit cmake
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
diff --git a/meta/recipes-extended/lsof/lsof_4.99.4.bb b/meta/recipes-extended/lsof/lsof_4.99.4.bb
index f245666d80a..b977fc48973 100644
--- a/meta/recipes-extended/lsof/lsof_4.99.4.bb
+++ b/meta/recipes-extended/lsof/lsof_4.99.4.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
            file://remove-host-information.patch"
 SRCREV = "bbf320ce586a848f880bca7b758d50ae4c712624"
 
-
 inherit update-alternatives autotools pkgconfig manpages
 PACKAGECONFIG[manpages] = ""
 
diff --git a/meta/recipes-extended/ltp/ltp_20250130.bb b/meta/recipes-extended/ltp/ltp_20250130.bb
index e82d3ed066d..fc643c2ab9b 100644
--- a/meta/recipes-extended/ltp/ltp_20250130.bb
+++ b/meta/recipes-extended/ltp/ltp_20250130.bb
@@ -33,7 +33,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-cve-2015-3290-Disable-AVX-for-x86_64.patch \
            "
 
-
 inherit autotools-brokensep pkgconfig
 
 # Version 20220527 added KVM test infrastructure which currently fails to build with lld due to
diff --git a/meta/recipes-extended/mdadm/mdadm_4.4.bb b/meta/recipes-extended/mdadm/mdadm_4.4.bb
index d8ded85d4c2..26a60e4c1a3 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.4.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
-
 SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;branch=main;tag=mdadm-${PV} \
            file://run-ptest \
            file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/recipes-extended/net-tools/net-tools_2.10.bb
index 853e25e8434..9001c157be2 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://git.code.sf.net/p/net-tools/code;protocol=https;branch=master \
     file://Add_missing_headers.patch \
 "
 
-
 inherit gettext
 
 # The Makefile is lame, no parallel build
diff --git a/meta/recipes-extended/procps/procps_4.0.5.bb b/meta/recipes-extended/procps/procps_4.0.5.bb
index 7c40b3b974e..2b41be39302 100644
--- a/meta/recipes-extended/procps/procps_4.0.5.bb
+++ b/meta/recipes-extended/procps/procps_4.0.5.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            "
 SRCREV = "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e"
 
-
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as they
 # don't ship a po/POTFILES.in (which is silly).  Without that file gettext
 # doesn't believe po/ is a gettext directory and won't generate po/Makefile.
diff --git a/meta/recipes-extended/psmisc/psmisc_23.7.bb b/meta/recipes-extended/psmisc/psmisc_23.7.bb
index 653095c81cd..fff1f218f4d 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.7.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -25,7 +25,6 @@ do_configure:prepend() {
     ( cd ${S} && po/update-potfiles )
 }
 
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index dc928c736e9..4cb785aa901 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -23,7 +23,6 @@ SRC_URI = "git://github.com/thkukuk/${BPN};branch=master;protocol=https \
            file://0001-Use-cross-compiled-rpcgen.patch \
            "
 
-
 inherit autotools gettext
 
 EXTRA_OEMAKE:class-native = " -C rpcgen"
diff --git a/meta/recipes-extended/scdoc/scdoc_1.11.3.bb b/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
index 3641b03b90b..5f571c64ddb 100644
--- a/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
+++ b/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master \
            file://0001-Makefile-drop-static.patch "
 SRCREV = "0528bcb993cac6c412acd3ae2e09539e994c0a59"
 
-
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
 }
diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.6.bb b/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
index dbcfad5f1bf..e94e1caf220 100644
--- a/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-
 SRC_URI = "file://securetty"
 
 S = "${UNPACKDIR}"
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index aa132970b8c..d66ef1e6a47 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;endline=1;md5=ceddfb61608e4
 
 DEPENDS = "base-passwd"
 
-
 # The sole purpose of this recipe is to provide the /etc/login.defs
 # file for the target sysroot - needed so the shadow-native utilities
 # can add custom users/groups for recipes that use inherit useradd.
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
index f8a1bac1868..c436153d1bf 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https;
 
 SRCREV = "5fb314cb9060afa3bd4eed2f0be3200f02f729e9"
 
-
 EXTRA_OECONF = "--with-systemd=${systemd_system_unitdir} --without-logger"
 
 do_install:append () {
diff --git a/meta/recipes-extended/which/which_2.21.bb b/meta/recipes-extended/which/which_2.21.bb
index 6e855bca3fe..7279a047373 100644
--- a/meta/recipes-extended/which/which_2.21.bb
+++ b/meta/recipes-extended/which/which_2.21.bb
@@ -13,7 +13,6 @@ DEPENDS     = "cwautomacros-native"
 
 inherit autotools texinfo update-alternatives
 
-
 EXTRA_OECONF = "--disable-iberty"
 
 SRC_URI = "${GNU_MIRROR}/which/which-${PV}.tar.gz \
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index 93c211e3ba3..2f727128a57 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/openSUSE/xinetd.git;protocol=https;branch=master \
 
 SRCREV = "6a4af7786630ce48747d9687e2f18f45ea6684c4"
 
-
 # https://github.com/xinetd-org/xinetd/pull/10 is merged into this git tree revision
 CVE_STATUS[CVE-2013-4342] = "fixed-version: Fixed directly in git tree revision"
 
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 0824b30da28..d1092551f7f 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -6,7 +6,6 @@ SECTION = "console/utils"
 LICENSE = "Info-ZIP"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04d43c5d70b496c032308106e26ae17d"
 
-
 S = "${UNPACKDIR}/zip30"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz \
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extended/zstd/zstd_1.5.7.bb
index 81d05f980fc..0e872b95aaf 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.7.bb
@@ -17,7 +17,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
 
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
 PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
index 58d5cb07b5f..8651ab81672 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main
 
 SRCREV = "9ab2ab8fa3f4a04f5d2cc24b0c8e91e73bc57b51"
 
-
 inherit python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-asyncio python3-core python3-jinja2 python3-json python3-markdown python3-markupsafe python3-pygments python3-typogrify python3-xml"
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb
index 4d801105fa8..f40b1159ebd 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb
@@ -8,7 +8,6 @@ HOMEPAGE = "https://github.com/GNOME/libsecret"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libsecret/issues"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
-
 inherit gnomebase gi-docgen vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
diff --git a/meta/recipes-graphics/cairo/cairo_1.18.4.bb b/meta/recipes-graphics/cairo/cairo_1.18.4.bb
index 81c7aa66f01..3f6d02f8d4c 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.4.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.4.bb
@@ -25,7 +25,6 @@ LICENSE:${PN}-src = "(MPL-1.1 | LGPL-2.1-only)${@bb.utils.contains('PACKAGECONFI
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77 \
                     ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'file://util/cairo-trace/COPYING-GPL-3;md5=d32239bcb673463ab874e80d47fae504', '', d)}"
 
-
 DEPENDS = "fontconfig freetype glib-2.0 libpng pixman zlib"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
index e2e82b32aa8..d14a6403ff4 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://ebassi.github.io/graphene/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a7d871d9e23c450c421a85bb2819f648"
 
-
 inherit gnomebase gobject-introspection gtk-doc
 
 SRC_URI += "file://float-div.patch"
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
index 397352b7615..1eae416c014 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;bra
            file://0001-lib-igt_aux.c-address-procps-4.0.5-compatibility.patch \
            "
 
-
 DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native"
 RDEPENDS:${PN} += "bash perl"
 RDEPENDS:${PN}-tests += "bash"
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 3b976364296..013fdfb6bf5 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=http
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 BASEPV = "0.0.1"
 PV = "${BASEPV}+git"
 
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index 5ddbbb7eae0..7416b845385 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -15,7 +15,6 @@ PV = "0.3+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 
-
 inherit autotools pkgconfig gettext features_check
 
 # The libxtst requires x11 in DISTRO_FEATURES
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
index c9dbc0202bf..9de44d4c951 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
@@ -16,7 +16,6 @@ DEPENDS = "virtual/libx11 libxext"
 SRCREV = "04b214a0d5cf8285e196d90bf2332626b12c74ef"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https;tag=${PV}"
 
-
 inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
index 3f446445e79..d8be3417cc7 100644
--- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
@@ -13,7 +13,6 @@ SRC_URI = "file://matchbox-session"
 
 S = "${UNPACKDIR}"
 
-
 inherit update-alternatives
 
 ALTERNATIVE:${PN} = "x-session-manager"
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
index 29d6644f510..3359193d651 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
@@ -14,7 +14,6 @@ SRCREV = "ce8c1053270d960a7235ab5c3435f707541810a4"
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;branch=master;protocol=https \
            file://kbdconfig"
 
-
 inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b222e72fddd..7dfca451024 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -81,7 +81,6 @@ EXTRA_OEMESON = " \
 def strip_comma(s):
     return s.strip(',')
 
-
 PACKAGECONFIG = " \
 	gallium \
 	video-codecs \
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
index a6626b5d18a..e90786df44e 100644
--- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -3,7 +3,6 @@ DESCRIPTION = "Simple session manager for X, that provides just the right boiler
 HOMEPAGE = "http://www.yoctoproject.org"
 BUGTRACKER = "http://bugzilla.pokylinux.org"
 
-
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mini-x-session;endline=5;md5=b6430bffbcf05f9760e72938826b7487"
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 41335cbf6d0..f5670cacfb3 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -2,7 +2,6 @@
 # Copyright (C) 2011 Intel Corporation
 #
 
-
 inherit packagegroup features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 5637855fa03..59f014afeed 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -20,7 +20,6 @@ SRCREV = "a0a27e528f643dfeb785350a1213bfff09681950"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-
 X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
 X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
 
diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb
index f5cd50ef93d..4952e8ba4ff 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb
@@ -14,7 +14,6 @@ SRCREV_spirv = "6dd8f2a1681a27f16c53d932d2765920f312aeb2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-
 DEPENDS = "clang spirv-tools spirv-headers"
 
 inherit cmake pkgconfig python3native
diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index 55b4065a4ac..bdc91d7455c 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -13,10 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a2ae2cd47d6d2f238410f5364dfbc0f2 \
                     file://libsn/sn-common.h;endline=23;md5=6d05bc0ebdcf5513a6e77cb26e8cd7e2 \
                     file://test/test-boilerplate.h;endline=23;md5=923e706b2a70586176eead261cc5bb98"
 
-
 SECTION = "libs"
 
-
 DEPENDS = "virtual/libx11 libsm xcb-util"
 
 inherit autotools pkgconfig features_check
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
index 89770f7d513..11c3c8c9639 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;prot
            file://0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch \
            "
 
-
 inherit meson pkgconfig features_check
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'venus', '', d)}"
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
index c83a7ae2e26..1136e4795a0 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol
 
 SRCREV = "409c16be502e39fe70dd6fe2d9ad4842ef2c9a53"
 
-
 inherit cmake
 
 FILES:${PN} += "${datadir}/vulkan"
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
index 565652be27b..c739ba15dc8 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.313;protocol=https"
 SRCREV = "fb78607414e154c7a5c01b23177ba719c8a44909"
 
-
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
 inherit cmake features_check pkgconfig
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
index 39c6c710179..c73e5caa131 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.313;protocol=https"
 SRCREV = "ad2f0170f9466fadd96e3fdd65fad02cd3a3739b"
 
-
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
 REQUIRED_DISTRO_FEATURES = "vulkan"
diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
index 38ae1739699..1b38b6ec3a3 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.313;protocol=https"
 SRCREV = "4e246c56ec5afb5ad66b9b04374d39ac04675c8e"
 
-
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
 DEPENDS = "vulkan-headers"
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
index 1572b4ce9be..63a3aa4ae64 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.313;protocol=https"
 SRCREV = "50b87dd4be883b63c10e3c4f7b9c5aac0c82efd3"
 
-
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
 DEPENDS = "vulkan-headers vulkan-loader spirv-headers spirv-tools glslang vulkan-utility-libraries"
diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
index ec6683dbb60..cde1be16715 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb3d6e8051a71edca1e54bc38d35e5af"
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
 SRCREV = "43c29e655cb8117fd9cfb65ad9cefe2d40965102"
 
-
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
 DEPENDS = "vulkan-headers"
diff --git a/meta/recipes-graphics/wayland/weston_14.0.1.bb b/meta/recipes-graphics/wayland/weston_14.0.1.bb
index 2a0a403d998..653390ad99c 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.1.bb
@@ -94,7 +94,6 @@ PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipe
 # VNC remote screensharing
 PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc"
 
-
 do_install:append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
 	rm -f ${D}/${libdir}/libweston-${WESTON_MAJOR_VERSION}/*.la
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
index 744899952a7..e5a0f903f10 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
@@ -13,7 +13,6 @@ PV = "0.1.1+git"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 inherit autotools allarch
 
 FILES:${PN} = "${datadir}/icons/xcursor-transparent/cursors/*"
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
index 39bb5803f1b..50c6a120be5 100644
--- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -5,7 +5,6 @@ BUGTRACKER = "https://github.com/tias/xinput_calibrator/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-
 SRC_URI = "file://pointercal.xinput"
 
 S = "${UNPACKDIR}"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
index 337777648ac..84bf5300775 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://gitlab.freedesktop.org/xorg/app/xinput-calibrator;protocol=http
            file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch \
            "
 
-
 EXTRA_OECONF += "--with-gui=x11"
 
 do_install:append() {
diff --git a/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb b/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb
index 828523afb46..3258de79a09 100644
--- a/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb
+++ b/meta/recipes-graphics/xorg-app/x11perf_1.6.1.bb
@@ -5,7 +5,6 @@ SUMMARY = "X11 server performance test program"
 DESCRIPTION = "The x11perf program runs one or more performance tests \
 and reports how fast an X server can execute the tests."
 
-
 DEPENDS += "libxmu libxrender libxft libxext fontconfig"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=428ca4d67a41fcd4fc3283dce9bbda7e \
diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
index 2431fae6ce5..1e2c626143f 100644
--- a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
@@ -9,7 +9,6 @@ SECTION = "x11/libs"
 SRC_URI = "git://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https;branch=master"
 SRCREV = "dd8631c61465cc0de5e476c7a98e56528d62b163"
 
-
 inherit meson
 
 FILES:${PN} = " \
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-keysyms_0.4.1.bb b/meta/recipes-graphics/xorg-lib/xcb-util-keysyms_0.4.1.bb
index f1a4c3e5001..1fa4d196fd3 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-keysyms_0.4.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-keysyms_0.4.1.bb
@@ -5,4 +5,3 @@ LIC_FILES_CHKSUM = "file://keysyms/keysyms.c;endline=30;md5=2f8de023ed823bb92f0b
 					"
 SRC_URI[sha256sum] = "7c260a5294412aed429df1da2f8afd3bd07b7cba3fec772fba15a613a6d5c638"
 
-
diff --git a/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb b/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
index e678927d224..f0534904093 100644
--- a/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libaio"
 
-
 SRC_URI = "git://git.kernel.dk/blktrace.git;protocol=https;branch=master \
            file://0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch \
           "
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 7611335c5d1..16a8eb610a1 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -13,5 +13,4 @@ SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protoc
 SRCREV = "135cbff90af2ba97d88f1472be595ce78721972c"
 PV = "1.14"
 
-
 CLEANBROKEN = "1"
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.2.bb b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
index 7884c870860..92e83a94044 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.2.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
@@ -15,7 +15,6 @@ SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-
 inherit meson pkgconfig
 
 EXTRA_OEMESON = "-Dpython=disabled -Dvalgrind=disabled"
diff --git a/meta/recipes-kernel/kernel-signing-keys/kernel-signing-keys-native.bb b/meta/recipes-kernel/kernel-signing-keys/kernel-signing-keys-native.bb
index 704973dffb7..f346f1648ab 100644
--- a/meta/recipes-kernel/kernel-signing-keys/kernel-signing-keys-native.bb
+++ b/meta/recipes-kernel/kernel-signing-keys/kernel-signing-keys-native.bb
@@ -11,7 +11,6 @@
 # cases. For more advanced or production-grade scenarios, a more robust solution
 # is usually required—such as external signing or re-signing using e.g a HSM.
 
-
 SUMMARY = "Signing keys for the kernel FIT image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -28,7 +27,6 @@ do_patch[noexec] = "1"
 do_configure[noexec] = "1"
 do_install[noexec] = "1"
 
-
 do_compile() {
 	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
 		bbwarn "FIT_GENERATE_KEYS is set to 1 even though UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
index b7a781e2e96..75762e4def5 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
@@ -12,7 +12,6 @@ SRCREV = "bd47bd544c9ebc9f44bd88c2b2f2049230741058"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
           "
 
-
 inherit meson pkgconfig
 
 EXTRA_OEMESON = "-Ddoc=false"
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
index 3883f71781c..ea75271af8e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
@@ -288,7 +288,6 @@ do_install() {
         cp wfx/LICEN[CS]E.* ${D}${nonarch_base_libdir}/firmware/wfx/
 }
 
-
 PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-cw1200-license ${PN}-cw1200 \
              ${PN}-ralink-license ${PN}-ralink \
@@ -764,7 +763,6 @@ ALLOW_EMPTY:${PN}-qca = "1"
 # firmwares that are not already included in other -qca- packages.
 ALLOW_EMPTY:${PN}-qca-misc = "1"
 
-
 RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath10k-qca4019 += "${PN}-ath10k-license"
@@ -1627,7 +1625,6 @@ LICENSE:${PN}-iwlwifi-9260      = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-misc      = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-license   = "Firmware-iwlwifi_firmware"
 
-
 FILES:${PN}-iwlwifi-license = "${nonarch_base_libdir}/firmware/LICENCE.iwlwifi_firmware"
 FILES:${PN}-iwlwifi-135-6 = "${nonarch_base_libdir}/firmware/iwlwifi-135-6.ucode*"
 FILES:${PN}-iwlwifi-3160-7 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-7.ucode*"
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 199ea019d5b..b6082edf5c5 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -3,7 +3,6 @@
 # Generated at 2025-06-05 16:29:20.725105+00:00 for kernel version 6.12.31
 # From cvelistV5 cve_2025-06-05_1600Z
 
-
 python check_kernel_cve_status_version() {
     this_version = "6.12.31"
     kernel_version = d.getVar("LINUX_VERSION")
diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index f52e3a7b564..d7f39a452d5 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -23,12 +23,10 @@ FILES:kernel-vmlinux = ""
 ALLOW_EMPTY:kernel-vmlinux = "1"
 DESCRIPTION:kernel-vmlinux = "Kernel vmlinux meta package"
 
-
 INHIBIT_DEFAULT_DEPS = "1"
 
 COMPATIBLE_HOST = ".*-linux"
 
-
 SRC_URI = "file://COPYING.GPL"
 
 S = "${UNPACKDIR}"
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
index b227fe488a7..8bab7f677a6 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=http
 SRCREV = "7f2f8cd6dac497cbb466efb31219b531c62013f5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
-
 inherit autotools pkgconfig ptest python3targetconfig
 
 EXTRA_OECONF = "--disable-debug-info --disable-Werror"
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
index 6e1c2406481..8ec80167a0d 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.5;protocol=http
 SRCREV = "91c00f70884887ff5c4849a8e3d47e311a22ba9d"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>1(\.\d+)+)$"
 
-
 inherit autotools pkgconfig ptest
 
 EXTRA_OECONF = "--disable-debug-info"
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
index 4076e971632..99393e09848 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
@@ -28,7 +28,6 @@ SRC_URI = "\
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
 "
 
-
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 SECTION = "base"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index b30ae30e9d1..157aca4d791 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -391,7 +391,6 @@ python do_package:prepend() {
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-
 PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
 RDEPENDS:${PN} += "elfutils bash"
diff --git a/meta/recipes-kernel/powertop/powertop_2.15.bb b/meta/recipes-kernel/powertop/powertop_2.15.bb
index 3f9be0993a2..a9008b4074d 100644
--- a/meta/recipes-kernel/powertop/powertop_2.15.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.15.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/fenrus75/powertop;protocol=https;branch=master \
            "
 SRCREV = "d51ad395436d4d1dcc3ca46e1519ffeb475bf651"
 
-
 LDFLAGS += "-pthread"
 
 inherit autotools gettext pkgconfig bash-completion
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 211cbde8831..30f3d25bc8c 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -12,7 +12,6 @@ SRCREV = "3a92ffe673c1621309a0b60892114495b651c9de"
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
 COMPATIBLE_HOST:libc-musl = 'null'
 
-
 # systemtap can't be built without optimization, if someone tries to compile an
 # entire image as -O0, break with fatal.
 python () {
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
index 74b36291d63..3cbb9b464b4 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
@@ -119,7 +119,6 @@ do_install() {
 	rm -rf ${D}/unwanted
 }
 
-
 PROVIDES = "alsa-utils-alsaconf alsa-utils-scripts"
 
 RDEPENDS:${PN}-scripts += "bash"
diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
index 361d2c6e4a3..4f57fdb3742 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
@@ -7,7 +7,6 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf91718f59eb6a83d06dc7bcaf411132"
 DEPENDS = "libogg"
 
-
 SRC_URI = "http://downloads.xiph.org/releases/theora/libtheora-${PV}.tar.xz \
            file://0001-add-missing-files.patch"
 
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 4f4ff173042..3cc33925938 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -16,7 +16,6 @@ SRCREV = "31e19f92f00c7003fa115047ce50978bc98c3a0d"
 
 PV = "r3039+git"
 
-
 inherit lib_package pkgconfig
 
 X264_DISABLE_ASM = ""
diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
index 07a4f7a6763..7e20f9abeda 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -19,7 +19,6 @@ PV = "0.8.18.1.11+git"
 SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master;protocol=https"
 SRCREV = "3cdccdc9505643e50f8208171d9eee5de11a42ff"
 
-
 inherit autotools pkgconfig features_check mime-xdg
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index 8d5913f16be..6286a15798a 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 PV = "0.2+git"
 
-
 inherit autotools pkgconfig features_check
 
 # The settings-daemon requires x11 in DISTRO_FEATURES
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
index c6354f05e31..85e5300520b 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master;protocol=https \
 
 EXTRA_OECONF = "--enable-startup-notification --with-dbus"
 
-
 inherit autotools pkgconfig features_check
 
 # The startup-notification requires x11 in DISTRO_FEATURES
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
index a941cd36929..5fc6c67bfcc 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1;protoc
            file://0001-desktop-file-Hide-the-keyboard-from-app-list.patch \
            file://80matchboxkeyboard.sh"
 
-
 inherit autotools pkgconfig gettext gtk-immodules-cache features_check
 
 # The libxft, libfakekey and matchbox-panel-2 requires x11 in DISTRO_FEATURES
@@ -43,7 +42,6 @@ FILES:${PN}-im = "${libdir}/gtk-2.0/*/immodules/*.so \
 
 FILES:${PN}-applet = "${libdir}/matchbox-panel/*.so"
 
-
 do_install:append () {
 	install -d ${D}/${sysconfdir}/X11/Xsession.d/
 	install -m 755 ${UNPACKDIR}/80matchboxkeyboard.sh ${D}/${sysconfdir}/X11/Xsession.d/
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
index 0946c42a09d..a126571aded 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
@@ -28,7 +28,6 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master \
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
 EXTRA_OECONF += " ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
 
-
 FILES:${PN} += "${libdir}/matchbox-panel/*.so \
                 ${datadir}/matchbox-panel/brightness/*.png \
                 ${datadir}/matchbox-panel/startup/*.png \
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index 27bc596dfb0..ce1f425b772 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 PV = "0.2+git"
 
-
 inherit autotools pkgconfig features_check update-alternatives
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index d1cb6ac7348..253bc53e770 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -14,7 +14,6 @@ SRCREV = "7fa03051562ee81e2a5371f8b3a6d0bb6e646aa0"
 PE = "2"
 PV = "0.0+git"
 
-
 inherit cmake features_check pkgconfig
 
 DEPENDS += "gtk+3"
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
index ec74e33fcdf..83de53c26e7 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://git.yoctoproject.org/sato-icon-theme.git;protocol=https;branch=
 SRCREV = "d23f04ecb0328f655bf195df8eb04c1b734d53a9"
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 inherit autotools pkgconfig allarch gtk-icon-cache perlnative
 
 # The configure script uses pkg-config to find native binaries to execute, so
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index e58bb98458a..a2af4faed3a 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -14,7 +14,6 @@ SRCREV = "9250fa5a012d84ff45984e8c4345ee7635227756"
 SRC_URI = "git://git.yoctoproject.org/screenshot;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-
 inherit autotools pkgconfig features_check
 
 FILES:${PN} += "${libdir}/matchbox-panel/*.so"
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index b9dd0a1aa15..3869ab4a021 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://git.yoctoproject.org/xsettings-daemon;branch=master;protocol=ht
            "
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-
 inherit autotools pkgconfig gconf features_check
 
 FILES:${PN} = "${bindir}/* ${sysconfdir}"
diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
index 73334fb7289..b931495825c 100644
--- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
+++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "file://shutdown.desktop"
 
-
 S = "${UNPACKDIR}"
 
 do_install() {
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 291e98e24df..b5e3d2fc8a6 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -23,7 +23,6 @@ EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--without-sqlite2 \
 		--with-expat=${STAGING_DIR_HOST}${prefix}"
 
-
 inherit autotools lib_package binconfig multilib_script
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/apu-1-config"
diff --git a/meta/recipes-support/boost/boost-build-native_1.87.0.bb b/meta/recipes-support/boost/boost-build-native_1.87.0.bb
index e4ef9fe9dfa..5b914b6f88f 100644
--- a/meta/recipes-support/boost/boost-build-native_1.87.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.87.0.bb
@@ -14,7 +14,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
 
 inherit native
 
-
 do_compile() {
     ./bootstrap.sh
 }
diff --git a/meta/recipes-support/debianutils/debianutils_5.22.bb b/meta/recipes-support/debianutils/debianutils_5.22.bb
index 8f9dd93d79e..f0c799f31ee 100644
--- a/meta/recipes-support/debianutils/debianutils_5.22.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.22.bb
@@ -15,13 +15,11 @@ SRCREV = "528fac5c7448989f33c54599ae6e4c2b84d41e21"
 
 inherit autotools update-alternatives
 
-
 # Disable po4a (translated manpages) sub-directory, as that requires po4a to build
 do_configure:prepend() {
     sed -i -e 's:po4a::g' ${S}/Makefile.am
 }
 
-
 do_install:append() {
     if [ "${base_bindir}" != "${bindir}" ]; then
         # Debian places some utils into ${base_bindir} as does busybox
diff --git a/meta/recipes-support/gdbm/gdbm_1.24.bb b/meta/recipes-support/gdbm/gdbm_1.24.bb
index 8e3cec42957..f400462a7ab 100644
--- a/meta/recipes-support/gdbm/gdbm_1.24.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.24.bb
@@ -7,7 +7,6 @@ SECTION = "libs"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
 
-
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://run-ptest \
            file://ptest.patch \
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
index 9a605481804..4fcad4814bb 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
@@ -16,7 +16,6 @@ SRCREV = "e346cd4ed2e2102c9b195b614f3c642d23f5f6e7"
 
 DEPENDS = "glib-2.0"
 
-
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
diff --git a/meta/recipes-support/hwdata/hwdata_0.395.bb b/meta/recipes-support/hwdata/hwdata_0.395.bb
index b339621df93..bf6fc13d2d9 100644
--- a/meta/recipes-support/hwdata/hwdata_0.395.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.395.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
 SRCREV = "95c1de6c4a0d40415867b29c0791480fb8ad3cdb"
 
-
 inherit allarch
 
 do_configure() {
diff --git a/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
index ccf9cd55323..1ee9f5a8f55 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
@@ -15,7 +15,6 @@ SRCREV = "5be4d112d420706eacd913a3ebd85549fe9eeae4"
 # are inhibited by allarch
 DEPENDS = "gettext-native"
 
-
 inherit allarch autotools
 
 FILES:${PN} += "${datadir}/xml/"
diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
index 66b30cd6dde..812a30495e0 100644
--- a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
+++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
@@ -11,5 +11,4 @@ DEPENDS = "hwdata-native"
 SRC_URI = "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https"
 SRCREV = "66b802d05b374cd8f388dc6ad1e7ae4f08cb3300"
 
-
 inherit meson pkgconfig lib_package
diff --git a/meta/recipes-support/libfm/libfm_1.3.2.bb b/meta/recipes-support/libfm/libfm_1.3.2.bb
index e3cf7517164..ab29ce4b40e 100644
--- a/meta/recipes-support/libfm/libfm_1.3.2.bb
+++ b/meta/recipes-support/libfm/libfm_1.3.2.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4641e94ec96f98fabc56ff9cc48be14b \
                     file://src/base/fm-config.h;beginline=10;endline=23;md5=ef1f84da64b3c01cca447212f7ef6007 \
                     file://src/fm-gtk.h;beginline=6;endline=19;md5=646baa4955c04fe768f2ca27b92ac8dd"
 
-
 SECTION = "x11/libs"
 DEPENDS = "glib-2.0 glib-2.0-native pango gtk+3 menu-cache intltool-native libexif libfm-extra"
 
diff --git a/meta/recipes-support/libgit2/libgit2_1.9.0.bb b/meta/recipes-support/libgit2/libgit2_1.9.0.bb
index 0a5f6427ba3..66ec62f17ab 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.0.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https \
            "
 SRCREV = "338e6fb681369ff0537719095e22ce9dc602dbf0"
 
-
 inherit cmake
 
 EXTRA_OECMAKE = "\
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
index 96dac49aaec..842f54b0ff0 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/init.c;beginline=2;endline=17;md5=f01cdfcf747af5380590cfd9bbfeaaf7 \
                     "
 
-
 SECTION = "libs"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
diff --git a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb b/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
index 2f05893f08f..97988afa27b 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.6;protocol=h
            file://run-ptest \
            "
 
-
 inherit autotools-brokensep pkgconfig ptest features_check
 
 inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
diff --git a/meta/recipes-support/liburcu/liburcu_0.15.3.bb b/meta/recipes-support/liburcu/liburcu_0.15.3.bb
index ae5daed7018..fdbd79e016c 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.3.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.3.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
                     file://include/urcu/uatomic/x86.h;beginline=1;endline=6;md5=358d69272ba7b5f85e29e342430d440c \
                     "
 
-
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
 SRC_URI[sha256sum] = "26687ec84e3e114759454c884a08abeaf79dec09b041895ddf4c45ec150acb6d"
diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/lz4/lz4_1.10.0.bb
index 5dbefe7c084..9bd3cfc27be 100644
--- a/meta/recipes-support/lz4/lz4_1.10.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
            file://run-ptest"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
-
 inherit ptest
 
 CVE_STATUS[CVE-2014-4715] = "fixed-version: Fixed in r118, which is larger than the current version."
diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/lzo/lzo_2.10.bb
index 2132f1c27ff..dbe789b4e65 100644
--- a/meta/recipes-support/lzo/lzo_2.10.bb
+++ b/meta/recipes-support/lzo/lzo_2.10.bb
@@ -30,5 +30,4 @@ do_install_ptest() {
 	done
 }
 
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/numactl/numactl_2.0.19.bb b/meta/recipes-support/numactl/numactl_2.0.19.bb
index e674460dc48..5ac9380c6cb 100644
--- a/meta/recipes-support/numactl/numactl_2.0.19.bb
+++ b/meta/recipes-support/numactl/numactl_2.0.19.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://0001-define-run-test-target.patch \
            "
 
-
 LDFLAGS:append:riscv64 = " -latomic"
 LDFLAGS:append:riscv32 = " -latomic"
 
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
index adf9f6eff66..89f85e24555 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
@@ -12,7 +12,6 @@ SRCREV = "c99e8c2737ff802f110612cc2d90c60233c33255"
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
 "
 
-
 FILES:${PN} = "${bindir}/ptest-runner ${bindir}/ptest-runner-collect-system-data"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS= CFLAGS="${CFLAGS} -DDEFAULT_DIRECTORY=\\\"${libdir}\\\"""
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.17.bb b/meta/recipes-support/rng-tools/rng-tools_6.17.bb
index 019f7d3f717..c979a916400 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.17.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.17.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            "
 SRCREV = "bd00c08b0c3c6a880b0988befe97fd35b315468c"
 
-
 inherit autotools update-rc.d systemd pkgconfig
 
 EXTRA_OECONF = "--without-rtlsdr"
diff --git a/meta/recipes-support/sass/libsass_3.6.6.bb b/meta/recipes-support/sass/libsass_3.6.6.bb
index 6a2e30e8677..de608f0a6b8 100644
--- a/meta/recipes-support/sass/libsass_3.6.6.bb
+++ b/meta/recipes-support/sass/libsass_3.6.6.bb
@@ -10,5 +10,4 @@ SRC_URI = "git://github.com/sass/libsass.git;protocol=https;branch=master \
 
 SRCREV = "7037f03fabeb2b18b5efa84403f5a6d7a990f460"
 
-
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index 64d83085f41..8790a9dc117 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;
            file://0002-Handle-build-with-older-versions-of-GCC.patch"
 SRCREV = "9a6d6b8e963935f145f3a1ef446552de6996dada"
 
-
 inherit meson pkgconfig gettext python3native mime
 
 EXTRA_OEMESON = "-Dupdate-mimedb=true"
diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
index 8eb4ed89245..344f2701581 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
@@ -9,7 +9,6 @@ SRC_URI = "gitsm://github.com/nemtrif/utfcpp;protocol=https;branch=master"
 
 SRCREV = "b26a5f718f4f370af1852a0d5c6ae8fa031ba7d0"
 
-
 inherit cmake
 
 FILES:${PN}-dev += "${datadir}/utf8cpp/cmake"
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index b0cd0a3094c..278a5baeb2d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -26,7 +26,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
 # Ignore that the upstream version .z in x.y.z is always newer
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
 
 inherit autotools-brokensep update-alternatives mime-xdg pkgconfig
diff --git a/meta/recipes-support/xxhash/xxhash_0.8.3.bb b/meta/recipes-support/xxhash/xxhash_0.8.3.bb
index 0ac2b449048..15436113b1f 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.3.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.3.bb
@@ -12,7 +12,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 SRCREV = "e626a72bc2321cd320e953a0ccf1584cad60f363"
 
-
 CFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
 
 do_compile () {
-- 
2.39.5


