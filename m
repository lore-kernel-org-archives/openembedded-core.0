Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.87401.1597843489430695170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 06:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rsRXQDdk;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id w2so11187546qvh.12
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 06:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q+KpMkZrwvJNybkuW5j7SOtm7ADOy72oC2TwvPut9Qo=;
        b=rsRXQDdkuCg1HQO3gxhg8FOMfAQxMTk5X4UCcpKfvAQQSyLy2gxFJDHzAUCpgBtTlQ
         nsPhLBWObtSYTshkUnbXT9J5jq9FYvkNB0BIzjskB9M9XLQnNWFrNLkvk+0HnaPTAX3b
         K1eIAkBxwu+PZ761XwKTMSQeC72oB6Lby3bTRG354jwolf1SVvi9KuB35A6i3yQZc529
         44pYhvsmP/sr943uxh/298iZbAzl1QXDHf2rN5TXEFZ2g4+xgzVCNtzaiumd1bvtco5b
         Fjr/ByGszL09hGPM95Q3beYdY3I+cgXjTlX8A42JuILfdooFegHgBnnC02JFXyD31cY3
         3DoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q+KpMkZrwvJNybkuW5j7SOtm7ADOy72oC2TwvPut9Qo=;
        b=CXTuyUERonKwSWHLvzK0Ti4n6CN/kQlXaUdbvBg9RkZuUIRyURXAjkGjSx2+yKtvVq
         zSZyIYQaSfrsAL6Opr9ThTqr1srxH+bXNdkrZtoT52IOt6p1PvbFZSnnm7MCN0koYi6Q
         Ajq8vv2h5C4CLb48pXv4gHHLdMUnKaH68PO6gmVP09rDWJsVwth8pvkqiPPswshUnr/R
         ugxt0uCdw+8FqRrI7E3mCJWr29Jj9MGY6GnUtWGUvsTxDCJ0wBwpc7Oo13USUeIj0KRj
         z0MCiN2w4QrTnbhse9vOLAKev10N6GccYiBgcA1a072xyAIuSrY17Y3Uf30EBLZnR98N
         QP9w==
X-Gm-Message-State: AOAM5309SLFpiUKVuaaIJtww/1SR+xdTLzv/nPaCYZgdhFCpynX3DLtG
	Wxrz+cThzSjwK0iSaGjZs0M=
X-Google-Smtp-Source: ABdhPJzpe8nDArDFVIeejI4/DI5KMwaCba/OoD2KiB/i2qFmU0NRln+pUkTxOhQSpoPv1eyqD53gyQ==
X-Received: by 2002:ad4:54d4:: with SMTP id j20mr23385187qvx.6.1597843488577;
        Wed, 19 Aug 2020 06:24:48 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id t93sm26873088qtd.97.2020.08.19.06.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 06:24:47 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] kernel-yocto/5.8: add gmp-native dependency
Date: Wed, 19 Aug 2020 09:24:41 -0400
Message-Id: <61cc7e76ab381220da8ceeffffbaeb5e34a3149b.1597843173.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1597843173.git.bruce.ashfield@gmail.com>
References: <cover.1597843173.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

With the latest gcc10 plugins, the host tools need gmp support
or we end up with:

  HOSTCXX -fPIC scripts/gcc-plugins/arm_ssp_per_task_plugin.o
In file included from
/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/10.1.0/plugin/include/gcc-plugin.h:28,
                 from
/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work-shared/qemuarm/kernel-source/scripts/gcc-plugins/gcc-common.h:7,
                 from
/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work-shared/qemuarm/kernel-source/scripts/gcc-plugins/arm_ssp_per_task_plugin.c:3:
/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/10.1.0/plugin/include/system.h:687:10:
fatal error: gmp.h: No such file or directory
  687 | #include <gmp.h>
      |          ^~~~~~~

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index f9d23072fd..27345beca9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -34,6 +34,7 @@ LINUX_VERSION ?= "5.8"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
+DEPENDS += "gmp-native"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1

