Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC967CCF2F4
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 12:29:40 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33856.1768825775734643361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 04:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mxgz+ZwR;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88a2ad13c24so38000456d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 04:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768825775; x=1769430575; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+19cX5XYU1fHaHGNpB3qBNT1DJ4ryet4dUkbMmWkb30=;
        b=Mxgz+ZwRYMMUCDx8PNAOy/ts3g+bh/6XSnHWNQzSM1bdKmHYf5ng10XWHc2P0Sq1dr
         /4zudvC/t2JejBs/WVPk4eHQTmtiX1M5VidB47CNZcwpx2IKOYkpWLyP2J4Ip8PZqNoN
         C6SXGM6s1nRwF2+HMASqx0KsSL5zbz9IOueC1hWdbu7wXevE4OU4551S4jaOT+4RjZbp
         3O3Mmrbd9YXEuhDj2F/CShNqyNKc0a2xJtkF7Wz8Bb3/4iLjq+50knXK5yRNdRz43er6
         na2FEiBihXTgEhCxcuHbEkhVH3IsL8/nYD37I+/dJ/S5gSxy2UEy7Ll6K7dJU9YY3xhm
         p1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768825775; x=1769430575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+19cX5XYU1fHaHGNpB3qBNT1DJ4ryet4dUkbMmWkb30=;
        b=kQ3FS8Rx6p20X7GdyY7Nyw53TRwbujumqmMbUszv+DPb1vJiRXU8mSTPqO5upikDNR
         zh7YyhB8s/UccWc6Xzkh4+IM7hw8h9aIne+8lVREP9JGgMpT8zpORrRLCWgngywK7eR0
         xEgx7G/l3mO4pdpfbyOQ7hSTxDAvsnYMYd8+XGWV0BXEob9LNF5/Oy6Lsm75daldl+GB
         DLr2GVRRvFbBY9+nabc5APVmxuwDqTDFvbC0yPHpZZOnNWXvnsWcxSx2CnP5ChRQsHZY
         tom4bki7y6O+OSDWSXIlXebT9PkBCAJ/z8MVXC7zcmfeQ+fpqOvU/bouu5RglLeB2XHn
         hicg==
X-Gm-Message-State: AOJu0YxoRvRUlJs50xvIL7DZ+QKxO/SFrpezwV9IBvL+zb+U+L/yTCSB
	ijuUJ1uYXGCxo9zE33WTdnXvIp3gs7R91WqpmovRX8RcTFr7PhlIbtoQU73+E0B/3scGBavRZ5J
	PfNW6GzW+ya+9pOBnQzYLQLOnRyX71Pw=
X-Gm-Gg: AZuq6aIjSW8y/h9hEg/+kVkEgjqP6wOh69m4xwviT5k9BFBnFhVSG67L0M+UImEu3iK
	H8vnBR8cmaECVbdYPtj8NuGTmi5Xx2VZAh0Q5lBrMTGSgm8Fll1csQL6je5PSoXYsXg4ajBkuev
	QT2ayf0F2KXtnW+Nf8Dl5AIZIutqrxgrwXyEg/p4ODcyBefgeb35e5TZ5+xblZ1ElKtFou+up55
	D68kNYewdWbRFvgyRlFa/fB9bMkWSLMkYOvxHF3hOGEs4hN5EnFEODLe1OAFtj5C8ScSpsh5q7F
	gVj4Q1GUacsBq1dgy8ePn3VCECufoQ==
X-Received: by 2002:a05:6214:2523:b0:88a:2e39:957e with SMTP id
 6a1803df08f44-8942dd9e90fmr120314956d6.57.1768825773031; Mon, 19 Jan 2026
 04:29:33 -0800 (PST)
MIME-Version: 1.0
References: <20260116191256.3265364-1-geissonator@yahoo.com>
In-Reply-To: <20260116191256.3265364-1-geissonator@yahoo.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Jan 2026 13:29:20 +0100
X-Gm-Features: AZwV_QjEaSuxb9FgBWQvbpH1rhlrMod8zEEM8aL5QPyVMZag8HeP4MPZIEPUQmU
Message-ID: <CANNYZj896UuNjPEzb4yOdQHe6dX=2oAxZGf6bF1Av2cGShLpNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] global: convert all http to https
To: geissonator@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Andrew Geissler <geissonator@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 12:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229610

I don't necessarily disagree with the conversion, but I would like
proper verification of all links, and not not just 'some random
validation'. You can extract all the new links from the patch and
write a script that runs wget on them perhaps.

I also want to point out that there's no mechanism to enforce
https-only layer metadata. New http links will creep in, there's no
test to stop them.

Alex

On Fri, 16 Jan 2026 at 20:13, Andrew Geissler via
lists.openembedded.org <geissonator=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Recently an internal lab network turned off all outgoing http access.
> This means we are unable to build oe-core without manually setting up a
> local cache or mirror. Given the security vulnerabilities around http and
> that moving to https appears to have no impact on building, this commit
> just moves everything over to https.
>
> I wrote a python script and had it leave the following http links as-is:
> - http://localhost, http://127.0.0.1
> - http://example.com
> - http://errors.yoctoproject.org
>
> For testing I confirmed core-image-minimal still builds and did some
> random validation of the links changed (but not every one of them).
>
> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
> ---
>  meta/conf/distro/include/maintainers.inc                  | 4 ++--
>  meta/conf/distro/include/yocto-uninative.inc              | 2 +-
>  meta/recipes-bsp/acpid/acpid.inc                          | 4 ++--
>  meta/recipes-bsp/alsa-state/alsa-state.bb                 | 4 ++--
>  meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb                 | 2 +-
>  meta/recipes-bsp/grub/grub2.inc                           | 2 +-
>  meta/recipes-bsp/libacpi/libacpi_0.2.bb                   | 6 +++---
>  meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb                   | 4 ++--
>  meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb               | 4 ++--
>  meta/recipes-bsp/setserial/setserial_2.17.bb              | 2 +-
>  meta/recipes-bsp/u-boot/u-boot-common.inc                 | 2 +-
>  meta/recipes-bsp/usbutils/usbutils_019.bb                 | 2 +-
>  meta/recipes-bsp/v86d/v86d_0.1.10.bb                      | 2 +-
>  meta/recipes-connectivity/avahi/avahi_0.8.bb              | 2 +-
>  meta/recipes-connectivity/bluez5/bluez5.inc               | 2 +-
>  meta/recipes-connectivity/connman/connman-gnome_0.7.bb    | 2 +-
>  meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb         | 2 +-
>  meta/recipes-connectivity/inetutils/inetutils_2.7.bb      | 2 +-
>  meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb     | 2 +-
>  meta/recipes-connectivity/iw/iw_6.17.bb                   | 2 +-
>  meta/recipes-connectivity/kea/kea_3.0.2.bb                | 4 ++--
>  meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb       | 4 ++--
>  .../mobile-broadband-provider-info_20251101.bb            | 2 +-
>  meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb    | 2 +-
>  meta/recipes-connectivity/ofono/ofono_2.19.bb             | 2 +-
>  meta/recipes-connectivity/openssh/openssh_10.2p1.bb       | 2 +-
>  meta/recipes-connectivity/openssl/openssl_3.5.4.bb        | 6 +++---
>  meta/recipes-connectivity/ppp/ppp_2.5.2.bb                | 4 ++--
>  meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb   | 2 +-
>  meta/recipes-connectivity/socat/socat_1.8.1.0.bb          | 4 ++--
>  .../wpa-supplicant/wpa-supplicant_2.11.bb                 | 6 +++---
>  meta/recipes-core/coreutils/coreutils_9.9.bb              | 6 +++---
>  meta/recipes-core/dbus-wait/dbus-wait_git.bb              | 2 +-
>  meta/recipes-core/dropbear/dropbear_2025.89.bb            | 6 +++---
>  meta/recipes-core/gettext/gettext-sources.inc             | 2 +-
>  meta/recipes-core/glib-2.0/glib.inc                       | 2 +-
>  .../glib-networking/glib-networking_2.80.1.bb             | 2 +-
>  meta/recipes-core/glibc/cross-localedef-native_2.42.bb    | 2 +-
>  meta/recipes-core/glibc/glibc-common.inc                  | 2 +-
>  meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb      | 2 +-
>  meta/recipes-core/kbd/kbd_2.9.0.bb                        | 2 +-
>  meta/recipes-core/libcgroup/libcgroup_3.2.0.bb            | 2 +-
>  meta/recipes-core/libxml/libxml2_2.15.1.bb                | 4 ++--
>  meta/recipes-core/musl/musl.inc                           | 2 +-
>  meta/recipes-core/ncurses/ncurses.inc                     | 2 +-
>  meta/recipes-core/netbase/netbase_6.5.bb                  | 2 +-
>  meta/recipes-core/psplash/psplash_git.bb                  | 2 +-
>  meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb          | 2 +-
>  meta/recipes-core/systemd/systemd-compat-units.bb         | 2 +-
>  meta/recipes-core/systemd/systemd.inc                     | 2 +-
>  meta/recipes-core/sysvinit/sysvinit_3.14.bb               | 2 +-
>  meta/recipes-core/update-rc.d/update-rc.d_0.8.bb          | 2 +-
>  meta/recipes-core/zlib/zlib_1.3.1.bb                      | 4 ++--
>  .../autoconf-archive/autoconf-archive_2024.10.16.bb       | 2 +-
>  meta/recipes-devtools/autoconf/autoconf_2.72.bb           | 2 +-
>  meta/recipes-devtools/automake/automake.inc               | 2 +-
>  meta/recipes-devtools/binutils/binutils.inc               | 4 ++--
>  meta/recipes-devtools/bison/bison_3.8.2.bb                | 2 +-
>  meta/recipes-devtools/ccache/ccache_4.12.2.bb             | 2 +-
>  meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb    | 2 +-
>  meta/recipes-devtools/clang/clang-cross-canadian_git.bb   | 2 +-
>  meta/recipes-devtools/clang/clang-cross_git.bb            | 2 +-
>  meta/recipes-devtools/clang/clang-crosssdk_git.bb         | 2 +-
>  meta/recipes-devtools/clang/clang_git.bb                  | 2 +-
>  meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb | 2 +-
>  meta/recipes-devtools/clang/compiler-rt_git.bb            | 2 +-
>  meta/recipes-devtools/clang/libcxx_git.bb                 | 2 +-
>  meta/recipes-devtools/clang/llvm_git.bb                   | 2 +-
>  meta/recipes-devtools/clang/nativesdk-clang-glue.bb       | 2 +-
>  meta/recipes-devtools/cmake/cmake.inc                     | 4 ++--
>  .../desktop-file-utils/desktop-file-utils_0.28.bb         | 4 ++--
>  meta/recipes-devtools/diffstat/diffstat_1.68.bb           | 4 ++--
>  meta/recipes-devtools/dmidecode/dmidecode_3.7.bb          | 2 +-
>  meta/recipes-devtools/dnf/dnf_4.24.0.bb                   | 2 +-
>  .../docbook-xml/docbook-xsl-stylesheets_1.79.1.bb         | 4 ++--
>  meta/recipes-devtools/e2fsprogs/e2fsprogs.inc             | 2 +-
>  meta/recipes-devtools/elfutils/elfutils_0.194.bb          | 2 +-
>  meta/recipes-devtools/expect/expect_5.45.4.bb             | 4 ++--
>  meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb            | 2 +-
>  meta/recipes-devtools/file/file_5.46.bb                   | 2 +-
>  meta/recipes-devtools/flex/flex_2.6.4.bb                  | 2 +-
>  meta/recipes-devtools/gcc/gcc-common.inc                  | 2 +-
>  meta/recipes-devtools/gdb/gdb-common.inc                  | 2 +-
>  meta/recipes-devtools/git/git_2.52.0.bb                   | 2 +-
>  meta/recipes-devtools/go/go-binary-native_1.25.5.bb       | 2 +-
>  meta/recipes-devtools/go/go-common.inc                    | 2 +-
>  meta/recipes-devtools/intltool/intltool_0.51.0.bb         | 2 +-
>  meta/recipes-devtools/libedit/libedit_20251016-3.1.bb     | 4 ++--
>  meta/recipes-devtools/libtool/libtool-2.5.4.inc           | 2 +-
>  meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb        | 4 ++--
>  meta/recipes-devtools/lua/lua_5.4.8.bb                    | 6 +++---
>  meta/recipes-devtools/make/make.inc                       | 2 +-
>  meta/recipes-devtools/meson/meson_1.10.0.bb               | 2 +-
>  meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb              | 2 +-
>  meta/recipes-devtools/mtools/mtools_4.0.49.bb             | 2 +-
>  meta/recipes-devtools/nasm/nasm_3.01.bb                   | 4 ++--
>  meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb      | 2 +-
>  meta/recipes-devtools/opkg/opkg_0.9.0.bb                  | 2 +-
>  meta/recipes-devtools/orc/orc_0.4.41.bb                   | 4 ++--
>  meta/recipes-devtools/patch/patch.inc                     | 2 +-
>  meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb     | 2 +-
>  meta/recipes-devtools/perl/libxml-perl_0.08.bb            | 2 +-
>  meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb     | 2 +-
>  meta/recipes-devtools/perl/perl_5.40.2.bb                 | 2 +-
>  meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb            | 2 +-
>  meta/recipes-devtools/pkgconfig/pkgconfig_git.bb          | 4 ++--
>  meta/recipes-devtools/pseudo/pseudo.inc                   | 2 +-
>  meta/recipes-devtools/pseudo/pseudo_git.bb                | 4 ++--
>  meta/recipes-devtools/python/python-pycryptodome.inc      | 2 +-
>  meta/recipes-devtools/python/python3-attrs_25.4.0.bb      | 2 +-
>  meta/recipes-devtools/python/python3-babel_2.17.0.bb      | 2 +-
>  meta/recipes-devtools/python/python3-certifi_2026.1.4.bb  | 2 +-
>  meta/recipes-devtools/python/python3-cffi_2.0.0.bb        | 2 +-
>  meta/recipes-devtools/python/python3-click_8.3.1.bb       | 2 +-
>  meta/recipes-devtools/python/python3-dbus_1.4.0.bb        | 4 ++--
>  meta/recipes-devtools/python/python3-docutils_0.22.4.bb   | 2 +-
>  meta/recipes-devtools/python/python3-git_3.1.43.bb        | 2 +-
>  meta/recipes-devtools/python/python3-gitdb_4.0.12.bb      | 2 +-
>  meta/recipes-devtools/python/python3-iso8601_2.1.0.bb     | 2 +-
>  meta/recipes-devtools/python/python3-magic_0.4.27.bb      | 2 +-
>  meta/recipes-devtools/python/python3-mako_1.3.10.bb       | 2 +-
>  meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb  | 2 +-
>  meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb      | 2 +-
>  meta/recipes-devtools/python/python3-pycairo_1.29.0.bb    | 4 ++--
>  meta/recipes-devtools/python/python3-pygments_2.19.2.bb   | 2 +-
>  meta/recipes-devtools/python/python3-pysocks_1.7.1.bb     | 2 +-
>  meta/recipes-devtools/python/python3-pytz_2025.2.bb       | 2 +-
>  .../python/python3-semantic-version_2.10.0.bb             | 2 +-
>  meta/recipes-devtools/python/python3-smmap_6.0.0.bb       | 2 +-
>  .../python/python3-sortedcontainers_2.4.0.bb              | 2 +-
>  meta/recipes-devtools/python/python3-sphinx_9.1.0.bb      | 2 +-
>  .../python/python3-sphinxcontrib-qthelp_2.0.0.bb          | 2 +-
>  meta/recipes-devtools/python/python3_3.13.11.bb           | 4 ++--
>  meta/recipes-devtools/qemu/qemu.inc                       | 2 +-
>  meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb       | 2 +-
>  meta/recipes-devtools/quilt/quilt.inc                     | 2 +-
>  meta/recipes-devtools/rpm/rpm_4.20.1.bb                   | 2 +-
>  meta/recipes-devtools/rsync/rsync_3.4.1.bb                | 4 ++--
>  meta/recipes-devtools/ruby/ruby_3.4.7.bb                  | 4 ++--
>  meta/recipes-devtools/rust/libstd-rs_1.92.0.bb            | 2 +-
>  meta/recipes-devtools/rust/rust_1.92.0.bb                 | 2 +-
>  meta/recipes-devtools/strace/strace_6.18.bb               | 2 +-
>  meta/recipes-devtools/subversion/subversion_1.14.5.bb     | 2 +-
>  meta/recipes-devtools/swig/swig_4.4.1.bb                  | 2 +-
>  meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb      | 2 +-
>  meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb        | 2 +-
>  meta/recipes-devtools/tcltk/tcl_9.0.3.bb                  | 4 ++--
>  meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb               | 4 ++--
>  meta/recipes-devtools/unifdef/unifdef_2.12.bb             | 4 ++--
>  meta/recipes-devtools/vala/vala_0.56.18.bb                | 2 +-
>  meta/recipes-devtools/valgrind/valgrind_3.26.0.bb         | 4 ++--
>  meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb         | 2 +-
>  meta/recipes-extended/at/at_3.2.5.bb                      | 2 +-
>  meta/recipes-extended/bash/bash.inc                       | 2 +-
>  meta/recipes-extended/bc/bc_1.08.2.bb                     | 2 +-
>  meta/recipes-extended/cpio/cpio_2.15.bb                   | 2 +-
>  meta/recipes-extended/ed/ed_1.22.4.bb                     | 2 +-
>  meta/recipes-extended/ethtool/ethtool_6.15.bb             | 2 +-
>  meta/recipes-extended/findutils/findutils.inc             | 4 ++--
>  meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb  | 2 +-
>  meta/recipes-extended/gperf/gperf_3.3.bb                  | 2 +-
>  meta/recipes-extended/grep/grep_3.12.bb                   | 4 ++--
>  meta/recipes-extended/groff/groff_1.23.0.bb               | 2 +-
>  meta/recipes-extended/gzip/gzip.inc                       | 2 +-
>  meta/recipes-extended/hdparm/hdparm_9.65.bb               | 2 +-
>  meta/recipes-extended/iptables/iptables_1.8.11.bb         | 6 +++---
>  meta/recipes-extended/less/less_685.bb                    | 6 +++---
>  meta/recipes-extended/libaio/libaio_0.3.113.bb            | 2 +-
>  meta/recipes-extended/libarchive/libarchive_3.8.5.bb      | 2 +-
>  meta/recipes-extended/libidn/libidn2_2.3.8.bb             | 2 +-
>  meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb    | 2 +-
>  meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb          | 4 ++--
>  meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb         | 6 +++---
>  meta/recipes-extended/lsof/lsof_4.99.5.bb                 | 2 +-
>  meta/recipes-extended/ltp/ltp_20250930.bb                 | 4 ++--
>  meta/recipes-extended/lzip/lzip_1.25.bb                   | 2 +-
>  meta/recipes-extended/man-db/man-db_2.13.1.bb             | 2 +-
>  meta/recipes-extended/man-pages/man-pages_6.16.bb         | 2 +-
>  meta/recipes-extended/mc/mc_4.8.33.bb                     | 4 ++--
>  meta/recipes-extended/mdadm/mdadm_4.4.bb                  | 2 +-
>  meta/recipes-extended/mingetty/mingetty_1.08.bb           | 2 +-
>  meta/recipes-extended/net-tools/net-tools_2.10.bb         | 4 ++--
>  meta/recipes-extended/parted/parted_3.6.bb                | 2 +-
>  .../perl/libxml-namespacesupport-perl_1.12.bb             | 2 +-
>  meta/recipes-extended/pigz/pigz_2.8.bb                    | 6 +++---
>  meta/recipes-extended/psmisc/psmisc_23.7.bb               | 2 +-
>  meta/recipes-extended/quota/quota_4.11.bb                 | 6 +++---
>  meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb            | 4 ++--
>  meta/recipes-extended/screen/screen_5.0.1.bb              | 2 +-
>  meta/recipes-extended/sed/sed_4.9.bb                      | 2 +-
>  meta/recipes-extended/shadow/shadow-sysroot_4.6.bb        | 4 ++--
>  meta/recipes-extended/shadow/shadow_4.18.0.bb             | 4 ++--
>  meta/recipes-extended/slang/slang_2.3.3.bb                | 8 ++++----
>  meta/recipes-extended/sudo/sudo.inc                       | 4 ++--
>  meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb          | 2 +-
>  meta/recipes-extended/tar/tar_1.35.bb                     | 2 +-
>  meta/recipes-extended/texinfo/texinfo_7.2.bb              | 2 +-
>  meta/recipes-extended/time/time_1.9.bb                    | 2 +-
>  meta/recipes-extended/timezone/timezone.inc               | 8 ++++----
>  meta/recipes-extended/unzip/unzip_6.0.bb                  | 2 +-
>  meta/recipes-extended/watchdog/watchdog-config.bb         | 4 ++--
>  meta/recipes-extended/watchdog/watchdog_5.16.bb           | 6 +++---
>  meta/recipes-extended/zip/zip_3.0.bb                      | 2 +-
>  meta/recipes-extended/zstd/zstd_1.5.7.bb                  | 2 +-
>  meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb                  | 2 +-
>  meta/recipes-gnome/gtk+/gtk4_4.20.2.bb                    | 2 +-
>  meta/recipes-graphics/cairo/cairo_1.18.4.bb               | 4 ++--
>  meta/recipes-graphics/drm/libdrm_2.4.131.bb               | 4 ++--
>  meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb     | 2 +-
>  meta/recipes-graphics/glew/glew_2.2.0.bb                  | 6 +++---
>  meta/recipes-graphics/graphene/graphene_1.10.8.bb         | 2 +-
>  meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb         | 2 +-
>  meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb         | 2 +-
>  meta/recipes-graphics/libfakekey/libfakekey_git.bb        | 4 ++--
>  meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb     | 4 ++--
>  meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb          | 4 ++--
>  .../matchbox-session/matchbox-session_0.1.bb              | 4 ++--
>  meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb    | 4 ++--
>  meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb      | 4 ++--
>  meta/recipes-graphics/mesa/libglu_9.0.3.bb                | 2 +-
>  meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb            | 2 +-
>  meta/recipes-graphics/mesa/mesa.inc                       | 2 +-
>  .../recipes-graphics/mini-x-session/mini-x-session_0.1.bb | 4 ++--
>  meta/recipes-graphics/pango/pango_1.57.0.bb               | 4 ++--
>  .../startup-notification/startup-notification_0.12.bb     | 4 ++--
>  meta/recipes-graphics/wayland/libinput_1.30.1.bb          | 2 +-
>  meta/recipes-graphics/wayland/mtdev_1.1.7.bb              | 4 ++--
>  meta/recipes-graphics/wayland/wayland-protocols_1.47.bb   | 2 +-
>  meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb      | 2 +-
>  meta/recipes-graphics/wayland/wayland_1.24.0.bb           | 2 +-
>  meta/recipes-graphics/wayland/weston_14.0.2.bb            | 2 +-
>  .../xcursor-transparent-theme_git.bb                      | 4 ++--
>  .../xinput-calibrator/xinput-calibrator_0.8.0.bb          | 2 +-
>  meta/recipes-graphics/xorg-app/xorg-app-common.inc        | 2 +-
>  meta/recipes-graphics/xorg-driver/xorg-driver-common.inc  | 2 +-
>  meta/recipes-graphics/xorg-font/xorg-font-common.inc      | 2 +-
>  meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb     | 2 +-
>  meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb     | 2 +-
>  meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb    | 6 +++---
>  meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb           | 4 ++--
>  meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb     | 2 +-
>  meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb           | 4 ++--
>  meta/recipes-graphics/xorg-lib/xcb-util.inc               | 4 ++--
>  meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb          | 2 +-
>  meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb   | 2 +-
>  meta/recipes-graphics/xorg-lib/xorg-lib-common.inc        | 2 +-
>  meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb      | 2 +-
>  meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb      | 2 +-
>  meta/recipes-graphics/xorg-util/xorg-util-common.inc      | 2 +-
>  .../xorg-xserver/xserver-xf86-config_0.1.bb               | 2 +-
>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc       | 2 +-
>  meta/recipes-graphics/xrestop/xrestop_0.4.bb              | 4 ++--
>  meta/recipes-kernel/blktrace/blktrace_1.3.0.bb            | 2 +-
>  meta/recipes-kernel/cryptodev/cryptodev.inc               | 2 +-
>  meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb           | 2 +-
>  meta/recipes-kernel/kmod/kmod_34.2.bb                     | 2 +-
>  meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb            | 2 +-
>  meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb             | 2 +-
>  meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb         | 4 ++--
>  meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb       | 4 ++--
>  meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb         | 4 ++--
>  meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb       | 4 ++--
>  meta/recipes-multimedia/flac/flac_1.5.0.bb                | 2 +-
>  .../gstreamer/gstreamer1.0-libav_1.26.9.bb                | 2 +-
>  .../gstreamer/gstreamer1.0-python_1.26.9.bb               | 2 +-
>  .../gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb          | 2 +-
>  meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb  | 2 +-
>  meta/recipes-multimedia/lame/lame_3.100.bb                | 2 +-
>  meta/recipes-multimedia/libogg/libogg_1.3.6.bb            | 4 ++--
>  meta/recipes-multimedia/libpng/libpng_1.6.53.bb           | 4 ++--
>  meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb      | 4 ++--
>  meta/recipes-multimedia/libtiff/tiff_4.7.1.bb             | 4 ++--
>  meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb      | 2 +-
>  meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb           | 4 ++--
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc         | 2 +-
>  meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb     | 2 +-
>  meta/recipes-multimedia/speex/speex_1.2.1.bb              | 4 ++--
>  meta/recipes-multimedia/speex/speexdsp_1.2.1.bb           | 4 ++--
>  meta/recipes-multimedia/webp/libwebp_1.6.0.bb             | 2 +-
>  meta/recipes-multimedia/x264/x264_git.bb                  | 2 +-
>  meta/recipes-sato/libptytty/libptytty_2.0.bb              | 4 ++--
>  .../matchbox-config-gtk/matchbox-config-gtk_0.2.bb        | 4 ++--
>  .../recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb | 4 ++--
>  .../matchbox-keyboard/matchbox-keyboard_0.1.1.bb          | 4 ++--
>  .../matchbox-panel-2/matchbox-panel-2_2.12.bb             | 4 ++--
>  .../matchbox-sato/matchbox-session-sato_0.1.bb            | 4 ++--
>  .../matchbox-terminal/matchbox-terminal_0.2.bb            | 4 ++--
>  .../matchbox-theme-sato/matchbox-theme-sato.inc           | 4 ++--
>  meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb                | 4 ++--
>  meta/recipes-sato/puzzles/puzzles_git.bb                  | 2 +-
>  meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc           | 2 +-
>  .../sato-icon-theme/icon-naming-utils_0.8.90.bb           | 2 +-
>  meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb  | 2 +-
>  meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb  | 4 ++--
>  .../recipes-sato/settings-daemon/settings-daemon_0.0.2.bb | 2 +-
>  meta/recipes-support/apr/apr-util_1.6.3.bb                | 2 +-
>  meta/recipes-support/apr/apr_1.7.6.bb                     | 2 +-
>  meta/recipes-support/aspell/aspell_0.60.8.1.bb            | 2 +-
>  meta/recipes-support/atk/at-spi2-core_2.58.3.bb           | 2 +-
>  meta/recipes-support/attr/acl_2.3.2.bb                    | 4 ++--
>  meta/recipes-support/attr/attr_2.5.2.bb                   | 2 +-
>  meta/recipes-support/boost/boost-1.90.0.inc               | 4 ++--
>  .../ca-certificates/ca-certificates_20250419.bb           | 2 +-
>  meta/recipes-support/consolekit/consolekit_0.4.6.bb       | 4 ++--
>  meta/recipes-support/dos2unix/dos2unix_7.5.3.bb           | 2 +-
>  meta/recipes-support/fribidi/fribidi_1.0.16.bb            | 2 +-
>  meta/recipes-support/gdbm/gdbm_1.26.bb                    | 2 +-
>  meta/recipes-support/gmp/gmp.inc                          | 2 +-
>  meta/recipes-support/gnupg/gnupg_2.5.14.bb                | 2 +-
>  meta/recipes-support/gnutls/libtasn1_4.20.0.bb            | 2 +-
>  meta/recipes-support/gpgme/gpgme_2.0.1.bb                 | 2 +-
>  meta/recipes-support/itstool/itstool_2.0.7.bb             | 4 ++--
>  meta/recipes-support/libassuan/libassuan_3.0.2.bb         | 2 +-
>  meta/recipes-support/libcap/libcap_2.77.bb                | 2 +-
>  meta/recipes-support/libdaemon/libdaemon_0.14.bb          | 4 ++--
>  meta/recipes-support/libevdev/libevdev_1.13.6.bb          | 4 ++--
>  meta/recipes-support/libevent/libevent_2.1.12.bb          | 2 +-
>  meta/recipes-support/libffi/libffi_3.5.2.bb               | 2 +-
>  meta/recipes-support/libfm/libfm-extra_1.3.2.bb           | 2 +-
>  meta/recipes-support/libfm/libfm_1.3.2.bb                 | 2 +-
>  meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb        | 2 +-
>  meta/recipes-support/libgit2/libgit2_1.9.2.bb             | 2 +-
>  meta/recipes-support/libgpg-error/libgpg-error_1.58.bb    | 2 +-
>  .../libjitterentropy/libjitterentropy_3.6.3.bb            | 2 +-
>  meta/recipes-support/libksba/libksba_1.6.7.bb             | 2 +-
>  meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb | 2 +-
>  meta/recipes-support/libmpc/libmpc.inc                    | 2 +-
>  meta/recipes-support/libpcre/libpcre2_10.47.bb            | 2 +-
>  meta/recipes-support/libpcre/libpcre_8.45.bb              | 2 +-
>  meta/recipes-support/libssh2/libssh2_1.11.1.bb            | 4 ++--
>  meta/recipes-support/libunistring/libunistring_1.4.1.bb   | 2 +-
>  meta/recipes-support/libunwind/libunwind_1.8.3.bb         | 2 +-
>  meta/recipes-support/liburcu/liburcu_0.15.5.bb            | 6 +++---
>  meta/recipes-support/libusb/libusb1_1.0.29.bb             | 2 +-
>  meta/recipes-support/libxslt/libxslt_1.1.45.bb            | 2 +-
>  meta/recipes-support/lzo/lzo_2.10.bb                      | 4 ++--
>  meta/recipes-support/lzop/lzop_1.04.bb                    | 4 ++--
>  meta/recipes-support/mpfr/mpfr_4.2.2.bb                   | 2 +-
>  meta/recipes-support/nettle/nettle_3.10.2.bb              | 2 +-
>  meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb | 4 ++--
>  meta/recipes-support/numactl/numactl_2.0.19.bb            | 2 +-
>  meta/recipes-support/pinentry/pinentry_1.3.2.bb           | 4 ++--
>  meta/recipes-support/popt/popt_1.19.bb                    | 2 +-
>  meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb | 2 +-
>  meta/recipes-support/re2c/re2c_4.3.1.bb                   | 2 +-
>  meta/recipes-support/sass/libsass_3.6.6.bb                | 2 +-
>  meta/recipes-support/serf/serf_1.3.10.bb                  | 2 +-
>  .../shared-mime-info/shared-mime-info_2.4.bb              | 2 +-
>  meta/recipes-support/sqlite/sqlite3.inc                   | 4 ++--
>  meta/recipes-support/sqlite/sqlite3_3.51.2.bb             | 2 +-
>  meta/recipes-support/taglib/taglib_2.1.1.bb               | 4 ++--
>  meta/recipes-support/xxhash/xxhash_0.8.3.bb               | 2 +-
>  352 files changed, 482 insertions(+), 482 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index e830648945..45cc238422 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -12,11 +12,11 @@
>  # questions in the future), but please try to do the following first:
>  #
>  #  - look in the Yocto Project Bugzilla
> -#    (http://bugzilla.yoctoproject.org/) to see if a problem has
> +#    (https://bugzilla.yoctoproject.org/) to see if a problem has
>  #    already been reported
>  #
>  # - look through recent entries of the appropriate mailing list archives
> -#   (http://lists.linuxtogo.org/pipermail/openembedded-core or
> +#   (https://lists.linuxtogo.org/pipermail/openembedded-core or
>  #    https://lists.yoctoproject.org/pipermail/poky/) to see if other
>  #   people have run into similar problems or had similar questions
>  #   answered.
> diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/dis=
tro/include/yocto-uninative.inc
> index e9dc6c8640..cc8f2e9f5f 100644
> --- a/meta/conf/distro/include/yocto-uninative.inc
> +++ b/meta/conf/distro/include/yocto-uninative.inc
> @@ -9,7 +9,7 @@
>  UNINATIVE_MAXGLIBCVERSION =3D "2.42"
>  UNINATIVE_VERSION =3D "5.0"
>
> -UNINATIVE_URL ?=3D "http://downloads.yoctoproject.org/releases/uninative=
/${UNINATIVE_VERSION}/"
> +UNINATIVE_URL ?=3D "https://downloads.yoctoproject.org/releases/uninativ=
e/${UNINATIVE_VERSION}/"
>  UNINATIVE_CHECKSUM[aarch64] ?=3D "a25f2174d0cefcb22af005e9bc72ac01ae83b0=
11c5b6d6d5bf00dac979877f76"
>  UNINATIVE_CHECKSUM[i686] ?=3D "959cc2539b692f9b9862825c7324a0fe4d061fca7=
42f6c259f67f581c59af956"
>  UNINATIVE_CHECKSUM[x86_64] ?=3D "96045e8b1e242c8a849426a8506c7043f354b39=
f2bc0035192780e8205e23e9d"
> diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/ac=
pid.inc
> index ba954563b6..c2d27ca81a 100644
> --- a/meta/recipes-bsp/acpid/acpid.inc
> +++ b/meta/recipes-bsp/acpid/acpid.inc
> @@ -5,8 +5,8 @@ deprecated file /proc/acpi/event), and when an event occu=
rs, executes programs \
>  to handle the event. The programs it executes are configured through a s=
et of \
>  configuration files, which can be dropped into place by packages or by t=
he \
>  admin."
> -HOMEPAGE =3D "http://sourceforge.net/projects/acpid2"
> -BUGTRACKER =3D "http://sourceforge.net/p/acpid2/tickets/?source=3Dnavbar=
"
> +HOMEPAGE =3D "https://sourceforge.net/projects/acpid2"
> +BUGTRACKER =3D "https://sourceforge.net/p/acpid2/tickets/?source=3Dnavba=
r"
>  SECTION =3D "base"
>  LICENSE =3D "GPL-2.0-or-later"
>
> diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp=
/alsa-state/alsa-state.bb
> index 9452a1a4ce..bf6ed8e102 100644
> --- a/meta/recipes-bsp/alsa-state/alsa-state.bb
> +++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
> @@ -1,11 +1,11 @@
>  # Copyright Matthias Hentges <devel@hentges.net> (c) 2007
> -# License: MIT (see http://www.opensource.org/licenses/mit-license.php
> +# License: MIT (see https://www.opensource.org/licenses/mit-license.php
>  #               for a copy of the license)
>  #
>  # Filename: alsa-state.bb
>
>  SUMMARY =3D "Alsa scenario files to enable alsa state restoration"
> -HOMEPAGE =3D "http://www.alsa-project.org/"
> +HOMEPAGE =3D "https://www.alsa-project.org/"
>  DESCRIPTION =3D "Alsa Scenario Files - an init script and state files to=
 restore \
