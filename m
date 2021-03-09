Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web09.14442.1615317829413548602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 11:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QbGTut3R;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id s17so6967873qvr.12
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 11:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DPt9hEGC89R4uzAQJI5/KtPj1uzXrqkmLcMmh9mzqbE=;
        b=QbGTut3RRsA20yYhcs2X/iR0YGxxCDJ9Tfq+RuIfSPjWhx/LN7HsDi2hiwyKIpLqfm
         xdDK4Ztu/ySBZwoAY6U3PjOkZor/dfsGG06zgNWKRiNHakSQtw4JTyKWjOmqntXXI6hV
         WfoFjzURxZcRYt+ncqvyO76+Ag4MaD1dRmsHPOKR+GQ3//2A6NMKwW31cbe88efjbFbB
         xFPSi6dyDSV5ZStdL7YTtk7K4d7qXbQTLVVU3FxCpHjHmW3hfdbsVn9Phrd3tY4+aelK
         KGlO6EGJxJRf0k5pFxmEC+12H/x3MtjraIj9tt4520ZRvsEZo+0CRgY9jE3OYTI+JbPR
         kOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DPt9hEGC89R4uzAQJI5/KtPj1uzXrqkmLcMmh9mzqbE=;
        b=cJFLgXL/QZLIRdUyzmfTigjlpF/jLQXJTULkcJSxEEHCC3s9+pFNla5WHTzHYwHo1Z
         kU2LPMu9JYu3aKywK/euFPCNMQqOUHiHIrJc9524QPfdiRSXZPcxGglACbmaAq12GJPO
         6cJ6P2iKbVuS7JRg2B78QBVdsG6e3D8DIak1U/3NkEtgsrFjkRROgbARMJDGXbpeeIgk
         DXZOoqz5wCas9eZhe7DF5s+Xv9gMrTLKtvHPRZzH486HuyEn+wq+q7ZMvBwE4t86Ukau
         MhtgXoG0+biqaDwPQWRp8d43bLm8YDa2Pn1D9fgtcZ0AbXo0KI9dUH2ZX00bLs2TkftM
         /cxQ==
X-Gm-Message-State: AOAM53220BRCpAXfJ1gnmVaZgpFOOwR5wLdJ4/l1ZRBMtsyaGnIcP5mx
	bo4W0MNFVfNCsmecY00fxHY=
X-Google-Smtp-Source: ABdhPJw3YB0Jf6gJLy3v73w1Gv3VLTwoMAId08jGO0yh7DaPKyluOtYRMcDJbMnrAJLvOWexsiTiMQ==
X-Received: by 2002:a0c:b929:: with SMTP id u41mr5320209qvf.30.1615317828565;
        Tue, 09 Mar 2021 11:23:48 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id f13sm5713377qtf.57.2021.03.09.11.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 11:23:48 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/qemuarmv5: fix configuration warning
Date: Tue,  9 Mar 2021 14:23:40 -0500
Message-Id: <f7078c94bbe100f71451d714982744ab8dca9741.1615317549.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1615317549.git.bruce.ashfield@gmail.com>
References: <cover.1615317549.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto:

    8c8f6a791be qemuarm: inhibit optimize for size

To fix the following warning:

    [NOTE]: 'CONFIG_CC_OPTIMIZE_FOR_SIZE' last val (y) and .config val (n) do not match
    [INFO]: CONFIG_CC_OPTIMIZE_FOR_SIZE : n ## .config: 159 :configs/v5.10/standard/ktypes/standard/standard.cfg (n) configs/v5.10/standard/arch/arm/arm.cfg (y)
    [INFO]: raw config text:
            config CC_OPTIMIZE_FOR_SIZE
        	    bool "Optimize for size (-Os)"
        	    depends on <choice>
        	    help
        	      Choosing this option will pass "-Os" to your compiler resulting
        	      in a smaller kernel.
            Config 'CC_OPTIMIZE_FOR_SIZE' has the following Direct dependencies (CC_OPTIMIZE_FOR_SIZE=y):
                    <choice>
            Parent dependencies are:
                 choice [y]

We explicitly enable optimize_for_performance in this BSP, but the
arch default is optimize_for_size. These are choice options in the
kernel, so they both can't be enabled.

Unless we tell the audit that we don't want optimize_for_size, it
will notice that fact, and warn that it is not set in the final .config.

[YOCTO #14285]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 10414a3ea3..4a4aa2b9d4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "36889a571fe57fe3561cc23f842b92e4ea9ca264"
-SRCREV_meta ?= "544eb6300c29e7f35551927d63b557f3532f46bf"
+SRCREV_meta ?= "8c8f6a791bed6e8f675236946e805a7fc489e382"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 6f98e3b546..8bb1037476 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "9d6d37cfe365ebd5b530f9c43c1ace924343bb15"
 SRCREV_machine ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
-SRCREV_meta ?= "544eb6300c29e7f35551927d63b557f3532f46bf"
+SRCREV_meta ?= "8c8f6a791bed6e8f675236946e805a7fc489e382"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index c86abb3878..1c3d25569e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
 SRCREV_machine_qemux86-64 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
 SRCREV_machine_qemumips64 ?= "f1c01716513524065f0f231c6e6502cd9a3ecb53"
 SRCREV_machine ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
-SRCREV_meta ?= "544eb6300c29e7f35551927d63b557f3532f46bf"
+SRCREV_meta ?= "8c8f6a791bed6e8f675236946e805a7fc489e382"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

