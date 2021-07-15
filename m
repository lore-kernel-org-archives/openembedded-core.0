Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.225.1626377417771755657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NAc4N+E3;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id s6so6296931qkc.8
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kn/v9a+6UVyUN6WfGfwWZ/j5Gpz9HfbnBiA8AsmeJsY=;
        b=NAc4N+E30XiovD1j4p1AB8cu9oGZaUcxvtDcPvrLczXn6W2LXVieVUOQa/e1Ny7+Bf
         AhRw2w7fFWT9/TULVn4cvqrzFork7VYJ2TLiTwnddPzxMUKlJbG/l5L40FKjwX/0WQdm
         jt6Q0cpoUX8gpzTbDTTFqcFDpzWVdpmYYRWj5ShqJ2GHqthvmA4+geL024xy0xW2KDKp
         /AqxvZqiT4E26MC0IvalGi/8wCIMkUUG84EnrXlIU5vvHRWQDmwjOi6c//gxMgd11ZQ9
         a6Yq62MaKjqwFvJKKXuMYUngy7Dvp0YdSqXNMEkx4fJhkPxxyiEwAwzvEL39c4RGJla0
         zfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kn/v9a+6UVyUN6WfGfwWZ/j5Gpz9HfbnBiA8AsmeJsY=;
        b=abgLt0j2NGPklziQZQXNSlOvZBJrxJaL0zGqBCajhZkIjVlK8j6vjJCpOYVHmznGkx
         wRkNFDOmzXEBBXPlWvfFCoPK0u4lvNWtD7TV/GPygsdDUiOe/Wl2LgOrHMUnKNO4JPLn
         9UBj2bssRvVGhFR7JLUoU3YHcWbkgCR8AldTtli56tvZdUjp4Jk6D3uQ5DXDbzRUgOpw
         z6up0d4yA1Q4CBk2txI4fA3R33sisYqtHYRmp3EnqXn7UdzTE9S+u8Z/BA0C8H9QWh+k
         fyqowdIX4osccjwYiJ2cNXeKeai7x2udjKoPldGPG2y+dMucZfPkpbDf3vHSHJI/ae2V
         QYgQ==
X-Gm-Message-State: AOAM530EXtCa2QHSbtvptsNVHAU8LZ4sOhLvzhwZeRrgLArXFzDpG7Wv
	4tmRAwQlA6EmPH+gTybZvQE=
X-Google-Smtp-Source: ABdhPJz7nnnxtJ30HBuIRtwfa4t8T3qgEEQkyKgFAM1EDuuO6RWsiBv5MNCRoEFix7T7KVbzm3b4HA==
X-Received: by 2002:a05:620a:9c9:: with SMTP id y9mr1045256qky.494.1626377416952;
        Thu, 15 Jul 2021 12:30:16 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id f36sm2340670qtb.40.2021.07.15.12.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:30:16 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto: add vfat KERNEL_FEATURE when MACHINE_FEATURES include vfat
Date: Thu, 15 Jul 2021 15:30:07 -0400
Message-Id: <fa13bfe310a8f9844a5f957252ce1da36b0ece1e.1626377295.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1626377295.git.bruce.ashfield@gmail.com>
References: <cover.1626377295.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

If a machine has vfat in its MACHINE_FEATURES, we can ensure that the
kernel has support by enabling the associated KERNEL_FEATURE.

This partially addresses Yocto bug 14470.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index a85280990b..eb3081ee31 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -34,6 +34,7 @@ KERNEL_LD_append_arc = " ${TOOLCHAIN_OPTIONS}"
 KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
 
 KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
 
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
-- 
2.19.1