>  sound state at system boot and save it at system shut down."
>  LICENSE =3D "MIT & GPL-2.0-or-later"
> diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb b/meta/recipes-bsp=
/gnu-efi/gnu-efi_4.0.4.bb
> index 0f493b8414..843315c650 100644
> --- a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb
> +++ b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Libraries for producing EFI binaries"
> -HOMEPAGE =3D "http://sourceforge.net/projects/gnu-efi/"
> +HOMEPAGE =3D "https://sourceforge.net/projects/gnu-efi/"
>  DESCRIPTION =3D "GNU-EFI aims to Develop EFI applications for ARM-64, AR=
M-32, x86_64, IA-64 (IPF), IA-32 (x86), and MIPS platforms using the GNU to=
olchain and the EFI development environment."
>  SECTION =3D "devel"
>  LICENSE =3D "GPL-2.0-or-later & BSD-2-Clause"
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub=
2.inc
> index 125490183b..7d22ff8b4c 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -5,7 +5,7 @@ intended to unify bootloading across x86 operating system=
s. In \
>  addition to loading the Linux kernel, it implements the Multiboot \
>  standard, which allows for flexible loading of multiple boot images."
>
> -HOMEPAGE =3D "http://www.gnu.org/software/grub/"
> +HOMEPAGE =3D "https://www.gnu.org/software/grub/"
>  SECTION =3D "bootloaders"
>
>  LICENSE =3D "GPL-3.0-only"
> diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/l=
ibacpi/libacpi_0.2.bb
> index f939d11f4c..0c965aa6b2 100644
> --- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
> +++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
> @@ -2,11 +2,11 @@ SUMMARY =3D "ACPI data gathering library"
>  DESCRIPTION =3D "General purpose shared library for programs gathering A=
CPI data on Linux. \
>  Thermal zones, battery infomration, fan information and AC states are im=
plemented."
>  SECTION =3D "base"
> -HOMEPAGE =3D "http://www.ngolde.de/libacpi.html"
> +HOMEPAGE =3D "https://www.ngolde.de/libacpi.html"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfec17f82f16630adf2dfb7d2a46f2=
1c5"
>
> -SRC_URI =3D "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
> +SRC_URI =3D "https://www.ngolde.de/download/libacpi-${PV}.tar.gz \
>            file://makefile-fix.patch \
>            file://libacpi_fix_for_x32.patch \
>            file://use_correct_strip_in_cross_environment.patch \
> @@ -16,7 +16,7 @@ SRC_URI =3D "http://www.ngolde.de/download/libacpi-${PV=
}.tar.gz \
>
>  SRC_URI[sha256sum] =3D "13086e31d428b9c125954d48ac497b754bbbce2ef34ea29e=
cd903e82e25bad29"
>
> -UPSTREAM_CHECK_URI =3D "http://www.ngolde.de/libacpi.html"
> +UPSTREAM_CHECK_URI =3D "https://www.ngolde.de/libacpi.html"
>
>  inherit lib_package
>
> diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/l=
rzsz/lrzsz_0.12.20.bb
> index 777560bd22..cac8f85979 100644
> --- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
> +++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
> @@ -4,7 +4,7 @@ the public-domain version of Chuck Forsberg's rzsz packag=
e. \
>  These programs use error correcting protocols ({z,x,y}modem) to send (sz=
, sx, sb) and \
>  receive (rz, rx, rb) files over a dial-in serial port from a variety of =
programs \
>  running under various operating systems. "
> -HOMEPAGE =3D "http://www.ohse.de/uwe/software/lrzsz.html"
> +HOMEPAGE =3D "https://www.ohse.de/uwe/software/lrzsz.html"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3 \
>                         file://src/lrz.c;beginline=3D1;endline=3D10;md5=
=3D5276956373ff7d8758837f6399a1045f"
> @@ -23,7 +23,7 @@ SRC_URI =3D "https://www.ohse.de/uwe/releases/lrzsz-${P=
V}.tar.gz \
>             "
>  SRC_URI[sha256sum] =3D "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f3=
0bee45ed92728ff1"
>
> -UPSTREAM_CHECK_URI =3D "http://ohse.de/uwe/software/lrzsz.html"
> +UPSTREAM_CHECK_URI =3D "https://ohse.de/uwe/software/lrzsz.html"
>
>  inherit autotools gettext
>
> diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-b=
sp/pm-utils/pm-utils_1.4.1.bb
> index 8756511c17..8e4851ddb1 100644
> --- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> +++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> @@ -1,12 +1,12 @@
>  SECTION =3D "base"
>  SUMMARY =3D "Utilities and scripts for power management"
>  DESCRIPTION =3D "Simple shell command line tools to suspend and hibernat=
e."
> -HOMEPAGE =3D "http://pm-utils.freedesktop.org/wiki/"
> +HOMEPAGE =3D "https://pm-utils.freedesktop.org/wiki/"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
>                      file://src/pm-pmu.c;beginline=3D1;endline=3D22;md5=
=3D3c1ddbc54e735fb4a0386e14c78a3147"
>
> -SRC_URI =3D "http://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar=
.gz"
> +SRC_URI =3D "https://pm-utils.freedesktop.org/releases/pm-utils-${PV}.ta=
r.gz"
>
>  SRC_URI[sha256sum] =3D "8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc218=
36baaae3d4370c0b"
>
> diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-=
bsp/setserial/setserial_2.17.bb
> index e1e80e31ae..20f90b52e7 100644
> --- a/meta/recipes-bsp/setserial/setserial_2.17.bb
> +++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Controls the configuration of serial ports"
>  DESCRIPTION =3D "setserial is a program designed to set and/or report th=
e configuration information associated with a serial port"
> -HOMEPAGE =3D "http://setserial.sourceforge.net"
> +HOMEPAGE =3D "https://setserial.sourceforge.net"
>  SECTION =3D "console/utils"
>
>  LICENSE =3D "GPL-2.0-only"
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp=
/u-boot/u-boot-common.inc
> index 79ddde3f5c..572397c1f3 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -1,4 +1,4 @@
> -HOMEPAGE =3D "http://www.denx.de/wiki/U-Boot/WebHome"
> +HOMEPAGE =3D "https://www.denx.de/wiki/U-Boot/WebHome"
>  DESCRIPTION =3D "U-Boot, a boot loader for Embedded boards based on Powe=
rPC, \
>  ARM, MIPS and several other processors, which can be installed in a boot=
 \
>  ROM and used to initialize and test the hardware or to download and run =
\
> diff --git a/meta/recipes-bsp/usbutils/usbutils_019.bb b/meta/recipes-bsp=
/usbutils/usbutils_019.bb
> index 6aa5c5f5c2..e8621123be 100644
> --- a/meta/recipes-bsp/usbutils/usbutils_019.bb
> +++ b/meta/recipes-bsp/usbutils/usbutils_019.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Host side USB console utilities"
>  DESCRIPTION =3D "Contains the lsusb utility for inspecting the devices c=
onnected to the USB bus."
> -HOMEPAGE =3D "http://www.linux-usb.org"
> +HOMEPAGE =3D "https://www.linux-usb.org"
>  SECTION =3D "base"
>
>  LICENSE =3D "GPL-2.0-or-later & (GPL-2.0-only | GPL-3.0-only) & CC0-1.0 =
& LGPL-2.1-or-later & MIT"
> diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d=
/v86d_0.1.10.bb
> index 3bc9b24487..77b6702034 100644
> --- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
> +++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://README;md5=3D94ac1971e4f2309=
dc322d598e7b1f7dd"
>
>  RRECOMMENDS:${PN} =3D "kernel-module-uvesafb"
>
> -SRC_URI =3D "http://snapshot.debian.org/archive/debian/20110427T035506Z/=
pool/main/v/${BPN}/${BPN}_${PV}.orig.tar.gz \
> +SRC_URI =3D "https://snapshot.debian.org/archive/debian/20110427T035506Z=
/pool/main/v/${BPN}/${BPN}_${PV}.orig.tar.gz \
>             file://Update-x86emu-from-X.org.patch \
>             file://ar-from-env.patch \
>             file://Support-for-cross-compilation.patch \
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
> index 4fe8ba4d28..4bebb573a0 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> @@ -5,7 +5,7 @@ with no specific configuration. This tool implements IPv4=
LL, "Dynamic Configurat
>  IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for automatic IP a=
ddress \
>  configuration from the link-local 169.254.0.0/16 range without the need =
for a central \
>  server.'
> -HOMEPAGE =3D "http://avahi.org"
> +HOMEPAGE =3D "https://avahi.org"
>  BUGTRACKER =3D "https://github.com/avahi/avahi/issues"
>  SECTION =3D "network"
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index 24a41f92df..1d581e0ff2 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Linux Bluetooth Stack Userland V5"
>  DESCRIPTION =3D "Linux Bluetooth stack V5 userland components.  These in=
clude a system configurations, daemons, tools and system libraries."
> -HOMEPAGE =3D "http://www.bluez.org"
> +HOMEPAGE =3D "https://www.bluez.org"
>  SECTION =3D "libs"
>  LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e \
> diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/met=
a/recipes-connectivity/connman/connman-gnome_0.7.bb
> index 8bfc1540b3..57f1be9ecb 100644
> --- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> +++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "GTK+ frontend for the ConnMan network connection manager"
> -HOMEPAGE =3D "http://connman.net/"
> +HOMEPAGE =3D "https://connman.net/"
>  SECTION =3D "libs/network"
>  LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a \
> diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb b/meta/rec=
ipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
> index fca7d8b11d..b63a5a2174 100644
> --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
> @@ -4,7 +4,7 @@ DESCRIPTION =3D "dhcpcd runs on your machine and silently=
 configures your \
>                 computer to work on the attached networks without trouble=
 \
>                 and mostly without configuration."
>
> -HOMEPAGE =3D "http://roy.marples.name/projects/dhcpcd/"
> +HOMEPAGE =3D "https://roy.marples.name/projects/dhcpcd/"
>
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4dda5beb433a809f2e0aeffbf9da3=
d91"
> diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb b/meta/=
recipes-connectivity/inetutils/inetutils_2.7.bb
> index 6cffade97f..3f2d320a94 100644
> --- a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
> +++ b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "The GNU inetutils are a collection of co=
mmon \
>  networking utilities and servers including ftp, ftpd, rcp, \
>  rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
>  talkd, telnet, telnetd, tftp, tftpd, and uucpd."
> -HOMEPAGE =3D "http://www.gnu.org/software/inetutils"
> +HOMEPAGE =3D "https://www.gnu.org/software/inetutils"
>  SECTION =3D "net"
>  DEPENDS =3D "ncurses netbase readline virtual/crypt"
>
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb b/meta=
/recipes-connectivity/iproute2/iproute2_6.18.0.bb
> index e078bcf3a9..1232cc0b6d 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Iproute2 is a collection of utilities fo=
r controlling \
>  TCP / IP networking and traffic control in Linux.  Of the utilities ip \
>  and tc are the most important.  ip controls IPv4 and IPv6 \
>  configuration and tc stands for traffic control."
> -HOMEPAGE =3D "http://www.linuxfoundation.org/collaborate/workgroups/netw=
orking/iproute2"
> +HOMEPAGE =3D "https://www.linuxfoundation.org/collaborate/workgroups/net=
working/iproute2"
>  SECTION =3D "base"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a \
> diff --git a/meta/recipes-connectivity/iw/iw_6.17.bb b/meta/recipes-conne=
ctivity/iw/iw_6.17.bb
> index a9a4695d39..01ab2838a3 100644
> --- a/meta/recipes-connectivity/iw/iw_6.17.bb
> +++ b/meta/recipes-connectivity/iw/iw_6.17.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D878618a5c4af25=
e9b93ef0be1a93f774"
>
>  DEPENDS =3D "libnl"
>
> -SRC_URI =3D "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz =
\
> +SRC_URI =3D "https://www.kernel.org/pub/software/network/iw/${BP}.tar.gz=
 \
>             file://0001-iw-version.sh-don-t-use-git-describe-for-versioni=
ng.patch \
>             file://separate-objdir.patch \
>  "
> diff --git a/meta/recipes-connectivity/kea/kea_3.0.2.bb b/meta/recipes-co=
nnectivity/kea/kea_3.0.2.bb
> index f46cb1bf80..cabd29b020 100644
> --- a/meta/recipes-connectivity/kea/kea_3.0.2.bb
> +++ b/meta/recipes-connectivity/kea/kea_3.0.2.bb
> @@ -1,13 +1,13 @@
>  SUMMARY =3D "ISC Kea DHCP Server"
>  DESCRIPTION =3D "Kea is the next generation of DHCP software developed b=
y ISC. It supports both DHCPv4 and DHCPv6 protocols along with their extens=
ions, e.g. prefix delegation and dynamic updates to DNS."
> -HOMEPAGE =3D "http://kea.isc.org"
> +HOMEPAGE =3D "https://kea.isc.org"
>  SECTION =3D "connectivity"
>  LICENSE =3D "MPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb634ed1d923b8b8fd1ed7ffc9b70=
ae4"
>
>  DEPENDS =3D "boost log4cplus openssl"
>
> -SRC_URI =3D "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
> +SRC_URI =3D "https://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
>             file://kea-dhcp4.service \
>             file://kea-dhcp6.service \
>             file://kea-dhcp-ddns.service \
> diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/r=
ecipes-connectivity/libpcap/libpcap_1.10.6.bb
> index 1b10001035..de94991a8d 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
> +++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
> @@ -2,8 +2,8 @@ SUMMARY =3D "Interface for user-level network packet capt=
ure"
>  DESCRIPTION =3D "Libpcap provides a portable framework for low-level net=
work \
>  monitoring.  Libpcap can provide network statistics collection, \
>  security monitoring and network debugging."
> -HOMEPAGE =3D "http://www.tcpdump.org/"
> -BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D53067&atid=3D=
469577"
> +HOMEPAGE =3D "https://www.tcpdump.org/"
> +BUGTRACKER =3D "https://sourceforge.net/tracker/?group_id=3D53067&atid=
=3D469577"
>  SECTION =3D "libs/network"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5eb289217c160e2920d2e35bddc36=
453 \
> diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mob=
ile-broadband-provider-info_20251101.bb b/meta/recipes-connectivity/mobile-=
broadband-provider-info/mobile-broadband-provider-info_20251101.bb
> index 441732afe7..f54ad6f3a5 100644
> --- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-bro=
adband-provider-info_20251101.bb
> +++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-bro=
adband-provider-info_20251101.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Mobile Broadband Service Provider Database"
> -HOMEPAGE =3D "http://live.gnome.org/NetworkManager/MobileBroadband/Servi=
ceProviders"
> +HOMEPAGE =3D "https://live.gnome.org/NetworkManager/MobileBroadband/Serv=
iceProviders"
>  DESCRIPTION =3D "Mobile Broadband Service Provider Database stores servi=
ce provider specific information. When this Database is available the infor=
mation can be fetched there"
>  SECTION =3D "network"
>  LICENSE =3D "PD"
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
> index 65970f58e8..adf11df70f 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "userspace utilities for kernel nfs"
>  DESCRIPTION =3D "The nfs-utils package provides a daemon for the kernel =
\
>  NFS server and related tools."
> -HOMEPAGE =3D "http://nfs.sourceforge.net/"
> +HOMEPAGE =3D "https://nfs.sourceforge.net/"
>  SECTION =3D "console/network"
>
>  LICENSE =3D "MIT & GPL-2.0-or-later & BSD-3-Clause"
> diff --git a/meta/recipes-connectivity/ofono/ofono_2.19.bb b/meta/recipes=
-connectivity/ofono/ofono_2.19.bb
> index 74fa70f609..76dd755758 100644
> --- a/meta/recipes-connectivity/ofono/ofono_2.19.bb
> +++ b/meta/recipes-connectivity/ofono/ofono_2.19.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "open source telephony"
>  DESCRIPTION =3D "oFono is a stack for mobile telephony devices on Linux.=
 oFono supports speaking to telephony devices through specific drivers, or =
with generic AT commands."
> -HOMEPAGE =3D "http://www.ofono.org"
> +HOMEPAGE =3D "https://www.ofono.org"
>  BUGTRACKER =3D "https://01.org/jira/browse/OF"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a \
> diff --git a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb b/meta/r=
ecipes-connectivity/openssh/openssh_10.2p1.bb
> index 866129573f..9ac923ea05 100644
> --- a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
> @@ -3,7 +3,7 @@ the SSH protocol including the ssh client and sshd server=
"
>  DESCRIPTION =3D "Secure rlogin/rsh/rcp/telnet replacement (OpenSSH) \
>  Ssh (Secure Shell) is a program for logging into a remote machine \
>  and for executing commands on a remote machine."
> -HOMEPAGE =3D "http://www.openssh.com/"
> +HOMEPAGE =3D "https://www.openssh.com/"
>  SECTION =3D "console/network"
>  LICENSE =3D "BSD-2-Clause & BSD-3-Clause & ISC & MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D78ffb36e5a48c0d8c5648603a3b6c=
8eb"
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.5.4.bb
> index e760baf3a0..61b145bc1c 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
> @@ -1,13 +1,13 @@
>  SUMMARY =3D "Secure Socket Layer"
>  DESCRIPTION =3D "Secure Socket Layer (SSL) binary and related cryptograp=
hic tools."
> -HOMEPAGE =3D "http://www.openssl.org/"
> -BUGTRACKER =3D "http://www.openssl.org/news/vulnerabilities.html"
> +HOMEPAGE =3D "https://www.openssl.org/"
> +BUGTRACKER =3D "https://www.openssl.org/news/vulnerabilities.html"
>  SECTION =3D "libs/network"
>
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dc75985e733726beaba57bc525=
3e96d04"
>
> -SRC_URI =3D "http://www.openssl.org/source/openssl-${PV}.tar.gz \
> +SRC_URI =3D "https://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://run-ptest \
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-co=
nnectivity/ppp/ppp_2.5.2.bb
> index 607678db8b..397e336329 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
> @@ -2,8 +2,8 @@ SUMMARY =3D "Point-to-Point Protocol (PPP) support"
>  DESCRIPTION =3D "ppp (Paul's PPP Package) is an open source package whic=
h implements \
>  the Point-to-Point Protocol (PPP) on Linux and Solaris systems."
>  SECTION =3D "console/network"
> -HOMEPAGE =3D "http://samba.org/ppp/"
> -BUGTRACKER =3D "http://ppp.samba.org/cgi-bin/ppp-bugs"
> +HOMEPAGE =3D "https://samba.org/ppp/"
> +BUGTRACKER =3D "https://ppp.samba.org/cgi-bin/ppp-bugs"
>  DEPENDS =3D "libpcap virtual/crypt"
>  LICENSE =3D "BSD-2-Clause & GPL-2.0-or-later & LGPL-2.0-or-later & PD & =
RSA-MD & MIT"
>  LIC_FILES_CHKSUM =3D "file://pppd/ccp.c;beginline=3D1;endline=3D25;md5=
=3Df0463bd67ae70535c709fca554089bd8 \
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb b/me=
ta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
> index b2c85f9593..23d69e7bbc 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
> @@ -7,7 +7,7 @@ information."
>  SECTION =3D "console/network"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8991e=
50b"
> -HOMEPAGE =3D "http://packages.debian.org/resolvconf"
> +HOMEPAGE =3D "https://packages.debian.org/resolvconf"
>  RDEPENDS:${PN} =3D "bash sed util-linux-flock"
>
>  SRC_URI =3D "git://salsa.debian.org/debian/resolvconf.git;protocol=3Dhtt=
ps;branch=3Dunstable \
> diff --git a/meta/recipes-connectivity/socat/socat_1.8.1.0.bb b/meta/reci=
pes-connectivity/socat/socat_1.8.1.0.bb
> index 331133d6f9..d61a2048a6 100644
> --- a/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
> +++ b/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Multipurpose relay for bidirectional data transfer"
>  DESCRIPTION =3D "Socat is a relay for bidirectional data \
>  transfer between two independent data channels."
> -HOMEPAGE =3D "http://www.dest-unreach.org/socat/"
> +HOMEPAGE =3D "https://www.dest-unreach.org/socat/"
>
>  SECTION =3D "console/network"
>
> @@ -9,7 +9,7 @@ LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
>                      file://README;beginline=3D252;endline=3D282;md5=3D33=
8c05eadd013872abb1d6e198e10a3f"
>
> -SRC_URI =3D "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.=
bz2 \
> +SRC_URI =3D "https://www.dest-unreach.org/socat/download/socat-${PV}.tar=
.bz2 \
>             file://0001-fix-compile-procan.c-failed.patch \
>             file://0001-fix-compile-failed-with-musl.patch \
>  "
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11=
.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> index 7c7a8bd9c1..9c31390158 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Client for Wi-Fi Protected Access (WPA)"
>  DESCRIPTION =3D "wpa_supplicant is a WPA Supplicant for Linux, BSD, Mac =
OS X, and Windows with support for WPA and WPA2 (IEEE 802.11i / RSN). Suppl=
icant is the IEEE 802.1X/WPA component that is used in the client stations.=
 It implements key negotiation with a WPA Authenticator and it controls the=
 roaming and IEEE 802.11 authentication/association of the wlan driver."
> -HOMEPAGE =3D "http://w1.fi/wpa_supplicant/"
> -BUGTRACKER =3D "http://w1.fi/security/"
> +HOMEPAGE =3D "https://w1.fi/wpa_supplicant/"
> +BUGTRACKER =3D "https://w1.fi/security/"
>  SECTION =3D "network"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5ebcb90236d1ad640558c3d3cd303=
5df \
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5ebcb90236d1=
ad640558c3d3cd3035df \
>
>  DEPENDS =3D "dbus libnl"
>
> -SRC_URI =3D "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
> +SRC_URI =3D "https://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
>             file://wpa-supplicant.sh \
>             file://wpa_supplicant.conf \
>             file://wpa_supplicant.conf-sane \
> diff --git a/meta/recipes-core/coreutils/coreutils_9.9.bb b/meta/recipes-=
core/coreutils/coreutils_9.9.bb
> index cded545efb..747fc2c6f7 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.9.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.9.bb
> @@ -2,8 +2,8 @@ SUMMARY =3D "The basic file, shell and text manipulation =
utilities"
>  DESCRIPTION =3D "The GNU Core Utilities provide the basic file, shell an=
d text \
>  manipulation utilities. These are the core utilities which are expected =
to exist on \
>  every system."
> -HOMEPAGE =3D "http://www.gnu.org/software/coreutils/"
> -BUGTRACKER =3D "http://debbugs.gnu.org/coreutils"
> +HOMEPAGE =3D "https://www.gnu.org/software/coreutils/"
> +BUGTRACKER =3D "https://debbugs.gnu.org/coreutils"
>  LICENSE =3D "GPL-3.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464 \
>                      file://src/ls.c;beginline=3D1;endline=3D15;md5=3D824=
c1997414aea9f344747bd81cf5a31 \
> @@ -19,7 +19,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>             "
>  SRC_URI[sha256sum] =3D "19bcb6ca867183c57d77155eae946c5eced88183143b45ca=
51ad7d26c628ca75"
>
> -# http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=3Dv8.27-101-=
gf5d7c0842
> +# https://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=3Dv8.27-101=
-gf5d7c0842
>  #
>  CVE_STATUS[CVE-2016-2781] =3D "disputed: runcon is not really a sandbox =
command, use `runcon ... setsid ...` to avoid this particular issue."
>
> diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-=
core/dbus-wait/dbus-wait_git.bb
> index c6a9abde63..43ae48a83b 100644
> --- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
> +++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "A simple tool to wait for a specific signal over DBus"
> -HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi/dbus-wait"
> +HOMEPAGE =3D "https://git.yoctoproject.org/cgit/cgit.cgi/dbus-wait"
>  DESCRIPTION =3D "${SUMMARY}"
>  SECTION =3D "base"
>  LICENSE =3D "GPL-2.0-only"
> diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb b/meta/recipe=
s-core/dropbear/dropbear_2025.89.bb
> index 957a0901fb..d7f0fec4ce 100644
> --- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
> +++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "A lightweight SSH and SCP implementation"
> -HOMEPAGE =3D "http://matt.ucc.asn.au/dropbear/dropbear.html"
> +HOMEPAGE =3D "https://matt.ucc.asn.au/dropbear/dropbear.html"
>  DESCRIPTION =3D "Dropbear is a relatively small SSH server and client. I=
t runs on a variety of POSIX-based platforms. Dropbear is open source softw=
are, distributed under a MIT-style license. Dropbear is particularly useful=
 for "embedded"-type Linux (or other Unix) systems, such as wireless router=
s."
>  SECTION =3D "console/network"
>
> @@ -12,7 +12,7 @@ DEPENDS =3D "zlib virtual/crypt"
>  RPROVIDES:${PN} =3D "ssh sshd"
>  RCONFLICTS:${PN} =3D "openssh-sshd openssh"
>
> -SRC_URI =3D "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar=
.bz2 \
> +SRC_URI =3D "https://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.ta=
r.bz2 \
>             file://0001-urandom-xauth-changes-to-options.h.patch \
>             file://init \
>             file://dropbearkey.service \
> @@ -23,7 +23,7 @@ SRC_URI =3D "http://matt.ucc.asn.au/dropbear/releases/d=
ropbear-${PV}.tar.bz2 \
>             "
>
>  SRC_URI[sha256sum] =3D "0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4=
a7aeb58c9e113634"
> -MIRRORS +=3D "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear=
.nl/mirror/releases/"
> +MIRRORS +=3D "https://matt.ucc.asn.au/dropbear/releases/ https://dropbea=
r.nl/mirror/releases/"
>
>  PAM_SRC_URI =3D "file://0005-dropbear-enable-pam.patch \
>                 file://0006-dropbear-configuration-file.patch \
> diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes=
-core/gettext/gettext-sources.inc
> index 2ddf47334d..6d3b8b90cd 100644
> --- a/meta/recipes-core/gettext/gettext-sources.inc
> +++ b/meta/recipes-core/gettext/gettext-sources.inc
> @@ -1,3 +1,3 @@
> -HOMEPAGE =3D "http://www.gnu.org/software/gettext/gettext.html"
> +HOMEPAGE =3D "https://www.gnu.org/software/gettext/gettext.html"
>  SRC_URI =3D "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz"
>  SRC_URI[sha256sum] =3D "39acf4b0371e9b110b60005562aace5b3631fed9b1bb9ecc=
cfc7f56e58bb1d7f"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
> index bd87d9c601..57f4379e2a 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D41890f71f740=
302b785c27661123bff5 \
>                      file://LICENSES/LGPL-2.1-or-later.txt;md5=3D41890f71=
f740302b785c27661123bff5 \
>                      file://gmodule/gmodule.h;beginline=3D4;endline=3D17;=
md5=3D72f7cc2847407f65d8981ef112e4e630 \
>                      file://docs/reference/COPYING;md5=3Df51a5100c17af6ba=
e00735cd791e1fcc"
> -BUGTRACKER =3D "http://bugzilla.gnome.org"
> +BUGTRACKER =3D "https://bugzilla.gnome.org"
>  SECTION =3D "libs"
>
>  CVE_PRODUCT =3D "glib"
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
> index 8bdbab03a6..8892ffda99 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "GLib networking extensions"
>  DESCRIPTION =3D "glib-networking contains the implementations of certain=
 GLib networking features that cannot be implemented directly in GLib itsel=
f because of their dependencies."
>  HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/glib-networking/"
> -BUGTRACKER =3D "http://bugzilla.gnome.org"
> +BUGTRACKER =3D "https://bugzilla.gnome.org"
>
>  LICENSE =3D "LGPL-2.1-or-later"
>  LICENSE:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'openssl', ' &=
 Glib-Networking-OpenSSL-Exception', '', d)}"
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.42.bb b/met=
a/recipes-core/glibc/cross-localedef-native_2.42.bb
> index 95acb3fc56..c9dc3273db 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.42.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.42.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Cross locale generation tool for glibc"
> -HOMEPAGE =3D "http://www.gnu.org/software/libc/libc.html"
> +HOMEPAGE =3D "https://www.gnu.org/software/libc/libc.html"
>  SECTION =3D "libs"
>  LICENSE =3D "LGPL-2.1-only"
>
> diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core=
/glibc/glibc-common.inc
> index 7422ede04d..26552f402a 100644
> --- a/meta/recipes-core/glibc/glibc-common.inc
> +++ b/meta/recipes-core/glibc/glibc-common.inc
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "GLIBC (GNU C Library)"
>  DESCRIPTION =3D "The GNU C Library is used as the system C library in mo=
st systems with the Linux kernel."
> -HOMEPAGE =3D "http://www.gnu.org/software/libc/libc.html"
> +HOMEPAGE =3D "https://www.gnu.org/software/libc/libc.html"
>  SECTION =3D "libs"
>  LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later"
>
> diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/=
recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> index da594d00b7..99bd106562 100644
> --- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> +++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Basic TCP/IP networking init scripts and configuration file=
s"
>  DESCRIPTION =3D "This package provides high level tools to configure net=
work interfaces"
> -HOMEPAGE =3D "http://packages.debian.org/ifupdown"
> +HOMEPAGE =3D "https://packages.debian.org/ifupdown"
>  SECTION =3D "base"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://${S}/copyright;md5=3D3dd6192d306f582dee7687=
da3d8748ab"
> diff --git a/meta/recipes-core/kbd/kbd_2.9.0.bb b/meta/recipes-core/kbd/k=
bd_2.9.0.bb
> index 79b011e529..067e9f9487 100644
> --- a/meta/recipes-core/kbd/kbd_2.9.0.bb
> +++ b/meta/recipes-core/kbd/kbd_2.9.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Keytable files and keyboard utilities"
> -HOMEPAGE =3D "http://www.kbd-project.org/"
> +HOMEPAGE =3D "https://www.kbd-project.org/"
>  DESCRIPTION =3D "The kbd project contains tools for managing Linux conso=
le (Linux console, virtual terminals, keyboard, etc.) - mainly, what they d=
o is loading console fonts and keyboard maps."
>
>  # consolefonts and keymaps contain also some public domain and author no=
tice licenses
> diff --git a/meta/recipes-core/libcgroup/libcgroup_3.2.0.bb b/meta/recipe=
s-core/libcgroup/libcgroup_3.2.0.bb
> index 28562a5b37..e4224a23c2 100644
> --- a/meta/recipes-core/libcgroup/libcgroup_3.2.0.bb
> +++ b/meta/recipes-core/libcgroup/libcgroup_3.2.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Linux control group abstraction library"
> -HOMEPAGE =3D "http://libcg.sourceforge.net/"
> +HOMEPAGE =3D "https://libcg.sourceforge.net/"
>  DESCRIPTION =3D "libcgroup is a library that abstracts the control group=
 file system \
>  in Linux. Control groups allow you to limit, account and isolate resourc=
e usage \
>  (CPU, memory, disk I/O, etc.) of groups of processes."
> diff --git a/meta/recipes-core/libxml/libxml2_2.15.1.bb b/meta/recipes-co=
re/libxml/libxml2_2.15.1.bb
> index 736aaea00e..0510ed2afd 100644
> --- a/meta/recipes-core/libxml/libxml2_2.15.1.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.15.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "XML C Parser Library and Toolkit"
>  DESCRIPTION =3D "The XML Parser Library allows for manipulation of XML f=
iles.  Libxml2 exports Push and Pull type parser interfaces for both XML an=
d HTML.  It can do DTD validation at parse time, on a parsed document insta=
nce or with an arbitrary DTD.  Libxml2 includes complete XPath, XPointer an=
d Xinclude implementations.  It also has a SAX like interface, which is des=
igned to be compatible with Expat."
>  HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libxml2"
> -BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlibxml2"
> +BUGTRACKER =3D "https://bugzilla.gnome.org/buglist.cgi?product=3Dlibxml2=
"
>  SECTION =3D "libs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D5873615e8a9ecbf5c8857c4312e=
e05d6 \
> @@ -14,7 +14,7 @@ DEPENDS =3D "zlib virtual/libiconv"
>  GNOMEBASEBUILDCLASS =3D "autotools"
>  inherit gnomebase
>
> -SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=3D${BP=
};name=3Dtesttar \
> +SRC_URI +=3D "https://www.w3.org/XML/Test/xmlts20130923.tar;subdir=3D${B=
P};name=3Dtesttar \
>             file://run-ptest \
>             file://install-tests.patch \
>             file://0001-Revert-cmake-Fix-installation-directories-in-libx=
ml2.patch \
> diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/mus=
l.inc
> index ce45de2d23..8c4b2a0dcd 100644
> --- a/meta/recipes-core/musl/musl.inc
> +++ b/meta/recipes-core/musl/musl.inc
> @@ -6,7 +6,7 @@ DESCRIPTION =3D "A new standard library to power a new ge=
neration of Linux-based d
>  musl is lightweight, fast, simple, free, and strives to be correct in th=
e sense of \
>  standards-conformance and safety."
>
> -HOMEPAGE =3D "http://www.musl-libc.org/"
> +HOMEPAGE =3D "https://www.musl-libc.org/"
>  LICENSE =3D "MIT"
>  SECTION =3D "libs"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D0c2904cdc34777fb4067732bae1=
45506"
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
> index 8482db7f6e..af15f35591 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "The New Curses library"
>  DESCRIPTION =3D "SVr4 and XSI-Curses compatible curses library and termi=
nfo tools including tic, infocmp, captoinfo. Supports color, multiple highl=
ights, forms-drawing characters, and automatic recognition of keypad and fu=
nction-key sequences. Extensions include resizable windows and mouse suppor=
t on both xterm and Linux console using the gpm library."
> -HOMEPAGE =3D "http://www.gnu.org/software/ncurses/ncurses.html"
> +HOMEPAGE =3D "https://www.gnu.org/software/ncurses/ncurses.html"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6f291ee54551d9d8d992ecd623fe4=
bc7;endline=3D27"
>  SECTION =3D "libs"
> diff --git a/meta/recipes-core/netbase/netbase_6.5.bb b/meta/recipes-core=
/netbase/netbase_6.5.bb
> index c6cf798421..74c7e9d38f 100644
> --- a/meta/recipes-core/netbase/netbase_6.5.bb
> +++ b/meta/recipes-core/netbase/netbase_6.5.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Basic TCP/IP networking support"
>  DESCRIPTION =3D "This package provides the necessary infrastructure for =
basic TCP/IP based networking"
> -HOMEPAGE =3D "http://packages.debian.org/netbase"
> +HOMEPAGE =3D "https://packages.debian.org/netbase"
>  SECTION =3D "base"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D78dd2c7c6f487348e4a0=
092c17a19d42"
> diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core=
/psplash/psplash_git.bb
> index 3be0e26a0c..6f49a57d2c 100644
> --- a/meta/recipes-core/psplash/psplash_git.bb
> +++ b/meta/recipes-core/psplash/psplash_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Userspace framebuffer boot logo based on usplash"
>  DESCRIPTION =3D "PSplash is a userspace graphical boot splash screen for=
 mainly embedded Linux devices supporting a 16bpp or 32bpp framebuffer. It =
has few dependencies (just libc), supports basic images and text and handle=
s rotation. Its visual look is configurable by basic source changes. Also i=
ncluded is a 'client' command utility for sending information to psplash su=
ch as boot progress information."
> -HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi/psplash"
> +HOMEPAGE =3D "https://git.yoctoproject.org/cgit/cgit.cgi/psplash"
>  SECTION =3D "base"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://psplash.h;beginline=3D1;endline=3D8;md5=3D8=
f232c1e95929eacab37f00900580224"
> diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb b/meta/reci=
pes-core/sysfsutils/sysfsutils_2.1.1.bb
> index 5040d8864e..4fc64ba35d 100644
> --- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
> +++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Tools for working with sysfs"
>  DESCRIPTION =3D "Tools for working with the sysfs virtual filesystem.  T=
he tool 'systool' can query devices by bus, class and topology."
> -HOMEPAGE =3D "http://linux-diag.sourceforge.net/Sysfsutils.html"
> +HOMEPAGE =3D "https://linux-diag.sourceforge.net/Sysfsutils.html"
>
>  LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>  LICENSE:${PN} =3D "GPL-2.0-only"
> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/rec=
ipes-core/systemd/systemd-compat-units.bb
> index d6da34e9b8..5520899375 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Enhances systemd compatilibity with existing SysVinit scrip=
ts"
> -HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/systemd"
> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/systemd"
>  LICENSE =3D "MIT"
>
>  PACKAGE_WRITE_DEPS +=3D "systemd-systemctl-native"
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
> index daf37060d7..caae2baff3 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "A System and service manager"
> -HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/systemd"
> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/systemd"
>
>  DESCRIPTION =3D "systemd is a system and service manager for Linux, comp=
atible with \
>  SysV and LSB init scripts. systemd provides aggressive parallelization \
> diff --git a/meta/recipes-core/sysvinit/sysvinit_3.14.bb b/meta/recipes-c=
ore/sysvinit/sysvinit_3.14.bb
> index d4bb797624..c1e6f06e94 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_3.14.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_3.14.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "System-V like init"
>  DESCRIPTION =3D "This package is required to boot in most configurations=
.  It provides the /sbin/init program.  This is the first process started o=
n boot, and the last process terminated before the system halts."
> -HOMEPAGE =3D "http://savannah.nongnu.org/projects/sysvinit/"
> +HOMEPAGE =3D "https://savannah.nongnu.org/projects/sysvinit/"
>  SECTION =3D "base"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe \
> diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/reci=
pes-core/update-rc.d/update-rc.d_0.8.bb
> index 124b7d32a2..29a223195f 100644
> --- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
> +++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "manage symlinks in /etc/rcN.d"
> -HOMEPAGE =3D "http://github.com/philb/update-rc.d/"
> +HOMEPAGE =3D "https://github.com/philb/update-rc.d/"
>  DESCRIPTION =3D "update-rc.d is a utility that allows the management of =
symlinks to the initscripts in the /etc/rcN.d directory structure."
>  SECTION =3D "base"
>
> diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zli=
b/zlib_1.3.1.bb
> index 592b7f1422..e26b3772af 100644
> --- a/meta/recipes-core/zlib/zlib_1.3.1.bb
> +++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Zlib Compression Library"
>  DESCRIPTION =3D "Zlib is a general-purpose, patent-free, lossless data c=
ompression \
>  library which is used by many different programs."
> -HOMEPAGE =3D "http://zlib.net/"
> +HOMEPAGE =3D "https://zlib.net/"
>  SECTION =3D "libs"
>  LICENSE =3D "Zlib"
>  LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D6;endline=3D23;md5=3D537=
7232268e952e9ef63bc555f7aa6c0"
> @@ -11,7 +11,7 @@ SRC_URI =3D "https://zlib.net/${BP}.tar.gz \
>             file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
>             file://run-ptest \
>             "
> -UPSTREAM_CHECK_URI =3D "http://zlib.net/"
> +UPSTREAM_CHECK_URI =3D "https://zlib.net/"
>
>  SRC_URI[sha256sum] =3D "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91=
eefb60f03b72df23"
>
> diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024=
.10.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10=
.16.bb
> index 46d1b91d65..86b075e820 100644
> --- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.=
bb
> +++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.=
bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "a collection of freely re-usable Autoconf macros"
> -HOMEPAGE =3D "http://www.gnu.org/software/autoconf-archive/"
> +HOMEPAGE =3D "https://www.gnu.org/software/autoconf-archive/"
>  SECTION =3D "devel"
>  LICENSE =3D "GPL-3.0-with-autoconf-exception"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D11cc2d3ee574f9d6b7ee797bdce4d=
423 \
> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72.bb b/meta/recip=
es-devtools/autoconf/autoconf_2.72.bb
> index b599f270c7..2f9e8a8f47 100644
> --- a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> +++ b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Autoconf is an extensible package of M4 =
macros that produce shell
>  configure software source code packages. Autoconf creates a configuratio=
n script for a package from a template \
>  file that lists the operating system features that the package can use, =
in the form of M4 macro calls."
>  LICENSE =3D "GPL-3.0-or-later"
> -HOMEPAGE =3D "http://www.gnu.org/software/autoconf/"
> +HOMEPAGE =3D "https://www.gnu.org/software/autoconf/"
>  SECTION =3D "devel"
>  DEPENDS =3D "m4-native autoconf-native automake-native gnu-config-native=
 help2man-native"
