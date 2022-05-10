Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EE6C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:38:15 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.10773.1652193484248908903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ePaTARvO;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id fv2so16048678pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KFbPSkkD+Fd7Dk5FwzkF1BW2B4hc+H6WD/stlMrCXrE=;
        b=ePaTARvOrZFvVQc+Aprwlz9guBlp+pZBNDTNG8akk12APp01WymwF2tQ40kAU23B1i
         TOpQgDr6wSYpJGlYtUAjK0D/bq34SpugM2Bleb+D3xAqcV5eNxfBMeZa0n2KYBi93CxY
         TqsPPPLMM1cepRzia2+AlHmsgcmhY3A5Q/6fdWcvxW+mUzQEG8/bqfQCa+x8X0RK1dP8
         tP5CIfqPPX78aPzR8hliNOknA1RM/r4+ae+EGLeZhoLfP5UVPlUafjwPpUOqN+X1KMaw
         ZCR1r9KhNBQsQvHefCcbgYkVcDF+F5AqMyfkDnIqneXrEIw1TvfguVqVD+X44AcgEKf+
         bBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KFbPSkkD+Fd7Dk5FwzkF1BW2B4hc+H6WD/stlMrCXrE=;
        b=6VI0kNRIhEnyEp11FNjdcPUmaht5d13nHATETFxtA4tCQ3tJvjCpoMQwGFe17KP+c+
         7SrOf60hQj0X6s8dYdADL3vgqC9MQJk9SLJiYL/ZJl7rAEeuF0PWoXD1EU8b4PvG3xmm
         fKR5q0T6vBkU3+BeVxWf23j8hXQhyqUmnlcMPEKR+sI2ghUVdaUd6hkvtGLuEL7FxP82
         pwrheRImihlyBCbAXMZvv6DFcHNpU0z7ovaaaj2oNrKQjz5F21A2XaOwd02VFjxwNoTl
         UPNBibHg0xhdPrqX+ifSw4VgjH1Pezd+Fp2QEkAc5qpHkY7F0yXryrrvdfcKVSl7ot/F
         pOIQ==
X-Gm-Message-State: AOAM530YwxUSyrxgJkNoyzRLtcddwHAFrMGLQFjSegY8nt3qurWAUZlO
	1dgyfNKxndhuKnHNYEXL2loTDKLb5LUBECLb
X-Google-Smtp-Source: 
 ABdhPJyrqqhXkRb/q4SOFtA0iB9y7A41UmHbBOcJusW87rv4eIZVMRRMnjxjYCbz7F0R3ZkDi0/9AA==
X-Received: by 2002:a17:903:1104:b0:15f:bce:1a0c with SMTP id
 n4-20020a170903110400b0015f0bce1a0cmr11256522plh.149.1652193482950;
        Tue, 10 May 2022 07:38:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.38.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:38:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/40] qemu: Add packageconfig for libbpf support
Date: Tue, 10 May 2022 04:36:48 -1000
Message-Id: 
 <2f97e2d92982b9cffaccdf251c1b6d47de0258c2.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:38:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165426

From: Khem Raj <raj.khem@gmail.com>

its in auto mode, which is troublesome particularly on native recipe
where it pokes at build host to find this library if its not in native
sysroot and when build host has libbpf installed it enables it silently
otherwise disables the support. so lets make it deterministic, and if
one needs to enable this feature then enable the packageconfig
intentionally, It was found when trying to solve this QA warning

Skipping RPATH /usr/lib64 as is a standard search path for /mnt/b/yoe/master/build/tmp/work/x86_64-linux/qemu-system-native/6.2.0-
r0/sysroot-destdir/mnt/b/yoe/master/build/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroot-native/usr/bin/qemu-system-x86_64

This is becasue qemu's build system adds the needed flags to -rpath for
the libraries it needs and in this case it has found libbpf.so in
/usr/lib64 on build host.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d493928b7c98ab11b5d8c50924b1a2c464bf7f5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4e94c4b2bf..1efbb104e2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -196,6 +196,7 @@ PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
 PACKAGECONFIG[pmem] = "--enable-libpmem,--disable-libpmem,pmdk"
 PACKAGECONFIG[pulsedio] = "--enable-pa,--disable-pa,pulseaudio"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
+PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.25.1


