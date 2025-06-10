Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908BEC71132
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 09:44:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.82665.1749548658767504536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 02:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RopngL10;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45024721cbdso45335225e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 02:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548657; x=1750153457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KCeEqmtkmKOmid0u8QQqhl6v5+Hvf0K56ciBX9OX1zc=;
        b=RopngL10l6DEJwk9+/lZsEobfPxXFoUB0LHoy5GtsiaeNRZ9vl1xXRgCtk0L/NllsO
         T+y97YdFAdSTvImrio72Xgl3TeQLUfXS9Qloswi657BnOGKM2HdDnahUVAn4+UPif6yd
         pyezwavm3fTQT2m78DaXxyuFG+h576zJUtgRu8yRD5j/gAf1LrjhJsfZZ/VwtXJZ32ZP
         VE4WP5V553AZlKu4UCk1nzjeWPRS2r+CiFK/WWHqe05o0NmYF0vmSbVNdqELwfqKoiV3
         QGK1m70BafkIMh4GKrvjN/JBOy7nYBKSDHG/KJpaksF6AS54momHAIa5+BdwywHU/1tb
         UNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548657; x=1750153457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCeEqmtkmKOmid0u8QQqhl6v5+Hvf0K56ciBX9OX1zc=;
        b=Ai63fkXTvs8M3SHBz7+8l1HX0HHunGF4wKW2B3xysTFRRO4XVEnuupJOhNs4VvXsay
         cG3a8P0KB1x8HA/zR846SZitD9iNuEeZPTBT9kjHYRvb+sBU+TodjqQlmQ4W+US2Rk1K
         MGWWrUYfEvsAd8fVatTd4QEbiCfpFE8MUWcmLtpex3EhTgM6q++lbJt6tRwUhn8B7jEG
         M2BevZruwl5wQp3Ql/YdsxctKkiwaB9rz2TKUqWbpziEwVbCFj5OpQxHbqHsYPr4bt8U
         q1eew2PJZogtJS+n9hr4nIEUY15ue9XCZ5LXhsc6ljIVpKw1xB18F+hHXZs3CLbedfdy
         Sh/w==
X-Gm-Message-State: AOJu0Yy0yKglgh+Ac38I/xKAQh7py+nfosSc0uNkhIIjD746ZTRaWiGi
	5ML8579MscFc3lzspjo114h2ksvWDtldqVZJAH9FVt5nAfA/403mDHlysmzKPg==
X-Gm-Gg: ASbGncvfwlBvTssKuwbr3dwt66LohOTa+rZg1oAsh0m91PmizaF0tUrsDeQM4QmonUy
	nAuckxBc0VcojJzO/uP2VIX+BBvfLIUv2o6M702UM6ILmr6a1z06smmvCt8oamRpjtALqGAdls/
	lp63l6aDuUWk49lwRO9+bh7Pj6UsKATh1hBsPtU3QcPMGQb05BR9dKcHmusHJ1ikMET0OsrJMkP
	AcRMmQbG/W9GU2Rseqmb3mennpZ7eVqwO0ZjMXQZfN9o6+N/XlCxEubUdXszAxTNoBKSxDF04y5
	GWVoNn1B+cx+q6eRz6T5dXVEcx7wZjM52BkKj7ZtqoPsSeH59Qfaikg4o830IFxhpn2gwrMTTGl
	HC0P+JUgoSmjNF2ZH62GiIwc=
X-Google-Smtp-Source: AGHT+IHb8/JoXVhQCfy93C0yQJVdiWEyph5X/DKnP6bWhg1sxMjwIoDP4aevyMP+/ugn1aRo099aGg==
X-Received: by 2002:a05:600c:5187:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-4531ddee252mr19697775e9.3.1749548655910;
        Tue, 10 Jun 2025 02:44:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375bca3sm136569125e9.39.2025.06.10.02.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:44:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 1/9] bitbake.conf: set BB_GIT_DEFAULT_DESTSUFFIX to match default S value
Date: Tue, 10 Jun 2025 11:43:52 +0200
Message-Id: <20250610094400.1653931-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218327

From: Alexander Kanavin <alex@linutronix.de>

This allows removing all the S = ${WORKDIR}/git assignments.

A few recipes are setting S to a sub-directory of the git tree and need
to be adjusted accordingly.

bzip2 recipe is fetching a tarball and separately cloning tests;
adjust the recipe to put the latter into 'bzip2-tests', instead of 'git'.

devupstream.bbclass no longer needs to rewrite S, and is adjusted accordingly.

Adjust scripts/lib/recipetool/append.py to not hardcode 'git' as unpack
destination.

Adjust kernel-yocto.bbclass to use the git unpack variable instead
of hardcoding 'git' (there's also removal of repetition of
string constants and a correction of workdir/unpackdir mismatch in
one of the if-else branches).

Ensure build-appliance-image recipe does not use 'git' as checkout directory for
poky repo, but rather explicitly name it 'poky'.

Ensure reproducible.py code that looks for git repositories does not
hardcode 'git' but uses the destination set by BB_GIT_DEFAULT_DESTSUFFIX.

Ensure recipetool does not write out unneeded S settings into newly
created recipes that fetch from git.