>  DEPENDS:remove:class-native =3D "autoconf-native automake-native help2ma=
n-native"
> diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-d=
evtools/automake/automake.inc
> index 9946c73c71..fb7d1dbe64 100644
> --- a/meta/recipes-devtools/automake/automake.inc
> +++ b/meta/recipes-devtools/automake/automake.inc
> @@ -2,7 +2,7 @@ SUMMARY =3D "A GNU tool for automatically generating Make=
files"
>  DESCRIPTION =3D "Automake is a tool for automatically generating `Makefi=
le.in' files compliant with the GNU Coding \
>  Standards. Automake requires the use of Autoconf."
>  LICENSE =3D "GPL-2.0-only"
> -HOMEPAGE =3D "http://www.gnu.org/software/automake/"
> +HOMEPAGE =3D "https://www.gnu.org/software/automake/"
>  SECTION =3D "devel"
>
>  SRC_URI =3D "${GNU_MIRROR}/automake/automake-${PV}.tar.gz"
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
> index 00b1301258..d4bf8ded91 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -6,8 +6,8 @@ addresses into filenames and line numbers), ar (utility f=
or creating, \
>  modifying and extracting archives), nm (list symbols in object \
>  files), objcopy (copy and translate object files), objdump (Display \
>  object information), and other tools and related libraries."
> -HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
> -BUGTRACKER =3D "http://sourceware.org/bugzilla/"
> +HOMEPAGE =3D "https://www.gnu.org/software/binutils/"
> +BUGTRACKER =3D "https://sourceware.org/bugzilla/"
>  SECTION =3D "devel"
>  LICENSE =3D "GPL-3.0-only"
>
> diff --git a/meta/recipes-devtools/bison/bison_3.8.2.bb b/meta/recipes-de=
vtools/bison/bison_3.8.2.bb
> index 513d7ec287..b20c38dc76 100644
> --- a/meta/recipes-devtools/bison/bison_3.8.2.bb
> +++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Bison is a general-purpose parser genera=
tor that converts an anno
>  an LALR(1) or GLR parser for that grammar.  Bison is upward compatible w=
ith Yacc: all properly-written Yacc \
>  grammars ought to work with Bison with no change. Anyone familiar with Y=
acc should be able to use Bison with \
>  little trouble."
> -HOMEPAGE =3D "http://www.gnu.org/software/bison/"
> +HOMEPAGE =3D "https://www.gnu.org/software/bison/"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
>  SECTION =3D "devel"
> diff --git a/meta/recipes-devtools/ccache/ccache_4.12.2.bb b/meta/recipes=
-devtools/ccache/ccache_4.12.2.bb
> index 28f36e5ed7..1c191d550c 100644
> --- a/meta/recipes-devtools/ccache/ccache_4.12.2.bb
> +++ b/meta/recipes-devtools/ccache/ccache_4.12.2.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "ccache is a compiler cache. It speeds up=
 recompilation \
>  by caching the result of previous compilations and detecting when the \
>  same compilation is being done again. Supported languages are C, C\+\+, =
\
>  Objective-C and Objective-C++."
> -HOMEPAGE =3D "http://ccache.samba.org"
> +HOMEPAGE =3D "https://ccache.samba.org"
>  SECTION =3D "devel"
>
>  LICENSE =3D "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
> diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/met=
a/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
> index fb7c29e242..c6568ff776 100644
> --- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
> +++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
> @@ -2,7 +2,7 @@
>  # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Rese=
rved
>  # Released under the MIT license (see packages/COPYING)
>  SUMMARY =3D "A set of tools for CD recording, including cdrecord"
> -HOMEPAGE =3D "http://sourceforge.net/projects/cdrtools/"
> +HOMEPAGE =3D "https://sourceforge.net/projects/cdrtools/"
>  DESCRIPTION =3D "cdrecord tool is Highly portable CD/DVD/BluRay command =
line recording software."
>  SECTION =3D "console/utils"
>  LICENSE =3D "GPL-2.0-only & CDDL-1.0 & LGPL-2.1-or-later"
> diff --git a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb b/me=
ta/recipes-devtools/clang/clang-cross-canadian_git.bb
> index 18bd6ecfde..5801900740 100644
> --- a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> +++ b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> @@ -2,7 +2,7 @@
>  # Released under the MIT license (see COPYING.MIT for the terms)
>
>  SUMMARY =3D "Clang/LLVM based C/C++ compiler (cross-canadian for ${TARGE=
T_ARCH} target)"
> -HOMEPAGE =3D "http://clang.llvm.org/"
> +HOMEPAGE =3D "https://clang.llvm.org/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
>  SECTION =3D "devel"
> diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipe=
s-devtools/clang/clang-cross_git.bb
> index 2ec15dd1df..e9fc8a5bd1 100644
> --- a/meta/recipes-devtools/clang/clang-cross_git.bb
> +++ b/meta/recipes-devtools/clang/clang-cross_git.bb
> @@ -2,7 +2,7 @@
>  # Released under the MIT license (see COPYING.MIT for the terms)
>
>  SUMMARY =3D "Cross compiler wrappers for LLVM based C/C++ compiler"
> -HOMEPAGE =3D "http://clang.llvm.org/"
> +HOMEPAGE =3D "https://clang.llvm.org/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
>  SECTION =3D "devel"
> diff --git a/meta/recipes-devtools/clang/clang-crosssdk_git.bb b/meta/rec=
ipes-devtools/clang/clang-crosssdk_git.bb
> index 9b527975a9..907b2dc3f0 100644
> --- a/meta/recipes-devtools/clang/clang-crosssdk_git.bb
> +++ b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
> @@ -2,7 +2,7 @@
>  # Released under the MIT license (see COPYING.MIT for the terms)
>
>  SUMMARY =3D "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
> -HOMEPAGE =3D "http://clang.llvm.org/"
> +HOMEPAGE =3D "https://clang.llvm.org/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
>  SECTION =3D "devel"
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
> index e10c327a2a..cc9351617d 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -11,7 +11,7 @@ DESCRIPTION =3D "Clang is an LLVM based C/C++/Objective=
-C compiler, \
>                  in your code, and are great examples of the sort \
>                  of tools that can be built using the Clang frontend \
>                  as a library to parse C/C++ code"
> -HOMEPAGE =3D "http://clang.llvm.org/"
> +HOMEPAGE =3D "https://clang.llvm.org/"
>  SECTION =3D "devel"
>
>  require common-clang.inc
> diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/=
meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
> index 53d0d63169..e4fb7cedb2 100644
> --- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
> +++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
> @@ -4,7 +4,7 @@
>  SUMMARY =3D "LLVM based C/C++ compiler Sanitizers Runtime"
>  DESCRIPTION =3D "Runtime libraries that are required \
>                                 to run the code with sanitizer instrument=
ation"
> -HOMEPAGE =3D "http://compiler-rt.llvm.org/"
> +HOMEPAGE =3D "https://compiler-rt.llvm.org/"
>  SECTION =3D "base"
>
>  require common-clang.inc
> diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipe=
s-devtools/clang/compiler-rt_git.bb
> index a265c2aa93..24f5deb815 100644
> --- a/meta/recipes-devtools/clang/compiler-rt_git.bb
> +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
> @@ -6,7 +6,7 @@ DESCRIPTIOM =3D "Simple builtin library that provides an =
\
>                                 implementation of the low-level target-sp=
ecific \
>                                 hooks required by code generation and oth=
er runtime \
>                                 components"
> -HOMEPAGE =3D "http://compiler-rt.llvm.org/"
> +HOMEPAGE =3D "https://compiler-rt.llvm.org/"
>  SECTION =3D "base"
>
>  require common-clang.inc
> diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-dev=
tools/clang/libcxx_git.bb
> index fee7cfc9ea..dfdb7b821e 100644
> --- a/meta/recipes-devtools/clang/libcxx_git.bb
> +++ b/meta/recipes-devtools/clang/libcxx_git.bb
> @@ -2,7 +2,7 @@
>  # Released under the MIT license (see COPYING.MIT for the terms)
>
>  SUMMARY =3D "libc++ is a new implementation of the C++ standard library,=
 targeting C++11 and above"
> -HOMEPAGE =3D "http://libcxx.llvm.org/"
> +HOMEPAGE =3D "https://libcxx.llvm.org/"
>  SECTION =3D "base"
>
>  require common-clang.inc
> diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devto=
ols/clang/llvm_git.bb
> index 96ea383731..4e2a5a0bc7 100644
> --- a/meta/recipes-devtools/clang/llvm_git.bb
> +++ b/meta/recipes-devtools/clang/llvm_git.bb
> @@ -2,7 +2,7 @@
>  # Released under the MIT license (see COPYING.MIT for the terms)
>
>  SUMMARY =3D "The LLVM Compiler Infrastructure"
> -HOMEPAGE =3D "http://llvm.org"
> +HOMEPAGE =3D "https://llvm.org"
>  LICENSE =3D "Apache-2.0-with-LLVM-exception"
>  SECTION =3D "devel"
>
> diff --git a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb b/meta/r=
ecipes-devtools/clang/nativesdk-clang-glue.bb
> index 8e5622f6c1..6870720c6b 100644
> --- a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
> +++ b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
> @@ -2,7 +2,7 @@
>  # Released under the MIT license (see COPYING.MIT for the terms)
>
>  SUMMARY =3D "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
> -HOMEPAGE =3D "http://clang.llvm.org/"
> +HOMEPAGE =3D "https://clang.llvm.org/"
>  LICENSE =3D "Apache-2.0-with-LLVM-exception"
>  LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-=
exception;md5=3D0bcd48c3bdfef0c9d9fd17726e4b7dab"
>  SECTION =3D "devel"
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtool=
s/cmake/cmake.inc
> index d120638b1b..dc15e6b902 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -6,8 +6,8 @@ DESCRIPTION =3D "CMake is used to control the software co=
mpilation process \
>  using simple platform and compiler independent configuration files. CMak=
e \
>  generates native makefiles and workspaces that can be used in the compil=
er \
>  environment of your choice."
> -HOMEPAGE =3D "http://www.cmake.org/"
> -BUGTRACKER =3D "http://public.kitware.com/Bug/my_view_page.php"
> +HOMEPAGE =3D "https://www.cmake.org/"
> +BUGTRACKER =3D "https://public.kitware.com/Bug/my_view_page.php"
>  SECTION =3D "console/utils"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D0cafc0f3b6b28f3d5ecb5d1a6=
8c36471 \
> diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_=
0.28.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.=
bb
> index 35537572fe..a5569b0d7a 100644
> --- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
> +++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
> @@ -1,13 +1,13 @@
>  SUMMARY =3D "Command line utilities for working with *.desktop files"
>  DESCRIPTION =3D "desktop-file-utils contains a few command line utilitie=
s for working with desktop entries"
> -HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/desktop-file-util=
s"
> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/desktop-file-uti=
ls"
>  SECTION =3D "console/utils"
>  LICENSE =3D "GPL-2.0-or-later"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
>                      file://src/validator.c;beginline=3D4;endline=3D27;md=
5=3D281e1114ee6c486a1a0a4295986b9416"
>
> -SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/releases/${BP}.t=
ar.xz"
> +SRC_URI =3D "https://www.freedesktop.org/software/${BPN}/releases/${BP}.=
tar.xz"
>  SRC_URI[sha256sum] =3D "4401d4e231d842c2de8242395a74a395ca468cd96f5f610d=
822df33594898a70"
>
>  DEPENDS =3D "glib-2.0"
> diff --git a/meta/recipes-devtools/diffstat/diffstat_1.68.bb b/meta/recip=
es-devtools/diffstat/diffstat_1.68.bb
> index 488f0834d6..74259a9660 100644
> --- a/meta/recipes-devtools/diffstat/diffstat_1.68.bb
> +++ b/meta/recipes-devtools/diffstat/diffstat_1.68.bb
> @@ -2,12 +2,12 @@ SUMMARY =3D "Tool to produce a statistics based on a di=
ff"
>  DESCRIPTION =3D "diffstat reads the output of diff and displays a histog=
ram of \
>  the insertions, deletions, and modifications per-file. It is useful for =
\
>  reviewing large, complex patch files."
> -HOMEPAGE =3D "http://invisible-island.net/diffstat/"
> +HOMEPAGE =3D "https://invisible-island.net/diffstat/"
>  SECTION =3D "devel"
>  LICENSE =3D "X11"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0c432d3aeb935855b2ca1ad2a0542=
ce4"
>
> -SRC_URI =3D "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
> +SRC_URI =3D "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
>             file://run-ptest \
>             file://avoid-check-user-break-cc.patch \
>             "
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb b/meta/reci=
pes-devtools/dmidecode/dmidecode_3.7.bb
> index 93c3678d9a..4d81950b41 100644
> --- a/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
> +++ b/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "DMI (Desktop Management Interface) table related utilities"
> -HOMEPAGE =3D "http://www.nongnu.org/dmidecode/"
> +HOMEPAGE =3D "https://www.nongnu.org/dmidecode/"
>  DESCRIPTION =3D "Dmidecode reports information about your system's hardw=
are as described in your system BIOS according to the SMBIOS/DMI standard (=
see a sample output)."
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> diff --git a/meta/recipes-devtools/dnf/dnf_4.24.0.bb b/meta/recipes-devto=
ols/dnf/dnf_4.24.0.bb
> index d40b85c4b0..15e7f81aa7 100644
> --- a/meta/recipes-devtools/dnf/dnf_4.24.0.bb
> +++ b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
> @@ -27,7 +27,7 @@ inherit cmake gettext bash-completion setuptools3-base =
systemd
>
>  DEPENDS +=3D "libdnf librepo libcomps"
>
> -# manpages generation requires http://www.sphinx-doc.org/
> +# manpages generation requires https://www.sphinx-doc.org/
>  EXTRA_OECMAKE =3D " -DWITH_MAN=3D0 -DPYTHON_INSTALL_DIR=3D${PYTHON_SITEP=
ACKAGES_DIR} -DPYTHON_DESIRED=3D3"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.=
79.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.=
bb
> index 7e4730b5e9..1325c0c3e2 100644
> --- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
> +++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "XSL stylesheets for processing DocBook XML to various outpu=
t formats"
> -HOMEPAGE =3D "http://docbook.sourceforge.net"
> +HOMEPAGE =3D "https://docbook.sourceforge.net"
>  LICENSE =3D "DocBook-XML"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6beadd98f9c54ab0c387e14211ee4=
d0e"
>
> @@ -9,7 +9,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/docbook/docbook-xsl-${=
PV}.tar.bz2 \
>
>  SRC_URI[sha256sum] =3D "725f452e12b296956e8bfb876ccece71eeecdd14b94f667f=
3ed9091761a4a968"
>
> -UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/docbook/files/do=
cbook-xsl/"
> +UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/docbook/files/d=
ocbook-xsl/"
>  # Reject versions ending in .0 as those are release candidates
>  UPSTREAM_CHECK_REGEX =3D "/docbook-xsl/(?P<pver>(\d+[\.\-_]*)+(?!\.0)\.\=
d+)/"
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes=
-devtools/e2fsprogs/e2fsprogs.inc
> index cce6e5f1ac..b17ca0149e 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Ext2 Filesystem Utilities"
>  DESCRIPTION =3D "The Ext2 Filesystem Utilities (e2fsprogs) contain all o=
f the standard utilities for creating, \
>  fixing, configuring , and debugging ext2 filesystems."
> -HOMEPAGE =3D "http://e2fsprogs.sourceforge.net/"
> +HOMEPAGE =3D "https://e2fsprogs.sourceforge.net/"
>
>  LICENSE =3D "GPL-2.0-only & LGPL-2.0-only & BSD-3-Clause & MIT"
>  LICENSE:e2fsprogs-dumpe2fs =3D "GPL-2.0-only"
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.194.bb b/meta/reci=
pes-devtools/elfutils/elfutils_0.194.bb
> index f7963afcbe..dad081d900 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.194.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.194.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504 \
>  DEPENDS =3D "zlib virtual/libintl"
>  DEPENDS:append:libc-musl =3D " argp-standalone fts musl-legacy-error mus=
l-obstack"
>  # The Debian patches below are from:
> -# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.=
debian.tar.xz
> +# https://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1=
.debian.tar.xz
>  SRC_URI =3D "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
>             file://run-ptest \
>             file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patc=
h \
> diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes=
-devtools/expect/expect_5.45.4.bb
> index 48b5b0d934..90a6599914 100644
> --- a/meta/recipes-devtools/expect/expect_5.45.4.bb
> +++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
> @@ -7,7 +7,7 @@ X11 GUIs. An interpreted language provides branching and =
high-level control \
>  structures to direct the dialogue. In addition, the user can take contro=
l and \
>  interact directly when desired, afterward returning control to the scrip=
t. \
>  "
> -HOMEPAGE =3D "http://sourceforge.net/projects/expect/"
> +HOMEPAGE =3D "https://sourceforge.net/projects/expect/"
>  LICENSE =3D "PD"
>  SECTION =3D "devel"
>
> @@ -34,7 +34,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/=
${BPN}${PV}.tar.gz \
>             "
>  SRC_URI[sha256sum] =3D "49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c478=
1f89caf760b92c34"
>
> -UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/expect/files/Exp=
ect/"
> +UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/expect/files/Ex=
pect/"
>  UPSTREAM_CHECK_REGEX =3D "/Expect/(?P<pver>(\d+[\.\-_]*)+)/"
>
>  S =3D "${UNPACKDIR}/${BPN}${PV}"
> diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb b/meta/recipe=
s-devtools/fdisk/gptfdisk_1.0.10.bb
> index ba891931ac..08603d5efa 100644
> --- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb
> +++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.t=
ar.gz \
>             "
>  SRC_URI[sha256sum] =3D "2abed61bc6d2b9ec498973c0440b8b804b7a72d7144069b5=
a9209b2ad693a282"
>
> -UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/gptfdisk/files/g=
ptfdisk/"
> +UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/gptfdisk/files/=
gptfdisk/"
>  UPSTREAM_CHECK_REGEX =3D "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
>
>  EXTRA_OEMAKE =3D "'CC=3D${CC}' 'CXX=3D${CXX}' gdisk fixparts ${PACKAGECO=
NFIG_CONFARGS}"
> diff --git a/meta/recipes-devtools/file/file_5.46.bb b/meta/recipes-devto=
ols/file/file_5.46.bb
> index c035e0b11d..d90cf595cc 100644
> --- a/meta/recipes-devtools/file/file_5.46.bb
> +++ b/meta/recipes-devtools/file/file_5.46.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "File classification tool"
>  DESCRIPTION =3D "File attempts to classify files depending \
>  on their contents and prints a description if a match is found."
> -HOMEPAGE =3D "http://www.darwinsys.com/file/"
> +HOMEPAGE =3D "https://www.darwinsys.com/file/"
>  SECTION =3D "console/utils"
>
>  # two clause BSD
> diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devt=
ools/flex/flex_2.6.4.bb
> index fa8c0fb6fd..0caaf1a01f 100644
> --- a/meta/recipes-devtools/flex/flex_2.6.4.bb
> +++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Flex (The Fast Lexical Analyzer)"
>  DESCRIPTION =3D "Flex is a fast lexical analyser generator.  Flex is a t=
ool for generating programs that recognize \
>  lexical patterns in text."
> -HOMEPAGE =3D "http://sourceforge.net/projects/flex/"
> +HOMEPAGE =3D "https://sourceforge.net/projects/flex/"
>  SECTION =3D "devel"
>  LICENSE =3D "BSD-3-Clause & LGPL-2.0-or-later"
>  LICENSE:${PN}-libfl =3D "BSD-3-Clause"
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devt=
ools/gcc/gcc-common.inc
> index 8d95698743..cbe2f9ba1a 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "GNU cc and gcc C compilers"
> -HOMEPAGE =3D "http://www.gnu.org/software/gcc/"
> +HOMEPAGE =3D "https://www.gnu.org/software/gcc/"
>  DESCRIPTION =3D "The GNU Compiler Collection includes front ends for C, =
C++, Objective-C, Fortran, Ada, Go, and D, as well as libraries for these l=
anguages (libstdc++,...). GCC was originally written as the compiler for th=
e GNU operating system."
>  SECTION =3D "devel"
>  LICENSE =3D "GPL"
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devt=
ools/gdb/gdb-common.inc
> index 474cdf6514..e686c91ac9 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "GNU debugger"
> -HOMEPAGE =3D "http://www.gnu.org/software/gdb/"
> +HOMEPAGE =3D "https://www.gnu.org/software/gdb/"
>  DESCRIPTION =3D "GDB, the GNU Project debugger, allows you to see what i=
s going on inside another program while it executes -- or what another prog=
ram was doing at the moment it crashed."
>  SECTION =3D "devel"
>  DEPENDS =3D "expat gmp mpfr zlib ncurses virtual/libiconv ${LTTNGUST} bi=
son-native"
> diff --git a/meta/recipes-devtools/git/git_2.52.0.bb b/meta/recipes-devto=
ols/git/git_2.52.0.bb
> index 7312da9cfc..61253ccf99 100644
> --- a/meta/recipes-devtools/git/git_2.52.0.bb
> +++ b/meta/recipes-devtools/git/git_2.52.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Distributed version control system"
> -HOMEPAGE =3D "http://git-scm.com"
> +HOMEPAGE =3D "https://git-scm.com"
>  DESCRIPTION =3D "Git is a free and open source distributed version contr=
ol system designed to handle everything from small to very large projects w=
ith speed and efficiency."
>  SECTION =3D "console/utils"
>  LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-=
1.0 & LGPL-2.1-or-later"
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.5.bb b/meta/r=
ecipes-devtools/go/go-binary-native_1.25.5.bb
> index 5ecbca6d17..c79db8adac 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.25.5.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.25.5.bb
> @@ -1,7 +1,7 @@
>  # This recipe is for bootstrapping our go-cross from a prebuilt binary o=
f Go from golang.org.
>
>  SUMMARY =3D "Go programming language compiler (upstream binary for boots=
trap)"
> -HOMEPAGE =3D " http://golang.org/"
> +HOMEPAGE =3D " https://golang.org/"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7998cb338f82d15c0eff93b7004d2=
72a"
>
> diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtoo=
ls/go/go-common.inc
> index 061db4296c..b7f81a80c9 100644
> --- a/meta/recipes-devtools/go/go-common.inc
> +++ b/meta/recipes-devtools/go/go-common.inc
> @@ -9,7 +9,7 @@ DESCRIPTION =3D " The Go programming language is an open =
source project to make \
>   fast, statically typed, compiled language that feels like a\
>   dynamically typed, interpreted language."
>
> -HOMEPAGE =3D " http://golang.org/"
> +HOMEPAGE =3D " https://golang.org/"
>  LICENSE =3D "BSD-3-Clause"
>
>  inherit goarch
> diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb b/meta/rec=
ipes-devtools/intltool/intltool_0.51.0.bb
> index d582c87fdc..a8af6c8b1f 100644
> --- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
> +++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
> @@ -5,7 +5,7 @@ SECTION =3D "devel"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
>
> -SRC_URI =3D "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar=
.gz \
> +SRC_URI =3D "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.ta=
r.gz \
>             file://intltool-nowarn.patch \
>             file://perl-522-deprecations.patch \
>             file://remove-perl-check.patch \
> diff --git a/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb b/meta=
/recipes-devtools/libedit/libedit_20251016-3.1.bb
> index 2ea75bba87..1aead806a3 100644
> --- a/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
> +++ b/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "BSD replacement for libreadline"
>  DESCRIPTION =3D "Command line editor library providing generic line edit=
ing, \
>  history, and tokenization functions"
> -HOMEPAGE =3D "http://www.thrysoee.dk/editline/"
> +HOMEPAGE =3D "https://www.thrysoee.dk/editline/"
>  SECTION =3D "libs"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1e4228d0c5a9093b01aeaaeae6641=
533"
> @@ -10,7 +10,7 @@ DEPENDS =3D "ncurses"
>
>  inherit autotools
>
> -SRC_URI =3D "http://www.thrysoee.dk/editline/${BP}.tar.gz \
> +SRC_URI =3D "https://www.thrysoee.dk/editline/${BP}.tar.gz \
>             file://stdc-predef.patch \
>            "
>  SRC_URI[sha256sum] =3D "21362b00653bbfc1c71f71a7578da66b5b5203559d43134d=
2dd7719e313ce041"
> diff --git a/meta/recipes-devtools/libtool/libtool-2.5.4.inc b/meta/recip=
es-devtools/libtool/libtool-2.5.4.inc
> index 4d9a822de2..4b97d7d6b0 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.5.4.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.5.4.inc
> @@ -2,7 +2,7 @@ SUMMARY =3D "Generic library support script"
>  DESCRIPTION =3D "This is GNU libtool, a generic library support script. =
\
>  Libtool hides the complexity of generating special library types \
>  (such as shared libraries) behind a consistent interface."
> -HOMEPAGE =3D "http://www.gnu.org/software/libtool/libtool.html"
> +HOMEPAGE =3D "https://www.gnu.org/software/libtool/libtool.html"
>  SECTION =3D "devel"
>  LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D570a9b3749dd0463a1778803b12a6=
dce \
> diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb b/meta/re=
cipes-devtools/log4cplus/log4cplus_2.1.2.bb
> index 9a3c31e887..ca4f6cee94 100644
> --- a/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
> +++ b/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
> @@ -1,8 +1,8 @@
>  SUMMARY =3D "log4cplus provides a simple C++ logging API for log managem=
ent"
>  SECTION =3D "libs"
> -HOMEPAGE =3D "http://sourceforge.net/projects/log4cplus/"
> +HOMEPAGE =3D "https://sourceforge.net/projects/log4cplus/"
>  DESCRIPTION =3D "log4cplus is a simple to use C++ logging API providing =
thread-safe, flexible, and arbitrarily granular control over log management=
 and configuration. It is modelled after the Java log4j API."
> -BUGTRACKER =3D "http://sourceforge.net/p/log4cplus/bugs/"
> +BUGTRACKER =3D "https://sourceforge.net/p/log4cplus/bugs/"
>
>  LICENSE =3D "Apache-2.0 & BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41e8e060c26822886b592ab4765c7=
56b"
> diff --git a/meta/recipes-devtools/lua/lua_5.4.8.bb b/meta/recipes-devtoo=
ls/lua/lua_5.4.8.bb
> index 1d37cddeb8..b78def353e 100644
> --- a/meta/recipes-devtools/lua/lua_5.4.8.bb
> +++ b/meta/recipes-devtools/lua/lua_5.4.8.bb
> @@ -2,11 +2,11 @@ SUMMARY =3D "Lua is a powerful light-weight programming=
 language designed \
>  for extending applications."
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://doc/readme.html;beginline=3D305;endline=3D3=
26;md5=3D0e573c143cb6491b41cf02cfbcb8c267"
> -HOMEPAGE =3D "http://www.lua.org/"
> +HOMEPAGE =3D "https://www.lua.org/"
>
> -SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=3Dtarballsrc \
> +SRC_URI =3D "https://www.lua.org/ftp/lua-${PV}.tar.gz;name=3Dtarballsrc =
\
>             file://lua.pc.in \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.=
lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=3Dtarballtest file://r=
un-ptest ', '', d)} \
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'https://www=
.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=3Dtarballtest file://=
run-ptest ', '', d)} \
>             "
>
>  # if no test suite matches PV release of Lua exactly, download the suite=
 for the closest Lua release.
> diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/=
make/make.inc
> index 56b863480c..c7ef1a8e32 100644
> --- a/meta/recipes-devtools/make/make.inc
> +++ b/meta/recipes-devtools/make/make.inc
> @@ -2,7 +2,7 @@ SUMMARY =3D "GNU tool that controls the build process"
>  DESCRIPTION =3D "Make is a tool which controls the generation of executa=
bles and other non-source files of a \
>  program from the program's source files.  Make gets its knowledge of how=
 to build your program from a file \
>  called the makefile, which lists each of the non-source files and how to=
 compute it from other files."
> -HOMEPAGE =3D "http://www.gnu.org/software/make/"
> +HOMEPAGE =3D "https://www.gnu.org/software/make/"
>  SECTION =3D "devel"
>
>  SRC_URI =3D "${GNU_MIRROR}/make/make-${PV}.tar.gz \
> diff --git a/meta/recipes-devtools/meson/meson_1.10.0.bb b/meta/recipes-d=
evtools/meson/meson_1.10.0.bb
> index 6f629b7ec3..a32462ba2e 100644
> --- a/meta/recipes-devtools/meson/meson_1.10.0.bb
> +++ b/meta/recipes-devtools/meson/meson_1.10.0.bb
> @@ -1,4 +1,4 @@
> -HOMEPAGE =3D "http://mesonbuild.com"
> +HOMEPAGE =3D "https://mesonbuild.com"
>  SUMMARY =3D "A high performance build system"
>  DESCRIPTION =3D "Meson is a build system designed to increase programmer=
 \
>  productivity. It does this by providing a fast, simple and easy to use \
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb b/meta/recipes-=
devtools/mtd/mtd-utils_2.3.0.bb
> index 08ab677676..bc1da11277 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Tools for managing memory technology devices"
> -HOMEPAGE =3D "http://www.linux-mtd.infradead.org/"
> +HOMEPAGE =3D "https://www.linux-mtd.infradead.org/"
>  DESCRIPTION =3D "mtd-utils tool is a generic Linux subsystem for memory =
devices, especially Flash devices."
>  SECTION =3D "base"
>  LICENSE =3D "GPL-2.0-or-later"
> diff --git a/meta/recipes-devtools/mtools/mtools_4.0.49.bb b/meta/recipes=
-devtools/mtools/mtools_4.0.49.bb
> index 294b2f37b2..029f4760ac 100644
> --- a/meta/recipes-devtools/mtools/mtools_4.0.49.bb
> +++ b/meta/recipes-devtools/mtools/mtools_4.0.49.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Utilities to access MS-DOS disks without mounting them"
>  DESCRIPTION =3D "Mtools is a collection of utilities to access MS-DOS di=
sks from GNU and Unix without mounting them."
> -HOMEPAGE =3D "http://www.gnu.org/software/mtools/"
> +HOMEPAGE =3D "https://www.gnu.org/software/mtools/"
>  SECTION =3D "optional"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> diff --git a/meta/recipes-devtools/nasm/nasm_3.01.bb b/meta/recipes-devto=
ols/nasm/nasm_3.01.bb
> index 1e4719000f..c62d7ba9a0 100644
> --- a/meta/recipes-devtools/nasm/nasm_3.01.bb
> +++ b/meta/recipes-devtools/nasm/nasm_3.01.bb
> @@ -1,11 +1,11 @@
>  SUMMARY =3D "General-purpose x86 assembler"
>  SECTION =3D "devel"
> -HOMEPAGE =3D "http://www.nasm.us/"
> +HOMEPAGE =3D "https://www.nasm.us/"
>  DESCRIPTION =3D "The Netwide Assembler (NASM) is an assembler and disass=
embler for the Intel x86 architecture."
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6178dc4f5355e40552448080e67a2=
14b"
>
> -SRC_URI =3D "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.=
tar.bz2 \
> +SRC_URI =3D "https://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}=
.tar.bz2 \
>             file://0001-stdlib-Add-strlcat.patch \
>             file://0002-Add-debug-prefix-map-option.patch \
>             file://0001-compiler.h-Backport-C23-support.patch \
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb b/meta/=
recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
> index 9f1a91e1d3..b83c1b3cfd 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Additional utilities for the opkg package manager"
>  SUMMARY:update-alternatives-opkg =3D "Utility for managing the alternati=
ves system"
>  SECTION =3D "base"
> -HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
> +HOMEPAGE =3D "https://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
>                      file://opkg.py;beginline=3D2;endline=3D18;md5=3Dffa1=
1ff3c15eb31c6a7ceaa00cc9f986"
> diff --git a/meta/recipes-devtools/opkg/opkg_0.9.0.bb b/meta/recipes-devt=
ools/opkg/opkg_0.9.0.bb
> index 7551f1bc49..50a892676e 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> @@ -12,7 +12,7 @@ DEPENDS =3D "libarchive zstd"
>
>  PE =3D "1"
>
> -SRC_URI =3D "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${=
PV}.tar.gz \
> +SRC_URI =3D "https://downloads.yoctoproject.org/releases/${BPN}/${BPN}-$=
{PV}.tar.gz \
>             file://opkg.conf \
>             file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-=
run.patch \
>             file://0002-config.h.in-fix-typo.patch \
> diff --git a/meta/recipes-devtools/orc/orc_0.4.41.bb b/meta/recipes-devto=
ols/orc/orc_0.4.41.bb
> index 60677577b0..05f42b1526 100644
> --- a/meta/recipes-devtools/orc/orc_0.4.41.bb
> +++ b/meta/recipes-devtools/orc/orc_0.4.41.bb
> @@ -1,10 +1,10 @@
>  SUMMARY =3D "Optimised Inner Loop Runtime Compiler"
> -HOMEPAGE =3D "http://gstreamer.freedesktop.org/modules/orc.html"
> +HOMEPAGE =3D "https://gstreamer.freedesktop.org/modules/orc.html"
>  DESCRIPTION =3D "Optimised Inner Loop Runtime Compiler is a Library and =
set of tools for compiling and executing SIMD assembly language-like progra=
ms that operate on arrays of data."
>  LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1400bd9d09e8af56b9ec982b3d857=
97e"
>
> -SRC_URI =3D "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
> +SRC_URI =3D "https://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
>  SRC_URI[sha256sum] =3D "cb1bfd4f655289cd39bc04642d597be9de5427623f0861c1=
fc19c08d98467fa2"
>
>  inherit meson pkgconfig gtk-doc
> diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtool=
s/patch/patch.inc
> index 44d3046fd8..03f96e73cd 100644
> --- a/meta/recipes-devtools/patch/patch.inc
> +++ b/meta/recipes-devtools/patch/patch.inc
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "patch takes a patch file containing a di=
fference listing \
>  produced by the diff program and applies those differences to one or mor=
e \
>  original files, producing patched versions."
>  SECTION =3D "utils"
> -HOMEPAGE =3D "http://savannah.gnu.org/projects/patch/"
> +HOMEPAGE =3D "https://savannah.gnu.org/projects/patch/"
>
>  SRC_URI =3D "${GNU_MIRROR}/patch/patch-${PV}.tar.gz"
>  S =3D "${UNPACKDIR}/patch-${PV}"
> diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb b/meta=
/recipes-devtools/perl/libxml-parser-perl_2.47.bb
> index b6d28c4bb3..b747a90cc0 100644
> --- a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
> +++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4342f85bf14a1f=
dd6a751573f1e61c03"
>
>  DEPENDS +=3D "expat"
>
> -SRC_URI =3D "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.=
tar.gz \
> +SRC_URI =3D "https://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}=
.tar.gz \
>             file://0001-Makefile.PL-make-check_lib-cross-friendly.patch \
>             "
>
> diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipe=
s-devtools/perl/libxml-perl_0.08.bb
> index 728b606ed2..df06bbc3f3 100644
> --- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
> +++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D33;endl=
ine=3D35;md5=3D1705549eef7577a3d6
>
>  DEPENDS +=3D "libxml-parser-perl"
>
> -SRC_URI =3D "http://www.cpan.org/modules/by-module/XML/${BPN}-${PV}.tar.=
gz"
> +SRC_URI =3D "https://www.cpan.org/modules/by-module/XML/${BPN}-${PV}.tar=
.gz"
>
>  SRC_URI[sha256sum] =3D "4571059b7b5d48b7ce52b01389e95d798bf5cf2020523c15=
3ff27b498153c9cb"
>
> diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb b/meta=
/recipes-devtools/perl/libxml-simple-perl_2.25.bb
> index f5fd2d3f0e..f3a6fd1ca6 100644
> --- a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
> +++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
> @@ -10,7 +10,7 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcf206df8c9fe775f1d4c484386491=
eac"
>  DEPENDS +=3D "libxml-parser-perl"
>
> -SRC_URI =3D "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.=
tar.gz"
> +SRC_URI =3D "https://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}=
.tar.gz"
>
>  SRC_URI[sha256sum] =3D "531fddaebea2416743eb5c4fdfab028f502123d9a220405a=
4100e68fc480dbf8"
>
> diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-dev=
tools/perl/perl_5.40.2.bb
> index a78d2ed0be..2be2da73d4 100644
> --- a/meta/recipes-devtools/perl/perl_5.40.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Perl scripting language"
> -HOMEPAGE =3D "http://www.perl.org/"
> +HOMEPAGE =3D "https://www.perl.org/"
>  DESCRIPTION =3D "Perl is a highly capable, feature-rich programming lang=
uage"
>  SECTION =3D "devel"
>  LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_2.5.1.bb
> index 12ca075b5d..41e9cfc904 100644
> --- a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
> +++ b/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "pkgconf is a program which helps to conf=
igure compiler and linker
>  flags for development frameworks. It is similar to pkg-config from \
>  freedesktop.org, providing additional functionality while also maintaini=
ng \
>  compatibility."
> -HOMEPAGE =3D "http://pkgconf.org"
> +HOMEPAGE =3D "https://pkgconf.org"
>  BUGTRACKER =3D "https://github.com/pkgconf/pkgconf/issues"
>  SECTION =3D "devel"
>  PROVIDES +=3D "pkgconfig"
> diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/reci=
pes-devtools/pkgconfig/pkgconfig_git.bb
> index 19b9b6bc9d..27c1178f44 100644
> --- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> @@ -1,8 +1,8 @@
>  SUMMARY =3D "Helper tool used when compiling"
>  DESCRIPTION =3D "pkg-config is a helper tool used when compiling applica=
tions and libraries. It helps determined \
>  the correct compiler/link options.  It is also language-agnostic."
> -HOMEPAGE =3D "http://pkg-config.freedesktop.org/wiki/"
> -BUGTRACKER =3D "http://bugs.freedesktop.org/buglist.cgi?product=3Dpkg-co=
nfig"
> +HOMEPAGE =3D "https://pkg-config.freedesktop.org/wiki/"
> +BUGTRACKER =3D "https://bugs.freedesktop.org/buglist.cgi?product=3Dpkg-c=
onfig"
>  SECTION =3D "console/utils"
>
>  LICENSE =3D "GPL-2.0-or-later"
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devto=
ols/pseudo/pseudo.inc
> index 836e910fae..0f32508eb4 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -3,7 +3,7 @@
>  # BBFETCH2=3DTrue PSEUDO_BUILD=3D1 ../bitbake/bin/bitbake pseudo-native =
[-c CMD]
>
>  SUMMARY =3D "Pseudo gives fake root capabilities to a normal user"
> -HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi/pseudo"
> +HOMEPAGE =3D "https://git.yoctoproject.org/cgit/cgit.cgi/pseudo"
>  DESCRIPTION =3D "The pseudo utility offers a way to run commands in a vi=
rtualized root environment."
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da1d8023a6f953ac6ea4af765ff62d=
574"
>  SECTION =3D "base"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
> index 19b0d29b71..21a0d7570a 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -5,10 +5,10 @@ SRC_URI =3D "git://git.yoctoproject.org/pseudo;branch=
=3Dmaster;protocol=3Dhttps \
>             file://fallback-group \
>             "
>  SRC_URI:append:class-native =3D " \
> -    http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.3=
3.tar.xz;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=3Dprebuilt \
> +    https://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.=
33.tar.xz;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=3Dprebuilt \
>      file://older-glibc-symbols.patch"
>  SRC_URI:append:class-nativesdk =3D " \
> -    http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.3=
3.tar.xz;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=3Dprebuilt \
> +    https://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.=
33.tar.xz;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=3Dprebuilt \
>      file://older-glibc-symbols.patch"
>  SRC_URI[prebuilt.sha256sum] =3D "ed9f456856e9d86359f169f46a70ad7be4190d6=
040282b84c8d97b99072485aa"
>
> diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/=
recipes-devtools/python/python-pycryptodome.inc
> index ec9241e6d5..3e8878c15e 100644
> --- a/meta/recipes-devtools/python/python-pycryptodome.inc
> +++ b/meta/recipes-devtools/python/python-pycryptodome.inc
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Cryptographic library for Python"
>  DESCRIPTION =3D "PyCryptodome is a self-contained Python package of low-=
level\
>   cryptographic primitives."
> -HOMEPAGE =3D "http://www.pycryptodome.org"
> +HOMEPAGE =3D "https://www.pycryptodome.org"
>  LICENSE =3D "PD & BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D29242a70410a4eeff488a2816=
4e7ab93"
>
> diff --git a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb b/meta/=
recipes-devtools/python/python3-attrs_25.4.0.bb
> index 7bc581b875..c55186a5f9 100644
> --- a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
> +++ b/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Classes Without Boilerplate"
> -HOMEPAGE =3D "http://www.attrs.org/"
> +HOMEPAGE =3D "https://www.attrs.org/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5e55731824cf9205cfabeab9a0600=
887"
>
> diff --git a/meta/recipes-devtools/python/python3-babel_2.17.0.bb b/meta/=
recipes-devtools/python/python3-babel_2.17.0.bb
> index adffaa044c..520ad3e82b 100644
> --- a/meta/recipes-devtools/python/python3-babel_2.17.0.bb
> +++ b/meta/recipes-devtools/python/python3-babel_2.17.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "A collection of tools for internationalizing Python applica=
tions"
> -HOMEPAGE =3D "http://babel.edgewall.org/"
> +HOMEPAGE =3D "https://babel.edgewall.org/"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De83509a66c69efcb4f3a7d4f27fd0=
693"
>
> diff --git a/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb b/m=
eta/recipes-devtools/python/python3-certifi_2026.1.4.bb
> index 7a753f5b2d..fa50a9bd10 100644
> --- a/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
> +++ b/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Python package for providing Mozilla's CA Bu=
ndle."
>  DESCRIPTION =3D "This installable Python package contains a CA Bundle th=
at you can reference in your \
>  Python code. This is useful for verifying HTTP requests, for example.  T=
his is the same CA Bundle \
>  which ships with the Requests codebase, and is derived from Mozilla Fire=
fox's canonical set."
> -HOMEPAGE =3D " http://certifi.io/"
> +HOMEPAGE =3D " https://certifi.io/"
>
>  LICENSE =3D "ISC"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D11618cb6a975948679286b1211bd5=
73c"
> diff --git a/meta/recipes-devtools/python/python3-cffi_2.0.0.bb b/meta/re=
cipes-devtools/python/python3-cffi_2.0.0.bb
> index 9bfc430dde..5e54555739 100644
> --- a/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Foreign Function Interface for Python calling C code"
> -HOMEPAGE =3D "http://cffi.readthedocs.org/"
> +HOMEPAGE =3D "https://cffi.readthedocs.org/"
>  LICENSE =3D "MIT-0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc0158ab9b75875f3bb7fea081d388=
818"
>  DEPENDS +=3D "libffi python3-pycparser"
> diff --git a/meta/recipes-devtools/python/python3-click_8.3.1.bb b/meta/r=
ecipes-devtools/python/python3-click_8.3.1.bb
> index 1f42fe1a50..f87b5a7132 100644
> --- a/meta/recipes-devtools/python/python3-click_8.3.1.bb
> +++ b/meta/recipes-devtools/python/python3-click_8.3.1.bb
> @@ -4,7 +4,7 @@ Click is a Python package for creating beautiful command =
line interfaces \
>  in a composable way with as little code as necessary. It's the "Command =
\
>  Line Interface Creation Kit". It's highly configurable but comes with \
>  sensible defaults out of the box."
> -HOMEPAGE =3D "http://click.pocoo.org/"
> +HOMEPAGE =3D "https://click.pocoo.org/"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D1fa98232fd645608937a0fdc8=
2e999b8"
>
> diff --git a/meta/recipes-devtools/python/python3-dbus_1.4.0.bb b/meta/re=
cipes-devtools/python/python3-dbus_1.4.0.bb
> index 2854eda30a..88c106a5b0 100644
> --- a/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
> +++ b/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
> @@ -1,11 +1,11 @@
>  SUMMARY =3D "Python bindings for the DBus inter-process communication sy=
stem"
>  SECTION =3D "devel/python"
> -HOMEPAGE =3D "http://www.freedesktop.org/Software/dbus"
> +HOMEPAGE =3D "https://www.freedesktop.org/Software/dbus"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D97f58951300aa52a9f9e3a62bd5c8=
46c"
>  DEPENDS =3D "expat dbus glib-2.0 virtual/libintl"
>
> -SRC_URI =3D "http://dbus.freedesktop.org/releases/dbus-python/dbus-pytho=
n-${PV}.tar.xz"
> +SRC_URI =3D "https://dbus.freedesktop.org/releases/dbus-python/dbus-pyth=
on-${PV}.tar.xz"
>
>  SRC_URI[sha256sum] =3D "c36b28f10ffcc8f1f798aca973bcc132f91f33eb9b6b8904=
381b4077766043d5"
>
> diff --git a/meta/recipes-devtools/python/python3-docutils_0.22.4.bb b/me=
ta/recipes-devtools/python/python3-docutils_0.22.4.bb
> index 571a19a958..7d84b63e91 100644
> --- a/meta/recipes-devtools/python/python3-docutils_0.22.4.bb
> +++ b/meta/recipes-devtools/python/python3-docutils_0.22.4.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Docutils is a modular system for processing documentation i=
nto useful formats"
> -HOMEPAGE =3D "http://docutils.sourceforge.net"
> +HOMEPAGE =3D "https://docutils.sourceforge.net"
>  SECTION =3D "devel/python"
>  LICENSE =3D "CC0-1.0 & BSD-2-Clause & GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING.rst;md5=3Dce467b04b35c7ac3429b6908f=
c8b318e"
> diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/re=
cipes-devtools/python/python3-git_3.1.43.bb
> index 2126b5e92b..31dcd716bc 100644
> --- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
> +++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "GitPython provides object model read and=
 write access to \
