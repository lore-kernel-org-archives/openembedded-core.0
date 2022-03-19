Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878C6C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 12:32:26 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web12.6587.1647693145733816891
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 05:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cmuu7KJp;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id r21so7168431ljp.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nI3WwtbCNiZ2Zk5SCvVP/Kgega2HLjHouM+cLg+LA48=;
        b=cmuu7KJpuiug+KXmSH3mfUolxALCwbAhfFf7fIja9QgzWQaA6yuYluZCrxTmbrhNhg
         i7oYoyMWBQ5Fy9Zx8CMypF532H5klDTlLaMQL+FVH2bz9HfMQnISdQ3hW+e/HNIkq0Wt
         sf6gPLcHovHxe6Ml39vjVT8rjvXdZe7VVyYOoQDpE4rhgKnZoRva6YVJjZJM0kz6cgPD
         5vEJeAR2tSFGilTwTe5ncmteooPB65M0m2e6wQXBANthPhOSBYM/IiKKGKD4LtzBBN+H
         dSdFAVoBsvazXZJnhGy5VmpSqBIjzB6zVoriM12wcRhhszSP0gNZ22oT0KHDFGCPS3hH
         vJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nI3WwtbCNiZ2Zk5SCvVP/Kgega2HLjHouM+cLg+LA48=;
        b=HhDpRvLV8Ati6hkjhn8NEsszjDMRVlkgI36MenDhF945O5XjbZB5uVVmF4ixVweoir
         dwbi8vtUzg2qIrc8f5sLXMu/xcfVWnYYXT3zLB6MpAD9eobxofUDK2ZPD9R4XuHP2au3
         W8sLIy+ywT4WOQ6qg0UHdkhA1gJSXaid7dzJLeYcWjoAYu05du6wYCeHM5S+FKUCeeDk
         JGTeNExBedkpLTqJfPASxtjx/qRwA8lUcmX/gMH5MrsYSraEpTKdq1yWDEQYa/TcT0IJ
         x4yGLjVTEsYSbgthkdNhSn8+osz2NSiV6mnQ2uMOqOMNrkC5h+QuMfUCxRsujANdJXQf
         xsQw==
X-Gm-Message-State: AOAM530m6aOLY2ztKtWLqUqPnSjnkXu3sTOlEc5HtAFilwXJNvB0z218
	A0QyE2vLldYkuIV2Fn3EYeC0ER7gRXT5ww==
X-Google-Smtp-Source: 
 ABdhPJzWiYNlj88kjdo+hVO48iajFe5HxtwQHx463DidBe98cP2ftkaNzeT6sjxZh2hm6YAvLI+N0w==
X-Received: by 2002:a05:651c:a12:b0:249:6857:99e7 with SMTP id
 k18-20020a05651c0a1200b00249685799e7mr6327879ljq.411.1647693143292;
        Sat, 19 Mar 2022 05:32:23 -0700 (PDT)
Received: from peterliu-Precision-7530.lan
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 bu1-20020a056512168100b004437db5e773sm1289179lfb.94.2022.03.19.05.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 05:32:22 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] kernel-fitimage.bbclass: introduce
 get_fit_replacement_type function
Date: Sat, 19 Mar 2022 13:32:19 +0100
Message-Id: <20220319123219.256172-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 12:32:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163468

From: Ming Liu <liu.ming50@gmail.com>

Avoid to set KERNEL_IMAGETYPE_REPLACEMENT in anonymous python function,
otherwise it chould not be overridden in config files, for instance,
it's being set now in meta/lib/oeqa/selftest/cases/fitimage.py.

Introduce a get_fit_replacement_type function to get the default value
of KERNEL_IMAGETYPE_REPLACEMENT, and it could be overridden in config
files.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 8a9b195d6e..df5de0427b 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -1,14 +1,9 @@
 inherit kernel-uboot kernel-artifact-names uboot-sign
 
-KERNEL_IMAGETYPE_REPLACEMENT = ""
-
-python __anonymous () {
+def get_fit_replacement_type(d):
     kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
+    replacementtype = ""
     if 'fitImage' in kerneltypes.split():
-        depends = d.getVar("DEPENDS")
-        depends = "%s u-boot-tools-native dtc-native" % depends
-        d.setVar("DEPENDS", depends)
-
         uarch = d.getVar("UBOOT_ARCH")
         if uarch == "arm64":
             replacementtype = "Image"
@@ -22,15 +17,18 @@ python __anonymous () {
             replacementtype = "linux.bin"
         else:
             replacementtype = "zImage"
+    return replacementtype
 
-        d.setVar("KERNEL_IMAGETYPE_REPLACEMENT", replacementtype)
+KERNEL_IMAGETYPE_REPLACEMENT ?= "${@get_fit_replacement_type(d)}"
+DEPENDS:append = " ${@'u-boot-tools-native dtc-native' if 'fitImage' in (d.getVar('KERNEL_IMAGETYPES') or '').split() else ''}"
 
+python __anonymous () {
         # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
         # to kernel.bbclass . We have to override it, since we pack zImage
         # (at least for now) into the fitImage .
         typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
         if 'fitImage' in typeformake.split():
-            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', replacementtype))
+            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', d.getVar('KERNEL_IMAGETYPE_REPLACEMENT')))
 
         image = d.getVar('INITRAMFS_IMAGE')
         if image:
-- 
2.25.1


