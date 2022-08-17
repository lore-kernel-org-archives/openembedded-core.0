Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F488C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 14:52:35 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.29577.1660747953971447470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 07:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kacxIsfC;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 o14-20020a17090a0a0e00b001fabfd3369cso780464pjo.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 07:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=6rsOhXm1soVSAS9l7hvlWobx71I3YQz0TWpIE73xTLQ=;
        b=kacxIsfCToTzUhKFlGnZM+jAi6TIsjg3WidJI/WbicWo6wDBmTLLIjyS4o8Jdk/5K4
         E3qX1Cy1H+85pJK98ruCEFyeH1Em3KyXv5l8AilKED4vl1SUDHhQkGEWlVVTmTl29xV7
         b0lK7rlmf+k1IaSHXg5D2b38T43QHWG8uplMphzzf9dSEycKTJFCrajKaKQ2yXaZNzNN
         PYkp+Kq+utf+9ZxL1qXQLjTV6u1/7iLlLInBa47kh3pR12opsu2XtrrW/1KmuYbU5CZ/
         OuXIV36LJ9B3rUK50LMT6HfBgXcqVvFL7mOTt0b4+G1Xn3cfQgzlqk9mBV/WNG8v7rPP
         ryuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=6rsOhXm1soVSAS9l7hvlWobx71I3YQz0TWpIE73xTLQ=;
        b=n0D4+3Esi7O8tUKiXRI2RqeI7EMybQYSfaOqSB8AhKTQToqNIN9aFOhUi1DMTBOwmV
         mo1dzy7mDU/9va63juwBEIbcgmY0KeugYhUfBdnt6Z23CQJir5JGuUKOgfqEzmsBKX5n
         6vYBP30+RgI5C0L46GROPc9zx7nkr0m/7lNzfsd9bqbam3yILrWu0ESYCqVbbxYE9Ekl
         PbTXfwQvdbXyxsPRgtIGfk6eKB+A4SKUNTZM3qcZMWQwR9v9kk2ohiOr9Y1FtyICfo2h
         j9IMw6HKVpiauGjGDNvLamHRDY2T2FCLRrX6ryFeAlOyyfsm7gaV9fich2R2pSlY4Uvl
         ZllQ==
X-Gm-Message-State: ACgBeo24zxIEfWjb5oIUPciXQ+D/zzwYei0e7i8TLTevVE+fW2hyN+O4
	s+SvJKvsS5Bdv9wLJF1s1pKI2uHWMeZMDg==
X-Google-Smtp-Source: 
 AA6agR5QO2XOkvhKxbxg9f0TuVsLYVqUxuvWMt4zDwKGwqEJrDrIwjN260zP1eqIWnJVxfaxIul2/w==
X-Received: by 2002:a17:902:ce92:b0:16d:d2a9:43af with SMTP id
 f18-20020a170902ce9200b0016dd2a943afmr26168182plg.23.1660747952743;
        Wed, 17 Aug 2022 07:52:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 c13-20020aa7952d000000b0053253b63e21sm10567375pfp.3.2022.08.17.07.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:52:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] rpm: Remove -Wimplicit-function-declaration warnings
Date: Wed, 17 Aug 2022 07:52:29 -0700
Message-Id: <20220817145229.3902242-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 14:52:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169488

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Squash the patch into another patch which introduced it

 ...alling-execute-package-scriptlets-wit.patch | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
index 4020a31092..2a0069cafe 100644
--- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
+++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
@@ -28,11 +28,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  lib/rpmscript.c | 11 ++++++++---
  1 file changed, 8 insertions(+), 3 deletions(-)
 
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index cc98c4885..f8bd3df04 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
-@@ -394,8 +394,7 @@ exit:
+@@ -17,7 +17,7 @@
+ #include "rpmio/rpmio_internal.h"
+ 
+ #include "lib/rpmplugins.h"     /* rpm plugins hooks */
+-
++#include "lib/rpmchroot.h"      /* rpmChrootOut */
+ #include "debug.h"
+ 
+ struct scriptNextFileFunc_s {
+@@ -391,8 +391,7 @@ exit:
  	Fclose(out);	/* XXX dup'd STDOUT_FILENO */
  
      if (fn) {
@@ -42,7 +49,7 @@ index cc98c4885..f8bd3df04 100644
  	free(fn);
      }
      free(mline);
-@@ -428,7 +427,13 @@ rpmRC rpmScriptRun(rpmScript script, int arg1, int arg2, FD_t scriptFd,
+@@ -426,7 +425,13 @@ rpmRC rpmScriptRun(rpmScript script, int
  
      if (rc != RPMRC_FAIL) {
  	if (script_type & RPMSCRIPTLET_EXEC) {
@@ -57,6 +64,3 @@ index cc98c4885..f8bd3df04 100644
  	} else {
  	    rc = runLuaScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
  	}
--- 
-2.11.0
-
-- 
2.37.2