>  a git repository. Access repository information conveniently, alter the =
\
>  index directly, handle remotes, or go down to low-level object database =
\
>  access with big-files support."
> -HOMEPAGE =3D "http://github.com/gitpython-developers/GitPython"
> +HOMEPAGE =3D "https://github.com/gitpython-developers/GitPython"
>  SECTION =3D "devel/python"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5279a7ab369ba336989dcf2a107e5=
c8e"
> diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.12.bb b/meta/=
recipes-devtools/python/python3-gitdb_4.0.12.bb
> index 0b7eec876f..a790cc2502 100644
> --- a/meta/recipes-devtools/python/python3-gitdb_4.0.12.bb
> +++ b/meta/recipes-devtools/python/python3-gitdb_4.0.12.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "A pure-Python git object database"
> -HOMEPAGE =3D "http://github.com/gitpython-developers/gitdb"
> +HOMEPAGE =3D "https://github.com/gitpython-developers/gitdb"
>  SECTION =3D "devel/python"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D59e5ecb13339a936eedf83282eaf4=
528"
> diff --git a/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb b/meta=
/recipes-devtools/python/python3-iso8601_2.1.0.bb
> index d7ab4a5a77..2065e5d721 100644
> --- a/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
> +++ b/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Simple module to parse ISO 8601 dates"
> -HOMEPAGE =3D "http://pyiso8601.readthedocs.org/"
> +HOMEPAGE =3D "https://pyiso8601.readthedocs.org/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daab31f2ef7ba214a5a341eaa47a7f=
367"
>
> diff --git a/meta/recipes-devtools/python/python3-magic_0.4.27.bb b/meta/=
recipes-devtools/python/python3-magic_0.4.27.bb
> index 2e561e69d7..e5818c808a 100644
> --- a/meta/recipes-devtools/python/python3-magic_0.4.27.bb
> +++ b/meta/recipes-devtools/python/python3-magic_0.4.27.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "File type identification using libmagic"
>  DESCRIPTION =3D "This module uses ctypes to access the libmagic file typ=
e \
>      identification library. It makes use of the local magic database and=
 supports \
>      both textual and MIME-type output."
> -HOMEPAGE =3D "http://github.com/ahupp/python-magic"
> +HOMEPAGE =3D "https://github.com/ahupp/python-magic"
>
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D61495c152d794e6be5799a9edca14=
9e3"
> diff --git a/meta/recipes-devtools/python/python3-mako_1.3.10.bb b/meta/r=
ecipes-devtools/python/python3-mako_1.3.10.bb
> index 2d937dc184..0c86aa2f9f 100644
> --- a/meta/recipes-devtools/python/python3-mako_1.3.10.bb
> +++ b/meta/recipes-devtools/python/python3-mako_1.3.10.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Templating library for Python"
> -HOMEPAGE =3D "http://www.makotemplates.org/"
> +HOMEPAGE =3D "https://www.makotemplates.org/"
>  SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D73026b50800163bd3c75cfdc121d9=
eb5"
> diff --git a/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb b/m=
eta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
> index dace235bb8..7600746d32 100644
> --- a/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
> +++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Implements a XML/HTML/XHTML Markup safe string for Python"
> -HOMEPAGE =3D "http://github.com/mitsuhiko/markupsafe"
> +HOMEPAGE =3D "https://github.com/mitsuhiko/markupsafe"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dffeffa59c90c9c4a033c7574f=
8f3fb75"
>
> diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb b/meta/=
recipes-devtools/python/python3-pyasn1_0.6.1.bb
> index 820ef27d2b..b1ea45a160 100644
> --- a/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
> +++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Python library implementing ASN.1 types."
> -HOMEPAGE =3D "http://pyasn1.sourceforge.net/"
> +HOMEPAGE =3D "https://pyasn1.sourceforge.net/"
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D190f79253908c986e6cacf380=
c3a5f6d"
>
> diff --git a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb b/met=
a/recipes-devtools/python/python3-pycairo_1.29.0.bb
> index 20c2c332cd..90eeb708d7 100644
> --- a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
> +++ b/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Python bindings for the Cairo canvas library"
> -HOMEPAGE =3D "http://cairographics.org/pycairo"
> -BUGTRACKER =3D "http://bugs.freedesktop.org"
> +HOMEPAGE =3D "https://cairographics.org/pycairo"
> +BUGTRACKER =3D "https://bugs.freedesktop.org"
>  SECTION =3D "python-devel"
>  LICENSE =3D "LGPL-2.1-only & MPL-1.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df3713ca2c28d9312ad718520b6dc3=
eee \
> diff --git a/meta/recipes-devtools/python/python3-pygments_2.19.2.bb b/me=
ta/recipes-devtools/python/python3-pygments_2.19.2.bb
> index a1f73b441d..f4cd1d23e8 100644
> --- a/meta/recipes-devtools/python/python3-pygments_2.19.2.bb
> +++ b/meta/recipes-devtools/python/python3-pygments_2.19.2.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Pygments is a syntax highlighting package written in Python=
."
>  DESCRIPTION =3D "Pygments is a syntax highlighting package written in Py=
thon."
> -HOMEPAGE =3D "http://pygments.org/"
> +HOMEPAGE =3D "https://pygments.org/"
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D36a13c90514e2899f1eba7f41c3ee=
592"
>
> diff --git a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta=
/recipes-devtools/python/python3-pysocks_1.7.1.bb
> index dbf0fb0ee6..7f4f419671 100644
> --- a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
> +++ b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "A Python SOCKS client module"
> -HOMEPAGE =3D "http://python-requests.org"
> +HOMEPAGE =3D "https://python-requests.org"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1d457bcffb9661b45f799d4efee72=
f16"
>
> diff --git a/meta/recipes-devtools/python/python3-pytz_2025.2.bb b/meta/r=
ecipes-devtools/python/python3-pytz_2025.2.bb
> index 86bfceadc8..bbcb713958 100644
> --- a/meta/recipes-devtools/python/python3-pytz_2025.2.bb
> +++ b/meta/recipes-devtools/python/python3-pytz_2025.2.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "World timezone definitions, modern and historical"
> -HOMEPAGE =3D "http://pythonhosted.org/pytz"
> +HOMEPAGE =3D "https://pythonhosted.org/pytz"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D1a67fc46c1b596cce5d21209b=
be75999"
>
> diff --git a/meta/recipes-devtools/python/python3-semantic-version_2.10.0=
.bb b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
> index 78763a911e..e65b4a8bb7 100644
> --- a/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
> +++ b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY  =3D "A library implementing the 'SemVer' scheme."
> -DESCRIPTION =3D "Semantic version comparison for Python (see http://semv=
er.org/)"
> +DESCRIPTION =3D "Semantic version comparison for Python (see https://sem=
ver.org/)"
>  HOMEPAGE =3D "https://github.com/rbarrois/python-semanticversion"
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fb31e3c1c7eeb8b5e8c07657cdd5=
4e2"
> diff --git a/meta/recipes-devtools/python/python3-smmap_6.0.0.bb b/meta/r=
ecipes-devtools/python/python3-smmap_6.0.0.bb
> index 6abed1205f..1b36a5ce31 100644
> --- a/meta/recipes-devtools/python/python3-smmap_6.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-smmap_6.0.0.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Python implementation of a sliding window me=
mory map manager"
>  DESCRIPTION =3D "A pure Python implementation of a sliding memory map to=
 \
>  help unifying memory mapped access on 32 and 64 bit systems and to help =
\
>  managing resources more efficiently."
> -HOMEPAGE =3D "http://github.com/gitpython-developers/GitPython"
> +HOMEPAGE =3D "https://github.com/gitpython-developers/GitPython"
>  SECTION =3D "devel/python"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3De9=
10b35b0ef4e1f665b9a75d6afb7709"
> diff --git a/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.=
bb b/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb
> index 0755d3e177..c1999f2c36 100644
> --- a/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb
> +++ b/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Sorted Containers is an Apache2 licensed sorted collections=
 library, written in pure-Python, and fast as C-extensions."
> -HOMEPAGE =3D "http://www.grantjenks.com/docs/sortedcontainers/"
> +HOMEPAGE =3D "https://www.grantjenks.com/docs/sortedcontainers/"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7c7c6a1a12ec816da16c1839137d5=
3ae"
>
> diff --git a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb b/meta/=
recipes-devtools/python/python3-sphinx_9.1.0.bb
> index 24e95da10d..34e201003d 100644
> --- a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
> +++ b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Python documentation generator"
> -HOMEPAGE =3D "http://sphinx-doc.org/"
> +HOMEPAGE =3D "https://sphinx-doc.org/"
>  SECTION =3D "devel/python"
>  LICENSE =3D "BSD-2-Clause & MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3De30c37a2b7fb0afa3adc0d72b=
85e8b04"
> diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.=
0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
> index 141d1c4862..cfae73ac7e 100644
> --- a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Is a sphinx extension which outputs QtHelp document."
> -HOMEPAGE =3D "http://babel.edgewall.org/"
> +HOMEPAGE =3D "https://babel.edgewall.org/"
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENCE.rst;md5=3Df7a83b72ea86d04827575ec0b=
63430eb"
>
> diff --git a/meta/recipes-devtools/python/python3_3.13.11.bb b/meta/recip=
es-devtools/python/python3_3.13.11.bb
> index 2fcfd4aba1..8a1b9f2fbd 100644
> --- a/meta/recipes-devtools/python/python3_3.13.11.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.11.bb
> @@ -1,12 +1,12 @@
>  SUMMARY =3D "The Python Programming Language"
> -HOMEPAGE =3D "http://www.python.org"
> +HOMEPAGE =3D "https://www.python.org"
>  DESCRIPTION =3D "Python is a programming language that lets you work mor=
e quickly and integrate your systems more effectively."
>  LICENSE =3D "PSF-2.0"
>  SECTION =3D "devel/python"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3f64a4ff490f884d562feb77bf243=
5f1"
>
> -SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz =
\
> +SRC_URI =3D "https://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz=
 \
>             file://run-ptest \
>             file://create_manifest3.py \
>             file://get_module_deps3.py \
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index eb4a5f71bc..7dc834372e 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "QEMU is a hosted virtual machine monitor=
: it emulates the \
>  machine's processor through dynamic binary translation and provides a se=
t \
>  of different hardware and device models for the machine, enabling it to =
run \
>  a variety of guest operating systems"
> -HOMEPAGE =3D "http://qemu.org"
> +HOMEPAGE =3D "https://qemu.org"
>  LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>
>  DEPENDS +=3D "bison-native meson-native ninja-native"
> diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/r=
ecipes-devtools/qemu/qemuwrapper-cross_1.0.bb
> index 752ff3198d..0c1e464b03 100644
> --- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "QEMU wrapper script"
> -HOMEPAGE =3D "http://qemu.org"
> +HOMEPAGE =3D "https://qemu.org"
>  LICENSE =3D "MIT"
>
>  S =3D "${UNPACKDIR}"
> diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtool=
s/quilt/quilt.inc
> index 59d13237e2..96a3d44ec6 100644
> --- a/meta/recipes-devtools/quilt/quilt.inc
> +++ b/meta/recipes-devtools/quilt/quilt.inc
> @@ -2,7 +2,7 @@ SUMMARY =3D "Tool for working with series of patches"
>  DESCRIPTION =3D "Quilt is a tool to manage large sets of patches by keep=
ing \
>  track of the changes each patch makes. Patches can be applied, un-applie=
d,\
>  refreshed, etc."
> -HOMEPAGE =3D "http://savannah.nongnu.org/projects/quilt/"
> +HOMEPAGE =3D "https://savannah.nongnu.org/projects/quilt/"
>  SECTION =3D "devel"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devto=
ols/rpm/rpm_4.20.1.bb
> index ba967ec1fa..734f437179 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
> @@ -18,7 +18,7 @@ DESCRIPTION:python3-rpm =3D "The python3-rpm package co=
ntains a module that permit
>  written in the Python programming language to use the interface \
>  supplied by the RPM Package Manager libraries."
>
> -HOMEPAGE =3D "http://www.rpm.org"
> +HOMEPAGE =3D "https://www.rpm.org"
>
>  # libraries are also LGPL - how to express this?
>  LICENSE =3D "GPL-2.0-only"
> diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-de=
vtools/rsync/rsync_3.4.1.bb
> index 6de30d337d..3a04d1cb78 100644
> --- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
> +++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "File synchronization tool"
> -HOMEPAGE =3D "http://rsync.samba.org/"
> +HOMEPAGE =3D "https://rsync.samba.org/"
>  DESCRIPTION =3D "rsync is an open source utility that provides fast incr=
emental file transfer."
> -BUGTRACKER =3D "http://rsync.samba.org/bugzilla.html"
> +BUGTRACKER =3D "https://rsync.samba.org/bugzilla.html"
>  SECTION =3D "console/network"
>  # GPL-2.0-or-later (<< 3.0.0), GPL-3.0-or-later (>=3D 3.0.0)
>  # Includes opennsh and xxhash dynamic link exception
> diff --git a/meta/recipes-devtools/ruby/ruby_3.4.7.bb b/meta/recipes-devt=
ools/ruby/ruby_3.4.7.bb
> index 2fbcfd1f1b..810c0d66f9 100644
> --- a/meta/recipes-devtools/ruby/ruby_3.4.7.bb
> +++ b/meta/recipes-devtools/ruby/ruby_3.4.7.bb
> @@ -4,7 +4,7 @@ and easy object-oriented programming. It has many feature=
s to process \
>  text files and to do system management tasks (as in Perl). \
>  It is simple, straight-forward, and extensible. \
>  "
> -HOMEPAGE =3D "http://www.ruby-lang.org/"
> +HOMEPAGE =3D "https://www.ruby-lang.org/"
>  SECTION =3D "devel/ruby"
>  LICENSE =3D "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | M=
IT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5b8c87559868796979806100db3f3=
805 \
> @@ -18,7 +18,7 @@ DEPENDS:append:class-target =3D " ruby-native"
>  DEPENDS:append:class-nativesdk =3D " ruby-native"
>
>  SHRT_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
> -SRC_URI =3D "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.=
tar.gz \
> +SRC_URI =3D "https://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}=
.tar.gz \
>             file://0001-extmk-fix-cross-compilation-of-external-gems.patc=
h \
>             file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \
>             file://run-ptest \
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb b/meta/recipe=
s-devtools/rust/libstd-rs_1.92.0.bb
> index 8af93bec57..555f129307 100644
> --- a/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb
> +++ b/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Rust standard libaries"
> -HOMEPAGE =3D "http://www.rust-lang.org"
> +HOMEPAGE =3D "https://www.rust-lang.org"
>  SECTION =3D "devel"
>  LICENSE =3D "(MIT | Apache-2.0) & Unicode-3.0"
>  LIC_FILES_CHKSUM =3D "file://../../COPYRIGHT;md5=3D11a3899825f4376896e43=
8c8c753f8dc"
> diff --git a/meta/recipes-devtools/rust/rust_1.92.0.bb b/meta/recipes-dev=
tools/rust/rust_1.92.0.bb
> index a25f65f674..681ebad660 100644
> --- a/meta/recipes-devtools/rust/rust_1.92.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.92.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Rust compiler and runtime libaries"
> -HOMEPAGE =3D "http://www.rust-lang.org"
> +HOMEPAGE =3D "https://www.rust-lang.org"
>  SECTION =3D "devel"
>  LICENSE =3D "(MIT | Apache-2.0) & Unicode-3.0"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D11a3899825f4376896e438c8c75=
3f8dc"
> diff --git a/meta/recipes-devtools/strace/strace_6.18.bb b/meta/recipes-d=
evtools/strace/strace_6.18.bb
> index a2eba0797f..07dc2ef147 100644
> --- a/meta/recipes-devtools/strace/strace_6.18.bb
> +++ b/meta/recipes-devtools/strace/strace_6.18.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "System call tracing tool"
> -HOMEPAGE =3D "http://strace.io"
> +HOMEPAGE =3D "https://strace.io"
>  DESCRIPTION =3D "strace is a diagnostic, debugging and instructional use=
rspace utility for Linux. It is used to monitor and tamper with interaction=
s between processes and the Linux kernel, which include system calls, signa=
l deliveries, and changes of process state."
>  SECTION =3D "console/utils"
>  LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
> diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta=
/recipes-devtools/subversion/subversion_1.14.5.bb
> index 56ef1019fc..84c1ae3756 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Subversion (svn) version control system client"
> -HOMEPAGE =3D "http://subversion.apache.org"
> +HOMEPAGE =3D "https://subversion.apache.org"
>  DESCRIPTION =3D "Subversion is an open source version control system."
>  SECTION =3D "console/network"
>  LICENSE =3D "Apache-2.0 & MIT"
> diff --git a/meta/recipes-devtools/swig/swig_4.4.1.bb b/meta/recipes-devt=
ools/swig/swig_4.4.1.bb
> index f71a92d931..267cea6321 100644
> --- a/meta/recipes-devtools/swig/swig_4.4.1.bb
> +++ b/meta/recipes-devtools/swig/swig_4.4.1.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "SWIG - Simplified Wrapper and Interface Gene=
rator"
>  DESCRIPTION =3D "SWIG is a compiler that makes it easy to integrate C an=
d C++ \
>  code with other languages including Perl, Tcl, Ruby, Python, Java, Guile=
, \
>  Mzscheme, Chicken, OCaml, Pike, and C#."
> -HOMEPAGE =3D "http://swig.sourceforge.net/"
> +HOMEPAGE =3D "https://swig.sourceforge.net/"
>  LICENSE =3D "BSD-3-Clause & GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De7807a6282784a7dde4c846626b08=
fc6 \
>                      file://LICENSE-GPL;md5=3Dd32239bcb673463ab874e80d47f=
ae504 \
> diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/=
recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> index 449a75ebf8..13e7c6790c 100644
> --- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> +++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Multi-purpose linux bootloader"
> -HOMEPAGE =3D "http://www.syslinux.org/"
> +HOMEPAGE =3D "https://www.syslinux.org/"
>  DESCRIPTION =3D "The Syslinux Project covers lightweight bootloaders for=
 MS-DOS FAT filesystems (SYSLINUX), network booting (PXELINUX), bootable "E=
l Torito" CD-ROMs (ISOLINUX), and Linux ext2/ext3/ext4 or btrfs filesystems=
 (EXTLINUX). The project also includes MEMDISK, a tool to boot legacy opera=
ting systems (such as DOS) from nontraditional media; it is usually used in=
 conjunction with PXELINUX and ISOLINUX."
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3 \
> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb b/meta/re=
cipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
> index 132b3d7dee..7507adb938 100644
> --- a/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Target Communication Framework for the Eclipse IDE"
> -HOMEPAGE =3D "http://wiki.eclipse.org/TCF"
> +HOMEPAGE =3D "https://wiki.eclipse.org/TCF"
>  DESCRIPTION =3D "TCF is a vendor-neutral, lightweight, extensible networ=
k protocol mainly for communicating with embedded systems (targets)."
>  BUGTRACKER =3D "https://bugs.eclipse.org/bugs/"
>
> diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.3.bb b/meta/recipes-devt=
ools/tcltk/tcl_9.0.3.bb
> index 21a6cbb23d..0c6055e562 100644
> --- a/meta/recipes-devtools/tcltk/tcl_9.0.3.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_9.0.3.bb
> @@ -1,9 +1,9 @@
>  SUMMARY =3D "Tool Command Language"
> -HOMEPAGE =3D "http://tcl.sourceforge.net"
> +HOMEPAGE =3D "https://tcl.sourceforge.net"
>  DESCRIPTION =3D "Tool Command Language, is an open-source multi-purpose =
C library which includes a powerful dynamic scripting language. Together th=
ey provide ideal cross-platform development environment for any programming=
 project."
>  SECTION =3D "devel/tcltk"
>
> -# http://www.tcl.tk/software/tcltk/license.html
> +# https://www.tcl.tk/software/tcltk/license.html
>  LICENSE =3D "TCL & BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://license.terms;md5=3D058f6229798281bbcac4239=
c788cfa38 \
>      file://compat/license.terms;md5=3D058f6229798281bbcac4239c788cfa38 \
> diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb b/meta/recipes-d=
evtools/tcltk8/tcl8_8.6.17.bb
> index b97b20abd5..43f75f3e22 100644
> --- a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
> +++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
> @@ -1,9 +1,9 @@
>  SUMMARY =3D "Tool Command Language"
> -HOMEPAGE =3D "http://tcl.sourceforge.net"
> +HOMEPAGE =3D "https://tcl.sourceforge.net"
>  DESCRIPTION =3D "Tool Command Language, is an open-source multi-purpose =
C library which includes a powerful dynamic scripting language. Together th=
ey provide ideal cross-platform development environment for any programming=
 project."
>  SECTION =3D "devel/tcltk"
>
> -# http://www.tcl.tk/software/tcltk/license.html
> +# https://www.tcl.tk/software/tcltk/license.html
>  LICENSE =3D "TCL & BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://license.terms;md5=3D058f6229798281bbcac4239=
c788cfa38 \
>      file://compat/license.terms;md5=3D058f6229798281bbcac4239c788cfa38 \
> diff --git a/meta/recipes-devtools/unifdef/unifdef_2.12.bb b/meta/recipes=
-devtools/unifdef/unifdef_2.12.bb
> index e3bd4eb0f9..c7c32db8f4 100644
> --- a/meta/recipes-devtools/unifdef/unifdef_2.12.bb
> +++ b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
> @@ -1,14 +1,14 @@
>  SUMMARY =3D "Selectively remove #ifdef statements from sources"
>  SECTION =3D "devel"
>  LICENSE =3D "BSD-2-Clause"
> -HOMEPAGE =3D "http://dotat.at/prog/unifdef/"
> +HOMEPAGE =3D "https://dotat.at/prog/unifdef/"
>  DESCRIPTION =3D "The unifdef utility selectively processes conditional C=
 preprocessor #if and #ifdef directives. It removes from a file both the di=
rectives and the additional text that they delimit, while otherwise leaving=
 the file alone."
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3498caf346f6b77934882101749ad=
a23 \
>                      file://unifdef.c;endline=3D32;md5=3D6f4ee8085d6e6ab0=
f7cb4390e1a9c497 \
>                      "
>
> -SRC_URI =3D "http://dotat.at/prog/${BPN}/${BP}.tar.xz \
> +SRC_URI =3D "https://dotat.at/prog/${BPN}/${BP}.tar.xz \
>             file://0001-Don-t-use-C23-constexpr-keyword.patch"
>  SRC_URI[sha256sum] =3D "43ce0f02ecdcdc723b2475575563ddb192e988c886d36826=
0bc0a63aee3ac400"
>
> diff --git a/meta/recipes-devtools/vala/vala_0.56.18.bb b/meta/recipes-de=
vtools/vala/vala_0.56.18.bb
> index 16e5d2b7c8..58d5046c1d 100644
> --- a/meta/recipes-devtools/vala/vala_0.56.18.bb
> +++ b/meta/recipes-devtools/vala/vala_0.56.18.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "C#-like programming language for easing GObject programming=
"
> -HOMEPAGE =3D "http://vala-project.org"
> +HOMEPAGE =3D "https://vala-project.org"
>  DESCRIPTION =3D "Vala is a C#-like language dedicated to ease GObject pr=
ogramming. \
>  Vala compiles to plain C and has no runtime environment nor penalities w=
hatsoever."
>  SECTION =3D "devel"
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb b/meta/rec=
ipes-devtools/valgrind/valgrind_3.26.0.bb
> index 6f7d67df0e..1ddb87c986 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Valgrind memory debugger and instrumentation framework"
> -HOMEPAGE =3D "http://valgrind.org/"
> +HOMEPAGE =3D "https://valgrind.org/"
>  DESCRIPTION =3D "Valgrind is an instrumentation framework for building d=
ynamic analysis tools. There are Valgrind tools that can automatically dete=
ct many memory management and threading bugs, and profile your programs in =
detail."
> -BUGTRACKER =3D "http://valgrind.org/support/bug_reports.html"
> +BUGTRACKER =3D "https://valgrind.org/support/bug_reports.html"
>  LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464 \
>                      file://include/pub_tool_basics.h;beginline=3D6;endli=
ne=3D29;md5=3D9ba449d120f6845e6a432073278d6e3a \
> diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb b/meta/rec=
ipes-extended/asciidoc/asciidoc_10.2.1.bb
> index 848c380363..6f17992e29 100644
> --- a/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
> +++ b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Tool for creating HTML, PDF, EPUB, man pages=
"
>  DESCRIPTION =3D "AsciiDoc is a text document format for writing short do=
cuments, \
>  articles, books and UNIX man pages."
>
> -HOMEPAGE =3D "http://asciidoc.org/"
> +HOMEPAGE =3D "https://asciidoc.org/"
>
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Daaee33adce0fc7cc40fee23f82f=
7f101 \
> diff --git a/meta/recipes-extended/at/at_3.2.5.bb b/meta/recipes-extended=
/at/at_3.2.5.bb
> index 112d1c4adc..d702feecb4 100644
> --- a/meta/recipes-extended/at/at_3.2.5.bb
> +++ b/meta/recipes-extended/at/at_3.2.5.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Delayed job execution and batch processing"
> -HOMEPAGE =3D "http://blog.calhariz.com/"
> +HOMEPAGE =3D "https://blog.calhariz.com/"
>  DESCRIPTION =3D "At allows for commands to be run at a particular time. =
 Batch will execute commands when \
>  the system load levels drop to a particular level."
>  SECTION =3D "base"
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/=
bash/bash.inc
> index 634209c911..4aed6acbe0 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "An sh-compatible command language interpreter"
> -HOMEPAGE =3D "http://tiswww.case.edu/php/chet/bash/bashtop.html"
> +HOMEPAGE =3D "https://tiswww.case.edu/php/chet/bash/bashtop.html"
>  DESCRIPTION =3D "Bash is the GNU Project's Bourne Again SHell, a complet=
e implementation of the IEEE POSIX and Open Group shell specification with =
interactive command line editing, job control on architectures that support=
 it, csh-like features such as history substitution and brace expansion, an=
d a slew of other features."
>  SECTION =3D "base/shell"
>
> diff --git a/meta/recipes-extended/bc/bc_1.08.2.bb b/meta/recipes-extende=
d/bc/bc_1.08.2.bb
> index cebfed9642..9adec12154 100644
> --- a/meta/recipes-extended/bc/bc_1.08.2.bb
> +++ b/meta/recipes-extended/bc/bc_1.08.2.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Arbitrary precision calculator language"
> -HOMEPAGE =3D "http://www.gnu.org/software/bc/bc.html"
> +HOMEPAGE =3D "https://www.gnu.org/software/bc/bc.html"
>  DESCRIPTION =3D "bc is an arbitrary precision numeric processing languag=
e. Syntax is similar to C, but differs in many substantial areas. It suppor=
ts interactive execution of statements."
>
>  LICENSE =3D "GPL-3.0-or-later"
> diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-exten=
ded/cpio/cpio_2.15.bb
> index fa011251e2..24c46d9058 100644
> --- a/meta/recipes-extended/cpio/cpio_2.15.bb
> +++ b/meta/recipes-extended/cpio/cpio_2.15.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "GNU cpio is a program to manage archives of files"
>  DESCRIPTION =3D "GNU cpio is a tool for creating and extracting archives=
, or copying files from one place to \
>  another. It handles a number of cpio formats as well as reading and writ=
ing tar files."
> -HOMEPAGE =3D "http://www.gnu.org/software/cpio/"
> +HOMEPAGE =3D "https://www.gnu.org/software/cpio/"
>  SECTION =3D "base"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be8967=
949"
> diff --git a/meta/recipes-extended/ed/ed_1.22.4.bb b/meta/recipes-extende=
d/ed/ed_1.22.4.bb
> index 36b631b762..5a5d396b86 100644
> --- a/meta/recipes-extended/ed/ed_1.22.4.bb
> +++ b/meta/recipes-extended/ed/ed_1.22.4.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Line-oriented text editor"
> -HOMEPAGE =3D "http://www.gnu.org/software/ed/"
> +HOMEPAGE =3D "https://www.gnu.org/software/ed/"
>  DESCRIPTION =3D "GNU ed is a line-oriented text editor. It is used to cr=
eate, display, modify and otherwise manipulate text files, both interactive=
ly and via shell scripts. A restricted version of ed, red, can only edit fi=
les in the current directory and cannot execute shell commands."
>
>  LICENSE =3D "GPL-2.0-only"
> diff --git a/meta/recipes-extended/ethtool/ethtool_6.15.bb b/meta/recipes=
-extended/ethtool/ethtool_6.15.bb
> index eb6b272d4a..bc974be82b 100644
> --- a/meta/recipes-extended/ethtool/ethtool_6.15.bb
> +++ b/meta/recipes-extended/ethtool/ethtool_6.15.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Display or change ethernet card settings"
>  DESCRIPTION =3D "A small utility for examining and tuning the settings o=
f your ethernet-based network interfaces."
> -HOMEPAGE =3D "http://www.kernel.org/pub/software/network/ethtool/"
> +HOMEPAGE =3D "https://www.kernel.org/pub/software/network/ethtool/"
>  SECTION =3D "console/network"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
> diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes=
-extended/findutils/findutils.inc
> index ddcc05750b..4e382208db 100644
> --- a/meta/recipes-extended/findutils/findutils.inc
> +++ b/meta/recipes-extended/findutils/findutils.inc
> @@ -2,8 +2,8 @@ SUMMARY =3D "find, locate, and xargs binaries"
>  DESCRIPTION =3D "The GNU Find Utilities are the basic directory searchin=
g utilities of the GNU operating system. \
>  These programs are typically used in conjunction with other programs to =
provide modular and powerful directory \
>  search and file locating capabilities to other commands."
> -HOMEPAGE =3D "http://www.gnu.org/software/findutils/"
> -BUGTRACKER =3D "http://savannah.gnu.org/bugs/?group=3Dfindutils"
> +HOMEPAGE =3D "https://www.gnu.org/software/findutils/"
> +BUGTRACKER =3D "https://savannah.gnu.org/bugs/?group=3Dfindutils"
>  SECTION =3D "console/utils"
>
>  SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.xz \
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb b/m=
eta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
> index 4cea898432..bc5f779be1 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
> @@ -7,7 +7,7 @@ Furthermore, it can render PostScript and PDF files as gr=
aphics to be printed \
>  on non-PostScript printers. Supported printers include common \
>  dot-matrix, inkjet and laser models. \
>  "
> -HOMEPAGE =3D "http://www.ghostscript.com"
> +HOMEPAGE =3D "https://www.ghostscript.com"
>  SECTION =3D "console/utils"
>
>  LICENSE =3D "AGPL-3.0-or-later"
> diff --git a/meta/recipes-extended/gperf/gperf_3.3.bb b/meta/recipes-exte=
nded/gperf/gperf_3.3.bb
> index 7af2130114..3a5c39c217 100644
> --- a/meta/recipes-extended/gperf/gperf_3.3.bb
> +++ b/meta/recipes-extended/gperf/gperf_3.3.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION =3D "GNU gperf is a perfect hash function generator"
> -HOMEPAGE =3D "http://www.gnu.org/software/gperf"
> +HOMEPAGE =3D "https://www.gnu.org/software/gperf"
>  SUMMARY  =3D "Generate a perfect hash function from a set of keywords"
>  LICENSE  =3D "GPL-3.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
> diff --git a/meta/recipes-extended/grep/grep_3.12.bb b/meta/recipes-exten=
ded/grep/grep_3.12.bb
> index 2678d2d41e..6e5f57a468 100644
> --- a/meta/recipes-extended/grep/grep_3.12.bb
> +++ b/meta/recipes-extended/grep/grep_3.12.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "GNU grep utility"
> -HOMEPAGE =3D "http://savannah.gnu.org/projects/grep/"
> +HOMEPAGE =3D "https://savannah.gnu.org/projects/grep/"
>  DESCRIPTION =3D "Grep searches one or more input files for lines contain=
ing a match to a specified pattern. By default, grep prints the matching li=
nes."
> -BUGTRACKER =3D "http://savannah.gnu.org/bugs/?group=3Dgrep"
> +BUGTRACKER =3D "https://savannah.gnu.org/bugs/?group=3Dgrep"
>  SECTION =3D "console/utils"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
> diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-e=
xtended/groff/groff_1.23.0.bb
> index 0c2ef61758..e1bf107b1c 100644
> --- a/meta/recipes-extended/groff/groff_1.23.0.bb
> +++ b/meta/recipes-extended/groff/groff_1.23.0.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "GNU Troff software"
>  DESCRIPTION =3D "The groff (GNU troff) software is a typesetting package=
 which reads plain text mixed with \
