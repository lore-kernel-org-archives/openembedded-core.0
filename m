Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4068CC5DF91
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 11:25:19 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5274.1787311512468676833
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 04:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IjyE4YoL;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7ee37dc91f5so648736a34.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 04:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787311511; x=1787916311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPPnyRUkGRk1VEyqfH4e00Tpnt0mSEsynPCP3OVPHeo=;
        b=IjyE4YoLt1iixiXI/0MfvCMtfWwm11Qt7TZEUXOBiMxC7nXoi4x1Bb56eoUJ6himDH
         t1Te89KRIe2hbX7dw1vHP1Ln1NKWScCN+qoPX/QXcwV447NiPie7qhDXwa4BPvxC7aGb
         sBz8+9R2xYxl5Rn27tqukp0uY33Xe8EgQQg6ymsHmlkewlNs9OMpQE2XcrMOjPI6ChZs
         bzsYFJ7jnIhLRmhqAv2E9ZMCpuyIQInHeCO64eWGYNQS3ziKJFq+zn5JUkTZnPsRqtxf
         NXsj13lo23NMkeEIouJzjXv2Pf5hLua9HwTc3iB9dHp9fCtTZZgEF+dS3yxNO7KSW2oL
         nIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787311511; x=1787916311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPPnyRUkGRk1VEyqfH4e00Tpnt0mSEsynPCP3OVPHeo=;
        b=SzJZ1wy7X2YrJ+/bD03h8A+C4NPAIfL75cJxMQIjYQmk0pD6i48M00rU7l5SRZYz1P
         aKLF7LwvDnpg3rndrCRNxFnhK55JqbYrDDZawpHJMKLZONkOlLm7z4Qg6l5rkLMy0ow+
         YiGI/LDCkNMNdkl8O2mRuy0dhc66AeP9Qd4EeLuS7Ifo2VnGkEc43WtLT9+g3F2hG+Ri
         dvrApEs2Q2rZxUboR3RwRclAHB5IGr88i0vGQVc6b6zQ1CYR1UmV119Lz6ckda7Drtqt
         k5hJ47JevzkdWnYjZ44Xufn+P4XdWXBXU9lXviobnF2/5bu57DVeD3ngz35+rPLfhg9J
         SjCQ==
X-Gm-Message-State: AOJu0YwvYAMmDBNEYl80TiWl0ePEgU1gF0sNT4A7xLcFNyNySJau4jEM
	0EePBhFPzj5q3ZSBn9Jgo0Y0Oi8XKG2lgerg2fVO97UoVw3MasDNE5vg
X-Gm-Gg: AR+sD12dpxeWTAcbPwAO/uPyICUFAipu/taAInATnsI3YsOgzWlxbDVlyC10uwsqWtv
	IB574B44AuA3SkPQCBb8JDcxJyAQqGRxZhbKZ+Zy8nfFLsVJ1ceJLTupxKYRIv+HX/zTDnyfMPk
	zK2VFl9aLasm19E8p5Wstwn++unsMpvk86w9dqHDxt6DmusCchLlFepA/cI56DtDmHDOtFIoRmz
	MTosWYPMvkmwdLKqiL7mhz6U3CjJi5Y4LlYJljy2s+ZswoBCnYF+ingjAOgR+rnIi4nHrXTSJbZ
	i/kxTZ9/duJ3h5ogmtnOjgwtBo0R6NDfMlgT+ixoMZ8d/M87URVq65AFiCQuX9fsBYG5SgMmDKZ
	k3L/6wX+eel0P9VE8k6A0LmLnQVCEebHhj/D/+u8x/bYBRtdP+c2T2gIU7oUw0kktC3/gwtwErQ
	edWmONyvA3ofGiP9VVwXXtsIUurFTsSqQaeGgGZ+bV8k/WZl2k2QB7eDsm+dCKyMvc0Xk8XDJ8e
	lTOE5DTSh5QK5Alv0gG31A/R3OS1/oguaTAuDq2uGUmMVA5jUdL4HSS06pgz0sXrWy1d2y5Uaw+
	AurHhMAyTtmxmStyeq69iX+4gPmzebanq2T2CDUjmsvNKalk48r3mIVWQfcdeU14UjPcCGTvZjv
	C+9Qy
X-Received: by 2002:a05:6830:4420:b0:7dc:e336:c828 with SMTP id 46e09a7af769-7f46158c4f6mr6081462a34.10.1787311511401;
        Fri, 21 Aug 2026 04:25:11 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f43fe70792sm7398018a34.5.2026.08.21.04.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:25:10 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel-yocto: 6.18 and 7.2 RFC/prep
Date: Fri, 21 Aug 2026 07:25:02 -0400
Message-ID: <20260821112509.861559-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 11:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243924

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

I've worked through enough issues with 7.2 and 7.2 libc-headers that
I wanted to send this series as a RFC preparation step to get the
progress visible and out for more testing. 7.2 definitely isn't ready
to be a default yet, but it is getting there.

For the fall release, we'll keep 6.18 as the LTS reference, and
7.2 will be the leading tested kernel (and -dev will be 7.3+).

This has been tested on all arches, glibc/musl, -rt/-tiny/-standard.

I'm out of the office for the next week, but will keep this
moving as best I can.

Cheers,

Bruce

