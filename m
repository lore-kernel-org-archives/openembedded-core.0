Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359F8C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:51:04 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.18881.1724244654229088744
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BwBSSoIu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-70c9cda7f1cso2934599a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244653; x=1724849453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQt7QtS553QQXBjWLgJAic+zhDha9IbVo201V8/My3g=;
        b=BwBSSoIuE4nfAXPA8XMHEJsi3zQDMX9ay4TnELuBSejFxQQsVL60zI6595RC0fvTPD
         dfJgMdu8rzqZP6rm/1x5jTO4aCGSTqz6RFmpQoaIJFS0KFbIeJ7HVF21qQ4FghR9FJcW
         lRODQkKv4nhfsilKOlJXAXtbOZT9P9FaJtrjBlqXrmFCSDPOvhgYF7b/+IM2A6NExSZz
         YINAW2ACgY6BNFD4YSxb56k/q5UGl8nF0HavGjGz41Ruy7MS1wOO2Ne2XPUVweatyZAG
         PEdoTeCGXh6sVc8WxaN76fGLZWQDdRfPIOei/OSHuuayyPq9fPBlR08hp5h93mNGVDUv
         IwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244653; x=1724849453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQt7QtS553QQXBjWLgJAic+zhDha9IbVo201V8/My3g=;
        b=mIjtMf9rNcJ190Asf0FHM4+U6q0/vk3vprbIlIfWp8S/C07h9fadyX3mXXKzv/ZTP6
         7+QQmfDiEmskVdkARH8Rj8HiOf7J6V4oqPmsFi/sn6RbDxhdKdP/t7c63jo4sWfsmufn
         OYrElykdA/K0d5RrotwRf0wv/Yei+kVBzXaYodnhD7w1+CS49zpdLrnsyzyNi6DaJkTt
         tgWRUZimqKJeMFZlRq+l+CVD3WEzRJFU6xk9KNMBYuCroiq5WYDikGkn5pdWNGTSVJJY
         zA06kGwggoWUkKafd3DqtVIu2D1LWFyYLQHtBevE/dTS4u7DfUzRy2mmJmHIx3bo5lug
         KSrw==
X-Gm-Message-State: AOJu0YzSYDwr+gemDB0G7DlJPVzuTJhrn0JGKWV7M+3NSPXQIBySSTb3
	dHtUpkeJFtag3Rj8Tm/m/qXXqYEC0TKTd4jLbpkfe2ge3/6GRspk+7e1KfweHx1Hv1TLPVJomqC
	ceBY=
X-Google-Smtp-Source: AGHT+IElaEy5bGrzeQF8obxI54acosIeZCSyE6tGw3hSf5lH0Z9cOZZ8I5FH8kwBYAbXry+D4uLfyQ==
X-Received: by 2002:a05:6870:b621:b0:268:9f88:18ef with SMTP id 586e51a60fabf-2737ef28a25mr2498926fac.13.1724244653297;
        Wed, 21 Aug 2024 05:50:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/18] qemuboot: Trigger write_qemuboot_conf task on changes of kernel image realpath
Date: Wed, 21 Aug 2024 05:50:24 -0700
Message-Id: <fd21b5fa159e4c612475152e998ae85526fd60d9.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203601

From: "Weisser, Pascal.ext" <Pascal.Weisser.ext@karlstorz.com>

The qemuboot.conf file contains the realpath of the kernel image
referenced by QB_DEFAULT_KERNEL. So, it must be recreated in case the
realpath of the referenced kernel image changes.

The variables KERNEL_IMAGE_NAME and KERNEL_IMAGE_BIN_EXT determine the
realpath of the kernel image relative to DEPLOY_DIR_IMAGE. Adding both of
them to the vardeps of the write_qemuboot_conf task triggers the
write_qemuboot_conf task in case the realpath of the kernel image
referenced by QB_DEFAULT_KERNEL changes.

Fixes: [YOCTO 15525]

Signed-off-by: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8b3975a9ce36ea7af5fd76243a823da2842415b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/qemuboot.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 895fd38d68..0f80c60ab5 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -129,7 +129,8 @@ addtask do_write_qemuboot_conf after do_rootfs before do_image
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
-                'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
+                'KERNEL_IMAGETYPE', 'KERNEL_IMAGE_NAME',
+                'KERNEL_IMAGE_BIN_EXT', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
                 'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
                 'STAGING_DIR_HOST', 'SERIAL_CONSOLES', 'UNINATIVE_LOADER']
     return build_vars + [k for k in d.keys() if k.startswith('QB_')]
-- 
2.34.1


