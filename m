Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B70C83F01
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 00:27:59 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.19554.1693096069552660536
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 17:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KVF0yXu4;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6bca66e6c44so1718817a34.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 17:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693096068; x=1693700868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3a9eng9l9vlLtGCwPkbz2a9i/K1MtCWj5pSJxwuftk=;
        b=KVF0yXu41Hrs8gKyjJu7dLtgv85vQ6/jzZhhxa6aYpyhd/1Mle9nIf9y93imA/EQr4
         ph1/nt4p0emOPzQ4ORXBeT2BMG3ky2lsq4xjhO2pj8UGN6QXHLrG28tdBTJac4N4XuFE
         AWcOvR789XLAR5IkOK5duUcZ8j5XZK7IdBp4eiDtAQnCpK+AYwrAeSCR328sdUk+1Oof
         Zfxdk1bCptImebIqY3DyemFX3IhSnTjyWMneCufN3Rpri2IiAGNO18Mx/fiMILFowCg/
         dsBf/otvwsrag0bXYEHcobqLOuMvAl3Nsnv24f0cximyz5KDOj9TFBn30k5ZM9GKbbva
         Q5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693096068; x=1693700868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3a9eng9l9vlLtGCwPkbz2a9i/K1MtCWj5pSJxwuftk=;
        b=WLQBtIoghpHrbqd71whyskFckAGEJU3oItR1hU9o3Szhpz60hvxVnsOXIBMXv4o7pE
         S2auF1C4+nEiFyfnbcfs8WbPuReQs8JfYeJ80u7dHEv5C38HoTOwmHoYOdgG7gme+Gug
         uNKcTUPu4YU6yJuUA/pdToXwWzzHsaGettSxkYlSIhDC578HhuAgiRzUq6dNfx9OzgQJ
         PBeV5jbvhDX5eQuqpW20/axgDSTFVWC/V3LTmtFAGHfDG96R3lGrvYQ9eDhn6rjAaAeB
         ZlRWYbtsyMzCkZy64RoLPTNxFGvts7XtVbGzFfGxi6pJHI5L3jTiqY2JbKk2vqtY5rvP
         qw5A==
X-Gm-Message-State: AOJu0YymGTG2gYUyfIgbJqRGq4aypSS8zH6rNxfzYfb5rqADvu+VgM5Q
	gh/KazuwO+vj3fDprbvdSeRCbrqUCfleRQ==
X-Google-Smtp-Source: AGHT+IFLY9eFIgzKzA0PRf9tmBzUgRjc7Sn1C5JVSKf4vwGzQ9krQvSlBtbVX7ITEpnB9/gH3SZisg==
X-Received: by 2002:a05:6870:e305:b0:1bc:6271:d966 with SMTP id z5-20020a056870e30500b001bc6271d966mr7832478oad.48.1693096068570;
        Sat, 26 Aug 2023 17:27:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id g4-20020a170902c38400b001b83dc8649dsm4097243plg.250.2023.08.26.17.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:27:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3: Increase default thread stack size on musl
Date: Sat, 26 Aug 2023 17:27:46 -0700
Message-ID: <20230827002746.566276-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 00:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186767

default stack size for threads is approx 140k on musl which is fine in
most cases but some of python apps e.g. python3-lz4 bindings run into
thread stack size overflow. Increase the default size to 2M on musl,
glibc defaults to 8M, so we are good there.

This default stack size change is limited to interpreter and stdlib
modules only, thats why CFLAGS_NODIST instead of CFLAGS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3_3.11.4.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
index 8fd1382caa4..ac4c6221ca3 100644
--- a/meta/recipes-devtools/python/python3_3.11.4.bb
+++ b/meta/recipes-devtools/python/python3_3.11.4.bb
@@ -91,6 +91,13 @@ CACHED_CONFIGUREVARS = " \
                 ac_cv_file__dev_ptc=no \
                 ac_cv_working_tzset=yes \
 "
+# set thread stack size to 2MB on musl for interpreter and stdlib C extensions
+# so it does not run into stack limits due to musl's small thread stack
+# This is only needed to build interpreter and not the subsequent modules
+# Thats why CFLAGS_NODIST is modified instead of CFLAGS
+CACHED_CONFIGUREVARS:append:libc-musl = "\
+    CFLAGS_NODIST='${CFLAGS} -DTHREAD_STACK_SIZE=0x200000' \
+"
 
 # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
 PACKAGECONFIG ??= "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
-- 
2.42.0


