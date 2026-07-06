Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEAFC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 08:43:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.146805.1783327377040711903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 01:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ddFx575D;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so10225325e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 01:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783327375; x=1783932175; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbKEF5SZ2wUjHvEhiJLX4Vip1UWIgMyjOFa5sM3lnhI=;
        b=ddFx575DV8ohKmc0m3f8ttJoJ4AYHRPH/pRu3wIOvpapSUTlJIfiGBGUvCyB/OzZro
         oBQPhWEKp+dBr8lAQnckZRBTQe8s0nv9w/spVrkXKKZYZHtFdLZnusTb2oCa2D9DNyC+
         9wKBNUlpzfxUJOj8Vz0KlFamBZQxEaa6G5JCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327375; x=1783932175;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbKEF5SZ2wUjHvEhiJLX4Vip1UWIgMyjOFa5sM3lnhI=;
        b=oRgq1cCVxrGRejhTNdvFR9YjWnmxtsgx0pvCPVyuBAv3iz2e6B3nAlcorhh8bTzslS
         Ru7o4miFDefGdfeyiAWQP0PxNmNL36ZJMh0W7FmpTIW6nJyBiKO4tVNvjkPssTQZAWlr
         eF5imi5l0ppveiFF1gETg3krql5OOY2B5b0I1ub5lC8qa3OtKVxp5dZe9cGu0C9YAFn/
         CWgF2/vh/8lx4BF2KhwVuTKdtoG09DOLkcBE2oNwRpnbmUSrleavgeIbr9NM2SeoCSkE
         2MUnQsLAq1loLUG3FHohIHnwXNOrH9s+rwUkb3l5yYTpTxT9DGK8dBDUnTMzn4WgHQtS
         uz/A==
X-Forwarded-Encrypted: i=1; AHgh+Rr3D/7R0opc0R1VEAA002HdLai0IpR5iE6yF8eExb/Li68a11OprADlITlQBJWuBEVvx7FRLNO5u/aF+0tnGJeJyQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw92VaDWxEOJHdHV3swpaXW+6ld4spm67rGP0xLvLHX/oPIQp5/
	cWEtK1kVilXcCoX5xgLq4f6WzWn3S/kigt7WHUW71fmHfuwEikg4BAJtK47jYmYzw+I=
X-Gm-Gg: AfdE7ckwYo8C6WC7uwera6/SOSISGIkDo74eFYztcKs3VwQHe+XdDDzVNvpsGYVeHiD
	k9adiDfZI6zQT0S2+G30Lj5c3ndsNO8L9246wOe6nVIA4p4vTVPwzjtZX+b6XKyk4um2/Yo9syM
	dfYDtbKwG3CK5yZnpNUCLjVbrIAW2pSX2ejCkVU/uuC1eFE0/0zotW2GE2TJligztsKK/nyCUhq
	HSBerVhhXQYkq9uBuRU+1HzIXWNUZvjCA16ZmISkXuKLgYJKw0SQQ5DjabGA1+/qUVaUmIx8+qq
	puJyAhFJtH1sWq3VOXSC+q752Q++qKbq7pXTwnP5uAKsT1jeMStNwarbdPZes4B81qbbmpE0B99
	KxKlxnM80HktB/R3Y8x862C+YhWGv2vSI6qreMcZkCmGo+6jHTHr3sWo0dsv5GD9vRiqTdxRj32
	YIEuulvRYv+g5t/Xw=
X-Received: by 2002:a05:600c:314f:b0:493:cfd2:cd06 with SMTP id 5b1f17b1804b1-493d11cef20mr101541785e9.6.1783327375089;
        Mon, 06 Jul 2026 01:42:55 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm26667272f8f.17.2026.07.06.01.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:42:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 10:42:54 +0200
Message-Id: <DJRCSLU18FBR.Z68T4VMAV2NE@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose 00/55] Patch review
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <cover.1783289522.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 08:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240223

On Mon Jul 6, 2026 at 12:40 AM CEST, Yoann Congal wrote:
> Please review this set of changes for wrynose and have comments back by
> end of day Tuesday, July 7. Since this is a relatively big series, if
> you plan to review it but need more time to do so, ping me and I'll
> delay the pull-request.
>
> Notable changes:
> * kernel upgrade -> v6.18.35 cherry-picked from master
> * clang/llvm upgrade -> 22.1.18 (following master)
> * Licensing fixes
>
> A previous version of the series, with 4 more patches that I removed and
> should not change test outcome, passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4151
> * oe-selftest-armhost failed with Bug 16236 - AB-INT: test_list_pkg_files=
: ResourceWarning: unclosed transport
>   retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/=
builds/4280
>
> I've started a new build with this version of the series:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4156
That build failed in qemuarm64 with 16295 =E2=80=93 AB-INT: go-runtime: do_=
create_package_spdx: No SPDX document named .../package-go-runtime-staticde=
v.spdx.json
rebuilt in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/36/bui=
lds/4073

