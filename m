Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57915C43217
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 23:09:16 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.660.1666048152213734220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 16:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=m4AndS+p;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id f140so12468229pfa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 16:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8UjWGrxrxOCuFq6Pumfg8zqaz8j1haSIWBONS2fQw4=;
        b=m4AndS+pFNZD0NCvNryD8UfWjywnPSU8bFhlTmpy1rkhMYiXVUQzMH026EZS4DmEgC
         DbqzZy+xCUJYUu6pzxSnJyqx/+Z79NbeMUPV5Wgyvysl76ZyZ7+s163ujptNn5eWAD+u
         Bhl/awJhdd54krDMvT5jC6uV+dJAkmw3f9MpVt34v3OIbuvsjT1ei7w9/wjn7IVQZbJs
         TYxBgupMbxwoIac9+JB8WM+F524GLgQRZEwhH3CIHl3wEdxBTejg2cqMO1gZqNb58cX7
         AXT43QcmlA9VSIakwkA61Mr0VEowNDxsuEiSzq0CLBNMtUeL+MK7c+VmcCgmWRIO4iU0
         YXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8UjWGrxrxOCuFq6Pumfg8zqaz8j1haSIWBONS2fQw4=;
        b=PtjbIEgikud1FQRniQnk1wL03GWk7e2740vhoLVbKpeRkmHjCUlFT8oIhtAvbd24+F
         gCsc4+8DsbUsOxkEmaTSwlt2gMWLDvsrfKyG40UDOHTH4QudK/zk3hy9cHo4v+Df8AhC
         Ti1aUqMkzcFNtOjE4g4ajCMiqpdtJPq/6IITXEznbPfe1yWlueyQYYta2YRlYamLUcDR
         apDnoUOvuzShXQX5uATN/bty3hqKNVEdiQ1sZ0YhHiwDtz6jlE49QEY8cGk6Q7bIAF7p
         g5R4wwhc37bzn20AAtyMHRtmhOJ+Lbfe0Gu1o1RDMXCWlwWHRzaH7N6VTS4R490kYTRO
         C+0g==
X-Gm-Message-State: ACrzQf1NJKeOsuzS7dkdeFWkknkg2enjNf7BTe8SEUSEfxQ+xVD37bCA
	MeLPGJA008Y75/1h9TlLPPSs/TeOD2W9HT5Y
X-Google-Smtp-Source: AMsMyM6GT+eNuF4Ebqx78ggR+0/igr+wMHZIHLbdZpToJPwxOq60YTaSr3IEcVy1vy3wrAdbUSZg4Q==
X-Received: by 2002:a63:1718:0:b0:447:9ff3:66c0 with SMTP id x24-20020a631718000000b004479ff366c0mr92072pgl.521.1666048151086;
        Mon, 17 Oct 2022 16:09:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a694600b0020aacde1964sm10119479pjm.32.2022.10.17.16.09.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:09:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/13] lttng-modules: Fix crash on powerpc64
Date: Mon, 17 Oct 2022 13:08:29 -1000
Message-Id: <4781fee6aea9512b7cb390b76e6f9f0a86a5bd11.1666047986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666047986.git.steve@sakoman.com>
References: <cover.1666047986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 23:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171931

From: He Zhe <zhe.he@windriver.com>

Backport a patch to fix the following on powerpc64 ABIv2.

