Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5730CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 13:05:00 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.10367.1761311092613969596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 06:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LpzFKihk;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-89e81dff0d1so25168185a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 06:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761311091; x=1761915891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rLzyTUw2mYtAFcGx6IauIL9mMAwNc7bM2ZTcMQA2WOg=;
        b=LpzFKihkeBtepzlKtIdaaNS3c0mFQP3LBYsAOQ7JQWfvEvCveHDt6VCs100MHP61C4
         WxBsjLhG/tZHdbjA9y4mlnO0MN9mw2Dtd59rBOXRpZeQY6B273uFMLPrw15A1tcd1Yu7
         BXDC0KJ4jQU1Bs009/7nlTSYAhVV6pLxRg58pE/ElV+m2nmcoQ825ElIwKBdMWePCkvg
         O/bqXqvbIeK9YoBXhj0+0pnlOXAR9abQmhKQpfdA/Da14EMfneSNXdTbZNTQeJLdJgAk
         A+E8RFoYgYVJzbBAtNMchpuCCfldHj1k4zTfFPBmNKifdr18ajAgSP9aHrVE7vWrzQYb
         rOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761311091; x=1761915891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLzyTUw2mYtAFcGx6IauIL9mMAwNc7bM2ZTcMQA2WOg=;
        b=EN75qDJKVeNUyz8qclgjQ8ELsXhom4a55bUIFHXfLth4vpDjjg63lzyL271BdEUdPo
         q6A9mlrHT75HYeQQT57o7Y9MbgkyU2oRwQ/1Sfm5s3LtMFX+cL927QWIhCtkgCP7KscG
         urnVrYyVYdWbOG8zbUyA5a1T4Qwz3uwFsReKx7SYd27RZfCL9zb3Fo2THAGjqcuwRSKy
         d12XIYwjy4us6Mz73K3ZYJM3M5o5xuD2FEnmxNo1eR/mRg1v6MZd2EBeUEs3auJK/xhY
         1g95NiIcH2XjB4yU7gMKNm8Dc5aJbOSop/FOgzsGus6wYPB5lCYpZZwQOlEoBRSTsnZb
         pYfg==
X-Gm-Message-State: AOJu0Yzguqz/f/K8MIoLi3dCkI5s5H2cvS1S7tyq/azssW4TR56dMqQP
	uskLyMMSaABGYWkz7bR5zSiebvy3lYDemOyuNHzDnQlZFuiGEPv2+fRX
X-Gm-Gg: ASbGncuTJqXWutBEjGTHXgutn1iuocUhg3n7w2J8L40rIwqSk5BcYb97Gm2wZPJSgdJ
	r+C6g0IzwE0KKIl1HFro0sYLZHIYOPkYA2PYhL7+2gyuygAcQcbIHMK3OocHrm0QwI+vnQtmcuW
	tU+uKd2iv/wiM3CeMgvWX3ZI6HlzLmxJexCIq0nLYlXk+OU6hZ+qporN9dD37k3nDh5fLehVeI4
	GDDZcWJ6Oz1xmtgNMiwElaJg14N7n/kwhWxiplejE3s9iIDHGL0wZv1be/N0j6GtbVkU9nFRrRn
	RZyD6/6s5ZwudHXOPGYXlbHMqGqeZe3psii/xx2A30Rbin+usGYAVVnYcq+Cpzi6N6+hZrYajm5
	q3QqYDTnzMaItL74oY556zkreFrJcXFYPbW0Teij71k/25aq/Y1xUfzIrgTN9eUr3dQNv9prjJ2
	ad6xLcfsnZXHX7LnG9eaYkNa0PttXdgcvGlSBT+wlCWAo63EiQpe1EII51w2Y+bkq/bJYY1MIIk
	qTUISvjKT3GrMQ=
X-Google-Smtp-Source: AGHT+IGSFM7GpQX3yafC7yPk60opIBiJj2TC6czjLEkjv7Ifkqop9S3Z42d1TxihPG4WEr3f/5VVzw==
X-Received: by 2002:a05:620a:4627:b0:89a:3233:db11 with SMTP id af79cd13be357-89c12d0794cmr728860985a.81.1761311089751;
        Fri, 24 Oct 2025 06:04:49 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89c11e631e4sm380480685a.44.2025.10.24.06.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 06:04:49 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-modules: update to v2.14.2
Date: Fri, 24 Oct 2025 09:04:47 -0400
Message-Id: <20251024130447.3599900-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 13:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225292

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This fixed the build against kernels 2.17+

Bumping lttng-modules to version v2.14.2, which comprises the following commits:

    6826c7f8 Version 2.14.2
    d0230a56 Fix: Add wrapper for `get_pfnblock_migatetype`
    65ea32fb Fix: Protect syscall probes with preemption disable

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../lttng/{lttng-modules_2.14.1.bb => lttng-modules_2.14.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.14.1.bb => lttng-modules_2.14.2.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.14.2.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.14.1.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.14.2.bb
index 3af6db5a83..c9c0b17291 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                 "
-SRC_URI[sha256sum] = "a87684b8a58f426e9574c4aa7591d6e49d54469872f9641652df2b4a938f9a40"
+SRC_URI[sha256sum] = "a581dd44ea61af869a935e71498d4273be59944d56f906135c6451d6548742a5"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
-- 
2.39.2