Adjust selftest to not hardcode 'git' as unpack directory.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mtd/mtd-utils-selftest_git.bb             |  1 -
 .../python/python3-guessing-game_git.bb       |  1 -
 .../python3-guessing-game_git.bb.upgraded     |  1 -
 .../rust/rust-c-lib-example-bin_git.bb        |  1 -
 .../rust/rust-c-lib-example_git.bb            |  1 -
 .../sysdig/sysdig-selftest_0.28.0.bb          |  3 +--
 .../devtool/devtool-upgrade-test2_git.bb      |  1 -
 .../devtool-upgrade-test2_git.bb.upgraded     |  1 -
 .../git-submodule-test/git-submodule-test.bb  |  1 -
 .../recipes-test/gitrepotest/gitrepotest.bb   |  1 -
 .../gitunpackoffline/gitunpackoffline.inc     |  1 -
 meta/classes-recipe/devupstream.bbclass       |  6 -----
 meta/classes-recipe/kernel-yocto.bbclass      | 16 ++++++------
 meta/conf/bitbake.conf                        |  1 +
 meta/lib/oe/reproducible.py                   |  5 ++--
 meta/lib/oeqa/selftest/cases/devtool.py       | 10 +++----
 meta/lib/oeqa/selftest/cases/recipetool.py    |  2 +-
 meta/recipes-bsp/efibootmgr/efibootmgr_18.bb  |  1 -
 meta/recipes-bsp/efivar/efivar_39.bb          |  1 -
 meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb     |  1 -
 meta/recipes-bsp/opensbi/opensbi_1.6.bb       |  1 -
 meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb  |  1 -
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  1 -
 .../avahi/avahi-libnss-mdns_0.15.1.bb         |  1 -
 .../connman/connman-gnome_0.7.bb              |  1 -
 .../dhcpcd/dhcpcd_10.2.4.bb                   |  1 -
 .../libuv/libuv_1.51.0.bb                     |  1 -
 ...mobile-broadband-provider-info_20240407.bb |  2 --
 meta/recipes-connectivity/neard/neard_0.19.bb |  1 -
 .../resolvconf/resolvconf_1.93.bb             |  1 -
 .../slirp/libslirp_4.9.1.bb                   |  1 -
 meta/recipes-core/dbus-wait/dbus-wait_git.bb  |  1 -
 meta/recipes-core/fts/fts_1.2.7.bb            |  1 -
 .../glibc/cross-localedef-native_2.41.bb      |  3 +--
 meta/recipes-core/glibc/glibc_2.41.bb         |  1 -
 meta/recipes-core/ifupdown/ifupdown_0.8.44.bb |  1 -
 .../images/build-appliance-image_15.0.0.bb    |  8 +++---
 .../initscripts/init-system-helpers_1.68.bb   |  1 -
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  1 -
 meta/recipes-core/musl/gcompat_git.bb         |  1 -
 meta/recipes-core/musl/libc-test_git.bb       |  1 -
 meta/recipes-core/musl/libucontext_1.3.2.bb   |  1 -
 meta/recipes-core/musl/musl-locales_git.bb    |  1 -
 meta/recipes-core/musl/musl-obstack.bb        |  1 -
 meta/recipes-core/musl/musl-utils.bb          |  1 -
 meta/recipes-core/musl/musl_git.bb            |  1 -
 meta/recipes-core/ncurses/ncurses_6.5.bb      |  1 -
 meta/recipes-core/newlib/newlib.inc           |  1 -
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 -
 meta/recipes-core/picolibc/picolibc.inc       |  1 -
 meta/recipes-core/psplash/psplash_git.bb      |  1 -
 meta/recipes-core/seatd/seatd_0.9.1.bb        |  1 -
 .../sysfsutils/sysfsutils_2.1.1.bb            |  1 -
 meta/recipes-core/systemd/systemd.inc         |  1 -
 meta/recipes-core/ttyrun/ttyrun_2.37.0.bb     |  1 -
 .../update-rc.d/update-rc.d_0.8.bb            |  1 -
 .../bindgen-cli/bindgen-cli_0.71.1.bb         |  1 -
 .../binutils/binutils-2.44.inc                |  1 -
 .../bootchart2/bootchart2_0.14.9.bb           |  1 -
 .../btrfs-tools/btrfs-tools_6.14.bb           |  1 -
 .../createrepo-c/createrepo-c_1.2.1.bb        |  1 -
 meta/recipes-devtools/distcc/distcc_3.4.bb    |  1 -
 meta/recipes-devtools/dnf/dnf_4.22.0.bb       |  1 -
 meta/recipes-devtools/dpkg/dpkg_1.22.11.bb    |  1 -
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |  1 -
 .../erofs-utils/erofs-utils_1.8.5.bb          |  1 -
 .../fastfloat/fastfloat_8.0.2.bb              |  1 -
 meta/recipes-devtools/file/file_5.46.bb       |  1 -
 meta/recipes-devtools/fmt/fmt_11.2.0.bb       |  1 -
 .../gnu-config/gnu-config_git.bb              |  1 -
 .../libcomps/libcomps_0.1.21.bb               |  1 -
 meta/recipes-devtools/libdnf/libdnf_0.74.0.bb |  1 -
 .../libmodulemd/libmodulemd_2.15.1.bb         |  1 -
 .../librepo/librepo_1.19.0.bb                 |  1 -
 meta/recipes-devtools/mmc/mmc-utils_git.bb    |  1 -
 meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb  |  1 -
 meta/recipes-devtools/ninja/ninja_1.12.1.bb   |  1 -
 .../opkg-utils/opkg-utils_0.7.0.bb            |  1 -
 .../patchelf/patchelf_0.18.0.bb               |  1 -
 .../pkgconfig/pkgconfig_git.bb                |  1 -
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  5 ++--
 .../python/python3-calver_2025.04.17.bb       |  1 -
 .../python/python3-dtc_1.7.2.bb               |  1 -
 .../python/python3-pefile_2024.8.26.bb        |  1 -
 .../python3-unittest-automake-output_0.2.bb   |  1 -
 meta/recipes-devtools/repo/repo_2.55.bb       |  1 -
 .../rpm-sequoia-crypto-policy_git.bb          |  1 -
 .../rpm-sequoia/rpm-sequoia_1.7.0.bb          |  1 -
 meta/recipes-devtools/rpm/rpm_4.20.1.bb       |  1 -
 .../squashfs-tools/squashfs-tools_git.bb      |  1 -
 .../systemd-bootchart_235.bb                  |  1 -
 .../tcf-agent/tcf-agent_1.8.0.bb              |  2 +-
 meta/recipes-devtools/unfs3/unfs3_0.11.0.bb   |  1 -
 meta/recipes-devtools/xmlto/xmlto_0.0.29.bb   |  1 -
 .../acpica/acpica_20240827.bb                 |  1 -
 .../asciidoc/asciidoc_10.2.1.bb               |  1 -
 .../baremetal-helloworld_git.bb               |  1 -
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    | 26 +++++++++----------
 .../cracklib/cracklib_2.10.3.bb               |  2 +-
 .../iputils/iputils_20250605.bb               |  1 -
 .../recipes-extended/libaio/libaio_0.3.113.bb |  1 -
 meta/recipes-extended/libnsl/libnsl2_2.0.1.bb |  1 -
 .../recipes-extended/libnss-nis/libnss-nis.bb |  1 -
 .../libsolv/libsolv_0.7.32.bb                 |  1 -
 meta/recipes-extended/lsof/lsof_4.99.4.bb     |  1 -
 meta/recipes-extended/ltp/ltp_20250130.bb     |  1 -
 meta/recipes-extended/mdadm/mdadm_4.4.bb      |  1 -
 .../net-tools/net-tools_2.10.bb               |  1 -
 meta/recipes-extended/procps/procps_4.0.5.bb  |  1 -
 meta/recipes-extended/psmisc/psmisc_23.7.bb   |  1 -
 .../rpcsvc-proto/rpcsvc-proto.bb              |  1 -
 meta/recipes-extended/scdoc/scdoc_1.11.3.bb   |  1 -
 .../stress-ng/stress-ng_0.18.12.bb            |  1 -
 .../sysklogd/sysklogd_2.7.2.bb                |  1 -
 .../sysstat/sysstat_12.7.7.bb                 |  1 -
 .../xinetd/xinetd_2.3.15.4.bb                 |  1 -
 meta/recipes-extended/zstd/zstd_1.5.7.bb      |  1 -
 .../gi-docgen/gi-docgen_2025.3.bb             |  1 -
 meta/recipes-gnome/libhandy/libhandy_1.8.3.bb |  1 -
 .../libportal/libportal_0.9.1.bb              |  1 -
 meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb  |  1 -
 .../glslang/glslang_1.4.313.0.bb              |  1 -
 .../igt-gpu-tools/igt-gpu-tools_1.30.bb       |  1 -
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  1 -
 .../libepoxy/libepoxy_1.5.10.bb               |  1 -
 .../libfakekey/libfakekey_git.bb              |  1 -
 .../libmatchbox/libmatchbox_1.14.bb           |  1 -
 .../libva/libva-utils_2.22.0.bb               |  1 -
 .../matchbox-wm/matchbox-wm_1.2.3.bb          |  1 -
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 -
 .../shaderc/shaderc_2025.2.bb                 |  1 -
 .../spir/spirv-headers_1.4.313.0.bb           |  1 -
 .../spir/spirv-llvm-translator_20.1.2.bb      |  1 -
 .../spir/spirv-tools_1.4.313.0.bb             |  1 -
 .../virglrenderer/virglrenderer_1.1.0.bb      |  1 -
 .../vulkan/vulkan-headers_1.4.313.0.bb        |  1 -
 .../vulkan/vulkan-loader_1.4.313.0.bb         |  1 -
 .../vulkan/vulkan-samples_git.bb              |  1 -
 .../vulkan/vulkan-tools_1.4.313.0.bb          |  1 -
 .../vulkan-utility-libraries_1.4.313.0.bb     |  1 -
 .../vulkan-validation-layers_1.4.313.0.bb     |  1 -
 .../vulkan/vulkan-volk_1.4.313.0.bb           |  1 -
 meta/recipes-graphics/waffle/waffle_1.8.1.bb  |  1 -
 .../wayland/libinput_1.28.1.bb                |  1 -
 .../xcursor-transparent-theme_git.bb          |  1 -
 .../xinput-calibrator_0.8.0.bb                |  1 -
 .../xorg-driver/xf86-video-intel_git.bb       |  1 -
 .../xorg-lib/libxcvt_0.1.3.bb                 |  1 -
 .../xorg-lib/libxkbcommon_1.10.0.bb           |  1 -
 .../recipes-kernel/blktrace/blktrace_1.3.0.bb |  2 --
 meta/recipes-kernel/cryptodev/cryptodev.inc   |  1 -
 meta/recipes-kernel/dtc/dtc_1.7.2.bb          |  1 -
 .../kern-tools/kern-tools-native_git.bb       |  1 -
 .../libtraceevent/libtraceevent_1.8.4.bb      |  1 -
 .../recipes-kernel/lttng/babeltrace2_2.1.1.bb |  1 -
 .../recipes-kernel/lttng/babeltrace_1.5.11.bb |  1 -
 .../makedumpfile/makedumpfile_1.7.7.bb        |  1 -
 meta/recipes-kernel/powertop/powertop_2.15.bb |  1 -
 .../systemtap/systemtap_git.inc               |  1 -
 .../gstreamer/gst-examples_1.26.2.bb          |  2 +-
 meta/recipes-multimedia/x264/x264_git.bb      |  1 -
 meta/recipes-rt/rt-tests/rt-tests.inc         |  1 -
 meta/recipes-sato/l3afpad/l3afpad_git.bb      |  1 -
 .../matchbox-config-gtk_0.2.bb                |  1 -
 .../matchbox-desktop/matchbox-desktop_2.3.bb  |  1 -
 .../matchbox-keyboard_0.1.1.bb                |  1 -
 .../matchbox-panel-2/matchbox-panel-2_2.12.bb |  1 -
 .../matchbox-terminal_0.2.bb                  |  1 -
 .../matchbox-theme-sato_0.2.bb                |  1 -
 meta/recipes-sato/puzzles/puzzles_git.bb      |  1 -
 .../sato-icon-theme/sato-icon-theme_git.bb    |  1 -
 .../sato-screenshot/sato-screenshot_0.3.bb    |  1 -
 .../settings-daemon/settings-daemon_0.0.2.bb  |  1 -
 .../argp-standalone/argp-standalone_1.4.1.bb  |  1 -
 .../bmaptool/bmaptool_3.9.0.bb                |  1 -
 .../boost/boost-build-native_1.87.0.bb        |  1 -
 .../debianutils/debianutils_5.22.bb           |  1 -
 .../dos2unix/dos2unix_7.5.2.bb                |  2 +-
 .../gnome-desktop-testing_2021.1.bb           |  1 -
 meta/recipes-support/hwdata/hwdata_0.395.bb   |  1 -
 .../iso-codes/iso-codes_4.18.0.bb             |  1 -
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  1 -
 .../libdisplay-info/libdisplay-info_0.2.0.bb  |  1 -
 meta/recipes-support/libgit2/libgit2_1.9.0.bb |  1 -
 .../libjitterentropy_3.6.3.bb                 |  1 -
 .../libproxy/libproxy_0.5.9.bb                |  1 -
 .../libseccomp/libseccomp_2.6.0.bb            |  1 -
 meta/recipes-support/lz4/lz4_1.10.0.bb        |  1 -
 .../recipes-support/numactl/numactl_2.0.19.bb |  1 -
 .../recipes-support/p11-kit/p11-kit_0.25.5.bb |  1 -
 .../ptest-runner/ptest-runner_2.4.5.1.bb      |  1 -
 .../rng-tools/rng-tools_6.17.bb               |  1 -
 meta/recipes-support/sass/libsass_3.6.6.bb    |  1 -
 meta/recipes-support/sass/sassc_3.6.2.bb      |  1 -
 .../shared-mime-info/shared-mime-info_2.4.bb  |  1 -
 meta/recipes-support/utfcpp/utfcpp_4.0.6.bb   |  1 -
 meta/recipes-support/vim/vim.inc              |  1 -
 meta/recipes-support/xxhash/xxhash_0.8.3.bb   |  1 -
 scripts/lib/recipetool/append.py              |  4 +--
 scripts/lib/recipetool/create.py              |  3 +--
 200 files changed, 46 insertions(+), 239 deletions(-)

diff --git a/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
index ca2141c9722..e87e8f15b3e 100644
--- a/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
+++ b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
            file://0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch \
            "
 
-S = "${WORKDIR}/git"
 
 # xattr support creates an additional compile-time dependency on acl because
 # the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
diff --git a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb
index 50246a8a118..b600c24daf4 100644
--- a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb
+++ b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://git.yoctoproject.org/guessing-game.git;protocol=https;branch=ma
 PV = "0.1.0"
 SRCREV = "469c9e2230ca4fa9e391c94be6e697733e769500"
 
-S = "${WORKDIR}/git"
 
 inherit python_maturin cargo-update-recipe-crates
 
diff --git a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded
index f60a62718db..69339956cc9 100644
--- a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded
+++ b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded
@@ -12,7 +12,6 @@ SRC_URI = "git://git.yoctoproject.org/guessing-game.git;protocol=https;branch=ma
 PV = "0.2.0"
 SRCREV = "40cf004c2772ffa20ea803fa3be1528a75be3e98"
 
-S = "${WORKDIR}/git"
 
 inherit python_maturin cargo-update-recipe-crates
 
diff --git a/meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb
index 47d878597ad..890dbbbe8d1 100644
--- a/meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb
+++ b/meta-selftest/recipes-devtools/rust/rust-c-lib-example-bin_git.bb
@@ -8,7 +8,6 @@ SRC_URI = " \
 "
 
 SRCREV = "fc53c457f69aa5221ec1f8619a007e8150db5e60"
-S = "${WORKDIR}/git"
 
 DEPENDS = "rust-c-lib-example"
 
diff --git a/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb b/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
index 6e7c250b92a..0217d1718fe 100644
--- a/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
+++ b/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
@@ -8,7 +8,6 @@ SRC_URI = " \
 "
 
 SRCREV = "fc53c457f69aa5221ec1f8619a007e8150db5e60"
-S = "${WORKDIR}/git"
 
 inherit cargo_c
 
diff --git a/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb b/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
index 819f65409d6..fc5e0ee3eca 100644
--- a/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
+++ b/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
@@ -23,7 +23,7 @@ JIT:powerpc64 = ""
 RDEPENDS:${PN} = "bash"
 
 SRC_URI = "git://github.com/draios/sysdig.git;branch=dev;protocol=https;name=sysdig \
-           git://github.com/falcosecurity/libs;protocol=https;branch=master;name=falco;subdir=git/falcosecurity-libs \
+           git://github.com/falcosecurity/libs;protocol=https;branch=master;name=falco;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/falcosecurity-libs \
            file://0055-Add-cstdint-for-uintXX_t-types.patch;patchdir=./falcosecurity-libs \
            file://0099-cmake-Pass-PROBE_NAME-via-CFLAGS.patch \
            "
@@ -32,7 +32,6 @@ SRCREV_falco = "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
 
 SRCREV_FORMAT = "sysdig_falco"
 
-S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = "\
                 -DBUILD_DRIVER=OFF \
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 2558a22ce57..24ca32f86f8 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
-S = "${WORKDIR}/git"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
index eaa8bd898da..63bfed8a7af 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
@@ -14,7 +14,6 @@ SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
-S = "${WORKDIR}/git"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
index 90d9b66b2c8..055657b239a 100644
--- a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
+++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
@@ -10,7 +10,6 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
 SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
 
