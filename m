Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.24213.1620597153439257751
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 14:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MMYZEP1k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id s82so8070753wmf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 14:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DFTD5WoIe6qLN8vCuYns26NtshkNyzTfEsHBVR1zNaY=;
        b=MMYZEP1kIy7jFk//llp7pgKrDMKbTsAIAYWwkpqYN7Bi9dCzhp0MRy4P9IPLj7RmvA
         FU01WWVb66nQKjfJUgZIKuXiWMhC6sMsd8JJZKiiohyuCktIdFErauyJP/mpxFPDkr2N
         z0GBfg27sHBT58WGzX8iPaSmLH9erD56R9JtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DFTD5WoIe6qLN8vCuYns26NtshkNyzTfEsHBVR1zNaY=;
        b=mMzw29YMoDkVJDyDaKOdtZFaT3F85zEH3Q8sSTEadu2q6Pt207Oj9V45CHQLswI98t
         6fuevpAuKHceAKi4n5dCVDgHCAOf5Cs41KLRUOI2l+C7nx73S6q3uTZocEO1q3NmHiF3
         pa2xS+dGsVbvG7VnrtAu3dHBHYlXsrqy/+psNdBV1VzR/gZAGvaFLqowOzyNS6U3eNSK
         wPp7qB/tEpDzF/aoAeHdZfhrIBqd3eBiNeZLFT0UljzvCAlkpNobbw3xG5MBBs0TO6rD
         FWAuDlr3JV1QfzXZiNE4NizQrQV9FfOedP9uUHbM9xKpEXQjJEfvA97xJQzxQ48szxZo
         Q1Cg==
X-Gm-Message-State: AOAM531X3h1iDls88BqDPbzkYL03pao0vzUmzzcySjxxwRQ5Q5QoHdbU
	fSjDZkyew2bQjUoEp+lIBwcRPuc9mjPfEw==
X-Google-Smtp-Source: ABdhPJxauLjj+fKBE5zgO+HwmoaxZILkz3cB9yFyk9jlxzVx+9K0id9r3DDMklqpSas2fRGHj3Bpaw==
X-Received: by 2002:a7b:c405:: with SMTP id k5mr33685318wmi.93.1620597151981;
        Sun, 09 May 2021 14:52:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id e10sm20407546wrw.20.2021.05.09.14.52.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 14:52:31 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu: Set SMP to 4 cpus for arm/x86 only
Date: Sun,  9 May 2021 22:52:29 +0100
Message-Id: <20210509215229.2137549-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210509215229.2137549-1-richard.purdie@linuxfoundation.org>
References: <20210509215229.2137549-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only qemux86* and qemuarm* support SMP with our current configurations so
rework qemu SMP enabling to account for that and only use it on the architectures
where it works.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/qemuboot.bbclass              | 2 +-
 meta/conf/machine/include/qemuboot-x86.inc | 1 +
 meta/conf/machine/qemuarm.conf             | 1 +
 meta/conf/machine/qemuarm64.conf           | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 0fdd10099ce..2b50ddaa228 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -83,7 +83,7 @@
 # See "runqemu help" for more info
 
 QB_MEM ?= "-m 256"
-QB_SMP ?= "-smp 4"
+QB_SMP ?= ""
 QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
 QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
 QB_DEFAULT_FSTYPE ?= "ext4"
diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 2a4760c7177..9b1e1c49753 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -1,5 +1,6 @@
 # For runqemu
 IMAGE_CLASSES += "qemuboot"
+QB_SMP = "-smp 4"
 QB_CPU_x86 = "-cpu core2duo"
 QB_CPU_KVM_x86 = "-cpu core2duo"
 
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index e5ec4cc065f..34fcde698c1 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -16,6 +16,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine virt,highmem=off"
 QB_CPU = "-cpu cortex-a15"
+QB_SMP = "-smp 4"
 # Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 51f7ecdcfda..150a0744ebf 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -16,6 +16,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 QB_SYSTEM_NAME = "qemu-system-aarch64"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
+QB_SMP = "-smp 4"
 QB_CPU_KVM = "-cpu host -machine gic-version=3"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
 QB_GRAPHICS = "-device VGA,edid=on"
-- 
2.30.2