>  formatting commands and produces formatted output."
>  SECTION =3D "base"
> -HOMEPAGE =3D "http://www.gnu.org/software/groff/"
> +HOMEPAGE =3D "https://www.gnu.org/software/groff/"
>  LICENSE =3D "GPL-3.0-only"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/=
gzip/gzip.inc
> index 12232dd4da..bf563dcd48 100644
> --- a/meta/recipes-extended/gzip/gzip.inc
> +++ b/meta/recipes-extended/gzip/gzip.inc
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Standard GNU compressor"
>  DESCRIPTION =3D "GNU Gzip is a popular data compression program original=
ly written by Jean-loup Gailly for the GNU \
>  project. Mark Adler wrote the decompression part"
> -HOMEPAGE =3D "http://www.gnu.org/software/gzip/"
> +HOMEPAGE =3D "https://www.gnu.org/software/gzip/"
>  SECTION =3D "console/utils"
>
>  inherit autotools texinfo
> diff --git a/meta/recipes-extended/hdparm/hdparm_9.65.bb b/meta/recipes-e=
xtended/hdparm/hdparm_9.65.bb
> index e541d58fa5..2133e4ae71 100644
> --- a/meta/recipes-extended/hdparm/hdparm_9.65.bb
> +++ b/meta/recipes-extended/hdparm/hdparm_9.65.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Utility for viewing/manipulating IDE disk drive/driver para=
meters"
> -HOMEPAGE =3D "http://sourceforge.net/projects/hdparm/"
> +HOMEPAGE =3D "https://sourceforge.net/projects/hdparm/"
>  DESCRIPTION =3D "hdparm is a Linux shell utility for viewing \
>  and manipulating various IDE drive and driver parameters."
>  SECTION =3D "console/utils"
> diff --git a/meta/recipes-extended/iptables/iptables_1.8.11.bb b/meta/rec=
ipes-extended/iptables/iptables_1.8.11.bb
> index 686dc5afe5..7a1bca64d3 100644
> --- a/meta/recipes-extended/iptables/iptables_1.8.11.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.8.11.bb
> @@ -1,14 +1,14 @@
>  SUMMARY =3D "Tools for managing kernel packet filtering capabilities"
>  DESCRIPTION =3D "iptables is the userspace command line program used to =
configure and control network packet \
>  filtering code in Linux."
> -HOMEPAGE =3D "http://www.netfilter.org/"
> -BUGTRACKER =3D "http://bugzilla.netfilter.org/"
> +HOMEPAGE =3D "https://www.netfilter.org/"
> +BUGTRACKER =3D "https://bugzilla.netfilter.org/"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
>                      file://iptables/iptables.c;beginline=3D13;endline=3D=
25;md5=3Dc5cffd09974558cf27d0f763df2a12dc \
>  "
>
> -SRC_URI =3D "http://netfilter.org/projects/iptables/files/iptables-${PV}=
.tar.xz \
> +SRC_URI =3D "https://netfilter.org/projects/iptables/files/iptables-${PV=
}.tar.xz \
>             file://iptables.service \
>             file://iptables.rules \
>             file://ip6tables.service \
> diff --git a/meta/recipes-extended/less/less_685.bb b/meta/recipes-extend=
ed/less/less_685.bb
> index 904980a72f..4945c4ae1f 100644
> --- a/meta/recipes-extended/less/less_685.bb
> +++ b/meta/recipes-extended/less/less_685.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Text file viewer similar to more"
>  DESCRIPTION =3D "Less is a program similar to more, i.e. a terminal \
>  based program for viewing text files and the output from other \
>  programs. Less offers many features beyond those that more does."
> -HOMEPAGE =3D "http://www.greenwoodsoftware.com/"
> +HOMEPAGE =3D "https://www.greenwoodsoftware.com/"
>  SECTION =3D "console/utils"
>
>  # (GPL-2.0-or-later (<< 418), GPL-3.0-or-later (>=3D 418)) | less
> @@ -25,13 +25,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e342=
37af26da5dc08a4e440464 \
>                      "
>  DEPENDS =3D "ncurses"
>
> -SRC_URI =3D "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz=
 \
> +SRC_URI =3D "https://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.g=
z \
>             file://run-ptest \
>             "
>
>  SRC_URI[sha256sum] =3D "2701041e767e697ee420ce0825641cedc8f20b51576abe99=
d92c1666d332e9dc"
>
> -UPSTREAM_CHECK_URI =3D "http://www.greenwoodsoftware.com/less/download.h=
tml"
> +UPSTREAM_CHECK_URI =3D "https://www.greenwoodsoftware.com/less/download.=
html"
>
>  inherit autotools ptest update-alternatives
>
> diff --git a/meta/recipes-extended/libaio/libaio_0.3.113.bb b/meta/recipe=
s-extended/libaio/libaio_0.3.113.bb
> index 2392fd5db2..f367aa5ce6 100644
> --- a/meta/recipes-extended/libaio/libaio_0.3.113.bb
> +++ b/meta/recipes-extended/libaio/libaio_0.3.113.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Asynchronous I/O library"
>  DESCRIPTION =3D "Asynchronous input/output library that uses the kernels=
 native interface"
> -HOMEPAGE =3D "http://lse.sourceforge.net/io/aio.html"
> +HOMEPAGE =3D "https://lse.sourceforge.net/io/aio.html"
>
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b=
499"
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb b/meta/=
recipes-extended/libarchive/libarchive_3.8.5.bb
> index fcfaf5d231..27fd7c5865 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Support for reading various archive formats"
>  DESCRIPTION =3D "C library and command-line tools for reading and writin=
g tar, cpio, zip, ISO, and other archive formats"
> -HOMEPAGE =3D "http://www.libarchive.org/"
> +HOMEPAGE =3D "https://www.libarchive.org/"
>  SECTION =3D "devel"
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7ce08437ff7f5e24d72e666313ae4=
084"
> diff --git a/meta/recipes-extended/libidn/libidn2_2.3.8.bb b/meta/recipes=
-extended/libidn/libidn2_2.3.8.bb
> index a53ac47d66..3e6322b3f0 100644
> --- a/meta/recipes-extended/libidn/libidn2_2.3.8.bb
> +++ b/meta/recipes-extended/libidn/libidn2_2.3.8.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Internationalized Domain Name support library"
>  DESCRIPTION =3D "Implementation of the Stringprep, Punycode and IDNA spe=
cifications defined by the IETF Internationalized Domain Names (IDN) workin=
g group."
> -HOMEPAGE =3D "http://www.gnu.org/software/libidn/"
> +HOMEPAGE =3D "https://www.gnu.org/software/libidn/"
>  SECTION =3D "libs"
>  LICENSE =3D "(GPL-2.0-or-later | LGPL-3.0-only) & GPL-3.0-or-later & Uni=
code-DFS-2016"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464 \
> diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb b/met=
a/recipes-extended/libpipeline/libpipeline_1.5.8.bb
> index 1f6de1d925..7ee5325394 100644
> --- a/meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb
> +++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "pipeline manipulation library"
>  DESCRIPTION =3D "This is a C library for setting up and running pipeline=
s of processes, \
>  without needing to involve shell command-line parsing which is often \
>  error-prone and insecure."
> -HOMEPAGE =3D "http://libpipeline.nongnu.org/"
> +HOMEPAGE =3D "https://libpipeline.nongnu.org/"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
>
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb b/meta/reci=
pes-extended/libtirpc/libtirpc_1.3.7.bb
> index edc75a8366..c823822bae 100644
> --- a/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
> @@ -1,8 +1,8 @@
>  SUMMARY =3D "Transport-Independent RPC library"
>  DESCRIPTION =3D "Libtirpc is a port of Suns Transport-Independent RPC li=
brary to Linux"
>  SECTION =3D "libs/network"
> -HOMEPAGE =3D "http://sourceforge.net/projects/libtirpc/"
> -BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D183075&atid=
=3D903784"
> +HOMEPAGE =3D "https://sourceforge.net/projects/libtirpc/"
> +BUGTRACKER =3D "https://sourceforge.net/tracker/?group_id=3D183075&atid=
=3D903784"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df835cce8852481e4b2bbbdd23b5e4=
7f3 \
>                      file://src/netname.c;beginline=3D1;endline=3D27;md5=
=3Df8a8cd2cb25ac5aa16767364fb0e3c24"
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb b/meta/rec=
ipes-extended/lighttpd/lighttpd_1.4.82.bb
> index 8221d30283..636b6dff07 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Lightweight high-performance web server"
> -HOMEPAGE =3D "http://www.lighttpd.net/"
> +HOMEPAGE =3D "https://www.lighttpd.net/"
>  DESCRIPTION =3D "Lightweight high-performance web server is designed and=
 optimized for high performance environments. With a small memory footprint=
 compared to other web-servers, effective management of the cpu-load, and a=
dvanced feature set (FastCGI, SCGI, Auth, Output-Compression, URL-Rewriting=
 and many more)"
> -BUGTRACKER =3D "http://redmine.lighttpd.net/projects/lighttpd/issues"
> +BUGTRACKER =3D "https://redmine.lighttpd.net/projects/lighttpd/issues"
>
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4dac5c6ab169aa212feb5028853a=
579"
> @@ -10,7 +10,7 @@ SECTION =3D "net"
>  RDEPENDS:${PN} =3D "lighttpd-module-dirlisting"
>  RRECOMMENDS:${PN} =3D "lighttpd-module-accesslog"
>
> -SRC_URI =3D "http://download.lighttpd.net/lighttpd/releases-1.4.x/lightt=
pd-${PV}.tar.xz \
> +SRC_URI =3D "https://download.lighttpd.net/lighttpd/releases-1.4.x/light=
tpd-${PV}.tar.xz \
>             file://index.html.lighttpd \
>             file://lighttpd.conf \
>             file://lighttpd \
> diff --git a/meta/recipes-extended/lsof/lsof_4.99.5.bb b/meta/recipes-ext=
ended/lsof/lsof_4.99.5.bb
> index 292db224af..4d856c5d15 100644
> --- a/meta/recipes-extended/lsof/lsof_4.99.5.bb
> +++ b/meta/recipes-extended/lsof/lsof_4.99.5.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "LiSt Open Files tool"
>  DESCRIPTION =3D "Lsof is a Unix-specific diagnostic tool. \
>  Its name stands for LiSt Open Files, and it does just that."
> -HOMEPAGE =3D "http://people.freebsd.org/~abe/"
> +HOMEPAGE =3D "https://people.freebsd.org/~abe/"
>  SECTION =3D "devel"
>  LICENSE =3D "Spencer-94"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da48ac97a8550eff12395a2c0d6151=
510"
> diff --git a/meta/recipes-extended/ltp/ltp_20250930.bb b/meta/recipes-ext=
ended/ltp/ltp_20250930.bb
> index 30897de7ca..215f29471e 100644
> --- a/meta/recipes-extended/ltp/ltp_20250930.bb
> +++ b/meta/recipes-extended/ltp/ltp_20250930.bb
> @@ -71,8 +71,8 @@ do_install(){
>      # as it lacks dependency on some perl moudle such as LWP::Simple
>      # And this script previously works as a tool for analyzing failures =
from LTP
>      # runs on the OSDL's Scaleable Test Platform (STP) and it mainly acc=
esses
> -    # http://khack.osdl.org to retrieve ltp test results run on
> -    # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unac=
cessible
> +    # https://khack.osdl.org to retrieve ltp test results run on
> +    # OSDL's Scaleable Test Platform, but now https://khack.osdl.org una=
ccessible
>      rm -rf ${D}${prefix}/bin/STPfailure_report.pl
>
>      # The controllers memcg_stree test seems to cause us hangs and takes=
 900s
> diff --git a/meta/recipes-extended/lzip/lzip_1.25.bb b/meta/recipes-exten=
ded/lzip/lzip_1.25.bb
> index 590e35cb75..b413286074 100644
> --- a/meta/recipes-extended/lzip/lzip_1.25.bb
> +++ b/meta/recipes-extended/lzip/lzip_1.25.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Lossless data compressor based on the LZMA algorithm"
> -HOMEPAGE =3D "http://lzip.nongnu.org/lzip.html"
> +HOMEPAGE =3D "https://lzip.nongnu.org/lzip.html"
>  DESCRIPTION =3D "Lzip is a lossless data compressor with a user interfac=
e similar to the one of gzip or bzip2. Lzip uses a simplified form of the L=
empel-Ziv-Markov chain-Algorithm (LZMA) stream format, chosen to maximize s=
afety and interoperability."
>  SECTION =3D "console/utils"
>  LICENSE =3D "GPL-2.0-or-later"
> diff --git a/meta/recipes-extended/man-db/man-db_2.13.1.bb b/meta/recipes=
-extended/man-db/man-db_2.13.1.bb
> index f044a47f7d..39094ebf37 100644
> --- a/meta/recipes-extended/man-db/man-db_2.13.1.bb
> +++ b/meta/recipes-extended/man-db/man-db_2.13.1.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "An implementation of the standard Unix documentation system=
 accessed using the man command"
> -HOMEPAGE =3D "http://man-db.nongnu.org/"
> +HOMEPAGE =3D "https://man-db.nongnu.org/"
>  DESCRIPTION =3D "man-db is an implementation of the standard Unix docume=
ntation system accessed using the man command. It uses a Berkeley DB databa=
se in place of the traditional flat-text whatis databases."
>  LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-3.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464 \
> diff --git a/meta/recipes-extended/man-pages/man-pages_6.16.bb b/meta/rec=
ipes-extended/man-pages/man-pages_6.16.bb
> index 5bd79c0425..8d49dd7b31 100644
> --- a/meta/recipes-extended/man-pages/man-pages_6.16.bb
> +++ b/meta/recipes-extended/man-pages/man-pages_6.16.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Linux man-pages"
>  DESCRIPTION =3D "The Linux man-pages project documents the Linux kernel =
and C library interfaces that are employed by user programs"
>  SECTION =3D "console/utils"
> -HOMEPAGE =3D "http://www.kernel.org/pub/linux/docs/man-pages"
> +HOMEPAGE =3D "https://www.kernel.org/pub/linux/docs/man-pages"
>  LICENSE =3D "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-=
Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT"
>
>  LIC_FILES_CHKSUM =3D "file://README;md5=3Dc2d6fa1a74bdd79c25de6f4db73322=
94 \
> diff --git a/meta/recipes-extended/mc/mc_4.8.33.bb b/meta/recipes-extende=
d/mc/mc_4.8.33.bb
> index fd18edf7be..50af5c67ce 100644
> --- a/meta/recipes-extended/mc/mc_4.8.33.bb
> +++ b/meta/recipes-extended/mc/mc_4.8.33.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Midnight Commander is an ncurses based file manager"
> -HOMEPAGE =3D "http://www.midnight-commander.org/"
> +HOMEPAGE =3D "https://www.midnight-commander.org/"
>  DESCRIPTION =3D "GNU Midnight Commander is a visual file manager, licens=
ed under GNU General Public License and therefore qualifies as Free Softwar=
e. It's a feature rich full-screen text mode application that allows you to=
 copy, move and delete files and whole directory trees, search for files an=
d run commands in the subshell. Internal viewer and editor are included."
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D270bbafe360e73f9840bd7981621f=
9c2"
> @@ -8,7 +8,7 @@ DEPENDS =3D "ncurses glib-2.0 util-linux file-replacement=
-native"
>  RDEPENDS:${PN} =3D "ncurses-terminfo-base"
>  RRECOMMENDS:${PN} =3D "ncurses-terminfo"
>
> -SRC_URI =3D "http://ftp.midnight-commander.org/${BPN}-${PV}.tar.bz2 \
> +SRC_URI =3D "https://ftp.midnight-commander.org/${BPN}-${PV}.tar.bz2 \
>             file://nomandate.patch \
>             "
>  SRC_URI[sha256sum] =3D "a3ceb0af84226fedfe5f339464ff2849c3f6bf0321b72027=
c47b2c10e66a6dba"
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.4.bb b/meta/recipes-exte=
nded/mdadm/mdadm_4.4.bb
> index 26a60e4c1a..b2be396c6b 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.4.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.4.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Tool for managing software RAID under Linux"
> -HOMEPAGE =3D "http://www.kernel.org/pub/linux/utils/raid/mdadm/"
> +HOMEPAGE =3D "https://www.kernel.org/pub/linux/utils/raid/mdadm/"
>  DESCRIPTION =3D "mdadm is a Linux utility used to manage and monitor sof=
tware RAID devices."
>
>  # Some files are GPL-2.0-only while others are GPL-2.0-or-later.
> diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recip=
es-extended/mingetty/mingetty_1.08.bb
> index 892233054b..f134d21bee 100644
> --- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
> +++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Compact getty terminal handler for virtual consoles only"
>  SECTION =3D "console/utils"
> -HOMEPAGE =3D "http://sourceforge.net/projects/mingetty/"
> +HOMEPAGE =3D "https://sourceforge.net/projects/mingetty/"
>  DESCRIPTION =3D "This is a small Linux console getty that is started on =
the Linux text console, asks for a login name and then tranfers over to log=
in directory. Is extended to allow automatic login and starting any app."
>  LICENSE =3D "GPL-2.0-only"
>
> diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/rec=
ipes-extended/net-tools/net-tools_2.10.bb
> index 6c8297ba39..a6369ad04e 100644
> --- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
> +++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Basic networking tools"
>  DESCRIPTION =3D "A collection of programs that form the base set of the =
NET-3 networking distribution for the Linux operating system"
> -HOMEPAGE =3D "http://net-tools.berlios.de/"
> -BUGTRACKER =3D "http://bugs.debian.org/net-tools"
> +HOMEPAGE =3D "https://net-tools.berlios.de/"
> +BUGTRACKER =3D "https://bugs.debian.org/net-tools"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
>                      file://ifconfig.c;beginline=3D11;endline=3D15;md5=3D=
d1ca372080ad5401e23ca0afc35cf9ba"
> diff --git a/meta/recipes-extended/parted/parted_3.6.bb b/meta/recipes-ex=
tended/parted/parted_3.6.bb
> index 8f703d162f..ac9cc89464 100644
> --- a/meta/recipes-extended/parted/parted_3.6.bb
> +++ b/meta/recipes-extended/parted/parted_3.6.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Disk partition editing/resizing utility"
> -HOMEPAGE =3D "http://www.gnu.org/software/parted/parted.html"
> +HOMEPAGE =3D "https://www.gnu.org/software/parted/parted.html"
>  DESCRIPTION =3D "GNU Parted manipulates partition tables. This is useful=
 for creating space for new operating systems, reorganizing disk usage, cop=
ying data on hard disks and disk imaging."
>  LICENSE =3D "GPL-3.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2f31b266d3440dd7ee50f92cf67d8=
e6c"
> diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12=
.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
> index 9653cb427b..6a495be58e 100644
> --- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
> +++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Perl module for supporting simple generic namespaces"
> -HOMEPAGE =3D "http://veillard.com/XML/"
> +HOMEPAGE =3D "https://veillard.com/XML/"
>  DESCRIPTION =3D "XML::NamespaceSupport offers a simple way to process na=
mespace-based XML names. \
>                  It also helps maintain a prefix-to-namespace URI map, an=
d provides a number of \
>                  basic checks. "
> diff --git a/meta/recipes-extended/pigz/pigz_2.8.bb b/meta/recipes-extend=
ed/pigz/pigz_2.8.bb
> index fcf0c93e41..bac89d2b5d 100644
> --- a/meta/recipes-extended/pigz/pigz_2.8.bb
> +++ b/meta/recipes-extended/pigz/pigz_2.8.bb
> @@ -3,17 +3,17 @@ DESCRIPTION =3D "pigz, which stands for parallel implem=
entation of gzip, is a \
>  fully functional replacement for gzip that exploits multiple processors =
and \
>  multiple cores to the hilt when compressing data. pigz was written by Ma=
rk \
>  Adler, and uses the zlib and pthread libraries."
> -HOMEPAGE =3D "http://zlib.net/pigz/"
> +HOMEPAGE =3D "https://zlib.net/pigz/"
>  SECTION =3D "console/utils"
>  LICENSE =3D "Zlib & Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://pigz.c;md5=3D9ae6dee8ceba9610596ed0ada493d1=
42;beginline=3D7;endline=3D21"
>
> -SRC_URI =3D "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
> +SRC_URI =3D "https://zlib.net/${BPN}/fossils/${BP}.tar.gz"
>  SRC_URI[sha256sum] =3D "eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de3=
1df416f0d5170fd0"
>  PROVIDES:class-native +=3D "gzip-native"
>
>  # Point this at the homepage in case /fossils/ isn't updated
> -UPSTREAM_CHECK_URI =3D "http://zlib.net/${BPN}/"
> +UPSTREAM_CHECK_URI =3D "https://zlib.net/${BPN}/"
>  UPSTREAM_CHECK_REGEX =3D "pigz-(?P<pver>.*)\.tar"
>
>  DEPENDS =3D "zlib"
> diff --git a/meta/recipes-extended/psmisc/psmisc_23.7.bb b/meta/recipes-e=
xtended/psmisc/psmisc_23.7.bb
> index 44f8530977..9041abd6c9 100644
> --- a/meta/recipes-extended/psmisc/psmisc_23.7.bb
> +++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Utilities for managing processes on your system"
> -HOMEPAGE =3D "http://psmisc.sf.net/"
> +HOMEPAGE =3D "https://psmisc.sf.net/"
>  DESCRIPTION =3D "The psmisc package contains utilities for managing proc=
esses on your \
>  system: pstree, killall and fuser.  The pstree command displays a tree \
>  structure of all of the running processes on your system.  The killall \
> diff --git a/meta/recipes-extended/quota/quota_4.11.bb b/meta/recipes-ext=
ended/quota/quota_4.11.bb
> index b386071961..c37b78c59b 100644
> --- a/meta/recipes-extended/quota/quota_4.11.bb
> +++ b/meta/recipes-extended/quota/quota_4.11.bb
> @@ -1,8 +1,8 @@
>  SUMMARY =3D "Tools for monitoring & limiting user disk usage per filesys=
tem"
>  SECTION =3D "base"
> -HOMEPAGE =3D "http://sourceforge.net/projects/linuxquota/"
> +HOMEPAGE =3D "https://sourceforge.net/projects/linuxquota/"
>  DESCRIPTION =3D "Tools and patches for the Linux Diskquota system as par=
t of the Linux kernel"
> -BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D18136&atid=3D=
118136"
> +BUGTRACKER =3D "https://sourceforge.net/tracker/?group_id=3D18136&atid=
=3D118136"
>  LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://rquota_server.c;beginline=3D1;endline=3D20;=
md5=3Dfe7e0d7e11c6f820f8fa62a5af71230f \
>                      file://svc_socket.c;beginline=3D1;endline=3D17;md5=
=3D24d5a8792da45910786eeac750be8ceb"
> @@ -12,7 +12,7 @@ SRC_URI[sha256sum] =3D "0a51b8f920254d8e83c34a4c3082b7d=
241f5d6fd65188afadf29859d52
>
>  CVE_PRODUCT =3D "linux_diskquota"
>
> -UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/linuxquota/files=
/quota-tools/"
> +UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/linuxquota/file=
s/quota-tools/"
>  UPSTREAM_CHECK_REGEX =3D "/quota-tools/(?P<pver>(\d+[\.\-_]*)+)/"
>
>  DEPENDS =3D "gettext-native e2fsprogs libnl dbus"
> diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb b/meta/recipe=
s-extended/rpcbind/rpcbind_1.2.8.bb
> index bcdadf4f10..a10ab927cd 100644
> --- a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
> +++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
> @@ -2,8 +2,8 @@ SUMMARY =3D "Universal Addresses to RPC Program Number Ma=
pper"
>  DESCRIPTION =3D "The rpcbind utility is a server that converts RPC \
>                 program numbers into universal addresses."
>  SECTION =3D "console/network"
> -HOMEPAGE =3D "http://sourceforge.net/projects/rpcbind/"
> -BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D201237&atid=
=3D976751"
> +HOMEPAGE =3D "https://sourceforge.net/projects/rpcbind/"
> +BUGTRACKER =3D "https://sourceforge.net/tracker/?group_id=3D201237&atid=
=3D976751"
>  DEPENDS =3D "libtirpc quota"
>
>  LICENSE =3D "BSD-3-Clause"
> diff --git a/meta/recipes-extended/screen/screen_5.0.1.bb b/meta/recipes-=
extended/screen/screen_5.0.1.bb
> index 69f4098519..19b87005a0 100644
> --- a/meta/recipes-extended/screen/screen_5.0.1.bb
> +++ b/meta/recipes-extended/screen/screen_5.0.1.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Multiplexing terminal manager"
>  DESCRIPTION =3D "Screen is a full-screen window manager \
>  that multiplexes a physical terminal between several \
>  processes, typically interactive shells."
> -HOMEPAGE =3D "http://www.gnu.org/software/screen/"
> +HOMEPAGE =3D "https://www.gnu.org/software/screen/"
>  BUGTRACKER =3D "https://savannah.gnu.org/bugs/?func=3Dadditem&group=3Dsc=
reen"
>
>  SECTION =3D "console/utils"
> diff --git a/meta/recipes-extended/sed/sed_4.9.bb b/meta/recipes-extended=
/sed/sed_4.9.bb
> index b30ddc73ca..d862720504 100644
> --- a/meta/recipes-extended/sed/sed_4.9.bb
> +++ b/meta/recipes-extended/sed/sed_4.9.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Stream EDitor (text filtering utility)"
> -HOMEPAGE =3D "http://www.gnu.org/software/sed/"
> +HOMEPAGE =3D "https://www.gnu.org/software/sed/"
>  DESCRIPTION =3D "sed (stream editor) is a non-interactive command-line t=
ext editor."
>  LICENSE =3D "GPL-3.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464 \
> diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/re=
cipes-extended/shadow/shadow-sysroot_4.6.bb
> index d66ef1e6a4..ba0f71feeb 100644
> --- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
> +++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Shadow utils requirements for useradd.bbclass"
> -HOMEPAGE =3D "http://github.com/shadow-maint/shadow"
> -BUGTRACKER =3D "http://github.com/shadow-maint/shadow/issues"
> +HOMEPAGE =3D "https://github.com/shadow-maint/shadow"
> +BUGTRACKER =3D "https://github.com/shadow-maint/shadow/issues"
>  SECTION =3D "base utils"
>  LICENSE =3D "BSD-3-Clause | Artistic-1.0"
>  LIC_FILES_CHKSUM =3D "file://login.defs_shadow-sysroot;endline=3D1;md5=
=3Dceddfb61608e4db87012499555184aed"
> diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb b/meta/recipes=
-extended/shadow/shadow_4.18.0.bb
> index d9a49d8ccf..abb98fecd4 100644
> --- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
> +++ b/meta/recipes-extended/shadow/shadow_4.18.0.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Tools to change and administer password and group data"
> -HOMEPAGE =3D "http://github.com/shadow-maint/shadow"
> +HOMEPAGE =3D "https://github.com/shadow-maint/shadow"
>  DESCRIPTION =3D "${SUMMARY}"
> -BUGTRACKER =3D "http://github.com/shadow-maint/shadow/issues"
> +BUGTRACKER =3D "https://github.com/shadow-maint/shadow/issues"
>  SECTION =3D "base/utils"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc9a450b7be84eac23e6353efecb60=
b5b \
> diff --git a/meta/recipes-extended/slang/slang_2.3.3.bb b/meta/recipes-ex=
tended/slang/slang_2.3.3.bb
> index 05b8aff0f2..f5b59d9227 100644
> --- a/meta/recipes-extended/slang/slang_2.3.3.bb
> +++ b/meta/recipes-extended/slang/slang_2.3.3.bb
> @@ -7,14 +7,14 @@ The S-Lang library, provided in this package, provides =
the S-Lang \
>  extension language.  S-Lang's syntax resembles C, which makes it easy \
>  to recode S-Lang procedures in C if you need to."
>
> -HOMEPAGE =3D "http://www.jedsoft.org/slang/"
> +HOMEPAGE =3D "https://www.jedsoft.org/slang/"
>  SECTION =3D "libs"
>  DEPENDS =3D "ncurses virtual/libiconv"
>
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da52a18a472d4f7e45479b06563717=
c02"
>
> -SRC_URI =3D "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
> +SRC_URI =3D "https://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
>             file://no-x.patch \
>             file://dont-link-to-host.patch \
>             file://test-add-output-in-the-format-result-testname.patch \
> @@ -25,8 +25,8 @@ SRC_URI =3D "http://www.jedsoft.org/releases/${BPN}/${B=
P}.tar.bz2 \
>
>  SRC_URI[sha256sum] =3D "f9145054ae131973c61208ea82486d5dd10e3c5cdad23b7c=
4a0617743c8f5a18"
>
> -UPSTREAM_CHECK_URI =3D "http://www.jedsoft.org/releases/slang/"
> -PREMIRRORS:append =3D " http://www.jedsoft.org/releases/slang/.* http://=
www.jedsoft.org/releases/slang/old/"
> +UPSTREAM_CHECK_URI =3D "https://www.jedsoft.org/releases/slang/"
> +PREMIRRORS:append =3D " https://www.jedsoft.org/releases/slang/.* https:=
//www.jedsoft.org/releases/slang/old/"
>
>  inherit autotools-brokensep ptest
>  CLEANBROKEN =3D "1"
> diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/=
sudo/sudo.inc
> index a23de1fcf7..9ea3e0761d 100644
> --- a/meta/recipes-extended/sudo/sudo.inc
> +++ b/meta/recipes-extended/sudo/sudo.inc
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Provide limited super user privileges to specific users"
>  DESCRIPTION =3D "Sudo (superuser do) allows a system administrator to gi=
ve certain users (or groups of users) the ability to run some (or all) comm=
ands as root while logging all commands and arguments."
> -HOMEPAGE =3D "http://www.sudo.ws"
> -BUGTRACKER =3D "http://www.sudo.ws/bugs/"
> +HOMEPAGE =3D "https://www.sudo.ws"
> +BUGTRACKER =3D "https://www.sudo.ws/bugs/"
>  SECTION =3D "admin"
>  LICENSE =3D "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D2841c822e587db145364ca95e9=
be2ffa \
> diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb b/meta/reci=
pes-extended/sysklogd/sysklogd_2.7.2.bb
> index c436153d1b..28596ec5e5 100644
> --- a/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
> +++ b/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "System Log Daemons"
>  DESCRIPTION =3D "The sysklogd package implements system log daemons: sys=
logd"
> -HOMEPAGE =3D "http://www.infodrom.org/projects/sysklogd/"
> +HOMEPAGE =3D "https://www.infodrom.org/projects/sysklogd/"
>  SECTION =3D "base"
>
>  LICENSE =3D "BSD-3-Clause"
> diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extende=
d/tar/tar_1.35.bb
> index d463eff97d..e385218095 100644
> --- a/meta/recipes-extended/tar/tar_1.35.bb
> +++ b/meta/recipes-extended/tar/tar_1.35.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "GNU file archiving program"
>  DESCRIPTION =3D "GNU tar saves many files together into a single tape \
>  or disk archive, and can restore individual files from the archive."
> -HOMEPAGE =3D "http://www.gnu.org/software/tar/"
> +HOMEPAGE =3D "https://www.gnu.org/software/tar/"
>  SECTION =3D "base"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
> diff --git a/meta/recipes-extended/texinfo/texinfo_7.2.bb b/meta/recipes-=
extended/texinfo/texinfo_7.2.bb
> index 784f67f65b..7386326560 100644
> --- a/meta/recipes-extended/texinfo/texinfo_7.2.bb
> +++ b/meta/recipes-extended/texinfo/texinfo_7.2.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Documentation system for on-line information=
 and printed output"
>  DESCRIPTION =3D "Texinfo is a documentation system that can produce both=
 \
>  online information and printed output from a single source file. The \
>  GNU Project uses the Texinfo file format for most of its documentation."
> -HOMEPAGE =3D "http://www.gnu.org/software/texinfo/"
> +HOMEPAGE =3D "https://www.gnu.org/software/texinfo/"
>  SECTION =3D "console/utils"
>  LICENSE =3D "GPL-3.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
> diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extend=
ed/time/time_1.9.bb
> index d6d8aa6e1e..0387d5c625 100644
> --- a/meta/recipes-extended/time/time_1.9.bb
> +++ b/meta/recipes-extended/time/time_1.9.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Tool that measures CPU resources"
>  DESCRIPTION =3D "time measures many of the CPU resources, such as time a=
nd \
>  memory, that other programs use."
> -HOMEPAGE =3D "http://www.gnu.org/software/time/"
> +HOMEPAGE =3D "https://www.gnu.org/software/time/"
>  SECTION =3D "utils"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-e=
xtended/timezone/timezone.inc
> index b9323432b8..06489c7c5d 100644
> --- a/meta/recipes-extended/timezone/timezone.inc
> +++ b/meta/recipes-extended/timezone/timezone.inc
> @@ -1,20 +1,20 @@
>  SUMMARY =3D "Timezone data"
>  DESCRIPTION =3D "The Time Zone Database contains code and data that repr=
esent \
>  the history of local time for many representative locations around the g=
lobe."
> -HOMEPAGE =3D "http://www.iana.org/time-zones"
> +HOMEPAGE =3D "https://www.iana.org/time-zones"
>  SECTION =3D "base"
>  LICENSE =3D "PD & BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f53c43=
fba"
>
>  PV =3D "2025c"
>
> -SRC_URI =3D "http://www.iana.org/time-zones/repository/releases/tzcode${=
PV}.tar.gz;name=3Dtzcode;subdir=3Dtz \
> -           http://www.iana.org/time-zones/repository/releases/tzdata${PV=
}.tar.gz;name=3Dtzdata;subdir=3Dtz \
> +SRC_URI =3D "https://www.iana.org/time-zones/repository/releases/tzcode$=
{PV}.tar.gz;name=3Dtzcode;subdir=3Dtz \
> +           https://www.iana.org/time-zones/repository/releases/tzdata${P=
V}.tar.gz;name=3Dtzdata;subdir=3Dtz \
>             "
>
>  S =3D "${UNPACKDIR}/tz"
>
> -UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
> +UPSTREAM_CHECK_URI =3D "https://www.iana.org/time-zones"
>
>  SRC_URI[tzcode.sha256sum] =3D "697ebe6625444aef5080f58e49d03424bbb52e08b=
f483d3ddb5acf10cbd15740"
>  SRC_URI[tzdata.sha256sum] =3D "4aa79e4effee53fc4029ffe5f6ebe97937282ebcd=
f386d5d2da91ce84142f957"
> diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-exte=
nded/unzip/unzip_6.0.bb
> index 1d22855e1c..0ca8370ba1 100644
> --- a/meta/recipes-extended/unzip/unzip_6.0.bb
> +++ b/meta/recipes-extended/unzip/unzip_6.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Utilities for extracting and viewing files in .zip archives=
"
> -HOMEPAGE =3D "http://www.info-zip.org"
> +HOMEPAGE =3D "https://www.info-zip.org"
>  DESCRIPTION =3D "Info-ZIP's purpose is to provide free, portable, high-q=
uality versions of the Zip and UnZip compressor-archiver utilities that are=
 compatible with the DOS-based PKZIP by PKWARE, Inc."