root@qemuppc64:~# lttng create trace_session --live -U net://127.0.0.1
Spawning a session daemon
lttng_kretprobes: loading out-of-tree module taints kernel.
BUG: Unable to handle kernel data access on read at 0xfffffffffffffff8
Faulting instruction address: 0xc0000000001f6fd0
Oops: Kernel access of bad area, sig: 11 [#1]
<snip>

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...4-fix-kernel-crash-caused-by-do_get_.patch | 94 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.4.bb             |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch
new file mode 100644
index 0000000000..b3b191c7ac
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch
@@ -0,0 +1,94 @@
+From 480cce4315ce5bf59a509e8a53a52545f393de68 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Tue, 27 Sep 2022 15:59:42 +0800
+Subject: [PATCH] wrapper: powerpc64: fix kernel crash caused by
+ do_get_kallsyms
+
+Kernel crashes on powerpc64 ABIv2 as follow when lttng_tracer initializes,
+since do_get_kallsyms in lttng_wrapper fails to return a proper address of
+kallsyms_lookup_name.
+
+root@qemuppc64:~# lttng create trace_session --live -U net://127.0.0.1
+Spawning a session daemon
+lttng_kretprobes: loading out-of-tree module taints kernel.
+BUG: Unable to handle kernel data access on read at 0xfffffffffffffff8
+Faulting instruction address: 0xc0000000001f6fd0
+Oops: Kernel access of bad area, sig: 11 [#1]
+<snip>
+NIP [c0000000001f6fd0] module_kallsyms_lookup_name+0xf0/0x180
+LR [c0000000001f6f28] module_kallsyms_lookup_name+0x48/0x180
+Call Trace:
+module_kallsyms_lookup_name+0x34/0x180 (unreliable)
+kallsyms_lookup_name+0x258/0x2b0
+wrapper_kallsyms_lookup_name+0x4c/0xd0 [lttng_wrapper]
+wrapper_get_pfnblock_flags_mask_init+0x28/0x60 [lttng_wrapper]
+lttng_events_init+0x40/0x344 [lttng_tracer]
+do_one_initcall+0x78/0x340
+do_init_module+0x6c/0x2f0
+__do_sys_finit_module+0xd0/0x120
+system_call_exception+0x194/0x2f0
+system_call_vectored_common+0xe8/0x278
+<snip>
+
+do_get_kallsyms makes use of kprobe_register and in turn kprobe_lookup_name
+to get the address of the kernel function kallsyms_lookup_name. In case of
+PPC64_ELF_ABI_v2, when kprobes are placed at function entry,
+kprobe_lookup_name adjusts the global entry point of the function returned
+by kallsyms_lookup_name to the local entry point(at some fixed offset of
+global one). This adjustment is all for kprobes to be able to work properly.
+Global and local entry point are defined in powerpc64 ABIv2.
+
+When the local entry point is given, some instructions at the beginning of
+the function are skipped and thus causes the above kernel crash. We just
+want to make a simple function call which needs global entry point.
+
+This patch adds 4 bytes which is the length of one instruction to
+kallsyms_lookup_name so that it will not trigger the global to local
+adjustment, and then substracts 4 bytes from the returned address. See the
+following kernel change for more details.
+
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=290e3070762ac80e5fc4087d8c4de7e3f1d90aca
+
+Upstream-Status: Backport
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I34e68e886b97e3976d0b5e25be295a8bb866c1a4
+---
+ src/wrapper/kallsyms.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/wrapper/kallsyms.c b/src/wrapper/kallsyms.c
+index d2848764..93017adc 100644
+--- a/src/wrapper/kallsyms.c
++++ b/src/wrapper/kallsyms.c
+@@ -39,10 +39,26 @@ unsigned long do_get_kallsyms(void)
+ 	memset(&probe, 0, sizeof(probe));
+ 	probe.pre_handler = dummy_kprobe_handler;
+ 	probe.symbol_name = "kallsyms_lookup_name";
++#ifdef PPC64_ELF_ABI_v2
++	/*
++	 * With powerpc64 ABIv2, we need the global entry point of
++	 * kallsyms_lookup_name to call it later, while kprobe_register would
++	 * automatically adjust the global entry point to the local entry point,
++	 * when a kprobe was registered at a function entry. So we add 4 bytes
++	 * which is the length of one instruction to kallsyms_lookup_name to
++	 * avoid the adjustment.
++	 */
++	probe.offset = 4;
++#endif
+ 	ret = register_kprobe(&probe);
+ 	if (ret)
+ 		return 0;
++#ifdef PPC64_ELF_ABI_v2
++	/* Substract 4 bytes to get what we originally want */
++	addr = (unsigned long)(((char *)probe.addr) - 4);
++#else
+ 	addr = (unsigned long)probe.addr;
++#endif
+ #ifdef CONFIG_ARM
+ #ifdef CONFIG_THUMB2_KERNEL
+ 	if (addr)
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
index 80b9ceec3f..ad4063bed3 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch \
            file://0001-fix-compaction.patch \
            file://0001-fix-adjust-range-v5.10.137-in-block-probe.patch \
+           file://0001-wrapper-powerpc64-fix-kernel-crash-caused-by-do_get_.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.25.1


