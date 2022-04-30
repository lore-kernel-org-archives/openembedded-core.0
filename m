Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D1EC433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 16:35:20 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.24254.1651336513421846004
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 09:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XrcBRWr+;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id p8so9283703pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QlktQDk/MXbNloXnvNfBR/QKscrlvaogVIZcUgEnp/o=;
        b=XrcBRWr+ho5+0wlUG/h3GFH+OKy550gYUTlX/otFfOXG+luxRbf9kBniZzDa2p9cS/
         rwPL/PcimeVsvFg4Ug7iwhaIekcZI6XB7ef9Axfr3/uCevJy+9irRvwV3Dgk8mbYNNge
         liQJRYCYy9hWXtV83r/xw4I8YUfcRchpAybAPPg6/GRlGOO1pliNo9QXyPeja8WZNmjW
         57qTsDRLGZfSUYcEozpEb7eKb/oWY6mKW2mOGNTgY3n31+yxHHVhPYTT2lBD0GajY9wV
         Ui4FWxOmWwOvKJ3uMKK283Ywl1y0owpPzUIN3EhEkdgRSIeGzmQ4B49WPf2HKdd3/eMz
         72iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QlktQDk/MXbNloXnvNfBR/QKscrlvaogVIZcUgEnp/o=;
        b=5QPNVVla3ASsNSuyGHeWFhB7O1evonwE4DDNNIcwlvOKu7V6ZMYHUMF6Z3MA10gkAm
         WAYva/FdKQVaCyO15cjyCqCNQioSb8tPRyFR2b2kIO8p7WevrUiyTg5KcKm2tHROStg2
         jvD5N5UFrUzVitTXggggXWxguQhUkkjVUPYT7KtUMMX0Ukr+gQNcwBzOz4P+ubcnHLfA
         DqpYkUmn5kewra4qRFHAFkie6QCZnwE8+h07QSkykjHrJB7V5fsJZ/KB+yv+MCHQROZh
         d7SlIEdtverRn+mhX3brtkWdJEK4EnDoMyJKVq8QDkZ0I7DTGlph7yR2gFZBF9W4pkjU
         oFpQ==
X-Gm-Message-State: AOAM531ZiMm/o0Ii57emDOKwM8uXZjtHA8gjYvE02hJXBJ6wvw2Q2y/9
	fgGJJl64UIud2OJ8lgTr6cVbXhXtcGY0TQ==
X-Google-Smtp-Source: 
 ABdhPJz3ctu5nhUpITf3jNMT6c/Nih/ZzJFUSsIUFpKWklUzh5CSsaFlAx9dqXciebtXB4Dqs+YoIQ==
X-Received: by 2002:a63:d906:0:b0:39c:c4ca:32b1 with SMTP id
 r6-20020a63d906000000b0039cc4ca32b1mr3677475pgg.408.1651336512515;
        Sat, 30 Apr 2022 09:35:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 lw4-20020a17090b180400b001d7faf357b7sm18653755pjb.4.2022.04.30.09.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 09:35:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Add packageconfig for libbpf support
Date: Sat, 30 Apr 2022 09:35:09 -0700
Message-Id: <20220430163509.1739056-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Apr 2022 16:35:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165071

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
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 09a2d470056..0aaeaa1cb53 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -197,6 +197,7 @@ PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
 PACKAGECONFIG[pmem] = "--enable-libpmem,--disable-libpmem,pmdk"
 PACKAGECONFIG[pulsedio] = "--enable-pa,--disable-pa,pulseaudio"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
+PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.36.0


