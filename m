Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2B8C43217
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.7323.1649861407369587367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 07:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lv1vwD4/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id q20so1250838wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GluB+T3Dj4JCOENCPQXslcqhsMeidxYNKD5M0qut6nQ=;
        b=Lv1vwD4/JCGphD4OiM+E5xh8SqbYhDgz8hON0/uEnFPOdVszE+9opqJ/Frq49cvCBH
         A/aWaQjpq0Er8PU+ieCFkeT+bFcG+aZK+wGv0ujnA5RZ50PXCH1q4dvpoDCGmWScjKHk
         nPqQ/oNwhTtB83Iw/IR4wt3NOYaYVpX67z8Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GluB+T3Dj4JCOENCPQXslcqhsMeidxYNKD5M0qut6nQ=;
        b=zq6H9Hnsoqiaf539grmujeeEI+5NDB011IliiVHrngJ+bFrqVjn6awcN8fIjVWBrAX
         G6Ck1tguRmqU5k6mFvr7P4zcsO0SdjZbt1i21+JVkhLQfbIzBS6On/U4dEmrqRlWrgst
         4bZaEfU1ypye/6I+g+tyJEDfV5QCqp3n1h/iGA7E4D+eWgVKcTnDEzHPSG88MLJw9nLx
         ZFRC1DFYGWx60WQWGPHq66AWxhcUu4ArdQpuGq8Eo4KxRUM39xoGUqQgq3IPAIoMTciW
         9eeA1SoRr35M4DCNuATolT4lABqyolfoEmGPf3wgLBe7CGWOUw2yCWfctqLCe8i2LJS8
         014A==
X-Gm-Message-State: AOAM531eZ/TIx+/AsmnkkQzIfjTpCRlrdmBnDzeQNx/mIv6dpQcJOQNg
	JHwkJe59u1suDql2vNrIyIAt44WdSehmHw==
X-Google-Smtp-Source: 
 ABdhPJxZdwVUzwgOgcXW2m8EzSR0Xrhy2knsXZ+LmLr86myAHPPujRhXVgdL8weByumqHq8wbmkmcA==
X-Received: by 2002:a05:600c:4ec8:b0:38c:90fb:d3bf with SMTP id
 g8-20020a05600c4ec800b0038c90fbd3bfmr8896286wmq.0.1649861405416;
        Wed, 13 Apr 2022 07:50:05 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5cc2:b4ab:4d4b:907d])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm3130114wmp.44.2022.04.13.07.50.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 07:50:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] runqemu: Allow auto detection of the correct graphics options
Date: Wed, 13 Apr 2022 15:50:04 +0100
Message-Id: <20220413145004.2171939-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164326

Running "runqemu qemux86 kvm" when qemu is configured for sdl and/or gtk
display output currently leads to a poor user experience with no cursor
and corrupted fonts in the gtk case. This is due to no options being
passed to qemu which leads to the loss of the font envirornment variable
and the show-cursor option.

If the user hasn't specified a display type, grep the output of
"qemu-system-xxx --help" for the display types and pick the "best"
which ensures our config is passed in. That resolves the gtk font issue
and the cursor issue with both sdl and gtk.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2f77a7bd0f2..664a073807d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1363,6 +1363,18 @@ class BaseConfig(object):
         if (self.gl_es == True or self.gl == True) and (self.sdl == False and self.gtk == False):
             raise RunQemuError('Option gl/gl-es needs gtk or sdl option.')
 
+        # If we have no display option, we autodetect based upon what qemu supports. We
+        # need our font setup and show-cusor below so we need to see what qemu --help says
+        # is supported so we can pass our correct config in.
+        if not self.nographic and not self.sdl and not self.gtk and not self.egl_headless == True:
+            output = subprocess.check_output([self.qemu_bin, "--help"], universal_newlines=True)
+            if "-display gtk" in output:
+                self.gtk = True
+            elif "-display sdl" in output:
+                self.sdl = True
+            else:
+                self.qemu_opt += '-display none'
+
         if self.sdl == True or self.gtk == True or self.egl_headless == True:
             if self.gl or self.gl_es or self.egl_headless:
                 self.qemu_opt += ' -device virtio-vga-gl '
@@ -1415,7 +1427,7 @@ class BaseConfig(object):
         if serial_num < 2:
             self.qemu_opt += " -serial null"
 
-    def setup_final(self):
+    def find_qemu(self):
         qemu_bin = os.path.join(self.bindir_native, self.qemu_system)
 
         # It is possible to have qemu-native in ASSUME_PROVIDED, and it won't
@@ -1434,8 +1446,13 @@ class BaseConfig(object):
 
         if not os.access(qemu_bin, os.X_OK):
             raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
+        self.qemu_bin = qemu_bin
+
+    def setup_final(self):
+
+        self.find_qemu()
 
-        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('QB_RNG'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND').replace('@DEPLOY_DIR_IMAGE@', self.get('DEPLOY_DIR_IMAGE')))
+        self.qemu_opt = "%s %s %s %s %s" % (self.qemu_bin, self.get('NETWORK_CMD'), self.get('QB_RNG'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND').replace('@DEPLOY_DIR_IMAGE@', self.get('DEPLOY_DIR_IMAGE')))
 
         for ovmf in self.ovmf_bios:
             format = ovmf.rsplit('.', 1)[-1]
-- 
2.32.0


