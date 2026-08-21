Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01B4C5DF89
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 11:25:29 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5320.1787311520786914826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 04:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nXP07sHn;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7eb63dbd229so731042a34.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 04:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787311520; x=1787916320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQTO/+bUfYd+G1gh6o6/zjLIex1X/p8MWGadSq2KQ5A=;
        b=nXP07sHnTRm4QC/Chf3D/YWd+F82xLNfdSgbj+QmCmyPZjrtpwLcobpckdmtFsnDnZ
         M9YdsfEMiWJNiS+ePUUJbtdtlHRzlocclSoJvy5FF8SXnRxo+cRmz6YCIUz7D9tRhP1b
         TBhR9i1ST8y4Lf+re2ObJQCPZ50/mV49aZEdarbAySlrmItW5vP9c4UIHd6f7GXLi1+X
         9XCrOJnTAqKMUhea/5kgA36yelNmlbWrHCCEQR30dLwnCswaycMLsp3sDeOOK6SjiYyn
         p1sNjCNA2H+kwfrrtmRyZPhyUz5gzklL5eZI6mHLXUkNo+YCZxZhHOl3efxLftqrkH3f
         vTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787311520; x=1787916320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wQTO/+bUfYd+G1gh6o6/zjLIex1X/p8MWGadSq2KQ5A=;
        b=NcDmGPz+8+C79nj9w2VCTaa0SXH4+3pYKElySQxJGrj/53YoK6JkzSnAVz2rF21kgd
         XXflHjXVuZF7hxtUpcvyiM2LeQu2Gq9s0vy+Gh43Sr22uogQ3YC+qsJr+Sa94a5U3QFt
         V7tN3sYFc4SsVfQBPhJCUMLWLsbw8plCE5LF3qNJDIG8YjVLKGOIRkVCw9DGqJ9Oqo3l
         zE13ix3OSzD2QNaSmcP1BEzk7qllb/N8GmjtM9qe/HyWtmnLyTrGic/kJCh1NDrTDi6S
         FHiO3LB5+g4iCvSH2T8W9Gvnq+Wl8RCVC3aNrZOneJfHWePIGsfFtsTlmPW6nJxz6xtw
         Fpow==
X-Gm-Message-State: AOJu0YztQ7ctnFF3/ffuLYNNse/Gn3MM47tTEikiQ6yDLYxOo2KrzVoC
	ct1xFoGGSrjzlUJdBTEIUwdrYhAGPsYLt0QcFEREfu4nNhTT9j0lRsVJ/lL1U5uB
X-Gm-Gg: AR+sD12aSnyI8lUF6yefPBS++1uVPh4JHIWvhqTCvAg1v6F15l7J5Ul8g+NJGvfmzTr
	iAlT2BeLGzrmPsEqj9/0hfjBlfJM0GgKJbKq3/2XikVLxA3VicCglOy5yDvM049ZK5Gp7kcML9d
	cS4BmrR5yu56W6HJeXJuzIgFsmbM+dnNP4/+YKYps+MAJOswwLhHGFa0Nw1agBCCnrouLDDiDNH
	gI0kvQtKVMInbT0fEek34IZGzBA2JCZknj3Uf/Wayw3UwLLW8/eZDMgtTzwv1BhtO1/ZNloNILJ
	xZNa+WE+m+H9b+xuS2NzeXxMp2Eg7TDXwDKjw3v35QX8ElG+d0YYlIFqVf3uan8I8Fx+vie0rcO
	Ezl+ykAnq9HKxgcp7WM8y/NBDQxDoxu4/r3z29zlbKoN5EPwM2txMMWLdmlZSfgr1oeuYamxv89
	BICUZOJpVnxVVD+x377ty8B3JVd/5P0U4v+Ba1kMNf7NFHLLUOO8mZZsL9NJhgFthjjglRqrd6u
	7d9CSbB5F0S74QWor7eWyPooucBV5d25AxD+/VH0KY8pe9GLw0H5/+k26/pwU8SXOTWoJvH/FlF
	a9vaYad+b2MNCWN4N83K1BvJ/h0FMtiNBrZ0FoaHyW7H8Ue5TCxmsVgmSTn/mBibvo+ybxpj+xC
	CH0zU
X-Received: by 2002:a05:6830:4386:b0:7dc:e78b:158 with SMTP id 46e09a7af769-7f462afb6e3mr4539269a34.4.1787311519913;
        Fri, 21 Aug 2026 04:25:19 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f43fe70792sm7398018a34.5.2026.08.21.04.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:25:19 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 05/06] kernel-devsrc: copy arch/x86 vdso2c sources for on-target prepare
Date: Fri, 21 Aug 2026 07:25:07 -0400
Message-ID: <20260821112509.861559-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821112509.861559-1-bruce.ashfield@gmail.com>
References: <20260821112509.861559-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 11:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243929

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Since 7.2, arch/x86/tools/Makefile adds vdso2c to hostprogs with
"always-y := $(hostprogs)", so the archscripts target run by
"make scripts prepare" now always builds arch/x86/tools/vdso2c. Without
its sources in the devsrc tree the on-target prepare fails:

  make[2]: *** No rule to make target 'arch/x86/tools/vdso2c.c', needed
  by 'arch/x86/tools/vdso2c'.  Stop.

Copy vdso2c.c and its vdso2c.h alongside the relocs sources; the
<tools/le_byteshift.h> dependency is already shipped. 6.18 and earlier
still have the sources (just unused there), so the copy is safe across
versions.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 47c0abfa38..2d80278830 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -326,6 +326,9 @@ do_install() {
             cp -a --parents arch/x86/tools/relocs.c $kerneldir/build/
             cp -a --parents arch/x86/tools/relocs_common.c $kerneldir/build/
             cp -a --parents arch/x86/tools/relocs.h $kerneldir/build/
+            # v7.2+ archscripts also builds the vdso2c host tool
+            cp -a --parents arch/x86/tools/vdso2c.c $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/x86/tools/vdso2c.h $kerneldir/build/ 2>/dev/null || :
             cp -a --parents arch/x86/tools/gen-insn-attr-x86.awk $kerneldir/build/ 2>/dev/null || :
             cp -a --parents arch/x86/tools/cpufeaturemasks.awk $kerneldir/build/ 2>/dev/null || :
             cp -a --parents arch/x86/purgatory/purgatory.c $kerneldir/build/
-- 
2.43.0