Also, I've replaced the bluez5 patches with their respective
cherry-picks from master (no code change, only signed-off-by changes)

Regards,

>
> The following changes since commit 5d1aa5c806c061a2994f4decb59016610f0932=
13:
>
>   build-appliance-image: Update to wrynose head revisions (2026-06-24 14:=
17:46 +0100)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/wrynose-n=
ut
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
wrynose-nut
>
> for you to fetch changes up to 728e70d7c681402d8e797691825bfd9929aa79cb:
>
>   clang/llvm: Upgrade to 22.1.8 release (2026-07-06 00:04:52 +0200)
>
> ----------------------------------------------------------------
>
> Alexander Kanavin (1):
>   strace: remove skip-bpf.patch
>
> Anil Dongare (4):
>   cargo: Fix CVE-2026-5222
>   cargo: Fix CVE-2026-5223
>   cups: fix CVE-2026-27447
>   cups: fix CVE-2026-41079
>
> Anton Skorup (1):
>   libxml2: patch CVE-2026-11979
>
> Ashishkumar Parmar (3):
>   qemu: Fix CVE-2026-2243
>   qemu: Fix CVE-2026-0665
>   qemu: Fix CVE-2025-14876
>
> Bruce Ashfield (8):
>   linux-yocto/6.18: update to v6.18.25
>   linux-yocto/6.18: update to v6.18.26
>   linux-yocto/6.18: update to v6.18.28
>   linux-yocto/6.18: update to v6.18.32
>   linux-yocto/6.18: qat/intel configuration warning fixes
>   linux-yocto/6.18: update to v6.18.33
>   linux-yocto/6.18: update to v6.18.34
>   linux-yocto/6.18: update to v6.18.35
>
> Daniel Turull (3):
>   libssh2: fix CVE-2026-55200
>   libssh2: fix CVE-2026-55199
>   bc: set CVE_PRODUCT
>
> Deepesh Varatharajan (1):
>   clang/llvm: Upgrade to 22.1.8 release
>
> Hiago De Franco (1):
>   nospdx: also drop do_create_recipe_sbom
>
> Himanshu Jadon (1):
>   tar: Fix CVE-2026-5704
>
> Hitendra Prajapati (2):
>   vim: fix for CVE-2026-41411 & CVE-2026-44656
>   vim: fix for CVE-2026-45130 & CVE-2026-46483
>
> Jaipaul Cheernam (2):
>   binutils: Fix CVE-2026-6846
>   cmake-native: prevent host libidn2 contamination
>
> Jinwang Li (1):
>   bluez5: fix set volume failure
>
> Jo=C3=A3o Marcos Costa (1):
>   ptest-packagelists.inc: disable glib-2.0 for RISCV64
>
> Khem Raj (1):
>   baremetal-helloworld: Fix override order
>
> Kris Gavvala (1):
>   python3: skiptest tracemalloc_track_race
>
> Mengshi Wu (1):
>   bluez5: fix gatt cache sync issue
>
> Nate Kent (1):
>   sudo: fix pam-wheel sed for sudo 1.9.17p2 sudoers
>
> Otavio Salvador (1):
>   quota: use native rpcgen and a single-word RPCGEN_CPP
>
> Peter Kjellerstedt (1):
>   common-licenses/PHP-3.0: Correct the license text
>
> Richard Purdie (3):
>   libxpm: upgrade 3.5.18 -> 3.5.19
>   python3-click: Fixes for new pytest and flaky ptest
>   sstate: Reduce native sysroot execution race potential
>
> Roland Kovacs (1):
>   gnupg: fix CVE-2026-57062
>
> Ross Burton (2):
>   tcl: disable the timer tests in run-ptest
>   libjitterentropy: fix license statement
>
> Sai Sneha (1):
>   i2c-tools: add LGPL-2.1-or-later license for libi2c
>
> Shubham Pushpkar (1):
>   libsolv: Fix CVE-2026-9149
>
> Siva Balasubramanian (1):
>   qemuboot.bbclass: add missing task dependency on kernel deploy
>
> Theo Gaige (Schneider Electric) (5):
>   dhcpcd: patch CVE-2026-56113
>   dhcpcd: patch CVE-2026-56114
>   dhcpcd: patch CVE-2026-56116
>   dhcpcd: patch CVE-2026-56117
>   perl: patch CVE-2026-8376
>
> Walter Werner Schneider (1):
>   devtool: provide explicit error for missing "script" command
>
> Wei Deng (1):
>   bluez5: set L2CAP IMTU for OBEX profile listeners
>
> Wei Gao (1):
>   dmidecode: fix x86-only tools being installed on ARM targets
>
> Xiaozhan Li (1):
>   texinfo: add missing perl module runtime dependencies
>
> Xiuzhuo Shang (1):
>   bluez5: Fix sending extra bytes with MGMT_OP_ADD_EXT_ADV_DATA
>
> Yoann Congal (1):
>   dropbear: Add missing WTFPL & Unlicense in LICENSE and
>     LIC_FILES_CHKSUM
>
>  meta/classes-global/sstate.bbclass            |   4 +
>  meta/classes-recipe/nospdx.bbclass            |   1 +
>  meta/classes-recipe/qemuboot.bbclass          |   1 +
>  meta/conf/distro/include/maintainers.inc      |   2 +-
>  .../distro/include/ptest-packagelists.inc     |   4 +-
>  meta/files/common-licenses/PHP-3.0            |  76 +--
>  meta/recipes-connectivity/bluez5/bluez5.inc   |   4 +
>  ...sending-extra-bytes-with-MGMT_OP_ADD.patch |  33 ++
>  ...2CAP-IMTU-for-OBEX-profile-listeners.patch | 118 ++++
>  ...x-stored-gatt-cache-DB-Hash-value-no.patch |  84 +++
>  ...t-volume-failure-with-invalid-device.patch |  46 ++
>  .../dhcpcd/dhcpcd_10.3.1.bb                   |   4 +
>  .../dhcpcd/files/CVE-2026-56113.patch         |  92 +++
>  .../dhcpcd/files/CVE-2026-56114.patch         |  34 ++
>  .../dhcpcd/files/CVE-2026-56116.patch         |  31 +
>  .../dhcpcd/files/CVE-2026-56117.patch         | 167 ++++++
>  .../recipes-core/dropbear/dropbear_2025.89.bb |   8 +-
>  .../libxml/libxml2/CVE-2026-11979.patch       |  81 +++
>  meta/recipes-core/libxml/libxml2_2.15.2.bb    |   1 +
>  .../meta/nativesdk-buildtools-perl-dummy.bb   |   2 +
>  .../binutils/binutils-2.46.inc                |   1 +
>  .../binutils/binutils/CVE-2026-6846.patch     |  59 ++
>  meta/recipes-devtools/clang/common-clang.inc  |   2 +-
>  meta/recipes-devtools/clang/common.inc        |   2 +-
>  .../cmake/cmake-native_4.3.1.bb               |   1 +
>  .../dmidecode/dmidecode_3.7.bb                |   1 +
>  .../i2c-tools/i2c-tools_4.4.bb                |   5 +-
>  .../perl/files/CVE-2026-8376-01.patch         |  62 ++
>  .../perl/files/CVE-2026-8376-02.patch         |  49 ++
>  meta/recipes-devtools/perl/perl_5.42.0.bb     |   2 +
>  ...7494c991c9197902fdf4995e11b2da3e9762.patch | 173 ++++++
>  .../python/python3-click/pytest-fix.patch     |  29 +
>  .../python/python3-click_8.3.1.bb             |   1 +
>  .../recipes-devtools/python/python3_3.14.5.bb |   7 +
>  meta/recipes-devtools/qemu/qemu.inc           |   4 +
>  .../qemu/qemu/CVE-2025-14876_p1.patch         |  52 ++
>  .../qemu/qemu/CVE-2025-14876_p2.patch         |  56 ++
>  .../qemu/qemu/CVE-2026-0665.patch             |  38 ++
>  .../qemu/qemu/CVE-2026-2243.patch             |  45 ++
>  .../rust/files/CVE-2026-5222.patch            |  92 +++
>  .../rust/files/CVE-2026-5223.patch            | 125 ++++
>  meta/recipes-devtools/rust/rust-source.inc    |   2 +
>  .../strace/strace/skip-bpf.patch              |  25 -
>  meta/recipes-devtools/strace/strace_6.19.bb   |   1 -
>  meta/recipes-devtools/tcltk/tcl/run-ptest     |   2 +
>  meta/recipes-devtools/tcltk8/tcl8/run-ptest   |   2 +
>  .../baremetal-helloworld_git.bb               |   2 +-
>  meta/recipes-extended/bc/bc_1.08.2.bb         |   3 +
>  meta/recipes-extended/cups/cups.inc           |   4 +
>  .../cups/CVE-2026-27447-regression_p1.patch   |  46 ++
>  .../cups/CVE-2026-27447-regression_p2.patch   |  58 ++
>  .../cups/cups/CVE-2026-27447.patch            | 120 ++++
>  .../cups/cups/CVE-2026-41079.patch            |  73 +++
>  .../libsolv/libsolv/CVE-2026-9149.patch       | 152 +++++
>  .../libsolv/libsolv_0.7.36.bb                 |   1 +
>  meta/recipes-extended/quota/quota_4.11.bb     |   6 +-
>  meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   2 +-
>  .../tar/tar/CVE-2026-5704-dependent_p1.patch  | 484 +++++++++++++++
>  .../tar/tar/CVE-2026-5704-dependent_p2.patch  | 169 ++++++
>  .../tar/tar/CVE-2026-5704-regression.patch    | 176 ++++++
>  .../tar/tar/CVE-2026-5704.patch               | 556 ++++++++++++++++++
>  meta/recipes-extended/tar/tar_1.35.bb         |   4 +
>  meta/recipes-extended/texinfo/texinfo_7.3.bb  |   4 +
>  .../{libxpm_3.5.18.bb =3D> libxpm_3.5.19.bb}    |   2 +-
>  .../linux/linux-yocto-rt_6.18.bb              |   6 +-
>  .../linux/linux-yocto-tiny_6.18.bb            |   6 +-
>  meta/recipes-kernel/linux/linux-yocto_6.18.bb |  24 +-
>  .../gnupg/gnupg/CVE-2026-57062.patch          |  43 ++
>  meta/recipes-support/gnupg/gnupg_2.5.17.bb    |   1 +
>  .../libjitterentropy_3.6.3.bb                 |   3 +-
>  .../libssh2/libssh2/CVE-2026-55199.patch      |  44 ++
>  .../libssh2/libssh2/CVE-2026-55200.patch      |  36 ++
>  .../recipes-support/libssh2/libssh2_1.11.1.bb |   2 +
>  .../vim/files/CVE-2026-41411.patch            |  75 +++
>  .../vim/files/CVE-2026-44656.patch            | 124 ++++
>  .../vim/files/CVE-2026-45130.patch            | 115 ++++
>  .../vim/files/CVE-2026-46483.patch            |  77 +++
>  meta/recipes-support/vim/vim.inc              |   4 +
>  scripts/lib/devtool/__init__.py               |   3 +
>  79 files changed, 3938 insertions(+), 118 deletions(-)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-advertis=
ing-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-profile-=
Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-src-devi=
ce-Fix-stored-gatt-cache-DB-Hash-value-no.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-transpor=
t-Fix-set-volume-failure-with-invalid-device.patch
>  create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113=
.patch
>  create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114=
.patch
>  create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116=
.patch
>  create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117=
.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-6846=
.patch
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.pat=
ch
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.pat=
ch
>  create mode 100644 meta/recipes-devtools/python/python3-click/ffcc7494c9=
91c9197902fdf4995e11b2da3e9762.patch
>  create mode 100644 meta/recipes-devtools/python/python3-click/pytest-fix=
.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.pat=
ch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.pat=
ch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch
>  create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5222.patch
>  create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5223.patch
>  delete mode 100644 meta/recipes-devtools/strace/strace/skip-bpf.patch
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regres=
sion_p1.patch
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regres=
sion_p2.patch
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447.patch
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-41079.patch
>  create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-9149.p=
atch
>  create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-dependent=
_p1.patch
>  create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-dependent=
_p2.patch
>  create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-regressio=
n.patch
>  create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704.patch
>  rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.18.bb =3D> libxpm_3.5.=
19.bb} (88%)
>  create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
>  create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55199.p=
atch
>  create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55200.p=
atch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-41411.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-44656.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-45130.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-46483.patch


--=20
Yoann Congal
Smile ECS


