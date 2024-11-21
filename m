Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6122ED75BB3
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:13:30 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.3531.1732162405334160665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 20:13:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ULYMBmFK;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d41ac03343so4085736d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 20:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732162404; x=1732767204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6c4jDREuRMFnRP2w5jBlXCJYo00zCjppylR9G6mlcQ=;
        b=ULYMBmFKBqRo/jEZoUSSbv7tki9Nt4B9oRIBtN46bbkAnjIKhvjJPGr5X1x4RS9qAz
         ykTVsuT2x6yZJIwFCF/KJytusKpt6ugpDkjRPe2pnPpMQjfuWmZIgNeu3Yn5gZpAZdiO
         XvaIX9eKLa+XjnhDCf5ccYm90/LecbSSjLTCjBFUNqDWaqOVe+99sLJFk5aZMjpemVrQ
         N9F+1+NbL6Uu0wda0oDOCCXtvE7ufsjaAM68H7BHmpc8Abju0niQ475Iv9BqZBtvLwK1
         //8HehU617+TbsluMspkJ9LDapA/FW9HJCYJZR4fgX5XwCNM9lQXPuzs2sfbB4ZBnDJz
         DVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732162404; x=1732767204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6c4jDREuRMFnRP2w5jBlXCJYo00zCjppylR9G6mlcQ=;
        b=pLj7XLeoNu3ODXoN74+TXiE3++Ju5avENFoD2vt0OF2h2nKhFBHjgz3ynyscLXClx/
         19NHkTILXLlDXD8fUk83hApm5ZQ6qgN8EfOpIH6DiDj7TyOPeRSsIFTWP8EO8qcwXCOb
         WwyRLoDFtVtW1krUfV2DcRLLNt5z96fUS7SSvTanlsCfNJYhLTlwtZI0HdL1Qo3909ZL
         DyuhI3UFlaw3tB7mAK3NKR6WyByT0lB2jfbF6WmT4/0bnGEfne/H0FOl9v/xS6owYZ5v
         KFFEvy0k+1TCm2xP3DVMbvELt5W/TKermPDxAOaIYGITjrIdwnZ1/LDh8xfG+EuhUsB4
         S2Ng==
X-Gm-Message-State: AOJu0Yyo6q3fGqrCPY6KTk0NzsLZ761YT0w8yVbpEHXQ7xZIYiVMRdJQ
	hZ8/WdoSIq2V9rcnwILhkcC93mn8a00keqxcI8Mb3Egqx36Lvtwd56OweyH/
X-Google-Smtp-Source: AGHT+IG7vGkqcc6RA8zjsCLb3xAFzP5IQ09ZIBVaEKBNH8ScMVjNk9L8/M+z1zaVZHlLhQm2XfnXPg==
X-Received: by 2002:a05:6214:e85:b0:6d4:a29:dd50 with SMTP id 6a1803df08f44-6d442470c11mr35818036d6.15.1732162404345;
        Wed, 20 Nov 2024 20:13:24 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d4380d8b06sm18238846d6.37.2024.11.20.20.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:13:23 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] kernel-devsrc: update for 6.12+
Date: Wed, 20 Nov 2024 23:13:15 -0500
Message-Id: <f8e6cadce51f7f074370a38850c54fe060007b69.1732162137.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1732162137.git.bruce.ashfield@gmail.com>
References: <cover.1732162137.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207503

From: Bruce Ashfield <bruce.ashfield@gmail.com>

arm64 needs some new files to regenerate the build environment
in 6.12+.

This is due to upstream commits:

  commit e632bca07c8eef1de9dc50f4e4066c56e9d68b07
  Author: Arnd Bergmann <arnd@arndb.de>
  Date:   Thu Jul 4 14:33:34 2024 +0200

      arm64: generate 64-bit syscall.tbl

      Change the asm/unistd.h header for arm64 to no longer include
      asm-generic/unistd.h itself, but instead generate both the asm/unistd.h
      contents and the list of entry points using the syscall.tbl scripts that
      we use on most other architectures.

      Once his is done for the remaining architectures, the generic unistd.h
      header can be removed and the generated tbl file put in its place.

      The Makefile changes are more complex than they should be, I need
      a little help to improve those. Ideally this should be done in an
      architecture-independent way as well.

      Acked-by: Catalin Marinas <catalin.marinas@arm.com>
      Signed-off-by: Arnd Bergmann <arnd@arndb.de>

and:

  commit 712676ea2bb3882a852bcf49862c4247317fc9b2
  Author: Adhemerval Zanella <adhemerval.zanella@linaro.org>
  Date:   Tue Sep 3 12:09:17 2024 +0000

      arm64: vDSO: Wire up getrandom() vDSO implementation

      Hook up the generic vDSO implementation to the aarch64 vDSO data page.
      The _vdso_rng_data required data is placed within the _vdso_data vvar
      page, by using a offset larger than the vdso_data.

      The vDSO function requires a ChaCha20 implementation that does not write
      to the stack, and that can do an entire ChaCha20 permutation.  The one
      provided uses NEON on the permute operation, with a fallback to the
      syscall for chips that do not support AdvSIMD.

      This also passes the vdso_test_chacha test along with
      vdso_test_getrandom. The vdso_test_getrandom bench-single result on
      Neoverse-N1 shows:

         vdso: 25000000 times in 0.783884250 seconds
         libc: 25000000 times in 8.780275399 seconds
       syscall: 25000000 times in 8.786581518 seconds

      A small fixup to arch/arm64/include/asm/mman.h was required to avoid
      pulling kernel code into the vDSO, similar to what's already done in
      arch/arm64/include/asm/rwonce.h.

      Signed-off-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
      Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
      Acked-by: Will Deacon <will@kernel.org>
      Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 1500aff2e2..ed7a1a973c 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -184,6 +184,10 @@ do_install() {
             cp -a --parents arch/arm64/kernel/vdso/note.S $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
 
+            # 6.12+
+            cp -a --parents arch/arm64/kernel/vdso/vgetrandom.c $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/arm64/kernel/vdso/vgetrandom-chacha.S $kerneldir/build/ 2>/dev/null || :
+
             cp -a --parents arch/arm64/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
 
             # 5.13+ needs these tools
@@ -194,6 +198,10 @@ do_install() {
             cp -a --parents arch/arm64/tools/gen-sysreg.awk $kerneldir/build/   2>/dev/null || :
             cp -a --parents arch/arm64/tools/sysreg $kerneldir/build/   2>/dev/null || :
 
+            # 6.12+
+            cp -a --parents arch/arm64/tools/syscall_64.tbl $kerneldir/build/   2>/dev/null || :
+            cp -a --parents arch/arm64/tools/syscall_32.tbl $kerneldir/build/   2>/dev/null || :
+
             if [ -e $kerneldir/build/arch/arm64/tools/gen-cpucaps.awk ]; then
                  sed -i -e "s,#!.*awk.*,#!${USRBINPATH}/env awk," $kerneldir/build/arch/arm64/tools/gen-cpucaps.awk
             fi
-- 
2.39.2


