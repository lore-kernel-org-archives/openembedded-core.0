Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BC2C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:27:54 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.23772.1641767273028350902
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hQ0AN1RJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id p18so843700wmg.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t+tDZWBY5+XZvBKxi76jZ4fWxOvSWJv7Ak2kSLRo+FQ=;
        b=hQ0AN1RJo3vyjkDlDxfEvCa6bGhN694Y1DPVsuCxqUPQ+NR76wbjf1a3FYR3GK7rPa
         TjtC7cDn7Z6JgEqw6ZcI9maG7U08uHORJdV3rTq/mfxRdGp3NpwPlI3U7jT7dW+SQllM
         y35skEqqwzWelRWD4GKVIs3jMJL4EdZ8FXBB+cU26G2RjGKhknHxRX001E3fALwRgD4k
         H1mh4ylwSTZpR96JOSekx4MeBakeVspOcfdrnnWZ2Npvp/1jbKE21iSOIvgSXNVXVYwr
         MstckO+HiOdGRb4UB8u6sOZxGbP1ui9eI0jZRaQMYls/UMCz+mb2JVi7C2BreOVA6LIN
         fV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t+tDZWBY5+XZvBKxi76jZ4fWxOvSWJv7Ak2kSLRo+FQ=;
        b=rqmGHUuJLCS71JPwmSpUfgXjwGlyZVP4Za7sNnxluKCeuodRsU8w9TW4NK3h9qgOpN
         D6s1H0+hAc9JmDvO8vd94YyKWsxF4DQh9R6WcrC53HP0otNBRtjqQa2vs5L+njD930hI
         S4ol1bVzXaGhMFgdaZ/9bbabz1crObygtmfa0KTDB7Bpf4wPNIP0ZsrQ8qQMindTpEvZ
         nIi5V82F/J0JBZJokTPQIEPBeaucW+k38IUQgRI1/x4TSFVp6U5DzfBVlJJxe3WxdfrJ
         NWlNdd8SKw5OIEsFy7NzOY9fqzxPYh5GLLC9Q+AyADSHbA9r36r7X7WyyIx03cyeYvWO
         WZnA==
X-Gm-Message-State: AOAM531UMUKhSL8oKMwA/i6IASkbSglhvS3tUZMKmMONWcMP7RMdMzXV
	+2DMVbcaqsjWju6tTGuSmCwdUc8eWrU=
X-Google-Smtp-Source: 
 ABdhPJzO8DEl4zhk1vcHAHQyqs/ZT73iLSa8nXNdG/di6VwYj4jKoKFjwlgeJ92pI47CwA9Nvl44NQ==
X-Received: by 2002:a05:600c:510f:: with SMTP id
 o15mr19496592wms.104.1641767271679;
        Sun, 09 Jan 2022 14:27:51 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l6sm6804319wry.18.2022.01.09.14.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:27:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/14] ruby: disable rdoc due to non-reproducibility
Date: Sun,  9 Jan 2022 23:27:20 +0100
Message-Id: <20220109222732.2252416-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:27:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160305

The issue is reported upstream:
https://bugs.ruby-lang.org/issues/18456

Otherwise I do not feel that further investigation of rdoc's parser to find
out the source of non-determinism is worth the time.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 3 ---
 meta/recipes-devtools/ruby/ruby_3.0.3.bb     | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 35ad0009a8..a0dc76977f 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -17,12 +17,9 @@ import stat
 import os
 import datetime
 
-# ruby-ri-docs, meson:
-#https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210215-0_td9la2/packages/diff-html/
 # rust-llvm:
 #https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210825-kaihham6/
 exclude_packages = [
-	'ruby-ri-docs',
 	'rust-llvm-liblto',
 	'rust-llvm-staticdev'
 	]
diff --git a/meta/recipes-devtools/ruby/ruby_3.0.3.bb b/meta/recipes-devtools/ruby/ruby_3.0.3.bb
index 95feb94dd4..5cf0625101 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.3.bb
@@ -21,6 +21,9 @@ PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
 PACKAGECONFIG[gmp] = "--with-gmp=yes, --with-gmp=no, gmp"
 PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
+# rdoc is off by default due to non-reproducibility reported in
+# https://bugs.ruby-lang.org/issues/18456
+PACKAGECONFIG[rdoc] = "--enable-install-rdoc,--disable-install-rdoc,"
 
 EXTRA_OECONF = "\
     --disable-versioned-paths \
-- 
2.20.1


