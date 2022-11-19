Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA8AC43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:29 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.30635.1668892520907355838
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=k4+AwFuc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id 130so8025461pfu.8
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=443yfAHojNtwQTvEtM6wOtcsiHlzoCI7/VPb6h48oUY=;
        b=k4+AwFucStxOHyJP3IrYoQdwtkO5l5ckZi4gxadDdhWswwnioPpKh/ZkfLxikB1wO0
         c9QAlfdFmCBAg+80790yjCAybhy5XUrIYu1u+T++canZpJB6VU8jgq2qcHBD5OeamEm5
         r/7LlZ2gMH7n/37fso+xXUDmcl7vISz5EBjQ4gg0BJTABqwFd07S48dhY8S4+DmH1d8i
         Vf6iikBMny9rhXKty2MsLxvzYE9myPcuYR1yun/l4OrcQCW7X2Ao2omSxc1uqf7xWxjG
         77exQamsU81vvh5C8zpVj24a5eC0XQaxeBJEXvJMEd+u5BdCTNPTFdAfejubwRFiHp2i
         OlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=443yfAHojNtwQTvEtM6wOtcsiHlzoCI7/VPb6h48oUY=;
        b=2TOW5iP/hpmEfTGaJ8JkiEaI6TPyFDHQOSe1Q4BbmgQj5wH0hIoBqLSRVz8U6+9xG9
         a+dWziC92TqrXFo7nwbrs6Nx3Lyf3mQLXSSIvJT2p6EwUEswqreaNYKNH/xPaeeczGT+
         SNEXMQtx2OsY32lQmIprWWzGpAPlXcUXiuOLmuKmyAu3jKokK6o1PpJ133cbBfkwYUvq
         cC/7W3ABKM6VLxCJAfNfc0gXdJUsfV7UcQY8+/YMVZVwEe0q5J1CAb4CWsDzI73yTaXY
         oguht6J9JQVK2xF5QnfwNs3eb8kw+xPmPfEd7Xhx7fTjzHW0ONZbCLG+oA2H38Efx+zD
         R7DA==
X-Gm-Message-State: ANoB5pn0LQ27Tyln+gFaKTCvgsEZQ0lChaEWaOFxXNGndoRAj2fVPUQx
	iuaKqXWrq+FOHk3jY3pe+88tHSndGhIDgdyI2OY=
X-Google-Smtp-Source: AA0mqf5vPceL4gYlEM5QbXcyMg75yCirYDO55cRheUekAOHG9KJrhLw1WPd5VLpq1nu6JJzFXYb4jA==
X-Received: by 2002:a63:5a10:0:b0:476:c39b:bd67 with SMTP id o16-20020a635a10000000b00476c39bbd67mr1145188pgb.46.1668892519444;
        Sat, 19 Nov 2022 13:15:19 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/35] Patch review
Date: Sat, 19 Nov 2022 11:14:39 -1000
Message-Id: <cover.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173540

Please review this set of patches for langdale and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4518

