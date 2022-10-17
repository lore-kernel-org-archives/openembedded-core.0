Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A95C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 23:08:46 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.693.1666048123044296697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 16:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ckhDmYHC;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id l1-20020a17090a72c100b0020a6949a66aso12361136pjk.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 16:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s0dq5D5EOSal0hnmjXNvswshqeosTOBhqSXqqwyokt8=;
        b=ckhDmYHCqKBcyMVZaXyIRVOvt2sjwSoIMF25gcWj2Q1oZuTn0NiN7f+bI62NjXhuJo
         QsoBpcc3gfQn10eADfkYUjbaNwpeXuaANDqYG37dA7c4avtxxmON2V+MPM8Ek9aemN3G
         Gypq6CBoY7MNmEa2bd6hRbJrKsBenLVXfvc4Oq0xe4dBWyuIZRekvjP/9dPyih4SURN/
         mufSekMaOJ8a30MK4YVTC4TfF9EMuYrfMUY6UzgSk6CUIDOjTfQmoRluOfPwuIdY50kJ
         ImvPrLIAkF/obg1d3bxOXhGs/v/xAvKkN1/eT9KFKOGvYikDUSy48nHcBZw/esw0aoSV
         RkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0dq5D5EOSal0hnmjXNvswshqeosTOBhqSXqqwyokt8=;
        b=QZUpFTH3RbTWQcZAy3nedGMwDqtiTBjxeuyeVtQDWSWPZARJW0CYtoiHmmGYfFlQJJ
         8GLjKbVBTg79cSz83xjJJ6FyAbgvBuIO1TJPGlVaD0SR3+u5IfWD21YNAnNY7yCpX53M
         rNBdFinjcnZdzxFCjPjj4AFOYsYbL/0ifrpuZeXXxYiK7lWb0K+c4rKtVqp28LNRkKP7
         KNOWGxfVkFuv1ou/M1sRM+NiQodkbmouigKOfgOg2TviYAG+BlGg2fhOcYHCGIxZvkyl
         lila//PCWanJDqjVEtuuxSSKG09ONBypFTbKm0EODdj7gM/zVpbQtQ071U/NByy3oqhm
         6+3g==
X-Gm-Message-State: ACrzQf3O0nuJi4rCT6+5YP4aNM+cEvqa3sMArB+2xUe0Ad/JvQz8FfI/
	6wwoLNWVwM/lHWDbLXG/rvnppBuyz03PTh3T
X-Google-Smtp-Source: AMsMyM5V6XNVP6Fpn2nkGHV/je6wUokNAEhlQ7rSHbb52fmDE4bXJn9rnyzo5FSdZdMb2L5JQVwcuA==
X-Received: by 2002:a17:903:110f:b0:178:a07e:e643 with SMTP id n15-20020a170903110f00b00178a07ee643mr13837599plh.41.1666048121567;
        Mon, 17 Oct 2022 16:08:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a694600b0020aacde1964sm10119479pjm.32.2022.10.17.16.08.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:08:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/13] Patch review
Date: Mon, 17 Oct 2022 13:08:16 -1000
Message-Id: <cover.1666047986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 23:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171918

Please review this set of patches for kirkstone and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4347