-S = "${WORKDIR}/git"
 
 do_test_git_as_user() {
     cd ${S}
diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
index c4806793eed..756c01cb099 100644
--- a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
@@ -13,4 +13,3 @@ SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protoco
 
 SRCREV = "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
 
-S = "${WORKDIR}/git"
diff --git a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc
index 602e895199b..59b383800cd 100644
--- a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc
+++ b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc
@@ -13,4 +13,3 @@ SRC_URI:append:gitunpack-enable-recipe = ";tag=${TAGVALUE}"
 SRCREV = "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
 SRCREV:gitunpack-enable-recipe = ""
 
-S = "${WORKDIR}/git"
diff --git a/meta/classes-recipe/devupstream.bbclass b/meta/classes-recipe/devupstream.bbclass
index d941763fb75..60026a527fc 100644
--- a/meta/classes-recipe/devupstream.bbclass
+++ b/meta/classes-recipe/devupstream.bbclass
@@ -13,9 +13,6 @@
 # SRC_URI:class-devupstream = "git://git.example.com/example;branch=master"
 # SRCREV:class-devupstream = "abcdef"
 #
-# If the first entry in SRC_URI is a git: URL then S is rewritten to
-# WORKDIR/git.
-#
 # There are a few caveats that remain to be solved:
 # - You can't build native or nativesdk recipes using for example
 #   devupstream:native, you can only build target recipes.
@@ -39,9 +36,6 @@ python devupstream_virtclass_handler () {
     src_uri = d.getVar("SRC_URI:class-devupstream") or d.getVar("SRC_URI")
     uri = bb.fetch2.URI(src_uri.split()[0])
 
-    if uri.scheme == "git" and not d.getVar("S:class-devupstream"):
-        d.setVar("S", "${WORKDIR}/git")
-
     # Modify the PV if the recipe hasn't already overridden it
     pv = d.getVar("PV")
     proto_marker = "+" + uri.scheme
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index ba93145fd3d..e53bf151941 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -388,19 +388,19 @@ do_kernel_checkout() {
 	set +e
 
 	source_dir=`echo ${S} | sed 's%/$%%'`
-	source_workdir="${UNPACKDIR}/git"
-	if [ -d "${UNPACKDIR}/git/" ]; then
+	source_unpackdir="${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
+	if [ -d "${source_unpackdir}" ]; then
 		# case: git repository
-		# if S is WORKDIR/git, then we shouldn't be moving or deleting the tree.
-		if [ "${source_dir}" != "${source_workdir}" ]; then
-			if [ -d "${source_workdir}/.git" ]; then
+		# if S is UNPACKDIR/BB_GIT_DEFAULT_DESTSUFFIX, then we shouldn't be moving or deleting the tree.
+		if [ "${source_dir}" != "${source_unpackdir}" ]; then
+			if [ -d "${source_unpackdir}/.git" ]; then
 				# regular git repository with .git
 				rm -rf ${S}
-				mv ${UNPACKDIR}/git ${S}
+				mv ${source_unpackdir} ${S}
 			else
 				# create source for bare cloned git repository
-				git clone ${WORKDIR}/git ${S}
-				rm -rf ${UNPACKDIR}/git
+				git clone ${source_unpackdir} ${S}
+				rm -rf ${source_unpackdir}
 			fi
 		fi
 		cd ${S}
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c515a07b6f4..4fa72b3d3ac 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -408,6 +408,7 @@ STAMPCLEAN = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
 BASE_WORKDIR ?= "${TMPDIR}/work"
 WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
 UNPACKDIR ??= "${WORKDIR}/sources-unpack"
+BB_GIT_DEFAULT_DESTSUFFIX = "${BP}"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
 S = "${WORKDIR}/${BP}"
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index cdb38d5aa45..0270024a83f 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -75,10 +75,11 @@ def get_source_date_epoch_from_known_files(d, sourcedir):
     return source_date_epoch
 
 def find_git_folder(d, sourcedir):
-    # First guess: UNPACKDIR/git
+    # First guess: UNPACKDIR/BB_GIT_DEFAULT_DESTSUFFIX
     # This is the default git fetcher unpack path
     unpackdir = d.getVar('UNPACKDIR')
-    gitpath = os.path.join(unpackdir, "git/.git")
+    default_destsuffix = d.getVar('BB_GIT_DEFAULT_DESTSUFFIX')
+    gitpath = os.path.join(unpackdir, default_destsuffix, ".git")
     if os.path.isdir(gitpath):
         return gitpath
 
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 0155ee62ee0..f30dba5a469 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -469,7 +469,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars = {}
         checkvars['LICENSE'] = 'GPL-2.0-only'
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
-        checkvars['S'] = '${WORKDIR}/git'
+        checkvars['S'] = None
         checkvars['PV'] = '0.1+git'
         checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/dbus-wait;protocol=https;branch=master'
         checkvars['SRCREV'] = srcrev
@@ -609,7 +609,7 @@ class DevtoolAddTests(DevtoolBase):
         recipefile = get_bb_var('FILE', testrecipe)
         self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly named')
         checkvars = {}
-        checkvars['S'] = '${WORKDIR}/git'
+        checkvars['S'] = None
         checkvars['PV'] = '1.0+git'
         checkvars['SRC_URI'] = url_branch
         checkvars['SRCREV'] = '${AUTOREV}'
@@ -628,7 +628,7 @@ class DevtoolAddTests(DevtoolBase):
         recipefile = get_bb_var('FILE', testrecipe)
         self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly named')
         checkvars = {}
-        checkvars['S'] = '${WORKDIR}/git'
+        checkvars['S'] = None
         checkvars['PV'] = '1.5+git'
         checkvars['SRC_URI'] = url_branch
         checkvars['SRCREV'] = checkrev
@@ -1627,9 +1627,9 @@ class DevtoolUpdateTests(DevtoolBase):
         # Check preconditions
         testrecipe = 'dos2unix'
         self.append_config('ERROR_QA:remove:pn-dos2unix = "patch-status"\n')
-        bb_vars = get_bb_vars(['SRC_URI', 'S', 'WORKDIR', 'FILE'], testrecipe)
+        bb_vars = get_bb_vars(['SRC_URI', 'S', 'WORKDIR', 'FILE', 'BB_GIT_DEFAULT_DESTSUFFIX'], testrecipe)
         self.assertIn('git://', bb_vars['SRC_URI'], 'This test expects the %s recipe to be a git recipe' % testrecipe)
-        workdir_git = '%s/git/' % bb_vars['WORKDIR']
+        workdir_git = '%s/%s/' % (bb_vars['WORKDIR'], bb_vars['BB_GIT_DEFAULT_DESTSUFFIX'])
         if not bb_vars['S'].startswith(workdir_git):
             self.fail('This test expects the %s recipe to be building from a subdirectory of the git repo' % testrecipe)
         subdir = bb_vars['S'].split(workdir_git, 1)[1]
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 36557f270fb..8cd639bd45b 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -385,7 +385,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars = {}
         checkvars['LICENSE'] = 'LGPL-2.1-only'
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34'
-        checkvars['S'] = '${WORKDIR}/git'
+        checkvars['S'] = None
         checkvars['PV'] = '1.11+git'
         checkvars['SRC_URI'] = srcuri + ';branch=master'
         checkvars['DEPENDS'] = set(['libcheck', 'libjpeg-turbo', 'libpng', 'libx11', 'libxext', 'pango'])
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
index fbd2f5dbc83..444cd53fdd1 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
@@ -13,7 +13,6 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https;branch=main"
 SRCREV = "c3f9f0534e32158f62c43564036878b93b9e0fd6"
 
-S = "${WORKDIR}/git"
 
 inherit pkgconfig
 
diff --git a/meta/recipes-bsp/efivar/efivar_39.bb b/meta/recipes-bsp/efivar/efivar_39.bb
index b052e3838fe..7c8e9ac43df 100644
--- a/meta/recipes-bsp/efivar/efivar_39.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            "
 SRCREV = "c47820c37ac26286559ec004de07d48d05f3308c"
 
-S = "${WORKDIR}/git"
 
 inherit pkgconfig
 
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb
index c93e06b96cf..d0be55559b9 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb
@@ -20,7 +20,6 @@ SRC_URI = "git://github.com/ncroxon/gnu-efi;protocol=https;branch=master \
            "
 SRCREV = "00cdfa66e923ab2f6683bb52cab0d0d1a9083b16"
 
-S = "${WORKDIR}/git"
 
 # llvm-objcopy fails
 # arm-poky-linux-gnueabi-llvm-objcopy: error: 't8.so': section '.dynstr' cannot be removed because it is referenced by the section '.dynamic'
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.6.bb b/meta/recipes-bsp/opensbi/opensbi_1.6.bb
index c9dfcfbe4f1..308ac43ac85 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.6.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.6.bb
@@ -12,7 +12,6 @@ SRCREV = "bd613dd92113f683052acfb23d9dc8ba60029e0a"
 SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https \
            file://0001-Makefile-Add-flag-for-reprodubility-compiler-flags.patch \
 "
-S = "${WORKDIR}/git"
 
 TARGET_DBGSRC_DIR = "/share/opensbi/*/generic/firmware/"
 
diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
index 8c7a59ba963..ef74967b813 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
@@ -13,7 +13,6 @@ SECTION = "libs"
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master"
 SRCREV = "5507339628b5caf244e1ff9d58cb3fa534b16beb"
 
-S = "${WORKDIR}/git"
 
 inherit cmake lib_package
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index fd1eab5cdde..617f5a60bb8 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -16,7 +16,6 @@ SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
-S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
 inherit pkgconfig
diff --git a/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb b/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
index 9b8275b1138..b37cd51ad19 100644
--- a/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
+++ b/meta/recipes-connectivity/avahi/avahi-libnss-mdns_0.15.1.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/lathiat/nss-mdns;branch=master;protocol=https \
 
 SRCREV = "4b3cfe818bf72d99a02b8ca8b8813cb2d6b40633"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 46b3f854c52..ab691b6580e 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://github.com/connectivity/connman-gnome.git;branch=master;protoco
            file://0001-Port-to-Gtk3.patch \
           "
 
-S = "${WORKDIR}/git"
 
 inherit autotools-brokensep gtk-icon-cache pkgconfig features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.4.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.4.bb
index dee921d21c4..bfb24aa58ce 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.4.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.4.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            "
 
 SRCREV = "93df2b254caf9639f9ffb66e0fe2b584eeba6220"
-S = "${WORKDIR}/git"
 
 # Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/libuv/libuv_1.51.0.bb b/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
index 569bff14397..ea3a858da46 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
@@ -10,7 +10,6 @@ SRCREV = "5152db2cbfeb5582e9c27c5ea1dba2cd9e10759b"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/git"
 
 inherit autotools
 
diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb
index e07b93d6955..2e8702a0452 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb
@@ -10,8 +10,6 @@ PE = "1"
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
 SRCREV = "55ba955d53305df96123534488fd160ea882b4dd"
 
-S = "${WORKDIR}/git"
-
 inherit meson
 
 DEPENDS += "libxslt-native"
diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes-connectivity/neard/neard_0.19.bb
index 9e0ac6aa697..ab52ab8b6ca 100644
--- a/meta/recipes-connectivity/neard/neard_0.19.bb
+++ b/meta/recipes-connectivity/neard/neard_0.19.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=https;bra
 
 SRCREV = "a1dc8a75cba999728e154a0f811ab9dd50c809f7"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig systemd update-rc.d
 
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
index 93e5a944d14..b64c694332c 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=un
 
 SRCREV = "ab766fa31f7939f6d879123236b4275320b7ff64"
 
-S = "${WORKDIR}/git"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
index 568bac389f5..2c6b5f06dc4 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
 SRCREV = "9c744e1e52aa0d9646ed91d789d588696292c21e"
 
-S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0"
 
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index 39363b9b3aa..b25ee6b6a35 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -13,6 +13,5 @@ PV = "0.1+git"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts_1.2.7.bb
index 10103830af8..399907ab9a8 100644
--- a/meta/recipes-core/fts/fts_1.2.7.bb
+++ b/meta/recipes-core/fts/fts_1.2.7.bb
@@ -12,7 +12,6 @@ SRCREV = "0bde52df588e8969879a2cae51c3a4774ec62472"
 
 SRC_URI = "git://github.com/pullmoll/musl-fts.git;branch=master;protocol=https"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 #
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.41.bb b/meta/recipes-core/glibc/cross-localedef-native_2.41.bb
index 5aeb84ac800..924020343dd 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.41.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.41.bb
@@ -20,7 +20,7 @@ inherit native
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
-           git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef;protocol=https \
+           git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/localedef;protocol=https \
            \
            file://0001-localedef-Add-hardlink-resolver-from-util-linux.patch \
            file://0002-localedef-fix-ups-hardlink-to-make-it-compile.patch \
@@ -37,7 +37,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
 #
 SRCREV_FORMAT = "glibc_localedef"
 
-S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--with-glibc=${S}"
 
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index 82dcf08fcd0..eb6a6740398 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -56,7 +56,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
            file://0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
 "
-S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
 PACKAGES_DYNAMIC = ""
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb
index 3e7bece41b6..500414eb47e 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=mast
            "
 SRCREV = "7d44f9ce6717a4a496fd46f28c52e12dbf5bafdd"
 
-S = "${WORKDIR}/git"
 
 
 inherit ptest update-alternatives
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 03f02d14ae8..8b43f5ef4a3 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -27,7 +27,7 @@ inherit core-image setuptools3 features_check
 REQUIRED_DISTRO_FEATURES += "xattr"
 
 SRCREV ?= "52b5f6a95de7228a12a9156a4aaa932daf54456f"
-SRC_URI = "git://git.yoctoproject.org/poky;branch=master \
+SRC_URI = "git://git.yoctoproject.org/poky;branch=master;destsuffix=poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
            file://README_VirtualBox_Guest_Additions.txt \
@@ -44,10 +44,10 @@ IMAGE_CMD:ext4:append () {
 fakeroot do_populate_poky_src () {
 	# Because fetch2's git's unpack uses -s cloneflag, the unpacked git repo
 	# will become invalid in the target.
-	rm -rf ${UNPACKDIR}/git/.git
-	rm -f ${UNPACKDIR}/git/.gitignore
+	rm -rf ${UNPACKDIR}/poky/.git
+	rm -f ${UNPACKDIR}/poky/.gitignore
 
-	cp -R ${UNPACKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
+	cp -R ${UNPACKDIR}/poky ${IMAGE_ROOTFS}/home/builder/poky
 
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/downloads
diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.68.bb b/meta/recipes-core/initscripts/init-system-helpers_1.68.bb
index 036c86a536e..03a226de56d 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.68.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.68.bb
@@ -20,7 +20,6 @@ SRCREV = "78486a4a2a305170b66ce4d907bedadbaed10daf"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))(?!_exp)"
 
-S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 55619daef7d..10705586ec4 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -16,7 +16,6 @@ SRCBRANCH ?= "master"
 
 PROVIDES = "virtual/crypt"
 
-S = "${WORKDIR}/git"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index 40fe8c6a5f5..460f759899e 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -16,7 +16,6 @@ SRC_URI:append:powerpc = "\
 PV = "1.1.0"
 SRCREV = "b7bfe0b08c52fdc72e0c1d9d4dcb2129f1642bd6"
 
-S = "${WORKDIR}/git"
 
 inherit pkgconfig linuxloader siteinfo
 
diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index f55a125a89a..bd639e059b3 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -18,7 +18,6 @@ SRC_URI = " \
 
 PV = "0+git"
 
-S = "${WORKDIR}/git"
 
 # libc-test 'make' or 'make run' command is designed to build and run tests. It
 # reports both build and test failures. The commands should be run on target.
diff --git a/meta/recipes-core/musl/libucontext_1.3.2.bb b/meta/recipes-core/musl/libucontext_1.3.2.bb
index 65ee77d06e7..10ebb6bd316 100644
--- a/meta/recipes-core/musl/libucontext_1.3.2.bb
+++ b/meta/recipes-core/musl/libucontext_1.3.2.bb
@@ -12,7 +12,6 @@ SRCREV = "a0323579ac50b9a9d4033754d089f1fed0f59a00"
 SRC_URI = "git://github.com/kaniini/libucontext;branch=master;protocol=https \
            "
 
-S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = ".*-musl.*"
 
diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-core/musl/musl-locales_git.bb
index 2815e2ddf08..d9e68e98830 100644
--- a/meta/recipes-core/musl/musl-locales_git.bb
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://git.adelielinux.org/adelie/musl-locales;protocol=https;branch=m
 PV = "1.0+git"
 SRCREV = "5663f5bfd30bf9e1e0ba3fc5fe2da6725969f30e"
 
-S = "${WORKDIR}/git"
 
 DEPENDS = "virtual/libintl gettext-native"
 
diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
index 4c71a141b24..23361400c7c 100644
--- a/meta/recipes-core/musl/musl-obstack.bb
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -16,7 +16,6 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 inherit autotools pkgconfig
 
-S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = ".*-musl.*"
 
diff --git a/meta/recipes-core/musl/musl-utils.bb b/meta/recipes-core/musl/musl-utils.bb
index 8280333daf4..05adeb16192 100644
--- a/meta/recipes-core/musl/musl-utils.bb
+++ b/meta/recipes-core/musl/musl-utils.bb
@@ -17,7 +17,6 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 inherit autotools
 
-S = "${WORKDIR}/git"
 
 PACKAGES =+ "${PN}-iconv"
 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index afc459bf1c9..1e1a9cc2624 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch \
           "
 
-S = "${WORKDIR}/git"
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
 
diff --git a/meta/recipes-core/ncurses/ncurses_6.5.bb b/meta/recipes-core/ncurses/ncurses_6.5.bb
index 2e3ee337ea4..bba3495266c 100644
--- a/meta/recipes-core/ncurses/ncurses_6.5.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.5.bb
@@ -7,7 +7,6 @@ SRC_URI += "file://0001-tic-hang.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "1c55d64d9d3e00399a21f04e9cac1e472ab5f70a"
-S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+_\d+)$"
 
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index 5b5025148e5..604bef3e24b 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -22,7 +22,6 @@ SRCREV = "5e5e51f1dc56a99eb4648c28e00d73b6ea44a8b0"
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/cross-cc"
 
-S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
 ## disable stdlib
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index aa7de3af2b0..0f0f1e09149 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -51,7 +51,6 @@ inherit deploy
 
 PARALLEL_MAKE = ""
 
-S = "${WORKDIR}/git"
 
 DEPENDS = "nasm-native acpica-native ovmf-native util-linux-native"
 
diff --git a/meta/recipes-core/picolibc/picolibc.inc b/meta/recipes-core/picolibc/picolibc.inc
index 640be819a3d..68c32894a7a 100644
--- a/meta/recipes-core/picolibc/picolibc.inc
+++ b/meta/recipes-core/picolibc/picolibc.inc
@@ -17,5 +17,4 @@ PV = "${BASEVER}+git"
 SRC_URI = "git://github.com/picolibc/picolibc.git;protocol=https;branch=main"
 SRCREV = "764ef4e401a8f4c6a86ab723533841f072885a5b"
 
-S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index f3647d389d7..ba2e097ec19 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -62,7 +62,6 @@ python __anonymous() {
             d.appendVar("RDEPENDS:%s" % pn, " %s" % ep)
 }
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d update-alternatives systemd
 
diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core/seatd/seatd_0.9.1.bb
index 87e1c3b67d6..35abcb53a83 100644
--- a/meta/recipes-core/seatd/seatd_0.9.1.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
 SRCREV = "566ffeb032af42865dc1210e48cec08368059bb9"
-S = "${WORKDIR}/git"
 
 inherit meson pkgconfig systemd update-rc.d useradd
 
diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
index 86cc06a2cdd..976823e6763 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/linux-ras/sysfsutils.git;protocol=https;branch=maste
 
 SRCREV = "da2f1f8500c0af6663a56ce2bff07f67e60a92e0"
 
-S = "${WORKDIR}/git"
 
 inherit autotools
 
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 243053a8c7c..41b885d905b 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -19,6 +19,5 @@ SRCREV = "1c93ed4c72a4513d9cefcd1f89d11a9dc828d06c"
 SRCBRANCH = "v257-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
-S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "systemd"
diff --git a/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
index e8fb4831e27..8c335cafcbe 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
@@ -11,7 +11,6 @@ SRCREV = "793c037ded98cd001075cdb55a9c58e122380256"
 
 CVE_PRODUCT = "s390-tools"
 
-S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "\
     V=1 \
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index 27723c88ef2..b5349152046 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -12,7 +12,6 @@ PV .= "+git"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-S = "${WORKDIR}/git"
 
 inherit allarch
 
diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.71.1.bb b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.71.1.bb
index 5578fb3d18b..79f24887271 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.71.1.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.71.1.bb
@@ -8,7 +8,6 @@ inherit rust cargo cargo-update-recipe-crates
 
 SRC_URI += "git://github.com/rust-lang/rust-bindgen.git;protocol=https;branch=main"
 SRCREV = "af7fd38d5e80514406fb6a8bba2d407d252c30b9"
-S = "${WORKDIR}/git"
 
 require ${BPN}-crates.inc
 
diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index c3a597cd7b9..a3ab0d2d85e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -42,4 +42,3 @@ SRC_URI = "\
      file://0017-CVE-2025-1181-2.patch \
      file://0018-CVE-2025-5245.patch \
 "
-S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 06625d099e6..16bf345d1df 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -98,7 +98,6 @@ SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master;protocol=https \
            file://0002-Makefile-Add-n-to-gzip.patch \
           "
 
-S = "${WORKDIR}/git"
 SRCREV = "868a2afab9da34f32c007d773b77253c93104636"
 
 
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
index d3d320e107c..04be9439d88 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;t
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
 SRCREV = "5ad147c9ec00e657393c85b195c9bcc0f4c35a54"
-S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
     programs \
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
index d12e3184a04..1d2ad9ebfba 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
 
 SRCREV = "8c6e6f88df86d1e34ca26d3835d77a2816326414"
 
-S = "${WORKDIR}/git"
 
 DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
 DEPENDS:append:class-native = " file-replacement-native"
diff --git a/meta/recipes-devtools/distcc/distcc_3.4.bb b/meta/recipes-devtools/distcc/distcc_3.4.bb
index ab138b3ab6f..392f4ae2725 100644
--- a/meta/recipes-devtools/distcc/distcc_3.4.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.4.bb
@@ -21,7 +21,6 @@ SRC_URI = "git://github.com/distcc/distcc.git;branch=master;protocol=https \
            file://distcc.service \
            "
 SRCREV = "50d821efe99cae82c05be0a4ab3b4035ef0d3883"
-S = "${WORKDIR}/git"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit autotools pkgconfig update-rc.d useradd systemd
diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
index e5ac3c9824c..7bb0f02d3f9 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
@@ -23,7 +23,6 @@ SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch
 SRCREV = "da9a7066be8e1628d9453428d33685225cd9c90d"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/git"
 
 inherit cmake gettext bash-completion setuptools3-base systemd
 
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
index 47a8d5d5eaf..adceebf8e6a 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
@@ -19,4 +19,3 @@ SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-
 
 SRCREV = "ee7e9118d0a9581cb00c5ce02dccd561b3096387"
 
-S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 0cb3f0e6a6f..cce6e5f1acb 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -20,7 +20,6 @@ SECTION = "base"
 DEPENDS = "util-linux attr autoconf-archive-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master;protocol=https"
-S = "${WORKDIR}/git"
 
 inherit autotools gettext texinfo pkgconfig multilib_header update-alternatives ptest
 
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
index 54ead294fb1..830cf435ce8 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;b
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
-S = "${WORKDIR}/git"
 
 DEPENDS = "util-linux-libuuid"
 
diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb
index b3f45ccef45..ca69a4238f6 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb
@@ -10,6 +10,5 @@ LIC_FILES_CHKSUM = " \
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main"
 
 SRCREV = "50a80a73ab2ab256ba1c3bf86923ddd8b4202bc7"
-S = "${WORKDIR}/git"
 
 inherit cmake
diff --git a/meta/recipes-devtools/file/file_5.46.bb b/meta/recipes-devtools/file/file_5.46.bb
index e97fac99f21..c035e0b11d8 100644
--- a/meta/recipes-devtools/file/file_5.46.bb
+++ b/meta/recipes-devtools/file/file_5.46.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
            "
 
 SRCREV = "c5aa4f7f8d5063fb3c37ad57bf54bb67ec641a09"
-S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
 
diff --git a/meta/recipes-devtools/fmt/fmt_11.2.0.bb b/meta/recipes-devtools/fmt/fmt_11.2.0.bb
index b2b8c575c8a..ce63f940255 100644
--- a/meta/recipes-devtools/fmt/fmt_11.2.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.2.0.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=${PV}\
            file://0001-Workaround-an-ABI-issue-in-spdlog.patch"
 SRCREV = "40626af88bd7df9a5fb80be7b25ac85b122d6c21"
 
-S = "${WORKDIR}/git"
 
 inherit cmake
 
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 60601d23e22..515777caf4c 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -14,7 +14,6 @@ PV = "20240823+git"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
-S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
 
 CLEANBROKEN = "1"
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
index 91170dfbed9..ee2fb10a08a 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;p
 
 SRCREV = "2e973ce22698dd64f472180e3a689755268fb06b"
 
-S = "${WORKDIR}/git"
 
 inherit cmake setuptools3-base
 
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
index 5a2d4d93642..06be5776f24 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
 SRCREV = "91a0bf9aada36a722855051526f012e0b5ab1af9"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
-S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc libmodulemd json-c swig-native util-linux"
 
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
index c31fc44ce4f..d6613131bd0 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=
 
 SRCREV = "e7f179eeeb6eee1403f090fc43a3c80bb08b5bfd"
 
-S = "${WORKDIR}/git"
 
 inherit meson gobject-introspection pkgconfig manpages
 
diff --git a/meta/recipes-devtools/librepo/librepo_1.19.0.bb b/meta/recipes-devtools/librepo/librepo_1.19.0.bb
index 634967fcbcc..d985601a28b 100644
--- a/meta/recipes-devtools/librepo/librepo_1.19.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.19.0.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
 
 SRCREV = "7955987e33ba98dddb3fc2c63bb6dc892e3505fa"
 
-S = "${WORKDIR}/git"
 
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 1f287a8df9e..fed0ef89161 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -15,7 +15,6 @@ UPSTREAM_CHECK_COMMITS = "1"
 DEPENDS = "python3-sphinx-native"
 EXTRA_OEMAKE = "C="
 
-S = "${WORKDIR}/git"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
index 2f7043b9773..52dcbcce4ab 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
            file://0004-ubifs-utils-extract_files-Include-linux-limits.h.patch \
            file://0001-Improve-check-for-GCC-compiler-version.patch"
 
-S = "${WORKDIR}/git"
 
 # xattr support creates an additional compile-time dependency on acl because
 # the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
diff --git a/meta/recipes-devtools/ninja/ninja_1.12.1.bb b/meta/recipes-devtools/ninja/ninja_1.12.1.bb
index 9f5c014b9b5..2667c932b0c 100644
--- a/meta/recipes-devtools/ninja/ninja_1.12.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.12.1.bb
@@ -11,7 +11,6 @@ SRCREV = "2daa09ba270b0a43e1929d29b073348aa985dfaa"
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
-S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
 
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
index 44958b442ed..9c5cfb837ed 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=https;branch=master \
            "
 SRCREV = "68a969f0e867ace0d94faf8ebe7c7bb67f59d386"
 
-S = "${WORKDIR}/git"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb b/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
index dece34240c5..cefc586f2f7 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
 "
 SRCREV = "99c24238981b7b1084313aca8f5c493bb46f302c"
 
-S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index af512a42b43..1ce4888e578 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://gitlab.freedesktop.org/pkg-config/pkg-config.git;branch=master;
            file://0001-Do-not-use-bool-as-a-field-name.patch \
            "
 
-S = "${WORKDIR}/git"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 4693afcaf62..385b6f34d90 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -5,15 +5,14 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://fallback-group \
            "
 SRC_URI:append:class-native = " \
-    http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=git/prebuilt;name=prebuilt \
+    http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
     file://older-glibc-symbols.patch"
 SRC_URI:append:class-nativesdk = " \
-    http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=git/prebuilt;name=prebuilt \
+    http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
 SRCREV = "2c43381180f9cfef4c0a8bb0c1658a86c3fcc876"
-S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
diff --git a/meta/recipes-devtools/python/python3-calver_2025.04.17.bb b/meta/recipes-devtools/python/python3-calver_2025.04.17.bb
index 290be21ce25..fb2fa93173e 100644
--- a/meta/recipes-devtools/python/python3-calver_2025.04.17.bb
+++ b/meta/recipes-devtools/python/python3-calver_2025.04.17.bb
@@ -8,7 +8,6 @@ SRCREV = "3b74bdce35f2814eb2b65db39a133d5c849ddea7"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-S = "${WORKDIR}/git"
 
 RDEPENDS:${PN}-ptest += " \
     python3-pretend \
diff --git a/meta/recipes-devtools/python/python3-dtc_1.7.2.bb b/meta/recipes-devtools/python/python3-dtc_1.7.2.bb
index 99ff0cca874..99eb209a9cb 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.7.2.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.7.2.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c9
 
 SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
 
-S = "${WORKDIR}/git"
 
 PYPA_WHEEL = "${S}/dist/libfdt-1.6.2*.whl"
 
diff --git a/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb b/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
index 6e72c937413..11765b3cb31 100644
--- a/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
+++ b/meta/recipes-devtools/python/python3-pefile_2024.8.26.bb
@@ -8,7 +8,6 @@ inherit setuptools3 ptest-python-pytest
 SRCREV = "4b3b1e2e568a88d4f1897d694d684f23d9e270c4"
 SRC_URI = "git://github.com/erocarrera/pefile;branch=master;protocol=https \
            file://run-ptest"
-S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
index a8b834a1265..5121a57868d 100644
--- a/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://gitlab.com/rossburton/python-unittest-automake-output;protocol=
 
 SRCREV = "aebdfb188e368c690ea55cf6c9c9ffa1a52def65"
 
-S = "${WORKDIR}/git"
 
 inherit python_flit_core
 
diff --git a/meta/recipes-devtools/repo/repo_2.55.bb b/meta/recipes-devtools/repo/repo_2.55.bb
index 5fea49abb39..e77f952f727 100644
--- a/meta/recipes-devtools/repo/repo_2.55.bb
+++ b/meta/recipes-devtools/repo/repo_2.55.bb
@@ -15,7 +15,6 @@ SRCREV = "08815ad3eb245872700201e03c47cb504d1dc3f9"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-S = "${WORKDIR}/git"
 
 do_configure:prepend() {
 	sed -Ei "s/REPO_REV\s*=\s*('|\")stable('|\")/REPO_REV = '${SRCREV}'/g" ${S}/repo
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 4ccfc95c33c..13ef83fdc7b 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -16,7 +16,6 @@ SRC_URI = " \
 SRCREV = "032b418a6db842f0eab330eb5909e4604e888728"
 UPSTREAM_CHECK_COMMITS = "1"
 
-S = "${UNPACKDIR}/git"
 
 do_compile () {
 	# Remove most policy variants, leave DEFAULT.pol
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
index 6ef626e4667..297370f7b51 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://github.com/rpm-software-management/rpm-sequoia.git;protocol=htt
 
 SRCREV = "0667e04ae7fb8cf0490919978d69883d16400e41"
 
-S = "${UNPACKDIR}/git"
 
 require ${BPN}-crates.inc
 
diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
index 7bb6993811c..a1190e8dd1e 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
@@ -44,7 +44,6 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.20.x;protoc
 PE = "1"
 SRCREV = "c8dc5ea575a2e9c1488036d12f4b75f6a5a49120"
 
-S = "${WORKDIR}/git"
 
 DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd"
 DEPENDS:append:class-native = " file-replacement-native bzip2-replacement-native"
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 982a43f8899..d438057cc1d 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -12,7 +12,6 @@ SRCREV = "d8cb82d9840330f9344ec37b992595b5d7b44184"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=v6.1.1"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
 
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
index 859c7eb906f..308ecc4be68 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_235.bb
@@ -24,7 +24,6 @@ SRC_URI:append:libc-musl = " \
 
 SRCREV = "8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7"
 
-S = "${WORKDIR}/git"
 
 DEPENDS = "systemd libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native intltool"
 
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
index b02fcb9cad1..5d759837950 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;bra
 DEPENDS = "util-linux openssl"
 RDEPENDS:${PN} = "bash"
 
-S = "${WORKDIR}/git/agent"
+S = "${UNPACKDIR}/${BP}/agent"
 
 inherit update-rc.d systemd
 
diff --git a/meta/recipes-devtools/unfs3/unfs3_0.11.0.bb b/meta/recipes-devtools/unfs3/unfs3_0.11.0.bb
index da5ca45277d..b8c235fb7cd 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.11.0.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.11.0.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c621cd2786a3a1344a60a0d608c910"
 
 DEPENDS = "bison-native flex-native libtirpc"
 
-S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master;tag=${BP}"
 SRCREV = "ec1660ba33c80d5c67131e163e68834c1a10e243"
 UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
index 1415e5d781c..613d7973ec1 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SRCREV = "74862a684907ada3d4ed2ce0f8111adf626e1456"
 SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master"
-S = "${WORKDIR}/git"
 
 inherit autotools
 
diff --git a/meta/recipes-extended/acpica/acpica_20240827.bb b/meta/recipes-extended/acpica/acpica_20240827.bb
index 7e8c68db90c..4b61e92141d 100644
--- a/meta/recipes-extended/acpica/acpica_20240827.bb
+++ b/meta/recipes-extended/acpica/acpica_20240827.bb
@@ -19,7 +19,6 @@ DEPENDS = "m4-native flex-native bison-native"
 SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master"
 SRCREV = "e80cbd7b52de20aa8c75bfba9845e9cb61f2e681"
 
-S = "${WORKDIR}/git"
 
 inherit update-alternatives
 
diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
index 0360a342b41..57b56802ed1 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
@@ -14,7 +14,6 @@ SRCREV = "21e33efe96ba9a51d99d1150691dae750afd6ed1"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-S = "${WORKDIR}/git"
 
 # Tell xmllint where to find the DocBook XML catalogue, because right now it
 # opens /etc/xml/catalog on the host. Depends on auto-catalogs.patch
diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
index 0e873604a44..2fdace01b85 100644
--- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -10,7 +10,6 @@ PV = "0.1+git"
 SRC_URI = "git://github.com/ahcbb6/baremetal-helloqemu.git;protocol=https;branch=master"
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-S = "${WORKDIR}/git"
 
 # The following variables should be set to accomodate each application
 BAREMETAL_BINNAME ?= "hello_baremetal_${MACHINE}"
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 0d7ff9edcdc..5b10821ccb0 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -14,15 +14,15 @@ LICENSE:libbz2 = "bzip2-1.0.6"
 LICENSE:${PN}-ptest = "bzip2-1.0.6 & GPL-3.0-or-later & Apache-2.0 & MS-PL & BSD-3-Clause & Zlib"
 
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664 \
-                    file://${UNPACKDIR}/git/commons-compress/LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327 \
-                    file://${UNPACKDIR}/git/dotnetzip/License.txt;md5=9cb56871eed4e748c3bc7e8ff352a54f \
-                    file://${UNPACKDIR}/git/dotnetzip/License.zlib.txt;md5=cc421ccd22eeb2e5db6b79e6de0a029f \
-                    file://${UNPACKDIR}/git/go/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
-                    file://${UNPACKDIR}/git/lbzip2/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://${UNPACKDIR}/bzip2-tests/commons-compress/LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327 \
+                    file://${UNPACKDIR}/bzip2-tests/dotnetzip/License.txt;md5=9cb56871eed4e748c3bc7e8ff352a54f \
+                    file://${UNPACKDIR}/bzip2-tests/dotnetzip/License.zlib.txt;md5=cc421ccd22eeb2e5db6b79e6de0a029f \
+                    file://${UNPACKDIR}/bzip2-tests/go/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+                    file://${UNPACKDIR}/bzip2-tests/lbzip2/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 "
 
 SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
-           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests;branch=master;protocol=https \
+           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests;branch=master;protocol=https;destsuffix=bzip2-tests/ \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
@@ -52,13 +52,13 @@ do_configure:prepend () {
 
 do_install_ptest () {
 	install -d ${D}${PTEST_PATH}/bzip2-tests
-	cp -r ${UNPACKDIR}/git/commons-compress ${D}${PTEST_PATH}/bzip2-tests/commons-compress
-	cp -r ${UNPACKDIR}/git/dotnetzip ${D}${PTEST_PATH}/bzip2-tests/dotnetzip
-	cp -r ${UNPACKDIR}/git/go ${D}${PTEST_PATH}/bzip2-tests/go
-	cp -r ${UNPACKDIR}/git/lbzip2 ${D}${PTEST_PATH}/bzip2-tests/lbzip2
-	cp -r ${UNPACKDIR}/git/pyflate ${D}${PTEST_PATH}/bzip2-tests/pyflate
-	cp ${UNPACKDIR}/git/README ${D}${PTEST_PATH}/bzip2-tests/
-	cp ${UNPACKDIR}/git/run-tests.sh ${D}${PTEST_PATH}/bzip2-tests/
+	cp -r ${UNPACKDIR}/bzip2-tests/commons-compress ${D}${PTEST_PATH}/bzip2-tests/commons-compress
+	cp -r ${UNPACKDIR}/bzip2-tests/dotnetzip ${D}${PTEST_PATH}/bzip2-tests/dotnetzip
+	cp -r ${UNPACKDIR}/bzip2-tests/go ${D}${PTEST_PATH}/bzip2-tests/go
+	cp -r ${UNPACKDIR}/bzip2-tests/lbzip2 ${D}${PTEST_PATH}/bzip2-tests/lbzip2
+	cp -r ${UNPACKDIR}/bzip2-tests/pyflate ${D}${PTEST_PATH}/bzip2-tests/pyflate
+	cp ${UNPACKDIR}/bzip2-tests/README ${D}${PTEST_PATH}/bzip2-tests/
+	cp ${UNPACKDIR}/bzip2-tests/run-tests.sh ${D}${PTEST_PATH}/bzip2-tests/
 	sed -i -e "s|^Makefile:|_Makefile:|" ${D}${PTEST_PATH}/Makefile
 }
 
diff --git a/meta/recipes-extended/cracklib/cracklib_2.10.3.bb b/meta/recipes-extended/cracklib/cracklib_2.10.3.bb
index c3396521ffe..7feba2c9509 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.10.3.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.10.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=main \
            "
 
 SRCREV = "e73d5db1789d198b5f9ec44b68b9c775c3e6c042"
-S = "${WORKDIR}/git/src"
+S = "${UNPACKDIR}/${BP}/src"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-extended/iputils/iputils_20250605.bb b/meta/recipes-extended/iputils/iputils_20250605.bb
index bb495a7d130..39d2fd8bb65 100644
--- a/meta/recipes-extended/iputils/iputils_20250605.bb
+++ b/meta/recipes-extended/iputils/iputils_20250605.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
           "
 SRCREV = "6e1cb146547eb6fbb127ffc8397a9241be0d33c2"
 
-S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>20\d+)"
 
diff --git a/meta/recipes-extended/libaio/libaio_0.3.113.bb b/meta/recipes-extended/libaio/libaio_0.3.113.bb
index 87ab22ed176..2392fd5db23 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.113.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.113.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://pagure.io/libaio.git;protocol=https;branch=master \
            file://system-linkage.patch \
            "
 SRCREV = "1b18bfafc6a2f7b9fa2c6be77a95afed8b7be448"
-S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE =+ "prefix=${prefix} includedir=${includedir} libdir=${libdir}"
 
diff --git a/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb b/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb
index 1b9be620c07..b40ff34dd8d 100644
--- a/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb
@@ -15,7 +15,6 @@ CVE_PRODUCT = "libnsl_project:libnsl"
 SRC_URI = "git://github.com/thkukuk/libnsl;branch=master;protocol=https"
 SRCREV = "d4b22e54b5e6637a69b26eab5faad2a326c9b182"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig gettext
 
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index f0e687c3305..c04c9b34f1d 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -20,7 +20,6 @@ SRCREV = "cd0d391af9535b56e612ed227c1b89be269f3d59"
 SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
           "
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.32.bb b/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
index 71786e40dce..8b927c02712 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
@@ -16,7 +16,6 @@ SRCREV = "95f64952e3270deb6be30ae4b786cae5c114c807"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/git"
 
 inherit cmake
 
diff --git a/meta/recipes-extended/lsof/lsof_4.99.4.bb b/meta/recipes-extended/lsof/lsof_4.99.4.bb
index f1ec650029a..f245666d80a 100644
--- a/meta/recipes-extended/lsof/lsof_4.99.4.bb
+++ b/meta/recipes-extended/lsof/lsof_4.99.4.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
            file://remove-host-information.patch"
 SRCREV = "bbf320ce586a848f880bca7b758d50ae4c712624"
 
-S = "${WORKDIR}/git"
 
 inherit update-alternatives autotools pkgconfig manpages
 PACKAGECONFIG[manpages] = ""
diff --git a/meta/recipes-extended/ltp/ltp_20250130.bb b/meta/recipes-extended/ltp/ltp_20250130.bb
index f9521acbc6a..e82d3ed066d 100644
--- a/meta/recipes-extended/ltp/ltp_20250130.bb
+++ b/meta/recipes-extended/ltp/ltp_20250130.bb
@@ -33,7 +33,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-cve-2015-3290-Disable-AVX-for-x86_64.patch \
            "
 
-S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig
 
diff --git a/meta/recipes-extended/mdadm/mdadm_4.4.bb b/meta/recipes-extended/mdadm/mdadm_4.4.bb
index db45df43d3d..d8ded85d4c2 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.4.bb
@@ -20,7 +20,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;bra
            "
 
 SRCREV = "8e56efac9afd7080bb42bae4b77cdad5f345633a"
-S = "${WORKDIR}/git"
 
 inherit ptest systemd
 
diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/recipes-extended/net-tools/net-tools_2.10.bb
index 7facc0cc8da..853e25e8434 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://git.code.sf.net/p/net-tools/code;protocol=https;branch=master \
     file://Add_missing_headers.patch \
 "
 
-S = "${WORKDIR}/git"
 
 inherit gettext
 
diff --git a/meta/recipes-extended/procps/procps_4.0.5.bb b/meta/recipes-extended/procps/procps_4.0.5.bb
index 3be40c38a4e..7c40b3b974e 100644
--- a/meta/recipes-extended/procps/procps_4.0.5.bb
+++ b/meta/recipes-extended/procps/procps_4.0.5.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            "
 SRCREV = "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e"
 
-S = "${WORKDIR}/git"
 
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as they
 # don't ship a po/POTFILES.in (which is silly).  Without that file gettext
diff --git a/meta/recipes-extended/psmisc/psmisc_23.7.bb b/meta/recipes-extended/psmisc/psmisc_23.7.bb
index 4128ca05335..653095c81cd 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.7.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
            "
 SRCREV = "9091d6dbcce3d8fb87adf9249a2eb346d25a562c"
-S = "${WORKDIR}/git"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index 20933153a32..dc928c736e9 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -23,7 +23,6 @@ SRC_URI = "git://github.com/thkukuk/${BPN};branch=master;protocol=https \
            file://0001-Use-cross-compiled-rpcgen.patch \
            "
 
-S = "${WORKDIR}/git"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-extended/scdoc/scdoc_1.11.3.bb b/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
index 7bbedcb66da..3641b03b90b 100644
--- a/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
+++ b/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master \
            file://0001-Makefile-drop-static.patch "
 SRCREV = "0528bcb993cac6c412acd3ae2e09539e994c0a59"
 
-S = "${WORKDIR}/git"
 
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
index b1cfdc371fb..85a0d6a7099 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV} \
            "
 SRCREV = "d4eef982dc98fe915aa82303c0a24070d0a51b00"
-S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
 
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
index ba69a7a8b8e..f8a1bac1868 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https;
 
 SRCREV = "5fb314cb9060afa3bd4eed2f0be3200f02f729e9"
 
-S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--with-systemd=${systemd_system_unitdir} --without-logger"
 
diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.7.bb b/meta/recipes-extended/sysstat/sysstat_12.7.7.bb
index 8ea47d77974..0fa4a3c9503 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.7.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.7.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master \
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRCREV = "dac10e13c70d1102aa3beea10135a3ed60520c36"
-S = "${WORKDIR}/git"
 
 DEPENDS += "base-passwd"
 
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index 111c50bdfec..93c211e3ba3 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/openSUSE/xinetd.git;protocol=https;branch=master \
 
 SRCREV = "6a4af7786630ce48747d9687e2f18f45ea6684c4"
 
-S = "${WORKDIR}/git"
 
 # https://github.com/xinetd-org/xinetd/pull/10 is merged into this git tree revision
 CVE_STATUS[CVE-2013-4342] = "fixed-version: Fixed directly in git tree revision"
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extended/zstd/zstd_1.5.7.bb
index d173558a0fb..81d05f980fc 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.7.bb
@@ -17,7 +17,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
 
-S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
index a16574955f1..58d5cb07b5f 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main
 
 SRCREV = "9ab2ab8fa3f4a04f5d2cc24b0c8e91e73bc57b51"
 
-S = "${WORKDIR}/git"
 
 inherit python_setuptools_build_meta
 
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb b/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb
index 7f5f02a7ba9..cf2c64f8d0a 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-8"
 SRCREV = "9b0071408ce86a3ef843806fddd723a85f6f2416"
-S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
 GIR_MESON_ENABLE_FLAG = 'enabled'
diff --git a/meta/recipes-gnome/libportal/libportal_0.9.1.bb b/meta/recipes-gnome/libportal/libportal_0.9.1.bb
index 970db65bc57..9713f70dbb1 100644
--- a/meta/recipes-gnome/libportal/libportal_0.9.1.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.9.1.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
 SRCREV = "8f5dc8d192f6e31dafe69e35219e3b707bde71ce"
-S = "${WORKDIR}/git"
 
 inherit meson gi-docgen gobject-introspection vala features_check pkgconfig
 GIDOCGEN_MESON_OPTION = 'docs'
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb
index 1d6ad58b682..761426148a5 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb
@@ -9,7 +9,6 @@ SRC_URI = " \
 	file://run-ptest \
 "
 SRCREV = "addcce32a3bd6a09303f052bd59fb758621d30fb"
-S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 xz zstd"
 
diff --git a/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
index 988b2ef2a31..cb754c6ac81 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
@@ -19,7 +19,6 @@ PE = "1"
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-S = "${WORKDIR}/git"
 
 inherit cmake python3native
 
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
index dad752cb199..397352b7615 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;bra
            file://0001-lib-igt_aux.c-address-procps-4.0.5-compatibility.patch \
            "
 
-S = "${WORKDIR}/git"
 
 DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native"
 RDEPENDS:${PN} += "bash perl"
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 7035dd446b9..3b976364296 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=http
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-S = "${WORKDIR}/git"
 
 BASEPV = "0.0.1"
 PV = "${BASEPV}+git"
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
index 384afa69079..2427ce3f96f 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
 SRC_URI = "git://github.com/anholt/libepoxy;branch=master;protocol=https"
 SRCREV = "c84bc9459357a40e46e2fec0408d04fbdde2c973"
-S = "${WORKDIR}/git"
 
 inherit meson pkgconfig features_check github-releases
 
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index 5f902d3a67e..5ddbbb7eae0 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -15,7 +15,6 @@ PV = "0.3+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig gettext features_check
 
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
index 87ec4c812fa..c9dbc0202bf 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
@@ -16,7 +16,6 @@ DEPENDS = "virtual/libx11 libxext"
 SRCREV = "04b214a0d5cf8285e196d90bf2332626b12c74ef"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https;tag=${PV}"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig features_check
 # depends on virtual/libx11
diff --git a/meta/recipes-graphics/libva/libva-utils_2.22.0.bb b/meta/recipes-graphics/libva/libva-utils_2.22.0.bb
index 078cd7ea0a7..de36f01afd5 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.22.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.22.0.bb
@@ -16,7 +16,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
 SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.22-branch;protocol=https"
 SRCREV = "1a13ae13382b7b548f3a7e8035e1d7df66662c0a"
-S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
 
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
index c8b6f07ed0d..29d6644f510 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
@@ -14,7 +14,6 @@ SRCREV = "ce8c1053270d960a7235ab5c3435f707541810a4"
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;branch=master;protocol=https \
            file://kbdconfig"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig features_check
 # depends on virtual/libx11
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index dc210ff56d8..d5ca3775594 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -20,7 +20,6 @@ SRCREV = "05f02cb2ff1787892cba38c3b609f892419bae87"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-S = "${WORKDIR}/git"
 
 X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
 X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
diff --git a/meta/recipes-graphics/shaderc/shaderc_2025.2.bb b/meta/recipes-graphics/shaderc/shaderc_2025.2.bb
index 8c451e6e468..9e56b978308 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2025.2.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2025.2.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v$
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
-S = "${WORKDIR}/git"
 
 inherit cmake python3native pkgconfig
 
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
index 981c2599aec..a551814689c 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
@@ -13,7 +13,6 @@ PE = "1"
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-S = "${WORKDIR}/git"
 
 inherit cmake
 
diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb
index bc2bebcda88..f5cd50ef93d 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb
@@ -14,7 +14,6 @@ SRCREV_spirv = "6dd8f2a1681a27f16c53d932d2765920f312aeb2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/git"
 
 DEPENDS = "clang spirv-tools spirv-headers"
 
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
index 57dce4f3fd2..4594a1a9426 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
@@ -17,7 +17,6 @@ PE = "1"
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-S = "${WORKDIR}/git"
 
 inherit cmake
 
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
index 07abde1c4f7..89770f7d513 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;prot
            file://0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch \
            "
 
-S = "${WORKDIR}/git"
 
 inherit meson pkgconfig features_check
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
index 12a6923ac61..c83a7ae2e26 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol
 
 SRCREV = "409c16be502e39fe70dd6fe2d9ad4842ef2c9a53"
 
-S = "${WORKDIR}/git"
 
 inherit cmake
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
index 73f80d64ff0..565652be27b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.313;protocol=https"
 SRCREV = "fb78607414e154c7a5c01b23177ba719c8a44909"
 
-S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 844e0e6b688..b7c9ddd2feb 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -13,7 +13,6 @@ UPSTREAM_CHECK_COMMITS = "1"
 SRCREV = "d27205d14d01ea7d33efc8ba2862478612370182"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
-S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = 'vulkan'
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
index 85578df467e..39c6c710179 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.313;protocol=https"
 SRCREV = "ad2f0170f9466fadd96e3fdd65fad02cd3a3739b"
 
-S = "${WORKDIR}/git"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
index 785c6f305b7..38ae1739699 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.313;protocol=https"
 SRCREV = "4e246c56ec5afb5ad66b9b04374d39ac04675c8e"
 
-S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
index 65cafa359e2..1572b4ce9be 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.313;protocol=https"
 SRCREV = "50b87dd4be883b63c10e3c4f7b9c5aac0c82efd3"
 
-S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
index 5e661080a07..ec6683dbb60 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb3d6e8051a71edca1e54bc38d35e5af"
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
 SRCREV = "43c29e655cb8117fd9cfb65ad9cefe2d40965102"
 
-S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/waffle/waffle_1.8.1.bb b/meta/recipes-graphics/waffle/waffle_1.8.1.bb
index 684124bc4d2..606881e0c91 100644
--- a/meta/recipes-graphics/waffle/waffle_1.8.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.8.1.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
 SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=maint-1.8 \
            "
 SRCREV = "49abc7cb5f73cc6852136c91da49ea3a338960e4"
-S = "${WORKDIR}/git"
 
 inherit meson features_check lib_package bash-completion pkgconfig
 
diff --git a/meta/recipes-graphics/wayland/libinput_1.28.1.bb b/meta/recipes-graphics/wayland/libinput_1.28.1.bb
index c10422bf9be..521a7f9a099 100644
--- a/meta/recipes-graphics/wayland/libinput_1.28.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.28.1.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;bra
            file://run-ptest \
            "
 SRCREV = "4f7b4ef0e4eb5d569df36be387579858eba349bb"
-S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
index 40b77422bf6..744899952a7 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
@@ -13,7 +13,6 @@ PV = "0.1.1+git"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
-S = "${WORKDIR}/git"
 
 inherit autotools allarch
 
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
index c37b36897b6..337777648ac 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://gitlab.freedesktop.org/xorg/app/xinput-calibrator;protocol=http
            file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch \
            "
 
-S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--with-gui=x11"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 0a42bd99755..fd8324409ea 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
 SRCREV = "31486f40f8e8f8923ca0799aea84b58799754564"
 PV = "2.99.917+git"
-S = "${WORKDIR}/git"
 
 SRC_URI = "git://gitlab.freedesktop.org/xorg/driver/xf86-video-intel.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
index 08194e48159..2431fae6ce5 100644
--- a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
@@ -9,7 +9,6 @@ SECTION = "x11/libs"
 SRC_URI = "git://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https;branch=master"
 SRCREV = "dd8631c61465cc0de5e476c7a98e56528d62b163"
 
-S = "${WORKDIR}/git"
 
 inherit meson
 
diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb
index e10bbf7af03..79c95cb8eda 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb
@@ -10,7 +10,6 @@ DEPENDS = "flex-native bison-native"
 SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master;tag=xkbcommon-${PV}"
 
 SRCREV = "7888474d0296dcad50c9ba4adfdfdf2be02d35e1"
-S = "${WORKDIR}/git"
 
 inherit meson pkgconfig bash-completion
 
diff --git a/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb b/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
index 061a7b97846..e678927d224 100644
--- a/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
@@ -17,8 +17,6 @@ SRC_URI = "git://git.kernel.dk/blktrace.git;protocol=https;branch=master \
 
 SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
-S = "${WORKDIR}/git"
-
 EXTRA_OEMAKE = "\
     'CC=${CC}' \
     'CFLAGS=${CFLAGS}' \
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 8d0aad4a01c..7611335c5d1 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -13,6 +13,5 @@ SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protoc
 SRCREV = "135cbff90af2ba97d88f1472be595ce78721972c"
 PV = "1.14"
 
-S = "${WORKDIR}/git"
 
 CLEANBROKEN = "1"
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.2.bb b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
index 3df95ec1ee3..7884c870860 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.2.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
@@ -15,7 +15,6 @@ SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/git"
 
 inherit meson pkgconfig
 
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 20b1bcaf37b..84b8b10a266 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -17,7 +17,6 @@ PV = "0.3+git"
 inherit native
 
 SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master;protocol=https"
-S = "${WORKDIR}/git"
 
 do_configure() {
 	:
diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
index 7a33da37c2a..b7a781e2e96 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
@@ -12,7 +12,6 @@ SRCREV = "bd47bd544c9ebc9f44bd88c2b2f2049230741058"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
           "
 
-S = "${WORKDIR}/git"
 
 inherit meson pkgconfig
 
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
index fdcb6377615..b227fe488a7 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=http
 SRCREV = "7f2f8cd6dac497cbb466efb31219b531c62013f5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig ptest python3targetconfig
 
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
index 2585747fb6b..6e1c2406481 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.5;protocol=http
 SRCREV = "91c00f70884887ff5c4849a8e3d47e311a22ba9d"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>1(\.\d+)+)$"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig ptest
 
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
index 23fcef9569b..4076e971632 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
@@ -28,7 +28,6 @@ SRC_URI = "\
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
 "
 
-S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-kernel/powertop/powertop_2.15.bb b/meta/recipes-kernel/powertop/powertop_2.15.bb
index ec81d546a86..3f9be0993a2 100644
--- a/meta/recipes-kernel/powertop/powertop_2.15.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.15.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/fenrus75/powertop;protocol=https;branch=master \
            "
 SRCREV = "d51ad395436d4d1dcc3ca46e1519ffeb475bf651"
 
-S = "${WORKDIR}/git"
 
 LDFLAGS += "-pthread"
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index a6688f26042..211cbde8831 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -12,7 +12,6 @@ SRCREV = "3a92ffe673c1621309a0b60892114495b651c9de"
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
 COMPATIBLE_HOST:libc-musl = 'null'
 
-S = "${WORKDIR}/git"
 
 # systemtap can't be built without optimization, if someone tries to compile an
 # entire image as -O0, break with fatal.
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb
index bc043f81c79..67c78d89aab 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
 
 SRCREV = "100c21e1faf68efe7f3830b6e9f856760697ab48"
 
-S = "${WORKDIR}/git/subprojects/gst-examples"
+S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
 inherit meson pkgconfig features_check
 
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index fae88d24d13..4f4ff173042 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -16,7 +16,6 @@ SRCREV = "31e19f92f00c7003fa115047ce50978bc98c3a0d"
 
 PV = "r3039+git"
 
-S = "${WORKDIR}/git"
 
 inherit lib_package pkgconfig
 
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index f28258ef58e..a2e8558c4c6 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -4,4 +4,3 @@ PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
 
-S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
index 3d8c427b69d..07a4f7a6763 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -19,7 +19,6 @@ PV = "0.8.18.1.11+git"
 SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master;protocol=https"
 SRCREV = "3cdccdc9505643e50f8208171d9eee5de11a42ff"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig features_check mime-xdg
 
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index caa34966ccc..8d5913f16be 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 PV = "0.2+git"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig features_check
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
index ab178f97e6f..c6354f05e31 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master;protocol=https \
 
 EXTRA_OECONF = "--enable-startup-notification --with-dbus"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig features_check
 
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
index a1f7862efa4..a941cd36929 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1;protoc
            file://0001-desktop-file-Hide-the-keyboard-from-app-list.patch \
            file://80matchboxkeyboard.sh"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig gettext gtk-immodules-cache features_check
 
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
index 83425f60fe1..0946c42a09d 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
@@ -28,7 +28,6 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master \
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
 EXTRA_OECONF += " ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
 
-S = "${WORKDIR}/git"
 
 FILES:${PN} += "${libdir}/matchbox-panel/*.so \
                 ${datadir}/matchbox-panel/brightness/*.png \
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index c9b01b3cfd9..27bc596dfb0 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 PV = "0.2+git"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig features_check update-alternatives
 
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
index c60a11c3c0f..ece4f25ecaf 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
@@ -5,4 +5,3 @@ SRCREV = "df085ba9cdaeaf2956890b0e29d7ea1779bf6c78"
 SRC_URI = "git://git.yoctoproject.org/matchbox-sato;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 15f6979beca..2fa78012776 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -14,7 +14,6 @@ SRCREV = "7da46412223273b3adf6d513466342b9d3a5c869"
 PE = "2"
 PV = "0.0+git"
 
-S = "${WORKDIR}/git"
 
 inherit cmake features_check pkgconfig
 
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
index 1ebbf010f37..ec74e33fcdf 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://git.yoctoproject.org/sato-icon-theme.git;protocol=https;branch=
 SRCREV = "d23f04ecb0328f655bf195df8eb04c1b734d53a9"
 UPSTREAM_CHECK_COMMITS = "1"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig allarch gtk-icon-cache perlnative
 
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index de4ab824848..e58bb98458a 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -14,7 +14,6 @@ SRCREV = "9250fa5a012d84ff45984e8c4345ee7635227756"
 SRC_URI = "git://git.yoctoproject.org/screenshot;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig features_check
 
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index aee89b2f57c..b9dd0a1aa15 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://git.yoctoproject.org/xsettings-daemon;branch=master;protocol=ht
            "
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig gconf features_check
 
diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb b/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb
index 00b60365027..74f53de6d79 100644
--- a/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb
+++ b/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/ericonr/argp-standalone;branch=master;protocol=https
            file://out_of_tree_build.patch \
           "
 SRCREV = "e5fe9ad9e83e6765cf8fa787f903d4c6792338b5"
-S = "${WORKDIR}/git"
 
 inherit autotools
 
diff --git a/meta/recipes-support/bmaptool/bmaptool_3.9.0.bb b/meta/recipes-support/bmaptool/bmaptool_3.9.0.bb
index 28750786afb..d82ce5ded45 100644
--- a/meta/recipes-support/bmaptool/bmaptool_3.9.0.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_3.9.0.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/yoctoproject/${BPN};branch=main;protocol=https"
 SRCREV = "618a7316102f6f81faa60537503012a419eafa06"
-S = "${WORKDIR}/git"
 
 # TODO: remove when we upgrade to a release past 3.9.0
 PV .= "+git"
diff --git a/meta/recipes-support/boost/boost-build-native_1.87.0.bb b/meta/recipes-support/boost/boost-build-native_1.87.0.bb
index 764f4107805..e4ef9fe9dfa 100644
--- a/meta/recipes-support/boost/boost-build-native_1.87.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.87.0.bb
@@ -14,7 +14,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
 
 inherit native
 
-S = "${WORKDIR}/git"
 
 do_compile() {
     ./bootstrap.sh
diff --git a/meta/recipes-support/debianutils/debianutils_5.22.bb b/meta/recipes-support/debianutils/debianutils_5.22.bb
index f5deead51a9..8f9dd93d79e 100644
--- a/meta/recipes-support/debianutils/debianutils_5.22.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.22.bb
@@ -15,7 +15,6 @@ SRCREV = "528fac5c7448989f33c54599ae6e4c2b84d41e21"
 
 inherit autotools update-alternatives
 
-S = "${WORKDIR}/git"
 
 # Disable po4a (translated manpages) sub-directory, as that requires po4a to build
 do_configure:prepend() {
diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
index 06338dd62f9..c3803f457be 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
@@ -13,7 +13,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
 SRCREV = "c16a0b31a64c7eb6b2d76960e5144732b57f2993"
 
-S = "${WORKDIR}/git/dos2unix"
+S = "${UNPACKDIR}/${BP}/dos2unix"
 
 inherit gettext perlnative
 
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
index 1173dd4af35..9a605481804 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
@@ -16,7 +16,6 @@ SRCREV = "e346cd4ed2e2102c9b195b614f3c642d23f5f6e7"
 
 DEPENDS = "glib-2.0"
 
-S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-support/hwdata/hwdata_0.395.bb b/meta/recipes-support/hwdata/hwdata_0.395.bb
index 73b846b181d..b339621df93 100644
--- a/meta/recipes-support/hwdata/hwdata_0.395.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.395.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
 SRCREV = "95c1de6c4a0d40415867b29c0791480fb8ad3cdb"
 
-S = "${WORKDIR}/git"
 
 inherit allarch
 
diff --git a/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
index c737cfd59f3..ccf9cd55323 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
@@ -15,7 +15,6 @@ SRCREV = "5be4d112d420706eacd913a3ebd85549fe9eeae4"
 # are inhibited by allarch
 DEPENDS = "gettext-native"
 
-S = "${WORKDIR}/git"
 
 inherit allarch autotools
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 4c8ffd41c2c..ed8712bf2b1 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=maste
            file://0001-Fix-python-path-when-invoking-py-compile-54.patch \
            "
 SRCREV = "f5d39702622208b3ada064d7b2eaeaf1454c9bd3"
-S = "${WORKDIR}/git"
 
 inherit lib_package autotools
 
diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
index f5156cc9f73..66b30cd6dde 100644
--- a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
+++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
@@ -11,6 +11,5 @@ DEPENDS = "hwdata-native"
 SRC_URI = "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https"
 SRCREV = "66b802d05b374cd8f388dc6ad1e7ae4f08cb3300"
 
-S = "${WORKDIR}/git"
 
 inherit meson pkgconfig lib_package
diff --git a/meta/recipes-support/libgit2/libgit2_1.9.0.bb b/meta/recipes-support/libgit2/libgit2_1.9.0.bb
index 47a63ca2862..0a5f6427ba3 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.0.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https \
            "
 SRCREV = "338e6fb681369ff0537719095e22ce9dc602dbf0"
 
-S = "${WORKDIR}/git"
 
 inherit cmake
 
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
index e2df8442022..7890dfa5c70 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e01027c4ad1fe5a4768f8488c945d491 \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https;tag=v${PV}"
 SRCREV = "c90ff465dcdb6a6949542c72a26a8ab496daa8cb"
-S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
 
diff --git a/meta/recipes-support/libproxy/libproxy_0.5.9.bb b/meta/recipes-support/libproxy/libproxy_0.5.9.bb
index e6192a6960e..ed8a4df2a8d 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.9.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.9.bb
@@ -15,7 +15,6 @@ DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
 SRCREV = "77e2a2b88a319974cf099c8eaaaa03030bc4c0d4"
-S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
 GIDOCGEN_MESON_OPTION = 'docs'
diff --git a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb b/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
index 949799fc82a..2f05893f08f 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.6;protocol=h
            file://run-ptest \
            "
 
-S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig ptest features_check
 
diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/lz4/lz4_1.10.0.bb
index f77a2e7bb95..5dbefe7c084 100644
--- a/meta/recipes-support/lz4/lz4_1.10.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
            file://run-ptest"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
-S = "${WORKDIR}/git"
 
 inherit ptest
 
diff --git a/meta/recipes-support/numactl/numactl_2.0.19.bb b/meta/recipes-support/numactl/numactl_2.0.19.bb
index 62f3020fef8..e674460dc48 100644
--- a/meta/recipes-support/numactl/numactl_2.0.19.bb
+++ b/meta/recipes-support/numactl/numactl_2.0.19.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://0001-define-run-test-target.patch \
            "
 
-S = "${WORKDIR}/git"
 
 LDFLAGS:append:riscv64 = " -latomic"
 LDFLAGS:append:riscv32 = " -latomic"
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
index 8c2f56be44d..d60e4abdaf1 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
@@ -13,7 +13,6 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https \
            "
 SRCREV = "0dd113361057e477f40ff4d8788f3e7e400af5f9"
-S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
index 9f6bb399b40..adf9f6eff66 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
@@ -12,7 +12,6 @@ SRCREV = "c99e8c2737ff802f110612cc2d90c60233c33255"
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
 "
 
-S = "${WORKDIR}/git"
 
 FILES:${PN} = "${bindir}/ptest-runner ${bindir}/ptest-runner-collect-system-data"
 
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.17.bb b/meta/recipes-support/rng-tools/rng-tools_6.17.bb
index fc141a984ce..019f7d3f717 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.17.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.17.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            "
 SRCREV = "bd00c08b0c3c6a880b0988befe97fd35b315468c"
 
-S = "${WORKDIR}/git"
 
 inherit autotools update-rc.d systemd pkgconfig
 
diff --git a/meta/recipes-support/sass/libsass_3.6.6.bb b/meta/recipes-support/sass/libsass_3.6.6.bb
index 3878072cf19..6a2e30e8677 100644
--- a/meta/recipes-support/sass/libsass_3.6.6.bb
+++ b/meta/recipes-support/sass/libsass_3.6.6.bb
@@ -10,6 +10,5 @@ SRC_URI = "git://github.com/sass/libsass.git;protocol=https;branch=master \
 
 SRCREV = "7037f03fabeb2b18b5efa84403f5a6d7a990f460"
 
-S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/sass/sassc_3.6.2.bb b/meta/recipes-support/sass/sassc_3.6.2.bb
index 4d4dbc03fe2..1de02f44b61 100644
--- a/meta/recipes-support/sass/sassc_3.6.2.bb
+++ b/meta/recipes-support/sass/sassc_3.6.2.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/sass/sassc.git;protocol=https;branch=master \
            file://0001-Remove-sassc_version.h-from-source-directory.patch"
 
 SRCREV = "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
-S = "${WORKDIR}/git"
 
 CVE_STATUS[CVE-2022-43357] = "cpe-incorrect: this is CVE for libsass, not sassc wrapper"
 
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index b8a377e2b23..64d83085f41 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;
            file://0002-Handle-build-with-older-versions-of-GCC.patch"
 SRCREV = "9a6d6b8e963935f145f3a1ef446552de6996dada"
 
-S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gettext python3native mime
 
diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
index 21f1879c4fb..8eb4ed89245 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
@@ -9,7 +9,6 @@ SRC_URI = "gitsm://github.com/nemtrif/utfcpp;protocol=https;branch=master"
 
 SRCREV = "b26a5f718f4f370af1852a0d5c6ae8fa031ba7d0"
 
-S = "${WORKDIR}/git"
 
 inherit cmake
 
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index b39cfadaad1..b0cd0a3094c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -26,7 +26,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
 # Ignore that the upstream version .z in x.y.z is always newer
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
 
diff --git a/meta/recipes-support/xxhash/xxhash_0.8.3.bb b/meta/recipes-support/xxhash/xxhash_0.8.3.bb
index 227649854e3..0ac2b449048 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.3.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.3.bb
@@ -12,7 +12,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 SRCREV = "e626a72bc2321cd320e953a0ccf1584cad60f363"
 
-S = "${WORKDIR}/git"
 
 CFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
 
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 10945d60084..c18926e56c6 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -336,9 +336,9 @@ def appendsrc(args, files, rd, extralines=None):
         src_destdir = os.path.dirname(srcfile)
         if not args.use_workdir:
             if rd.getVar('S') == rd.getVar('STAGING_KERNEL_DIR'):
-                srcdir = os.path.join(workdir, 'git')
+                srcdir = os.path.join(workdir, rd.getVar('BB_GIT_DEFAULT_DESTSUFFIX'))
                 if not bb.data.inherits_class('kernel-yocto', rd):
-                    logger.warning('S == STAGING_KERNEL_DIR and non-kernel-yocto, unable to determine path to srcdir, defaulting to ${WORKDIR}/git')
+                    logger.warning('S == STAGING_KERNEL_DIR and non-kernel-yocto, unable to determine path to srcdir, defaulting to ${WORKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}')
             src_destdir = os.path.join(os.path.relpath(srcdir, workdir), src_destdir)
         src_destdir = os.path.normpath(src_destdir)
 
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 94d52d60772..0fd4953f752 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -637,7 +637,6 @@ def create_recipe(args):
                     if len(splitline) > 1:
                         if splitline[0] == 'origin' and scriptutils.is_src_url(splitline[1]):
                             srcuri = reformat_git_uri(splitline[1]) + ';branch=master'
-                            srcsubdir = 'git'
                             break
 
     if args.src_subdir:
@@ -839,7 +838,7 @@ def create_recipe(args):
                 line = line.replace(realpv, '${PV}')
             if pn:
                 line = line.replace(pn, '${BPN}')
-            if line == 'S = "${WORKDIR}/${BPN}-${PV}"':
+            if line == 'S = "${WORKDIR}/${BPN}-${PV}"' or 'tmp-recipetool-' in line:
                 skipblank = True
                 continue
         elif line.startswith('SRC_URI = '):
-- 
2.39.5


