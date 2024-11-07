Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CCAD43377
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 16:20:45 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.76128.1730996437110201489
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 08:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Phw6LuCa;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b13ff3141aso73988885a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 08:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730996436; x=1731601236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TApVqoP85Bhe2fh6uNmPzRHGwUsSyICKL04hwWvt9Rc=;
        b=Phw6LuCaTDfeL2Rnu5SSw1UXrv8VxkjAjU/nk0OlVW6DnG8lwR89782ShoOgjmZeWk
         Mjakyqn0Bb4loDw4vNCijoX5HDcgv6lnr5Utp/FGzvlZEpnJpGl8hjQdpwJbvDrpsYvZ
         4BU2sCf5NJFwgv+jwyRhZyAkTDooVYly9aP0Pd/7KyPznaXRgNgnyCgeaPbZFuG/d62r
         g/LtfrvYkS6MSX+/mlUXSJRp4mActzxiLbuEPdWjvUxoQtp4N12rCfefeGMBxjiqyBtF
         7zi0C0XOXkeEvM48n44UfXhpVMAAqLdd+1Hmq5lsraYsqYYu1f05N5FUKXGHVw/Wtew7
         yVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730996436; x=1731601236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TApVqoP85Bhe2fh6uNmPzRHGwUsSyICKL04hwWvt9Rc=;
        b=ueSKVwIlHWM0lfITCffFhlmyL2XjOmGXpJ++nh5DLMqyUEJaSxOU0m5p4AHcTkf88n
         eKyod7Oy9LojchrwQU6ER+FF4XOsowegTnh+/Mu8oXWhwt5KbAnrTF6FpdGJUVhdHbOA
         BByXi055wgRBfXIZbw7220A8ceZ0uyDGVAK/yw1khjg45ozPwcu4ghH3ski05NQQBUMb
         GW/++zX7PqCkXuYYUQsKfECtHfg9XVEv7JZhgwf+wsPOZe88XIUy8YNhGJn1ft1gGsMF
         J10f1LFBq9LjwVEjye3uhg9zBNmdLqQi57JmD8/cabzvJm446o0OHBjSLHTyMplMUYh5
         jKng==
X-Gm-Message-State: AOJu0Yyj782tcFdF5FuDvI9Ghx8B0H3uczfCR3jo8/MFhED1hoUARL/Y
	qC/EkfzoiNNyp82Czfdyl0VjU6tkuuDK46915AgtKWAFnPF2N/Zk
X-Google-Smtp-Source: AGHT+IERBM2u73mdGRiIqwx2GZwEpdtwUW4/AqcscsPOiPXNXfqGxEbEOxfMZXdiU/cVmEe3AzYEZg==
X-Received: by 2002:a05:620a:6001:b0:7b1:c604:b26c with SMTP id af79cd13be357-7b3312652dcmr66140185a.53.1730996435857;
        Thu, 07 Nov 2024 08:20:35 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ac2dcebsm77807285a.7.2024.11.07.08.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 08:20:34 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-devsrc: update for 6.12+
Date: Thu,  7 Nov 2024 11:20:33 -0500
Message-Id: <20241107162033.1002248-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 16:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206840

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
index a353334349..bc77129656 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -198,6 +198,10 @@ do_install() {
             cp -a --parents arch/arm64/kernel/vdso/note.S $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
 
+            # 6.12+
+            cp -a --parents arch/arm64/kernel/vdso/vgetrandom.c $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/arm64/kernel/vdso/vgetrandom-chacha.S $kerneldir/build/ 2>/dev/null || :
+
             cp -a --parents arch/arm64/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
 
             # 5.13+ needs these tools
@@ -208,6 +212,10 @@ do_install() {
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


