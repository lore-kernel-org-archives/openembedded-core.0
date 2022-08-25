Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4B1C28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 07:21:17 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.21147.1661412067433461110
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 00:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=efmqnOa9;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id s206so17147466pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 00:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=pggrlSaF7UbwamC2IUH9kz8LaUDrzqn9EaTk4ZI6p/Y=;
        b=efmqnOa9gunDseegBkIVjvqkMh996rdwaWTzPnicMZAHynXhgpZPUhun80ipy6ZpIt
         D4jgbPZZdKefzSm6Jzq/AWbejd7nyCDWjG2W241dVaEVS3Ev/hHJx6Wu5gHtkV6LVcC7
         OWqc1YiGNFvJKr7++GCt+P+OmUA6eBjN1kj4+XbI0Ni5d/AY2UUJFlCMFct6ZUjhkZMh
         6GQ6qAlomLqpRSZDLthDB8LnKKfstnI73Zsa2QRZ3CG4iUNfLmjTkNfTSzPyLnE/Ckot
         mE7IRtT/4bthomCnD16pLV+Y4o4v3hNO39BBFiFfOiDVmI41BVoBYam1Ibr9kRxKp/Cd
         /UGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=pggrlSaF7UbwamC2IUH9kz8LaUDrzqn9EaTk4ZI6p/Y=;
        b=Jdu+/fS79yPFmg5wlZG+SPWV/a0d86vijSeJdYHato6s4+wE0IdG4kpHnoDmLqMbYo
         FCy2lB7QQSoxRZpQmPOxWRoyDRrsGNTV9ih2UNrHvjDdVBipfb97F1CCNk3pX6ZEFIPl
         sekCcDoJ2XaH80pQxWVzHHs1atM9ZC1olTxBHdZ8FbiQ/tpvN7beBvze18sbxDg/n9pa
         ETcZBO40+fp29YdEW2nxyf6H1JroDoNBqwNIXM6XCMOxq6exd9uWIYk2JjLBAxqZ9qfY
         G5xGCcUq0EeeHXnSDDpElOf975gBTUXH1+K9s5ABUvFNo0n/pWaeNHuU8DWrAxeGZaiQ
         FTyg==
X-Gm-Message-State: ACgBeo082pKDRwVRGvMkvlf+R/WzawrQMsFramnrEjM5dMKYGWJ0G8JT
	9TmhBxvkDiGDkTb9jSjzahUbLmfhLKVCGA==
X-Google-Smtp-Source: 
 AA6agR4CYXf5mpdjRlMpVbLzVwCRzCV7HrSo39n6zSlm6vcOBO6wGj4Fa8aAFd2YhE4TwXOrm7caFQ==
X-Received: by 2002:a63:504:0:b0:42a:aaf6:5fc4 with SMTP id
 4-20020a630504000000b0042aaaf65fc4mr2153898pgf.369.1661412066544;
        Thu, 25 Aug 2022 00:21:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 188-20020a6204c5000000b005371c5859d6sm3979516pfe.60.2022.08.25.00.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 00:21:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] apr: Cache configure tests which use AC_TRY_RUN
Date: Thu, 25 Aug 2022 00:21:03 -0700
Message-Id: <20220825072103.641291-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 07:21:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169833

AC_TRY_RUN macro means the test needs to run to find the result and we
are cross compiling so this will always get wrong results, this results
in miscompiling apache2 on musl because it disables rlimit
(ac_cv_struct_rlimit) wrongly.

All these variables are determined with AC_TRY_RUN checks

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/apr/apr_1.7.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index 07bf61545e..1fbdeddeb2 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -37,6 +37,15 @@ OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
 # Added to fix some issues with cmake. Refer to https://github.com/bmwcarit/meta-ros/issues/68#issuecomment-19896928
 CACHED_CONFIGUREVARS += "apr_cv_mutex_recursive=yes"
+# Enable largefile
+CACHED_CONFIGUREVARS += "apr_cv_use_lfs64=yes"
+# Additional AC_TRY_RUN tests which will need to be cached for cross compile
+CACHED_CONFIGUREVARS += "apr_cv_epoll=yes epoll_create1=yes apr_cv_sock_cloexec=yes ac_cv_struct_rlimit=yes \
+                         ac_cv_func_sem_open=yes apr_cv_process_shared_works=yes \
+                         ac_cv_func_pthread_mutexattr_setpshared=yes"
+# robust mutexes exist on glibc but not musl
+CACHED_CONFIGUREVARS:append:libc-musl = " apr_cv_mutex_robust_shared=no"
+CACHED_CONFIGUREVARS:append:libc-glibc = " apr_cv_mutex_robust_shared=yes"
 
 # Also suppress trying to use sctp.
 #
-- 
2.37.2