>  SECTION =3D "console/utils"
>  LICENSE =3D "Info-ZIP"
> diff --git a/meta/recipes-extended/watchdog/watchdog-config.bb b/meta/rec=
ipes-extended/watchdog/watchdog-config.bb
> index 58c565bd30..9d6ca589d2 100644
> --- a/meta/recipes-extended/watchdog/watchdog-config.bb
> +++ b/meta/recipes-extended/watchdog/watchdog-config.bb
> @@ -2,8 +2,8 @@ SUMMARY =3D "Software watchdog"
>  DESCRIPTION =3D "Watchdog is a daemon that checks if your system is stil=
l \
>  working. If programs in user space are not longer executed it will reboo=
t \
>  the system."
> -HOMEPAGE =3D "http://watchdog.sourceforge.net/"
> -BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D172030&atid=
=3D860194"
> +HOMEPAGE =3D "https://watchdog.sourceforge.net/"
> +BUGTRACKER =3D "https://sourceforge.net/tracker/?group_id=3D172030&atid=
=3D860194"
>
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recip=
es-extended/watchdog/watchdog_5.16.bb
> index c166ace665..f3195b0c7b 100644
> --- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
> +++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
> @@ -2,8 +2,8 @@ SUMMARY =3D "Software watchdog"
>  DESCRIPTION =3D "Watchdog is a daemon that checks if your system is stil=
l \
>  working. If programs in user space are not longer executed \
>  it will reboot the system."
> -HOMEPAGE =3D "http://watchdog.sourceforge.net/"
> -BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D172030&atid=
=3D860194"
> +HOMEPAGE =3D "https://watchdog.sourceforge.net/"
> +BUGTRACKER =3D "https://sourceforge.net/tracker/?group_id=3D172030&atid=
=3D860194"
>
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D084236108b1d4a9851bf5213fea58=
6fd"
> @@ -21,7 +21,7 @@ SRC_URI[sha256sum] =3D "b8e7c070e1b72aee2663bdc13b5cc39=
f76c9232669cfbb1ac0adc7275a
>  # Can be dropped when the output next changes, avoids failures after
>  # reproducibility issues
>
> -UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/watchdog/files/w=
atchdog/"
> +UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/watchdog/files/=
watchdog/"
>  UPSTREAM_CHECK_REGEX =3D "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
>
>  inherit autotools update-rc.d systemd pkgconfig
> diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended=
/zip/zip_3.0.bb
> index d1092551f7..e6819a4e21 100644
> --- a/meta/recipes-extended/zip/zip_3.0.bb
> +++ b/meta/recipes-extended/zip/zip_3.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Compressor/archiver for creating and modifying .zip files"
> -HOMEPAGE =3D "http://www.info-zip.org"
> +HOMEPAGE =3D "https://www.info-zip.org"
>  DESCRIPTION =3D "Info-ZIP's purpose is to provide free, portable, high-q=
uality versions of the Zip and UnZip compressor-archiver utilities that are=
 compatible with the DOS-based PKZIP by PKWARE, Inc."
>  SECTION =3D "console/utils"
>
> diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-exte=
nded/zstd/zstd_1.5.7.bb
> index 0e872b95aa..7ca27201e8 100644
> --- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
> +++ b/meta/recipes-extended/zstd/zstd_1.5.7.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Zstandard - Fast real-time compression algor=
ithm"
>  DESCRIPTION =3D "Zstandard is a fast lossless compression algorithm, tar=
geting \
>  real-time compression scenarios at zlib-level and better compression rat=
ios. \
>  It's backed by a very fast entropy stage, provided by Huff0 and FSE libr=
ary."
> -HOMEPAGE =3D "http://www.zstd.net/"
> +HOMEPAGE =3D "https://www.zstd.net/"
>  SECTION =3D "console/utils"
>
>  LICENSE =3D "BSD-3-Clause | GPL-2.0-only"
> diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb b/meta/recipes-gnom=
e/gtk+/gtk+3_3.24.51.bb
> index 35f99b2de0..f507a7ffb3 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Multi-platform toolkit for creating GUIs"
>  DESCRIPTION =3D "GTK+ is a multi-platform toolkit for creating graphical=
 user interfaces. Offering a complete \
>  set of widgets, GTK+ is suitable for projects ranging from small one-off=
 projects to complete application suites."
> -HOMEPAGE =3D "http://www.gtk.org"
> +HOMEPAGE =3D "https://www.gtk.org"
>  BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gtk/-/issues/"
>  SECTION =3D "libs"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522=
ec2 \
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.20.2.bb
> index 92791db169..a742d94807 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Multi-platform toolkit for creating GUIs"
>  DESCRIPTION =3D "GTK is a multi-platform toolkit for creating graphical =
user interfaces. Offering a complete \
>  set of widgets, GTK is suitable for projects ranging from small one-off =
projects to complete application suites."
> -HOMEPAGE =3D "http://www.gtk.org"
> +HOMEPAGE =3D "https://www.gtk.org"
>  BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gtk/-/issues/"
>  SECTION =3D "libs"
>
> diff --git a/meta/recipes-graphics/cairo/cairo_1.18.4.bb b/meta/recipes-g=
raphics/cairo/cairo_1.18.4.bb
> index 3f6d02f8d4..bef8162f1c 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.18.4.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.18.4.bb
> @@ -6,7 +6,7 @@ with various join and cap styles. All colors may be speci=
fied with \
>  optional translucence (opacity/alpha) and combined using the \
>  extended Porter/Duff compositing algebra as found in the X Render \
>  Extension."
> -HOMEPAGE =3D "http://cairographics.org"
> +HOMEPAGE =3D "https://cairographics.org"
>  BUGTRACKER =3D "https://gitlab.freedesktop.org/cairo/cairo/-/issues"
>  SECTION =3D "libs"
>
> @@ -27,7 +27,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De73e999e0c72=
b5ac9012424fa157ad77 \
>
>  DEPENDS =3D "fontconfig freetype glib-2.0 libpng pixman zlib"
>
> -SRC_URI =3D "http://cairographics.org/releases/cairo-${PV}.tar.xz \
> +SRC_URI =3D "https://cairographics.org/releases/cairo-${PV}.tar.xz \
>             file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff=
 \
>            "
>
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.131.bb b/meta/recipes-g=
raphics/drm/libdrm_2.4.131.bb
> index 1c55dd5550..f0590198ed 100644
> --- a/meta/recipes-graphics/drm/libdrm_2.4.131.bb
> +++ b/meta/recipes-graphics/drm/libdrm_2.4.131.bb
> @@ -3,14 +3,14 @@ DESCRIPTION =3D "The runtime library for accessing the =
kernel DRM services.  DRM \
>  stands for \"Direct Rendering Manager\", which is the kernel portion of =
the \
>  \"Direct Rendering Infrastructure\" (DRI).  DRI is required for many har=
dware \
>  accelerated OpenGL drivers."
> -HOMEPAGE =3D "http://dri.freedesktop.org"
> +HOMEPAGE =3D "https://dri.freedesktop.org"
>  SECTION =3D "x11/base"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://xf86drm.c;beginline=3D9;endline=3D32;md5=3D=
c8a3b961af7667c530816761e949dc71"
>  PROVIDES =3D "drm"
>  DEPENDS =3D "libpthread-stubs"
>
> -SRC_URI =3D "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
> +SRC_URI =3D "https://dri.freedesktop.org/libdrm/${BP}.tar.xz \
>            "
>
>  SRC_URI[sha256sum] =3D "45ba9983b51c896406a3d654de81d313b953b76e6391e279=
7073d543c5f617d5"
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb b/meta=
/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
> index de2642bdd1..5499371093 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
> @@ -8,7 +8,7 @@ particular rasterization library on the application. The =
X-specific \
>  library 'Xft' uses fontconfig along with freetype to specify and \
>  rasterize fonts."
>
> -HOMEPAGE =3D "http://www.fontconfig.org"
> +HOMEPAGE =3D "https://www.fontconfig.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3Dfon=
tconfig"
>
>  LICENSE =3D "MIT & PD"
> diff --git a/meta/recipes-graphics/glew/glew_2.2.0.bb b/meta/recipes-grap=
hics/glew/glew_2.2.0.bb
> index b82b25c602..d972669f06 100644
> --- a/meta/recipes-graphics/glew/glew_2.2.0.bb
> +++ b/meta/recipes-graphics/glew/glew_2.2.0.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "OpenGL extension loading library"
>  DESCRIPTION =3D "The OpenGL Extension Wrangler Library (GLEW) is a cross=
-platform open-source C/C++ extension loading library."
> -HOMEPAGE =3D "http://glew.sourceforge.net/"
> -BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D67586"
> +HOMEPAGE =3D "https://glew.sourceforge.net/"
> +BUGTRACKER =3D "https://sourceforge.net/tracker/?group_id=3D67586"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2ac251558de685c6b9478d89b=
e3149c2"
>
> @@ -12,7 +12,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/glew/glew/${=
PV}/glew-${PV}.tgz \
>
>  SRC_URI[sha256sum] =3D "d4fc82893cfb00109578d0a1a2337fb8ca335b3ceccf97b9=
7e5cc7f08e4353e1"
>
> -UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/glew/files/glew"
> +UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/glew/files/glew=
"
>  UPSTREAM_CHECK_REGEX =3D "/glew/(?P<pver>(\d+[\.\-_]*)+)/"
>
>  inherit lib_package pkgconfig features_check
> diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
> index d14a6403ff..26c84f7101 100644
> --- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> +++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "A thin layer of graphic data types"
> -HOMEPAGE =3D "http://ebassi.github.io/graphene/"
> +HOMEPAGE =3D "https://ebassi.github.io/graphene/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da7d871d9e23c450c421a85bb2=
819f648"
>
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb b/meta/rec=
ipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
> index ef2f6aa4f9..1c715ef06e 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Text shaping library"
>  DESCRIPTION =3D "HarfBuzz is an OpenType text shaping engine."
> -HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/HarfBuzz"
> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/HarfBuzz"
>  BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3DHar=
fBuzz"
>  SECTION =3D "libs"
>  LICENSE =3D "MIT"
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb b/meta/rec=
ipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
> index 26e84ca42c..17da2cc307 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Hardware accelerated JPEG compression/decompression library=
"
>  DESCRIPTION =3D "libjpeg-turbo is a derivative of libjpeg that uses SIMD=
 instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and=
 decompression"
> -HOMEPAGE =3D "http://libjpeg-turbo.org/"
> +HOMEPAGE =3D "https://libjpeg-turbo.org/"
>
>  LICENSE =3D "IJG & BSD-3-Clause & Zlib"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D52fddabc7e8e79233150ebda95=
c3fc1f"
> diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/re=
cipes-graphics/libfakekey/libfakekey_git.bb
> index 7416b84538..49ea565f57 100644
> --- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
> +++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
> @@ -1,8 +1,8 @@
>  SUMMARY =3D "Library for converting characters to X key-presses"
>  DESCRIPTION =3D "libfakekey is a simple library for converting UTF-8 cha=
racters into 'fake' X \
>  key-presses."
> -HOMEPAGE =3D "http://matchbox-project.org/"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +HOMEPAGE =3D "https://matchbox-project.org/"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>
>  LICENSE =3D "LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://src/libfakekey.c;endline=3D30;md5=3D602b5cc=
d48f64407510867f3373b448c"
> diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb b/meta=
/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
> index 9de44d4c95..eb8e39ec0d 100644
> --- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
> +++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
> @@ -4,8 +4,8 @@ System running on non-desktop embedded platforms such as =
handhelds, set-top \
>  boxes, kiosks and anything else for which screen space, input mechanisms=
 or \
>  system resources are limited."
>  SECTION =3D "x11/libs"
> -HOMEPAGE =3D "http://matchbox-project.org/"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.com/"
> +HOMEPAGE =3D "https://matchbox-project.org/"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.com/"
>
>  LICENSE =3D "LGPL-2.0-or-later & HPND"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D87712c91ca9a2c2d475a0604c00f8=
f54 \
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb b/meta/reci=
pes-graphics/libsdl2/libsdl2_2.32.10.bb
> index 834cf096b9..301cbf8b7b 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
> @@ -2,8 +2,8 @@ SUMMARY =3D "Simple DirectMedia Layer"
>  DESCRIPTION =3D "Simple DirectMedia Layer is a cross-platform multimedia=
 \
>  library designed to provide low level access to audio, keyboard, mouse, =
\
>  joystick, 3D hardware via OpenGL, and 2D video framebuffer."
> -HOMEPAGE =3D "http://www.libsdl.org"
> -BUGTRACKER =3D "http://bugzilla.libsdl.org/"
> +HOMEPAGE =3D "https://www.libsdl.org"
> +BUGTRACKER =3D "https://bugzilla.libsdl.org/"
>
>  SECTION =3D "libs"
>
> diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.=
bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
> index d8be3417cc..54f4202fe9 100644
> --- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
> +++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Custom Matchbox session files"
>  DESCRIPTION =3D "Very simple session manager for matchbox tools"
> -HOMEPAGE =3D "http://www.matchbox-project.org/"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +HOMEPAGE =3D "https://www.matchbox-project.org/"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://matchbox-session;endline=3D20;md5=3D180f1c1=
69a15d059a56c30094f6fb5ea"
> diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb b/met=
a/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
> index 3359193d65..7b2ba13e2e 100644
> --- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
> +++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Matchbox lightweight window manager"
> -HOMEPAGE =3D "http://matchbox-project.org"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +HOMEPAGE =3D "https://matchbox-project.org"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://src/wm.h;endline=3D21;md5=3Dce20617ac10f260=
45cc57b8d977ab552 \
> diff --git a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb b/meta/=
recipes-graphics/menu-cache/menu-cache_1.1.0.bb
> index 0a5d32b2c6..df458e7dce 100644
> --- a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
> +++ b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Library for caching application menus"
>  DESCRIPTION =3D "A library creating and utilizing caches to speed up fre=
edesktop.org application menus"
> -HOMEPAGE =3D "http://lxde.sourceforge.net/"
> +HOMEPAGE =3D "https://lxde.sourceforge.net/"
>
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0964c689fcf4c21c6797ea8740841=
6b6"
> @@ -14,6 +14,6 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV=
}.tar.xz \
>
>  SRC_URI[sha256sum] =3D "ed02eb459dcb398f69b9fa5bf4dd813020405afc84331115=
469cdf7be9273ec7"
>
> -UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/lxde/files/menu-=
cache/1.1/"
> +UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/lxde/files/menu=
-cache/1.1/"
>
>  inherit autotools gettext pkgconfig gtk-doc
> diff --git a/meta/recipes-graphics/mesa/libglu_9.0.3.bb b/meta/recipes-gr=
aphics/mesa/libglu_9.0.3.bb
> index 0e38671e41..ddefd4c791 100644
> --- a/meta/recipes-graphics/mesa/libglu_9.0.3.bb
> +++ b/meta/recipes-graphics/mesa/libglu_9.0.3.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "The OpenGL utility toolkit"
>  DESCRIPTION =3D "GLU is a utility toolkit used with OpenGL implementatio=
ns"
>
> -HOMEPAGE =3D "http://mesa3d.org"
> +HOMEPAGE =3D "https://mesa3d.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org"
>  SECTION =3D "x11"
>  LICENSE =3D "MIT"
> diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipe=
s-graphics/mesa/mesa-demos_9.0.0.bb
> index 0bc8519e90..8783fed013 100644
> --- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Mesa demo applications"
>  DESCRIPTION =3D "This package includes the demonstration application, su=
ch as glxgears. \
>  These applications can be used for Mesa validation and benchmarking."
> -HOMEPAGE =3D "http://mesa3d.org"
> +HOMEPAGE =3D "https://mesa3d.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org"
>  SECTION =3D "x11"
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 835e4d46ea..5e66bed79e 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -6,7 +6,7 @@ ranging from software emulation to complete hardware acce=
leration for modern GPU
>  Mesa is used as part of the overall Direct Rendering Infrastructure and =
X.org \
>  environment."
>
> -HOMEPAGE =3D "http://mesa3d.org"
> +HOMEPAGE =3D "https://mesa3d.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org"
>  SECTION =3D "x11"
>  LICENSE =3D "MIT"
> diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b=
/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
> index e90786df44..e2698a70af 100644
> --- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
> +++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Very simple session manager for X"
>  DESCRIPTION =3D "Simple session manager for X, that provides just the ri=
ght boilerplate to create a session and launch the browser "
> -HOMEPAGE =3D "http://www.yoctoproject.org"
> -BUGTRACKER =3D "http://bugzilla.pokylinux.org"
> +HOMEPAGE =3D "https://www.yoctoproject.org"
> +BUGTRACKER =3D "https://bugzilla.pokylinux.org"
>
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://mini-x-session;endline=3D5;md5=3Db6430bffbc=
f05f9760e72938826b7487"
> diff --git a/meta/recipes-graphics/pango/pango_1.57.0.bb b/meta/recipes-g=
raphics/pango/pango_1.57.0.bb
> index 5dc8a67dfe..3bf5bb844d 100644
> --- a/meta/recipes-graphics/pango/pango_1.57.0.bb
> +++ b/meta/recipes-graphics/pango/pango_1.57.0.bb
> @@ -4,8 +4,8 @@ with an emphasis on internationalization. Pango can be us=
ed anywhere \
>  that text layout is needed, though most of the work on Pango so far has =
\
>  been done in the context of the GTK+ widget toolkit. Pango forms the \
>  core of text and font handling for GTK+-2.x."
> -HOMEPAGE =3D "http://www.pango.org/"
> -BUGTRACKER =3D "http://bugzilla.gnome.org"
> +HOMEPAGE =3D "https://www.pango.org/"
> +BUGTRACKER =3D "https://bugzilla.gnome.org"
>  SECTION =3D "libs"
>  LICENSE =3D "LGPL-2.0-or-later"
>
> diff --git a/meta/recipes-graphics/startup-notification/startup-notificat=
ion_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notificati=
on_0.12.bb
> index bdc91d7455..484614bc27 100644
> --- a/meta/recipes-graphics/startup-notification/startup-notification_0.1=
2.bb
> +++ b/meta/recipes-graphics/startup-notification/startup-notification_0.1=
2.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Enables monitoring and display of applicatio=
n startup"
>  DESCRIPTION =3D "Contains a reference implementation of the startup noti=
fication protocol. \
>  The reference implementation is mostly under an X Window System style li=
cense, and has \
>  no special dependencies. "
> -HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/startup-notificat=
ion/"
> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/startup-notifica=
tion/"
>  BUGTRACKER =3D "https://gitlab.freedesktop.org/xdg/startup-notification/=
-/issues"
>
>  # most files are under MIT, but libsn/sn-util.c is under LGPL, the
> @@ -21,7 +21,7 @@ inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -SRC_URI =3D "http://www.freedesktop.org/software/startup-notification/re=
leases/${BPN}-${PV}.tar.gz \
> +SRC_URI =3D "https://www.freedesktop.org/software/startup-notification/r=
eleases/${BPN}-${PV}.tar.gz \
>             file://obsolete_automake_macros.patch \
>             file://time_t.patch \
>  "
> diff --git a/meta/recipes-graphics/wayland/libinput_1.30.1.bb b/meta/reci=
pes-graphics/wayland/libinput_1.30.1.bb
> index 8309d33304..fa4d894f30 100644
> --- a/meta/recipes-graphics/wayland/libinput_1.30.1.bb
> +++ b/meta/recipes-graphics/wayland/libinput_1.30.1.bb
> @@ -4,7 +4,7 @@ compositors and to provide a generic X.Org input driver. =
It provides \
>  device detection, device handling, input device event processing and \
>  abstraction so minimize the amount of custom input code compositors need=
 to \
>  provide the common set of functionality that users expect."
> -HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/libinput/"
> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/libinput/"
>  SECTION =3D "libs"
>
>  LICENSE =3D "MIT"
> diff --git a/meta/recipes-graphics/wayland/mtdev_1.1.7.bb b/meta/recipes-=
graphics/wayland/mtdev_1.1.7.bb
> index 24803c4238..ac40894d13 100644
> --- a/meta/recipes-graphics/wayland/mtdev_1.1.7.bb
> +++ b/meta/recipes-graphics/wayland/mtdev_1.1.7.bb
> @@ -5,13 +5,13 @@ multitouch events to the slotted type B protocol. The e=
vents put into mtdev may
>  be from any MT device, specifically type A without contact tracking, typ=
e A with \
>  contact tracking, or type B with contact tracking"
>
> -HOMEPAGE =3D "http://bitmath.org/code/mtdev/"
> +HOMEPAGE =3D "https://bitmath.org/code/mtdev/"
>  SECTION =3D "libs"
>
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dea6bd0268bb0fcd6b27698616ceee=
5d6"
>
> -SRC_URI =3D "http://bitmath.org/code/${BPN}/${BP}.tar.bz2"
> +SRC_URI =3D "https://bitmath.org/code/${BPN}/${BP}.tar.bz2"
>  SRC_URI[sha256sum] =3D "a107adad2101fecac54ac7f9f0e0a0dd155d954193da55c2=
340c97f2ff1d814e"
>
>  inherit autotools pkgconfig
> diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.47.bb
> index e19045fed0..66a3ff2f4d 100644
> --- a/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
> +++ b/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
> @@ -4,7 +4,7 @@ available in the Wayland core protocol. Such protocols ei=
ther add \
>  completely new functionality, or extend the functionality of some other =
\
>  protocol either in Wayland core, or some other protocol in \
>  wayland-protocols."
> -HOMEPAGE =3D "http://wayland.freedesktop.org"
> +HOMEPAGE =3D "https://wayland.freedesktop.org"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da38ca028ace54aae3d=
484 \
>                      file://stable/presentation-time/presentation-time.xm=
l;endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"
> diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb b/meta/=
recipes-graphics/wayland/wayland-utils_1.3.0.bb
> index 9a1828ccb0..ef24c49788 100644
> --- a/meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb
> @@ -4,7 +4,7 @@ wayland-info, a utility for displaying information about =
the Wayland \
>  protocols supported by a Wayland compositor. \
>  wayland-info is basically a standalone version of weston-info as found \
>  in weston repository. "
> -HOMEPAGE =3D "http://wayland.freedesktop.org"
> +HOMEPAGE =3D "https://wayland.freedesktop.org"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D548a66038a77415e1df51118625e8=
32f \
>                     "
> diff --git a/meta/recipes-graphics/wayland/wayland_1.24.0.bb b/meta/recip=
es-graphics/wayland/wayland_1.24.0.bb
> index de7ee516bb..007201f96a 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.24.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.24.0.bb
> @@ -5,7 +5,7 @@ a standalone display server running on Linux kernel modes=
etting and evdev \
>  input devices, an X application, or a wayland client itself. The clients=
 can \
>  be traditional applications, X servers (rootless or fullscreen) or other=
 \
>  display servers."
> -HOMEPAGE =3D "http://wayland.freedesktop.org"
> +HOMEPAGE =3D "https://wayland.freedesktop.org"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db31d8f53b6aaf2b4985d7dd7810a7=
0d1 \
>                      file://src/wayland-server.c;endline=3D24;md5=3Db8e04=
6164a766bb1ede8ba38e9dcd7ce"
> diff --git a/meta/recipes-graphics/wayland/weston_14.0.2.bb b/meta/recipe=
s-graphics/wayland/weston_14.0.2.bb
> index c53b03def0..ee8ee24aa7 100644
> --- a/meta/recipes-graphics/wayland/weston_14.0.2.bb
> +++ b/meta/recipes-graphics/wayland/weston_14.0.2.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Weston, a Wayland compositor"
>  DESCRIPTION =3D "Weston is the reference implementation of a Wayland com=
positor"
> -HOMEPAGE =3D "http://wayland.freedesktop.org"
> +HOMEPAGE =3D "https://wayland.freedesktop.org"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd79ee9e66bb0f95d3386a7acae780=
b70 \
>                      file://libweston/compositor.c;endline=3D27;md5=3Deb6=
d5297798cabe2ddc65e2af519bcf0 \
> diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-tran=
sparent-theme_git.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcur=
sor-transparent-theme_git.bb
> index e5a0f903f1..dd2925ddea 100644
> --- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent=
-theme_git.bb
> +++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent=
-theme_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Transparent X11 cursor theme for touchscreens"
> -HOMEPAGE =3D "http://www.matchbox-project.org/"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +HOMEPAGE =3D "https://www.matchbox-project.org/"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.=
8.0.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
> index 84bf530077..ee8f458458 100644
> --- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Touchscreen calibration program for X11"
> -HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/xinput_calibrator=
"
> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/xinput_calibrato=
r"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://src/calibrator.cpp;endline=3D22;md5=3D1bcba=
08f67cdb56f34021557898e4b5a"
>  DEPENDS =3D "virtual/libx11 libxi libxrandr"
> diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/re=
cipes-graphics/xorg-app/xorg-app-common.inc
> index 5dbe8abe86..25d1a72602 100644
> --- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> +++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "X application"
> -HOMEPAGE =3D "http://www.x.org/"
> +HOMEPAGE =3D "https://www.x.org/"
>  BUGTRACKER =3D "https://bugs.freedesktop.org"
>  SECTION =3D "x11/apps"
>  LICENSE =3D "MIT"
> diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/m=
eta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> index dd964d466d..e9d21363bc 100644
> --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "X driver"
> -HOMEPAGE =3D "http://www.x.org"
> +HOMEPAGE =3D "https://www.x.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org"
>  SECTION =3D "x11/drivers"
>  LICENSE =3D "MIT"
> diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/=
recipes-graphics/xorg-font/xorg-font-common.inc
> index a11b8e8ab2..015be0513e 100644
> --- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
> +++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
> @@ -1,4 +1,4 @@
> -HOMEPAGE =3D "http://www.x.org"
> +HOMEPAGE =3D "https://www.x.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxor=
g"
>
>  SECTION =3D "x11/fonts"
> diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta=
/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
> index 28010f5f22..160843422d 100644
> --- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
> +++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Xorg minimal fonts data"
>  DESCRIPTION =3D "Minimal fonts required by X.org."
> -HOMEPAGE =3D "http://www.x.org"
> +HOMEPAGE =3D "https://www.x.org"
>
>  SECTION =3D "x11/fonts"
>
> diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb b/meta=
/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
> index 7bcf51d56f..9a0ba620b5 100644
> --- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
> +++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Generic PCI access library for X"
>  DESCRIPTION =3D "libpciaccess provides functionality for X to access the=
 \
>  PCI bus and devices in a platform-independent way."
>
> -HOMEPAGE =3D "http://www.x.org"
> +HOMEPAGE =3D "https://www.x.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxor=
g"
>  SECTION =3D "x11/libs"
>
> diff --git a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb b/met=
a/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
> index 62384e6d2e..4932e2bab9 100644
> --- a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
> +++ b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
> @@ -1,13 +1,13 @@
>  SUMMARY =3D "Library that provides weak aliases for pthread functions"
>  DESCRIPTION =3D "This library provides weak aliases for pthread function=
s \
>  not provided in libc or otherwise available by default."
> -HOMEPAGE =3D "http://xcb.freedesktop.org"
> -BUGTRACKER =3D "http://bugs.freedesktop.org/buglist.cgi?product=3DXCB"
> +HOMEPAGE =3D "https://xcb.freedesktop.org"
> +BUGTRACKER =3D "https://bugs.freedesktop.org/buglist.cgi?product=3DXCB"
>  SECTION =3D "x11/libs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6edc1fea03d959f0c2d743fe5ca74=
6ad"
>
> -SRC_URI =3D "http://xcb.freedesktop.org/dist/${BP}.tar.xz"
> +SRC_URI =3D "https://xcb.freedesktop.org/dist/${BP}.tar.xz"
>  SRC_URI[sha256sum] =3D "59da566decceba7c2a7970a4a03b48d9905f1262ff94410a=
649224e33d2442bc"
>
>  inherit autotools
> diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb b/meta/recip=
es-graphics/xorg-lib/libxcb_1.17.0.bb
> index fcd8aad303..43a8085fc4 100644
> --- a/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
> @@ -2,14 +2,14 @@ SUMMARY =3D "XCB: The X protocol C binding library"
>  DESCRIPTION =3D "The X protocol C-language Binding (XCB) is a replacemen=
t \
>  for Xlib featuring a small footprint, latency hiding, direct access to \
>  the protocol, improved threading support, and extensibility."
> -HOMEPAGE =3D "http://xcb.freedesktop.org"
> +HOMEPAGE =3D "https://xcb.freedesktop.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3DXCB=
"
>  SECTION =3D "x11/libs"
>
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd763b081cb10c223435b01e00dc0a=
ba7"
>
> -SRC_URI =3D "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz \
> +SRC_URI =3D "https://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz \
>             file://0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch"
>
>  SRC_URI[sha256sum] =3D "599ebf9996710fea71622e6e184f3a8ad5b43d0e5fa8c4e4=
07123c88a59a6d55"
> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb b/meta=
/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
> index 42e6458090..7aac994fd9 100644
> --- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Generic XKB keymap library"
>  DESCRIPTION =3D "libxkbcommon is a keymap compiler and support library w=
hich \
>  processes a reduced subset of keymaps as defined by the XKB specificatio=
n."
> -HOMEPAGE =3D "http://www.xkbcommon.org"
> +HOMEPAGE =3D "https://www.xkbcommon.org"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D70eff33050c59f900f5b83275dcf1=
211"
>  LICENSE =3D "MIT & MIT-open-group & HPND & HPND-sell-variant & X11"
>
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.46.4.bb
> index 58c7bf3d03..cdde8aef7a 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
> @@ -3,14 +3,14 @@ DESCRIPTION =3D "Pixman provides a library for manipula=
ting pixel regions \
>  -- a set of Y-X banded rectangles, image compositing using the \
>  Porter/Duff model and implicit mask generation for geometric primitives =
\
>  including trapezoids, triangles, and rectangles."
> -HOMEPAGE =3D "http://www.pixman.org"
> +HOMEPAGE =3D "https://www.pixman.org"
>  SECTION =3D "x11/libs"
>  DEPENDS =3D "zlib"
>
>  SRC_URI =3D "https://www.cairographics.org/releases/${BP}.tar.gz"
>  SRC_URI[sha256sum] =3D "d09c44ebc3bd5bee7021c79f922fe8fb2fb57f7320f55e97=
ff9914d2346a591c"
>
> -# see http://cairographics.org/releases/ - only even minor versions are =
stable
> +# see https://cairographics.org/releases/ - only even minor versions are=
 stable
>  UPSTREAM_CHECK_REGEX =3D "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
>
>  PE =3D "1"
> diff --git a/meta/recipes-graphics/xorg-lib/xcb-util.inc b/meta/recipes-g=
raphics/xorg-lib/xcb-util.inc
> index 9898a6a13e..6594675f3c 100644
> --- a/meta/recipes-graphics/xorg-lib/xcb-util.inc
> +++ b/meta/recipes-graphics/xorg-lib/xcb-util.inc
> @@ -6,7 +6,7 @@ functions and interfaces which make the raw X protocol mo=
re usable. Some \
>  of the libraries also provide client-side code which is not strictly \
>  part of the X protocol but which have traditionally been provided by \
>  Xlib."
> -HOMEPAGE =3D "http://xcb.freedesktop.org/XcbUtil/"
> +HOMEPAGE =3D "https://xcb.freedesktop.org/XcbUtil/"
>  BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3DXCB=
"
>
>  LICENSE =3D "MIT"
> @@ -16,7 +16,7 @@ SECTION =3D "x11/libs"
>  DEPENDS =3D "libxcb"
>  DEPENDS +=3D "gperf-native"
>
> -SRC_URI =3D "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.xz"
> +SRC_URI =3D "https://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.xz"
>
>  inherit autotools pkgconfig features_check
>
> diff --git a/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb b/meta/reci=
pes-graphics/xorg-lib/xcb-util_0.4.1.bb
> index 0da004f907..41fe8c1b2f 100644
> --- a/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb
> +++ b/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb
> @@ -1,6 +1,6 @@
>  require xcb-util.inc
>
> -SRC_URI =3D "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.xz"
> +SRC_URI =3D "https://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.xz"
>
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://src/xcb_aux.c;endline=3D30;md5=3Dae305b9c2a=
38f9ba27060191046a6460 \
> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb b/me=
ta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb
> index cfefa53a0f..3591a3155d 100644
> --- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb
> +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb
> @@ -6,7 +6,7 @@ frequently released open source of X keyboard configurati=
on data for X \
>  Window System implementations.  The project is targeted to XKB-based \
>  systems."
>
> -HOMEPAGE =3D "http://freedesktop.org/wiki/Software/XKeyboardConfig"
> +HOMEPAGE =3D "https://freedesktop.org/wiki/Software/XKeyboardConfig"
>  BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxke=
yboard-config"
>
>  LICENSE =3D "MIT & MIT"
> diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/re=
cipes-graphics/xorg-lib/xorg-lib-common.inc
> index ba7fcb7304..dc1dfd14ef 100644
> --- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> +++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> @@ -1,4 +1,4 @@
> -HOMEPAGE =3D "http://www.x.org"
> +HOMEPAGE =3D "https://www.x.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxor=
g"
>
>  SECTION =3D "x11/libs"
> diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb b/meta/=
recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
> index 2a78a87e77..1e2c04bbe2 100644
> --- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
> +++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Function prototypes for the X protocol C=
-language Binding \
>  (XCB).  XCB is a replacement for Xlib featuring a small footprint, \
>  latency hiding, direct access to the protocol, improved threading \
>  support, and extensibility."
> -HOMEPAGE =3D "http://xcb.freedesktop.org"
> +HOMEPAGE =3D "https://xcb.freedesktop.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3DXCB=
"
>
>  SECTION =3D "x11/libs"
> diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb b/meta/=
recipes-graphics/xorg-proto/xorgproto_2024.1.bb
> index d79dc23f1b..f3d616c66b 100644
> --- a/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
> +++ b/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "X Window System unified protocol definitions"
>  DESCRIPTION =3D "This package provides the headers and specification doc=
uments defining \
>  the core protocol and (many) extensions for the X Window System"
> -HOMEPAGE =3D "http://www.x.org"
> +HOMEPAGE =3D "https://www.x.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxor=
g"
>
>  SECTION =3D "x11/libs"
> diff --git a/meta/recipes-graphics/xorg-util/xorg-util-common.inc b/meta/=
recipes-graphics/xorg-util/xorg-util-common.inc
> index 198921116d..0696ac1774 100644
> --- a/meta/recipes-graphics/xorg-util/xorg-util-common.inc
> +++ b/meta/recipes-graphics/xorg-util/xorg-util-common.inc
> @@ -1,4 +1,4 @@
> -HOMEPAGE =3D "http://www.x.org"
> +HOMEPAGE =3D "https://www.x.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxor=
g"
>
>  SECTION =3D "x11/utils"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.b=
b b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
> index 8f3b9217a0..720bac055b 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "X.Org X server configuration file"
> -HOMEPAGE =3D "http://www.x.org"
> +HOMEPAGE =3D "https://www.x.org"
>  SECTION =3D "x11/base"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
> index c79bb9e962..e384a966b3 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "The X.Org X server"
> -HOMEPAGE =3D "http://www.x.org"
> +HOMEPAGE =3D "https://www.x.org"
>  SECTION =3D "x11/base"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D21e33dcccf2d5034f798a8ea62622=
939"
> diff --git a/meta/recipes-graphics/xrestop/xrestop_0.4.bb b/meta/recipes-=
graphics/xrestop/xrestop_0.4.bb
> index 0c237fcf56..71b384d0ca 100644
> --- a/meta/recipes-graphics/xrestop/xrestop_0.4.bb
> +++ b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "XRes: A top-like resource usage tool for X"
>
>  DESCRIPTION =3D "top-like statistics of X11 server resource usage by cli=
ents"
>
> -HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/xrestop"
> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/xrestop"
>  BUGTRACKER =3D "https://bugs.freedesktop.org/"
>
>  LICENSE =3D "GPL-2.0-or-later"
> @@ -13,7 +13,7 @@ SECTION =3D "x11/utils"
>
>  DEPENDS =3D "libxres libxext virtual/libx11 ncurses"
>
> -SRC_URI =3D "http://downloads.yoctoproject.org/releases/xrestop/xrestop-=
${PV}.tar.gz"
> +SRC_URI =3D "https://downloads.yoctoproject.org/releases/xrestop/xrestop=
-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] =3D "67c2fc94a7ecedbaae0d1837e82e93d1d98f4a6d75982886=
0e552119af3ce257"
>
> diff --git a/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb b/meta/recipe=
s-kernel/blktrace/blktrace_1.3.0.bb
> index f053490409..c083713737 100644
> --- a/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
> +++ b/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
> @@ -4,7 +4,7 @@ detailed information about request queue operations up to=
 user space. There \
>  are three major components: a kernel component, a utility to record the =
i/o \
>  trace information for the kernel to user space, and utilities to analyse=
 and \
>  view the trace information."
> -HOMEPAGE =3D "http://brick.kernel.dk/snaps/"
> +HOMEPAGE =3D "https://brick.kernel.dk/snaps/"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f=
833"
>
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-k=
ernel/cryptodev/cryptodev.inc
> index dcd5ec140c..2831b65f58 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> @@ -1,4 +1,4 @@
> -HOMEPAGE =3D "http://cryptodev-linux.org/"
> +HOMEPAGE =3D "https://cryptodev-linux.org/"
>  DESCRIPTION =3D "Cryptodev-linux is a device that allows access to Linux=
 kernel \
>  cryptographic drivers; thus allowing of userspace applications to take a=
dvantage \
>  of hardware accelerators. Cryptodev-linux is implemented as a standalone=
 \
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb b/meta/recip=
es-kernel/kexec/kexec-tools_2.0.32.bb
> index e052cc5b1b..98c575e9a2 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Kexec fast reboot tools"
>  DESCRIPTION =3D "Kexec is a fast reboot feature that lets you reboot to =
a new Linux kernel"
> -HOMEPAGE =3D "http://kernel.org/pub/linux/utils/kernel/kexec/"
> +HOMEPAGE =3D "https://kernel.org/pub/linux/utils/kernel/kexec/"
>  SECTION =3D "kernel/userland"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D570a9b3749dd0463a1778803b12a6=
dce \
> diff --git a/meta/recipes-kernel/kmod/kmod_34.2.bb b/meta/recipes-kernel/=
kmod/kmod_34.2.bb
> index e5923a64cf..67086eeab9 100644
> --- a/meta/recipes-kernel/kmod/kmod_34.2.bb
> +++ b/meta/recipes-kernel/kmod/kmod_34.2.bb
> @@ -4,7 +4,7 @@
>  SUMMARY =3D "Tools for managing Linux kernel modules"
>  DESCRIPTION =3D "kmod is a set of tools to handle common tasks with Linu=
x kernel modules like \
>                 insert, remove, list, check properties, resolve dependenc=
ies and aliases."
> -HOMEPAGE =3D "http://kernel.org/pub/linux/utils/kernel/kmod/"
> +HOMEPAGE =3D "https://kernel.org/pub/linux/utils/kernel/kmod/"
>  LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
>  LICENSE:libkmod =3D "LGPL-2.1-or-later"
>  SECTION =3D "base"
> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb b/meta/recipe=
s-kernel/lttng/babeltrace2_2.1.2.bb
> index b0cd6efde1..664747283c 100644
> --- a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Babeltrace2 - Trace Format Babel Tower"
>  DESCRIPTION =3D "Babeltrace provides trace read and write libraries in h=
ost side, as well as a trace converter, which used to convert LTTng 2.0 tra=
ces into human-readable log."
> -HOMEPAGE =3D "http://babeltrace.org/"
> +HOMEPAGE =3D "https://babeltrace.org/"
>  BUGTRACKER =3D "https://bugs.lttng.org/projects/babeltrace"
>  LICENSE =3D "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-C=
lause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df6b015e4f388d6e78adb1b1f9a887=
d06"
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes=
-kernel/lttng/lttng-ust_2.14.0.bb
> index 1a15c5b420..544884435c 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Linux Trace Toolkit Userspace Tracer 2.x"
>  DESCRIPTION =3D "The LTTng UST 2.x package contains the userspace tracer=
 library to trace userspace codes."