The following changes since commit 9237ffc4feee2dd6ff5bdd672072509ef9e82f6d:

  build-appliance-image: Update to langdale head revision (2022-11-14 16:30:13 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Alex Kiernan (1):
  cargo_common.bbclass: Fix typos

Alexander Kanavin (9):
  go: submit patch upstream
  go: update 1.19 -> 1.19.2
  groff: submit patches upstream
  tcl: correct patch status
  lttng-tools: submit determinism.patch upstream
  kea: submit patch upstream
  ovmf: correct patches status
  libffi: submit patch upstream
  rust: submit a rewritten version of crossbeam_atomic.patch upstream

Diego Sueiro (1):
  kernel.bbclass: Include randstruct seed assets in
    STAGING_KERNEL_BUILDDIR

Jose Quaresma (1):
  archiver: avoid using machine variable as it breaks multiconfig

Kai Kang (1):
  libuv: fixup SRC_URI

Leon Anavi (1):
  get_module_deps3.py: Check attribute '__file__'

Marek Vasut (1):
  bluez5: Point hciattach bcm43xx firmware search path to /lib/firmware

Niko Mauno (1):
  systemd: Consider PACKAGECONFIG in RRECOMMENDS

Peter Bergin (1):
  gptfdisk: remove warning message from target system

Richard Purdie (6):
  lttng-modules: upgrade 2.13.5 -> 2.13.7
  bitbake.conf: Drop export of SOURCE_DATE_EPOCH_FALLBACK
  gcc-shared-source: Fix source date epoch handling
  gcc-source: Fix gengtypes race
  gcc-source: Drop gengtype manipulation
  gcc-source: Ensure deploy_source_date_epoch sstate hash doesn't change

Ross Burton (3):
  expat: upgrade to 2.5.0
  oeqa/runtime/dnf: rewrite test_dnf_installroot_usrmerge
  insane: add codeload.github.com to src-uri-bad check

Sakib Sajal (1):
  go: update 1.19.2 -> 1.19.3

Sergei Zhmylev (1):
  wic: make ext2/3/4 images reproducible

Steve Sakoman (1):
  Revert "sudo: backport fix for CVE-2022-43995"

Tim Orling (1):
  python3-mako: upgrade 1.2.2 -> 1.2.3

Wang Mingyu (4):
  bind: upgrade 9.18.7 -> 9.18.8
  inetutils: upgrade 2.3 -> 2.4
  socat: upgrade 1.7.4.3 -> 1.7.4.4
  libxcrypt: upgrade 4.4.28 -> 4.4.30

Xiangyu Chen (1):
  sudo: upgrade 1.9.11p3 -> 1.9.12p1

 meta/classes-global/insane.bbclass            |  2 +-
 meta/classes-recipe/cargo_common.bbclass      |  4 +-
 meta/classes-recipe/kernel.bbclass            | 16 ++++++
 meta/classes/archiver.bbclass                 |  2 +-
 meta/conf/bitbake.conf                        |  2 +-
 meta/lib/oeqa/runtime/cases/dnf.py            | 32 +++++------
 ...1-avoid-start-failure-with-bind-user.patch |  0
 ...d-V-and-start-log-hide-build-options.patch |  0
 ...ching-for-json-headers-searches-sysr.patch |  0
 .../bind/{bind-9.18.7 => bind-9.18.8}/bind9   |  0
 .../{bind-9.18.7 => bind-9.18.8}/conf.patch   |  0
 .../generate-rndc-key.sh                      |  0
 ...t.d-add-support-for-read-only-rootfs.patch |  0
 .../make-etc-initd-bind-stop-work.patch       |  0
 .../named.service                             |  0
 .../bind/{bind_9.18.7.bb => bind_9.18.8.bb}   |  2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |  2 +
 .../inetutils/inetutils/CVE-2022-39028.patch  | 54 -------------------
 .../{inetutils_2.3.bb => inetutils_2.4.bb}    |  3 +-
 .../kea/files/fix-multilib-conflict.patch     |  2 +-
 .../libuv/libuv_1.44.2.bb                     |  2 +-
 ...ck-getprotobynumber_r-with-AC_TRY_LI.patch | 35 ------------
 .../{socat_1.7.4.3.bb => socat_1.7.4.4.bb}    |  6 +--
 .../expat/{expat_2.4.9.bb => expat_2.5.0.bb}  |  2 +-
 ...t_4.4.28.bb => libxcrypt-compat_4.4.30.bb} |  0
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  2 +-
 ...ibxcrypt_4.4.28.bb => libxcrypt_4.4.30.bb} |  0
 ...ovmf-update-path-to-native-BaseTools.patch |  2 +-
 ...ile-adjust-to-build-in-under-bitbake.patch |  7 ++-
 meta/recipes-core/systemd/systemd_251.4.bb    |  4 +-
 ...to-deal-with-minor-change-in-libuuid.patch | 27 ++++++++++
 meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb |  1 +
 .../gcc/gcc-shared-source.inc                 | 10 ++++
 meta/recipes-devtools/gcc/gcc-source.inc      |  9 +++-
 .../go/{go-1.19.inc => go-1.19.3.inc}         |  3 +-
 ...ive_1.19.bb => go-binary-native_1.19.3.bb} |  5 +-
 ...an_1.19.bb => go-cross-canadian_1.19.3.bb} |  0
 .../{go-cross_1.19.bb => go-cross_1.19.3.bb}  |  0
 ...crosssdk_1.19.bb => go-crosssdk_1.19.3.bb} |  0
 ...{go-native_1.19.bb => go-native_1.19.3.bb} |  0
 ...o-runtime_1.19.bb => go-runtime_1.19.3.bb} |  0
 ...ent-based-hash-generation-less-pedan.patch |  8 +--
 .../go/go/filter-build-paths.patch            |  3 +-
 .../go/go/stack-protector.patch               | 32 -----------
 .../go/{go_1.19.bb => go_1.19.3.bb}           |  0
 ...n3-mako_1.2.2.bb => python3-mako_1.2.3.bb} |  2 +-
 .../python/python3/get_module_deps3.py        |  2 +-
 .../rust/rust/crossbeam_atomic.patch          |  2 +-
 .../tcl/fix_non_native_build_issue.patch      |  2 +-
 ...001-Make-manpages-mulitlib-identical.patch |  2 +-
 ...001-replace-perl-w-with-use-warnings.patch |  2 +-
 .../sudo/files/CVE-2022-43995.patch           | 54 -------------------
 meta/recipes-extended/sudo/sudo.inc           |  2 +-
 .../{sudo_1.9.11p3.bb => sudo_1.9.12p1.bb}    |  3 +-
 ...ules_2.13.5.bb => lttng-modules_2.13.7.bb} |  2 +-
 .../lttng/lttng-tools/determinism.patch       |  2 +-
 ...m-sysv-reverted-clang-VFP-mitigation.patch |  2 +-
 scripts/lib/wic/partition.py                  | 29 ++++++++--
 58 files changed, 142 insertions(+), 243 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.7.bb => bind_9.18.8.bb} (97%)
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
 rename meta/recipes-connectivity/inetutils/{inetutils_2.3.bb => inetutils_2.4.bb} (98%)
 delete mode 100644 meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.4.3.bb => socat_1.7.4.4.bb} (89%)
 rename meta/recipes-core/expat/{expat_2.4.9.bb => expat_2.5.0.bb} (91%)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.28.bb => libxcrypt-compat_4.4.30.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.28.bb => libxcrypt_4.4.30.bb} (100%)
 create mode 100644 meta/recipes-devtools/fdisk/gptfdisk/0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
 rename meta/recipes-devtools/go/{go-1.19.inc => go-1.19.3.inc} (85%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.bb => go-binary-native_1.19.3.bb} (81%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.bb => go-cross-canadian_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.bb => go-cross_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.bb => go-crosssdk_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.bb => go-native_1.19.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.bb => go-runtime_1.19.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/go/go/stack-protector.patch
 rename meta/recipes-devtools/go/{go_1.19.bb => go_1.19.3.bb} (100%)
 rename meta/recipes-devtools/python/{python3-mako_1.2.2.bb => python3-mako_1.2.3.bb} (85%)
 delete mode 100644 meta/recipes-extended/sudo/files/CVE-2022-43995.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.11p3.bb => sudo_1.9.12p1.bb} (94%)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.5.bb => lttng-modules_2.13.7.bb} (94%)

-- 
2.25.1