openembedded-core (5):
  linux-yocto/6.18: update to v6.18.44
  linux-libc-headers: update to 7.2
  linux-yocto/7.2: introduce reference kernel recipes
  kernel-devsrc: strip riscv vdso-cfi-offsets .cmd file
  kernel-devsrc: copy arch/x86 vdso2c sources for on-target

meta-yocto (1):
  linux-yocto/6.18: update to v6.18.44

 openembedded-core:
 meta/classes/recipe_sanity.bbclass                                                                              | 21 +++++++++++++++++++++
 meta/conf/distro/include/maintainers.inc                                                                        |  1 -
 meta/lib/oe/fitimage.py                                                                                         |  4 ++--
 meta/lib/oeqa/selftest/cases/fitimage.py                                                                        |  2 +-
 meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch                               |  2 +-
 meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch                       |  2 +-
 meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch                  |  4 ++--
 meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch                  |  4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                                                                  |  2 +-
 meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch                               |  2 +-
 meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch                                         |  2 +-
 meta/recipes-connectivity/bind/{bind_9.20.27.bb => bind_9.20.26.bb}                                             |  2 +-
 meta/recipes-core/initrdscripts/initramfs-framework/udev                                                        | 32 +-------------------------------
 meta/recipes-devtools/elfutils/{elfutils_0.196.bb => elfutils_0.195.bb}                                         |  9 +++------
 meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch                                |  4 ++--
 meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch             | 35 +++++++++++++++++++++++++++++++++++
 meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch            |  2 +-
 meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch                             |  2 +-
 meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch            |  6 +++---
 meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch                    |  2 +-
 meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch                                                  |  2 +-
 meta/recipes-devtools/elfutils/files/0003-musl-utils.patch                                                      | 12 ++++++------
 meta/recipes-devtools/elfutils/files/ptest.patch                                                                |  8 ++++----
 meta/recipes-devtools/erofs-utils/{erofs-utils_1.9.4.bb => erofs-utils_1.9.3.bb}                                |  2 +-
 meta/recipes-devtools/lua/{lua_5.5.1.bb => lua_5.5.0.bb}                                                        |  6 +++---
 meta/recipes-devtools/python/python3-mako_1.4.1.bb                                                              |  2 --
 meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb                                                    |  2 +-
 meta/recipes-devtools/python/{python3-pygments_2.21.0.bb => python3-pygments_2.20.0.bb}                         |  4 +---
 meta/recipes-devtools/python/python3_3.14.7.bb                                                                  |  8 --------
 meta/recipes-devtools/qemu/{qemu-native_11.1.0.bb => qemu-native_11.0.3.bb}                                     |  0
 meta/recipes-devtools/qemu/{qemu-system-native_11.1.0.bb => qemu-system-native_11.0.3.bb}                       |  0
 meta/recipes-devtools/qemu/qemu.inc                                                                             |  5 ++++-
 meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch                 | 17 +++++------------
 meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch                       | 39 +++++++++++++++++++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch | 37 +++++++++++++++++++++++++++++++++++++
 meta/recipes-devtools/qemu/{qemu_11.1.0.bb => qemu_11.0.3.bb}                                                   |  0
 meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch             |  2 +-
 meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch                       |  2 +-
 meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch                                 |  2 +-
 meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch                                 |  2 +-
 meta/recipes-devtools/strace/strace/Makefile-ptest.patch                                                        |  6 +++---
 meta/recipes-devtools/strace/strace/ptest-spacesave.patch                                                       |  2 +-
 meta/recipes-devtools/strace/strace/run-ptest                                                                   |  2 +-
 meta/recipes-devtools/strace/strace/skip-load.patch                                                             |  2 +-
 meta/recipes-devtools/strace/strace/update-gawk-paths.patch                                                     |  2 +-
 meta/recipes-devtools/strace/{strace_7.2.bb => strace_7.1.bb}                                                   |  2 +-
 meta/recipes-extended/procps/procps/0001-testsuite-skip-pgrep-full-process-name-match-test.patch                | 39 ---------------------------------------
 meta/recipes-extended/procps/procps/0001-testsuite-skip-signal-based-kill-tests.patch                           | 54 ------------------------------------------------------
 meta/recipes-extended/procps/procps_4.0.7.bb                                                                    |  2 --
 meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch                 | 56 --------------------------------------------------------
 meta/recipes-graphics/mesa/mesa.inc                                                                             |  1 -
 meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb                                                              | 20 --------------------
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc                                                   |  2 ++
 meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.18.bb => linux-libc-headers_7.2.bb}                |  2 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb                                                                      |  5 +++++
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb                                                                |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb                                                                 | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb                                                              |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb                                                               | 34 ++++++++++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_6.18.bb                                                                   | 24 ++++++++++++------------
 meta/recipes-kernel/linux/linux-yocto_7.2.bb                                                                    | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch                                  | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta/recipes-kernel/powertop/{powertop_2.16.bb => powertop_2.15.bb}                                             | 14 +++++++-------
 meta/recipes-support/boost/boost-build-native_1.92.0.bb                                                         |  3 +--
 meta/recipes-support/boost/boost-build/add-python-numpy-include-feature.patch                                   | 74 --------------------------------------------------------------------------
 meta/recipes-support/boost/boost.inc                                                                            |  9 +--------
 66 files changed, 446 insertions(+), 395 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

