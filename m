Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D39CCA499
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 20:52:56 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.2574.1654635170353228842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 13:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WbDRes+D;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id h23so26506861ejj.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 13:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0dtRdeGqoeeXnLpMcQLJCUxF28ezti13rutNBJ/LwAU=;
        b=WbDRes+Dt8L7gpUOPvdLxFNF4lT8cZ522+MDjc46QqqQJ4SOf6k67p0fb04C3qAO7y
         /obIpJmhrWND/yCrnkmEdUGW2cFiIGr9jeSHGY4Z0YofKkK5mjKJqiI8szzRJzgtICX5
         NeBfzRyGJE2WuLq8dIPUp4l6VqYLBYC4kpOSU7TjKL23hOiiZAGHDUsiWJe4Vq7f2zk+
         0RcUqdzNwM8cVbFZ5MxHwzZBggKjrbrkoFJXivbvBWf0pw8FuM+QMW40cUnS4If5aKqg
         IElcWh9W2WJqu7vqCaiozIgRDc33I9SAaYUkwfJNHk0D4yP/OyP10nKoldZ9ILMOP9aG
         VAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0dtRdeGqoeeXnLpMcQLJCUxF28ezti13rutNBJ/LwAU=;
        b=y+Gc+6pcz4snzoMLSda1AGtPnCkgRIX7yDcBV4TEFyvvEsEgCjeB27csyg0xFwkoXY
         b+iUjeVozAL3Zm8yNRQ2rqriu5KOjSK6Vc+izcheFcI6ltYWQSaqr4ftIVVi9sGxBPGI
         5qKZY4W6f/FtUeHmgr0+U6fxK34VLGaaKPYPOH1e2AuMBm9JOji8D76KifKZddXm/dqk
         i41YSm5Q24tpO2SmhB3ELtXVeCPFcKs7pVlxMajPjkTZncuqjP58frQFMAFSpTmWrsGm
         lgbBytqVdX1+HbyWbfRI/15TmsOT3/0oqizS2oI9/vDBv7SykovEmpCt0wk90EzMiPuE
         wsUA==
X-Gm-Message-State: AOAM531SeGbqsXWblUQ6gjzAOta+1TikoYNpfgou20YNQNiNpl2FA//f
	qnFRGvwmTOo9wqfm72VjOhe0XdPQkxU=
X-Google-Smtp-Source: 
 ABdhPJw8wJiADF+YD/secTtozNbu5o1QnCr/Ub2ex/5xS8hxRuJZ5WiVddbBWYuITJzoD8bl89VqRQ==
X-Received: by 2002:a17:906:9749:b0:6f5:6cd:5bd9 with SMTP id
 o9-20020a170906974900b006f506cd5bd9mr29687545ejy.523.1654635168636;
        Tue, 07 Jun 2022 13:52:48 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 g11-20020a17090669cb00b006fec1a73e48sm8188993ejs.64.2022.06.07.13.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 13:52:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] rootfs.py: close kernel_abi_ver_file
Date: Tue,  7 Jun 2022 22:52:42 +0200
Message-Id: <20220607205242.1773119-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607205242.1773119-1-Martin.Jansa@gmail.com>
References: <20220607205242.1773119-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 20:52:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166687

* fixes:
  oe-core/meta/lib/oe/rootfs.py:331: ResourceWarning: unclosed file <_io.TextIOWrapper name='pkgdata/mach/kernel-depmod/kernel-abiversion' mode='r' encoding='UTF-8'>
  kernel_ver = open(kernel_abi_ver_file).read().strip(' \n')

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
2.35.1