> -HOMEPAGE =3D "http://lttng.org/ust"
> +HOMEPAGE =3D "https://lttng.org/ust"
>  BUGTRACKER =3D "https://bugs.lttng.org/projects/lttng-ust"
>
>  LICENSE =3D "LGPL-2.1-or-later & MIT & GPL-2.0-only"
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb b/meta/rec=
ipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
> index f3dfd3f35d..537d06e42a 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
> @@ -1,8 +1,8 @@
>  SUMMARY =3D "ALSA sound library"
>  DESCRIPTION =3D "(Occasionally a.k.a. libasound) is a userspace library =
that \
>  provides a level of abstraction over the /dev interfaces provided by the=
 kernel modules."
> -HOMEPAGE =3D "http://www.alsa-project.org"
> -BUGTRACKER =3D "http://alsa-project.org/main/index.php/Bug_Tracking"
> +HOMEPAGE =3D "https://www.alsa-project.org"
> +BUGTRACKER =3D "https://alsa-project.org/main/index.php/Bug_Tracking"
>  SECTION =3D "libs/multimedia"
>  LICENSE =3D "LGPL-2.1-only & GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb742476=
9c7 \
> diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb b/meta/r=
ecipes-multimedia/alsa/alsa-plugins_1.2.12.bb
> index 7db0c4d677..1981a8842e 100644
> --- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
> @@ -2,8 +2,8 @@ SUMMARY =3D "ALSA Plugins"
>  DESCRIPTION =3D "Used to create virtual devices that can be used like no=
rmal \
>  hardware devices but cause extra processing of the sound stream to take =
place. \
>  They are used while configuring ALSA in the .asoundrc file."
> -HOMEPAGE =3D "http://alsa-project.org"
> -BUGTRACKER =3D "http://alsa-project.org/main/index.php/Bug_Tracking"
> +HOMEPAGE =3D "https://alsa-project.org"
> +BUGTRACKER =3D "https://alsa-project.org/main/index.php/Bug_Tracking"
>  SECTION =3D "multimedia"
>  CVE_PRODUCT =3D "alsa"
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb b/meta/rec=
ipes-multimedia/alsa/alsa-tools_1.2.15.bb
> index 1228176fb9..2cc9fe41d1 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
> @@ -2,8 +2,8 @@ SUMMARY =3D "Advanced tools for certain ALSA sound card d=
rivers"
>  DESCRIPTION =3D "Package containing a number of tools ranging from envy2=
4control \
>  which provides complete control over all devices with an envy24 chip, to=
 \
>  firmware loaders for pcmcia, USB and the hdsp devices."
> -HOMEPAGE =3D "http://www.alsa-project.org"
> -BUGTRACKER =3D "http://alsa-project.org/main/index.php/Bug_Tracking"
> +HOMEPAGE =3D "https://www.alsa-project.org"
> +BUGTRACKER =3D "https://alsa-project.org/main/index.php/Bug_Tracking"
>  SECTION =3D "console/utils"
>  LICENSE =3D "GPL-2.0-only & LGPL-2.0-or-later"
>  DEPENDS =3D "alsa-lib"
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb b/meta/r=
ecipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
> index 927f94afb6..486fea3fff 100644
> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
> @@ -1,8 +1,8 @@
>  SUMMARY =3D "ALSA sound utilities"
>  DESCRIPTION =3D "collection of small and often extremely powerful applic=
ations \
>  designed to allow users to control the various parts of the ALSA system.=
"
> -HOMEPAGE =3D "http://www.alsa-project.org"
> -BUGTRACKER =3D "http://alsa-project.org/main/index.php/Bug_Tracking"
> +HOMEPAGE =3D "https://www.alsa-project.org"
> +BUGTRACKER =3D "https://alsa-project.org/main/index.php/Bug_Tracking"
>  SECTION =3D "console/utils"
>  # Some parts are GPL-2.0-or-later, some are GPL-2.0-only (e.g. axfer, al=
sactl)
>  # so result is GPL-2.0-only
> diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-mu=
ltimedia/flac/flac_1.5.0.bb
> index d6df801aec..3a07487440 100644
> --- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
> +++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.FDL;md5=3D802e79e3=
94e372d01e863e3f4058cf40 \
>                      file://include/FLAC/all.h;beginline=3D65;endline=3D7=
0;md5=3D39aaf5e03c7364363884c8b8ddda8eea \
>                      "
>
> -SRC_URI =3D "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
> +SRC_URI =3D "https://downloads.xiph.org/releases/flac/${BP}.tar.xz \
>             file://0001-API-documentation-replace-modules.html-by-topics.=
htm.patch"
>
>  SRC_URI[sha256sum] =3D "f2c1c76592a82ffff8413ba3c4a1299b6c7ab06c734dee03=
fd88630485c2b920"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
> index a652dbba33..6746318dae 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Libav-based GStreamer 1.x plugin"
>  DESCRIPTION =3D "Contains a GStreamer plugin for using the encoders, dec=
oders, \
>  muxers, and demuxers provided by FFmpeg."
> -HOMEPAGE =3D "http://gstreamer.freedesktop.org/"
> +HOMEPAGE =3D "https://gstreamer.freedesktop.org/"
>  SECTION =3D "multimedia"
>
>  # ffmpeg has comercial license flags so add it as we need ffmpeg as a de=
pendency
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9=
.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
> index 57ddf0bbba..55a1346df2 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Python bindings for GStreamer 1.0"
>  DESCRIPTION =3D "GStreamer Python binding overrides (complementing the b=
indings \
>  provided by python-gi) "
> -HOMEPAGE =3D "http://cgit.freedesktop.org/gstreamer/gst-python/"
> +HOMEPAGE =3D "https://cgit.freedesktop.org/gstreamer/gst-python/"
>  SECTION =3D "multimedia"
>
>  LICENSE =3D "LGPL-2.1-or-later"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1=
.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.=
9.bb
> index ac6b52ee46..8e5124cd1e 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.b=
b
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "A library on top of GStreamer for building an RTSP server"
> -HOMEPAGE =3D "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
> +HOMEPAGE =3D "https://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
>  SECTION =3D "multimedia"
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044cb77e486cc36129f7a=
770"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
> index c66f614629..f004464db4 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "GStreamer 1.0 multimedia framework"
>  DESCRIPTION =3D "GStreamer is a multimedia framework for encoding and de=
coding video and sound. \
>  It supports a wide range of formats including mp3, ogg, avi, mpeg and qu=
icktime."
> -HOMEPAGE =3D "http://gstreamer.freedesktop.org/"
> +HOMEPAGE =3D "https://gstreamer.freedesktop.org/"
>  BUGTRACKER =3D "https://bugzilla.gnome.org/enter_bug.cgi?product=3DGstre=
amer"
>  SECTION =3D "multimedia"
>  LICENSE =3D "LGPL-2.1-or-later"
> diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb b/meta/recipes-mu=
ltimedia/lame/lame_3.100.bb
> index 42689df351..44695ea29e 100644
> --- a/meta/recipes-multimedia/lame/lame_3.100.bb
> +++ b/meta/recipes-multimedia/lame/lame_3.100.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "High quality MP3 audio encoder"
>  DESCRIPTION =3D "LAME is an educational tool to be used for learning abo=
ut MP3 encoding."
>  HOMEPAGE =3D "https://lame.sourceforge.io/"
> -BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D290&atid=3D10=
0290"
> +BUGTRACKER =3D "https://sourceforge.net/tracker/?group_id=3D290&atid=3D1=
00290"
>  SECTION =3D "console/utils"
>  LICENSE =3D "LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc46bda00ffbb0ba1dac22f8d087f5=
4d9 \
> diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.6.bb b/meta/recipe=
s-multimedia/libogg/libogg_1.3.6.bb
> index 4810f156f2..4286f25ef3 100644
> --- a/meta/recipes-multimedia/libogg/libogg_1.3.6.bb
> +++ b/meta/recipes-multimedia/libogg/libogg_1.3.6.bb
> @@ -2,14 +2,14 @@ SUMMARY =3D "Ogg bitstream and framing libary"
>  DESCRIPTION =3D "libogg is the bitstream and framing library \
>  for the Ogg project. It provides functions which are \
>  necessary to codec libraries like libvorbis."
> -HOMEPAGE =3D "http://xiph.org/"
> +HOMEPAGE =3D "https://xiph.org/"
>  BUGTRACKER =3D "https://trac.xiph.org/newticket"
>  SECTION =3D "libs"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddb1b7a668b2a6f47b2af88fb008ad=
555 \
>                      file://include/ogg/ogg.h;beginline=3D1;endline=3D11;=
md5=3Deda812856f13a3b1326eb8f020cc3b0b"
>
> -SRC_URI =3D "http://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
> +SRC_URI =3D "https://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
>
>  SRC_URI[sha256sum] =3D "5c8253428e181840cd20d41f3ca16557a9cc04bad4a3d04c=
ce84808677fa1061"
>
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb b/meta/recip=
es-multimedia/libpng/libpng_1.6.53.bb
> index a43283eae7..2afc8c8e9d 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "PNG image format decoding library"
>  DESCRIPTION =3D "An open source project to develop and maintain the refe=
rence \
>  library for use in applications that read, create, and manipulate PNG \
>  (Portable Network Graphics) raster image files. "
> -HOMEPAGE =3D "http://www.libpng.org/"
> +HOMEPAGE =3D "https://www.libpng.org/"
>  SECTION =3D "libs"
>  LICENSE =3D "Libpng"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5516d77a3cf75f55a0d37254e3e65=
a20"
> @@ -18,7 +18,7 @@ SRC_URI[sha256sum] =3D "1d3fb8ccc2932d04aa3663e22ef5ef4=
90244370f4e568d785016506877
>
>  MIRRORS +=3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOUR=
CEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
>
> -UPSTREAM_CHECK_URI =3D "http://libpng.org/pub/png/libpng.html"
> +UPSTREAM_CHECK_URI =3D "https://libpng.org/pub/png/libpng.html"
>
>  BINCONFIG =3D "${bindir}/libpng-config ${bindir}/libpng16-config"
>
> diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/=
recipes-multimedia/libtheora/libtheora_1.2.0.bb
> index bacaf3aee6..04b72d17c2 100644
> --- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
> +++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
> @@ -1,13 +1,13 @@
>  SUMMARY =3D "Theora Video Codec"
>  DESCRIPTION =3D "The libtheora reference implementation provides the sta=
ndard encoder and decoder under a BSD license."
> -HOMEPAGE =3D "http://xiph.org/"
> +HOMEPAGE =3D "https://xiph.org/"
>  BUGTRACKER =3D "https://trac.xiph.org/newticket"
>  SECTION =3D "libs"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcf91718f59eb6a83d06dc7bcaf411=
132"
>  DEPENDS =3D "libogg"
>
> -SRC_URI =3D "http://downloads.xiph.org/releases/theora/libtheora-${PV}.t=
ar.xz \
> +SRC_URI =3D "https://downloads.xiph.org/releases/theora/libtheora-${PV}.=
tar.xz \
>             file://0001-add-missing-files.patch"
>
>  SRC_URI[sha256sum] =3D "ebdf77a8f5c0a8f7a9e42323844fa09502b34eb1d1fece7b=
5f54da41fe2122ec"
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.7.1.bb
> index 0d4b3a4abd..ec29b77656 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
> @@ -2,13 +2,13 @@ SUMMARY =3D "Provides support for the Tag Image File Fo=
rmat (TIFF)"
>  DESCRIPTION =3D "Library provides support for the Tag Image File Format =
\
>  (TIFF), a widely used format for storing image data.  This library \
>  provide means to easily access and create TIFF image files."
> -HOMEPAGE =3D "http://www.libtiff.org/"
> +HOMEPAGE =3D "https://www.libtiff.org/"
>  LICENSE =3D "libtiff & BSD-4.3TAHOE"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D4ab490c3088a0acff254eb2f8c=
577547"
>
>  CVE_PRODUCT =3D "libtiff"
>
> -SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
> +SRC_URI =3D "https://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>            "
>
>  SRC_URI[sha256sum] =3D "f698d94f3103da8ca7438d84e0344e453fe0ba3b7486e04c=
5bf7a9a3fabe9b69"
> diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb b/meta/=
recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
> index d5bf5ff0fa..d53639971e 100644
> --- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
> +++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D73d9c8942c60=
b846c3bad13cc6c2e520 \
>                      file://include/vorbis/vorbisenc.h;beginline=3D1;endl=
ine=3D11;md5=3Dc95a4ac2b4125f00a9acf61449ebb843"
>  DEPENDS =3D "libogg"
>
> -SRC_URI =3D "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
> +SRC_URI =3D "https://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
>             file://0001-configure-Check-for-clang.patch \
>            "
>  SRC_URI[sha256sum] =3D "b33cc4934322bcbf6efcbacf49e3ca01aadbea4114ec9589=
d1b1e9d20f72954b"
> diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb b/meta/recip=
es-multimedia/mpg123/mpg123_1.33.3.bb
> index b1897fe95d..ef98dc5c1c 100644
> --- a/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
> +++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
> @@ -2,8 +2,8 @@ SUMMARY =3D "Audio decoder for MPEG-1 Layer 1/2/3"
>  DESCRIPTION =3D "The core of mpg123 is an MPEG-1 Layer 1/2/3 decoding li=
brary, which can be used by other programs. \
>  mpg123 also comes with a command-line tool which can playback using ALSA=
, PulseAudio, OSS, and several other APIs, \
>  and also can write the decoded audio to WAV."
> -HOMEPAGE =3D "http://mpg123.de/"
> -BUGTRACKER =3D "http://sourceforge.net/p/mpg123/bugs/"
> +HOMEPAGE =3D "https://mpg123.de/"
> +BUGTRACKER =3D "https://sourceforge.net/p/mpg123/bugs/"
>  SECTION =3D "multimedia"
>
>  LICENSE =3D "LGPL-2.1-only"
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
> index b9dc8e236f..eff18454cc 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Sound server for Linux and Unix-like operating systems"
>  DESCRIPTION =3D "A general purpose sound server intended to run as a mid=
dleware \
>  between your applications and your hardware devices, either using ALSA o=
r OSS."
> -HOMEPAGE =3D "http://www.pulseaudio.org"
> +HOMEPAGE =3D "https://www.pulseaudio.org"
>  SECTION =3D "libs/multimedia"
>
>  # Most of PulseAudio code is under LGPL-2.1-or-later. There are a few
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb b/meta=
/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
> index 6c172b4ec7..ef9fa36e65 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
> @@ -1,6 +1,6 @@
>  require pulseaudio.inc
>
> -SRC_URI =3D "http://www.freedesktop.org/software/pulseaudio/releases/${B=
P}.tar.xz \
> +SRC_URI =3D "https://www.freedesktop.org/software/pulseaudio/releases/${=
BP}.tar.xz \
>             file://0001-client-conf-Add-allow-autospawn-for-root.patch \
>             file://0002-do-not-display-CLFAGS-to-improve-reproducibility-=
bui.patch \
>             file://volatiles.04_pulse \
> diff --git a/meta/recipes-multimedia/speex/speex_1.2.1.bb b/meta/recipes-=
multimedia/speex/speex_1.2.1.bb
> index c40198fa8f..e34eefe119 100644
> --- a/meta/recipes-multimedia/speex/speex_1.2.1.bb
> +++ b/meta/recipes-multimedia/speex/speex_1.2.1.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Speech Audio Codec"
>  DESCRIPTION =3D "Speex is an Open Source/Free Software patent-free audio=
 compression format designed for speech."
> -HOMEPAGE =3D "http://www.speex.org"
> +HOMEPAGE =3D "https://www.speex.org"
>  SECTION =3D "libs"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deff3f76350f52a99a3df5eec6b79c=
02a \
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deff3f76350f52a=
99a3df5eec6b79c02a \
>                      "
>  DEPENDS =3D "libogg speexdsp"
>
> -SRC_URI =3D "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz=
"
> +SRC_URI =3D "https://downloads.xiph.org/releases/speex/speex-${PV}.tar.g=
z"
>  UPSTREAM_CHECK_REGEX =3D "speex-(?P<pver>\d+(\.\d+)+)\.tar"
>
>  SRC_URI[sha256sum] =3D "4b44d4f2b38a370a2d98a78329fefc56a0cf93d1c1be7002=
9217baae6628feea"
> diff --git a/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb b/meta/recip=
es-multimedia/speex/speexdsp_1.2.1.bb
> index 435b56bbb8..91228be85f 100644
> --- a/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
> +++ b/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
> @@ -1,11 +1,11 @@
>  SUMMARY =3D "A patent-free DSP library"
>  DESCRIPTION =3D "SpeexDSP is a patent-free, Open Source/Free Software DS=
P library."
> -HOMEPAGE =3D "http://www.speex.org"
> +HOMEPAGE =3D "https://www.speex.org"
>  SECTION =3D "libs"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deff3f76350f52a99a3df5eec6b79c=
02a"
>
> -SRC_URI =3D "http://downloads.xiph.org/releases/speex/speexdsp-${PV}.tar=
.gz"
> +SRC_URI =3D "https://downloads.xiph.org/releases/speex/speexdsp-${PV}.ta=
r.gz"
>
>  UPSTREAM_CHECK_REGEX =3D "speexdsp-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-multimedia/webp/libwebp_1.6.0.bb b/meta/recipes=
-multimedia/webp/libwebp_1.6.0.bb
> index 0ba90c406a..3e7a7919bf 100644
> --- a/meta/recipes-multimedia/webp/libwebp_1.6.0.bb
> +++ b/meta/recipes-multimedia/webp/libwebp_1.6.0.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6e8dee932c26=
f2dab503abf70c96d8bb \
>  SRC_URI =3D "https://storage.googleapis.com/downloads.webmproject.org/re=
leases/webp/${BP}.tar.gz"
>  SRC_URI[sha256sum] =3D "e4ab7009bf0629fd11982d4c2aa83964cf244cffba7347ec=
d39019a9e38c4564"
>
> -UPSTREAM_CHECK_URI =3D "http://downloads.webmproject.org/releases/webp/i=
ndex.html"
> +UPSTREAM_CHECK_URI =3D "https://downloads.webmproject.org/releases/webp/=
index.html"
>
>  EXTRA_OECONF =3D " \
>      --disable-wic \
> diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-mult=
imedia/x264/x264_git.bb
> index b3d1cfd695..f3df7823f9 100644
> --- a/meta/recipes-multimedia/x264/x264_git.bb
> +++ b/meta/recipes-multimedia/x264/x264_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "H.264/MPEG-4 AVC video encoder"
>  DESCRIPTION =3D "A free software library and application for encoding vi=
deo streams into the H.264/MPEG-4 AVC format."
> -HOMEPAGE =3D "http://www.videolan.org/developers/x264.html"
> +HOMEPAGE =3D "https://www.videolan.org/developers/x264.html"
>
>  LICENSE =3D "GPL-2.0-only"
>  LICENSE_FLAGS =3D "commercial"
> diff --git a/meta/recipes-sato/libptytty/libptytty_2.0.bb b/meta/recipes-=
sato/libptytty/libptytty_2.0.bb
> index 1199f0f44b..7dce215ffe 100644
> --- a/meta/recipes-sato/libptytty/libptytty_2.0.bb
> +++ b/meta/recipes-sato/libptytty/libptytty_2.0.bb
> @@ -1,9 +1,9 @@
>  SUMMARY =3D " OS independent and secure pty/tty and utmp/wtmp/lastlog ha=
ndling"
> -HOMEPAGE =3D "http://software.schmorp.de/pkg/libptytty.html"
> +HOMEPAGE =3D "https://software.schmorp.de/pkg/libptytty.html"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
>
> -SRC_URI =3D "http://dist.schmorp.de/libptytty/libptytty-${PV}.tar.gz \
> +SRC_URI =3D "https://dist.schmorp.de/libptytty/libptytty-${PV}.tar.gz \
>             file://0001-CMakeLists.txt-do-not-run-cross-binary.patch \
>             "
>  SRC_URI[sha256sum] =3D "8033ed3aadf28759660d4f11f2d7b030acf2a6890cb0f792=
6fb0cfa6739d31f7"
> diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.=
2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
> index 6286a15798..02ba862be8 100644
> --- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
> +++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Matchbox GTK+ theme configuration application"
> -HOMEPAGE =3D "http://matchbox-project.org"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +HOMEPAGE =3D "https://matchbox-project.org"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb b=
/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
> index 85e5300520..699ed3baf0 100644
> --- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
> +++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Matchbox Window Manager Desktop"
>  DESCRIPTION =3D "A lightweight windows manager for embedded systems. It =
uses the desktop background to provide an application launcher and allows m=
odules to be loaded for additional functionality."
> -HOMEPAGE =3D "http://matchbox-project.org/"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +HOMEPAGE =3D "https://matchbox-project.org/"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>
>  LICENSE =3D "GPL-2.0-or-later & LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.=
bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
> index 5fc6c67bfc..926796616f 100644
> --- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
> +++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Matchbox virtual keyboard for X11"
>  DESCRIPTION =3D "An on screen 'virtual' or 'software' keyboard."
> -HOMEPAGE =3D "http://matchbox-project.org"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +HOMEPAGE =3D "https://matchbox-project.org"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>  SECTION =3D "x11"
>
>  LICENSE =3D "LGPL-2.1-only"
> diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb =
b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
> index a126571ade..d2ff11e1b2 100644
> --- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
> +++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
> @@ -1,8 +1,8 @@
>  SUMMARY =3D "Simple GTK+ based panel for handheld devices"
>  DESCRIPTION =3D "A flexible always present 'window bar' for holding appl=
ication \
>  launchers and small 'applet' style applications"
> -HOMEPAGE =3D "http://matchbox-project.org"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +HOMEPAGE =3D "https://matchbox-project.org"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb=
 b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
> index 75065163ba..566fa05c64 100644
> --- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
> +++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Custom Matchbox session files for the Sato environment"
> -HOMEPAGE =3D "http://www.matchbox-project.org/"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +HOMEPAGE =3D "https://www.matchbox-project.org/"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://session;endline=3D3;md5=3Df8a5c5b9c279e52dc=
094d10e11c2be63"
> diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb=
 b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
> index ce1f425b77..64811f3bab 100644
> --- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
> +++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Lightweight GTK+ terminal application"
> -HOMEPAGE =3D "http://www.matchbox-project.org/"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +HOMEPAGE =3D "https://www.matchbox-project.org/"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.in=
c b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
> index bd680111d9..8620f3287e 100644
> --- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
> +++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Matchbox window manager Sato themes"
> -HOMEPAGE =3D "http://www.matchbox-project.org/"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +HOMEPAGE =3D "https://www.matchbox-project.org/"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>
>  LICENSE =3D "CC-BY-SA-3.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daae86bb34b0a83716ca09f4e783d6=
ba4"
> diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb b/meta/recipes-sa=
to/pcmanfm/pcmanfm_1.3.2.bb
> index 2e463cd7b3..8389aead3f 100644
> --- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
> +++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Fast lightweight tabbed filemanager"
>  DESCRIPTION =3D "A free file manager application and the standard file m=
anager of LXDE."
> -HOMEPAGE =3D "http://pcmanfm.sourceforge.net/"
> +HOMEPAGE =3D "https://pcmanfm.sourceforge.net/"
>
>  LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552 \
> @@ -19,7 +19,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV=
}.tar.xz \
>
>  SRC_URI[sha256sum] =3D "14cb7b247493c4cce65fbb5902611e3ad00a7a870fbc1e50=
adc50428c5140cf7"
>
> -UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/pcmanfm/files/PC=
ManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
> +UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/pcmanfm/files/P=
CManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
>
>  inherit autotools pkgconfig features_check mime-xdg
>
> diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato=
/puzzles/puzzles_git.bb
> index 9745c26502..b8508d2d12 100644
> --- a/meta/recipes-sato/puzzles/puzzles_git.bb
> +++ b/meta/recipes-sato/puzzles/puzzles_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Simon Tatham's Portable Puzzle Collection"
>  DESCRIPTION =3D "Collection of small computer programs which implement o=
ne-player puzzle games."
> -HOMEPAGE =3D "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
> +HOMEPAGE =3D "https://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D191542b32377bde254e9799e0a46f=
18b"
>
> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recip=
es-sato/rxvt-unicode/rxvt-unicode.inc
> index 2eab0d4ec4..0a488c84eb 100644
> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> @@ -8,7 +8,7 @@ same time, including Xft fonts."
>  HOMEPAGE =3D "https://rxvt.org/"
>  DEPENDS =3D "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty ncu=
rses-native"
>
> -SRC_URI =3D "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV=
}.tar.bz2 \
> +SRC_URI =3D "https://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${P=
V}.tar.bz2 \
>            file://xwc.patch \
>            file://rxvt.desktop \
>            file://rxvt.png"
> diff --git a/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.b=
b b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
> index 5502b66905..c05ad4d98c 100644
> --- a/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
> +++ b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
> @@ -1,4 +1,4 @@
> -HOMEPAGE =3D "http://tango.freedesktop.org/"
> +HOMEPAGE =3D "https://tango.freedesktop.org/"
>  SUMMARY =3D "Enables backwards compatibility with current desktop icon t=
hemes"
>  DESCRIPTION =3D "A Perl script used for maintaining backwards \
>  compatibility with current desktop icon themes, while migrating to the \
> diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb b/m=
eta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
> index 83de53c26e..cad6ec5b99 100644
> --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
> +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Sato icon theme"
>  HOMEPAGE =3D "https://www.yoctoproject.org/"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>
>  LICENSE =3D "CC-BY-SA-3.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D56a830bbe6e4697fe6cbbae01bb7c=
2b2"
> diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/m=
eta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
> index a2af4faed3..3c272219a0 100644
> --- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
> +++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Ultra-simple screen capture utility, aimed at handheld devi=
ces"
> -HOMEPAGE =3D "http://www.o-hand.com"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +HOMEPAGE =3D "https://www.o-hand.com"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>
>  LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b=
/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
> index 3869ab4a02..e7eb5ccc28 100644
> --- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
> +++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Provides a bridge between gconf and xsettings"
>  HOMEPAGE =3D "https://git.yoctoproject.org/cgit/cgit.cgi/xsettings-daemo=
n/"
> -BUGTRACKER =3D "http://bugzilla.yoctoproject.org/"
> +BUGTRACKER =3D "https://bugzilla.yoctoproject.org/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://xsettings-manager.h;endline=3D22;md5=3D7cfa=
c9d2d4dc3694cc7eb605cf32a69b \
>                      file://xsettings-common.h;endline=3D22;md5=3D7cfac9d=
2d4dc3694cc7eb605cf32a69b"
> diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-su=
pport/apr/apr-util_1.6.3.bb
> index b5e3d2fc8a..3e172a2935 100644
> --- a/meta/recipes-support/apr/apr-util_1.6.3.bb
> +++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Apache Portable Runtime (APR) companion library"
> -HOMEPAGE =3D "http://apr.apache.org/"
> +HOMEPAGE =3D "https://apr.apache.org/"
>  SECTION =3D "libs"
>  DEPENDS =3D "apr expat"
>
> diff --git a/meta/recipes-support/apr/apr_1.7.6.bb b/meta/recipes-support=
/apr/apr_1.7.6.bb
> index 13fa5daa3c..7483f4272b 100644
> --- a/meta/recipes-support/apr/apr_1.7.6.bb
> +++ b/meta/recipes-support/apr/apr_1.7.6.bb
> @@ -3,7 +3,7 @@ SUMMARY =3D "Apache Portable Runtime (APR) library"
>  DESCRIPTION =3D "Create and maintain software libraries that provide a p=
redictable \
>  and consistent interface to underlying platform-specific implementations=
."
>
> -HOMEPAGE =3D "http://apr.apache.org/"
> +HOMEPAGE =3D "https://apr.apache.org/"
>  SECTION =3D "libs"
>  DEPENDS =3D "util-linux"
>
> diff --git a/meta/recipes-support/aspell/aspell_0.60.8.1.bb b/meta/recipe=
s-support/aspell/aspell_0.60.8.1.bb
> index 43940b1e1b..c68553ce41 100644
> --- a/meta/recipes-support/aspell/aspell_0.60.8.1.bb
> +++ b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
> @@ -8,7 +8,7 @@ checker out there for the English language."
>
>  SECTION =3D "console/utils"
>
> -HOMEPAGE =3D "http://aspell.net/"
> +HOMEPAGE =3D "https://aspell.net/"
>
>  LICENSE =3D "LGPL-2.0-only | LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903=
e34"
> diff --git a/meta/recipes-support/atk/at-spi2-core_2.58.3.bb b/meta/recip=
es-support/atk/at-spi2-core_2.58.3.bb
> index 022d2ff71e..0b367a32b9 100644
> --- a/meta/recipes-support/atk/at-spi2-core_2.58.3.bb
> +++ b/meta/recipes-support/atk/at-spi2-core_2.58.3.bb
> @@ -3,7 +3,7 @@ SUMMARY =3D "Assistive Technology Service Provider Interf=
ace (dbus core)"
>  DESCRIPTION =3D "It provides a Service Provider Interface for the Assist=
ive Technologies available on the GNOME platform and a library against whic=
h applications can be linked."
>
>  HOMEPAGE =3D "https://wiki.linuxfoundation.org/accessibility/d-bus"
> -BUGTRACKER =3D "http://bugzilla.gnome.org/"
> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
>
> diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-suppor=
t/attr/acl_2.3.2.bb
> index a405cc2692..39ff001a12 100644
> --- a/meta/recipes-support/attr/acl_2.3.2.bb
> +++ b/meta/recipes-support/attr/acl_2.3.2.bb
> @@ -2,8 +2,8 @@ SUMMARY =3D "Utilities for managing POSIX Access Control =
Lists"
>  DESCRIPTION =3D "ACL allows you to provide different levels of access to=
 files \
>  and folders for different users."
>
> -HOMEPAGE =3D "http://savannah.nongnu.org/projects/acl/"
> -BUGTRACKER =3D "http://savannah.nongnu.org/bugs/?group=3Dacl"
> +HOMEPAGE =3D "https://savannah.nongnu.org/projects/acl/"
> +BUGTRACKER =3D "https://savannah.nongnu.org/bugs/?group=3Dacl"
>
>  SECTION =3D "libs"
>
> diff --git a/meta/recipes-support/attr/attr_2.5.2.bb b/meta/recipes-suppo=
rt/attr/attr_2.5.2.bb
> index 390445b959..831f6696dc 100644
> --- a/meta/recipes-support/attr/attr_2.5.2.bb
> +++ b/meta/recipes-support/attr/attr_2.5.2.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Utilities for manipulating filesystem extended attributes"
>  DESCRIPTION =3D "Implement the ability for a user to attach name:value p=
airs to objects within the XFS filesystem."
>
> -HOMEPAGE =3D "http://savannah.nongnu.org/projects/attr/"
> +HOMEPAGE =3D "https://savannah.nongnu.org/projects/attr/"
>  SECTION =3D "libs"
>
>  DEPENDS =3D "virtual/libintl"
> diff --git a/meta/recipes-support/boost/boost-1.90.0.inc b/meta/recipes-s=
upport/boost/boost-1.90.0.inc
> index 9b0ce592d9..1a5dedfde7 100644
> --- a/meta/recipes-support/boost/boost-1.90.0.inc
> +++ b/meta/recipes-support/boost/boost-1.90.0.inc
> @@ -3,7 +3,7 @@
>  # work well with the C++ Standard Library. The libraries are
>  # intended to be widely useful, and are in regular use by
>  # thousands of programmers across a broad spectrum of applications.
> -HOMEPAGE =3D "http://www.boost.org/"
> +HOMEPAGE =3D "https://www.boost.org/"
>  LICENSE =3D "BSL-1.0 & MIT & Python-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d=
31bef20d78c"
>
> @@ -14,7 +14,7 @@ BOOST_P =3D "boost_${BOOST_VER}"
>  SRC_URI =3D "https://archives.boost.io/release/${PV}/source/${BOOST_P}.t=
ar.bz2"
>  SRC_URI[sha256sum] =3D "49551aff3b22cbc5c5a9ed3dbc92f0e23ea50a0f7325b0d1=
98b705e8ee3fc305"
>
> -UPSTREAM_CHECK_URI =3D "http://www.boost.org/users/download/"
> +UPSTREAM_CHECK_URI =3D "https://www.boost.org/users/download/"
>  UPSTREAM_CHECK_REGEX =3D "release/(?P<pver>.*)/source/"
>
>  S =3D "${UNPACKDIR}/${BOOST_P}"
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_2025041=
9.bb b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
> index a11433c9da..6be5a1b864 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Common CA certificates"
>  DESCRIPTION =3D "This package includes PEM files of CA certificates to a=
llow \
>  SSL-based applications to check for the authenticity of SSL connections.=
 \
>  This derived from Debian's CA Certificates."
> -HOMEPAGE =3D "http://packages.debian.org/sid/ca-certificates"
> +HOMEPAGE =3D "https://packages.debian.org/sid/ca-certificates"
>  SECTION =3D "misc"
>  LICENSE =3D "GPL-2.0-or-later & MPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dae5b36b514e3f12ce1aa=
8e2ee67f3d7e"
> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/r=
ecipes-support/consolekit/consolekit_0.4.6.bb
> index acef3483bb..ec8d67ef72 100644
> --- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
> +++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Framework for defining and tracking users, login sessions, =
and seats"
>  DESCRIPTION =3D "It provides a mechanism for software to react to change=
s \
>  of any of these items or of any of the metadata associated with them."
> -HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/ConsoleKit"
> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/ConsoleKit"
>  BUGTRACKER =3D "https://bugs.freedesktop.org/buglist.cgi?query_format=3D=
specific&product=3DConsoleKit"
>
>  LICENSE =3D "GPL-2.0-or-later"
> @@ -15,7 +15,7 @@ inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -SRC_URI =3D "http://www.freedesktop.org/software/ConsoleKit/dist/Console=
Kit-${PV}.tar.xz \
> +SRC_URI =3D "https://www.freedesktop.org/software/ConsoleKit/dist/Consol=
eKit-${PV}.tar.xz \
>             file://sepbuildfix.patch \
>             file://add-polkit-configure-argument.patch \
>  "
> diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb b/meta/recip=
es-support/dos2unix/dos2unix_7.5.3.bb
> index ae69110c39..e955348347 100644
> --- a/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
> +++ b/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Convert text file line endings between CRLF =
and LF"
>  DESCRIPTION =3D "The Dos2unix package includes utilities dos2unix and \
>  unix2dos to convert plain text files in DOS or Mac format to Unix \
>  format and vice versa."
> -HOMEPAGE =3D "http://waterlan.home.xs4all.nl/dos2unix.html"
> +HOMEPAGE =3D "https://waterlan.home.xs4all.nl/dos2unix.html"
>  SECTION =3D "support"
>
>  LICENSE =3D "BSD-2-Clause"
> diff --git a/meta/recipes-support/fribidi/fribidi_1.0.16.bb b/meta/recipe=
s-support/fribidi/fribidi_1.0.16.bb
> index 9f75446da2..4de7d3a0fc 100644
> --- a/meta/recipes-support/fribidi/fribidi_1.0.16.bb
> +++ b/meta/recipes-support/fribidi/fribidi_1.0.16.bb
> @@ -4,7 +4,7 @@ of interactive editors and widgets that implement BiDi fu=
nctionality. \
>  The BiDi algorithm is a prerequisite for supporting right-to-left script=
s such \
>  as Hebrew, Arabic, Syriac, and Thaana. "
>  SECTION =3D "libs"
> -HOMEPAGE =3D "http://fribidi.org/"
> +HOMEPAGE =3D "https://fribidi.org/"
>  BUGTRACKER =3D "https://github.com/fribidi/fribidi/issues"
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb742476=
9c7"
> diff --git a/meta/recipes-support/gdbm/gdbm_1.26.bb b/meta/recipes-suppor=
t/gdbm/gdbm_1.26.bb
> index 0c8c7ec690..0cff5caa63 100644
> --- a/meta/recipes-support/gdbm/gdbm_1.26.bb
> +++ b/meta/recipes-support/gdbm/gdbm_1.26.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Key/value database library with extensible h=
ashing"
>  DESCRIPTION =3D "Library of database functions that use extensible hashi=
ng \
>  and work similar to the standard UNIX dbm. These routines are provided \
>  to a programmer needing to create and manipulate a hashed database."
> -HOMEPAGE =3D "http://www.gnu.org/software/gdbm/"
> +HOMEPAGE =3D "https://www.gnu.org/software/gdbm/"
>  SECTION =3D "libs"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D241da1b9fe42e642cbb2c24d5e0c4=
d24"
> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/=
gmp.inc
> index 1872226616..0eaec422fa 100644
> --- a/meta/recipes-support/gmp/gmp.inc
> +++ b/meta/recipes-support/gmp/gmp.inc
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "GNU multiprecision arithmetic library"
>  DESCRIPTION =3D "GMP is a free library for arbitrary precision arithmeti=
c, operating on signed integers, rational numbers, and floating point numbe=
rs"
> -HOMEPAGE =3D "http://gmplib.org/"
> +HOMEPAGE =3D "https://gmplib.org/"
>  SECTION =3D "devel"
>
>  inherit autotools texinfo multilib_header
> diff --git a/meta/recipes-support/gnupg/gnupg_2.5.14.bb b/meta/recipes-su=
pport/gnupg/gnupg_2.5.14.bb
> index e484b03424..c5f58d1f3b 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.5.14.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.5.14.bb
> @@ -4,7 +4,7 @@ as defined by RFC4880 (also known as PGP). GnuPG allows y=
ou to encrypt \
>  and sign your data and communications; it features a versatile key \
>  management system, along with access modules for all kinds of public \
>  key directories."
> -HOMEPAGE =3D "http://www.gnupg.org/"
> +HOMEPAGE =3D "https://www.gnupg.org/"
>  LICENSE =3D "GPL-3.0-only & LGPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D189af8afca6d6075ba6c9e0aa8077=
626 \
>                      file://COPYING.LGPL3;md5=3Da2b6bf2cb38ee52619e60f30a=
1fc7257"
> diff --git a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb b/meta/recipe=
s-support/gnutls/libtasn1_4.20.0.bb
> index 8127ba5b1d..200bf14ffc 100644
> --- a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
> +++ b/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Library for ASN.1 and DER manipulation"
>  DESCRIPTION =3D "A highly portable C library that encodes and decodes \
>  DER/BER data following an ASN.1 schema. "
> -HOMEPAGE =3D "http://www.gnu.org/software/libtasn1/"
> +HOMEPAGE =3D "https://www.gnu.org/software/libtasn1/"
>
>  LICENSE =3D "GPL-3.0-or-later & LGPL-2.1-or-later"
>  LICENSE:${PN}-bin =3D "GPL-3.0-or-later"
> diff --git a/meta/recipes-support/gpgme/gpgme_2.0.1.bb b/meta/recipes-sup=
port/gpgme/gpgme_2.0.1.bb
> index 364147fad5..cff1870c19 100644
> --- a/meta/recipes-support/gpgme/gpgme_2.0.1.bb
> +++ b/meta/recipes-support/gpgme/gpgme_2.0.1.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "High-level GnuPG encryption/signing API"
>  DESCRIPTION =3D "GnuPG Made Easy (GPGME) is a library designed to make a=
ccess to GnuPG easier for applications. It provides a High-Level Crypto API=
 for encryption, decryption, signing, signature verification and key manage=
