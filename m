Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66943C3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 14:29:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.19525.1721658564123017130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 07:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DeVRPDvJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-427b9dcbb09so32662065e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 07:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721658562; x=1722263362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=w/OjweEZkC2BLUZCjmwWoKQ3GKS4kiLK/5kyrAzEcyQ=;
        b=DeVRPDvJB/Qug0y2/LC/fWsnk4Og5nE0bwxdh8drlcZGxqPBDjxyVNCMvz2Gx+QGz+
         aRmTr7QMtfp/OHmxNYBCapGlkz4sb5ctub6+xFpGJycpCAln7cl4qOwx1tcVJXeIOJvM
         X0xaLyao0P49y2+31sQvvUcuhJtOKbRvuDQgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721658562; x=1722263362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w/OjweEZkC2BLUZCjmwWoKQ3GKS4kiLK/5kyrAzEcyQ=;
        b=VnKm5b1+gfjzT+MpkMSAx2lO5EvODYEt7ivBhXgd7xoNqSMi0QLDp+GUrKjJPu9a1C
         d3nGoolYLMdkUNf5X1cKU8QDwowm7ZRMvVzVDvikjvw7QEwDWd2AkutOb8apMrU9URcC
         ydnJqOhb76MMLU+sQmlxPVz7gpGcEKS9hjHORodWKcic7HcuCrr1dl1+8fEhjtFVeGZd
         6UOW3SL7/IhKfBTCvGol5W+H2uKi2FMpkxXERwuIhosO4dCg33DL1FJLEVPQM4YP5pEw
         JcT3gr90muvltSPZrxSAvjnmCLylkgUndZA2ZTAN+DZnUAWdfJbh4G3l0pYIBM8VjjhB
         /vdg==
X-Gm-Message-State: AOJu0Yy9M2V3BY+8zpIaJvizB8H8g/ree2sPndiamWSPNb8ziPq7RMR3
	aaxWZRkFBYBJzuwYG56tJ2Qf1Z60xicicjZ6A6lYsowl/Ovj9eeyQS/C7fIYQ1cagSeRkRXp59f
	7
X-Google-Smtp-Source: AGHT+IHeSU8SfaJxnkgVmY+H9a+VhvvYO+juMWd+YWJR3gGm5bdhYfVUN44KuP90bSBQr+gdn0QsUg==
X-Received: by 2002:a05:600c:1d29:b0:426:61af:e1d6 with SMTP id 5b1f17b1804b1-427dc558537mr53690055e9.29.1721658561845;
        Mon, 22 Jul 2024 07:29:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ff2:149f:b661:e63c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6901405sm129399885e9.16.2024.07.22.07.29.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 07:29:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] time64.inc: Add warnings exclusion for known toolchain problems for now
Date: Mon, 22 Jul 2024 15:29:20 +0100
Message-ID: <20240722142920.1202402-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 14:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202314

Fixing our infrastructure to show warnings for nativesdk packages resulted
in some issues with 32 bit toolchains and 32 bit time becoming clear.

For now, add INSANE_SKIP entries for these which effectively documents
the issue and allows us to at least start running the tests in the
infrastructure.

Over time we will need to try and fix these if upstream doesn't.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/time64.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 6ee7b491526..2c23dbd6cbc 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -42,3 +42,11 @@ INSANE_SKIP:append:pn-strace = " 32bit-time"
 # has the same INSANE_SKIP setting.
 # Please check the comment in meta/classes-recipe/cargo_common.bbclass
 # for information about why, and the overall Y2038 situation in rust.
+
+# binutils/gcc/gdb still need fixing for qemuarm/qemuarmv5/qemumips/qemuppc
+#binutils-cross-canadian-arm-2.42-r0 do_package_qa: QA Issue: xxx/x86_64-oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-ranlib uses 32-bit api 'lstat'
+INSANE_SKIP:append:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = " 32bit-time"
+#gcc-cross-canadian-arm-14.1.0-r0 do_package_qa: QA Issue: xxx/x86_64-oesdk-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/14.1.0/plugin/gengtype uses 32-bit api 'ctime'
+INSANE_SKIP:append:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = " 32bit-time"
+#gdb-cross-canadian-arm-15.1-r0 do_package_qa: QA Issue: xxx/x86_64-oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gdb uses 32-bit api 'lstat'
+INSANE_SKIP:append:pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = " 32bit-time"

