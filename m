Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B09C48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 19:55:18 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.22818.1708458914928511147
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 11:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bAPztL7D;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a3eafbcb1c5so261237266b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 11:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708458913; x=1709063713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZeIfSEIIpmsbMrwsP6nR7jZ+X5pfzZ8vA9y0sYf084=;
        b=bAPztL7Dq9Qyv2AMMz0OYDXHmWAMRuAnUtptsW+/QQFVBii7fd/yyPj68HNRonf3Th
         ZnIGsXLVICwG057jA2QvqZvQWAzoblGlZIGA/QP3WN0V25YgCZd9o499/blfaD10SrVD
         h3Y2CKZSFFXmx6fM59XEl/eJgU+lQMB3vuAPXtHL2pWSfbqnAP7k2TKjL3pecIvl0lX0
         d/Yqv1wK5z+qAWWEdrS7rSh9w+6eV1YVDZRxZvLAQNQy7VXgr+fj9DBwUcdTUQoVPQ2a
         mRDalS/Mvnpr7UYNYyb86ZF/9gZWesaMbu4uHLko9N4tHtxl1AqvSeIKZcVqnh8UEfoC
         Ir1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708458913; x=1709063713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZeIfSEIIpmsbMrwsP6nR7jZ+X5pfzZ8vA9y0sYf084=;
        b=dPUJS3FgzibA4Bbm3quCkxhqHMy6PurKIaOrmkO/4CQSBS/dOcz8Q8EYfNTD1wWq5Q
         tTsdbwY5D6fXTcxsIPtQ5ckZU40o+Jg5FrTZRkLs9oiPvRvoCglZbhAYjf+WU1zP8uwg
         9QpcV4L8/MXxCgdYmJ6ZeMmg+zvxnuVjADjiMVqusAfnImHBQqZUzJ2C5mSFoIDqXES9
         ui9g6INTDVHzNAqocgouBeNk2sa1BpptOz06W6/Y0m4shHdLigZY6ck2B+5/ZRz9qVGP
         gYeYyI77pqviv2VZ8xhNzywZ7KQ3GJLUFU/MemxuYHW4XOgPKKvlnvqLZpSAcgQLBken
         kZiQ==
X-Gm-Message-State: AOJu0YwxVq6N/Zf5vrBH+/pMfbAYj+beN/O4MG12mXtb2980goHa15GY
	YLNdsx9s/XA8Mez1H6TZX2xI6xHmBtxhZ9OJi64J0NxeHJnizr2EI+8fOPn2
X-Google-Smtp-Source: AGHT+IHBl+DCx53ONsjDmEBXooOctYdbJc1ReQzGrO9k46EkWPOVVYkhrlngrd4ojoSB5wQiYzla8Q==
X-Received: by 2002:a17:906:af09:b0:a3e:d515:cdf3 with SMTP id lx9-20020a170906af0900b00a3ed515cdf3mr3722196ejb.27.1708458913077;
        Tue, 20 Feb 2024 11:55:13 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s14-20020a17090699ce00b00a3f218aed03sm278060ejn.120.2024.02.20.11.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 11:55:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] dbus: disable assertions and enable only modular tests
Date: Tue, 20 Feb 2024 20:55:04 +0100
Message-Id: <20240220195504.4137637-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 19:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195923

There was a report that enabling assertions and all tests results in
notices in log.do_configure:

NOTE: building with unit tests increases the size of the installed library and renders it insecure.
NOTE: building with assertions increases library size and decreases performance.

This was overlooked when dbus and dbus-tests recipes were merged;
enabling all tests and assertions still requires a special, separate
build of dbus. If those tests are useful this could be revisited.
Until then, we should use productions settings for the main recipe.

Buildhistory-diff:
packages/core2-64-poky-linux/dbus/dbus-dbg: PKGSIZE changed from 9958176 to 8627824 (-13%)
packages/core2-64-poky-linux/dbus/dbus-lib: PKGSIZE changed from 544347 to 346339 (-36%)
packages/core2-64-poky-linux/dbus/dbus-ptest: PKGSIZE changed from 3524983 to 3116951 (-12%)
packages/core2-64-poky-linux/dbus/dbus-ptest: FILELIST: removed "/usr/share/installed-tests/dbus/test-dbus-launch-eval.sh_with_config.test /usr/share/installed-tests/dbus/test-counter_with_config.test /usr/libexec/installed-tests/dbus/test-dbus-launch-eval.sh /usr/libexec/installed-tests/dbus/test-dbus-launch-x11.sh /usr/share/installed-tests/dbus/test-counter.test /usr/libexec/installed-tests/dbus/test-counter /usr/share/installed-tests/dbus/test-dbus-launch-x11.sh.test /usr/share/installed-tests/dbus/test-dbus-launch-x11.sh_with_config.test /usr/share/installed-tests/dbus/test-dbus-launch-eval.sh.test"
packages/core2-64-poky-linux/dbus/dbus: PKGSIZE changed from 510939 to 350331 (-31%)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/dbus/dbus_1.14.10.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.10.bb b/meta/recipes-core/dbus/dbus_1.14.10.bb
index 2a256beabff..4fe7af7512b 100644
--- a/meta/recipes-core/dbus/dbus_1.14.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.10.bb
@@ -22,9 +22,8 @@ EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
                 --enable-largefile \
                 --with-system-socket=/run/dbus/system_bus_socket \
-                --enable-tests \
+                --enable-modular-tests \
                 --enable-checks \
-                --enable-asserts \
                 --runstatedir=/run \
                 "
 EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
-- 
2.39.2


