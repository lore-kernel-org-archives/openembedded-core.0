Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8527CC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 22:59:45 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.4064.1645138784774420553
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 14:59:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TebNOmLT;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id k1so11482198wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 14:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5Uo7fK2DDBJbIlqyHctniYrNTBTefZBk1tGeQNamEY=;
        b=TebNOmLTJRwkdoN+hMp0ix2DJtzKPuUlWD2HoAl0LjaAUc0JHeyvuHrTg6hw8eWhPV
         UZZnoDzAPm6L6DAPVxWotXJAtmR26fzoBSajQz0aI1cmXMIuzDzGa6vHDeOZFdzVRGJ6
         d+3zPkGBMNSNJmSMFv15R+yO+DKmw11rlWr9w+uHTHx2k2yLWwX9XgItnnI/wsYFWn0K
         d2zeYAiChvx4GYiQWFpO5J+GjKABzKN4lIIa4AG4/Su0k/N3lt8vXsXguNy/WAwCZ6dx
         ytkYCFRjzhR4ogu+W1NCAacKqJdWunysLpCuYM2+hYrYJzr6O8rCY+KvktcQbp9O8ndN
         lyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5Uo7fK2DDBJbIlqyHctniYrNTBTefZBk1tGeQNamEY=;
        b=WcaEcNhYKhOq2PPnGuUMGhkurjIclsNfj+oxfrWA8hLJEtgLcjCcOBPnxdph4FXNWF
         FZx44570ciyqXdcLhsBfsLagD4EuA8lFqcWGAJmal2WB16nxVC62E7w2VpuGUaT1wYaV
         RZZ7NvD4hD9wIaQmQf1g5P/46E71O1c3p1c4hh4gCczT7aMlaxCgUifmzUVAx4FZdFnv
         Z9QD5DyC+KjhX1sYPZPC2pZZb7mu9qnwkixA6yoE30iyzg/iuxvbeO+WVC5+yXfJJ3os
         4Ua+b6eQku14X3X4W41UT5rFjSlJyBDtbEzduCE+44OoHK/tYbiZ4NbtJD5ljgqcV5ZJ
         vMtA==
X-Gm-Message-State: AOAM5332s4sWAdsUeFUBKPvfIllcBl8/XmXvVKZLCup1z1Y7QE+kg6qj
	bJ0qukqhWz8YHr4EWywD8hkTDFT2IT+5GQ==
X-Google-Smtp-Source: 
 ABdhPJwCfQFwHuPEzMORc3wA2LVCm4JIEI6IPxyXyzwUYSWGDh6+O0ku5hySJ8JBKQhcCPJozaCt3g==
X-Received: by 2002:a5d:4c41:0:b0:1e5:1a70:fb86 with SMTP id
 n1-20020a5d4c41000000b001e51a70fb86mr3840973wrt.452.1645138782877;
        Thu, 17 Feb 2022 14:59:42 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 b16sm2966669wmj.32.2022.02.17.14.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 14:59:42 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/2] meson.bbclass: add exe_wrapper helper
Date: Thu, 17 Feb 2022 22:59:34 +0000
Message-Id: <20220217225935.727335-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 22:59:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161866

commit 40349dc51f097f75b486d81924753dee06baf017
meson: configure and use generic exe_wrapper
add a generic exe_wrapper that can be used to run
the existing tests in some meson projects using
the native meson test.

The tests will run on the qemu usermode and because of that
it has some limitations.
The ideia of this help script is to handle such cases before
the qemu usermode was launched.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/meson.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 0bfe945811..8c732e6174 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -114,6 +114,8 @@ cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
 EOF
 }
 
+MESON_QEMU_WRAPPER_HELPER ?= ""
+
 do_write_config:append:class-target() {
     # Write out a qemu wrapper that will be used as exe_wrapper so that meson
     # can run target helper binaries through that.
@@ -127,6 +129,9 @@ export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
 # meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
 unset LD_LIBRARY_PATH
 
+# import any customization provided in the helper
+test -f "${MESON_QEMU_WRAPPER_HELPER}" && . ${MESON_QEMU_WRAPPER_HELPER}
+
 $qemu_binary "\$@"
 EOF
     chmod +x ${WORKDIR}/meson-qemuwrapper
-- 
2.35.1


