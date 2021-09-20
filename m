Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.11079.1632141988825525804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=POVQ8aTH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id u15so29346128wru.6
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fdksY8sW2KH9kyYSDRKZfDlDUqa38OW8nXLlpjmIx8w=;
        b=POVQ8aTHwopQLjCV/46FurM14ZNwtNiEx9qXObHIiGFfzIXY1Ec+jXa1SyHQZyBY7H
         4cQf4oL9H7BEfhojN6NmTfBe8aEa+UbQmAGz+MzYnpjWTKF3evnsfv9eXGsV3HOyIVZ5
         scP2EQ8lpwbCiJyCdqKcAAtateOlW8a36xHB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fdksY8sW2KH9kyYSDRKZfDlDUqa38OW8nXLlpjmIx8w=;
        b=viBHwpMAxbZSZ7P8cia7OBIyecSHU2c9ttczL1YfYha+iZPpgCEeb+wsGgxssJuiwg
         AcMM4JkU1UbLtb35zWyX2ZVFz8blml5QYR+T0Rh9Mq9CMYfWcXZtYNInBuK27pvaBYfR
         nrzzhcY6pw9yZtjV2tqvMbKL39/5lppjdJUsxmoLuDwHaj2sjAfMnhFynLT2ASR1NVfe
         umvyu9MEydMKhxZZwSHaqyr2B78GadVgwHY1UWDndwDi2xmfEquMqMnHwEMgM8mpD2m8
         yr0dMQ7PE83Unw8VTIm4Kvu1EVvmGWIazkot0BtUnZj6dAx1OLQ1wxMd9g86ZyAMFR4I
         9Qbg==
X-Gm-Message-State: AOAM531EY+8ivYWw8b2wKdle12zqK3hREdTkxk+ZqKhNFiJT+tzFl3Th
	zJRN+rSHKPHPvJ4GrMGrzbViXpK4uxec6U0k
X-Google-Smtp-Source: ABdhPJw6FuEE/+vd8+1ahpXsQ5pg0jcOIwcUKf8yePRRI56T+Nw73qVpuSUK5jkO2CDzdRzx53MY9A==
X-Received: by 2002:a5d:5351:: with SMTP id t17mr28763368wrv.405.1632141987300;
        Mon, 20 Sep 2021 05:46:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:26 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/14] image/qemu: Add explict depends for qemu-helper addto_recipe_sysroot task
Date: Mon, 20 Sep 2021 13:46:13 +0100
Message-Id: <20210920124621.1576702-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The populate_sysroot task isn't enough for qemu-helper-native, we need
it's addto_recipe_sysroot task. This corrects what amounts to bad
dependency information to be explicit.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass         | 5 ++++-
 meta/conf/machine/include/qemu.inc | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index d76895178fb..1d88ccd8192 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -138,7 +138,10 @@ python () {
     def extraimage_getdepends(task):
         deps = ""
         for dep in (d.getVar('EXTRA_IMAGEDEPENDS') or "").split():
-            deps += " %s:%s" % (dep, task)
+            if ":" in dep:
+                deps += " %s " % (dep)
+            else:
+                deps += " %s:%s" % (dep, task)
         return deps
 
     d.appendVarFlag('do_image_complete', 'depends', extraimage_getdepends('do_populate_sysroot'))
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index c7136da7116..642c322abcb 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -21,7 +21,7 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base = ""
 # Use a common kernel recipe for all QEMU machines
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
 
-EXTRA_IMAGEDEPENDS += "qemu-system-native qemu-helper-native"
+EXTRA_IMAGEDEPENDS += "qemu-system-native qemu-helper-native:do_addto_recipe_sysroot"
 
 # Provide the nfs server kernel module for all qemu images
 KERNEL_FEATURES:append:pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
-- 
2.32.0

