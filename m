Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.11005.1625238838353633626
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 08:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sw5Ptlb0;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id c13so6794319qtb.12
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ufa/NSSxn2B9q58YnWzU6QH0FiMwAFbvc+amgRADIzQ=;
        b=Sw5Ptlb0qItL/dW2keBjhcBDfzRLIiR25ZJbpWPm8lvZvNanGBOALnH1zeG+T1OSn9
         TgrAK9untyEvulh8oixiMzkAK/xKKccuej9ZHskZe1m/kb0uFnqnwyiItUvqaeZ1adY7
         f0Yj1A5IC34tqZFtik2kfxwk+CVwLnJaGe25QbvCRtOhtGQK5pDjZcYRRw1Sl7aF1xu0
         cW7XSvvNUMR8J/sEk78YrFdwQaFjHo9oHIl0m+jaQsrdWy+426idHGSZdYxE2lenBJxm
         MdGKSIIKLjk7L858eHtvooxWdQpRIwNBX1uFSVLSot4F2Q0MoJD933WjX8GbbAoZKSXO
         sxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ufa/NSSxn2B9q58YnWzU6QH0FiMwAFbvc+amgRADIzQ=;
        b=YprTvDOnUlCdsksQMTRqhPIrHPUfzDDYOyC8lQVj7Ij8RozqyDYBJ2edKDuKCgYmzh
         V5d5p2GgbLXas+y55XzWwmDg235jCCMwQ5fiP1Ckb/W2LO0Dq6m+Xi58VAlFKatijRIr
         rOJkWQDljqO69r1qET7qJ824T4QRoYF7GLJ9CJ548S4eE+87CXT8eMotBBbAKzy24zmr
         QU9ViV9z7haI/+ZZtHlFgoT0vt7O/GyoiDVB5VLN8rFZtihGmpIqWFbWV/AVVX/yri01
         H6qLn01WYSokINYmHzf9m7EVAgwpAAaauiykbTiDurZ+6p+gnQggHwyvPq8to0HXA4FX
         D7wg==
X-Gm-Message-State: AOAM531EncpTCXhavsqNxZDiwfhs0MV8SSppaB2NRE/NQV16KeftxQ3l
	bvCjRYkLsrDcUKTpfqx1s1oBOGQJ0TF53/01
X-Google-Smtp-Source: ABdhPJw81n0SoXfh4lhUQQxFr3FR7Xe7LMe8aCx779e3NcW94F1QK8sufK2bpTeE3sStJjbg3hikWg==
X-Received: by 2002:ac8:73d7:: with SMTP id v23mr216687qtp.250.1625238837456;
        Fri, 02 Jul 2021 08:13:57 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id o200sm1466800qke.105.2021.07.02.08.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 08:13:56 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] kernel-devsrc: fix scripts prepare for powerpc
Date: Fri,  2 Jul 2021 11:13:46 -0400
Message-Id: <5c35fad67a253b59ec2d873f1feacc107b8ac733.1625238537.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1625238537.git.bruce.ashfield@gmail.com>
References: <cover.1625238537.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.13 introduces some new tweaks required to get on target scripts
and prepare working for powerpc:

  - 'nm' is detected as 'nm --synthetic', so we adjust our replacement
  - more vdso is required on target, so we copy those files (like arm64
    does)
  - grep is required during processing, so we add it to the redpends

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index b1837b3a51..92076ac8b0 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -112,6 +112,9 @@ do_install() {
 	if [ "${ARCH}" = "arm64" ]; then
 	    cp -a --parents arch/arm64/kernel/vdso/vdso.lds $kerneldir/build/
 	fi
+	if [ "${ARCH}" = "powerpc" ]; then
+	    cp -a --parents arch/powerpc/kernel/vdso32/vdso32.lds $kerneldir/build 2>/dev/null || :
+	fi
 
 	cp -a include $kerneldir/build/include
 
@@ -178,6 +181,7 @@ do_install() {
 	    cp -a --parents arch/${ARCH}/kernel/syscalls/syscall.tbl $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/${ARCH}/kernel/syscalls/syscalltbl.sh $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/${ARCH}/kernel/syscalls/syscallhdr.sh $kerneldir/build/ 2>/dev/null || :
+	    cp -a --parents arch/${ARCH}/kernel/vdso32/* $kerneldir/build/ 2>/dev/null || :
 	fi
 
 	# include the machine specific headers for ARM variants, if available.
@@ -281,7 +285,11 @@ do_install() {
         sed -i 's/ifneq "$(LD)" ".*-linux-.*ld.bfd.*$/ifneq "$(LD)" "ld"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(AR)" ".*-linux-.*ar.*$/ifneq "$(AR)" "ar"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(OBJCOPY)" ".*-linux-.*objcopy.*$/ifneq "$(OBJCOPY)" "objcopy"/' "$kerneldir/build/include/config/auto.conf.cmd"
-        sed -i 's/ifneq "$(NM)" ".*-linux-.*nm.*$/ifneq "$(NM)" "nm"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        if [ "${ARCH}" = "powerpc" ]; then
+            sed -i 's/ifneq "$(NM)" ".*-linux-.*nm.*$/ifneq "$(NM)" "nm --synthetic"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        else
+            sed -i 's/ifneq "$(NM)" ".*-linux-.*nm.*$/ifneq "$(NM)" "nm"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        fi
         sed -i 's/ifneq "$(HOSTCXX)" ".*$/ifneq "$(HOSTCXX)" "g++"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(HOSTCC)" ".*$/ifneq "$(HOSTCC)" "gcc"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(CC_VERSION_TEXT)".*\(gcc.*\)"/ifneq "$(CC_VERSION_TEXT)" "\1"/' "$kerneldir/build/include/config/auto.conf.cmd"
@@ -317,3 +325,5 @@ RDEPENDS_${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils', '', d)}"
 RDEPENDS_${PN} += "gcc-plugins libmpc-dev"
 # 5.13+ needs awk for arm64
 RDEPENDS_${PN}_append_aarch64 = " gawk"
+# 5.13+ needs grep for powerpc
+RDEPENDS_${PN}_append_powerpc = " grep"
-- 
2.19.1