The following changes since commit e728d0965d6fda8ac54e065ca7bf7eb9da9a8170:

  coreutils: add openssl PACKAGECONFIG (2022-09-30 09:35:23 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Adrian Freihofer (1):
  own-mirrors: add crate

Bhabu Bindu (1):
  qemu: Fix CVE-2021-3611

Chen Qi (1):
  image_types_wic.bbclass: fix cross binutils dependency

He Zhe (2):
  lttng-tools: Upgrade 2.13.4 -> 2.13.8
  lttng-modules: Fix crash on powerpc64

Michael Halstead (1):
  uninative: Upgrade to 3.7 to work with glibc 2.36

Ross Burton (1):
  qemu: fix CVE-2022-2962

Teoh Jay Shen (1):
  tiff: Security fixes CVE-2022-2867,CVE-2022-2868 and CVE-2022-2869

Tim Orling (1):
  python3: upgrade 3.10.4 -> 3.10.7

Virendra Thakur (1):
  qemu: Fix CVE-2021-3750 for qemu

Xiangyu Chen (2):
  qemu: Backport patches from upstream to support float128 on qemu-ppc64
  linux-yocto-dev: add qemuarm64

pgowda (1):
  binutils : Fix CVE-2022-38128

 meta/classes/image_types_wic.bbclass          |    2 +-
 meta/classes/own-mirrors.bbclass              |    1 +
 meta/classes/sanity.bbclass                   |    2 +-
 meta/conf/distro/include/yocto-uninative.inc  |   10 +-
 .../binutils/binutils-2.38.inc                |    3 +
 .../binutils/0018-CVE-2022-38128-1.patch      |  350 ++++
 .../binutils/0018-CVE-2022-38128-2.patch      |  436 +++++
 .../binutils/0018-CVE-2022-38128-3.patch      |   95 ++
 ...h-92036-Fix-gc_fini_untrack-GH-92037.patch |   54 -
 ...report-missing-dependencies-for-disa.patch |    8 +-
 .../{python3_3.10.4.bb => python3_3.10.7.bb}  |    3 +-
 meta/recipes-devtools/qemu/qemu.inc           |   49 +
 ...ulip-Restrict-DMA-engine-to-memories.patch |   64 +
 ...end-float_exception_flags-to-16-bits.patch |   75 +
 ...32t-for-reply-queue-head-tail-values.patch |   83 +
 ...ftfloat-Add-flag-specific-to-Inf-Inf.patch |   59 +
 ...id_function_take_MemTxAttrs_argument.patch |   60 +
 ...softfloat-Add-flag-specific-to-Inf-0.patch |  126 ++
 ...et_function_take_MemTxAttrs_argument.patch |   98 ++
 ...dd-flags-specific-to-Inf-Inf-and-0-0.patch |   73 +
 ...ed_function_take_MemTxAttrs_argument.patch |   78 +
 ...-Add-flag-specific-to-signaling-nans.patch |  121 ++
 ...rw_function_take_MemTxAttrs_argument.patch |  158 ++
 ...e-float_invalid_op_addsub-for-new-fl.patch |  114 ++
 ...te_function_take_MemTxAttrs_argument.patch | 1453 +++++++++++++++++
 ...e-float_invalid_op_mul-for-new-flags.patch |   86 +
 ...ap_function_take_MemTxAttrs_argument.patch |  227 +++
 ...e-float_invalid_op_div-for-new-flags.patch |   99 ++
 ..._buf_rw_function_take_a_void_pointer.patch |   41 +
 ...arget-ppc-Update-fmadd-for-new-flags.patch |  102 ++
 ..._dma_buf_write_functions_take_a_void.patch |  167 ++
 .../0010-target-ppc-Split-out-do_fmadd.patch  |   71 +
 ...rw_function_take_MemTxAttrs_argument.patch |   91 ++
 ...s-max-min-cj-dp-to-use-VSX-registers.patch |   93 ++
 ...rw_function_take_MemTxAttrs_argument.patch |   65 +
 ...-Move-xs-max-min-cj-dp-to-decodetree.patch |  121 ++
 ...te_function_take_MemTxAttrs_argument.patch |  129 ++
 ...get-ppc-fix-xscvqpdp-register-access.patch |   41 +
 ...ad_function_take_MemTxAttrs_argument.patch |  222 +++
 ...rget-ppc-move-xscvqpdp-to-decodetree.patch |  130 ++
 ...uf_rw_function_propagate_MemTxResult.patch |   91 ++
 ...tore_fpscr-doesn-t-update-bits-0-to-.patch |   70 +
 ...ma_function_take_MemTxAttrs_argument.patch |  120 ++
 ...get-ppc-Introduce-TRANS-FLAGS-macros.patch |  133 ++
 ...ma_function_take_MemTxAttrs_argument.patch |  151 ++
 ...get-ppc-Implement-Vector-Expand-Mask.patch |  105 ++
 ...r_dma_function_propagate_MemTxResult.patch |   65 +
 ...et-ppc-Implement-Vector-Extract-Mask.patch |  141 ++
 ...r_dma_function_propagate_MemTxResult.patch |  175 ++
 ...ppc-Implement-Vector-Mask-Move-insns.patch |  187 +++
 ...ma_function_take_MemTxAttrs_argument.patch |  303 ++++
 ...xs-n-madd-am-ds-p-xs-n-msub-am-ds-p-.patch |  258 +++
 ...ma_function_take_MemTxAttrs_argument.patch |  271 +++
 ...mplement-xs-n-maddqp-o-xs-n-msubqp-o.patch |  174 ++
 ...i_dma_function_propagate_MemTxResult.patch |   47 +
 ...i_dma_function_propagate_MemTxResult.patch |  296 ++++
 .../qemu/qemu/CVE-2021-3611_1.patch           |   74 +
 .../qemu/qemu/CVE-2021-3611_2.patch           |   43 +
 .../qemu/qemu/CVE-2021-3750-1.patch           |   59 +
 .../qemu/qemu/CVE-2021-3750-2.patch           |   65 +
 .../qemu/qemu/CVE-2021-3750-3.patch           |  156 ++
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |    2 +-
 ...4-fix-kernel-crash-caused-by-do_get_.patch |   94 ++
 .../lttng/lttng-modules_2.13.4.bb             |    1 +
 ...-tools_2.13.4.bb => lttng-tools_2.13.8.bb} |    2 +-
 .../libtiff/tiff/CVE-2022-2867.patch          |  129 ++
 .../libtiff/tiff/CVE-2022-2869.patch          |   84 +
 ...ed69a485a9cfb299d9f060eb2a46c54e5903.patch |   45 +
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |    3 +
 69 files changed, 8536 insertions(+), 68 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2022-38128-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2022-38128-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2022-38128-3.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch
 rename meta/recipes-devtools/python/{python3_3.10.4.bb => python3_3.10.7.bb} (99%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-net-tulip-Restrict-DMA-engine-to-memories.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-softfloat-Extend-float_exception_flags-to-16-bits.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-use-uint32t-for-reply-queue-head-tail-values.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-softfloat-Add-flag-specific-to-Inf-Inf.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002_let_dma_memory_valid_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-softfloat-Add-flag-specific-to-Inf-0.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003_let_dma_memory_set_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004-softfloat-Add-flags-specific-to-Inf-Inf-and-0-0.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004_let_dma_memory_rw_relaxed_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0005-softfloat-Add-flag-specific-to-signaling-nans.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0005_let_dma_memory_rw_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0006-target-ppc-Update-float_invalid_op_addsub-for-new-fl.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0006_let_dma_memory_read_write_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0007-target-ppc-Update-float_invalid_op_mul-for-new-flags.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0007_let_dma_memory_map_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0008-target-ppc-Update-float_invalid_op_div-for-new-flags.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0008_have_dma_buf_rw_function_take_a_void_pointer.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0009-target-ppc-Update-fmadd-for-new-flags.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0009_have_dma_buf_read_and_dma_buf_write_functions_take_a_void.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0010-target-ppc-Split-out-do_fmadd.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0010_let_pci_dma_rw_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-target-ppc-Fix-xs-max-min-cj-dp-to-use-VSX-registers.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011_let_dma_buf_rw_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-target-ppc-Move-xs-max-min-cj-dp-to-decodetree.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012_let_dma_buf_write_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0013-target-ppc-fix-xscvqpdp-register-access.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0013_let_dma_buf_read_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0014-target-ppc-move-xscvqpdp-to-decodetree.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0014_let_dma_buf_rw_function_propagate_MemTxResult.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0015-target-ppc-ppc_store_fpscr-doesn-t-update-bits-0-to-.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0015_let_st_pointer_dma_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0016-target-ppc-Introduce-TRANS-FLAGS-macros.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0016_let_ld_pointer_dma_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0017-target-ppc-Implement-Vector-Expand-Mask.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0017_let_st_pointer_dma_function_propagate_MemTxResult.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0018-target-ppc-Implement-Vector-Extract-Mask.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0018_let_ld_pointer_dma_function_propagate_MemTxResult.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0019-target-ppc-Implement-Vector-Mask-Move-insns.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0019_let_st_pointer_pci_dma_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0020-target-ppc-move-xs-n-madd-am-ds-p-xs-n-msub-am-ds-p-.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0020_let_ld_pointer_pci_dma_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0021-target-ppc-implement-xs-n-maddqp-o-xs-n-msubqp-o.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0021_let_st_pointer_pci_dma_function_propagate_MemTxResult.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0022_let_ld_pointer_pci_dma_function_propagate_MemTxResult.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3611_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3611_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb} (98%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-2867.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-2869.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch

-- 
2.25.1