ment"
> -HOMEPAGE =3D "http://www.gnupg.org/gpgme.html"
> +HOMEPAGE =3D "https://www.gnupg.org/gpgme.html"
>  BUGTRACKER =3D "https://bugs.g10code.com/gnupg/index"
>
>  LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
> diff --git a/meta/recipes-support/itstool/itstool_2.0.7.bb b/meta/recipes=
-support/itstool/itstool_2.0.7.bb
> index 3f0e9aaa52..b962637951 100644
> --- a/meta/recipes-support/itstool/itstool_2.0.7.bb
> +++ b/meta/recipes-support/itstool/itstool_2.0.7.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "It extracts messages from XML files and =
outputs PO template \
>  files, then merges translations from MO files to create translated \
>  XML files. It determines what to translate and how to chunk it into \
>  messages using the W3C Internationalization Tag Set (ITS). "
> -HOMEPAGE =3D "http://itstool.org/"
> +HOMEPAGE =3D "https://itstool.org/"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "\
>      file://COPYING;md5=3D59c57b95fd7d0e9e238ebbc7ad47c5a5 \
> @@ -14,7 +14,7 @@ inherit autotools python3native
>
>  DEPENDS =3D "python3-lxml-native"
>
> -SRC_URI =3D "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2 \
> +SRC_URI =3D "https://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://0001-Fix-insufficiently-quoted-regular-expressions.pat=
ch \
>             file://0002-Switch-from-libxml2-to-lxml.patch \
>             file://0003-Fix-element-check.patch \
> diff --git a/meta/recipes-support/libassuan/libassuan_3.0.2.bb b/meta/rec=
ipes-support/libassuan/libassuan_3.0.2.bb
> index 0d2ccce989..5d4e9140f8 100644
> --- a/meta/recipes-support/libassuan/libassuan_3.0.2.bb
> +++ b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "IPC library used by GnuPG and GPGME"
>  DESCRIPTION =3D "A small library implementing the so-called Assuan proto=
col. \
>  This protocol is used for IPC between most newer GnuPG components. \
>  Both, server and client side functions are provided. "
> -HOMEPAGE =3D "http://www.gnupg.org/related_software/libassuan/"
> +HOMEPAGE =3D "https://www.gnupg.org/related_software/libassuan/"
>  BUGTRACKER =3D "https://bugs.g10code.com/gnupg/index"
>
>  LICENSE =3D "GPL-3.0-or-later & LGPL-2.1-or-later"
> diff --git a/meta/recipes-support/libcap/libcap_2.77.bb b/meta/recipes-su=
pport/libcap/libcap_2.77.bb
> index 9968cd5f50..cc72890d6b 100644
> --- a/meta/recipes-support/libcap/libcap_2.77.bb
> +++ b/meta/recipes-support/libcap/libcap_2.77.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Library for getting/setting POSIX.1e capabil=
ities"
>  DESCRIPTION =3D "A library providing the API to access POSIX capabilitie=
s. \
>  These allow giving various kinds of specific privileges to individual \
>  users, without giving them full root permissions."
> -HOMEPAGE =3D "http://sites.google.com/site/fullycapable/"
> +HOMEPAGE =3D "https://sites.google.com/site/fullycapable/"
>
>  # The library is BSD | GPLv2, the PAM module is BSD | LGPLv2+
>  LICENSE =3D "(BSD-3-Clause | GPL-2.0-only) & (BSD-3-Clause | LGPL-2.0-or=
-later)"
> diff --git a/meta/recipes-support/libdaemon/libdaemon_0.14.bb b/meta/reci=
pes-support/libdaemon/libdaemon_0.14.bb
> index a0378802c9..b452d48a8d 100644
> --- a/meta/recipes-support/libdaemon/libdaemon_0.14.bb
> +++ b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
> @@ -4,12 +4,12 @@ facilities for logging and a signal handler to enable g=
raceful shutdown, \
>  as well as file locking to ensure that only a single copy of a given dae=
mon \
>  is running at a time."
>  SECTION =3D "libs"
> -HOMEPAGE =3D "http://0pointer.de/lennart/projects/libdaemon/"
> +HOMEPAGE =3D "https://0pointer.de/lennart/projects/libdaemon/"
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1 \
>                      file://libdaemon/daemon.h;beginline=3D9;endline=3D21=
;md5=3Dbd9fbe57cd96d1a5848a8ba12d9a6bf4"
>
> -SRC_URI =3D "http://0pointer.de/lennart/projects/libdaemon/libdaemon-${P=
V}.tar.gz \
> +SRC_URI =3D "https://0pointer.de/lennart/projects/libdaemon/libdaemon-${=
PV}.tar.gz \
>             file://fix-includes.patch \
>            "
>
> diff --git a/meta/recipes-support/libevdev/libevdev_1.13.6.bb b/meta/reci=
pes-support/libevdev/libevdev_1.13.6.bb
> index 4a2cfee4c1..51899e1ee7 100644
> --- a/meta/recipes-support/libevdev/libevdev_1.13.6.bb
> +++ b/meta/recipes-support/libevdev/libevdev_1.13.6.bb
> @@ -2,14 +2,14 @@ SUMMARY =3D "Wrapper library for evdev devices"
>  DESCRIPTION =3D "A library for handling evdev kernel devices. It abstrac=
ts \
>  the evdev ioctls through type-safe interfaces and provides functions \
>  to change the appearance of the device."
> -HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/libevdev/"
> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/libevdev/"
>  SECTION =3D "libs"
>
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D80c550b3197bcb8da7d7557ebcc3f=
c46 \
>                      "
>
> -SRC_URI =3D "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
> +SRC_URI =3D "https://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
>  SRC_URI[sha256sum] =3D "73f215eccbd8233f414737ac06bca2687e67c44b97d2d757=
6091aa9718551110"
>
>  inherit autotools pkgconfig
> diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/reci=
pes-support/libevent/libevent_2.1.12.bb
> index 4e32b5217e..151774e866 100644
> --- a/meta/recipes-support/libevent/libevent_2.1.12.bb
> +++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
> @@ -4,7 +4,7 @@ notification. The libevent API provides a mechanism to ex=
ecute a callback \
>  function when a specific event occurs on a file descriptor or after a \
>  timeout has been reached. libevent also supports callbacks triggered \
>  by signals and regular timeouts"
> -HOMEPAGE =3D "http://libevent.org/"
> +HOMEPAGE =3D "https://libevent.org/"
>  BUGTRACKER =3D "https://github.com/libevent/libevent/issues"
>  SECTION =3D "libs"
>
> diff --git a/meta/recipes-support/libffi/libffi_3.5.2.bb b/meta/recipes-s=
upport/libffi/libffi_3.5.2.bb
> index f648a33a46..12784a4c5b 100644
> --- a/meta/recipes-support/libffi/libffi_3.5.2.bb
> +++ b/meta/recipes-support/libffi/libffi_3.5.2.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "A portable foreign function interface library"
> -HOMEPAGE =3D "http://sourceware.org/libffi/"
> +HOMEPAGE =3D "https://sourceware.org/libffi/"
>  DESCRIPTION =3D "The `libffi' library provides a portable, high level pr=
ogramming interface to various calling \
>  conventions.  This allows a programmer to call any function specified by=
 a call interface description at run \
>  time. FFI stands for Foreign Function Interface.  A foreign function int=
erface is the popular name for the \
> diff --git a/meta/recipes-support/libfm/libfm-extra_1.3.2.bb b/meta/recip=
es-support/libfm/libfm-extra_1.3.2.bb
> index 5bf2f0f502..393caea182 100644
> --- a/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
> +++ b/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Library for file management"
>  DESCRIPTION =3D "Contains a library and other files required by menu-cac=
he-gen libexec of menu-cache-1.1.0. "
> -HOMEPAGE =3D "http://pcmanfm.sourceforge.net/"
> +HOMEPAGE =3D "https://pcmanfm.sourceforge.net/"
>
>  LICENSE =3D "LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://src/fm-extra.h;beginline=3D8;endline=3D21;m=
d5=3Def1f84da64b3c01cca447212f7ef6007"
> diff --git a/meta/recipes-support/libfm/libfm_1.3.2.bb b/meta/recipes-sup=
port/libfm/libfm_1.3.2.bb
> index ab29ce4b40..02b004926b 100644
> --- a/meta/recipes-support/libfm/libfm_1.3.2.bb
> +++ b/meta/recipes-support/libfm/libfm_1.3.2.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Library for file management"
>  DESCRIPTION =3D "LibFM provides file management functions built on top o=
f Glib/GIO \
>  giving a convenient higher-level API."
> -HOMEPAGE =3D "http://pcmanfm.sourceforge.net/"
> +HOMEPAGE =3D "https://pcmanfm.sourceforge.net/"
>
>  LICENSE =3D "GPL-2.0-or-later & LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4641e94ec96f98fabc56ff9cc48be=
14b \
> diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb b/meta/re=
cipes-support/libgcrypt/libgcrypt_1.11.2.bb
> index d0236b58b3..b2a54a2fa0 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb
> +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "General purpose cryptographic library based =
on the code from GnuPG"
>  DESCRIPTION =3D "A cryptography library developed as a separated module =
of GnuPG. \
>  It can also be used independently of GnuPG, but depends on its error-rep=
orting \
>  library Libgpg-error."
> -HOMEPAGE =3D "http://directory.fsf.org/project/libgcrypt/"
> +HOMEPAGE =3D "https://directory.fsf.org/project/libgcrypt/"
>  BUGTRACKER =3D "https://bugs.g10code.com/gnupg/index"
>  SECTION =3D "libs"
>
> diff --git a/meta/recipes-support/libgit2/libgit2_1.9.2.bb b/meta/recipes=
-support/libgit2/libgit2_1.9.2.bb
> index 2e023b44ff..de756ad31e 100644
> --- a/meta/recipes-support/libgit2/libgit2_1.9.2.bb
> +++ b/meta/recipes-support/libgit2/libgit2_1.9.2.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "the Git linkable library"
> -HOMEPAGE =3D "http://libgit2.github.com/"
> +HOMEPAGE =3D "https://libgit2.github.com/"
>  LICENSE =3D "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause &=
 Zlib & ISC & LGPL-2.1-or-later & CC0-1.0 & BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8eacfdc17c8f4d219e131a073973b=
97d"
>
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb b/met=
a/recipes-support/libgpg-error/libgpg-error_1.58.bb
> index d42a9028e8..9c87091114 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Small library that defines common error values for all GnuP=
G components"
>  DESCRIPTION =3D "Contains common error codes and error handling function=
s used by GnuPG, Libgcrypt, GPGME and more packages. "
> -HOMEPAGE =3D "http://www.gnupg.org/related_software/libgpg-error/"
> +HOMEPAGE =3D "https://www.gnupg.org/related_software/libgpg-error/"
>  BUGTRACKER =3D "https://bugs.g10code.com/gnupg/index"
>
>  LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
> diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3=
.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
> index 7890dfa5c7..be46e34d7c 100644
> --- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
> +++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "The Jitter RNG provides a noise source u=
sing the CPU execution ti
>  It does not depend on any system resource other than a high-resolution t=
ime \
>  stamp. It is a small-scale, yet fast entropy source that is viable in al=
most \
>  all environments and on a lot of CPU architectures."
> -HOMEPAGE =3D "http://www.chronox.de/jent.html"
> +HOMEPAGE =3D "https://www.chronox.de/jent.html"
>  LICENSE =3D "GPL-2.0-or-later | BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De01027c4ad1fe5a4768f8488c945d=
491 \
>                      file://LICENSE.gplv2;md5=3Deb723b61539feef013de476e6=
8b5c50a \
> diff --git a/meta/recipes-support/libksba/libksba_1.6.7.bb b/meta/recipes=
-support/libksba/libksba_1.6.7.bb
> index d97fa84977..2d0117ea6d 100644
> --- a/meta/recipes-support/libksba/libksba_1.6.7.bb
> +++ b/meta/recipes-support/libksba/libksba_1.6.7.bb
> @@ -4,7 +4,7 @@ CMS data and related objects more easy. It provides a hig=
hlevel interface to \
>  the implemented protocols and presents the data in a consistent way. The=
 \
>  library does not rely on another cryptographic library but provides \
>  hooks for easy integration with Libgcrypt. "
> -HOMEPAGE =3D "http://www.gnupg.org/related_software/libksba/"
> +HOMEPAGE =3D "https://www.gnupg.org/related_software/libksba/"
>  LICENSE =3D "GPL-3.0-or-later & (GPL-2.0-or-later | LGPL-3.0-or-later)"
>  LICENSE:${PN} =3D "GPL-2.0-or-later | LGPL-3.0-or-later"
>  LICENSE:${PN}-doc =3D "GPL-3.0-or-later"
> diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb b/=
meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb
> index fdca510d0b..ec0a3db0d2 100644
> --- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb
> +++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "A small C library that is supposed to make it easy to run a=
n HTTP server as part of another application"
> -HOMEPAGE =3D "http://www.gnu.org/software/libmicrohttpd/"
> +HOMEPAGE =3D "https://www.gnu.org/software/libmicrohttpd/"
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D57d09285feac8a64efa878e692b14=
f36"
>  SECTION =3D "net"
> diff --git a/meta/recipes-support/libmpc/libmpc.inc b/meta/recipes-suppor=
t/libmpc/libmpc.inc
> index bc564d4dca..d8b1c4e34a 100644
> --- a/meta/recipes-support/libmpc/libmpc.inc
> +++ b/meta/recipes-support/libmpc/libmpc.inc
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "C library for complex number arithmetic with arbitrary prec=
ision and correct rounding"
>  DESCRIPTION =3D "Mpc is a C library for the arithmetic of complex number=
s with arbitrarily high precision and correct rounding of the result. It is=
 built upon and follows the same principles as Mpfr"
> -HOMEPAGE =3D "http://www.multiprecision.org/"
> +HOMEPAGE =3D "https://www.multiprecision.org/"
>  LICENSE =3D "LGPL-3.0-only"
>  SECTION =3D "libs"
>
> diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipe=
s-support/libpcre/libpcre2_10.47.bb
> index 2ac249f05b..db90426acd 100644
> --- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
> +++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
> @@ -5,7 +5,7 @@ deployed PCRE library's API and feature are stable, futur=
e releases \
>   will be for bugfixes only. All new future features will be to PCRE2, \
>  not the original PCRE 8.x series."
>  SUMMARY =3D "Perl Compatible Regular Expressions version 2"
> -HOMEPAGE =3D "http://www.pcre.org"
> +HOMEPAGE =3D "https://www.pcre.org"
>  SECTION =3D "devel"
>  LICENSE =3D "BSD-3-Clause & BSD-2-Clause & MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENCE.md;md5=3D6720bf3bcff57543b915c2b22e=
526df0 \
> diff --git a/meta/recipes-support/libpcre/libpcre_8.45.bb b/meta/recipes-=
support/libpcre/libpcre_8.45.bb
> index c5ecbd8cf2..c6bf7c3e1b 100644
> --- a/meta/recipes-support/libpcre/libpcre_8.45.bb
> +++ b/meta/recipes-support/libpcre/libpcre_8.45.bb
> @@ -3,7 +3,7 @@ expression pattern matching using the same syntax and sem=
antics as Perl 5. PCRE
>  has its own native API, as well as a set of wrapper functions that corre=
spond \
>  to the POSIX regular expression API."
>  SUMMARY =3D "Perl Compatible Regular Expressions"
> -HOMEPAGE =3D "http://www.pcre.org"
> +HOMEPAGE =3D "https://www.pcre.org"
>  SECTION =3D "devel"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Db5d5d1a69a24ea2718263f1ff85a1=
c58"
> diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipe=
s-support/libssh2/libssh2_1.11.1.bb
> index 11d7448687..45dc6527f6 100644
> --- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
> +++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "A client-side C library implementing the SSH2 protocol"
> -HOMEPAGE =3D "http://www.libssh2.org/"
> +HOMEPAGE =3D "https://www.libssh2.org/"
>  SECTION =3D "libs"
>
>  DEPENDS =3D "zlib"
> @@ -7,7 +7,7 @@ DEPENDS =3D "zlib"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2fbf8f834408079bf1fcbadb9814b=
1bc"
>
> -SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz \
> +SRC_URI =3D "https://www.libssh2.org/download/${BP}.tar.gz \
>             file://run-ptest \
>             file://0001-Return-error-if-user-KEX-methods-are-invalid.patc=
h \
>             "
> diff --git a/meta/recipes-support/libunistring/libunistring_1.4.1.bb b/me=
ta/recipes-support/libunistring/libunistring_1.4.1.bb
> index 791f4983ed..c74b887dd9 100644
> --- a/meta/recipes-support/libunistring/libunistring_1.4.1.bb
> +++ b/meta/recipes-support/libunistring/libunistring_1.4.1.bb
> @@ -11,7 +11,7 @@ DESCRIPTION =3D "Text files are nowadays usually encode=
d in Unicode, and may\
>   Unicode strings and for manipulating C strings according to the Unicode=
\
>   standard.  This package contains documentation."
>
> -HOMEPAGE =3D "http://www.gnu.org/software/libunistring/"
> +HOMEPAGE =3D "https://www.gnu.org/software/libunistring/"
>  SECTION =3D "devel"
>  LICENSE =3D "LGPL-3.0-or-later | GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D6a6a8e020838b23406c81b19c=
1d46df6 \
> diff --git a/meta/recipes-support/libunwind/libunwind_1.8.3.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.8.3.bb
> index bc1a108e42..1b3e63283e 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.8.3.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Library for obtaining the call-chain of a program"
>  DESCRIPTION =3D "a portable and efficient C programming interface (API) =
to determine the call-chain of a program"
> -HOMEPAGE =3D "http://www.nongnu.org/libunwind"
> +HOMEPAGE =3D "https://www.nongnu.org/libunwind"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d80c8ed4062b8339b715f90fa68c=
c9f"
>  DEPENDS:append:libc-musl =3D " libucontext"
> diff --git a/meta/recipes-support/liburcu/liburcu_0.15.5.bb b/meta/recipe=
s-support/liburcu/liburcu_0.15.5.bb
> index 94124c6391..cac40cae86 100644
> --- a/meta/recipes-support/liburcu/liburcu_0.15.5.bb
> +++ b/meta/recipes-support/liburcu/liburcu_0.15.5.bb
> @@ -2,8 +2,8 @@ SUMMARY =3D "Userspace RCU (read-copy-update) library"
>  DESCRIPTION =3D "A userspace RCU (read-copy-update) library. This data \
>  synchronization library provides read-side access which scales linearly =
\
>  with the number of cores. "
> -HOMEPAGE =3D "http://lttng.org/urcu"
> -BUGTRACKER =3D "http://lttng.org/project/issues"
> +HOMEPAGE =3D "https://lttng.org/urcu"
> +BUGTRACKER =3D "https://lttng.org/project/issues"
>
>  LICENSE =3D "LGPL-2.1-or-later & MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dc2a92498b6e88e276f98687799=
5425b8 \
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dc2a92498b=
6e88e276f986877995425b8 \
>                      file://include/urcu/uatomic/x86.h;beginline=3D1;endl=
ine=3D6;md5=3D358d69272ba7b5f85e29e342430d440c \
>                      "
>
> -SRC_URI =3D "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
> +SRC_URI =3D "https://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
>
>  SRC_URI[sha256sum] =3D "b2f787a8a83512c32599e71cdabcc5131464947b82014896=
bd11413b2d782de1"
>
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.29.bb b/meta/recipes=
-support/libusb/libusb1_1.0.29.bb
> index 856e32d1c6..cd13ce3553 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.29.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.29.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Userspace library to access USB (version 1.0=
)"
>  DESCRIPTION =3D "A cross-platform library to access USB devices from Lin=
ux, \
>  macOS, Windows, OpenBSD/NetBSD, Haiku and Solaris userspace."
>  HOMEPAGE =3D "https://libusb.info"
> -BUGTRACKER =3D "http://www.libusb.org/report"
> +BUGTRACKER =3D "https://www.libusb.org/report"
>  SECTION =3D "libs"
>
>  LICENSE =3D "LGPL-2.1-or-later"
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.45.bb b/meta/recipe=
s-support/libxslt/libxslt_1.1.45.bb
> index 449ea2dd24..2aa6962c89 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.45.bb
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.45.bb
> @@ -4,7 +4,7 @@ XSLT itself is a an XML language to define transformation=
 for XML. Libxslt is ba
>  libxml2 the XML C library developed for the GNOME project. It also imple=
ments most of \
>  the EXSLT set of processor-portable extensions functions and some of Sax=
on's evaluate \
>  and expressions extensions."
> -HOMEPAGE =3D "http://xmlsoft.org/XSLT/"
> +HOMEPAGE =3D "https://xmlsoft.org/XSLT/"
>  BUGTRACKER =3D "https://bugzilla.gnome.org/"
>
>  LICENSE =3D "MIT"
> diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/=
lzo/lzo_2.10.bb
> index fbf9f2dbac..59093b7ebb 100644
> --- a/meta/recipes-support/lzo/lzo_2.10.bb
> +++ b/meta/recipes-support/lzo/lzo_2.10.bb
> @@ -1,13 +1,13 @@
>  SUMMARY =3D "Lossless data compression library"
>  DESCRIPTION =3D "A portable lossless data compression library written in=
 \
>  ANSI C that offers pretty fast compression and *extremely* fast decompre=
ssion. "
> -HOMEPAGE =3D "http://www.oberhumer.com/opensource/lzo/"
> +HOMEPAGE =3D "https://www.oberhumer.com/opensource/lzo/"
>  SECTION =3D "libs"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
>                      file://src/lzo_init.c;beginline=3D5;endline=3D25;md5=
=3D9ae697ca01829b0a383c5d2d163e0108"
>
> -SRC_URI =3D "http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.=
tar.gz \
> +SRC_URI =3D "https://www.oberhumer.com/opensource/lzo/download/lzo-${PV}=
.tar.gz \
>             file://0001-Use-memcpy-instead-of-reinventing-it.patch \
>            file://0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch=
 \
>             file://run-ptest \
> diff --git a/meta/recipes-support/lzop/lzop_1.04.bb b/meta/recipes-suppor=
t/lzop/lzop_1.04.bb
> index c32aa53422..ed326d17d3 100644
> --- a/meta/recipes-support/lzop/lzop_1.04.bb
> +++ b/meta/recipes-support/lzop/lzop_1.04.bb
> @@ -5,14 +5,14 @@ gzip are much higher compression and decompression spee=
d at the cost of some \n\
>  compression ratio. The lzop compression utility was designed with the go=
als \n\
>  of reliability, speed, portability and with reasonable drop-in compatibi=
lity \n\
>  to gzip."
> -HOMEPAGE =3D "http://www.lzop.org/"
> +HOMEPAGE =3D "https://www.lzop.org/"
>  DEPENDS +=3D "lzo"
>
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
>                      file://src/lzop.c;beginline=3D5;endline=3D21;md5=3D2=
3d767de7754eb24b9e900b025cf7fc8"
>
> -SRC_URI =3D "http://www.lzop.org/download/${BP}.tar.gz \
> +SRC_URI =3D "https://www.lzop.org/download/${BP}.tar.gz \
>             file://acinclude.m4 \
>            "
>  SRC_URI[sha256sum] =3D "7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe177=
4d95147f305a2f41"
> diff --git a/meta/recipes-support/mpfr/mpfr_4.2.2.bb b/meta/recipes-suppo=
rt/mpfr/mpfr_4.2.2.bb
> index 4d1747c3fd..e73c207de9 100644
> --- a/meta/recipes-support/mpfr/mpfr_4.2.2.bb
> +++ b/meta/recipes-support/mpfr/mpfr_4.2.2.bb
> @@ -16,6 +16,6 @@ DEPENDS =3D "gmp"
>  SRC_URI =3D "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
>  SRC_URI[sha256sum] =3D "b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa=
0a6869ad81c6ce01"
>
> -UPSTREAM_CHECK_URI =3D "http://www.mpfr.org/mpfr-current/"
> +UPSTREAM_CHECK_URI =3D "https://www.mpfr.org/mpfr-current/"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-support/nettle/nettle_3.10.2.bb b/meta/recipes-=
support/nettle/nettle_3.10.2.bb
> index e651f68cb9..f1282d506d 100644
> --- a/meta/recipes-support/nettle/nettle_3.10.2.bb
> +++ b/meta/recipes-support/nettle/nettle_3.10.2.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "A low level cryptographic library"
>  DESCRIPTION =3D "Nettle is a cryptographic library that is designed to f=
it easily in more or less any context: In crypto toolkits for object-orient=
ed languages (C++, Python, Pike, ...), in applications like LSH or GNUPG, o=
r even in kernel space."
> -HOMEPAGE =3D "http://www.lysator.liu.se/~nisse/nettle/"
> +HOMEPAGE =3D "https://www.lysator.liu.se/~nisse/nettle/"
>  DESCRIPTION =3D "It tries to solve a problem of providing a common set o=
f \
>  cryptographic algorithms for higher-level applications by implementing a=
 \
>  context-independent set of cryptographic algorithms"
> diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/=
meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> index 9e41c5b9ed..3949317d40 100644
> --- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> +++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> @@ -2,11 +2,11 @@ SUMMARY =3D "Name Service Switch module for resolving t=
he local hostname"
>  DESCRIPTION =3D "plugin for the GNU Name Service Switch (NSS) functional=
ity of \
>  the GNU C Library (glibc) providing host name resolution for the locally=
 \
>  configured system hostname as returned by gethostname(2)."
> -HOMEPAGE =3D "http://0pointer.de/lennart/projects/nss-myhostname/"
> +HOMEPAGE =3D "https://0pointer.de/lennart/projects/nss-myhostname/"
>  LICENSE =3D "LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
>
> -SRC_URI =3D "http://0pointer.de/lennart/projects/nss-myhostname/nss-myho=
stname-${PV}.tar.gz \
> +SRC_URI =3D "https://0pointer.de/lennart/projects/nss-myhostname/nss-myh=
ostname-${PV}.tar.gz \
>             "
>
>  SRC_URI[sha256sum] =3D "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d=
3a7f6c4d67e7caf2"
> diff --git a/meta/recipes-support/numactl/numactl_2.0.19.bb b/meta/recipe=
s-support/numactl/numactl_2.0.19.bb
> index 38c09199c3..a0d99b3b41 100644
> --- a/meta/recipes-support/numactl/numactl_2.0.19.bb
> +++ b/meta/recipes-support/numactl/numactl_2.0.19.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Development package for building Applications that use numa=
"
> -HOMEPAGE =3D "http://oss.sgi.com/projects/libnuma/"
> +HOMEPAGE =3D "https://oss.sgi.com/projects/libnuma/"
>  DESCRIPTION =3D "Simple NUMA policy support. It consists of a numactl pr=
ogram \
>  to run other programs with a specific NUMA policy and a libnuma to do \
>  allocations with NUMA policy in applications."
> diff --git a/meta/recipes-support/pinentry/pinentry_1.3.2.bb b/meta/recip=
es-support/pinentry/pinentry_1.3.2.bb
> index a5c8d2258a..5ecd2259cc 100644
> --- a/meta/recipes-support/pinentry/pinentry_1.3.2.bb
> +++ b/meta/recipes-support/pinentry/pinentry_1.3.2.bb
> @@ -2,9 +2,9 @@ SUMMARY =3D "Collection of simple PIN or passphrase entry=
 dialogs"
>  DESCRIPTION =3D "\
>         Pinentry is a collection of simple PIN or passphrase entry dialog=
s which \
>         utilize the Assuan protocol as described by the aegypten project;=
 see \
> -       http://www.gnupg.org/aegypten/ for details."
> +       https://www.gnupg.org/aegypten/ for details."
>
> -HOMEPAGE =3D "http://www.gnupg.org/related_software/pinentry/index.en.ht=
ml"
> +HOMEPAGE =3D "https://www.gnupg.org/related_software/pinentry/index.en.h=
tml"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
> diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-suppor=
t/popt/popt_1.19.bb
> index 525bf553b1..567547fb3c 100644
> --- a/meta/recipes-support/popt/popt_1.19.bb
> +++ b/meta/recipes-support/popt/popt_1.19.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De0206ac9471d06=
667e076212db20c5f4"
>
>  DEPENDS =3D "virtual/libiconv"
>
> -SRC_URI =3D "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
> +SRC_URI =3D "https://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
>             file://run-ptest \
>             "
>  SRC_URI[sha256sum] =3D "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fda=
d3ca2758c63240f9"
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb b/=
meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
> index 89f85e2455..67eb12bd7e 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "A C program to run all installed ptests"
>  DESCRIPTION =3D "The ptest-runner2 package installs a ptest-runner \
>  program which loops through all installed ptest test suites and \
>  runs them in sequence."
> -HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/ab=
out/"
> +HOMEPAGE =3D "https://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/a=
bout/"
>
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
> diff --git a/meta/recipes-support/re2c/re2c_4.3.1.bb b/meta/recipes-suppo=
rt/re2c/re2c_4.3.1.bb
> index bead73279f..6cf3a8bc05 100644
> --- a/meta/recipes-support/re2c/re2c_4.3.1.bb
> +++ b/meta/recipes-support/re2c/re2c_4.3.1.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Tool for writing very fast and very flexible scanners"
>  DESCRIPTION =3D "A free and open-source lexer generator for C, C++ and G=
o. It compiles regular expressions to determinisitic finite automata and en=
codes the automata in the form of a program in the target language. Unlike =
any other such tool, re2c focuses on generating high efficient code for reg=
ular expression matching. As a result this allows a much broader range of u=
se than any traditional lexer."
> -HOMEPAGE =3D "http://re2c.org/"
> +HOMEPAGE =3D "https://re2c.org/"
>  BUGTRACKER =3D "https://github.com/skvadrik/re2c/issues"
>  SECTION =3D "devel"
>  LICENSE =3D "PD"
> diff --git a/meta/recipes-support/sass/libsass_3.6.6.bb b/meta/recipes-su=
pport/sass/libsass_3.6.6.bb
> index 26f549e53f..212a55ec31 100644
> --- a/meta/recipes-support/sass/libsass_3.6.6.bb
> +++ b/meta/recipes-support/sass/libsass_3.6.6.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "C/C++ port of the Sass CSS precompiler"
> -HOMEPAGE =3D "http://sass-lang.com/libsass"
> +HOMEPAGE =3D "https://sass-lang.com/libsass"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f34396ca205f5e119ee77aae91fa=
27d"
>
> diff --git a/meta/recipes-support/serf/serf_1.3.10.bb b/meta/recipes-supp=
ort/serf/serf_1.3.10.bb
> index c6b51452aa..dbeddc7b4f 100644
> --- a/meta/recipes-support/serf/serf_1.3.10.bb
> +++ b/meta/recipes-support/serf/serf_1.3.10.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "The Apache Serf library is a C-based HTT=
P client library built up
>  Portable Runtime (APR) library. It multiplexes connections, running the =
\
>  read/write communication asynchronously. Memory copies and transformatio=
ns are \
>  kept to a minimum to provide high performance operation."
> -HOMEPAGE =3D "http://serf.apache.org/"
> +HOMEPAGE =3D "https://serf.apache.org/"
>  SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://norpath.patch \
>             file://env.patch \
> diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.b=
b b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
> index f307aca35d..755b9b9331 100644
> --- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Shared MIME type database and specification"
>  DESCRIPTION =3D "The shared-mime-info package contains the core database=
 of common types."
> -HOMEPAGE =3D "http://freedesktop.org/wiki/Software/shared-mime-info"
> +HOMEPAGE =3D "https://freedesktop.org/wiki/Software/shared-mime-info"
>  SECTION =3D "base"
>
>  LICENSE =3D "GPL-2.0-only"
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-suppo=
rt/sqlite/sqlite3.inc
> index 94dbc38ec5..0943c77ee0 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Embeddable SQL database engine"
>  DESCRIPTION =3D "A library that implements a small, fast, self-contained=
, high-reliability, full-featured, SQL database engine. SQLite is the most =
used database engine in the world. SQLite is built into all mobile phones a=
nd most computers and comes bundled inside countless other applications tha=
t people use every day"
> -HOMEPAGE =3D "http://www.sqlite.org"
> +HOMEPAGE =3D "https://www.sqlite.org"
>  SECTION =3D "libs"
>
>  PE =3D "3"
> @@ -16,7 +16,7 @@ SQLITE_PV =3D "${@sqlite_download_version(d)}"
>  S =3D "${UNPACKDIR}/sqlite-autoconf-${SQLITE_PV}"
>  B =3D "${WORKDIR}/build"
>
> -UPSTREAM_CHECK_URI =3D "http://www.sqlite.org/"
> +UPSTREAM_CHECK_URI =3D "https://www.sqlite.org/"
>  UPSTREAM_CHECK_REGEX =3D "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
>
>  CVE_PRODUCT =3D "sqlite"
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.2.bb b/meta/recipes=
-support/sqlite/sqlite3_3.51.2.bb
> index 6837293f6a..a9cdd18d26 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.51.2.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.51.2.bb
> @@ -3,7 +3,7 @@ require sqlite3.inc
>  LICENSE =3D "PD"
>  LIC_FILES_CHKSUM =3D "file://sqlite3.h;endline=3D11;md5=3D786d3dc581eff0=
3f4fd9e4a77ed00c66"
>
> -SRC_URI =3D "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar=
.gz"
> +SRC_URI =3D "https://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.ta=
r.gz"
>  SRC_URI[sha256sum] =3D "fbd89f866b1403bb66a143065440089dd76100f2238314d9=
2274a082d4f2b7bb"
>
>  SRC_URI +=3D "file://0001-Add-option-to-disable-zlib.patch"
> diff --git a/meta/recipes-support/taglib/taglib_2.1.1.bb b/meta/recipes-s=
upport/taglib/taglib_2.1.1.bb
> index 6b700578b8..a6890a100c 100644
> --- a/meta/recipes-support/taglib/taglib_2.1.1.bb
> +++ b/meta/recipes-support/taglib/taglib_2.1.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Library for reading and editing the meta-data of popular au=
dio formats"
>  DESCRIPTION =3D "Platform-independent library (tested on Windows/Linux) =
for reading and writing metadata in media files, including video, audio, an=
d photo formats. This is a convenient one-stop-shop to present or tag all y=
our media collection, regardless of which format/container these might use.=
 You can read/write the standard or more common tags/properties of a media,=
 or you can also create and retrieve your own custom tags."
>  SECTION =3D "libs/multimedia"
> -HOMEPAGE =3D "http://taglib.github.io/"
> +HOMEPAGE =3D "https://taglib.github.io/"
>  LICENSE =3D "LGPL-2.1-only | MPL-1.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING.LGPL;md5=3D4fbd65380cdd255951079008=
b364516c \
>                      file://COPYING.MPL;md5=3Dbfe1f75d606912a4111c90743d6=
c7325 \
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LGPL;md5=3D4fbd65380=
cdd255951079008b364516c \
>
>  DEPENDS =3D "zlib utfcpp"
>
> -SRC_URI =3D "http://taglib.github.io/releases/${BP}.tar.gz"
> +SRC_URI =3D "https://taglib.github.io/releases/${BP}.tar.gz"
>
>  SRC_URI[sha256sum] =3D "3716d31f7c83cbf17b67c8cf44dd82b2a2f17e6780472287=
a16823e70305ddba"
>
> diff --git a/meta/recipes-support/xxhash/xxhash_0.8.3.bb b/meta/recipes-s=
upport/xxhash/xxhash_0.8.3.bb
> index 15436113b1..3fc220f7a3 100644
> --- a/meta/recipes-support/xxhash/xxhash_0.8.3.bb
> +++ b/meta/recipes-support/xxhash/xxhash_0.8.3.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Extremely fast non-cryptographic hash algorithm"
>  DESCRIPTION =3D "xxHash is an extremely fast non-cryptographic hash algo=
rithm, \
>  working at speeds close to RAM limits."
> -HOMEPAGE =3D "http://www.xxhash.com/"
> +HOMEPAGE =3D "https://www.xxhash.com/"
>  LICENSE =3D "BSD-2-Clause & GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D13be6b481ff5616f77dda971191bb=
29b \
>                      file://cli/COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229563): https://lists.openembedded.org/g/openembedde=
d-core/message/229563
> Mute This Topic: https://lists.openembedded.org/mt/117303443/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

