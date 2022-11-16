Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B82EC433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 00:38:50 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.1228.1668559123079500195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 16:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ah4aN4I7;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id i9so10699105qki.10
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 16:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eowY4yPdq/c00hj1IPTCES/wRE1kma8M8AYdLzY9xtE=;
        b=ah4aN4I7phPrZwI/TXd+/O3LF4vOU+zFJpIDhdR8Vs1KvK6X/USWjsO1OMJyrayiFJ
         yZFPgfZi0hkrvWTSsRVIMxuQoo7pVhpiaKdNRZXprnZ8WGQ43REnEc8MomPywkVlgRhG
         cRex54i5BuHqah3Ke6Kpr0zFvcw5Kvbfapkt1QNPy+OwNcM7O0Qf09lp9gN2h/zqbBew
         zeWY4PdyoOXg70vbBBvamwnQoTykK6omrprnNy2XbtaJl7vPPd2FeA7Y4rI3hycWhPmZ
         KKoU+JgApfxoIvq6r9KVo39A9cmywC7tIuBgWX10otdFJxTYbNOQ8dpwam1ssmnboe2x
         kD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eowY4yPdq/c00hj1IPTCES/wRE1kma8M8AYdLzY9xtE=;
        b=Y8KzVZpSxOWFBjWBMO6k8bK3pLIM9Qvn/LZCmi5ZQ6OeWMBRwY9zchH7NWOa3SSWfA
         jRqZ6ub9DV4ZfSjy0itTgzoI8trmHZ+ED77hBr0mN4lfa+/c7f0z5kJNL4OBicTgGGxR
         qMOkApwsu6O9iDvuMmWIO6aVmYVXFo2qA0I0AymvgjHbUA3kZbLqbo235wMVCROagjGL
         7mS2hg+JPav0s4Iici2+Kjx37S57joF13uf5xU+PDh4o+82loVCEWcz4jLqp8Ur+JjRp
         nLY1Ck22sI99UW+4D6qNeCAKtjyFN0KH5ye8qyPCNKPQyj98j+VSaWjqKQh4l2hW+lF5
         nibQ==
X-Gm-Message-State: ANoB5plfAbo0e4qvpEOKOFku0EhN2VwdMeM5CQxX7dwJG5YfuUpJzAiA
	fkPR77eqhYXWTRfwoNSzCmqLx1I/BV1YqQ==
X-Google-Smtp-Source: AA0mqf64cRMq0rA8rbHt0qZefzl8UtmQGa5+rwXYf4b/pK2klpI+fwZTzRrRjR7rx5FWKDkxFu30fg==
X-Received: by 2002:a37:ba01:0:b0:6ec:5332:6ebd with SMTP id k1-20020a37ba01000000b006ec53326ebdmr17800979qkf.0.1668559121903;
        Tue, 15 Nov 2022 16:38:41 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id z17-20020ac86b91000000b0038d9555b580sm7926243qts.44.2022.11.15.16.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 16:38:41 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] kernel-devsrc: fix for v6.1+
Date: Tue, 15 Nov 2022 19:38:27 -0500
Message-Id: <71cfe4b75e2078194882ea32325683dd88050536.1668558954.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668558954.git.bruce.ashfield@gmail.com>
References: <cover.1668558954.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 00:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173372

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 6.1 kernel has a number of Kbuild and architecture changes
that required us to update our devsrc recipe. With these changes
we are once again able to build on target modules for all
supported archectures.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 25 ++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 46d706b955..253b8d307d 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -145,6 +145,9 @@ do_install() {
 
 	cp -a scripts $kerneldir/build
 
+	# for v6.1+ (otherwise we are missing multiple default targets)
+	cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
+
 	# if our build dir had objtool, it will also be rebuilt on target, so
 	# we copy what is required for that build
 	if [ -f ${B}/tools/objtool/objtool ]; then
@@ -171,6 +174,9 @@ do_install() {
 	    # arch/arm64/include/asm/opcodes.h references arch/arm
 	    cp -a --parents arch/arm/include/asm/opcodes.h $kerneldir/build/
 
+	    # v6.1+
+	    cp -a --parents arch/arm64/kernel/asm-offsets.c $kerneldir/build/
+
             cp -a --parents arch/arm64/kernel/vdso/*gettimeofday.* $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/sigreturn.S $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/note.S $kerneldir/build/
@@ -206,6 +212,9 @@ do_install() {
 	    cp -a --parents arch/powerpc/kernel/vdso/*.S $kerneldir/build 2>/dev/null || :
 	    cp -a --parents arch/powerpc/kernel/vdso/*gettimeofday.* $kerneldir/build 2>/dev/null || :
 	    cp -a --parents arch/powerpc/kernel/vdso/gen_vdso*_offsets.sh $kerneldir/build/ 2>/dev/null || :
+
+	    # v6,1+
+	    cp -a --parents arch/powerpc/kernel/asm-offsets.c $kerneldir/build/ 2>/dev/null || :
 	fi
 	if [ "${ARCH}" = "riscv" ]; then
             cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $kerneldir/build/
@@ -234,6 +243,9 @@ do_install() {
             fi
 
             cp -a --parents arch/arm/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
+            # v6.1+
+            cp -a --parents arch/arm/kernel/asm-offsets.c $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/arm/kernel/signal.h $kerneldir/build/ 2>/dev/null || :
 	fi
 
 	if [ -d arch/${ARCH}/include ]; then
@@ -282,15 +294,24 @@ do_install() {
 	    # objtool requires these files
 	    cp -a --parents arch/x86/lib/inat.c $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/x86/lib/insn.c $kerneldir/build/ 2>/dev/null || :
+
+	    # v6.1+
+	    cp -a --parents arch/x86/kernel/asm-offsets* $kerneldir/build || :
+	    # for capabilities.h, vmx.h
+	    cp -a --parents arch/x86/kvm/vmx/*.h $kerneldir/build || :
+	    # for lapic.h, hyperv.h ....
+	    cp -a --parents arch/x86/kvm/*.h $kerneldir/build || :
 	fi
 
+	# moved from arch/mips to all arches for v6.1+
+	cp -a --parents kernel/time/timeconst.bc $kerneldir/build 2>/dev/null || :
+	cp -a --parents kernel/bounds.c $kerneldir/build 2>/dev/null || :
+
 	if [ "${ARCH}" = "mips" ]; then
 	    cp -a --parents arch/mips/Kbuild.platforms $kerneldir/build/
 	    cp --parents $(find	 -type f -name "Platform") $kerneldir/build
 	    cp --parents arch/mips/boot/tools/relocs* $kerneldir/build
 	    cp -a --parents arch/mips/kernel/asm-offsets.c $kerneldir/build
-	    cp -a --parents kernel/time/timeconst.bc $kerneldir/build
-	    cp -a --parents kernel/bounds.c $kerneldir/build
 	    cp -a --parents Kbuild $kerneldir/build
 	    cp -a --parents arch/mips/kernel/syscalls/*.sh $kerneldir/build 2>/dev/null || :
 	    cp -a --parents arch/mips/kernel/syscalls/*.tbl $kerneldir/build 2>/dev/null || :
-- 
2.19.1


