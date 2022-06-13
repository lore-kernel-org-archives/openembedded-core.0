Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EABC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:57 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.6334.1655130176081072405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nUwpOwWj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id u18so5242314plb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=J/pBgSHrLIsoASc+RXb1HgfqNGa0Ul9OJ+Med6NN2VI=;
        b=nUwpOwWjk/55XzyQvVd0oQRChJvAme4GWcSH5wqdbSCFUyGVJpB3KaVjFkkX4RHZZb
         NRZmkE9G8NRYlXV2B3UcpyJIqCrOkTIwhkuZRw607pEjH10WcgW/WJMdfE49v7OFp5rj
         RdlxxobJoh/IqbGNmKLK71YeKG5Rh9EZYlwV1qA140/q7YMzP4dROgL30cKqyoXk9RyU
         4jAV3P7wXw+t5tcX4fW3j2QlD472M1/yTQOVDMTnLOcZll68D5uj4OF1p/BAl4fAPRQP
         my3CWsWwWWsso3wkGNEGazWt8uVsSM+ND7+4a6f3FdhYIoo0gLqnHzd4o0Z0qpJnNRZx
         Fl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J/pBgSHrLIsoASc+RXb1HgfqNGa0Ul9OJ+Med6NN2VI=;
        b=gesig/fY6XTID3Ii7RCs5wIm5yjEZsKz9co513bl9iZojQOGbKWN12tqGRVJKZ+/at
         avPfDNTlCk9Mhj1BkjUhXPmvkUgNpfFXWiU1x3S35K86fbLxrzpaCcV808m861XKu4fQ
         qmi5e9vtJUGfqg++WZqdbbH9o/hUyMEvQZ+qXxeJFnXk6ibIQfzGo1JCs2aU0pkAza5X
         K8qNbBPPIM1TX0xh8BtX5U2sfw+IvIgEjOxZ6sxI+mPr19GZnMGL5m31OPvkCwQ6n5lI
         q+9M1H5i41rzeKS3o2/BWsL+90XkYbB0FWTAcX736P6u19t98Dqj37/089L3zZk2tx0i
         bTyg==
X-Gm-Message-State: AOAM530xDxox9iSMh6Vxjgh3yqc2Uz6C7hdR4/xs5zfHwQnMVZQIuYF+
	jTR0XloCNjQV75jqYS80Im4y6//M7VUsRPF4
X-Google-Smtp-Source: 
 ABdhPJz273p2pkIIgfMdkx9gxfdiDi84aeb3wY7lwgFo0Fx8nrouSLSqwpO/MpBPWH5WYvYuQQHysA==
X-Received: by 2002:a17:902:830b:b0:168:e27c:1a56 with SMTP id
 bd11-20020a170902830b00b00168e27c1a56mr3458082plb.152.1655130175123;
        Mon, 13 Jun 2022 07:22:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/20] rootfs.py: close kernel_abi_ver_file
Date: Mon, 13 Jun 2022 04:21:52 -1000
Message-Id: 
 <0f7a8359ba370c7f5d5153453ed699e9566f5b1d.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166864

From: Martin Jansa <Martin.Jansa@gmail.com>

* fixes:
  oe-core/meta/lib/oe/rootfs.py:331: ResourceWarning: unclosed file <_io.TextIOWrapper name='pkgdata/mach/kernel-depmod/kernel-abiversion' mode='r' encoding='UTF-8'>
  kernel_ver = open(kernel_abi_ver_file).read().strip(' \n')

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f9dd8ee063c1132265248457fcd628e1e93727be)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/rootfs.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 61ccf369f1..9e6b411fb6 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -328,7 +328,9 @@ class Rootfs(object, metaclass=ABCMeta):
         if not os.path.exists(kernel_abi_ver_file):
             bb.fatal("No kernel-abiversion file found (%s), cannot run depmod, aborting" % kernel_abi_ver_file)
 
-        kernel_ver = open(kernel_abi_ver_file).read().strip(' \n')
+        with open(kernel_abi_ver_file) as f:
+            kernel_ver = f.read().strip(' \n')
+
         versioned_modules_dir = os.path.join(self.image_rootfs, modules_dir, kernel_ver)
 
         bb.utils.mkdirhier(versioned_modules_dir)
-- 
2.25.1


