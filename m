Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.4007.1624833208550501207
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 15:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F1kStoFG;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id i24so22631789edx.4
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 15:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eKp4F/9anfFNsjOyJzuSVaomBd1TUCkhdLiD5B6m44c=;
        b=F1kStoFGEaMaJFdGotjLc02MX68aJpwwbA88kW9lEovHVBnC2jid2GyipTWhDC8JoZ
         pKszdX7+UOyusvi/QgjR+cubMxo0c1RRtLQzGp0+IeJJiyBNFrVHe/xuuM+ICkBYfbRs
         YeMRboKOLW8ad9hejEHT0G8RtKLWILgw/ujXZZtLik2sHZoHywzIxZmpQ+DrGE9Kceiw
         4p6o5BEclZJLahk+6OddgDEBVJsUvUgiof/6C//GVfsgoTWzB35jtZX6EyrAohbfmKwg
         iY/UA5sF0CTeP/zTjwxm9vlozY1NlhQi+G3DBjooiG738r6qqNvkHHQ9odNEy6P92x4s
         PuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eKp4F/9anfFNsjOyJzuSVaomBd1TUCkhdLiD5B6m44c=;
        b=heFnib3IXb7Wy6uOtnoVJYE8UKhajH5NSAPLCRwNx/Kd15Z13qxL8glnqBi0X0gnyf
         K1AUsjVJB4mgZcttxDAfLzYUqBC+sZMnXBS62mZqWQU8wIXgEguFLaQ7Qw22M0Gug2MK
         QCiNx5jBVqwdDwWCpKhGKMk9/tDqQtr0HvSaP5jPO5p96JybkwkvdbN3BZEfnnTMXtD0
         l2Vt6Q/c8ZnJmQQJtO7MnENy76zo7zEeWOqe/bNIgNq36O2nQR/xnb3xylI92dc+9gOb
         B8n6eAVjkiJYjTlJwcMDpUqGZFPAnXKhEw7LewSEcqwJCKjc2K8i+2kChoLvyMm81YLj
         pgRg==
X-Gm-Message-State: AOAM531oc8kCKFsnTeqNOpONHoPvJcUm5aBi3aBgAGpeY9dIvXiUY7D7
	Gqxj4ERpAIrzeO6Qtfy7HhWQJ4YfG93xGDCd
X-Google-Smtp-Source: ABdhPJxYEFKOkGcgFxbMwffV5MNl3k4paKfKP/OmavVDRqb0LHwUzKkkecKPkkmJott95qmiNRyd7Q==
X-Received: by 2002:aa7:dc42:: with SMTP id g2mr28672810edu.362.1624833207143;
        Sun, 27 Jun 2021 15:33:27 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host-87-0-253-36.retail.telecomitalia.it. [87.0.253.36])
        by smtp.googlemail.com with ESMTPSA id h4sm891176edv.59.2021.06.27.15.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 15:33:26 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][hardknott][PATCH 2/2] kernel-devicetree: Fix interaction when packaging disabled
Date: Mon, 28 Jun 2021 00:33:25 +0200
Message-Id: <20210627223325.11456-2-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210627223325.11456-1-andrea.adami@gmail.com>
References: <20210627223325.11456-1-andrea.adami@gmail.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When packaging is disabled using the nopackages class, ensure we don't
add to PACKAGES. This fixes builds where we have an unpackaged kernel
alongside a packaged kernel.

Backport of commit d6b114c from master.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-devicetree.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index d4f8864200..27a4905ac6 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -1,8 +1,11 @@
 # Support for device tree generation
-PACKAGES_append = " \
-    ${KERNEL_PACKAGE_NAME}-devicetree \
-    ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-zimage-bundle', ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
-"
+python () {
+    if not bb.data.inherits_class('nopackages', d):
+        d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
+        if d.getVar('KERNEL_DEVICETREE_BUNDLE') == '1':
+            d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-image-zimage-bundle")
+}
+
 FILES_${KERNEL_PACKAGE_NAME}-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
 FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
 
-- 
2.17.1

